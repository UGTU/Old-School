unit uCallSpr;

interface

uses
  Classes, dialogs, SysUtils, ExcelXP, Barcode, Contnrs,
  XIntf, CommonIntf, ReportsBase, db, adodb, ExtCtrls,
  udmUspevaemost, ComCtrls, uAverageBalls, SpravkaHistory2014, Spravka2014,
  DateUtils, uDM,ConstantRepository;

type
  CallSprReport = class(TExcelReportBase)
  private
    FikStudGrup, Fnum_sem, Fnum_doc, Fik_doc: integer;
    Fdatebegin, Fdateend: TDateTime;
  protected
    procedure Execute; override;
  public
    property ikStudGrup: integer read FikStudGrup;
    property num_sem: integer read Fnum_sem;
    property num_doc: integer read Fnum_doc;
    property ik_doc: integer read Fik_doc;
    property datebegin: TDateTime read Fdatebegin;
    property dateend: TDateTime read Fdateend;
    constructor Create(_ikStudGrup, _num_sem, _num_doc, _ik_doc: integer;
      _datebegin, _dateend: TDateTime);

  end;

implementation

{ CallSprReport }

constructor CallSprReport.Create(_ikStudGrup, _num_sem, _num_doc,
  _ik_doc: integer; _datebegin, _dateend: TDateTime);
begin
  FikStudGrup := _ikStudGrup;
  Fnum_sem := _num_sem;
  Fnum_doc := _num_doc;
  Fik_doc := _ik_doc;
  Fdateend := _dateend;
  Fdatebegin := _datebegin;
end;

procedure CallSprReport.Execute;
var
  sp_spr: TADOStoredProc;
  podgot, dir_inst, copystr1, copystr2: string;
  posit, ik_inst:integer;
  sp_vidz: TADODataSet;
begin
  inherited;
  Replace('#begin#',FormatDateTime('dd.mm.yyyy',datebegin)) ;
  Replace('#end#', FormatDateTime('dd.mm.yyyy',dateend));
  Replace('#col#', IntToStr(DaysBetween(datebegin, dateend) + 1));
  sp_spr := TADOStoredProc.Create(nil);
  try
    sp_spr.ProcedureName := 'StudGetInfForSprav;1';
    sp_spr.Connection := dm.DBConnect;
    sp_spr.Parameters.CreateParameter('@Ik_studGrup', ftString, pdInput, 50,
      self.ikStudGrup);
    sp_spr.Open;
    sp_spr.First;

    Replace('#fio#', sp_spr.FieldByName('FIO').AsString);
    Replace('#spec#', sp_spr.FieldByName('Cname_spec').AsString);
    podgot := sp_spr.FieldByName('Podgot').AsString;
    if podgot = 'направления подготовки' then
      podgot := 'направлению подготовки';
    Replace('#podgot#', podgot);

    dir_inst := sp_spr.FieldByName('ManagerSmallName').AsString;
    posit := Pos(' ', dir_inst);
    copystr1 := Copy(dir_inst, posit + 1, Length(dir_inst));
    copystr2 := Copy(dir_inst, 1, posit - 1);
    copystr1 := copystr1 + ' ' + copystr2;
    Replace('#dir_inst#', copystr1); // переставит буквы местами
    Replace('#form_ed#', sp_spr.FieldByName('Cname_form_pril').AsString);
    Replace('#type_ob#', sp_spr.FieldByName('NamePril').AsString);
    Replace('#kod#', sp_spr.FieldByName('Sh_spec').AsString);
    Replace('#kurs#', sp_spr.FieldByName('kurs').AsString);
    if sp_spr.FieldByName('sprDate').AsString.Length=1 then
    Replace('#day#', '0'+sp_spr.FieldByName('sprDate').AsString)
    else
    Replace('#day#', sp_spr.FieldByName('sprDate').AsString);
    Replace('#month#', GetMonthR(StrToInt(sp_spr.FieldByName('sprMonth').AsString)));
    Replace('#year#', sp_spr.FieldByName('sprYear').AsString);

    Replace('#group#', sp_spr.FieldByName('Cname_grup').AsString);
    ik_inst:=sp_spr.FieldByName('ik_fac').AsInteger;

    if (ik_inst=27) or (ik_inst=29) or (ik_inst=30) then
     Replace('#inst#', 'Ин'+ sp_spr.FieldByName('Cname_fac_small').AsString)
     else
     Replace('#inst#', sp_spr.FieldByName('Cname_fac_small').AsString);

        // найти причину
         Replace('#num#', num_doc.ToString());
             sp_vidz := TADODataSet.Create(nil);
    sp_vidz.CommandText := 'select * from CallSprView Where Ik_Document=' + ik_doc.ToString();
    // String(cbeReason.Items.Objects[cbeReason.ItemIndex]);
    sp_vidz.Connection := dm.DBConnect;
    sp_vidz.Open;
    sp_vidz.First;
    Replace('#disc#', sp_vidz.FieldByName('reason_call').AsString);
      finally
      sp_spr.Free;
      sp_vidz.Free;
    end;

    end;

    end.
