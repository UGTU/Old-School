unit CommandController;

interface

uses  Db, Data.Win.ADODB, SysUtils,System.Variants;

type
  TBaseSelectController = class
  private
    FDataSet: TADODataSet;
  protected
    procedure SetFilter(aFilter: string);
  public
    function Refresh: boolean; virtual;
    procedure Save; virtual;
    procedure Reload(new_source: string); virtual;
  // function
    constructor Create(source: string); //source - источник данных в БД (можно с инструкцией where)
    destructor Destroy; virtual;
  end;

  TBaseCommandController = class
  private
    FStoredProc: TADOStoredProc;
  protected
    procedure Refresh;
  public
    constructor Create(ProcName: string);
    destructor Destroy;
  end;

//-----------------наследники---------------------------------------------------------------------------------

  TUchPlanController = class(TBaseSelectController)
  private
    FYear: integer;
    FGroup: integer;
    procedure SetGroup(const Value: integer);
    procedure SetYear(const Value: integer);
    function GetUchPlan: integer;
  public
    constructor Create; overload;
    property Group: integer write SetGroup;
    property Year: integer write SetYear;
    property UchPlan: integer read GetUchPlan;
  end;

  TGroupController = class(TBaseSelectController)
  private
    FikGroup: integer;
    FUchPlans: TUchPlanController;
    procedure SetGroup(const Value: integer);
  public
    function GetCurrentUchPlan: integer;                      //текущий план
    function UchPlanByYear(_year: integer):  integer;         //план на конкретный год
    property Group: integer write SetGroup;
    property UchPlan: integer read GetCurrentUchPlan;

    constructor Create; overload;
    destructor Destroy; override;
  end;



  TVedomostController = class(TBaseSelectController)
  private
    FIK_Grup: integer;
    FN_sem: integer;
    function GetContentCount: integer;
    function IsAllVedDone: boolean;
    function GetVedomCount: integer;
  public
    constructor Create; overload;
    procedure Reload(ik_grup, n_sem: integer); overload;
    procedure CreateAllVed;

    property ContentCount: integer read GetContentCount;
    property VedomCount: integer read GetVedomCount;
    property AllVedDone: boolean read IsAllVedDone;
    property DataSet: TADODataSet read FDataSet;
  end;

  TBRSVedomostController = class(TBaseSelectController)
  public
  end;


implementation

uses {uDMUspevaemost,}GeneralController,DateUtils,uDM;



{ TBaseSelectController }

constructor TBaseSelectController.Create(source: string);
begin
  FDataSet := TGeneralController.Instance.GetNewADODataSet(false);
  Reload(source);
end;

destructor TBaseSelectController.Destroy;
begin
  FDataSet.Close;
  FDataSet.Free;
end;

function TBaseSelectController.Refresh: boolean;
begin
  FDataSet.Close;
  FDataSet.Open;
end;

procedure TBaseSelectController.Reload(new_source: string);
begin
  FDataSet.Close;
  FDataSet.CommandText := 'select * from '+new_source;
  FDataSet.Open;
end;

procedure TBaseSelectController.Save;
begin

end;

procedure TBaseSelectController.SetFilter(aFilter: string);
begin
  FDataSet.Filtered := false;
  FDataSet.Filter := aFilter;
  FDataSet.Filtered := true;
end;



{ TGroupController }

constructor TGroupController.Create;
begin
  inherited Create('Grup');
  FUchPlans := TUchPlanController.Create;
end;

destructor TGroupController.Destroy;
begin
  FUchPlans.Free;
  inherited;
end;

function TGroupController.GetCurrentUchPlan: integer;
begin
  Result := UchPlanByYear(YearOf(Now));  //берем текущий год
end;

procedure TGroupController.SetGroup(const Value: integer);
begin
  SetFilter('ik_grup='+IntToStr(Value));
  FikGroup := Value;
  FUchPlans.Group := Value;
end;

function TGroupController.UchPlanByYear(_year: integer): integer;
begin
  FUchPlans.Year := _year;
  Result := FUchPlans.UchPlan;
  if Result = NULL then Result := 0;
end;

{ TBaseCommandController }

constructor TBaseCommandController.Create(ProcName: string);
begin
  FStoredProc := TGeneralController.Instance.GetNewADOStoredProc(ProcName,false);
end;

destructor TBaseCommandController.Destroy;
begin
  FStoredProc.Active := False;
  FStoredProc.Free;
end;

procedure TBaseCommandController.Refresh;
begin
  FStoredProc.Active := false;
  FStoredProc.ExecProc;
  FStoredProc.Active := true;
end;

{ TVedomostController }

constructor TVedomostController.Create;
begin
  inherited Create('UspevGetVidZanyatForVedomost('+ IntToStr(0) + ',' + IntToStr(0) +')');
end;

procedure TVedomostController.CreateAllVed;
var FStoredProc: TADOStoredProc;
    i: integer;
begin

  FStoredProc := TGeneralController.Instance.GetNewADOStoredProc('UspevInsertVedomost',false);
  FStoredProc.Connection:= dm.DBConnect;
  with FStoredProc.Parameters do
  begin
    Clear;
    CreateParameter('@cNumber_ved', ftString, pdInput, 12, '');
		CreateParameter('@Ik_grup', ftInteger, pdInput, 0, FIK_Grup);
    CreateParameter('@ik_upContent', ftInteger, pdInput, 0, 0);
    try
		   FDataSet.First;
       for I := 0 to FDataSet.RecordCount-1 do
       begin
         if FDataSet.FieldByName('ik_ved').Value=NULL then
         begin
           ParamByName('@ik_upContent').Value := FDataSet.FieldByName('ik_upContent').AsInteger;
           FStoredProc.ExecProc;
			   end;
         FDataSet.Next;
       end;
    finally
		  FStoredProc.Free;
    end;
  end;
  Refresh;
end;

function TVedomostController.GetContentCount: integer;
begin
  Result := FDataSet.RecordCount;
end;

function TVedomostController.GetVedomCount: integer;
var i: integer;
begin
  Result :=0;
  if FDataSet.RecordCount >0 then
  begin
    FDataSet.First;
    for I := 0 to FDataSet.RecordCount-1 do
    begin
      if FDataSet.FieldByName('ik_ved').Value<>NULL then
        Result := Result + 1;
      FDataSet.Next;
    end;
  end;
      
end;

function TVedomostController.IsAllVedDone: boolean;
var i: integer;
begin
  Result := true;
  for I := 0 to FDataSet.RecordCount-1 do
  begin
    if FDataSet.FieldByName('ik_ved').Value = NULL then
    begin
      Result := false;
      break;
    end;
    FDataSet.Next;
  end;
end;

procedure TVedomostController.Reload(ik_grup, n_sem: integer);
begin
  inherited Reload('UspevGetVidZanyatForVedomost('+ IntToStr(n_sem) + ',' + IntToStr(ik_grup) +')');
  FIK_Grup := ik_grup;
  FN_sem := n_sem;
end;

{ TUchPlanController }

constructor TUchPlanController.Create;
begin
  inherited Create('UchPlanGrup');
end;

function TUchPlanController.GetUchPlan: integer;
begin
  Result := FDataSet.FieldByName('Ik_uch_plan').AsInteger;
end;

procedure TUchPlanController.SetGroup(const Value: integer);
begin
  FGroup := Value;
  SetFilter('ik_grup='+IntToStr(Value));
end;

procedure TUchPlanController.SetYear(const Value: integer);
var str: string;
begin
  str := 'year_value = ' + IntToStr(Value);
  if FGroup<>0 then
     str := 'ik_grup = ' + IntToStr(FGroup) + ' and ' + str;
  SetFilter(str);
end;

end.
