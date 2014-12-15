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
    procedure Reload(new_source: string);
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
  public
    constructor Create(ik_grup, n_sem: integer); overload;
    procedure Reload(ik_grup, n_sem: integer);
  end;

  TBRSVedomostController = class(TBaseSelectController)
  public
  end;


implementation

uses {uDMUspevaemost,}GeneralController,DateUtils;



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

constructor TVedomostController.Create(ik_grup, n_sem: integer);
begin
  inherited Create('UspevGetVidZanyatForVedomost('+ IntToStr(n_sem) + ',' + IntToStr(ik_grup) +')');

end;

procedure TVedomostController.Reload(ik_grup, n_sem: integer);
begin
  (Self as TBaseSelectController).Reload();
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
