(*
  Модуль    : DlgUtils
  Категория : ..
  Версия: 1.0
  Автор : Маракасов Ф. В.

  Назначение:
*)

{ --- Последняя генерация: 26.02.2003  23:52:43 --- }

unit DlgUtils;
  {#Author fmarakasov@ugtu.net}
interface
uses
  Windows, ShlObj, ActiveX, SysUtils;

const
  BIF_NEWDIALOGSTYLE  =   $0040;
  BIF_USENEWUI        =   BIF_NEWDIALOGSTYLE or BIF_EDITBOX;



function ShBrowseForFolderObject(hWnd:THandle; Title:String; Flags:Cardinal=0;
        Root:PITEMIDLIST=nil):String;
function ShBrowseForSpecialFolder(hWnd:THandle; Title:String; Flags:Cardinal;
        SpecFolder:Integer):String;

implementation

var
  pMalloc:IMalloc = nil;
  LastPIDL:PITEMIDLIST = nil;

function BrowseCallBack(Wnd: HWND; uMsg: UINT; lParam, lpData: LPARAM): Integer
        stdcall;
begin
  case uMsg of
    BFFM_INITIALIZED: SendMessage(Wnd, BFFM_SETSELECTION, Integer(false),
            lpData);
  end;
  Result:=0;
end;


function ShBrowseForFolderObject(hWnd:THandle; Title:String; Flags:Cardinal;
        Root:PITEMIDLIST):String;
var
  bi:TBrowseInfo;
  pil:PITEMIDLIST;
  Buff:array[0..MAX_PATH] of char;
begin
//  CoInitialize(nil);

  Result:='';

  FillChar(Buff, 0, MAX_PATH);
  bi.hwndOwner:=hWnd;
  bi.pidlRoot:=Root;
  bi.pszDisplayName:=Buff;
  bi.lpszTitle:=PChar(Title);
  bi.ulFlags:=Flags;
  bi.lpfn:=BrowseCallBack;
  bi.lParam:=Integer(LastPIDL);
  bi.iImage:=0;

  pil:=SHBrowseForFolder(bi);

  if not ((Flags and  BIF_BROWSEFORCOMPUTER) <> 0) then
    if Assigned ( pil ) then
    begin
      try
      if SHGetPathFromIDList(pil, Buff) then
      begin
        SetLength(Result, StrLen(Buff));
        StrCopy(PChar(Result), Buff);
      end;
      finally
        pMalloc.Free(LastPIDL);
        LastPIDL:=pil;
      end;
    end
    else
  Result:='';
//  CoUnInitialize;
end;

function ShBrowseForSpecialFolder(hWnd:THandle; Title:String; Flags:Cardinal;
        SpecFolder:Integer):String;
var
  pidl:PITEMIDLIST;
begin
  if Succeeded(SHGetSpecialFolderLocation(hWnd, SpecFolder, pidl)) then
    try
      Result:=ShBrowseForFolderObject(hWnd, Title, Flags, pidl);
    finally
      pMalloc.Free(pidl);
    end;
end;

initialization
   SHGetMalloc(pMalloc);
finalization

end.
