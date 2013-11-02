unit OsUtils;
 {#Author fmarakasov@ugtu.net}
//{$DEFINE IMPERSONATE}
interface
uses
  Windows, SysUtils, WinSvc;

  function IsWindowsNT:Boolean;
  procedure SetWindowTextOs(const hWnd:THandle; const pBuff:PChar);
  function GetThreadUserName:String;
  function StartTheService(MachineName:String; ServiceName:String):Boolean;
  function StopTheService(MachineName:String; ServiceName:String):Boolean;
  function GetServiceState(MachineName:String; ServiceName:String):Integer;
  function CoImpersonateClientD:HResult;
  function CoRevertToSelfD:HResult;
  function GetBytesPerSector(Path:String=''):Cardinal;
  function GetBytesPerPage:Cardinal;

implementation
uses
 StringUtils,
 ActiveX;


function IsWindowsNT:Boolean;
var
 os:OSVERSIONINFO;
begin
 Result:=false;

 ZeroMemory(@os, sizeof(os));
 os.dwOSVersionInfoSize:=sizeof(os);

 if GetVersionEx(os) then
   if os.dwPlatformId = VER_PLATFORM_WIN32_NT then Result:=true;
end;

procedure SetWindowTextOs(const hWnd:THandle; const pBuff:PChar);
begin
  if not IsWindowsNT and (StrLen(pBuff) > $8000) then
     pBuff[$8000] := Chr(0);
  SetWindowText(hWnd, pBuff);
end;


function GetThreadUserName:String;
var
  dwLen:DWORD;
begin
  dwLen:=100;
  SetLength(Result, dwLen);
  if GetUserName(PChar(Result), dwLen) then
     SetLength(Result, dwLen)
  else
     SetLength(Result, 0);
end;


function StartTheService(MachineName:String; ServiceName:String):Boolean;
var
  hSCM:THandle;
  hServ:THandle;
  pvec:PChar;
begin
  Result:=false;
  hSCM:=OpenSCManager(PChar(MachineName), nil, SC_MANAGER_ALL_ACCESS);
  if hSCM <> 0 then
  begin
    hServ:=OpenService(hSCM, PChar(ServiceName), SERVICE_ALL_ACCESS);
    if hServ <> 0 then
    begin
      Result:=StartService(hServ, 0, pvec);
      if Result then CloseServiceHandle(hServ);
    end else RaiseLastOSError;
    CloseServiceHandle(hSCM);
  end else RaiseLastOSError;
end;

function StopTheService(MachineName:String; ServiceName:String):Boolean;
var
  hSCM:THandle;
  hServ:THandle;
  ServStat:SERVICE_STATUS;
begin
  Result:=false;
  hSCM:=OpenSCManager(PChar(MachineName), nil, SC_MANAGER_ALL_ACCESS);
  if hSCM <> 0 then
  begin
    hServ:=OpenService(hSCM, PChar(ServiceName), SERVICE_ALL_ACCESS);
    if hServ <> 0 then
    begin
      Result:=ControlService(hServ, SERVICE_CONTROL_STOP, ServStat);
      if Result then CloseServiceHandle(hServ);
    end
    else RaiseLastOSError;
    CloseServiceHandle(hSCM);
  end
  else RaiseLastOSError;
end;

function GetServiceState(MachineName:String; ServiceName:String):Integer;
var
  hSCM:THandle;
  hServ:THandle;
  ServStat:SERVICE_STATUS;
begin
  Result:=-1;
  hSCM:=OpenSCManager(PChar(MachineName), nil, SC_MANAGER_ALL_ACCESS);
  if hSCM <> 0 then
  begin
    hServ:=OpenService(hSCM, PChar(ServiceName), SERVICE_ALL_ACCESS);
    if hServ <> 0 then
    begin
      if QueryServiceStatus(hServ, ServStat) then
         Result:=ServStat.dwCurrentState;
      CloseServiceHandle(hServ);
    end
    else RaiseLastOSError;
  CloseServiceHandle(hSCM);
  end
  else RaiseLastOSError;
end;

function CoImpersonateClientD:HResult;
begin
 {$IFDEF IMPERSONATE}
     Result:=CoImpersonateClient;
 {$ELSE}
     Result:=S_OK;
 {$ENDIF}
end;

function CoRevertToSelfD:HResult;
begin
 {$IFDEF IMPERSONATE}
     Result:=CoRevertToSelf;
 {$ELSE}
     Result:=S_OK;
 {$ENDIF}
end;

// Получаем размер сектора (байт)
function GetBytesPerSector(Path:String):Cardinal;
var
  Drive:String;
  SectorsPerCluster,
  NumberOfFreeClusters,
  TotalNumberOfClusters:Cardinal;
begin
  if Path = '' then Path:=GetModuleName(hInstance);

  Drive:=ExtractFileDrive(PChar(Path));

  GetDiskFreeSpace(PChar(Drive),  SectorsPerCluster,  Result,
    NumberOfFreeClusters, TotalNumberOfClusters);

end;

// Получаем размер страницы памяти процессора
function GetBytesPerPage:Cardinal;
var
  si:TSystemInfo;
begin
  GetSystemInfo(si);
  Result:=si.dwPageSize;
end;

initialization


end.


