unit uExaminationShedule;
  {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ActnList, ImgList, ComCtrls, ToolWin, Buttons, ExtCtrls, SheduleClasses, SheduleGrids,
  StdCtrls, Menus;

type
  TExamSheduleState = (essDay, essSession);

  TfmExaminationShedule = class(TFrame)
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
    ImageList1: TImageList;
    ActionList1: TActionList;
    actDelShedule: TAction;
    actFullScreen: TAction;
    actMakeBookmark: TAction;
    actAdd: TAction;
    actEdit: TAction;
    actDel: TAction;
    Panel4: TPanel;
    Panel15: TPanel;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    ToolBar1: TToolBar;
    tbDayShedule: TToolButton;
    tbWeekShedule: TToolButton;
    Panel2: TPanel;
    Image1: TImage;
    Label7: TLabel;
    Label12: TLabel;
    actLoadSheduleAvto: TAction;
    ToolButton4: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    actExport: TAction;
    actExportTeachersShedule: TAction;
    actExportGroupsShedule: TAction;
    PopupMenu4: TPopupMenu;
    MSExcel1: TMenuItem;
    MSExcel2: TMenuItem;
    Panel1: TPanel;
    Label2: TLabel;
    ProgressBar1: TProgressBar;
    PopupMenu1: TPopupMenu;
    actAdd1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure actFullScreenExecute(Sender: TObject);
    procedure tbOpenSheduleClick(Sender: TObject);
    procedure actAddUpdate(Sender: TObject);
    procedure actEditUpdate(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure actDelSheduleExecute(Sender: TObject);
    procedure actDelSheduleUpdate(Sender: TObject);
    procedure actExportGroupsSheduleExecute(Sender: TObject);
    procedure tbOpenInNewWindowClick(Sender: TObject);
    procedure actMakeBookmarkExecute(Sender: TObject);
    procedure actExportExecute(Sender: TObject);
  private
    fIK: integer;
    fSheduleIK: integer;
    fIsFrameLoad: boolean;
    fIsLoadInWindow: boolean;
    fIsDepartmentShedule: boolean;
    fIsFullScreen: boolean;
    fDepShedule: TDepExamSheduleGrid;
    fFacShedule: TFacExamSheduleGrid;
    function GetCurrentSheduleGrid: TCustomExamSheduleGrid;
    procedure SheduleGridDblClick(Sender: TObject);
    procedure SheduleGridClick(Sender: TObject);
    procedure SetIsFullScreen(const Value: boolean);
  public
    destructor Destroy; override;
    procedure Read(AIsDepartmentShedule: boolean; AIK, ASheduleIK: integer);
    property IsFullScreen:boolean read fIsFullScreen write SetIsFullScreen;
    property IsFrameLoad:boolean read fIsFrameLoad default false;
    property IsLoadInWindow:boolean read fIsLoadInWindow write fIsLoadInWindow default false;
    property IsDepartmentShedule:boolean read fIsDepartmentShedule write fIsDepartmentShedule;
    property CurrentSheduleGrid: TCustomExamSheduleGrid read GetCurrentSheduleGrid;
  end;

implementation

uses uMain,  GeneralController, SheduleController,
  uExaminationSheduleOnForm, NagruzkaController,
  uSheduleAddExaminationWithPrefetch;

{$R *.dfm}

procedure TfmExaminationShedule.actAddExecute(Sender: TObject);
var
  temp: TfrmSheduleAddExaminationWithPrefetch;
begin
  if not Assigned(CurrentSheduleGrid) then exit;
try
  if (Sender as TAction).Tag <> 1 then
  begin
    if TSheduleController.MainFunctions.CheckExamForDelete(CurrentSheduleGrid.SelectedExam.ExamIK) then
    begin
      CurrentSheduleGrid.DeleteExam(CurrentSheduleGrid.SelectedExam.ExamIK);
      CurrentSheduleGrid.UpdateVisibleEvents;
      CurrentSheduleGrid.Invalidate;
      Application.MessageBox('Данный экзамен/консультация уже удален другим пользователем. Выполнение запрошенной операции невозможно!', 'Подсистема "Расписание"', MB_ICONWARNING);
      exit;
    end;

    if not TSheduleController.MainFunctions.CheckExamVersion(CurrentSheduleGrid.SelectedExam) then
    begin
      CurrentSheduleGrid.UpdateVisibleEvents;
      CurrentSheduleGrid.Invalidate;
      Application.MessageBox('Параметры данного экзамена/консультации были изменены другим пользователем. Информация об экзамене/консультации обновлена. Текущая операция редактирования отменяется.', 'Подсистема "Расписание"', MB_ICONWARNING);
      exit;
    end;
  end;

  temp:= TfrmSheduleAddExaminationWithPrefetch.CreateDialog(nil, TGeneralController.Instance.GetMainConnection, nil);
  if fIsDepartmentShedule then
    temp.IK:= (CurrentSheduleGrid as TDepExamSheduleGrid).Teachers[CurrentSheduleGrid.ElementIndex].TabN
  else
    temp.IK:= (CurrentSheduleGrid as TFacExamSheduleGrid).Groups[CurrentSheduleGrid.ElementIndex].GroupIK;
  if (Sender as TAction).Tag = 1 then
    temp.Examination:= nil
  else temp.Examination:= CurrentSheduleGrid.SelectedExam;
  temp.ShedulerGrid:= CurrentSheduleGrid;
  temp.Read(fIsDepartmentShedule);
  Panel2.Visible:= false;
  if (temp.ShowModal() = mrOk) or (temp.bbApply.Tag = 1) then
  begin
    CurrentSheduleGrid.UpdateVisibleEvents;
    CurrentSheduleGrid.Invalidate;
  end;
finally
  temp.Free;             
end;
end;

procedure TfmExaminationShedule.actAddUpdate(Sender: TObject);
begin
  if Assigned(CurrentSheduleGrid) then
  begin
    if CurrentSheduleGrid.IsLoad then
      (Sender as TAction).Enabled:= CurrentSheduleGrid.IsCurrentDayAllow
    else (Sender as TAction).Enabled:= false;
  end
  else (Sender as TAction).Enabled:= false;
end;

procedure TfmExaminationShedule.actDelExecute(Sender: TObject);
begin
  if not TSheduleController.MainFunctions.CheckExamVersion(CurrentSheduleGrid.SelectedExam) then
  begin
    CurrentSheduleGrid.UpdateVisibleEvents;
    CurrentSheduleGrid.Invalidate;
    Application.MessageBox('Параметры данного экзамена/консультации были изменены другим пользователем. Информация об экзамене/консультации обновлена. Текущая операция удаления отменяется.', 'Подсистема "Расписание"', MB_ICONWARNING);
    exit;
  end;

  if not Assigned(CurrentSheduleGrid) then exit;
  if (Application.MessageBox('Вы уверены, что хотите удалить выбранный экзамен/выбранную консультацию?','Удаление экзамена', mb_YesNo) = mrYes) then
    if CurrentSheduleGrid.DeleteExam(CurrentSheduleGrid.SelectedExam.ExamIK) then
      CurrentSheduleGrid.Invalidate;
end;

procedure TfmExaminationShedule.actDelSheduleExecute(Sender: TObject);
begin
  if not Assigned(CurrentSheduleGrid) then exit;
  if (Application.MessageBox('Вы уверены, что хотите удалить все экзамены и консультации из данного расписания?','Отчистка расписания', mb_YesNo) = mrYes) then
    if CurrentSheduleGrid.DeleteAllItems then
      CurrentSheduleGrid.Invalidate;
end;

procedure TfmExaminationShedule.actDelSheduleUpdate(Sender: TObject);
begin
  if Assigned(CurrentSheduleGrid) then
    (Sender as TAction).Enabled:= CurrentSheduleGrid.IsLoad
  else (Sender as TAction).Enabled:= false;
end;

procedure TfmExaminationShedule.actEditUpdate(Sender: TObject);
begin
  if Assigned(CurrentSheduleGrid) then
  begin
    if CurrentSheduleGrid.IsLoad then
      (Sender as TAction).Enabled:= CurrentSheduleGrid.SelectedExam <> nil
    else (Sender as TAction).Enabled:= false;
  end
  else (Sender as TAction).Enabled:= false;
end;

procedure TfmExaminationShedule.actExportExecute(Sender: TObject);
begin
  if actExportGroupsShedule.Enabled then
    actExportGroupsSheduleExecute(actExportGroupsShedule)
 else
 begin
   if actExportTeachersShedule.Enabled then
    actExportGroupsSheduleExecute(actExportTeachersShedule);
 end;
end;

procedure TfmExaminationShedule.actExportGroupsSheduleExecute(Sender: TObject);
begin
  Panel1.Left:= round(Width/2 - Panel2.Width/2);
  Panel1.Top:= round(Height/2 - Panel2.Height/2);
  Panel1.Visible:= true;
  Refresh;
  try
    case (Sender as TAction).Tag of
    1: TSheduleController.MainFunctions.ExportGroupExamShedule(fSheduleIK, fIK, fIsDepartmentShedule, ProgressBar1);
    2: TSheduleController.MainFunctions.ExportTeacherExamShedule(fSheduleIK, fIK, ProgressBar1);
    end;
  finally
    Panel1.Visible:= false;
    Refresh;
    CurrentSheduleGrid.Invalidate;
  end;
end;

procedure TfmExaminationShedule.actFullScreenExecute(Sender: TObject);
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

procedure TfmExaminationShedule.actMakeBookmarkExecute(Sender: TObject);
var
  makeResult: integer;
begin
  if fIsDepartmentShedule then
    TSheduleController.MainFunctions.MakeScheduleBookmark(sbKafedraExam, fSheduleIK, fIK)
  else TSheduleController.MainFunctions.MakeScheduleBookmark(sbFacExam, fSheduleIK, fIK);
end;

destructor TfmExaminationShedule.Destroy;
begin
  if fIsDepartmentShedule then
    FreeAndNil(fDepShedule)
  else
    FreeAndNil(fFacShedule);
  inherited;
end;

function TfmExaminationShedule.GetCurrentSheduleGrid: TCustomExamSheduleGrid;
begin
  if fIsDepartmentShedule then
    Result:= fDepShedule
  else
    Result:= fFacShedule;
end;

procedure TfmExaminationShedule.Read(AIsDepartmentShedule: boolean; AIK, ASheduleIK: integer);
begin
  fIsDepartmentShedule:= AIsDepartmentShedule;
  ToolButton8.Visible:= AIsDepartmentShedule;
  ToolButton10.Visible:= not AIsDepartmentShedule;
  fIK:= AIK;
  fSheduleIK:= ASheduleIK;
  if fIsDepartmentShedule then
    fDepShedule:= TDepExamSheduleGrid.Create(fIK, fSheduleIK, Panel5)
  else
    fFacShedule:= TFacExamSheduleGrid.Create(fIK, fSheduleIK, Panel5);
  CurrentSheduleGrid.PopupMenu:= PopupMenu1;
  CurrentSheduleGrid.OnDblClick:= SheduleGridDblClick;
  CurrentSheduleGrid.OnClick:= SheduleGridClick;
  CurrentSheduleGrid.Visible:= true;
  fIsFullScreen:= false;
  fIsFrameLoad:= true;
end;

procedure TfmExaminationShedule.SetIsFullScreen(const Value: boolean);
begin
  fIsFullScreen := Value;
  ToolButton1.Down:= fIsFullScreen;
end;

procedure TfmExaminationShedule.SheduleGridClick(Sender: TObject);
begin

end;

procedure TfmExaminationShedule.SheduleGridDblClick(Sender: TObject);
begin
  if actEdit.Enabled then
    actAddExecute(actEdit)
  else
    if actAdd.Enabled then
      actAddExecute(actAdd);
end;

procedure TfmExaminationShedule.tbOpenInNewWindowClick(Sender: TObject);
var
  tempForm: TExaminationSheduleOnForm;
begin
  tempForm:= TExaminationSheduleOnForm.Create(Application);
  if fIsDepartmentShedule then
    tempForm.Caption:= 'Расписание экзаменов кафедры "' + TNagruzkaController.Directory.GetDepartmentName(fIK, true) + '" на ' + TSheduleController.MainFunctions.GetSheduleName(fSheduleIK)
  else tempForm.Caption:= 'Раписание экзаменов факультета "' + TNagruzkaController.Directory.GetFacultyName(fIK, true) + '" на ' + TSheduleController.MainFunctions.GetSheduleName(fSheduleIK);
  tempForm.fmExaminationShedule1.Read(fIsDepartmentShedule, fIK, fSheduleIK);
  tempForm.fmExaminationShedule1.IsLoadInWindow:= true;
  tempForm.Show;
  tempForm.WindowState:= wsMaximized;
  tempForm.fmExaminationShedule1.tbOpenSheduleClick(nil);
end;

procedure TfmExaminationShedule.tbOpenSheduleClick(Sender: TObject);
begin
  Panel2.Left:= round(Width/2 - Panel2.Width/2);
  Panel2.Top:= round(Height/2 - Panel2.Height/2);
  Panel2.Visible:= true;
  Refresh;
  try
    if fIsDepartmentShedule then
      TSheduleController.MainFunctions.LoadDepartmentExams(fSheduleIK, fIK)
    else TSheduleController.MainFunctions.LoadFacultyExams(fSheduleIK, fIK);
    CurrentSheduleGrid.ReadShedule;
    Panel14.Top:= 0;
  finally
    Panel2.Visible:= false;
    Refresh;
    CurrentSheduleGrid.Invalidate;
  end;
end;

end.
