unit uErrorInfo;
   {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB;

type
  TfrmErrorInfo = class(TForm)
    bbSend: TBitBtn;
    BitBtn1: TBitBtn;
    StaticText1: TStaticText;
    Image1: TImage;
    mErrorContent: TMemo;
    procedure BitBtn1Click(Sender: TObject);
    procedure bbSendClick(Sender: TObject);
  private
    fErrorContent: TStringList;
    fErrorType: string;
  public
    constructor Create(AOwner:TComponent; ErrorContent:TStringList; ErrorType:string);

    procedure Read(ErrorContent: TStringList);
  end;

var
  frmErrorInfo: TfrmErrorInfo;

implementation

{$R *.dfm}
uses Mapi, ApplicationController;

procedure TfrmErrorInfo.BitBtn1Click(Sender: TObject);
begin
  Close();
end;

constructor TfrmErrorInfo.Create(AOwner: TComponent; ErrorContent: TStringList;
  ErrorType: string);
  var i:integer;
begin
inherited Create(AOwner);
fErrorContent:=ErrorContent;
fErrorType:=ErrorType;
for i := 0 to ErrorContent.Count - 1 do
  mErrorContent.Lines.Add(ErrorContent[i]);
end;

function SendMail(const DestName, DestAddress, Subject, Text: PAnsiChar):boolean;
var
    MapiMessage: TMapiMessage;
    MapiRecipDesc: TMapiRecipDesc;
    //i: integer;
    //s: string;
begin
    with MapiRecipDesc do
    begin
      ulRecipClass:= MAPI_TO;
      lpszName:= PAnsiChar(DestName);
      lpszAddress:= PAnsiChar(DestAddress);
      ulEIDSize:= 0;
      lpEntryID:= nil;
    end;
    with MapiMessage do
    begin
      ulReserved:= 0;
      lpszSubject:= Subject;
      lpszNoteText := Text;
      lpszMessageType := nil;
      lpszDateReceived := nil;
      lpszConversationID := nil;
      flFlags := 0;
      lpOriginator := nil;
      nRecipCount := 1;
      lpRecips := @MapiRecipDesc;
       nFileCount:= 0;
      lpFiles:= nil;
    end;
    Result:= MapiSendMail(0, 0, MapiMessage, MAPI_DIALOG or MAPI_LOGON_UI or MAPI_NEW_SESSION, 0) = SUCCESS_SUCCESS;
end;

procedure TfrmErrorInfo.bbSendClick(Sender: TObject);
var
  fsend: string;
  Mail:TstringList;
begin
Mail:=TStringList.Create;
Mail.AddStrings(fErrorContent);

  {Mail.Add('');
  Mail.Add('------------Присоединённый журнал------------');
  Mail.Add('');
  if (TApplicationController.GetInstance.GetLogText=nil) then
  Mail.Add('Журнал не прикреплён') else
  Mail.AddStrings(TApplicationController.GetInstance.GetLogText);}
  fsend:=TApplicationController.GetInstance.GetLogForSend;
  TApplicationController.GetInstance.SendSupportMail('UGTU Exception: '+fErrorType, Mail, fsend);
  DeleteFile(PANSIChar(fsend));
end;

procedure TfrmErrorInfo.Read(ErrorContent: TStringList);
var
  i: integer;
begin

end;

end.
