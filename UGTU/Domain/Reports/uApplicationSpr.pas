unit uApplicationSpr;

interface

uses
  Classes, dialogs, SysUtils, ExcelXP, Barcode, Contnrs,
  XIntf, CommonIntf, ReportsBase, db, adodb, ExtCtrls,
  udmUspevaemost, ComCtrls, uAverageBalls, SpravkaHistory2014, Spravka2014,
  DateUtils, uDM, ConstantRepository, uDMDocuments, Document,
  System.Generics.Collections;

type
  ApplSprReport = class(TExcelReportBase)
  private
    FListDoc: TObjectList<TDopDoc>;
  protected
    procedure Execute; override;
  public
    property ListDoc: TObjectList<TDopDoc> read FListDoc;
    constructor Create(_ListDoc: TObjectList<TDopDoc>);

  end;

implementation

{ ApplSprReport }

constructor ApplSprReport.Create(_ListDoc: TObjectList<TDopDoc>);
begin
  FListDoc := _ListDoc;
end;

procedure ApplSprReport.Execute;
var
  sp_pers: TADOStoredProc;
  sp_doc: TADOStoredProc;
  dsAddr: TADODataSet;
  sp_hist: TADOStoredProc;
  addr, dir, dir_inst, copystr1, copystr2: string;
  posit: integer;
  i, ik_doc: integer;
begin
  inherited;
  try
    if ListDoc.Count > 1 then
      for i := 0 to ListDoc.Count - 2 do
      DuplicatePage(1, 1);
      //  ActiveSheet.Copy(0, CurrentWorkbook.Sheets[1], 0);
    for i := 0 to ListDoc.Count - 1 do
    begin
      ActivateWorksheet(i + 1);

      ik_doc := ListDoc[i].ik_doc;
      addr := '';
      dsAddr := TADODataSet.Create(nil);
      sp_pers := TADOStoredProc.Create(nil);
      sp_doc := TADOStoredProc.Create(nil);
      sp_hist := TADOStoredProc.Create(nil);

      // ActivateWorksheet(2);
      // заполняем данные студента
      sp_pers.ProcedureName := 'StudInfoSpravBuild;1';
      sp_pers.Connection := dm.DBConnect;
      sp_pers.Parameters.CreateParameter('@Ik_document', ftString, pdInput,
        50, ik_doc);
      sp_pers.Open;
      sp_pers.First;
      with sp_pers do
      begin
        Replace('#group#', FieldByName('Cname_grup').AsString);
        if FieldByName('Ik_kat_zach').AsInteger = 1 then
          Replace('#osn#', 'бюджет')
        else
          Replace('#osn#', FieldByName('Cname_kat_zach').AsString);
        Replace('#form_ed#', ansilowercase(FieldByName('Cname_form_ed')
          .AsString));
        Replace('#fio#', FieldByName('FIOrod').AsString);
        dir_inst := FieldByName('ManagerSmallName').AsString;
        posit := Pos(' ', dir_inst);
        copystr1 := Copy(dir_inst, posit + 1, Length(dir_inst));
        copystr2 := Copy(dir_inst, 1, posit - 1);
        copystr1 := copystr1 + ' ' + copystr2;
        Replace('#dir_inst#', copystr1); // переставит буквы местами
      end;
      // заполняем данные по справке
      sp_doc.ProcedureName := 'DocInfoSpravBuild;1';
      sp_doc.Connection := dm.DBConnect;
      sp_doc.Parameters.CreateParameter('@Ik_document', ftString, pdInput,
        50, ik_doc);
      sp_doc.Open;
      sp_doc.First;
      with sp_doc do
      begin
        Replace('#reason#', ansilowercase(FieldByName('Cname_pric').AsString));
        if FieldByName('Ik_Transfer').AsInteger = 1 then
      begin
          Replace('#transp#', 'вручить лично в руки') ;
          Replace('#address#', '');
      end
        else
        begin
          Replace('#transp#', 'отправить по почте по адресу');

          dsAddr.CommandText :=
            'select * from StudAddress where ik_personAddress=' +
            FieldByName('ik_personAddress').AsString;
          dsAddr.Connection := dm.DBConnect;
          dsAddr.Open;
          dsAddr.First;
          with dsAddr do
          begin
            if FieldByName('Cstrana').AsString <> 'Российская Федерация' then
              addr := FieldByName('Cstrana').AsString + ', ';
            addr := addr + FieldByName('Cregion').AsString + ', ' +
              FieldByName('cshort_type_gorod').AsString + FieldByName('Cgorod')
              .AsString + ', ' + FieldByName('cshort_type_street').AsString +
              FieldByName('CStreet').AsString + ', д.' +
              FieldByName('BuildingNumber').AsString + ', кв.' +
              FieldByName('FlatNumber').AsString;
          end;
          Replace('#address#', addr);
        end;

      end;
      sp_hist.ProcedureName := 'StudHistForSpr;1';
      sp_hist.Connection := dm.DBConnect;
      sp_hist.Parameters.CreateParameter('@Ik_document', ftString, pdInput,
        50, ik_doc);
      sp_hist.Open;
      sp_hist.Last;
      if sp_hist.FieldByName('ikTypePric').AsInteger = 2 then
        if sp_pers.FieldByName('lSex').AsInteger = 0 then
          Replace('#type_stud#', 'ранее обучавшейся в группе')
        else
          Replace('#type_stud#', 'ранее обучавшегося в группе')
      else
        Replace('#type_stud#', 'студента(ки) группы');
    //  ActiveSheet.Name := '№ '+sp_doc.FieldByName('NumberDoc').AsString+' '+ sp_pers.FieldByName('FIOrod').AsString;
    ActiveSheet.Name := '№ '+sp_doc.FieldByName('NumberDoc').AsString +' '+ sp_pers.FieldByName('PersonSmallName').AsString;
      // if num_list >0 then
      // begin
      // CurrentWorkbook.SaveCopyAs('C:\Users\'+num_list.ToString()+'.xls',0);
      // // CurrentWorkbook.Close(0,0,0,0);
      // end;
    end;
  finally
    sp_pers.Free;
    sp_doc.Free;
    dsAddr.Free;
    sp_hist.Free;
  end;
end;

end.
