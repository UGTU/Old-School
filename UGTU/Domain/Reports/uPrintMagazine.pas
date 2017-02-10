unit uPrintMagazine;

interface

uses
  Classes, dialogs, SysUtils, ExcelXP, Barcode, Contnrs,
  XIntf, CommonIntf, ReportsBase, db, adodb, ExtCtrls,
  udmUspevaemost, ComCtrls, uAverageBalls, SpravkaHistory2014, Spravka2014,
  DateUtils, uDM, ConstantRepository, uDMDocuments, Document,
  System.Generics.Collections;

type
  PrintMagazine = class(TExcelReportBase)
  private
    Fdatebegin, Fdateend: string;
  protected
    procedure Execute; override;
  public
    property datebegin: string read Fdatebegin;
    property dateend: string read Fdateend;
    constructor Create(_datebegin, _dateend: string);

  end;

implementation

{ PrintMagazine }

constructor PrintMagazine.Create(_datebegin, _dateend: string);
begin
  Fdatebegin := _datebegin;
  Fdateend := _dateend;
end;

procedure PrintMagazine.Execute;
var
  n, fusp: integer;
  BYear, BMonth, BDay: word;
  a, b: string;
begin
  inherited;
  n := 1;
  fusp := 9;
  DecodeDate(Now, BYear, BMonth, BDay);
  if BMonth.ToString.Length = 1 then
    a := '0';
  if BDay.ToString.Length = 1 then
    b := '0';
  Replace('#date#', a+BDay.ToString  + '.' + b+BMonth.ToString + '.' + BYear.ToString);
  uDMDocuments.dmDocs.adodsDocs.DisableControls;
  try
  with uDMDocuments.dmDocs.adodsDocs do
  begin
    First;
    Replace('#inst#', FieldByName('Cname_fac').AsString);
    Replace('#datebegin#', datebegin);
    Replace('#dateend#', dateend);
    // Replace('#date#', Now));
    // DisableControls;
    while not EOF do
    begin

      Range['A' + inttostr(fusp), 'K' + inttostr(fusp)
        ].Insert(xlDown, xlFormatFromRightOrBelow);

      // Range['C' + inttostr(fusp), 'E' + inttostr(fusp)].Select;
      Items[fusp, 1] := FieldByName('NumberDoc').AsString;
      Items[fusp, 2] := FieldByName('DateCreate').AsString;
      Items[fusp, 3] := FieldByName('FIO').AsString;
      Items[fusp, 7] := FieldByName('Cname_grup').AsString;
      Items[fusp, 8] := FieldByName('cNameDestination').AsString;
      Items[fusp, 11] := FieldByName('cNameTransfer').AsString;
      Range['C' + inttostr(fusp), 'F' + inttostr(fusp)].Select;
      Selection.MergeCells := true;
      Selection.Borders.LineStyle := 1;
      Range['H' + inttostr(fusp), 'J' + inttostr(fusp)].Select;
      Selection.MergeCells := true;
      Selection.Borders.LineStyle := 1;
      Range['A' + inttostr(fusp), 'A' + inttostr(fusp)].Select;
      Selection.Borders.LineStyle := 1;
      Range['B' + inttostr(fusp), 'B' + inttostr(fusp)].Select;
      Selection.Borders.LineStyle := 1;
      Range['G' + inttostr(fusp), 'G' + inttostr(fusp)].Select;
      Selection.Borders.LineStyle := 1;
      Range['K' + inttostr(fusp), 'K' + inttostr(fusp)].Select;
      Selection.Borders.LineStyle := 1;

      // Range['C' + inttostr(fusp), 'E' + inttostr(fusp)].HorizontalAlignment
      // := xlCenter;
      Next;
      n := n + 1;
      fusp := fusp + 1;
    end;
  end;

  finally
    uDMDocuments.dmDocs.adodsDocs.EnableControls;
  end;
end;

end.
