unit uBaseDialog;
   {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ADODB, uBaseFrame, ActnList,
  System.Actions;

type
  TfrmBaseDialog = class(TForm)
    Bevel1: TBevel;
    bbOK: TBitBtn;
    bbCancel: TBitBtn;
    bbApply: TBitBtn;
    Panel1: TPanel;
    actBaseDialog: TActionList;
    actApply: TAction;
    actOK: TAction;
    bbSprav: TBitBtn;
    actSprav: TAction;
    procedure bbCancelClick(Sender: TObject);
    procedure actApplyUpdate(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
    procedure actOKUpdate(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure actSpravExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    private
    fDataSet: TCustomADODataSet;
    fConnection:TADOConnection;
    fIK:integer;
    fCallFrame:TfmBase;

  protected
    FTopic:string;

    function DoApply:boolean; virtual;
    function DoCancel:boolean;virtual;
  public
    IsModified: boolean;
    constructor CreateDialog(AOwner:TComponent; AConnection:TADOConnection; ADataSet: TCustomADODataSet);virtual;
    procedure Apply;
    procedure OK;
    procedure Cancel;
    property Connection:TADOConnection read fConnection write fConnection;
    property DataSet: TCustomADODataSet read fDataSet write fDataSet;
    property CallFrame:TfmBase read fCallFrame write fCallFrame;
    property IK: integer read fIK write fIK;
    property Topic: string read FTopic write FTopic;
  end;

var
  frmBaseDialog: TfrmBaseDialog;

implementation

uses uSpravForm, uDM;

{$R *.dfm}

{ TfrmBaseDialog }

procedure TfrmBaseDialog.Apply;
begin
  if DoApply then
  begin
    IsModified:= false;
    bbApply.Tag:= 1;
  end;
end;

procedure TfrmBaseDialog.Cancel;
begin
  if not IsModified then
    ModalResult:= mrCancel
  else
    if DoCancel then
    begin
      IsModified:= false;
      ModalResult:= mrCancel;
    end
    else ModalResult:= mrNone;
end;

constructor TfrmBaseDialog.CreateDialog(AOwner: TComponent;
  AConnection:TADOConnection; ADataSet: TCustomADODataSet);
begin
  Create(AOwner);
  Connection:= AConnection;
  DataSet:= ADataSet;
  IsModified:= false;
  bbApply.Tag:= 0;
end;

function TfrmBaseDialog.DoApply: boolean;
begin
   Result:=false;
end;

function TfrmBaseDialog.DoCancel: boolean;
begin
  Result:=false;
end;

procedure TfrmBaseDialog.OK;
begin
  if IsModified then
  begin
    if DoApply then
    begin
      IsModified:= false;
      ModalResult:= mrOk;
    end;
  end
  else ModalResult:= mrCancel;
end;

procedure TfrmBaseDialog.bbCancelClick(Sender: TObject);
begin
  Cancel;
end;

procedure TfrmBaseDialog.actApplyUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= IsModified;
end;

procedure TfrmBaseDialog.actApplyExecute(Sender: TObject);
begin
  Apply;
end;

procedure TfrmBaseDialog.actOKUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= IsModified or (bbApply.Tag = 1);
end;

procedure TfrmBaseDialog.actOKExecute(Sender: TObject);
begin
  OK;
end;

procedure TfrmBaseDialog.actSpravExecute(Sender: TObject);
begin
  //if frmSprav=nil then
  try
    frmSprav:=TfrmSprav.Create(self);
    //CreateForm(TfrmSprav, frmSprav);
    frmSprav.Connection:=dm.DBConnect;
    frmSprav.ShowModal;
  finally
    //ChangeSprav;
    frmSprav.FreeOnRelease;
  end;
end;

procedure TfrmBaseDialog.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if not IsModified then
    CanClose:= true
  else
    CanClose:= DoCancel;
end;

procedure TfrmBaseDialog.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
 var ctrl:TWinControl;
 topic:string;
  begin

if (Key=112)	then
begin
topic:='index.htm';
  ctrl:=Self.ActiveControl;
  while (ctrl<>nil)and(topic='index.htm') do
  begin
    if ctrl.HelpKeyword<>'' then
    topic:=ctrl.HelpKeyword;
    ctrl:=ctrl.Parent;
  end;
  Application.HelpSystem.ShowTopicHelp(topic,'ugtu_help.chm');
end;

end;

end.
