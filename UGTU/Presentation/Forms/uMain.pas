unit uMain;
  {#Author support@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, DBTV, DBTVObj, DBTVDekanat, NagruzkaController,
  DBDekTreeView_TEST, Menus, ExtCtrls, ActnList, XPStyleActnCtrls, ActnMan,
  ToolWin, ActnCtrls, ImgList, StdStyleActnCtrls, uBaseFrame, Buttons,
  ActnMenus, Grids, DBGridEh, DateUtils, DBTVAdminObj, uUSerFrame, GeneralController, UchPlanController
  ,ABIT_nabor_frame,ABIT_rasp_frame,ABIT_year_frame,ABIT_zachislenie_frame,DBTVFacZachobj,DBTVSpecZachobj,uAbitDinamica, uAbitCard,
  Spin, Mask, DBCtrlsEh, DBLookupEh, Wininet, shlobj, ShellAPI, DBCtrls,ComObj,
  ABIT_zhurnal, STOHTMLHelp, ComCtrls, uQueryMaster, uMethodWork, DBTVMethodWorkobj, DBTVFacMethodWorkObj,
  uMethodWorkFac, DBTVMethodWorkdepobj, uMethodWorkDep, DBTVMethodWorkTeacherobj, uMethodWorkPrep,
  uShedule, uSheduleFac, uSheduleDep, DBTVFacScheduleobj, DBTVRootScheduleobj, DBTVDepScheduleobj, DBTVOKObj, uDiplomOtdKadr,
  DataProcessingSplashDialog, uAppTweaks, uLocalLogController, uAbitReturn, jpeg, VersionController, NewClientVersionDetectedFrm,
  xmldom, XMLIntf, msxmldom, XMLDoc, uDMAbiturientNabor, ExceptionBase, CommonIntf,HOST_AddZayav, uChangeKatZach, uCertificateDialog,
  System.Actions;

type
  TSearchPanelType = (sptStudent, sptPrepod, sptAbiturient, sptMethodWork, sptShedule, sptRIO, sptNone);

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
    //actMakeVed: TAction;
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
    procedure FormCreate(Sender: TObject);
    
    procedure DBDekTreeView_TEST1Change(Sender: TObject; Node: TTreeNode);
    procedure SpeedButton4Click(Sender: TObject);
    procedure rbShowAllClick(Sender: TObject);
    procedure actTreeRefreshActionExecute(Sender: TObject);
    procedure DBDekTreeView_TEST1Collapsing(Sender: TObject;
      Node: TTreeNode; var AllowCollapse: Boolean);
    procedure DBDekTreeView_TEST1Expanding(Sender: TObject;
      Node: TTreeNode; var AllowExpansion: Boolean);
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
    procedure MainMenuBarPopup(Sender: TObject;
      Item: TCustomActionControl);
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
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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


  private
     FFrame:TfmBase;
    procedure SetFrame(FrameClass:TBaseFrameClass);
    procedure FixButton();
    procedure GetLichnKartStud(ncode: integer; ik_grup: integer);
    function GetPanel8: TDataProcessingSplashDlg;
    function LoadScheduleBookmarks(): boolean;
  public
    CurrentTopic: String;
    procedure Comment(str1, str2: String);
    procedure SetCurrentSearchPanel(ASearchPanelType: TSearchPanelType);
    property ActiveFrame:TfmBase read FFrame;
    property Frame:TBaseFrameClass write SetFrame;
    procedure OnScheduleBookmarkExecute(Sender: TObject);
  end;

var
  frmMain: TfrmMain;
  LastSelectedNode: TTreeNode;
  lastCancel, alreadySpec: Boolean;
  // ���� "������ ��� ������ ������" �� ��������� ���������
  // �������� ������� ���������


implementation


uses uLogin, uDM, uSpravFram, uFac, uGroup, uStudent, uSpec, uNagruzka, uNagruzkaFac, uNagruzkaDep,
  uUni, DBTVRootobj,DBTVPrikobj, DBTVTeacherobj, DBTVgroupobj, DBTVAbitobj, DBTVRecruitObj,
  DBTVScheduleObj, DBTVBusinessobj, DBTVdepobj,DBTVzachobj, DBTVSpecobj, DBTVFacobj,DBTVFacDepobj,DBTVDictobj, DBTVStudobj,
  uUchPlan, uStudDlg, uPrik, uPrikDlg, uGroupEdtDlg, uAbout, uNapr, DBTVWorkTypeObj, DBTVSemesterNagrObj,
  uNaprClose, uOtchislStud, uVosstStud, uPerevStud, uAcadem, DBTVSemesterScheduleobj,
  uChangeLastName, uChangePassport, uNagruzkaAddPrep,DBTVFacRecobj,DBTVSpecRecobj,
  uLevelUp,DBTVStudAbitObj, uabitDialog,DBTVAbitYearObj, uPostupdlg,
  uAcademReturn, uUniteGroups, uAbitMove, uExtendSession, uJoinGroup, uDMStudentSelectionProcs,
  uDMStudentActions, uDMPrikaz, uDMUgtuStructure, uDMAbiturientAction,
  uDMAbiturientOtchety, uNagruzkaKafedraMaster, uNagruzkaUchOtdelMaster,
  uDMAbiturientZachisl, uAbitZachislenieController, uNagruzkaPrepAllInfo,
  uSheduleSemester, uAbitOtchetsController,udmUspevaemost, SheduleController,
  uNagruzkaSemester, ApplicationController,uAbitConfirm, udmCauses, DBTVInviteObj,
  HOST_Zaselenie, DBTVInviteHostObj, DBTVHabitatsObj,HOST_Projivaysh,DBTVHabitatsPersonObj,
  uPerson;

{$R *.dfm}



procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var usrAnswer:integer;
begin
 if lastCancel then
  begin
    lastCancel := false;
    Exit;
  end;
  if Fframe<>nil then
    if (FFrame.Modified) then
    begin
      usrAnswer := MessageBox(Handle, '��������� ���������?', PWideChar(Application.Title), MB_YESNOCANCEL or MB_ICONQUESTION);
      lastCancel := false;
      if usrAnswer=IDYES then
      begin
        if FFrame.Apply = false then
        begin
         Action := caNone;
         Exit;
        end;
      end;
      if usrAnswer=IDCANCEL then
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

  Application.HelpFile:='';
  WindowState:= wsMaximized;
  FixButton;
  dm.DBConnect.Connected := false;
  DBDekTreeView_TEST1.Connection := dm.DBConnect;

  try
  DBDekTreeView_TEST1.UserLogin:=TApplicationController.GetInstance.LoginName;
  DBDekTreeView_TEST1.root:=DBDekTreeView_TEST1.AddRoot;

  except

  end;
end;

procedure TfrmMain.SetCurrentSearchPanel(ASearchPanelType: TSearchPanelType);
begin
  StudSearchPanel.Visible:= ASearchPanelType = sptStudent;
  TeacherSearchPanel.Visible:= ASearchPanelType = sptPrepod;
  ScheduleBookmarksPanel.Visible:= ASearchPanelType = sptShedule;
  if (ASearchPanelType = sptShedule) and (actScheduleBookmarks.Tag = 0) then
    LoadScheduleBookmarks;
end;

procedure TfrmMain.SetFrame(FrameClass: TBaseFrameClass);
begin
  if (FrameClass = nil) then
  begin
     FFrame:=nil;
     exit;
  end;

  if Assigned(ActiveFrame) then
  begin
    ActiveFrame.Visible:= false;
    ActiveFrame.CloseFrame;
    if ActiveFrame is TfmStudent then begin
    TDBnodeObject(ActiveFrame.FrameObject).AssociatedObject:=nil;
    ActiveFrame.Free;
    end;
  end;

  if (self.DBDekTreeView_TEST1.SelectedObject.AssociatedObject=nil) then
  begin
    FFrame:=FrameClass.CreateFrame(nil, self.DBDekTreeView_TEST1.SelectedObject, dm.DBConnect);
    self.DBDekTreeView_TEST1.SelectedObject.AssociatedObject:=FFrame;
    FFrame.Align:=alClient;
    FFrame.Parent:=frmMain.Panel1;
  end
  else
  begin
    if (self.DBDekTreeView_TEST1.SelectedObject.AssociatedObject is FrameClass) then
    FFrame:=(self.DBDekTreeView_TEST1.SelectedObject.AssociatedObject as tFmBase);
  end;

  FFrame.Visible:=true;

end;



procedure TfrmMain.DBDekTreeView_TEST1Change(Sender: TObject;
  Node: TTreeNode);
var
  dbNode: TDBNodeObject;
  ndSpec: TDBNodeSpecObject;
  ndFac: TDBNodeFacultyObject;
  ndGroup: TDBNodeGroupObject;
  tempStoredProc: TADOStoredProc;
  prepFilterAction: TAction;
  usrAnswer: Integer; // ����� ������������ �� ������ � ���������� ��������� �� ������
  tempstring: string;
begin

CurrentTopic:='Main_windows.htm';
//DBDekTreeView_TEST1.PopupMenu:=ppmTree;
actShowStud.Visible:= false;
actFilterGroup.Visible:= false;
actYearFilter.Visible:= false;
actChangeSemfilter.Visible:= false;
actPrepodsFilter.Visible:= false;
actAbitFilter.Visible:= false;
actFilterKaf.Visible:=false;

  if lastCancel then
  begin
    lastCancel := false;
    Exit;
  end;
  if Fframe<>nil then
    if (FFrame.Modified) then
    begin
      usrAnswer := MessageBox(Handle, '��������� ���������?', '�� �������',
                                                              MB_YESNOCANCEL);

      lastCancel := false;
      if usrAnswer=IDYES then
      begin
        if FFrame.Apply = false then
        begin
          lastCancel := true;
         DBDekTreeView_TEST1.Select(LastSelectedNode);
          Exit;
        end;
      end;
      if usrAnswer=IDCANCEL then
      begin
        lastCancel := true;
        DBDekTreeView_TEST1.Select(LastSelectedNode);
         Exit;
      end;
    end;
  dbNode:=Node.data;
  LastSelectedNode := DBDekTreeView_TEST1.Selected;

  if (dbNode is TDBNodeAbitObject) then
  begin
  actYearFilter.Visible:= true;
    Caption:= TApplicationController.GetInstance.ProgramName + ' - [�����������]';
    Comment('����������� ����', '');
    TApplicationController.GetInstance.AddLogEntry('���� ���������� "����������". ���������: '+StatusBar1.Panels.Items[0].Text+'/'+StatusBar1.Panels.Items[1].Text+'/'+StatusBar1.Panels.Items[2].Text);
    SetCurrentSearchPanel(sptAbiturient);
    Frame:=TfmABITdinamica;
    FFrame.RefreshFrame;
  end;

  if (dbNode is TDBNodeZachObject) then
  begin
    Caption:= TApplicationController.GetInstance.ProgramName + ' - [�����������]- ����������';
    Comment('����������� ����', '');
    TApplicationController.GetInstance.AddLogEntry('���� "����������". ���������: '+StatusBar1.Panels.Items[0].Text+'/'+StatusBar1.Panels.Items[1].Text+'/'+StatusBar1.Panels.Items[2].Text);
    SetCurrentSearchPanel(sptAbiturient);
     Frame:=TfmZach;
    FFrame.RefreshFrame;
  end;

  if (dbNode is TDBNodeFacZachObject) then
  begin
    Caption:= TApplicationController.GetInstance.ProgramName + ' - [�����������]- ����������';
    Comment('����������� ����', '���������: ' + dbNode.Name);
    TApplicationController.GetInstance.AddLogEntry('���� "���������� - ���������". ���������: '+StatusBar1.Panels.Items[0].Text+'/'+StatusBar1.Panels.Items[1].Text+'/'+StatusBar1.Panels.Items[2].Text);
    SetCurrentSearchPanel(sptAbiturient);
     Frame:=TfmZach;
    FFrame.RefreshFrame;
  end;


 if (dbNode is TDBNodeAbitStudObject) then
  begin
  CurrentTopic:='A_Abit_frame.htm';
    Caption:= TApplicationController.GetInstance.ProgramName + ' - [�����������]';
    Comment('������������� :'+ dbNode.Node.Parent.Text,dbNode.Node.Text);
    TApplicationController.GetInstance.AddLogEntry('���� "����������". ���������: '+StatusBar1.Panels.Items[0].Text+'/'+StatusBar1.Panels.Items[1].Text+'/'+StatusBar1.Panels.Items[2].Text);
    SetCurrentSearchPanel(sptAbiturient);
    (dbNode as TDBNodeAbitStudObject).LoadData;
    Frame:=TFmAbitCard;
    FFrame.RefreshFrame;
     exit;
  end;

   if (dbNode is TDBNodeSpecZachObject) then
  begin
    Caption:= TApplicationController.GetInstance.ProgramName + ' - [�����������]- ����������';
    Comment('����������� ����', '�������������: ' + dbNode.Name);
    TApplicationController.GetInstance.AddLogEntry('���� "���������� - �������������". ���������: '+StatusBar1.Panels.Items[0].Text+'/'+StatusBar1.Panels.Items[1].Text+'/'+StatusBar1.Panels.Items[2].Text);
    SetCurrentSearchPanel(sptAbiturient);
     Frame:=TfmZach;
    FFrame.RefreshFrame;
    exit;
  end;

  if (dbNode is TDBNodeFacRecObject) then
  begin
  CurrentTopic:='A_Nabor_frame.htm';
    Caption:= TApplicationController.GetInstance.ProgramName + ' - [�����������]- �����';
    Comment('����������� ����', '���������: ' + dbNode.Name);
    TApplicationController.GetInstance.AddLogEntry('���� "����� - ���������". ���������: '+StatusBar1.Panels.Items[0].Text+'/'+StatusBar1.Panels.Items[1].Text+'/'+StatusBar1.Panels.Items[2].Text);
    SetCurrentSearchPanel(sptAbiturient);
    Frame:=TfmAbitNabor;
    FFrame.RefreshFrame;
  end;

  if (dbNode is TDBNodeAbitYearObject) then
  begin
  CurrentTopic:='A_Year_frame.htm';
    Caption:= TApplicationController.GetInstance.ProgramName + ' - [�����������]- ���';
    Comment('����������� ����', '���: ' + inttostr(TDBNodeAbitYearObject(dbNode).ik));
    TApplicationController.GetInstance.AddLogEntry('����������. ���� "��� ������". ���������: '+StatusBar1.Panels.Items[0].Text+'/'+StatusBar1.Panels.Items[1].Text+'/'+StatusBar1.Panels.Items[2].Text);
    SetCurrentSearchPanel(sptAbiturient);
    Frame:=TfmAbitYears;
    FFrame.RefreshFrame;
  end;

   if (dbNode is TDBNodeSpecRecObject) then
  begin
  CurrentTopic:='A_Nabor_frame.htm';
    Caption:= TApplicationController.GetInstance.ProgramName + ' - [�����������]- �����';
    Comment('����������� ����', '�������������: ' + dbNode.Name);

    actAbitFilter.Visible:= true;

    ActAbitExiled.Checked:=(dbNode as TDBNodeSpecRecObject).ShowExiled;
    ActAbitMoved.Checked:=(dbNode as TDBNodeSpecRecObject).ShowMoved;
    ActAbitCurrent.Checked:=(dbNode as TDBNodeSpecRecObject).ShowCurrent;
    ActAbitChecked.Checked:=(dbNode as TDBNodeSpecRecObject).ShowChecked;

    TApplicationController.GetInstance.AddLogEntry('���� "����� - �������������". ���������: '+StatusBar1.Panels.Items[0].Text+'/'+StatusBar1.Panels.Items[1].Text+'/'+StatusBar1.Panels.Items[2].Text);
   SetCurrentSearchPanel(sptAbiturient);
     Frame:=TfmAbitNabor;
    FFrame.RefreshFrame;
  end;


  if (dbNode is TDBNodeScheduleObject) then
  begin
  CurrentTopic:='A_Timetable_frame.htm';
    Caption:= '�� "����" - [����������� - ���������� � ����������]';
    SetCurrentSearchPanel(sptAbiturient);
    Comment('����������� ����', '');
    TApplicationController.GetInstance.AddLogEntry('���� "����������". ���������: '+StatusBar1.Panels.Items[0].Text+'/'+StatusBar1.Panels.Items[1].Text+'/'+StatusBar1.Panels.Items[2].Text);
     Frame:=TfmAbitRasp;
    FFrame.RefreshFrame;
  end;

  if (dbNode is TDBNodeInviteObject) then
  begin
  CurrentTopic:='A_Timetable_frame.htm';
    Caption:= '�� "����" - [��������� - ���������]';
    Comment('��������� ����', '');
    TApplicationController.GetInstance.AddLogEntry('���� "���������". ���������: '+StatusBar1.Panels.Items[0].Text+'/'+StatusBar1.Panels.Items[1].Text+'/'+StatusBar1.Panels.Items[2].Text);
     Frame:=TfmHOST_Zaselenie;
    FFrame.RefreshFrame;
  end;

  if (dbNode is TDBNodeInviteHostObject) then
  begin
  CurrentTopic:='A_Timetable_frame.htm';
    Caption:= '�� "����" - [��������� - ���������]';
    Comment('��������� ����', '');
    TApplicationController.GetInstance.AddLogEntry('���� "���������". ���������: '+StatusBar1.Panels.Items[0].Text+'/'+StatusBar1.Panels.Items[1].Text+'/'+StatusBar1.Panels.Items[2].Text);
     Frame:=TfmHOST_Zaselenie;
    FFrame.RefreshFrame;
  end;

  if (dbNode is TDBNodeHabitatsObject) then
  begin
  CurrentTopic:='A_Timetable_frame.htm';
    Caption:= '�� "����" - [��������� - �����������]';
    Comment('��������� ����', '');
    TApplicationController.GetInstance.AddLogEntry('���� "�����������". ���������: '+StatusBar1.Panels.Items[0].Text+'/'+StatusBar1.Panels.Items[1].Text+'/'+StatusBar1.Panels.Items[2].Text);
     Frame:=TfmHOST_Projivaysh;
    FFrame.RefreshFrame;
  end;

  if (dbNode is TDBNodeHabitatsPersonObject) then
  begin
  CurrentTopic:='A_Timetable_frame.htm';
    Caption:= '�� "����" - [��������� - �����������]';
    (dbNode as TDBNodeHabitatsPersonObject).LoadData;
    Frame:=TfmPerson;
    //fmPerson.ncode:=(TDBNodeHabitatsPersonObject(DBDekTreeView_TEST1.Selected.Data).ncode);
    FFrame.FrameObject:=dbNode;
    ActiveFrame.DataSet := (dbNode as TDBNodeHabitatsPersonObject).Dataset;
    Comment('��������� ����', '');
    TApplicationController.GetInstance.AddLogEntry('���� "�����������". ���������: '+StatusBar1.Panels.Items[0].Text+'/'+StatusBar1.Panels.Items[1].Text+'/'+StatusBar1.Panels.Items[2].Text);
    FFrame.RefreshFrame;
  end;

  if (dbNode is TDBNodeAdminObject) then
  begin
    Caption:= TApplicationController.GetInstance.ProgramName + ' - [�����������������]';
    Frame:=TfmUsers;
    FFrame.RefreshFrame;
    Comment('����������������� �������', '��������� �������: ' + (FFrame as TfmUsers).dbcbElement.Text);
    TApplicationController.GetInstance.AddLogEntry('���� "�����������������". ���������: '+StatusBar1.Panels.Items[0].Text+'/'+StatusBar1.Panels.Items[1].Text+'/'+StatusBar1.Panels.Items[2].Text);
    SetCurrentSearchPanel(sptNone);
  end;

  if (dbNode is TDBNodeRecruitObject) then
  begin
  CurrentTopic:='A_Nabor_frame.htm';
    Caption:= TApplicationController.GetInstance.ProgramName + ' - [����������� - �����]';
    Comment('����������� ����', '');
     TApplicationController.GetInstance.AddLogEntry('����������. ���� "�����". ���������: '+StatusBar1.Panels.Items[0].Text+'/'+StatusBar1.Panels.Items[1].Text+'/'+StatusBar1.Panels.Items[2].Text);
    SetCurrentSearchPanel(sptAbiturient);
    Frame:=TfmAbitNabor;
    FFrame.RefreshFrame;
  end;

  if (dbNode is TDBNodeRootObject) then
  begin
    Frame:=TfmUni;
    ActiveFrame.DataSet := (dbNode as TDBNodeRootObject).AdoDataset;
    Caption:= TApplicationController.GetInstance.ProgramName + ' - [�������]';
    Comment('�������� ���� (�����������: ' + IntToStr((dbNode as TDBNodeRootObject).AdoDataset.RecordCount) + ')', '');
     TApplicationController.GetInstance.AddLogEntry('���� ���������� "��������". ���������: '+StatusBar1.Panels.Items[0].Text+'/'+StatusBar1.Panels.Items[1].Text+'/'+StatusBar1.Panels.Items[2].Text);
    SetCurrentSearchPanel(sptStudent);
  end;

    if (dbNode is TDBNodeRootScheduleObject) then
  begin
    Frame:= TfmShedule;
    ActiveFrame.DataSet := (dbNode as TDBNodeRootScheduleObject).AdoDataset;
    Comment('���������� ���� (���������: ' + IntToStr((dbNode as TDBNodeRootScheduleObject).AdoDataset.RecordCount) + ')', '');
        TApplicationController.GetInstance.AddLogEntry('���� ���������� "����������". ���������: '+StatusBar1.Panels.Items[0].Text+'/'+StatusBar1.Panels.Items[1].Text+'/'+StatusBar1.Panels.Items[2].Text);
    FFrame.RefreshFrame;
    Caption:= TApplicationController.GetInstance.ProgramName + ' - [����������]';
    SetCurrentSearchPanel(sptShedule);
    exit;
  end;

  if (dbNode is TDBNodeSemesterScheduleObject) then
  begin
    Frame:= TfmSheduleSemester;
    (ActiveFrame as TfmSheduleSemester).YearIK:= (dbNode as TDBNodeSemesterScheduleObject).IK_Year;
    (ActiveFrame as TfmSheduleSemester).SemIK:= (dbNode as TDBNodeSemesterScheduleObject).IK_Semtype;

    ActiveFrame.DataSet := (dbNode as TDBNodeSemesterScheduleObject).AdoDataset;
    Comment('������� �������: ' + (dbNode as TDBNodeSemesterScheduleObject).Name + ' (�����������: ' + IntToStr((dbNode as TDBNodeSemesterScheduleObject).AdoDataset.RecordCount) + ')', '');
    TApplicationController.GetInstance.AddLogEntry('����������. ���� "�������". ���������: '+StatusBar1.Panels.Items[0].Text+'/'+StatusBar1.Panels.Items[1].Text+'/'+StatusBar1.Panels.Items[2].Text);
    FFrame.RefreshFrame;
    Caption:= TApplicationController.GetInstance.ProgramName + ' - [���������� - ' + (dbNode as TDBNodeSemesterScheduleObject).Name + ']';
    SetCurrentSearchPanel(sptShedule);
    exit;
  end;

  if (dbNode is TDBNodeFacultyScheduleObject) then
  begin
    Frame:= TfmSheduleFac;
    ActiveFrame.DataSet := (dbNode as TDBNodeFacultyScheduleObject).AdoDataset;
    (ActiveFrame as TfmSheduleFac).IK:= (dbNode as TDBNodeFacultyScheduleObject).ik;
    (ActiveFrame as TfmSheduleFac).YearIK:= (dbNode as TDBNodeFacultyScheduleObject).IK_Year;
    (ActiveFrame as TfmSheduleFac).SemIK:= (dbNode as TDBNodeFacultyScheduleObject).IK_SemesterType;
    Comment((dbNode as TDBNodeFacultyScheduleObject).Name + ' (������: ' + IntToStr((dbNode as TDBNodeFacultyScheduleObject).AdoDataset.RecordCount) + ')', '');
    TApplicationController.GetInstance.AddLogEntry('����������. ���� "���������". ���������: '+StatusBar1.Panels.Items[0].Text+'/'+StatusBar1.Panels.Items[1].Text+'/'+StatusBar1.Panels.Items[2].Text);
    FFrame.RefreshFrame;
    Caption:= TApplicationController.GetInstance.ProgramName + ' - [���������� - ' + (dbNode as TDBNodeFacultyScheduleObject).Name + ']';
    SetCurrentSearchPanel(sptShedule);
    exit;
  end;

   if (dbNode is TDBNodeScheduledepartmentObject) then
  begin

    Frame:= TfmSheduleDep;
    ActiveFrame.DataSet := (dbNode as TDBNodeScheduledepartmentObject).AdoDataset;
    (ActiveFrame as TfmSheduleDep).IK:= (dbNode as TDBNodeScheduledepartmentObject).ik;
    (ActiveFrame as TfmSheduleDep).YearIK:= (dbNode as TDBNodeScheduledepartmentObject).IK_Year;
    (ActiveFrame as TfmSheduleDep).SemIK:= (dbNode as TDBNodeScheduledepartmentObject).IK_SemesterType;

    Comment((dbNode as TDBNodeScheduledepartmentObject).Name, '');
    TApplicationController.GetInstance.AddLogEntry('����������. ���� "�������". ���������: '+StatusBar1.Panels.Items[0].Text+'/'+StatusBar1.Panels.Items[1].Text+'/'+StatusBar1.Panels.Items[2].Text);
    FFrame.RefreshFrame;
    Caption:= TApplicationController.GetInstance.ProgramName + ' - [���������� - ' + (dbNode as TDBNodeScheduledepartmentObject).Name + ']';
    SetCurrentSearchPanel(sptShedule);
    exit;
  end;

  if (dbNode is TDBNodeBusinessObject) then
  begin
   CurrentTopic := '��������\FrameNagr.htm';
    Frame:= TfmNagruzkaMain;
    actChangeSemFilter.Visible:= true;
    ActiveFrame.DataSet := (dbNode as TDBNodeBusinessObject).AdoDataset;
    Comment('�������� ����', '');
    TApplicationController.GetInstance.AddLogEntry('���� ���������� "��������". ���������: '+StatusBar1.Panels.Items[0].Text+'/'+StatusBar1.Panels.Items[1].Text+'/'+StatusBar1.Panels.Items[2].Text);
    FFrame.RefreshFrame;
    Caption:= TApplicationController.GetInstance.ProgramName + ' - [��������]';
    exit;
  end;

  if (dbNode is TDBNodeSemesterNagrObject) then
  begin

    Frame:= TfmNagruzkaSemester;
    (ActiveFrame as TfmNagruzkaSemester).YearIK:= (dbNode as TDBNodeSemesterNagrObject).IK_Year;
    (ActiveFrame as TfmNagruzkaSemester).SemIK:= (dbNode as TDBNodeSemesterNagrObject).IK_Semtype;
    ActiveFrame.DataSet := (dbNode as TDBNodeSemesterNagrObject).AdoDataset;
    Comment('������� �������: ' + (dbNode as TDBNodeSemesterNagrObject).Name + ' (�����������: ' + IntToStr((dbNode as TDBNodeSemesterNagrObject).AdoDataset.RecordCount) + ')', '');
    TApplicationController.GetInstance.AddLogEntry('��������. ���� "������� �������". ���������: '+StatusBar1.Panels.Items[0].Text+'/'+StatusBar1.Panels.Items[1].Text+'/'+StatusBar1.Panels.Items[2].Text);
    FFrame.RefreshFrame;
    Caption:= TApplicationController.GetInstance.ProgramName + ' - [�������� - ' + (dbNode as TDBNodeSemesterNagrObject).Name + ']';
    SetCurrentSearchPanel(sptPrepod);
    exit;
  end;

  if (dbNode is TDBNodeFacultyDepObject) then
  begin
   CurrentTopic := '��������\FrameFac.htm';
    Frame:= TfmNagruzkaFac;
    ActiveFrame.DataSet := (dbNode as TDBNodeFacultyDepObject).AdoDataset;
    (ActiveFrame as TfmNagruzkaFac).IK:= (dbNode as TDBNodeFacultyDepObject).ik;
    (ActiveFrame as TfmNagruzkaFac).YearIK:= (dbNode as TDBNodeFacultyDepObject).IK_Year;
    (ActiveFrame as TfmNagruzkaFac).SemIK:= (dbNode as TDBNodeFacultyDepObject).IK_Semtype;
    Comment((dbNode as TDBNodeFacultyDepObject).Name + ' (������: ' + IntToStr((dbNode as TDBNodeFacultyDepObject).AdoDataset.RecordCount) + ')', '');
    TApplicationController.GetInstance.AddLogEntry('��������. ���� "���������". ���������: '+StatusBar1.Panels.Items[0].Text+'/'+StatusBar1.Panels.Items[1].Text+'/'+StatusBar1.Panels.Items[2].Text);
    FFrame.RefreshFrame;
    Caption:= TApplicationController.GetInstance.ProgramName + ' - [�������� - ' + (dbNode as TDBNodeFacultyDepObject).Name + ']';
    SetCurrentSearchPanel(sptNone);
    actFilterKaf.Visible:= true;
    exit;
  end;


  if (dbNode is TDBNodeMethodWorkObject) then
  begin
    Frame:= TfmMethodWork;
    ActiveFrame.DataSet := (dbNode as TDBNodeMethodWorkObject).AdoDataset;
    FFrame.RefreshFrame;
    Caption:= TApplicationController.GetInstance.ProgramName + ' - [������-������������ ������]';
    Comment('������-������������ ������ ���� (�����������: ' + IntToStr((dbNode as TDBNodeMethodWorkObject).AdoDataset.RecordCount) + ')', '');
    TApplicationController.GetInstance.AddLogEntry('���� ���������� "���". ���������: '+StatusBar1.Panels.Items[0].Text+'/'+StatusBar1.Panels.Items[1].Text+'/'+StatusBar1.Panels.Items[2].Text);
    SetCurrentSearchPanel(sptMethodWork);
    exit;
  end;


   if (dbNode is TDBNodeMetodWorkFacultyObject) then
  begin
    Frame:= TfmMethodWorkFac;
    ActiveFrame.DataSet := (dbNode as TDBNodeMetodWorkFacultyObject).AdoDataset;
    //(ActiveFrame as TfmMethodWorkFac).IK:= (dbNode as TDBNodeFacultyDepObject).ik;
    FFrame.RefreshFrame;
    Caption:= TApplicationController.GetInstance.ProgramName + ' - [������-������������ ������ - ' + (dbNode as TDBNodeMetodWorkFacultyObject).Name + ']';
    Comment((dbNode as TDBNodeMetodWorkFacultyObject).Name + ' (������: ' + IntToStr((dbNode as TDBNodeMetodWorkFacultyObject).AdoDataset.RecordCount)+ ')', '');
    TApplicationController.GetInstance.AddLogEntry('���. ���� "���������". ���������: '+StatusBar1.Panels.Items[0].Text+'/'+StatusBar1.Panels.Items[1].Text+'/'+StatusBar1.Panels.Items[2].Text);
     SetCurrentSearchPanel(sptMethodWork);
    exit;
  end;

  if (dbNode is TDBNodeMethodWorkDepartmentObject) then
  begin
    Frame:= TfmMethodWorkDep;
    ActiveFrame.DataSet := (dbNode as TDBNodeMethodWorkDepartmentObject).AdoDataset;
    //(ActiveFrame as TfmMethodWorkDep).IK:= (dbNode as TDBNodeMethodWorkDepartmentObject).ik;
    FFrame.RefreshFrame;
    Caption:= TApplicationController.GetInstance.ProgramName + ' - [������-������������ ������ - ' + (dbNode as TDBNodeMethodWorkDepartmentObject).Name + ']';
    Comment((dbNode as TDBNodeMethodWorkDepartmentObject).Name+ ' (��������������: ' + IntToStr((dbNode as TDBNodeMethodWorkDepartmentObject).AdoDataset.RecordCount)+ ')', '');
    TApplicationController.GetInstance.AddLogEntry('���. ���� "�������". ���������: '+StatusBar1.Panels.Items[0].Text+'/'+StatusBar1.Panels.Items[1].Text+'/'+StatusBar1.Panels.Items[2].Text);
    SetCurrentSearchPanel(sptMethodWork);
    exit;
  end;

  if (dbNode is TDBNodeMethodWorkTeacherObject) then
  begin
    Frame:= TfmMethodWorkPrep;
    FFrame.RefreshFrame;
    Caption:= TApplicationController.GetInstance.ProgramName + ' - [������-������������ ������ - ' + Trim((dbNode as TDBNodeMethodWorkTeacherObject).LastName) + ' ' + Trim((dbNode as TDBNodeMethodWorkTeacherObject).FirstName) + ' ' + Trim((dbNode as TDBNodeMethodWorkTeacherObject).MiddleName) + ']';
    TApplicationController.GetInstance.AddLogEntry('���. ���� "�������������". ���������: '+StatusBar1.Panels.Items[0].Text+'/'+StatusBar1.Panels.Items[1].Text+'/'+StatusBar1.Panels.Items[2].Text);
    SetCurrentSearchPanel(sptMethodWork);
    exit;
  end;
 //-----------------------------------------

  if (dbNode is TDBNodedepartmentObject) then
  begin
    CurrentTopic := '��������\FrameDep.htm';
    Frame:= TfmNagruzkaDep;
    ActiveFrame.DataSet := (dbNode as TDBNodedepartmentObject).AdoDataset;
    (ActiveFrame as TfmNagruzkaDep).IK:= (dbNode as TDBNodedepartmentObject).ik;
    (ActiveFrame as TfmNagruzkaDep).YearIK:= (dbNode as TDBNodedepartmentObject).IK_Year;
    (ActiveFrame as TfmNagruzkaDep).SemIK:= (dbNode as TDBNodedepartmentObject).IK_Semtype;
    case (dbNode as TDBNodedepartmentObject).FilterType of
    ttvfShowAll: prepFilterAction:= actPFShowAll;
    ttvfShowUnreleased: prepFilterAction:= actPFShowWorked;
    ttvfShowReleased: prepFilterAction:= actPFShowReleased;
    end;
    actPrepodsFilter.Hint:= '������ ��������������: ' + AnsiLowerCase((prepFilterAction as TAction).Caption);
    actPrepodsFilter.Caption:= (prepFilterAction as TAction).Caption;
    actPrepodsFilter.Tag:= (prepFilterAction as TAction).Tag;
    prepFilterAction.Checked:= true;
    Comment((dbNode as TDBNodedepartmentObject).Name + ' (��������������: ' + IntToStr((dbNode as TDBNodedepartmentObject).AdoDataset.RecordCount) + ')', '');
    TApplicationController.GetInstance.AddLogEntry('��������. ���� "�������". ���������: '+StatusBar1.Panels.Items[0].Text+'/'+StatusBar1.Panels.Items[1].Text+'/'+StatusBar1.Panels.Items[2].Text);
    FFrame.RefreshFrame;
    Caption:= TApplicationController.GetInstance.ProgramName + ' - [�������� - ' + (dbNode as TDBNodedepartmentObject).Name + ']';
    SetCurrentSearchPanel(sptNone);
    actPrepodsFilter.Visible:= true;
    exit;
  end;

  if (dbNode is TDBNodeTeacherObject) then
  begin
      CurrentTopic := 'FramePrep.htm';
    Frame:= TfmNagruzkaPrepAllInfo;
    (ActiveFrame as TfmNagruzkaPrepAllInfo).IK:= (dbNode as TDBNodeTeacherObject).ik;
    (ActiveFrame as TfmNagruzkaPrepAllInfo).KafIK:= (dbNode as TDBNodeTeacherObject).KafIK;
    (ActiveFrame as TfmNagruzkaPrepAllInfo).YearIK:= (dbNode as TDBNodeTeacherObject).IK_Year;
    (ActiveFrame as TfmNagruzkaPrepAllInfo).SemIK:= (dbNode as TDBNodeTeacherObject).IK_Semtype;
    Comment(Trim((dbNode as TDBNodeTeacherObject).LastName) + ' ' + Trim((dbNode as TDBNodeTeacherObject).FirstName) + ' ' + Trim((dbNode as TDBNodeTeacherObject).MiddleName), '');
    TApplicationController.GetInstance.AddLogEntry('��������. ���� "�������������". ���������: '+StatusBar1.Panels.Items[0].Text+'/'+StatusBar1.Panels.Items[1].Text+'/'+StatusBar1.Panels.Items[2].Text);
    FFrame.RefreshFrame;
    Caption:= TApplicationController.GetInstance.ProgramName + ' - [�������� - ' + Trim((dbNode as TDBNodeTeacherObject).LastName) + ' ' + Trim((dbNode as TDBNodeTeacherObject).FirstName) + ' ' + Trim((dbNode as TDBNodeTeacherObject).MiddleName) + ']';
    SetCurrentSearchPanel(sptNone);
    exit;
  end;

  if (dbNode is TDBNodeWorkTypeObject) then
  begin
    Frame:= TfmNagruzkaPrepAllInfo;
    (ActiveFrame as TfmNagruzkaPrepAllInfo).IK:= (dbNode as TDBNodeWorkTypeObject).iTab_n;
    (ActiveFrame as TfmNagruzkaPrepAllInfo).KafIK:= (dbNode as TDBNodeWorkTypeObject).KafIK;
    (ActiveFrame as TfmNagruzkaPrepAllInfo).YearIK:= (dbNode as TDBNodeWorkTypeObject).IK_Year;
    (ActiveFrame as TfmNagruzkaPrepAllInfo).SemIK:= (dbNode as TDBNodeWorkTypeObject).IK_Semtype;
    (ActiveFrame as TfmNagruzkaPrepAllInfo).NeedTeacherIK:= (dbNode as TDBNodeWorkTypeObject).ik;
    Comment(Trim(TDBNodeTeacherObject(frmMain.DBDekTreeView_TEST1.Selected.Parent.data).LastName) + ' ' + Trim(TDBNodeTeacherObject(frmMain.DBDekTreeView_TEST1.Selected.Parent.data).FirstName) + ' ' + Trim(TDBNodeTeacherObject(frmMain.DBDekTreeView_TEST1.Selected.Parent.data).MiddleName) + ' - ' + (dbNode as TDBNodeWorkTypeObject).ShortName, '');
    TApplicationController.GetInstance.AddLogEntry('��������. ���� "��� ������". ���������: '+StatusBar1.Panels.Items[0].Text+'/'+StatusBar1.Panels.Items[1].Text+'/'+StatusBar1.Panels.Items[2].Text);
    Caption:= TApplicationController.GetInstance.ProgramName + ' - [�������� - ' + Trim(TDBNodeTeacherObject(frmMain.DBDekTreeView_TEST1.Selected.Parent.data).LastName) + ' ' + Trim(TDBNodeTeacherObject(frmMain.DBDekTreeView_TEST1.Selected.Parent.data).FirstName) + ' ' + Trim(TDBNodeTeacherObject(frmMain.DBDekTreeView_TEST1.Selected.Parent.data).MiddleName) + ' - ' + (dbNode as TDBNodeWorkTypeObject).ShortName + ']';
    FFrame.RefreshFrame;
    SetCurrentSearchPanel(sptNone);
    exit;
  end;

  if (dbNode is TDBNodePrikObject) then
  begin
  CurrentTopic:='Order_frame.htm';
  //frmMain.HelpKeyword:='�������';
    Frame:=TfmPrik;
    FFrame.RefreshFrame;
    Comment('������� (��������: ' + IntToStr((FFrame as TfmPrik).dbgePrik.DataSource.DataSet.RecordCount) + ')', '');
    TApplicationController.GetInstance.AddLogEntry('���� ���������� "�������". ���������: '+StatusBar1.Panels.Items[0].Text+'/'+StatusBar1.Panels.Items[1].Text+'/'+StatusBar1.Panels.Items[2].Text);
    SetCurrentSearchPanel(sptNone);
    Caption:= TApplicationController.GetInstance.ProgramName + ' - [�������]';
  end;

  if (dbNode is TDBNodeGroupObject) then
  begin
  CurrentTopic:='Group_frame.htm';
  //frmMain.HelpKeyword:='������';
    dbNode.AddChildNodes;
    Frame:=TfmGroup;
    ndGroup := (dbNode as TDBNodeGroupObject);
    ActiveFrame.DataSet := ndGroup.AdoDataset;
    (ActiveFrame as TfmGroup).ik := ndGroup.ik;
    tempStoredProc:= TADOStoredProc.Create(nil);
    tempStoredProc.ProcedureName:= 'GetUchPlanForCurGroup';
    tempStoredProc.Parameters.CreateParameter('@ik_group',ftInteger,pdInput,0, ndGroup.ik);
    tempStoredProc.Connection:= dm.DBConnect;
    tempStoredProc.Open;
    if ndGroup.AdoDataset <> nil then
      Comment('������: ' + dbNode.Name + ' (���������: ' + IntToStr(ndGroup.AdoDataset.RecordCount) + ')', '������� ����: ' + tempStoredProc.FieldByName('CName').AsString);
      TApplicationController.GetInstance.AddLogEntry('�������. ���� "������". ���������: '+StatusBar1.Panels.Items[0].Text+'/'+StatusBar1.Panels.Items[1].Text+'/'+StatusBar1.Panels.Items[2].Text);
    tempStoredProc.Close;
    tempStoredProc.Free;
    Caption:= TApplicationController.GetInstance.ProgramName + ' - [������� - ' + dbNode.Name + ']';
    SetCurrentSearchPanel(sptStudent);
    FFrame.RefreshFrame;
    //(ActiveFrame as TfmGroup).dbgrdVed.PopupMenu := ppmStudent;
    //------��������� ShowStudent  (�) SERG
    actShowStud.Visible:= true;
    if (dbNode as TDBNodeGroupObject).ShowStudents=ssShowAll then
    begin
      ActShowStud.Caption:=ActShowAllStudent.Caption;
      actShowAllStudent.Checked:=true
    end else
      if (dbNode as TDBNodeGroupObject).ShowStudents=ssShowExiledOnly then
      begin
        ActShowStud.Caption:=ActShowOtchislStudent.Caption;
        actShowOtchislStudent.Checked:=true
      end else
        if (dbNode as TDBNodeGroupObject).ShowStudents=ssShowAcademOnly then
        begin
          ActShowStud.Caption:=ActShowAcademStudent.Caption;
          actShowAcademStudent.Checked:=true
        end else
        begin
          ActShowStud.Caption:=ActShowUnOtchislStudent.Caption;
          actShowUnOtchislStudent.Checked:=true;
        end;
    //-----------------------------
    if (dbNode.Parent as TDBNodeSpecObject).showActual=true then
    begin
      actFilterGroup.Caption:=actFilterActual.Caption;
      actFilterActual.Checked:=true
    end
    else
    begin
      actFilterGroup.Caption:=actFilterAll.Caption;
      actFilterAll.Checked:=true
    end;

    exit;
  end;

  if (dbNode is TDBNodeDictObject) then
  begin
  CurrentTopic:='Sprav_frame.htm';
   //frmMain.HelpKeyword:='�����������';
    Frame := TfmSprav;
    SetCurrentSearchPanel(sptNone);
    Caption:= TApplicationController.GetInstance.ProgramName + ' - [�����������]';
    Comment('����������� (������������: ' + IntToStr((FFrame as TfmSprav).cbSprav.Items.Count) + ')', '��������� ����������: ' + (FFrame as TfmSprav).cbSprav.Text);
    TApplicationController.GetInstance.AddLogEntry('���� "�����������". ���������: '+StatusBar1.Panels.Items[0].Text+'/'+StatusBar1.Panels.Items[1].Text+'/'+StatusBar1.Panels.Items[2].Text);
  end;

   if (dbNode is TDBNodeOKObject) then
  begin
  //CurrentTopic:='Sprav_frame.htm';
   //frmMain.HelpKeyword:='�����������';
    Frame := TfmDiplomOtdKadr;
    SetCurrentSearchPanel(sptNone);
    Caption:= TApplicationController.GetInstance.ProgramName + ' - [����� ������]';
    Comment('����� ������ - �������','');
    TApplicationController.GetInstance.AddLogEntry('���� "����� ������". ���������: '+StatusBar1.Panels.Items[0].Text+'/'+StatusBar1.Panels.Items[1].Text+'/'+StatusBar1.Panels.Items[2].Text);
  end;

  if (dbNode is TDBNodeFacultyObject) then
  begin
  CurrentTopic:='Faculties_management.htm';
  //frmMain.HelpKeyword:='���������';
    Frame:=TfmFacultet;
    ndFac := (dbNode as TDBNodeFacultyObject);
    ActiveFrame.DataSet := ndFac.AdoDataset;
    (ActiveFrame as TfmFacultet).ik := ndFac.ik;
    Comment('���������: ' + (dbNode as TDBNodeFacultyObject).Name + ' (��������������: ' + IntToStr(ndFac.AdoDataset.RecordCount) + ')', '');
    TApplicationController.GetInstance.AddLogEntry('�������. ���� "���������". ���������: '+StatusBar1.Panels.Items[0].Text+'/'+StatusBar1.Panels.Items[1].Text+'/'+StatusBar1.Panels.Items[2].Text);
    FFrame.RefreshFrame;
    (ActiveFrame as TfmFacultet).tsSessia.ActivePageIndex := 0;
    SetCurrentSearchPanel(sptStudent);
    Caption:= TApplicationController.GetInstance.ProgramName + ' - [������� - ' + (dbNode as TDBNodeFacultyObject).Name + ']';
    exit;
  end;

  if (dbNode is TDBNodeSpecObject) then
  begin
  if alreadySpec then begin alreadySpec:=false; exit; end;
  
  CurrentTopic:='Spec_frame.htm';
    //frmMain.HelpKeyword:='�������������';
    Frame := TfmSpec;
    ndSpec := (dbNode as TDBNodeSpecObject);
    SetCurrentSearchPanel(sptStudent);
    ActiveFrame.DataSet := ndSpec.AdoDataset;
    if not (ActiveFrame is TfmSpec) then exit;
    
    (ActiveFrame as TfmSpec).ik := ndSpec.ik;
    Comment('�������������: ' + dbNode.Name + ' (�����: ' + IntToStr(ndSpec.AdoDataset.RecordCount) + ')', '');
    TApplicationController.GetInstance.AddLogEntry('�������. ���� "�������������". ���������: '+StatusBar1.Panels.Items[0].Text+'/'+StatusBar1.Panels.Items[1].Text+'/'+StatusBar1.Panels.Items[2].Text);
    FFrame.RefreshFrame;
    Caption:= TApplicationController.GetInstance.ProgramName + ' - [������� - ' + dbNode.Name + ']';
    //------��������� ShowStudent  (�) SERG
    actShowStud.Visible:= true;
    if (dbNode as TDBNodeSpecObject).ShowStudents=ssShowAll then begin
    ActShowStud.Caption:=ActShowAllStudent.Caption;
    actShowAllStudent.Checked:=true end else
    if (dbNode as TDBNodeSpecObject).ShowStudents=ssShowExiledOnly then  begin
    ActShowStud.Caption:=ActShowOtchislStudent.Caption;
    actShowOtchislStudent.Checked:=true end  else
    if (dbNode as TDBNodeSpecObject).ShowStudents=ssShowAcademOnly then begin
    ActShowStud.Caption:=ActShowAcademStudent.Caption;
    actShowAcademStudent.Checked:=true end  else
    begin
      ActShowStud.Caption:=ActShowUnOtchislStudent.Caption;
      actShowUnOtchislStudent.Checked:=true;
      end;

      if (dbNode as TDBNodeSpecObject).showActual=true then
      begin
        actFilterGroup.Caption:=actFilterActual.Caption;
        actFilterActual.Checked:=true
      end  else
      begin
        actFilterGroup.Caption:=actFilterAll.Caption;
        actFilterAll.Checked:=true
      end;
    actFilterGroup.Visible:= true;
    //-----------------------------
     exit;
  end;
  if (dbNode is TDBNodeStudObject) then
  begin
  CurrentTopic:='Student_frame.htm';
    //frmMain.HelpKeyword:='�������';
    (dbNode as TDBNodeStudObject).LoadData;
    Frame := TfmStudent;
    FFrame.Hint:=inttostr(TDBNodeGroupObject( DBDekTreeView_TEST1.Selected.Parent.Data).ik);
    FFrame.FrameObject:=dbNode;
    ActiveFrame.DataSet := (dbNode as TDBNodeStudObject).AdoDataset;
    tempStoredProc:= TADOStoredProc.Create(nil);
    tempStoredProc.ProcedureName:= 'GetCurrentKurs_Semestr';
    tempStoredProc.Parameters.CreateParameter('@ik_group',ftInteger,pdInput,0, strtoint(FFrame.Hint));
    tempStoredProc.Connection:= dm.DBConnect;
    tempStoredProc.Open;
    if tempStoredProc.FieldByName('kurs').IsNull then
      tempstring:='���������'
    else
      tempstring:= tempStoredProc.FieldByName('kurs').AsString+' ����, '+tempStoredProc.FieldByName('semestr').AsString+' �������';
    Comment(Trim((dbNode as TDBNodeStudObject).LastName) + ' ' + Trim((dbNode as TDBNodeStudObject).FirstName) + ' ' + Trim((dbNode as TDBNodeStudObject).MiddleName),
     tempstring);
    TApplicationController.GetInstance.AddLogEntry('�������. ���� "�������". ���������: '+StatusBar1.Panels.Items[0].Text+'/'+StatusBar1.Panels.Items[1].Text+'/'+StatusBar1.Panels.Items[2].Text);
    FFrame.RefreshFrame;
    SetCurrentSearchPanel(sptStudent);
    Caption:= TApplicationController.GetInstance.ProgramName + ' - [������� - ' + Trim((dbNode as TDBNodeStudObject).LastName) + ' ' + Trim((dbNode as TDBNodeStudObject).FirstName) + ' ' + Trim((dbNode as TDBNodeStudObject).MiddleName) + ']';
    exit;
  end;
end;

procedure TfrmMain.SpeedButton4Click(Sender: TObject);
begin
   Frame := TfmSprav;
end;

procedure TfrmMain.rbShowAllClick(Sender: TObject);
begin
DBDekTreeView_test1.RefreshExecute(sender);
end;

procedure TfrmMain.actTreeRefreshActionExecute(Sender: TObject);
var dbNode:TDbNodeObject;
begin
  dbNode:=DBDekTreeView_test1.Selected.Data;
  if dbNode is TDBNodeGroupObject then
  begin
    if ActShowAllStudent.Checked then
    begin
      TDBNodeGroupObject(dbNode).ShowStudents:=ssShowAll;
      ActShowStud.Caption:=ActShowAllStudent.Caption;
    end else
      if actShowAcademStudent.Checked then
      begin
        TDBNodeGroupObject(dbNode).ShowStudents:=ssShowAcademOnly;
        ActShowStud.Caption:=ActShowAcademStudent.Caption;
      end else
        if actShowOtchislStudent.Checked then
        begin
          TDBNodeGroupObject(dbNode).ShowStudents:=ssShowExiledOnly;
          ActShowStud.Caption:=actShowOtchislStudent.Caption;
        end
        else
        begin
          TDBNodeGroupObject(dbNode).ShowStudents:=ssShowActualOnly;
          ActShowStud.Caption:=actShowUnOtchislStudent.Caption;
        end;
  end;

  if dbNode is TDBNodeAbitObject then
  begin
    if actFilterAllYear.Checked then begin
TDBNodeAbitObject(dbNode).ShowAllYears:=true;
actYearFilter.Caption:=actFilterAllYear.Caption;
end else
if ActCurFilter.Checked then  begin
TDBNodeAbitObject(dbNode).ShowAllYears:=false;
actYearFilter.Caption:=ActCurFilter.Caption;
end;
end;

if dbNode is TDBNodeSpecRecObject then begin
(dbNode as TDBNodeSpecRecObject).ShowExiled:=ActAbitExiled.Checked;
(dbNode as TDBNodeSpecRecObject).ShowMoved:=ActAbitMoved.Checked;
(dbNode as TDBNodeSpecRecObject).ShowCurrent:=ActAbitCurrent.Checked;
(dbNode as TDBNodeSpecRecObject).ShowChecked:=ActAbitChecked.Checked;

if ActShowPrimary.Checked then ActShowReal.Checked:=true;

(dbNode as TDBNodeSpecRecObject).ShowReal:=ActShowReal.Checked;
(dbNode as TDBNodeSpecRecObject).ShowPrimary:=ActShowPrimary.Checked;
(dbNode as TDBNodeSpecRecObject).ShowSecondary:=ActShowSecondary.Checked;

if not((dbNode as TDBNodeSpecRecObject).ShowReal or (dbNode as TDBNodeSpecRecObject).ShowSecondary) then
begin
(dbNode as TDBNodeSpecRecObject).ShowReal:=true;
actShowReal.Checked:=true;
end;

if not((dbNode as TDBNodeSpecRecObject).ShowExiled or (dbNode as TDBNodeSpecRecObject).ShowMoved or (dbNode as TDBNodeSpecRecObject).ShowCurrent or (dbNode as TDBNodeSpecRecObject).ShowChecked) then
begin
(dbNode as TDBNodeSpecRecObject).ShowCurrent:=true;
ActAbitCurrent.Checked:=true;
end;

end;

if dbNode is TDBNodeSpecObject then begin
if ActShowAllStudent.Checked then begin
TDBNodeSpecObject(dbNode).ShowStudents:=ssShowAll;
ActShowStud.Caption:=ActShowAllStudent.Caption;
end else
if actShowAcademStudent.Checked then  begin
TDBNodeSpecObject(dbNode).ShowStudents:=ssShowAcademOnly;
ActShowStud.Caption:=ActShowAcademStudent.Caption;
end else
if actShowOtchislStudent.Checked then  begin
TDBNodeSpecObject(dbNode).ShowStudents:=ssShowExiledOnly;
ActShowStud.Caption:=actShowOtchislStudent.Caption;
end else begin
TDBNodeSpecObject(dbNode).ShowStudents:=ssShowActualOnly;
ActShowStud.Caption:=actShowUnOtchislStudent.Caption;
end;
end;

if (dbNode is TDBNodeBusinessObject) then
begin
  if actAllSem.Checked then
  begin
    TDBNodeBusinessObject(dbNode).ShowActual:=false;
    actChangeSemfilter.Caption:=actAllSem.Caption;
  end
  else
  if actCurrentSem.Checked then
  begin
    TDBNodeBusinessObject(dbNode).ShowActual:=true;
    actChangeSemfilter.Caption:=actCurrentSem.Caption;
  end;
end;

if (dbNode is TDBNodeSpecObject) then
begin
  if actFilterAll.Checked then
  begin
    TDBNodeSpecObject(dbNode).ShowActual:=false;
    ActFilterGroup.Caption:=actFilterAll.Caption;
  end
  else
  if actFilterActual.Checked then
  begin
    TDBNodeSpecObject(dbNode).ShowActual:=true;
    ActFilterGroup.Caption:=actFilterActual.Caption;
  end;
end;

if (dbNode is TDBNodeGroupObject) then
begin
  if actFilterAll.Checked then
  begin
   ActFilterGroup.Caption:=actFilterAll.Caption;
  end
  else
  if actFilterActual.Checked then
  begin
    ActFilterGroup.Caption:=actFilterActual.Caption;
  end;

end;

if dbNode is TDBNodeFacultyDepObject then begin
if actAllKaf.Checked then begin
TDBNodeFacultyDepObject(dbNode).ShowAllKaf:=true;
actFilterKaf.Caption:=actAllKaf.Caption;
end else
begin
TDBNodeFacultyDepObject(dbNode).ShowAllKaf:=false;
actFilterKaf.Caption:=actCurrentKaf.Caption;
end;
end;

  if dbNode<> nil then
    DBDekTreeView_test1.RefreshNodeExecute(DBDekTreeView_test1.Selected);
//  FFrame.RefreshFrame;
end;

procedure TfrmMain.DBDekTreeView_TEST1Collapsing(Sender: TObject;
  Node: TTreeNode; var AllowCollapse: Boolean);
begin
Node.ImageIndex:=TDBNodeObject(Node.Data).BaseImageIndex;
end;

procedure TfrmMain.DBDekTreeView_TEST1DblClick(Sender: TObject);
begin
DBDekTreeView_TEST1Change(Sender,DBDekTreeView_TEST1.Selected);
end;

procedure TfrmMain.DBDekTreeView_TEST1Expanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
begin
  DBDekTreeView_TEST1.Select(Node);
  Node.ImageIndex:=TDBNodeObject(Node.Data).BaseImageIndex+1;
end;

procedure TfrmMain.actAddUchPlanUpdate(Sender: TObject);
begin
  if (ActiveFrame is TfmSpec) then
    (Sender as TAction).Enabled:= (ActiveFrame as TfmSpec).fmUchPlan1.ActionAddUchPlan.Enabled;
end;

procedure TfrmMain.actAddZayavExecute(Sender: TObject);

begin
 AddZayav:=TAddZayav.create(self);
 AddZayav.NumHost:=TDBNodeInviteHostObject(DBDekTreeView_TEST1.Selected.Data).ik;
 AddZayav.ShowModal;
 AddZayav.Free;
 ActiveFrame.RefreshFrame;

end;

procedure TfrmMain.actAddUchPlanExecute(Sender: TObject);
begin
  if (ActiveFrame is TfmSpec) then
    (ActiveFrame as TfmSpec).fmUchPlan1.ActionEditUchPlanExecute((ActiveFrame as TfmSpec).fmUchPlan1.ActionAddUchPlan);
end;

procedure TfrmMain.N36Click(Sender: TObject);
begin
   Close;
end;

procedure TfrmMain.actFilleMenuUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= true;
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
  StatusBar1.Panels.Items[2].Text := TApplicationController.GetInstance.ServerName + ' (' + TApplicationController.GetInstance.DBName + '; ' + TApplicationController.GetInstance.LoginName + ')';
end;

procedure TfrmMain.actAddStudentFormShowExecute(Sender: TObject);
var
  group:TDBNodeGroupObject;
begin
  group:=TDBNodeGroupObject(DBDekTreeView_TEST1.SelectedObject);
 ftmStudent:=TftmStudent.Create(self);
 ftmStudent.tag:=group.IK;
 ftmStudent.caption:='���������� �������� � ������ '+group.name;
 ftmStudent.showmodal;
 ftmStudent.Free;
end;

procedure TfrmMain.DBDekTreeView_TEST1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Node:TTreeNode;
begin
{  Node:=(sender as TTreeView).GetNodeAt(X, Y);
  if node=nil then exit;
  if not Node.Selected then begin
  Node.Selected:=true;}
  {(sender as TTreeView).Select(node);
  end; }
end;

procedure TfrmMain.actDeleteStudentExecute(Sender: TObject);
begin
if MessageBox(Handle, PWideChar('�� ������������� ������ ������� ��������?'), '�� ����', MB_YESNO)=IDYES then
  begin
  dmStudentActions.aspDelStud.Parameters.Clear;
  dmStudentActions.aspDelStud.Parameters.AddParameter;
  dmStudentActions.aspDelStud.Parameters[0].Value:=TDBNodeStudObject(DBDekTreeView_TEST1.SelectedObject).id;
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
if FFrame.DataSet<>nil then begin
{FFrame.DataSet.Active:=false;
FFrame.DataSet.Active:=true;}
end;
end;

procedure TfrmMain.actAddGroupExecute(Sender: TObject);
begin
 if (ActiveFrame is TfmSpec) then
  (ActiveFrame as TfmSpec).actAddGroupExecute(nil) else

  begin
  frmGroupEdt:=TfrmGroupEdt.Create(self);
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
frmAbitReturn:=TfrmAbitReturn.create(self);
frmAbitReturn.IDStudent:= TDBNodeAbitStudObject(DBDekTreeView_TEST1.Selected.Data).ik;
frmAbitReturn.NNAbit:= TDBNodeAbitStudObject(DBDekTreeView_TEST1.Selected.Data).NNAbit;
 frmAbitReturn.Hint:=inttostr(TDBNodeSpecRecObject(DBDekTreeView_TEST1.Selected.Parent.Data).Year);
 frmAbitReturn.Tag:=0;
 frmAbitReturn.ShowModal;
 frmAbitReturn.Free;
 ActiveFrame.RefreshFrame;
end;

procedure TfrmMain.actAboutExecute(Sender: TObject);
begin
  try
    frmAbout:=TfrmAbout.Create(Self);
    frmAbout.ShowModal();
  finally
    frmAbout.Free;
  end;  
end;

procedure TfrmMain.actFilterActualExecute(Sender: TObject);
begin
  actTreeRefreshActionExecute(sender);
  DBDekTreeView_test1.RefreshExecute(self);
end;

procedure TfrmMain.actNaprExecute(Sender: TObject);
var Fyear:integer;
begin
Fyear:=TDBNodeGroupObject(DBDekTreeView_TEST1.Selected.Parent.data).FoundYear;
ftmNapr:=TftmNapr.Create(self);


ftmNapr.Tag:=TDBNodeStudObject(DBDekTreeView_TEST1.Selected.data).RecordbookKey;
ftmNapr.Hint:=inttostr(TDBNodeGroupObject(DBDekTreeView_TEST1.Selected.Parent.Parent.Parent.Data).ik);
ftmNapr.studobj:=TDBNodeStudObject(DBDekTreeView_TEST1.SelectedObject);

if MonthOf(Date)>8 then
ftmNapr.dbcbeNum.Text:=inttostr(1+(CurrentYear-Fyear)*2) else
if MonthOf(Date)<3 then
ftmNapr.dbcbeNum.Text:=inttostr((CurrentYear-Fyear)*2-1) else
if (MonthOf(Date)<=8)and(MonthOf(Date)>=3) then
ftmNapr.dbcbeNum.Text:=inttostr((CurrentYear-Fyear)*2);
ftmNapr.showmodal;
ftmNapr.Free;
end;

procedure TfrmMain.actFilterGroupExecute(Sender: TObject);
begin
  if actFilterAll.Checked then
    actFilterActual.Checked := true
  else
    actFilterAll.Checked := true;
    
  actTreeRefreshAction.Execute;
  DBDekTreeView_test1.RefreshExecute(self);
end;

procedure TfrmMain.actFilterKafExecute(Sender: TObject);
begin
//Do nothing
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
ftmNaprClose:=TftmNaprClose.Create(self);
ftmNaprClose.Tag:=TDBNodeStudObject(DBDekTreeView_TEST1.Selected.data).RecordbookKey;
ftmNaprclose.showmodal;
ftmNaprclose.Free;
end;

procedure TfrmMain.actFilterAllExecute(Sender: TObject);
begin
actTreeRefreshActionExecute(sender);
DBDekTreeView_test1.RefreshExecute(self);
end;

procedure ExpandOrCollapse(Node:TTreeNode);
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
  BookmarkSheduleYearIK, BookmarkSheduleSemIK, BookmarkObjectIK, FacultyIK, i: integer;
  rootScheduleNode: TTreeNode;
  dbNode: TDBNodeObject;
  isSheduleFounded: boolean;
begin
  TSheduleController.MainFunctions.GetScheduleBookmarkInfo((Sender as TAction).Tag, BookmarkType, BookmarkSheduleYearIK, BookmarkSheduleSemIK, BookmarkObjectIK);
  dbNode:= frmMain.DBDekTreeView_TEST1.Selected.Data;
  if (dbNode is TDBNodeRootScheduleObject) then
    rootScheduleNode:= frmMain.DBDekTreeView_TEST1.Selected;
  if (dbNode is TDBNodeSemesterScheduleObject) then
    rootScheduleNode:= frmMain.DBDekTreeView_TEST1.Selected.Parent;
  if (dbNode is TDBNodeFacultyScheduleObject) then
    rootScheduleNode:= frmMain.DBDekTreeView_TEST1.Selected.Parent.Parent;
  if (dbNode is TDBNodeScheduledepartmentObject) then
    rootScheduleNode:= frmMain.DBDekTreeView_TEST1.Selected.Parent.Parent.Parent;
  rootScheduleNode.Expand(false);
  isSheduleFounded:= false;
  for I := 0 to rootScheduleNode.Count - 1 do
  begin
    dbNode:= rootScheduleNode.Item[i].Data;
    if ((dbNode as TDBNodeSemesterScheduleObject).IK_Year = BookmarkSheduleYearIK) and ((dbNode as TDBNodeSemesterScheduleObject).IK_Semtype = BookmarkSheduleSemIK) then
    begin
      rootScheduleNode:= rootScheduleNode.Item[i];
      isSheduleFounded:= true;
      break;
    end;
  end;
  if not isSheduleFounded then
  begin
    Application.MessageBox('�� ������� ����� ����������, �������������� ��������� ��������!', '���������� "����������"', MB_ICONWARNING);
    exit;
  end;
  rootScheduleNode.Expand(false);
  if (BookmarkType in [sbKafedraAud, sbKafedraExam]) then
    FacultyIK:= TSheduleController.MainFunctions.GetFacultyForDep(BookmarkObjectIK)
  else FacultyIK:= BookmarkObjectIK;
  isSheduleFounded:= false;
  for I := 0 to rootScheduleNode.Count - 1 do
  begin
    dbNode:= rootScheduleNode.Item[i].Data;
    if ((dbNode as TDBNodeFacultyScheduleObject).IK = FacultyIK) then
    begin
      rootScheduleNode:= rootScheduleNode.Item[i];
      isSheduleFounded:= true;
      break;
    end;
  end;
  if not isSheduleFounded then
  begin
    Application.MessageBox('�� ������� ����� ���������, ��������������� ��������� ��������!', '���������� "����������"', MB_ICONWARNING);
    exit;
  end;
  case BookmarkType of
    sbFacAud:
      begin
        frmMain.DBDekTreeView_TEST1.Select(rootScheduleNode);
        frmMain.DBDekTreeView_TEST1Change(DBDekTreeView_TEST1, rootScheduleNode);
        (frmMain.ActiveFrame as TfmSheduleFac).PageControl1.ActivePageIndex:= 1;
        (frmMain.ActiveFrame as TfmSheduleFac).DockTabSet2.TabIndex:= 0;
        exit;
      end;
    sbFacExam:
      begin
        frmMain.DBDekTreeView_TEST1.Select(rootScheduleNode);
        frmMain.DBDekTreeView_TEST1Change(DBDekTreeView_TEST1, rootScheduleNode);
        (frmMain.ActiveFrame as TfmSheduleFac).PageControl1.ActivePageIndex:= 1;
        (frmMain.ActiveFrame as TfmSheduleFac).DockTabSet2.TabIndex:= 1;
        exit;
      end;
  end;
  rootScheduleNode.Expand(false);
  isSheduleFounded:= false;
  for I := 0 to rootScheduleNode.Count - 1 do
  begin
    dbNode:= rootScheduleNode.Item[i].Data;
    if ((dbNode as TDBNodeScheduledepartmentObject).IK = BookmarkObjectIK) then
    begin
      rootScheduleNode:= rootScheduleNode.Item[i];
      isSheduleFounded:= true;
      break;
    end;
  end;
  if not isSheduleFounded then
  begin
    Application.MessageBox('�� ������� ����� �������, ��������������� ��������� ��������!', '���������� "����������"', MB_ICONWARNING);
    exit;
  end;
  frmMain.DBDekTreeView_TEST1.Select(rootScheduleNode);
  frmMain.DBDekTreeView_TEST1Change(DBDekTreeView_TEST1, rootScheduleNode);
  (frmMain.ActiveFrame as TfmSheduleDep).PageControl1.ActivePageIndex:= 2;
  case BookmarkType of
    sbKafedraAud: (frmMain.ActiveFrame as TfmSheduleDep).DockTabSet2.TabIndex:= 0;
    sbKafedraExam: (frmMain.ActiveFrame as TfmSheduleDep).DockTabSet2.TabIndex:= 1;
  end;
end;

procedure TfrmMain.Panel2Click(Sender: TObject);
begin
Panel3.Visible:= not Panel3.Visible;
Splitter1.Visible:=Panel3.Visible;
 if Splitter1.Visible then
    Splitter1.Left:= Panel3.Width + 10;
  Image1.Visible:= not Panel3.Visible;
  Image2.Visible:= Panel3.Visible;
{  DBDekTreeView_TEST1.Visible:= not DBDekTreeView_TEST1.Visible;
  Splitter1.Visible:= DBDekTreeView_TEST1.Visible;
  if Splitter1.Visible then
    Splitter1.Left:= DBDekTreeView_TEST1.Width + 10;
  Image1.Visible:= not DBDekTreeView_TEST1.Visible;
  Image2.Visible:= DBDekTreeView_TEST1.Visible;}
end;

procedure TfrmMain.Panel2MouseEnter(Sender: TObject);
begin
  Panel2.Color:= $00EFD3C6;
end;

procedure TfrmMain.Panel2MouseLeave(Sender: TObject);
begin
  Panel2.Color:= clBtnFace;
end;

procedure TfrmMain.Panel2Resize(Sender: TObject);
begin
  Image1.Top:= round((Panel2.Height - Image1.Height)/2);
  Image2.Top:= round((Panel2.Height - Image1.Height)/2);
end;

procedure TfrmMain.actShowStudExecute(Sender: TObject);
begin
  if actShowAllStudent.Checked then
    actShowOtchislStudent.Checked := true
  else
    if actShowOtchislStudent.Checked then
      actShowUnOtchislStudent.Checked := true
    else
      if actShowUnOtchislStudent.Checked then
        actShowAcademStudent.Checked := true
      else
        actShowAllStudent.Checked := true;

  actTreeRefreshAction.Execute;
end;

procedure TfrmMain.actAddPrikazExecute(Sender: TObject);
begin
  ftmPrikaz:=TftmPrikaz.Create(self);
  ftmPrikaz.Tag:=0;
  ftmPrikaz.Caption:='�������� ������';
  if (ftmPrikaz.showmodal = mrOk) or (ftmPrikaz.bbApply.Tag = 1) then
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
    actDelPrikaz.Enabled:= (ActiveFrame as TfmPrik).actDelPrikaz.Enabled;
end;

procedure TfrmMain.actEditPrikazUpdate(Sender: TObject);
begin
  if (ActiveFrame is TfmPrik) then
    actEditPrikaz.Enabled:= (ActiveFrame as TfmPrik).actEditPrikaz.Enabled;
end;

procedure TfrmMain.actExtendSessionExecute(Sender: TObject);
begin

frmExtendSession:=tfrmExtendSession.Create(self);
frmExtendSession.Student:=DBDekTreeView_TEST1.Selected.DATA;
frmExtendSession.Showmodal;
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
    actEditGroup.Enabled:= (ActiveFrame as TfmGroup).actEdtGroup.Enabled;
end;

procedure TfrmMain.actDelGroupExecute(Sender: TObject);
begin
  if (ActiveFrame is TfmGroup) then
    (ActiveFrame as TfmGroup).actDelGroupExecute(Sender);
end;

procedure TfrmMain.actDelGroupUpdate(Sender: TObject);
begin
  if (ActiveFrame is TfmGroup) then
    actDelGroup.Enabled:= (ActiveFrame as TfmGroup).actDelGroup.Enabled;
end;

procedure TfrmMain.actAddPotokExecute(Sender: TObject);
begin
  (ActiveFrame as TfmNagruzkaDep).actEditPotokExecute((ActiveFrame as TfmNagruzkaDep).actAddPotok);
end;

procedure TfrmMain.actAddPrepExecute(Sender: TObject);
begin
  (ActiveFrame as TfmNagruzkaDep).actAddPrepodExecute((ActiveFrame as TfmNagruzkaDep).actAddPrepod);
end;

procedure TfrmMain.actEditPrepExecute(Sender: TObject);
var
  dbNode: TDBNodeObject;
begin
  frmNagruzkaAddPrep:= TfrmNagruzkaAddPrep.CreateDialog(nil, dm.DBConnect, nil);
  frmNagruzkaAddPrep.Caption:= '��������� ���������� � �������������';
  dbNode:= frmMain.DBDekTreeView_TEST1.Selected.Data;
  frmNagruzkaAddPrep.Tag:= (dbNode as TDBNodeTeacherObject).ik;
  dbNode:= frmMain.DBDekTreeView_TEST1.Selected.Parent.Data;
  frmNagruzkaAddPrep.IK:= (dbNode as TDBNodedepartmentObject).IK;
  frmNagruzkaAddPrep.Read;
  if (frmNagruzkaAddPrep.ShowModal() = mrOk) or (frmNagruzkaAddPrep.bbApply.Tag = 1) then
    frmMain.DBDekTreeView_TEST1.RefreshNodeExecute(frmMain.DBDekTreeView_TEST1.Selected.Parent);
  frmNagruzkaAddPrep.Free;
end;

procedure TfrmMain.actDelPrepExecute(Sender: TObject);
begin
  if (Application.MessageBox(PChar('�� �������, ��� ������ ������� ������������� "' + (Trim(TDBNodeTeacherObject(frmMain.DBDekTreeView_TEST1.Selected.Data).FirstName) +
    ' ' + Trim(TDBNodeTeacherObject(frmMain.DBDekTreeView_TEST1.Selected.Data).LastName) + ' ' + Trim(TDBNodeTeacherObject(frmMain.DBDekTreeView_TEST1.Selected.Data).MiddleName)) + '"? ' + #10#13#10#13 +
   '��� ���� ����� ������� �������������� ������: ' + #10#13 +
   '  1) �� ��������������� � ����������� �������� ������� �������������;' + #10#13 +
   '  2) �� ���������� ������� �������������.'),'�������� �������������', mb_YesNo) = mrYes) then
  begin
    if TNagruzkaController.Preparation.DeletePrepodFromKafedra(TDBNodeTeacherObject(frmMain.DBDekTreeView_TEST1.Selected.Data).IK, TDBNodedepartmentObject(frmMain.DBDekTreeView_TEST1.Selected.Parent.Data).IK) then
      frmMain.DBDekTreeView_TEST1.RefreshNodeExecute(frmMain.DBDekTreeView_TEST1.Selected.Parent);
  end;
end;

procedure TfrmMain.actAddKafExecute(Sender: TObject);
begin
//  (ActiveFrame as TfmNagruzkaFac).actAddKafExecute(nil);
end;

procedure TfrmMain.actAddNormUpdate(Sender: TObject);
begin
  if (ActiveFrame is TfmNagruzkaFac) then
    actAddNorm.Enabled:= (ActiveFrame as TfmNagruzkaFac).actAddNorm.Enabled;
end;

procedure TfrmMain.actAddNormExecute(Sender: TObject);
begin
  (ActiveFrame as TfmNagruzkaFac).actAddNormExecute(nil);
end;

procedure TfrmMain.actOtchislExecute(Sender: TObject);
var
  cur: Integer;
begin
   frmOtchislStud:=TfrmOtchislStud.Create(self);
  frmOtchislStud.Student:=DBDekTreeView_TEST1.Selected.DATA;
  frmOtchislStud.ShowModal;
  frmOtchislStud.Free;
  //------------�����---------------
 cur := DBDekTreeView_TEST1.SelectedObject.Node.Index;
 DBDekTreeView_TEST1.Selected := DBDekTreeView_TEST1.Selected.Parent;
  actTreeRefreshAction.Execute;
  DBDekTreeView_TEST1.SelectNodeByNum(cur, false);
end;

procedure TfrmMain.actViewUchPlanExecute(Sender: TObject);
var
  ik_grup, usrAnswer: Integer;
  node:ttreenode;
begin

  if lastCancel then
  begin
    lastCancel := false;
    Exit;
  end;
  if Fframe<>nil then
    begin
    if not (DBDekTreeView_TEST1.SelectedObject is TDBNodeGroupObject) then exit;
    ik_grup:=((DBDekTreeView_TEST1.SelectedObject)as TDBNodeGroupObject).ik;
    if (FFrame.Modified) then
    begin
      usrAnswer := MessageBox(Handle, '��������� ���������?', '�� �������',
                                                              MB_YESNOCANCEL);
      lastCancel := false;
      if usrAnswer=IDYES then
      begin
        if FFrame.Apply = false then
        begin
          lastCancel := true;
          DBDekTreeView_TEST1.Select(LastSelectedNode);
          Exit;
        end;
      end;
      if usrAnswer=IDCANCEL then
      begin
        lastCancel := true;
        DBDekTreeView_TEST1.Select(LastSelectedNode);
         Exit;
      end;
    LastSelectedNode := DBDekTreeView_TEST1.Selected;
    end;

    //��������, ���� �� � ������ ������� ����
    if (TUchPlanController.Instance.getUchPlanForGroup(ik_grup)<>0) then
    begin
      //����� ��������� ������� ����
      node:=DBDekTreeView_TEST1.Selected.Parent;
      DBDekTreeView_TEST1.Select(node);
      DBDekTreeView_TEST1Change(sender,node);
      if (FFrame is TfmSpec) then with (FFrame as TfmSpec) do
      begin
        PageControl1.ActivePageIndex:=6;
        fmUchPlan2.Group := ik_grup;
        alreadySpec:=true;
      end;
    end
    else
    begin
      if MessageBox(Handle, PWideChar('������� � ������ �������� ����� ��� ������?'),
      '��� ������ �� �������� ������� ����', MB_YESNO)=IDYES then
      begin
        frmGroupEdt:=TfrmGroupEdt.Create(self);
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
 frmStudVosst:=TfrmStudVosst.Create(self);
 frmStudVosst.Student:=DBDekTreeView_TEST1.Selected.DATA;
 frmStudVosst.Showmodal;
 frmStudVosst.Free;              
  //------------�����---------------
 cur := DBDekTreeView_TEST1.SelectedObject.Node.Index;
 DBDekTreeView_TEST1.Selected := DBDekTreeView_TEST1.Selected.Parent;
  actTreeRefreshAction.Execute;
  DBDekTreeView_TEST1.SelectNodeByNum(cur, false);
end;

procedure TfrmMain.actVypiskaExecute(Sender: TObject);
var
  wb:variant;
  ExAppl:variant;
  i: Integer;
begin
if not (ActiveFrame is TfmStudent) then exit;


dmUspevaemost.adospSelUspevForStud.Active := false;
  with dmUspevaemost.adospSelUspevForStud.Parameters do
  begin
    Clear;
    AddParameter;
    Items[0].Value := (ActiveFrame as TfmStudent).cmbxSem.ItemIndex;
    AddParameter;
    Items[1].Value := TDBNodeStudObject(frmMain.DBDekTreeView_TEST1.SelectedObject).RecordbookKey;
  end;
  dmUspevaemost.adospSelUspevForStud.ExecProc;
  dmUspevaemost.adospSelUspevForStud.Active := true;

  with (ActiveFrame as TfmStudent) do begin
  DBGridEh1.Columns[0].Title.Caption := '����������';
  DBGridEh1.Columns[1].Title.Caption := '��� �������';
  DBGridEh1.Columns[2].Title.Caption := '������';
  DBGridEh1.Columns[3].Title.Caption := '����';
  DBGridEh1.Columns[4].Title.Caption := '�������������';
  DBGridEh1.Columns[5].Title.Caption := '�������';
  end;

  try
    ExAppl:=CreateOleObject('Excel.Application');
    ExAppl.WorkBooks.Add;
    wb:=ExAppl.WorkBooks.item[ExAppl.WorkBooks.count];
    ExAppl.DisplayAlerts:= false;
    dmUspevaemost.adospSelUspevForStud.First;
    i := 1;
    wb.sheets[1].cells[i,1] := '�������';
    wb.sheets[1].cells[i,2] := '��� ����������';
    wb.sheets[1].cells[i,3] := '������';
    wb.sheets[1].cells[i,4] := '����';
    wb.sheets[1].cells[i,5] := '�������������';
    wb.sheets[1].cells[i,6] := '�������';
    Inc(i);
    while not dmUspevaemost.adospSelUspevForStud.Eof do
    begin
      wb.sheets[1].cells[i,1] := dmUspevaemost.adospSelUspevForStud.Fields[0].Value;
      wb.sheets[1].cells[i,2] := dmUspevaemost.adospSelUspevForStud.Fields[1].Value;
      wb.sheets[1].cells[i,3] := dmUspevaemost.adospSelUspevForStud.Fields[2].Value;
      wb.sheets[1].cells[i,4] := dmUspevaemost.adospSelUspevForStud.Fields[3].Value;
      wb.sheets[1].cells[i,5] := dmUspevaemost.adospSelUspevForStud.Fields[4].Value;
      wb.sheets[1].cells[i,6] := dmUspevaemost.adospSelUspevForStud.Fields[5].Value;
      dmUspevaemost.adospSelUspevForStud.Next;
      Inc(i);
    end;
    ExAppl.DisplayAlerts:= true;
    ExAppl.Visible := true;
  except
    MessageBox(Handle, '��������� ������ ��� �������� ������������ � Excel.','�� "����"',
          MB_OK) ;
    ExAppl.Quit;
    ExAppl:= UnAssigned;
  end;
end;

procedure TfrmMain.actPerevodExecute(Sender: TObject);
var
  cur: Integer;
begin
   frmPerevStud:=TfrmPerevStud.Create(self);
  frmPerevStud.Student:=DBDekTreeView_TEST1.Selected.DATA;
 frmPerevStud.Showmodal;
 frmPerevStud.Free;              
  //------------�����---------------
 cur := DBDekTreeView_TEST1.SelectedObject.Node.Index;
 DBDekTreeView_TEST1.Selected := DBDekTreeView_TEST1.Selected.Parent;
  actTreeRefreshAction.Execute;
  DBDekTreeView_TEST1.SelectNodeByNum(cur, false);
end;

procedure TfrmMain.actPFShowAllExecute(Sender: TObject);
begin
  if (DBDekTreeView_test1.Selected.Data <> nil) then
  if (TDBNodeObject(DBDekTreeView_test1.Selected.Data) is TDBNodedepartmentObject)  then
  
    begin
      TDBNodedepartmentObject(DBDekTreeView_test1.Selected.Data).FilterType:= TTeacherTreeViewFilter((Sender as TAction).Tag);
      DBDekTreeView_test1.RefreshNodeExecute(DBDekTreeView_test1.Selected);
    end;
end;

procedure TfrmMain.actAkademExecute(Sender: TObject);
var
  cur: Integer;
begin
 frmAcademStud:=tfrmAcademStud.Create(self);
 frmAcademStud.RecordBookKey:=TDBNodeStudObject(DBDekTreeView_TEST1.Selected.Data).RecordBookKey;
 frmAcademStud.CategoryId:=TDBNodeStudObject(DBDekTreeView_TEST1.Selected.Data).CategoryId;
 frmAcademStud.ik_group:=TDBNodeGroupObject(DBDekTreeView_TEST1.Selected.Parent.Data).ik;
 frmAcademStud.ik_spec:=TDBNodeGroupObject(DBDekTreeView_TEST1.Selected.Parent.Parent.Data).ik;
 frmAcademStud.ik_group:=TDBNodeGroupObject(DBDekTreeView_TEST1.Selected.Parent.Data).ik;
 frmAcademStud.EditMode:=false;
 frmAcademStud.dbcbeFac.KeyValue := TDBNodeFacultyObject(DBDekTreeView_TEST1.Selected.Parent.Parent.Parent.Data).ik;
 frmAcademStud.dbcbeSpec.KeyValue := TDBNodeSpecObject(DBDekTreeView_TEST1.Selected.Parent.Parent.Data).ik;

 if TDBNodeStudObject(DBDekTreeView_TEST1.Selected.Data).State=ssAcadem then
 begin
   with dmStudentSelectionProcs.aspSelAcadem do
   begin
   First;
   while (not Eof)and(FieldByName('������� ������').Value <> TDBNodeGroupObject(DBDekTreeView_TEST1.Selected.Parent.Data).Name)  do
   Next;

   dmPrikaz.adodsPrikaz.Active:=true;
   dmCauses.adodsAcademCause.Active:=true;
   dmUgtuStructure.adodsFaculty.Active:=true;

   frmAcademStud.ik_group:= FieldByName('ik_grup').Value;
   frmAcademStud.dbcbeNumPrik.KeyValue := FieldByName('ik_prikaz').Value;
   frmAcademStud.dbcbeCause.KeyValue := FieldByName('ik_pric').Value;
   frmAcademStud.cbFreeAt.Checked := FieldByName('��������� ���������').Value;
   frmAcademStud.eOtchObosn.text := FieldByName('����������� ����������').Value;

      frmAcademStud.dbcbeGroup.KeyValue :=  TDBNodeGroupObject(DBDekTreeView_TEST1.Selected.Parent.Data).ik;

   frmAcademStud.dbdteBegin.Value := FieldByName('���� ������').Value;
   frmAcademStud.dbdteEnd.Value := FieldByName('���� ���������').Value;
   frmAcademStud.dbdteLearn.Value := FieldByName('���� ������ �� �����').Value;

   frmAcademStud.EditMode:=true;
   end;
 end;


 frmAcademStud.Showmodal;
 frmAcademStud.Free;              
  //------------�����---------------
 cur := DBDekTreeView_TEST1.SelectedObject.Node.Index;
 DBDekTreeView_TEST1.Selected := DBDekTreeView_TEST1.Selected.Parent;
  actTreeRefreshAction.Execute;
  DBDekTreeView_TEST1.SelectNodeByNum(cur, false);
end;

procedure TfrmMain.actAppTweaksShowExecute(Sender: TObject);
begin
frmAppTweaks:=TfrmAppTweaks.Create(nil);
frmAppTweaks.ShowModal;
frmAppTweaks.Free;
end;

procedure TfrmMain.actFamChgExecute(Sender: TObject);
var
  cur: Integer;
begin
 frmChangeLastName:=tfrmChangeLastName.Create(self);
  frmChangeLastName.Student:=DBDekTreeView_TEST1.Selected.DATA;
 frmChangeLastName.Showmodal;
 frmChangeLastName.Free;
  //------------�����---------------
 cur := DBDekTreeView_TEST1.SelectedObject.Node.Index;
 DBDekTreeView_TEST1.Selected := DBDekTreeView_TEST1.Selected.Parent;
  actTreeRefreshAction.Execute;
  DBDekTreeView_TEST1.SelectNodeByNum(cur, false);
end;

procedure TfrmMain.actPasspChgExecute(Sender: TObject);
var
  cur: Integer;
begin
frmChangePassport:=tfrmChangePassport.Create(self);
frmChangePassport.Student:=DBDekTreeView_TEST1.Selected.Data;
frmChangePassport.Showmodal;
frmChangePassport.Free;
  //------------�����---------------
 cur := DBDekTreeView_TEST1.SelectedObject.Node.Index;
 DBDekTreeView_TEST1.Selected := DBDekTreeView_TEST1.Selected.Parent;
  actTreeRefreshAction.Execute;
  DBDekTreeView_TEST1.SelectNodeByNum(cur, false);
end;

procedure TfrmMain.actAddSpclzExecute(Sender: TObject);
begin
  if (ActiveFrame is TfmSpec) then
    (ActiveFrame as TfmSpec).actAddSpclzExecute((ActiveFrame as TfmSpec).actAddSpclz);
end;


procedure TfrmMain.ppmFacNagrPopup(Sender: TObject);
begin
  if DBDekTreeView_TEST1.Selected.Expanded then
    N24.Caption:='��������'
  else
    N24.Caption:='����������';
end;

procedure SetNodeActions(ppm:TPopupMenu;Cat:string);
var i:integer;
new:TMenuItem;
newca:TActionClientItem;
act:TContainedAction;
begin
for i:=0 to (frmMain.alMainActions.ActionCount-1) do
  if frmMain.alMainActions.Actions[i].Category=Cat then
  begin
    new:=TMenuItem.Create(ppm);
    act:=frmMain.alMainActions.Actions[i];
    new.Action:=act;
    ppm.Items.Add(new);
    newca:=frmMain.ActionManager1.ActionBars[0].Items[1].Items.add;
    if not (act.Tag=1) then
      newca.Action:=act else newca.Caption:='-';
  end;
end;

procedure TfrmMain.actDocsRetrieveExecute(Sender: TObject);
begin
if MessageBox(Handle, '����� ���� �������� �� ������ �� ������� ������������� ��������� ��������! �� �������, ��� ������ �������� ��������?','�� "����"',
          MB_YESNO) = IDYES
then begin

{dm.adodsPostupView.Active:=false;
dm.adodsPostupView.CommandType:=cmdText;
dm.adodsPostupView.CommandText:='select * from Abit_Postup_View where ncode='''+
inttostr(TDBNodeStudObject(DBDekTreeView_TEST1.SelectedObject).id)+'''';
dm.adodsPostupView.Active:=true;  
  dm.adodsPostupView.First;
while (not dm.adodsPostupView.FieldValues['ik_zach']<3)and(not dm.adodsPostupView.Eof) do
  dm.adodsPostupView.Next;  }
 

if (not TDBNodeAbitStudObject(DBDekTreeView_TEST1.Selected.Data).onlyReading) then begin
  dmAbiturientAction.aspDocsRetrieve.Active:=false;
  dmAbiturientAction.aspDocsRetrieve.Parameters.Clear;
  dmAbiturientAction.aspDocsRetrieve.Parameters.AddParameter;
  dmAbiturientAction.aspDocsRetrieve.Parameters[0].Value:=
    TDBNodeAbitStudObject(DBDekTreeView_TEST1.Selected.Data).NNAbit;//dm.adodsPostupView.FieldValues['NN_abit'];
try
  dmAbiturientAction.aspDocsRetrieve.ExecProc;
except
  MessageBox(Handle, '��������� ������ ��� �������� ������.','�� "����"',
          MB_OK);
end;
  DBDekTreeView_TEST1.RefreshNodeExecute(DBDekTreeView_TEST1.Selected);
end;

end;

end;

procedure TfrmMain.ppmTreePopup(Sender: TObject);
var sep:TMenuitem;
newca:TActionClientItem;
dbNode:TDBNodeObject;
begin
if frmMain.DBDekTreeView_TEST1.Selected=nil then exit;
dbNode:=frmMain.DBDekTreeView_TEST1.Selected.data;
if (dbNode.AssociatedObject<>FFrame)
then begin
//DBDekTreeView_TEST1Change(ppmTree, frmMain.DBDekTreeView_TEST1.Selected);
frmMain.DBDekTreeView_TEST1.Selected.Selected:=true; // ���� ���������� ������ �� ������� �� � ���� ������!
end;

ppmTree.Items.Clear;
ActionManager1.ActionBars[0].Items[1].Items.Clear;
SetNodeActions(ppmTree,'catDefaultNode');
sep:=TMenuitem.Create(self);
newca:=frmMain.ActionManager1.ActionBars[0].Items[1].Items.add;
newca.Caption:='-';
sep.Caption:='-';
ppmTree.Items.add(sep);
if (TDBNodeObject(frmMain.DBDekTreeView_TEST1.Selected.Data).Actiongroup<>'') then
SetNodeActions(ppmTree,TDBNodeObject(frmMain.DBDekTreeView_TEST1.Selected.Data).Actiongroup);

end;

procedure TfrmMain.actCollapseExpandExecute(Sender: TObject);
begin
ExpandOrCollapse(DBDekTreeView_TEST1.Selected);
if DBDekTreeView_TEST1.Selected.Expanded then
actCollapseExpand.Caption:='��������' else
actCollapseExpand.Caption:='����������'
end;

procedure TfrmMain.MainMenuBarPopup(Sender: TObject;
  Item: TCustomActionControl);
begin
ppmTreePopup(Sender);
end;

procedure TfrmMain.actLevelUpExecute(Sender: TObject);
var ndGroup:TDBNodeGroupObject;
i:integer;
begin
ndGroup:=TDBNodeGroupObject(DBDekTreeView_TEST1.SelectedObject);
frmLevelUp:=TfrmLevelUp.create(self);
frmLevelUp.lAvail:=Tlist.Create();
frmLevelUp.lSel:=Tlist.Create();
frmLevelUp.ndGroup:=ndGroup;
for i:=0 to (ndGroup.Node.Count-1) do
frmLevelUp.lAvail.Add(TDBNodeStudObject(ndGroup.Node.Item[i].Data));
frmLevelUp.Sync;
frmLevelUp.ShowModal;
end;

procedure TfrmMain.actAddDepPlanExecute(Sender: TObject);
begin
  (ActiveFrame as TfmNagruzkaDep).actEditPlanExecute((ActiveFrame as TfmNagruzkaDep).actAddPlan);
end;

procedure TfrmMain.actAddPlanPrepNagruzkaExecute(Sender: TObject);
begin
 // (ActiveFrame as TfmNagruzkaPrep).actEditPlanExecute((ActiveFrame as TfmNagruzkaPrep).actAddPlan);
end;

procedure TfrmMain.actAddFactPrepNagruzkaExecute(Sender: TObject);
begin
//  (ActiveFrame as TfmNagruzkaPrep).actAddFactExecute((ActiveFrame as TfmNagruzkaPrep).actAddFact);
end;

procedure TfrmMain.actAddAbitExecute(Sender: TObject);
var yearnode:TDBNodeAbitYearObject;
begin
TApplicationController.GetInstance.AddLogEntry('���������� �����������');

frmAbitConfirm:=tfrmAbitConfirm.Create(self);
frmAbitConfirm.Tag:=TDBNodeSpecRecObject(DBDekTreeView_TEST1.SelectedObject).NNRecord;
frmAbitConfirm.hint:=inttostr(TDBNodeSpecRecObject(DBDekTreeView_TEST1.SelectedObject).Year);
yearnode:=TDBNodeAbitYearObject(DBDekTreeView_TEST1.Selected.Parent.Parent.Parent.Data);
frmAbitConfirm.HasAddSpec:=yearnode.HasAddSpec;
frmAbitConfirm.ShowModal;
frmAbitConfirm.Free;

end;

procedure TfrmMain.actPostupDlgShowExecute(Sender: TObject);
begin
 frmpostupDlg:=TfrmPostupDlg.create(self);
 frmpostupDlg.IDStudent:=TDBNodeAbitStudObject(DBDekTreeView_TEST1.Selected.Data).ik;
 frmpostupDlg.IDpostup:=TDBNodeAbitStudObject(DBDekTreeView_TEST1.Selected.Data).NNAbit;
 frmpostupDlg.onlyreading:=TDBNodeAbitStudObject(DBDekTreeView_TEST1.Selected.Data).OnlyReading;
 frmpostupDlg.Hint:=inttostr(TDBNodeSpecRecObject(DBDekTreeView_TEST1.Selected.Parent.Data).Year);
 frmpostupDlg.HasAddSpec:=TDBNodeAbitYearObject(DBDekTreeView_TEST1.Selected.Parent.Parent.Parent.Parent.Data).HasAddSpec;
 frmpostupDlg.Tag:=0;
 frmPostupDlg.IkRecruit:=TDBNodeSpecRecObject(DBDekTreeView_TEST1.Selected.Parent.Data).NNRecord;

 frmpostupDlg.ShowModal;
 frmpostupDlg.Free;
 ActiveFrame.RefreshFrame;
end;

procedure TfrmMain.DBDekTreeView_TEST1Click(Sender: TObject);
begin
  if DBDekTreeView_TEST1.Selected.Expanded then
    actCollapseExpand.Caption:='��������'
  else actCollapseExpand.Caption:='����������';

  if pnlImage.Visible then pnlImage.Visible := false;
end;

procedure TfrmMain.cmbSearchChange(Sender: TObject);
begin

  Refresh;
  try
    dm.adodsStudSearch.Active:=false;
    case cmbSearch.ItemIndex of
    0:
    begin
      dbcbeSearch.ListField:='nn_zach';
      dm.adodsStudSearch.CommandText:='select * from Tree_stud_search Order by nn_zach';
    end;
    1:
    begin
      dbcbeSearch.ListField:='NameStud';
      dm.adodsStudSearch.CommandText:='select * from Tree_stud_search Order by NameStud';
    end;
    2:
    begin
      dm.adodsStudSearch.CommandText:='select * from Tree_stud_search Order by ctelefon DESC';
      dbcbeSearch.ListField:='ctelefon';
    end;
    end;
      dm.adodsStudSearch.Active:=true;
  finally

  end;
end;

procedure TfrmMain.cmbTeachSearchChange(Sender: TObject);
begin
  {Panel8.Top:= round((Height - Panel8.Height)/2);
  Panel8.Left:= round((Width - Panel8.Width)/2);
  Panel8.Visible:= true;}
  Refresh;
  try
    dm.adodsTeachSearch.Active:=false;
    case cmbTeachSearch.ItemIndex of
    0:
    begin
      dbcbeTeachSearch.ListField:='full_iTab_n';
      dm.adodsTeachSearch.CommandText:='select * from Tree_Teachsearch Order by itab_n';
    end;
    1:
    begin
      dbcbeTeachSearch.ListField:='Fullname';
      dm.adodsTeachSearch.CommandText:='select * from Tree_Teachsearch Order by Fullname';
    end;
    end;
    dm.adodsTeachSearch.Active:=true;
  finally
   // Panel8.Visible:= false;
  end;
end;

procedure TfrmMain.actFindExecute(Sender: TObject);
begin
  if dbcbeSearch.KeyValue=Null then exit;
  if not DBDekTreeView_TEST1.FindAndSelectByValue(dbcbeSearch.KeyValue) then
    showmessage('�� ������� ����� ������� ��������!');
end;

procedure TfrmMain.actFindTeachExecute(Sender: TObject);
begin
if dbcbeTeachSearch.KeyValue=Null then exit;
if not DBDekTreeView_TEST1.FindAndSelectTeachByValue(dbcbeTeachSearch.KeyValue) then
showmessage('�� ������� ����� ������� �������������!');
end;

procedure TfrmMain.dbcbeSearchKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then actFind.Execute;
end;

procedure TfrmMain.dbcbeTeachSearchCloseUp(Sender: TObject; Accept: Boolean);
begin
actFindTeach.Execute;
end;

procedure TfrmMain.dbcbeSearchCloseUp(Sender: TObject; Accept: Boolean);
begin
if Accept then actFind.Execute;
end;

procedure TfrmMain.actAcademRestoreExecute(Sender: TObject);
var cur:integer;
begin
frmacademReturn:=TfrmacademReturn.create(self);
frmacademReturn.Tag:=(ActiveFrame as TfmStudent).obj.RecordbookKey;
frmacademReturn.ShowModal;
frmacademReturn.Free;

//------------���������� ����---------------
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
    NewClientVersionDetectedForm := TNewClientVersionDetectedForm.create(self);
    NewClientVersionDetectedForm.Tag := TVersionController.GetInstance.ServerVersion.State;
    if (NewClientVersionDetectedForm.ShowModal = mrYes) then
    begin
    try
    TVersionController.GetInstance.UpdateVersion;
    except
     ShowMessage('��� ��������� ����� ������ ������� �� ���� ��������� ������!')
    end;
    ShellExecute(Handle, nil, PWideChar(TApplicationController.GetInstance.IniDir+'setup.msi'), nil, nil, SW_RESTORE);
    TApplicationController.GetInstance.FinalizeApplication;
    Application.Terminate;
    end;

end;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  randomize;

  actCheckNewVer.Execute;
  if DBDekTreeView_TEST1.Items.Count>0 then
  DBDekTreeView_TEST1.Selected:=DBDekTreeView_TEST1.Items[0];

  //��� ���������� ������:
  //imgChristmas.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'\KwanzaBusiness\'+inttostr(Random(12)+1)+'.jpg');

end;

procedure TfrmMain.actYearFilterExecute(Sender: TObject);
begin
 if actFilterAllYear.Checked then
    ActCurFilter.Checked := true
  else
    actFilterAllYear.Checked := true;

  actTreeRefreshAction.Execute;
  DBDekTreeView_test1.RefreshExecute(self);
end;


procedure TfrmMain.alMainActionsExecute(Action: TBasicAction;
  var Handled: Boolean);
begin
if Action is TAction then
TApplicationcontroller.GetInstance.AddLogEntry('��������� ��������: ' + TAction(Action).Caption + '('+Action.Name+')')
else
TApplicationcontroller.GetInstance.AddLogEntry('��������� ��������: ' + Action.Name);
end;

procedure TfrmMain.alMainActionsUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
if (DBDekTreeView_TEST1<>nil) then
if (DBDekTreeView_TEST1.Selected<>nil) then
if DBDekTreeView_TEST1.Selected.Expanded then
actCollapseExpand.Caption:='��������' else
actCollapseExpand.Caption:='����������'
end;

procedure TfrmMain.BitBtn1Click(Sender: TObject);
var CertD:TfrmEGECertificateCheck;
begin
CertD:=TfrmEGECertificateCheck.Create(self,'','','','','');
CertD.ShowModal;
end;

procedure TfrmMain.Button1Click(Sender: TObject);
var ex:EOleException;
begin
ex:=EOleException.Create('TEST',0,'','',0);
ex.ErrorCode:=-2147467259;
raise ex;
end;

procedure TfrmMain.actListToExcelExecute(Sender: TObject);
begin
  TAbitOtchetsController.Instance.ExportZayavl(TDBNodeAbitStudObject(DBDekTreeView_TEST1.Selected.Data).NNAbit);
end;

procedure TfrmMain.actMakeBookmarkExecute(Sender: TObject);
begin
  if (ActiveFrame is TfmSheduleDep) then
  begin
    case (ActiveFrame as TfmSheduleDep).DockTabSet2.TabIndex of
    0:
      if (ActiveFrame as TfmSheduleDep).fmLessonShedule1.actMakeBookmark.Enabled then
        (ActiveFrame as TfmSheduleDep).fmLessonShedule1.actMakeBookmarkExecute(nil);
    1:
      if (ActiveFrame as TfmSheduleDep).fmExaminationShedule1.actMakeBookmark.Enabled then
        (ActiveFrame as TfmSheduleDep).fmExaminationShedule1.actMakeBookmarkExecute(nil);
    end;
    exit;
  end;
  if (ActiveFrame is TfmSheduleFac) then
  begin
    case (ActiveFrame as TfmSheduleFac).DockTabSet2.TabIndex of
    0:
      if (ActiveFrame as TfmSheduleFac).fmLessonShedule1.actMakeBookmark.Enabled then
        (ActiveFrame as TfmSheduleFac).fmLessonShedule1.actMakeBookmarkExecute(nil);
    1:
      if (ActiveFrame as TfmSheduleFac).fmExaminationShedule1.actMakeBookmark.Enabled then
        (ActiveFrame as TfmSheduleFac).fmExaminationShedule1.actMakeBookmarkExecute(nil);
    end;
    exit;
  end;
end;

procedure TfrmMain.actMakeBookmarkUpdate(Sender: TObject);
begin
  if (ActiveFrame is TfmSheduleDep) then
  begin
    (Sender as TAction).Enabled:= ((ActiveFrame as TfmSheduleDep).PageControl1.ActivePageIndex = 2) and ((ActiveFrame as TfmSheduleDep).fmLessonShedule1.actMakeBookmark.Enabled or (ActiveFrame as TfmSheduleDep).fmExaminationShedule1.actMakeBookmark.Enabled);
    exit;
  end;
  if (ActiveFrame is TfmSheduleFac) then
  begin
    (Sender as TAction).Enabled:= ((ActiveFrame as TfmSheduleFac).PageControl1.ActivePageIndex = 1) and ((ActiveFrame as TfmSheduleFac).fmLessonShedule1.actMakeBookmark.Enabled or (ActiveFrame as TfmSheduleFac).fmExaminationShedule1.actMakeBookmark.Enabled);
    exit;
  end;
  (Sender as TAction).Enabled:= false;
end;

function ChangeMonthDayPlaces(date:TDateTime):string;
var s1:string;
begin
result:=DatetoStr(date);
s1:=result;
result[1]:=s1[4];
result[2]:=s1[5];
result[4]:=s1[1];
result[5]:=s1[2];
end;


procedure TfrmMain.actPrintMagExecute(Sender: TObject);
var year:integer;
begin
//������������� ���
  year:= YearOf(Date);
  //���� ������
  if ActiveFrame.FrameObject is TDBNodeRecruitObject then
  begin
    year:=TDBNodeRecruitObject(ActiveFrame.FrameObject).ik;
  end;
   //���� ����������
  if ActiveFrame.FrameObject is TDBNodeFacRecObject then
    year:=TDBNodeRecruitObject(TDBNodeFacRecObject(ActiveFrame.FrameObject).Node.Parent.Data).ik;
   //���� �������������
  if ActiveFrame.FrameObject is TDBNodeSpecRecObject then
    year:=TDBNodeRecruitObject(TDBNodeSpecRecObject(ActiveFrame.FrameObject).Node.Parent.Parent.Data).ik;

  frmAbitZhurnal:=TfrmAbitZhurnal.Create(self);

  frmAbitZhurnal.year:= year;
  frmAbitZhurnal.ShowModal;
  if  frmAbitZhurnal.ModalResult<>mrOk then
  begin
    frmAbitZhurnal.Free;
    exit;
  end;
  //try
    TAbitOtchetsController.Instance.ExportDaysMagToExcel(
            TDBNodeSpecRecObject(DBDekTreeView_TEST1.SelectedObject).ik, frmAbitZhurnal.dbdtmDate.Value);
  {except
    MessageBox(Handle, '��������� ������ ��� �������� ������ � Excel.','�� "����"',
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
frmQueryMaster:=TfrmQueryMaster.Create(self);
frmQueryMaster.ShowModal;
frmQueryMaster.Free;

end;


procedure TfrmMain.actPrepodsFilterExecute(Sender: TObject);
begin
  case actPrepodsFilter.Tag of
  0: actPFShowAllExecute(actPFShowWorked);
  1: actPFShowAllExecute(actPFShowReleased);
  2: actPFShowAllExecute(actPFShowAll);
  end;
end;

procedure TfrmMain.actPrintAbitDopSpecExecute(Sender: TObject);
var year:integer;
begin
  TApplicationController.GetInstance.AddLogEntry('������ ������ �� �������������� ��������������.');

  if ActiveFrame.FrameObject is TDBNodeAbitYearObject then
  begin
    year:=TDBNodeAbitYearObject(ActiveFrame.FrameObject).ik;
  end
  else
    year:=YearOf(Date);
  TAbitOtchetsController.Instance.ExportAbitListForDopSpecToExcel(year);
end;

procedure TfrmMain.actPrintAbitDopSpecUpdate(Sender: TObject);
begin
  if ActiveFrame.FrameObject is TDBNodeAbitYearObject then
  begin
    (Sender as TAction).Enabled:=
        TDBNodeAbitYearObject(ActiveFrame.FrameObject).HasAddSpec;
  end

end;

procedure TfrmMain.actPrintAllZhurnalExecute(Sender: TObject);
begin
  frmAbitZhurnal:=TfrmAbitZhurnal.Create(self);
  frmAbitZhurnal.year:=TDBNodeAbitYearObject(ActiveFrame.FrameObject).ik;
  frmAbitZhurnal.ShowModal;
  if frmAbitZhurnal.ModalResult<>mrOk then
  begin
    frmAbitZhurnal.Free;
    exit;
  end;
  if not TAbitOtchetsController.Instance.ExportAllZhurnals(frmAbitZhurnal.dbdtmDate.Value) then
  begin
     MessageBox(Handle, '��������� ������ ��� �������� �������� � Excel.','�� "����"',
           MB_OK) ;
  end;
  frmAbitZhurnal.Free;
end;



procedure TfrmMain.actPrintEgeOtchExecute(Sender: TObject);
begin
  if ActiveFrame.FrameObject is TDBNodeAbitYearObject then
  begin
    year:=TDBNodeAbitYearObject(ActiveFrame.FrameObject).ik;
  end
  else
    year:=YearOf(Date);
  TAbitOtchetsController.Instance.ExpSpisForEGEToExc(year);
end;

procedure TfrmMain.actPrintItogiPostForSpecExecute(Sender: TObject);
var
  ikSpecFac: integer;
begin


  if ActiveFrame.FrameObject is TDBNodeSpecZachObject then
  begin
    year:=TDBNodeZachObject(TDBNodeSpecZachObject(ActiveFrame.FrameObject).Node.Parent.Parent.Data).ik;
    ikSpecFac:= TDBNodeSpecZachObject(ActiveFrame.FrameObject).ik;
    TAbitOtchetsController.Instance.ExportItogiPostuplForSpec(year,ikSpecFac) ;
  end
  else

end;

procedure TfrmMain.actPrintItogiPostForSpecUpdate(Sender: TObject);
begin
  actPrintItogiPostForSpec.Enabled:=(ActiveFrame.FrameObject is TDBNodeSpecZachObject);
end;

procedure TfrmMain.actPrintItogiPostuplExecute(Sender: TObject);
var year:integer;
begin
  if ActiveFrame.FrameObject is TDBNodeAbitYearObject then
  begin
    year:=TDBNodeAbitYearObject(ActiveFrame.FrameObject).ik;
  end
  else
    year:=YearOf(Date);
  TAbitOtchetsController.Instance.ExportItogiPostupl(year) ;
end;

procedure TfrmMain.ActGroupMgrExecute(Sender: TObject);
begin
frmgroupManager:=TfrmgroupManager.create(self);
frmgroupManager.spec:=TDBNodeSpecObject(DBDekTreeView_TEST1.SelectedObject);
frmgroupManager.ShowModal;
frmgroupManager.spec.Node:=DBDekTreeView_TEST1.Selected;
frmgroupManager.Free;
DBDekTreeView_TEST1.RefreshNodeExecute(DBDekTreeView_TEST1.Selected);
end;

procedure TfrmMain.actHelpContentExecute(Sender: TObject);
begin
Application.HelpSystem.ShowTopicHelp('index.htm','ugtu_help.chm');


end;

procedure TfrmMain.actShowTreeExecute(Sender: TObject);
begin
Panel3.Visible := actShowTree.checked;
DBDekTreeView_TEST1.Visible := actShowTree.checked;
end;

procedure TfrmMain.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var ctrl:TWinControl;
  topic:string;
begin
if (Key=112)	then
begin
  topic:='';
  ctrl:=Self.ActiveControl;
  while (ctrl<>nil)and(topic='') do
  begin
    //if ctrl.HelpKeyword<>'' then
    topic:=ctrl.HelpKeyword;
    ctrl:=ctrl.Parent;
  end;
  //showmessage(topic+','+CurrentTopic);
if (topic<>'') then Application.HelpSystem.ShowTopicHelp(topic,'ugtu_help.chm')
  else Application.HelpSystem.ShowTopicHelp(CurrentTopic,'ugtu_help.chm');

end;

end;

procedure TfrmMain.actAbitFilterExecute(Sender: TObject);
begin
{if actAbitCurrent.Checked then
    actAbitAll.Checked := true
  else
    actAbitCurrent.Checked := true;

  actTreeRefreshAction.Execute;
  DBDekTreeView_test1.RefreshExecute(self);}
end;

procedure TfrmMain.actAbitMoveExecute(Sender: TObject);
var cur:integer;
begin
frmAbitMove:=TfrmAbitMove.create(self);
frmAbitMove.IDStudent:=
    TDBNodeAbitStudObject(DBDekTreeView_TEST1.Selected.Data).ik;
frmAbitMove.NNAbit:=
    TDBNodeAbitStudObject(DBDekTreeView_TEST1.Selected.Data).NNAbit;
 frmAbitMove.Hint:=inttostr(TDBNodeSpecRecObject(DBDekTreeView_TEST1.Selected.Parent.Data).Year);
 frmAbitMove.Tag:=0;
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
  dbNode: TDBNodeObject;
begin
  dbNode:= frmMain.DBDekTreeView_TEST1.Selected.Data;
  frmNagruzkaKafedraMaster:= TfrmNagruzkaKafedraMaster.Create(nil);
  frmNagruzkaKafedraMaster.Connection:= dm.DBConnect;
  frmNagruzkaKafedraMaster.KafIK:= (dbNode as TDBNodedepartmentObject).ik;
  frmNagruzkaKafedraMaster.StaticText12.Caption:= frmNagruzkaKafedraMaster.StaticText12.Caption + (dbNode as TDBNodedepartmentObject).ShortName + '".';
  frmNagruzkaKafedraMaster.StaticText23.Caption:= frmNagruzkaKafedraMaster.StaticText23.Caption + (dbNode as TDBNodedepartmentObject).ShortName + '" ������� ���������.';
  frmNagruzkaKafedraMaster.Read;
  frmNagruzkaKafedraMaster.Show;
end;

procedure TfrmMain.actStartUOMasterExecute(Sender: TObject);
begin
  frmNagruzkaUchOtdelMaster:= TfrmNagruzkaUchOtdelMaster.Create(Application);
 // ShowWindow(frmNagruzkaUchOtdelMaster.Handle, SW_NORMAL);
  frmNagruzkaUchOtdelMaster.Connection:= dm.DBConnect;
  frmNagruzkaUchOtdelMaster.Show;
end;

procedure TfrmMain.actStatToExcelExecute(Sender: TObject);
var   filter: string;
      year:integer;
begin
  //����������� ������ � ����������� �� ���������� �������
  try
    if ActiveFrame.FrameObject is TDBNodeRecruitObject then
	  begin
		  Filter:='';
	  end;

	  if ActiveFrame.FrameObject is TDBNodeFacRecObject then
		  Filter:='ik_fac =' + inttostr(TDBNodeFacRecObject(ActiveFrame.FrameObject).ik)+'';

	  if ActiveFrame.FrameObject is TDBNodeSpecRecObject then
		  Filter:='ik_spec_fac =' + inttostr(TDBNodeSpecRecObject(ActiveFrame.FrameObject).ik)+'';
    if DMAbiturientNabor.adospAbitGetPostupStatistika.Active then
      year:= DMAbiturientNabor.adospAbitGetPostupStatistika.FieldByName('nnyear').AsInteger
    else
      year:= YearOf(Date);

    TAbitOtchetsController.Instance.ExportAllStatToExcel(year, filter)
  except
    MessageBox(Handle, '��������� ������ ��� �������� ������ � Excel.','�� "����"',
           MB_OK) ;
  end;
end;


procedure TfrmMain.actJoinGroupExecute(Sender: TObject);
begin
if not(ActiveFrame is TfmZach) then exit;
  TAbitZachislenieController.Instance.Abit_JoinGroup(@(ActiveFrame as TfmZach).prikaz);
end;

procedure TfrmMain.actJoinGroupUpdate(Sender: TObject);
begin
if not (ActiveFrame is TfmZach) then exit;
if (ActiveFrame is TfmZach)then
if ((ActiveFrame as TfmZach).prikaz.DataSource<>nil) then
if ((ActiveFrame as TfmZach).prikaz.DataSource.dataset<>nil) then
   (Sender as TAction).Enabled:=
      ((ActiveFrame as TfmZach).prikaz.RowCount>0) and
      ((ActiveFrame as TfmZach).prikaz.DataSource.DataSet.FieldByName('CName_grup').Value=NULL)
      else (Sender as TAction).Enabled:=false;
end;

procedure TfrmMain.actKatChangeExecute(Sender: TObject);
var
  cur: Integer;
begin
 frmChangeKatZach:=tfrmChangeKatZach.Create(self);
 frmChangeKatZach.Student:=DBDekTreeView_TEST1.Selected.DATA;
 frmChangeKatZach.Showmodal;
 frmChangeKatZach.Free;
  //------------�����---------------
 cur := DBDekTreeView_TEST1.SelectedObject.Node.Index;
 DBDekTreeView_TEST1.Selected := DBDekTreeView_TEST1.Selected.Parent;
  actTreeRefreshAction.Execute;
  DBDekTreeView_TEST1.SelectNodeByNum(cur, false);
end;

procedure TfrmMain.actGazpromStatementExecute(Sender: TObject);
begin
  TAbitOtchetsController.Instance.GazpromBankStatementToWord(TDBNodeAbitStudObject(DBDekTreeView_TEST1.Selected.Data).NNAbit);
end;

procedure TfrmMain.actGroupChangeExecute(Sender: TObject);
begin
  TAbitZachislenieController.Instance.Abit_ChangeGroup(@(ActiveFrame as TfmZach).prikaz);
end;

procedure TfrmMain.actGroupChangeUpdate(Sender: TObject);
begin
if not (ActiveFrame is TfmZach) then exit;
if ((ActiveFrame as TfmZach).prikaz.DataSource= nil) then exit;
   actGroupChange.Enabled:=
      ((ActiveFrame as TfmZach).prikaz.RowCount>0) and
      ((ActiveFrame as TfmZach).prikaz.DataSource.DataSet.FieldByName('Cname_grup').Value<>NULL);
end;

procedure TfrmMain.actCurrentReturnExecute(Sender: TObject);
begin
  (ACtiveFrame as TfmZach).actAbitReturnExecuteExecute(Sender);
end;

procedure TfrmMain.actChangeSemFilterExecute(Sender: TObject);
begin
 if actCurrentSem.Checked then
    ActAllSem.Checked := true
  else
    actCurrentSem.Checked := true;

  actTreeRefreshAction.Execute;
  DBDekTreeView_test1.RefreshExecute(self);
end;

procedure TfrmMain.GetLichnKartStud(ncode: integer; ik_grup: integer);
var  E:Variant;
     str:string;
begin

  dmStudentSelectionProcs.adolichnKartStud.Close;
  dmStudentSelectionProcs.adolichnKartStud.Parameters.Clear;
  dmStudentSelectionProcs.adolichnKartStud.Parameters.CreateParameter('@ncode',ftInteger,pdInput,0,ncode);
  dmStudentSelectionProcs.adolichnKartStud.Parameters.CreateParameter('@ik_grup',ftInteger,pdInput,0,ik_grup);
  dmStudentSelectionProcs.adolichnKartStud.Open;

  if dmStudentSelectionProcs.adolichnKartStud.RecordCount=1 then begin
  try
  E := CreateOleObject('Excel.Application');
  str := ExtractFilePath(Application.ExeName)+'reports\kartstud.xlt';
  E.WorkBooks.Add(str);
  E.Visible := false;
  E.Sheets[1].Select;

  //   photo
 { if (dmStudentSelectionProcs.adolichnKartStud.Fields[1].Value <> Null) and (dmStudentSelectionProcs.adolichnKartStud.Fields[1].Value <> '') then
  begin
  //(dm.adolichnKartStud.Fields[1] as TBlobField)
  end;  }

  E.range['q4']:= dmStudentSelectionProcs.adolichnKartStud.Fields[2].asstring;
  E.range['o6']:= dmStudentSelectionProcs.adolichnKartStud.Fields[3].asstring;
  E.range['o7']:=dmStudentSelectionProcs.adolichnKartStud.Fields[4].asstring;
  E.range['o8']:=dmStudentSelectionProcs.adolichnKartStud.Fields[5].asstring;
  E.range['o9']:=dmStudentSelectionProcs.adolichnKartStud.Fields[6].asstring;

  if dmStudentSelectionProcs.adolichnKartStud.Fields[7].AsBoolean then
    E.range['n11']:='�������'
    else
    E.range['n11']:='�������';

  E.range['n12']:=dmStudentSelectionProcs.adolichnKartStud.Fields[8].asstring;
  E.range['n15']:=dmStudentSelectionProcs.adolichnKartStud.Fields[9].asstring;

  E.range['n18']:=dmStudentSelectionProcs.adolichnKartStud.Fields[10].asstring;

  E.range['n19']:=dmStudentSelectionProcs.adolichnKartStud.Fields[11].asstring;

  E.range['n22']:=dmStudentSelectionProcs.adolichnKartStud.Fields[12].asstring;

  str:=dmStudentSelectionProcs.adolichnKartStud.Fields[13].asstring;
  if dmStudentSelectionProcs.adolichnKartStud.Fields[14].asboolean then
     str:=str+', ������� �����';
  E.range['n25']:=str;


  with dmStudentSelectionProcs.aspSelFamily do
  begin
    Active:=false;
    Parameters.Clear;
    Parameters.AddParameter;
    Parameters[0].Value:=ncode;
    ExecProc;
    Active:=true;
  end;

  dmStudentSelectionProcs.aspSelFamily.first;
  while not dmStudentSelectionProcs.aspSelFamily.eof do begin
    if ((dmStudentSelectionProcs.aspSelFamily.FieldByName('ik_memb_fam').Value=25) or (dmStudentSelectionProcs.aspSelFamily.FieldByName('ik_memb_fam').Value=26)) then
      begin
       str:=dmStudentSelectionProcs.aspSelFamily.FieldByName('���').asstring+' '+dmStudentSelectionProcs.aspSelFamily.FieldByName('���� ��������').asstring+' ';
         if dmStudentSelectionProcs.aspSelFamily.FieldByName('pred').asstring <> '�� �������' then
           str:=str+dmStudentSelectionProcs.aspSelFamily.FieldByName('pred').asstring+' ';
         str:=str+dmStudentSelectionProcs.aspSelFamily.FieldByName('���������').asstring+' '+dmStudentSelectionProcs.aspSelFamily.FieldByName('�����').asstring;
       E.range['n28']:=str;
       end;
    if ((dmStudentSelectionProcs.aspSelFamily.FieldByName('ik_memb_fam').Value=15) or (dmStudentSelectionProcs.aspSelFamily.FieldByName('ik_memb_fam').Value=18)) then
      begin
       str:=dmStudentSelectionProcs.aspSelFamily.FieldByName('���').asstring+' '+dmStudentSelectionProcs.aspSelFamily.FieldByName('���� ��������').asstring+' ';
         if dmStudentSelectionProcs.aspSelFamily.FieldByName('pred').asstring <> '�� �������' then
           str:=str+dmStudentSelectionProcs.aspSelFamily.FieldByName('pred').asstring+' ';
         str:=str+dmStudentSelectionProcs.aspSelFamily.FieldByName('���������').asstring+' '+dmStudentSelectionProcs.aspSelFamily.FieldByName('�����').asstring;
       E.range['n31']:=str;
       end;
    dmStudentSelectionProcs.aspSelFamily.next;
  end;
     
  str:=dmStudentSelectionProcs.adolichnKartStud.Fields[15].asstring;
  if dmStudentSelectionProcs.adolichnKartStud.Fields[16].Value<>'' then
     str:=str+' ���. ���.'+dmStudentSelectionProcs.adolichnKartStud.Fields[16].asstring;
  E.range['n33']:=str;

  str:=dmStudentSelectionProcs.adolichnKartStud.Fields[17].asstring;
  if dmStudentSelectionProcs.adolichnKartStud.Fields[18].Value<>'' then
     str:=str+' ���.'+dmStudentSelectionProcs.adolichnKartStud.Fields[18].asstring;
  E.range['n36']:=str;

  //E.Sheets[1].PageSetup.LeftFooter:='&5' + TApplicationController.GetInstance.DocumentFooter;
  E.Visible := true;

  except
    E.Quit;
    E:= UnAssigned;
  end;

  end;       

end;

function TfrmMain.GetPanel8: TDataProcessingSplashDlg;
const
   FInternalPanel8:TDataProcessingSplashDlg = nil;
begin
   if not Assigned(FInternalPanel8) then
   begin
     FInternalPanel8 := TDataProcessingSplashDlg.Create(Self);
   end;
   Result:=FInternalPanel8;
end;


function TfrmMain.LoadScheduleBookmarks: boolean;
var
  ikList: TStringList;
  i: integer;
  newca: TActionClientItem;
begin
  Result:= false;
  ikList:= TSheduleController.MainFunctions.GetAllBookmarks;
  if Assigned(ikList) then
  begin
    for i := 0 to ikList.Count - 1 do
    begin
      ActionManager1.ActionBars[3].Items[0].Items[2].Visible:= true;
      newca:= ActionManager1.ActionBars[3].Items[0].Items.add;
      newca.Action:= TAction.Create(frmMain.alMainActions);
      newca.Action.OnExecute:= OnScheduleBookmarkExecute;
      newca.Action.OnUpdate:= actFilleMenuUpdate;
      newca.Action.Tag:= StrToInt(ikList[i]);
      newca.Caption:= TSheduleController.MainFunctions.GetScheduleBookmarkName(StrToInt(ikList[i]));
    end;
    ikList.Free;
    actScheduleBookmarks.Tag:= 1;
    Result:= true;
  end;
end;

procedure TfrmMain.actLichnKartStudExecute(Sender: TObject);
begin
  GetLichnKartStud(TDBNodeStudObject(ACtiveFrame.FrameObject).id,
      TDBNodeGroupObject(TDBNodeStudObject(ACtiveFrame.FrameObject).node.Parent.Data).ik);
end;


end.





