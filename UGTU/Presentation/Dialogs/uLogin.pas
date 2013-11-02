unit uLogin;
  {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IniFiles, shlobj, ExtCtrls, Buttons, jpeg;


type
  TfrmLogin = class(TForm)
    edtLogin: TEdit;
    edtPass: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnOk: TButton;
    btnCancel: TButton;
    chbxWin: TCheckBox;
    edtServer: TEdit;
    Label3: TLabel;
    edtDB: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    btnMore: TSpeedButton;
    Label6: TLabel;
    eSid: TEdit;
    pnlButtons: TPanel;
    Panel2: TPanel;
    Panel1: TPanel;
    Image1: TImage;
    procedure btnMoreClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chbxWinClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
     private
    { Private declarations }
    FReportSendingString:string;
    FblExtended: Boolean;
    procedure SetblExtended(Value: Boolean);
    function GetConnectionString():string;
    function GetUserName: string;
  published
    property blExtended: Boolean read FblExtended write SetblExtended;

  public
    property ConnectionString:string read GetConnectionString;
    property UserName:string read GetUserName;
    property ReportSendingString:string read FReportSendingString;
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

function GetProcessUserName(var UserName:WideString):HRESULT;stdcall;external'coreutdll.dll';

implementation

uses ApplicationController;

{$R *.dfm}

procedure TfrmLogin.SetblExtended(Value: Boolean);
begin
  FblExtended := Value;
  if (FblExtended) then
  begin
    btnMore.Caption := '<<';
    ClientHeight :=  263;
    panel2.visible:=true;
  end
  else
  begin
    btnMore.Caption := '>>';
    ClientHeight := 163;
    panel2.visible:=false;
  end;
end;

procedure TfrmLogin.btnMoreClick(Sender: TObject);
begin
  blExtended := not blExtended;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  chbxWin.Checked :=TApplicationController.GetInstance.WindowsAuthorization;
  edtLogin.Text:=TApplicationController.GetInstance.LoginName;
  edtServer.Text := TApplicationController.GetInstance.ServerName;
  edtDB.Text:=TApplicationController.GetInstance.DBName;
end;


procedure TfrmLogin.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Key=112)	then
  Application.HelpSystem.ShowTopicHelp('start.htm','ugtu_help.chm');
end;

procedure TfrmLogin.chbxWinClick(Sender: TObject);
begin
  edtLogin.Enabled := not chbxWin.Checked;
  edtPass.Enabled := not chbxWin.Checked;
  Label1.Enabled := not chbxWin.Checked;
  Label2.Enabled := not chbxWin.Checked;
end;

function TfrmLogin.GetConnectionString: string;
var
  connStr: String;
  Ini: TIniFile;
begin
  if chbxWin.Checked then
  begin
    connStr := 'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=';
    connStr := connStr+edtDB.Text+';Data Source=';
    connStr := connStr+edtServer.Text;
  end
  else
  begin
    connStr := 'Provider=SQLOLEDB.1;Password='+edtPass.Text;
    connStr := connStr+';Persist Security Info=True;User ID='+edtLogin.Text;
    connStr := connStr+';Initial Catalog='+edtDB.Text+';Data Source=';
    connStr := connStr+edtServer.Text;
  end;

    // запись в ini
    
    Ini := TIniFile.Create(TApplicationController.GetInstance.IniDir+'decanat.INI');
    try
      TApplicationController.GetInstance.ServerName:=edtServer.Text;
      TApplicationController.GetInstance.WindowsAuthorization:=chbxWin.Checked;
      TApplicationController.GetInstance.DBName:=edtDB.Text;
      TAPplicationController.GetInstance.WriteAllParamToIni;
    finally
      Ini.Free;
    end;
  Result:=connStr;
end;

function TfrmLogin.GetUserName: string;
begin
  Result := edtLogin.Text;
end;

end.
