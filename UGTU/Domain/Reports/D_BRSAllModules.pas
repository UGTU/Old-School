unit D_BRSAllModules;

{ #Author sergdev@ist.ugtu.net }
interface

uses
  Classes, dialogs, SysUtils, ExcelXP, Barcode, Contnrs, XIntf, CommonIntf,
  ReportsBase, db, adodb;

const
  TableBeg = 10;

type
  TBRSAllModulesReport = class(TExcelReportBase)
  private
    FDataset: TADODataset;
    FFaculty: string;
    FGroup: string;
    FSemester: integer;
    FDiscipline: string;
    FExaminator: string;
    FDate: string;
    FNum: string;
    FIkDisc: integer;
    FIKUP_Content: integer;
    FIkGroup: integer;
  protected
    procedure Execute; override;
    function GetTotalSteps: integer; override;
  public
    constructor Create(AOwner: TComponent; dsVed: TADODataset);
    constructor CreateFull(AOwner: TComponent; dsVed: TADODataset;
      fac, group, disc, exam, num, date: string;
      sem, IkDisc, IkGroup, ikContent: integer);

  end;

implementation

constructor TBRSAllModulesReport.Create(AOwner: TComponent; dsVed: TADODataset);
begin
  inherited Create(AOwner);
  FDataset := dsVed;
end;

constructor TBRSAllModulesReport.CreateFull(AOwner: TComponent;
  dsVed: TADODataset; fac, group, disc, exam, num, date: string;
  sem, IkDisc, IkGroup, ikContent: integer);
begin
  inherited Create(AOwner);
  FDataset := dsVed;
  FFaculty := fac;
  FGroup := group;
  FSemester := sem;
  FDiscipline := disc;
  FExaminator := exam;
  FDate := date;
  FNum := num;
  FIkGroup := IkGroup;
  FIkDisc := IkDisc;
  FIKUP_Content := ikContent;
end;

procedure TBRSAllModulesReport.Execute;
var
  i, NameDatasetNum, rc: integer;
begin
  inherited;
  if FDataset = nil then
    exit;

  FDataset.Active := false;
  FDataset.CommandText := 'select * from dbo.GetBRSBallsForModule(' +
    inttostr(FIKUP_Content) + ',' + inttostr(FIkDisc) + ',' + inttostr(FIkGroup)
    + ',' + inttostr(FSemester) + ',1)';
  FDataset.Active := true;
  FDataset.First;
  rc := FDataset.RecordCount;
  Logger.LogMessage('FDataset opned');

  NameDatasetNum := 1;

  FDataset.Active := false;
  FDataset.CommandText := 'select * from dbo.GetBRSBallsForModule(' +
    inttostr(FIKUP_Content) + ',' + inttostr(FIkDisc) + ',' + inttostr(FIkGroup)
    + ',' + inttostr(FSemester) + ',2)';
  FDataset.Active := true;
  Logger.LogMessage('FDataset activated');
  if rc < FDataset.RecordCount then
  begin
    rc := FDataset.RecordCount;
    NameDatasetNum := 2;
  end;

  FDataset.Active := false;
  FDataset.CommandText := 'select * from dbo.GetBRSBallsForModule(' +
    inttostr(FIKUP_Content) + ',' + inttostr(FIkDisc) + ',' + inttostr(FIkGroup)
    + ',' + inttostr(FSemester) + ',3)';
  FDataset.Active := true;
  FDataset.First;

  Logger.LogMessage('FDataset goto first');
  if rc < FDataset.RecordCount then
    NameDatasetNum := 3;

  FDataset.Active := false;
  FDataset.CommandText := 'select * from dbo.GetBRSBallsForModule(' +
    inttostr(FIKUP_Content) + ',' + inttostr(FIkDisc) + ',' + inttostr(FIkGroup)
    + ',' + inttostr(FSemester) + ',' + inttostr(NameDatasetNum) + ')';
  FDataset.Active := true;

  if not FDataset.Active then
  begin
    showmessage('Выберите ведомость для печати!');
    exit;
  end;

  FDataset.DisableControls;
  try
    FDataset.First;

    Range['F12', 'J13'].Copy(Range['Q12', 'U13']);
    Range['F12', 'J13'].Clear;
    Range['Q12', 'U13'].Copy
      (Range['F' + inttostr(TableBeg + 2 + FDataset.RecordCount - 1),
      'J' + inttostr(TableBeg + 3 + FDataset.RecordCount - 1)]);
    Range['Q12', 'U13'].Clear;

    Logger.LogMessage('Range cleared');

    Items[4, 4] := FFaculty;
    Items[5, 4] := FGroup;
    Items[4, 12] := FSemester;
    Items[6, 4] := FDiscipline;
    Items[5, 12] := FExaminator;

    for i := 0 to FDataset.RecordCount - 1 do
    begin
      Range['A' + inttostr(TableBeg + i), 'I' + inttostr(TableBeg + i)
        ].NumberFormat := '@';
      Items[TableBeg + i, 2] := i + 1;
      Items[TableBeg + i, 3] := FDataset.FieldByName('StudName').Value;
      Items[TableBeg + i, 4] := FDataset.FieldByName('nn_zach').Value;
      Range['A' + inttostr(TableBeg + i), 'P' + inttostr(TableBeg + i)
        ].Font.Size := 10;
      Range['A' + inttostr(TableBeg + i), 'P' + inttostr(TableBeg + i)
        ].Font.Name := 'Times New Roman';
      Range['C' + inttostr(TableBeg + i), 'C' + inttostr(TableBeg + i)
        ].HorizontalAlignment := xlLeft;
      Range['D' + inttostr(TableBeg + i), 'P' + inttostr(TableBeg + i)
        ].HorizontalAlignment := xlCenter;
      FDataset.Next;
    end;

    Range['B' + inttostr(TableBeg - 1),
      'P' + inttostr(TableBeg + FDataset.RecordCount - 1)].Borders.Weight := 2;

    FDataset.Active := false;
    FDataset.CommandText := 'select * from dbo.GetBRSBallsForModule(' +
      inttostr(FIKUP_Content) + ',' + inttostr(FIkDisc) + ',' +
      inttostr(FIkGroup) + ',' + inttostr(FSemester) + ',1)';
    FDataset.Active := true;
    FDataset.First;

    i := 0;
    while not FDataset.Eof do
    begin
      if string(Items[TableBeg + i, 3]) = FDataset.FieldByName('StudName').AsString
      then
      begin
        Items[TableBeg + i, 5] := FDataset.FieldByName('i_balls').Value;
        Items[TableBeg + i, 6] := FDataset.FieldByName('i_miss').Value;
        Items[TableBeg + i, 7] := FDataset.FieldByName('i_miss_r').Value;
        NextStep(1, 'Progress ' + inttostr(i + 1));
        FDataset.Next;
      end;
      inc(i);
    end;

    FDataset.Active := false;
    FDataset.CommandText := 'select * from dbo.GetBRSBallsForModule(' +
      inttostr(FIKUP_Content) + ',' + inttostr(FIkDisc) + ',' +
      inttostr(FIkGroup) + ',' + inttostr(FSemester) + ',2)';
    FDataset.Active := true;
    FDataset.First;

    i := 0;
    while not FDataset.Eof do
    begin
      if string(Items[TableBeg + i, 3]) = FDataset.FieldByName('StudName').AsString
      then
      begin
        Items[TableBeg + i, 9] := FDataset.FieldByName('i_balls').Value;
        Items[TableBeg + i, 10] := FDataset.FieldByName('i_miss').Value;
        Items[TableBeg + i, 11] := FDataset.FieldByName('i_miss_r').Value;

        NextStep(1, 'Progress ' + inttostr(i + 1));
        FDataset.Next;
      end;
      inc(i);
    end;

    FDataset.Active := false;
    FDataset.CommandText := 'select * from dbo.GetBRSBallsForModule(' +
      inttostr(FIKUP_Content) + ',' + inttostr(FIkDisc) + ',' +
      inttostr(FIkGroup) + ',' + inttostr(FSemester) + ',3)';
    FDataset.Active := true;
    FDataset.First;

    i := 0;
    while not FDataset.Eof do
    begin
      if string(Items[TableBeg + i, 3]) = FDataset.FieldByName('StudName').AsString
      then
      begin
        Items[TableBeg + i, 13] := FDataset.FieldByName('i_balls').Value;
        Items[TableBeg + i, 14] := FDataset.FieldByName('i_miss').Value;
        Items[TableBeg + i, 15] := FDataset.FieldByName('i_miss_r').Value;

        NextStep(1, 'Progress ' + inttostr(i + 1));
        FDataset.Next;
      end;
      inc(i);
    end;

  finally
    FDataset.EnableControls;
  end;
end;

// Определим общее число шагов в создании рапорта
// Реальное число шагов скорее всего будет равно количеству
// записей, возвращённых запросом для отчёта
// Example: Result := MyDataSet.Recordscount;
function TBRSAllModulesReport.GetTotalSteps: integer;
begin
  Result := FDataset.RecordCount * 3;
end;

end.
