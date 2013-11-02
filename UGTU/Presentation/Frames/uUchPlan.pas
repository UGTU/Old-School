unit uUchPlan;
   {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseFrame, ExtCtrls, StdCtrls, Buttons, ComCtrls, DB, ADODB,
  ImgList, ToolWin, ActnList, Grids, DBGrids, DBGridEh, Menus, Mask,
  DBCtrlsEh, DBLookupEh, UchPlanController, GeneralController, GridsEh, DBTVSpecobj, udmUchPlan,
  uFgosController, Fgos_Application3Report, Fgos_Application5Report,
  Fgos_Application12Report,uWaitingController, uAddDiscRelation;

const FISCULTURA=10; //для особого учета зачетных единиц физической культуры

type
  TfmUchPlan = class(TfmBase)
    Panel3: TPanel;
    Panel4: TPanel;
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
    Label1: TLabel;
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
    Label11: TLabel;
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
    dbcbSpclz: TDBLookupComboboxEh;
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
    Label33: TLabel;
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
    procedure ActionRemUchPlanUpdate(Sender: TObject);
    procedure ActionRemUchPlanExecute(Sender: TObject);
    procedure ActionRemDiscUpdate(Sender: TObject);
    procedure ActionAddUchPlanUpdate(Sender: TObject);
    procedure ActionAddDiscExecute(Sender: TObject);
    procedure ActionEditDiscExecute(Sender: TObject);
    procedure ActionEditUchPlanExecute(Sender: TObject);
    procedure ActionRemDiscExecute(Sender: TObject);
    procedure ActionSemLengthExecute(Sender: TObject);
    procedure Label10MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sgDiscMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ScrollBox2Resize(Sender: TObject);
    procedure dbcbSpclzKeyValueChanged(Sender: TObject);
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
  private
    fdirIK: integer;
    fIK: integer;
    fCurrentDiscType: integer;
    fSemesterStr: string;
    fVidGos:integer;
    flagFgos:boolean;
    procedure SetDiscType(discType: Integer);
    procedure GetDisciplines();
    procedure GetSemesters();
  public
    IKPlan:integer;
    procedure CloseFrame; override;
    property IK: Integer read fIK write fIK;
    property dirIK: Integer read fdirIK write fdirIK;
    property VidGos: Integer read fVidGos write fVidGos;
    procedure Read;
  end;

var
  fmUchPlan: TfmUchPlan;

implementation

uses uUchPlanSemLength, uUchPlanAddNew, uUchPlanAddDisc, uMain, uDMFgos;

{$R *.dfm}

procedure TfmUchPlan.Read;
var
  i:integer;
begin
  inherited;
  fCurrentDiscType:= -1;
  fSemesterStr:= '';

  sgDisc.Cells[0,0]:= 'Параметр';
  sgDisc.Cells[1,0]:= 'Значение';
  sgDisc.Cells[2,0]:= 'Кафедра';

  flagFgos := false;
  TUchPlanController.Instance.MessageHandle:= Application.Handle;
  TGeneralController.Instance.InitializeLockupCB(@dbcbSpclz, 'iK_spclz', 'cName_spclz');
  TGeneralController.Instance.InitializeLockupCB(@dbcbFormEd, 'iK_form_ed', 'Cname_form_ed');
  TGeneralController.Instance.InitializeLockupCB(@dbcbYear, 'ik_year_uch_pl', 'year_value');
 // TGeneralController.Instance.InitializeLockupCB(@dbcbYearUtv, 'ik_year_uch_pl', 'year_value');
  dtpDateUtv.Date := Now;
  TGeneralController.Instance.InitializeLockupCB(@dbcbCklDisc, 'IK_ckl_disc', 'name_ckl_disc');
  TGeneralController.Instance.InitializeLockupCB(@dbcbGrpDisc, 'IK_grp_disc', 'name_grp_disc');
  TGeneralController.Instance.InitializeLockupCB(@dbcbKaf, 'ik_kaf', 'short_name_kaf');
  TGeneralController.Instance.InitializeLockupCB(@dbcbPdgrpDisc,'iK_pdgrp_disc', 'name_pdgrp_disc');
  if (VidGos=2) then flagFgos:=true;

  //видны ли зачетные единицы
  Label33.Visible:= (VidGos=2);
  Label32.Visible:= (VidGos=2);

  //видны ли компетенции
  Label34.Visible:= (VidGos=2);
  Label35.Visible:= (VidGos=2);

  //дотупны ли приложения № 3, 5, 12 (индексы 0, 2, 3 соответственно)
  PopupMenu2.Items.Items[0].Visible:=  (VidGos=2);
  PopupMenu2.Items.Items[2].Visible:=  (VidGos=2);
  PopupMenu2.Items.Items[3].Visible:=  (VidGos=2);

  dsGetFgosBySpec.DataSet:=TFgosController.Instance.getFgosBySpec(IK);
  dsGetAllDiscFgos.DataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  dsGetAllComp.DataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  dsComp_Disc.DataSet:= TGeneralController.Instance.GetNewADODataSet(false);

//  dsGetFgosBySpec.DataSet.FieldByName('IDGos').Value;
  case(dirIK) of
  1: Label1.Caption:='Профиль:';
  3: Label1.Caption:='Программа:';
  else Label1.Caption:='Специализация:';
  end;
  //если нет требуемого фгоса, то не грузим профили
  dsGetFgosBySpec.DataSet:=TFgosController.Instance.getFgosBySpec(IK);
  dbcbSpclz.KeyValue:= TUchPlanController.Instance.getCurrentSpecializations(@dbcbSpclz.ListSource.DataSet, IK, true);



  if (dsGetFgosBySpec.DataSet.FieldByName('IDGos').Value<>NULL or (VidGos<>2)) then
  begin
    
    if dbcbSpclz.KeyValue = NULL then
    begin
      dbcbFormEd.KeyValue:= TUchPlanController.Instance.getCurrentFormEd(@dbcbFormEd.ListSource.DataSet, IK, 0, true);
    end;
  end;
  for i:= 0 to actList.ActionCount-1 do
    actList.Actions[i].OnUpdate(actList.Actions[i]);
end;

procedure TfmUchPlan.ActionRemUchPlanUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= ({(dbcbSpclz.KeyValue <> NULL) and} (dbcbFormEd.KeyValue <> NULL) and (dbcbYear.KeyValue <> NULL));
end;

procedure TfmUchPlan.ActionRemDiscUpdate(Sender: TObject);
begin
  if (dsDisc.DataSet.Active) then
    (Sender as TAction).Enabled:= dsDisc.DataSet.RecordCount > 0
  else
    (Sender as TAction).Enabled:= false;
end;

procedure TfmUchPlan.ActionAddUchPlanUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= true;
end;

procedure TfmUchPlan.ActionAddDiscExecute(Sender: TObject);
begin
  frmUchPlanAddDisc:= TfrmUchPlanAddDisc.CreateDialog(Application, Connection, nil);
try
  frmUchPlanAddDisc.Tag:= 1;
  frmUchPlanAddDisc.IK:= -1;
  frmUchPlanAddDisc.iUchPlan:= dbcbYear.ListSource.DataSet.FieldByName('ik_uch_plan').AsInteger;
  frmUchPlanAddDisc.VidGos:=VidGos;
  frmUchPlanAddDisc.dbcbCklDisc.Tag:= dbcbCklDisc.KeyValue;
  frmUchPlanAddDisc.dbcbGrpDisc.Tag:= dbcbGrpDisc.KeyValue;
  frmUchPlanAddDisc.dbcbPdgrpDisc.Tag:= dbcbPdgrpDisc.KeyValue;
  frmUchPlanAddDisc.Read(fSemesterStr);
  if ((frmUchPlanAddDisc.ShowModal() = mrOk) or (frmUchPlanAddDisc.bbApply.Tag = 1)) then
    GetDisciplines;
finally
  frmUchPlanAddDisc.Free;
end;
end;

procedure TfmUchPlan.ActionEditDiscExecute(Sender: TObject);
var
  index:integer;
begin
  frmUchPlanAddDisc:= TfrmUchPlanAddDisc.CreateDialog(Application, Connection, nil);
 // LocalLog.AddEntry('Редактирование дисциплины '+Trim(dsDisc.DataSet.FieldByName('cname_disc').AsString));
try
  frmUchPlanAddDisc.IK:= dsDisc.DataSet.FieldByName('ik_disc_uch_plan').AsInteger;
  frmUchPlanAddDisc.iUchPlan:= dbcbYear.ListSource.DataSet.FieldByName('ik_uch_plan').AsInteger;
  frmUchPlanAddDisc.VidGos:=VidGos;
  frmUchPlanAddDisc.Tag:= 2;
  frmUchPlanAddDisc.Read(fSemesterStr);
  frmUchPlanAddDisc.Edit6.Text:= Trim(dsDisc.DataSet.FieldByName('cname_ckl_disc1').AsString);
  frmUchPlanAddDisc.iHour_gos:= dsDisc.DataSet.FieldByName('iHour_gos').AsInteger;
  frmUchPlanAddDisc.iIndivid:= dsDisc.DataSet.FieldByName('iIndivid').AsInteger;
  frmUchPlanAddDisc.dbcbDisc.KeyValue:= dsDisc.DataSet.FieldByName('ik_disc').AsInteger;
  frmUchPlanAddDisc.dbeGroupVibor.Value:= dsDisc.DataSet.FieldByName('ViborGroup').AsString;
  if (dsDisc.DataSet.FieldByName('ik_default_kaf').Value = NULL) then
    frmUchPlanAddDisc.dbcbKaf.KeyValue:= 1
  else
    frmUchPlanAddDisc.dbcbKaf.KeyValue:= dsDisc.DataSet.FieldByName('ik_default_kaf').AsInteger;
  frmUchPlanAddDisc.dbcbCklDisc.KeyValue:= dsDisc.DataSet.FieldByName('IK_ckl_disc').AsInteger;
  frmUchPlanAddDisc.dbcbGrpDisc.KeyValue:= dsDisc.DataSet.FieldByName('IK_grp_disc').AsInteger;
  frmUchPlanAddDisc.dbcbPdgrpDisc.KeyValue:= dsDisc.DataSet.FieldByName('iK_pdgrp_disc').AsInteger;
  index:= dsDisc.DataSet.FieldByName('ik_disc').AsInteger;
  frmUchPlanAddDisc.IsModified:= false;
  if ((frmUchPlanAddDisc.ShowModal() = mrOk) or (frmUchPlanAddDisc.bbApply.Tag = 1)) then
  begin
    GetDisciplines;
    dsDisc.DataSet.Locate('ik_disc',index,[loPartialKey]);
  end;
finally
  frmUchPlanAddDisc.Free;
end;
end;

procedure TfmUchPlan.ActionEditUchPlanExecute(Sender: TObject);
begin
//LocalLog.AddEntry('Добавление/редактирование учебного плана');
dsGetFgosBySpec.DataSet:=TFgosController.Instance.getFgosBySpec(IK);
if (dsGetFgosBySpec.DataSet.FieldByName('IDGos').Value=NULL and (VidGos=2))
then
  Application.MessageBox('Необходимо создать ФГОС для текущего направления подготовки','Учебный план',MB_ICONERROR)
else
  begin
    frmUchPlanAddNew:= TfrmUchPlanAddNew.CreateDialog(Application, Connection, nil);
    try
      try
        frmUchPlanAddNew.IK:= dbcbYear.ListSource.DataSet.FieldByName('ik_uch_plan').AsInteger;
      except
        frmUchPlanAddNew.IK:=0;
      end;
  //frmUchPlanAddNew.IK:= dbcbYear.ListSource.DataSet.FieldByName('ik_uch_plan').AsInteger;
      frmUchPlanAddNew.Tag:= (sender as TAction).Tag;
      frmUchPlanAddNew.Label2.Tag:= IK;
      frmUchPlanAddNew.Label3.Tag:=dirIK;
      frmUchPlanAddNew.Label1.Tag:=VidGos;
      frmUchPlanAddNew.CallFrame:= self;
      frmUchPlanAddNew.SpecFac:=TDBNodeSpecObject(frmMain.DBDekTreeView_TEST1.SelectedObject).ik;
      frmUchPlanAddNew.Read;
      if ((frmUchPlanAddNew.ShowModal() = mrOk) or (frmUchPlanAddNew.bbApply.Tag = 1)) then
      begin
        TGeneralController.Instance.CloseLockupCB(@dbcbSpclz);
        dbcbSpclz.ListSource.DataSet.Open;
        dbcbSpclz.KeyValue:= frmUchPlanAddNew.dbcbSpclz.KeyValue;
        dbcbFormEd.KeyValue:= frmUchPlanAddNew.dbcbFormEd.KeyValue;
        dbcbYear.KeyValue:= frmUchPlanAddNew.dbcbYear.KeyValue;
        dtpDateUtv.Date:= frmUchPlanAddNew.dtpDateUtv.Date;
    // LocalLog.AddEntry('Добавлен/изменен учебный план '+dbcbSpclz.Text+' '+dbcbFormEd.text+' '+dbcbYear.Text);
      end;
    finally
      frmUchPlanAddNew.Free;
    end;
  end;
end;

procedure TfmUchPlan.ActionRemUchPlanExecute(Sender: TObject);
var i: integer;
begin
//LocalLog.AddEntry('Удаление учебного плана '+dbcbSpclz.Text+' '+dbcbFormEd.Text+' '+dbcbYear.Text);
  if (Application.MessageBox(PChar('Вы уверены, что хотите удалить выбранный учебный план?'),'Учебный план',MB_YESNO) = mrYes) then
  begin
    TUchPlanController.Instance.DeleteUchPlan(dbcbYear.ListSource.DataSet.FieldByName('ik_uch_plan').AsInteger);
    TGeneralController.Instance.CloseLockupCB(@dbcbSpclz);
    dbcbSpclz.KeyValue:= TUchPlanController.Instance.getCurrentSpecializations(@dbcbSpclz.ListSource.DataSet, IK, true);
    if dbcbSpclz.KeyValue = NULL then
      dbcbFormEd.KeyValue:= TUchPlanController.Instance.getCurrentFormEd(@dbcbFormEd.ListSource.DataSet, IK, 0, true);
    for i:= 0 to actList.ActionCount-1 do
    actList.Actions[i].OnUpdate(actList.Actions[i]);
   // LocalLog.AddEntry('План удалён');
  end;
end;

procedure TfmUchPlan.ActionRemDiscExecute(Sender: TObject);
begin
  if (Application.MessageBox('Удалить выбранную дисциплину? ','Учебный план',MB_YESNO) = mrYes) then
  begin
   // LocalLog.AddEntry('Удаление дисциплины '+(dsDisc.DataSet.FieldByName('cname_disc').AsString));
    TUchPlanController.Instance.DeleteDiscFormUchPlan(dsDisc.DataSet.FieldByName('ik_disc_uch_plan').Value);
    GetDisciplines;
  end;
end;

procedure TfmUchPlan.GetDisciplines;
begin
  dsDisc.DataSet:= TUchPlanController.Instance.getCurrentDisciplines
  (dbcbYear.ListSource.DataSet.FieldByName('ik_uch_plan').AsInteger, dbcbCklDisc.KeyValue,
   dbcbGrpDisc.KeyValue, dbcbPdgrpDisc.KeyValue, cmbxSem.ItemIndex, strtoint(cmbxVidZan.KeyItems[cmbxVidZan.ItemIndex]));
  if (dsDisc.DataSet.RecordCount = 0) then
    Panel6.Visible:= false
  else Panel6.Visible:= true;
end;

procedure TfmUchPlan.ActionSemLengthExecute(Sender: TObject);
begin
  frmUchPlSemLength:= TfrmUchPlSemLength.CreateDialog(Self, Connection, nil);
 // LocalLog.AddEntry('Длительность семестров');

try
  frmUchPlSemLength.CallFrame:= self;
  frmUchPlSemLength.IK:= dbcbYear.ListSource.DataSet.FieldByName('ik_uch_plan').AsInteger;
  frmUchPlSemLength.dsSem.DataSet:= dsSemLength.DataSet;
  frmUchPlSemLength.Read;
  if ((frmUchPlSemLength.ShowModal() = mrOk) or (frmUchPlSemLength.bbApply.Tag = 1)) then
  begin
    fSemesterStr:= TUchPlanController.Instance.GetSemestersInStr(@dsSemLength.DataSet, dbcbYear.ListSource.DataSet.FieldByName('ik_uch_plan').AsInteger, 'ik_vid_zanyat');
    dsDiscDataChange(Sender, nil);
  end;
finally
  frmUchPlSemLength.Free;
end;
end;

procedure TfmUchPlan.Label10MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  Label10.Hint:= dsDisc.DataSet.FieldByname('cName_disc').Value;
end;

procedure TfmUchPlan.sgDiscMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  ACol, ARow:Integer;
begin
  inherited;
  sgDisc.MouseToCell(X, Y, ACol, ARow);
  if (ACol = 2) then
    sgDisc.Hint:= sgDisc.Cells[ACol, ARow]
  else
    sgDisc.Hint:= '';
end;

procedure TfmUchPlan.ScrollBox2Resize(Sender: TObject);
begin
  inherited;
  if (ScrollBox2.Width > 365) then
    sgDisc.Width:= ScrollBox2.Width - 2
  else
    sgDisc.Width:=360;
  if (ScrollBox2.Height > 245) then
    sgDisc.Height:= ScrollBox2.Height - 154
  else
    sgDisc.Height:= 87;
end;

procedure TfmUchPlan.SetDiscType(discType: Integer);
begin
  if (discType = 2) or (discType = 3)or(discType = 12) then
  begin
    Label12.Caption:= 'Количество недель:';
    Label17.Left:= 112;
  end
  else
  begin
    Label12.Caption:= 'Общее количество часов:';
    Label17.Left:= 142;
  end;
  Label13.Enabled:= discType = 1;
  Label18.Enabled:= discType = 1;
  Label14.Enabled:= discType = 1;
  Label15.Enabled:= discType = 1;
  Label21.Enabled:= discType = 1;
  Label22.Enabled:= discType = 1;
  Label25.Enabled:= discType = 1;
  Label26.Enabled:= discType = 1;
  Label19.Enabled:= discType = 1;
  Label23.Enabled:= discType = 1;
  Label24.Enabled:= discType = 1;
  Label20.Enabled:= discType = 1;
end;

procedure TfmUchPlan.dbcbSpclzKeyValueChanged(Sender: TObject);
var splzIK: integer;
begin
  TGeneralController.Instance.CloseLockupCB(@dbcbFormEd);
  if (dbcbSpclz.KeyValue = NULL) then
  begin
    dbcbSpclz.Text := '';
    splzIK:=0;
  end
  else splzIK := dbcbSpclz.KeyValue;
  if Assigned(dbcbFormEd.ListSource) then
    dbcbFormEd.KeyValue:= TUchPlanController.Instance.getCurrentFormEd(@dbcbFormEd.ListSource.DataSet, IK, splzIK, true);
end;

procedure TfmUchPlan.dbcbFormEdKeyValueChanged(Sender: TObject);
var spz: integer;
begin
  TGeneralController.Instance.CloseLockupCB(@dbcbYear);
 // TGeneralController.Instance.CloseLockupCB(@dbcbYearUtv);
  if ((dbcbFormEd.KeyValue <> NULL) {and (dbcbSpclz.KeyValue <> NULL)}) then
  begin
    if dbcbSpclz.KeyValue = NULL then spz := 0 else spz := dbcbSpclz.KeyValue;

    dbcbYear.KeyValue:= TUchPlanController.Instance.getCurrentYears(@dbcbYear.ListSource.DataSet, IK, spz, dbcbFormEd.KeyValue, true);
  //  dbcbYearUtv.KeyValue:= TUchPlanController.Instance.getCurrentYearsUtv(@dbcbYearUtv.ListSource.DataSet, IK, spz, dbcbFormEd.KeyValue, true);
    dbcbYear.ListSource.DataSet.Last;
 //   dbcbYearUtv.ListSource.DataSet.Last;
    dbcbYear.KeyValue:= dbcbYear.ListSource.DataSet.FieldByName('ik_year_uch_pl').Value;
 //   dbcbYearUtv.KeyValue:= dbcbYearUtv.ListSource.DataSet.FieldByName('ik_year_uch_pl').Value;
  end
  else dtpDateUtv.Date := Now;
end;

procedure TfmUchPlan.dbcbYearKeyValueChanged(Sender: TObject);
var
  tempDS: TDataSet;
begin
  TGeneralController.Instance.CloseLockupCB(@dbcbCklDisc);
  TGeneralController.Instance.CloseLockupCB(@dbcbGrpDisc);
  TGeneralController.Instance.CloseLockupCB(@dbcbPdgrpDisc);
  if (dsSemLength.DataSet <> nil) then
  begin
    if dsSemLength.DataSet.Active then dsSemLength.DataSet.Close;
    tempDS:= dsSemLength.DataSet;
    dsSemLength.DataSet:= nil;
    tempDS.Free;         // здесь все ОК, т.к. гребаный Delphi по-тупому работает с указателями
  end;

  if ({(dbcbSpclz.KeyValue <> NULL) and} (dbcbFormEd.KeyValue <> NULL) and (dbcbYear.KeyValue <> NULL)) then
  begin                                   
    frmMain.StatusBar1.Panels[1].Text:= 'Учебный план: ';
    if dbcbSpclz.KeyValue<>NULL then
      frmMain.StatusBar1.Panels[1].Text:=frmMain.StatusBar1.Panels[1].Text + dbcbSpclz.ListSource.DataSet.FieldByName('cName_spclz_short').AsString + ', ';
    frmMain.StatusBar1.Panels[1].Text:=frmMain.StatusBar1.Panels[1].Text + AnsiLowerCase(dbcbFormEd.Text) + ', ' + dbcbYear.Text;
    fSemesterStr:= TUchPlanController.Instance.GetSemestersInStr(@dsSemLength.DataSet, dbcbYear.ListSource.DataSet.FieldByName('ik_uch_plan').AsInteger, 'ik_vid_zanyat');
    IKPlan:=dbcbYear.ListSource.DataSet.FieldByName('ik_uch_plan').AsInteger;
    dmUchPlan.adodsUchPlan.close;
    dmUchPlan.adodsUchPlan.CommandText := 'select * from Uch_pl where (ik_uch_plan = '+inttostr(IkPlan)+')';
    dmUchPlan.adodsUchPlan.open;
    with dmUchPlan.adodsUchPlan do
    dtpDateUtv.Date := StrToDate(copy(FieldByName('date_utv').AsString,9,2) + '.' + copy(FieldByName('date_utv').AsString,6,2) + '.' +  copy(FieldByName('date_utv').AsString,0,4));

{  if (dmUchPlan.adodsUchPlan.FieldByName('IsBRSPlan').Value <> Null) then
    cbBRS.checked := dmUchPlan.adodsUchPlan.FieldByName('IsBRSPlan').Value
    else cbBRS.checked := false;}

    cmbxSem.Items.Clear;
    cmbxSem.Items.Add('все');
    dsSemLength.DataSet.First;
    while not dsSemLength.DataSet.Eof do
    begin
      cmbxSem.Items.Add(dsSemLength.DataSet.FieldByName('n_sem').AsString);
      dsSemLength.DataSet.Next;
    end;
    cmbxSem.ItemIndex:=0;
    cmbxVidZan.ItemIndex:=0;
    dbcbCklDisc.KeyValue:= TUchPlanController.Instance.getAllDisciplineCycles(@dbcbCklDisc.ListSource.DataSet, VidGos, true);
    dbcbGrpDisc.KeyValue:= TUchPlanController.Instance.getAllDisciplineGroups(@dbcbGrpDisc.ListSource.DataSet, VidGos, true);
    dbcbPdgrpDisc.KeyValue:=TUchPlanController.Instance.getAllPodGroups(@dbcbPdgrpDisc.ListSource.DataSet, true);
  end
  else frmMain.StatusBar1.Panels[1].Text:= 'Учебный план: <не выбран>';
end;

procedure TfmUchPlan.dbcbCklDiscKeyValueChanged(Sender: TObject);
begin
  if dsDisc <> nil then
    if dsDisc.DataSet <> nil then
      if dsDisc.DataSet.Active then dsDisc.DataSet.Close;
  if (dbcbCklDisc.KeyValue <> NULL) and (dbcbGrpDisc.KeyValue <> NULL)
    and (dbcbYear.KeyValue <> NULL) and (cmbxSem.ItemIndex >= 0)
    and (cmbxVidZan.ItemIndex >= 0) and (dbcbPdgrpDisc.KeyValue <> NULL) then
    GetDisciplines
  else Panel6.Visible:= false;
end;

procedure TfmUchPlan.dsDiscDataChange(Sender: TObject; Field: TField);
var
  i, lect, lab, pract:integer;
  slColumnKafedra, slColumnValues:TStringList;
begin
  if (Self.Connection <> nil) then
  if dsDisc.DataSet <> nil then
  if dsDisc.DataSet.Active then
  if (dsDisc.DataSet.RecordCount > 0) then
  begin
    Panel6.Visible:= true;
    ScrollBox2Resize(nil);
    if dsDisc.DataSet.FieldByName('ik_type_disc').AsInteger <> fCurrentDiscType then
    begin
      fCurrentDiscType:= dsDisc.DataSet.FieldByName('ik_type_disc').AsInteger;
      GetSemesters();
    end;

    if (dsDisc.DataSet.FieldByName('cname_ckl_disc1').Value <> NULL) then
      Label11.Caption:= dsDisc.DataSet.FieldByName('cname_ckl_disc1').AsString
    else
      Label11.Caption:= '<не указано>';
    TGeneralController.Instance.SetCaptionDots(@Label10, dsDisc.DataSet.FieldByName('cName_disc').AsString, 100);

    slColumnKafedra:= TStringList.Create;
    slColumnValues:= TStringList.Create;
    try
    TUchPlanController.Instance.getColumnsValues(dsDisc.DataSet.FieldByName('ik_disc_uch_plan').AsInteger, lect, lab, pract, slColumnValues, @slColumnKafedra, false);
    if (dsDisc.DataSet.FieldByName('iHour_gos').Value <> NULL) then
        Label17.Caption:= dsDisc.DataSet.FieldByName('iHour_gos').AsString
      else Label17.Caption:= '0';

      // вывод зачетных единиц (физ-ра: 1 ЗЕ = 200 часов) для ФГОС 3 поколения

     if (flagFgos)and(dsGetFgosBySpec.DataSet.FieldByName('IDGos').Value <> NULL) then
     begin
        if (dsDisc.DataSet.FieldByName('iHour_gos').Value <> NULL) then
        begin

          dsDiscZE.DataSet:=TUchPlanController.Instance.getDiscZE(dsGetFgosBySpec.DataSet.FieldByName('IDGos').Value);
          dsDiscExceptionZE.DataSet:=TUchPlanController.Instance.getDiscExceptionsZE(dsGetFgosBySpec.DataSet.FieldByName('IDGos').Value,
          dsDisc.DataSet.FieldByName('ik_disc').Value);
          if (dsDiscExceptionZE.DataSet.RecordCount = 0)
          then
            if dsDisc.DataSet.FieldByName('ik_disc').AsInteger=FISCULTURA then Label33.Caption:='2' else
            begin
              if (dsDisc.DataSet.FieldByName('ik_type_disc').AsInteger = 2)or(dsDisc.DataSet.FieldByName('ik_type_disc').AsInteger = 3)
              or(dsDisc.DataSet.FieldByName('ik_type_disc').AsInteger = 12) then
               Label33.Caption:= IntToStr(round(dsDisc.DataSet.FieldByName('iHour_gos').AsInteger*1.5))  else
              Label33.Caption:= IntToStr(round(dsDisc.DataSet.FieldByName('iHour_gos').AsInteger/dsDiscZE.DataSet.FieldByName('znach_ZE').AsInteger ))
            end
          else
            Label33.Caption:= IntToStr(round(dsDisc.DataSet.FieldByName('iHour_gos').AsInteger/dsDiscExceptionZE.DataSet.FieldByName('znach_ZE').AsInteger ))
          end
        else
        Label33.Caption:= '0';
     end else
     begin
     Label33.Visible:=false;
     Label32.Visible:=false;
     end;
      //  end
    if VidGos=2 then
    begin
      Label35.Caption := TUchPlanController.Instance.GetCompetences(dsDisc.DataSet.FieldByName('ik_disc_uch_plan').AsInteger);
    end;

    if fCurrentDiscType = 1 then
    begin
      Label18.Caption:= IntToStr(lect);
      Label21.Caption:= IntToStr(lab);
      Label22.Caption:= IntToStr(pract);
      Label26.Caption:= IntToStr(pract + lab + lect);
      Label23.Caption:= IntToStr(dsDisc.DataSet.FieldByName('iIndivid').AsInteger);
      Label24.Caption:= IntToStr(dsDisc.DataSet.FieldByName('iHour_gos').AsInteger - (pract + lab + lect) - dsDisc.DataSet.FieldByName('iIndivid').AsInteger);
    end
    else
    begin
      Label18.Caption:= '-';
      Label21.Caption:= '-';
      Label22.Caption:= '-';
      Label26.Caption:= '-';
      Label23.Caption:= '-';
      Label24.Caption:= '-';
    end;
    for i:= 0 to slColumnValues.Count-1 do
    begin
      sgDisc.Cells[1, i+1]:= slColumnValues[i];
      sgDisc.Cells[2, i+1]:= slColumnKafedra[i];
    end;
    SetDiscType(dsDisc.DataSet.FieldByName('ik_type_disc').AsInteger);
    finally
      slColumnValues.Free;
      slColumnKafedra.Free;
    end;
  end;
end;

procedure TfmUchPlan.dbgDiscKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then dbgDiscDblClick(Sender);
end;

procedure TfmUchPlan.dbgDiscDblClick(Sender: TObject);
begin
  inherited;
  if (dsDisc.DataSet.Active) and (dsDisc.DataSet.FieldByName('ik_disc').AsInteger>0) then ActionEditDiscExecute(Sender);
end;

procedure TfmUchPlan.GetSemesters();
var
  i: integer;
  tempStr: TStringList;
begin
  if (dbcbYear.KeyValue <> NULL) then
  begin
    try
      tempStr:= TUchPlanController.Instance.getColumnsNames(fSemesterStr, fCurrentDiscType);
      sgDisc.RowCount:= tempStr.Count + 1;
      for i:= 0 to tempStr.Count - 1 do
        sgDisc.Cells[0, i + 1]:= tempStr[i];
    finally
      if Assigned(tempStr) then tempStr.Free;
    end;
  end;
end;

procedure TfmUchPlan.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if ToolButton5.Down then
  begin
    dbcbKaf.ListSource.DataSet.Close;
    ToolButton5.Down:= false;
    Panel8.Visible:= false;
  end;
end;

procedure TfmUchPlan.actLoadSelectionUpdate(Sender: TObject);
begin
  inherited;
  actLoadSelection.Enabled:= dbcbKaf.KeyValue <> NULL;
end;

procedure TfmUchPlan.actLoadSelectionExecute(Sender: TObject);
begin
  ToolButton5.Down:= false;
  Panel8.Visible:= false;
  Panel9.Left:= round((Width - Panel9.Width)/2);
  Panel9.Top:= round((Height - Panel9.Height)/2);
  Panel9.Visible:= true;
  Refresh;
try
  fCurrentDiscType:= -1;
  TUchPlanController.Instance.LoadSelection(dbcbYear.ListSource.DataSet.FieldByName('ik_uch_plan').AsInteger, dbcbKaf.KeyValue, fSemesterStr, @ProgressBar1, @dsSemLength.DataSet);
  dbcbKaf.ListSource.DataSet.Close;
finally
  Panel9.Visible:= false;
end;
end;

procedure TfmUchPlan.CloseFrame;
begin
  if dsDisc <> nil then
    if dsDisc.DataSet <> nil then
      if dsDisc.DataSet.Active then dsDisc.DataSet.Close;

  TGeneralController.Instance.ReleaseLockupCB(@dbcbGrpDisc);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbCklDisc);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbYear);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbFormEd);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbSpclz);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbKaf);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbPdgrpDisc);
  inherited;
end;

procedure TfmUchPlan.actBRSExecute(Sender: TObject);
begin
{dmUchPlan.aspSetBRS.Active:=false;
dmUchPlan.aspSetBRS.Parameters[1].value:=dbcbYear.ListSource.DataSet.FieldByName('ik_uch_plan').AsInteger;
dmUchPlan.aspSetBRS.Parameters[2].value:=cbBRS.Checked;
dmUchPlan.aspSetBRS.ExecProc;}
end;

procedure TfmUchPlan.actBRSUpdate(Sender: TObject);
begin
{if dmUchPlan.adodsUchPlan.FieldByName('isBRSPlan').Value=NULL then
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
  end;}
end;

procedure TfmUchPlan.actExportExecute(Sender: TObject);
begin
  if not ToolButton5.Down then
  begin
    TUchPlanController.Instance.getAllDepartments(@dbcbKaf.ListSource.DataSet, true);
//    dbcbKaf.KeyValue:= 1;
    ToolButton5.Down:= true;
    Panel8.Visible:= true;
  end;
end;

procedure TfmUchPlan.actFgosApp12Execute(Sender: TObject);
var Report: TFgos_Application12Report;
 IDGos: integer;
begin
IDGos:= dsGetFgosBySpec.DataSet.FieldByName('IDGos').Value;
dsGetDataTitle.DataSet:=TFgosController.Instance.GetDataTitle(IDGos);
  dsComp_Disc.DataSet.Close;
  (dsComp_Disc.DataSet as TADODataSet).CommandText :=
  'select c.ik_competence, Scd.ik_disc_uch_plan from '+
  'Competence c inner join Structure_competence Sc on c.ik_competence=Sc.ik_competence '+
  'inner join Struct_competence_sv_disc Scd on '+
  'Sc.ik_structure_competence=Scd.ik_structure_competence '+
  'inner join sv_disc sd on Scd.ik_disc_uch_plan=sd.ik_disc_uch_plan '+
  'where c.IDGos= '+ inttostr(IDGos)+ ' and sd.ik_uch_plan= '+ inttostr(IKPlan);
  dsComp_Disc.DataSet.Open;
  dsComp_Disc.DataSet.DisableControls;

dsGetAllDiscFgos.DataSet.Close;
dsGetAllDiscFgos.DataSet := dsDisc.DataSet;
dsGetAllDiscFgos.DataSet.Open;
dsGetAllDiscFgos.DataSet.DisableControls;

 dsGetAllComp.DataSet.Close;
(dsGetAllComp.DataSet as TADODataSet).CommandText := 'select ik_competence, short_Name from '+
'Competence where IDGos = '+ inttostr(IDGos)+' order by short_Name ';
dsGetAllComp.DataSet.Open;
dsGetAllComp.DataSet.DisableControls;

 Report := TFgos_Application12Report.Create(nil,dsGetDataTitle.DataSet,
 dsGetAllComp.DataSet,dsGetAllDiscFgos.DataSet,dsComp_Disc.DataSet);
 Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\FgosApplicationTwelve.xlt';
 TWaitingController.GetInstance.Process(Report);
  Report.Show;
  Report.Free;

end;

procedure TfmUchPlan.actFgosApp12Update(Sender: TObject);
begin
//  inherited;

end;

procedure TfmUchPlan.actFgosApp3Execute(Sender: TObject);
var Report: TFgos_Application3Report;
 IDGos: integer;
begin
IDGos:= dsGetFgosBySpec.DataSet.FieldByName('IDGos').Value;

dsGetAllDiscFgos.DataSet.Close;
dsGetAllDiscFgos.DataSet := dsDisc.DataSet;
dsGetAllDiscFgos.DataSet.Open;
dsGetAllDiscFgos.DataSet.DisableControls;

dsGetDataTitle.DataSet:=TFgosController.Instance.GetDataTitle(IDGos);
 Report := TFgos_Application3Report.Create(nil,dsGetDataTitle.DataSet, dsGetAllDiscFgos.DataSet,IKPlan,IDGos);
 Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\FgosApplicationThree.xlt';
 TWaitingController.GetInstance.Process(Report);
  Report.Show;
  Report.Free;

 end;

procedure TfmUchPlan.actFgosApp3Update(Sender: TObject);
begin
//  inherited;

end;

procedure TfmUchPlan.actFgosApp5Execute(Sender: TObject);
var Report: TFgos_Application5Report;
begin
//  inherited;
  Report := TFgos_Application5Report.Create(nil,dsGetDataTitle.DataSet);
 Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\FgosApplicationFive.xlt';
 TWaitingController.GetInstance.Process(Report);
  Report.Show;
  Report.Free;
end;

procedure TfmUchPlan.actFgosApp5Update(Sender: TObject);
begin
//  inherited;

end;

end.
