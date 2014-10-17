unit CommandController;

interface

uses  Db, Data.Win.ADODB;

type
  TBaseCommandController = class
  private
    FDataSet: TADODataSet;
  public
    function Refresh: boolean; virtual;
    procedure Save; virtual;
    constructor Create; virtual;
  end;

  TVedomostController = class(TBaseCommandController)
  private
    FikGroup: integer;
    FSemester: integer;
    FDataSource: TDataSource;
    function GetVedomosty: TADODataSet;
    procedure SetGroup(const Value: integer);
  public
    property Vedomosty: TADODataSet read GetVedomosty;
    property Group: integer write SetGroup;
    function Execute: boolean;    overload;
    constructor Create(aIkGroup, aSem: integer; aDataSource: TDataSource); overload;

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

{ TVedomostController }

constructor TVedomostController.Create(aIkGroup, aSem: integer;
  aDataSource: TDataSource);
begin

end;

function TVedomostController.Execute: boolean;
begin

end;

function TVedomostController.GetVedomosty: TADODataSet;
begin

end;

procedure TVedomostController.SetGroup(const Value: integer);
begin
  FikGroup := Value;
  Refresh;
end;

end.
