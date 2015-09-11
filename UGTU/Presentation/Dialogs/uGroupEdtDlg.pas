unit uGroupEdtDlg;
   {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, StdCtrls, DBCtrlsEh, Mask, ActnList, Buttons,
  ExtCtrls, DBGridEh, DBLookupEh, DateUtils, UchPlanController, GeneralController,
  NagruzkaController,Grids, DBGrids, DB, ADODB, System.Actions;

type
  TfrmGroupEdt = class(TfrmBaseDialog)
    Panel2: TPanel;
    edtName: TDBEditEh;
    dbneYear: TDBNumberEditEh;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dblcbUchPln: TDBLookupComboboxEh;
    Label45: TLabel;
    Label4: TLabel;
    CheckBox1: TCheckBox;
    Label6: TLabel;
    dbdteCreate: TDBDateTimeEditEh;
    Label7: TLabel;
    dbdteExit: TDBDateTimeEditEh;
    Panel3: TPanel;
    Label5: TLabel;
    dsSpec: TDataSource;
    dbcbSpec: TDBLookupComboboxEh;
    pnlProfile: TPanel;
    Label8: TLabel;
    dbcbProfile: TDBLookupComboboxEh;
    lblTemplate: TLabel;

    procedure FormShow(Sender: TObject);
    procedure dblcbUchPlnChange(Sender: TObject);
    procedure dbneYearChange(Sender: TObject);
    procedure edtNameChange(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure dbcbSpecKeyValueChanged(Sender: TObject);
    procedure dbcbProfileKeyValueChanged(Sender: TObject);
  private
    bEdit: boolean;
    fSpecFacIK: integer;
    procedure ChangeGroupName;
    procedure LoadUchPlan(aSpecFacIK: integer);
    procedure LoadProfile;
    procedure SetEditStatus(aEdit: boolean);
    procedure uchPlanModify;
    procedure SetSpecFacIK(const Value: integer);
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;

  public
    { Public declarations }
    IK,FacIK: Integer;

    FParentUchPlan, FUchPlan: integer;
    WithSpec: boolean;
    VidGos: integer;
    property SpecFacIK: integer read fSpecFacIK write SetSpecFacIK; //fSpecFacIK;
    property Edit: Boolean write SetEditStatus;
    procedure AddRead;
    procedure EditRead;
  end;

var
  frmGroupEdt: TfrmGroupEdt;


implementation

uses uDM, DBTVgroupObj, DBTVSpecObj, DBTVFacObj, uGroup,
  uSpec,ABIT_zachislenie_frame, uDMGroupActions, uMain, uDMUgtuStructure,
  ConstantRepository, CommonIntf, CommonIntfImpl, ExceptionBase;

{$R *.dfm}


procedure TfrmGroupEdt.FormShow(Sender: TObject);
begin
  inherited;

  //if not WithSpec then SpecFacIK := TDBNodeSpecObject(frmMain.DBDekTreeView_TEST1.SelectedObject).ik;
 
  Panel3.Visible := (WithSpec);
  //подгружаем специальности
  if (WithSpec) then
  begin
    TGeneralController.Instance.InitializeLockupCB(@dbcbSpec, 'ik_spec_fac', 'Cname_spec');
    TNagruzkaController.PlanNagruzka.GetSpecByFac(@dbcbSpec.ListSource.DataSet, FacIK, false, TGeneralController.Instance.CloseLockupCB(@dbcbSpec));
    if bEdit then
    begin
      dbcbSpec.KeyValue := SpecFacIK;
      dbcbSpec.Enabled := false;
    end;
  end;

end;

procedure TfrmGroupEdt.LoadProfile;
begin
  //pnlProfile.Visible := (VidGos>FGOS2);
  //if VidGos>FGOS2 then
  //begin
    dm.adsProfile.Close;
    dm.adsProfile.CommandText := 'select * from GetProfileEduBranches(' + IntToStr(fSpecFacIK)+')';
    dm.adsProfile.Open;
  //end;
end;

procedure TfrmGroupEdt.LoadUchPlan(aSpecFacIK: integer);
begin
  dblcbUchPln.ListSource.DataSet.Close;     // dm.adsGetUchPlanGrup
  (dblcbUchPln.ListSource.DataSet as TADODataSet).CommandText := 'select * from GetUchPlanForGroup('+
  IntToStr(aSpecFacIK)+','+dbneYear.Text+')';
  dblcbUchPln.ListSource.DataSet.Open;
  VidGos := dblcbUchPln.ListSource.DataSet.FieldByName('VidGos').AsInteger;
  //pnlProfile.Visible := (VidGos > FGOS2);
  lblTemplate.Visible := (VidGos > FGOS2);
end;

procedure TfrmGroupEdt.SetEditStatus(aEdit: boolean);
var tempDS: TADODataSet;
begin
  bEdit := aEdit;
  if aEdit then EditRead else AddRead;
end;

procedure TfrmGroupEdt.SetSpecFacIK(const Value: integer);
begin
  fSpecFacIK := Value;
  LoadProfile;
end;

procedure TfrmGroupEdt.uchPlanModify;
begin
  frmGroupEdt.CheckBox1.Enabled:=true;
  frmGroupEdt.CheckBox1.Checked := true;
  IsModified := (edtName.Text <> '') and (dbneYear.Text <> '');
end;

procedure TfrmGroupEdt.AddRead;
var tempDS: TADODataSet;
begin
  Caption := 'Добавление новой группы';
  FUchPlan := 0;

  tempDS := TGeneralController.Instance.GetNewADODataSet(true);
  tempDS.CommandText := 'select eb.Cshort_spec from Relation_spec_fac rsf inner join EducationBranch eb ' +
                        'on eb.ik_spec = rsf.ik_spec where rsf.ik_spec_fac=' + IntToStr(SpecFacIK);
  tempDS.Open;
  edtName.Text :=  tempDS.FieldByName('Cshort_spec').Value;
  edtName.Text := edtName.Text+'-'+Copy(IntToStr(CurrentYear), 3, 2);
  tempDS.Close;
  tempDS.Free;

  dbneYear.MaxValue := CurrentYear;
  dbneYear.Value := CurrentYear;

  LoadUchPlan(SpecFacIK);
  dblcbUchPln.ListSource.DataSet.Last;
  dblcbUchPln.KeyValue := dblcbUchPln.ListSource.DataSet.FieldByName('ik_uch_plan').AsInteger;
  dbcbProfile.KeyValue := 0;      //по-умолчанию, Общий профиль



  IsModified:= (edtName.Text <> '') and (dbneYear.Text <> '');


end;

procedure TfrmGroupEdt.ChangeGroupName;
var year_obuch: integer;
    tempDS: TADODataSet;
begin
  year_obuch := 5;

  if not WithSpec then
  begin
    if frmGroupEdt.Tag>0 then
    begin
      dmUgtuStructure.adoqSpecFac.Active:=true;
      dmUgtuStructure.adoqSpecFac.Locate('ik_spec_fac',frmGroupEdt.Tag,[]);
      year_obuch := dmUgtuStructure.adoqSpecFac.FieldByName('YearObuch').AsInteger;
      dmUgtuStructure.adoqSpecFac.Active:=false;
    end;

    if frmMain.DBDekTreeView_TEST1.SelectedObject is TDBNodeSpecObject then
    begin
      year_obuch := TDBNodeSpecObject(frmMain.DBDekTreeView_TEST1.SelectedObject).StudyYears;
    end;
    if frmMain.DBDekTreeView_TEST1.SelectedObject is TDBNodeGroupObject then
    begin
      year_obuch := TDBNodeSpecObject(frmMain.DBDekTreeView_TEST1.SelectedObject.Parent).StudyYears;
    end;
    if dblcbUchPln.KeyValue<>NULL then
      edtName.Text := DM.adsGetUchPlanGrup.FieldByName('Cshort_spec').AsString+'-'+Copy(dbneYear.Value, 3, 2);
  end
  else
  if dbcbSpec.KeyValue<>NULL then

  begin
   tempDS :=  TGeneralController.Instance.GetNewADODataSet(true);
   tempDS.CommandText := 'select Cshort_spec,YearObuch from Spec_stud, Relation_spec_fac where Spec_stud.ik_spec = Relation_spec_fac.ik_spec and ik_spec_fac =' + IntToStr(dbcbSpec.KeyValue);
   tempDS.Open;
   tempDS.First;
   edtName.Text := tempDS.FieldByName('Cshort_spec').AsString + '-'+Copy(IntToStr(CurrentYear), 3, 2);
   year_obuch := tempDS.FieldByName('YearObuch').AsInteger;
   tempDS.Close;
   tempDS.Free;
  end;


  IsModified := (edtName.Text <> '') and (dbneYear.Text <> ''); //and (dblcbUchPln.KeyValue <> NULL);

  //редактирование данных создания и расформирования группы
  dbdteCreate.Text:='01.09.'+dbneYear.Text;
  dbdteExit.Text:='31.08.'+inttostr(dbneYear.Value+year_obuch);
end;

procedure TfrmGroupEdt.CheckBox1Click(Sender: TObject);
begin
  inherited;
  if (CheckBox1.Checked)and(bEdit) then
    MessageBox(Handle, 'Внимание! Полное копирование оценок возможно только в том случае, когда все предметы текущего учебного плана группы совпадают с предметами назначаемого учебного плана!',
					  'ИС УГТУ', MB_OK)
end;

procedure TfrmGroupEdt.dbcbProfileKeyValueChanged(Sender: TObject);
begin
  if dbcbProfile.KeyValue<>null then
  begin
    IsModified := (edtName.Text <> '') and (dbneYear.Text <> '');
  end;
end;

procedure TfrmGroupEdt.dbcbSpecKeyValueChanged(Sender: TObject);
begin
  SpecFacIK := dbcbSpec.KeyValue;
  if not bEdit then ChangeGroupName;
  LoadUchPlan(SpecFacIK);
end;

procedure TfrmGroupEdt.dblcbUchPlnChange(Sender: TObject);
begin
  if (bEdit) then
    if ((dblcbUchPln.KeyValue <> FParentUchPlan)and(VidGos>FGOS2))
      or ((dblcbUchPln.KeyValue <> FUchPlan)and(VidGos = FGOS2)) then
        uchPlanModify;


end;

procedure TfrmGroupEdt.dbneYearChange(Sender: TObject);
begin
  inherited;
  if not bEdit then ChangeGroupName;
end;

procedure TfrmGroupEdt.edtNameChange(Sender: TObject);
begin
  inherited;
  IsModified := (edtName.Text <> '') and (dbneYear.Text <> ''); //and (dblcbUchPln.KeyValue <> NULL);
end;

function TfrmGroupEdt.DoApply: boolean;
var   tempProc: TADOStoredProc;
      Log : ILogger;
begin
  try
  Log := TNullLogger.GetInstance;   //TMemoLogger.GetInstance; //
  dm.DBConnect.BeginTrans;
  //создание учебного плана
  if ((FUchPlan = 0) or ((dblcbUchPln.KeyValue<>FParentUchPlan)and(VidGos>FGOS2)and(dblcbUchPln.KeyValue <> Null))) then
    with dm.aspAddRupGrup do
    begin
      Log.LogMessage('Need create a new plan');
      Connection := dm.DBConnect;
      Active := false;
      Parameters.ParamByName('@ik_main_plan').Value := dblcbUchPln.KeyValue;
      Log.LogMessage('ik_main_plan');
      Parameters.ParamByName('@grup_comment').Value := edtName.Text;
      Parameters.ParamByName('@vidgos').Value := VidGos;
      Log.LogMessage('VidGos');
      Parameters.ParamByName('@ik_spec_fac').Value := SpecFacIK;
      Log.LogMessage('SpecFacIK');
      Parameters.ParamByName('@year').Value := dbneYear.Text;
      Log.LogMessage('year');
      ExecProc;
      Log.LogMessage('execproc: ' + VarToStr(Parameters.ParamByName('@inserted_uch_plan').Value));
      FUchPlan := Parameters.ParamByName('@inserted_uch_plan').Value;
      Log.LogMessage('Plan is created = '+IntToStr(FUchPlan));
    end;
  //if VidGos=FGOS2 then FUchPlan := dblcbUchPln.KeyValue;

  if not bEdit then
  begin
    with dmGroupActions.adospAppendGrup.Parameters do
    begin
      ParamByName('@flag').Value:= 1;
    end;
  end
  else
  begin
   // if (CheckBox1.Checked) then  //перенос оценок со старого уч. плана
    TUchPlanController.Instance.UpdateUspev(ik, FUchPlan);

    with dmGroupActions.adospAppendGrup.Parameters do
    begin
      ParamByName('@flag').Value:= 0;
      ParamByName('@Ik_grup').Value:= ik;
    end;
  end;
  with dmGroupActions.adospAppendGrup.Parameters do
  begin
    //если идет добавление группы в ИС "Деканат"
    if not WithSpec then
    begin
      ParamByName('@ik_spec_fac').Value := fSpecFacIK;
      Log.LogMessage('SpecFacIK='+IntToStr(fSpecFacIK));
    end
    else ParamByName('@ik_spec_fac').Value:= dbcbSpec.KeyValue;

    ParamByName('@Cname_grup').Value:= edtName.Text;
    ParamByName('@ik_uch_plan').Value:= FUchPlan;
    if (dbcbProfile.KeyValue<>0) then
      ParamByName('@ik_spclz').Value:= dbcbProfile.KeyValue
      else  ParamByName('@ik_spclz').Value:= null;

    ParamByName('@nYear_post').Value:= dbneYear.Value;
    if dbdteCreate.Text='  .  .    ' then
      ParamByName('@DateCreate').Value:= Null
    else
      ParamByName('@DateCreate').Value:= dbdteCreate.value;
    if dbdteExit.Text='  .  .    ' then
      ParamByName('@DateExit').Value:= Null
    else
      ParamByName('@DateExit').Value:= dbdteExit.value;
  end;
  Log.LogMessage('ready to create group');
  dmGroupActions.adospAppendGrup.ExecProc;
  Log.LogMessage('group is created');

  dm.DBConnect.CommitTrans;
except
  on E:Exception do
       begin
         dm.DBConnect.RollbackTrans;
         raise EApplicationException.Create('Произошла ошибка при добавление группы.',E);
         exit;
       end;
  
end;

  Result:= true;
end;

function TfrmGroupEdt.DoCancel: boolean;
begin
  Result:= true;
end;


procedure TfrmGroupEdt.EditRead;
var tempDS: TADODataSet;
begin
  Caption := 'Редактирование группы';

  tempDS := TGeneralController.Instance.GetNewADODataSet(true);
  tempDS.CommandText := 'select * from GrupInfo(' + IntToStr(ik)+')';
  tempDS.Open;

  dbneYear.MaxValue := CurrentYear;
  fSpecFacIK := tempDS.FieldByName('ik_spec_fac').Value;
  //заполняем интерфейсные элементы
  edtName.Text := tempDS.FieldByName('Cname_grup').Value;
  dbneYear.Value := tempDS.FieldByName('nYear_post').Value;

  LoadUchPlan(SpecFacIK);

  if (VidGos>FGOS2)and(tempDS.FieldByName('Id_parent').Value<> NULL) then
  begin
      FParentUchPlan := tempDS.FieldByName('Id_parent').AsInteger;
      dblcbUchPln.KeyValue := tempDS.FieldByName('Id_parent').Value;
  end;

  if tempDS.FieldByName('Ik_uch_plan').Value<> NULL  then
  begin
    FUchPlan := tempDS.FieldByName('Ik_uch_plan').Value;
    if VidGos=FGOS2 then
      dblcbUchPln.KeyValue := tempDS.FieldByName('Ik_uch_plan').Value;
  end;

  if tempDS.FieldByName('ik_spclz').Value <> NULL then
    dbcbProfile.KeyValue := tempDS.FieldByName('ik_spclz').Value
  else dbcbProfile.KeyValue := 0;

  if tempDS.FieldByName('DateCreate').Value <>NULL then
    dbdteCreate.Text := tempDS.FieldByName('DateCreate').Value
  else dbdteCreate.Value := null;
  if tempDS.FieldByName('DateExit').Value <>NULL then
    dbdteExit.Text := tempDS.FieldByName('DateExit').Value
  else dbdteExit.value := null;

  IsModified:= false;
  tempDS.Close;
  tempDS.Free;

end;

end.
