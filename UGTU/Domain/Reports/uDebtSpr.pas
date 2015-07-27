unit uDebtSpr;

interface

uses
  Classes, dialogs, SysUtils, ExcelXP, Barcode, Contnrs,
  XIntf, CommonIntf, ReportsBase, db, adodb, ExtCtrls,
  udmUspevaemost, ComCtrls, uAverageBalls, SpravkaHistory2014, Spravka2014,
  DateUtils, uDM, ConstantRepository, uDMDocuments, Excel2010;

type
  DebtSprReport = class(TExcelReportBase)
  private
    Fik_doc: integer;
  protected
    procedure Execute; override;
  public
    property ik_doc: integer read Fik_doc;

    constructor Create(_ik_doc: integer);

  end;

implementation

constructor DebtSprReport.Create(_ik_doc: integer);
begin
  Fik_doc := _ik_doc;
end;

procedure DebtSprReport.Execute;
var
  sp_pers: TADOStoredProc;
  sp_doc: TADOStoredProc;
  dsAddr: TADODataSet;
  sp_debt: TADOStoredProc;
  AYear, AMonth, ADay: word;
  addr, dir, dir_inst, copystr1, copystr2: string;
  posit, fdebt, ind, i, ik_inst: integer;
begin
  inherited;
  addr := '';
  dsAddr := TADODataSet.Create(nil);
  sp_pers := TADOStoredProc.Create(nil);
  sp_doc := TADOStoredProc.Create(nil);
  sp_debt := TADOStoredProc.Create(nil);
  try
    // заполняем данные студента
    sp_pers.ProcedureName := 'StudInfoSpravBuild;1';
    sp_pers.Connection := dm.DBConnect;
    sp_pers.Parameters.CreateParameter('@Ik_document', ftString, pdInput,
      50, ik_doc);
    sp_pers.Open;
    sp_pers.First;
    with sp_pers do
    begin
      Replace('#grup#', FieldByName('Cname_grup').AsString);
      Replace('#fio#', FieldByName('FIOrod').AsString);
      dir_inst := FieldByName('ManagerSmallName').AsString;
      posit := Pos(' ', dir_inst);
      copystr1 := Copy(dir_inst, posit + 1, Length(dir_inst));
      copystr2 := Copy(dir_inst, 1, posit - 1);
      copystr1 := copystr1 + ' ' + copystr2;
      Replace('#dir_inst#', copystr1); // переставит буквы местами
      ik_inst := sp_pers.FieldByName('ik_fac').AsInteger;

      if (ik_inst = 27) or (ik_inst = 29) or (ik_inst = 30) then
        Replace('#inst#', 'Ин' + sp_pers.FieldByName
          ('Cname_fac_small').AsString)
      else
        Replace('#inst#', sp_pers.FieldByName('Cname_fac_small').AsString);
        Replace('#kurs#', sp_pers.FieldByName('kurs').AsString);
        DecodeDate(Now, AYear, AMonth, ADay);
        if ADay.ToString().Length=1 then
        Replace('#day#', '0' + ADay.ToString())
      else
        Replace('#day#', ADay.ToString());
      Replace('#month#', GetMonthR(StrToInt(AMonth.ToString())));
        Replace('#year#', AYear.ToString());
        Replace('#addr#', sp_pers.FieldByName('address_cump').AsString);
        Replace('#phone#', sp_pers.FieldByName('Phone').AsString);

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
      if FieldByName('dayotch').AsString.Length = 1 then
        Replace('#dayotch#', '0' + FieldByName('dayotch').AsString)
      else
        Replace('#dayotch#', FieldByName('dayotch').AsString);
      Replace('#monthotch#', GetMonthR(FieldByName('monthotch').AsInteger));
      Replace('#yearotch#', FieldByName('yearotch').AsString);
      Replace('#polog#', FieldByName('NamePric').AsString);
      Replace('#num_doc#', FieldByName('NumberDoc').AsString);
    end;


  sp_debt.ProcedureName := 'DebtSpravBuild;1';
  sp_debt.Connection := dm.DBConnect;
  sp_debt.Parameters.CreateParameter('@Ik_document', ftString, pdInput,
    50, ik_doc);
  sp_debt.Open;
  sp_debt.First;
  fdebt := 15;
  ind := 15;
  while not sp_debt.Eof do
  begin
    ind := ind + 1;
    Range['B' + fdebt.ToString(), 'F' + fdebt.ToString()].Select;
    Selection.MergeCells := true;
    Selection.Borders.LineStyle := 1;
    Range['G' + fdebt.ToString(), 'I' + fdebt.ToString()].Select;
    Selection.MergeCells := true;
    Selection.Borders.LineStyle := 1;

    Range['J' + fdebt.ToString(), 'K' + fdebt.ToString()].Select;
    Selection.MergeCells := true;
    Selection.Borders.LineStyle := 1;
    Range['J' + fdebt.ToString(), 'K' + fdebt.ToString()].HorizontalAlignment
      := xlCenter;
    Range['G' + fdebt.ToString(), 'I' + fdebt.ToString()].HorizontalAlignment
      := xlCenter;
    Items[fdebt, 2] := sp_debt.FieldByName('cName_disc').AsString;
    Items[fdebt, 7] := sp_debt.FieldByName('cName_vid_zanyat').AsString;
    Items[fdebt, 10] := sp_debt.FieldByName('n_sem').AsString + ' сем';
    fdebt := fdebt + 1;
    Range['B' + inttostr(fdebt), 'K' + inttostr(fdebt)
      ].Insert(xlDown, xlFormatFromRightOrBelow);
    sp_debt.Next;
      end;


   // Rows(ind+4).RowHeight:=16;
    Range['A' +(ind+5).ToString(), 'K' + (ind+5).ToString()].RowHeight:=30;
    // Sheets.Rows[ind + 4].RowHeight = 50
    // cells(ind + 4).Height :=1;
    // Rows.RowHeight := 1;
  finally
    sp_debt.Free;
    sp_doc.Free;
    dsAddr.Free;
    sp_pers.Free;
  end;
end;

end.
