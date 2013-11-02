unit uLessonShedule;
   {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ActnList, ImgList, ComCtrls, ToolWin, Buttons, ExtCtrls, SheduleController,
  Menus, ADODB, StdCtrls, SheduleClasses, SheduleGrids, Mask, DBCtrlsEh;

type
  TLessonSheduleState = (ssDay, ssWeek, ssMonth);

  TfmLessonShedule = class(TFrame)
    Panel4: TPanel;
    Panel15: TPanel;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    ToolBar1: TToolBar;
    tbDayShedule: TToolButton;
    tbWeekShedule: TToolButton;
    tbMonthShedule: TToolButton;
    Panel5: TPanel;
    Panel14: TPanel;
    ToolBar2: TToolBar;
    tbOpenShedule: TToolButton;
    tbOpenInNewWindow: TToolButton;
    ToolButton12: TToolButton;
    ToolButton3: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    Panel6: TPanel;
    btnCloseCalendar: TSpeedButton;
    btnDownCalendar: TSpeedButton;
    btnUpCalendar: TSpeedButton;
    Panel9: TPanel;
    MonthCalendar1: TMonthCalendar;
    MonthCalendar2: TMonthCalendar;
    MonthCalendar3: TMonthCalendar;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actDelShedule: TAction;
    actFullScreen: TAction;
    actMakeBookmark: TAction;
    actNextPeriod: TAction;
    actPrevPeriod: TAction;
    actAddEvent: TAction;
    actEditEvent: TAction;
    actDelEvent: TAction;
    actAddException: TAction;
    actEditException: TAction;
    actDelException: TAction;
    actAdd: TAction;
    actEdit: TAction;
    actDel: TAction;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    PopupMenu3: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    Panel2: TPanel;
    Image1: TImage;
    Label7: TLabel;
    Label12: TLabel;
    ToolButton4: TToolButton;
    ToolButton7: TToolButton;
    actLoadSheduleAvto: TAction;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    actExport: TAction;
    actExportTeachersShedule: TAction;
    actExportGroupsShedule: TAction;
    PopupMenu4: TPopupMenu;
    ToolButton10: TToolButton;
    MSExcel1: TMenuItem;
    MSExcel2: TMenuItem;
    Panel1: TPanel;
    Label2: TLabel;
    ProgressBar1: TProgressBar;
    Panel3: TPanel;
    StaticText1: TStaticText;
    dbdtDenumberatorStart: TDBDateTimeEditEh;
    SpeedButton1: TSpeedButton;
    Bevel1: TBevel;
    SpeedButton2: TSpeedButton;
    actStartExport: TAction;
    PopupMenu5: TPopupMenu;
    actAdd1: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    Label1: TLabel;
    Label3: TLabel;
    procedure tbOpenSheduleClick(Sender: TObject);
    procedure btnCloseCalendarClick(Sender: TObject);
    procedure Panel15Click(Sender: TObject);
    procedure actNextPeriodExecute(Sender: TObject);
    procedure actPrevPeriodExecute(Sender: TObject);
    procedure tbDaySheduleClick(Sender: TObject);
    procedure actFullScreenExecute(Sender: TObject);
    procedure actAddEventExecute(Sender: TObject);
    procedure actEditEventExecute(Sender: TObject);
    procedure actDelEventExecute(Sender: TObject);
    procedure actDelExceptionExecute(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure MonthCalendar3Click(Sender: TObject);
    procedure btnUpCalendarClick(Sender: TObject);
    procedure btnDownCalendarClick(Sender: TObject);
    procedure actAddEventUpdate(Sender: TObject);
    procedure actEditEventUpdate(Sender: TObject);
    procedure actEditExceptionUpdate(Sender: TObject);
    procedure actAddUpdate(Sender: TObject);
    procedure actEditUpdate(Sender: TObject);
    procedure actDelUpdate(Sender: TObject);
    procedure actDelSheduleExecute(Sender: TObject);
    procedure actDelSheduleUpdate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure actStartExportExecute(Sender: TObject);
    procedure actExportTeachersSheduleExecute(Sender: TObject);
    procedure actStartExportUpdate(Sender: TObject);
    procedure tbOpenInNewWindowClick(Sender: TObject);
    procedure actMakeBookmarkExecute(Sender: TObject);
    procedure PopupMenu5Popup(Sender: TObject);
    procedure actExportExecute(Sender: TObject);
  private
    fIK: integer;
    fSheduleIK: integer;
    fIsFrameLoad: boolean;
    fIsLoadInWindow: boolean;
    fIsDepartmentShedule: boolean;
    fCurrentState: TLessonSheduleState;
    fIsFullScreen: boolean;

    fDayDepShedule: TDayDepLessonSheduleGrid;
    fWeekDepShedule: TWeekDepLessonSheduleGrid;
  //  fMonthDepShedule: TMonthDepLessonSheduleGrid;

    fDayFacShedule: TDayFacLessonSheduleGrid;
    fWeekFacShedule: TWeekFacLessonSheduleGrid;
  //  fMonthFacShedule: TMonthFacLessonSheduleGrid;

    procedure OnWeekDayNameClick(Sender: TObject);
//    procedure OnMonthDayNameClick(Sender: TObject);
    procedure SheduleGridDblClick(Sender: TObject);
    procedure SheduleGridClick(Sender: TObject);
    function GetCurrentSheduleGrid: TCustomLessonSheduleGrid;
    procedure SetIsFullScreen(const Value: boolean);
    procedure UpdateCurrentWeekTypeName;
  public
    ikyear, iksemtype:integer;

    destructor Destroy; override;
    procedure Read(AIsDepartmentShedule: boolean; AIK, ASheduleIK: integer);
    property IsFullScreen:boolean read fIsFullScreen write SetIsFullScreen;
    property IsFrameLoad:boolean read fIsFrameLoad default false;
    property IsLoadInWindow:boolean read fIsLoadInWindow write fIsLoadInWindow default false;
    property IsDepartmentShedule:boolean read fIsDepartmentShedule write fIsDepartmentShedule;
    property CurrentSheduleGrid: TCustomLessonSheduleGrid read GetCurrentSheduleGrid;
  end;

implementation

{$R *.dfm}

uses GeneralController, NagruzkaController, uMain, 
  uLessonSheduleOnForm, ActnMan, uSheduleAddAudEventWithPrefetch;

var
  nextPeriodName, prevPeriodName: string;

procedure TfmLessonShedule.actAddEventExecute(Sender: TObject);
var
  temp: TfrmSheduleAddAudEventWithPrefetch;
begin
  if not Assigned(CurrentSheduleGrid) then exit;
try
  Panel2.Left:= round(Width/2 - Panel2.Width/2);
  Panel2.Top:= round(Height/2 - Panel2.Height/2);
  Panel2.Visible:= true;
  Refresh;
  temp:= TfrmSheduleAddAudEventWithPrefetch.CreateDialog(nil, TGeneralController.Instance.GetMainConnection, nil);
  try
    if fIsDepartmentShedule then
      temp.IK:= (CurrentSheduleGrid as TDepLessonSheduleGrid).Teachers[CurrentSheduleGrid.ElementIndex].TabN
    else
      temp.IK:= (CurrentSheduleGrid as TFacLessonSheduleGrid).Groups[CurrentSheduleGrid.ElementIndex].GroupIK;
    temp.Tag:= CurrentSheduleGrid.PartIndex;

    temp.ikyear:=ikyear;
    temp.iksemtype:=iksemtype;

    temp.Event:= nil;
    temp.ShedulerGrid:= CurrentSheduleGrid;
    temp.SetCaptions(ctAddEvent, false);
    temp.Read(fIsDepartmentShedule);
    Panel2.Visible:= false;
    if (temp.ShowModal() = mrOk) or (temp.bbApply.Tag = 1) then
    begin
      CurrentSheduleGrid.GoToDate(CurrentSheduleGrid.PeriodStart + CurrentSheduleGrid.DayIndex);
      CurrentSheduleGrid.Invalidate;
    end;
  finally
    temp.Free;
    Panel2.Visible:= false;
  end;
except
  raise;
end;
end;

procedure TfmLessonShedule.actAddEventUpdate(Sender: TObject);
begin
  if Assigned(CurrentSheduleGrid) then
  begin
      if CurrentSheduleGrid.IsLoad and (CurrentSheduleGrid.ElementIndex >= 0) then
      begin
        if fIsDepartmentShedule then
          (Sender as TAction).Enabled:= (CurrentSheduleGrid.SelectedEvent = nil) and (CurrentSheduleGrid.IsCurrentDayAllow)
        else (Sender as TAction).Enabled:= (CurrentSheduleGrid.IsCurrentDayAllow);
      end
      else (Sender as TAction).Enabled:= false;
  end
  else (Sender as TAction).Enabled:= false;
end;

procedure TfmLessonShedule.actAddExecute(Sender: TObject);
begin
  if actAddEvent.Enabled then actAddEventExecute(actAddEvent)
  else
    if actAddException.Enabled then actEditEventExecute(actAddException);
end;

procedure TfmLessonShedule.actAddUpdate(Sender: TObject);
begin
  actAddEventUpdate(actAddEvent);
  actEditEventUpdate(actAddException);
  actAdd.Enabled:= actAddEvent.Enabled or actAddException.Enabled;
  if actAddEvent.Enabled then
    actAdd.Hint:= actAddEvent.Hint
  else
    actAdd.Hint:= actAddException.Hint;
end;

procedure TfmLessonShedule.actDelEventExecute(Sender: TObject);
begin
  if not TSheduleController.MainFunctions.CheckEventVersion(CurrentSheduleGrid.SelectedEvent) then
  begin
    CurrentSheduleGrid.GoToDate(CurrentSheduleGrid.PeriodStart + CurrentSheduleGrid.DayIndex);
    CurrentSheduleGrid.Invalidate;
    Application.MessageBox('Параметры данного события были изменены другим пользователем. Информация о событии обновлена. Текущая операция удаления отменяется.', 'Подсистема "Расписание"', MB_ICONWARNING);
    exit;
  end;

  if (Application.MessageBox('Вы уверены, что хотите удалить выбранное событие?','Удаление события', mb_YesNo) = mrYes) and Assigned(CurrentSheduleGrid) then
    if CurrentSheduleGrid.DeleteEvent(CurrentSheduleGrid.SelectedEvent.EventIK) then
    begin
   // TSheduleController.Instance.DeleteEvent(CurrentSheduleGrid.SelectedEvent.EventIK);
 //     CurrentSheduleGrid.GoToDate(CurrentSheduleGrid.PeriodStart + CurrentSheduleGrid.DayIndex);
      CurrentSheduleGrid.Invalidate;
    end;
end;

procedure TfmLessonShedule.actDelExceptionExecute(Sender: TObject);
begin
  if not TSheduleController.MainFunctions.CheckEventVersion(CurrentSheduleGrid.SelectedEvent) then
  begin
    CurrentSheduleGrid.GoToDate(CurrentSheduleGrid.PeriodStart + CurrentSheduleGrid.DayIndex);
    CurrentSheduleGrid.Invalidate;
    Application.MessageBox('Параметры данного исключения были изменены другим пользователем. Информация об исключении обновлена. Текущая операция удаления отменяется.', 'Подсистема "Расписание"', MB_ICONWARNING);
    exit;
  end;

  if (Application.MessageBox('Вы уверены, что хотите удалить выбранное исключение?','Удаление исключения', mb_YesNo) = mrYes) and Assigned(CurrentSheduleGrid) then
    if CurrentSheduleGrid.DeleteException(CurrentSheduleGrid.SelectedEvent.EventIK) then
    begin
      CurrentSheduleGrid.GoToDate(CurrentSheduleGrid.PeriodStart + CurrentSheduleGrid.DayIndex);
      CurrentSheduleGrid.Invalidate;
    end;
end;

procedure TfmLessonShedule.actDelExecute(Sender: TObject);
begin
  if actDelEvent.Enabled then actDelEventExecute(actDelEvent)
  else
    if actDelException.Enabled then actDelExceptionExecute(actDelException);
end;

procedure TfmLessonShedule.actDelSheduleExecute(Sender: TObject);
begin
  if (Application.MessageBox('Вы уверены, что хотите удалить все события из данного расписания?','Отчистка расписания', mb_YesNo) = mrYes) and Assigned(CurrentSheduleGrid) then
    if CurrentSheduleGrid.DeleteAllItems then
      CurrentSheduleGrid.GoToDate(CurrentSheduleGrid.PeriodStart);
end;

procedure TfmLessonShedule.actDelSheduleUpdate(Sender: TObject);
begin
  if Assigned(CurrentSheduleGrid) then
    (Sender as TAction).Enabled:= CurrentSheduleGrid.IsLoad
  else (Sender as TAction).Enabled:= false;
end;

procedure TfmLessonShedule.actDelUpdate(Sender: TObject);
begin
  actEditEventUpdate(actDelEvent);
  actEditExceptionUpdate(actDelException);
  actDel.Enabled:= actDelEvent.Enabled or actDelException.Enabled;
  if actDelEvent.Enabled then
    actDel.Hint:= actDelEvent.Hint
  else
    actDel.Hint:= actDelException.Hint;
end;

procedure TfmLessonShedule.actEditEventExecute(Sender: TObject);
var
  temp: TfrmSheduleAddAudEventWithPrefetch;
begin
  if not Assigned(CurrentSheduleGrid) then exit;
try
  if TSheduleController.MainFunctions.CheckEventForDelete(CurrentSheduleGrid.SelectedEvent.EventIK) then
  begin
    CurrentSheduleGrid.DeleteEvent(CurrentSheduleGrid.SelectedEvent.EventIK);
    CurrentSheduleGrid.GoToDate(CurrentSheduleGrid.PeriodStart + CurrentSheduleGrid.DayIndex);
    CurrentSheduleGrid.Invalidate;
    Application.MessageBox('Данное событие уже удалено другим пользователем. Выполнение запрошенной операции невозможно!', 'Подсистема "Расписание"', MB_ICONWARNING);
    exit;
  end;

  if (Sender as TAction).Tag <> 2 then
  begin
    if not TSheduleController.MainFunctions.CheckEventVersion(CurrentSheduleGrid.SelectedEvent) then
    begin
      CurrentSheduleGrid.GoToDate(CurrentSheduleGrid.PeriodStart + CurrentSheduleGrid.DayIndex);
      CurrentSheduleGrid.Invalidate;
      Application.MessageBox('Параметры данного события были изменены другим пользователем. Информация о событии обновлена. Текущая операция редактирования отменяется.', 'Подсистема "Расписание"', MB_ICONWARNING);
      exit;
    end;
  end;

  temp:= TfrmSheduleAddAudEventWithPrefetch.CreateDialog(nil, TGeneralController.Instance.GetMainConnection, nil);
  if fIsDepartmentShedule then
    temp.IK:= (CurrentSheduleGrid as TDepLessonSheduleGrid).Teachers[CurrentSheduleGrid.ElementIndex].TabN
  else
    temp.IK:= (CurrentSheduleGrid as TFacLessonSheduleGrid).Groups[CurrentSheduleGrid.ElementIndex].GroupIK;
  temp.Tag:= CurrentSheduleGrid.PartIndex;
  temp.ShedulerGrid:= CurrentSheduleGrid;
  temp.Event:= CurrentSheduleGrid.SelectedEvent;
  case (Sender as TAction).Tag of
  1: temp.SetCaptions(ctEditEvent, false);
  2: temp.SetCaptions(ctAddException, true);
  3: temp.SetCaptions(ctEditException, true);
  end;
  temp.Read(fIsDepartmentShedule);
  Panel2.Visible:= false;
  if (temp.ShowModal() = mrOk) or (temp.bbApply.Tag = 1) then
  begin
    CurrentSheduleGrid.GoToDate(CurrentSheduleGrid.PeriodStart + CurrentSheduleGrid.DayIndex);
    CurrentSheduleGrid.Invalidate;
  end;
finally
  if Assigned(temp) then temp.Free;
end;
end;

procedure TfmLessonShedule.actEditEventUpdate(Sender: TObject);
begin
  if not Assigned(CurrentSheduleGrid) then
  begin
    (Sender as TAction).Enabled:= false;
    exit;
  end;
  if CurrentSheduleGrid.IsLoad and (CurrentSheduleGrid.PartIndex >= 0) then
  begin
    if (CurrentSheduleGrid.SelectedEvent <> nil) then
      (Sender as TAction).Enabled:= not CurrentSheduleGrid.SelectedEvent.IsException
    else (Sender as TAction).Enabled:= false;
  end
  else (Sender as TAction).Enabled:= false;
end;

procedure TfmLessonShedule.actEditExceptionUpdate(Sender: TObject);
begin
  if not Assigned(CurrentSheduleGrid) then
  begin
    (Sender as TAction).Enabled:= false;
    exit;
  end;
  if CurrentSheduleGrid.IsLoad and (CurrentSheduleGrid.PartIndex >= 0) then
  begin
    if (CurrentSheduleGrid.SelectedEvent <> nil) then
      (Sender as TAction).Enabled:= CurrentSheduleGrid.SelectedEvent.IsException
    else (Sender as TAction).Enabled:= false;
  end
  else (Sender as TAction).Enabled:= false;
end;

procedure TfmLessonShedule.actEditExecute(Sender: TObject);
begin
  if actEditEvent.Enabled then actEditEventExecute(actEditEvent)
  else
    if actEditException.Enabled then actEditEventExecute(actEditException);
end;

procedure TfmLessonShedule.actEditUpdate(Sender: TObject);
begin
  actEditEventUpdate(actEditEvent);
  actEditExceptionUpdate(actEditException);
  actEdit.Enabled:= actEditEvent.Enabled or actEditException.Enabled;
  if actEditEvent.Enabled then
    actEdit.Hint:= actEditEvent.Hint
  else
    actEdit.Hint:= actEditException.Hint;
end;

procedure TfmLessonShedule.actExportExecute(Sender: TObject);
begin
  if actExportGroupsShedule.Enabled then
    actExportTeachersSheduleExecute(actExportGroupsShedule)
 else
 begin
   if actExportTeachersShedule.Enabled then
    actExportTeachersSheduleExecute(actExportTeachersShedule);
 end;
end;

procedure TfmLessonShedule.actExportTeachersSheduleExecute(Sender: TObject);
begin
  Panel3.Tag:= (Sender as TAction).Tag;
  Panel3.Visible:= true;
  Refresh;
  dbdtDenumberatorStart.Value:= CurrentSheduleGrid.DefaultSemLengthInfo.MinSemStart;
  dbdtDenumberatorStart.SetFocus;
end;

procedure TfmLessonShedule.actFullScreenExecute(Sender: TObject);
begin
  IsFullScreen:= not fIsFullScreen;
  if fIsFullScreen then
  begin
    if not fIsLoadInWindow then
    begin
      frmMain.WindowState:= wsNormal;
      frmMain.DBDekTreeView_TEST1.Visible:= false;
      frmMain.StatusBar1.Visible:= false;
      frmMain.ActionToolBar1.Visible:= false;
      frmMain.SetCurrentSearchPanel(sptNone);
      frmMain.MainMenuBar.EdgeBorders:= frmMain.MainMenuBar.EdgeBorders - [ebBottom];
      frmMain.Panel2.Visible:= false;
      frmMain.Splitter1.Visible:= false;
      frmMain.BorderStyle:= bsNone;
      frmMain.FormStyle:= fsStayOnTop;
      frmMain.Left:= 0;
      frmMain.Top:= 0;
      frmMain.Width:= Screen.Width;
      frmMain.Height:= Screen.Height;
    end
    else
    begin
      (Owner as TForm).WindowState:= wsNormal;
      (Owner as TForm).BorderStyle:= bsNone;
      (Owner as TForm).FormStyle:= fsStayOnTop;
      (Owner as TForm).Left:= 0;
      (Owner as TForm).Top:= 0;
      (Owner as TForm).Width:= Screen.Width;
      (Owner as TForm).Height:= Screen.Height;
    end;
  end
  else
  begin
    if not fIsLoadInWindow then
    begin
      frmMain.DBDekTreeView_TEST1.Visible:= true;
      frmMain.StatusBar1.Visible:= true;
      frmMain.ActionToolBar1.Visible:= true;
      frmMain.SetCurrentSearchPanel(sptPrepod);
      frmMain.MainMenuBar.EdgeBorders:= frmMain.MainMenuBar.EdgeBorders + [ebBottom];
      frmMain.Panel2.Visible:= true;
      frmMain.Splitter1.Visible:= true;
      frmMain.BorderStyle:= bsSizeable;
      frmMain.FormStyle:= fsNormal;
      frmMain.WindowState:= wsMaximized;
      frmMain.Splitter1.Left:= frmMain.DBDekTreeView_TEST1.Left + frmMain.DBDekTreeView_TEST1.Width + 5;
    end
    else
    begin
      (Owner as TForm).BorderStyle:= bsSizeable;
      (Owner as TForm).FormStyle:= fsNormal;
      (Owner as TForm).WindowState:= wsMaximized;
    end;
  end;
end;

procedure TfmLessonShedule.actMakeBookmarkExecute(Sender: TObject);
var
  makeResult: integer;
  newca: TActionClientItem;
begin
  if fIsDepartmentShedule then
    makeResult:= TSheduleController.MainFunctions.MakeScheduleBookmark(sbKafedraAud, fSheduleIK, fIK)
  else makeResult:= TSheduleController.MainFunctions.MakeScheduleBookmark(sbFacAud, fSheduleIK, fIK);
  if makeResult <> -1 then
  begin
    frmMain.ActionManager1.ActionBars[3].Items[0].Items[2].Visible:= true;
    newca:= frmMain.ActionManager1.ActionBars[3].Items[0].Items.add;
    newca.Action:= TAction.Create(frmMain.alMainActions);
    newca.Action.OnExecute:= frmMain.OnScheduleBookmarkExecute;
    newca.Action.OnUpdate:= frmMain.actFilleMenuUpdate;
    newca.Action.Tag:= makeResult;
    newca.Caption:= TSheduleController.MainFunctions.GetScheduleBookmarkName(makeResult);
  end;
end;

procedure TfmLessonShedule.actNextPeriodExecute(Sender: TObject);
var
  tempStr: string;
begin
  if not Assigned(CurrentSheduleGrid) then exit;
  tempStr:= CurrentSheduleGrid.GoToNextPeriod;
  if tempStr = '' then
    Application.MessageBox(PChar(nextPeriodName + ' выходит за рамки текущего учебного семестра!'),'Переход не возможен', MB_ICONWARNING)
  else
  begin
    Panel15.Caption:= tempStr;
    UpdateCurrentWeekTypeName;
    CurrentSheduleGrid.Invalidate;
  end;
end;

procedure TfmLessonShedule.actPrevPeriodExecute(Sender: TObject);
var
  tempStr: string;
begin
  if not Assigned(CurrentSheduleGrid) then exit;
  tempStr:= CurrentSheduleGrid.GoToPrevPeriod;
  if tempStr = '' then
    Application.MessageBox(PChar(prevPeriodName + ' выходит за рамки текущего учебного семестра!'),'Переход не возможен', MB_ICONWARNING)
  else
  begin
    Panel15.Caption:= tempStr;
    UpdateCurrentWeekTypeName;
    CurrentSheduleGrid.Invalidate;
  end;
end;

procedure TfmLessonShedule.actStartExportExecute(Sender: TObject);
begin
  Panel3.Visible:= false;
  Panel1.Left:= round(Width/2 - Panel2.Width/2);
  Panel1.Top:= round(Height/2 - Panel2.Height/2);
  Panel1.Visible:= true;
  Refresh;
  try
    case Panel3.Tag of
    1: TSheduleController.MainFunctions.ExportGroupLessonShedule(fSheduleIK, fIK, fIsDepartmentShedule, ProgressBar1, dbdtDenumberatorStart.Value);
    2: TSheduleController.MainFunctions.ExportTeacherLessonShedule(fSheduleIK, fIK, ProgressBar1, dbdtDenumberatorStart.Value);
    end;
  finally
    Panel1.Visible:= false;
    Refresh;
    CurrentSheduleGrid.Invalidate;
  end;
end;

procedure TfmLessonShedule.actStartExportUpdate(Sender: TObject);
begin
  actStartExport.Enabled:= dbdtDenumberatorStart.Value <> NULL;
end;

procedure TfmLessonShedule.btnCloseCalendarClick(Sender: TObject);
begin
  Panel6.Visible:= false;
end;

procedure TfmLessonShedule.btnDownCalendarClick(Sender: TObject);
var
  y,m,d: word;
begin
  DecodeDate(MonthCalendar2.Date, y, m, d);
  MonthCalendar1.Date:= MonthCalendar2.Date;
  MonthCalendar2.Date:= MonthCalendar3.Date;
  if m < 11 then
    MonthCalendar3.Date:= EncodeDate(y, m+2, d)
  else
  begin
    case m of
    11: MonthCalendar3.Date:= EncodeDate(y+1, 1, d);
    12: MonthCalendar3.Date:= EncodeDate(y+1, 2, d);
    end;                                       
  end;
end;

procedure TfmLessonShedule.btnUpCalendarClick(Sender: TObject);
var
  y,m,d: word;
begin
  DecodeDate(MonthCalendar2.Date, y, m, d);
  MonthCalendar3.Date:= MonthCalendar2.Date;
  MonthCalendar2.Date:= MonthCalendar1.Date;
  if m > 2 then
    MonthCalendar1.Date:= EncodeDate(y, m-2, d)
  else
  begin
    case m of
    1: MonthCalendar1.Date:= EncodeDate(y-1, 11, d);
    2: MonthCalendar1.Date:= EncodeDate(y-1, 12, d);
    end;
  end;
end;

destructor TfmLessonShedule.Destroy;
begin
  if fIsDepartmentShedule then
  begin
    FreeAndNil(fDayDepShedule);
    FreeAndNil(fWeekDepShedule);
//    FreeAndNil(fMonthDepShedule);
  end
  else
  begin
    FreeAndNil(fDayFacShedule);
    FreeAndNil(fWeekFacShedule);
  //  FreeAndNil(fMonthFacShedule);
  end;
  inherited;
end;

function TfmLessonShedule.GetCurrentSheduleGrid: TCustomLessonSheduleGrid;
begin
  Result:= nil;
  if fIsDepartmentShedule then
  begin
    case fCurrentState of
    ssDay: Result:= fDayDepShedule;
    ssWeek: Result:= fWeekDepShedule;
//    ssMonth: Result:= fMonthDepShedule;
    end;
  end
  else
  begin
    case fCurrentState of
    ssDay: Result:= fDayFacShedule;
    ssWeek: Result:= fWeekFacShedule;
  //  ssMonth: Result:= fMonthFacShedule;
    end;
  end;
//  if Result = nil then
//    raise Exception.Create('Ошибка при определении текущего представления расписания');
end;

procedure TfmLessonShedule.MonthCalendar3Click(Sender: TObject);
var
  tempStr: string;
begin
  if not Assigned(CurrentSheduleGrid) then exit;
  tempStr:= CurrentSheduleGrid.GoToDate((Sender as TMonthCalendar).Date);
  if tempStr = '' then
  begin
    Application.MessageBox('Выбранная дата выходит за рамки текущего учебного семестра!','Переход не возможен',MB_ICONWARNING);
    exit;
  end;
  Panel15.Caption:= tempStr;
  Panel6.Visible:= false;
  UpdateCurrentWeekTypeName;
  CurrentSheduleGrid.Invalidate;
end;

{
procedure TfmLessonShedule.OnMonthDayNameClick(Sender: TObject);
var
  fNeedDate: TDate;
  tempStr: string;
begin
  fNeedDate:= fMonthDepShedule.PeriodStart + fMonthDepShedule.CurrentHighlightDay;
  tempStr:= fDayDepShedule.GoToDate(fNeedDate);
  if tempStr = '' then
  begin
    Application.MessageBox('Выбранная дата выходит за рамки текущего учебного семестра!','Переход не возможен',MB_ICONWARNING);
    exit;
  end;
  Panel15.Caption:= tempStr;
  fCurrentState:= ssDay;
  tbDayShedule.Down:= true;
  tbWeekShedule.Down:= false;
  tbMonthShedule.Down:= false;
  fMonthDepShedule.SheduleVisible:= false;
  fDayDepShedule.SheduleVisible:= true;
  Panel14.Top:= 0;
  fDayDepShedule.Invalidate;
end;                               }

procedure TfmLessonShedule.OnWeekDayNameClick(Sender: TObject);
var
  fNeedDate: TDate;
  tempStr: string;
begin
  if fIsDepartmentShedule then
  begin
    if fWeekDepShedule.CurrentHighlightDay = -1 then exit;
    fNeedDate:= fWeekDepShedule.PeriodStart + fWeekDepShedule.CurrentHighlightDay - 1;
    tempStr:= fDayDepShedule.GoToDate(fNeedDate);
  end
  else
  begin
    if fWeekFacShedule.CurrentHighlightDay = -1 then exit;
    fNeedDate:= fWeekFacShedule.PeriodStart + fWeekFacShedule.CurrentHighlightDay - 1;
    tempStr:= fDayFacShedule.GoToDate(fNeedDate);
  end;
  if tempStr = '' then
  begin
    Application.MessageBox('Выбранная дата выходит за рамки текущего учебного семестра!','Переход не возможен',MB_ICONWARNING);
    exit;
  end;
  Panel15.Caption:= tempStr;
  fCurrentState:= ssDay;
  tbDayShedule.Down:= true;
  tbWeekShedule.Down:= false;
  tbMonthShedule.Down:= false;
  if fIsDepartmentShedule then
  begin
    fWeekDepShedule.Visible:= false;
    fDayDepShedule.Visible:= true;
  end
  else
  begin
    fWeekFacShedule.Visible:= false;
    fDayFacShedule.Visible:= true;
  end;
  Panel14.Top:= 0;
  CurrentSheduleGrid.Invalidate;
end;

procedure TfmLessonShedule.Panel15Click(Sender: TObject);
var
  y,m,d: word;
begin
  if not Assigned(CurrentSheduleGrid) then exit;
  DecodeDate(CurrentSheduleGrid.PeriodStart + CurrentSheduleGrid.DayIndex, y, m, d);
  MonthCalendar2.Date:= CurrentSheduleGrid.PeriodStart + CurrentSheduleGrid.DayIndex;
  if m > 1 then
    MonthCalendar1.Date:= EncodeDate(y, m-1, d)
  else MonthCalendar1.Date:= EncodeDate(y-1, 12, d);
  if m < 12 then
    MonthCalendar3.Date:= EncodeDate(y, m+1, d)
  else MonthCalendar3.Date:= EncodeDate(y+1, 1, d);
  Panel6.Visible:= not Panel6.Visible;
end;

procedure TfmLessonShedule.PopupMenu5Popup(Sender: TObject);
begin
  if actEditException.Enabled then N7.Action:= actEditException
  else N7.Action:= actEditEvent;
  if actDelException.Enabled then N8.Action:= actDelException
  else N8.Action:= actDelEvent;
end;

procedure TfmLessonShedule.Read(AIsDepartmentShedule: boolean; AIK, ASheduleIK: integer);
begin
  fIsDepartmentShedule:= AIsDepartmentShedule;
  ToolButton9.Visible:= AIsDepartmentShedule;
  ToolButton10.Visible:= not AIsDepartmentShedule;
  fIK:= AIK;
  fSheduleIK:= ASheduleIK;
  fCurrentState:= ssDay;
  if fIsDepartmentShedule then
  begin
    fDayDepShedule:= TDayDepLessonSheduleGrid.Create(fIK, fSheduleIK, Panel5);
    fDayDepShedule.OnClick:= SheduleGridClick;
    fDayDepShedule.OnDblClick:= SheduleGridDblClick;
    fDayDepShedule.PopupMenu:= PopupMenu5;
    fWeekDepShedule:= TWeekDepLessonSheduleGrid.Create(fIK, fSheduleIK, Panel5);
    fWeekDepShedule.OnClick:= SheduleGridClick;
    fWeekDepShedule.OnDblClick:= SheduleGridDblClick;
    fWeekDepShedule.OnDayNameClick:= OnWeekDayNameClick;
    fWeekDepShedule.PopupMenu:= PopupMenu5;
//    fMonthDepShedule:= TMonthDepLessonSheduleGrid.Create(fIK, fSheduleIK, Panel5);
//    fMonthDepShedule.OnClick:= SheduleGridClick;
//    fMonthDepShedule.OnDblClick:= SheduleGridDblClick;
//    fMonthDepShedule.OnDayNameClick:= OnMonthDayNameClick;
    fDayDepShedule.Visible:= true;
  end
  else
  begin
    fDayFacShedule:= TDayFacLessonSheduleGrid.Create(fIK, fSheduleIK, Panel5);
    fDayFacShedule.OnClick:= SheduleGridClick;
    fDayFacShedule.OnDblClick:= SheduleGridDblClick;
    fDayFacShedule.PopupMenu:= PopupMenu5;
    fWeekFacShedule:= TWeekFacLessonSheduleGrid.Create(fIK, fSheduleIK, Panel5);
    fWeekFacShedule.OnClick:= SheduleGridClick;
    fWeekFacShedule.OnDblClick:= SheduleGridDblClick;
    fWeekFacShedule.OnDayNameClick:= OnWeekDayNameClick;
    fWeekFacShedule.PopupMenu:= PopupMenu5;
  //fMonthFacShedule:= TMonthFacLessonSheduleGrid.Create(fIK, fSheduleIK, Panel5);
  //fMonthFacShedule.OnClick:= SheduleGridClick;
  //fMonthFacShedule.OnDblClick:= SheduleGridDblClick;
  //fMonthFacShedule.OnDayNameClick:= OnMonthDayNameClick;
    fDayFacShedule.Visible:= true;
  end;
  Panel14.Top:= 0;
  fIsFrameLoad:= true;
  fIsFullScreen:= false;
end;

procedure TfmLessonShedule.SetIsFullScreen(const Value: boolean);
begin
  fIsFullScreen := Value;
  ToolButton1.Down:= fIsFullScreen;
end;

procedure TfmLessonShedule.SheduleGridClick(Sender: TObject);
begin

end;

procedure TfmLessonShedule.SheduleGridDblClick(Sender: TObject);
begin
  if actEdit.Enabled then
    actEditExecute(actEdit)
  else
    if actAdd.Enabled then
      actAddExecute(actAdd);
end;

procedure TfmLessonShedule.SpeedButton1Click(Sender: TObject);
begin
  Panel3.Visible:= false;
end;

procedure TfmLessonShedule.tbDaySheduleClick(Sender: TObject);
var
  fNeedDate: TDate;
  fTempCurrentState: TLessonSheduleState;
  tempStr: string;
begin
  if not Assigned(CurrentSheduleGrid) then exit;
  fNeedDate:= CurrentSheduleGrid.PeriodStart;
  case fCurrentState of      // определяем дату перехода
  ssDay: ;
  ssWeek, ssMonth:
    if CurrentSheduleGrid.DayIndex = -1 then fNeedDate:= CurrentSheduleGrid.PeriodStart
    else fNeedDate:= CurrentSheduleGrid.PeriodStart + CurrentSheduleGrid.DayIndex;  //выбранный день
  end;
  fTempCurrentState:= ssDay;
  case (Sender as TToolButton).Tag of
  1: fTempCurrentState:= ssDay;
  2: fTempCurrentState:= ssWeek;
  3: fTempCurrentState:= ssMonth;
  end;
  if fIsDepartmentShedule then
  begin
    case fTempCurrentState of
    ssDay: tempStr:= fDayDepShedule.GoToDate(fNeedDate);
    ssWeek: tempStr:= fWeekDepShedule.GoToDate(fNeedDate);
  //  ssMonth: tempStr:= fMonthDepShedule.GoToDate(fNeedDate);
    end;
  end
  else
  begin
    case fTempCurrentState of
    ssDay: tempStr:= fDayFacShedule.GoToDate(fNeedDate);
    ssWeek: tempStr:= fWeekFacShedule.GoToDate(fNeedDate);
   // ssMonth: tempStr:= fMonthFacShedule.GoToDate(fNeedDate);
    end;
  end;
  case fTempCurrentState of
    ssDay:
      begin
        actNextPeriod.Hint:= 'Перейти к следующему дню';
        actPrevPeriod.Hint:= 'Перейти к предыдущему дню';
        nextPeriodName:= 'Следующий день';
        prevPeriodName:= 'Предыдущий день';
      end;
    ssWeek:
      begin
        actNextPeriod.Hint:= 'Перейти к следующей неделе';
        actPrevPeriod.Hint:= 'Перейти к предыдущей неделе';
        nextPeriodName:= 'Следующая неделя';
        prevPeriodName:= 'Предыдущая неделя';
      end;
   // ssMonth: ;
   end;

  if tempStr = '' then
  begin
    Application.MessageBox('Выбранная дата выходит за рамки текущего учебного семестра!','Переход не возможен',MB_ICONWARNING);
    exit;
  end;
  Panel15.Caption:= tempStr;
  fCurrentState:= fTempCurrentState;
  tbDayShedule.Down:= (Sender as TToolButton).Tag = 1;
  tbWeekShedule.Down:= (Sender as TToolButton).Tag = 2;
//  tbMonthShedule.Down:= (Sender as TToolButton).Tag = 3;
  if fIsDepartmentShedule then
  begin
    fDayDepShedule.Visible:= false;
    fWeekDepShedule.Visible:= false;
 //   fMonthDepShedule.SheduleVisible:= false;
    fDayDepShedule.Visible:= fCurrentState = ssDay;
    fWeekDepShedule.Visible:= fCurrentState = ssWeek;
//    fMonthDepShedule.SheduleVisible:= fCurrentState = ssMonth;
  end
  else
  begin
    fDayFacShedule.Visible:= false;
    fWeekFacShedule.Visible:= false;
 //   fMonthFacShedule.SheduleVisible:= false;
    fDayFacShedule.Visible:= fCurrentState = ssDay;
    fWeekFacShedule.Visible:= fCurrentState = ssWeek;
//    fMonthFacShedule.SheduleVisible:= fCurrentState = ssMonth;
  end;
  Panel14.Top:= 0;
  Refresh;
  CurrentSheduleGrid.Invalidate;
end;

procedure TfmLessonShedule.tbOpenInNewWindowClick(Sender: TObject);
var
  tempForm: TLessonSheduleForm;
begin
  tempForm:= TLessonSheduleForm.Create(Application);
  if fIsDepartmentShedule then
    tempForm.Caption:= 'Расписание аудиторных занятий кафедры "' + TNagruzkaController.Directory.GetDepartmentName(fIK, true) + '" на ' + TSheduleController.MainFunctions.GetSheduleName(fSheduleIK)
  else tempForm.Caption:= 'Раписание аудиторных занятий факультета "' + TNagruzkaController.Directory.GetFacultyName(fIK, true) + '" на ' + TSheduleController.MainFunctions.GetSheduleName(fSheduleIK);
  tempForm.fmLessonShedule1.Read(fIsDepartmentShedule, fIK, fSheduleIK);
  tempForm.fmLessonShedule1.IsLoadInWindow:= true;
  tempForm.Show;
  tempForm.WindowState:= wsMaximized;
  tempForm.fmLessonShedule1.tbOpenSheduleClick(nil);
end;

procedure TfmLessonShedule.tbOpenSheduleClick(Sender: TObject);
begin
  Panel2.Left:= round(Width/2 - Panel2.Width/2);
  Panel2.Top:= round(Height/2 - Panel2.Height/2);
  Panel2.Visible:= true;
  Refresh;
  try
    if fIsDepartmentShedule then
    begin

      TSheduleController.MainFunctions.LoadDepartmentEvents(fSheduleIK, fIK);
      fDayDepShedule.ReadShedule;
      fWeekDepShedule.ReadShedule;
      Refresh;
  //  fMonthDepShedule.ReadShedule;
    end
    else
    begin
  
      TSheduleController.MainFunctions.LoadFacultyEvents(fSheduleIK, fIK);
      fDayFacShedule.ReadShedule;
      fWeekFacShedule.ReadShedule;
      Refresh;
  //  fMonthFacShedule.ReadShedule;
    end;
    Label3.Visible:= true;
    Label1.Visible:= true;
    Panel15.Caption:= CurrentSheduleGrid.GoToDate(CurrentSheduleGrid.PeriodStart);
    UpdateCurrentWeekTypeName;
    tbDayShedule.Down:= true;
    Panel4.Visible:= true;
    Panel14.Top:= 0;
  finally
    Panel2.Visible:= false;
    Refresh;
    CurrentSheduleGrid.Invalidate;
  end;
end;

procedure TfmLessonShedule.UpdateCurrentWeekTypeName;
begin
  Label3.Caption:= CurrentSheduleGrid.CurrentWeekTypeName;
  Label3.Left:= Panel14.Width - Label3.Width - 3;
  Label1.Left:= Panel14.Width - Label3.Width - Label1.Width - 5;
end;

end.
