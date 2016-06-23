unit ApplicationController;
{#Author sergdev@ist.ugtu.net}
interface
uses  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseFrame, VersionController, DB, IniFiles, ShlObj,StdCtrls, comObj, ShellAPI, IdMessage, CommonIntf, CommonIntfImpl, ExceptionBase, ComCtrls,
  uPhotoBooth, ExtCtrls;

const
   HEAP_ZERO_MEMORY = $00000008;
   SID_REVISION     = 1; // Current revision level

type

PTokenUser = ^TTokenUser;

TTokenUser = packed record
  User: TSidAndAttributes;
end;

TSendStatus = (ssSend, ssNotSend, ssUndefined);

TApplicationController = class (TInterfacedObject, ILogger, IApplicationController)
    private
    FIsApplicationCopy:boolean;
    FSupportMail:string;
    FSupportPhone:string;
    FSendExceptionReport:TSendStatus;
    FDeveloper:string;
    FSupportSite:string;
    FAdress:string;
    FWindowsAuthorization:boolean;
    FProgramName:string;
    FApplicationSource:string;
    FPersonInCharge:string;
    FDocumentFooter:string;
    FServerName: string;
    FDBName: string;
    FLoginName: string;
    FIniDir:string;
    FLastRunLog:string;
    FExportLogToFile:boolean;
    FExceptionParsers:TExceptionParserCollection;

    procedure WriteToIni(section:string;key:string;value:string);
    procedure EraseIniKey(section:string;key:string);

    function GetActiveFrame : TFmBase;
    function GetLogger : ILogger;
    // возвращает false если копия приложения уже запущена
    function CreateInstanceMutex : boolean;

    constructor Create();
    procedure FinalizeSession;


public
    class function GetInstance: TApplicationController;

    procedure InitAboutParameters;
    procedure AddLogEntry(entry:string);
    procedure AddLogEntries(entries:TStringList);
    procedure WriteSendExceptionReportToIni(send:boolean);
    procedure SendDelayed;
    procedure FinalizeApplication;
    procedure Restart;
    procedure Reconnect;
    procedure WriteAllParamToIni;
    procedure Terminate;
    procedure CheckDBStats(UA:string; Status:string);
    
    //включить камеру
    procedure GetPhotoBooth(eName: string; img: TImage);

    function ParseException(E:Exception):Exception;
    function CreateDelayedSend(mes:TIdMessage):string;
    function GetLogFileName: string;
    function GetLogText:TStringList;
    function SendSupportMail(subject:string;text:TStringList; fname:string):boolean;
    function GetLogForSend: string;
    function ApplicationName:string;
    function GetUserGroups: TStringList;


    property ActiveFrame: TFmBase Read GetActiveFrame;
    property SupportMail:string read FSupportMail;
    property SupportPhone:string read FSupportPhone;
    property SendExceptionReport:TSendStatus read FSendExceptionReport write FSendExceptionReport;
    property Developer:string read FDeveloper;
    property SupportSite:string read FSupportSite;
    property Adress:string read FAdress;
    property WindowsAuthorization:boolean read FWindowsAuthorization write FWindowsAuthorization;
    property ExportLogToFile:boolean read FExportLogToFile write FExportLogToFile;
    property ApplicationSource:string read FApplicationSource;
    property PersonInCharge:string read FPersonInCharge;
    property DocumentFooter:string read FDocumentFooter;
    property ServerName:string read FServerName write FServerName;
    property DBName:string read FDBName write FDBName;
    property LoginName:string read FLoginName;
    property IniDir:string read FIniDir;
    property ProgramName: string read FProgramName;
    property LogFileName: string read GetLogFileName;
    property LastRunLog: string read FLastRunLog;
    property IsApplicationCopy : boolean read FIsApplicationCopy;
    property LocalLog : ILogger read GetLogger implements ILogger;
  end;

function GetProcessUserName(var UserName:WideString):HRESULT;stdcall;external'coreutdll.dll';

implementation
  uses uMain, uLocalLogController, uMailer, uDM;



function ConvertSid(Sid: PSID; pszSidText: PChar; var dwBufferLen: DWORD): BOOL;
var
   psia: PSIDIdentifierAuthority;
   dwSubAuthorities: DWORD;
   dwSidRev: DWORD;
   dwCounter: DWORD;
   dwSidSize: DWORD;
begin
   Result := False;

   dwSidRev := SID_REVISION;

   if not IsValidSid(Sid) then Exit;

   psia := GetSidIdentifierAuthority(Sid);

   dwSubAuthorities := GetSidSubAuthorityCount(Sid)^;

   dwSidSize := (15 + 12 + (12 * dwSubAuthorities) + 1) * SizeOf(Char);

   if (dwBufferLen < dwSidSize) then
   begin
     dwBufferLen := dwSidSize;
     SetLastError(ERROR_INSUFFICIENT_BUFFER);
     Exit;
   end;

   StrFmt(pszSidText, 'S-%u-', [dwSidRev]);

   if (psia.Value[0] <> 0) or (psia.Value[1] <> 0) then
     StrFmt(pszSidText + StrLen(pszSidText),
       '0x%.2x%.2x%.2x%.2x%.2x%.2x',
       [psia.Value[0], psia.Value[1], psia.Value[2],
       psia.Value[3], psia.Value[4], psia.Value[5]])
   else
     StrFmt(pszSidText + StrLen(pszSidText),
       '%u',
       [DWORD(psia.Value[5]) +
       DWORD(psia.Value[4] shl 8) +
       DWORD(psia.Value[3] shl 16) +
       DWORD(psia.Value[2] shl 24)]);

   dwSidSize := StrLen(pszSidText);

   for dwCounter := 0 to dwSubAuthorities - 1 do
   begin
     StrFmt(pszSidText + dwSidSize, '-%u',
       [GetSidSubAuthority(Sid, dwCounter)^]);
     dwSidSize := StrLen(pszSidText);
   end;

   Result := True;
end;

function ObtainTextSid(hToken: THandle; pszSid: PChar;
   var dwBufferLen: DWORD): BOOL;
var
   dwReturnLength: DWORD;
   dwTokenUserLength: DWORD;
   tic: TTokenInformationClass;
   ptu: Pointer;
begin
   Result := False;
   dwReturnLength := 0;
   dwTokenUserLength := 0;
   tic := TokenUser;
   ptu := nil;

   if not GetTokenInformation(hToken, tic, ptu, dwTokenUserLength,
     dwReturnLength) then
   begin
     if GetLastError = ERROR_INSUFFICIENT_BUFFER then
     begin
       ptu := HeapAlloc(GetProcessHeap, HEAP_ZERO_MEMORY, dwReturnLength);
       if ptu = nil then Exit;
       dwTokenUserLength := dwReturnLength;
       dwReturnLength    := 0;

       if not GetTokenInformation(hToken, tic, ptu, dwTokenUserLength,
         dwReturnLength) then Exit;
     end
      else
        Exit;
   end;

   if not ConvertSid((PTokenUser(ptu).User).Sid, pszSid, dwBufferLen) then Exit;

   if not HeapFree(GetProcessHeap, 0, ptu) then Exit;

   Result := True;
end;

function GetCurrentUserSid: string;
var
   hAccessToken: THandle;
   bSuccess: BOOL;
   dwBufferLen: DWORD;
   szSid: array[0..260] of Char;
begin
   Result := '';

   bSuccess := OpenThreadToken(GetCurrentThread, TOKEN_QUERY, True,
     hAccessToken);
   if not bSuccess then
   begin
     if GetLastError = ERROR_NO_TOKEN then
       bSuccess := OpenProcessToken(GetCurrentProcess, TOKEN_QUERY,
         hAccessToken);
   end;
   if bSuccess then
   begin
     ZeroMemory(@szSid, SizeOf(szSid));
     dwBufferLen := SizeOf(szSid);

     if ObtainTextSid(hAccessToken, szSid, dwBufferLen) then
       Result := szSid;
     CloseHandle(hAccessToken);
   end;
end;


{ TApplicationController }

procedure TApplicationController.EraseIniKey(section:string;key:string);
var
  Ini: TIniFile;
begin
   Ini := TIniFile.Create(FIniDir+'decanat.INI');
   Ini.DeleteKey(section, key);
end;

procedure TApplicationController.FinalizeApplication;
begin
EraseIniKey('reporting', 'UnfinishedLog');
end;


procedure TApplicationController.FinalizeSession;
begin

end;

procedure TApplicationController.WriteAllParamToIni();
var
  Ini: TIniFile;
begin

  Ini := TIniFile.Create(FIniDir+'decanat.INI');
  try
      Ini.WriteString( 'access', 'login', LoginName);
      Ini.WriteString( 'access', 'server', ServerName);
      Ini.WriteBool('access', 'win_auth', WindowsAuthorization);
      Ini.WriteString( 'access', 'db', DbName);
      Ini.WriteBool('reporting', 'ExportToFile', ExportLogToFile);
      if ExportLogToFile then Ini.WriteString('reporting', 'UnfinishedLog',TLogController.GetInstance.Filename);

    finally
      Ini.Free;
    end;
end;

procedure TApplicationController.WriteSendExceptionReportToIni(send: boolean);
begin
if send then
begin
WriteToIni('reporting','SendExceptionReports','True');
FSendExceptionReport:=ssSend
end
else
begin
WriteToIni('reporting','SendExceptionReports','False');
FSendExceptionReport:=ssNotSend;
end;
end;

procedure TApplicationController.WriteToIni(section:string;key:string;value:string);
var
  Ini: TIniFile;
  path: PITEMIDLIST;
  strPath: array[0..MAX_PATH] of char;
begin

  Ini := TIniFile.Create(FIniDir+'decanat.INI');
  Ini.WriteString(Section, key, value);
  Ini.Free;
end;

procedure TApplicationController.AddLogEntry(entry: string);
begin
try
if not FExportLogToFile then exit;

if (entry<>'') then
TLogController.GetInstance.AddEntry(entry)
else TLogController.GetInstance.AddEntryNoDate(entry);
except
on E:Exception do begin
  FExportLogToFile:=false;
  raise EApplicationException.Create('Ошибка записи локального журнала! На время данного сеанса она будет отключена.', E);
end;
end;
end;

function TApplicationController.ApplicationName: string;
begin
result:=FProgramName;
end;

procedure TApplicationController.AddLogEntries(entries:TStringList);
begin
try
if not FExportLogToFile then exit;

TLogController.GetInstance.AddEntries(entries);
except
on E:Exception do begin
  FExportLogToFile:=false;
  raise EApplicationException.Create('Ошибка записи локального журнала! На время данного сеанса она будет отключена.', E);
end;
end;
end;

procedure TApplicationController.InitAboutParameters;
var SearchOptions: TLocateOptions;
begin
dm.adodsAbout.Open;
  SearchOptions := [loPartialKey];
  dm.adodsAbout.Locate('NameParam','E-mail',SearchOptions);
  FSupportMail:=dm.adodsAbout.FieldByName('Value').Value;
  dm.adodsAbout.Locate('NameParam','Developer',SearchOptions);
  FDeveloper:=dm.adodsAbout.FieldByName('Value').Value;
  dm.adodsAbout.Locate('NameParam','ORISPhone',SearchOptions);
  FSupportPhone:=dm.adodsAbout.FieldByName('Value').Value;
  dm.adodsAbout.Locate('NameParam','SupportSite',SearchOptions);
  FSupportSite:=dm.adodsAbout.FieldByName('Value').Value;
  dm.adodsAbout.Locate('NameParam','Adress',SearchOptions);
  FAdress:=dm.adodsAbout.FieldByName('Value').Value;
  dm.adodsAbout.Locate('NameParam','ApplicationSource',SearchOptions);
  FApplicationSource:=dm.adodsAbout.FieldByName('Value').Value;
  dm.adodsAbout.Locate('NameParam','PersonInCharge',SearchOptions);
  FPersonInCharge:=dm.adodsAbout.FieldByName('Value').Value;
  dm.adodsAbout.Locate('NameParam','Footer',SearchOptions);
  FDocumentFooter:=dm.adodsAbout.FieldByName('Value').Value+' '+TVersionController.GetInstance.CurrentVersion.VersionString+')';
  WriteToIni( 'reporting', 'SupportMail', SupportMail);
  try
  SendDelayed;
  except
  end;

end;


function TApplicationController.ParseException(E: Exception): Exception;
begin
result:=FExceptionParsers.Parse(E);
end;

procedure TApplicationController.Reconnect;
var i:integer;
node:TTreeNode;
begin
dm.DBConnect.Connected:=false;
dm.DBConnect.Connected:=true;

{if frmMain.ActiveFrame<>nil then
frmMain.DBDekTreeView_TEST1.RefreshNodeExecute(frmMain.DBDekTreeView_TEST1.Root);}
{with frmMain.DBDekTreeView_TEST1 do
begin
RefreshNodeExecute(Selected);
node:=selected;
while (node.Parent<>nil) do
begin
node:=node.parent;
RefreshNodeExecute(node);
end;}
end;

procedure TApplicationController.Restart;
begin
ShellExecute(0, 'open', PWideChar(Application.ExeName), '', '', SW_SHOWNORMAL);
FinalizeSession;
Application.Terminate;
ExitProcess($FF);
end;

procedure TApplicationController.CheckDBStats(UA: string; Status:string);
begin
if Status = 'ONLINE' then
begin
  if UA = 'READ_WRITE' then
  exit;
  if UA = 'READ_ONLY' then
  begin
    raise EApplicationException.Create('Внимание! База данных находится в состоянии "только чтение"! Возможна некорректная работа приложения.', nil, 101);
    exit;
  end;
end;

if Status = 'EMERGENCY' then
begin
  raise EApplicationException.Create('Внимание! База данных находится в аварийном состоянии! Приложение будет закрыто.', nil, 102);
  Terminate;
  exit;
end;

raise EApplicationException.Create('Внимание! База данных находится в нестабильном состоянии! Приложение будет закрыто.', nil, 103);
  Terminate;

end;

constructor TApplicationController.Create;
var
  Ini: TIniFile;
  CurrUser: WideString;
  path: PITEMIDLIST;
  strPath: array[0..MAX_PATH] of char;
  ExceptionReportString:string;
  l:TLabel;
begin
  FProgramName:= 'ИС "УГТУ" ' + TVersionController.GetInstance.CurrentVersion.VersionString;

  SetLength(CurrUser, 512);
  GetProcessUserName(CurrUser);
  l:=TLabel.Create(nil);
  l.Caption:=CurrUser;
  FLoginName:=l.Caption;

  if FExceptionParsers=nil then
  FExceptionParsers:=TExceptionParserCollection.Create;
  with FExceptionParsers do
  begin
    FExceptionParsers.RegisterParser(TSQLExceptionParser.Create);
  end;

  SHGetSpecialFolderLocation(0, CSIDL_APPDATA, path);
  SHGetPathFromIDList(path, strPath);
  if not DirectoryExists(strPath+'\UGTU') then
    CreateDir(strPath+'\UGTU');
  FIniDir := strPath+'\UGTU\';
  Ini := TIniFile.Create(FIniDir+'decanat.INI');
  try
    FWindowsAuthorization := Ini.ReadBool('access', 'win_auth', true);
    FServerName := Ini.ReadString('access', 'server', 'ugtudb.ugtu.net');
    ExceptionReportString:= Ini.ReadString('reporting', 'SendExceptionReports', 'not_set');
    FSupportMail := Ini.ReadString('reporting', 'SupportMail', 'support@ugtu.net');
    FLastRunLog := Ini.ReadString('reporting', 'UnfinishedLog', 'None');
    FExportLogToFile := Ini.ReadBool('reporting', 'ExportToFile', true);

    //временная строка, которую нужно убрать в билде 4.339
   // if (FServerName='db-srv1.ist.ugtu.net') then FServerName:='ugtudb.ugtu.net';

    if ExceptionReportString='True' then
    FSendExceptionReport:=ssSend
    else if ExceptionReportString='False' then
    FSendExceptionReport:=ssNotSend else
    FSendExceptionReport:=ssUndefined;
    FDBName:= Ini.ReadString('access', 'db', 'ugtu');
  finally
    Ini.Free;
    FIsApplicationCopy:=not (CreateInstanceMutex);
  end;

  end;

function TApplicationController.CreateDelayedSend(mes: TIdMessage):string;
var i:integer;
begin
i:=1;
While FileExists(TApplicationController.GetInstance.IniDir+'DelayedSend'+inttostr(i)+'.msg') do
inc(i);
result:=TApplicationController.GetInstance.IniDir+'DelayedSend'+inttostr(i)+'.msg';
mes.SaveToFile(result);
end;

function TApplicationController.CreateInstanceMutex: boolean;
var HM:THandle;
begin
  HM := OpenMutex(MUTEX_ALL_ACCESS, false, 'UGTUMutex');
  Result := not (HM <> 0);
  if HM = 0 then
  HM := CreateMutex(nil, false, 'UGTUMutex')
end;

function TApplicationController.GetActiveFrame: TFmBase;
begin
result:=nil;
if frmMain<>nil then
result:=frmMain.ActiveFrame;
end;

class function TApplicationController.GetInstance: TApplicationController;
const
  instance : TApplicationController = nil;
begin
  if instance = nil then
    instance := TApplicationController.Create;
  Result := instance;
  Result._AddRef;
end;

function TApplicationController.GetLogFileName: string;
begin
result:=TLogController.GetInstance.Filename;
end;

function TApplicationController.GetLogForSend: string;
begin
result:=TLogController.GetInstance.SaveForSend;
end;

function TApplicationController.GetLogger: ILogger;
begin
  Result := TLogController.GetInstance;
end;

function TApplicationController.GetLogText: TStringList;
begin
result:= TLogController.GetInstance.Text;
end;


procedure TApplicationController.GetPhotoBooth(eName: string; img: TImage);
begin
  if not Assigned(pBooth) then
  begin
    pBooth := TPhotoBooth.Create('Enter - сделать снимок, Esc - отменить',eName,img);
    pBooth.MakePhoto();
  end;
end;

function TApplicationController.GetUserGroups: TStringList;
{var Container : IADsContainer;
    NewObject : IADs;
    User : IADsUser;
    hr : HREsult;}
begin

end;

procedure TApplicationController.SendDelayed;
var i:integer;
begin
i:=0;
While FileExists(IniDir+'DelayedSend'+inttostr(i+1)+'.msg') do
inc(i);

While (i>0) do begin
TMailer.GetInstance.SendDelayedMail(IniDir+'DelayedSend'+inttostr(i)+'.msg');
dec(i);
end;

if (not IsApplicationCopy)and(FLastRunLog<>'None')and(FSendExceptionReport<>ssNotSend) then begin
TMailer.GetInstance.SendMail('Unfinished log mail',nil,FLastRunLog);
EraseIniKey('reporting', 'UnfinishedLog');
FLastRunLog:='None';
end;

end;

function TApplicationController.SendSupportMail(subject: string;
  text: TStringList; fname:string):boolean;
begin
result:=false;
if (FSupportMail<>'') then
 result:=TMailer.GetInstance.SendMail(subject,text, fname);
end;

procedure TApplicationController.Terminate;
begin
  pBooth.Free;  
  Application.Terminate;
end;

end.
