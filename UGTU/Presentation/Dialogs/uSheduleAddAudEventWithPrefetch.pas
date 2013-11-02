unit uSheduleAddAudEventWithPrefetch;
   {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, DBGridEh, NagruzkaController,
  DBLookupEh, DBCtrlsEh, Mask, DB, ADODB, SheduleController, GeneralController, SheduleGrids,
  ComCtrls, ImgList, ToolWin, SheduleClasses, Menus, Contnrs, Grids, uDM;

type
  TCapType = (ctAddEvent, ctEditEvent, ctAddException, ctEditException);

  TfrmSheduleAddAudEventWithPrefetch = class(TfrmBaseDialog)
    Panel4: TPanel;
    dbcbCampus: TDBLookupComboboxEh;
    dbcbRoom: TDBLookupComboboxEh;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    Label29: TLabel;
    Label31: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    actRefreshConflictList: TAction;
    actShowConflictList: TAction;
    ImageList1: TImageList;
    dbcbExecWorkType: TDBLookupComboboxEh;
    Label30: TLabel;
    dbcbExecPrep: TDBLookupComboboxEh;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Bevel4: TBevel;
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
    dbcbKafedra: TDBComboBoxEh;
    dbcbFormEd: TDBComboBoxEh;
    dbcbDisc: TDBComboBoxEh;
    dbcbVidZanyat: TDBComboBoxEh;
    dbcbVidNagruzki: TDBComboBoxEh;
    dbcbCalcUnit: TDBComboBoxEh;
    dbcbPlanTeacherFIO: TDBComboBoxEh;
    dbcbPlanTeacherWorkType: TDBComboBoxEh;
    Panel2: TPanel;
    Image1: TImage;
    Label7: TLabel;
    Label12: TLabel;
    Image2: TImage;
    Image9: TImage;
    Label4: TLabel;
    Label38: TLabel;
    Bevel2: TBevel;
    Label39: TLabel;
    lHours: TLabel;
    actRefreshHours: TAction;
    BitBtn1: TBitBtn;
    Panel7: TPanel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    StringGrid3: TStringGrid;
    StringGrid4: TStringGrid;
    StringGrid5: TStringGrid;
    StringGrid6: TStringGrid;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    procedure dbcbRepeatTypeKeyValueChanged(Sender: TObject);
    procedure dbeMFDayExit(Sender: TObject);
    procedure dbcbCampusKeyValueChanged(Sender: TObject);
    procedure dbeRepeatCountChange(Sender: TObject);
    procedure dbdtFinalDateChange(Sender: TObject);
    procedure dbcbMSNumChange(Sender: TObject);
    procedure dbeMFDayChange(Sender: TObject);
    procedure dbcbStartChange(Sender: TObject);
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
    procedure dbcbExecPrepKeyValueChanged(Sender: TObject);
    procedure dbcbExecWorkTypeKeyValueChanged(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure dbcbPartChange(Sender: TObject);
    procedure cbCWMonClick(Sender: TObject);
    procedure dbcbNumeratorTypeChange(Sender: TObject);
    procedure UpDown1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure dbcbKafedraChange(Sender: TObject);
    procedure dbcbCalcUnitChange(Sender: TObject);
    procedure dbcbFormEdChange(Sender: TObject);
    procedure dbcbDiscChange(Sender: TObject);
    procedure dbcbVidZanyatChange(Sender: TObject);
    procedure dbcbVidNagruzkiChange(Sender: TObject);
    procedure dbcbPlanTeacherFIOChange(Sender: TObject);
    procedure dbcbPlanTeacherWorkTypeChange(Sender: TObject);
    procedure Label38MouseEnter(Sender: TObject);
    procedure Label38MouseLeave(Sender: TObject);
    procedure Label4MouseEnter(Sender: TObject);
    procedure Label4MouseLeave(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure dbcbRoomKeyValueChanged(Sender: TObject);
    procedure dbcbNumeratorTypeKeyPress(Sender: TObject; var Key: Char);
    procedure actRefreshHoursUpdate(Sender: TObject);
    procedure BitBtn1MouseEnter(Sender: TObject);
    procedure BitBtn1MouseLeave(Sender: TObject);
  private
    fIsDepProcess: boolean;
    fPrepodPlanIKList: string;
  //  fRoomInConflict, fCalcUnitInConflict, fTeachersInConflict: string;
    temp: TSheduleEvent;
    conflictList: TSheduleEventList;
    fEvent: TSheduleEvent;
    fShedulerGrid: TCustomLessonSheduleGrid;
    fIsShadowModified: boolean;
    fCaptionType: TCapType;
    fFormStartClosing: boolean;
    fPartList: TObjectList;
    fConflictConditionsWereChanged: boolean;
 //   procedure SetIsConflictOptModified(const Value: boolean);
   // property IsConflictOptModified: boolean read fIsConflictOptModified write SetIsConflictOptModified;
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public

    ikyear : integer;
    iksemtype : integer;

    destructor Destroy; override;
    procedure SetCaptions(capType: TCapType; isExtendedMode: boolean);
    property Event: TSheduleEvent read fEvent write fEvent;
    property ShedulerGrid: TCustomLessonSheduleGrid read fShedulerGrid write fShedulerGrid;
    procedure Read(IsDepProcess: boolean);
  end;

var
  frmSheduleAddAudEventWithPrefetch: TfrmSheduleAddAudEventWithPrefetch;

implementation

uses DateUtils, uSheduleConflictLog, udmUchPlan;

{$R *.dfm}

procedure CloseComboBox(AComboBox: TDBComboBoxEh);
begin
  AComboBox.ItemIndex:= -1;
  AComboBox.KeyItems.Clear;
  AComboBox.Items.Clear;
end;

procedure TfrmSheduleAddAudEventWithPrefetch.dbcbRepeatTypeKeyValueChanged(
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
  fIsShadowModified:= true;
end;

procedure TfrmSheduleAddAudEventWithPrefetch.dbcbRoomKeyValueChanged(
  Sender: TObject);
begin
  fIsShadowModified:= true;
  fConflictConditionsWereChanged:= true;
end;

procedure TfrmSheduleAddAudEventWithPrefetch.Read(IsDepProcess: boolean);
var
  i: integer;
begin
  fFormStartClosing:= true;
  dbcbKafedra.ItemIndex:= -1;
  dbcbFormEd.ItemIndex:= -1;
  dbcbDisc.ItemIndex:= -1;
  dbcbVidZanyat.ItemIndex:= -1;
  dbcbVidNagruzki.ItemIndex:= -1;
  dbcbCalcUnit.ItemIndex:= -1;
  dbcbPlanTeacherFIO.ItemIndex:= -1;
  dbcbPlanTeacherWorkType.ItemIndex:= -1;
  fFormStartClosing:= false;
  fConflictConditionsWereChanged:= false;
  fIsDepProcess:= IsDepProcess;
  conflictList:= TSheduleEventList.Create;
  fIsShadowModified:= false;
  TGeneralController.Instance.InitializeLockupCB(@dbcbCampus, 'ik_campus', 'Cname_campus');
  TGeneralController.Instance.InitializeLockupCB(@dbcbRoom, 'ik_room', 'Cname_room');
  TGeneralController.Instance.InitializeLockupCB(@dbcbExecPrep, 'iTab_n', 'FIO');
  TGeneralController.Instance.InitializeLockupCB(@dbcbExecWorkType, 'ik_id_prepod', 'full_work_type_name');
  TGeneralController.Instance.InitializeLockupCB(@dbcbRepeatType, 'ik_repeat_type', 'Cname_repeat_type');
  TSheduleController.MainFunctions.GetRepeatTypeList(@dbcbRepeatType.ListSource.DataSet);
  dbcbPart.Items.Clear;

  for I := 0 to fShedulerGrid.PartCount-1 - 1 do
    dbcbPart.Items.Add(IntToStr(fShedulerGrid.Parts[i].PartNumber) + '-я пара');

  dbcbStart.Items.Clear;
  for i:= 0 to fShedulerGrid.PartCount-1 do
    dbcbStart.Items.Add(FormatDateTime('h:nn', fShedulerGrid.Parts[i].StartTime));

  if dbcbStart.Items.Count > 0 then dbcbStart.ItemIndex:= fShedulerGrid.PartIndex;
  dbcbNumeratorType.ItemIndex:= 0;

  if fIsDepProcess then
    TSheduleController.MainFunctions.LoadPlanNagrForTeacherToPrefetch(TDepLessonSheduleGrid(ShedulerGrid).KafedraIK, ShedulerGrid.SheduleIK, true)
  else TSheduleController.MainFunctions.LoadPlanNagrForGroupToPrefetch(IK, ShedulerGrid.SheduleIK, true);


  if (fEvent <> nil) then
  begin
    dbcbKafedra.ItemIndex:= TSheduleController.MainFunctions.GetDepartmentListForAddEventFromPrefetch(dbcbKafedra.KeyItems, dbcbKafedra.Items, fEvent.KafedraIK);

    if (fCaptionType = ctEditEvent) then
    begin
  {    actRefreshConflictListUpdate(actRefreshConflictList);
      if actRefreshConflictList.Enabled then
        actRefreshConflictListExecute(actRefreshConflictList);  }
      dbdtBeginDate.Value:= fEvent.BeginDate;

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
    if (fCaptionType = ctAddException) then
      dbdtBeginDate.Value:= fShedulerGrid.PeriodStart + fShedulerGrid.DayIndex;
    if (fCaptionType = ctEditException) then
      dbdtBeginDate.Value:= fEvent.BeginDate;
    fIsShadowModified:= false;
    //fConflictConditionsWereChanged:= false;
  end
  else
  begin
    dbcbKafedra.ItemIndex:= TSheduleController.MainFunctions.GetDepartmentListForAddEventFromPrefetch(dbcbKafedra.KeyItems, dbcbKafedra.Items, -1);
    dbdtBeginDate.Value:= fShedulerGrid.PeriodStart + fShedulerGrid.DayIndex;
    dbcbRepeatType.KeyValue:= 2;
    rbRLTT.Checked:= true;
    if IsDepProcess then
      dbdtFinalDate.Value:= ShedulerGrid.DefaultSemLengthInfo.MaxSemStop
    else dbdtFinalDate.Value:= ShedulerGrid.DefaultSemLengthInfo.GetSemesterLengthForGrup(IK).SemStop;

  {  actRefreshConflictListUpdate(actRefreshConflictList);
    if actRefreshConflictList.Enabled then
      actRefreshConflictListExecute(actRefreshConflictList);   }

  end;
end;

destructor TfrmSheduleAddAudEventWithPrefetch.Destroy;
begin
  fFormStartClosing:= true;
  TGeneralController.Instance.ReleaseLockupCB(@dbcbExecWorkType);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbExecPrep);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbRoom);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbCampus);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbRepeatType);
  TSheduleController.MainFunctions.ClearPrefetchPlanNagr;
  if temp <> nil then FreeAndNil(temp);
  if conflictList <> nil then FreeAndNil(conflictList);
  inherited;
end;

function TfrmSheduleAddAudEventWithPrefetch.DoApply: boolean;
var
  tempList: TObjectList;
  planHour: double;
  tempSemLengthInfo: TSemLengthInfo;
  tempStr: string;
  y,m,d,h,min,s,ms: word;
  repeatPatternIK: integer;
begin
  Result:= false;
{  if fPrepodPlanIKList = '' then
  begin
    Application.MessageBox('Перед началом сохранения события необходимо указать все параметры!', PChar(Caption), MB_ICONWARNING);
    exit;
  end;
  if fIsDepProcess then
    tempSemLengthInfo:= ShedulerGrid.DefaultSemLengthInfo
  else tempSemLengthInfo:= ShedulerGrid.DefaultSemLengthInfo.GetSemesterLengthForGrup(IK);
 }

  Panel2.Top:= round((Height - Panel2.Height)/2);
  Panel2.Visible:= true;
  Refresh;
  try
    if fConflictConditionsWereChanged then
      actRefreshConflictListExecute(actRefreshConflictList);

    tempSemLengthInfo:= ShedulerGrid.DefaultSemLengthInfo.GetSemesterLengthForGrup(StrToInt(temp.GroupIKList[0]));

  //    if (dbdtFinalDate.Value = NULL) then
    //    dbdtFinalDate.Value:= ShedulerGrid.DefaultSemLengthInfo.SemStop;
    if not tempSemLengthInfo.IsAudDateAllow(VarToDateTime(dbdtBeginDate.Value)) then
    begin
      Application.MessageBox('Дата начала повторения события выходит за рамки текущего семестра!', PChar(Caption),MB_ICONWARNING);
      exit;
    end;

    if (fCaptionType = ctAddEvent) or (fCaptionType = ctEditEvent) then
      if rbRLTT.Checked then
        if not tempSemLengthInfo.IsAudDateAllow(VarToDateTime(dbdtFinalDate.Value)) then
        begin
          Application.MessageBox('Дата окончания повторения события выходит за рамки текущего семестра!', PChar(Caption),MB_ICONWARNING);
          exit;
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
      if rbRLTF.Checked then
      begin
        temp.RepeatPattern.RepeatLimitType:= 1;
        temp.RepeatPattern.EndDateOfRepeat:= tempSemLengthInfo.SemStop;
      end;
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

    if TSheduleController.MainFunctions.CheckEventForConflict(temp, conflictList) then
    begin
      Application.MessageBox('Происходит одновременное выполнение данного события и одного из обнаруженных конфликтов, список которых можно просмотреть нажав на кнопку "Список конфликтов"!', PChar(Caption), MB_ICONWARNING);
      if Application.MessageBox('Сделать исключение?', PChar(Caption), MB_YESNO)=mrNo then
         exit;
    end;

    if TSheduleController.MainFunctions.CheckPrepodSemseterTimeConstraint(ShedulerGrid.SheduleIK, tempSemLengthInfo, temp) then
    begin
      Application.MessageBox('Согласно установленным ограничениям данный преподаватель не может проводить занятие в указанное время!', PChar(Caption), MB_ICONWARNING);
      if Application.MessageBox('Сделать исключение?', PChar(Caption), MB_YESNO)=mrNo then
         exit;
    end;
    if not TSheduleController.MainFunctions.CheckRoomUseConstraint(fPrepodPlanIKList, ShedulerGrid.SheduleIK, StrToInt(dbcbKafedra.KeyItems[dbcbKafedra.ItemIndex]), dbcbRoom.KeyValue) then
    begin
      Application.MessageBox('Согласно установленным ограничениям данное занятие не может проводиться в указанной аудитории!', PChar(Caption), MB_ICONWARNING);
      if Application.MessageBox('Сделать исключение?', PChar(Caption), MB_YESNO)=mrNo then
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

    if Result then fIsShadowModified:= false;
  finally
    Panel2.Visible:= false;
  end;
end;

function TfrmSheduleAddAudEventWithPrefetch.DoCancel: boolean;
begin
  Result:= false;
  case (Application.MessageBox('Сохранить внесенные изменения?','Измение информации о событии', MB_YESNOCANCEL)) of
      mrYes: OK;
      mrNo: Result:= true;
  end;
end;

procedure TfrmSheduleAddAudEventWithPrefetch.FormShow(Sender: TObject);
begin
{  if (dbcbRepeatType.KeyValue = 2) and (Panel3.Visible) and (Panel5.Visible) then
    dbeWWeek.SetFocus
  else if Panel6.Visible then dbcbNumeratorType.SetFocus;   }
end;

procedure TfrmSheduleAddAudEventWithPrefetch.Label38MouseEnter(Sender: TObject);
begin
  Label38.Font.Style:= Label38.Font.Style + [fsUnderline];
end;

procedure TfrmSheduleAddAudEventWithPrefetch.Label38MouseLeave(Sender: TObject);
begin
  Label38.Font.Style:= Label38.Font.Style - [fsUnderline];
end;

procedure TfrmSheduleAddAudEventWithPrefetch.Label4Click(Sender: TObject);
var
  key: word;
begin
  key:= 112;
  FormKeyUp(Self, key, []);
end;

procedure TfrmSheduleAddAudEventWithPrefetch.Label4MouseEnter(Sender: TObject);
begin
  Label4.Font.Style:= Label4.Font.Style + [fsUnderline];
end;

procedure TfrmSheduleAddAudEventWithPrefetch.Label4MouseLeave(Sender: TObject);
begin
  Label4.Font.Style:= Label4.Font.Style - [fsUnderline];
end;

procedure TfrmSheduleAddAudEventWithPrefetch.N1Click(Sender: TObject);
begin
  SetCaptions(fCaptionType, false);
  N1.Checked:= true;
end;

procedure TfrmSheduleAddAudEventWithPrefetch.N2Click(Sender: TObject);
begin
  SetCaptions(fCaptionType, true);
  N2.Checked:= true;
end;

procedure TfrmSheduleAddAudEventWithPrefetch.rbRLTFClick(Sender: TObject);
begin
  fIsShadowModified:= true;
end;

procedure TfrmSheduleAddAudEventWithPrefetch.dbeMFDayExit(Sender: TObject);
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

procedure TfrmSheduleAddAudEventWithPrefetch.dbcbDiscChange(Sender: TObject);
begin
  if fFormStartClosing then exit;
  CloseComboBox(dbcbVidZanyat);
  if dbcbDisc.ItemIndex >= 0 then
  begin
    if fEvent <> nil then
      dbcbVidZanyat.ItemIndex:= TSheduleController.MainFunctions.GetVidZanyatListForAddEventFromPrefetch(StrToInt(dbcbKafedra.KeyItems[dbcbKafedra.ItemIndex]), StrToInt(dbcbFormEd.KeyItems[dbcbFormEd.ItemIndex]),
        StrToInt(dbcbDisc.KeyItems[dbcbDisc.ItemIndex]), dbcbVidZanyat.KeyItems, dbcbVidZanyat.Items, fEvent.VidZanyatIK)
    else dbcbVidZanyat.ItemIndex:= TSheduleController.MainFunctions.GetVidZanyatListForAddEventFromPrefetch(StrToInt(dbcbKafedra.KeyItems[dbcbKafedra.ItemIndex]), StrToInt(dbcbFormEd.KeyItems[dbcbFormEd.ItemIndex]),
        StrToInt(dbcbDisc.KeyItems[dbcbDisc.ItemIndex]), dbcbVidZanyat.KeyItems, dbcbVidZanyat.Items, -1);
  end;
  dbcbVidZanyat.Enabled:= dbcbDisc.ItemIndex >= 0;
  dbcbRoomKeyValueChanged(dbcbRoom);

    actRefreshHoursUpdate(self);
end;

procedure TfrmSheduleAddAudEventWithPrefetch.dbcbExecPrepKeyValueChanged(Sender: TObject);
//var
//  lastValue: Variant;
var  tempStoredProc: TADOStoredProc;
str: string;
i, j: integer;
begin
  if fFormStartClosing then exit;
  TGeneralController.Instance.CloseLockupCB(@dbcbExecWorkType);
  if dbcbExecPrep.KeyValue <> NULL then
  begin
    BitBtn1.Enabled:=true;

    tempStoredProc:= TADOStoredProc.Create(nil);
    try
      tempStoredProc.Connection:= dm.DBConnect;
      tempStoredProc.ProcedureName:= 'Nagr_GetBusyForPrep';
      tempStoredProc.Parameters.CreateParameter('@itab_n', ftInteger, pdInput, 0, dbcbExecPrep.KeyValue);
      tempStoredProc.Parameters.CreateParameter('@ik_shedule', ftInteger, pdInput, 0, ShedulerGrid.SheduleIK);
      try
        tempStoredProc.Open;
        tempStoredProc.first;
      except
        raise;
      end;

      //заполнение занятости
      for i := 0 to StringGrid1.RowCount - 1 do
      begin
        StringGrid1.Rows[i].Clear();
        StringGrid2.Rows[i].Clear();
        StringGrid3.Rows[i].Clear();
        StringGrid4.Rows[i].Clear();
        StringGrid5.Rows[i].Clear();
        StringGrid6.Rows[i].Clear();
      end;

      if tempStoredProc.RecordCount>0 then

      while not tempStoredProc.Eof do
      begin
      str:=tempStoredProc.FieldByName('cRepeat_mask').AsString;
      for i:=1 to 6 do
        begin
          case str[i] of
            '2':
            begin
              case tempStoredProc.FieldByName('iRepeat_frequency').AsInteger of
                1:
                begin
                  case tempStoredProc.FieldByName('ik_vid_zanyat').AsInteger of
                  3: for j:=0 to 1 do
                       StringGrid1.Cells[tempStoredProc.FieldByName('ik_event_type').AsInteger-1,j]:='Л';
                  4: for j:=0 to 1 do
                       StringGrid1.Cells[tempStoredProc.FieldByName('ik_event_type').AsInteger-1,j]:='Лб';
                  5: for j:=0 to 1 do
                       StringGrid1.Cells[tempStoredProc.FieldByName('ik_event_type').AsInteger-1,j]:='Пр';
                  end;
                end;
                2:
                begin
                  if (tempStoredProc.FieldByName('ch_zn').AsInteger>7)
                    and (tempStoredProc.FieldByName('ch_zn').AsInteger<14) then
                    j:=1
                  else
                    j:=0;
                  case tempStoredProc.FieldByName('ik_vid_zanyat').AsInteger of
                  3: StringGrid1.Cells[tempStoredProc.FieldByName('ik_event_type').AsInteger-1,j]:='Л';
                  4: StringGrid1.Cells[tempStoredProc.FieldByName('ik_event_type').AsInteger-1,j]:='Лб';
                  5: StringGrid1.Cells[tempStoredProc.FieldByName('ik_event_type').AsInteger-1,j]:='Пр';
                  end;
                end;
              end;
            end;
            '3':
            begin
              case tempStoredProc.FieldByName('iRepeat_frequency').AsInteger of
                1:
                begin
                  case tempStoredProc.FieldByName('ik_vid_zanyat').AsInteger of
                  3: for j:=0 to 1 do
                       StringGrid2.Cells[tempStoredProc.FieldByName('ik_event_type').AsInteger-1,j]:='Л';
                  4: for j:=0 to 1 do
                       StringGrid2.Cells[tempStoredProc.FieldByName('ik_event_type').AsInteger-1,j]:='Лб';
                  5: for j:=0 to 1 do
                       StringGrid2.Cells[tempStoredProc.FieldByName('ik_event_type').AsInteger-1,j]:='Пр';
                  end;
                end;
                2:
                begin
                  if (tempStoredProc.FieldByName('ch_zn').AsInteger>7)
                    and (tempStoredProc.FieldByName('ch_zn').AsInteger<14) then
                    j:=1
                  else
                    j:=0;
                  case tempStoredProc.FieldByName('ik_vid_zanyat').AsInteger of
                  3: StringGrid2.Cells[tempStoredProc.FieldByName('ik_event_type').AsInteger-1,j]:='Л';
                  4: StringGrid2.Cells[tempStoredProc.FieldByName('ik_event_type').AsInteger-1,j]:='Лб';
                  5: StringGrid2.Cells[tempStoredProc.FieldByName('ik_event_type').AsInteger-1,j]:='Пр';
                  end;
                end;
              end;
            end;
            '4':
            begin
              case tempStoredProc.FieldByName('iRepeat_frequency').AsInteger of
                1:
                begin
                  case tempStoredProc.FieldByName('ik_vid_zanyat').AsInteger of
                  3: for j:=0 to 1 do
                       StringGrid3.Cells[tempStoredProc.FieldByName('ik_event_type').AsInteger-1,j]:='Л';
                  4: for j:=0 to 1 do
                       StringGrid3.Cells[tempStoredProc.FieldByName('ik_event_type').AsInteger-1,j]:='Лб';
                  5: for j:=0 to 1 do
                       StringGrid3.Cells[tempStoredProc.FieldByName('ik_event_type').AsInteger-1,j]:='Пр';
                  end;
                end;
                2:
                begin
                  if (tempStoredProc.FieldByName('ch_zn').AsInteger>7)
                    and (tempStoredProc.FieldByName('ch_zn').AsInteger<14) then
                    j:=1
                  else
                    j:=0;
                  case tempStoredProc.FieldByName('ik_vid_zanyat').AsInteger of
                  3: StringGrid3.Cells[tempStoredProc.FieldByName('ik_event_type').AsInteger-1,j]:='Л';
                  4: StringGrid3.Cells[tempStoredProc.FieldByName('ik_event_type').AsInteger-1,j]:='Лб';
                  5: StringGrid3.Cells[tempStoredProc.FieldByName('ik_event_type').AsInteger-1,j]:='Пр';
                  end;
                end;
              end;
            end;
            '5':
            begin
              case tempStoredProc.FieldByName('iRepeat_frequency').AsInteger of
                1:
                begin
                  case tempStoredProc.FieldByName('ik_vid_zanyat').AsInteger of
                  3: for j:=0 to 1 do
                       StringGrid4.Cells[tempStoredProc.FieldByName('ik_event_type').AsInteger-1,j]:='Л';
                  4: for j:=0 to 1 do
                       StringGrid4.Cells[tempStoredProc.FieldByName('ik_event_type').AsInteger-1,j]:='Лб';
                  5: for j:=0 to 1 do
                       StringGrid4.Cells[tempStoredProc.FieldByName('ik_event_type').AsInteger-1,j]:='Пр';
                  end;
                end;
                2:
                begin
                  if (tempStoredProc.FieldByName('ch_zn').AsInteger>7)
                    and (tempStoredProc.FieldByName('ch_zn').AsInteger<14) then
                    j:=1
                  else
                    j:=0;
                  case tempStoredProc.FieldByName('ik_vid_zanyat').AsInteger of
                  3: StringGrid4.Cells[tempStoredProc.FieldByName('ik_event_type').AsInteger-1,j]:='Л';
                  4: StringGrid4.Cells[tempStoredProc.FieldByName('ik_event_type').AsInteger-1,j]:='Лб';
                  5: StringGrid4.Cells[tempStoredProc.FieldByName('ik_event_type').AsInteger-1,j]:='Пр';
                  end;
                end;
              end;
            end;
            '6':
            begin
              case tempStoredProc.FieldByName('iRepeat_frequency').AsInteger of
                1:
                begin
                  case tempStoredProc.FieldByName('ik_vid_zanyat').AsInteger of
                  3: for j:=0 to 1 do
                       StringGrid5.Cells[tempStoredProc.FieldByName('ik_event_type').AsInteger-1,j]:='Л';
                  4: for j:=0 to 1 do
                       StringGrid5.Cells[tempStoredProc.FieldByName('ik_event_type').AsInteger-1,j]:='Лб';
                  5: for j:=0 to 1 do
                       StringGrid5.Cells[tempStoredProc.FieldByName('ik_event_type').AsInteger-1,j]:='Пр';
                  end;
                end;
                2:
                begin
                  if (tempStoredProc.FieldByName('ch_zn').AsInteger>7)
                    and (tempStoredProc.FieldByName('ch_zn').AsInteger<14) then
                    j:=1
                  else
                    j:=0;
                  case tempStoredProc.FieldByName('ik_vid_zanyat').AsInteger of
                  3: StringGrid5.Cells[tempStoredProc.FieldByName('ik_event_type').AsInteger-1,j]:='Л';
                  4: StringGrid5.Cells[tempStoredProc.FieldByName('ik_event_type').AsInteger-1,j]:='Лб';
                  5: StringGrid5.Cells[tempStoredProc.FieldByName('ik_event_type').AsInteger-1,j]:='Пр';
                  end;
                end;
              end;
            end;
            '7':
            begin
              case tempStoredProc.FieldByName('iRepeat_frequency').AsInteger of
                1:
                begin
                  case tempStoredProc.FieldByName('ik_vid_zanyat').AsInteger of
                  3: for j:=0 to 1 do
                       StringGrid6.Cells[tempStoredProc.FieldByName('ik_event_type').AsInteger-1,j]:='Л';
                  4: for j:=0 to 1 do
                       StringGrid6.Cells[tempStoredProc.FieldByName('ik_event_type').AsInteger-1,j]:='Лб';
                  5: for j:=0 to 1 do
                       StringGrid6.Cells[tempStoredProc.FieldByName('ik_event_type').AsInteger-1,j]:='Пр';
                  end;
                end;
                2:
                begin
                  if (tempStoredProc.FieldByName('ch_zn').AsInteger>7)
                    and (tempStoredProc.FieldByName('ch_zn').AsInteger<14) then
                    j:=1
                  else
                    j:=0;
                  case tempStoredProc.FieldByName('ik_vid_zanyat').AsInteger of
                  3: StringGrid6.Cells[tempStoredProc.FieldByName('ik_event_type').AsInteger-1,j]:='Л';
                  4: StringGrid6.Cells[tempStoredProc.FieldByName('ik_event_type').AsInteger-1,j]:='Лб';
                  5: StringGrid6.Cells[tempStoredProc.FieldByName('ik_event_type').AsInteger-1,j]:='Пр';
                  end;
                end;
              end;
            end;
          end;
        end;
        tempStoredProc.Next;
      end;

    finally
      tempStoredProc.Free;
    end;

    if fEvent <> nil then
      dbcbExecWorkType.KeyValue:= TNagruzkaController.Preparation.GetAlowedWorkTypes(@dbcbExecWorkType.ListSource.DataSet, dbcbExecPrep.KeyValue, StrToInt(dbcbKafedra.KeyItems[dbcbKafedra.ItemIndex]), ShedulerGrid.DefaultSemLengthInfo.MinSemStart, '', fEvent.TeacherIK)
    else dbcbExecWorkType.KeyValue:= TNagruzkaController.Preparation.GetAlowedWorkTypes(@dbcbExecWorkType.ListSource.DataSet, dbcbExecPrep.KeyValue, StrToInt(dbcbKafedra.KeyItems[dbcbKafedra.ItemIndex]), ShedulerGrid.DefaultSemLengthInfo.MinSemStart, '', NULL);
  end;
  dbcbExecWorkType.Enabled:= dbcbExecPrep.KeyValue <> NULL;
  dbcbRoomKeyValueChanged(dbcbRoom);



end;

procedure TfrmSheduleAddAudEventWithPrefetch.dbcbExecWorkTypeKeyValueChanged(
  Sender: TObject);
begin
  if fFormStartClosing then exit;
//  if (dbcbPlanWorkType.KeyValue = NULL) and (dbcbExecWorkType.KeyValue <> NULL) then
//    dbcbPlanWorkType.KeyValue:= dbcbExecWorkType.KeyValue;
  dbcbRoomKeyValueChanged(dbcbRoom);
end;

procedure TfrmSheduleAddAudEventWithPrefetch.dbcbFormEdChange(Sender: TObject);
begin
  if fFormStartClosing then exit;
  CloseComboBox(dbcbDisc);
  if dbcbFormEd.ItemIndex >= 0 then
  begin
    if fEvent <> nil then
      dbcbDisc.ItemIndex:= TSheduleController.MainFunctions.GetDiscListForAddEventFromPrefetch(StrToInt(dbcbKafedra.KeyItems[dbcbKafedra.ItemIndex]), StrToInt(dbcbFormEd.KeyItems[dbcbFormEd.ItemIndex]), dbcbDisc.KeyItems, dbcbDisc.Items, fEvent.DiscIK)
    else dbcbDisc.ItemIndex:= TSheduleController.MainFunctions.GetDiscListForAddEventFromPrefetch(StrToInt(dbcbKafedra.KeyItems[dbcbKafedra.ItemIndex]), StrToInt(dbcbFormEd.KeyItems[dbcbFormEd.ItemIndex]), dbcbDisc.KeyItems, dbcbDisc.Items, -1);
  end;
  dbcbDisc.Enabled:= dbcbFormEd.ItemIndex >= 0;
  dbcbRoomKeyValueChanged(dbcbRoom);
end;

procedure TfrmSheduleAddAudEventWithPrefetch.dbcbKafedraChange(Sender: TObject);
begin
  if fFormStartClosing then exit;
  TGeneralController.Instance.CloseLockupCB(@dbcbExecPrep);
  CloseComboBox(dbcbFormEd);
  if dbcbKafedra.ItemIndex >= 0 then
  begin
    TNagruzkaController.Preparation.GetAllPrepInKaf(@dbcbExecPrep.ListSource.DataSet, StrToInt(dbcbKafedra.KeyItems[dbcbKafedra.ItemIndex]));
    if fIsDepProcess then
    begin
      dbcbExecPrep.KeyValue:= IK;
      dbcbExecPrep.Enabled:= false;
    end
    else
    begin
      if fEvent <> nil then
        dbcbExecPrep.KeyValue:= fEvent.TabN;
    end;
    if fEvent <> nil then
      dbcbFormEd.ItemIndex:= TSheduleController.MainFunctions.GetFormEdListForAddEventFromPrefetch(StrToInt(dbcbKafedra.KeyItems[dbcbKafedra.ItemIndex]), dbcbFormEd.KeyItems, dbcbFormEd.Items, fEvent.FormEdIK)
    else dbcbFormEd.ItemIndex:= TSheduleController.MainFunctions.GetFormEdListForAddEventFromPrefetch(StrToInt(dbcbKafedra.KeyItems[dbcbKafedra.ItemIndex]), dbcbFormEd.KeyItems, dbcbFormEd.Items, -1);
  end;
  if not fIsDepProcess then
    dbcbFormEd.Enabled:= dbcbKafedra.ItemIndex >= 0;
  dbcbRoomKeyValueChanged(dbcbRoom);
end;

procedure TfrmSheduleAddAudEventWithPrefetch.dbcbCalcUnitChange(
  Sender: TObject);
begin
  if fFormStartClosing then exit;
  CloseComboBox(dbcbPlanTeacherFIO);
  if dbcbCalcUnit.ItemIndex >= 0 then
  begin
    if fEvent <> nil then
      dbcbPlanTeacherFIO.ItemIndex:= TSheduleController.MainFunctions.GetTeacherListForAddEventFromPrefetch(StrToInt(dbcbKafedra.KeyItems[dbcbKafedra.ItemIndex]), StrToInt(dbcbFormEd.KeyItems[dbcbFormEd.ItemIndex]),
        StrToInt(dbcbDisc.KeyItems[dbcbDisc.ItemIndex]), StrToInt(dbcbVidZanyat.KeyItems[dbcbVidZanyat.ItemIndex]), StrToInt(dbcbVidNagruzki.KeyItems[dbcbVidNagruzki.ItemIndex]), StrToInt(dbcbCalcUnit.KeyItems[dbcbCalcUnit.ItemIndex]),
        dbcbPlanTeacherFIO.KeyItems, dbcbPlanTeacherFIO.Items, TNagruzkaController.Preparation.GetTabNFromTeacherIK(fEvent.PlanTeacherIK))
    else dbcbPlanTeacherFIO.ItemIndex:= TSheduleController.MainFunctions.GetTeacherListForAddEventFromPrefetch(StrToInt(dbcbKafedra.KeyItems[dbcbKafedra.ItemIndex]), StrToInt(dbcbFormEd.KeyItems[dbcbFormEd.ItemIndex]),
        StrToInt(dbcbDisc.KeyItems[dbcbDisc.ItemIndex]), StrToInt(dbcbVidZanyat.KeyItems[dbcbVidZanyat.ItemIndex]), StrToInt(dbcbVidNagruzki.KeyItems[dbcbVidNagruzki.ItemIndex]), StrToInt(dbcbCalcUnit.KeyItems[dbcbCalcUnit.ItemIndex]),
        dbcbPlanTeacherFIO.KeyItems, dbcbPlanTeacherFIO.Items, -1);
    if (fIsDepProcess) and (fCaptionType = ctAddEvent) and  (dbcbPlanTeacherFIO.ItemIndex < 0) then
      dbcbPlanTeacherFIO.ItemIndex:= dbcbPlanTeacherFIO.KeyItems.IndexOf(IntToStr(IK));
  end;
  dbcbPlanTeacherFIO.Enabled:= dbcbCalcUnit.ItemIndex >= 0;
  dbcbRoomKeyValueChanged(dbcbRoom);

  actRefreshHoursUpdate(self);
end;

procedure TfrmSheduleAddAudEventWithPrefetch.dbcbCampusKeyValueChanged(
  Sender: TObject);
var
  lastValue: Variant;
begin
  if fFormStartClosing then exit;
  lastValue:= TGeneralController.Instance.CloseLockupCB(@dbcbRoom);
  if (dbcbCampus.KeyValue <> NULL) then
  begin
    if fEvent <> nil then
      dbcbRoom.KeyValue:= TSheduleController.MainFunctions.GetRoomsForPrepodPlanIK(@dbcbRoom.ListSource.DataSet, dbcbCampus.KeyValue, ShedulerGrid.SheduleIK, fPrepodPlanIKList, '', fEvent.RoomIK)
    else dbcbRoom.KeyValue:= TSheduleController.MainFunctions.GetRoomsForPrepodPlanIK(@dbcbRoom.ListSource.DataSet, dbcbCampus.KeyValue, ShedulerGrid.SheduleIK, fPrepodPlanIKList, '', lastValue);
  end;
  dbcbRoom.Enabled:= dbcbCampus.KeyValue <> NULL;
  dbcbRoomKeyValueChanged(dbcbRoom);
end;

procedure TfrmSheduleAddAudEventWithPrefetch.dbeRepeatCountChange(Sender: TObject);
begin
  rbRLTS.Checked:= true;
  fIsShadowModified:= true;
end;

procedure TfrmSheduleAddAudEventWithPrefetch.dbdtFinalDateChange(Sender: TObject);
begin
  rbRLTT.Checked:= true;
  dbdtBeginDateChange(dbdtBeginDate);
  fIsShadowModified:= true;
end;

procedure TfrmSheduleAddAudEventWithPrefetch.dbcbMSNumChange(Sender: TObject);
begin
  rbMS.Checked:= true;
end;

procedure TfrmSheduleAddAudEventWithPrefetch.dbcbNumeratorTypeChange(Sender: TObject);
var
  semLengthInfo: TSemLengthInfo;
begin
  fIsShadowModified:= true;
  case dbcbNumeratorType.ItemIndex of
  0:
    begin
      dbeWWeek.Text:= '1';
      if fCaptionType = ctAddEvent then
        dbdtBeginDate.Value:= fShedulerGrid.PeriodStart + fShedulerGrid.DayIndex;
    end;
  1:
    begin
      dbeWWeek.Text:= '2';
      if fCaptionType = ctAddEvent then
      begin
        if fIsDepProcess then
          semLengthInfo:= ShedulerGrid.DefaultSemLengthInfo
        else semLengthInfo:= ShedulerGrid.DefaultSemLengthInfo.GetSemesterLengthForGrup(IK);
        if (WeeksBetween(semLengthInfo.SemStart - DayOfWeek(semLengthInfo.SemStart) + 2, ShedulerGrid.PeriodStart) mod 2 = 0) then
          dbdtBeginDate.Value:= fShedulerGrid.PeriodStart + fShedulerGrid.DayIndex
        else dbdtBeginDate.Value:= fShedulerGrid.PeriodStart + fShedulerGrid.DayIndex + 7;
      end;
    end;
  2:
    begin
      dbeWWeek.Text:= '2';
      if fCaptionType = ctAddEvent then
      begin
        if fIsDepProcess then
          semLengthInfo:= ShedulerGrid.DefaultSemLengthInfo
        else semLengthInfo:= ShedulerGrid.DefaultSemLengthInfo.GetSemesterLengthForGrup(IK);
        if (WeeksBetween(semLengthInfo.SemStart - DayOfWeek(semLengthInfo.SemStart) + 2, ShedulerGrid.PeriodStart) mod 2 = 0) then
          dbdtBeginDate.Value:= fShedulerGrid.PeriodStart + fShedulerGrid.DayIndex + 7
        else dbdtBeginDate.Value:= fShedulerGrid.PeriodStart + fShedulerGrid.DayIndex;
      end;
    end;
  end;
end;

procedure TfrmSheduleAddAudEventWithPrefetch.dbcbNumeratorTypeKeyPress(
  Sender: TObject; var Key: Char);
var
  i,n: integer;
  tempStr: string;
begin
  if Key in [#8, #46, #37, #39, #9] then exit;
  tempStr:= Copy((Sender as TDBComboBoxEh).Text, 1, (Sender as TDBComboBoxEh).SelStart);
  for I := 0 to (Sender as TDBComboBoxEh).Items.Count - 1 do
    if Pos(tempStr + Key, Copy((Sender as TDBComboBoxEh).Items[i], 1, (Sender as TDBComboBoxEh).SelStart + 1)) <> 0 then
    begin
      n:= (Sender as TDBComboBoxEh).SelStart;
      if (Sender as TDBComboBoxEh).ItemIndex <> i then (Sender as TDBComboBoxEh).ItemIndex:= i;
      (Sender as TDBComboBoxEh).SelStart:= n + 1;
      Key:= #0;
      exit;
    end;
  Key:= #0;
end;

procedure TfrmSheduleAddAudEventWithPrefetch.dbeMFDayChange(Sender: TObject);
begin
  rbMF.Checked:= true;
end;

procedure TfrmSheduleAddAudEventWithPrefetch.dbcbStartChange(Sender: TObject);
begin
  dbcbPart.ItemIndex:= dbcbStart.ItemIndex;
  if (dbcbStart.ItemIndex >= 0) then
  begin
    dbeStop.Text:= FormatDateTime('h:nn', ShedulerGrid.Parts[dbcbStart.ItemIndex].StopTime);
    self.Tag:= dbcbStart.ItemIndex;
  end;
  fIsShadowModified:= true;
end;

procedure TfrmSheduleAddAudEventWithPrefetch.dbcbVidZanyatChange(
  Sender: TObject);
begin
  if fFormStartClosing then exit;
  CloseComboBox(dbcbVidNagruzki);
  if dbcbVidZanyat.ItemIndex >= 0 then
  begin
    if fEvent <> nil then
      dbcbVidNagruzki.ItemIndex:= TSheduleController.MainFunctions.GetVidNagruzkiListForAddEventFromPrefetch(StrToInt(dbcbKafedra.KeyItems[dbcbKafedra.ItemIndex]), StrToInt(dbcbFormEd.KeyItems[dbcbFormEd.ItemIndex]),
        StrToInt(dbcbDisc.KeyItems[dbcbDisc.ItemIndex]), StrToInt(dbcbVidZanyat.KeyItems[dbcbVidZanyat.ItemIndex]), dbcbVidNagruzki.KeyItems, dbcbVidNagruzki.Items, fEvent.VidNagruzkiIK)
    else dbcbVidNagruzki.ItemIndex:= TSheduleController.MainFunctions.GetVidNagruzkiListForAddEventFromPrefetch(StrToInt(dbcbKafedra.KeyItems[dbcbKafedra.ItemIndex]), StrToInt(dbcbFormEd.KeyItems[dbcbFormEd.ItemIndex]),
        StrToInt(dbcbDisc.KeyItems[dbcbDisc.ItemIndex]), StrToInt(dbcbVidZanyat.KeyItems[dbcbVidZanyat.ItemIndex]), dbcbVidNagruzki.KeyItems, dbcbVidNagruzki.Items, -1);
  end;
  dbcbVidNagruzki.Enabled:= dbcbVidZanyat.ItemIndex >= 0;
  dbcbRoomKeyValueChanged(dbcbRoom);

    actRefreshHoursUpdate(self);
end;

procedure TfrmSheduleAddAudEventWithPrefetch.dbcbPartChange(Sender: TObject);
begin
  dbcbStart.ItemIndex:= dbcbPart.ItemIndex;
  fIsShadowModified:= true;
end;

procedure TfrmSheduleAddAudEventWithPrefetch.dbcbPlanTeacherFIOChange(
  Sender: TObject);
begin
  if fFormStartClosing then exit;
  CloseComboBox(dbcbPlanTeacherWorkType);
  if dbcbPlanTeacherFIO.ItemIndex >= 0 then
  begin
    
    if (not fIsDepProcess) and (fCaptionType = ctAddEvent) and (dbcbExecPrep.KeyValue = NULL) then
      dbcbExecPrep.KeyValue:= StrToInt(dbcbPlanTeacherFIO.KeyItems[dbcbPlanTeacherFIO.ItemIndex]);
    if fEvent <> nil then
      dbcbPlanTeacherWorkType.ItemIndex:= TSheduleController.MainFunctions.GetTeacherWorkTypeListForAddEventFromPrefetch(StrToInt(dbcbKafedra.KeyItems[dbcbKafedra.ItemIndex]), StrToInt(dbcbFormEd.KeyItems[dbcbFormEd.ItemIndex]),
        StrToInt(dbcbDisc.KeyItems[dbcbDisc.ItemIndex]), StrToInt(dbcbVidZanyat.KeyItems[dbcbVidZanyat.ItemIndex]), StrToInt(dbcbVidNagruzki.KeyItems[dbcbVidNagruzki.ItemIndex]), StrToInt(dbcbCalcUnit.KeyItems[dbcbCalcUnit.ItemIndex]),
        StrToInt(dbcbPlanTeacherFIO.KeyItems[dbcbPlanTeacherFIO.ItemIndex]), dbcbPlanTeacherWorkType.KeyItems, dbcbPlanTeacherWorkType.Items, fEvent.PlanTeacherIK)
    else dbcbPlanTeacherWorkType.ItemIndex:= TSheduleController.MainFunctions.GetTeacherWorkTypeListForAddEventFromPrefetch(StrToInt(dbcbKafedra.KeyItems[dbcbKafedra.ItemIndex]), StrToInt(dbcbFormEd.KeyItems[dbcbFormEd.ItemIndex]),
        StrToInt(dbcbDisc.KeyItems[dbcbDisc.ItemIndex]), StrToInt(dbcbVidZanyat.KeyItems[dbcbVidZanyat.ItemIndex]), StrToInt(dbcbVidNagruzki.KeyItems[dbcbVidNagruzki.ItemIndex]), StrToInt(dbcbCalcUnit.KeyItems[dbcbCalcUnit.ItemIndex]),
        StrToInt(dbcbPlanTeacherFIO.KeyItems[dbcbPlanTeacherFIO.ItemIndex]), dbcbPlanTeacherWorkType.KeyItems, dbcbPlanTeacherWorkType.Items, -1);

  end;
  dbcbPlanTeacherWorkType.Enabled:= dbcbPlanTeacherFIO.ItemIndex >= 0;
  dbcbRoomKeyValueChanged(dbcbRoom);
end;

procedure TfrmSheduleAddAudEventWithPrefetch.dbcbPlanTeacherWorkTypeChange(
  Sender: TObject);
var
  lastValue: Variant;
begin
  if fFormStartClosing then exit;
  lastValue:= TGeneralController.Instance.CloseLockupCB(@dbcbCampus);
  if dbcbPlanTeacherWorkType.ItemIndex >= 0 then
  begin
    if fEvent <> nil then
      dbcbCampus.KeyValue:= TSheduleController.MainFunctions.GetCampusForPrepodPlanIKFromPrefetch(@dbcbCampus.ListSource.DataSet, ShedulerGrid.SheduleIK, StrToInt(dbcbKafedra.KeyItems[dbcbKafedra.ItemIndex]), StrToInt(dbcbFormEd.KeyItems[dbcbFormEd.ItemIndex]),
        StrToInt(dbcbDisc.KeyItems[dbcbDisc.ItemIndex]), StrToInt(dbcbVidZanyat.KeyItems[dbcbVidZanyat.ItemIndex]), StrToInt(dbcbVidNagruzki.KeyItems[dbcbVidNagruzki.ItemIndex]), StrToInt(dbcbCalcUnit.KeyItems[dbcbCalcUnit.ItemIndex]),
        StrToInt(dbcbPlanTeacherWorkType.KeyItems[dbcbPlanTeacherWorkType.ItemIndex]), fPrepodPlanIKList, TSheduleController.MainFunctions.GetCampusFromRoom(fEvent.RoomIK))
    else dbcbCampus.KeyValue:= TSheduleController.MainFunctions.GetCampusForPrepodPlanIKFromPrefetch(@dbcbCampus.ListSource.DataSet, ShedulerGrid.SheduleIK, StrToInt(dbcbKafedra.KeyItems[dbcbKafedra.ItemIndex]), StrToInt(dbcbFormEd.KeyItems[dbcbFormEd.ItemIndex]),
        StrToInt(dbcbDisc.KeyItems[dbcbDisc.ItemIndex]), StrToInt(dbcbVidZanyat.KeyItems[dbcbVidZanyat.ItemIndex]), StrToInt(dbcbVidNagruzki.KeyItems[dbcbVidNagruzki.ItemIndex]), StrToInt(dbcbCalcUnit.KeyItems[dbcbCalcUnit.ItemIndex]),
        StrToInt(dbcbPlanTeacherWorkType.KeyItems[dbcbPlanTeacherWorkType.ItemIndex]), fPrepodPlanIKList, lastValue);

    if (fCaptionType = ctAddEvent) and (dbcbExecWorkType.KeyValue = NULL) and (StrToInt(dbcbPlanTeacherFIO.KeyItems[dbcbPlanTeacherFIO.ItemIndex]) = dbcbExecPrep.KeyValue) then
      dbcbExecWorkType.KeyValue:= StrToInt(dbcbPlanTeacherWorkType.KeyItems[dbcbPlanTeacherWorkType.ItemIndex]);
  end;
  dbcbCampus.Enabled:= dbcbPlanTeacherWorkType.ItemIndex >= 0;
  dbcbRoomKeyValueChanged(dbcbRoom);
end;

procedure TfrmSheduleAddAudEventWithPrefetch.dbcbVidNagruzkiChange(
  Sender: TObject);
begin
  if fFormStartClosing then exit;
  CloseComboBox(dbcbCalcUnit);
  if dbcbVidNagruzki.ItemIndex >= 0 then
  begin
    if fEvent <> nil then
      dbcbCalcUnit.ItemIndex:= TSheduleController.MainFunctions.GetCalcUnitListForAddEventFromPrefetch(StrToInt(dbcbKafedra.KeyItems[dbcbKafedra.ItemIndex]), StrToInt(dbcbFormEd.KeyItems[dbcbFormEd.ItemIndex]),
        StrToInt(dbcbDisc.KeyItems[dbcbDisc.ItemIndex]), StrToInt(dbcbVidZanyat.KeyItems[dbcbVidZanyat.ItemIndex]), StrToInt(dbcbVidNagruzki.KeyItems[dbcbVidNagruzki.ItemIndex]), dbcbCalcUnit.KeyItems, dbcbCalcUnit.Items, fEvent.CalcUnitIK)
    else dbcbCalcUnit.ItemIndex:= TSheduleController.MainFunctions.GetCalcUnitListForAddEventFromPrefetch(StrToInt(dbcbKafedra.KeyItems[dbcbKafedra.ItemIndex]), StrToInt(dbcbFormEd.KeyItems[dbcbFormEd.ItemIndex]),
        StrToInt(dbcbDisc.KeyItems[dbcbDisc.ItemIndex]), StrToInt(dbcbVidZanyat.KeyItems[dbcbVidZanyat.ItemIndex]), StrToInt(dbcbVidNagruzki.KeyItems[dbcbVidNagruzki.ItemIndex]), dbcbCalcUnit.KeyItems, dbcbCalcUnit.Items, -1);
  end
  else
    BitBtn1.Enabled:=false;
  dbcbCalcUnit.Enabled:= dbcbVidNagruzki.ItemIndex >= 0;
  dbcbRoomKeyValueChanged(dbcbRoom);
end;

procedure TfrmSheduleAddAudEventWithPrefetch.dbdtBeginDateChange(Sender: TObject);
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
  fIsShadowModified:= true;
end;

procedure TfrmSheduleAddAudEventWithPrefetch.actRefreshConflictListExecute(
  Sender: TObject);
begin
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

      temp.SheduleIK:= ShedulerGrid.SheduleIK;
      temp.KafedraIK:= StrToInt(dbcbKafedra.KeyItems[dbcbKafedra.ItemIndex]);
      temp.FormEdIK:= StrToInt(dbcbFormEd.KeyItems[dbcbFormEd.ItemIndex]);
      temp.PlanTeacherIK:= StrToInt(dbcbPlanTeacherWorkType.KeyItems[dbcbPlanTeacherWorkType.ItemIndex]);
      temp.DiscIK:= StrToInt(dbcbDisc.KeyItems[dbcbDisc.ItemIndex]);
      temp.VidZanyatIK:= StrToInt(dbcbVidZanyat.KeyItems[dbcbVidZanyat.ItemIndex]);
      temp.VidNagruzkiIK:= StrToInt(dbcbVidNagruzki.KeyItems[dbcbVidNagruzki.ItemIndex]);
      temp.CalcUnitIK:= StrToInt(dbcbCalcUnit.KeyItems[dbcbCalcUnit.ItemIndex]);
      temp.RoomIK:= dbcbRoom.KeyValue;
      temp.TeacherIK:= dbcbExecWorkType.KeyValue;

  //времено отключим проверку конфликтов
      TSheduleController.MainFunctions.GetEventConflictList(fEvent, ShedulerGrid.SheduleIK, conflictList, dbcbExecWorkType.KeyValue, dbcbRoom.KeyValue, StrToInt(dbcbCalcUnit.KeyItems[dbcbCalcUnit.ItemIndex]));

      fConflictConditionsWereChanged:= false;
       // Application.MessageBox('Для заданных временных параметров события обнаружены конфликтные ситуации - некоторые позиции расписания, соответствующие данным параметрам, уже заняты.' + #10#13 +
       //   'По этой причине некоторые записи в списках "ФИО преподавателя", "Расчетная единица" и "Номер аудитории" могут отсутствовать...' + #10#13 +
       //   'Для просмотра событий, с которыми обнаружены конфликты, щелкните кнопку "Просмотреть список конфликтов".', PChar(Caption), MB_ICONWARNING);

   //   dbcbKafedraChange(dbcbKafedra);
  finally
    Panel2.Visible:= false;
  end;
end;

procedure TfrmSheduleAddAudEventWithPrefetch.actRefreshConflictListUpdate(Sender: TObject);
var
  tempBool: boolean;
begin
  (Sender as TAction).Enabled:= (dbcbPlanTeacherWorkType.ItemIndex >= 0) and (dbcbRoom.KeyValue <> NULL) and (dbcbExecWorkType.KeyValue <> NULL);

  if fIsShadowModified then
  begin
    if ((fCaptionType = ctAddEvent) or (fCaptionType = ctEditEvent)) then
    begin
      tempBool:= (dbdtBeginDate.Value <> NULL) and (dbcbStart.ItemIndex >= 0) and (dbcbRepeatType.KeyValue <> NULL) and (rbRLTF.Checked or rbRLTS.Checked or rbRLTT.Checked);
      if dbcbRepeatType.KeyValue <> NULL then
      begin
        case dbcbRepeatType.KeyValue of
        1: tempBool:= tempBool and (dbeDFDay.Text <> '');
        2: tempBool:= tempBool and (cbWMon.Checked or cbWTue.Checked or cbWWen.Checked or cbWThu.Checked or cbWFri.Checked or cbWSat.Checked);
        end;
      end
      else tempBool:= false;
    end
    else tempBool:= (dbdtBeginDate.Value <> NULL) and (dbcbStart.ItemIndex >= 0);

    IsModified:= tempBool and (Sender as TAction).Enabled;
  end
  else IsModified:= false;
end;

procedure TfrmSheduleAddAudEventWithPrefetch.actRefreshHoursUpdate(
  Sender: TObject);
begin
  if (dbcbDisc.Value<>Null)and(dbcbVidZanyat.Value<>Null)and(dbcbCalcUnit.Value<>Null)
  and (dbcbDisc.Value<>'')and(dbcbVidZanyat.Value<>'')and(dbcbCalcUnit.Value<>'')then
  begin
  with dmUchPlan.adsGetHours do
  begin
    Active :=false;
    CommandText := 'select * from dbo.GetHoursPFForDisc('+inttostr(dbcbDisc.Value)+','+inttostr(dbcbCalcUnit.Value)+','+inttostr(dbcbVidZanyat.Value)+','+inttostr(ikyear)+','+inttostr(iksemtype)+')';
    Active:=true;
    First;
    if Fields[0].Value<>null then
    lHours.Caption := 'Часов по плану: ' + inttostr(Fields[0].Value)
        + '; в расписании: ' + inttostr(Fields[1].Value);
  end;
  end
  else lHours.Caption := 'Часы не определены';

end;

procedure TfrmSheduleAddAudEventWithPrefetch.actShowConflictListExecute(Sender: TObject);
var
  tempForm: TfrmConflictEventLog;
begin
  tempForm:= TfrmConflictEventLog.CreateDialog(self, Connection, nil);
  tempForm.DrawConflictList:= conflictList;
  tempForm.ShowModal;
  tempForm.Free;
end;

procedure TfrmSheduleAddAudEventWithPrefetch.actShowConflictListUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= (not fConflictConditionsWereChanged) and actRefreshConflictList.Enabled and (conflictList.Count > 0);
end;

procedure TfrmSheduleAddAudEventWithPrefetch.BitBtn1MouseEnter(Sender: TObject);
begin
  panel7.Visible:=true;
end;

procedure TfrmSheduleAddAudEventWithPrefetch.BitBtn1MouseLeave(Sender: TObject);
begin
  panel7.Visible:=false;
end;

procedure TfrmSheduleAddAudEventWithPrefetch.cbCWMonClick(Sender: TObject);
begin
  fIsShadowModified:= true;
  (self.FindComponent('cb' + Copy((Sender as TCheckBox).Name, 4, Length((Sender as TCheckBox).Name)-3)) as TCheckBox).Checked:= (Sender as TCheckBox).Checked; 
end;

procedure TfrmSheduleAddAudEventWithPrefetch.cbWMonClick(Sender: TObject);
begin
  fIsShadowModified:= true;
  (self.FindComponent('cbC' + Copy((Sender as TCheckBox).Name, 3, Length((Sender as TCheckBox).Name)-2)) as TCheckBox).Checked:= (Sender as TCheckBox).Checked;
end;

procedure TfrmSheduleAddAudEventWithPrefetch.dbeDFDayChange(Sender: TObject);
begin
  fIsShadowModified:= true;
end;

procedure TfrmSheduleAddAudEventWithPrefetch.dbeWWeekChange(Sender: TObject);
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

procedure TfrmSheduleAddAudEventWithPrefetch.dbeWWeekKeyPress(Sender: TObject;
  var Key: Char);
const
  allow: set of char = ['1','2','3','4','5','6','7','8','9','0', #8];
begin
  if not (Key in allow) then Key:= #0;
  fIsShadowModified:= true;
end;

procedure TfrmSheduleAddAudEventWithPrefetch.SetCaptions(capType: TCapType; isExtendedMode: boolean);
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
      Panel3.Height:= 197;
      if isExtendedMode then ClientHeight:= 558
      else ClientHeight:= 450;
   {   if Self.Showing then
      begin
        if isExtendedMode then dbeWWeek.SetFocus
        else dbcbNumeratorType.SetFocus;
      end;        }
    end;
  ctEditEvent:
    begin
      Caption:= 'Изменение события';
      Panel3.Visible:= isExtendedMode;
      Panel6.Visible:= not isExtendedMode;
      Panel5.Visible:= true;
      Panel3.Height:= 197;
      if isExtendedMode then ClientHeight:= 558
      else ClientHeight:= 450;
    {  if Self.Showing then
      begin
        if isExtendedMode then dbeWWeek.SetFocus
        else dbcbNumeratorType.SetFocus;
      end;     }
    end;
  ctAddException:
    begin
      Caption:= 'Добавление исключения';
      Panel3.Visible:= true;
      ToolBar2.Visible:= false;
      Label36.Visible:= false;
      Panel6.Visible:= false;
      Panel5.Visible:= false;
      Panel3.Height:= 48;
      ClientHeight:= 410;
    end;
  ctEditException:
    begin
      Caption:= 'Изменение исключения';
      Panel3.Visible:= true;
      ToolBar2.Visible:= false;
      Label36.Visible:= false;
      Panel6.Visible:= false;
      Panel5.Visible:= false;
      Panel3.Height:= 48;
      ClientHeight:= 410;
    end;
  end;
//  Self.Left:= round((Screen.Width - Width)/2);
//  Self.Top:= round((Screen.Height - Height)/2);
end;

{
procedure TfrmSheduleAddAudEventWithPrefetch.SetIsConflictOptModified(const Value: boolean);
begin
  fIsConflictOptModified := Value;
  if not fIsDepProcess then
  begin
    dbcbKafedra.Enabled:= not fIsConflictOptModified;
    dbcbExecPrep.Enabled:= not fIsConflictOptModified;
    dbcbExecWorkType.Enabled:= dbcbExecPrep.Enabled and (dbcbExecPrep.KeyValue <> NULL);
    dbcbFormEd.Enabled:= dbcbKafedra.Enabled and (dbcbKafedra.ItemIndex >= 0);
  end
  else
  begin
    dbcbFormEd.Enabled:= not fIsConflictOptModified;
    dbcbExecWorkType.Enabled:= not fIsConflictOptModified;
  end;

  dbcbDisc.Enabled:= dbcbFormEd.Enabled and (dbcbFormEd.ItemIndex >= 0);
  dbcbVidZanyat.Enabled:= dbcbDisc.Enabled and (dbcbDisc.ItemIndex >= 0);
  dbcbVidNagruzki.Enabled:= dbcbVidZanyat.Enabled and (dbcbVidZanyat.ItemIndex >= 0);
  dbcbCalcUnit.Enabled:= dbcbVidNagruzki.Enabled and (dbcbVidNagruzki.ItemIndex >= 0);
  dbcbPlanTeacherFIO.Enabled:= dbcbCalcUnit.Enabled and (dbcbCalcUnit.ItemIndex >= 0);
  dbcbPlanTeacherWorkType.Enabled:= dbcbPlanTeacherFIO.Enabled and (dbcbPlanTeacherFIO.ItemIndex >= 0);
  dbcbCampus.Enabled:= dbcbPlanTeacherWorkType.Enabled and (dbcbPlanTeacherWorkType.ItemIndex >= 0);
  dbcbRoom.Enabled:= dbcbCampus.Enabled and (dbcbCampus.KeyValue <> NULL);
end;    }

procedure TfrmSheduleAddAudEventWithPrefetch.UpDown1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  dbeWWeekChange(dbeWWeek);
  fIsShadowModified:= true;
end;

end.
