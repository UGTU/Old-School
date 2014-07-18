unit StoHTMLHelp;
 {#Author sergdev@ist.ugtu.net}
////////////////////////////////////////////////////////////////
// Implementation of context sensitive HTML help (.chm) for Delphi.
//
// Version:       1.2
// Author:        Martin Stoeckli
// Homepage:      www.martinstoeckli.ch/delphi
// Copyright(c):  Martin Stoeckli 2002
//
// Restrictions:  - Works only under the Windows platform.
//                - Is written for Delphi v7, should work from v6 up.
//
// Description
// ***********
// This unit enables you to call ".chm" files from your Delphi projects.
// You can use the normal Delphi VCL framework, write your projects the
// same way, as you would using normal ".hlp" files.
//
// Installation
// ************
// Simply add this unit to your project, that's all.
//
// If your help project contains files with the extension ".html"
// instead of ".htm", then you can either pass the filename with the
// extension to Application.HelpJump(), or you can set the property
// "HtmlExt" of the global object in this unit.
//   StoHelpViewer.HtmlExt := '.html';
//
// Examples
// ********
//   // assign a helpfile, you could also select the helpfile at the
//   // options dialog "Project/Options.../Application".
//   Application.HelpFile := 'C:\MyHelp.chm';
//   ...
//   // shows the contents of the helpfile
//   Application.HelpCommand(HELP_CONTENTS, 0);
//   // or
//   Application.HelpSystem.ShowTableOfContents;
//   ...
//   // opens the context sensitive help with a numerical id.
//   // you could do the same by setting the "HelpContext"
//   // property of a component and pressing the F1 key.
//   Application.HelpContext(1000);
//   // or with a string constant
//   Application.HelpJump('welcome');
//   ...
//   // opens the help index with a keyword.
//   // you could do the same by setting the "HelpKeyword"
//   // property of a component and pressing the F1 key.
//   Application.HelpKeyword('how to do');
//

interface
uses Classes, Windows, HelpIntfs;

type
  THtmlHelpA = function(hwndCaller: HWND; pszFile: LPCSTR; uCommand: UINT;
    dwData: DWORD): HWND; stdcall;

  TStoHtmlHelpViewer = class(TInterfacedObject, ICustomHelpViewer,
      IExtendedHelpViewer, IHelpSelector)
  private
    FViewerID: Integer;
    FViewerName: string;
    FHtmlHelpFunction: THtmlHelpA;
  protected
    FHHCtrlHandle: THandle;
    FHelpManager: IHelpManager;
    FHtmlExt: string;
    function GetHelpFileName: string;
    function IsChmFile(const FileName: string): Boolean;
    procedure InternalShutdown;
    procedure CallHtmlHelp(const HelpFile: string; uCommand: UINT; dwData:
      DWORD);
    // ICustomHelpViewer
    function GetViewerName: string;
    function UnderstandsKeyword(const HelpString: string): Integer;
    function GetHelpStrings(const HelpString: string): TStringList;
    function CanShowTableOfContents: Boolean;
    procedure ShowTableOfContents;
    procedure ShowHelp(const HelpString: string);
    procedure NotifyID(const ViewerID: Integer);
    procedure SoftShutDown;
    procedure ShutDown;
    // IExtendedHelpViewer
    function UnderstandsTopic(const Topic: string): Boolean;
    procedure DisplayTopic(const Topic: string);
    function UnderstandsContext(const ContextID: Integer;
      const HelpFileName: string): Boolean;
    procedure DisplayHelpByContext(const ContextID: Integer;
      const HelpFileName: string);
    // IHelpSelector
    function SelectKeyword(Keywords: TStrings): Integer;
    function TableOfContents(Contents: TStrings): Integer;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    property HtmlExt: string read FHtmlExt write FHtmlExt;
  end;

var
  StoHelpViewer: TStoHtmlHelpViewer;

implementation
uses Forms, SysUtils, WinHelpViewer;

const
  // imported from HTML Help Workshop
  HH_DISPLAY_TOPIC = $0000;
  HH_HELP_FINDER = $0000; // WinHelp equivalent
  HH_DISPLAY_TOC = $0001;
  HH_DISPLAY_INDEX = $0002;
  HH_DISPLAY_SEARCH = $0003;
  HH_KEYWORD_LOOKUP = $000D;
  HH_DISPLAY_TEXT_POPUP = $000E;
    // display string resource id or text in a popup window
  HH_HELP_CONTEXT = $000F; // display mapped numeric value in dwData
  HH_TP_HELP_CONTEXTMENU = $0010;
    // text popup help, same as WinHelp HELP_CONTEXTMENU
  HH_TP_HELP_WM_HELP = $0011; // text popup help, same as WinHelp HELP_WM_HELP
  HH_CLOSE_ALL = $0012;
    // close all windows opened directly or indirectly by the caller
  HH_ALINK_LOOKUP = $0013; // ALink version of HH_KEYWORD_LOOKUP
  HH_GET_LAST_ERROR = $0014; // not currently implemented // See HHERROR.h

type
  TStoWinHelpTester = class(TInterfacedObject, IWinHelpTester)
  protected
    // IWinHelpTester
    function CanShowALink(const ALink, FileName: string): Boolean;
    function CanShowTopic(const Topic, FileName: string): Boolean;
    function CanShowContext(const Context: Integer;
      const FileName: string): Boolean;
    function GetHelpStrings(const ALink: string): TStringList;
    function GetHelpPath: string;
    function GetDefaultHelpFile: string;
    function IsHlpFile(const FileName: string): Boolean;
  end;

  ////////////////////////////////////////////////////////////////
  // like "Application.ExeName", but in a DLL you get the name of
  // the DLL instead of the application name

function Sto_GetModuleName: string;
var
  szFileName: array[0..MAX_PATH] of Char;
begin
  FillChar(szFileName, SizeOf(szFileName), #0);
  GetModuleFileName(hInstance, szFileName, MAX_PATH);
  Result := szFileName;
end;

////////////////////////////////////////////////////////////////
{ TStoHtmlHelpViewer }
////////////////////////////////////////////////////////////////

procedure TStoHtmlHelpViewer.CallHtmlHelp(const HelpFile: string; uCommand:
  UINT; dwData: DWORD);
begin
  if Assigned(FHtmlHelpFunction) then
  begin
    case uCommand of
      HH_CLOSE_ALL: FHtmlHelpFunction(0, nil, uCommand, dwData);
        // special parameters
      HH_GET_LAST_ERROR: ; // ignore
    else
      FHtmlHelpFunction(FHelpManager.GetHandle, PAnsiChar(HelpFile), uCommand,
        dwData);
    end;
  end;
end;

function TStoHtmlHelpViewer.CanShowTableOfContents: Boolean;
begin
  Result := True;
end;

constructor TStoHtmlHelpViewer.Create;
begin
  inherited Create;
  FViewerName := 'StoHtmlHelp';
  FHtmlExt := '.htm';
  // load dll
  FHHCtrlHandle := LoadLibrary('HHCtrl.ocx');
  if (FHHCtrlHandle <> 0) then
    FHtmlHelpFunction := GetProcAddress(FHHCtrlHandle, 'HtmlHelpA');
end;

destructor TStoHtmlHelpViewer.Destroy;
begin
  StoHelpViewer := nil;
  // free dll
  FHtmlHelpFunction := nil;
  if (FHHCtrlHandle <> 0) then
    FreeLibrary(FHHCtrlHandle);
  inherited Destroy;
end;

procedure TStoHtmlHelpViewer.DisplayHelpByContext(const ContextID: Integer;
  const HelpFileName: string);
var
  sHelpFile: string;
begin
  sHelpFile := GetHelpFileName;
  if IsChmFile(sHelpFile) then
    CallHtmlHelp(sHelpFile, HH_HELP_CONTEXT, ContextID);
end;

procedure TStoHtmlHelpViewer.DisplayTopic(const Topic: string);
var
  sHelpFile: string;
  sTopic: string;
  sFileExt: string;
begin
  sHelpFile := GetHelpFileName;
  if IsChmFile(sHelpFile) then
  begin
    // prepare topicname as a html page
    sTopic := Topic;
    sFileExt := LowerCase(ExtractFileExt(sTopic));
    if (sFileExt <> '.htm') and (sFileExt <> '.html') then
      sTopic := sTopic + FHtmlExt;
    CallHtmlHelp(sHelpFile + '::/' + sTopic, HH_DISPLAY_TOPIC, 0);
  end;
end;

function TStoHtmlHelpViewer.GetHelpFileName: string;
var
  sPath: string;
begin
  Result := '';
  // ask for the helpfile name
  if Assigned(FHelpManager) then
    Result := FHelpManager.GetHelpFile;
  if (Result = '') then
    Result := Application.CurrentHelpFile;
  // if no path is specified, then add the application path
  // (otherwise the file won't be found if the current directory is wrong).
  if (Result <> '') then
  begin
    sPath := ExtractFilePath(Result);
    if (sPath = '') then
      Result := ExtractFilePath(Sto_GetModuleName) + Result;
  end;
end;

function TStoHtmlHelpViewer.GetHelpStrings(const HelpString: string):
  TStringList;
begin
  // create a tagged keyword
  Result := TStringList.Create;
  Result.Add(Format('%s: %s', [FViewerName, HelpString]));
end;

function TStoHtmlHelpViewer.GetViewerName: string;
begin
  Result := FViewerName;
end;

procedure TStoHtmlHelpViewer.InternalShutdown;
begin
  if Assigned(FHelpManager) then
  begin
    FHelpManager.Release(FViewerID);
    FHelpManager := nil;
  end;
end;

function TStoHtmlHelpViewer.IsChmFile(const FileName: string): Boolean;
var
  iPos: Integer;
  sFileExt: string;
begin
  // find extension
  iPos := LastDelimiter('.', FileName);
  if (iPos > 0) then
  begin
    sFileExt := Copy(FileName, iPos, Length(FileName));
    Result := CompareText(sFileExt, '.chm') = 0;
  end
  else
    Result := False;
end;

procedure TStoHtmlHelpViewer.NotifyID(const ViewerID: Integer);
begin
  FViewerID := ViewerID;
end;

function TStoHtmlHelpViewer.SelectKeyword(Keywords: TStrings): Integer;
var
  i: Integer;
  sViewerName: string;
begin
  Result := 0;
  i := 0;
  // find first tagged line (see GetHelpStrings)
  while (Result = 0) and (i <= Keywords.Count - 1) do
  begin
    sViewerName := Keywords.Strings[i];
    Delete(sViewerName, Pos(':', sViewerName), Length(sViewerName));
    if (FViewerName = sViewerName) then
      Result := i
    else
      Inc(i);
  end;
end;

procedure TStoHtmlHelpViewer.ShowHelp(const HelpString: string);
var
  sHelpFile: string;
  sHelpString: string;
begin
  sHelpFile := GetHelpFileName;
  if IsChmFile(sHelpFile) then
  begin
    // remove the tag if necessary (see GetHelpStrings)
    sHelpString := HelpString;
    Delete(sHelpString, 1, Pos(':', sHelpString));
    sHelpString := Trim(sHelpString);
    CallHtmlHelp(sHelpFile, HH_DISPLAY_INDEX, DWORD(Pchar(sHelpString)));
  end;
end;

procedure TStoHtmlHelpViewer.ShowTableOfContents;
var
  sHelpFile: string;
begin
  sHelpFile := GetHelpFileName;
  if IsChmFile(sHelpFile) then
    CallHtmlHelp(sHelpFile, HH_DISPLAY_TOC, 0);
end;

procedure TStoHtmlHelpViewer.ShutDown;
begin
  SoftShutDown;
  if Assigned(FHelpManager) then
    FHelpManager := nil;
end;

procedure TStoHtmlHelpViewer.SoftShutDown;
begin
  CallHtmlHelp('', HH_CLOSE_ALL, 0);
end;

function TStoHtmlHelpViewer.TableOfContents(Contents: TStrings): Integer;
begin
  // find line with viewer name
  Result := Contents.IndexOf(FViewerName);
end;

function TStoHtmlHelpViewer.UnderstandsContext(const ContextID: Integer;
  const HelpFileName: string): Boolean;
begin
  Result := IsChmFile(HelpFileName);
end;

function TStoHtmlHelpViewer.UnderstandsKeyword(const HelpString: string):
  Integer;
begin
  if IsChmFile(GetHelpFileName) then
    Result := 1
  else
    Result := 0;
end;

function TStoHtmlHelpViewer.UnderstandsTopic(const Topic: string): Boolean;
begin
  Result := IsChmFile(GetHelpFileName);
end;

////////////////////////////////////////////////////////////////
{ TStoWinHelpTester }
//
// delphi will call the WinHelpTester to determine, if the default
// winhelp should handle the requests.
// don't allow anything, because delphi (v7) will create an invalid
// helpfile path, calling GetHelpPath (it puts a pathdelimiter
// before the filename in "TWinHelpViewer.HelpFile").
////////////////////////////////////////////////////////////////

function TStoWinHelpTester.CanShowALink(const ALink,
  FileName: string): Boolean;
begin
  Result := False;
  //  Result := IsHlpFile(FileName);
end;

function TStoWinHelpTester.CanShowContext(const Context: Integer;
  const FileName: string): Boolean;
begin
  Result := False;
  //  Result := IsHlpFile(FileName);
end;

function TStoWinHelpTester.CanShowTopic(const Topic,
  FileName: string): Boolean;
begin
  Result := False;
  //  Result := IsHlpFile(FileName);
end;

function TStoWinHelpTester.GetDefaultHelpFile: string;
begin
  Result := '';
end;

function TStoWinHelpTester.GetHelpPath: string;
begin
  Result := '';
end;

function TStoWinHelpTester.GetHelpStrings(
  const ALink: string): TStringList;
begin
  // as TWinHelpViewer would do it
  Result := TStringList.Create;
  Result.Add(': ' + ALink);
end;

function TStoWinHelpTester.IsHlpFile(const FileName: string): Boolean;
var
  iPos: Integer;
  sFileExt: string;
begin
  // file has extension '.hlp' ?
  iPos := LastDelimiter('.', FileName);
  if (iPos > 0) then
  begin
    sFileExt := Copy(FileName, iPos, Length(FileName));
    Result := CompareText(sFileExt, '.hlp') = 0;
  end
  else
    Result := False;
end;

initialization
  StoHelpViewer := TStoHtmlHelpViewer.Create;
  RegisterViewer(StoHelpViewer, StoHelpViewer.FHelpManager);
  Application.HelpSystem.AssignHelpSelector(StoHelpViewer);
  WinHelpTester := TStoWinHelpTester.Create;

finalization
  // do not free StoHelpViewer, because the object is referenced by the
  // interface and will be freed automatically by releasing the last reference
  if Assigned(StoHelpViewer) then
    StoHelpViewer.InternalShutdown;
end.
 
 
 


 

                             



 