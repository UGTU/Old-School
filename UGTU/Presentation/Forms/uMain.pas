unit uMain;

{ #Author support@ist.ugtu.net }
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, DBTV, DBTVObj, DBTVDekanat, NagruzkaController,
  DBDekTreeView_TEST, Menus, ExtCtrls, ActnList, XPStyleActnCtrls, ActnMan,
  ToolWin, ActnCtrls, ImgList, StdStyleActnCtrls, uBaseFrame, Buttons,
  ActnMenus, Grids, DBGridEh, DateUtils, DBTVAdminObj, uUSerFrame,
  GeneralController, UchPlanController, ABIT_nabor_frame, ABIT_rasp_frame,
  ABIT_year_frame, ABIT_zachislenie_frame, DBTVFacZachobj, DBTVSpecZachobj,
  uAbitDinamica, uAbitCard,
  Spin, Mask, DBCtrlsEh, DBLookupEh, Wininet, shlobj, ShellAPI, DBCtrls, ComObj,
  ABIT_zhurnal, STOHTMLHelp, ComCtrls, uQueryMaster, uMethodWork,
  DBTVMethodWorkobj, DBTVFacMethodWorkObj,
  uMethodWorkFac, DBTVMethodWorkdepobj, uMethodWorkDep,
  DBTVMethodWorkTeacherobj, uMethodWorkPrep,
  uShedule, uSheduleFac, uSheduleDep, DBTVFacScheduleobj, DBTVRootScheduleobj,
  DBTVDepScheduleobj, DBTVOKObj, uDiplomOtdKadr,
  DataProcessingSplashDialog, uAppTweaks, uLocalLogController, uAbitReturn,
  jpeg, VersionController, NewClientVersionDetectedFrm,
  xmldom, XMLIntf, msxmldom, XMLDoc, uDMAbiturientNabor, ExceptionBase,
  CommonIntf, HOST_AddZayav, uChangeKatZach, uCertificateDialog,
  System.Actions, uMagaizneDoc, DBTVSprObj, uSprForGroup, uDocController,
  uDMDocuments, Document, Destination,
  System.Generics.Collections, uUspevGroupController;

type
  TSearchPanelType = (sptStudent, sptPrepod, sptAbiturient, sptMethodWork,
    sptShedule, sptRIO, sptNone);

  TfrmMain = class(TForm)
    DBDekTreeView_TEST1: TDBDekTreeView_TEST;
    MainMenu1: TMainMenu;
    alMainActions: TActionList;
    ImageList1: TImageList;
    Splitter1: TSplitter;
    StatusBar1: TStatusBar;
    actTreeRefreshAction: TAction;
    miFile: TMenuItem;
    miStudent: TMenuItem;
    actOtchisl: TAction;
    actPerevod: TAction;
    actVosst: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    miHlp: TMenuItem;
    miHelp: TMenuItem;
    miAbout: TMenuItem;
    actAddGroup: TAction;
    miGroup: TMenuItem;
    miSpec: TMenuItem;
    miFac: TMenuItem;
    miUni: TMenuItem;
    N5: TMenuItem;
    actAddSpec: TAction;
    N7: TMenuItem;
    N6: TMenuItem;
    // actMakeVed: TAction;
    N10: TMenuItem;
    TreeIcons: TImageList;
    actAkadem: TAction;
    actVypiska: TAction;
    actFamChg: TAction;
    actPasspChg: TAction;
    actUspReports: TAction;
    actNapr: TAction;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    N35: TMenuItem;
    N36: TMenuItem;
    actUchPlanAdd: TAction;
    MainMenuBar: TActionMainMenuBar;
    actFileExit: TAction;
    actAbout: TAction;
    actHelpContent: TAction;
    ActionToolBar1: TActionToolBar;
    Panel1: TPanel;
    ppmTree: TPopupMenu;
    actAddStudentFormShow: TAction;
    actDeleteStudent: TAction;
    actCollapseAll: TAction;
    actRefreshDSinFrame: TAction;
    actEditGroup: TAction;
    actDelGroup: TAction;
    ActionManager1: TActionManager;
    actFilleMenu: TAction;
    actACTION: TAction;
    actHelpMenu: TAction;
    actSprav: TAction;
    actShowStud: TAction;
    actShowAllStudent: TAction;
    actShowOtchislStudent: TAction;
    actShowUnOtchislStudent: TAction;
    actShowAcademStudent: TAction;
    actFilterGroup: TAction;
    actFilterAll: TAction;
    actFilterActual: TAction;
    actNaprClose: TAction;
    actAddPrikaz: TAction;
    actEditPrikaz: TAction;
    actDelPrikaz: TAction;
    actAddPotok: TAction;
    actAddPrep: TAction;
    actEditPrep: TAction;
    actDelPrep: TAction;
    actFacNagrMenu: TAction;
    actDepNagrMenu: TAction;
    ppmFacNagr: TPopupMenu;
    ppmDepNagr: TPopupMenu;
    ppmPrepNagr: TPopupMenu;
    actPrepNagrMenu: TAction;
    N99: TMenuItem;
    N100: TMenuItem;
    N101: TMenuItem;
    N105: TMenuItem;
    actAddNorm: TAction;
    N86: TMenuItem;
    N87: TMenuItem;
    N88: TMenuItem;
    N89: TMenuItem;
    N90: TMenuItem;
    N83: TMenuItem;
    N84: TMenuItem;
    N91: TMenuItem;
    N92: TMenuItem;
    N93: TMenuItem;
    actAddSpclz: TAction;
    N24: TMenuItem;
    N25: TMenuItem;
    N85: TMenuItem;
    N94: TMenuItem;
    actCollapseExpand: TAction;
    actStudSep1: TAction;
    actStudSep2: TAction;
    ffd1: TMenuItem;
    actLevelUp: TAction;
    actAddDepPlan: TAction;
    actAddPlanPrepNagruzka: TAction;
    actAddFactPrepNagruzka: TAction;
    actAddAbit: TAction;
    actPostupDlgShow: TAction;
    actLogOff: TAction;
    actFind: TAction;
    actAcademRestore: TAction;
    actCheckNewVer: TAction;
    actYearFilter: TAction;
    actFilterAllYear: TAction;
    ActCurFilter: TAction;
    actListToExcel: TAction;
    actPrintMag: TAction;
    actDocsRetrieve: TAction;
    actPrintEgeOtch: TAction;
    actPrintAllZhurnal: TAction;
    ActGroupMgr: TAction;
    actAbitMove: TAction;
    actStatToExcel: TAction;
    actPrintResults: TAction;
    actJoinGroup: TAction;
    actGroupChange: TAction;
    actCurrentReturn: TAction;
    actLichnKartStud: TAction;
    actQMShow: TAction;
    actStartMaster: TAction;
    actStartUOMaster: TAction;
    StudSearchPanel: TPanel;
    cmbSearch: TDBComboBoxEh;
    dbcbeSearch: TDBLookupComboboxEh;
    StaticText1: TStaticText;
    TeacherSearchPanel: TPanel;
    cmbTeachSearch: TDBComboBoxEh;
    dbcbeTeachSearch: TDBLookupComboboxEh;
    StaticText2: TStaticText;
    actFindTeach: TAction;
    Panel2: TPanel;
    Image1: TImage;
    Image2: TImage;
    actPrintItogiPostupl: TAction;
    actPrintItogiPostForSpec: TAction;
    actPrintAbitDopSpec: TAction;
    actAbitReturn: TAction;
    Panel3: TPanel;
    Panel7: TPanel;
    Panel13: TPanel;
    actViewUchPlan: TAction;
    ScheduleBookmarksPanel: TPanel;
    ActionToolBar2: TActionToolBar;
    actScheduleBookmarks: TAction;
    actMakeBookmark: TAction;
    actManageBookmarks: TAction;
    Panel4: TPanel;
    Panel5: TPanel;
    actChangeSemFilter: TAction;
    actAllSem: TAction;
    actCurrentSem: TAction;
    actAppTweaksShow: TAction;
    actPrepodsFilter: TAction;
    actPFShowAll: TAction;
    actPFShowWorked: TAction;
    actPFShowReleased: TAction;
    Panel6: TPanel;
    actAbitFilter: TAction;
    ActAbitExiled: TAction;
    ActAbitCurrent: TAction;
    actAbitChecked: TAction;
    ActAbitMoved: TAction;
    actShowSecondary: TAction;
    actShowPrimary: TAction;
    actShowReal: TAction;
    actExtendSession: TAction;
    imgChristmas: TImage;
    Button1: TButton;
    actAddZayav: TAction;
    actShowTree: TAction;
    actKatChange: TAction;
    actFilterKaf: TAction;
    actAllKaf: TAction;
    actCurrentKaf: TAction;
    pnlTree: TPanel;
    pnlImage: TPanel;
    actGazpromStatement: TAction;
    actPostupDelete: TAction;
    actCallSpr: TAction;
    actNotification: TAction;
    procedure FormCreate(Sender: TObject);

    procedure DBDekTreeView_TEST1Change(Sender: TObject; Node: TTreeNode);
    procedure SpeedButton4Click(Sender: TObject);
    procedure rbShowAllClick(Sender: TObject);
    procedure actTreeRefreshActionExecute(Sender: TObject);
    procedure DBDekTreeView_TEST1Collapsing(Sender: TObject; Node: TTreeNode;
      var AllowCollapse: Boolean);
    procedure DBDekTreeView_TEST1Expanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure actAddUchPlanUpdate(Sender: TObject);
    procedure actAddUchPlanExecute(Sender: TObject);
    procedure N36Click(Sender: TObject);
    procedure actFilleMenuUpdate(Sender: TObject);
    procedure actFileExitExecute(Sender: TObject);
    procedure actSpravExecute(Sender: TObject);
    procedure actAddStudentFormShowExecute(Sender: TObject);
    procedure DBDekTreeView_TEST1MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure actDeleteStudentExecute(Sender: TObject);
    procedure actCollapseAllExecute(Sender: TObject);
    procedure actRefreshDSinFrameExecute(Sender: TObject);
    procedure actAddGroupExecute(Sender: TObject);
    procedure actAboutExecute(Sender: TObject);
    procedure actFilterActualExecute(Sender: TObject);
    procedure actNaprExecute(Sender: TObject);
    procedure actFilterGroupExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure actNaprCloseExecute(Sender: TObject);
    procedure actFilterAllExecute(Sender: TObject);
    procedure N37Click(Sender: TObject);
    procedure N38Click(Sender: TObject);
    procedure N74Click(Sender: TObject);
    procedure N75Click(Sender: TObject);
    procedure actShowStudExecute(Sender: TObject);
    procedure actAddPrikazExecute(Sender: TObject);
    procedure actEditPrikazExecute(Sender: TObject);
    procedure actDelPrikazExecute(Sender: TObject);
    procedure actDelPrikazUpdate(Sender: TObject);
    procedure actEditPrikazUpdate(Sender: TObject);
    procedure actEditGroupExecute(Sender: TObject);
    procedure actEditGroupUpdate(Sender: TObject);
    procedure actDelGroupExecute(Sender: TObject);
    procedure actDelGroupUpdate(Sender: TObject);
    procedure actAddPotokExecute(Sender: TObject);
    procedure actAddPrepExecute(Sender: TObject);
    procedure actEditPrepExecute(Sender: TObject);
    procedure actDelPrepExecute(Sender: TObject);
    procedure actAddKafExecute(Sender: TObject);
    procedure actAddNormUpdate(Sender: TObject);
    procedure actAddNormExecute(Sender: TObject);
    procedure actOtchislExecute(Sender: TObject);
    procedure actVosstExecute(Sender: TObject);
    procedure actPerevodExecute(Sender: TObject);
    procedure actAkademExecute(Sender: TObject);
    procedure actFamChgExecute(Sender: TObject);
    procedure actPasspChgExecute(Sender: TObject);
    procedure actAddSpclzExecute(Sender: TObject);
    procedure ppmFacNagrPopup(Sender: TObject);
    procedure ppmTreePopup(Sender: TObject);
    procedure actCollapseExpandExecute(Sender: TObject);
    procedure MainMenuBarPopup(Sender: TObject; Item: TCustomActionControl);
    procedure actLevelUpExecute(Sender: TObject);
    procedure actAddDepPlanExecute(Sender: TObject);
    procedure actAddPlanPrepNagruzkaExecute(Sender: TObject);
    procedure actAddFactPrepNagruzkaExecute(Sender: TObject);
    procedure actAddAbitExecute(Sender: TObject);
    procedure actPostupDlgShowExecute(Sender: TObject);
    procedure DBDekTreeView_TEST1Click(Sender: TObject);
    procedure cmbSearchChange(Sender: TObject);
    procedure actFindExecute(Sender: TObject);
    procedure dbcbeSearchKeyPress(Sender: TObject; var Key: Char);
    procedure dbcbeSearchCloseUp(Sender: TObject; Accept: Boolean);
    procedure actAcademRestoreExecute(Sender: TObject);
    procedure actCheckNewVerExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actYearFilterExecute(Sender: TObject);
    procedure actListToExcelExecute(Sender: TObject);
    procedure actPrintMagExecute(Sender: TObject);
    procedure actDocsRetrieveExecute(Sender: TObject);
    procedure actPrintEgeOtchExecute(Sender: TObject);
    procedure actPrintAllZhurnalExecute(Sender: TObject);
    procedure ActGroupMgrExecute(Sender: TObject);
    procedure actHelpContentExecute(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actAbitMoveExecute(Sender: TObject);
    procedure actStatToExcelExecute(Sender: TObject);
    procedure actGroupChangeExecute(Sender: TObject);
    procedure actCurrentReturnExecute(Sender: TObject);
    procedure actLichnKartStudExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actQMShowExecute(Sender: TObject);
    procedure actStartMasterExecute(Sender: TObject);
    procedure actStartUOMasterExecute(Sender: TObject);
    procedure actGroupChangeUpdate(Sender: TObject);
    procedure actJoinGroupUpdate(Sender: TObject);
    procedure actJoinGroupExecute(Sender: TObject);
    procedure actFindTeachExecute(Sender: TObject);
    procedure dbcbeTeachSearchCloseUp(Sender: TObject; Accept: Boolean);
    procedure cmbTeachSearchChange(Sender: TObject);
    procedure Panel2Resize(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure Panel2MouseEnter(Sender: TObject);
    procedure Panel2MouseLeave(Sender: TObject);
    procedure actPrintResultsExecute(Sender: TObject);
    procedure actVypiskaExecute(Sender: TObject);
    procedure actPrintItogiPostuplExecute(Sender: TObject);
    procedure actPrintItogiPostForSpecExecute(Sender: TObject);
    procedure actPrintAbitDopSpecExecute(Sender: TObject);
    procedure actAbitReturnExecute(Sender: TObject);
    procedure actViewUchPlanExecute(Sender: TObject);
    procedure actMakeBookmarkUpdate(Sender: TObject);
    procedure actMakeBookmarkExecute(Sender: TObject);
    procedure actChangeSemFilterExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure actAppTweaksShowExecute(Sender: TObject);
    procedure alMainActionsExecute(Action: TBasicAction; var Handled: Boolean);
    procedure actPFShowAllExecute(Sender: TObject);
    procedure actPrepodsFilterExecute(Sender: TObject);
    procedure DBDekTreeView_TEST1DblClick(Sender: TObject);
    procedure alMainActionsUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure actAbitFilterExecute(Sender: TObject);
    procedure actPrintAbitDopSpecUpdate(Sender: TObject);
    procedure actPrintItogiPostForSpecUpdate(Sender: TObject);
    procedure actExtendSessionExecute(Sender: TObject);
    procedure actAddZayavExecute(Sender: TObject);
    procedure actShowTreeExecute(Sender: TObject);
    procedure actKatChangeExecute(Sender: TObject);
    procedure actFilterKafExecute(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure actGazpromStatementExecute(Sender: TObject);
    procedure actPostupDeleteExecute(Sender: TObject);
    procedure actCallSprUpdate(Sender: TObject);
    procedure actCallSprExecute(Sender: TObject);
    procedure DBDekTreeView_TEST1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure actNotificationExecute(Sender: TObject);

  private
    FFrame: TfmBase;
    procedure SetFrame(FrameClass: TBaseFrameClass);
    procedure FixButton();
    procedure GetLichnKartStud(ncode: Integer; ik_grup: Integer);
    function GetPanel8: TDataProcessingSplashDlg;
    function LoadScheduleBookmarks(): Boolean;
  public
    CurrentTopic: String;
    procedure Comment(str1, str2: String);
    procedure SetCurrentSearchPanel(ASearchPanelType: TSearchPanelType);
    property ActiveFrame: TfmBase read FFrame;
    property Frame: TBaseFrameClass write SetFrame;
    procedure OnScheduleBookmarkExecute(Sender: TObject);
    procedure FormSprForGrup(ik_grup, ik_destination: Integer);
  end;

var
  frmMain: TfrmMain;
  LastSelectedNode: TTreeNode;
  lastCancel, alreadySpec: Boolean;
  id_grup: Integer;
  // флаг "только что нажали отмену" не требуется повторная
  // проверка наличия изменений

implementation

uses uLogin, uDM, uSpravFram, uFac, uGroup, uStudent, uSpec, uNagruzka,
  uNagruzkaFac, uNagruzkaDep,
  uUni, DBTVRootobj, DBTVPrikobj, DBTVTeacherobj, DBTVgroupobj, DBTVAbitobj,
  DBTVRecruitObj,
  DBTVScheduleObj, DBTVBusinessobj, DBTVdepobj, DBTVzachobj, DBTVSpecobj,
  DBTVFacobj, DBTVFacDepobj, DBTVDictobj, DBTVStudobj,
  uUchPlan, uStudDlg, uPrik, uPrikDlg, uGroupEdtDlg, uAbout, uNapr,
  DBTVWorkTypeObj, DBTVSemesterNagrObj,
  uNaprClose, uOtchislStud, uVosstStud, uPerevStud, uAcadem,
  DBTVSemesterScheduleobj,
  uChangeLastName, uChangePassport, uNagruzkaAddPrep, DBTVFacRecobj,
  DBTVSpecRecobj,
  uLevelUp, DBTVStudAbitObj, uabitDialog, DBTVAbitYearObj, uPostupdlg,
  uAcademReturn, uUniteGroups, uAbitMove, uExtendSession, uJoinGroup,
  uDMStudentSelectionProcs,
  uDMStudentActions, uDMPrikaz, uDMUgtuStructure, uDMAbiturientAction,
  uDMAbiturientOtchety, uNagruzkaKafedraMaster, uNagruzkaUchOtdelMaster,
  uDMAbiturientZachisl, uAbitZachislenieController, uNagruzkaPrepAllInfo,
  uSheduleSemester, uAbitOtchetsController, udmUspevaemost, SheduleController,
  uNagruzkaSemester, ApplicationController, uAbitConfirm, udmCauses,
  DBTVInviteObj,
  HOST_Zaselenie, DBTVInviteHostObj, DBTVHabitatsObj, HOST_Projivaysh,
  DBTVHabitatsPersonObj,
  uPerson;

{$R *.dfm}

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  usrAnswer: Integer;
begin
  if lastCancel then
  begin
    lastCancel := false;
    Exit;
  end;
  if FFrame <> nil then
    if (FFrame.Modified) then
    begin
      usrAnswer := MessageBox(Handle, 'Сохранить изменения?',
        PWideChar(Application.Title), MB_YESNOCANCEL or MB_ICONQUESTION);
      lastCancel := false;
      if usrAnswer = IDYES then
      begin
        if FFrame.Apply = false then
        begin
          Action := caNone;
          Exit;
        end;
      end;
      if usrAnswer = IDCANCEL then
      begin
        Action := caNone;
        Exit;
      end;
    end;

  FFrame.Free;
  TApplicationController.GetInstance.FinalizeApplication;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
const
  PERMISSION_DENIED = -2147217911;
begin

  Application.HelpFile := '';
  WindowState := wsMaximized;
  FixButton;
  dm.DBConnect.Connected := false;
  DBDekTreeView_TEST1.Connection := dm.DBConnect;

  try
    DBDekTreeView_TEST1.UserLogin :=
      TApplicationController.GetInstance.LoginName;
    DBDekTreeView_TEST1.root := DBDekTreeView_TEST1.AddRoot;

  except

  end;
end;

procedure TfrmMain.SetCurrentSearchPanel(ASearchPanelType: TSearchPanelType);
begin
  StudSearchPanel.Visible := ASearchPanelType = sptStudent;
  TeacherSearchPanel.Visible := ASearchPanelType = sptPrepod;
  ScheduleBookmarksPanel.Visible := ASearchPanelType = sptShedule;
  if (ASearchPanelType = sptShedule) and (actScheduleBookmarks.Tag = 0) then
    LoadScheduleBookmarks;
end;

procedure TfrmMain.SetFrame(FrameClass: TBaseFrameClass);
begin
  if (FrameClass = nil) then
  begin
    FFrame := nil;
    Exit;
  end;

  if Assigned(ActiveFrame) then
  begin
    ActiveFrame.Visible := false;
    ActiveFrame.CloseFrame;
    if ActiveFrame is TfmStudent then
    begin
      TDBnodeObject(ActiveFrame.FrameObject).AssociatedObject := nil;
      ActiveFrame.Free;
    end;
  end;

  if (self.DBDekTreeView_TEST1.SelectedObject.AssociatedObject = nil) then
  begin
    FFrame := FrameClass.CreateFrame(nil,
      self.DBDekTreeView_TEST1.SelectedObject, dm.DBConnect);
    self.DBDekTreeView_TEST1.SelectedObject.AssociatedObject := FFrame;
    FFrame.Align := alClient;
    FFrame.Parent := frmMain.Panel1;
  end
  else
  begin
    if (self.DBDekTreeView_TEST1.SelectedObject.AssociatedObject is FrameClass)
    then
      FFrame := (self.DBDekTreeView_TEST1.SelectedObject.AssociatedObject
        as TfmBase);
  end;

  FFrame.Visible := true;

end;

procedure TfrmMain.DBDekTreeView_TEST1Change(Sender: TObject; Node: TTreeNode);
var
  dbNode: TDBnodeObject;
  ndSpec: TDBNodeSpecObject;
  ndFac: TDBNodeFacultyObject;
  ndGroup: TDBNodeGroupObject;
  tempStoredProc: TADOStoredProc;
  prepFilterAction: TAction;
  usrAnswer: Integer;
  // ответ пользователя на вопрос о сохранении изменений во фрейме
  tempstring: string;
begin

  CurrentTopic := 'Main_windows.htm';
  // DBDekTreeView_TEST1.PopupMenu:=ppmTree;
  actShowStud.Visible := false;
  actFilterGroup.Visible := false;
  actYearFilter.Visible := false;
  actChangeSemFilter.Visible := false;
  actPrepodsFilter.Visible := false;
  actAbitFilter.Visible := false;
  actFilterKaf.Visible := false;

  if lastCancel then
  begin
    lastCancel := false;
    Exit;
  end;
  if FFrame <> nil then
    if (FFrame.Modified) then
    begin
      usrAnswer := MessageBox(Handle, 'Сохранить изменения?', 'ИС Деканат',
        MB_YESNOCANCEL);

      lastCancel := false;
      if usrAnswer = IDYES then
      begin
        if FFrame.Apply = false then
        begin
          lastCancel := true;
          DBDekTreeView_TEST1.Select(LastSelectedNode);
          Exit;
        end;
      end;
      if usrAnswer = IDCANCEL then
      begin
        lastCancel := true;
        DBDekTreeView_TEST1.Select(LastSelectedNode);
        Exit;
      end;
    end;
  dbNode := Node.data;
  LastSelectedNode := DBDekTreeView_TEST1.Selected;

  if (dbNode is TDBNodeAbitObject) then
  begin
    actYearFilter.Visible := true;
    Caption := TApplicationController.GetInstance.ProgramName +
      ' - [Абитуриенты]';
    Comment('Абитуриенты УГТУ', '');
    TApplicationController.GetInstance.AddLogEntry
      ('Кадр подсистемы "Абитуриент". Состояние: ' + StatusBar1.Panels.Items[0]
      .Text + '/' + StatusBar1.Panels.Items[1].Text + '/' +
      StatusBar1.Panels.Items[2].Text);
    SetCurrentSearchPanel(sptAbiturient);
    Frame := TfmABITdinamica;
    FFrame.RefreshFrame;
  end;

  if (dbNode is TDBNodeZachObject) then
  begin
    Caption := TApplicationController.GetInstance.ProgramName +
      ' - [Абитуриенты]- Зачисление';
    Comment('Абитуриенты УГТУ', '');
    TApplicationController.GetInstance.AddLogEntry
      ('Кадр "Зачисление". Состояние: ' + StatusBar1.Panels.Items[0].Text + '/'
      + StatusBar1.Panels.Items[1].Text + '/' + StatusBar1.Panels.Items
      [2].Text);
    SetCurrentSearchPanel(sptAbiturient);
    Frame := TfmZach;
    FFrame.RefreshFrame;
  end;

  if (dbNode is TDBNodeFacZachObject) then
  begin
    Caption := TApplicationController.GetInstance.ProgramName +
      ' - [Абитуриенты]- Зачисление';
    Comment('Абитуриенты УГТУ', 'Факультет: ' + dbNode.Name);
    TApplicationController.GetInstance.AddLogEntry
      ('Кадр "Зачисление - факультет". Состояние: ' + StatusBar1.Panels.Items[0]
      .Text + '/' + StatusBar1.Panels.Items[1].Text + '/' +
      StatusBar1.Panels.Items[2].Text);
    SetCurrentSearchPanel(sptAbiturient);
    Frame := TfmZach;
    FFrame.RefreshFrame;
  end;

  if (dbNode is TDBNodeAbitStudObject) then
  begin
    CurrentTopic := 'A_Abit_frame.htm';
    Caption := TApplicationController.GetInstance.ProgramName +
      ' - [Абитуриенты]';
    Comment('Специальность :' + dbNode.Node.Parent.Text, dbNode.Node.Text);
    TApplicationController.GetInstance.AddLogEntry
      ('Кадр "Абитуриент". Состояние: ' + StatusBar1.Panels.Items[0].Text + '/'
      + StatusBar1.Panels.Items[1].Text + '/' + StatusBar1.Panels.Items
      [2].Text);
    SetCurrentSearchPanel(sptAbiturient);
    (dbNode as TDBNodeAbitStudObject).LoadData;
    Frame := TFmAbitCard;
    FFrame.RefreshFrame;
    Exit;
  end;

  if (dbNode is TDBNodeSpecZachObject) then
  begin
    Caption := TApplicationController.GetInstance.ProgramName +
      ' - [Абитуриенты]- Зачисление';
    Comment('Абитуриенты УГТУ', 'Специальность: ' + dbNode.Name);
    TApplicationController.GetInstance.AddLogEntry
      ('Кадр "Зачисление - специальность". Состояние: ' +
      StatusBar1.Panels.Items[0].Text + '/' + StatusBar1.Panels.Items[1].Text +
      '/' + StatusBar1.Panels.Items[2].Text);
    SetCurrentSearchPanel(sptAbiturient);
    Frame := TfmZach;
    FFrame.RefreshFrame;
    Exit;
  end;

  if (dbNode is TDBNodeFacRecObject) then
  begin
    CurrentTopic := 'A_Nabor_frame.htm';
    Caption := TApplicationController.GetInstance.ProgramName +
      ' - [Абитуриенты]- Набор';
    Comment('Абитуриенты УГТУ', 'Факультет: ' + dbNode.Name);
    TApplicationController.GetInstance.AddLogEntry
      ('Кадр "Набор - факультет". Состояние: ' + StatusBar1.Panels.Items[0].Text
      + '/' + StatusBar1.Panels.Items[1].Text + '/' +
      StatusBar1.Panels.Items[2].Text);
    SetCurrentSearchPanel(sptAbiturient);
    Frame := TfmAbitNabor;
    FFrame.RefreshFrame;
  end;

  if (dbNode is TDBNodeAbitYearObject) then
  begin
    CurrentTopic := 'A_Year_frame.htm';
    Caption := TApplicationController.GetInstance.ProgramName +
      ' - [Абитуриенты]- Год';
    Comment('Абитуриенты УГТУ',
      'Год: ' + inttostr(TDBNodeAbitYearObject(dbNode).ik));
    TApplicationController.GetInstance.AddLogEntry
      ('Абитуриент. Кадр "Год набора". Состояние: ' + StatusBar1.Panels.Items[0]
      .Text + '/' + StatusBar1.Panels.Items[1].Text + '/' +
      StatusBar1.Panels.Items[2].Text);
    SetCurrentSearchPanel(sptAbiturient);
    Frame := TfmAbitYears;
    FFrame.RefreshFrame;
  end;

  if (dbNode is TDBNodeSpecRecObject) then
  begin
    CurrentTopic := 'A_Nabor_frame.htm';
    Caption := TApplicationController.GetInstance.ProgramName +
      ' - [Абитуриенты]- Набор';
    Comment('Абитуриенты УГТУ', 'Специальность: ' + dbNode.Name);

    actAbitFilter.Visible := true;

    ActAbitExiled.Checked := (dbNode as TDBNodeSpecRecObject).ShowExiled;
    ActAbitMoved.Checked := (dbNode as TDBNodeSpecRecObject).ShowMoved;
    ActAbitCurrent.Checked := (dbNode as TDBNodeSpecRecObject).ShowCurrent;
    actAbitChecked.Checked := (dbNode as TDBNodeSpecRecObject).ShowChecked;

    TApplicationController.GetInstance.AddLogEntry
      ('Кадр "Набор - специальность". Состояние: ' + StatusBar1.Panels.Items[0]
      .Text + '/' + StatusBar1.Panels.Items[1].Text + '/' +
      StatusBar1.Panels.Items[2].Text);
    SetCurrentSearchPanel(sptAbiturient);
    Frame := TfmAbitNabor;
    FFrame.RefreshFrame;
  end;

  if (dbNode is TDBNodeScheduleObject) then
  begin
    CurrentTopic := 'A_Timetable_frame.htm';
    Caption := 'ИС "УГТУ" - [Абитуриенты - Расписание и результаты]';
    SetCurrentSearchPanel(sptAbiturient);
    Comment('Абитуриенты УГТУ', '');
    TApplicationController.GetInstance.AddLogEntry
      ('Кадр "Расписание". Состояние: ' + StatusBar1.Panels.Items[0].Text + '/'
      + StatusBar1.Panels.Items[1].Text + '/' + StatusBar1.Panels.Items
      [2].Text);
    Frame := TfmAbitRasp;
    FFrame.RefreshFrame;
  end;

  if (dbNode is TDBNodeInviteObject) then
  begin
    CurrentTopic := 'A_Timetable_frame.htm';
    Caption := 'ИС "УГТУ" - [Общежитие - Заселение]';
    Comment('Общежитие УГТУ', '');
    TApplicationController.GetInstance.AddLogEntry
      ('Кадр "Заселение". Состояние: ' + StatusBar1.Panels.Items[0].Text + '/' +
      StatusBar1.Panels.Items[1].Text + '/' + StatusBar1.Panels.Items[2].Text);
    Frame := TfmHOST_Zaselenie;
    FFrame.RefreshFrame;
  end;

  if (dbNode is TDBNodeInviteHostObject) then
  begin
    CurrentTopic := 'A_Timetable_frame.htm';
    Caption := 'ИС "УГТУ" - [Общежитие - Общежитие]';
    Comment('Общежитие УГТУ', '');
    TApplicationController.GetInstance.AddLogEntry
      ('Кадр "Заселение". Состояние: ' + StatusBar1.Panels.Items[0].Text + '/' +
      StatusBar1.Panels.Items[1].Text + '/' + StatusBar1.Panels.Items[2].Text);
    Frame := TfmHOST_Zaselenie;
    FFrame.RefreshFrame;
  end;

  if (dbNode is TDBNodeHabitatsObject) then
  begin
    CurrentTopic := 'A_Timetable_frame.htm';
    Caption := 'ИС "УГТУ" - [Общежитие - Проживающие]';
    Comment('Общежитие УГТУ', '');
    TApplicationController.GetInstance.AddLogEntry
      ('Кадр "Проживающие". Состояние: ' + StatusBar1.Panels.Items[0].Text + '/'
      + StatusBar1.Panels.Items[1].Text + '/' + StatusBar1.Panels.Items
      [2].Text);
    Frame := TfmHOST_Projivaysh;
    FFrame.RefreshFrame;
  end;

  if (dbNode is TDBNodeHabitatsPersonObject) then
  begin
    CurrentTopic := 'A_Timetable_frame.htm';
    Caption := 'ИС "УГТУ" - [Общежитие - Проживающие]';
    (dbNode as TDBNodeHabitatsPersonObject).LoadData;
    Frame := TfmPerson;
    // fmPerson.ncode:=(TDBNodeHabitatsPersonObject(DBDekTreeView_TEST1.Selected.Data).ncode);
    FFrame.FrameObject := dbNode;
    ActiveFrame.DataSet := (dbNode as TDBNodeHabitatsPersonObject).DataSet;
    Comment('Общежитие УГТУ', '');
    TApplicationController.GetInstance.AddLogEntry
      ('Кадр "Проживающие". Состояние: ' + StatusBar1.Panels.Items[0].Text + '/'
      + StatusBar1.Panels.Items[1].Text + '/' + StatusBar1.Panels.Items
      [2].Text);
    FFrame.RefreshFrame;
  end;

  if (dbNode is TDBNodeAdminObject) then
  begin
    Caption := TApplicationController.GetInstance.ProgramName +
      ' - [Администрирование]';
    Frame := TfmUsers;
    FFrame.RefreshFrame;
    Comment('Администрирование системы', 'Выбранный элемент: ' +
      (FFrame as TfmUsers).dbcbElement.Text);
    TApplicationController.GetInstance.AddLogEntry
      ('Кадр "Администрирование". Состояние: ' + StatusBar1.Panels.Items[0].Text
      + '/' + StatusBar1.Panels.Items[1].Text + '/' +
      StatusBar1.Panels.Items[2].Text);
    SetCurrentSearchPanel(sptNone);
  end;
  // ------------Журнал справок
  if (dbNode is TDBNodeSprObject) then
  begin
    Caption := TApplicationController.GetInstance.ProgramName +
      ' - [Журнал документов]';
    Frame := TfmDoc;
    FFrame.RefreshFrame;
    Comment('Журнал документов', 'Выбранный элемент: ');
    // + (FFrame as TfmSpr).dbcbElement.Text);
    TApplicationController.GetInstance.AddLogEntry
      ('Кадр "Журнал документов". Состояние: ' + StatusBar1.Panels.Items[0].Text
      + '/' + StatusBar1.Panels.Items[1].Text + '/' +
      StatusBar1.Panels.Items[2].Text);
    SetCurrentSearchPanel(sptNone);
          uDMDocuments.dmDocs.adodsDocs.Active := false; // подключам базу
  uDMDocuments.dmDocs.adodsDocs.Filtered := false; // фильтр
      dmDocs.adodsDocs.CommandText :=
    ('select * from MagazineDocs where (DateCreate>=''' +    //обновляем список документов
    DateTimeToStr(Date - 31) + '''and DateCreate <=''' +
    DateTimeToStr(Date) + ''')or DateCreate IS NULL order by DatePod');
      uDMDocuments.dmDocs.adodsDocs.Active := true; // подключам базу
  uDMDocuments.dmDocs.adodsDocs.Filtered := true; // фильтр
  end;
  // ------------
  if (dbNode is TDBNodeRecruitObject) then
  begin
    CurrentTopic := 'A_Nabor_frame.htm';
    Caption := TApplicationController.GetInstance.ProgramName +
      ' - [Абитуриенты - Набор]';
    Comment('Абитуриенты УГТУ', '');
    TApplicationController.GetInstance.AddLogEntry
      ('Абитуриент. Кадр "Набор". Состояние: ' + StatusBar1.Panels.Items[0].Text
      + '/' + StatusBar1.Panels.Items[1].Text + '/' +
      StatusBar1.Panels.Items[2].Text);
    SetCurrentSearchPanel(sptAbiturient);
    Frame := TfmAbitNabor;
    FFrame.RefreshFrame;
  end;

  if (dbNode is TDBNodeRootObject) then
  begin
    Frame := TfmUni;
    ActiveFrame.DataSet := (dbNode as TDBNodeRootObject).AdoDataset;
    Caption := TApplicationController.GetInstance.ProgramName + ' - [Деканат]';
    Comment('Деканаты УГТУ (факультетов: ' +
      inttostr((dbNode as TDBNodeRootObject).AdoDataset.RecordCount) + ')', '');
    TApplicationController.GetInstance.AddLogEntry
      ('Кадр подсистемы "Деканаты". Состояние: ' + StatusBar1.Panels.Items[0]
      .Text + '/' + StatusBar1.Panels.Items[1].Text + '/' +
      StatusBar1.Panels.Items[2].Text);
    SetCurrentSearchPanel(sptStudent);
  end;

  if (dbNode is TDBNodeRootScheduleObject) then
  begin
    Frame := TfmShedule;
    ActiveFrame.DataSet := (dbNode as TDBNodeRootScheduleObject).AdoDataset;
    Comment('Расписание УГТУ (семестров: ' +
      inttostr((dbNode as TDBNodeRootScheduleObject).AdoDataset.RecordCount)
      + ')', '');
    TApplicationController.GetInstance.AddLogEntry
      ('Кадр подсистемы "Расписание". Состояние: ' + StatusBar1.Panels.Items[0]
      .Text + '/' + StatusBar1.Panels.Items[1].Text + '/' +
      StatusBar1.Panels.Items[2].Text);
    FFrame.RefreshFrame;
    Caption := TApplicationController.GetInstance.ProgramName +
      ' - [Расписание]';
    SetCurrentSearchPanel(sptShedule);
    Exit;
  end;

  if (dbNode is TDBNodeSemesterScheduleObject) then
  begin
    Frame := TfmSheduleSemester;
    (ActiveFrame as TfmSheduleSemester).YearIK :=
      (dbNode as TDBNodeSemesterScheduleObject).IK_Year;
    (ActiveFrame as TfmSheduleSemester).SemIK :=
      (dbNode as TDBNodeSemesterScheduleObject).IK_Semtype;

    ActiveFrame.DataSet := (dbNode as TDBNodeSemesterScheduleObject).AdoDataset;
    Comment('Учебный семестр: ' + (dbNode as TDBNodeSemesterScheduleObject).Name
      + ' (факультетов: ' + inttostr((dbNode as TDBNodeSemesterScheduleObject)
      .AdoDataset.RecordCount) + ')', '');
    TApplicationController.GetInstance.AddLogEntry
      ('Расписание. Кадр "Семестр". Состояние: ' + StatusBar1.Panels.Items[0]
      .Text + '/' + StatusBar1.Panels.Items[1].Text + '/' +
      StatusBar1.Panels.Items[2].Text);
    FFrame.RefreshFrame;
    Caption := TApplicationController.GetInstance.ProgramName +
      ' - [Расписание - ' + (dbNode as TDBNodeSemesterScheduleObject)
      .Name + ']';
    SetCurrentSearchPanel(sptShedule);
    Exit;
  end;

  if (dbNode is TDBNodeFacultyScheduleObject) then
  begin
    Frame := TfmSheduleFac;
    ActiveFrame.DataSet := (dbNode as TDBNodeFacultyScheduleObject).AdoDataset;
    (ActiveFrame as TfmSheduleFac).ik :=
      (dbNode as TDBNodeFacultyScheduleObject).ik;
    (ActiveFrame as TfmSheduleFac).YearIK :=
      (dbNode as TDBNodeFacultyScheduleObject).IK_Year;
    (ActiveFrame as TfmSheduleFac).SemIK :=
      (dbNode as TDBNodeFacultyScheduleObject).IK_SemesterType;
    Comment((dbNode as TDBNodeFacultyScheduleObject).Name + ' (кафедр: ' +
      inttostr((dbNode as TDBNodeFacultyScheduleObject).AdoDataset.RecordCount)
      + ')', '');
    TApplicationController.GetInstance.AddLogEntry
      ('Расписание. Кадр "Факультет". Состояние: ' + StatusBar1.Panels.Items[0]
      .Text + '/' + StatusBar1.Panels.Items[1].Text + '/' +
      StatusBar1.Panels.Items[2].Text);
    FFrame.RefreshFrame;
    Caption := TApplicationController.GetInstance.ProgramName +
      ' - [Расписание - ' + (dbNode as TDBNodeFacultyScheduleObject).Name + ']';
    SetCurrentSearchPanel(sptShedule);
    Exit;
  end;

  if (dbNode is TDBNodeScheduledepartmentObject) then
  begin

    Frame := TfmSheduleDep;
    ActiveFrame.DataSet := (dbNode as TDBNodeScheduledepartmentObject)
      .AdoDataset;
    (ActiveFrame as TfmSheduleDep).ik :=
      (dbNode as TDBNodeScheduledepartmentObject).ik;
    (ActiveFrame as TfmSheduleDep).YearIK :=
      (dbNode as TDBNodeScheduledepartmentObject).IK_Year;
    (ActiveFrame as TfmSheduleDep).SemIK :=
      (dbNode as TDBNodeScheduledepartmentObject).IK_SemesterType;

    Comment((dbNode as TDBNodeScheduledepartmentObject).Name, '');
    TApplicationController.GetInstance.AddLogEntry
      ('Расписание. Кадр "Кафедра". Состояние: ' + StatusBar1.Panels.Items[0]
      .Text + '/' + StatusBar1.Panels.Items[1].Text + '/' +
      StatusBar1.Panels.Items[2].Text);
    FFrame.RefreshFrame;
    Caption := TApplicationController.GetInstance.ProgramName +
      ' - [Расписание - ' + (dbNode as TDBNodeScheduledepartmentObject)
      .Name + ']';
    SetCurrentSearchPanel(sptShedule);
    Exit;
  end;

  if (dbNode is TDBNodeBusinessObject) then
  begin
    CurrentTopic := 'Нагрузка\FrameNagr.htm';
    Frame := TfmNagruzkaMain;
    actChangeSemFilter.Visible := true;
    ActiveFrame.DataSet := (dbNode as TDBNodeBusinessObject).AdoDataset;
    Comment('Нагрузка УГТУ', '');
    TApplicationController.GetInstance.AddLogEntry
      ('Кадр подсистемы "Нагрузка". Состояние: ' + StatusBar1.Panels.Items[0]
      .Text + '/' + StatusBar1.Panels.Items[1].Text + '/' +
      StatusBar1.Panels.Items[2].Text);
    FFrame.RefreshFrame;
    Caption := TApplicationController.GetInstance.ProgramName + ' - [Нагрузка]';
    Exit;
  end;

  if (dbNode is TDBNodeSemesterNagrObject) then
  begin

    Frame := TfmNagruzkaSemester;
    (ActiveFrame as TfmNagruzkaSemester).YearIK :=
      (dbNode as TDBNodeSemesterNagrObject).IK_Year;
    (ActiveFrame as TfmNagruzkaSemester).SemIK :=
      (dbNode as TDBNodeSemesterNagrObject).IK_Semtype;
    ActiveFrame.DataSet := (dbNode as TDBNodeSemesterNagrObject).AdoDataset;
    Comment('Учебный семестр: ' + (dbNode as TDBNodeSemesterNagrObject).Name +
      ' (факультетов: ' + inttostr((dbNode as TDBNodeSemesterNagrObject)
      .AdoDataset.RecordCount) + ')', '');
    TApplicationController.GetInstance.AddLogEntry
      ('Нагрузка. Кадр "Учебный семестр". Состояние: ' + StatusBar1.Panels.Items
      [0].Text + '/' + StatusBar1.Panels.Items[1].Text + '/' +
      StatusBar1.Panels.Items[2].Text);
    FFrame.RefreshFrame;
    Caption := TApplicationController.GetInstance.ProgramName +
      ' - [Нагрузка - ' + (dbNode as TDBNodeSemesterNagrObject).Name + ']';
    SetCurrentSearchPanel(sptPrepod);
    Exit;
  end;

  if (dbNode is TDBNodeFacultyDepObject) then
  begin
    CurrentTopic := 'Нагрузка\FrameFac.htm';
    Frame := TfmNagruzkaFac;
    ActiveFrame.DataSet := (dbNode as TDBNodeFacultyDepObject).AdoDataset;
    (ActiveFrame as TfmNagruzkaFac).ik :=
      (dbNode as TDBNodeFacultyDepObject).ik;
    (ActiveFrame as TfmNagruzkaFac).YearIK :=
      (dbNode as TDBNodeFacultyDepObject).IK_Year;
    (ActiveFrame as TfmNagruzkaFac).SemIK := (dbNode as TDBNodeFacultyDepObject)
      .IK_Semtype;
    Comment((dbNode as TDBNodeFacultyDepObject).Name + ' (кафедр: ' +
      inttostr((dbNode as TDBNodeFacultyDepObject).AdoDataset.RecordCount)
      + ')', '');
    TApplicationController.GetInstance.AddLogEntry
      ('Нагрузка. Кадр "Факультет". Состояние: ' + StatusBar1.Panels.Items[0]
      .Text + '/' + StatusBar1.Panels.Items[1].Text + '/' +
      StatusBar1.Panels.Items[2].Text);
    FFrame.RefreshFrame;
    Caption := TApplicationController.GetInstance.ProgramName +
      ' - [Нагрузка - ' + (dbNode as TDBNodeFacultyDepObject).Name + ']';
    SetCurrentSearchPanel(sptNone);
    actFilterKaf.Visible := true;
    Exit;
  end;

  if (dbNode is TDBNodeMethodWorkObject) then
  begin
    Frame := TfmMethodWork;
    ActiveFrame.DataSet := (dbNode as TDBNodeMethodWorkObject).AdoDataset;
    FFrame.RefreshFrame;
    Caption := TApplicationController.GetInstance.ProgramName +
      ' - [Учебно-методическая работа]';
    Comment('Учебно-методическая работа УГТУ (факультетов: ' +
      inttostr((dbNode as TDBNodeMethodWorkObject).AdoDataset.RecordCount)
      + ')', '');
    TApplicationController.GetInstance.AddLogEntry
      ('Кадр подсистемы "УМР". Состояние: ' + StatusBar1.Panels.Items[0].Text +
      '/' + StatusBar1.Panels.Items[1].Text + '/' +
      StatusBar1.Panels.Items[2].Text);
    SetCurrentSearchPanel(sptMethodWork);
    Exit;
  end;

  if (dbNode is TDBNodeMetodWorkFacultyObject) then
  begin
    Frame := TfmMethodWorkFac;
    ActiveFrame.DataSet := (dbNode as TDBNodeMetodWorkFacultyObject).AdoDataset;
    // (ActiveFrame as TfmMethodWorkFac).IK:= (dbNode as TDBNodeFacultyDepObject).ik;
    FFrame.RefreshFrame;
    Caption := TApplicationController.GetInstance.ProgramName +
      ' - [Учебно-методическая работа - ' +
      (dbNode as TDBNodeMetodWorkFacultyObject).Name + ']';
    Comment((dbNode as TDBNodeMetodWorkFacultyObject).Name + ' (кафедр: ' +
      inttostr((dbNode as TDBNodeMetodWorkFacultyObject).AdoDataset.RecordCount)
      + ')', '');
    TApplicationController.GetInstance.AddLogEntry
      ('УМР. Кадр "Факультет". Состояние: ' + StatusBar1.Panels.Items[0].Text +
      '/' + StatusBar1.Panels.Items[1].Text + '/' +
      StatusBar1.Panels.Items[2].Text);
    SetCurrentSearchPanel(sptMethodWork);
    Exit;
  end;

  if (dbNode is TDBNodeMethodWorkDepartmentObject) then
  begin
    Frame := TfmMethodWorkDep;
    ActiveFrame.DataSet := (dbNode as TDBNodeMethodWorkDepartmentObject)
      .AdoDataset;
    // (ActiveFrame as TfmMethodWorkDep).IK:= (dbNode as TDBNodeMethodWorkDepartmentObject).ik;
    FFrame.RefreshFrame;
    Caption := TApplicationController.GetInstance.ProgramName +
      ' - [Учебно-методическая работа - ' +
      (dbNode as TDBNodeMethodWorkDepartmentObject).Name + ']';
    Comment((dbNode as TDBNodeMethodWorkDepartmentObject).Name +
      ' (преподавателей: ' +
      inttostr((dbNode as TDBNodeMethodWorkDepartmentObject)
      .AdoDataset.RecordCount) + ')', '');
    TApplicationController.GetInstance.AddLogEntry
      ('УМР. Кадр "Кафедра". Состояние: ' + StatusBar1.Panels.Items[0].Text +
      '/' + StatusBar1.Panels.Items[1].Text + '/' +
      StatusBar1.Panels.Items[2].Text);
    SetCurrentSearchPanel(sptMethodWork);
    Exit;
  end;

  if (dbNode is TDBNodeMethodWorkTeacherObject) then
  begin
    Frame := TfmMethodWorkPrep;
    FFrame.RefreshFrame;
    Caption := TApplicationController.GetInstance.ProgramName +
      ' - [Учебно-методическая работа - ' +
      Trim((dbNode as TDBNodeMethodWorkTeacherObject).LastName) + ' ' +
      Trim((dbNode as TDBNodeMethodWorkTeacherObject).FirstName) + ' ' +
      Trim((dbNode as TDBNodeMethodWorkTeacherObject).MiddleName) + ']';
    TApplicationController.GetInstance.AddLogEntry
      ('УМР. Кадр "Преподаватель". Состояние: ' + StatusBar1.Panels.Items[0]
      .Text + '/' + StatusBar1.Panels.Items[1].Text + '/' +
      StatusBar1.Panels.Items[2].Text);
    SetCurrentSearchPanel(sptMethodWork);
    Exit;
  end;
  // -----------------------------------------

  if (dbNode is TDBNodedepartmentObject) then
  begin
    CurrentTopic := 'Нагрузка\FrameDep.htm';
    Frame := TfmNagruzkaDep;
    ActiveFrame.DataSet := (dbNode as TDBNodedepartmentObject).AdoDataset;
    (ActiveFrame as TfmNagruzkaDep).ik :=
      (dbNode as TDBNodedepartmentObject).ik;
    (ActiveFrame as TfmNagruzkaDep).YearIK :=
      (dbNode as TDBNodedepartmentObject).IK_Year;
    (ActiveFrame as TfmNagruzkaDep).SemIK := (dbNode as TDBNodedepartmentObject)
      .IK_Semtype;
    case (dbNode as TDBNodedepartmentObject).FilterType of
      ttvfShowAll:
        prepFilterAction := actPFShowAll;
      ttvfShowUnreleased:
        prepFilterAction := actPFShowWorked;
      ttvfShowReleased:
        prepFilterAction := actPFShowReleased;
    end;
    actPrepodsFilter.Hint := 'Фильтр преподавателей: ' +
      AnsiLowerCase((prepFilterAction as TAction).Caption);
    actPrepodsFilter.Caption := (prepFilterAction as TAction).Caption;
    actPrepodsFilter.Tag := (prepFilterAction as TAction).Tag;
    prepFilterAction.Checked := true;
    Comment((dbNode as TDBNodedepartmentObject).Name + ' (преподавателей: ' +
      inttostr((dbNode as TDBNodedepartmentObject).AdoDataset.RecordCount)
      + ')', '');
    TApplicationController.GetInstance.AddLogEntry
      ('Нагрузка. Кадр "Кафедра". Состояние: ' + StatusBar1.Panels.Items[0].Text
      + '/' + StatusBar1.Panels.Items[1].Text + '/' +
      StatusBar1.Panels.Items[2].Text);
    FFrame.RefreshFrame;
    Caption := TApplicationController.GetInstance.ProgramName +
      ' - [Нагрузка - ' + (dbNode as TDBNodedepartmentObject).Name + ']';
    SetCurrentSearchPanel(sptNone);
    actPrepodsFilter.Visible := true;
    Exit;
  end;

  if (dbNode is TDBNodeTeacherObject) then
  begin
    CurrentTopic := 'FramePrep.htm';
    Frame := TfmNagruzkaPrepAllInfo;
    (ActiveFrame as TfmNagruzkaPrepAllInfo).ik :=
      (dbNode as TDBNodeTeacherObject).ik;
    (ActiveFrame as TfmNagruzkaPrepAllInfo).KafIK :=
      (dbNode as TDBNodeTeacherObject).KafIK;
    (ActiveFrame as TfmNagruzkaPrepAllInfo).YearIK :=
      (dbNode as TDBNodeTeacherObject).IK_Year;
    (ActiveFrame as TfmNagruzkaPrepAllInfo).SemIK :=
      (dbNode as TDBNodeTeacherObject).IK_Semtype;
    Comment(Trim((dbNode as TDBNodeTeacherObject).LastName) + ' ' +
      Trim((dbNode as TDBNodeTeacherObject).FirstName) + ' ' +
      Trim((dbNode as TDBNodeTeacherObject).MiddleName), '');
    TApplicationController.GetInstance.AddLogEntry
      ('Нагрузка. Кадр "Преподаватель". Состояние: ' + StatusBar1.Panels.Items
      [0].Text + '/' + StatusBar1.Panels.Items[1].Text + '/' +
      StatusBar1.Panels.Items[2].Text);
    FFrame.RefreshFrame;
    Caption := TApplicationController.GetInstance.ProgramName +
      ' - [Нагрузка - ' + Trim((dbNode as TDBNodeTeacherObject).LastName) + ' '
      + Trim((dbNode as TDBNodeTeacherObject).FirstName) + ' ' +
      Trim((dbNode as TDBNodeTeacherObject).MiddleName) + ']';
    SetCurrentSearchPanel(sptNone);
    Exit;
  end;

  if (dbNode is TDBNodeWorkTypeObject) then
  begin
    Frame := TfmNagruzkaPrepAllInfo;
    (ActiveFrame as TfmNagruzkaPrepAllInfo).ik :=
      (dbNode as TDBNodeWorkTypeObject).iTab_n;
    (ActiveFrame as TfmNagruzkaPrepAllInfo).KafIK :=
      (dbNode as TDBNodeWorkTypeObject).KafIK;
    (ActiveFrame as TfmNagruzkaPrepAllInfo).YearIK :=
      (dbNode as TDBNodeWorkTypeObject).IK_Year;
    (ActiveFrame as TfmNagruzkaPrepAllInfo).SemIK :=
      (dbNode as TDBNodeWorkTypeObject).IK_Semtype;
    (ActiveFrame as TfmNagruzkaPrepAllInfo).NeedTeacherIK :=
      (dbNode as TDBNodeWorkTypeObject).ik;
    Comment(Trim(TDBNodeTeacherObject(frmMain.DBDekTreeView_TEST1.Selected.
      Parent.data).LastName) + ' ' +
      Trim(TDBNodeTeacherObject(frmMain.DBDekTreeView_TEST1.Selected.Parent.
      data).FirstName) + ' ' +
      Trim(TDBNodeTeacherObject(frmMain.DBDekTreeView_TEST1.Selected.Parent.
      data).MiddleName) + ' - ' + (dbNode as TDBNodeWorkTypeObject)
      .ShortName, '');
    TApplicationController.GetInstance.AddLogEntry
      ('Нагрузка. Кадр "Вид работы". Состояние: ' + StatusBar1.Panels.Items[0]
      .Text + '/' + StatusBar1.Panels.Items[1].Text + '/' +
      StatusBar1.Panels.Items[2].Text);
    Caption := TApplicationController.GetInstance.ProgramName +
      ' - [Нагрузка - ' +
      Trim(TDBNodeTeacherObject(frmMain.DBDekTreeView_TEST1.Selected.Parent.
      data).LastName) + ' ' +
      Trim(TDBNodeTeacherObject(frmMain.DBDekTreeView_TEST1.Selected.Parent.
      data).FirstName) + ' ' +
      Trim(TDBNodeTeacherObject(frmMain.DBDekTreeView_TEST1.Selected.Parent.
      data).MiddleName) + ' - ' + (dbNode as TDBNodeWorkTypeObject)
      .ShortName + ']';
    FFrame.RefreshFrame;
    SetCurrentSearchPanel(sptNone);
    Exit;
  end;

  if (dbNode is TDBNodePrikObject) then
  begin
    CurrentTopic := 'Order_frame.htm';
    // frmMain.HelpKeyword:='Приказы';
    Frame := TfmPrik;
    FFrame.RefreshFrame;
    Comment('Приказы (приказов: ' + inttostr((FFrame as TfmPrik)
      .dbgePrik.DataSource.DataSet.RecordCount) + ')', '');
    TApplicationController.GetInstance.AddLogEntry
      ('Кадр подсистемы "Приказы". Состояние: ' + StatusBar1.Panels.Items[0]
      .Text + '/' + StatusBar1.Panels.Items[1].Text + '/' +
      StatusBar1.Panels.Items[2].Text);
    SetCurrentSearchPanel(sptNone);
    Caption := TApplicationController.GetInstance.ProgramName + ' - [Приказы]';
  end;

  if (dbNode is TDBNodeGroupObject) then
  begin
    CurrentTopic := 'Group_frame.htm';
    // frmMain.HelpKeyword:='Группа';
    dbNode.AddChildNodes;
    Frame := TfmGroup;
    ndGroup := (dbNode as TDBNodeGroupObject);
    ActiveFrame.DataSet := ndGroup.AdoDataset;
    (ActiveFrame as TfmGroup).ik := ndGroup.ik;
    tempStoredProc := TADOStoredProc.Create(nil);
    tempStoredProc.ProcedureName := 'GetUchPlanForCurGroup';
    tempStoredProc.Parameters.CreateParameter('@ik_group', ftInteger, pdInput,
      0, ndGroup.ik);
    tempStoredProc.Connection := dm.DBConnect;
    tempStoredProc.Open;
    if ndGroup.AdoDataset <> nil then
      Comment('Группа: ' + dbNode.Name + ' (студентов: ' +
        inttostr(ndGroup.AdoDataset.RecordCount) + ')',
        'Учебный план: ' + tempStoredProc.FieldByName('CName').AsString);
    TApplicationController.GetInstance.AddLogEntry
      ('Деканат. Кадр "Группа". Состояние: ' + StatusBar1.Panels.Items[0].Text +
      '/' + StatusBar1.Panels.Items[1].Text + '/' +
      StatusBar1.Panels.Items[2].Text);
    tempStoredProc.Close;
    tempStoredProc.Free;
    Caption := TApplicationController.GetInstance.ProgramName + ' - [Деканат - '
      + dbNode.Name + ']';
    SetCurrentSearchPanel(sptStudent);
    FFrame.RefreshFrame;
    // (ActiveFrame as TfmGroup).dbgrdVed.PopupMenu := ppmStudent;
    // ------обработка ShowStudent  (с) SERG
    actShowStud.Visible := true;
    if (dbNode as TDBNodeGroupObject).ShowStudents = ssShowAll then
    begin
      actShowStud.Caption := actShowAllStudent.Caption;
      actShowAllStudent.Checked := true
    end
    else if (dbNode as TDBNodeGroupObject).ShowStudents = ssShowExiledOnly then
    begin
      actShowStud.Caption := actShowOtchislStudent.Caption;
      actShowOtchislStudent.Checked := true
    end
    else if (dbNode as TDBNodeGroupObject).ShowStudents = ssShowAcademOnly then
    begin
      actShowStud.Caption := actShowAcademStudent.Caption;
      actShowAcademStudent.Checked := true
    end
    else
    begin
      actShowStud.Caption := actShowUnOtchislStudent.Caption;
      actShowUnOtchislStudent.Checked := true;
    end;
    // -----------------------------
    if (dbNode.Parent as TDBNodeSpecObject).showActual = true then
    begin
      actFilterGroup.Caption := actFilterActual.Caption;
      actFilterActual.Checked := true
    end
    else
    begin
      actFilterGroup.Caption := actFilterAll.Caption;
      actFilterAll.Checked := true
    end;

    Exit;
  end;

  if (dbNode is TDBNodeDictObject) then
  begin
    CurrentTopic := 'Sprav_frame.htm';
    // frmMain.HelpKeyword:='Справочники';
    Frame := TfmSprav;
    SetCurrentSearchPanel(sptNone);
    Caption := TApplicationController.GetInstance.ProgramName +
      ' - [Справочники]';
    Comment('Справочники (справочников: ' + inttostr((FFrame as TfmSprav)
      .cbSprav.Items.Count) + ')', 'Выбранный справочник: ' +
      (FFrame as TfmSprav).cbSprav.Text);
    TApplicationController.GetInstance.AddLogEntry
      ('Кадр "Справочники". Состояние: ' + StatusBar1.Panels.Items[0].Text + '/'
      + StatusBar1.Panels.Items[1].Text + '/' + StatusBar1.Panels.Items
      [2].Text);
  end;

  if (dbNode is TDBNodeOKObject) then
  begin
    // CurrentTopic:='Sprav_frame.htm';
    // frmMain.HelpKeyword:='Справочники';
    Frame := TfmDiplomOtdKadr;
    SetCurrentSearchPanel(sptNone);
    Caption := TApplicationController.GetInstance.ProgramName +
      ' - [Отдел кадров]';
    Comment('Отдел кадров - дипломы', '');
    TApplicationController.GetInstance.AddLogEntry
      ('Кадр "Отдел кадров". Состояние: ' + StatusBar1.Panels.Items[0].Text +
      '/' + StatusBar1.Panels.Items[1].Text + '/' +
      StatusBar1.Panels.Items[2].Text);
  end;

  if (dbNode is TDBNodeFacultyObject) then
  begin
    CurrentTopic := 'Faculties_management.htm';
    // frmMain.HelpKeyword:='Факультет';
    Frame := TfmFacultet;
    ndFac := (dbNode as TDBNodeFacultyObject);
    ActiveFrame.DataSet := ndFac.AdoDataset;
    (ActiveFrame as TfmFacultet).ik := ndFac.ik;
    Comment('Факультет: ' + (dbNode as TDBNodeFacultyObject).Name +
      ' (специальностей: ' + inttostr(ndFac.AdoDataset.RecordCount) + ')', '');
    TApplicationController.GetInstance.AddLogEntry
      ('Деканат. Кадр "Факультет". Состояние: ' + StatusBar1.Panels.Items[0]
      .Text + '/' + StatusBar1.Panels.Items[1].Text + '/' +
      StatusBar1.Panels.Items[2].Text);
    FFrame.RefreshFrame;
    (ActiveFrame as TfmFacultet).tsSessia.ActivePageIndex := 0;
    SetCurrentSearchPanel(sptStudent);
    Caption := TApplicationController.GetInstance.ProgramName + ' - [Деканат - '
      + (dbNode as TDBNodeFacultyObject).Name + ']';
    Exit;
  end;

  if (dbNode is TDBNodeSpecObject) then
  begin
    if alreadySpec then
    begin
      alreadySpec := false;
      Exit;
    end;

    CurrentTopic := 'Spec_frame.htm';
    // frmMain.HelpKeyword:='Специальность';
    Frame := TfmSpec;
    ndSpec := (dbNode as TDBNodeSpecObject);
    SetCurrentSearchPanel(sptStudent);
    ActiveFrame.DataSet := ndSpec.AdoDataset;
    if not(ActiveFrame is TfmSpec) then
      Exit;

    (ActiveFrame as TfmSpec).ik := ndSpec.ik;
    Comment('Специальность: ' + dbNode.Name + ' (групп: ' +
      inttostr(ndSpec.AdoDataset.RecordCount) + ')', '');
    TApplicationController.GetInstance.AddLogEntry
      ('Деканат. Кадр "Специальность". Состояние: ' + StatusBar1.Panels.Items[0]
      .Text + '/' + StatusBar1.Panels.Items[1].Text + '/' +
      StatusBar1.Panels.Items[2].Text);
    FFrame.RefreshFrame;
    Caption := TApplicationController.GetInstance.ProgramName + ' - [Деканат - '
      + dbNode.Name + ']';
    // ------обработка ShowStudent  (с) SERG
    actShowStud.Visible := true;
    if (dbNode as TDBNodeSpecObject).ShowStudents = ssShowAll then
    begin
      actShowStud.Caption := actShowAllStudent.Caption;
      actShowAllStudent.Checked := true
    end
    else if (dbNode as TDBNodeSpecObject).ShowStudents = ssShowExiledOnly then
    begin
      actShowStud.Caption := actShowOtchislStudent.Caption;
      actShowOtchislStudent.Checked := true
    end
    else if (dbNode as TDBNodeSpecObject).ShowStudents = ssShowAcademOnly then
    begin
      actShowStud.Caption := actShowAcademStudent.Caption;
      actShowAcademStudent.Checked := true
    end
    else
    begin
      actShowStud.Caption := actShowUnOtchislStudent.Caption;
      actShowUnOtchislStudent.Checked := true;
    end;

    if (dbNode as TDBNodeSpecObject).showActual = true then
    begin
      actFilterGroup.Caption := actFilterActual.Caption;
      actFilterActual.Checked := true
    end
    else
    begin
      actFilterGroup.Caption := actFilterAll.Caption;
      actFilterAll.Checked := true
    end;
    actFilterGroup.Visible := true;
    // -----------------------------
    Exit;
  end;
  if (dbNode is TDBNodeStudObject) then
  begin
    CurrentTopic := 'Student_frame.htm';
    // frmMain.HelpKeyword:='Студент';
    (dbNode as TDBNodeStudObject).LoadData;
    Frame := TfmStudent;
    FFrame.Hint :=
      inttostr(TDBNodeGroupObject(DBDekTreeView_TEST1.Selected.Parent.data).ik);
    FFrame.FrameObject := dbNode;
    ActiveFrame.DataSet := (dbNode as TDBNodeStudObject).AdoDataset;
    tempStoredProc := TADOStoredProc.Create(nil);
    tempStoredProc.ProcedureName := 'GetCurrentKurs_Semestr';
    tempStoredProc.Parameters.CreateParameter('@ik_group', ftInteger, pdInput,
      0, strtoint(FFrame.Hint));
    tempStoredProc.Connection := dm.DBConnect;
    tempStoredProc.Open;
    if tempStoredProc.FieldByName('kurs').IsNull then
      tempstring := 'Выпускник'
    else
      tempstring := tempStoredProc.FieldByName('kurs').AsString + ' курс, ' +
        tempStoredProc.FieldByName('semestr').AsString + ' семестр';
    Comment(Trim((dbNode as TDBNodeStudObject).LastName) + ' ' +
      Trim((dbNode as TDBNodeStudObject).FirstName) + ' ' +
      Trim((dbNode as TDBNodeStudObject).MiddleName), tempstring);
    TApplicationController.GetInstance.AddLogEntry
      ('Деканат. Кадр "Студент". Состояние: ' + StatusBar1.Panels.Items[0].Text
      + '/' + StatusBar1.Panels.Items[1].Text + '/' +
      StatusBar1.Panels.Items[2].Text);
    FFrame.RefreshFrame;
    SetCurrentSearchPanel(sptStudent);
    Caption := TApplicationController.GetInstance.ProgramName + ' - [Деканат - '
      + Trim((dbNode as TDBNodeStudObject).LastName) + ' ' +
      Trim((dbNode as TDBNodeStudObject).FirstName) + ' ' +
      Trim((dbNode as TDBNodeStudObject).MiddleName) + ']';
    Exit;
  end;
end;

procedure TfrmMain.SpeedButton4Click(Sender: TObject);
begin
  Frame := TfmSprav;
end;

procedure TfrmMain.rbShowAllClick(Sender: TObject);
begin
  DBDekTreeView_TEST1.RefreshExecute(Sender);
end;

procedure TfrmMain.actTreeRefreshActionExecute(Sender: TObject);
var
  dbNode: TDBnodeObject;
begin
  dbNode := DBDekTreeView_TEST1.Selected.data;
  if dbNode is TDBNodeGroupObject then
  begin
    if actShowAllStudent.Checked then
    begin
      TDBNodeGroupObject(dbNode).ShowStudents := ssShowAll;
      actShowStud.Caption := actShowAllStudent.Caption;
    end
    else if actShowAcademStudent.Checked then
    begin
      TDBNodeGroupObject(dbNode).ShowStudents := ssShowAcademOnly;
      actShowStud.Caption := actShowAcademStudent.Caption;
    end
    else if actShowOtchislStudent.Checked then
    begin
      TDBNodeGroupObject(dbNode).ShowStudents := ssShowExiledOnly;
      actShowStud.Caption := actShowOtchislStudent.Caption;
    end
    else
    begin
      TDBNodeGroupObject(dbNode).ShowStudents := ssShowActualOnly;
      actShowStud.Caption := actShowUnOtchislStudent.Caption;
    end;
  end;

  if dbNode is TDBNodeAbitObject then
  begin
    if actFilterAllYear.Checked then
    begin
      TDBNodeAbitObject(dbNode).ShowAllYears := true;
      actYearFilter.Caption := actFilterAllYear.Caption;
    end
    else if ActCurFilter.Checked then
    begin
      TDBNodeAbitObject(dbNode).ShowAllYears := false;
      actYearFilter.Caption := ActCurFilter.Caption;
    end;
  end;

  if dbNode is TDBNodeSpecRecObject then
  begin
    (dbNode as TDBNodeSpecRecObject).ShowExiled := ActAbitExiled.Checked;
    (dbNode as TDBNodeSpecRecObject).ShowMoved := ActAbitMoved.Checked;
    (dbNode as TDBNodeSpecRecObject).ShowCurrent := ActAbitCurrent.Checked;
    (dbNode as TDBNodeSpecRecObject).ShowChecked := actAbitChecked.Checked;

    if actShowPrimary.Checked then
      actShowReal.Checked := true;

    (dbNode as TDBNodeSpecRecObject).ShowReal := actShowReal.Checked;
    (dbNode as TDBNodeSpecRecObject).ShowPrimary := actShowPrimary.Checked;
    (dbNode as TDBNodeSpecRecObject).ShowSecondary := actShowSecondary.Checked;

    if not((dbNode as TDBNodeSpecRecObject).ShowReal or
      (dbNode as TDBNodeSpecRecObject).ShowSecondary) then
    begin
      (dbNode as TDBNodeSpecRecObject).ShowReal := true;
      actShowReal.Checked := true;
    end;

    if not((dbNode as TDBNodeSpecRecObject).ShowExiled or
      (dbNode as TDBNodeSpecRecObject).ShowMoved or
      (dbNode as TDBNodeSpecRecObject).ShowCurrent or
      (dbNode as TDBNodeSpecRecObject).ShowChecked) then
    begin
      (dbNode as TDBNodeSpecRecObject).ShowCurrent := true;
      ActAbitCurrent.Checked := true;
    end;

  end;

  if dbNode is TDBNodeSpecObject then
  begin
    if actShowAllStudent.Checked then
    begin
      TDBNodeSpecObject(dbNode).ShowStudents := ssShowAll;
      actShowStud.Caption := actShowAllStudent.Caption;
    end
    else if actShowAcademStudent.Checked then
    begin
      TDBNodeSpecObject(dbNode).ShowStudents := ssShowAcademOnly;
      actShowStud.Caption := actShowAcademStudent.Caption;
    end
    else if actShowOtchislStudent.Checked then
    begin
      TDBNodeSpecObject(dbNode).ShowStudents := ssShowExiledOnly;
      actShowStud.Caption := actShowOtchislStudent.Caption;
    end
    else
    begin
      TDBNodeSpecObject(dbNode).ShowStudents := ssShowActualOnly;
      actShowStud.Caption := actShowUnOtchislStudent.Caption;
    end;
  end;

  if (dbNode is TDBNodeBusinessObject) then
  begin
    if actAllSem.Checked then
    begin
      TDBNodeBusinessObject(dbNode).showActual := false;
      actChangeSemFilter.Caption := actAllSem.Caption;
    end
    else if actCurrentSem.Checked then
    begin
      TDBNodeBusinessObject(dbNode).showActual := true;
      actChangeSemFilter.Caption := actCurrentSem.Caption;
    end;
  end;

  if (dbNode is TDBNodeSpecObject) then
  begin
    if actFilterAll.Checked then
    begin
      TDBNodeSpecObject(dbNode).showActual := false;
      actFilterGroup.Caption := actFilterAll.Caption;
    end
    else if actFilterActual.Checked then
    begin
      TDBNodeSpecObject(dbNode).showActual := true;
      actFilterGroup.Caption := actFilterActual.Caption;
    end;
  end;

  if (dbNode is TDBNodeGroupObject) then
  begin
    if actFilterAll.Checked then
    begin
      actFilterGroup.Caption := actFilterAll.Caption;
    end
    else if actFilterActual.Checked then
    begin
      actFilterGroup.Caption := actFilterActual.Caption;
    end;

  end;

  if dbNode is TDBNodeFacultyDepObject then
  begin
    if actAllKaf.Checked then
    begin
      TDBNodeFacultyDepObject(dbNode).ShowAllKaf := true;
      actFilterKaf.Caption := actAllKaf.Caption;
    end
    else
    begin
      TDBNodeFacultyDepObject(dbNode).ShowAllKaf := false;
      actFilterKaf.Caption := actCurrentKaf.Caption;
    end;
  end;

  if dbNode <> nil then
    DBDekTreeView_TEST1.RefreshNodeExecute(DBDekTreeView_TEST1.Selected);
  // FFrame.RefreshFrame;
end;

procedure TfrmMain.DBDekTreeView_TEST1Collapsing(Sender: TObject;
  Node: TTreeNode; var AllowCollapse: Boolean);
begin
  Node.ImageIndex := TDBnodeObject(Node.data).BaseImageIndex;
end;

procedure TfrmMain.DBDekTreeView_TEST1ContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
  ik: Integer;
  temp: TADODataSet;
  fl: Boolean;
begin
  if (DBDekTreeView_TEST1.SelectedObject is TDBNodeGroupObject) then
  begin
    ik := TDBNodeGroupObject(DBDekTreeView_TEST1.Selected.data).ik;
    temp := TADODataSet.Create(nil);
    temp.CommandText :=
      'select Form_ed.Ik_form_ed from Grup  inner join Relation_spec_fac ' +
      'on Grup.ik_spec_fac= Relation_spec_fac.ik_spec_fac' +
      ' inner join Form_ed on Relation_spec_fac.Ik_form_ed =' +
      'Form_ed.Ik_form_ed where Ik_grup=' + ik.ToString();
    temp.Connection := dm.DBConnect;
    temp.Open;
    temp.First;
    fl := (temp.FieldByName('Ik_form_ed').AsInteger = 2);
    actCallSpr.Visible := fl;
    actNotification.Visible := fl;
    actCallSpr.Enabled := fl;
    actNotification.Enabled := fl
  end;
end;

procedure TfrmMain.DBDekTreeView_TEST1DblClick(Sender: TObject);
begin
  DBDekTreeView_TEST1Change(Sender, DBDekTreeView_TEST1.Selected);
end;

procedure TfrmMain.DBDekTreeView_TEST1Expanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
begin
  DBDekTreeView_TEST1.Select(Node);
  Node.ImageIndex := TDBnodeObject(Node.data).BaseImageIndex + 1;
end;

procedure TfrmMain.actAddUchPlanUpdate(Sender: TObject);
begin
  if (ActiveFrame is TfmSpec) then
    (Sender as TAction).Enabled := (ActiveFrame as TfmSpec)
      .fmUchPlan1.ActionAddUchPlan.Enabled;
end;

procedure TfrmMain.actAddZayavExecute(Sender: TObject);

begin
  AddZayav := TAddZayav.Create(self);
  AddZayav.NumHost := TDBNodeInviteHostObject
    (DBDekTreeView_TEST1.Selected.data).ik;
  AddZayav.ShowModal;
  AddZayav.Free;
  ActiveFrame.RefreshFrame;

end;

procedure TfrmMain.actAddUchPlanExecute(Sender: TObject);
begin
  if (ActiveFrame is TfmSpec) then
    (ActiveFrame as TfmSpec).fmUchPlan1.ActionEditUchPlanExecute
      ((ActiveFrame as TfmSpec).fmUchPlan1.ActionAddUchPlan);
end;

procedure TfrmMain.N36Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.actFilleMenuUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := true;
end;

procedure TfrmMain.actFileExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.actSpravExecute(Sender: TObject);
begin
  Frame := TfmSprav;
end;

procedure TfrmMain.Comment(str1, str2: String);
begin
  StatusBar1.Panels.Items[0].Text := str1;
  StatusBar1.Panels.Items[1].Text := str2;
  StatusBar1.Panels.Items[2].Text := TApplicationController.GetInstance.
    ServerName + ' (' + TApplicationController.GetInstance.DBName + '; ' +
    TApplicationController.GetInstance.LoginName + ')';
end;

procedure TfrmMain.actAddStudentFormShowExecute(Sender: TObject);
var
  group: TDBNodeGroupObject;
begin
  group := TDBNodeGroupObject(DBDekTreeView_TEST1.SelectedObject);
  ftmStudent := TftmStudent.Create(self);
  ftmStudent.Tag := group.ik;
  ftmStudent.Caption := 'Добавление студента в группу ' + group.Name;
  ftmStudent.ShowModal;
  ftmStudent.Free;
end;

procedure TfrmMain.DBDekTreeView_TEST1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Node: TTreeNode;
begin
  { Node:=(sender as TTreeView).GetNodeAt(X, Y);
    if node=nil then exit;
    if not Node.Selected then begin
    Node.Selected:=true; }
  { (sender as TTreeView).Select(node);
    end; }
end;

procedure TfrmMain.actDeleteStudentExecute(Sender: TObject);
begin
  if MessageBox(Handle, PWideChar('Вы действительно хотите удалить студента?'),
    'ИС УГТУ', MB_YESNO) = IDYES then
  begin
    dmStudentActions.aspDelStud.Parameters.Clear;
    dmStudentActions.aspDelStud.Parameters.AddParameter;
    dmStudentActions.aspDelStud.Parameters[0].Value :=
      TDBNodeStudObject(DBDekTreeView_TEST1.SelectedObject).id;
    dmStudentActions.aspDelStud.ExecProc;
    DBDekTreeView_TEST1.RefreshNodeExecute(DBDekTreeView_TEST1.Selected.Parent);
  end;
end;

procedure TfrmMain.actCollapseAllExecute(Sender: TObject);
begin
  DBDekTreeView_TEST1.Selected.Collapse(true);
end;

procedure TfrmMain.actRefreshDSinFrameExecute(Sender: TObject);
begin
  actTreeRefreshAction.Execute;
  if FFrame.DataSet <> nil then
  begin
  FFrame.RefreshFrame;
    { FFrame.DataSet.Active:=false;
      FFrame.DataSet.Active:=true; }
  end;
end;

procedure TfrmMain.actAddGroupExecute(Sender: TObject);
begin
  if (ActiveFrame is TfmSpec) then
    (ActiveFrame as TfmSpec).actAddGroupExecute(nil)
  else

  begin
    frmGroupEdt := TfrmGroupEdt.Create(self);
    try
      frmGroupEdt.SpecFacIK := actAddGroup.Tag;
      frmGroupEdt.WithSpec := false;
      frmGroupEdt.Edit := false;
      frmGroupEdt.ShowModal;
    finally
      frmGroupEdt.Free;
    end;
  end;
end;

procedure TfrmMain.actAbitReturnExecute(Sender: TObject);
begin
  frmAbitReturn := TfrmAbitReturn.Create(self);
  frmAbitReturn.IDStudent := TDBNodeAbitStudObject
    (DBDekTreeView_TEST1.Selected.data).ik;
  frmAbitReturn.NNAbit := TDBNodeAbitStudObject
    (DBDekTreeView_TEST1.Selected.data).NNAbit;
  frmAbitReturn.Hint :=
    inttostr(TDBNodeSpecRecObject(DBDekTreeView_TEST1.Selected.Parent.
    data).Year);
  frmAbitReturn.Tag := 0;
  frmAbitReturn.ShowModal;
  frmAbitReturn.Free;
  ActiveFrame.RefreshFrame;
end;

procedure TfrmMain.actAboutExecute(Sender: TObject);
begin
  try
    frmAbout := TfrmAbout.Create(self);
    frmAbout.ShowModal();
  finally
    frmAbout.Free;
  end;
end;

procedure TfrmMain.actFilterActualExecute(Sender: TObject);
begin
  actTreeRefreshActionExecute(Sender);
  DBDekTreeView_TEST1.RefreshExecute(self);
end;

procedure TfrmMain.actNaprExecute(Sender: TObject);
var
  Fyear: Integer;
begin
  Fyear := TDBNodeGroupObject(DBDekTreeView_TEST1.Selected.Parent.data)
    .FoundYear;
  ftmNapr := TftmNapr.Create(self);

  ftmNapr.Tag := TDBNodeStudObject(DBDekTreeView_TEST1.Selected.data)
    .RecordbookKey;
  ftmNapr.Hint :=
    inttostr(TDBNodeGroupObject(DBDekTreeView_TEST1.Selected.Parent.Parent.
    Parent.data).ik);
  ftmNapr.studobj := TDBNodeStudObject(DBDekTreeView_TEST1.SelectedObject);

  if MonthOf(Date) > 8 then
    ftmNapr.dbcbeNum.Text := inttostr(1 + (CurrentYear - Fyear) * 2)
  else if MonthOf(Date) < 3 then
    ftmNapr.dbcbeNum.Text := inttostr((CurrentYear - Fyear) * 2 - 1)
  else if (MonthOf(Date) <= 8) and (MonthOf(Date) >= 3) then
    ftmNapr.dbcbeNum.Text := inttostr((CurrentYear - Fyear) * 2);
  ftmNapr.ShowModal;
  ftmNapr.Free;
end;

procedure TfrmMain.actNotificationExecute(Sender: TObject);
begin
  FormSprForGrup(TDBNodeGroupObject(DBDekTreeView_TEST1.Selected.data).ik, 5);
end;

procedure TfrmMain.actFilterGroupExecute(Sender: TObject);
begin
  if actFilterAll.Checked then
    actFilterActual.Checked := true
  else
    actFilterAll.Checked := true;

  actTreeRefreshAction.Execute;
  DBDekTreeView_TEST1.RefreshExecute(self);
end;

procedure TfrmMain.actFilterKafExecute(Sender: TObject);
begin
  // Do nothing
end;

procedure TfrmMain.FixButton;
begin

end;

procedure TfrmMain.FormResize(Sender: TObject);
begin
  FixButton;
end;

procedure TfrmMain.actNaprCloseExecute(Sender: TObject);
begin
  ftmNaprClose := TftmNaprClose.Create(self);
  ftmNaprClose.Tag := TDBNodeStudObject(DBDekTreeView_TEST1.Selected.data)
    .RecordbookKey;
  ftmNaprClose.ShowModal;
  ftmNaprClose.Free;
end;

procedure TfrmMain.actFilterAllExecute(Sender: TObject);
begin
  actTreeRefreshActionExecute(Sender);
  DBDekTreeView_TEST1.RefreshExecute(self);
end;

procedure ExpandOrCollapse(Node: TTreeNode);
begin
  if Node.Expanded then
    Node.Collapse(true)
  else
    Node.Expand(false);

end;

procedure TfrmMain.N37Click(Sender: TObject);
begin
  ExpandOrCollapse(DBDekTreeView_TEST1.Selected);
end;

procedure TfrmMain.N38Click(Sender: TObject);
begin
  ExpandOrCollapse(DBDekTreeView_TEST1.Selected);
end;

procedure TfrmMain.N74Click(Sender: TObject);
begin
  ExpandOrCollapse(DBDekTreeView_TEST1.Selected);
end;

procedure TfrmMain.N75Click(Sender: TObject);
begin
  ExpandOrCollapse(DBDekTreeView_TEST1.Selected);
end;

procedure TfrmMain.OnScheduleBookmarkExecute(Sender: TObject);
var
  BookmarkType: TScheduleBookmarkType;
  BookmarkSheduleYearIK, BookmarkSheduleSemIK, BookmarkObjectIK, FacultyIK,
    i: Integer;
  rootScheduleNode: TTreeNode;
  dbNode: TDBnodeObject;
  isSheduleFounded: Boolean;
begin
  TSheduleController.MainFunctions.GetScheduleBookmarkInfo
    ((Sender as TAction).Tag, BookmarkType, BookmarkSheduleYearIK,
    BookmarkSheduleSemIK, BookmarkObjectIK);
  dbNode := frmMain.DBDekTreeView_TEST1.Selected.data;
  if (dbNode is TDBNodeRootScheduleObject) then
    rootScheduleNode := frmMain.DBDekTreeView_TEST1.Selected;
  if (dbNode is TDBNodeSemesterScheduleObject) then
    rootScheduleNode := frmMain.DBDekTreeView_TEST1.Selected.Parent;
  if (dbNode is TDBNodeFacultyScheduleObject) then
    rootScheduleNode := frmMain.DBDekTreeView_TEST1.Selected.Parent.Parent;
  if (dbNode is TDBNodeScheduledepartmentObject) then
    rootScheduleNode := frmMain.DBDekTreeView_TEST1.Selected.Parent.
      Parent.Parent;
  rootScheduleNode.Expand(false);
  isSheduleFounded := false;
  for i := 0 to rootScheduleNode.Count - 1 do
  begin
    dbNode := rootScheduleNode.Item[i].data;
    if ((dbNode as TDBNodeSemesterScheduleObject)
      .IK_Year = BookmarkSheduleYearIK) and
      ((dbNode as TDBNodeSemesterScheduleObject)
      .IK_Semtype = BookmarkSheduleSemIK) then
    begin
      rootScheduleNode := rootScheduleNode.Item[i];
      isSheduleFounded := true;
      break;
    end;
  end;
  if not isSheduleFounded then
  begin
    Application.MessageBox
      ('Не удалось найти расписание, соответсвующее выбранной закладке!',
      'Подсистема "Расписание"', MB_ICONWARNING);
    Exit;
  end;
  rootScheduleNode.Expand(false);
  if (BookmarkType in [sbKafedraAud, sbKafedraExam]) then
    FacultyIK := TSheduleController.MainFunctions.GetFacultyForDep
      (BookmarkObjectIK)
  else
    FacultyIK := BookmarkObjectIK;
  isSheduleFounded := false;
  for i := 0 to rootScheduleNode.Count - 1 do
  begin
    dbNode := rootScheduleNode.Item[i].data;
    if ((dbNode as TDBNodeFacultyScheduleObject).ik = FacultyIK) then
    begin
      rootScheduleNode := rootScheduleNode.Item[i];
      isSheduleFounded := true;
      break;
    end;
  end;
  if not isSheduleFounded then
  begin
    Application.MessageBox
      ('Не удалось найти факультет, соответствующий выбранной закладке!',
      'Подсистема "Расписание"', MB_ICONWARNING);
    Exit;
  end;
  case BookmarkType of
    sbFacAud:
      begin
        frmMain.DBDekTreeView_TEST1.Select(rootScheduleNode);
        frmMain.DBDekTreeView_TEST1Change(DBDekTreeView_TEST1,
          rootScheduleNode);
        (frmMain.ActiveFrame as TfmSheduleFac)
          .PageControl1.ActivePageIndex := 1;
        (frmMain.ActiveFrame as TfmSheduleFac).DockTabSet2.TabIndex := 0;
        Exit;
      end;
    sbFacExam:
      begin
        frmMain.DBDekTreeView_TEST1.Select(rootScheduleNode);
        frmMain.DBDekTreeView_TEST1Change(DBDekTreeView_TEST1,
          rootScheduleNode);
        (frmMain.ActiveFrame as TfmSheduleFac)
          .PageControl1.ActivePageIndex := 1;
        (frmMain.ActiveFrame as TfmSheduleFac).DockTabSet2.TabIndex := 1;
        Exit;
      end;
  end;
  rootScheduleNode.Expand(false);
  isSheduleFounded := false;
  for i := 0 to rootScheduleNode.Count - 1 do
  begin
    dbNode := rootScheduleNode.Item[i].data;
    if ((dbNode as TDBNodeScheduledepartmentObject).ik = BookmarkObjectIK) then
    begin
      rootScheduleNode := rootScheduleNode.Item[i];
      isSheduleFounded := true;
      break;
    end;
  end;
  if not isSheduleFounded then
  begin
    Application.MessageBox
      ('Не удалось найти кафедру, соответствующую выбранной закладке!',
      'Подсистема "Расписание"', MB_ICONWARNING);
    Exit;
  end;
  frmMain.DBDekTreeView_TEST1.Select(rootScheduleNode);
  frmMain.DBDekTreeView_TEST1Change(DBDekTreeView_TEST1, rootScheduleNode);
  (frmMain.ActiveFrame as TfmSheduleDep).PageControl1.ActivePageIndex := 2;
  case BookmarkType of
    sbKafedraAud:
      (frmMain.ActiveFrame as TfmSheduleDep).DockTabSet2.TabIndex := 0;
    sbKafedraExam:
      (frmMain.ActiveFrame as TfmSheduleDep).DockTabSet2.TabIndex := 1;
end;
end;

procedure TfrmMain.Panel2Click(Sender: TObject);
begin
  Panel3.Visible := not Panel3.Visible;
  Splitter1.Visible := Panel3.Visible;
  if Splitter1.Visible then
    Splitter1.Left := Panel3.Width + 10;
  Image1.Visible := not Panel3.Visible;
  Image2.Visible := Panel3.Visible;
  { DBDekTreeView_TEST1.Visible:= not DBDekTreeView_TEST1.Visible;
    Splitter1.Visible:= DBDekTreeView_TEST1.Visible;
    if Splitter1.Visible then
    Splitter1.Left:= DBDekTreeView_TEST1.Width + 10;
    Image1.Visible:= not DBDekTreeView_TEST1.Visible;
    Image2.Visible:= DBDekTreeView_TEST1.Visible; }
end;

procedure TfrmMain.Panel2MouseEnter(Sender: TObject);
begin
  Panel2.Color := $00EFD3C6;
end;

procedure TfrmMain.Panel2MouseLeave(Sender: TObject);
begin
  Panel2.Color := clBtnFace;
end;

procedure TfrmMain.Panel2Resize(Sender: TObject);
begin
  Image1.Top := round((Panel2.Height - Image1.Height) / 2);
  Image2.Top := round((Panel2.Height - Image1.Height) / 2);
end;

procedure TfrmMain.actShowStudExecute(Sender: TObject);
begin
  if actShowAllStudent.Checked then
    actShowOtchislStudent.Checked := true
  else if actShowOtchislStudent.Checked then
    actShowUnOtchislStudent.Checked := true
  else if actShowUnOtchislStudent.Checked then
    actShowAcademStudent.Checked := true
  else
    actShowAllStudent.Checked := true;

  actTreeRefreshAction.Execute;
end;

procedure TfrmMain.actAddPrikazExecute(Sender: TObject);
begin
  ftmPrikaz := TftmPrikaz.Create(self);
  ftmPrikaz.Tag := 0;
  ftmPrikaz.Caption := 'Добавить приказ';
  if (ftmPrikaz.ShowModal = mrOk) or (ftmPrikaz.bbApply.Tag = 1) then
  begin
    dmPrikaz.dsPrikaz.DataSet.Close;
    dmPrikaz.dsPrikaz.DataSet.Open;
  end;
  ftmPrikaz.Free;
end;

procedure TfrmMain.actEditPrikazExecute(Sender: TObject);
begin
  (ActiveFrame as TfmPrik).actEditPrikazExecute(nil);
end;

procedure TfrmMain.actDelPrikazExecute(Sender: TObject);
begin
  (ActiveFrame as TfmPrik).actDelPrikazExecute(nil);
end;

procedure TfrmMain.actDelPrikazUpdate(Sender: TObject);
begin
  if (ActiveFrame is TfmPrik) then
    actDelPrikaz.Enabled := (ActiveFrame as TfmPrik).actDelPrikaz.Enabled;
end;

procedure TfrmMain.actEditPrikazUpdate(Sender: TObject);
begin
  if (ActiveFrame is TfmPrik) then
    actEditPrikaz.Enabled := (ActiveFrame as TfmPrik).actEditPrikaz.Enabled;
end;

procedure TfrmMain.actExtendSessionExecute(Sender: TObject);
begin

  frmExtendSession := tfrmExtendSession.Create(self);
  frmExtendSession.Student := DBDekTreeView_TEST1.Selected.data;
  frmExtendSession.ShowModal;
  frmExtendSession.Free;

end;

procedure TfrmMain.actEditGroupExecute(Sender: TObject);
begin
  if ActiveFrame is TfmGroup then
    (ActiveFrame as TfmGroup).actEdtGroup.Execute();
end;

procedure TfrmMain.actEditGroupUpdate(Sender: TObject);
begin
  if (ActiveFrame is TfmGroup) then
    actEditGroup.Enabled := (ActiveFrame as TfmGroup).actEdtGroup.Enabled;
end;

procedure TfrmMain.actDelGroupExecute(Sender: TObject);
begin
  if (ActiveFrame is TfmGroup) then
    (ActiveFrame as TfmGroup).actDelGroupExecute(Sender);
end;

procedure TfrmMain.actDelGroupUpdate(Sender: TObject);
begin
  if (ActiveFrame is TfmGroup) then
    actDelGroup.Enabled := (ActiveFrame as TfmGroup).actDelGroup.Enabled;
end;

procedure TfrmMain.actAddPotokExecute(Sender: TObject);
begin
  (ActiveFrame as TfmNagruzkaDep).actEditPotokExecute
    ((ActiveFrame as TfmNagruzkaDep).actAddPotok);
end;

procedure TfrmMain.actAddPrepExecute(Sender: TObject);
begin
  (ActiveFrame as TfmNagruzkaDep).actAddPrepodExecute
    ((ActiveFrame as TfmNagruzkaDep).actAddPrepod);
end;

procedure TfrmMain.actEditPrepExecute(Sender: TObject);
var
  dbNode: TDBnodeObject;
begin
  frmNagruzkaAddPrep := TfrmNagruzkaAddPrep.CreateDialog(nil,
    dm.DBConnect, nil);
  frmNagruzkaAddPrep.Caption := 'Изменение информации о преподавателе';
  dbNode := frmMain.DBDekTreeView_TEST1.Selected.data;
  frmNagruzkaAddPrep.Tag := (dbNode as TDBNodeTeacherObject).ik;
  dbNode := frmMain.DBDekTreeView_TEST1.Selected.Parent.data;
  frmNagruzkaAddPrep.ik := (dbNode as TDBNodedepartmentObject).ik;
  frmNagruzkaAddPrep.Read;
  if (frmNagruzkaAddPrep.ShowModal() = mrOk) or
    (frmNagruzkaAddPrep.bbApply.Tag = 1) then
    frmMain.DBDekTreeView_TEST1.RefreshNodeExecute
      (frmMain.DBDekTreeView_TEST1.Selected.Parent);
  frmNagruzkaAddPrep.Free;
end;

procedure TfrmMain.actDelPrepExecute(Sender: TObject);
begin
  if (Application.MessageBox
    (PChar('Вы уверены, что хотите удалить преподавателя "' +
    (Trim(TDBNodeTeacherObject(frmMain.DBDekTreeView_TEST1.Selected.data)
    .FirstName) + ' ' + Trim(TDBNodeTeacherObject(frmMain.DBDekTreeView_TEST1.
    Selected.data).LastName) + ' ' +
    Trim(TDBNodeTeacherObject(frmMain.DBDekTreeView_TEST1.Selected.data)
    .MiddleName)) + '"? ' + #10#13#10#13 +
    'При этом будут удалены соответсвующие записи: ' + #10#13 +
    '  1) из запланированной и фактической нагрузки данного преподавателя;' +
    #10#13 + '  2) из расписания данного преподавателя.'),
    'Удаление преподавателя', MB_YESNO) = mrYes) then
  begin
    if TNagruzkaController.Preparation.DeletePrepodFromKafedra
      (TDBNodeTeacherObject(frmMain.DBDekTreeView_TEST1.Selected.data).ik,
      TDBNodedepartmentObject(frmMain.DBDekTreeView_TEST1.Selected.Parent.
      data).ik) then
      frmMain.DBDekTreeView_TEST1.RefreshNodeExecute
        (frmMain.DBDekTreeView_TEST1.Selected.Parent);
  end;
end;

procedure TfrmMain.actAddKafExecute(Sender: TObject);
begin
  // (ActiveFrame as TfmNagruzkaFac).actAddKafExecute(nil);
end;

procedure TfrmMain.actAddNormUpdate(Sender: TObject);
begin
  if (ActiveFrame is TfmNagruzkaFac) then
    actAddNorm.Enabled := (ActiveFrame as TfmNagruzkaFac).actAddNorm.Enabled;
end;

procedure TfrmMain.actAddNormExecute(Sender: TObject);
begin
  (ActiveFrame as TfmNagruzkaFac).actAddNormExecute(nil);
end;

procedure TfrmMain.actOtchislExecute(Sender: TObject);
var
  cur: Integer;
begin
  frmOtchislStud := TfrmOtchislStud.Create(self);
  frmOtchislStud.Student := DBDekTreeView_TEST1.Selected.data;
  frmOtchislStud.ShowModal;
  frmOtchislStud.Free;
  // ------------ЗДЕСЬ---------------
  cur := DBDekTreeView_TEST1.SelectedObject.Node.Index;
  DBDekTreeView_TEST1.Selected := DBDekTreeView_TEST1.Selected.Parent;
  actTreeRefreshAction.Execute;
  DBDekTreeView_TEST1.SelectNodeByNum(cur, false);
end;

procedure TfrmMain.actViewUchPlanExecute(Sender: TObject);
var
  ik_grup, usrAnswer: Integer;
  Node: TTreeNode;
begin

  if lastCancel then
  begin
    lastCancel := false;
    Exit;
  end;
  if FFrame <> nil then
  begin
    if not(DBDekTreeView_TEST1.SelectedObject is TDBNodeGroupObject) then
      Exit;
    ik_grup := ((DBDekTreeView_TEST1.SelectedObject) as TDBNodeGroupObject).ik;
    if (FFrame.Modified) then
    begin
      usrAnswer := MessageBox(Handle, 'Сохранить изменения?', 'ИС Деканат',
        MB_YESNOCANCEL);
      lastCancel := false;
      if usrAnswer = IDYES then
      begin
        if FFrame.Apply = false then
        begin
          lastCancel := true;
          DBDekTreeView_TEST1.Select(LastSelectedNode);
          Exit;
        end;
      end;
      if usrAnswer = IDCANCEL then
      begin
        lastCancel := true;
        DBDekTreeView_TEST1.Select(LastSelectedNode);
        Exit;
      end;
      LastSelectedNode := DBDekTreeView_TEST1.Selected;
    end;

    // проверим, есть ли у группы учебный план
    if (TUchPlanController.Instance.getUchPlanForGroup(ik_grup) <> 0) then
    begin
      // тогда открываем учебный план
      Node := DBDekTreeView_TEST1.Selected.Parent;
      DBDekTreeView_TEST1.Select(Node);
      DBDekTreeView_TEST1Change(Sender, Node);
      if (FFrame is TfmSpec) then
        with (FFrame as TfmSpec) do
        begin
          PageControl1.ActivePageIndex := 6;
          fmUchPlan2.group := ik_grup;
          alreadySpec := true;
        end;
    end
    else
    begin
      if MessageBox(Handle,
        PWideChar('Перейти к выбору учебного плана для группы?'),
        'Для группы не назначен учебный план', MB_YESNO) = IDYES then
      begin
        frmGroupEdt := TfrmGroupEdt.Create(self);
        try
          frmGroupEdt.ik := ik_grup;
          frmGroupEdt.WithSpec := false;
          frmGroupEdt.Edit := true;
          frmGroupEdt.ShowModal;
        finally
          frmGroupEdt.Free;
        end;
      end;

    end;

  end;

end;

procedure TfrmMain.actVosstExecute(Sender: TObject);
var
  cur: Integer;
begin
  frmStudVosst := TfrmStudVosst.Create(self);
  frmStudVosst.Student := DBDekTreeView_TEST1.Selected.data;
  frmStudVosst.ShowModal;
  frmStudVosst.Free;
  // ------------ЗДЕСЬ---------------
  cur := DBDekTreeView_TEST1.SelectedObject.Node.Index;
  DBDekTreeView_TEST1.Selected := DBDekTreeView_TEST1.Selected.Parent;
  actTreeRefreshAction.Execute;
  DBDekTreeView_TEST1.SelectNodeByNum(cur, false);
end;

procedure TfrmMain.actVypiskaExecute(Sender: TObject);
var
  wb: variant;
  ExAppl: variant;
  i: Integer;
begin
  if not(ActiveFrame is TfmStudent) then
    Exit;

  dmUspevaemost.adospSelUspevForStud.Active := false;
  with dmUspevaemost.adospSelUspevForStud.Parameters do
  begin
    Clear;
    AddParameter;
    Items[0].Value := (ActiveFrame as TfmStudent).cmbxSem.ItemIndex;
    AddParameter;
    Items[1].Value := TDBNodeStudObject
      (frmMain.DBDekTreeView_TEST1.SelectedObject).RecordbookKey;
  end;
  dmUspevaemost.adospSelUspevForStud.ExecProc;
  dmUspevaemost.adospSelUspevForStud.Active := true;

  with (ActiveFrame as TfmStudent) do
  begin
    DBGridEh1.Columns[0].Title.Caption := 'Дисциплина';
    DBGridEh1.Columns[1].Title.Caption := 'Вид занятий';
    DBGridEh1.Columns[2].Title.Caption := 'Оценка';
    DBGridEh1.Columns[3].Title.Caption := 'Дата';
    DBGridEh1.Columns[4].Title.Caption := 'Преподаватель';
    DBGridEh1.Columns[5].Title.Caption := 'Семестр';
  end;

  try
    ExAppl := CreateOleObject('Excel.Application');
    ExAppl.WorkBooks.Add;
    wb := ExAppl.WorkBooks.Item[ExAppl.WorkBooks.Count];
    ExAppl.DisplayAlerts := false;
    dmUspevaemost.adospSelUspevForStud.First;
    i := 1;
    wb.sheets[1].cells[i, 1] := 'Предмет';
    wb.sheets[1].cells[i, 2] := 'Вид отчётности';
    wb.sheets[1].cells[i, 3] := 'Оценка';
    wb.sheets[1].cells[i, 4] := 'Дата';
    wb.sheets[1].cells[i, 5] := 'Преподаватель';
    wb.sheets[1].cells[i, 6] := 'Семестр';
    Inc(i);
    while not dmUspevaemost.adospSelUspevForStud.Eof do
    begin
      wb.sheets[1].cells[i, 1] := dmUspevaemost.adospSelUspevForStud.
        Fields[0].Value;
      wb.sheets[1].cells[i, 2] := dmUspevaemost.adospSelUspevForStud.
        Fields[1].Value;
      wb.sheets[1].cells[i, 3] := dmUspevaemost.adospSelUspevForStud.
        Fields[2].Value;
      wb.sheets[1].cells[i, 4] := dmUspevaemost.adospSelUspevForStud.
        Fields[3].Value;
      wb.sheets[1].cells[i, 5] := dmUspevaemost.adospSelUspevForStud.
        Fields[4].Value;
      wb.sheets[1].cells[i, 6] := dmUspevaemost.adospSelUspevForStud.
        Fields[5].Value;
      dmUspevaemost.adospSelUspevForStud.Next;
      Inc(i);
    end;
    ExAppl.DisplayAlerts := true;
    ExAppl.Visible := true;
  except
    MessageBox(Handle, 'Произошла ошибка при экспорте успеваемости в Excel.',
      'ИС "УГТУ"', MB_OK);
    ExAppl.Quit;
    ExAppl := UnAssigned;
  end;
end;

procedure TfrmMain.actPerevodExecute(Sender: TObject);
var
  cur: Integer;
begin
  frmPerevStud := TfrmPerevStud.Create(self);
  frmPerevStud.Student := DBDekTreeView_TEST1.Selected.data;
  frmPerevStud.ShowModal;
  frmPerevStud.Free;
  // ------------ЗДЕСЬ---------------
  cur := DBDekTreeView_TEST1.SelectedObject.Node.Index;
  DBDekTreeView_TEST1.Selected := DBDekTreeView_TEST1.Selected.Parent;
  actTreeRefreshAction.Execute;
  DBDekTreeView_TEST1.SelectNodeByNum(cur, false);
end;

procedure TfrmMain.actPFShowAllExecute(Sender: TObject);
begin
  if (DBDekTreeView_TEST1.Selected.data <> nil) then
    if (TDBnodeObject(DBDekTreeView_TEST1.Selected.data)
      is TDBNodedepartmentObject) then

    begin
      TDBNodedepartmentObject(DBDekTreeView_TEST1.Selected.data).FilterType :=
        TTeacherTreeViewFilter((Sender as TAction).Tag);
      DBDekTreeView_TEST1.RefreshNodeExecute(DBDekTreeView_TEST1.Selected);
    end;
end;

procedure TfrmMain.actAkademExecute(Sender: TObject);
var
  cur: Integer;
begin
  frmAcademStud := tfrmAcademStud.Create(self);
  frmAcademStud.RecordbookKey :=
    TDBNodeStudObject(DBDekTreeView_TEST1.Selected.data).RecordbookKey;
  frmAcademStud.CategoryId := TDBNodeStudObject
    (DBDekTreeView_TEST1.Selected.data).CategoryId;
  frmAcademStud.ik_group := TDBNodeGroupObject
    (DBDekTreeView_TEST1.Selected.Parent.data).ik;
  frmAcademStud.ik_spec := TDBNodeGroupObject
    (DBDekTreeView_TEST1.Selected.Parent.Parent.data).ik;
  frmAcademStud.ik_group := TDBNodeGroupObject
    (DBDekTreeView_TEST1.Selected.Parent.data).ik;
  frmAcademStud.EditMode := false;
  frmAcademStud.dbcbeFac.KeyValue :=
    TDBNodeFacultyObject(DBDekTreeView_TEST1.Selected.Parent.Parent.
    Parent.data).ik;
  frmAcademStud.dbcbeSpec.KeyValue :=
    TDBNodeSpecObject(DBDekTreeView_TEST1.Selected.Parent.Parent.data).ik;

  if TDBNodeStudObject(DBDekTreeView_TEST1.Selected.data).State = ssAcadem then
  begin
    with dmStudentSelectionProcs.aspSelAcadem do
    begin
      First;
      while (not Eof) and (FieldByName('Прошлая группа').Value <>
        TDBNodeGroupObject(DBDekTreeView_TEST1.Selected.Parent.data).Name) do
        Next;

      dmPrikaz.adodsPrikaz.Active := true;
      dmCauses.adodsAcademCause.Active := true;
      dmUgtuStructure.adodsFaculty.Active := true;

      frmAcademStud.ik_group := FieldByName('ik_grup').Value;
      frmAcademStud.dbcbeNumPrik.KeyValue := FieldByName('ik_prikaz').Value;
      frmAcademStud.dbcbeCause.KeyValue := FieldByName('ik_pric').Value;
      frmAcademStud.cbFreeAt.Checked :=
        FieldByName('Свободное посещение').Value;
      frmAcademStud.eOtchObosn.Text :=
        FieldByName('Обоснование отчисления').Value;

      frmAcademStud.dbcbeGroup.KeyValue :=
        TDBNodeGroupObject(DBDekTreeView_TEST1.Selected.Parent.data).ik;

      frmAcademStud.dbdteBegin.Value := FieldByName('Дата начала').Value;
      frmAcademStud.dbdteEnd.Value := FieldByName('Дата окончания').Value;
      frmAcademStud.dbdteLearn.Value :=
        FieldByName('Дата выхода на учебу').Value;

      frmAcademStud.EditMode := true;
    end;
  end;

  frmAcademStud.ShowModal;
  frmAcademStud.Free;
  // ------------ЗДЕСЬ---------------
  cur := DBDekTreeView_TEST1.SelectedObject.Node.Index;
  DBDekTreeView_TEST1.Selected := DBDekTreeView_TEST1.Selected.Parent;
  actTreeRefreshAction.Execute;
  DBDekTreeView_TEST1.SelectNodeByNum(cur, false);
end;

procedure TfrmMain.actAppTweaksShowExecute(Sender: TObject);
begin
  frmAppTweaks := TfrmAppTweaks.Create(nil);
  frmAppTweaks.ShowModal;
  frmAppTweaks.Free;
end;

procedure TfrmMain.actFamChgExecute(Sender: TObject);
var
  cur: Integer;
begin
  frmChangeLastName := tfrmChangeLastName.Create(self);
  frmChangeLastName.Student := DBDekTreeView_TEST1.Selected.data;
  frmChangeLastName.ShowModal;
  frmChangeLastName.Free;
  // ------------ЗДЕСЬ---------------
  cur := DBDekTreeView_TEST1.SelectedObject.Node.Index;
  DBDekTreeView_TEST1.Selected := DBDekTreeView_TEST1.Selected.Parent;
  actTreeRefreshAction.Execute;
  DBDekTreeView_TEST1.SelectNodeByNum(cur, false);
end;

procedure TfrmMain.actPasspChgExecute(Sender: TObject);
var
  cur: Integer;
begin
  frmChangePassport := tfrmChangePassport.Create(self);
  frmChangePassport.Student := DBDekTreeView_TEST1.Selected.data;
  frmChangePassport.ShowModal;
  frmChangePassport.Free;
  // ------------ЗДЕСЬ---------------
  cur := DBDekTreeView_TEST1.SelectedObject.Node.Index;
  DBDekTreeView_TEST1.Selected := DBDekTreeView_TEST1.Selected.Parent;
  actTreeRefreshAction.Execute;
  DBDekTreeView_TEST1.SelectNodeByNum(cur, false);
end;

procedure TfrmMain.actAddSpclzExecute(Sender: TObject);
begin
  if (ActiveFrame is TfmSpec) then
    (ActiveFrame as TfmSpec).actAddSpclzExecute((ActiveFrame as TfmSpec)
      .actAddSpclz);
end;

procedure TfrmMain.ppmFacNagrPopup(Sender: TObject);
begin
  if DBDekTreeView_TEST1.Selected.Expanded then
    N24.Caption := 'Свернуть'
  else
    N24.Caption := 'Развернуть';
end;

procedure SetNodeActions(ppm: TPopupMenu; Cat: string);
var
  i: Integer;
  new: TMenuItem;
  newca: TActionClientItem;
  act: TContainedAction;
begin
  for i := 0 to (frmMain.alMainActions.ActionCount - 1) do
    if frmMain.alMainActions.Actions[i].Category = Cat then
    begin
      new := TMenuItem.Create(ppm);
      act := frmMain.alMainActions.Actions[i];
      new.Action := act;
      ppm.Items.Add(new);
      newca := frmMain.ActionManager1.ActionBars[0].Items[1].Items.Add;
      if not(act.Tag = 1) then
        newca.Action := act
      else
        newca.Caption := '-';
    end;
end;

procedure TfrmMain.actDocsRetrieveExecute(Sender: TObject);
begin
  if MessageBox(Handle, 'Вы уверены, что хотите провести операцию?',
    'ИС "УГТУ"', MB_YESNO) = IDYES then
  begin

    { dm.adodsPostupView.Active:=false;
      dm.adodsPostupView.CommandType:=cmdText;
      dm.adodsPostupView.CommandText:='select * from Abit_Postup_View where ncode='''+
      inttostr(TDBNodeStudObject(DBDekTreeView_TEST1.SelectedObject).id)+'''';
      dm.adodsPostupView.Active:=true;
      dm.adodsPostupView.First;
      while (not dm.adodsPostupView.FieldValues['ik_zach']<3)and(not dm.adodsPostupView.Eof) do
      dm.adodsPostupView.Next; }

    if (not TDBNodeAbitStudObject(DBDekTreeView_TEST1.Selected.data).onlyReading)
    then
    begin
      dmAbiturientAction.aspDocsRetrieve.Active := false;
      dmAbiturientAction.aspDocsRetrieve.Parameters.Clear;
      dmAbiturientAction.aspDocsRetrieve.Parameters.AddParameter;
      dmAbiturientAction.aspDocsRetrieve.Parameters[0].Value :=
        TDBNodeAbitStudObject(DBDekTreeView_TEST1.Selected.data).NNAbit;
      // dm.adodsPostupView.FieldValues['NN_abit'];
      try
        dmAbiturientAction.aspDocsRetrieve.ExecProc;
      except
        MessageBox(Handle,
          'Произошла ошибка при возврате документов абитуриента.',
          'ИС "УГТУ"', MB_OK);
      end;
      DBDekTreeView_TEST1.RefreshNodeExecute(DBDekTreeView_TEST1.Selected);
    end;

  end;

end;

procedure TfrmMain.ppmTreePopup(Sender: TObject);
var
  sep: TMenuItem;
  newca: TActionClientItem;
  dbNode: TDBnodeObject;
begin
  if frmMain.DBDekTreeView_TEST1.Selected = nil then
    Exit;
  dbNode := frmMain.DBDekTreeView_TEST1.Selected.data;
  if (dbNode.AssociatedObject <> FFrame) then
  begin
    // DBDekTreeView_TEST1Change(ppmTree, frmMain.DBDekTreeView_TEST1.Selected);
    frmMain.DBDekTreeView_TEST1.Selected.Selected := true;
    // Этот паскальный кадавр не убирать ни в коем случае!
  end;

  ppmTree.Items.Clear;
  ActionManager1.ActionBars[0].Items[1].Items.Clear;
  SetNodeActions(ppmTree, 'catDefaultNode');
  sep := TMenuItem.Create(self);
  newca := frmMain.ActionManager1.ActionBars[0].Items[1].Items.Add;
  newca.Caption := '-';
  sep.Caption := '-';
  ppmTree.Items.Add(sep);
  if (TDBnodeObject(frmMain.DBDekTreeView_TEST1.Selected.data).Actiongroup <> '')
  then
    SetNodeActions(ppmTree,
      TDBnodeObject(frmMain.DBDekTreeView_TEST1.Selected.data).Actiongroup);

end;

procedure TfrmMain.actCollapseExpandExecute(Sender: TObject);
begin
  ExpandOrCollapse(DBDekTreeView_TEST1.Selected);
  if DBDekTreeView_TEST1.Selected.Expanded then
    actCollapseExpand.Caption := 'Свернуть'
  else
    actCollapseExpand.Caption := 'Развернуть'
end;

procedure TfrmMain.MainMenuBarPopup(Sender: TObject;
  Item: TCustomActionControl);
begin
  ppmTreePopup(Sender);
end;

procedure TfrmMain.actLevelUpExecute(Sender: TObject);
var
  ndGroup: TDBNodeGroupObject;
  i: Integer;
begin
  ndGroup := TDBNodeGroupObject(DBDekTreeView_TEST1.SelectedObject);
  frmLevelUp := TfrmLevelUp.Create(self);
  frmLevelUp.lAvail := Tlist.Create();
  frmLevelUp.lSel := Tlist.Create();
  frmLevelUp.ndGroup := ndGroup;
  for i := 0 to (ndGroup.Node.Count - 1) do
    frmLevelUp.lAvail.Add(TDBNodeStudObject(ndGroup.Node.Item[i].data));
  frmLevelUp.Sync;
  frmLevelUp.ShowModal;
end;

procedure TfrmMain.actAddDepPlanExecute(Sender: TObject);
begin
  (ActiveFrame as TfmNagruzkaDep).actEditPlanExecute
    ((ActiveFrame as TfmNagruzkaDep).actAddPlan);
end;

procedure TfrmMain.actAddPlanPrepNagruzkaExecute(Sender: TObject);
begin
  // (ActiveFrame as TfmNagruzkaPrep).actEditPlanExecute((ActiveFrame as TfmNagruzkaPrep).actAddPlan);
end;

procedure TfrmMain.actAddFactPrepNagruzkaExecute(Sender: TObject);
begin
  // (ActiveFrame as TfmNagruzkaPrep).actAddFactExecute((ActiveFrame as TfmNagruzkaPrep).actAddFact);
end;

procedure TfrmMain.actAddAbitExecute(Sender: TObject);
var
  yearnode: TDBNodeAbitYearObject;
begin
  TApplicationController.GetInstance.AddLogEntry('Добавление абитуриента');

  frmAbitConfirm := tfrmAbitConfirm.Create(self);
  frmAbitConfirm.Tag := TDBNodeSpecRecObject
    (DBDekTreeView_TEST1.SelectedObject).NNRecord;
  frmAbitConfirm.Hint :=
    inttostr(TDBNodeSpecRecObject(DBDekTreeView_TEST1.SelectedObject).Year);
  yearnode := TDBNodeAbitYearObject
    (DBDekTreeView_TEST1.Selected.Parent.Parent.Parent.data);
  frmAbitConfirm.HasAddSpec := yearnode.HasAddSpec;
  frmAbitConfirm.ShowModal;
  frmAbitConfirm.Free;

end;

procedure TfrmMain.actPostupDeleteExecute(Sender: TObject);
begin
  if MessageBox(Handle, 'Вы уверены, что хотите удалить заявление абитуриента?',
    'ИС "УГТУ"', MB_YESNO) = IDYES then
  begin
    dmAbiturientAction.aspAbitDelPostup.Active := false;
    dmAbiturientAction.aspAbitDelPostup.Parameters.Clear;
    dmAbiturientAction.aspAbitDelPostup.Parameters.CreateParameter('@NN_abit',
      ftInteger, pdInput, 4,
      TDBNodeAbitStudObject(DBDekTreeView_TEST1.Selected.data).NNAbit);
    try
      dmAbiturientAction.aspAbitDelPostup.ExecProc;
    except
      MessageBox(Handle, 'Произошла ошибка при удалении заявления.',
        'ИС "УГТУ"', MB_OK);
      // actTreeRefreshAction.Execute;

    end;
    DBDekTreeView_TEST1.Selected := DBDekTreeView_TEST1.Selected.Parent;
    DBDekTreeView_TEST1.RefreshNodeExecute(DBDekTreeView_TEST1.Selected);
  end;

end;

procedure TfrmMain.actPostupDlgShowExecute(Sender: TObject);
begin
  frmpostupDlg := TfrmPostupDlg.Create(self);
  frmpostupDlg.IDStudent := TDBNodeAbitStudObject
    (DBDekTreeView_TEST1.Selected.data).ik;
  frmpostupDlg.IDpostup := TDBNodeAbitStudObject
    (DBDekTreeView_TEST1.Selected.data).NNAbit;
  frmpostupDlg.onlyReading := TDBNodeAbitStudObject
    (DBDekTreeView_TEST1.Selected.data).onlyReading;
  frmpostupDlg.Hint :=
    inttostr(TDBNodeSpecRecObject(DBDekTreeView_TEST1.Selected.Parent.
    data).Year);
  frmpostupDlg.HasAddSpec := TDBNodeAbitYearObject
    (DBDekTreeView_TEST1.Selected.Parent.Parent.Parent.Parent.data).HasAddSpec;
  frmpostupDlg.Tag := 0;
  frmpostupDlg.IkRecruit := TDBNodeSpecRecObject
    (DBDekTreeView_TEST1.Selected.Parent.data).NNRecord;

  frmpostupDlg.ShowModal;
  frmpostupDlg.Free;
  ActiveFrame.RefreshFrame;
end;

procedure TfrmMain.DBDekTreeView_TEST1Click(Sender: TObject);
begin
  if DBDekTreeView_TEST1.Selected.Expanded then
    actCollapseExpand.Caption := 'Свернуть'
  else
    actCollapseExpand.Caption := 'Развернуть';

  if pnlImage.Visible then
    pnlImage.Visible := false;
end;

procedure TfrmMain.cmbSearchChange(Sender: TObject);
begin

  Refresh;
  try
    dm.adodsStudSearch.Active := false;
    case cmbSearch.ItemIndex of
      0:
        begin
          dbcbeSearch.ListField := 'nn_zach';
          dm.adodsStudSearch.CommandText :=
            'select * from Tree_stud_search Order by nn_zach';
        end;
      1:
        begin
          dbcbeSearch.ListField := 'NameStud';
          dm.adodsStudSearch.CommandText :=
            'select * from Tree_stud_search Order by NameStud';
        end;
      2:
        begin
          dm.adodsStudSearch.CommandText :=
            'select * from Tree_stud_search Order by ctelefon DESC';
          dbcbeSearch.ListField := 'ctelefon';
        end;
    end;
    dm.adodsStudSearch.Active := true;
  finally

  end;
end;

procedure TfrmMain.cmbTeachSearchChange(Sender: TObject);
begin
  { Panel8.Top:= round((Height - Panel8.Height)/2);
    Panel8.Left:= round((Width - Panel8.Width)/2);
    Panel8.Visible:= true; }
  Refresh;
  try
    dm.adodsTeachSearch.Active := false;
    case cmbTeachSearch.ItemIndex of
      0:
        begin
          dbcbeTeachSearch.ListField := 'full_iTab_n';
          dm.adodsTeachSearch.CommandText :=
            'select * from Tree_Teachsearch Order by itab_n';
        end;
      1:
        begin
          dbcbeTeachSearch.ListField := 'Fullname';
          dm.adodsTeachSearch.CommandText :=
            'select * from Tree_Teachsearch Order by Fullname';
        end;
    end;
    dm.adodsTeachSearch.Active := true;
  finally
    // Panel8.Visible:= false;
  end;
end;

procedure TfrmMain.actFindExecute(Sender: TObject);
begin
  if dbcbeSearch.KeyValue = Null then
    Exit;
  if not DBDekTreeView_TEST1.FindAndSelectByValue(dbcbeSearch.KeyValue) then
    showmessage('Не удалось найти данного студента!');
end;

procedure TfrmMain.actFindTeachExecute(Sender: TObject);
begin
  if dbcbeTeachSearch.KeyValue = Null then
    Exit;
  if not DBDekTreeView_TEST1.FindAndSelectTeachByValue(dbcbeTeachSearch.KeyValue)
  then
    showmessage('Не удалось найти данного преподавателя!');
end;

procedure TfrmMain.dbcbeSearchKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    actFind.Execute;
end;

procedure TfrmMain.dbcbeTeachSearchCloseUp(Sender: TObject; Accept: Boolean);
begin
  actFindTeach.Execute;
end;

procedure TfrmMain.dbcbeSearchCloseUp(Sender: TObject; Accept: Boolean);
begin
  if Accept then
    actFind.Execute;
end;

procedure TfrmMain.actAcademRestoreExecute(Sender: TObject);
var
  cur: Integer;
begin
  frmacademReturn := TfrmacademReturn.Create(self);
  frmacademReturn.Tag := (ActiveFrame as TfmStudent).obj.RecordbookKey;
  frmacademReturn.ShowModal;
  frmacademReturn.Free;

  // ------------Обновление узла---------------
  cur := DBDekTreeView_TEST1.SelectedObject.Node.Index;
  DBDekTreeView_TEST1.Selected := DBDekTreeView_TEST1.Selected.Parent;
  actTreeRefreshAction.Execute;
  DBDekTreeView_TEST1.SelectNodeByNum(cur, false);
end;

procedure TfrmMain.actCheckNewVerExecute(Sender: TObject);
var
  last, newv: String;
begin

  if (TVersionController.GetInstance.UpdateNeeded) then
  begin
    NewClientVersionDetectedForm := TNewClientVersionDetectedForm.Create(self);
    NewClientVersionDetectedForm.Tag :=
      TVersionController.GetInstance.ServerVersion.State;
    if (NewClientVersionDetectedForm.ShowModal = mrYes) then
    begin
      try
        TVersionController.GetInstance.UpdateVersion;
      except
        showmessage
          ('При получении новой версии клиента ИС УГТУ произошла ошибка!')
      end;
      ShellExecute(Handle, nil,
        PWideChar(TApplicationController.GetInstance.IniDir + 'setup.msi'), nil,
        nil, SW_RESTORE);
      TApplicationController.GetInstance.FinalizeApplication;
      Application.Terminate;
    end;

  end;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  randomize;

  actCheckNewVer.Execute;
  if DBDekTreeView_TEST1.Items.Count > 0 then
    DBDekTreeView_TEST1.Selected := DBDekTreeView_TEST1.Items[0];

  // для новогодней версии:
  // imgChristmas.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'\KwanzaBusiness\'+inttostr(Random(12)+1)+'.jpg');

end;

procedure TfrmMain.FormSprForGrup(ik_grup, ik_destination: Integer);
var
  d1, z: TDateTime;
  fReview: TfmSprForGroup;
  datebegin: string;
  // AYear, AMonth, ADay: word;
  week1, week2, numweek, k, h, i, sem, Year, ik_doc: Integer;
  mask1, mask2, dateb, l, depInd: string;
  sp_vidz: TADODataSet;
  sp_info: TADOStoredProc;
  //
  tempDS, tempDSchall, tempDSikdoc, tempDSsm: TADODataSet;
  // Report: TReportBase;
  LastNum: Integer;
  // d3, d2: TDateTime;
  // // sp_num: TADODataSet;
  // // sp_depInd: TADODataSet;
  // dsDoc: TADODataSet;
  // ListDist: TObjectList<TDest>;
  // dest: TDest;
  // doc: TDopDoc;
  ListDist: TObjectList<TDest>;
begin
  id_grup := TDBNodeGroupObject(DBDekTreeView_TEST1.Selected.data).ik;
  ListDist := TObjectList<TDest>.Create;
  inherited;
  try
    // dsDoc := TADODataSet.Create(nil);
    tempDS := TGeneralController.Instance.GetNewADODataSet(true);
    tempDSchall := TGeneralController.Instance.GetNewADODataSet(true);
    tempDSikdoc := TADODataSet.Create(nil);
    tempDSsm := TGeneralController.Instance.GetNewADODataSet(true);

    // dateb := TDocController.Instance.CalculationBeginYearLern();
    // depInd := TDocController.Instance.CalculationDepIndex(ik_studGrup);
    // LastNum := TDocController.Instance.CalculationLastNum(ik_studGrup,
    // ik_destination);

    // // --------------------------------------------------------------------------
    // DecodeDate(Now, AYear, AMonth, ADay);
    sp_info := TADOStoredProc.Create(nil);
    sp_info.ProcedureName := 'InfForGrup;1';
    sp_info.Connection := dm.DBConnect;
    sp_info.Parameters.CreateParameter('@Ik_grup', ftString, pdInput, 50,
      id_grup.ToString());
    sp_info.Open;
    sp_info.First;
    datebegin := TDocController.Instance.CalculationBeginYearLern();
    depInd := TDocController.Instance.CalculationDepIndex
      (sp_info.FieldByName('Ik_grup').AsInteger);

    fReview := TfmSprForGroup.Create(self);
    // // ---------------------
    fReview.dtUtv.Format := '';
    fReview.dtUtv.Date := Date;
    fReview.dtGot.Format := #32;
    // fReview.dtpArrival.Format := #32;
    // // ищем информацию о студенте
    // dsDoc.CommandText := 'select * from StudInfoForDocs Where ik_studGrup=' +
    // ik_studGrup.ToString();
    // dsDoc.Connection := dm.DBConnect;
    // dsDoc.Open;
    // dsDoc.First;
    Case ik_destination of
      3:
        fReview.eDest.Text := 'Справка-вызов';
      5:
        fReview.eDest.Text := 'Письмо-уведомление';
    End;
    fReview.eInd.Text := depInd;
    fReview.Caption := sp_info.FieldByName('Cname_grup').AsString + ' ' +
      sp_info.FieldByName('dop_sem').AsString + ' семестр';
    sem := sp_info.FieldByName('dop_sem').AsInteger;
    fReview.dtpBegin.Date := Now;
    fReview.dtpEnd.Date := Now;
    // dmDocs.spStudAddressProc.Active := false;
    // dmDocs.spStudAddressProc.Parameters.Refresh;
    // dmDocs.spStudAddressProc.Parameters.ParamByName('@Ik_StudGrup').Value :=
    // ik_studGrup;
    // dmDocs.spStudAddressProc.Active := true;
    // // ---------------------
    fReview.cbeSem.Clear;
    for i := 1 to sem do
      fReview.cbeSem.AddItem(i.ToString(), TObject(i));
    fReview.cbeSem.ItemIndex := sem - 1;
    fReview.ShowModal;
    if (fReview.ModalResult = mrOk) or (fReview.ModalResult = mrYes) then
    begin
      dmDocs.adodsStudGrup.First;
      While not dmDocs.adodsStudGrup.Eof do
      begin
        LastNum := TDocController.Instance.CalculationLastNum
          (sp_info.FieldByName('Ik_grup').AsInteger, ik_destination);
        with dmDocs.adodsStudGrup do
          try
            dm.DBConnect.BeginTrans;

            // // // добавляем справку
            //
            tempDS.CommandText := 'Select * from Document ';
            tempDS.Open;
            tempDS.Insert;
            tempDS.FieldByName('Ik_studGrup').Value :=
              FieldByName('ik_studGrup').AsInteger;
            tempDS.FieldByName('Ik_Transfer').Value := 2;
            tempDS.FieldByName('Ik_destination').Value := ik_destination;
            tempDS.FieldByName('DatePod').Value := Date;
            tempDS.FieldByName('NumberDoc').Value := LastNum;
            tempDS.FieldByName('DateCreate').Value := Date;
            tempDS.FieldByName('Num_podrazd').Value := depInd;
            tempDS.Post;
            tempDS.UpdateBatch();

            k := 0;
            if (fReview.cbePrich.Text = 'Промежуточная аттестация') then
              k := 55;
            if (fReview.cbePrich.Text = 'Государственный экзамен') then
              k := 56;
            if (fReview.cbePrich.Text = 'Выпускная работа') then
              k := 31;

            sp_vidz := TADODataSet.Create(nil);
            sp_vidz.CommandText := 'select * from Graph_Uch_Proc Where Ik_Grup='
              + id_grup.ToString() + 'and n_sem=' + sem.ToString() +
              ' and iK_vid_zanyat=' + k.ToString();
            // String(cbeReason.Items.Objects[cbeReason.ItemIndex]);
            sp_vidz.Connection := dm.DBConnect;
            sp_vidz.Open;
            sp_vidz.First;

            tempDSikdoc.CommandText :=
              'select MAX(Ik_Document)[maxid] from Document where Ik_studGrup='
              + FieldByName('ik_studGrup').AsString + 'and Ik_destination=' +
              ik_destination.ToString() + 'and NumberDoc =' + LastNum.ToString()
              + 'and Num_podrazd=''' + depInd + '''';
            tempDSikdoc.Connection := dm.DBConnect;
            tempDSikdoc.Open;
            tempDSikdoc.First;

            tempDSchall.CommandText := 'Select * from CallSpr';
            tempDSchall.Open;
            tempDSchall.Insert;
            tempDSchall.FieldByName('Ik_Document').Value :=
              tempDSikdoc.FieldByName('maxid').AsInteger;
            tempDSchall.FieldByName('DateStartPeriod').Value :=
              FormatDateTime('dd.mm.yyyy', fReview.dtpBegin.Date);
            tempDSchall.FieldByName('DateEndPeriod').Value :=
              FormatDateTime('dd.mm.yyyy', fReview.dtpEnd.Date);;
            tempDSchall.FieldByName('ik_upContent').Value :=
              sp_vidz.FieldByName('ik_upContent').AsInteger;
            ik_doc := tempDSikdoc.FieldByName('maxid').AsInteger;
            tempDSchall.Post;
            tempDSchall.UpdateBatch();
            if fReview.rbP.Checked then
            begin
              tempDSsm.CommandText := 'Select * from Addressee_Doc';
              tempDSsm.Open;
              tempDSsm.Insert;
              tempDSsm.FieldByName('Ik_Document').Value :=
                tempDSikdoc.FieldByName('maxid').AsInteger;
              ik_doc := tempDSikdoc.FieldByName('maxid').AsInteger;
              dmDocs.adodsStudAddres.Open;
              dmDocs.adodsStudAddres.First;
              tempDSsm.FieldByName('ik_personAddress').Value :=
                FieldByName('ik_persAddr').Value
            end;
            tempDSsm.Post;
            tempDSsm.UpdateBatch();
            dm.DBConnect.CommitTrans;
            tempDS.Close;
            tempDSchall.Close;
            tempDSikdoc.Close;
            tempDSsm.Close;

            // tempDS.Free;
            // tempDSchall.Free;
            // tempDSikdoc.Free;
            //
            // tempDSsm.Free;
          except
            dm.DBConnect.RollbackTrans;
          end;
        ListDist := TUspevGroupController.Instance.AddListDest(ListDist,
          ik_destination, ik_doc);
        dmDocs.adodsStudGrup.Next;
      end;
      //
      if (fReview.ModalResult = mrYes) then
      begin
        TUspevGroupController.Instance.PrintAllDoc(ListDist);;

      end;
    end;
  finally
    sp_info.Free;
    // sp_vidz.Free;
    tempDS.Free;
    tempDSchall.Free;
    tempDSikdoc.Free;
    // sp_num.Free;
    // sp_depInd.Free;
    // dsDoc.Free;
    // Report.Free;
    tempDSsm.Free;
  end;

end;

procedure TfrmMain.actYearFilterExecute(Sender: TObject);
begin
  if actFilterAllYear.Checked then
    ActCurFilter.Checked := true
  else
    actFilterAllYear.Checked := true;

  actTreeRefreshAction.Execute;
  DBDekTreeView_TEST1.RefreshExecute(self);
end;

procedure TfrmMain.alMainActionsExecute(Action: TBasicAction;
  var Handled: Boolean);
begin
  if Action is TAction then
    TApplicationController.GetInstance.AddLogEntry('Выполняет действие: ' +
      TAction(Action).Caption + '(' + Action.Name + ')')
  else
    TApplicationController.GetInstance.AddLogEntry('Выполняет действие: ' +
      Action.Name);

end;

procedure TfrmMain.alMainActionsUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  if (DBDekTreeView_TEST1 <> nil) then
    if (DBDekTreeView_TEST1.Selected <> nil) then
      if DBDekTreeView_TEST1.Selected.Expanded then
        actCollapseExpand.Caption := 'Свернуть'
      else
        actCollapseExpand.Caption := 'Развернуть';

end;

procedure TfrmMain.BitBtn1Click(Sender: TObject);
var
  CertD: TfrmEGECertificateCheck;
begin
  CertD := TfrmEGECertificateCheck.Create(self, '', '', '', '', '');
  CertD.ShowModal;
end;

procedure TfrmMain.Button1Click(Sender: TObject);
var
  ex: EOleException;
begin
  ex := EOleException.Create('TEST', 0, '', '', 0);
  ex.ErrorCode := -2147467259;
  raise ex;
end;

procedure TfrmMain.actListToExcelExecute(Sender: TObject);
begin
  TAbitOtchetsController.Instance.ExportZayavl
    (TDBNodeAbitStudObject(DBDekTreeView_TEST1.Selected.data).NNAbit);
end;

procedure TfrmMain.actMakeBookmarkExecute(Sender: TObject);
begin
  if (ActiveFrame is TfmSheduleDep) then
  begin
    case (ActiveFrame as TfmSheduleDep).DockTabSet2.TabIndex of
      0:
        if (ActiveFrame as TfmSheduleDep).fmLessonShedule1.actMakeBookmark.Enabled
        then
          (ActiveFrame as TfmSheduleDep)
            .fmLessonShedule1.actMakeBookmarkExecute(nil);
      1:
        if (ActiveFrame as TfmSheduleDep).fmExaminationShedule1.actMakeBookmark.Enabled
        then
          (ActiveFrame as TfmSheduleDep)
            .fmExaminationShedule1.actMakeBookmarkExecute(nil);
      end;
      Exit;
      end;
      if (ActiveFrame is TfmSheduleFac)
      then begin case (ActiveFrame as TfmSheduleFac).DockTabSet2.TabIndex of 0:
        if (ActiveFrame as TfmSheduleFac).fmLessonShedule1.actMakeBookmark.Enabled
        then
          (ActiveFrame as TfmSheduleFac)
            .fmLessonShedule1.actMakeBookmarkExecute(nil);
      1:
        if (ActiveFrame as TfmSheduleFac).fmExaminationShedule1.actMakeBookmark.Enabled
        then
          (ActiveFrame as TfmSheduleFac)
            .fmExaminationShedule1.actMakeBookmarkExecute(nil);
      end;
      Exit;
      end;
      end;

      procedure TfrmMain.actMakeBookmarkUpdate(Sender: TObject);
      begin if (ActiveFrame is TfmSheduleDep) then begin (Sender as TAction)
        .Enabled := ((ActiveFrame as TfmSheduleDep)
        .PageControl1.ActivePageIndex = 2) and
        ((ActiveFrame as TfmSheduleDep).fmLessonShedule1.actMakeBookmark.Enabled
        or (ActiveFrame as TfmSheduleDep)
        .fmExaminationShedule1.actMakeBookmark.Enabled);
      Exit;
      end;
      if (ActiveFrame is TfmSheduleFac) then begin (Sender as TAction).Enabled
        := ((ActiveFrame as TfmSheduleFac).PageControl1.ActivePageIndex = 1) and
        ((ActiveFrame as TfmSheduleFac).fmLessonShedule1.actMakeBookmark.Enabled
        or (ActiveFrame as TfmSheduleFac)
        .fmExaminationShedule1.actMakeBookmark.Enabled);
      Exit;
      end;
      (Sender as TAction).Enabled := false;
      end;

      function ChangeMonthDayPlaces(Date: TDateTime):
        string;
      var
        s1: string;

      begin
        result := DatetoStr(Date);
        s1 := result;
        result[1] := s1[4];
        result[2] := s1[5];
        result[4] := s1[1];
        result[5] := s1[2];
      end;

      procedure TfrmMain.actPrintMagExecute(Sender: TObject);
      var
        Year: Integer;
      begin
        // устанавливаем год
        Year := YearOf(Date);
        // узел набора
        if ActiveFrame.FrameObject is TDBNodeRecruitObject then
        begin
          Year := TDBNodeRecruitObject(ActiveFrame.FrameObject).ik;
        end;
        // узел факультета
        if ActiveFrame.FrameObject is TDBNodeFacRecObject then
          Year := TDBNodeRecruitObject
            (TDBNodeFacRecObject(ActiveFrame.FrameObject).Node.Parent.data).ik;
        // узел специальности
        if ActiveFrame.FrameObject is TDBNodeSpecRecObject then
          Year := TDBNodeRecruitObject
            (TDBNodeSpecRecObject(ActiveFrame.FrameObject)
            .Node.Parent.Parent.data).ik;

        frmAbitZhurnal := TfrmAbitZhurnal.Create(self);

        frmAbitZhurnal.Year := Year;
        frmAbitZhurnal.ShowModal;
        if frmAbitZhurnal.ModalResult <> mrOk then
        begin
          frmAbitZhurnal.Free;
          Exit;
        end;
        // try
        TAbitOtchetsController.Instance.ExportDaysMagToExcel
          (TDBNodeSpecRecObject(DBDekTreeView_TEST1.SelectedObject).ik,
          frmAbitZhurnal.dbdtmDate.Value);
        { except
          MessageBox(Handle, 'Произошла ошибка при экспорте данных в Excel.','ИС "УГТУ"',
          MB_OK) ;
          end; }
        frmAbitZhurnal.Free;
      end;

      procedure TfrmMain.actPrintResultsExecute(Sender: TObject);
      begin
        if (ActiveFrame is TfmAbitNabor) then
          (ActiveFrame as TfmAbitNabor).actPrintStat.Execute;

      end;

      procedure TfrmMain.actQMShowExecute(Sender: TObject);
      begin
        frmQueryMaster := TfrmQueryMaster.Create(self);
        frmQueryMaster.ShowModal;
        frmQueryMaster.Free;

      end;

      procedure TfrmMain.actPrepodsFilterExecute(Sender: TObject);
      begin
        case actPrepodsFilter.Tag of
          0:
            actPFShowAllExecute(actPFShowWorked);
          1:
            actPFShowAllExecute(actPFShowReleased);
          2:
            actPFShowAllExecute(actPFShowAll);
        end;
      end;

      procedure TfrmMain.actPrintAbitDopSpecExecute(Sender: TObject);
      var
        Year: Integer;
      begin
        TApplicationController.GetInstance.AddLogEntry
          ('Печать отчета по дополнительным специальностям.');

        if ActiveFrame.FrameObject is TDBNodeAbitYearObject then
        begin
          Year := TDBNodeAbitYearObject(ActiveFrame.FrameObject).ik;
        end
        else
          Year := YearOf(Date);
        TAbitOtchetsController.Instance.ExportAbitListForDopSpecToExcel(Year);
      end;

      procedure TfrmMain.actPrintAbitDopSpecUpdate(Sender: TObject);
      begin
        if ActiveFrame.FrameObject is TDBNodeAbitYearObject then
        begin
          (Sender as TAction).Enabled :=
            TDBNodeAbitYearObject(ActiveFrame.FrameObject).HasAddSpec;
        end

      end;

      procedure TfrmMain.actPrintAllZhurnalExecute(Sender: TObject);
      begin
        frmAbitZhurnal := TfrmAbitZhurnal.Create(self);
        frmAbitZhurnal.Year := TDBNodeAbitYearObject
          (ActiveFrame.FrameObject).ik;
        frmAbitZhurnal.ShowModal;
        if frmAbitZhurnal.ModalResult <> mrOk then
        begin
          frmAbitZhurnal.Free;
          Exit;
        end;
        if not TAbitOtchetsController.Instance.ExportAllZhurnals
          (frmAbitZhurnal.dbdtmDate.Value) then
        begin
          MessageBox(Handle, 'Произошла ошибка при экспорте журналов в Excel.',
            'ИС "УГТУ"', MB_OK);
        end;
        frmAbitZhurnal.Free;
      end;

      procedure TfrmMain.actPrintEgeOtchExecute(Sender: TObject);
      begin
        if ActiveFrame.FrameObject is TDBNodeAbitYearObject then
        begin
          Year := TDBNodeAbitYearObject(ActiveFrame.FrameObject).ik;
        end
        else
          Year := YearOf(Date);
        TAbitOtchetsController.Instance.ExpSpisForEGEToExc(Year);
      end;

      procedure TfrmMain.actPrintItogiPostForSpecExecute(Sender: TObject);
      var
        ikSpecFac: Integer;
      begin

        if ActiveFrame.FrameObject is TDBNodeSpecZachObject then
        begin
          Year := TDBNodeZachObject
            (TDBNodeSpecZachObject(ActiveFrame.FrameObject)
            .Node.Parent.Parent.data).ik;
          ikSpecFac := TDBNodeSpecZachObject(ActiveFrame.FrameObject).ik;
          TAbitOtchetsController.Instance.ExportItogiPostuplForSpec(Year,
            ikSpecFac);
        end
        else

      end;

      procedure TfrmMain.actPrintItogiPostForSpecUpdate(Sender: TObject);
      begin
        actPrintItogiPostForSpec.Enabled :=
          (ActiveFrame.FrameObject is TDBNodeSpecZachObject);
      end;

      procedure TfrmMain.actPrintItogiPostuplExecute(Sender: TObject);
      var
        Year: Integer;
      begin
        if ActiveFrame.FrameObject is TDBNodeAbitYearObject then
        begin
          Year := TDBNodeAbitYearObject(ActiveFrame.FrameObject).ik;
        end
        else
          Year := YearOf(Date);
        TAbitOtchetsController.Instance.ExportItogiPostupl(Year);
      end;

      procedure TfrmMain.ActGroupMgrExecute(Sender: TObject);
      begin
        frmgroupManager := TfrmgroupManager.Create(self);
        frmgroupManager.spec :=
          TDBNodeSpecObject(DBDekTreeView_TEST1.SelectedObject);
        frmgroupManager.ShowModal;
        frmgroupManager.spec.Node := DBDekTreeView_TEST1.Selected;
        frmgroupManager.Free;
        DBDekTreeView_TEST1.RefreshNodeExecute(DBDekTreeView_TEST1.Selected);
      end;

      procedure TfrmMain.actHelpContentExecute(Sender: TObject);
      begin
        Application.HelpSystem.ShowTopicHelp('index.htm', 'ugtu_help.chm');

      end;

      procedure TfrmMain.actShowTreeExecute(Sender: TObject);
      begin
        Panel3.Visible := actShowTree.Checked;
        DBDekTreeView_TEST1.Visible := actShowTree.Checked;
      end;

      procedure TfrmMain.FormKeyUp(Sender: TObject; var Key: Word;
        Shift: TShiftState);
      var
        ctrl: TWinControl;
        topic: string;
      begin
        if (Key = 112) then
        begin
          topic := '';
          ctrl := self.ActiveControl;
          while (ctrl <> nil) and (topic = '') do
          begin
            // if ctrl.HelpKeyword<>'' then
            topic := ctrl.HelpKeyword;
            ctrl := ctrl.Parent;
          end;
          // showmessage(topic+','+CurrentTopic);
          if (topic <> '') then
            Application.HelpSystem.ShowTopicHelp(topic, 'ugtu_help.chm')
          else
            Application.HelpSystem.ShowTopicHelp(CurrentTopic, 'ugtu_help.chm');

        end;

      end;

      procedure TfrmMain.actAbitFilterExecute(Sender: TObject);
      begin
        { if actAbitCurrent.Checked then
          actAbitAll.Checked := true
          else
          actAbitCurrent.Checked := true;

          actTreeRefreshAction.Execute;
          DBDekTreeView_test1.RefreshExecute(self); }
      end;

      procedure TfrmMain.actAbitMoveExecute(Sender: TObject);
      var
        cur: Integer;
      begin
        frmAbitMove := TfrmAbitMove.Create(self);
        frmAbitMove.IDStudent := TDBNodeAbitStudObject
          (DBDekTreeView_TEST1.Selected.data).ik;
        frmAbitMove.NNAbit := TDBNodeAbitStudObject
          (DBDekTreeView_TEST1.Selected.data).NNAbit;
        frmAbitMove.Hint :=
          inttostr(TDBNodeSpecRecObject(DBDekTreeView_TEST1.Selected.Parent.
          data).Year);
        frmAbitMove.Tag := 0;
        frmAbitMove.ShowModal;
        frmAbitMove.Free;
        ActiveFrame.RefreshFrame;

        cur := DBDekTreeView_TEST1.SelectedObject.Node.Index;
        DBDekTreeView_TEST1.Selected := DBDekTreeView_TEST1.Selected.Parent;
        actTreeRefreshAction.Execute;
        DBDekTreeView_TEST1.SelectNodeByNum(cur, false);

      end;

      procedure TfrmMain.actStartMasterExecute(Sender: TObject);
      var
        dbNode: TDBnodeObject;
      begin
        dbNode := frmMain.DBDekTreeView_TEST1.Selected.data;
        frmNagruzkaKafedraMaster := TfrmNagruzkaKafedraMaster.Create(nil);
        frmNagruzkaKafedraMaster.Connection := dm.DBConnect;
        frmNagruzkaKafedraMaster.KafIK :=
          (dbNode as TDBNodedepartmentObject).ik;
        frmNagruzkaKafedraMaster.StaticText12.Caption :=
          frmNagruzkaKafedraMaster.StaticText12.Caption +
          (dbNode as TDBNodedepartmentObject).ShortName + '".';
        frmNagruzkaKafedraMaster.StaticText23.Caption :=
          frmNagruzkaKafedraMaster.StaticText23.Caption +
          (dbNode as TDBNodedepartmentObject).ShortName +
          '" успешно завершена.';
        frmNagruzkaKafedraMaster.Read;
        frmNagruzkaKafedraMaster.Show;
      end;

      procedure TfrmMain.actStartUOMasterExecute(Sender: TObject);
      begin
        frmNagruzkaUchOtdelMaster := TfrmNagruzkaUchOtdelMaster.Create
          (Application);
        // ShowWindow(frmNagruzkaUchOtdelMaster.Handle, SW_NORMAL);
        frmNagruzkaUchOtdelMaster.Connection := dm.DBConnect;
        frmNagruzkaUchOtdelMaster.Show;
      end;

      procedure TfrmMain.actStatToExcelExecute(Sender: TObject);
      var
        filter: string;
        Year: Integer;
      begin
        // накладываем фильтр в зависомости от выбранного объекта
        try
          if ActiveFrame.FrameObject is TDBNodeRecruitObject then
          begin
            filter := '';
          end;

          if ActiveFrame.FrameObject is TDBNodeFacRecObject then
            filter := 'ik_fac =' +
              inttostr(TDBNodeFacRecObject(ActiveFrame.FrameObject).ik) + '';

          if ActiveFrame.FrameObject is TDBNodeSpecRecObject then
            filter := 'ik_spec_fac =' +
              inttostr(TDBNodeSpecRecObject(ActiveFrame.FrameObject).ik) + '';
          if DMAbiturientNabor.adospAbitGetPostupStatistika.Active then
            Year := DMAbiturientNabor.adospAbitGetPostupStatistika.FieldByName
              ('nnyear').AsInteger
          else
            Year := YearOf(Date);

          TAbitOtchetsController.Instance.ExportAllStatToExcel(Year, filter)
        except
          MessageBox(Handle, 'Произошла ошибка при экспорте данных в Excel.',
            'ИС "УГТУ"', MB_OK);
        end;
      end;

      procedure TfrmMain.actJoinGroupExecute(Sender: TObject);
      begin
        if not(ActiveFrame is TfmZach) then
          Exit;
        TAbitZachislenieController.Instance.Abit_JoinGroup
          (@(ActiveFrame as TfmZach).prikaz);
      end;

      procedure TfrmMain.actJoinGroupUpdate(Sender: TObject);
      begin
        if not(ActiveFrame is TfmZach) then
          Exit;
        if (ActiveFrame is TfmZach) then
          if ((ActiveFrame as TfmZach).prikaz.DataSource <> nil) then
            if ((ActiveFrame as TfmZach).prikaz.DataSource.DataSet <> nil) then
              (Sender as TAction).Enabled :=
                ((ActiveFrame as TfmZach).prikaz.RowCount > 0) and
                ((ActiveFrame as TfmZach).prikaz.DataSource.DataSet.FieldByName
                ('CName_grup').Value = Null)
            else
              (Sender as TAction).Enabled := false;
      end;

      procedure TfrmMain.actKatChangeExecute(Sender: TObject);
      var
        cur: Integer;
      begin
        frmChangeKatZach := tfrmChangeKatZach.Create(self);
        frmChangeKatZach.Student := DBDekTreeView_TEST1.Selected.data;
        frmChangeKatZach.ShowModal;
        frmChangeKatZach.Free;
        // ------------ЗДЕСЬ---------------
        cur := DBDekTreeView_TEST1.SelectedObject.Node.Index;
        DBDekTreeView_TEST1.Selected := DBDekTreeView_TEST1.Selected.Parent;
        actTreeRefreshAction.Execute;
        DBDekTreeView_TEST1.SelectNodeByNum(cur, false);
      end;

      procedure TfrmMain.actGazpromStatementExecute(Sender: TObject);
      begin
        TAbitOtchetsController.Instance.GazpromBankStatementToWord
          (TDBNodeAbitStudObject(DBDekTreeView_TEST1.Selected.data).NNAbit);
      end;

      procedure TfrmMain.actGroupChangeExecute(Sender: TObject);
      begin
        TAbitZachislenieController.Instance.Abit_ChangeGroup
          (@(ActiveFrame as TfmZach).prikaz);
      end;

      procedure TfrmMain.actGroupChangeUpdate(Sender: TObject);
      begin
        if not(ActiveFrame is TfmZach) then
          Exit;
        if ((ActiveFrame as TfmZach).prikaz.DataSource = nil) then
          Exit;
        actGroupChange.Enabled := ((ActiveFrame as TfmZach).prikaz.RowCount > 0)
          and ((ActiveFrame as TfmZach).prikaz.DataSource.DataSet.FieldByName
          ('Cname_grup').Value <> Null);
      end;

      procedure TfrmMain.actCurrentReturnExecute(Sender: TObject);
      begin
        (ActiveFrame as TfmZach).actAbitReturnExecuteExecute(Sender);
      end;

      procedure TfrmMain.actCallSprExecute(Sender: TObject);
      begin
        FormSprForGrup
          (TDBNodeGroupObject(DBDekTreeView_TEST1.Selected.data).ik, 3);
      end;

      procedure TfrmMain.actCallSprUpdate(Sender: TObject);
      begin
        // if not (ActiveFrame is TfmZach) then exit;
        // if ((ActiveFrame as TfmZach).prikaz.DataSource= nil) then exit;
        // actCallSpr.Enabled:=
        // ((ActiveFrame as TfmZach).prikaz.DataSource.DataSet.FieldByName('Ik_form_ed').Value=2);
      end;

      procedure TfrmMain.actChangeSemFilterExecute(Sender: TObject);
      begin
        if actCurrentSem.Checked then
          actAllSem.Checked := true
        else
          actCurrentSem.Checked := true;

        actTreeRefreshAction.Execute;
        DBDekTreeView_TEST1.RefreshExecute(self);
      end;

      procedure TfrmMain.GetLichnKartStud(ncode: Integer; ik_grup: Integer);
      var
        E: variant;
        str: string;
      begin

        dmStudentSelectionProcs.adolichnKartStud.Close;
        dmStudentSelectionProcs.adolichnKartStud.Parameters.Clear;
        dmStudentSelectionProcs.adolichnKartStud.Parameters.CreateParameter
          ('@ncode', ftInteger, pdInput, 0, ncode);
        dmStudentSelectionProcs.adolichnKartStud.Parameters.CreateParameter
          ('@ik_grup', ftInteger, pdInput, 0, ik_grup);
        dmStudentSelectionProcs.adolichnKartStud.Open;

        if dmStudentSelectionProcs.adolichnKartStud.RecordCount = 1 then
        begin
          try
            E := CreateOleObject('Excel.Application');
            str := ExtractFilePath(Application.ExeName) +
              'reports\kartstud.xlt';
            E.WorkBooks.Add(str);
            E.Visible := false;
            E.sheets[1].Select;

            // photo
            { if (dmStudentSelectionProcs.adolichnKartStud.Fields[1].Value <> Null) and (dmStudentSelectionProcs.adolichnKartStud.Fields[1].Value <> '') then
              begin
              //(dm.adolichnKartStud.Fields[1] as TBlobField)
              end; }

            E.range['q4'] := dmStudentSelectionProcs.adolichnKartStud.Fields
              [2].AsString;
            E.range['o6'] := dmStudentSelectionProcs.adolichnKartStud.Fields
              [3].AsString;
            E.range['o7'] := dmStudentSelectionProcs.adolichnKartStud.Fields
              [4].AsString;
            E.range['o8'] := dmStudentSelectionProcs.adolichnKartStud.Fields
              [5].AsString;
            E.range['o9'] := dmStudentSelectionProcs.adolichnKartStud.Fields
              [6].AsString;

            if dmStudentSelectionProcs.adolichnKartStud.Fields[7].AsBoolean then
              E.range['n11'] := 'Мужской'
            else
              E.range['n11'] := 'Женский';

            E.range['n12'] := dmStudentSelectionProcs.adolichnKartStud.Fields
              [8].AsString;
            E.range['n15'] := dmStudentSelectionProcs.adolichnKartStud.Fields
              [9].AsString;

            E.range['n18'] := dmStudentSelectionProcs.adolichnKartStud.Fields
              [10].AsString;

            E.range['n19'] := dmStudentSelectionProcs.adolichnKartStud.Fields
              [11].AsString;

            E.range['n22'] := dmStudentSelectionProcs.adolichnKartStud.Fields
              [12].AsString;

            str := dmStudentSelectionProcs.adolichnKartStud.Fields[13].AsString;
            if dmStudentSelectionProcs.adolichnKartStud.Fields[14].AsBoolean
            then
              str := str + ', наличие детей';
            E.range['n25'] := str;

            with dmStudentSelectionProcs.aspSelFamily do
            begin
              Active := false;
              Parameters.Clear;
              Parameters.AddParameter;
              Parameters[0].Value := ncode;
              ExecProc;
              Active := true;
            end;

            dmStudentSelectionProcs.aspSelFamily.First;
            while not dmStudentSelectionProcs.aspSelFamily.Eof do
            begin
              if ((dmStudentSelectionProcs.aspSelFamily.FieldByName
                ('ik_memb_fam').Value = 25) or
                (dmStudentSelectionProcs.aspSelFamily.FieldByName('ik_memb_fam')
                .Value = 26)) then
              begin
                str := dmStudentSelectionProcs.aspSelFamily.FieldByName('Фио')
                  .AsString + ' ' + dmStudentSelectionProcs.aspSelFamily.
                  FieldByName('Дата рождения').AsString + ' ';
                if dmStudentSelectionProcs.aspSelFamily.FieldByName('pred')
                  .AsString <> 'не указано' then
                  str := str + dmStudentSelectionProcs.aspSelFamily.FieldByName
                    ('pred').AsString + ' ';
                str := str + dmStudentSelectionProcs.aspSelFamily.FieldByName
                  ('должность').AsString + ' ' +
                  dmStudentSelectionProcs.aspSelFamily.FieldByName
                  ('адрес').AsString;
                E.range['n28'] := str;
              end;
              if ((dmStudentSelectionProcs.aspSelFamily.FieldByName
                ('ik_memb_fam').Value = 15) or
                (dmStudentSelectionProcs.aspSelFamily.FieldByName('ik_memb_fam')
                .Value = 18)) then
              begin
                str := dmStudentSelectionProcs.aspSelFamily.FieldByName('Фио')
                  .AsString + ' ' + dmStudentSelectionProcs.aspSelFamily.
                  FieldByName('Дата рождения').AsString + ' ';
                if dmStudentSelectionProcs.aspSelFamily.FieldByName('pred')
                  .AsString <> 'не указано' then
                  str := str + dmStudentSelectionProcs.aspSelFamily.FieldByName
                    ('pred').AsString + ' ';
                str := str + dmStudentSelectionProcs.aspSelFamily.FieldByName
                  ('должность').AsString + ' ' +
                  dmStudentSelectionProcs.aspSelFamily.FieldByName
                  ('адрес').AsString;
                E.range['n31'] := str;
              end;
              dmStudentSelectionProcs.aspSelFamily.Next;
            end;

            str := dmStudentSelectionProcs.adolichnKartStud.Fields[15].AsString;
            if dmStudentSelectionProcs.adolichnKartStud.Fields[16].Value <> ''
            then
              str := str + ' сот. тел.' +
                dmStudentSelectionProcs.adolichnKartStud.Fields[16].AsString;
            E.range['n33'] := str;

            str := dmStudentSelectionProcs.adolichnKartStud.Fields[17].AsString;
            if dmStudentSelectionProcs.adolichnKartStud.Fields[18].Value <> ''
            then
              str := str + ' тел.' + dmStudentSelectionProcs.adolichnKartStud.
                Fields[18].AsString;
            E.range['n36'] := str;

            // E.Sheets[1].PageSetup.LeftFooter:='&5' + TApplicationController.GetInstance.DocumentFooter;
            E.Visible := true;

          except
            E.Quit;
            E := UnAssigned;
          end;

        end;

      end;

      function TfrmMain.GetPanel8: TDataProcessingSplashDlg;
      const
        FInternalPanel8: TDataProcessingSplashDlg = nil;
      begin
        if not Assigned(FInternalPanel8) then
        begin
          FInternalPanel8 := TDataProcessingSplashDlg.Create(self);
        end;
        result := FInternalPanel8;
      end;

      function TfrmMain.LoadScheduleBookmarks: Boolean;
      var
        ikList: TStringList;
        i: Integer;
        newca: TActionClientItem;
      begin
        result := false;
        ikList := TSheduleController.MainFunctions.GetAllBookmarks;
        if Assigned(ikList) then
        begin
          for i := 0 to ikList.Count - 1 do
          begin
            ActionManager1.ActionBars[3].Items[0].Items[2].Visible := true;
            newca := ActionManager1.ActionBars[3].Items[0].Items.Add;
            newca.Action := TAction.Create(frmMain.alMainActions);
            newca.Action.OnExecute := OnScheduleBookmarkExecute;
            newca.Action.OnUpdate := actFilleMenuUpdate;
            newca.Action.Tag := strtoint(ikList[i]);
            newca.Caption := TSheduleController.MainFunctions.
              GetScheduleBookmarkName(strtoint(ikList[i]));
          end;
          ikList.Free;
          actScheduleBookmarks.Tag := 1;
          result := true;
        end;
      end;

      procedure TfrmMain.actLichnKartStudExecute(Sender: TObject);
      begin
        GetLichnKartStud(TDBNodeStudObject(ActiveFrame.FrameObject).id,
          TDBNodeGroupObject(TDBNodeStudObject(ActiveFrame.FrameObject)
          .Node.Parent.data).ik);
      end;

end.
