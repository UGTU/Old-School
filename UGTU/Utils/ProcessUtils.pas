unit ProcessUtils;


interface
uses
  Windows, Classes, SysUtils;



type
  TProcessExitEvent = procedure (Sender :TObject; dwExitCode : DWORD ) of object;


  TProcessHelper = class
  private
    FCommandLine : String;
    FProcessInfo : TProcessInformation;
    FOnProcessExit : TProcessExitEvent;
    FWaitHandle : DWORD;
    FExitCode : DWORD;
    procedure UnregisterHandler;
    procedure ClearHandles;
    procedure FireEvent;
    procedure FireEventOnUIThread;
    function GetStarted: Boolean;

  public
    constructor Create(CommandLine : string);
    procedure Start;

    property IsStarted : Boolean read GetStarted;
    property OnProcessExit : TProcessExitEvent read FOnProcessExit write FOnProcessExit;

    destructor Destroy; override;

  end;

implementation

const
WT_EXECUTELONGFUNCTION = ULONG($00000010);
WT_EXECUTEONLYONCE = ULONG($00000008);
type
  TWaitOrTimerCallback = procedure (Context: Pointer; Success: Boolean) stdcall;

function RegisterWaitForSingleObject(out phNewWaitObject: THandle; hObject: THandle;
CallBack: TWaitOrTimerCallback; Context: Pointer; dwMilliseconds: ULONG;
dwFlags: ULONG): BOOL; stdcall; external 'kernel32.dll' name 'RegisterWaitForSingleObject';
function UnregisterWait(WaitHandle: THandle): BOOL; stdcall; external 'kernel32.dll' name 'UnregisterWait';{__checkReturn}

procedure WaitCallback(Parameter : Pointer; TimerOrWait: Boolean);stdcall;
var
  Obj : TProcessHelper;
  dwCode : DWORD;
begin
  Obj := TProcessHelper(Parameter);
  Assert(Obj <> nil);
  Assert(GetExitCodeProcess(Obj.FProcessInfo.hProcess, dwCode));
  Obj.UnregisterHandler;
  Obj.ClearHandles;
  Obj.FExitCode:=dwCode;
  Obj.FireEvent;
end;

{ TProcessHelper }

procedure TProcessHelper.ClearHandles;
begin
  if (FProcessInfo.hProcess <> 0) then
  begin
    Assert(CloseHandle(FProcessInfo.hProcess));
    FProcessInfo.hProcess := 0;
  end;
end;

constructor TProcessHelper.Create(CommandLine: string);
begin
  FCommandLine := CommandLine;
end;

procedure TProcessHelper.FireEvent;
begin
  if (Assigned(FOnProcessExit)) then
  begin
    FOnProcessExit(Self, FExitCode);
  end;
end;

procedure TProcessHelper.FireEventOnUIThread;
begin

end;

function TProcessHelper.GetStarted: Boolean;
begin
  Result := FProcessInfo.hProcess <> 0;
end;

procedure TProcessHelper.Start;
var
  si : TStartupInfo;
begin
  if (FProcessInfo.hProcess <> 0) then
    raise EInvalidOperation.Create('Process has already started and not exited yet!');

  ZeroMemory(@si, sizeof(si));
  si.cb := sizeof(si);
  if (CreateProcess(nil, PChar(FCommandLine), nil, nil, false, 0, nil, nil, si, FProcessInfo)) then
  begin
    CloseHandle(FProcessInfo.hThread);
    //Assert(RegisterWaitForSingleObject(FWaitHandle, FProcessInfo.hProcess, WaitCallback,
    //  Self, INFINITE, WT_EXECUTELONGFUNCTION or WT_EXECUTEONLYONCE));
  end;
end;

procedure TProcessHelper.UnregisterHandler;
begin
if (FWaitHandle <> 0) then
begin
UnregisterWait(FWaitHandle);
FWaitHandle := 0;
end;
end;


destructor TProcessHelper.Destroy;
begin
UnregisterHandler;
ClearHandles;
inherited;
end;


end.
