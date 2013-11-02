unit uNagruzkaCalcUnits;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, GridsEh,
  DBGridEh, Mask, DBCtrlsEh, DB,NagruzkaController, NagruzkaClasses, GeneralController, ADODB, math;

type
  TfrmNagruzkaCalcUnits = class(TfrmBaseDialog)
    Panel2: TPanel;
    Panel3: TPanel;
    dbeName: TDBEditEh;
    Label1: TLabel;
    dbeContract: TDBEditEh;
    dbeBudget: TDBEditEh;
    Label2: TLabel;
    Label3: TLabel;
    dbgGroups: TDBGridEh;
    Label4: TLabel;
    dsGroups: TDataSource;
    lblError: TLabel;
    procedure dbeNameChange(Sender: TObject);
    procedure dbeBudgetChange(Sender: TObject);
    procedure dbeContractChange(Sender: TObject);
    procedure dbeBudgetKeyPress(Sender: TObject; var Key: Char);
    procedure dbeContractKeyPress(Sender: TObject; var Key: Char);
    procedure dbgGroupsColumns0UpdateData(Sender: TObject; var Text: string;
      var Value: Variant; var UseText, Handled: Boolean);
  private
    { Private declarations }
    fCalcUnit: TSemesterCalcUnit;
    fGroupCount: integer; //количество включенных групп
    procedure UpdateModifiedState;
    procedure SetCalcIK(const Value: integer);
    procedure SetShemaIK(const Value: integer);
    function GetShemaIK: integer;
    function GetCalcIK: integer;
    procedure LoadGroups;
    function GetPotokSemesterIK: integer;
    procedure setPotokSemesterIK(const Value: integer);
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    { Public declarations }
    property IK: integer read GetCalcIK write SetCalcIK;
    property ShemaIK: integer read GetShemaIK write SetShemaIK;
    property PotokSemesterIK: integer read GetPotokSemesterIK write setPotokSemesterIK;
    destructor Destroy; override;
    constructor CreateDialog(AOwner:TComponent; AConnection:TADOConnection; ADataSet: TCustomADODataSet); override;
    property CalcUnit: TSemesterCalcUnit read fCalcUnit write fCalcUnit;
    procedure Read;overload;
    procedure Read(aCalc: TSemesterCalcUnit);  overload;
  end;

var
  frmNagruzkaCalcUnits: TfrmNagruzkaCalcUnits;

implementation

{$R *.dfm}

{ TfrmNagruzkaCalcUnits }

constructor TfrmNagruzkaCalcUnits.CreateDialog(AOwner: TComponent;
  AConnection: TADOConnection; ADataSet: TCustomADODataSet);
begin
  inherited;
  dsGroups.DataSet:= TGeneralController.Instance.GetNewADODataSet(true);
  fCalcUnit := TSemesterCalcUnit.Create();
end;

procedure TfrmNagruzkaCalcUnits.dbeBudgetChange(Sender: TObject);
begin

  if (dbeBudget.Text='') then dbeBudget.Text:='0';

  UpdateModifiedState;
end;

procedure TfrmNagruzkaCalcUnits.dbeBudgetKeyPress(Sender: TObject;
  var Key: Char);
begin
 // if (not (Key in ['0'..'9']))and (Key<>#008) then Key:= #0;
end;

procedure TfrmNagruzkaCalcUnits.dbeContractChange(Sender: TObject);
begin
  if (dbeContract.Text='') then dbeContract.Text:='0';
  UpdateModifiedState;
end;

procedure TfrmNagruzkaCalcUnits.dbeContractKeyPress(Sender: TObject;
  var Key: Char);
begin
// if (not (Key in ['0'..'9']))and (Key<>#008) then Key:= #0;
end;

procedure TfrmNagruzkaCalcUnits.dbeNameChange(Sender: TObject);
begin
  UpdateModifiedState;
end;


procedure TfrmNagruzkaCalcUnits.dbgGroupsColumns0UpdateData(Sender: TObject;
  var Text: string; var Value: Variant; var UseText, Handled: Boolean);
begin
  if Boolean(Value) then inc(fGroupCount) else dec(fGroupCount);
  UpdateModifiedState;
end;

destructor TfrmNagruzkaCalcUnits.Destroy;
begin
  dsGroups.DataSet.Close;
  dsGroups.DataSet.Free;
  fCalcUnit.Free;
  inherited;
end;

function TfrmNagruzkaCalcUnits.DoApply: boolean;
var tempGroup: TStringList;
begin
  //создаем лист с включенными в расчетную единицу группами
 // tempGroup := TStringList.Create;
  fCalcUnit.ClearGroup;
  dsGroups.DataSet.First;
  while not dsGroups.DataSet.Eof do
  begin
    if dsGroups.DataSet.FieldByName('inCalc').AsBoolean then
       fCalcUnit.AddGroup(dsGroups.DataSet.FieldByName('ik_grup').AsInteger, dsGroups.DataSet.FieldByName('Cname_grup').AsString);
    //  tempGroup.Add(dsGroups.DataSet.FieldByName('ik_grup').AsString);
    dsGroups.DataSet.Next;
  end;
  fCalcUnit.Name := dbeName.Text;
  fCalcUnit.Budget := StrToInt(dbeBudget.Text);
  fCalcUnit.Contract := StrToInt(dbeContract.Text);

  {Result:= TNagruzkaController.Preparation.SaveSemesterCalcUnit(Tag, ShemaIK,IK, dbeName.Text,
           StrToInt(dbeBudget.Text),StrToInt(dbeContract.Text), tempGroup);            }


 // tempGroup.Clear;
 // tempGroup.Free;
 // if Result then
 IsModified:= false;
    Result:= true;
end;

function TfrmNagruzkaCalcUnits.DoCancel: boolean;
begin
  Result:= false;
  case (Application.MessageBox('Сохранить внесенные изменения?',PChar(Caption), MB_YESNOCANCEL)) of
      mrYes: OK;
      mrNo: Result:= true;
  end;
end;

function TfrmNagruzkaCalcUnits.GetCalcIK: integer;
begin
  Result := fCalcUnit.IK;
end;

function TfrmNagruzkaCalcUnits.GetPotokSemesterIK: integer;
begin
  Result := fCalcUnit.PotokSemesterIK;
end;

function TfrmNagruzkaCalcUnits.GetShemaIK: integer;
begin
  Result := fCalcUnit.ShemaIK;
end;

procedure TfrmNagruzkaCalcUnits.LoadGroups;
begin
   fGroupCount:=0;
  (dsGroups.DataSet as TADODataSet).CommandText:='select * from Nagr_GetCalcUnitGroup('+IntToStr(PotokSemesterIK)+','+IntToStr(IK)+')';
  (dsGroups.DataSet as TADODataSet).Open;
  dsGroups.DataSet.First;
  //cинхронизация списка групп с последним сформированным
  while not dsGroups.DataSet.Eof do
  begin
     if (fCalcUnit.Groups.Count=0)and(dsGroups.DataSet.FieldByName('inCalc').AsBoolean = true) then
     begin
       inc(fGroupCount);
       fCalcUnit.AddGroup(dsGroups.DataSet.FieldByName('ik_grup').AsInteger, dsGroups.DataSet.FieldByName('Cname_grup').AsString);
     end;
     if (fCalcUnit.Groups.Count>0)and(fCalcUnit.HasGroup(dsGroups.DataSet.FieldByName('Ik_grup').AsInteger))  then
     begin
       inc(fGroupCount);
       dsGroups.DataSet.Edit;
       dsGroups.DataSet.FieldByName('inCalc').Value := true;
     end;
     dsGroups.DataSet.Next;
  end;
  dsGroups.DataSet.First;
end;

procedure TfrmNagruzkaCalcUnits.Read(aCalc: TSemesterCalcUnit);
var i: integer;
begin

      fCalcUnit.IK := aCalc.IK;
      fCalcUnit.Name := aCalc.Name;
      fCalcUnit.Budget := aCalc.Budget;
      fCalcUnit.Contract := aCalc.Contract;
      fCalcUnit.ShemaIK := aCalc.ShemaIK;
      fCalcUnit.PotokSemesterIK := aCalc.PotokSemesterIK;
      for I := 0 to aCalc.Groups.Count - 1 do
      with aCalc.Groups.Items[i] as TGroup do
         fCalcUnit.Groups.Add(TGroup.Create(IK,Name));
        

      dbeName.Text:= fCalcUnit.Name;
      dbeBudget.Text:= IntToStr(fCalcUnit.Budget);
      dbeContract.Text:= IntToStr(fCalcUnit.Contract);

  LoadGroups;
  UpdateModifiedState;
  IsModified := false;

end;

procedure TfrmNagruzkaCalcUnits.Read;
var tempDataSet: TADODataSet;
begin
  LoadGroups;
  UpdateModifiedState;
  IsModified := false;
end;

procedure TfrmNagruzkaCalcUnits.SetCalcIK(const Value: integer);
begin
  fCalcUnit.IK := Value;
end;

procedure TfrmNagruzkaCalcUnits.setPotokSemesterIK(const Value: integer);
begin
  fCalcUnit.PotokSemesterIK := Value;
end;

procedure TfrmNagruzkaCalcUnits.SetShemaIK(const Value: integer);
begin
  fCalcUnit.ShemaIK := Value;
end;

procedure TfrmNagruzkaCalcUnits.UpdateModifiedState;
var errCode, colGr: integer;
    i: integer;
begin
  errCode := 0;
  colGr := 0;
  IsModified := false;
  if dbeName.Text='' then errCode:=1;   //некорректное имя
  if (StrToInt(dbeBudget.Text)+StrToInt(dbeContract.Text) = 0) then errCode:= 2;    //нет людей в расчетной единице
  if fGroupCount=0 then  errCode := 3;
  case errCode of
  1: lblError.Caption := '*Некорректное имя расчетной единицы';
  2: lblError.Caption := '*Общее число студентов равно 0';
  3: lblError.Caption := '*Нет ни одной группы в расч. единице';
  else begin lblError.Caption := ''; IsModified := true; end;
  end;

end;

end.
