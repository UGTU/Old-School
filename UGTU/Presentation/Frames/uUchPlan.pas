unit uUchPlan;

{ #Author villain@ist.ugtu.net }
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseFrame, ExtCtrls, StdCtrls, Buttons, ComCtrls, DB, ADODB,
  ImgList, ToolWin, ActnList, Grids, DBGrids, DBGridEh, Menus, Mask,
  DBCtrlsEh, DBLookupEh, UchPlanController, GeneralController, GridsEh,
  DBTVSpecobj, udmUchPlan,
  uFgosController, Fgos_Application3Report, Fgos_Application5Report,
  Fgos_Application12Report, uWaitingController, uAddDiscRelation,
  ConstantRepository,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, System.Actions,
  DBAxisGridsEh;

const
  FISCULTURA = 10; // для особого учета зачетных единиц физической культуры

type
  TfmUchPlan = class(TfmBase)
    pnlAll: TPanel;
    pnlTools: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton8: TToolButton;
    actList: TActionList;
    ActionRemUchPlan: TAction;
    ActionEditUchPlan: TAction;
    ActionRemDisc: TAction;
    ActionEditDisc: TAction;
    ActionSemLength: TAction;
    ActionAddDisc: TAction;
    ActionAddUchPlan: TAction;
    dsSemLength: TDataSource;
    ScrollBox1: TScrollBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label16: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Panel5: TPanel;
    Panel6: TPanel;
    ScrollBox2: TScrollBox;
    sgDisc: TStringGrid;
    Panel7: TPanel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Label10: TLabel;
    lblShifr: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Bevel3: TBevel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    ToolButton7: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    dbcbFormEd: TDBLookupComboboxEh;
    dbcbYear: TDBLookupComboboxEh;
    dbcbCklDisc: TDBLookupComboboxEh;
    dbcbGrpDisc: TDBLookupComboboxEh;
    dbgDisc: TDBGridEh;
    dsDisc: TDataSource;
    Label5: TLabel;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    Panel8: TPanel;
    Label27: TLabel;
    dbcbKaf: TDBLookupComboboxEh;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    actLoadSelection: TAction;
    Panel9: TPanel;
    ProgressBar1: TProgressBar;
    Label28: TLabel;
    actExport: TAction;
    Bevel6: TBevel;
    Label29: TLabel;
    cmbxSem: TDBComboBoxEh;
    Label30: TLabel;
    cmbxVidZan: TDBComboBoxEh;
    Label31: TLabel;
    cbBRS: TCheckBox;
    actBRS: TAction;
    Label32: TLabel;
    lblZachEd: TLabel;
    dsDiscZE: TDataSource;
    dsDiscExceptionZE: TDataSource;
    dsGetFgosBySpec: TDataSource;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    dtpDateUtv: TDateTimePicker;
    Label37: TLabel;
    dbcbPdgrpDisc: TDBLookupComboboxEh;
    PopupMenu2: TPopupMenu;
    actExport1: TMenuItem;
    actFgosApp3: TAction;
    N31: TMenuItem;
    actFgosApp5: TAction;
    N4: TMenuItem;
    dsGetDataTitle: TDataSource;
    actFgosApp12: TAction;
    dsGetAllDiscFgos: TDataSource;
    dsGetAllComp: TDataSource;
    dsComp_Disc: TDataSource;
    actFgosApp121: TMenuItem;
    pnlGroup: TPanel;
    dbcbGroup: TDBLookupComboboxEh;
    lblGroup: TLabel;
    pnlSpclz: TPanel;
    dbcbSpclz: TDBLookupComboboxEh;
    lblSpclz: TLabel;
    cbApproved: TCheckBox;
    ToolBar2: TToolBar;
    ToolButton12: TToolButton;
    lblProfile: TLabel;
    procedure ActionRemUchPlanUpdate(Sender: TObject);
    procedure ActionRemUchPlanExecute(Sender: TObject);
    procedure ActionRemDiscUpdate(Sender: TObject);
    procedure ActionAddUchPlanUpdate(Sender: TObject);
    procedure ActionAddDiscExecute(Sender: TObject);
    procedure ActionEditDiscExecute(Sender: TObject);
    procedure ActionEditUchPlanExecute(Sender: TObject);
    procedure ActionRemDiscExecute(Sender: TObject);
    procedure ActionSemLengthExecute(Sender: TObject);
    procedure Label10MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure sgDiscMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure ScrollBox2Resize(Sender: TObject);
    procedure dbcbFormEdKeyValueChanged(Sender: TObject);
    procedure dbcbYearKeyValueChanged(Sender: TObject);
    procedure dbcbCklDiscKeyValueChanged(Sender: TObject);
    procedure dsDiscDataChange(Sender: TObject; Field: TField);
    procedure dbgDiscKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgDiscDblClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure actLoadSelectionUpdate(Sender: TObject);
    procedure actLoadSelectionExecute(Sender: TObject);
    procedure actExportExecute(Sender: TObject);
    procedure actBRSExecute(Sender: TObject);
    procedure actBRSUpdate(Sender: TObject);
    procedure actFgosApp3Execute(Sender: TObject);
    procedure actFgosApp3Update(Sender: TObject);
    procedure actFgosApp5Execute(Sender: TObject);
    procedure actFgosApp5Update(Sender: TObject);
    procedure actFgosApp12Execute(Sender: TObject);
    procedure actFgosApp12Update(Sender: TObject);
    procedure dbcbGroupKeyValueChanged(Sender: TObject);
    procedure cbApprovedMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbcbSpclzKeyValueChanged(Sender: TObject);
  private
    fdirIK: Integer;
    fSpclzIK, fYearIK, fFormIK: Integer;
    FIKPlan: Integer;
    fSpecIK, fSpecFacIK: Integer;
    fGroupIK, fGrupSpclszIK: Integer;
    fCurrentDiscType: Integer;
    fSemesterStr: string;
    fVidGos: Integer;
    flagFgos: boolean;
    fTypePlan: Integer;
    IsSetPlan: boolean;
    fGroupDataSet: TADODataSet;
    procedure SetDiscTypeVisual(discType: Integer; showName: string);

    procedure GetSemesters();
    procedure SetGroupUchPlan(const aGroupIK: Integer);
    procedure SetUchPlan(const aUchPlan: Integer);
    procedure SetUchPlanProperties(const aUchPlan: Integer);
    procedure SetVisualProperty;
  public

    nameSpclz: string; // именование Профиль/Программа/Специализация
    procedure CloseFrame; override;
    property SpecIK: Integer read fSpecIK write fSpecIK;
    property SpecFacIK: Integer read fSpecFacIK write fSpecFacIK;
    property dirIK: Integer read fdirIK write fdirIK;
    property VidGos: Integer read fVidGos write fVidGos;
    procedure ReadModelUchPlan;
    procedure ReadWorkUchPlan;
    procedure GetDisciplines;
    property Group: Integer read fGroupIK write SetGroupUchPlan;
    property IKPlan: Integer read FIKPlan write SetUchPlan;
  end;

var
  fmUchPlan: TfmUchPlan;

implementation

uses uUchPlanSemLength, uUchPlanAddNew, uUchPlanAddDisc, uMain, uDMFgos,
  DateFormat, uDM, ExceptionBase;

{$R *.dfm}

procedure TfmUchPlan.ReadModelUchPlan;
var
  i: Integer;
begin
  inherited;
  fGroupIK := 0;
  fTypePlan := key_ModelPlan;
  IsSetPlan := false;
  dsDisc.DataSet := dm.aspGetDiscModel;
  SetVisualProperty; // визуальные настройки
  cbApproved.Visible := true;
  dbcbFormEd.KeyValue := TUchPlanController.Instance.getCurrentFormEd
    (@dbcbFormEd.ListSource.DataSet, fSpecIK, VidGos, true);

  if not IsSetPlan then
    frmMain.StatusBar1.Panels[1].Text := 'Учебный план: <не выбран>';
end;

procedure TfmUchPlan.ReadWorkUchPlan;
begin
  inherited;
  // заглушка
  fTypePlan := key_WorkPlan;
  dsDisc.DataSet := dm.aspGetDiscWork;
  fGroupDataSet := TGeneralController.Instance.GetNewADODataSet(true);

  SetVisualProperty; // визуальные настройки
  // ------------вынести кнопки на отдельные панели------------------------------
  ToolButton1.Visible := false;
  // ToolButton2.Visible := false;
  ToolButton8.Visible := false;
  pnlGroup.Visible := true;
  dbcbFormEd.Enabled := false;
  dbcbYear.Enabled := false;
  dbcbSpclz.Enabled := false;
  // ----------------------------------------------------------------------------

  if (VidGos <> FGOS3) then
    TUchPlanController.Instance.getAllSpecializations
      (@dbcbSpclz.ListSource.DataSet, fSpecIK, false);

  TUchPlanController.Instance.getAllYears(@dbcbYear.ListSource.DataSet, false);
  TUchPlanController.Instance.getAllFormEd
    (@dbcbFormEd.ListSource.DataSet, false);

  TUchPlanController.Instance.getCurrentGroups(@dbcbGroup.ListSource.DataSet,
    fSpecFacIK, false, false);
  dbcbGroup.ListSource.DataSet.Filter := 'isCurrent	= 1';
  dbcbGroup.ListSource.DataSet.Filtered := true;

  if Group <> dbcbGroup.ListSource.DataSet.FieldByName('ik_grup').AsInteger then
    Group := dbcbGroup.ListSource.DataSet.FieldByName('ik_grup').AsInteger;

end;

procedure TfmUchPlan.ActionRemUchPlanUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := ((dbcbFormEd.KeyValue <> NULL) and
    (dbcbYear.KeyValue <> NULL));
end;

procedure TfmUchPlan.ActionRemDiscUpdate(Sender: TObject);
begin
  if (dsDisc.DataSet.Active) then
    (Sender as TAction).Enabled := dsDisc.DataSet.RecordCount > 0
  else
    (Sender as TAction).Enabled := false;
end;

procedure TfmUchPlan.ActionAddUchPlanUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := true;
end;

procedure TfmUchPlan.ActionAddDiscExecute(Sender: TObject);
begin
  if not cbApproved.Checked then
  begin
    frmUchPlanAddDisc := TfrmUchPlanAddDisc.CreateDialog(Application,
      Connection, nil);
    try
      frmUchPlanAddDisc.Tag := 1;
      frmUchPlanAddDisc.IK := -1;
      frmUchPlanAddDisc.TypePlan := fTypePlan;
      frmUchPlanAddDisc.iUchPlan := FIKPlan;
      frmUchPlanAddDisc.VidGos := VidGos;
      frmUchPlanAddDisc.SpecIK := fSpecIK;
      frmUchPlanAddDisc.nameSpclz := nameSpclz;
      frmUchPlanAddDisc.dbcbCklDisc.Tag := dbcbCklDisc.KeyValue;
      frmUchPlanAddDisc.dbcbGrpDisc.Tag := dbcbGrpDisc.KeyValue;
      frmUchPlanAddDisc.dbcbPdgrpDisc.Tag := dbcbPdgrpDisc.KeyValue;
      frmUchPlanAddDisc.GrupIK := fGroupIK;
      if VidGos = FGOS2 then
        frmUchPlanAddDisc.SpclzIK := fSpclzIK
      else
        frmUchPlanAddDisc.SpclzIK := key_CommonProfile;
      frmUchPlanAddDisc.Read(fSemesterStr);
      if ((frmUchPlanAddDisc.ShowModal() = mrOk) or
        (frmUchPlanAddDisc.bbApply.Tag = 1)) then
        GetDisciplines;
    finally
      frmUchPlanAddDisc.Free;
    end;
  end;
end;

procedure TfmUchPlan.ActionEditDiscExecute(Sender: TObject);
var
  index: Integer;
begin
  if not cbApproved.Checked then
  begin
    frmUchPlanAddDisc := TfrmUchPlanAddDisc.CreateDialog(Application,
      Connection, nil);
    // LocalLog.AddEntry('Редактирование дисциплины '+Trim(dsDisc.DataSet.FieldByName('cname_disc').AsString));
    try
      frmUchPlanAddDisc.IK := dsDisc.DataSet.FieldByName('ik_disc_uch_plan')
        .AsInteger;
      frmUchPlanAddDisc.TypePlan := fTypePlan;
      frmUchPlanAddDisc.iUchPlan := IKPlan;
      frmUchPlanAddDisc.VidGos := VidGos;
      frmUchPlanAddDisc.SpecIK := fSpecIK;
      frmUchPlanAddDisc.nameSpclz := nameSpclz;
      // if VidGos=FGOS3 then frmUchPlanAddDisc.SpclzIK := dsDisc.DataSet.FieldByName('ik_spclz').AsInteger;
      frmUchPlanAddDisc.Tag := 2;
      frmUchPlanAddDisc.GrupIK := fGroupIK;
      if VidGos = FGOS2 then
        frmUchPlanAddDisc.SpclzIK := fSpclzIK
      else
        frmUchPlanAddDisc.SpclzIK := dsDisc.DataSet.FieldByName('ik_spclz')
          .AsInteger;
      frmUchPlanAddDisc.Read(fSemesterStr);
      frmUchPlanAddDisc.Edit6.Text :=
        Trim(dsDisc.DataSet.FieldByName('cname_ckl_disc1').AsString);
      frmUchPlanAddDisc.edtHoursGos.Text := GetTimeByType(dsDisc.DataSet.FieldByName('ik_ed_izm').AsInteger,
                      dsDisc.DataSet.FieldByName('iHour_gos').AsInteger);
      frmUchPlanAddDisc.iIndivid := dsDisc.DataSet.FieldByName('iIndivid')
        .AsInteger;
      frmUchPlanAddDisc.dbcbDisc.KeyValue := dsDisc.DataSet.FieldByName
        ('ik_disc').AsInteger;

      frmUchPlanAddDisc.dbeGroupVibor.Value :=
        dsDisc.DataSet.FieldByName('ViborGroup').AsString;
      if (dsDisc.DataSet.FieldByName('ik_default_kaf').Value = NULL) then
        frmUchPlanAddDisc.dbcbKaf.KeyValue := 1
      else
        frmUchPlanAddDisc.dbcbKaf.KeyValue := dsDisc.DataSet.FieldByName
          ('ik_default_kaf').AsInteger;
      frmUchPlanAddDisc.dbcbCklDisc.KeyValue :=
        dsDisc.DataSet.FieldByName('IK_ckl_disc').AsInteger;
      frmUchPlanAddDisc.dbcbGrpDisc.KeyValue :=
        dsDisc.DataSet.FieldByName('IK_grp_disc').AsInteger;
      frmUchPlanAddDisc.dbcbPdgrpDisc.KeyValue :=
        dsDisc.DataSet.FieldByName('iK_pdgrp_disc').AsInteger;
      index := dsDisc.DataSet.FieldByName('ik_disc').AsInteger;
      frmUchPlanAddDisc.IsModified := false;
      if ((frmUchPlanAddDisc.ShowModal() = mrOk) or
        (frmUchPlanAddDisc.bbApply.Tag = 1)) then
      begin
        GetDisciplines;
        dsDisc.DataSet.Locate('ik_disc', index, [loPartialKey]);
      end;
    finally
      frmUchPlanAddDisc.Free;
    end;
  end;
end;

procedure TfmUchPlan.ActionEditUchPlanExecute(Sender: TObject);
begin
  // if not cbApproved.Checked then       //Придумать другой механизм!!
  // begin
  // LocalLog.AddEntry('Добавление/редактирование учебного плана');
  dsGetFgosBySpec.DataSet := TFgosController.Instance.getFgosBySpec(fSpecIK);
  if (dsGetFgosBySpec.DataSet.FieldByName('IDGos').Value = NULL and (VidGos = 2))
  then
    Application.MessageBox
      ('Необходимо создать ФГОС для текущего направления подготовки',
      'Учебный план', MB_ICONERROR)
  else
  begin
    frmUchPlanAddNew := TfrmUchPlanAddNew.CreateDialog(Application,
      Connection, nil);
    try
      try
        frmUchPlanAddNew.IK := FIKPlan;
        // dbcbYear.ListSource.DataSet.FieldByName('ik_uch_plan').AsInteger;
      except
        frmUchPlanAddNew.IK := 0;
      end;
      frmUchPlanAddNew.Tag := (Sender as TAction).Tag;
      frmUchPlanAddNew.Label2.Tag := fSpecIK;
      frmUchPlanAddNew.Label3.Tag := dirIK;
      frmUchPlanAddNew.Label1.Tag := VidGos;
      frmUchPlanAddNew.CallFrame := self;
      frmUchPlanAddNew.SpecFac :=
        TDBNodeSpecObject(frmMain.DBDekTreeView_TEST1.SelectedObject).IK;
      frmUchPlanAddNew.Read;
      if ((frmUchPlanAddNew.ShowModal() = mrOk) or
        (frmUchPlanAddNew.bbApply.Tag = 1)) then
      begin
        if fVidGos > FGOS2 then
          TGeneralController.Instance.CloseLockupCB(@dbcbSpclz)
        else
        begin
          dbcbSpclz.ListSource.DataSet.Open;
          dbcbSpclz.KeyValue := frmUchPlanAddNew.dbcbSpclz.KeyValue;
        end;
        TUchPlanController.Instance.getCurrentFormEd
          (@dbcbFormEd.ListSource.DataSet, fSpecIK, VidGos, true);
        dbcbFormEd.KeyValue := frmUchPlanAddNew.dbcbFormEd.KeyValue;
        dbcbYear.KeyValue := frmUchPlanAddNew.dbcbYear.KeyValue;
        dtpDateUtv.Date := frmUchPlanAddNew.dtpDateUtv.Date;
      end;
    finally
      frmUchPlanAddNew.Free;
    end;
  end;
  // end;
end;

procedure TfmUchPlan.ActionRemUchPlanExecute(Sender: TObject);
var
  i: Integer;
begin
  if not cbApproved.Checked then
  begin
    // LocalLog.AddEntry('Удаление учебного плана '+dbcbSpclz.Text+' '+dbcbFormEd.Text+' '+dbcbYear.Text);
    if (Application.MessageBox
      (PChar('Вы уверены, что хотите удалить выбранный учебный план?'),
      'Учебный план', MB_YESNO) = mrYes) then
    begin
      TUchPlanController.Instance.DeleteUchPlan
        (dbcbYear.ListSource.DataSet.FieldByName('ik_uch_plan').AsInteger);
      TGeneralController.Instance.CloseLockupCB(@dbcbSpclz);
      dbcbSpclz.KeyValue := TUchPlanController.Instance.
        getCurrentSpecializations(@dbcbSpclz.ListSource.DataSet, fSpecIK, true);
      if dbcbSpclz.KeyValue = NULL then
        dbcbFormEd.KeyValue := TUchPlanController.Instance.getCurrentFormEd
          (@dbcbFormEd.ListSource.DataSet, fSpecIK, VidGos, true);
      for i := 0 to actList.ActionCount - 1 do
        actList.Actions[i].OnUpdate(actList.Actions[i]);
      // LocalLog.AddEntry('План удалён');
    end;
  end;
end;

procedure TfmUchPlan.ActionRemDiscExecute(Sender: TObject);
begin
  if not cbApproved.Checked then
  begin
      // LocalLog.AddEntry('Удаление дисциплины '+(dsDisc.DataSet.FieldByName('cname_disc').AsString));
      TUchPlanController.Instance.DeleteDiscFormUchPlan
        (dsDisc.DataSet.FieldByName('ik_disc_uch_plan').Value);
      GetDisciplines;
  end;
end;

procedure TfmUchPlan.GetDisciplines;
begin

  dsDisc.DataSet := TUchPlanController.Instance.getCurrentDisciplines(fTypePlan,
    IKPlan, dbcbCklDisc.KeyValue, dbcbGrpDisc.KeyValue, dbcbPdgrpDisc.KeyValue,
    cmbxSem.ItemIndex, strtoint(cmbxVidZan.KeyItems[cmbxVidZan.ItemIndex]),
    fGroupIK);
  if (dsDisc.DataSet.RecordCount = 0) then
    Panel6.Visible := false
  else
    Panel6.Visible := true;
end;

procedure TfmUchPlan.ActionSemLengthExecute(Sender: TObject);
begin
  if not cbApproved.Checked then
  begin
    frmUchPlSemLength := TfrmUchPlSemLength.CreateDialog(self, Connection, nil);
    // LocalLog.AddEntry('Длительность семестров');

    try
      frmUchPlSemLength.CallFrame := self;
      frmUchPlSemLength.IK := FIKPlan;
      // dbcbYear.ListSource.DataSet.FieldByName('ik_uch_plan').AsInteger;
      frmUchPlSemLength.dsSem.DataSet := dsSemLength.DataSet;
      frmUchPlSemLength.Read;
      if ((frmUchPlSemLength.ShowModal() = mrOk) or
        (frmUchPlSemLength.bbApply.Tag = 1)) then
      begin
        fSemesterStr := TUchPlanController.Instance.GetSemestersInStr
          (@dsSemLength.DataSet, FIKPlan, 'ik_vid_zanyat');
        dsDiscDataChange(Sender, nil);
      end;
    finally
      frmUchPlSemLength.Free;
    end;
  end;
end;

procedure TfmUchPlan.Label10MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  Label10.Hint := dsDisc.DataSet.FieldByName('cName_disc').Value;
end;

procedure TfmUchPlan.sgDiscMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  ACol, ARow: Integer;
begin
  inherited;
  sgDisc.MouseToCell(X, Y, ACol, ARow);
  if (ACol = 2) then
    sgDisc.Hint := sgDisc.Cells[ACol, ARow]
  else
    sgDisc.Hint := '';
end;

procedure TfmUchPlan.ScrollBox2Resize(Sender: TObject);
begin
  inherited;
  if (ScrollBox2.Width > 365) then
    sgDisc.Width := ScrollBox2.Width - 2
  else
    sgDisc.Width := 360;
  if (ScrollBox2.Height > 245) then
    sgDisc.Height := ScrollBox2.Height - 154
  else
    sgDisc.Height := 87;
end;

procedure TfmUchPlan.SetDiscTypeVisual(discType: Integer; showName: string);
begin
  Label12.Caption := 'Количество ' + showName + ' :';
  Label17.Left := 112;

  Label13.Enabled := discType = typeTypicalDisc;
  Label18.Enabled := discType = typeTypicalDisc;
  Label14.Enabled := discType = typeTypicalDisc;
  Label15.Enabled := discType = typeTypicalDisc;
  Label21.Enabled := discType = typeTypicalDisc;
  Label22.Enabled := discType = typeTypicalDisc;
  Label25.Enabled := discType = typeTypicalDisc;
  Label26.Enabled := discType = typeTypicalDisc;
  Label19.Enabled := discType = typeTypicalDisc;
  Label23.Enabled := discType = typeTypicalDisc;
  Label24.Enabled := discType = typeTypicalDisc;
  Label20.Enabled := discType = typeTypicalDisc;
end;

procedure TfmUchPlan.SetGroupUchPlan(const aGroupIK: Integer);
var
  Pname: string;
  spIK: Integer;
begin
  fGroupIK := aGroupIK;
  dbcbGroup.KeyValue := aGroupIK;
  fGroupDataSet.Close;
  fGroupDataSet.CommandText := 'select * from GrupInfo(' +
    IntToStr(fGroupIK) + ')';
  fGroupDataSet.Open;
  fGrupSpclszIK := fGroupDataSet.FieldByName('ik_spclz').AsInteger;

  // специализация группы
  Pname := fGroupDataSet.FieldByName('Cname_spec').AsString;
  if Pname <> '' then
    lblProfile.Caption := nameSpclz + ' группы: ' + Pname
  else
    lblProfile.Caption := nameSpclz + ' группы: общий';
  IKPlan := TUchPlanController.Instance.getUchPlanForGroup(aGroupIK);
end;

procedure TfmUchPlan.SetUchPlan(const aUchPlan: Integer);
var
  tempDS: TADODataSet;
  format: TFormatSettings;
  newDate: TDateFormat;
begin

  FIKPlan := aUchPlan;
  IsSetPlan := true;
  { if (dsSemLength.DataSet <> nil) then
    begin
    if dsSemLength.DataSet.Active then dsSemLength.DataSet.Close;
    tempDS:= dsSemLength.DataSet;
    dsSemLength.DataSet:= nil;
    tempDS.Free;         // здесь все ОК, т.к. гребаный Delphi по-тупому работает с указателями
    end; }

  tempDS := TGeneralController.Instance.GetNewADODataSet(true);
  tempDS.CommandText := 'Select * from GetUchPlanProperties(' +
    IntToStr(aUchPlan) + ')';
  tempDS.Open;

  VidGos := tempDS.FieldByName('VidGos').AsInteger;
  if VidGos < FGOS3 then
  begin
    dbcbSpclz.KeyValue := tempDS.FieldByName('ik_spclz').AsInteger;
    frmMain.StatusBar1.Panels[1].Text := frmMain.StatusBar1.Panels[1].Text +
      tempDS.FieldByName('cName_spclz_short').AsString + ', ';
  end;
  dbcbFormEd.KeyValue := tempDS.FieldByName('ik_form_ed').AsInteger;
  if aUchPlan <> 0 then
    dtpDateUtv.Date := vDateFormat.DecodeDate
      (tempDS.FieldByName('date_utv').AsString)
  else
    dtpDateUtv.Date := Now;
  dbcbYear.KeyValue := tempDS.FieldByName('ik_year').AsInteger;
  cbApproved.Checked := tempDS.FieldByName('IsChecked').AsBoolean;
  tempDS.Close;
  tempDS.Free;

  SetUchPlanProperties(FIKPlan);

  IsSetPlan := false;

end;

procedure TfmUchPlan.SetUchPlanProperties(const aUchPlan: Integer);
begin
  TGeneralController.Instance.CloseLockupCB(@dbcbCklDisc);
  TGeneralController.Instance.CloseLockupCB(@dbcbGrpDisc);
  TGeneralController.Instance.CloseLockupCB(@dbcbPdgrpDisc);
  frmMain.StatusBar1.Panels[1].Text := 'Учебный план: ';
  frmMain.StatusBar1.Panels[1].Text := frmMain.StatusBar1.Panels[1].Text +
    AnsiLowerCase(dbcbFormEd.Text) + ', ' + dbcbYear.Text;
  fSemesterStr := TUchPlanController.Instance.GetSemestersInStr
    (@dsSemLength.DataSet, IKPlan, 'ik_vid_zanyat');

  cmbxSem.Items.Clear;
  cmbxSem.Items.Add('все');
  dsSemLength.DataSet.First;
  while not dsSemLength.DataSet.Eof do
  begin
    cmbxSem.Items.Add(dsSemLength.DataSet.FieldByName('n_sem').AsString);
    dsSemLength.DataSet.Next;
  end;
  cmbxSem.ItemIndex := 0;
  cmbxVidZan.ItemIndex := 0;
  dbcbCklDisc.KeyValue := TUchPlanController.Instance.getAllDisciplineCycles
    (@dbcbCklDisc.ListSource.DataSet, VidGos, true);
  dbcbGrpDisc.KeyValue := TUchPlanController.Instance.getAllDisciplineGroups
    (@dbcbGrpDisc.ListSource.DataSet, VidGos, true);
  dbcbPdgrpDisc.KeyValue := TUchPlanController.Instance.getAllPodGroups
    (@dbcbPdgrpDisc.ListSource.DataSet, true);

end;

procedure TfmUchPlan.SetVisualProperty;
var
  i: Integer;
begin
  fCurrentDiscType := -1;
  fSemesterStr := '';

  sgDisc.Cells[0, 0] := 'Параметр';
  sgDisc.Cells[1, 0] := 'Значение';
  sgDisc.Cells[2, 0] := 'Кафедра';

  // flagFgos := false;
  TUchPlanController.Instance.MessageHandle := Application.Handle;

  TGeneralController.Instance.InitializeLockupCB(@dbcbFormEd, 'iK_form_ed',
    'Cname_form_ed');
  TGeneralController.Instance.InitializeLockupCB(@dbcbYear, 'ik_year_uch_pl',
    'year_value');
  TGeneralController.Instance.InitializeLockupCB(@dbcbSpclz, 'iK_spclz',
    'cName_spclz');
  TGeneralController.Instance.InitializeLockupCB(@dbcbGroup, 'iK_grup',
    'Cname_grup');
  TGeneralController.Instance.InitializeLockupCB(@dbcbCklDisc, 'IK_ckl_disc',
    'name_ckl_disc');
  TGeneralController.Instance.InitializeLockupCB(@dbcbGrpDisc, 'IK_grp_disc',
    'name_grp_disc');
  TGeneralController.Instance.InitializeLockupCB(@dbcbKaf, 'ik_kaf',
    'short_name_kaf');
  TGeneralController.Instance.InitializeLockupCB(@dbcbPdgrpDisc,
    'iK_pdgrp_disc', 'name_pdgrp_disc');

  dtpDateUtv.Date := Now;
  flagFgos := (VidGos = FGOS3);

  pnlSpclz.Visible := (VidGos = FGOS2);
  // видны ли зачетные единицы
  lblZachEd.Visible := (VidGos = FGOS3);
  Label32.Visible := (VidGos = FGOS3);
  // видны ли компетенции
  Label34.Visible := (VidGos = FGOS3);
  Label35.Visible := (VidGos = FGOS3);

  // доступны ли приложения № 3, 5, 12 (индексы 0, 2, 3 соответственно)
  PopupMenu2.Items.Items[0].Visible := (VidGos = FGOS3);
  PopupMenu2.Items.Items[2].Visible := (VidGos = FGOS3);
  PopupMenu2.Items.Items[3].Visible := (VidGos = FGOS3);

  dsGetFgosBySpec.DataSet := TFgosController.Instance.getFgosBySpec(fSpecIK);
  dsGetAllDiscFgos.DataSet := TGeneralController.Instance.
    GetNewADODataSet(false);
  dsGetAllComp.DataSet := TGeneralController.Instance.GetNewADODataSet(false);
  dsComp_Disc.DataSet := TGeneralController.Instance.GetNewADODataSet(false);

  case (dirIK) of
    1:
      nameSpclz := 'Профиль';
    3:
      nameSpclz := 'Программа';
  else
    nameSpclz := 'Специализация';
  end;
  lblSpclz.Caption := nameSpclz + ':';

  for i := 0 to actList.ActionCount - 1 do
    actList.Actions[i].OnUpdate(actList.Actions[i]);

  dbgDisc.DataSource.DataSet.FieldByName('cName_spclz_short').Visible :=
    (VidGos = FGOS3);

  // dsGetFgosBySpec.DataSet:=TFgosController.Instance.getFgosBySpec(fSpecIK);

end;

procedure TfmUchPlan.dbcbFormEdKeyValueChanged(Sender: TObject);
var
  spz: Integer;
begin

  if (dbcbFormEd.KeyValue <> NULL) then
  begin
    fFormIK := dbcbFormEd.KeyValue;
    if fTypePlan = key_ModelPlan then
    begin
      TGeneralController.Instance.CloseLockupCB(@dbcbYear);
      dbcbYear.KeyValue := TUchPlanController.Instance.getCurrentYears
        (@dbcbYear.ListSource.DataSet, fSpecIK, spz, dbcbFormEd.KeyValue,
        VidGos, true);
    end;
  end;
end;

procedure TfmUchPlan.dbcbGroupKeyValueChanged(Sender: TObject);
begin
  Group := (Sender as TDBLookupComboboxEh).KeyValue;
end;

procedure TfmUchPlan.dbcbSpclzKeyValueChanged(Sender: TObject);
begin
  fSpclzIK := dbcbSpclz.KeyValue;
end;

procedure TfmUchPlan.dbcbYearKeyValueChanged(Sender: TObject);
var
  tempDS: TADODataSet;
begin
  if dbcbYear.KeyValue <> NULL then
  begin
    fYearIK := dbcbYear.KeyValue;
    if fTypePlan = key_ModelPlan then
    begin
      tempDS := TGeneralController.Instance.GetNewADODataSet(true);
      tempDS.CommandText := 'select * from Uch_pl where ik_year_uch_pl = ' +
        IntToStr(dbcbYear.KeyValue) + ' and ik_spec=' + IntToStr(fSpecIK) +
        ' and ik_form_ed=' + IntToStr(dbcbFormEd.KeyValue) + ' and is_main = 1';
      tempDS.Open;
      dtpDateUtv.Date := vDateFormat.DecodeDate(tempDS.FieldByName('date_utv')
        .AsString);
      FIKPlan := tempDS.FieldByName('ik_uch_plan').AsInteger;
      if tempDS.FieldByName('IsChecked').AsBoolean then
      begin
        cbApproved.State := cbChecked;
        cbApproved.Font.Style := cbApproved.Font.Style + [fsBold];
      end
      else
      begin
        cbApproved.State := cbUnChecked;
        cbApproved.Font.Style := cbApproved.Font.Style - [fsBold];
      end;
      tempDS.Close;
      tempDS.Free;
      SetUchPlanProperties(FIKPlan);
    end;
  end;
end;

procedure TfmUchPlan.dbcbCklDiscKeyValueChanged(Sender: TObject);
begin
  if dsDisc <> nil then
    if dsDisc.DataSet <> nil then
      if dsDisc.DataSet.Active then
        dsDisc.DataSet.Close;
  if (dbcbCklDisc.KeyValue <> NULL) and (dbcbGrpDisc.KeyValue <> NULL) and
    (dbcbYear.KeyValue <> NULL) and (cmbxSem.ItemIndex >= 0) and
    (cmbxVidZan.ItemIndex >= 0) and (dbcbPdgrpDisc.KeyValue <> NULL) then
    GetDisciplines
  else
    Panel6.Visible := false;
end;

procedure TfmUchPlan.dsDiscDataChange(Sender: TObject; Field: TField);
var
  i, lect, lab, pract, kol_rec: Integer;
  lTypeDisc, lGosID, lHour_gos, lDiscUP, lDiscIK, lZnachZE, lIndiv,
    lEdIK: Integer;
  lShowEd: string;
  slColumnKafedra, slColumnValues: TStringList;
begin
  try
    kol_rec := dsDisc.DataSet.RecordCount;
    Panel6.Visible := true;
    ScrollBox2Resize(nil);

    // загруженные данные по дисциплине
    lTypeDisc := dsDisc.DataSet.FieldByName('ik_type_disc').AsInteger;
    lHour_gos := IfNull(dsDisc.DataSet.FieldByName('iHour_gos').Value, 0);
    lDiscUP := dsDisc.DataSet.FieldByName('ik_disc_uch_plan').AsInteger; // дисциплина учебного плана
    lDiscIK := dsDisc.DataSet.FieldByName('ik_disc').AsInteger; // дисциплина
    lGosID := IfNull(dsGetFgosBySpec.DataSet.FieldByName('IDGos').Value, 0);
    lIndiv := dsDisc.DataSet.FieldByName('iIndivid').AsInteger;
    lEdIK := dsDisc.DataSet.FieldByName('ik_ed_izm').AsInteger;
    lShowEd := dsDisc.DataSet.FieldByName('ShowToUser').AsString;

    if lTypeDisc <> fCurrentDiscType then
    begin
      fCurrentDiscType := lTypeDisc;
      GetSemesters();
    end;

    lblShifr.Caption := IfNull(dsDisc.DataSet.FieldByName('cname_ckl_disc1').Value, '<не указано>');
    Label17.Caption := GetTimeByType(lEdIK, lHour_gos);
    TGeneralController.Instance.SetCaptionDots(@Label10,       //если длинная дисциплина, то сократить название
      dsDisc.DataSet.FieldByName('cName_disc').AsString, 100);

    slColumnKafedra := TStringList.Create;
    slColumnValues := TStringList.Create;
    try
      TUchPlanController.Instance.getColumnsValues  // выгрузить content дисциплины
        (lDiscUP, lect, lab, pract, slColumnValues, @slColumnKafedra, false);

      // вывод зачетных единиц (физ-ра: 1 ЗЕ = 200 часов) для ФГОС 3 поколения
      if (VidGos = FGOS3) and (lGosID <> 0) then
      begin
        Label35.Caption := TUchPlanController.Instance.GetCompetences(lDiscUP);  // вывести компетенции

        if (lHour_gos = 0) then lblZachEd.Caption := '0'
        else
        begin
          dsDiscZE.DataSet := TUchPlanController.Instance.getDiscZE(lGosID);    // получить значение З.Е.
          lZnachZE := dsDiscZE.DataSet.FieldByName('znach_ZE').AsInteger;

          if lDiscIK = FISCULTURA then lblZachEd.Caption := IntToStr(FISCULTURA_ZE)
          else
            if lEdIK = Days then lblZachEd.Caption := IntToStr(round(lHour_gos / 6 * 1.5))
              else lblZachEd.Caption := IntToStr(round(lHour_gos / lZnachZE));
        end;
      end
      else
      begin
        lblZachEd.Visible := false;
        Label32.Visible := false;
      end;

      if fCurrentDiscType = typeTypicalDisc then
      begin
        Label18.Caption := IntToStr(lect);
        Label21.Caption := IntToStr(lab);
        Label22.Caption := IntToStr(pract);
        Label26.Caption := IntToStr(pract + lab + lect);
        Label23.Caption := IntToStr(lIndiv);
        Label24.Caption := IntToStr(lHour_gos - (pract + lab + lect) - lIndiv);
      end
      else
      begin
        Label18.Caption := '-';
        Label21.Caption := '-';
        Label22.Caption := '-';
        Label26.Caption := '-';
        Label23.Caption := '-';
        Label24.Caption := '-';
      end;

      //вывод содержания дисциплины
      for i := 0 to slColumnValues.Count - 1 do
      begin
        sgDisc.Cells[1, i + 1] := slColumnValues[i];
        sgDisc.Cells[2, i + 1] := slColumnKafedra[i];
      end;
      SetDiscTypeVisual(fCurrentDiscType, lShowEd);

    except  //если загрузить содержание дисциплины не удалось
      on E: Exception do
      begin
        raise EApplicationException.Create
          ('Произошла ошибка при выборе данных о дисциплине.',
          Exception.Create(E.Message));
        exit;
      end;
    end;

    slColumnValues.Free;
    slColumnKafedra.Free;
  except
    exit;
  end;
end;

procedure TfmUchPlan.dbgDiscKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
    dbgDiscDblClick(Sender);
end;

procedure TfmUchPlan.dbgDiscDblClick(Sender: TObject);
begin
  inherited;
  if (dsDisc.DataSet.Active) and
    (dsDisc.DataSet.FieldByName('ik_disc').AsInteger > 0) then
    ActionEditDiscExecute(Sender);
end;

procedure TfmUchPlan.GetSemesters();
var
  i: Integer;
  tempStr: TStringList;
begin
  if (dbcbYear.KeyValue <> NULL) then
  begin
    try
      tempStr := TUchPlanController.Instance.getColumnsNames(fSemesterStr,
        fCurrentDiscType);
      sgDisc.RowCount := tempStr.Count + 1;
      for i := 0 to tempStr.Count - 1 do
        sgDisc.Cells[0, i + 1] := tempStr[i];
    finally
      if Assigned(tempStr) then
        tempStr.Free;
    end;
  end;
end;


procedure TfmUchPlan.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if ToolButton5.Down then
  begin
    dbcbKaf.ListSource.DataSet.Close;
    ToolButton5.Down := false;
    Panel8.Visible := false;
  end;
end;

procedure TfmUchPlan.actLoadSelectionUpdate(Sender: TObject);
begin
  inherited;
  actLoadSelection.Enabled := dbcbKaf.KeyValue <> NULL;
end;

procedure TfmUchPlan.cbApprovedMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  tempProc: TADOStoredProc;
begin
  tempProc := TADOStoredProc.Create(nil);
  try
    tempProc.ProcedureName := 'ChangePlanStatus;1';
    tempProc.Connection := dm.DBConnect;
    tempProc.Parameters.CreateParameter('@ik_uch_plan', ftInteger, pdInput,
      4, FIKPlan);
    tempProc.Open;
    if (Sender as TCheckBox).Checked then
      cbApproved.Font.Style := cbApproved.Font.Style - [fsBold]
    else
      cbApproved.Font.Style := cbApproved.Font.Style + [fsBold];
  except
    MessageBox(Handle, 'У вас нет доступа на изменение статуса плана.',
      'Запрет на редактирование', MB_OK);
  end;
  tempProc.Free;
end;

procedure TfmUchPlan.actLoadSelectionExecute(Sender: TObject);
begin
  ToolButton5.Down := false;
  Panel8.Visible := false;
  Panel9.Left := round((Width - Panel9.Width) / 2);
  Panel9.Top := round((Height - Panel9.Height) / 2);
  Panel9.Visible := true;
  Refresh;
  try
    fCurrentDiscType := -1;
    TUchPlanController.Instance.LoadSelection
      (dbcbYear.ListSource.DataSet.FieldByName('ik_uch_plan').AsInteger,
      dbcbKaf.KeyValue, fSemesterStr, @ProgressBar1, @dsSemLength.DataSet);
    dbcbKaf.ListSource.DataSet.Close;
  finally
    Panel9.Visible := false;
  end;
end;

procedure TfmUchPlan.CloseFrame;
begin
  if dsDisc <> nil then
    if dsDisc.DataSet <> nil then
      if dsDisc.DataSet.Active then
        dsDisc.DataSet.Close;

  TGeneralController.Instance.ReleaseLockupCB(@dbcbGrpDisc);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbCklDisc);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbYear);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbFormEd);

  { if VidGos<>FGOS3 then
    TGeneralController.Instance.ReleaseLockupCB(@dbcbSpclz); }
  TGeneralController.Instance.ReleaseLockupCB(@dbcbKaf);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbPdgrpDisc);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbGroup);
  inherited;
end;

procedure TfmUchPlan.actBRSExecute(Sender: TObject);
begin
  { dmUchPlan.aspSetBRS.Active:=false;
    dmUchPlan.aspSetBRS.Parameters[1].value:=dbcbYear.ListSource.DataSet.FieldByName('ik_uch_plan').AsInteger;
    dmUchPlan.aspSetBRS.Parameters[2].value:=cbBRS.Checked;
    dmUchPlan.aspSetBRS.ExecProc; }
end;

procedure TfmUchPlan.actBRSUpdate(Sender: TObject);
begin
  { if dmUchPlan.adodsUchPlan.FieldByName('isBRSPlan').Value=NULL then
    cbBRS.Checked:=false else
    cbBRS.Checked:=dmUchPlan.adodsUchPlan.FieldByName('isBRSPlan').Value;
    dmUchPlan.qCanRemoveBRS.Active:=false;
    dmUchPlan.qCanRemoveBRS.SQL.Clear;
    dmUchPlan.qCanRemoveBRS.SQL.Add('select dbo.CanRemoveBRS('+inttostr(IKPlan)+') as Can');
    dmUchPlan.qCanRemoveBRS.Active:=true;
    dmUchPlan.qCanRemoveBRS.First;
    if dmUchPlan.qCanRemoveBRS.FieldByName('Can').Value then
    actBRS.Enabled:=true
    //cbBRS.Checked:=dmUchPlan.adodsUchPlan.FieldByName('IsBRSPlan').Value;
    else
    if dmUchPlan.adodsUchPlan.FieldByName('isBRSPlan').Value then
    begin
    actBRS.Enabled:=false;
    cbBRS.Checked:=true;
    end; }
end;

procedure TfmUchPlan.actExportExecute(Sender: TObject);
begin
  if not ToolButton5.Down then
  begin
    TUchPlanController.Instance.getAllDepartments
      (@dbcbKaf.ListSource.DataSet, true);
    // dbcbKaf.KeyValue:= 1;
    ToolButton5.Down := true;
    Panel8.Visible := true;
  end;
end;

procedure TfmUchPlan.actFgosApp12Execute(Sender: TObject);
var
  Report: TFgos_Application12Report;
  IDGos: Integer;
begin
  IDGos := dsGetFgosBySpec.DataSet.FieldByName('IDGos').Value;
  dsGetDataTitle.DataSet := TFgosController.Instance.GetDataTitle(IDGos);
  dsComp_Disc.DataSet.Close;
  (dsComp_Disc.DataSet as TADODataSet).CommandText :=
    'select c.ik_competence, Scd.ik_disc_uch_plan from ' +
    'Competence c inner join Structure_competence Sc on c.ik_competence=Sc.ik_competence '
    + 'inner join Struct_competence_sv_disc Scd on ' +
    'Sc.ik_structure_competence=Scd.ik_structure_competence ' +
    'inner join sv_disc sd on Scd.ik_disc_uch_plan=sd.ik_disc_uch_plan ' +
    'where c.IDGos= ' + IntToStr(IDGos) + ' and sd.ik_uch_plan= ' +
    IntToStr(IKPlan);
  dsComp_Disc.DataSet.Open;
  dsComp_Disc.DataSet.DisableControls;

  dsGetAllDiscFgos.DataSet.Close;
  dsGetAllDiscFgos.DataSet := dsDisc.DataSet;
  dsGetAllDiscFgos.DataSet.Open;
  dsGetAllDiscFgos.DataSet.DisableControls;

  dsGetAllComp.DataSet.Close;
  (dsGetAllComp.DataSet as TADODataSet).CommandText :=
    'select ik_competence, short_Name from ' + 'Competence where IDGos = ' +
    IntToStr(IDGos) + ' order by short_Name ';
  dsGetAllComp.DataSet.Open;
  dsGetAllComp.DataSet.DisableControls;

  Report := TFgos_Application12Report.Create(nil, dsGetDataTitle.DataSet,
    dsGetAllComp.DataSet, dsGetAllDiscFgos.DataSet, dsComp_Disc.DataSet);
  Report.ReportTemplate := ExtractFilePath(Application.ExeName) +
    'reports\FgosApplicationTwelve.xlt';
  TWaitingController.GetInstance.Process(Report);
  Report.Show;
  Report.Free;

end;

procedure TfmUchPlan.actFgosApp12Update(Sender: TObject);
begin
  // inherited;

end;

procedure TfmUchPlan.actFgosApp3Execute(Sender: TObject);
var
  Report: TFgos_Application3Report;
  IDGos: Integer;
begin
  IDGos := dsGetFgosBySpec.DataSet.FieldByName('IDGos').Value;

  dsGetAllDiscFgos.DataSet.Close;
  dsGetAllDiscFgos.DataSet := dsDisc.DataSet;
  dsGetAllDiscFgos.DataSet.Open;
  dsGetAllDiscFgos.DataSet.DisableControls;

  dsGetDataTitle.DataSet := TFgosController.Instance.GetDataTitle(IDGos);
  Report := TFgos_Application3Report.Create(nil, dsGetDataTitle.DataSet,
    dsGetAllDiscFgos.DataSet, IKPlan, IDGos);
  Report.ReportTemplate := ExtractFilePath(Application.ExeName) +
    'reports\FgosApplicationThree.xlt';
  TWaitingController.GetInstance.Process(Report);
  Report.Show;
  Report.Free;

end;

procedure TfmUchPlan.actFgosApp3Update(Sender: TObject);
begin
  // inherited;

end;

procedure TfmUchPlan.actFgosApp5Execute(Sender: TObject);
var
  Report: TFgos_Application5Report;
begin
  // inherited;
  Report := TFgos_Application5Report.Create(nil, dsGetDataTitle.DataSet);
  Report.ReportTemplate := ExtractFilePath(Application.ExeName) +
    'reports\FgosApplicationFive.xlt';
  TWaitingController.GetInstance.Process(Report);
  Report.Show;
  Report.Free;
end;

procedure TfmUchPlan.actFgosApp5Update(Sender: TObject);
begin
  // inherited;

end;

end.
