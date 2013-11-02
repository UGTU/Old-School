unit uNagruzkaCalcUnitsContingent;
   {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, ImgList, GridsEh,
  DBGridEh, ComCtrls, ToolWin, NagruzkaClasses, NagruzkaController, DB, ADODB, Mask, DBCtrlsEh,
  DBLookupEh;

type
  TfrmNagruzkaCalcUnitsContingent = class(TfrmBaseDialog)
    Panel4: TPanel;
    Panel8: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    DBGridEh2: TDBGridEh;
    Panel3: TPanel;
    Label3: TLabel;
    dbgSpecContingent: TDBGridEh;
    Panel10: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    ImageList1: TImageList;
    Label5: TLabel;
    Label6: TLabel;
    Bevel5: TBevel;
    Bevel2: TBevel;
    Label7: TLabel;
    Label8: TLabel;
    dsCalcUnitsContent: TDataSource;
    dsSpecContingent: TDataSource;
    ToolButton2: TToolButton;
    Panel2: TPanel;
    Label9: TLabel;
    DBGridEh1: TDBGridEh;
    dsCurrentGroupContingent: TDataSource;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    ToolButton3: TToolButton;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Panel5: TPanel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    DBGridEh3: TDBGridEh;
    Label26: TLabel;
    dbcbAnotherShema: TDBLookupComboboxEh;
    dsAnotherCalcUnitContingent: TDataSource;
    dsSepGroupPlanContingent: TDataSource;
    Panel6: TPanel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    DBGridEh4: TDBGridEh;
    ToolButton4: TToolButton;
    procedure dsCalcUnitsContentUpdateData(Sender: TObject);
    procedure ToolButton1MouseEnter(Sender: TObject);
    procedure ToolButton1MouseLeave(Sender: TObject);
    procedure ToolButton2MouseEnter(Sender: TObject);
    procedure ToolButton3MouseEnter(Sender: TObject);
    procedure Panel8MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure dbcbAnotherShemaKeyValueChanged(Sender: TObject);
    procedure ToolButton2MouseLeave(Sender: TObject);
    procedure dsCalcUnitsContentStateChange(Sender: TObject);
    procedure ToolButton4MouseLeave(Sender: TObject);
    procedure ToolButton4MouseEnter(Sender: TObject);
  private
    tempPSYC: TPotokShemaYearContingent;
    fCountOfSeparatedGroups: integer;
    fShemaDecomposeType: integer;
    fNoCheckContingentDistribution: boolean;
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    destructor Destroy; override;
    procedure Read(ShemaOfPotokIK, PotokIK, ShemaDecomposeType: integer; NoCheckContingentDistribution: boolean; ATempPSYC: TPotokShemaYearContingent; specContingent, factGroupContingent, sepGroupContingent: TDataSet);
  end;

var
  frmNagruzkaCalcUnitsContingent: TfrmNagruzkaCalcUnitsContingent;

implementation

uses GeneralController;

{$R *.dfm}

{ TfrmNagruzkaCalcUnitsContingent }

procedure TfrmNagruzkaCalcUnitsContingent.dbcbAnotherShemaKeyValueChanged(
  Sender: TObject);
var
  budget_count, contract_count: integer;
begin
  budget_count:= 0;
  contract_count:= 0;
  dsAnotherCalcUnitContingent.DataSet.Close;
  if dbcbAnotherShema.KeyValue <> NULL then
  begin
    TNagruzkaController.Preparation.GetCalcUnitContingent(@dsAnotherCalcUnitContingent.DataSet, dbcbAnotherShema.KeyValue, tempPSYC.YearIK);
    dsAnotherCalcUnitContingent.DataSet.First;
    while not dsAnotherCalcUnitContingent.DataSet.Eof do
    begin
      budget_count:= budget_count + dsAnotherCalcUnitContingent.DataSet.FieldByName('budget_count').AsInteger;
      contract_count:= contract_count + dsAnotherCalcUnitContingent.DataSet.FieldByName('contract_count').AsInteger;
      dsAnotherCalcUnitContingent.DataSet.Next;
    end;
  end;
  Label23.Caption:= IntToStr(budget_count) + ' ед.';
  Label25.Caption:= IntToStr(contract_count) + ' ед.';
end;

destructor TfrmNagruzkaCalcUnitsContingent.Destroy;
begin
  if dsCalcUnitsContent <> nil then
    if dsCalcUnitsContent.DataSet <> nil then
    begin
      if dsCalcUnitsContent.DataSet.Active then dsCalcUnitsContent.DataSet.Close;
      dsCalcUnitsContent.DataSet.Free;
    end;
  if dsAnotherCalcUnitContingent.DataSet <> nil then
  begin
    if dsAnotherCalcUnitContingent.DataSet.Active then
      dsAnotherCalcUnitContingent.DataSet.Close;
    dsAnotherCalcUnitContingent.DataSet.Free;
  end;
 // TGeneralController.Instance.ReleaseLockupCB(@dbcbAnotherShema);
  inherited;
end;

function TfrmNagruzkaCalcUnitsContingent.DoApply: boolean;
var
  i, budget_count, contract_count, curBudget, curContract: integer;
begin
  if (dsCalcUnitsContent.DataSet.State = dsEdit) then dsCalcUnitsContent.DataSet.Post;
  
  if (fShemaDecomposeType <> 1) and (not fNoCheckContingentDistribution) then  // в случае схемы "Ѕез делени€" данна€ проверка не нужна
  begin
    budget_count:= 0;
    contract_count:= 0;
    curBudget:= 0;
    curContract:= 0;
    dsSpecContingent.DataSet.First;
    while not dsSpecContingent.DataSet.Eof do
    begin
        inc(budget_count, dsSpecContingent.DataSet.FieldByName('budget_count').AsInteger);
        inc(contract_count, dsSpecContingent.DataSet.FieldByName('contract_count').AsInteger);
        dsSpecContingent.DataSet.Next
    end;
    dsSepGroupPlanContingent.DataSet.First;
    while not dsSepGroupPlanContingent.DataSet.Eof do
    begin
        inc(budget_count, dsSepGroupPlanContingent.DataSet.FieldByName('budget_count').AsInteger);
        inc(contract_count, dsSepGroupPlanContingent.DataSet.FieldByName('contract_count').AsInteger);
        dsSepGroupPlanContingent.DataSet.Next
    end;
    dsCalcUnitsContent.DataSet.First;
    while not dsCalcUnitsContent.DataSet.Eof do
    begin
        inc(curBudget, dsCalcUnitsContent.DataSet.FieldByName('budget_count').AsInteger);
        inc(curContract, dsCalcUnitsContent.DataSet.FieldByName('contract_count').AsInteger);
        dsCalcUnitsContent.DataSet.Next
    end;
    if (curBudget <> budget_count) or (curContract <> contract_count) then
    begin
        Application.MessageBox(' онтингент потока распределен не корректно между расчетными единицами!', PChar(Caption), MB_ICONWARNING);
        Result:= false;
        exit;
    end;

    dsSpecContingent.DataSet.First;
    while not dsSpecContingent.DataSet.Eof do
    begin
      if dsSpecContingent.DataSet.FieldByName('Tag').AsInteger = 1 then
      begin
        curBudget:= 0;
        curContract:= 0;
        dsCalcUnitsContent.DataSet.First;
        while not dsCalcUnitsContent.DataSet.Eof do
        begin
          if dsCalcUnitsContent.DataSet.FieldByName('ik_spec_fac').AsInteger = dsSpecContingent.DataSet.FieldByName('ik_spec_fac').AsInteger then
          begin
            inc(curBudget, dsCalcUnitsContent.DataSet.FieldByName('budget_count').AsInteger);
            inc(curContract, dsCalcUnitsContent.DataSet.FieldByName('contract_count').AsInteger);
          end;
          dsCalcUnitsContent.DataSet.Next
        end;
        if (curBudget <> dsSpecContingent.DataSet.FieldByName('budget_count').AsInteger) or (curContract <> dsSpecContingent.DataSet.FieldByName('contract_count').AsInteger) then
        begin
          Application.MessageBox(PChar(' онтингент специальности "' + dsSpecContingent.DataSet.FieldByName('full_name').AsString + '" распределен некорректно между расчетными единицами!'), PChar(Caption), MB_ICONWARNING);
          Result:= false;
          exit;
        end;
      end;
      dsSpecContingent.DataSet.Next;
    end;

    dsSepGroupPlanContingent.DataSet.First;
    while not dsSepGroupPlanContingent.DataSet.Eof do
    begin
      if dsSepGroupPlanContingent.DataSet.FieldByName('Tag').AsInteger = 1 then
      begin
        curBudget:= 0;
        curContract:= 0;
        dsCalcUnitsContent.DataSet.First;
        while not dsCalcUnitsContent.DataSet.Eof do
        begin
          if dsCalcUnitsContent.DataSet.FieldByName('ik_grup').AsInteger = dsSepGroupPlanContingent.DataSet.FieldByName('ik_grup').AsInteger then
          begin
            inc(curBudget, dsCalcUnitsContent.DataSet.FieldByName('budget_count').AsInteger);
            inc(curContract, dsCalcUnitsContent.DataSet.FieldByName('contract_count').AsInteger);
          end;
          dsCalcUnitsContent.DataSet.Next;
        end;
        if (curBudget <> dsSepGroupPlanContingent.DataSet.FieldByName('budget_count').AsInteger) or (curContract <> dsSepGroupPlanContingent.DataSet.FieldByName('contract_count').AsInteger) then
        begin
          Application.MessageBox(PChar(' онтингент группы "' + dsSepGroupPlanContingent.DataSet.FieldByName('cName_grup').AsString + '" распределен некорректно между расчетными единицами!'), PChar(Caption), MB_ICONWARNING);
          Result:= false;
          exit;
        end;
      end;
      dsSepGroupPlanContingent.DataSet.Next;
    end;
  end;


  for I := 0 to tempPSYC.CalcUnitCount - 1 do
    if dsCalcUnitsContent.DataSet.Locate('cName_calc_unit', tempPSYC.CalcUnitContingent[i].CalcUnitName, [loPartialKey]) then
    begin
      tempPSYC.CalcUnitContingent[i].StudentBudget:= dsCalcUnitsContent.DataSet.FieldByName('budget_count').AsInteger;
      tempPSYC.CalcUnitContingent[i].StudentContract:= dsCalcUnitsContent.DataSet.FieldByName('contract_count').AsInteger;
    end;
  Result:= true;
  IsModified:= false;
end;

function TfrmNagruzkaCalcUnitsContingent.DoCancel: boolean;
begin
  Result:= false;
  case (Application.MessageBox('—охранить внесенные изменени€?',PChar(Caption), MB_YESNOCANCEL)) of
      mrYes: OK;
      mrNo: Result:= true;
  end;
end;

procedure TfrmNagruzkaCalcUnitsContingent.dsCalcUnitsContentStateChange(
  Sender: TObject);
begin
  IsModified:= true;
end;

procedure TfrmNagruzkaCalcUnitsContingent.dsCalcUnitsContentUpdateData(
  Sender: TObject);
var
  budgetCount, contractCount: integer;
  book: Pointer;
begin
  budgetCount:= 0;
  contractCount:= 0;
  dsCalcUnitsContent.DataSet.DisableControls;
  book:= dsCalcUnitsContent.DataSet.GetBookmark;
  dsCalcUnitsContent.DataSet.First;
  while not dsCalcUnitsContent.DataSet.Eof do
  begin
    inc(budgetCount, dsCalcUnitsContent.DataSet.FieldByName('budget_count').AsInteger);
    inc(contractCount, dsCalcUnitsContent.DataSet.FieldByName('contract_count').AsInteger);
    dsCalcUnitsContent.DataSet.Next;
  end;
  Label6.Caption:= IntToStr(budgetCount) + ' чел.';
  Label8.Caption:= IntToStr(contractCount) + ' чел.';
  dsCalcUnitsContent.DataSet.GotoBookmark(book);
  dsCalcUnitsContent.DataSet.EnableControls;
  IsModified:= true;
end;


procedure TfrmNagruzkaCalcUnitsContingent.Panel8MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if Panel5.Visible then
  begin
    Panel5.Visible:= false;
    ToolButton3.Down:= Panel5.Visible;
  end;
end;

procedure TfrmNagruzkaCalcUnitsContingent.Read(ShemaOfPotokIK, PotokIK, ShemaDecomposeType: integer; NoCheckContingentDistribution: boolean;
  ATempPSYC: TPotokShemaYearContingent; specContingent, factGroupContingent, sepGroupContingent: TDataSet);
var
  i, budget, contract: integer;
begin
  fNoCheckContingentDistribution:= NoCheckContingentDistribution;
  tempPSYC:= ATempPSYC;
  fShemaDecomposeType:= ShemaDecomposeType;
  fCountOfSeparatedGroups:= TNagruzkaController.Preparation.CountOfSeparatedGroupsInPotok(PotokIK);
  dsAnotherCalcUnitContingent.DataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  TGeneralController.Instance.InitializeLockupCB(@dbcbAnotherShema, 'ik_shema_of_potok', 'cName_shema');
  TNagruzkaController.Preparation.GetAllShemasOfPotok(@dbcbAnotherShema.ListSource.DataSet, PotokIK);
  dbcbAnotherShema.ListSource.DataSet.Locate('ik_decompose_type', 2, [loPartialKey]);
  dbcbAnotherShema.KeyValue:= dbcbAnotherShema.ListSource.DataSet.FieldByName('ik_shema_of_potok').Value;
  
  Label2.Caption:= tempPSYC.YearName;
  dsSpecContingent.DataSet:= specContingent;
  dsCurrentGroupContingent.DataSet:= factGroupContingent;
  dsSepGroupPlanContingent.DataSet:= sepGroupContingent;

  dsSpecContingent.DataSet.First;
  budget:= 0;
  contract:= 0;
  while not dsSpecContingent.DataSet.Eof do
  begin
    budget:= budget + dsSpecContingent.DataSet.FieldByName('budget_count').AsInteger;
    contract:= contract + dsSpecContingent.DataSet.FieldByName('contract_count').AsInteger;
    dsSpecContingent.DataSet.Next;
  end;
  Label12.Caption:= IntToStr(budget) + ' чел.';
  Label14.Caption:= IntToStr(contract) + ' чел.';

  dsCurrentGroupContingent.DataSet.First;
  budget:= 0;
  contract:= 0;
  while not dsCurrentGroupContingent.DataSet.Eof do
  begin
    budget:= budget + dsCurrentGroupContingent.DataSet.FieldByName('budget_count').AsInteger;
    contract:= contract + dsCurrentGroupContingent.DataSet.FieldByName('contract_count').AsInteger;
    dsCurrentGroupContingent.DataSet.Next;
  end;
  Label17.Caption:= IntToStr(budget) + ' чел.';
  Label19.Caption:= IntToStr(contract) + ' чел.';

  dsSepGroupPlanContingent.DataSet.First;
  budget:= 0;
  contract:= 0;
  while not dsSepGroupPlanContingent.DataSet.Eof do
  begin
    budget:= budget + dsSepGroupPlanContingent.DataSet.FieldByName('budget_count').AsInteger;
    contract:= contract + dsSepGroupPlanContingent.DataSet.FieldByName('contract_count').AsInteger;
    dsSepGroupPlanContingent.DataSet.Next;
  end;
  Label30.Caption:= IntToStr(budget) + ' чел.';
  Label32.Caption:= IntToStr(contract) + ' чел.';

  dsCalcUnitsContent.DataSet:= TGeneralController.Instance.GetNewADODataSet(true);
  (dsCalcUnitsContent.DataSet as TADODataSet).CommandText:= 'Select ik_spec_fac, Relation_calc_unit_grup.ik_grup, Calc_unit.cName_calc_unit, Calc_unit_contingent.* From Calc_unit INNER JOIN Calc_unit_contingent ON Calc_unit.ik_calc_unit = Calc_unit_contingent.ik_calc_unit ' +
    'INNER JOIN Relation_calc_unit_grup ON Calc_unit.ik_calc_unit = Relation_calc_unit_grup.ik_calc_unit INNER JOIN Grup ON Relation_calc_unit_grup.ik_grup = Grup.ik_grup Where (Calc_unit.ik_shema_of_potok =' + IntToStr(ShemaOfPotokIK) + ') and (ik_year = ' + IntToStr(tempPSYC.YearIK) + ')';
  dsCalcUnitsContent.DataSet.Open;
  while not dsCalcUnitsContent.DataSet.Eof do
      dsCalcUnitsContent.DataSet.Delete;
  for I := 0 to tempPSYC.CalcUnitCount - 1 do
  begin
    dsCalcUnitsContent.DataSet.Insert;
    if tempPSYC.CalcUnitContingent[i].SpecIK <> NULL then
      dsCalcUnitsContent.DataSet.FieldByName('ik_spec_fac').Value:= tempPSYC.CalcUnitContingent[i].SpecIK;
    if tempPSYC.CalcUnitContingent[i].GrupIK <> NULL then
      dsCalcUnitsContent.DataSet.FieldByName('ik_grup').Value:= tempPSYC.CalcUnitContingent[i].GrupIK;
    dsCalcUnitsContent.DataSet.FieldByName('cName_calc_unit').AsString:= tempPSYC.CalcUnitContingent[i].CalcUnitName;
    dsCalcUnitsContent.DataSet.FieldByName('budget_count').AsInteger:= tempPSYC.CalcUnitContingent[i].StudentBudget;
    dsCalcUnitsContent.DataSet.FieldByName('contract_count').AsInteger:= tempPSYC.CalcUnitContingent[i].StudentContract;
    dsCalcUnitsContent.DataSet.Post;
  end;
  IsModified:= false;
end;

procedure TfrmNagruzkaCalcUnitsContingent.ToolButton1MouseEnter(
  Sender: TObject);
begin  
  Panel3.Visible:= true;
  ToolButton1.Down:= Panel3.Visible;
  Panel5.Visible:= false;
  ToolButton3.Down:= Panel5.Visible;
end;

procedure TfrmNagruzkaCalcUnitsContingent.ToolButton1MouseLeave(
  Sender: TObject);
begin
  Panel3.Visible:= false;
  ToolButton1.Down:= Panel3.Visible;
end;

procedure TfrmNagruzkaCalcUnitsContingent.ToolButton2MouseEnter(
  Sender: TObject);
begin
  Panel2.Visible:= true;
  ToolButton2.Down:= Panel2.Visible;
  Panel5.Visible:= false;
  ToolButton3.Down:= Panel5.Visible;
end;

procedure TfrmNagruzkaCalcUnitsContingent.ToolButton2MouseLeave(
  Sender: TObject);
begin
  Panel2.Visible:= false;
  ToolButton2.Down:= Panel2.Visible;
end;

procedure TfrmNagruzkaCalcUnitsContingent.ToolButton3MouseEnter(
  Sender: TObject);
begin
  Panel5.Visible:= true;
  ToolButton3.Down:= Panel5.Visible;
end;

procedure TfrmNagruzkaCalcUnitsContingent.ToolButton4MouseEnter(
  Sender: TObject);
begin
  Panel5.Visible:= false;
  ToolButton3.Down:= Panel5.Visible;
  Panel6.Visible:= true;
  ToolButton4.Down:= Panel6.Visible;
end;

procedure TfrmNagruzkaCalcUnitsContingent.ToolButton4MouseLeave(
  Sender: TObject);
begin
  Panel6.Visible:= false;
  ToolButton4.Down:= Panel6.Visible;
end;

end.
