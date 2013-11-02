unit uSheduleAddAudEvent;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, DBGridEh, NagruzkaController,
  DBLookupEh, DBCtrlsEh, Mask, DB, ADODB, SheduleController, GeneralController,
  ComCtrls, ImgList, ToolWin, SheduleClasses, Menus, Contnrs, SheduleGrids;

type
  TCapType = (ctAddEvent, ctEditEvent, ctAddException, ctEditException);

  TfrmSheduleAddAudEvent = class(TfrmBaseDialog)
    Panel4: TPanel;
    dbcbCalcUnit: TDBLookupComboboxEh;
    dbcbCampus: TDBLookupComboboxEh;
    dbcbDisc: TDBLookupComboboxEh;
    dbcbPotok: TDBLookupComboboxEh;
    dbcbPlanPrep: TDBLookupComboboxEh;
    dbcbRoom: TDBLookupComboboxEh;
    dbcbVidNagruzki: TDBLookupComboboxEh;
    dbcbVidZanyat: TDBLookupComboboxEh;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    Label29: TLabel;
    Label31: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    actRefreshConflictList: TAction;
    actShowConflictList: TAction;
    ImageList1: TImageList;
    dbcbExecWorkType: TDBLookupComboboxEh;
    Label30: TLabel;
    dbcbKaf: TDBLookupComboboxEh;
    dbcbExecPrep: TDBLookupComboboxEh;
    dbcbFormEd: TDBLookupComboboxEh;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    dbcbPlanWorkType: TDBLookupComboboxEh;
    Bevel4: TBevel;
    Panel2: TPanel;
    Image1: TImage;
    Label7: TLabel;
    Label12: TLabel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Panel3: TPanel;
    Label28: TLabel;
    Label27: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    dbeStop: TDBEditEh;
    dbdtBeginDate: TDBDateTimeEditEh;
    dbcbStart: TDBComboBoxEh;
    Panel5: TPanel;
    Label13: TLabel;
    Label15: TLabel;
    Label3: TLabel;
    dbcbRepeatType: TDBLookupComboboxEh;
    dbdtFinalDate: TDBDateTimeEditEh;
    dbeRepeatCount: TDBEditEh;
    pDayRepeat: TPanel;
    Label16: TLabel;
    Label23: TLabel;
    dbeDFDay: TDBEditEh;
    UpDown2: TUpDown;
    pMonthRepeat: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    dbeMFDay: TDBEditEh;
    dbeMFMonth: TDBEditEh;
    rbMF: TRadioButton;
    rbMS: TRadioButton;
    dbcbMSDayName: TDBComboBoxEh;
    dbeMSMonth: TDBEditEh;
    dbcbMSNum: TDBComboBoxEh;
    UpDown3: TUpDown;
    UpDown4: TUpDown;
    UpDown5: TUpDown;
    pWeekRepeat: TPanel;
    Label17: TLabel;
    Label18: TLabel;
    dbeWWeek: TDBEditEh;
    cbWMon: TCheckBox;
    cbWTue: TCheckBox;
    cbWWen: TCheckBox;
    cbWThu: TCheckBox;
    cbWFri: TCheckBox;
    cbWSat: TCheckBox;
    UpDown1: TUpDown;
    rbRLTF: TRadioButton;
    rbRLTS: TRadioButton;
    rbRLTT: TRadioButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Panel6: TPanel;
    ToolBar3: TToolBar;
    ToolButton4: TToolButton;
    ToolBar2: TToolBar;
    ToolButton3: TToolButton;
    Label14: TLabel;
    Label24: TLabel;
    dbcbNumeratorType: TDBComboBoxEh;
    dbcbPart: TDBComboBoxEh;
    Label32: TLabel;
    Label36: TLabel;
    cbCWFri: TCheckBox;
    cbCWMon: TCheckBox;
    cbCWSat: TCheckBox;
    cbCWThu: TCheckBox;
    cbCWTue: TCheckBox;
    cbCWWen: TCheckBox;
    Label37: TLabel;
    procedure dbcbRepeatTypeKeyValueChanged(Sender: TObject);
    procedure dbeMFDayExit(Sender: TObject);
    procedure dbcbPotokKeyValueChanged(Sender: TObject);
    procedure dbcbDiscKeyValueChanged(Sender: TObject);
    procedure dbcbCampusKeyValueChanged(Sender: TObject);
    procedure dbeRepeatCountChange(Sender: TObject);
    procedure dbdtFinalDateChange(Sender: TObject);
    procedure dbcbMSNumChange(Sender: TObject);
    procedure dbeMFDayChange(Sender: TObject);
    procedure dbcbStartChange(Sender: TObject);
    procedure dbcbVidZanyatKeyValueChanged(Sender: TObject);
    procedure dbcbPlanPrepKeyValueChanged(Sender: TObject);
    procedure dbcbVidNagruzkiKeyValueChanged(Sender: TObject);
    procedure dbdtBeginDateChange(Sender: TObject);
    procedure cbWMonClick(Sender: TObject);
    procedure dbeDFDayChange(Sender: TObject);
    procedure dbeWWeekChange(Sender: TObject);
    procedure dbeWWeekKeyPress(Sender: TObject; var Key: Char);
    procedure actRefreshConflictListUpdate(Sender: TObject);
    procedure rbRLTFClick(Sender: TObject);
    procedure actRefreshConflictListExecute(Sender: TObject);
    procedure actShowConflictListUpdate(Sender: TObject);
    procedure actShowConflictListExecute(Sender: TObject);
    procedure dbcbKafKeyValueChanged(Sender: TObject);
    procedure dbcbFormEdKeyValueChanged(Sender: TObject);
    procedure dbcbExecPrepKeyValueChanged(Sender: TObject);
    procedure dbcbPlanWorkTypeKeyValueChanged(Sender: TObject);
    procedure dbcbCalcUnitKeyValueChanged(Sender: TObject);
    procedure dbcbRoomKeyValueChanged(Sender: TObject);
    procedure dbcbExecWorkTypeKeyValueChanged(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure dbcbPartChange(Sender: TObject);
    procedure cbCWMonClick(Sender: TObject);
    procedure dbcbNumeratorTypeChange(Sender: TObject);
    procedure UpDown1Changing(Sender: TObject; var AllowChange: Boolean);
  private
    fIsDepProcess: boolean;
    fPlanNagrIKList, fContentPlanNagrIKList, fPrepodPlanIKList: string;
    fRoomInConflict, fCalcUnitInConflict, fTeachersInConflict: string;
    temp: TSheduleEvent;
    conflictList: TSheduleEventList;
    fEvent: TSheduleEvent;
    fShedulerGrid: TCustomLessonSheduleGrid;
    fCaptionType: TCapType;
    fFormStartClosing: boolean;
    IsShadowModified: boolean;
    fIsConflictOptModified: boolean;
    fPartList: TObjectList;
    procedure SetIsConflictOptModified(const Value: boolean);
    property IsConflictOptModified: boolean read fIsConflictOptModified write SetIsConflictOptModified;
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    destructor Destroy; override;
    procedure SetCaptions(capType: TCapType; isExtendedMode: boolean);
    property Event: TSheduleEvent read fEvent write fEvent;
    property ShedulerGrid: TCustomLessonSheduleGrid read fShedulerGrid write fShedulerGrid;
    procedure Read(IsDepProcess: boolean);
  end;

var
  frmSheduleAddAudEvent: TfrmSheduleAddAudEvent;

implementation

uses DateUtils, uSheduleConflictLog;

{$R *.dfm}

procedure TfrmSheduleAddAudEvent.dbcbRepeatTypeKeyValueChanged(
  Sender: TObject);
begin
  if fFormStartClosing then exit;
  Label36.Visible:= dbcbRepeatType.KeyValue = 2;
  ToolBar2.Visible:= dbcbRepeatType.KeyValue = 2;
  pDayRepeat.Visible:= dbcbRepeatType.KeyValue = 1;
  pWeekRepeat.Visible:= dbcbRepeatType.KeyValue = 2;
  pMonthRepeat.Visible:= dbcbRepeatType.KeyValue = 3;
  if pWeekRepeat.Visible and dbdtBeginDate.Value <> NULL then
  begin
    cbWMon.Checked:= DayOfWeek(dbdtBeginDate.Value) = 2;
    cbWTue.Checked:= DayOfWeek(dbdtBeginDate.Value) = 3;
    cbWWen.Checked:= DayOfWeek(dbdtBeginDate.Value) = 4;
    cbWThu.Checked:= DayOfWeek(dbdtBeginDate.Value) = 5;
    cbWFri.Checked:= DayOfWeek(dbdtBeginDate.Value) = 6;
    cbWSat.Checked:= DayOfWeek(dbdtBeginDate.Value) = 7;
  end;
  IsConflictOptModified:= true;
end;

procedure TfrmSheduleAddAudEvent.dbcbRoomKeyValueChanged(Sender: TObject);
begin
  IsShadowModified:= (dbcbCalcUnit.KeyValue <> NULL) and (dbcbRoom.KeyValue <> NULL) and (dbcbExecWorkType.KeyValue <> NULL);
end;

procedure TfrmSheduleAddAudEvent.Read(IsDepProcess: boolean);
var
  i: integer;
begin
  fFormStartClosing:= false;
  fIsDepProcess:= IsDepProcess;
  conflictList:= TSheduleEventList.Create;
  IsConflictOptModified:= true;
  TGeneralController.Instance.InitializeLockupCB(@dbcbKaf, 'ik_kaf', 'cName_kaf');
  TGeneralController.Instance.InitializeLockupCB(@dbcbFormEd, 'Ik_form_ed', 'Cname_form_ed');
  TGeneralController.Instance.InitializeLockupCB(@dbcbPlanPrep, 'iTab_n', 'FIO');
  TGeneralController.Instance.InitializeLockupCB(@dbcbPlanWorkType, 'ik_id_prepod', 'full_work_type_name');
  TGeneralController.Instance.InitializeLockupCB(@dbcbPotok, 'ik_potok', 'Cname_potok');
  TGeneralController.Instance.InitializeLockupCB(@dbcbDisc, 'ik_disc', 'Cname_disc');
  TGeneralController.Instance.InitializeLockupCB(@dbcbVidZanyat, 'iK_vid_zanyat', 'cName_vid_zanyat');
  TGeneralController.Instance.InitializeLockupCB(@dbcbVidNagruzki, 'ik_vid_nagruzki', 'Cname_vid_nagruzki');
  TGeneralController.Instance.InitializeLockupCB(@dbcbCalcUnit, 'ik_calc_unit', 'cName_calc_unit');
  TGeneralController.Instance.InitializeLockupCB(@dbcbCampus, 'ik_campus', 'Cname_campus');
  TGeneralController.Instance.InitializeLockupCB(@dbcbRoom, 'ik_room', 'Cname_room');
  TGeneralController.Instance.InitializeLockupCB(@dbcbExecPrep, 'iTab_n', 'FIO');
  TGeneralController.Instance.InitializeLockupCB(@dbcbExecWorkType, 'ik_id_prepod', 'full_work_type_name');
  TGeneralController.Instance.InitializeLockupCB(@dbcbRepeatType, 'ik_repeat_type', 'Cname_repeat_type');
  TSheduleController.MainFunctions.GetDepartmentListForAddEvent(@dbcbKaf.ListSource.DataSet, IK, ShedulerGrid.SheduleIK, fIsDepProcess, true, false);
  TSheduleController.MainFunctions.GetRepeatTypeList(@dbcbRepeatType.ListSource.DataSet);
  dbcbPart.Items.Clear;

  for I := 0 to fShedulerGrid.PartCount-1 - 1 do
    dbcbPart.Items.Add(IntToStr(fShedulerGrid.Parts[i].PartNumber) + '-я пара');

  dbcbStart.Items.Clear;
  for i:= 0 to fShedulerGrid.PartCount-1 do
    dbcbStart.Items.Add(FormatDateTime('h:nn', fShedulerGrid.Parts[i].StartTime));

  if dbcbStart.Items.Count > 0 then dbcbStart.ItemIndex:= fShedulerGrid.PartIndex;
  dbcbNumeratorType.ItemIndex:= 0;

  if (fEvent <> nil) then
  begin

    {dbcbFormEd.KeyValue:= fEvent.FormEdIK;
    dbcbPlanPrep.KeyValue:= TNagruzkaController.Instance.GetTabNFromTeacherIK(fEvent.PlanTeacherIK);
    dbcbPlanWorkType.KeyValue:= fEvent.PlanTeacherIK;
    dbcbDisc.KeyValue:= fEvent.DiscIK;
    dbcbPotok.KeyValue:= TNagruzkaController.Instance.GetPotokFromShema(fEvent.CalcUnitIK);
    dbcbVidZanyat.KeyValue:= fEvent.VidZanyatIK;
    dbcbVidNagruzki.KeyValue:= fEvent.VidNagruzkiIK;
    dbcbCalcUnit.KeyValue:= fEvent.CalcUnitIK;
    if fCaptionType = ctAddException then
      dbdtBeginDate.Value:= fShedulerGrid.PeriodStart + fShedulerGrid.DayIndex
    else
      dbdtBeginDate.Value:= fEvent.BeginDate;
    dbcbCampus.KeyValue:= TSheduleController.MainFunctions.GetCampusFromRoom(fEvent.RoomIK);
    dbcbRoom.KeyValue:= fEvent.RoomIK;
    dbcbExecPrep.KeyValue:= fEvent.TabN;
    dbcbExecWorkType.KeyValue:= fEvent.TeacherIK;      }

    if (fCaptionType = ctEditEvent) then
    begin
      dbcbRepeatType.KeyValue:= fEvent.RepeatPattern.RepeatType;
      if (not Panel3.Visible) and (dbcbRepeatType.KeyValue <> 2) then
        SetCaptions(fCaptionType, true);
      case fEvent.RepeatPattern.RepeatType of
      1: dbeDFDay.Text:= IntToStr(fEvent.RepeatPattern.RepeatFrequency);
      2:
        begin
          dbeWWeek.Text:= IntToStr(fEvent.RepeatPattern.RepeatFrequency);
          cbWMon.Checked:= fEvent.RepeatPattern.RepeatMask[1] = '2';
          cbWTue.Checked:= fEvent.RepeatPattern.RepeatMask[2] = '3';
          cbWWen.Checked:= fEvent.RepeatPattern.RepeatMask[3] = '4';
          cbWThu.Checked:= fEvent.RepeatPattern.RepeatMask[4] = '5';
          cbWFri.Checked:= fEvent.RepeatPattern.RepeatMask[5] = '6';
          cbWSat.Checked:= fEvent.RepeatPattern.RepeatMask[6] = '7';
        end;
      3:
        begin
          case fEvent.RepeatPattern.RepeatMask[1] of
          '1':
            begin
              rbMF.Checked:= true;
              dbeMFDay.Text:= Copy(fEvent.RepeatPattern.RepeatMask, 2, 2);
              dbeMFMonth.Text:= IntToStr(fEvent.RepeatPattern.RepeatFrequency);
            end;
          '2':
            begin
              rbMS.Checked:= true;
              dbeMSMonth.Text:= IntToStr(fEvent.RepeatPattern.RepeatFrequency);
              dbcbMSDayName.ItemIndex:= StrToInt(Copy(fEvent.RepeatPattern.RepeatMask, 3, 1)) - 2;
              case fEvent.RepeatPattern.RepeatMask[2] of
                'п': dbcbMSNum.ItemIndex:= 4;
                else dbcbMSNum.ItemIndex:= StrToInt(Copy(fEvent.RepeatPattern.RepeatMask, 2, 1)) - 1;
              end;
            end;
          end;
        end;
      end;

      case fEvent.RepeatPattern.RepeatLimitType of
      1: rbRLTF.Checked:= true;
      2:
        begin
          rbRLTS.Checked:= true;
          dbeRepeatCount.Text:= IntToStr(fEvent.RepeatPattern.RepeatCount);
        end;
      3:
        begin
          rbRLTT.Checked:= true;
          dbdtFinalDate.Value:= fEvent.RepeatPattern.EndDateOfRepeat;
        end;
      end;
    end;
    
    actRefreshConflictListUpdate(actRefreshConflictList);
    if actRefreshConflictList.Enabled then
      actRefreshConflictListExecute(actRefreshConflictList);

    dbcbKaf.KeyValue:= fEvent.KafedraIK;
  end
  else
  begin
    dbcbRepeatType.KeyValue:= 2;
    rbRLTT.Checked:= true;
    if IsDepProcess then
      dbdtFinalDate.Value:= ShedulerGrid.DefaultSemLengthInfo.MaxSemStop
    else dbdtFinalDate.Value:= ShedulerGrid.DefaultSemLengthInfo.GetSemesterLengthForGrup(IK).SemStop;
    actRefreshConflictListUpdate(actRefreshConflictList);
    if actRefreshConflictList.Enabled then
      actRefreshConflictListExecute(actRefreshConflictList);

    if fIsDepProcess then
    begin
      dbcbKaf.KeyValue:= TDepLessonSheduleGrid(ShedulerGrid).KafedraIK;
      dbcbKaf.Enabled:= false;
      dbcbExecPrep.KeyValue:= IK;
      dbcbExecPrep.Enabled:= false;
    end;                               
  end;          
  IsShadowModified:= false;
end;

destructor TfrmSheduleAddAudEvent.Destroy;
begin
  fFormStartClosing:= true;
  TGeneralController.Instance.ReleaseLockupCB(@dbcbExecWorkType);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbExecPrep);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbRoom);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbCampus);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbCalcUnit);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbVidNagruzki);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbVidZanyat);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbPotok);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbDisc);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbPlanWorkType);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbPlanPrep);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbFormEd);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbKaf);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbRepeatType);
  if temp <> nil then FreeAndNil(temp);
  if conflictList <> nil then FreeAndNil(conflictList);
  inherited;
end;

function TfrmSheduleAddAudEvent.DoApply: boolean;
var
  tempList: TObjectList;
  planHour: double;
  tempSemLengthInfo: TSemLengthInfo;
begin
  Result:= false;
  if fPrepodPlanIKList = '' then
  begin
    Application.MessageBox('Перед началом сохранения события необходимо указать все параметры!', PChar(Caption), MB_ICONWARNING);
    exit;
  end;
  Panel2.Top:= round((Height - Panel2.Height)/2);
  Panel2.Visible:= true;
  Refresh;
  try
    temp.KafedraIK:= dbcbKaf.KeyValue;
    temp.FormEdIK:= dbcbFormEd.KeyValue;
    temp.PlanTeacherIK:= dbcbPlanWorkType.KeyValue;
    temp.DiscIK:= dbcbDisc.KeyValue;
    temp.VidZanyatIK:= dbcbVidZanyat.KeyValue;
    temp.VidNagruzkiIK:= dbcbVidNagruzki.KeyValue;
    temp.CalcUnitIK:= dbcbCalcUnit.KeyValue;
    temp.RoomIK:= dbcbRoom.KeyValue;
    temp.TeacherIK:= dbcbExecWorkType.KeyValue;

    tempSemLengthInfo:= ShedulerGrid.DefaultSemLengthInfo.GetSemesterLengthForGrup(StrToInt(temp.GroupIKList[0]));
    if TSheduleController.MainFunctions.CheckPrepodSemseterTimeConstraint(ShedulerGrid.SheduleIK, tempSemLengthInfo, temp) then
    begin
      Application.MessageBox('Согласно установленным ограничениям данный преподаватель не может проводить занятие в указанное время!', PChar(Caption), MB_ICONWARNING);
      exit;
    end;
    if not TSheduleController.MainFunctions.CheckRoomUseConstraint(fPrepodPlanIKList, ShedulerGrid.SheduleIK, dbcbKaf.KeyValue, dbcbRoom.KeyValue) then
    begin
      Application.MessageBox('Согласно установленным ограничениям данное занятие не может проводиться в указанной аудитории!', PChar(Caption), MB_ICONWARNING);
      exit;
    end;
    Result:= TSheduleController.MainFunctions.SaveEvent(temp, fEvent, fCaptionType = ctAddException, fShedulerGrid, fPrepodPlanIKList);
   { if ((fCaptionType = ctAddEvent) or (fCaptionType = ctEditEvent)) and Result then
    begin
      tempList:= temp.GetAllEventsBetween(tempSemLengthInfo.SemStart, tempSemLengthInfo.SemStop);
      planHour:= TNagruzkaController.Instance.GetPlanHourForShedule(fPrepodPlanIKList);
      if tempList.Count > 0 then
        MessageBox(Application.Handle, PChar('Фактическая нагрузка для данного события составит: ' + IntToStr(tempList.Count * 2) + ' час (а, ов).' + #10#13 +
          'Планируемая нагрузка для выбранных параметров составляет: ' + FloatToStrF(planHour, ffFixed, 10, 2) + ' час (а, ов).'), 'Событие успешно добавлено', MB_ICONINFORMATION);
      tempList.Free;
    end;                }
    if Result then IsShadowModified:= false;
  finally
    Panel2.Visible:= false;
  end;
end;

function TfrmSheduleAddAudEvent.DoCancel: boolean;
begin
  Result:= false;
  case (Application.MessageBox('Сохранить внесенные изменения?','Измение информации о событии', MB_YESNOCANCEL)) of
      mrYes: OK;
      mrNo: Result:= true;
  end;
end;

procedure TfrmSheduleAddAudEvent.FormShow(Sender: TObject);
begin
  if (dbcbRepeatType.KeyValue = 2) and (Panel3.Visible) and (Panel5.Visible) then
    dbeWWeek.SetFocus
  else if Panel6.Visible then dbcbNumeratorType.SetFocus;
end;

procedure TfrmSheduleAddAudEvent.N1Click(Sender: TObject);
begin
  SetCaptions(fCaptionType, false);
  N1.Checked:= true;
end;

procedure TfrmSheduleAddAudEvent.N2Click(Sender: TObject);
begin
  SetCaptions(fCaptionType, true);
  N2.Checked:= true;
end;

procedure TfrmSheduleAddAudEvent.rbRLTFClick(Sender: TObject);
begin
  IsConflictOptModified:= true;
end;

procedure TfrmSheduleAddAudEvent.dbeMFDayExit(Sender: TObject);
begin
  if (Length(dbeMFDay.Text) = 1) then
    dbeMFDay.Text:= '0' + dbeMFDay.Text;
end;

{  else
  begin
    IsModified:= (dbcbCalcUnit.KeyValue <> NULL) and (dbcbRoom.KeyValue <> NULL) and (dbcbRepeatType.KeyValue <> NULL);
    if dbcbRepeatType.KeyValue <> NULL then
    begin
      case dbcbRepeatType.KeyValue of
      1: IsModified:= IsModified and (dbeDFDay.Text <> '');
      2: IsModified:= IsModified and (dbeWWeek.Text <> '') and (cbWMon.Checked or cbWTue.Checked or cbWWen.Checked or cbWThu.Checked or cbWFri.Checked or cbWSat.Checked);
      end;
    end;
    if rbRLTS.Checked then IsModified:= IsModified and (dbeRepeatCount.Text <> '');
    if rbRLTT.Checked then IsModified:= IsModified and (dbdtFinalDate.Value <> NULL);
  end;        }

procedure TfrmSheduleAddAudEvent.dbcbPotokKeyValueChanged(
  Sender: TObject);
var
  lastValue: Variant;
begin
  if fFormStartClosing then exit;
  lastValue:= TGeneralController.Instance.CloseLockupCB(@dbcbVidZanyat);
  if (dbcbPotok.KeyValue <> NULL) then
  begin
    if fEvent <> nil then
      dbcbVidZanyat.KeyValue:= TSheduleController.MainFunctions.GetVidZanyatListForAddEvent(@dbcbVidZanyat.ListSource.DataSet, IK, dbcbPlanWorkType.KeyValue, dbcbDisc.KeyValue,
        dbcbPotok.KeyValue, fPlanNagrIKList, true, false, fEvent.VidZanyatIK)
    else  dbcbVidZanyat.KeyValue:= TSheduleController.MainFunctions.GetVidZanyatListForAddEvent(@dbcbVidZanyat.ListSource.DataSet, IK, dbcbPlanWorkType.KeyValue, dbcbDisc.KeyValue,
        dbcbPotok.KeyValue, fPlanNagrIKList, true, false, lastValue);
  end;
  dbcbVidZanyat.Enabled:= dbcbPotok.KeyValue <> NULL;
  dbcbRoomKeyValueChanged(nil);
end;

procedure TfrmSheduleAddAudEvent.dbcbDiscKeyValueChanged(Sender: TObject);
var
  lastValue: Variant;
begin
  if fFormStartClosing then exit;
  lastValue:= TGeneralController.Instance.CloseLockupCB(@dbcbPotok);
  if (dbcbDisc.KeyValue <> NULL) then
  begin
    if fEvent <> nil then
      dbcbPotok.KeyValue:= TSheduleController.MainFunctions.GetPotokListForAddEvent(@dbcbPotok.ListSource.DataSet, IK, dbcbPlanWorkType.KeyValue, dbcbDisc.KeyValue, fPlanNagrIKList, fIsDepProcess, true, false, TNagruzkaController.Preparation.GetPotokFromShema(fEvent.CalcUnitIK))
    else dbcbPotok.KeyValue:= TSheduleController.MainFunctions.GetPotokListForAddEvent(@dbcbPotok.ListSource.DataSet, IK, dbcbPlanWorkType.KeyValue, dbcbDisc.KeyValue, fPlanNagrIKList, fIsDepProcess, true, false, lastValue);
  end;
  dbcbPotok.Enabled:= dbcbDisc.KeyValue <> NULL;
  dbcbRoomKeyValueChanged(nil);
end;

procedure TfrmSheduleAddAudEvent.dbcbExecPrepKeyValueChanged(Sender: TObject);
//var
//  lastValue: Variant;
begin
  if fFormStartClosing then exit;
  TGeneralController.Instance.CloseLockupCB(@dbcbExecWorkType);
  if dbcbExecPrep.KeyValue <> NULL then
  begin
    if fEvent <> nil then
      dbcbExecWorkType.KeyValue:= TNagruzkaController.Preparation.GetAlowedWorkTypes(@dbcbExecWorkType.ListSource.DataSet, dbcbExecPrep.KeyValue, dbcbKaf.KeyValue, ShedulerGrid.DefaultSemLengthInfo.MinSemStart, fTeachersInConflict, fEvent.TeacherIK)
    else dbcbExecWorkType.KeyValue:= TNagruzkaController.Preparation.GetAlowedWorkTypes(@dbcbExecWorkType.ListSource.DataSet, dbcbExecPrep.KeyValue, dbcbKaf.KeyValue, ShedulerGrid.DefaultSemLengthInfo.MinSemStart, fTeachersInConflict, NULL);
  end;
  dbcbExecWorkType.Enabled:= dbcbExecPrep.KeyValue <> NULL;
  dbcbRoomKeyValueChanged(nil);
end;

procedure TfrmSheduleAddAudEvent.dbcbExecWorkTypeKeyValueChanged(
  Sender: TObject);
begin
  if fFormStartClosing then exit;
//  if (dbcbPlanWorkType.KeyValue = NULL) and (dbcbExecWorkType.KeyValue <> NULL) then
//    dbcbPlanWorkType.KeyValue:= dbcbExecWorkType.KeyValue;
  dbcbRoomKeyValueChanged(nil);
end;

procedure TfrmSheduleAddAudEvent.dbcbFormEdKeyValueChanged(Sender: TObject);
//var
//  lastValue: Variant;
begin
  if fFormStartClosing then exit;
  TGeneralController.Instance.CloseLockupCB(@dbcbPlanPrep);
  if dbcbFormEd.KeyValue <> NULL then
  begin
    if fEvent <> nil then
      dbcbPlanPrep.KeyValue:= TSheduleController.MainFunctions.GetTeacherListForAddEvent(@dbcbPlanPrep.ListSource.DataSet, IK, ShedulerGrid.SheduleIK, dbcbKaf.KeyValue, dbcbFormEd.KeyValue, fPlanNagrIKList, fIsDepProcess, true, false, TNagruzkaController.Preparation.GetTabNFromTeacherIK(fEvent.PlanTeacherIK))
    else dbcbPlanPrep.KeyValue:= TSheduleController.MainFunctions.GetTeacherListForAddEvent(@dbcbPlanPrep.ListSource.DataSet, IK, ShedulerGrid.SheduleIK, dbcbKaf.KeyValue, dbcbFormEd.KeyValue, fPlanNagrIKList, fIsDepProcess, true, false, NULL);
    if (fIsDepProcess) and (fCaptionType = ctAddEvent) and  (dbcbPlanPrep.KeyValue = NULL) then
      dbcbPlanPrep.KeyValue:= IK;
  end;
  dbcbPlanPrep.Enabled:= dbcbFormEd.KeyValue <> NULL;
  dbcbRoomKeyValueChanged(nil);
end;

procedure TfrmSheduleAddAudEvent.dbcbKafKeyValueChanged(Sender: TObject);
//var
 // lastFEValue, lastTValue: Variant;
begin
  if fFormStartClosing then exit;
  TGeneralController.Instance.CloseLockupCB(@dbcbExecPrep);
  TGeneralController.Instance.CloseLockupCB(@dbcbFormEd);
  if dbcbKaf.KeyValue <> NULL then
  begin
    TNagruzkaController.Preparation.GetAllPrepInKaf(@dbcbExecPrep.ListSource.DataSet, dbcbKaf.KeyValue, );
    if fIsDepProcess then
      dbcbExecPrep.KeyValue:= IK
    else
    begin
      if fEvent <> nil then
        dbcbExecPrep.KeyValue:= fEvent.TabN;
    end;

    if fEvent <> nil then
      dbcbFormEd.KeyValue:= TSheduleController.MainFunctions.GetFormEdListForAddEvent(@dbcbFormEd.ListSource.DataSet, IK, ShedulerGrid.SheduleIK, dbcbKaf.KeyValue, fIsDepProcess, true, false, fEvent.FormEdIK)
    else dbcbFormEd.KeyValue:= TSheduleController.MainFunctions.GetFormEdListForAddEvent(@dbcbFormEd.ListSource.DataSet, IK, ShedulerGrid.SheduleIK, dbcbKaf.KeyValue, fIsDepProcess, true, true, NULL);
  end;
  if not fIsDepProcess then
    dbcbFormEd.Enabled:= dbcbKaf.KeyValue <> NULL;
  dbcbRoomKeyValueChanged(nil);
end;

procedure TfrmSheduleAddAudEvent.dbcbCalcUnitKeyValueChanged(Sender: TObject);
var
  lastValue: Variant;
begin
  if fFormStartClosing then exit;
  lastValue:= TGeneralController.Instance.CloseLockupCB(@dbcbCampus);
  if dbcbCalcUnit.KeyValue <> NULL then
  begin
    if fEvent <> nil then
      dbcbCampus.KeyValue:= TSheduleController.MainFunctions.GetCampusForPrepodPlanIK(@dbcbCampus.ListSource.DataSet, dbcbCalcUnit.KeyValue, ShedulerGrid.SheduleIK, fContentPlanNagrIKList, fPrepodPlanIKList, TSheduleController.MainFunctions.GetCampusFromRoom(fEvent.RoomIK))
    else dbcbCampus.KeyValue:= TSheduleController.MainFunctions.GetCampusForPrepodPlanIK(@dbcbCampus.ListSource.DataSet, dbcbCalcUnit.KeyValue, ShedulerGrid.SheduleIK, fContentPlanNagrIKList, fPrepodPlanIKList, lastValue)
  end;
  dbcbCampus.Enabled:= dbcbCalcUnit.KeyValue <> NULL;
  dbcbRoomKeyValueChanged(nil);
end;

procedure TfrmSheduleAddAudEvent.dbcbCampusKeyValueChanged(
  Sender: TObject);
var
  lastValue: Variant;
begin
  if fFormStartClosing then exit;
  lastValue:= TGeneralController.Instance.CloseLockupCB(@dbcbRoom);
  if (dbcbCampus.KeyValue <> NULL) then
  begin
    if fEvent <> nil then
      dbcbRoom.KeyValue:= TSheduleController.MainFunctions.GetRoomsForPrepodPlanIK(@dbcbRoom.ListSource.DataSet, dbcbCampus.KeyValue, ShedulerGrid.SheduleIK, fPrepodPlanIKList, fRoomInConflict, fEvent.RoomIK)
    else dbcbRoom.KeyValue:= TSheduleController.MainFunctions.GetRoomsForPrepodPlanIK(@dbcbRoom.ListSource.DataSet, dbcbCampus.KeyValue, ShedulerGrid.SheduleIK, fPrepodPlanIKList, fRoomInConflict, lastValue);
  end;
  dbcbRoom.Enabled:= dbcbCampus.KeyValue <> NULL;
  dbcbRoomKeyValueChanged(nil);
end;

procedure TfrmSheduleAddAudEvent.dbeRepeatCountChange(Sender: TObject);
begin
  rbRLTS.Checked:= true;
  IsConflictOptModified:= true;
end;

procedure TfrmSheduleAddAudEvent.dbdtFinalDateChange(Sender: TObject);
begin
  rbRLTT.Checked:= true;
  dbdtBeginDateChange(dbdtBeginDate);
  IsConflictOptModified:= true;
end;

procedure TfrmSheduleAddAudEvent.dbcbMSNumChange(Sender: TObject);
begin
  rbMS.Checked:= true;
end;

procedure TfrmSheduleAddAudEvent.dbcbNumeratorTypeChange(Sender: TObject);
var
  semLengthInfo: TSemLengthInfo;
begin
  IsConflictOptModified:= true;
  case dbcbNumeratorType.ItemIndex of
  0:
    begin
      dbeWWeek.Text:= '1';
      dbdtBeginDate.Value:= fShedulerGrid.PeriodStart + fShedulerGrid.DayIndex;
    end;
  1:
    begin
      dbeWWeek.Text:= '2';
      if fIsDepProcess then
        semLengthInfo:= ShedulerGrid.DefaultSemLengthInfo
      else semLengthInfo:= ShedulerGrid.DefaultSemLengthInfo.GetSemesterLengthForGrup(IK);
      if (WeeksBetween(semLengthInfo.SemStart - DayOfWeek(semLengthInfo.SemStart) + 2, ShedulerGrid.PeriodStart) mod 2 = 0) then
        dbdtBeginDate.Value:= fShedulerGrid.PeriodStart + fShedulerGrid.DayIndex
      else dbdtBeginDate.Value:= fShedulerGrid.PeriodStart + fShedulerGrid.DayIndex + 7;
    end;
  2:
    begin
      dbeWWeek.Text:= '2';
      if fIsDepProcess then
        semLengthInfo:= ShedulerGrid.DefaultSemLengthInfo
      else semLengthInfo:= ShedulerGrid.DefaultSemLengthInfo.GetSemesterLengthForGrup(IK);
      if (WeeksBetween(semLengthInfo.SemStart - DayOfWeek(semLengthInfo.SemStart) + 2, ShedulerGrid.PeriodStart) mod 2 = 0) then
        dbdtBeginDate.Value:= fShedulerGrid.PeriodStart + fShedulerGrid.DayIndex + 7
      else dbdtBeginDate.Value:= fShedulerGrid.PeriodStart + fShedulerGrid.DayIndex;
    end;
  end;
end;

procedure TfrmSheduleAddAudEvent.dbeMFDayChange(Sender: TObject);
begin
  rbMF.Checked:= true;
end;

procedure TfrmSheduleAddAudEvent.dbcbStartChange(Sender: TObject);
begin
  dbcbPart.ItemIndex:= dbcbStart.ItemIndex;
  if (dbcbStart.ItemIndex >= 0) then
  begin
    dbeStop.Text:= FormatDateTime('h:nn', ShedulerGrid.Parts[dbcbStart.ItemIndex].StopTime);
    self.Tag:= dbcbStart.ItemIndex;
  end;
  IsConflictOptModified:= true;
end;

procedure TfrmSheduleAddAudEvent.dbcbVidZanyatKeyValueChanged(
  Sender: TObject);
var
  lastValue: Variant;
begin
  if fFormStartClosing then exit;
  lastValue:= TGeneralController.Instance.CloseLockupCB(@dbcbVidNagruzki);
  if (dbcbVidZanyat.KeyValue <> NULL) then
  begin
    if fEvent <> nil then
      dbcbVidNagruzki.KeyValue:= TSheduleController.MainFunctions.GetVidNagruzkiListForAddEvent(@dbcbVidNagruzki.ListSource.DataSet, IK, dbcbPlanWorkType.KeyValue, dbcbDisc.KeyValue, dbcbPotok.KeyValue, dbcbVidZanyat.KeyValue, fPlanNagrIKList, false, fEvent.VidNagruzkiIK)
    else dbcbVidNagruzki.KeyValue:= TSheduleController.MainFunctions.GetVidNagruzkiListForAddEvent(@dbcbVidNagruzki.ListSource.DataSet, IK, dbcbPlanWorkType.KeyValue, dbcbDisc.KeyValue, dbcbPotok.KeyValue, dbcbVidZanyat.KeyValue, fPlanNagrIKList, false, lastValue);
  end;
  dbcbVidNagruzki.Enabled:= dbcbVidZanyat.KeyValue <> NULL;
end;

procedure TfrmSheduleAddAudEvent.dbcbPartChange(Sender: TObject);
begin
  dbcbStart.ItemIndex:= dbcbPart.ItemIndex;
end;

procedure TfrmSheduleAddAudEvent.dbcbPlanPrepKeyValueChanged(Sender: TObject);
var
  lastValue: Variant;
begin
  if fFormStartClosing then exit;
  lastValue:= TGeneralController.Instance.CloseLockupCB(@dbcbPlanWorkType);
  if (dbcbPlanPrep.KeyValue <> NULL) then
  begin
    if (not fIsDepProcess) and (fCaptionType = ctAddEvent) and (dbcbExecPrep.KeyValue = NULL) then
      dbcbExecPrep.KeyValue:= dbcbPlanPrep.KeyValue;
    if fEvent <> nil then
      dbcbPlanWorkType.KeyValue:= TSheduleController.MainFunctions.GetTeacherWorkTypeListForAddEvent(@dbcbPlanWorkType.ListSource.DataSet, IK, dbcbPlanPrep.KeyValue, fPlanNagrIKList, fIsDepProcess, true, false, fEvent.PlanTeacherIK)
    else dbcbPlanWorkType.KeyValue:= TSheduleController.MainFunctions.GetTeacherWorkTypeListForAddEvent(@dbcbPlanWorkType.ListSource.DataSet, IK, dbcbPlanPrep.KeyValue, fPlanNagrIKList, fIsDepProcess, true, false, NULL);
  end;
  dbcbPlanWorkType.Enabled:= dbcbPlanPrep.KeyValue <> NULL;
  dbcbRoomKeyValueChanged(nil);
end;

procedure TfrmSheduleAddAudEvent.dbcbPlanWorkTypeKeyValueChanged(
  Sender: TObject);
//var
//  lastValue: Variant;
begin
  if fFormStartClosing then exit;
  TGeneralController.Instance.CloseLockupCB(@dbcbDisc);
  if dbcbPlanWorkType.KeyValue <> NULL then
  begin
    if fEvent <> nil then
      dbcbDisc.KeyValue:= TSheduleController.MainFunctions.GetDiscListForAddEvent(@dbcbDisc.ListSource.DataSet, IK, dbcbPlanWorkType.KeyValue, fPlanNagrIKList, fIsDepProcess, true, false, fEvent.DiscIK)
    else dbcbDisc.KeyValue:= TSheduleController.MainFunctions.GetDiscListForAddEvent(@dbcbDisc.ListSource.DataSet, IK, dbcbPlanWorkType.KeyValue, fPlanNagrIKList, fIsDepProcess, true, false, NULL);
    if (fCaptionType = ctAddEvent) and (dbcbExecWorkType.KeyValue = NULL) and (dbcbPlanPrep.KeyValue = dbcbExecPrep.KeyValue) then
      dbcbExecWorkType.KeyValue:= dbcbPlanWorkType.KeyValue;
  end;
  dbcbDisc.Enabled:= dbcbPlanWorkType.KeyValue <> NULL;
  dbcbRoomKeyValueChanged(nil);
end;

procedure TfrmSheduleAddAudEvent.dbcbVidNagruzkiKeyValueChanged(
  Sender: TObject);
var
  lastValue: Variant;
begin
  if fFormStartClosing then exit;
  lastValue:= TGeneralController.Instance.CloseLockupCB(@dbcbCalcUnit);
  if (dbcbVidNagruzki.KeyValue <> NULL) then
  begin
    if fEvent <> nil then
      dbcbCalcUnit.KeyValue:= TSheduleController.MainFunctions.GetCalcUnitListForAddEvent(@dbcbCalcUnit.ListSource.DataSet, IK, dbcbPlanWorkType.KeyValue, dbcbDisc.KeyValue, dbcbPotok.KeyValue, dbcbVidZanyat.KeyValue, dbcbVidNagruzki.KeyValue, dbcbVidNagruzki.ListSource.DataSet.FieldByName('ik_decompose_type').AsInteger, fPlanNagrIKList, fCalcUnitInConflict, fContentPlanNagrIKList, fIsDepProcess, false, fEvent.CalcUnitIK)
    else dbcbCalcUnit.KeyValue:= TSheduleController.MainFunctions.GetCalcUnitListForAddEvent(@dbcbCalcUnit.ListSource.DataSet, IK, dbcbPlanWorkType.KeyValue, dbcbDisc.KeyValue, dbcbPotok.KeyValue, dbcbVidZanyat.KeyValue, dbcbVidNagruzki.KeyValue, dbcbVidNagruzki.ListSource.DataSet.FieldByName('ik_decompose_type').AsInteger, fPlanNagrIKList, fCalcUnitInConflict, fContentPlanNagrIKList, fIsDepProcess, false, lastValue);
  end;
  dbcbCalcUnit.Enabled:= dbcbVidNagruzki.KeyValue <> NULL;
  dbcbRoomKeyValueChanged(nil);
end;

procedure TfrmSheduleAddAudEvent.dbdtBeginDateChange(Sender: TObject);
begin
  if (Sender as TDBDateTimeEditEh).Value <> NULL then
  begin
    if (DayOfWeek(VarToDateTime((Sender as TDBDateTimeEditEh).Value)) = 1) then
      if Application.MessageBox('По воскресениям занятия не проводятся!','Изменение даты',MB_ICONWARNING) = mrOk then
      begin
        (Sender as TDBDateTimeEditEh).Value:= VarToDateTime((Sender as TDBDateTimeEditEh).Value) - 1;
        exit;
      end;
  end;
  IsConflictOptModified:= true;
end;

procedure TfrmSheduleAddAudEvent.actRefreshConflictListExecute(
  Sender: TObject);
var
  tempStr: string;
  y,m,d,h,min,s,ms: word;
  repeatPatternIK: integer;
  tempInfo: TSemLengthInfo;
begin
  if IsConflictOptModified then
  begin
    if fIsDepProcess then
      tempInfo:= ShedulerGrid.DefaultSemLengthInfo
    else tempInfo:= ShedulerGrid.DefaultSemLengthInfo.GetSemesterLengthForGrup(IK);

//    if (dbdtFinalDate.Value = NULL) then
  //    dbdtFinalDate.Value:= ShedulerGrid.DefaultSemLengthInfo.SemStop;
    if not tempInfo.IsAudDateAllow(VarToDateTime(dbdtBeginDate.Value)) then
    begin
      Application.MessageBox('Дата начала повторения события выходит за рамки текущего семестра!', PChar(Caption),MB_ICONWARNING);
      exit;
    end;
    if (fCaptionType = ctAddEvent) or (fCaptionType = ctEditEvent) then
      if rbRLTT.Checked then
        if not tempInfo.IsAudDateAllow(VarToDateTime(dbdtFinalDate.Value)) then
        begin
          Application.MessageBox('Дата окончания повторения события выходит за рамки текущего семестра!', PChar(Caption),MB_ICONWARNING);
          exit;
        end;
    Panel2.Top:= round((Height - Panel2.Height)/2);
    Panel2.Visible:= true;
    Refresh;
    try
      if Assigned(temp) then FreeAndNil(temp);
      temp:= TSheduleEvent.Create;
      case fCaptionType of
      ctAddEvent: temp.ParrentEventIK:= 0;
      ctEditEvent, ctEditException:
        begin
          temp.Assign(fEvent);
          temp.ParrentEventIK:= fEvent.ParrentEventIK;
        end;
      ctAddException: temp.ParrentEventIK:= fEvent.EventIK;
      end;
      temp.BeginDate:= dbdtBeginDate.Value;
      DecodeTime(fShedulerGrid.Parts[dbcbStart.ItemIndex].StartTime, h,min,s,ms);
      DecodeDate(dbdtBeginDate.Value, y,m,d);
      temp.Start:= EncodeDateTime(y,m,d,h,min,s,ms);
      DecodeTime(fShedulerGrid.Parts[dbcbStart.ItemIndex].StopTime, h,min,s,ms);
      temp.Stop:= EncodeDateTime(y,m,d,h,min,s,ms);
      temp.EventType:= fShedulerGrid.Parts[dbcbStart.ItemIndex].PartNumber;
      temp.IsException:= (fCaptionType = ctAddException) or (fCaptionType = ctEditException);
      case fCaptionType of
        ctAddEvent, ctEditEvent, ctAddException: temp.ExceptionDate:= ShedulerGrid.PeriodStart + ShedulerGrid.DayIndex;
        ctEditException: temp.ExceptionDate:= fEvent.ExceptionDate;
      end;

      //заполнение шаблона

      if (fCaptionType = ctAddEvent) or (fCaptionType = ctEditEvent) then
      begin
        if (temp.RepeatPattern <> nil) then
          repeatPatternIK:= temp.RepeatPattern.RepeatPattenIK
        else repeatPatternIK:= -1;
        case dbcbRepeatType.KeyValue of
        1:
        begin
          temp.RepeatPattern:= TDayRepeatPattern.Create;
          temp.RepeatPattern.RepeatPattenIK:= repeatPatternIK;
          temp.RepeatPattern.RepeatType:= dbcbRepeatType.KeyValue;
          temp.RepeatPattern.RepeatFrequency:= StrToInt(dbeDFDay.Text);
        end;
        2:
        begin
          temp.RepeatPattern:= TWeekRepeatPattern.Create;
          temp.RepeatPattern.RepeatPattenIK:= repeatPatternIK;
          temp.RepeatPattern.RepeatType:= dbcbRepeatType.KeyValue;
          temp.RepeatPattern.RepeatFrequency:= StrToInt(dbeWWeek.Text);
          tempStr:= '______';
          if cbWMon.Checked then tempStr[1]:= '2'
          else tempStr[1]:= '_';
          if cbWTue.Checked then tempStr[2]:= '3'
          else tempStr[2]:= '_';
          if cbWWen.Checked then tempStr[3]:= '4'
          else tempStr[3]:= '_';
          if cbWThu.Checked then tempStr[4]:= '5'
          else tempStr[4]:= '_';
          if cbWFri.Checked then tempStr[5]:= '6'
          else tempStr[5]:= '_';
          if cbWSat.Checked then tempStr[6]:= '7'
          else tempStr[6]:= '_';
          temp.RepeatPattern.RepeatMask:= tempStr;
        end;
        3:
        begin
          temp.RepeatPattern:= TMonthRepeatPattern.Create;
          temp.RepeatPattern.RepeatPattenIK:= repeatPatternIK;
          temp.RepeatPattern.RepeatType:= dbcbRepeatType.KeyValue;
          tempStr:= '______';
          if rbMF.Checked then
          begin
            temp.RepeatPattern.RepeatFrequency:= StrToInt(dbeMFMonth.Text);
            tempStr[1]:= '1';
            tempStr[2]:= dbeMFDay.Text[1];
            tempStr[3]:= dbeMFDay.Text[2];
            temp.RepeatPattern.RepeatMask:= tempStr;
          end
          else
          begin
            temp.RepeatPattern.RepeatFrequency:= StrToInt(dbeMSMonth.Text);
            tempStr[1]:= '2';
            tempStr[2]:= dbcbMSNum.Text[1];
            tempStr[3]:= IntToStr(dbcbMSDayName.ItemIndex + 2)[1];
            temp.RepeatPattern.RepeatMask:= tempStr;
          end;
        end;
        end;
        if rbRLTF.Checked then temp.RepeatPattern.RepeatLimitType:= 1;
        if rbRLTS.Checked then
        begin
          temp.RepeatPattern.RepeatLimitType:= 2;
          temp.RepeatPattern.RepeatCount:= StrToInt(dbeRepeatCount.Text);
        end;
        if rbRLTT.Checked then
        begin
          temp.RepeatPattern.RepeatLimitType:= 3;
          temp.RepeatPattern.EndDateOfRepeat:= dbdtFinalDate.Value;
        end;
      end;
      //конец заполнения шаблона

      fCalcUnitInConflict:= '';
      fTeachersInConflict:= '';
      fRoomInConflict:= '';
  //времено отключим проверку конфликтов
//      TSheduleController.MainFunctions.GetEventConflictList(temp, ShedulerGrid.SheduleIK, temp.BeginDate, tempInfo.SemStop, conflictList, fCalcUnitInConflict, fTeachersInConflict, fRoomInConflict);

       // Application.MessageBox('Для заданных временных параметров события обнаружены конфликтные ситуации - некоторые позиции расписания, соответствующие данным параметрам, уже заняты.' + #10#13 +
       //   'По этой причине некоторые записи в списках "ФИО преподавателя", "Расчетная единица" и "Номер аудитории" могут отсутствовать...' + #10#13 +
       //   'Для просмотра событий, с которыми обнаружены конфликты, щелкните кнопку "Просмотреть список конфликтов".', PChar(Caption), MB_ICONWARNING);

      IsConflictOptModified:= false;
      dbcbKafKeyValueChanged(dbcbKaf);
      Panel2.Visible:= false;
    except
      Panel2.Visible:= false;
      raise;
    end;
  end;
end;

procedure TfrmSheduleAddAudEvent.actRefreshConflictListUpdate(Sender: TObject);
var
  tempBool: boolean;
begin
  if ((fCaptionType = ctAddEvent) or (fCaptionType = ctEditEvent)) then
  begin
    tempBool:= (dbdtBeginDate.Value <> NULL) and (dbcbStart.ItemIndex >= 0) and (dbcbRepeatType.KeyValue <> NULL) and (rbRLTF.Checked or rbRLTS.Checked or rbRLTT.Checked);
    if dbcbRepeatType.KeyValue <> NULL then
    begin
      case dbcbRepeatType.KeyValue of
      1: (Sender as TAction).Enabled:= tempBool and (dbeDFDay.Text <> '');
      2: (Sender as TAction).Enabled:= tempBool and (cbWMon.Checked or cbWTue.Checked or cbWWen.Checked or cbWThu.Checked or cbWFri.Checked or cbWSat.Checked);
      3: (Sender as TAction).Enabled:= tempBool;
      end;
    end
    else (Sender as TAction).Enabled:= false;
  end
  else (Sender as TAction).Enabled:= (dbdtBeginDate.Value <> NULL) and (dbcbStart.ItemIndex >= 0);
  IsModified:= IsShadowModified and (not fIsConflictOptModified) and (Sender as TAction).Enabled;
end;

procedure TfrmSheduleAddAudEvent.actShowConflictListExecute(Sender: TObject);
var
  tempForm: TfrmConflictEventLog;
begin
  tempForm:= TfrmConflictEventLog.CreateDialog(self, Connection, nil);
  tempForm.DrawConflictList:= conflictList;
  tempForm.ShowModal;
  tempForm.Free;
end;

procedure TfrmSheduleAddAudEvent.actShowConflictListUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= actRefreshConflictList.Enabled and (conflictList.Count > 0);
end;

procedure TfrmSheduleAddAudEvent.cbCWMonClick(Sender: TObject);
begin
  IsConflictOptModified:= true;
  (self.FindComponent('cb' + Copy((Sender as TCheckBox).Name, 4, Length((Sender as TCheckBox).Name)-3)) as TCheckBox).Checked:= (Sender as TCheckBox).Checked; 
end;

procedure TfrmSheduleAddAudEvent.cbWMonClick(Sender: TObject);
begin
  IsConflictOptModified:= true;
  (self.FindComponent('cbC' + Copy((Sender as TCheckBox).Name, 3, Length((Sender as TCheckBox).Name)-2)) as TCheckBox).Checked:= (Sender as TCheckBox).Checked;
end;

procedure TfrmSheduleAddAudEvent.dbeDFDayChange(Sender: TObject);
begin
  IsConflictOptModified:= true;
end;

procedure TfrmSheduleAddAudEvent.dbeWWeekChange(Sender: TObject);
var
  semLengthInfo: TSemLengthInfo;
begin  
  Label36.Visible:= ((dbeWWeek.Text = '1') or (dbeWWeek.Text = '2')) and (dbdtBeginDate.Value <> NULL);
  ToolBar2.Visible:= ((dbeWWeek.Text = '1') or (dbeWWeek.Text = '2')) and (dbdtBeginDate.Value <> NULL);
  if (dbeWWeek.Text = '1') then
    dbcbNumeratorType.ItemIndex:= 0;
  if (dbeWWeek.Text = '2') then
  begin
    if (dbdtBeginDate.Value <> NULL) then
    begin
      if fIsDepProcess then
        semLengthInfo:= ShedulerGrid.DefaultSemLengthInfo
      else semLengthInfo:= ShedulerGrid.DefaultSemLengthInfo.GetSemesterLengthForGrup(IK);
      if (WeeksBetween(semLengthInfo.SemStart - DayOfWeek(semLengthInfo.SemStart) + 2, VarToDateTime(dbdtBeginDate.Value)) mod 2 = 0) then
        dbcbNumeratorType.ItemIndex:= 1
      else dbcbNumeratorType.ItemIndex:= 2;
    end
    else dbcbNumeratorType.ItemIndex:= -1;
  end;
end;

procedure TfrmSheduleAddAudEvent.dbeWWeekKeyPress(Sender: TObject;
  var Key: Char);
const
  allow: set of char = ['1','2','3','4','5','6','7','8','9','0', #8];
begin
  if not (Key in allow) then Key:= #0;
  IsConflictOptModified:= true;
end;

procedure TfrmSheduleAddAudEvent.SetCaptions(capType: TCapType; isExtendedMode: boolean);
begin
  fCaptionType:= capType;
  if (not isExtendedMode) and (dbcbRepeatType.KeyValue <> NULL) then
    if (dbcbRepeatType.KeyValue <> 2) then isExtendedMode:= true;
  case capType of
  ctAddEvent:
    begin
      Caption:= 'Добавление события';
      Panel3.Visible:= isExtendedMode;
      Panel6.Visible:= not isExtendedMode;
      Panel5.Visible:= true;
      Panel3.Height:= 202;
      if isExtendedMode then ClientHeight:= 570
      else ClientHeight:= 460;
      if Self.Showing then
      begin
        if isExtendedMode then dbeWWeek.SetFocus
        else dbcbNumeratorType.SetFocus;
      end;
    end;
  ctEditEvent:
    begin
      Caption:= 'Изменение события';
      Panel3.Visible:= isExtendedMode;
      Panel6.Visible:= not isExtendedMode;
      Panel5.Visible:= true;
      Panel3.Height:= 202;
      if isExtendedMode then ClientHeight:= 570
      else ClientHeight:= 460;
      if Self.Showing then
      begin
        if isExtendedMode then dbeWWeek.SetFocus
        else dbcbNumeratorType.SetFocus;
      end;
    end;
  ctAddException:
    begin
      Caption:= 'Добавление исключения';
      Panel3.Visible:= true;
      ToolBar2.Visible:= false;
      Label36.Visible:= false;
      Panel6.Visible:= false;
      Panel5.Visible:= false;
      Panel3.Height:= 51;
      ClientHeight:= 422;
    end;
  ctEditException:
    begin
      Caption:= 'Изменение исключения';
      Panel3.Visible:= true;
      ToolBar2.Visible:= false;
      Label36.Visible:= false;
      Panel6.Visible:= false;
      Panel5.Visible:= false;
      Panel3.Height:= 51;
      ClientHeight:= 422;
    end;
  end;
  Self.Left:= round((Screen.Width - Width)/2);
  Self.Top:= round((Screen.Height - Height)/2);
end;

procedure TfrmSheduleAddAudEvent.SetIsConflictOptModified(const Value: boolean);
begin
  fIsConflictOptModified := Value;
  if not fIsDepProcess then
  begin
    dbcbKaf.Enabled:= not fIsConflictOptModified;
    dbcbExecPrep.Enabled:= not fIsConflictOptModified;
    dbcbExecWorkType.Enabled:= dbcbExecPrep.Enabled and (dbcbExecPrep.KeyValue <> NULL);
    dbcbFormEd.Enabled:= dbcbKaf.Enabled and (dbcbKaf.KeyValue <> NULL);
  end
  else
  begin
    dbcbFormEd.Enabled:= not fIsConflictOptModified;
    dbcbExecWorkType.Enabled:= not fIsConflictOptModified;
  end;

  dbcbPlanPrep.Enabled:= dbcbFormEd.Enabled and (dbcbFormEd.KeyValue <> NULL);
  dbcbPlanWorkType.Enabled:= dbcbPlanPrep.Enabled and (dbcbPlanPrep.KeyValue <> NULL);
  dbcbDisc.Enabled:= dbcbPlanWorkType.Enabled and (dbcbPlanWorkType.KeyValue <> NULL);
  dbcbPotok.Enabled:= dbcbDisc.Enabled and (dbcbDisc.KeyValue <> NULL);
  dbcbVidZanyat.Enabled:= dbcbPotok.Enabled and (dbcbPotok.KeyValue <> NULL);
  dbcbVidNagruzki.Enabled:= dbcbVidZanyat.Enabled and (dbcbVidZanyat.KeyValue <> NULL);
  dbcbCalcUnit.Enabled:= dbcbVidNagruzki.Enabled and (dbcbVidNagruzki.KeyValue <> NULL);
  dbcbCampus.Enabled:= dbcbCalcUnit.Enabled and (dbcbCalcUnit.KeyValue <> NULL);
  dbcbRoom.Enabled:= dbcbCampus.Enabled and (dbcbCampus.KeyValue <> NULL);
end;

procedure TfrmSheduleAddAudEvent.UpDown1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  dbeWWeekChange(dbeWWeek);
  IsConflictOptModified:= true;
end;

end.
