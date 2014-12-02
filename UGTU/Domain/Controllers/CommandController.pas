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
  // function
    constructor Create(source: string); //source - источник данных в БД (можно с инструкцией where)
    destructor Destroy;
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

  TGroupController = class(TBaseSelectController)
  private
    FikGroup: integer;
    procedure SetGroup(const Value: integer);
    function GetUchPlan: integer;
  public
    property Group: integer write SetGroup;
    property UchPlan: integer read GetUchPlan;
    constructor Create; overload;
  end;

  TBRSVedomostController = class(TBaseCommandController)
  public
    constructor Create(ik_grup, nsem, nomer_att: integer); overload;
  end;

  TnoBRSVedomostController = class(TBaseCommandController)
  public
  end;


implementation

uses {uDMUspevaemost,}GeneralController;



{ TBaseSelectController }

constructor TBaseSelectController.Create(source: string);
begin
  FDataSet := TGeneralController.Instance.GetNewADODataSet(false);
  FDataSet.CommandText := 'select * from '+source;
  FDataSet.Open;
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

end;

function TGroupController.GetUchPlan: integer;
begin
  Result := FDataSet.FieldByName('Ik_uch_plan').AsInteger;
  if Result = NULL then Result := 0;
end;

procedure TGroupController.SetGroup(const Value: integer);
begin
  SetFilter('ik_grup='+IntToStr(Value));
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

{ TBRSVedomostController }

constructor TBRSVedomostController.Create(ik_grup, nsem, nomer_att: integer);
begin
  inherited Create('GetAllAttestForBRSGrup');
  with FStoredProc.Parameters do
  begin
    Clear;
    AddParameter;
    Items[0].Value := ik_grup;
    AddParameter;
    Items[1].Value := nsem;
    AddParameter;
    Items[2].Value := nomer_att;
  end;
  Refresh;
end;

end.
