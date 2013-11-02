unit uNagruzkaUchOtdelMaster;
 {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, StdCtrls, Buttons, ExtCtrls, ComCtrls, uBaseFrame, DB, ADODB,
  uNagruzka, DBGridEh, uNagruzkaFac, Mask, DBCtrlsEh, DBLookupEh, uNagruzkaDep;

type
  TfrmNagruzkaUchOtdelMaster = class(TForm)
    PageControl1: TPageControl;
    tsSemLength: TTabSheet;
    tsSelectFac: TTabSheet;
    tsNormOfTime: TTabSheet;
    tsPlanContingent: TTabSheet;
    tsFinish: TTabSheet;
    ActionList1: TActionList;
    actClose: TAction;
    actBackToSelFac: TAction;
    actStartToSemLength: TAction;
    Bevel2: TBevel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Bevel3: TBevel;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    Bevel4: TBevel;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    Bevel5: TBevel;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    Bevel6: TBevel;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    actBack: TAction;
    actSemLengthToSelFac: TAction;
    actNOTToPC: TAction;
    actPCToSelDep: TAction;
    actSelFacToNOT: TAction;
    fmNagruzkaMain1: TfmNagruzkaMain;
    StaticText1: TStaticText;
    Label13: TLabel;
    StaticText2: TStaticText;
    dbcbFaculty: TDBLookupComboboxEh;
    fmNagruzkaFac1: TfmNagruzkaFac;
    fmNagruzkaFac2: TfmNagruzkaFac;
    Panel1: TPanel;
    PageControl2: TPageControl;
    tsCapStart: TTabSheet;
    Label12: TLabel;
    StaticText3: TStaticText;
    tsCapSemLength: TTabSheet;
    tsCapSelFac: TTabSheet;
    tsCapNOT: TTabSheet;
    tsCapPGC: TTabSheet;
    tsCapFinish: TTabSheet;
    Label11: TLabel;
    StaticText4: TStaticText;
    Label1: TLabel;
    StaticText5: TStaticText;
    Label2: TLabel;
    StaticText6: TStaticText;
    Label3: TLabel;
    StaticText7: TStaticText;
    Label4: TLabel;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    Image2: TImage;
    Image1: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    StaticText17: TStaticText;
    StaticText18: TStaticText;
    StaticText19: TStaticText;
    Image7: TImage;
    Label5: TLabel;
    Image8: TImage;
    Label6: TLabel;
    Image9: TImage;
    Label7: TLabel;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label8: TLabel;
    Label9: TLabel;
    Image10: TImage;
    Image11: TImage;
    StaticText22: TStaticText;
    StaticText23: TStaticText;
    tsSelectDep: TTabSheet;
    tsCreatePotok: TTabSheet;
    tsStart: TTabSheet;
    Bevel1: TBevel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    StaticText10: TStaticText;
    StaticText11: TStaticText;
    StaticText12: TStaticText;
    StaticText13: TStaticText;
    StaticText14: TStaticText;
    StaticText15: TStaticText;
    StaticText16: TStaticText;
    StaticText20: TStaticText;
    StaticText21: TStaticText;
    StaticText24: TStaticText;
    StaticText25: TStaticText;
    StaticText26: TStaticText;
    dbcbDep: TDBLookupComboboxEh;
    BitBtn1: TBitBtn;
    Label10: TLabel;
    Bevel7: TBevel;
    BitBtn19: TBitBtn;
    BitBtn20: TBitBtn;
    Bevel8: TBevel;
    Image12: TImage;
    Label14: TLabel;
    BitBtn21: TBitBtn;
    BitBtn22: TBitBtn;
    BitBtn23: TBitBtn;
    fmDepCreatePotok: TfmNagruzkaDep;
    actSelDepToCP: TAction;
    actCPToFinish: TAction;
    BitBtn24: TBitBtn;
    actBackToSelDep: TAction;
    StaticText27: TStaticText;
    procedure actCloseExecute(Sender: TObject);
    procedure actBackExecute(Sender: TObject);
    procedure actBackToSelFacExecute(Sender: TObject);
    procedure actNOTToPCExecute(Sender: TObject);
    procedure actSemLengthToSelFacExecute(Sender: TObject);
    procedure actStartToSemLengthExecute(Sender: TObject);
    procedure actSelFacToNOTExecute(Sender: TObject);
    procedure actPCToSelDepExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actSelFacToNOTUpdate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Label5MouseEnter(Sender: TObject);
    procedure Label5MouseLeave(Sender: TObject);
    procedure Label6MouseEnter(Sender: TObject);
    procedure Label6MouseLeave(Sender: TObject);
    procedure Label7MouseEnter(Sender: TObject);
    procedure Label7MouseLeave(Sender: TObject);
    procedure actCPToFinishExecute(Sender: TObject);
    procedure actBackToSelDepExecute(Sender: TObject);
    procedure Label14MouseEnter(Sender: TObject);
    procedure Label14MouseLeave(Sender: TObject);
    procedure actSelDepToCPExecute(Sender: TObject);
    procedure actSelDepToCPUpdate(Sender: TObject);
  private
    FConnection: TADOConnection;
  public
    property Connection:TADOConnection read FConnection write FConnection;
  end;

var
  frmNagruzkaUchOtdelMaster: TfrmNagruzkaUchOtdelMaster;

implementation

uses GeneralController, NagruzkaController;

const
  baseCaption: string = 'Мастер "Подготовка данных для учета учебной нагрузки"';

{$R *.dfm}

procedure TfrmNagruzkaUchOtdelMaster.actBackExecute(Sender: TObject);
begin
  case PageControl1.ActivePageIndex of
  1: Caption:= baseCaption;
  2: Caption:= baseCaption + ' - шаг 1';
  3: Caption:= baseCaption + ' - шаг 2';
  4: Caption:= baseCaption + ' - шаг 3';
  5: Caption:= baseCaption + ' - шаг 4';
  6: Caption:= baseCaption + ' - шаг 5';
  7: Caption:= baseCaption + ' - шаг 6';
  end;
  PageControl1.ActivePageIndex:= PageControl1.ActivePageIndex - 1;
  PageControl2.ActivePageIndex:= PageControl2.ActivePageIndex - 1;
end;

procedure TfrmNagruzkaUchOtdelMaster.actBackToSelDepExecute(Sender: TObject);
begin
  Caption:= baseCaption + ' - шаг 5';
  PageControl1.ActivePageIndex:= 5;
  PageControl2.ActivePageIndex:= 5;
end;

procedure TfrmNagruzkaUchOtdelMaster.actBackToSelFacExecute(Sender: TObject);
begin
  Caption:= baseCaption + ' - шаг 2';
  PageControl1.ActivePageIndex:= 2;
  PageControl2.ActivePageIndex:= 2;
end;

procedure TfrmNagruzkaUchOtdelMaster.actCloseExecute(Sender: TObject);
begin
  Close();
end;

procedure TfrmNagruzkaUchOtdelMaster.actCPToFinishExecute(Sender: TObject);
begin
  Caption:= baseCaption;
  PageControl1.ActivePageIndex:= PageControl1.ActivePageIndex + 1;
  PageControl2.ActivePageIndex:= PageControl2.ActivePageIndex + 1;
end;

procedure TfrmNagruzkaUchOtdelMaster.actNOTToPCExecute(Sender: TObject);
var
  i: integer;
begin
  Caption:= baseCaption + ' - шаг 4';
  for I := 0 to fmNagruzkaFac2.PageControl1.PageCount - 1 do
    fmNagruzkaFac2.PageControl1.Pages[i].TabVisible:= false;
  fmNagruzkaFac2.IK:= dbcbFaculty.KeyValue;
  fmNagruzkaFac2.Connection:= Connection;
  fmNagruzkaFac2.Read;
  fmNagruzkaFac2.PageControl1.ActivePageIndex:= 2;
  PageControl1.ActivePageIndex:= PageControl1.ActivePageIndex + 1;
  PageControl2.ActivePageIndex:= PageControl2.ActivePageIndex + 1;
end;

procedure TfrmNagruzkaUchOtdelMaster.actPCToSelDepExecute(Sender: TObject);
begin
  Caption:= baseCaption + ' - шаг 5';
  PageControl1.ActivePageIndex:= PageControl1.ActivePageIndex + 1;
  PageControl2.ActivePageIndex:= PageControl2.ActivePageIndex + 1;
  Refresh;
  dbcbDep.SetFocus;
end;

procedure TfrmNagruzkaUchOtdelMaster.actSelDepToCPExecute(Sender: TObject);
var
  i: integer;
begin
  Caption:= baseCaption + ' - шаг 6';
  Label9.Caption:= 'Шаг 6. Управление потоками кафедры "' + dbcbDep.ListSource.DataSet.FieldByName('cshort_name_kaf').AsString + '"';
  for I := 0 to fmDepCreatePotok.PageControl1.PageCount - 1 do
    fmDepCreatePotok.PageControl1.Pages[i].TabVisible:= false;
  fmDepCreatePotok.IK:= dbcbDep.KeyValue;
  fmDepCreatePotok.Connection:= Connection;
  fmDepCreatePotok.Read;
  fmDepCreatePotok.PageControl1.ActivePageIndex:= 1;
  PageControl1.ActivePageIndex:= PageControl1.ActivePageIndex + 1;
  PageControl2.ActivePageIndex:= PageControl2.ActivePageIndex + 1;
end;

procedure TfrmNagruzkaUchOtdelMaster.actSelDepToCPUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= dbcbDep.KeyValue <> NULL;
end;

procedure TfrmNagruzkaUchOtdelMaster.actSelFacToNOTExecute(
  Sender: TObject);
var
  i: integer;
begin
  Caption:= baseCaption + ' - шаг 3';
  for I := 0 to fmNagruzkaFac1.PageControl1.PageCount - 1 do
    fmNagruzkaFac1.PageControl1.Pages[i].TabVisible:= false;
  fmNagruzkaFac1.IK:= dbcbFaculty.KeyValue;
  fmNagruzkaFac1.Connection:= Connection;
  fmNagruzkaFac1.Read;
  fmNagruzkaFac1.PageControl1.ActivePageIndex:= 1;
  TGeneralController.Instance.CloseLockupCB(@dbcbDep);
  TNagruzkaController.Directory.GetAllDepartments(@dbcbDep.ListSource.DataSet, dbcbFaculty.KeyValue, false);
  PageControl1.ActivePageIndex:= PageControl1.ActivePageIndex + 1;
  PageControl2.ActivePageIndex:= PageControl2.ActivePageIndex + 1;
end;

procedure TfrmNagruzkaUchOtdelMaster.actSelFacToNOTUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= dbcbFaculty.KeyValue <> NULL;
end;

procedure TfrmNagruzkaUchOtdelMaster.actSemLengthToSelFacExecute(
  Sender: TObject);
begin
  Caption:= baseCaption + ' - шаг 2';
  PageControl1.ActivePageIndex:= PageControl1.ActivePageIndex + 1;
  PageControl2.ActivePageIndex:= PageControl2.ActivePageIndex + 1;
  Refresh;
  dbcbFaculty.SetFocus;
end;

procedure TfrmNagruzkaUchOtdelMaster.actStartToSemLengthExecute(
  Sender: TObject);
var
  i: integer;
begin
  Caption:= baseCaption + ' - шаг 1';
  for I := 0 to fmNagruzkaMain1.PageControl1.PageCount - 1 do
    fmNagruzkaMain1.PageControl1.Pages[i].TabVisible:= false;
  fmNagruzkaMain1.Connection:= Connection;
  fmNagruzkaMain1.Read;
  fmNagruzkaMain1.PageControl1.ActivePageIndex:= 1;
  PageControl1.ActivePageIndex:= PageControl1.ActivePageIndex + 1;
  PageControl2.ActivePageIndex:= PageControl2.ActivePageIndex + 1;
end;

procedure TfrmNagruzkaUchOtdelMaster.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TfrmNagruzkaUchOtdelMaster.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if PageControl1.ActivePageIndex = 7 then
    CanClose:= true
  else
    if Application.MessageBox('Вы уверены, что хотите завершить работу мастера?', PChar(baseCaption), MB_YESNO) = mrNo then
      CanClose:= false;
end;

procedure TfrmNagruzkaUchOtdelMaster.FormCreate(Sender: TObject);
begin
  SetWindowLong(Handle, GWL_EXSTYLE, GetWindowLong(Handle, GWL_EXSTYLE) or WS_EX_APPWINDOW);
  PageControl1.ActivePageIndex:= 0;
  PageControl2.ActivePageIndex:= 0;
  TGeneralController.Instance.InitializeLockupCB(@dbcbFaculty, 'ik_fac', 'Cname_fac');
  TGeneralController.Instance.InitializeLockupCB(@dbcbDep, 'ik_kaf', 'Cname_kaf');
  TNagruzkaController.Directory.GetAvailFac(@dbcbFaculty.ListSource.DataSet);
  fmNagruzkaFac1.LastNormIK:= -1;
//  fmNagruzkaFac2.LastYearIK:= -1;
end;

procedure TfrmNagruzkaUchOtdelMaster.Label14MouseEnter(Sender: TObject);
begin
  Label14.Font.Style:= Label14.Font.Style + [fsUnderline];
end;

procedure TfrmNagruzkaUchOtdelMaster.Label14MouseLeave(Sender: TObject);
begin
  Label14.Font.Style:= Label14.Font.Style - [fsUnderline];
end;

procedure TfrmNagruzkaUchOtdelMaster.Label5MouseEnter(Sender: TObject);
begin
  Label5.Font.Style:= Label5.Font.Style + [fsUnderline];
end;

procedure TfrmNagruzkaUchOtdelMaster.Label5MouseLeave(Sender: TObject);
begin
  Label5.Font.Style:= Label5.Font.Style - [fsUnderline];
end;

procedure TfrmNagruzkaUchOtdelMaster.Label6MouseEnter(Sender: TObject);
begin
  Label6.Font.Style:= Label6.Font.Style + [fsUnderline];
end;

procedure TfrmNagruzkaUchOtdelMaster.Label6MouseLeave(Sender: TObject);
begin
  Label6.Font.Style:= Label6.Font.Style - [fsUnderline];
end;

procedure TfrmNagruzkaUchOtdelMaster.Label7MouseEnter(Sender: TObject);
begin
  Label7.Font.Style:= Label7.Font.Style + [fsUnderline];
end;

procedure TfrmNagruzkaUchOtdelMaster.Label7MouseLeave(Sender: TObject);
begin
  Label7.Font.Style:= Label7.Font.Style - [fsUnderline];
end;

end.
