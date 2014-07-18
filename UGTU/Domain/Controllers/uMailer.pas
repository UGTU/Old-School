unit uMailer;
  {#Author sergdev@ist.ugtu.net}
interface
uses IdCustomTransparentProxy, IdSocks, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP, IdMessage,
  IdBaseComponent, IdComponent, IdIOHandler, IdIOHandlerSocket, IdAttachmentFile,
  IdIOHandlerStack,IdEMailAddress, classes, IdGlobal, Dialogs, SysUtils;

type TMailer = class
  private
    FIdIOHandlerStack: TIdIOHandlerStack;
    FIdMessage: TIdMessage;
    FIdSMTP: TIdSMTP;
    FIdSocksInfo: TIdSocksInfo;
    constructor Create;

  public
    class function GetInstance():TMailer;
    function SendMail(Title:string;mail:TStringList;AttachedFile:string):boolean;
    procedure SendDelayedMail(fname: string);
    procedure MessagePrepare;
end;

implementation

uses ApplicationController;

{ TMailer }

class function TMailer.GetInstance: TMailer;
const
  instance : TMailer = nil;
begin
  if instance = nil then instance := TMailer.Create;
  Result := instance;
end;

function TMailer.SendMail(Title:string;mail:TStringList;AttachedFile:string):boolean;
var attach:TIdAttachmentFile;
//collection:TIdCollection;
fname:string;
begin
  result:=false;
  attach:=TIdAttachmentFile.Create(FIdMessage.MessageParts,AttachedFile);
  attach.ContentType:='text/html';
  attach.CharSet:='windows-1251';
  fname:=TApplicationController.GetInstance.CreateDelayedSend(FIdMessage);

  FIdMessage.Subject:=Title;
  if mail<>nil then
  FIdMessage.Body:=mail;
  FIdMessage.CharSet:='windows-1251';
  try
    FIdSMTP.Connect(); //соединение с сервером
    FIdSMTP.Send(FIdMessage);
    result:=true;
    DeleteFile(fname);
    FIdSMTP.Disconnect();
    MessagePrepare;
  except
    showmessage('Сообщение не было отправлено на адрес поддержки: возможно, нет соединения с сервером.');
    FIdSMTP.Disconnect();
  end;

end;

procedure TMailer.SendDelayedMail(fname: string);
var attach:TIdAttachmentFile;
//collection:TIdCollection;
begin
  FIdMessage.LoadFromFile(fname);
  FIdMessage.Encoding:=meMime;
  FIdMessage.Subject:='Delayed exception report';
  FIdMessage.CharSet:='windows-1251';

  try
    FIdSMTP.Connect(); //соединение с сервером
    FIdSMTP.Send(FIdMessage);
    DeleteFile(fname);
    FIdSMTP.Disconnect();
    MessagePrepare;
  except
    FIdSMTP.Disconnect();
  end;

end;

procedure TMailer.MessagePrepare;
var receipt:TIdEMailAddressItem;
begin
if FIdMessage<>nil then
  FIdMessage.Free;

 FIdMessage:=TIdMessage.Create(nil);
 FIdMessage.Encoding:=meMime;
 receipt:=FIdMessage.Recipients.Add;
 receipt.Address:=TApplicationController.GetInstance.SupportMail;
 FIdMessage.From.Address:=TApplicationController.GetInstance.LoginName;
end;

constructor TMailer.Create;
begin
// SocksInfo tune
 FIdSocksInfo:=TIdSocksInfo.Create(nil);
 FIdSocksInfo.Host:='mail.ugtu.net';
 FIdSocksInfo.Authentication := saNoAuthentication;

// IOHandlerStack tune
 FIdIOHandlerStack:=TIdIOHandlerStack.Create(nil);
 FIdIOHandlerStack.Destination:='mail.ugtu.net';
 FIdIOHandlerStack.MaxLineAction:=maException;
 FIdIOHandlerStack.Port:=25;
 FIdIOHandlerStack.TransparentProxy:=FIdSocksInfo;

//SMTP tune
 FIdSMTP:=TIdSMTP.Create(nil);
 FIdSMTP.Host:='mail.ugtu.net';
 FIdSMTP.IOHandler:=FIdIOHandlerStack;

// Message tune
 MessagePrepare;

end;

end.
