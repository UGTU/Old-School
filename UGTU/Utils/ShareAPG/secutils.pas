unit secutils;
  {#Author fmarakasov@ugtu.net}
interface
uses
  Windows, SysUtils;

procedure ImpersonateThreadWithUser(const UserName, Password:string;
    const Domain:String = '.'; LogonType:DWORD = LOGON32_LOGON_INTERACTIVE);


implementation

procedure ImpersonateThreadWithUser(const UserName, Password:string;
    const Domain:String; LogonType:DWORD);
var
  t:THandle;
begin
  if LogonUser(PChar(UserName), PChar(Domain), PChar(Password),
     LogonType, LOGON32_PROVIDER_DEFAULT, t)
  then
  begin
    ImpersonateLoggedOnUser(t);
    CloseHandle(t);
  end
  else
    RaiseLastOSError;
  end;
end.
