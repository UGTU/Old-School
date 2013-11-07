unit ReportsBpl;
  {#Author fmarakasov@ugtu.net}
interface
uses
  ReportsBase,
  Classes;
type
  TExcelReport = class;

  TTotalStepsCountNeedEvent = procedure (Sender : TObject; var TotalSteps: Integer) of object;


  TExcelReport = class (TExcelReportBase)
  private
    FOnExecute : TNotifyEvent;
    FTotalStepsCount : TTotalStepsCountNeedEvent;

    procedure SetActive(Value : Boolean);
    function GetActive: Boolean;
    procedure Close;
  protected
    procedure Execute;override;
    function GetTotalSteps:Integer;override;
  public
    procedure NextStep(Increment:Integer = 1; const ProgressNote:string='');

    property Items;
    property Cells;
    property ExcelApplication;
    property CurrentWorkbook;
    property ActiveSheet;
    property Range;
    property Worksheet;
    property BarcodeApplet;
    property ActiveBarcodeApplet;
  published

    property Active : Boolean read GetActive write SetActive;
    property FreeOnComplete;
    property ReportTemplate;

    property OnExecute : TNotifyEvent read FOnExecute write FOnExecute;
    property OnTotalStepsNeeded:TTotalStepsCountNeedEvent read FTotalStepsCount write FTotalStepsCount;
    property OnBeforeExecute;
    property OnAfterExecute;
    property OnReportProgress;
    property OnExecuteError;
  end;
  procedure Register;

implementation

{ TExcelReport }

procedure TExcelReport.Close;
begin
  if (IsOpen) then
  begin
    Self.Quit;
  end;
end;

procedure TExcelReport.Execute;
begin
  inherited;
  if Assigned(FOnExecute) then FOnExecute(Self);
end;

function TExcelReport.GetActive: Boolean;
begin
  Result := IsOpen;
end;

function TExcelReport.GetTotalSteps: Integer;
var
  Value : Integer;
begin
  if Assigned(FTotalStepsCount) then
  begin
    FTotalStepsCount(Self, Value);
    Result := Value;
  end
  else
    Result := inherited GetTotalSteps;
end;

procedure TExcelReport.NextStep(Increment: Integer; const ProgressNote: string);
begin
  inherited NextStep(Increment, ProgressNote);
end;

procedure TExcelReport.SetActive(Value: Boolean);
begin
  if (Value) then
    BuildReport
  else
    Close;
end;

procedure Register;
begin
  Classes.RegisterComponents('XReports', [TExcelReport]);
end;

end.
