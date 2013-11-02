unit uNagruzkaAddAudEvent;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, DBGridEh, NagruzkaController,
  DBLookupEh, DBCtrlsEh, Mask, DB, ADODB, SheduleController, GeneralController,
  ComCtrls, ImgList, ToolWin;

type
  TCapType = (ctAddEvent, ctEditEvent, ctAddException, ctEditException);

  TfrmNagruzkaAddAudEvent = class(TfrmBaseDialog)
    Label28: TLabel;
    Label27: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label24: TLabel;
    dbeStop: TDBEditEh;
    dbeName: TDBEditEh;
    dbdtBeginDate: TDBDateTimeEditEh;
    dbcbStart: TDBComboBoxEh;
    Panel3: TPanel;
    dbcbRepeatType: TDBLookupComboboxEh;
    dbdtFinalDate: TDBDateTimeEditEh;
    dbeRepeatCount: TDBEditEh;
    pDayRepeat: TPanel;
    Label16: TLabel;
    Label23: TLabel;
    dbeDFDay: TDBEditEh;
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
    rbRLTF: TRadioButton;
    rbRLTS: TRadioButton;
    rbRLTT: TRadioButton;
    Label13: TLabel;
    Label15: TLabel;
    Label3: TLabel;
    Panel2: TPanel;
    Panel4: TPanel;
    dbcbCalcUnit: TDBLookupComboboxEh;
    dbcbCampus: TDBLookupComboboxEh;
    dbcbDisc: TDBLookupComboboxEh;
    dbcbPlan: TDBLookupComboboxEh;
    dbcbPotok: TDBLookupComboboxEh;
    dbcbPrep: TDBLookupComboboxEh;
    dbcbRoom: TDBLookupComboboxEh;
    dbcbVidNagruzki: TDBLookupComboboxEh;
    dbcbVidZanyat: TDBLookupComboboxEh;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label2: TLabel;
    Label29: TLabel;
    Label31: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel5: TPanel;
    Label14: TLabel;
    Bevel2: TBevel;
    actRefreshConflictList: TAction;
    actShowConflictList: TAction;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    dbcbWorkType: TDBLookupComboboxEh;
    Label30: TLabel;
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
    procedure dbcbPrepKeyValueChanged(Sender: TObject);
    procedure dbcbPlanKeyValueChanged(Sender: TObject);
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
    procedure dbeNameChange(Sender: TObject);
  private
    fRoomInConflict, fCalcUnitInConflict: string;
    temp: TSheduleEvent;
    conflictList: TList;
    fReportCaption: string;
    fEvent: PSheduleEvent;
    fShedulerGrid: PSheduleGrid;
    fCaptionType: TCapType;
    IsShadowModified: boolean;
    fIsConflictOptModified: boolean;
    procedure SetRepeatPattern(eneble: boolean);
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    procedure SetCaptions(capType: TCapType);
    property Event: PSheduleEvent read fEvent write fEvent;
    property ShedulerGrid: PSheduleGrid read fShedulerGrid write fShedulerGrid;
    procedure Read;
  end;

var
  frmNagruzkaAddAudEvent: TfrmNagruzkaAddAudEvent;

implementation

uses uNagruzkaPrep, uNagruzkaDep, DateUtils, uNagruzkaAddEventLog;

{$R *.dfm}

procedure TfrmNagruzkaAddAudEvent.dbcbRepeatTypeKeyValueChanged(
  Sender: TObject);
begin
  inherited;
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
  dbeNameChange(nil);
  fIsConflictOptModified:= true;
end;

procedure TfrmNagruzkaAddAudEvent.Read;
var
  i: integer;
begin
  conflictList:= TList.Create;
  fIsConflictOptModified:= true;
  TGeneralController.Instance.InitializeLockupCB(@dbcbPlan, 'ik_plan_nagr', 'cName_plan');
  TGeneralController.Instance.InitializeLockupCB(@dbcbPrep, 'ik_id_prepod', 'FIO');
  TGeneralController.Instance.InitializeLockupCB(@dbcbPotok, 'ik_potok', 'Cname_potok');
  TGeneralController.Instance.InitializeLockupCB(@dbcbDisc, 'ik_disc', 'Cname_disc');
  TGeneralController.Instance.InitializeLockupCB(@dbcbVidZanyat, 'iK_vid_zanyat', 'cName_vid_zanyat');
  TGeneralController.Instance.InitializeLockupCB(@dbcbVidNagruzki, 'ik_vid_nagruzki', 'Cname_vid_nagruzki');
  TGeneralController.Instance.InitializeLockupCB(@dbcbCalcUnit, 'ik_calc_unit', 'cName_calc_unit');
  TGeneralController.Instance.InitializeLockupCB(@dbcbCampus, 'ik_campus', 'Cname_campus');
  TGeneralController.Instance.InitializeLockupCB(@dbcbRoom, 'ik_room', 'Cname_room');
  TGeneralController.Instance.InitializeLockupCB(@dbcbWorkType, 'ik_work_type', 'Cname_work_type');
  TGeneralController.Instance.InitializeLockupCB(@dbcbRepeatType, 'ik_repeat_type', 'Cname_repeat_type');
  dbcbPlan.KeyValue:= TSheduleController.Instance.GetPlanNagrFromShedule(@dbcbPlan.ListSource.DataSet, ShedulerGrid^.SheduleIK, ShedulerGrid^.KafedraIK, true);
  TNagruzkaController.Instance.GetAllCampus(@dbcbCampus.ListSource.DataSet, false);
  TNagruzkaController.Instance.GetAlowedWorkTypes(@dbcbWorkType.ListSource.DataSet, IK, ShedulerGrid^.KafedraIK, ShedulerGrid^.SemStart);
  (dbcbRepeatType.ListSource.DataSet as TADODataSet).CommandText:= 'Select * From RepeatType';
  dbcbRepeatType.ListSource.DataSet.Open;

  dbcbStart.Items.Clear;
  for i:= 1 to fShedulerGrid^.PartCount do
    dbcbStart.Items.Add(FormatDateTime('h:nn', fShedulerGrid^.Parts[i].StartTime));

  dbdtBeginDate.Value:= fShedulerGrid^.Days[fShedulerGrid^.SelectedDayIndex];
  dbcbStart.ItemIndex:= fShedulerGrid^.SelectedPartIndex - 1;

  if (fEvent <> nil) then
  begin
    dbcbPrep.KeyValue:= fEvent^.PlanTeacherIK;
    dbcbDisc.KeyValue:= fEvent^.DiscIK;
    dbcbPotok.KeyValue:= TNagruzkaController.Instance.GetPotokFromShema(fEvent^.CalcUnitIK);
    dbcbVidZanyat.KeyValue:= fEvent^.VidZanyatIK;
    dbcbVidNagruzki.KeyValue:= fEvent^.VidNagruzkiIK;
    dbcbCalcUnit.KeyValue:= fEvent^.CalcUnitIK;
    if fCaptionType = ctAddException then
      dbdtBeginDate.Value:= ShedulerGrid^.Days[ShedulerGrid^.SelectedDayIndex]
    else
      dbdtBeginDate.Value:= fEvent^.BeginDate;
    dbcbCampus.KeyValue:= TSheduleController.Instance.GetCampusFromRoom(fEvent^.RoomIK);
    dbcbRoom.KeyValue:= fEvent^.RoomIK;
    if dbcbWorkType.ListSource.DataSet.Locate('ik_id_prepod', fEvent^.TeacherIK, [loPartialKey]) then
      dbcbWorkType.KeyValue:= dbcbWorkType.ListSource.DataSet.FieldByName('ik_work_type').AsInteger;

    if (fCaptionType = ctEditEvent) then
    begin
    dbcbRepeatType.KeyValue:= fEvent.RepeatPattern.RepeatType;
    case fEvent^.RepeatPattern.RepeatType of
    1: dbeDFDay.Text:= IntToStr(fEvent^.RepeatPattern.RepeatFrequency);
    2:
      begin
        dbeWWeek.Text:= IntToStr(fEvent^.RepeatPattern.RepeatFrequency);
        cbWMon.Checked:= fEvent^.RepeatPattern.RepeatMask[1] = '2';
        cbWTue.Checked:= fEvent^.RepeatPattern.RepeatMask[2] = '3';
        cbWWen.Checked:= fEvent^.RepeatPattern.RepeatMask[3] = '4';
        cbWThu.Checked:= fEvent^.RepeatPattern.RepeatMask[4] = '5';
        cbWFri.Checked:= fEvent^.RepeatPattern.RepeatMask[5] = '6';
        cbWSat.Checked:= fEvent^.RepeatPattern.RepeatMask[6] = '7';
      end;
    3:
      begin
        case fEvent^.RepeatPattern.RepeatMask[1] of
          '1':
            begin
              rbMF.Checked:= true;
              dbeMFDay.Text:= Copy(fEvent^.RepeatPattern.RepeatMask, 2, 2);
              dbeMFMonth.Text:= IntToStr(fEvent^.RepeatPattern.RepeatFrequency);
            end;
          '2':
            begin
              rbMS.Checked:= true;
              dbeMSMonth.Text:= IntToStr(fEvent^.RepeatPattern.RepeatFrequency);
              dbcbMSDayName.ItemIndex:= StrToInt(Copy(fEvent^.RepeatPattern.RepeatMask, 3, 1)) - 2;
              case fEvent.RepeatPattern.RepeatMask[2] of
              'п': dbcbMSNum.ItemIndex:= 4;
              else dbcbMSNum.ItemIndex:= StrToInt(Copy(fEvent^.RepeatPattern.RepeatMask, 2, 1)) - 1;
              end;
            end;
        end;
      end;
    end;
    case fEvent^.RepeatPattern.RepeatLimitType of
    1: rbRLTF.Checked:= true;
    2:
      begin
        rbRLTS.Checked:= true;
        dbeRepeatCount.Text:= IntToStr(fEvent^.RepeatPattern.RepeatCount);
      end;
    3:
      begin
        rbRLTT.Checked:= true;
        dbdtFinalDate.Value:= fEvent^.RepeatPattern.EndDateOfRepeat;
      end;
    end;
    end;
    actRefreshConflictListExecute(actRefreshConflictList);
    IsShadowModified:= false;
  end
  else
  begin
    if dbcbPlan.KeyValue <> NULL then
      if dbcbPrep.ListSource.DataSet.Locate('iTab_n', IK, [loPartialKey]) then
      begin
        dbcbPrep.KeyValue:= dbcbPrep.ListSource.DataSet.FieldByName('ik_id_prepod').AsInteger;
        dbcbWorkType.KeyValue:= dbcbPrep.ListSource.DataSet.FieldByName('ik_work_type').AsInteger
      end;
    dbcbRepeatType.KeyValue:= 2;
    rbRLTT.Checked:= true;
    dbdtFinalDate.Value:= ShedulerGrid^.SemStop;
  //  IsShadowModified:= true;
    actRefreshConflictListExecute(actRefreshConflictList);
    IsShadowModified:= false;
  end;
end;

function TfrmNagruzkaAddAudEvent.DoApply: boolean;
var
  tempList: TList;
  planHour: double;
begin
try
  Panel2.Top:= round((Height - Panel2.Height)/2);
  Panel2.Visible:= true;
  Refresh;
  try
    temp.CalcUnitIK:= dbcbCalcUnit.KeyValue;
    temp.TabN:= IK;
    temp.PlanTeacherIK:= dbcbPrep.KeyValue;
    temp.TeacherIK:= dbcbWorkType.ListSource.DataSet.FieldByName('ik_id_prepod').AsInteger;
    temp.DiscIK:= dbcbDisc.KeyValue;
    temp.RoomIK:= dbcbRoom.KeyValue;
    temp.VidZanyatIK:= dbcbVidZanyat.KeyValue;
    temp.VidNagruzkiIK:= dbcbVidNagruzki.KeyValue;
    temp.EventType:= Tag;

    Result:= TSheduleController.Instance.SaveEvent(temp, fEvent, fCaptionType = ctAddException, fShedulerGrid, dbcbCalcUnit.ListSource.DataSet.FieldByName('ik_prepod_plan').AsInteger);
    if ((fCaptionType = ctAddEvent) or (fCaptionType = ctEditEvent)) and Result then
    begin
      tempList:= temp.GetAllEventsBetween(ShedulerGrid^.SemStart, ShedulerGrid^.SemStop);
      planHour:= TNagruzkaController.Instance.GetPlanHourForShedule(dbcbCalcUnit.ListSource.DataSet.FieldByName('ik_prepod_plan').AsInteger);
      if tempList.Count > 0 then
        MessageBox(Application.Handle, PChar('Фактическая нагрузка для данного события составит: ' + IntToStr(tempList.Count * 2) + ' час (а, ов).' + #10#13 +
          'Планируемая нагрузка для выбранных параметров составляет: ' + FloatToStrF(planHour, ffFixed, 10, 2) + ' час (а, ов).'), 'Событие успешно добавлено', MB_ICONINFORMATION);
    end;
    IsShadowModified:= false;
    Panel2.Visible:= false;
  except
    Result:= false;
    Panel2.Visible:= false;
  end;
except
  raise;
end;
end;

function TfrmNagruzkaAddAudEvent.DoCancel: boolean;
begin
  case (Application.MessageBox('Сохранить внесенные изменения?','Измение информации о событии', MB_YESNOCANCEL)) of
      mrYes: OK;
      mrNo: Result:= true;
      mrCancel: Result:= false;
      else Result:= false;
  end;
end;

procedure TfrmNagruzkaAddAudEvent.rbRLTFClick(Sender: TObject);
begin
  fIsConflictOptModified:= true;
end;

procedure TfrmNagruzkaAddAudEvent.dbeMFDayExit(Sender: TObject);
begin
  if (Length(dbeMFDay.Text) = 1) then
    dbeMFDay.Text:= '0' + dbeMFDay.Text;
end;

procedure TfrmNagruzkaAddAudEvent.dbeNameChange(Sender: TObject);
begin
  IsShadowModified:= (dbcbCalcUnit.KeyValue <> NULL) and (dbcbRoom.KeyValue <> NULL);
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

procedure TfrmNagruzkaAddAudEvent.dbcbPotokKeyValueChanged(
  Sender: TObject);
begin
  if (dbcbPotok.KeyValue <> NULL) then
    dbcbVidZanyat.KeyValue:= TNagruzkaController.Instance.GetVidZanyatFromTeacherPlan(@dbcbVidZanyat.ListSource.DataSet, dbcbPrep.KeyValue, dbcbPlan.KeyValue, dbcbDisc.KeyValue, dbcbPotok.KeyValue, true, false, TGeneralController.Instance.CloseLockupCB(@dbcbVidZanyat));
  dbeNameChange(nil);
end;

procedure TfrmNagruzkaAddAudEvent.dbcbDiscKeyValueChanged(Sender: TObject);
begin
  if (dbcbDisc.KeyValue <> NULL) then
    dbcbPotok.KeyValue:= TNagruzkaController.Instance.GetPotoksFromTeacherPlan(@dbcbPotok.ListSource.DataSet, dbcbPrep.KeyValue, dbcbPlan.KeyValue, dbcbDisc.KeyValue, false, TGeneralController.Instance.CloseLockupCB(@dbcbPotok));
  dbeNameChange(nil);
end;

procedure TfrmNagruzkaAddAudEvent.dbcbCampusKeyValueChanged(
  Sender: TObject);
begin
  if (dbcbCampus.KeyValue <> NULL) then
    dbcbRoom.KeyValue:= TNagruzkaController.Instance.GetAllRooms(@dbcbRoom.ListSource.DataSet, dbcbCampus.KeyValue, true, fRoomInConflict, TGeneralController.Instance.CloseLockupCB(@dbcbRoom));
  dbeNameChange(nil);
end;

procedure TfrmNagruzkaAddAudEvent.dbeRepeatCountChange(Sender: TObject);
begin
  rbRLTS.Checked:= true;
  fIsConflictOptModified:= true;
  dbeNameChange(nil);
end;

procedure TfrmNagruzkaAddAudEvent.dbdtFinalDateChange(Sender: TObject);
begin
  rbRLTT.Checked:= true;
  dbdtBeginDateChange(Sender);
  fIsConflictOptModified:= true;
  dbeNameChange(nil);
end;

procedure TfrmNagruzkaAddAudEvent.dbcbMSNumChange(Sender: TObject);
begin
  rbMS.Checked:= true;
  dbeNameChange(nil);
end;

procedure TfrmNagruzkaAddAudEvent.dbeMFDayChange(Sender: TObject);
begin
  rbMF.Checked:= true;
  dbeNameChange(nil);
end;

procedure TfrmNagruzkaAddAudEvent.dbcbStartChange(Sender: TObject);
begin
  if (dbcbStart.ItemIndex >= 0) then
  begin
    if (CallFrame is TfmNagruzkaPrep) then
      dbeStop.Text:= FormatDateTime('h:nn', ShedulerGrid^.Parts[dbcbStart.ItemIndex + 1].StopTime)
    else
      dbeStop.Text:= FormatDateTime('h:nn', ShedulerGrid^.Parts[dbcbStart.ItemIndex + 1].StopTime);
    dbeName.Text:= IntToStr(dbcbStart.ItemIndex + 1) + '-я пара';
    self.Tag:= dbcbStart.ItemIndex + 1;
  end;
  fIsConflictOptModified:= true;
  dbeNameChange(nil);
end;

procedure TfrmNagruzkaAddAudEvent.dbcbVidZanyatKeyValueChanged(
  Sender: TObject);
begin
  if (dbcbVidZanyat.KeyValue <> NULL) then
    dbcbVidNagruzki.KeyValue:= TNagruzkaController.Instance.GetVidNagruzkiFromTeacherPlan(@dbcbVidNagruzki.ListSource.DataSet, dbcbPrep.KeyValue, dbcbVidZanyat.ListSource.DataSet.FieldByName('ik_content_plan_nagr').AsInteger, true, TGeneralController.Instance.CloseLockupCB(@dbcbVidNagruzki));
  dbeNameChange(nil);
end;

procedure TfrmNagruzkaAddAudEvent.SetRepeatPattern(eneble: boolean);
begin
  Panel3.Visible:= eneble;
  if eneble then
  begin
    ClientHeight:= 531;
    Panel5.Top:= 230;
    Panel4.Top:= 263;
    Bevel2.Top:= 261;
  end
  else
  begin
    ClientHeight:= 381;
    Panel4.Top:= 112;
    Bevel2.Top:= 110;
    Panel5.Top:= 78;
  end;
end;

procedure TfrmNagruzkaAddAudEvent.dbcbPrepKeyValueChanged(Sender: TObject);
var
  planHour: double;
begin
  if (dbcbPrep.KeyValue <> NULL) and (dbcbPlan.KeyValue <> NULL) then
  begin
    dbcbDisc.KeyValue:= TNagruzkaController.Instance.GetDisciplinesFromTeahcerPlan(@dbcbDisc.ListSource.DataSet, dbcbPlan.KeyValue, dbcbPrep.KeyValue, planHour, false, false, TGeneralController.Instance.CloseLockupCB(@dbcbDisc));
    if (fCaptionType = ctAddEvent) then
      if dbcbPrep.ListSource.DataSet.FieldByName('iTab_n').AsInteger = self.IK then
        if dbcbWorkType.ListSource.DataSet.Locate('ik_work_type', dbcbPrep.ListSource.DataSet.FieldByName('ik_work_type').AsInteger, [loPartialKey]) then
          dbcbWorkType.KeyValue:= dbcbWorkType.ListSource.DataSet.FieldByName('ik_work_type').AsInteger;
  end;
  dbeNameChange(nil);
end;

procedure TfrmNagruzkaAddAudEvent.dbcbPlanKeyValueChanged(Sender: TObject);
begin
  if dbcbPlan.KeyValue <> NULL then
    dbcbPrep.KeyValue:= TNagruzkaController.Instance.GetTeachersFromPlan(@dbcbPrep.ListSource.DataSet, dbcbPlan.KeyValue, false, TGeneralController.Instance.CloseLockupCB(@dbcbPrep));
  dbeNameChange(nil);
end;

procedure TfrmNagruzkaAddAudEvent.dbcbVidNagruzkiKeyValueChanged(
  Sender: TObject);
begin
  if (dbcbVidNagruzki.KeyValue <> NULL) then
    dbcbCalcUnit.KeyValue:= TNagruzkaController.Instance.GetCalcUnitsForShedule(@dbcbCalcUnit.ListSource.DataSet, dbcbPrep.KeyValue, dbcbVidZanyat.ListSource.DataSet.FieldByName('ik_content_plan_nagr').AsInteger, dbcbVidNagruzki.KeyValue, true, fCalcUnitInConflict, TGeneralController.Instance.CloseLockupCB(@dbcbCalcUnit));
  dbeNameChange(nil);
end;

procedure TfrmNagruzkaAddAudEvent.dbdtBeginDateChange(Sender: TObject);
begin
  if (DayOfWeek(VarToDateTime((Sender as TDBDateTimeEditEh).Value)) = 1) then
  begin
    (Sender as TDBDateTimeEditEh).Value:= VarToDateTime((Sender as TDBDateTimeEditEh).Value) - 1;
    Application.MessageBox('По воскресениям занятия проводить нельзя!','Изменение даты',MB_ICONWARNING);
    exit;
  end;
  fIsConflictOptModified:= true;
  dbeNameChange(nil);
end;

procedure TfrmNagruzkaAddAudEvent.actRefreshConflictListExecute(
  Sender: TObject);
var
  conflictItem: TConflictItem;
  tempStr: string;
  y,m,d,h,min,s,ms: word;
  tempCUSL, tempRSL: TStringList;
  repeatPatternIK, i: integer;
  tempDataSet, secTempDataSet: TADODataSet;
begin
  if fIsConflictOptModified then
  begin
    if (dbdtFinalDate.Value = NULL) then dbdtFinalDate.Value:= ShedulerGrid^.SemStop;
    if ((DayOfWeek(VarToDateTime(dbdtBeginDate.Value)) = 1) and ((VarToDateTime(dbdtBeginDate.Value) > ShedulerGrid^.SemStop) or (VarToDateTime(dbdtBeginDate.Value) < ShedulerGrid^.SemStart)))
      or (rbRLTT.Checked and ((DayOfWeek(VarToDateTime(dbdtFinalDate.Value)) = 1) and ((VarToDateTime(dbdtFinalDate.Value) > ShedulerGrid^.SemStop) or (VarToDateTime(dbdtFinalDate.Value) < ShedulerGrid^.SemStart)))) then
    begin
      Application.MessageBox('Указанна неверная дата...', PChar(Caption),MB_ICONWARNING);
      exit;
    end;
    Panel2.Top:= round((Height - Panel2.Height)/2);
    Panel2.Visible:= true;
    Refresh;
    try
    if Assigned(temp) then temp.Free;
    temp:= TSheduleEvent.Create;
    
    case fCaptionType of
    ctAddEvent: temp.ParrentEventIK:= 0;
    ctEditEvent, ctEditException:
      begin
        temp.Assign(fEvent^);
        temp.ParrentEventIK:= fEvent^.ParrentEventIK;
      end;
    ctAddException: temp.ParrentEventIK:= fEvent^.EventIK;
    end;

    temp.Connection:= self.Connection;

    temp.BeginDate:= dbdtBeginDate.Value;
    DecodeTime(fShedulerGrid^.Parts[dbcbStart.ItemIndex+1].StartTime, h,min,s,ms);
    DecodeDate(dbdtBeginDate.Value, y,m,d);
    temp.Start:= EncodeDateTime(y,m,d,h,min,s,ms);
    DecodeTime(fShedulerGrid^.Parts[dbcbStart.ItemIndex+1].StopTime, h,min,s,ms);
    temp.Stop:= EncodeDateTime(y,m,d,h,min,s,ms);

    temp.EventType:= dbcbStart.ItemIndex + 1;
    temp.IsException:= (fCaptionType = ctAddException) or (fCaptionType = ctEditException);

    case fCaptionType of
      ctAddEvent, ctEditEvent, ctAddException: temp.ExceptionDate:= ShedulerGrid^.Days[ShedulerGrid^.SelectedDayIndex];
      ctEditException: temp.ExceptionDate:= fEvent^.ExceptionDate;
    end;

    //заполнение шаблона
    if not temp.IsException then
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
    conflictList.Clear;
    TSheduleController.Instance.GetConflictList(temp, ShedulerGrid^.SheduleIK, temp.BeginDate, ShedulerGrid^.SemStop, dbcbStart.ItemIndex+1, @conflictList);
  //  fTeachersInConflict:= '';
    fCalcUnitInConflict:= '';
    fRoomInConflict:= '';
    if conflictList.Count > 0 then
    begin
    //  tempTSL:= TStringList.Create;
      tempCUSL:= TStringList.Create;
      tempRSL:= TStringList.Create;
      for I := 0 to conflictList.Count - 1 do
      begin
        conflictItem:= conflictList[i];
        if TNagruzkaController.Instance.GetTabNFromTeacherIK(conflictItem.TeacherIK) = self.IK then
        begin
          Application.MessageBox(PChar('Для преподавателя "' + conflictItem.TeacherName + '" уже запланированы пары в выбранное время!' + #10#13 + 'Сохранение события с выбранными временными параметрами невозможно.'), PChar(Caption), MB_ICONWARNING);
          Panel2.Visible:= false;
          exit;
        end;
        
    {    if tempTSL.IndexOf(IntToStr(conflictItem.TeacherIK)) < 0 then
        begin
          tempTSL.Add(IntToStr(conflictItem.TeacherIK));
          fTeachersInConflict:= fTeachersInConflict + IntToStr(conflictItem.TeacherIK) + ', ';
        end;   }
        fCalcUnitInConflict:= fCalcUnitInConflict + IntToStr(conflictItem.CalcUnitIK) + ', ';
        if tempRSL.IndexOf(IntToStr(conflictItem.AudIK)) < 0 then
        begin
          tempRSL.Add(IntToStr(conflictItem.AudIK));
          fRoomInConflict:= fRoomInConflict + IntToStr(conflictItem.AudIK) + ', ';
        end;
      end;
   //   Delete(fTeachersInConflict, Length(fTeachersInConflict)-1, 2);
      Delete(fRoomInConflict, Length(fRoomInConflict)-1, 2);
      Delete(fCalcUnitInConflict, Length(fCalcUnitInConflict)-1, 2);

      tempDataSet:= TADODataSet.Create(nil);
      tempDataSet.Connection:= Connection;
      secTempDataSet:= TADODataSet.Create(nil);
      secTempDataSet.Connection:= Connection;
      tempDataSet.CommandText:= 'SELECT DISTINCT Calc_unit.*, Potok_shema.ik_decompose_type, Potok_shema.ik_potok FROM Calc_unit INNER JOIN Potok_shema ON Calc_unit.ik_shema_of_potok = Potok_shema.ik_shema_of_potok WHERE ik_calc_unit in (' + fCalcUnitInConflict + ')';
      tempDataSet.Open;
      while not tempDataSet.Eof do
      begin
        case tempDataSet.FieldByName('ik_decompose_type').AsInteger of
        1: secTempDataSet.CommandText:= 'SELECT DISTINCT ik_calc_unit FROM Calc_unit INNER JOIN Potok_shema ON Calc_unit.ik_shema_of_potok = Potok_shema.ik_shema_of_potok WHERE Potok_shema.ik_potok = ' + tempDataSet.FieldByName('ik_potok').AsString;
        2: secTempDataSet.CommandText:= 'SELECT DISTINCT ik_calc_unit FROM Relation_calc_unit_grup WHERE ik_grup = (SELECT ik_grup FROM Relation_calc_unit_grup WHERE ik_calc_unit = ' + tempDataSet.FieldByName('ik_calc_unit').AsString + ') UNION ' +
              'SELECT DISTINCT ik_calc_unit FROM Calc_unit INNER JOIN Potok_shema ON Calc_unit.ik_shema_of_potok = Potok_shema.ik_shema_of_potok INNER JOIN Relation_potok_grup ON Potok_shema.ik_potok = Relation_potok_grup.ik_potok ' +
              'WHERE (Relation_potok_grup.ik_grup in (SELECT ik_grup FROM Relation_calc_unit_grup WHERE ik_calc_unit = ' + tempDataSet.FieldByName('ik_calc_unit').AsString + ')) and (Potok_shema.ik_decompose_type = 1)';
        3:
          begin
            secTempDataSet.CommandText:= 'SELECT DISTINCT rcug.ik_calc_unit FROM Relation_calc_unit_grup rcug INNER JOIN Calc_unit ON rcug.ik_calc_unit = Calc_unit.ik_calc_unit INNER JOIN ' +
              'Potok_shema ON Calc_unit.ik_shema_of_potok = Potok_shema.ik_shema_of_potok WHERE (ik_grup = (SELECT ik_grup FROM Relation_calc_unit_grup WHERE ik_calc_unit = ' + tempDataSet.FieldByName('ik_calc_unit').AsString + ')) and (Potok_shema.ik_decompose_type = 2) UNION ' +
              'SELECT DISTINCT ik_calc_unit FROM Calc_unit INNER JOIN Potok_shema ON Calc_unit.ik_shema_of_potok = Potok_shema.ik_shema_of_potok INNER JOIN Relation_potok_grup ON Potok_shema.ik_potok = Relation_potok_grup.ik_potok ' +
              'WHERE (Relation_potok_grup.ik_grup in (SELECT ik_grup FROM Relation_calc_unit_grup WHERE ik_calc_unit = ' + tempDataSet.FieldByName('ik_calc_unit').AsString + ')) and (Potok_shema.ik_decompose_type = 1)';
            if tempCUSL.IndexOf(tempDataSet.FieldByName('ik_calc_unit').AsString) < 0 then
              tempCUSL.Add(tempDataSet.FieldByName('ik_calc_unit').AsString);
          end;
        end;
        secTempDataSet.Open;
        while not secTempDataSet.Eof do
        begin
          if tempCUSL.IndexOf(secTempDataSet.FieldByName('ik_calc_unit').AsString) < 0 then
            tempCUSL.Add(secTempDataSet.FieldByName('ik_calc_unit').AsString);
          secTempDataSet.Next;
        end;
        secTempDataSet.Close;
        tempDataSet.Next;
      end;
      tempDataSet.Close;
      tempDataSet.Free;

      fCalcUnitInConflict:= '';
      for i := 0 to tempCUSL.Count - 1 do
        fCalcUnitInConflict:= fCalcUnitInConflict + tempCUSL[i] + ', ';
      Delete(fCalcUnitInConflict, Length(fCalcUnitInConflict)-1, 2);

      //проверяем расчетные единицы в конфликтах

     // tempTSL.Free;
      tempCUSL.Free;
      tempRSL.Free;
{      Application.MessageBox('Для заданных временных параметров события обнаружены конфликтные ситуации - некоторые позиции расписания, соответствующие данным параметрам, уже заняты.' + #10#13 +
        'По этой причине некоторые записи в списках "ФИО преподавателя", "Расчетная единица" и "Номер аудитории" могут отсутствовать...' + #10#13 +
        'Для просмотра событий, с которыми обнаружены конфликты, щелкните кнопку "Просмотреть список конфликтов".', PChar(Caption), MB_ICONWARNING);
        }
   //   fTeachersInConflict:= 'and (iTab_n not in (' + fTeachersInConflict + '))';
      fCalcUnitInConflict:= 'and (Calc_unit.ik_calc_unit not in (' + fCalcUnitInConflict + '))';
      fRoomInConflict:= 'and (ik_room not in (' + fRoomInConflict + '))';
    end;
    fIsConflictOptModified:= false;
    dbcbPlanKeyValueChanged(dbcbPlan);
    Panel2.Visible:= false;
    except
      Panel2.Visible:= false;
    end;
  end;
end;

procedure TfrmNagruzkaAddAudEvent.actRefreshConflictListUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= (dbdtBeginDate.Value <> NULL) and (dbcbStart.ItemIndex >= 0);
  if (Sender as TAction).Enabled and ((fCaptionType = ctAddEvent) or (fCaptionType = ctEditEvent)) then
  begin
    (Sender as TAction).Enabled:= (Sender as TAction).Enabled and (dbcbRepeatType.KeyValue <> NULL) and (rbRLTF.Checked or rbRLTS.Checked or rbRLTT.Checked);
    case dbcbRepeatType.KeyValue of
      1: (Sender as TAction).Enabled:= (Sender as TAction).Enabled and (dbeDFDay.Text <> '');
      2: (Sender as TAction).Enabled:= (Sender as TAction).Enabled and (cbWMon.Checked or cbWTue.Checked or cbWWen.Checked or cbWThu.Checked or cbWFri.Checked or cbWSat.Checked);
      3: (Sender as TAction).Enabled:= (Sender as TAction).Enabled and (true);
    end;
  end;
  dbcbPlan.Enabled:= not fIsConflictOptModified;
  dbcbPrep.Enabled:= dbcbPlan.Enabled and (dbcbPlan.KeyValue <> NULL);
  dbcbDisc.Enabled:= dbcbPrep.Enabled and (dbcbPrep.KeyValue <> NULL);
  dbcbPotok.Enabled:= dbcbDisc.Enabled and (dbcbDisc.KeyValue <> NULL);
  dbcbVidZanyat.Enabled:= dbcbPotok.Enabled and (dbcbPotok.KeyValue <> NULL);
  dbcbVidNagruzki.Enabled:= dbcbVidZanyat.Enabled and (dbcbVidZanyat.KeyValue <> NULL);
  dbcbCalcUnit.Enabled:= dbcbVidNagruzki.Enabled and (dbcbVidNagruzki.KeyValue <> NULL);
  dbcbCampus.Enabled:= not fIsConflictOptModified;
  dbcbRoom.Enabled:= dbcbCampus.Enabled and (dbcbCampus.KeyValue <> NULL);
  IsModified:= IsShadowModified and (not fIsConflictOptModified);
end;

procedure TfrmNagruzkaAddAudEvent.actShowConflictListExecute(Sender: TObject);
var
  tempForm: TfrmNagruzkaAddEventLog;
begin
  tempForm:= TfrmNagruzkaAddEventLog.CreateDialog(self, Connection, nil);
  tempForm.PushConflictsInList(@conflictList);
  tempForm.Label1.Caption:= fReportCaption;
  tempForm.ShowModal;
  tempForm.Free;
end;

procedure TfrmNagruzkaAddAudEvent.actShowConflictListUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= actRefreshConflictList.Enabled and (conflictList.Count > 0); 
end;

procedure TfrmNagruzkaAddAudEvent.cbWMonClick(Sender: TObject);
begin
  fIsConflictOptModified:= true;
  dbeNameChange(nil);
end;

procedure TfrmNagruzkaAddAudEvent.dbeDFDayChange(Sender: TObject);
begin
  fIsConflictOptModified:= true;
  dbeNameChange(nil);
end;

procedure TfrmNagruzkaAddAudEvent.dbeWWeekChange(Sender: TObject);
begin
  fIsConflictOptModified:= true;
  dbeNameChange(nil);
end;

procedure TfrmNagruzkaAddAudEvent.dbeWWeekKeyPress(Sender: TObject;
  var Key: Char);
const
  allow: set of char = ['1','2','3','4','5','6','7','8','9','0', #8];
begin
  if not (Key in allow) then Key:= #0;
end;

procedure TfrmNagruzkaAddAudEvent.SetCaptions(capType: TCapType);
begin
  fCaptionType:= capType;
  case capType of
  ctAddEvent:
    begin
      Caption:= 'Добавление события';
      fReportCaption:= 'Отчет о добавлении события:';
      frmNagruzkaAddAudEvent.SetRepeatPattern(true);
    end;
  ctEditEvent:
    begin
      Caption:= 'Изменение события';
      fReportCaption:= 'Отчет об изменении события:';
      frmNagruzkaAddAudEvent.SetRepeatPattern(true);
    end;
  ctAddException:
    begin
      Caption:= 'Добавление исключения';
      fReportCaption:= 'Отчет о добавлении исключения:';
      frmNagruzkaAddAudEvent.SetRepeatPattern(false);
    end;
  ctEditException:
    begin
      Caption:= 'Изменение исключения';
      fReportCaption:= 'Отчет об изменении исключения:';
      frmNagruzkaAddAudEvent.SetRepeatPattern(false);
    end;
  end;
end;

end.
