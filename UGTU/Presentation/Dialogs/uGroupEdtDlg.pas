unit uGroupEdtDlg;
   {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, StdCtrls, DBCtrlsEh, Mask, ActnList, Buttons,
  ExtCtrls, DBGridEh, DBLookupEh, DateUtils, UchPlanController, GeneralController,
  NagruzkaController,Grids, DBGrids, DB, ADODB;

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
    Panel4: TPanel;
    Label8: TLabel;
    dbcbProfile: TDBLookupComboboxEh;

    procedure FormShow(Sender: TObject);
    procedure dblcbUchPlnChange(Sender: TObject);
    procedure dbneYearChange(Sender: TObject);
    procedure edtNameChange(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure dbcbSpecKeyValueChanged(Sender: TObject);
  private
    bEdit: boolean;
    procedure ChangeGroupName;
    procedure LoadUchPlan(aSpecFacIK: integer);
    procedure LoadProfile(aUchPlan: integer);
    procedure SetEditStatus(aEdit: boolean);
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;

  public
    { Public declarations }
    ik, FacIK: Integer;
    SpecFacIK: integer;

    up_new: boolean;
    WithSpec: boolean;
    VidGos: integer;
    property Edit: Boolean write SetEditStatus;
    procedure AddRead;
    procedure EditRead;
  end;

var
  frmGroupEdt: TfrmGroupEdt;


implementation

uses uDM, DBTVgroupObj, DBTVSpecObj, DBTVFacObj, uGroup,
  uSpec,ABIT_zachislenie_frame, uDMGroupActions, uMain, uDMUgtuStructure;

{$R *.dfm}


procedure TfrmGroupEdt.FormShow(Sender: TObject);
begin
  inherited;
  Panel4.Visible := (VidGos>1);   //профиль только по ФГОС 2 и выше

  if not WithSpec then SpecFacIK := TDBNodeSpecObject(frmMain.DBDekTreeView_TEST1.SelectedObject).ik;

    if dblcbUchPln.KeyValue >0 then
    up_new:=true;
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

procedure TfrmGroupEdt.LoadProfile(aUchPlan: integer);
begin
    dm.adsProfile.Close;
    dm.adsProfile.CommandText := 'select * from GetProfileEduBranches(' + IntToStr(aUchPlan)+')';
    dm.adsProfile.Open;
end;

procedure TfrmGroupEdt.LoadUchPlan(aSpecFacIK: integer);
begin
  {if (not WithSpec)or(SpecFacIK>0) then
  begin }
    dm.adospGetUchPlnGroup.Active := false;
    with dm.adospGetUchPlnGroup.Parameters do
    begin
      Clear;
      AddParameter;
      Items[0].Value := aSpecFacIK;
    end;
    dm.adospGetUchPlnGroup.ExecProc;
    dm.adospGetUchPlnGroup.Active := true;
 { end
  else  dm.adospGetUchPlnGroup.Close;}
end;

procedure TfrmGroupEdt.SetEditStatus(aEdit: boolean);
var tempDS: TADODataSet;
begin
  bEdit := aEdit;
  if aEdit then EditRead else AddRead;
  //выясняем вид ГОС
  tempDS := TGeneralController.Instance.GetNewADODataSet(true);
  tempDS.CommandText := 'select * from Relation_spec_fac where ik_spec_fac=' + IntToStr(SpecFacIK);
  tempDS.Open;
  VidGos :=  tempDS.FieldByName('VidGos').AsInteger;


  tempDS.Close;
  tempDS.Free;

end;

procedure TfrmGroupEdt.AddRead;
var tempDS: TADODataSet;
begin
  Caption := 'Добавление новой группы';

  LoadUchPlan(SpecFacIK);
  dblcbUchPln.KeyValue := -1;

  dbneYear.MaxValue := CurrentYear;
  dbneYear.Value := CurrentYear;

  LoadProfile(dblcbUchPln.KeyValue);
  dbcbProfile.KeyValue := 0;      //по-умолчанию, Общий профиль

  tempDS := TGeneralController.Instance.GetNewADODataSet(true);
  tempDS.CommandText := 'select eb.Cshort_spec from Relation_spec_fac rsf inner join EducationBranch eb ' +
                        'on eb.ik_spec = rsf.ik_spec where rsf.ik_spec_fac=' + IntToStr(SpecFacIK);
  tempDS.Open;
  edtName.Text :=  tempDS.FieldByName('Cshort_spec').Value;
  edtName.Text := edtName.Text+'-'+Copy(IntToStr(CurrentYear), 3, 2);

  IsModified:= (edtName.Text <> '') and (dbneYear.Text <> '');
  tempDS.Close;
  tempDS.Free;

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
    edtName.Text := DM.adospGetUchPlnGroup.FieldByName('Cshort_spec').AsString+'-'+Copy(dbneYear.Value, 3, 2);
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
  dbdteExit.Text:='30.06.'+inttostr(dbneYear.Value+year_obuch);
end;

procedure TfrmGroupEdt.CheckBox1Click(Sender: TObject);
begin
  inherited;
  if (CheckBox1.Checked) then
    MessageBox(Handle, 'Внимание! Полное копирование оценок возможно только в том случае, когда все предметы текущего учебного плана группы совпадают с предметами назначаемого учебного плана!',
					  'ИС УГТУ', MB_OK)
end;

procedure TfrmGroupEdt.dbcbSpecKeyValueChanged(Sender: TObject);
begin
  SpecFacIK := dbcbSpec.KeyValue;
  if not bEdit then ChangeGroupName;
  LoadUchPlan(SpecFacIK);
end;

procedure TfrmGroupEdt.dblcbUchPlnChange(Sender: TObject);
begin
  inherited;

  if up_new then
    begin
    frmGroupEdt.CheckBox1.Enabled:=true;
    end;
  LoadProfile((Sender as TDBLookupComboboxEh).KeyValue);
  IsModified := (edtName.Text <> '') and (dbneYear.Text <> '');
end;

procedure TfrmGroupEdt.dbneYearChange(Sender: TObject);
begin
  inherited;
  if not bEdit then ChangeGroupName;
  dblcbUchPln.ListSource.DataSet.Filter := 'year_value = ' + string((Sender as TDBNumberEditEh).Value);
  dblcbUchPln.ListSource.DataSet.Filtered := true;
end;

procedure TfrmGroupEdt.edtNameChange(Sender: TObject);
begin
  inherited;
  IsModified := (edtName.Text <> '') and (dbneYear.Text <> ''); //and (dblcbUchPln.KeyValue <> NULL);
end;

function TfrmGroupEdt.DoApply: boolean;
var SpecFacIK: integer;
begin
try
  dm.DBConnect.BeginTrans;

  if not bEdit then
  begin
    with dmGroupActions.adospAppendGrup.Parameters do
    begin
      ParamByName('@flag').Value:= 1;
    end;
  end
  else
  begin
    if (CheckBox1.Checked) then  //перенос оценок со старого уч. плана
      TUchPlanController.Instance.UpdateUspev(ik, dblcbUchPln.KeyValue);

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
      if frmMain.ActiveFrame is TfmGroup then
        ParamByName('@ik_spec_fac').Value:= TDBNodeSpecObject(frmMain.DBDekTreeView_TEST1.SelectedObject.Parent).ik
      else if frmMain.ActiveFrame is TfmZach then
        ParamByName('@ik_spec_fac').Value:= Tag else
        ParamByName('@ik_spec_fac').Value:= TDBNodeSpecObject(frmMain.DBDekTreeView_TEST1.SelectedObject).ik;
    end
    else ParamByName('@ik_spec_fac').Value:= dbcbSpec.KeyValue;

    ParamByName('@Cname_grup').Value:= edtName.Text;
    if (dbcbProfile.KeyValue<>0) then
      ParamByName('@ik_spclz').Value:= dbcbProfile.KeyValue;

    if dblcbUchPln.KeyValue<0 then ParamByName('@Ik_uch_plan').Value:= NULL
        else ParamByName('@Ik_uch_plan').Value:= dblcbUchPln.KeyValue;
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
dmGroupActions.adospAppendGrup.ExecProc;

dm.DBConnect.CommitTrans;
except
dm.DBConnect.RollbackTrans;
raise;
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
  tempDS.CommandText := 'select Grup.* from Grup where ik_grup=' + IntToStr(ik);
  tempDS.Open;

  dbneYear.MaxValue := CurrentYear;
  SpecFacIK := tempDS.FieldByName('ik_spec_fac').Value;
  LoadUchPlan(SpecFacIK);
  dblcbUchPln.KeyValue := -1;

  if tempDS.FieldByName('Ik_uch_plan').Value<> NULL then
    dblcbUchPln.KeyValue := tempDS.FieldByName('Ik_uch_plan').Value;

  LoadProfile(dblcbUchPln.KeyValue);

  if tempDS.FieldByName('ik_spclz').Value <> NULL then
    dbcbProfile.KeyValue := tempDS.FieldByName('ik_spclz').Value
  else dbcbProfile.KeyValue := 0;

  //заполняем интерфейсные элементы
  edtName.Text := tempDS.FieldByName('Cname_grup').Value;
  dbneYear.Value := tempDS.FieldByName('nYear_post').Value;

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
