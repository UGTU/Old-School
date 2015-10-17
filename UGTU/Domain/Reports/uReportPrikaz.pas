unit uReportPrikaz;

interface

uses
  Classes, dialogs, SysUtils, ExcelXP, Barcode, Contnrs,
  XIntf, CommonIntf, ReportsBase, db, adodb, ExtCtrls,
  udmUspevaemost, ComCtrls, uAverageBalls, SpravkaHistory2014, Spravka2014,
  DateUtils, uDM, ConstantRepository, uDMDocuments, Document,
  System.Generics.Collections;

type
  ReportPrikaz = class(TExcelReportBase)
  private
    Fik_prikaz: integer;
    Fnum: string;
  protected
    procedure Execute; override;
  public
    property ik_prikaz: integer read Fik_prikaz;
    property num: string read Fnum;
    constructor Create(_ik_prikaz: integer; _num: string);

  end;

implementation

{ PrintMagazine }

constructor ReportPrikaz.Create(_ik_prikaz: integer; _num: string);
begin
  Fnum := _num;
  Fik_prikaz := _ik_prikaz;
end;

procedure ReportPrikaz.Execute;
var
  n, pp, s, ps: integer;
  BYear, BMonth, BDay: word;
  year, fac1, fac2, spec1, spec2, podg,yearz,month, day: string;
  sp_info, dsPric: TADODataSet;

begin
  inherited;
  try
    dsPric := TADODataSet.Create(nil);
    dsPric.CommandText := 'select * from Prikaz where Ik_prikaz =' + ik_prikaz.ToString;
    dsPric.Connection := dm.DBConnect;
    dsPric.Open;
    dsPric.First;

    year := Copy(num, Length(num) - 3, Length(num));
    yearz:=dsPric.FieldByName('Dd_prikazVst').AsString;
    yearz:= Copy(yearz, Length(yearz) - 3, Length(yearz));
    month:= Copy(num, Length(num) - 6, Length(num)- 4)    ;
    month := GetMonthR(StrToInt(Copy(month, 0, 2)));
    day:=  Copy(num, Length(num) - 9, Length(num)-7);
    day:=  Copy(day, 0, 2);
    Replace('#date#', Copy(num, Length(num) - 9, Length(num)));
    Replace('#d#', day);
    Replace('#m#', month);
    Replace('#y#', year);
    Replace('#num#', Copy(num, 0, Length(num) - 14));
    sp_info := TADODataSet.Create(nil);
    sp_info.CommandText := 'select * from fABIT_GetAbitListForZachisl(' + year +
      ',' + ik_prikaz.ToString() + ')';
    sp_info.Connection := dm.DBConnect;
    sp_info.Open;
    sp_info.First;
    // sp_info := TADOStoredProc.Create(nil);
    // sp_info.ProcedureName := 'ABIT_GetAbitListForZachisl;1';
    // sp_info.Connection := dm.DBConnect;
    // sp_info.Parameters.CreateParameter('@nnyear', ftString, pdInput, 50,
    // StrToInt(year));
    // sp_info.Filter := 'Ik_prikazzach=' + ik_prikaz.ToString() +
    // ' order by Cname_fac,cname_spec,fio';
//    sp_info.Open;
//    sp_info.First;

    fac1 := '';
    spec1 := '';
    n := 30;
    pp := 1;
    s := 0;
    ps := 0;
    while not sp_info.Eof do
    begin
      fac2 := sp_info.FieldByName('Cname_fac').AsString;
      spec2 := sp_info.FieldByName('cname_spec').AsString;
      if fac1 <> fac2 then
      begin
        n := n + 2;
        pp := 1;
        ps := 1;
        s := s + 1;
        Range['A' + inttostr(n), 'J' + inttostr(n)
          ].Insert(xlDown, xlFormatFromRightOrBelow);
        Range['A' + inttostr(n), 'J' + inttostr(n)
          ].Insert(xlDown, xlFormatFromRightOrBelow);
        Items[n, 1] := '1.' + s.ToString() + '. ' +
          sp_info.FieldByName('Cname_fac').AsString + ' (' +
          sp_info.FieldByName('Cshort_name_fac').AsString + ')';

      end;
      if spec1 <> spec2 then
      begin
        n := n + 2;
        pp := 1;
        Range['A' + inttostr(n), 'J' + inttostr(n)
          ].Insert(xlDown, xlFormatFromRightOrBelow);
        Range['A' + inttostr(n), 'J' + inttostr(n)
          ].Insert(xlDown, xlFormatFromRightOrBelow);
        if sp_info.FieldByName('Podgot').AsString = 'специальности' then
          podg := 'Специальность'
        else
          podg := 'Направление';
        Items[n, 2] := '1.' + s.ToString() + '.' + ps.ToString + '. ' + podg +
          ' ' + sp_info.FieldByName('Num_spec').AsString + ' ' +
          sp_info.FieldByName('cname_spec').AsString;
        // n := n + 1;
        // xlFormatFromLeftOrAbove);
        n := n + 2;
        Range['A' + inttostr(n), 'J' + inttostr(n)
          ].Insert(xlDown, xlFormatFromRightOrBelow);
        Range['A' + inttostr(n), 'J' + inttostr(n)
          ].Insert(xlDown, xlFormatFromRightOrBelow);
        Items[n, 1] := '№';
        Items[n, 2] := 'ФИО';
        Items[n, 6] := 'Категория зачисления';
        Items[n, 9] := 'Баллы';

        Range['A' + n.ToString(), 'A' + n.ToString()].Select;
        Range['A' + n.ToString(), 'A' + n.ToString()].HorizontalAlignment
          := xlCenter;
        Selection.Borders.LineStyle := 1;
        Range['B' + n.ToString(), 'E' + n.ToString()].Select;
        Selection.MergeCells := true;
        Selection.Borders.LineStyle := 1;
        Range['B' + n.ToString(), 'E' + n.ToString()].HorizontalAlignment
          := xlCenter;
        // Selection.HorizontalAlignment := xlCenter;
        Range['F' + n.ToString(), 'H' + n.ToString()].Select;
        Selection.MergeCells := true;
        Selection.Borders.LineStyle := 1;
        Range['F' + n.ToString(), 'H' + n.ToString()].HorizontalAlignment
          := xlCenter;
        // Selection.HorizontalAlignment := xlCenter;
        Range['J' + n.ToString(), 'I' + n.ToString()].Select;
        Selection.MergeCells := true;
        Selection.Borders.LineStyle := 1;
        Range['J' + n.ToString(), 'I' + n.ToString()].HorizontalAlignment
          := xlCenter;

        // Selection.HorizontalAlignment := xlCenter;
        ps := ps + 1;
        n := n + 1;
        Range['A' + inttostr(n), 'J' + inttostr(n)
          ].Insert(xlDown, xlFormatFromRightOrBelow);
      end;
      Range['A' + inttostr(n), 'J' + inttostr(n)
        ].Insert(xlDown, xlFormatFromRightOrBelow);
      Items[n, 1] := pp.ToString();
      Items[n, 2] := sp_info.FieldByName('fio').AsString;
      Items[n, 6] := sp_info.FieldByName('cname_kat_zach').AsString;
      Items[n, 9] := sp_info.FieldByName('SummBall').AsString;
      Range['A' + n.ToString(), 'A' + n.ToString()].Select;
      Selection.Borders.LineStyle := 1;
      Range['B' + n.ToString(), 'E' + n.ToString()].Select;
      Selection.MergeCells := true;
      Selection.Borders.LineStyle := 1;
      // Range['B' + n.ToString(), 'E' + n.ToString()].HorizontalAlignment
      // := xlCenter;
      // Selection.HorizontalAlignment := xlCenter;
      Range['F' + n.ToString(), 'H' + n.ToString()].Select;
      Selection.MergeCells := true;
      Selection.Borders.LineStyle := 1;
      Range['F' + n.ToString(), 'H' + n.ToString()].HorizontalAlignment
        := xlCenter;
      // Selection.HorizontalAlignment := xlCenter;
      Range['J' + n.ToString(), 'I' + n.ToString()].Select;
      Selection.MergeCells := true;
      Selection.Borders.LineStyle := 1;
      Range['J' + n.ToString(), 'I' + n.ToString()].HorizontalAlignment
        := xlCenter;
      // Selection.HorizontalAlignment := xlCenter;
      pp := pp + 1;
      n := n + 1;
      fac1 := fac2;
      spec1 := spec2;
      sp_info.Next;
    end;
  finally
    sp_info.Free;
    dsPric.Free;
  end;

end;

end.
