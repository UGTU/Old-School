unit uNagruzkaKafedraMaster;
 {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, ActnList, DBGridEh, Mask, ADODB,
  DBCtrlsEh, DBLookupEh, uBaseFrame, uNagruzkaDep,
  uNagruzkaPrepAllInfo;

type
  TfrmNagruzkaKafedraMaster = class(TForm)
    ActionList1: TActionList;
    actClose: TAction;
    actBackToSelTeacher: TAction;
    actStartToCreatePotok: TAction;
    actBack: TAction;
    actSelTeacherToTPN: TAction;
    actDPNToSelTeacher: TAction;
    actTPNToTS: TAction;
    PageControl1: TPageControl;
    tsStart: TTabSheet;
    Bevel1: TBevel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    tsDepPlanNagr: TTabSheet;
    Bevel4: TBevel;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    tsTeacherPlanNagr: TTabSheet;
    Bevel5: TBevel;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    tsFinish: TTabSheet;
    Bevel6: TBevel;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    tsSelectTeacher: TTabSheet;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Bevel2: TBevel;
    tsTeacherShedule: TTabSheet;
    tsTeacherFactNagr: TTabSheet;
    Bevel13: TBevel;
    BitBtn6: TBitBtn;
    BitBtn19: TBitBtn;
    BitBtn20: TBitBtn;
    Bevel15: TBevel;
    BitBtn21: TBitBtn;
    BitBtn22: TBitBtn;
    BitBtn23: TBitBtn;
    actTSToTFN: TAction;
    actTFNToFinish: TAction;
    Panel1: TPanel;
    PageControl2: TPageControl;
    tsCapStart: TTabSheet;
    Label17: TLabel;
    StaticText3: TStaticText;
    tsCapDepPlanNagr: TTabSheet;
    Label19: TLabel;
    StaticText5: TStaticText;
    tsCapSelTeacher: TTabSheet;
    Label20: TLabel;
    StaticText6: TStaticText;
    tsCapTeachPlanNagr: TTabSheet;
    Label21: TLabel;
    StaticText7: TStaticText;
    tsCapTeachShedule: TTabSheet;
    Label22: TLabel;
    StaticText8: TStaticText;
    tsCapTeachFactNagr: TTabSheet;
    tsCapFinish: TTabSheet;
    StaticText1: TStaticText;
    Label1: TLabel;
    StaticText2: TStaticText;
    Label2: TLabel;
    Label13: TLabel;
    StaticText9: TStaticText;
    StaticText10: TStaticText;
    dbcbPrep: TDBLookupComboboxEh;
    StaticText11: TStaticText;
    fmDepPlanNagr: TfmNagruzkaDep;
    Image2: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image1: TImage;
    Image8: TImage;
    StaticText12: TStaticText;
    StaticText13: TStaticText;
    StaticText15: TStaticText;
    StaticText16: TStaticText;
    StaticText17: TStaticText;
    StaticText18: TStaticText;
    StaticText19: TStaticText;
    StaticText20: TStaticText;
    StaticText21: TStaticText;
    StaticText22: TStaticText;
    StaticText23: TStaticText;
    dbcbWorkType: TDBLookupComboboxEh;
    Label3: TLabel;
    Image10: TImage;
    Label4: TLabel;
    Image11: TImage;
    Label6: TLabel;
    Image12: TImage;
    Label7: TLabel;
    Image13: TImage;
    Label8: TLabel;
    fmPrepShedule: TfmNagruzkaPrepAllInfo;
    procedure actStartToExecute(Sender: TObject);
    procedure actBackExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actSelTeacherToTPNUpdate(Sender: TObject);
    procedure actDPNToSelTeacherExecute(Sender: TObject);
    procedure actSelTeacherToTPNExecute(Sender: TObject);
    procedure actTPNToTSExecute(Sender: TObject);
    procedure actTSToTFNExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure actTFNToFinishExecute(Sender: TObject);
    procedure actBackToSelTeacherExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbcbPrepKeyValueChanged(Sender: TObject);
    procedure Label4MouseLeave(Sender: TObject);
    procedure Label4MouseEnter(Sender: TObject);
    procedure Label6MouseEnter(Sender: TObject);
    procedure Label6MouseLeave(Sender: TObject);
    procedure Label7MouseEnter(Sender: TObject);
    procedure Label7MouseLeave(Sender: TObject);
    procedure Label8MouseEnter(Sender: TObject);
    procedure Label8MouseLeave(Sender: TObject);
  private
    fKafIK: integer;
    FConnection: TADOConnection;
  public
    property Connection:TADOConnection read FConnection write FConnection;
    property KafIK: integer read fKafIK write fKafIK;
    procedure Read;
  end;

var
  frmNagruzkaKafedraMaster: TfrmNagruzkaKafedraMaster;

implementation

uses GeneralController, NagruzkaController;

const
  baseCaption: string = 'ћастер "”чет учебной нагрузки"';

{$R *.dfm}

procedure TfrmNagruzkaKafedraMaster.actBackExecute(Sender: TObject);
begin
  case PageControl1.ActivePageIndex of
  1: Caption:= baseCaption;
  2: Caption:= baseCaption + ' - шаг 1';
  3: Caption:= baseCaption + ' - шаг 2';
  4: Caption:= baseCaption + ' - шаг 3';
  5: Caption:= baseCaption + ' - шаг 4';
  6: Caption:= baseCaption + ' - шаг 5';
  end;
  PageControl1.ActivePageIndex:= PageControl1.ActivePageIndex - 1;
  PageControl2.ActivePageIndex:= PageControl2.ActivePageIndex - 1;
end;

procedure TfrmNagruzkaKafedraMaster.actBackToSelTeacherExecute(Sender: TObject);
begin
  PageControl1.ActivePageIndex:= 3;
  PageControl2.ActivePageIndex:= 3;
end;

procedure TfrmNagruzkaKafedraMaster.actCloseExecute(Sender: TObject);
begin
  Close();
end;

procedure TfrmNagruzkaKafedraMaster.actDPNToSelTeacherExecute(Sender: TObject);
begin
  Caption:= baseCaption + ' - шаг 2';
  PageControl1.ActivePageIndex:= PageControl1.ActivePageIndex + 1;
  PageControl2.ActivePageIndex:= PageControl2.ActivePageIndex + 1;
  Refresh;
  dbcbPrep.SetFocus;
end;

procedure TfrmNagruzkaKafedraMaster.actSelTeacherToTPNExecute(Sender: TObject);
var
  i: integer;
begin
 { Caption:= baseCaption + ' - шаг 3';
  fmPrepPlanNagr.IK:= dbcbWorkType.KeyValue;
  fmPrepPlanNagr.Connection:= Connection;
  fmPrepPlanNagr.IsLoadFromMaster:= true;
  fmPrepPlanNagr.Read;
  for I := 0 to fmPrepPlanNagr.PageControl1.PageCount - 1 do
    fmPrepPlanNagr.PageControl1.Pages[i].TabVisible:= false;
  fmPrepPlanNagr.PageControl1.ActivePageIndex:= 0;
  PageControl1.ActivePageIndex:= PageControl1.ActivePageIndex + 1;
  PageControl2.ActivePageIndex:= PageControl2.ActivePageIndex + 1;  }
end;

procedure TfrmNagruzkaKafedraMaster.actSelTeacherToTPNUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= dbcbWorkType.KeyValue <> NULL;
end;

procedure TfrmNagruzkaKafedraMaster.actStartToExecute(
  Sender: TObject);
var
  i: integer;
begin
  Caption:= baseCaption + ' - шаг 1';
  fmDepPlanNagr.IK:= fKafIK;
  fmDepPlanNagr.Connection:= Connection;
  fmDepPlanNagr.IsLoadFromMaster:= true;
  fmDepPlanNagr.Read;
  for I := 0 to fmDepPlanNagr.PageControl1.PageCount - 1 do
    fmDepPlanNagr.PageControl1.Pages[i].TabVisible:= false;
  fmDepPlanNagr.PageControl1.ActivePageIndex:= 2;
  PageControl1.ActivePageIndex:= PageControl1.ActivePageIndex + 1;
  PageControl2.ActivePageIndex:= PageControl2.ActivePageIndex + 1;
end;

procedure TfrmNagruzkaKafedraMaster.actTFNToFinishExecute(Sender: TObject);
begin
  Caption:= baseCaption;
  PageControl1.ActivePageIndex:= PageControl1.ActivePageIndex + 1;
  PageControl2.ActivePageIndex:= PageControl2.ActivePageIndex + 1;
end;

procedure TfrmNagruzkaKafedraMaster.actTPNToTSExecute(Sender: TObject);
var
  i: integer;
begin
  Caption:= baseCaption + ' - шаг 4';
  fmPrepShedule.IK:= dbcbPrep.KeyValue;
  fmPrepShedule.KafIK:= fKafIK;
  fmPrepShedule.Connection:= Connection;
  fmPrepShedule.IsLoadFromMaster:= true;
  fmPrepShedule.Read;
  for I := 0 to fmPrepShedule.PageControl1.PageCount - 1 do
    fmPrepShedule.PageControl1.Pages[i].TabVisible:= false;
  fmPrepShedule.PageControl1.ActivePageIndex:= 1;
  PageControl1.ActivePageIndex:= PageControl1.ActivePageIndex + 1;
  PageControl2.ActivePageIndex:= PageControl2.ActivePageIndex + 1;
end;

procedure TfrmNagruzkaKafedraMaster.actTSToTFNExecute(Sender: TObject);
var
  i: integer;
begin
 { Caption:= baseCaption + ' - шаг 5';
  fmPrepFactNagr.IK:= dbcbWorkType.KeyValue;
  fmPrepFactNagr.Connection:= Connection;
  fmPrepFactNagr.IsLoadFromMaster:= true;
  fmPrepFactNagr.Read;
  for I := 0 to fmPrepFactNagr.PageControl1.PageCount - 1 do
    fmPrepFactNagr.PageControl1.Pages[i].TabVisible:= false;
  fmPrepFactNagr.PageControl1.ActivePageIndex:= 1;
  PageControl1.ActivePageIndex:= PageControl1.ActivePageIndex + 1;
  PageControl2.ActivePageIndex:= PageControl2.ActivePageIndex + 1; }
end;

procedure TfrmNagruzkaKafedraMaster.dbcbPrepKeyValueChanged(Sender: TObject);
begin
{  TGeneralController.Instance.CloseLockupCB(@dbcbWorkType);
  if dbcbPrep.KeyValue <> NULL then
    TNagruzkaController.Instance.GetAllPrepWorkTypes(@dbcbWorkType.ListSource.DataSet, dbcbPrep.KeyValue, fKafIK, false);}
end;

procedure TfrmNagruzkaKafedraMaster.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TfrmNagruzkaKafedraMaster.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if PageControl1.ActivePageIndex = 6 then
    CanClose:= true
  else
    if Application.MessageBox('¬ы уверены, что хотите завершить работу мастера?', PChar(baseCaption), MB_YESNO) = mrNo then
      CanClose:= false;
end;

procedure TfrmNagruzkaKafedraMaster.FormCreate(Sender: TObject);
begin
 { SetWindowLong(Handle, GWL_EXSTYLE, GetWindowLong(Handle, GWL_EXSTYLE) or WS_EX_APPWINDOW);
  fmPrepFactNagr.LastFactIK:= -1;
  fmPrepPlanNagr.LastPlanIK:= -1;}
end;

procedure TfrmNagruzkaKafedraMaster.Label4MouseEnter(Sender: TObject);
begin
  Label4.Font.Style:= Label4.Font.Style + [fsUnderline];
end;

procedure TfrmNagruzkaKafedraMaster.Label4MouseLeave(Sender: TObject);
begin
  Label4.Font.Style:= Label4.Font.Style - [fsUnderline];
end;

procedure TfrmNagruzkaKafedraMaster.Label6MouseEnter(Sender: TObject);
begin
  Label6.Font.Style:= Label6.Font.Style + [fsUnderline];
end;

procedure TfrmNagruzkaKafedraMaster.Label6MouseLeave(Sender: TObject);
begin
  Label6.Font.Style:= Label6.Font.Style - [fsUnderline];
end;

procedure TfrmNagruzkaKafedraMaster.Label7MouseEnter(Sender: TObject);
begin
  Label7.Font.Style:= Label7.Font.Style + [fsUnderline];
end;

procedure TfrmNagruzkaKafedraMaster.Label7MouseLeave(Sender: TObject);
begin
  Label7.Font.Style:= Label7.Font.Style - [fsUnderline];
end;

procedure TfrmNagruzkaKafedraMaster.Label8MouseEnter(Sender: TObject);
begin
  Label8.Font.Style:= Label8.Font.Style + [fsUnderline];
end;

procedure TfrmNagruzkaKafedraMaster.Label8MouseLeave(Sender: TObject);
begin
  Label8.Font.Style:= Label8.Font.Style - [fsUnderline];
end;

procedure TfrmNagruzkaKafedraMaster.Read;
begin
  PageControl1.ActivePageIndex:= 0;
  PageControl2.ActivePageIndex:= 0;
  TGeneralController.Instance.InitializeLockupCB(@dbcbPrep, 'iTab_n', 'FIO');
  TGeneralController.Instance.InitializeLockupCB(@dbcbWorkType, 'ik_id_prepod', 'cName_work_type');
  TNagruzkaController.Preparation.GetAllPrepInKaf(@dbcbPrep.ListSource.DataSet, fKafIK);
end;

end.
