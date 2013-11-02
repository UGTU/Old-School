unit uNagruzkaEditPotokSemesterShemes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, DBGridEh,
  GridsEh, Mask, DBCtrlsEh, DBLookupEh, NagruzkaController, NagruzkaClasses, GeneralController,
  ImgList, ComCtrls, ToolWin, DB, ADODB,Contnrs, Grids;

type
  TfrmNagruzkaEditPotokSemShemes = class(TfrmBaseDialog)
    Panel2: TPanel;
    Panel3: TPanel;
    dbcbDecomposeType: TDBLookupComboboxEh;
    Label8: TLabel;
    dbgShemas: TDBGridEh;
    Label14: TLabel;
    dbgShemaContent: TDBGridEh;
    Label1: TLabel;
    Panel6: TPanel;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    ToolBar3: TToolBar;
    ToolButton3: TToolButton;
    ImageList1: TImageList;
    Panel4: TPanel;
    ToolBar4: TToolBar;
    ToolButton1: TToolButton;
    ToolBar5: TToolBar;
    ToolButton4: TToolButton;
    dsShemas: TDataSource;
    dsCalcUnits: TDataSource;
    ToolBar6: TToolBar;
    ToolButton5: TToolButton;
    actAddShema: TAction;
    actDelShema: TAction;
    actAddCalcUnit: TAction;
    actDelCalcUnit: TAction;
    actEditCalcUnit: TAction;
    ToolBar2: TToolBar;
    ToolButton6: TToolButton;
    actAutoCompleteUnit: TAction;
    Panel5: TPanel;
    Label3: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label2: TLabel;
    ToolBar7: TToolBar;
    ToolButton7: TToolButton;
    ImageList2: TImageList;
    dbgSpecContingent: TDBGridEh;
    dsSpecContingent: TDataSource;
    ToolBar8: TToolBar;
    ToolButton8: TToolButton;
    Panel7: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label15: TLabel;
    DBGridEh1: TDBGridEh;
    dsCurrentGroupContingent: TDataSource;
    procedure dbcbDecomposeTypeKeyValueChanged(Sender: TObject);
    procedure dbgShemasCellClick(Column: TColumnEh);
    procedure actAddShemaExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actDelShemaExecute(Sender: TObject);
    procedure actEditCalcUnitExecute(Sender: TObject);
    procedure actAddCalcUnitExecute(Sender: TObject);
    procedure dbgShemasColumns0UpdateData(Sender: TObject; var Text: string;
      var Value: Variant; var UseText, Handled: Boolean);
    procedure actDelCalcUnitExecute(Sender: TObject);
    procedure actAutoCompleteUnitExecute(Sender: TObject);
    procedure ToolButton7MouseEnter(Sender: TObject);
    procedure ToolButton7MouseLeave(Sender: TObject);
    procedure ToolButton8MouseEnter(Sender: TObject);
    procedure ToolButton8MouseLeave(Sender: TObject);

  private
    { Private declarations }
    fPotokUchPlanIK: integer;
    fPotokIK: integer;
    fPotokName: string;
    fYearIK: integer;
    fPotokShemas: TPotokSemesterShemas;
    fCalcUnits: TSemesterCalcUnits;
    fCurrentShema: TPotokSemesterShema;
    fGUID: integer; //индексы для новых схем
    fCalcGUID: integer; //индексы для новых расч. единиц
    fPotokShemaContingent: TPlanPotokInfos;
    procedure FilterShemas(aType: integer);
    procedure CheckEnableShema;
    procedure FilterCalcUnits(aShema: integer);
    procedure SetCurrentShema(const Value: integer);
   // procedure UpdateModifiedState;
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    { Public declarations }
    property YearIK: integer read fYearIK write fYearIK;
    property PotokName: string read fPotokName write fPotokName;
    property ShemaIK: integer write SetCurrentShema;
    destructor Destroy; override;
    procedure SetPotok(aPotokIK: integer);
    procedure Read;
  end;

var
  frmNagruzkaEditPotokSemShemes: TfrmNagruzkaEditPotokSemShemes;

implementation

uses uNagruzkaCalcUnits;

{$R *.dfm}

{ TfrmNagruzkaEditPotokSemShemes }

procedure TfrmNagruzkaEditPotokSemShemes.actAddCalcUnitExecute(Sender: TObject);
begin
  inherited;
  frmNagruzkaCalcUnits:= TfrmNagruzkaCalcUnits.CreateDialog(Application, self.Connection, nil);
  try
    frmNagruzkaCalcUnits.IK:= fCalcGUID;
    dec(fCalcGUID);
    frmNagruzkaCalcUnits.ShemaIK := fCurrentShema.IK;//(dsShemas.DataSet as TADODataSet).FieldByName('ik_shema').AsInteger;
    frmNagruzkaCalcUnits.PotokSemesterIK := ik;
    frmNagruzkaCalcUnits.Caption:= 'Добавление расчетной единицы';
    frmNagruzkaCalcUnits.Tag := 1;
    frmNagruzkaCalcUnits.Read;

    if (frmNagruzkaCalcUnits.ShowModal() = mrOk) or (frmNagruzkaCalcUnits.bbApply.Tag = 1) then
    with frmNagruzkaCalcUnits.CalcUnit do
    begin

      dbgShemaContent.DataSource.DataSet.Append;
      dbgShemaContent.DataSource.DataSet.FieldByName('ik_calc_unit').Value := ik;
      dbgShemaContent.DataSource.DataSet.FieldByName('cName_calc_unit').Value := name;
      dbgShemaContent.DataSource.DataSet.FieldByName('ik_shema').Value := ShemaIK;
      dbgShemaContent.DataSource.DataSet.FieldByName('budget_count').Value := budget;
      dbgShemaContent.DataSource.DataSet.FieldByName('contract_count').Value := contract;
      dbgShemaContent.DataSource.DataSet.FieldByName('gname').Value := GroupsName;
      dbgShemaContent.DataSource.DataSet.Post;

      fCurrentShema.addCalcUnit(TSemesterCalcUnit.Create(ik,name,shemaik,potoksemesterik,budget,contract));
      fCurrentShema.CalcUnitList.Items[fCurrentShema.CalcUnitList.Count - 1].CopyGroups(Groups);

      CheckEnableShema;
      IsModified := true;
    end;
  finally
    frmNagruzkaCalcUnits.Free;
  end;
end;

procedure TfrmNagruzkaEditPotokSemShemes.actAddShemaExecute(Sender: TObject);
begin
  inherited;
  dsShemas.DataSet.Append;
  dsShemas.DataSet.FieldByName('ik_shema_of_potok').Value := fGUID;
  dsShemas.DataSet.FieldByName('ik_decompose_type').Value:= dbcbDecomposeType.KeyValue;
  dsShemas.DataSet.FieldByName('ik_potok_semestr').Value:= IntToStr(Self.IK);
  dsShemas.DataSet.FieldByName('Name_shema').Value:= dbcbDecomposeType.Text;
  dsShemas.DataSet.Post;

  fPotokShemas.Add(TPotokSemesterShema.Create(fGUID,dbcbDecomposeType.KeyValue,Self.IK,dbcbDecomposeType.Text));
  fCurrentShema := fPotokShemas.ItemByID(fGUID);
  dec(fGUID);
  FilterCalcUnits(fCurrentShema.IK);
  IsModified := true;
  CheckEnableShema;
end;

procedure TfrmNagruzkaEditPotokSemShemes.actAutoCompleteUnitExecute(
  Sender: TObject);
var i, j, k, g, x, tBudget,tContract: integer;
   tempCalcUnit: TSemesterCalcUnit;
   basicCount,lastCount: integer;
   tName: string;

begin
   //fCurrentShema.CalcUnitList.Clear;
   dsCalcUnits.DataSet.First;
   while not dsCalcUnits.DataSet.Eof do dsCalcUnits.DataSet.Delete;
   fCurrentShema.CalcUnitList :=
        TNagruzkaController.Preparation.GetAutoCalcUnits(IK,fCurrentShema.DecomposeTypeIK,fCurrentShema.IK);
   fCurrentShema.IsModified := true;

   if fCurrentShema.CalcUnitList.Count>0 then
   begin
     for I := 0 to fCurrentShema.CalcUnitList.Count - 1 do
     with fCurrentShema.CalcUnitList.Items[i] do
     begin
       dbgShemaContent.DataSource.DataSet.Insert;
       dbgShemaContent.DataSource.DataSet.FieldByName('ik_calc_unit').Value := ik;
       dbgShemaContent.DataSource.DataSet.FieldByName('cName_calc_unit').Value := name;
       dbgShemaContent.DataSource.DataSet.FieldByName('ik_shema').Value := ShemaIK;
       dbgShemaContent.DataSource.DataSet.FieldByName('budget_count').Value := budget;
       dbgShemaContent.DataSource.DataSet.FieldByName('contract_count').Value := contract;
       dbgShemaContent.DataSource.DataSet.FieldByName('gname').Value := GroupsName;
       dbgShemaContent.DataSource.DataSet.Post;
     end;
     IsModified := true;
   end else
     Application.MessageBox(PChar('Не удалось определить ожидаемый контингент для текущей схемы!' + #10#13 + 'Возможно на выбранный год для данной схемы деления не введено количество расчетных единиц.'), PChar(Caption), MB_ICONWARNING);

end;

procedure TfrmNagruzkaEditPotokSemShemes.actDelCalcUnitExecute(Sender: TObject);
begin
  inherited;
  with fCurrentShema.CalcUnitList do
  Delete(IndexByID(dsCalcUnits.DataSet.FieldByName('ik_calc_unit').AsInteger));
  fCurrentShema.IsModified := true;
  dsCalcUnits.DataSet.Delete;
  IsModified := true;
  CheckEnableShema;
end;

procedure TfrmNagruzkaEditPotokSemShemes.actDelShemaExecute(Sender: TObject);
begin
  fPotokShemas.Delete(fPotokShemas.IndexByID(dsShemas.DataSet.FieldByName('ik_shema').AsInteger));
  dsCalcUnits.DataSet.First;
  while not dsCalcUnits.DataSet.Eof do
    dsCalcUnits.DataSet.Delete;
  dsShemas.DataSet.Delete;
  IsModified := true;
  CheckEnableShema;
end;

procedure TfrmNagruzkaEditPotokSemShemes.actEditCalcUnitExecute(
  Sender: TObject);
begin
  inherited;
  frmNagruzkaCalcUnits:= TfrmNagruzkaCalcUnits.CreateDialog(Application, self.Connection, nil);
  try
      frmNagruzkaCalcUnits.Caption:= 'Редактирование расчетной единицы "' + (dsCalcUnits.DataSet as TADODataSet).FieldByName('cName_calc_unit').AsString + '"';
      frmNagruzkaCalcUnits.Tag := 2;
      frmNagruzkaCalcUnits.Read(fCurrentShema.CalcUnitList.ItemByID((dsCalcUnits.DataSet as TADODataSet).FieldByName('ik_calc_unit').AsInteger));
  if (frmNagruzkaCalcUnits.ShowModal() = mrOk) or (frmNagruzkaCalcUnits.bbApply.Tag = 1) then
  begin
    fCurrentShema.CalcUnitList.ItemByID((dsCalcUnits.DataSet as TADODataSet).FieldByName('ik_calc_unit').AsInteger).Modify(frmNagruzkaCalcUnits.CalcUnit);
    dsCalcUnits.DataSet.Edit;
    dsCalcUnits.DataSet.FieldByName('cName_calc_unit').Value := frmNagruzkaCalcUnits.CalcUnit.name;
    dsCalcUnits.DataSet.FieldByName('budget_count').Value := frmNagruzkaCalcUnits.CalcUnit.budget;
    dsCalcUnits.DataSet.FieldByName('contract_count').Value := frmNagruzkaCalcUnits.CalcUnit.contract;
    dsCalcUnits.DataSet.FieldByName('gname').Value := frmNagruzkaCalcUnits.CalcUnit.GroupsName;
    IsModified := true;
    fCurrentShema.IsModified := true;
  end;
  finally
    frmNagruzkaCalcUnits.Free;
  end;
end;

procedure TfrmNagruzkaEditPotokSemShemes.CheckEnableShema;
begin
  ToolButton2.Enabled := (dbcbDecomposeType.KeyValue <> NULL);
  ToolButton3.Enabled := (dsShemas.DataSet.RecordCount  <> 0);
  ToolButton1.Enabled := (dsShemas.DataSet.RecordCount  <> 0);
  ToolButton4.Enabled := (dsCalcUnits.DataSet.RecordCount  <> 0);
  ToolButton5.Enabled := (dsCalcUnits.DataSet.RecordCount  <> 0);
  dbgShemas.ReadOnly := (dsShemas.DataSet.RecordCount = 0);

end;

procedure TfrmNagruzkaEditPotokSemShemes.dbcbDecomposeTypeKeyValueChanged(
  Sender: TObject);
begin
  if dbcbDecomposeType.KeyValue <> NULL then
  begin
    FilterShemas(dbcbDecomposeType.KeyValue);
    FilterCalcUnits(dsShemas.DataSet.FieldByName('ik_shema').AsInteger);
    fCurrentShema := fPotokShemas.ItemByID(dsShemas.DataSet.FieldByName('ik_shema').AsInteger);
    CheckEnableShema;
  end;
end;

procedure TfrmNagruzkaEditPotokSemShemes.dbgShemasCellClick(Column: TColumnEh);
begin
 // inherited;

   fCurrentShema := fPotokShemas.ItemByID(dsShemas.DataSet.FieldByName('ik_shema').AsInteger);
   //если новая схема
   if fCurrentShema=nil then fCurrentShema := fPotokShemas.ItemByID(dsShemas.DataSet.FieldByName('ik_shema_of_potok').AsInteger);
   FilterCalcUnits(fCurrentShema.IK);

   CheckEnableShema;
end;

procedure TfrmNagruzkaEditPotokSemShemes.dbgShemasColumns0UpdateData(
  Sender: TObject; var Text: string; var Value: Variant; var UseText,
  Handled: Boolean);
begin
   IsModified := true;
   fCurrentShema.ChangeName(Value);
end;

destructor TfrmNagruzkaEditPotokSemShemes.Destroy;
begin

  dsShemas.DataSet.Close;
  dsShemas.DataSet.Free;
  dsCalcUnits.DataSet.Close;
  dsCalcUnits.DataSet.Free;

  TGeneralController.Instance.ReleaseLockupCB(@dbcbDecomposeType);

  fCalcUnits.Clear;
  fCalcUnits.Free;
  fPotokShemas.Clear;
  fPotokShemas.Free;
  fPotokShemaContingent.Clear;
  fPotokShemaContingent.Destroy;
  dsSpecContingent.DataSet.Close;
  dsSpecContingent.DataSet.Free;
  dsCurrentGroupContingent.DataSet.Close;
  dsCurrentGroupContingent.DataSet.Free;
  inherited;
end;

function TfrmNagruzkaEditPotokSemShemes.DoApply: boolean;
begin
  Result:= TNagruzkaController.Preparation.SavePotokSemesterShema(IK,fPotokShemas);
  if Result then
  begin
    if Result then IsModified:= false;
  end;
end;

function TfrmNagruzkaEditPotokSemShemes.DoCancel: boolean;
begin
 Result:= false;
  case (Application.MessageBox('Сохранить внесенные изменения?',PChar(Caption), MB_YESNOCANCEL)) of
      mrYes: OK;
      mrNo: Result:= true;
  end;
end;

procedure TfrmNagruzkaEditPotokSemShemes.FilterCalcUnits(aShema: integer);
var tempShema: string;
begin

  (dsCalcUnits.DataSet as TADODataSet).Filter:= 'ik_shema = ' + IntToStr(aShema) ;
  (dsCalcUnits.DataSet as TADODataSet).Filtered := true;
end;

procedure TfrmNagruzkaEditPotokSemShemes.FilterShemas(aType: integer);
begin
  (dsShemas.DataSet as TADODataSet).Filter :='ik_decompose_type='+ IntToStr(aType);
  (dsShemas.DataSet as TADODataSet).Filtered := true;
end;

procedure TfrmNagruzkaEditPotokSemShemes.FormShow(Sender: TObject);
begin
  dbcbDecomposeType.SetFocus;
end;

procedure TfrmNagruzkaEditPotokSemShemes.Read;
var
  tempDataSet, GrupDataSet: TADODataSet;
  i, budget, contract: integer;
  tempCalc: TSemesterCalcUnit;
begin
  fGUID := -1;
  fCalcGUID := -1;
  fPotokShemas := TPotokSemesterShemas.Create;
  fCalcUnits := TSemesterCalcUnits.Create;

  fPotokUchPlanIK:= TNagruzkaController.Preparation.GetDefaultUchPlanForPotok(fPotokIK);
  TGeneralController.Instance.InitializeLockupCB(@dbcbDecomposeType, 'ik_decompose_type', 'cName_decompose');
  TNagruzkaController.Directory.GetAllDecomposeType(@dbcbDecomposeType.ListSource.DataSet, false);
  dsShemas.DataSet:= TGeneralController.Instance.GetNewADODataSet(true);
  dsCalcUnits.DataSet:= TGeneralController.Instance.GetNewADODataSet(true);
  tempDataSet := TGeneralController.Instance.GetNewADODataSet(true);
  GrupDataSet := TGeneralController.Instance.GetNewADODataSet(true);
  dsCurrentGroupContingent.DataSet := TGeneralController.Instance.GetNewADODataSet(true);
//  dsSpecContingent.DataSet := TGeneralController.Instance.GetNewADODataSet(true);

  //загрузить плановый контингент
  tempDataSet.Close;
  try
   fPotokShemaContingent := TNagruzkaController.Preparation.GetPlanContingent(Self.IK,tempDataSet);

  (dsShemas.DataSet as TADODataSet).CommandText:= 'SELECT * FROM Potok_semestr_shema WHERE ik_potok_semestr = ' + IntToStr(Self.IK);
  (dsShemas.DataSet as TADODataSet).Open;

  (dsCalcUnits.DataSet as TADODataSet).CommandText:= 'select * from [dbo].[Nagr_ShemaInfo](' + IntToStr(Self.IK)+')';
  (dsCalcUnits.DataSet as TADODataSet).Open;
   //загрузить коллекцию всех схем
     dsShemas.DataSet.First;
     with dsShemas.DataSet do
     while not Eof do
     begin
       fPotokShemas.Add(TPotokSemesterShema.Create(FieldByName('ik_shema').AsInteger,FieldByName('ik_decompose_type').AsInteger,
                                                FieldByName('ik_potok_semestr').AsInteger,FieldByName('Name_shema').AsString));
       Next;
     end;

   //загрузить коллекцию расчетных единиц
   dsCalcUnits.DataSet.First;
     with dsCalcUnits.DataSet do
     while not Eof do
     begin
       tempCalc := TSemesterCalcUnit.Create(FieldByName('ik_calc_unit').AsInteger, FieldByName('cName_calc_unit').AsString,
                                            FieldByName('ik_shema').AsInteger,IK,FieldByName('budget_count').AsInteger,FieldByName('contract_count').AsInteger);
       GrupDataSet.Close;
       GrupDataSet.CommandText := 'select Cname_grup,Grup.Ik_grup from Calc_unit_grup,Grup where Grup.Ik_grup = Calc_unit_grup.Ik_grup and ik_calc_unit='+FieldByName('ik_calc_unit').AsString;
       GrupDataSet.Open;
       while not GrupDataSet.Eof do
       begin
         tempCalc.AddGroup(GrupDataSet.FieldByName('Ik_grup').AsInteger,GrupDataSet.FieldByName('Cname_grup').AsString);
         GrupDataSet.Next;
       end;
       fPotokShemas.ItemByID(dsCalcUnits.DataSet.FieldByName('ik_shema').AsInteger).addCalcUnit(tempCalc);
       Next;
     end;

   if ((dsShemas.DataSet as TADODataSet).RecordCount>0) then
   begin
     (dsShemas.DataSet as TADODataSet).First;
     dbcbDecomposeType.KeyValue := (dsShemas.DataSet as TADODataSet).FieldByName('ik_decompose_type').AsInteger;
     FilterShemas(dbcbDecomposeType.KeyValue);
     dsShemas.DataSet.First;
     FilterCalcUnits((dsShemas.DataSet as TADODataSet).FieldByName('ik_shema').AsInteger);
   end;

   //заполнение таблицы с плановым контингентом
   budget := 0;
   contract := 0;
   dsSpecContingent.DataSet := tempDataSet;
   for I := 1 to fPotokShemaContingent.Count do
   begin
     budget:= budget + fPotokShemaContingent.Items[i-1].Budget;
     contract:= contract + fPotokShemaContingent.Items[i-1].Contract;
   end;
  Label12.Caption := IntToStr(budget);
  Label2.Caption := IntToStr(contract);

  //заполнение таблицы с реальным контингентом в группах
   budget := 0;
   contract := 0;
  (dsCurrentGroupContingent.DataSet as TADODataSet).Close;
  (dsCurrentGroupContingent.DataSet as TADODataSet).CommandText := 'select * from [dbo].[Nagr_GetCalcUnitGroup] ('+IntToStr(IK)+',-1)';
  (dsCurrentGroupContingent.DataSet as TADODataSet).Open;
   dsCurrentGroupContingent.DataSet.First;
   while not dsCurrentGroupContingent.DataSet.Eof do
   begin
     budget := budget + dsCurrentGroupContingent.DataSet.FieldByName('budgCount').AsInteger;
     contract:= contract + dsCurrentGroupContingent.DataSet.FieldByName('contrCount').AsInteger;
     dsCurrentGroupContingent.DataSet.Next;
   end;
   Label7.Caption := IntToStr(budget);
   Label15.Caption := IntToStr(contract);

  CheckEnableShema;
  IsModified := false;
  finally
     GrupDataSet.Close;
     GrupDataSet.Free;
  end;
end;

procedure TfrmNagruzkaEditPotokSemShemes.SetCurrentShema(const Value: integer);
var tempDS: TADODataSet;
begin
   if Value<>-1 then
   begin
   tempDS := TGeneralController.Instance.GetNewADODataSet(false);
   tempDS.CommandText := 'Select pss.*,Potok.Cname_potok,ps.id_year from Potok_semestr_shema pss,Potok_semestr ps,Potok where pss.ik_potok_semestr = ps.ik_potok_semestr and ps.id_potok = Potok.ik_potok and ik_shema='+IntToStr(Value);
   tempDS.Open;

    IK:= tempDS.FieldByName('ik_potok_semestr').AsInteger;
    PotokName := tempDS.FieldByName('Cname_potok').AsString;
    YearIK := tempDS.FieldByName('id_year').AsInteger;
    Caption:= 'Редактирование схем деления для потока "' + tempDS.FieldByName('Cname_potok').AsString + '"';
    Read;

   dbcbDecomposeType.KeyValue := tempDS.FieldByName('ik_decompose_type').AsInteger;
   dsShemas.DataSet.First;
   while not dsShemas.DataSet.Eof do
   begin
     if (dsShemas.DataSet as TADODataSet).FieldByName('ik_shema').AsInteger = Value then
       break;
     dsShemas.DataSet.Next;
   end;

   tempDS.Close;
   tempDS.Free;
   end;
end;

procedure TfrmNagruzkaEditPotokSemShemes.SetPotok(aPotokIK: integer);
begin
  fPotokIK := aPotokIK;
end;

procedure TfrmNagruzkaEditPotokSemShemes.ToolButton7MouseEnter(Sender: TObject);
begin
  Panel5.Visible := true;
  ToolButton7.Down:= Panel5.Visible;
end;

procedure TfrmNagruzkaEditPotokSemShemes.ToolButton7MouseLeave(Sender: TObject);
begin
  Panel5.Visible := false;
  ToolButton7.Down:= Panel5.Visible;
end;

procedure TfrmNagruzkaEditPotokSemShemes.ToolButton8MouseEnter(Sender: TObject);
begin
  Panel7.Visible := true;
  ToolButton8.Down:= Panel7.Visible;

end;

procedure TfrmNagruzkaEditPotokSemShemes.ToolButton8MouseLeave(Sender: TObject);
begin
  Panel7.Visible := false;
  ToolButton8.Down:= Panel7.Visible;
end;

end.
