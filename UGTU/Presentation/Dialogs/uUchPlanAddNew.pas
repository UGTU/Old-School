unit uUchPlanAddNew;

{ #Author villain@ist.ugtu.net }
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, StdCtrls, Buttons, ExtCtrls, ADODB, ActnList, Mask,
  DBCtrlsEh, DBGridEh, DBLookupEh, UchPlanController, GeneralController,
  ComCtrls, System.Actions;

type
  TfrmUchPlanAddNew = class(TfrmBaseDialog)
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label10: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    CheckBox1: TCheckBox;
    GroupBox1: TGroupBox;
    Label16: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    dbcbSpclz: TDBLookupComboboxEh;
    dbcbFormEd: TDBLookupComboboxEh;
    dbcbYear: TDBLookupComboboxEh;
    dbcbSpclzCopy: TDBLookupComboboxEh;
    dbcbFormEdCopy: TDBLookupComboboxEh;
    dbcbYearCopy: TDBLookupComboboxEh;
    Panel2: TPanel;
    Image1: TImage;
    Label11: TLabel;
    Label12: TLabel;
    CheckBox2: TCheckBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    dtpDateUtv: TDateTimePicker;
    DateTimePicker1: TDateTimePicker;
    procedure CheckBox1Click(Sender: TObject);
    procedure dbcbSpclzCopyKeyValueChanged(Sender: TObject);
    procedure dbcbFormEdCopyKeyValueChanged(Sender: TObject);
    procedure dbcbYearKeyValueChanged(Sender: TObject);
    procedure actSpravExecute(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure dtpDateUtvChange(Sender: TObject);
    procedure dbcbYearCopyKeyValueChanged(Sender: TObject);
  private
    isAlreadyLoad: boolean;
    FSpecFac: integer;
    VidGos: integer;
    // iUchPlanIK: integer;
    procedure Load();
  protected
    function DoApply: boolean; override;
    function DoCancel: boolean; override;
  public
    OperationType: word;
    procedure Read();
    property specfac: integer read FSpecFac write FSpecFac;
  end;

var
  frmUchPlanAddNew: TfrmUchPlanAddNew;

implementation

{$R *.dfm}

uses uUchPlan, uDM, DB, uDMUchPlan, ConstantRepository;

{ TfrmAddUchPlan }

function TfrmUchPlanAddNew.DoApply: boolean;
var
  UchPlanIK: integer;
begin
  // inherited;
  if (CheckBox1.Checked) then
    if (dbcbYearCopy.KeyValue = NULL) then
    begin
      Application.MessageBox('Необходимо указать используемый учебный план...',
        'Учебный план', MB_ICONERROR);
      Result := false;
      exit;
    end;
  UchPlanIK := self.ik;
  dm.DBConnect.BeginTrans;
  try
    if (VidGos > FGOS2) and dbcbSpclz.KeyValue = NULL then
      dbcbSpclz.KeyValue := 0;

    if (CheckBox1.Checked) then         //если создаем план из копии
    begin
      Panel2.Visible := true;
      Refresh;
        TUchPlanController.Instance.CopyUchPlan
          (dbcbYearCopy.ListSource.DataSet.FieldByName('ik_uch_plan').AsInteger,
          UchPlanIK,dbcbYear.KeyValue);

        {if (CheckBox2.Checked) then // перенос оценок со старого уч. плана
          TUchPlanController.Instance.UpdateGrup
            (dbcbYearCopy.ListSource.DataSet.FieldByName('ik_uch_plan')
            .AsInteger, UchPlanIK, specfac); }

        Panel2.Visible := false;
    end else
      if not TUchPlanController.Instance.SaveUchPlan(OperationType, UchPlanIK,
        Label2.Tag, dbcbSpclz.KeyValue, dbcbFormEd.KeyValue, dbcbYear.KeyValue,
        dtpDateUtv.Date, (VidGos > FGOS2)) then
      begin
        Result := false;
        exit;
      end;
    Result := true;
    dm.DBConnect.CommitTrans;
  except
    dm.DBConnect.RollbackTrans;
    raise;
  end;
end;

function TfrmUchPlanAddNew.DoCancel: boolean;
begin
  // inherited;
  case (Application.MessageBox('Сохранить внесенные изменения?',
    'Измение учебного плана', MB_YESNOCANCEL)) of
    mrYes:
      begin
        OK;
        Result := false;
      end;
    mrNo:
      Result := true;
    mrCancel:
      Result := false;
  else
    Result := false;
  end;
end;

procedure TfrmUchPlanAddNew.dtpDateUtvChange(Sender: TObject);
begin
  if (VidGos = 1) then
    IsModified := (dbcbSpclz.KeyValue <> NULL) and (dbcbFormEd.KeyValue <> NULL)
      and (dbcbYear.KeyValue <> NULL)
  else
    IsModified := (dbcbFormEd.KeyValue <> NULL) and (dbcbYear.KeyValue <> NULL)
end;

procedure TfrmUchPlanAddNew.Read;
begin
  TGeneralController.Instance.InitializeLockupCB(@dbcbSpclz, 'iK_spclz',
    'cName_spclz');
  TGeneralController.Instance.InitializeLockupCB(@dbcbFormEd, 'iK_form_ed',
    'Cname_form_ed');
  TGeneralController.Instance.InitializeLockupCB(@dbcbYear, 'ik_year_uch_pl',
    'year_value');
  dtpDateUtv.Date := Now;
  dbcbSpclz.KeyValue := TUchPlanController.Instance.getAllSpecializations
    (@dbcbSpclz.ListSource.DataSet, Label2.Tag, false);
  dbcbFormEd.KeyValue := TUchPlanController.Instance.getAllFormEd
    (@dbcbFormEd.ListSource.DataSet, false);
  dbcbYear.KeyValue := TUchPlanController.Instance.getAllYears
    (@dbcbYear.ListSource.DataSet, false);

  VidGos := Label1.Tag;
  if (VidGos = FGOS3) {and (dbcbSpclz.ListSource.DataSet.RecordCount = 0)} then
  begin
    Label3.Visible := false;
    Label10.Visible := false;
    dbcbSpclz.Visible := false;
    Label1.Top := 15;
    Label2.Top := 15;
    Label9.Visible := false;
    dbcbSpclzCopy.Visible := false;
    dbcbFormEd.Top := 35;
    Label4.Top := 37;
    Label6.Top := 37;
    dbcbYear.Top := 60;
    dtpDateUtv.Top := 60;
    Label17.Top := 60;
    Label5.Top := 60;
    Label7.Top := 60;
    Label13.Top := 72;
    CheckBox1.Top := 83;
    CheckBox2.Top := 106;

    // подтянуть повыше копию уч. плана
    dbcbFormEdCopy.Top := 24;
    Label16.Top := 24;
    dbcbYearCopy.Top := 48;
    Label14.Top := 48;
    Label15.Top := 60;
    DateTimePicker1.Top := 48;
    Label18.Top := 54;

  end;
  if (self.Tag = 2) then
  begin
    dbcbYear.KeyValue := (CallFrame as TfmUchPlan).dbcbYear.KeyValue;
    dtpDateUtv.Date := (CallFrame as TfmUchPlan).dtpDateUtv.Date;
    dbcbSpclz.KeyValue := (CallFrame as TfmUchPlan).dbcbSpclz.KeyValue;
    dbcbFormEd.KeyValue := (CallFrame as TfmUchPlan).dbcbFormEd.KeyValue;
    CheckBox1.Visible := false;
    Height := 177;
    self.Caption := 'Изменение учебного плана';
  end
  else
  begin
    CheckBox1.Visible := true;
    Height := 190;
    self.Caption := 'Добавление учебного плана';
  end;
  Label2.Hint := TUchPlanController.Instance.getSpecName(Label2.Tag);
  TGeneralController.Instance.SetCaptionDots(@Label2, Label2.Hint, 290);
  Label2.ShowHint := true;
  case (Label3.Tag) of
    1:
      Label3.Caption := 'Профиль  :';
    3:
      Label3.Caption := 'Программа  :';
  else
    Label3.Caption := 'Специализация  :';
  end;
  Label9.Caption := Label3.Caption;
  isAlreadyLoad := false;
  IsModified := false;
end;

procedure TfrmUchPlanAddNew.CheckBox1Click(Sender: TObject);
begin
  inherited;
  if (CheckBox1.Checked) then
  begin
    GroupBox1.Visible := true;
   // CheckBox2.Visible := true;
    Height := 450;
    if (not isAlreadyLoad) then
      Load();
  end
  else
  begin
    GroupBox1.Visible := false;
  //  CheckBox2.Visible := false;
    Height := 190;
  end;
end;

procedure TfrmUchPlanAddNew.CheckBox2Click(Sender: TObject);
begin
  inherited;
  if (CheckBox2.Checked) then
    MessageBox(Handle,
      'Внимание! Полное копирование оценок возможно только в случае, если текущий план группы совпадает с учебным планом, на основе которого будет сделана копия, и год поступления группы совпадает с годом утверждения (переутверждения) нового учебного плана',
      'ИС УГТУ', MB_OK)
end;

procedure TfrmUchPlanAddNew.Load;
begin
  TGeneralController.Instance.InitializeLockupCB(@dbcbSpclzCopy, 'iK_spclz',
    'cName_spclz');
  TGeneralController.Instance.InitializeLockupCB(@dbcbFormEdCopy, 'iK_form_ed',
    'Cname_form_ed');
  TGeneralController.Instance.InitializeLockupCB(@dbcbYearCopy,
    'ik_year_uch_pl', 'year_value');
  // TGeneralController.Instance.InitializeLockupCB(@dbcbYearUtvCopy, 'ik_year_uch_pl', 'year_value');
  dbcbSpclzCopy.KeyValue := TUchPlanController.Instance.
    getCurrentSpecializations(@dbcbSpclzCopy.ListSource.DataSet,
    Label2.Tag, true);
  if dbcbSpclzCopy.KeyValue = NULL then
  begin
    dbcbFormEdCopy.KeyValue := TUchPlanController.Instance.getCurrentFormEd
      (@dbcbFormEdCopy.ListSource.DataSet, Label2.Tag, VidGos, true);
  end;
  isAlreadyLoad := true;
end;

procedure TfrmUchPlanAddNew.dbcbSpclzCopyKeyValueChanged(Sender: TObject);
var
  splzIK: integer;
begin
  TGeneralController.Instance.CloseLockupCB(@dbcbFormEdCopy);
  if (dbcbSpclz.KeyValue = NULL) then
  begin
    dbcbSpclz.Text := '';
    splzIK := 0;
  end
  else
    splzIK := dbcbSpclz.KeyValue;
  if Assigned(dbcbFormEdCopy.ListSource) then
    dbcbFormEdCopy.KeyValue := TUchPlanController.Instance.getCurrentFormEd
      (@dbcbFormEdCopy.ListSource.DataSet, Label2.Tag, VidGos, true);
end;

procedure TfrmUchPlanAddNew.dbcbFormEdCopyKeyValueChanged(Sender: TObject);
var
  spczIK: integer;
begin
  TGeneralController.Instance.CloseLockupCB(@dbcbYearCopy);
  // TGeneralController.Instance.CloseLockupCB(@dbcbYearUtvCopy);
  if dbcbSpclzCopy.KeyValue = NULL then
    spczIK := 0
  else
    spczIK := dbcbSpclzCopy.KeyValue;

  if (dbcbFormEdCopy.KeyValue <> NULL) then
  begin
    dbcbYearCopy.KeyValue := TUchPlanController.Instance.getCurrentYears
      (@dbcbYearCopy.ListSource.DataSet, Label2.Tag, spczIK,
      dbcbFormEdCopy.KeyValue, VidGos, true);

    // dbcbYearUtvCopy.KeyValue:= TUchPlanController.Instance.getCurrentYears(@dbcbYearUtvCopy.ListSource.DataSet, Label2.Tag, dbcbSpclzCopy.KeyValue, dbcbFormEdCopy.KeyValue, true);
  end;
end;

procedure TfrmUchPlanAddNew.dbcbYearCopyKeyValueChanged(Sender: TObject);
begin
  dmUchPlan.adodsUchPlan.close;
  if (dbcbYearCopy.KeyValue <> NULL) then
  begin
    dmUchPlan.adodsUchPlan.CommandText :=
      'select * from Uch_pl where (ik_uch_plan = ' +
      dbcbYearCopy.ListSource.DataSet.FieldByName('ik_uch_plan').AsString + ')';
    dmUchPlan.adodsUchPlan.open;
    with dmUchPlan.adodsUchPlan do
      DateTimePicker1.Date := StrToDate(copy(FieldByName('date_utv').AsString,
        9, 2) + '.' + copy(FieldByName('date_utv').AsString, 6, 2) + '.' +
        copy(FieldByName('date_utv').AsString, 0, 4));
  end;

end;

procedure TfrmUchPlanAddNew.dbcbYearKeyValueChanged(Sender: TObject);
begin
  if (VidGos = 1) then
    IsModified := (dbcbSpclz.KeyValue <> NULL) and (dbcbFormEd.KeyValue <> NULL)
      and (dbcbYear.KeyValue <> NULL)
  else
    IsModified := (dbcbFormEd.KeyValue <> NULL) and (dbcbYear.KeyValue <> NULL)
end;

procedure TfrmUchPlanAddNew.actSpravExecute(Sender: TObject);
var
  isMod: boolean;
begin
  isMod := IsModified;
  inherited;
  TGeneralController.Instance.RefreshLockupCB(@dbcbSpclz);
  TGeneralController.Instance.RefreshLockupCB(@dbcbFormEd);
  TGeneralController.Instance.RefreshLockupCB(@dbcbYear);
  // TGeneralController.Instance.RefreshLockupCB(@dbcbYearUtv);
  TGeneralController.Instance.RefreshLockupCB(@dbcbSpclzCopy);
  TGeneralController.Instance.RefreshLockupCB(@dbcbFormEdCopy);
  TGeneralController.Instance.RefreshLockupCB(@dbcbYearCopy);
  // TGeneralController.Instance.RefreshLockupCB(@dbcbYearUtvCopy);
  IsModified := isMod;
end;

end.
