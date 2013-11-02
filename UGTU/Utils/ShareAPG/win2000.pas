unit win2000;
   {#Author fmarakasov@ugtu.net}
interface
uses
  Windows, ShellAPI;

type
  TTHREAD_START_ROUTINE = function(pContext:Pointer):Cardinal;stdcall;

  function SHCreateDirectoryExA(hwnd:THandle;  pszPath:PAnsiChar; psa:PSecurityAttributes):Integer;stdcall;
  function SHCreateDirectoryExW(hwnd:THandle;  pszPath:PWideChar; psa:PSecurityAttributes):Integer;stdcall;
  function SHCreateDirectoryEx(hwnd:THandle;  pszPath:PWideChar; psa:PSecurityAttributes):Integer;stdcall;

  function QueueUserWorkItem(ThreadProc:TTHREAD_START_ROUTINE; Context:Pointer; Flags:Cardinal):Boolean;stdcall;

implementation

  function SHCreateDirectoryEx;external 'Shell32.dll' name 'SHCreateDirectoryExA';
  function SHCreateDirectoryExA;external 'Shell32.dll' name 'SHCreateDirectoryExA';
  function SHCreateDirectoryExW;external 'Shell32.dll' name 'SHCreateDirectoryExW';

  function QueueUserWorkItem;external 'Kernel32.dll' Name 'QueueUserWorkItem';
end.
