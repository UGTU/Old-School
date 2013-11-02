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

    procedure ChangeGroupName;

  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    { Public declarations }
    ik, FacIK: Integer;
    SpecFacIK: integer;
    bEdit: Boolean;
    up_new: boolean;
    WithSpec: boolean;
    VidGos: integer;
    procedure LoadUchPlan(aSpecFacIK: integer);
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


  //LoadUchPlan(SpecFacIK);

  if not bEdit then
  begin
  try
    dbneYear.Value := CurrentYear;
  except

  end;
  end;
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

procedure TfrmGroupEdt.LoadUchPlan(aSpecFacIK: integer);
begin
  if (not WithSpec)or(SpecFacIK>0) then
  begin
    dm.adospGetUchPlnGroup.Active := false;
    with dm.adospGetUchPlnGroup.Parameters do
    begin
      Clear;
      AddParameter;
      {if not WithSpec then Items[0].Value := TDBNodeSpecObject(frmMain.DBDekTreeView_TEST1.SelectedObject).ik
         else Items[0].Value := dbcbSpec.KeyValue;   }
      Items[0].Value := aSpecFacIK;
    end;
    dm.adospGetUchPlnGroup.ExecProc;
    dm.adospGetUchPlnGroup.Active := true;
  end
  else  dm.adospGetUchPlnGroup.Close;
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
  //frmGroupEdt.CheckBox1.Visible:=false;
  //frmGroupEdt.Label5.Visible:=false;
  //frmGroupEdt.Height:=165;         
  if up_new then
    begin
    frmGroupEdt.CheckBox1.Enabled:=true;
    end;
  

  IsModified := (edtName.Text <> '') and (dbneYear.Text <> ''); //and (dblcbUchPln.KeyValue <> NULL);
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


end.
