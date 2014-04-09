unit DiscClasses;

interface

uses Contnrs;

type

TDiscUchPlan = class(TObject)
private
  FIK: integer;
public
  property IK: integer read FIK write FIK;
  constructor Create(aDiscUchPlanIK: integer);
end;

TContentDiscUnit = class(TObject)
private
  FIK: integer;
  Fn_sem: string;
  Fvid_zan: integer;
  Fn_module: integer;
  Fkaf_IK: integer;
    function GetNewStatus: boolean;
public
  property n_sem: string read Fn_sem write Fn_sem;
  property kaf_IK: integer read Fkaf_IK write Fkaf_IK;
  property vid_zan: integer read fvid_zan write fvid_zan;
  property n_module: integer read Fn_module write Fn_module;
  property Is_New: boolean read GetNewStatus;
  constructor Create(an_sem: string; avid_zan, an_module: integer); overload;
  constructor Create(an_sem: string; avid_zan, aContentUPIK, an_module: integer); overload;
end;

TContentDiscUnits = class(TObjectList)
private
  FDiscUchPlanIK: integer;
    function GetItems(Index: Integer): TContentDiscUnit;
public
  property discUchPlanIK: integer read FDiscUchPlanIK write FDiscUchPlanIK;
  property Items[Index: Integer]: TContentDiscUnit read GetItems;
  constructor Create(aDiscUchPlanIK: integer);
end;

implementation

{ TDiscUchPlan }

constructor TDiscUchPlan.Create(aDiscUchPlanIK: integer);
begin
  FIK := aDiscUchPlanIK;
end;

{ TContentDiscUnit }

constructor TContentDiscUnit.Create(an_sem: string; avid_zan, an_module: integer);
begin
  FIK := 0;
  Fn_module := an_module;
  Fn_sem := an_sem;
  Fvid_zan := avid_zan;
end;

constructor TContentDiscUnit.Create(an_sem: string; avid_zan,
  aContentUPIK, an_module: integer);
begin
  FIK := aContentUPIK;
  Fn_module := an_module;
  Fn_sem := an_sem;
  Fvid_zan := avid_zan;
end;

function TContentDiscUnit.GetNewStatus: boolean;
begin
  Result := (FIK = 0);
end;

{ TContentDiscUnits }

constructor TContentDiscUnits.Create(aDiscUchPlanIK: integer);
begin
  FDiscUchPlanIK := aDiscUchPlanIK;
end;

function TContentDiscUnits.GetItems(Index: Integer): TContentDiscUnit;
begin
  Result := TContentDiscUnit(inherited Items[Index]);
end;

end.
