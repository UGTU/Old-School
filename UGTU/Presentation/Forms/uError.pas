unit uError;
  {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ShellAPI, adodb, db, ImgList, ComCtrls;

type
  TfrmError = class(TForm)
    BitBtn1: TBitBtn;
    Image2: TImage;
    Label1: TLabel;
    Image3: TImage;
    stSummary: TLabel;
    ErrorMemo: TRichEdit;
    lURL: TLabel;
    bbRestart: TBitBtn;
    iCross: TImage;
    iInfo: TImage;
    iSogestion: TImage;
    iWarning: TImage;
    bbReconnect: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure Label1MouseEnter(Sender: TObject);
    procedure Label1MouseLeave(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure lURLMouseEnter(Sender: TObject);
    procedure lURLMouseLeave(Sender: TObject);
    procedure lURLClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbRestartClick(Sender: TObject);
    procedure bbReconnectClick(Sender: TObject);

  private
    fErrorType: string;
    fErrorString: TStringList;
    fCaptionString: string;
    fHelpTopic:string;
    //fErrorCode: integer;
  public

    property ErrorType: string read fErrorType write fErrorType;
    property ErrorString: TStringList read fErrorString write fErrorString;
    property CaptionString: string read fCaptionString write fCaptionString;
    property HelpTopic: string read fHelpTopic write fHelpTopic;
  end;

var
  frmError: TfrmError;

implementation

uses uErrorInfo, ApplicationController;
{$R *.dfm}


procedure TfrmError.bbReconnectClick(Sender: TObject);
begin
TApplicationController.GetInstance.Reconnect;
end;

procedure TfrmError.bbRestartClick(Sender: TObject);
begin
TApplicationController.GetInstance.Restart;
Self.Close;
end;

procedure TfrmError.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if (TApplicationController.GetInstance.SendExceptionReport=ssUndefined) then
   if MessageBox(Handle, PWideChar('Вы хотите чтобы отчёты об ошибках по умолчанию отправлялись в техподдержку по почте?'), 'ИС УГТУ', MB_YESNO)=IDYES then
   TApplicationController.GetInstance.WriteSendExceptionReportToIni(true)
   else
   TApplicationController.GetInstance.WriteSendExceptionReportToIni(false);
end;

procedure TfrmError.FormCreate(Sender: TObject);
begin
  fErrorString:= TStringList.Create;
end;

procedure TfrmError.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Key=112)	then
Application.HelpSystem.ShowTopicHelp(HelpTopic,'ugtu_help.chm');
end;


procedure TfrmError.Label1Click(Sender: TObject);
var
  temp: TfrmErrorInfo;
begin
  temp:= TfrmErrorInfo.Create(nil,ErrorString,ErrorType);
  //temp.Read(ErrorString);
  temp.ShowModal;
  temp.Free;
end;

procedure TfrmError.Label1MouseEnter(Sender: TObject);
begin
  Label1.Font.Style:= Label1.Font.Style + [fsUnderline];
end;

procedure TfrmError.Label1MouseLeave(Sender: TObject);
begin
  Label1.Font.Style:= Label1.Font.Style - [fsUnderline];
end;

procedure TfrmError.lURLClick(Sender: TObject);
begin
  ShellExecute(handle, 'open', PWideChar(lURL.Hint), '', '', SW_SHOWNORMAL);
end;

procedure TfrmError.lURLMouseEnter(Sender: TObject);
begin
lURL.Font.Style:= lURL.Font.Style + [fsUnderline];
end;

procedure TfrmError.lURLMouseLeave(Sender: TObject);
begin
lURL.Font.Style:= lURL.Font.Style - [fsUnderline];
end;

end.
