unit uNotification;

interface

uses
  Classes, dialogs, SysUtils, ExcelXP, Barcode, Contnrs,
  XIntf, CommonIntf, ReportsBase, db, adodb, ExtCtrls,
  udmUspevaemost, ComCtrls, uAverageBalls, SpravkaHistory2014, Spravka2014,
  DateUtils, uDM, ConstantRepository, uDMDocuments, Excel2010, Document,
  System.Generics.Collections;

type
  NotificationSprReport = class(TExcelReportBase)
  private
    FListDoc: TObjectList<TDopDoc>;
  protected
    procedure Execute; override;
  public
    property ListDoc: TObjectList<TDopDoc> read FListDoc;
    constructor Create(_ListDoc: TObjectList<TDopDoc>);

  end;

implementation

constructor NotificationSprReport.Create(_ListDoc: TObjectList<TDopDoc>);
begin
  FListDoc := _ListDoc;
end;

procedure NotificationSprReport.Execute;
var
  sp_pers: TADOStoredProc;
  sp_doc: TADOStoredProc;
  dsDoc: TADODataSet;
  sp_debt: TADOStoredProc;
  AYear, AMonth, ADay: word;
  addr, dir, dir_inst, copystr1, copystr2, day: string;
  posit, fdebt, ind, i, ik_inst, ik_doc: integer;
begin
  inherited;
  try
    if ListDoc.Count > 1 then
      for i := 0 to ListDoc.Count - 2 do
      DuplicatePage(1, 1);
       // ActiveSheet.Copy(0, CurrentWorkbook.Sheets[1], 0);
    for i := 0 to ListDoc.Count - 1 do
    begin
      ActivateWorksheet(i + 1);
      ik_doc := ListDoc[i].ik_doc;
      addr := '';
      dsDoc := TADODataSet.Create(nil);
      sp_pers := TADOStoredProc.Create(nil);
      sp_doc := TADOStoredProc.Create(nil);
      sp_debt := TADOStoredProc.Create(nil);

      // заполняем данные студента
      sp_pers.ProcedureName := 'StudInfoSpravBuild;1';
      sp_pers.Connection := dm.DBConnect;
      sp_pers.Parameters.CreateParameter('@Ik_document', ftString, pdInput,
        50, ik_doc);
      sp_pers.Open;
      sp_pers.First;
      with sp_pers do
      begin
        ik_inst := sp_pers.FieldByName('ik_fac').AsInteger;
        if (ik_inst = 27) or (ik_inst = 29) or (ik_inst = 30) then
          Replace('#inst#', 'Ин' + sp_pers.FieldByName
            ('Cname_fac_small').AsString)
        else
          Replace('#inst#', sp_pers.FieldByName('Cname_fac_small').AsString);
        Replace('#kurs#', sp_pers.FieldByName('kurs').AsString);
        Replace('#address#', sp_pers.FieldByName('address_cump').AsString);
        Replace('#phone#', sp_pers.FieldByName('Phone').AsString);

      end;

      // заполняем данные по справке

      dsDoc := TADODataSet.Create(nil);
      dsDoc.CommandText := 'select * from CallSprView Where Ik_Document=' +
        ik_doc.ToString();
      // String(cbeReason.Items.Objects[cbeReason.ItemIndex]);
      dsDoc.Connection := dm.DBConnect;
      dsDoc.Open;
      dsDoc.First;
      day := dsDoc.FieldByName('dayb').AsString;
      if day.Length = 1 then
        day := '0' + day;
      Replace('#begin#', day + ' ' +
        GetMonthR(StrToInt(dsDoc.FieldByName('monthb').AsString)) + ' ' +
        dsDoc.FieldByName('yearb').AsString);
      day := dsDoc.FieldByName('daye').AsString;
      if day.Length = 1 then
        day := '0' + day;
      Replace('#end#', day + ' ' +
        GetMonthR(StrToInt(dsDoc.FieldByName('monthe').AsString)) + ' ' +
        dsDoc.FieldByName('yeare').AsString);

      case (dsDoc.FieldByName('iK_vid_zanyat').AsInteger) of
        55:
          begin
            if (dsDoc.FieldByName('n_sem').AsInteger mod 2 = 0) then
              Replace('#pric#', 'Весенняя сессия')
            else
              Replace('#pric#', 'Осенняя сессия');
          end;
        56:
          begin
            Replace('#pric#', 'Государственный экзамен')
          end;

        31:
          begin
            Replace('#pric#', 'Выпускная работа')
          end;
      end;
       ActiveSheet.Name := '№ '+dsDoc.FieldByName('NumberDoc').AsString+' '+ sp_pers.FieldByName('FIOrod').AsString;
    end;
  finally
    sp_debt.Free;
    sp_doc.Free;
    dsDoc.Free;
    sp_pers.Free;
  end;
end;

end.
