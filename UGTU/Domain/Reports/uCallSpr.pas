unit uCallSpr;

interface

uses
  Classes, dialogs, SysUtils, ExcelXP, Barcode, Contnrs,
  XIntf, CommonIntf, ReportsBase, db, adodb, ExtCtrls,
  udmUspevaemost, ComCtrls, uAverageBalls, SpravkaHistory2014, Spravka2014,
  DateUtils, uDM, ConstantRepository;

type
  CallSprReport = class(TExcelReportBase)
  private
    Fik_doc: integer;
  protected
    procedure Execute; override;
  public
    property ik_doc: integer read Fik_doc;
    constructor Create(_ik_doc: integer);

  end;

implementation

{ CallSprReport }

constructor CallSprReport.Create(_ik_doc: integer);
begin
  Fik_doc := _ik_doc;
end;

procedure CallSprReport.Execute;
var
  sp_pers: TADOStoredProc;
  podgot, dir_inst, copystr1, copystr2,day: string;
  posit, ik_inst: integer;
  sp_callspr: TADODataSet;
begin
  inherited;
  sp_pers := TADOStoredProc.Create(nil);
  try
    sp_pers.ProcedureName := 'StudInfoSpravBuild;1';
    sp_pers.Connection := dm.DBConnect;
    sp_pers.Parameters.CreateParameter('@Ik_document', ftString, pdInput,
      50, ik_doc);
    sp_pers.Open;
    sp_pers.First;

    Replace('#fio#', sp_pers.FieldByName('FIOrod').AsString);
    Replace('#spec#', sp_pers.FieldByName('Cname_spec').AsString);
    podgot := sp_pers.FieldByName('Podgot').AsString;
    if podgot = '����������� ����������' then
      podgot := '����������� ����������';
    Replace('#podgot#', podgot);

    dir_inst := sp_pers.FieldByName('ManagerSmallName').AsString;
    posit := Pos(' ', dir_inst);
    copystr1 := Copy(dir_inst, posit + 1, Length(dir_inst));
    copystr2 := Copy(dir_inst, 1, posit - 1);
    copystr1 := copystr1 + ' ' + copystr2;
    Replace('#dir_inst#', copystr1); // ���������� ����� �������
    Replace('#form_ed#', sp_pers.FieldByName('Cname_form_pril').AsString);
    Replace('#type_ob#', sp_pers.FieldByName('NamePril').AsString);
    Replace('#kod#', sp_pers.FieldByName('Sh_spec').AsString);
    Replace('#kurs#', sp_pers.FieldByName('kurs').AsString);
    if sp_pers.FieldByName('sprDate').AsString.Length = 1 then
      Replace('#day#', '0' + sp_pers.FieldByName('sprDate').AsString)
    else
      Replace('#day#', sp_pers.FieldByName('sprDate').AsString);
    Replace('#month#', GetMonthR(StrToInt(sp_pers.FieldByName('sprMonth')
      .AsString)));
    Replace('#year#', sp_pers.FieldByName('sprYear').AsString);

    Replace('#group#', sp_pers.FieldByName('Cname_grup').AsString);
    ik_inst := sp_pers.FieldByName('ik_fac').AsInteger;

    if (ik_inst = 27) or (ik_inst = 29) or (ik_inst = 30) then
      Replace('#inst#', '��' + sp_pers.FieldByName('Cname_fac_small').AsString)
    else
      Replace('#inst#', sp_pers.FieldByName('Cname_fac_small').AsString);

    // ����� �������
    sp_callspr := TADODataSet.Create(nil);
    sp_callspr.CommandText := 'select * from CallSprView Where Ik_Document=' +
      ik_doc.ToString();
    // String(cbeReason.Items.Objects[cbeReason.ItemIndex]);
    sp_callspr.Connection := dm.DBConnect;
    sp_callspr.Open;
    sp_callspr.First;
    Replace('#disc#', sp_callspr.FieldByName('reason_call').AsString);
    Replace('#num#', sp_callspr.FieldByName('NumberDoc').AsString);
    day:=  sp_callspr.FieldByName('dayb').AsString;
    if day.Length=1 then
      day:='0'+day;
    Replace('#begin#',day+'.'+sp_callspr.FieldByName('monthb').AsString+'.'+sp_callspr.FieldByName('yearb').AsString);
     day:=  sp_callspr.FieldByName('daye').AsString;
    if day.Length=1 then
      day:='0'+day;
    Replace('#end#', day+'.'+sp_callspr.FieldByName('monthe').AsString+'.'+sp_callspr.FieldByName('yeare').AsString);
    Replace('#col#',
      IntToStr(DaysBetween(StrToDate( sp_callspr.FieldByName('DateStartPeriod').AsString),
       StrToDate(sp_callspr.FieldByName('DateEndPeriod').AsString) + 1)));
  finally
    sp_pers.Free;
    sp_callspr.Free;
  end;

end;

end.
