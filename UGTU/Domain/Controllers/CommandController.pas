unit CommandController;

interface

uses  Db, Data.Win.ADODB, SysUtils;

type
  TBaseCommandController = class
  private
    FDataSet: TADODataSet;
  protected
    procedure SetFilter(aFilter: string);
  public
    function Refresh: boolean; virtual;
    procedure Save; virtual;
  // function
    constructor Create; virtual;
  end;

  TVedomostController = class(TBaseCommandController)
  private
    FikGroup: integer;
    FSemester: integer;
    function GetVedomosty: TADODataSet;
    procedure SetGroup(const Value: integer);
    procedure SetSemester(const Value: integer);
  public
    property Vedomosty: TADODataSet read GetVedomosty;
    property Group: integer write SetGroup;
    property Semester: integer write SetSemester;
    function Execute: boolean;    overload;
    constructor Create(aIkGroup: integer); overload;

  end;

implementation

uses uDMUspevaemost;



{ TBaseCommandController }

constructor TBaseCommandController.Create;
begin

end;

function TBaseCommandController.Refresh: boolean;
begin

end;

procedure TBaseCommandController.Save;
begin

end;

procedure TBaseCommandController.SetFilter(aFilter: string);
begin
  FDataSet.Filtered := false;
  FDataSet.Filter := aFilter;
  FDataSet.Filtered := true;
end;

{ TVedomostController }

constructor TVedomostController.Create(aIkGroup: integer);
begin
 // FDataSet :=
end;

function TVedomostController.Execute: boolean;
begin

end;

function TVedomostController.GetVedomosty: TADODataSet;
begin
   Result := FDataSet;
end;

procedure TVedomostController.SetGroup(const Value: integer);
begin
  FikGroup := Value;
  Refresh;
end;

procedure TVedomostController.SetSemester(const Value: integer);
begin
  SetFilter('n_sem='+IntToStr(Value));
end;

end.
