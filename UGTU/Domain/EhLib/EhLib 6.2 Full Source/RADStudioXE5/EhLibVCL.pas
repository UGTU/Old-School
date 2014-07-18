{*******************************************************}
{                                                       }
{                       EhLib v6.2                      }
{            Specific routines for VCL.Win32            }
{                      Build 6.2.09                     }
{                                                       }
{     Copyright (c) 2004-13 by Dmitry V. Bolshakov      }
{                                                       }
{*******************************************************}

{$I EhLib.Inc}

unit EhLibVCL;

interface

uses
  Windows, Forms, SysUtils, Classes, DB, TypInfo, Controls, Graphics,
{$IFDEF EH_LIB_6}
  RTLConsts, Variants, Types,
{$ELSE}
  Consts,
{$ENDIF}
  Messages, Math;

{$I EhlibVerInfo.Inc}
{$I EhLibEditionInfo.Inc}

type
  TCMParentFontChanged = TMessage;
  IntPtr = Pointer;
{$IFDEF EH_LIB_12}
  TUniBookmarkEh = TBookmark;
{$ELSE}
  TBytes = array of Byte;
  TUniBookmarkEh = TBookmarkStr;
{$ENDIF}

{$IFNDEF EH_LIB_11}
  TRecordBuffer = PChar;
{$ENDIF}

  TVariantDynArray      = array of Variant;

const
{$IFDEF EH_LIB_12}
  NilBookmarkEh = nil;
{$ELSE}
  NilBookmarkEh = '';
{$ENDIF}

LAYOUT_RTL_EH = $00000001;

function CharInSetEh(C: Char; const CharSet: TSysCharSet): Boolean;
function VarToAnsiStr(const V: Variant): AnsiString;

procedure FillDWord(var Dest; Count, Value: Integer);
function StackAlloc(Size: Integer): Pointer;
procedure StackFree(P: Pointer);

function DataSetCompareBookmarks(DataSet: TDataSet; Bookmark1, Bookmark2: TUniBookmarkEh): Integer;
function DataSetBookmarkValid(DataSet: TDataSet; Bookmark: TUniBookmarkEh): Boolean;

function GetMasterDataSet(FDataSet: TDataSet; APropInfo: PPropInfo): TDataSet;

function DrawTextEh(hDC: HDC; const Text: String; nCount: Integer;
  var lpRect: TRect; uFormat: UINT): Integer;
function WindowsDrawTextEx(DC: HDC; const lpchText: String; cchText: Integer;
  var p4: TRect;  dwDTFormat: UINT; DTParams: TDrawTextParams): Integer; overload;
function WindowsDrawTextEx(DC: HDC; const lpchText: String; cchText: Integer;
  var p4: TRect;  dwDTFormat: UINT): Integer; overload;

{function DrawTextEh(hDC: HDC; Text: WideString; nCount: Integer;
  var lpRect: TRect; uFormat: UINT): Integer; overload;
function WindowsDrawTextEx(DC: HDC; lpchText: WideString; cchText: Integer;
  var p4: TRect;  dwDTFormat: UINT; DTParams: TDrawTextParams): Integer; overload;
function WindowsDrawTextEx(DC: HDC; lpchText: WideString; cchText: Integer;
  var p4: TRect;  dwDTFormat: UINT): Integer; overload;
}

function WindowsExtTextOut(DC: HDC; X, Y: Integer; Options: Longint;
  var Rect: TRect; const Str: String; Count: Longint{; Dx: PInteger}): BOOL;

function WindowsGetOutlineTextMetrics(DC: HDC; p2: UINT; var OTMetricStructs: TOutlineTextMetric): UINT;

//function SendStructlParamMessage(hWnd: HWND; Msg: UINT; wParam: WPARAM; var lParam): LRESULT;
function SendStructMessage(hWnd: HWND; Msg: UINT; wParam: WPARAM; var lParam): LRESULT;
function SendTextMessage(hWnd: HWND; Msg: UINT; wParam: WPARAM; const lParam: string): LRESULT;
function SendGetTextMessage(hWnd: HWND; Msg: UINT; wParam: WPARAM; var lParam: string; BufferSize: Integer): LRESULT;

function SystemParametersInfoEh(uiAction, uiParam: UINT; var pvParam; fWinIni: UINT): BOOL;
function WindowsInvalidateRect(hWnd: HWND; var Rect: TRect; bErase: BOOL): BOOL;
function WindowsValidateRect(hWnd: HWND; var Rect: TRect): BOOL;
function WindowsScrollWindowEx(hWnd: HWND; dx, dy: Integer;
  var prcScroll,  prcClip: TRect;
  hrgnUpdate: HRGN; {prcUpdate: TRect; }flags: UINT): BOOL;
function WindowsScrollWindow(hWnd: HWND; dx, dy: Integer; var prcScroll, prcClip: TRect): BOOL;
function FindWindowEh(lpClassName, lpWindowName: String): HWND;

function WindowsLPtoDP(DC: HDC; var ARect: TRect): BOOL;
function WindowsCreatePolygonRgn(Points: array of TPoint; Count, FillMode: Integer): HRGN;

// WindowsSetStdCursor

function IsObjectAndIntegerRefSame(AObject: TObject; IntRef: Integer): Boolean;
function IntPtrToObject(AIntPtr: Integer): TObject;
function ObjectToIntPtr(AObject: TObject): Integer;
function IntPtrToString(AIntPtr: Integer): String;

procedure VarToMessage(var VarMessage; var Message: TMessage);
function MessageToTMessage(var Message): TMessage;
function MessageToTWMMouse(var Message): TWMMouse;
function MessageToTWMKey(var Message): TWMKey;
function UnwrapMessageEh(var Message): TMessage;

function SmallPointToInteger(SmallPoint: TSmallPoint): Integer;
function LongintToSmallPoint(Value: Longint): TSmallPoint;

procedure MessageSendGetSel(hWnd: HWND; var SelStart, SelEnd: Integer);

function NlsUpperCase(const S: String): String;
function NlsLowerCase(const S: String): String;
function NlsCompareStr(const S1, S2: String): Integer;
function NlsCompareText(const S1, S2: String): Integer;

function WideStringCompare(ws1, ws2: WideString; CharCount: Integer = 0; CaseInsensitive: Boolean = False): Integer;
function AnsiStringCompare(s1, s2: String; CharCount: Integer = 0; CaseInsensitive: Boolean = False): Integer;

procedure BitmapLoadFromResourceName(Bmp: TBitmap; Instance: THandle; const ResName: String);
function LoadBitmapEh(hInstance: HINST; lpBitmapID: Integer): HBITMAP;

//procedure Clipboard_SetBuffer(AClipboard: TClipboard; Format: Word; Buffer: TBytes; Size: Integer);

type
  TPropListArray = array of PPropInfo;

function GetPropListAsArray(ATypeInfo: PTypeInfo; TypeKinds: TTypeKinds): TPropListArray;

function HexToBinEh(Text: Pointer; var Buffer: TBytes; Count: Integer): Integer;
procedure BinToHexEh(Buffer: TBytes; var Text: String; Count: Integer);

procedure StreamWriteBytes(Stream: TStream; Buffer: TBytes);
procedure StreamReadBytes(Stream: TStream; var Buffer: TBytes; Count: Integer);

{$IFNDEF EH_LIB_12}
function BytesOf(S: String): TBytes; overload;
{$ENDIF}

{$IFNDEF EH_LIB_17}
function BytesOf(const Val: Pointer; const Len: integer): TBytes; overload;
{$ENDIF}

function PropInfo_getPropType(APropInfo: PPropInfo): PTypeInfo;
function PropInfo_getName(APropInfo: PPropInfo): String;
function PropType_getKind(APropType: PTypeInfo): TTypeKind;

procedure VarArrayRedimEh(var A : Variant; HighBound: Integer);

{$IFNDEF EH_LIB_5}

function GetObjectProp(Instance: TObject; PropInfo: PPropInfo): TObject;
function GetObjectPropClass(Instance: TObject; PropInfo: PPropInfo): TClass;
procedure SetObjectProp(Instance: TObject; PropInfo: PPropInfo; Value: TObject);

{$ENDIF}

function GetUltimateOwner(APersistent: TPersistent): TPersistent;

function LongMulDiv(Mult1, Mult2, Div1: Longint): Longint; stdcall;
function EmptyRect: TRect;
function IsRectEmptyEh(const Rect: TRect): Boolean;

function VariantToRefObject(Value: Variant): TObject;
function RefObjectToVariant(Value: TObject): Variant;
procedure DataVarCastAsObject(var Dest: Variant; const Source: Variant);

type

{ TFilerAccess }

  TFilerAccess = class(TInterfacedObject) // Same as TFilerAccess in D8.
  private
    FPersistent: TPersistent;
  public
    constructor Create(APersistent: TPersistent);
    procedure DefineProperties(AFiler: TFiler);
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent);
    function GetChildOwner: TComponent;
    function GetChildParent: TComponent;
    procedure SetAncestor(Value: Boolean);
    procedure SetChildOrder(Child: TComponent; Order: Integer);
    procedure Updated;
    procedure Updating;
  end;

{ TMemoryStreamEh }

  TMemoryStreamEh = class(TMemoryStream)
  private
    FHalfMemoryDelta: Integer;
  protected
    function Realloc(var NewCapacity: Longint): Pointer; override;
  public
    constructor Create;
    property HalfMemoryDelta: Integer read FHalfMemoryDelta write FHalfMemoryDelta;
  end;

{$IFNDEF EH_LIB_6}

type
  IInterface = IUnknown;

  IInterfaceComponentReference = interface
    ['{E28B1858-EC86-4559-8FCD-6B4F824151ED}']
    function GetComponent: TComponent;
  end;

  TDragObjectEx = class(TDragObject)
  public
    procedure BeforeDestruction; override;
  end;

{$IFDEF EH_LIB_7}
{$ELSE}
  TSetLayeredWindowAttributes = function (Hwnd: THandle; crKey: COLORREF; bAlpha: Byte; dwFlags: DWORD): Boolean; stdcall;

const
  {$EXTERNALSYM WS_EX_LAYERED}
  WS_EX_LAYERED = $00080000;
{$EXTERNALSYM LWA_ALPHA}
  LWA_ALPHA = $00000002;
{$EXTERNALSYM LWA_COLORKEY}
  LWA_COLORKEY = $00000001;

  clSkyBlue = TColor($F0CAA6);

var
  SetLayeredWindowAttributes: TSetLayeredWindowAttributes = nil;

function CheckWin32Version(AMajor: Integer; AMinor: Integer = 0): Boolean;

{$ENDIF}

{$IFDEF EH_LIB_7}
{$ELSE}
const
//Delphi 5 or 6
  {$EXTERNALSYM CS_DROPSHADOW}
  CS_DROPSHADOW = $20000;
{$ENDIF}

const
  sLineBreak = {$IFDEF LINUX} #10 {$ELSE} #13#10 {$ENDIF};

function VarToWideStr(const V: Variant): WideString;

{$ENDIF}

function ExplicitLongwordToLongInt(v: Longword): LongInt;
function WStrCopy(Dest: PWideChar; const Source: PWideChar): PWideChar;

function SafeGetMouseCursorPos: TPoint;

procedure VarSetNull(var V: Variant); {$IFDEF EH_LIB_8} inline;{$ENDIF}
function VarIsNullEh(const V: Variant): Boolean; {$IFDEF EH_LIB_8} inline;{$ENDIF}

{$IFNDEF EH_LIB_13}
function CenteredRect(const SourceRect: TRect; const CenteredRect: TRect): TRect;
{$ENDIF}

{$IFNDEF EH_LIB_14}
function PointToLParam(P: TPoint): LPARAM;
{$ENDIF}

{$IFDEF EH_LIB_6}
{$ELSE}
type
 TRoundToRange = -37..37;

function RoundTo(const AValue: Double; const ADigit: TRoundToRange): Double;

function VarIsStr(const V: Variant): Boolean;
{$ENDIF}

{$IFNDEF EH_LIB_16}

type

{ TCustomStyleServicesProxyEh }

  TCustomStyleServicesProxyEh = class(TObject)
  public
    function GetSystemColor(Color: TColor): TColor;
  end;

function StyleServices: TCustomStyleServicesProxyEh;

{$ENDIF}

{$IFNDEF EH_LIB_17}

type

{ TFormatSettingsProxyEh }

  TFormatSettingsProxyEh = class(TObject)
  private
    function GetDecimalSeparator: Char;
    function GetDateSeparator: Char;
    function GetTimeSeparator: Char;
    function GetThousandSeparator: Char;
    function GetShortDateFormat: String;
    function GetLongDateFormat: String;
    function GetLongTimeFormat: String;
    function GetCurrencyDecimals: Byte;

    procedure SetDecimalSeparator(Value: Char);
    procedure SetShortDateFormat(Value: String);
    procedure SetLongDateFormat(Value: String);
    procedure SetLongTimeFormat(Value: String);
    procedure SetDateSeparator(Value: Char);
    procedure SetTimeSeparator(Value: Char);
    procedure SetThousandSeparator(Value: Char);
    procedure SetCurrencyDecimals(Value: Byte);
  public
    property DecimalSeparator: Char read GetDecimalSeparator write SetDecimalSeparator;
    property DateSeparator: Char read GetDateSeparator write SetDateSeparator;
    property TimeSeparator: Char read GetTimeSeparator write SetTimeSeparator;
    property CurrencyDecimals: Byte read GetCurrencyDecimals write SetCurrencyDecimals;
    property ThousandSeparator: Char read GetThousandSeparator write SetThousandSeparator;
    property ShortDateFormat: String read GetShortDateFormat write SetShortDateFormat;
    property LongDateFormat: String read GetLongDateFormat write SetLongDateFormat;
    property LongTimeFormat: String read GetLongTimeFormat write SetLongTimeFormat;
  end;

function FormatSettings: TFormatSettingsProxyEh;

{$ENDIF}

function SetLayout(hdc: HDC; dwLayout: DWORD): DWORD; stdcall;
  external gdi32 name 'SetLayout';

procedure KillMessage(Wnd: HWnd; Msg: Integer);

implementation

procedure KillMessage(Wnd: HWnd; Msg: Integer);
// Delete the requested message from the queue, but throw back
// any WM_QUIT msgs that PeekMessage may also return
var
  M: TMsg;
begin
  M.Message := 0;
  if PeekMessage(M, Wnd, Msg, Msg, pm_Remove) and (M.Message = WM_QUIT) then
    PostQuitMessage(M.wparam);
end;

{$IFNDEF EH_LIB_17}

{ TFormatSettingsProxyEh }

function TFormatSettingsProxyEh.GetDecimalSeparator: Char;
begin
{$IFDEF EH_LIB_17}
  Result := System.SysUtils.FormatSettings.DecimalSeparator;
{$ELSE}
  Result := SysUtils.DecimalSeparator;
{$ENDIF}
end;

procedure TFormatSettingsProxyEh.SetDecimalSeparator(Value: Char);
begin
{$IFDEF EH_LIB_17}
  System.SysUtils.FormatSettings.DecimalSeparator := Value;
{$ELSE}
  SysUtils.DecimalSeparator := Value;
{$ENDIF}
end;

function TFormatSettingsProxyEh.GetDateSeparator: Char;
begin
{$IFDEF EH_LIB_17}
  Result := System.SysUtils.FormatSettings.DateSeparator;
{$ELSE}
  Result := SysUtils.DateSeparator;
{$ENDIF}
end;

procedure TFormatSettingsProxyEh.SetDateSeparator(Value: Char);
begin
{$IFDEF EH_LIB_17}
  System.SysUtils.FormatSettings.DateSeparator := Value;
{$ELSE}
  SysUtils.DateSeparator := Value;
{$ENDIF}
end;

function TFormatSettingsProxyEh.GetTimeSeparator: Char;
begin
{$IFDEF EH_LIB_17}
  Result := System.SysUtils.FormatSettings.TimeSeparator;
{$ELSE}
  Result := SysUtils.TimeSeparator;
{$ENDIF}
end;

procedure TFormatSettingsProxyEh.SetTimeSeparator(Value: Char);
begin
{$IFDEF EH_LIB_17}
  System.SysUtils.FormatSettings.TimeSeparator := Value;
{$ELSE}
  SysUtils.TimeSeparator := Value;
{$ENDIF}
end;

function TFormatSettingsProxyEh.GetThousandSeparator: Char;
begin
{$IFDEF EH_LIB_17}
  Result := System.SysUtils.FormatSettings.ThousandSeparator;
{$ELSE}
  Result := SysUtils.ThousandSeparator;
{$ENDIF}
end;

procedure TFormatSettingsProxyEh.SetThousandSeparator(Value: Char);
begin
{$IFDEF EH_LIB_17}
  System.SysUtils.FormatSettings.ThousandSeparator := Value;
{$ELSE}
  SysUtils.ThousandSeparator := Value;
{$ENDIF}
end;

function TFormatSettingsProxyEh.GetShortDateFormat: String;
begin
{$IFDEF EH_LIB_17}
  Result := System.SysUtils.FormatSettings.ShortDateFormat;
{$ELSE}
  Result := SysUtils.ShortDateFormat;
{$ENDIF}
end;

procedure TFormatSettingsProxyEh.SetShortDateFormat(Value: String);
begin
{$IFDEF EH_LIB_17}
  System.SysUtils.FormatSettings.ShortDateFormat := Value;
{$ELSE}
  SysUtils.ShortDateFormat := Value;
{$ENDIF}
end;

function TFormatSettingsProxyEh.GetLongDateFormat: String;
begin
{$IFDEF EH_LIB_17}
  Result := System.SysUtils.FormatSettings.LongDateFormat;
{$ELSE}
  Result := SysUtils.LongDateFormat;
{$ENDIF}
end;

procedure TFormatSettingsProxyEh.SetLongDateFormat(Value: String);
begin
{$IFDEF EH_LIB_17}
  System.SysUtils.FormatSettings.LongDateFormat := Value;
{$ELSE}
  SysUtils.LongDateFormat := Value;
{$ENDIF}
end;

function TFormatSettingsProxyEh.GetLongTimeFormat: String;
begin
{$IFDEF EH_LIB_17}
  Result := System.SysUtils.FormatSettings.LongTimeFormat;
{$ELSE}
  Result := SysUtils.LongTimeFormat;
{$ENDIF}
end;

procedure TFormatSettingsProxyEh.SetLongTimeFormat(Value: String);
begin
{$IFDEF EH_LIB_17}
  System.SysUtils.FormatSettings.LongTimeFormat := Value;
{$ELSE}
  SysUtils.LongTimeFormat := Value;
{$ENDIF}
end;

function TFormatSettingsProxyEh.GetCurrencyDecimals: Byte;
begin
{$IFDEF EH_LIB_17}
  Result := System.SysUtils.FormatSettings.CurrencyDecimals;
{$ELSE}
  Result := SysUtils.CurrencyDecimals;
{$ENDIF}
end;

procedure TFormatSettingsProxyEh.SetCurrencyDecimals(Value: Byte);
begin
{$IFDEF EH_LIB_17}
  System.SysUtils.FormatSettings.CurrencyDecimals:= Value;
{$ELSE}
  SysUtils.CurrencyDecimals := Value;
{$ENDIF}
end;

{ FormatSettingsEh }

var
  FFormatSettings: TFormatSettingsProxyEh;

function FormatSettings: TFormatSettingsProxyEh;
begin
  if FFormatSettings = nil then
    FFormatSettings := TFormatSettingsProxyEh.Create;
  Result := FFormatSettings;
end;

{$ENDIF}

{ Functions }

{$IFNDEF EH_LIB_16}

var
  FStyleServices: TCustomStyleServicesProxyEh;

function StyleServices: TCustomStyleServicesProxyEh;
begin
  if FStyleServices = nil then
    FStyleServices := TCustomStyleServicesProxyEh.Create;
  Result := FStyleServices;
end;

{$ENDIF}

{$IFNDEF EH_LIB_13}
function CenteredRect(const SourceRect: TRect; const CenteredRect: TRect): TRect;
var
  Width, Height: Integer;
  X, Y: Integer;
begin
  Width := CenteredRect.Right - CenteredRect.Left;
  Height := CenteredRect.Bottom - CenteredRect.Top;
  X := (SourceRect.Right + SourceRect.Left) div 2;
  Y := (SourceRect.Top + SourceRect.Bottom) div 2;
  Result := Rect(X - Width div 2, Y - Height div 2, X + (Width + 1) div 2, Y + (Height + 1) div 2);
end;
{$ENDIF}

{$IFNDEF EH_LIB_14}
function PointToLParam(P: TPoint): LPARAM;
begin
  Result := LPARAM((P.X and $0000ffff) or (P.Y shl 16));
end;
{$ENDIF}

function VarIsNullEh(const V: Variant): Boolean;
begin
{$IFDEF CIL}
  Result := VarIsNull(V);
{$ELSE}
  Result := TVarData(V).VType = varNull;
{$ENDIF}
end;

procedure VarSetNull(var V: Variant);
const
  varDeepData = $BFE8;
begin
  if (TVarData(V).VType and varDeepData) = 0 then
    TVarData(V).VType := varNull
  else
  begin
    VarClear(V);
    TVarData(V).VType := varNull;
  end;
end;

{$IFDEF EH_LIB_6}
{$ELSE}
//Delphi 5
function CheckWin32Version(AMajor: Integer; AMinor: Integer = 0): Boolean;
begin
  Result := (AMajor > Win32MajorVersion) or
            ((AMajor = Win32MajorVersion) and
             (AMinor >= Win32MinorVersion));
end;
{$ENDIF}

function LongMulDiv(Mult1, Mult2, Div1: Longint): Longint; stdcall;
{$IFDEF LINUX}
  external 'libwine.borland.so' name 'MulDiv';
{$ELSE}
  external 'kernel32.dll' name 'MulDiv';
{$ENDIF}

function CharInSetEh(C: Char; const CharSet: TSysCharSet): Boolean;
begin
{$IFDEF EH_LIB_12}
  Result := CharInSet(C, CharSet);
{$ELSE}
  Result := C in CharSet;
{$ENDIF}
end;

function VarToAnsiStr(const V: Variant): AnsiString;
begin
  if not VarIsNull(V)
    then Result := AnsiString(V)
    else Result := AnsiString('');
end;

function WideStringCompare(ws1, ws2: WideString; CharCount: Integer = 0; CaseInsensitive: Boolean = False): Integer;
var
  dwCmpFlags: LongWord;
  cchCount: Integer;
begin
  if CaseInsensitive
    then dwCmpFlags := NORM_IGNORECASE
    else dwCmpFlags := 0;

  if CharCount = 0
    then cchCount := -1
    else cchCount := CharCount;

  Result := CompareStringW(LOCALE_USER_DEFAULT, dwCmpFlags, PWideChar(ws1),
      cchCount, PWideChar(ws2), cchCount) - 2;
end;

function AnsiStringCompare(s1, s2: String; CharCount: Integer = 0; CaseInsensitive: Boolean = False): Integer;
var
  dwCmpFlags: LongWord;
  cchCount: Integer;
begin
  if CaseInsensitive
    then dwCmpFlags := NORM_IGNORECASE
    else dwCmpFlags := 0;

  if CharCount = 0
    then cchCount := -1
    else cchCount := CharCount;

  Result := CompareString(LOCALE_USER_DEFAULT, dwCmpFlags, PChar(s1),
      cchCount, PChar(s2), cchCount) - 2;
end;

function IsObjectAndIntegerRefSame(AObject: TObject; IntRef: Integer): Boolean;
begin
  Result := (Integer(AObject) = IntRef);
end;

function IntPtrToObject(AIntPtr: Integer): TObject;
begin
  Result := TObject(AIntPtr);
end;

function ObjectToIntPtr(AObject: TObject): Integer;
begin
  Result := Integer(AObject);
end;

function IntPtrToString(AIntPtr: Integer): String;
begin
  Result := String(PChar(AIntPtr));
end;

procedure FillDWord(var Dest; Count, Value: Integer); register;
{$IFDEF EH_LIB_16}
{$POINTERMATH ON}
var
  I: Integer;
  P: PInteger;
begin
  P := PInteger(@Dest);
  for I := 0 to Count - 1 do
    P[I] := Value;
end;
{$POINTERMATH OFF}
{$ELSE}
asm
  XCHG  EDX, ECX
  PUSH  EDI
  MOV   EDI, EAX
  MOV   EAX, EDX
  REP   STOSD
  POP   EDI
end;
{$ENDIF}

{ StackAlloc allocates a 'small' block of memory from the stack by
  decrementing SP.  This provides the allocation speed of a local variable,
  but the runtime size flexibility of heap allocated memory.  }
function StackAlloc(Size: Integer): Pointer; register;
{$IFDEF EH_LIB_16}
begin
  GetMem(Result, Size);
end;
{$ELSE}
asm
  POP   ECX          { return address }
  MOV   EDX, ESP
  ADD   EAX, 3
  AND   EAX, not 3   // round up to keep ESP dword aligned
  CMP   EAX, 4092
  JLE   @@2
@@1:
  SUB   ESP, 4092
  PUSH  EAX          { make sure we touch guard page, to grow stack }
  SUB   EAX, 4096
  JNS   @@1
  ADD   EAX, 4096
@@2:
  SUB   ESP, EAX
  MOV   EAX, ESP     { function result = low memory address of block }
  PUSH  EDX          { save original SP, for cleanup }
  MOV   EDX, ESP
  SUB   EDX, 4
  PUSH  EDX          { save current SP, for sanity check  (sp = [sp]) }
  PUSH  ECX          { return to caller }
end;
{$ENDIF}

{ StackFree pops the memory allocated by StackAlloc off the stack.
- Calling StackFree is optional - SP will be restored when the calling routine
  exits, but it's a good idea to free the stack allocated memory ASAP anyway.
- StackFree must be called in the same stack context as StackAlloc - not in
  a subroutine or finally block.
- Multiple StackFree calls must occur in reverse order of their corresponding
  StackAlloc calls.
- Built-in sanity checks guarantee that an improper call to StackFree will not
  corrupt the stack. Worst case is that the stack block is not released until
  the calling routine exits. }
procedure StackFree(P: Pointer); register;
{$IFDEF EH_LIB_16}
begin
  FreeMem(P);
end;
{$ELSE}
asm
  POP   ECX                     { return address }
  MOV   EDX, DWORD PTR [ESP]
  SUB   EAX, 8
  CMP   EDX, ESP                { sanity check #1 (SP = [SP]) }
  JNE   @@1
  CMP   EDX, EAX                { sanity check #2 (P = this stack block) }
  JNE   @@1
  MOV   ESP, DWORD PTR [ESP+4]  { restore previous SP  }
@@1:
  PUSH  ECX                     { return to caller }
end;
{$ENDIF}

function DataSetCompareBookmarks(DataSet: TDataSet; Bookmark1, Bookmark2: TUniBookmarkEh): Integer;
begin
  Result := DataSet.CompareBookmarks(TBookmark(Bookmark1), TBookmark(Bookmark2));
end;

function DataSetBookmarkValid(DataSet: TDataSet; Bookmark: TUniBookmarkEh): Boolean;
begin
  Result := DataSet.BookmarkValid(TBookmark(Bookmark));
end;

function GetMasterDataSet(FDataSet: TDataSet; APropInfo: PPropInfo): TDataSet;
var PropValue: TDataSource;
begin
  Result := nil;
  PropValue := nil;
  if (APropInfo <> nil) then
  begin
    if APropInfo^.PropType^.Kind = tkClass then
    try
      PropValue := (TObject(GetOrdProp(FDataSet, APropInfo)) as TDataSource);
    except // if PropInfo is not TDataSource or not inherited of
    end;
  end;
  if (PropValue <> nil)
    then Result := PropValue.DataSet;
end;

function DrawTextEh(hDC: HDC; const Text: String; nCount: Integer;
  var lpRect: TRect; uFormat: UINT): Integer;
begin
  Result := DrawText(hDC, PChar(Text), nCount, lpRect, uFormat);
end;

function WindowsDrawTextEx(DC: HDC; const lpchText: String; cchText: Integer;
  var p4: TRect;  dwDTFormat: UINT; DTParams: TDrawTextParams): Integer;
begin
  Result := DrawTextEx(DC, PChar(lpchText), cchText, p4, dwDTFormat, @DTParams);
end;

function WindowsDrawTextEx(DC: HDC; const lpchText: String; cchText: Integer;
  var p4: TRect;  dwDTFormat: UINT): Integer; overload;
begin
  Result := DrawTextEx(DC, PChar(lpchText), cchText, p4, dwDTFormat, nil);
end;

{
function DrawTextEh(hDC: HDC; Text: WideString; nCount: Integer;
  var lpRect: TRect; uFormat: UINT): Integer; overload;
begin
  Result := DrawTextW(hDC, PWideChar(Text), nCount, lpRect, uFormat);
end;

function WindowsDrawTextEx(DC: HDC; lpchText: WideString; cchText: Integer;
  var p4: TRect;  dwDTFormat: UINT; DTParams: TDrawTextParams): Integer; overload;
begin
  Result := DrawTextExW(DC, PWideChar(lpchText), cchText, p4, dwDTFormat, @DTParams);
end;

function WindowsDrawTextEx(DC: HDC; lpchText: WideString; cchText: Integer;
  var p4: TRect;  dwDTFormat: UINT): Integer; overload;
begin
  Result := DrawTextExW(DC, PWideChar(lpchText), cchText, p4, dwDTFormat, nil);
end;
}

function WindowsExtTextOut(DC: HDC; X, Y: Integer; Options: Longint;
  var Rect: TRect; const Str: String; Count: Longint{; Dx: PInteger}): BOOL;
begin
  Result := ExtTextOut(DC, X, Y, Options,
    @Rect, PChar(Str), Count, nil);
end;

function WindowsGetOutlineTextMetrics(DC: HDC; p2: UINT; var OTMetricStructs: TOutlineTextMetric): UINT;
begin
  Result := GetOutlineTextMetrics(DC, p2, @OTMetricStructs);
end;

{function SendStructlParamMessage(hWnd: HWND; Msg: UINT; wParam: WPARAM; var lParam): LRESULT;
begin
  Result := SendMessage(hWnd, Msg, wParam, Integer(@lParam));
end;}

function SendStructMessage(hWnd: HWND; Msg: UINT; wParam: WPARAM; var lParam): LRESULT;
begin
  Result := SendMessage(hWnd, Msg, wParam, Integer(@lParam));
end;

function SendTextMessage(hWnd: HWND; Msg: UINT; wParam: WPARAM; const lParam: string): LRESULT;
begin
  Result := SendMessage(hWnd, Msg, wParam, Integer(PChar(lParam)));
end;

function SendGetTextMessage(hWnd: HWND; Msg: UINT; wParam: WPARAM; var lParam: String; BufferSize: Integer): LRESULT;
var
  Text: array[0..4095] of Char;
begin
  Word((@Text)^) := SizeOf(Text);
  Result := SendMessage(hWnd, HWND, wParam, Longint(@Text));
  SetString(lParam, Text, Result);
end;

function SystemParametersInfoEh(uiAction, uiParam: UINT; var pvParam; fWinIni: UINT): BOOL;
begin
  Result := SystemParametersInfo(uiAction, uiParam, @pvParam, fWinIni);
end;

function WindowsInvalidateRect(hWnd: HWND; var Rect: TRect; bErase: BOOL): BOOL;
begin
  Result := InvalidateRect(hWnd, @Rect, bErase);
end;

function WindowsValidateRect(hWnd: HWND; var Rect: TRect): BOOL;
begin
  Result := ValidateRect(hWnd, @Rect);
end;

function WindowsScrollWindowEx(hWnd: HWND; dx, dy: Integer;
  var prcScroll,  prcClip: TRect;
  hrgnUpdate: HRGN; {prcUpdate: TRect; }flags: UINT): BOOL;
begin
  Result := ScrollWindowEx(hWnd, dx, dy, @prcScroll, @prcClip,
    hrgnUpdate, nil, flags);
end;

function WindowsScrollWindow(hWnd: HWND; dx, dy: Integer; var prcScroll, prcClip: TRect): BOOL;
begin
  Result := ScrollWindow(hWnd, dx, dy, @prcScroll, @prcClip);
end;

function FindWindowEh(lpClassName, lpWindowName: String): HWND;
begin

  Result := FindWindow(PChar(lpClassName), PChar(lpWindowName));
end;

procedure VarToMessage(var VarMessage; var Message: TMessage);
begin
  Message := TMessage(VarMessage);
end;

function MessageToTMessage(var Message): TMessage;
begin
  Result := TMessage(Message);
end;

function MessageToTWMMouse(var Message): TWMMouse;
begin
  Result := TWMMouse(Message);
end;

function MessageToTWMKey(var Message): TWMKey;
begin
  Result := TWMKey(Message);
end;

function UnwrapMessageEh(var Message): TMessage;
begin
  Result := TMessage(Message);
end;

function SmallPointToInteger(SmallPoint: TSmallPoint): Integer;
begin
  Result := Integer(SmallPoint);
end;

function LongintToSmallPoint(Value: Longint): TSmallPoint;
begin
  Result := TSmallPoint(Value);
end;

function WindowsLPtoDP(DC: HDC; var ARect: TRect): BOOL;
begin
  Result := LPtoDP(DC, ARect, 2);
end;

function WindowsCreatePolygonRgn(Points: array of TPoint; Count, FillMode: Integer): HRGN;
begin
  Result := CreatePolygonRgn(Points, Count, FillMode);
end;

procedure MessageSendGetSel(hWnd: HWND; var SelStart, SelEnd: Integer);
begin
  SendMessage(hWnd, EM_GETSEL, WPARAM(@SelStart), LPARAM(@SelEnd));
end;

function NlsUpperCase(const S: String): String;
begin
  Result := AnsiUpperCase(S);
end;

function NlsLowerCase(const S: String): String;
begin
  Result := AnsiLowerCase(S);
end;

function NlsCompareStr(const S1, S2: String): Integer;
begin
  Result := AnsiCompareStr(S1, S2);
end;

function NlsCompareText(const S1, S2: String): Integer;
begin
  Result := AnsiCompareText(S1, S2);
end;

procedure BitmapLoadFromResourceName(Bmp: TBitmap; Instance: THandle; const ResName: String);
begin
  Bmp.LoadFromResourceName(Instance, ResName);
end;

function LoadBitmapEh(hInstance: HINST; lpBitmapID: Integer): HBITMAP;
begin
  Result := LoadBitmap(hInstance, PChar(lpBitmapID));
end;

function GetPropListAsArray(ATypeInfo: PTypeInfo; TypeKinds: TTypeKinds): TPropListArray;
var
  PropCount: Integer;
{  PropList: PPropList;
  PropCount, FSize, i: Integer;}
begin
  PropCount := GetPropList(ATypeInfo, tkProperties, nil);
//  FSize := PropCount * SizeOf(Pointer);
  SetLength(Result, PropCount);
  GetPropList(ATypeInfo, tkProperties, PPropList(Result));

{  GetMem(PropList, FSize);
  GetPropList(ATypeInfo, tkProperties, PropList);
  SetLength(Result, PropCount);
  for i := 0 to PropCount-1 do
    Result[i] := PropList[i];
}
end;

function HexToBinEh(Text: Pointer; var Buffer: TBytes; Count: Integer): Integer;
begin
  SetLength(Buffer, 0);
  SetLength(Buffer, Count div 2);
  Result := HexToBin(PAnsiChar(Text), PAnsiChar(Buffer), Count);
end;

procedure BinToHexEh(Buffer: TBytes; var Text: String; Count: Integer);
var
  AnsiText: AnsiString;
begin
  SetString(AnsiText, nil, Count*2);
  BinToHex(PAnsiChar(Buffer), PAnsiChar(AnsiText), Count);
  Text := String(AnsiText);
end;

procedure StreamWriteBytes(Stream: TStream; Buffer: TBytes);
begin
  Stream.Write(Pointer(Buffer)^, Length(Buffer));
end;

procedure StreamReadBytes(Stream: TStream; var Buffer: TBytes; Count: Integer);
var
  bs: AnsiString;
  i: Integer;
begin
  SetLength(Buffer, Count);
  SetString(bs, nil, Count);
  Stream.Read(Pointer(bs)^, Count);
  for i := 0 to Length(bs)-1 do
    Buffer[i] := Byte(bs[i+1]);
end;

{$IFNDEF EH_LIB_13}
function BytesOf(S: String): TBytes; overload;
var
  i: Integer;
begin
  SetLength(Result, Length(S));
  for i := 0 to Length(S)-1 do
    Result[i] := Byte(AnsiChar(S[i+1]));
end;
{$ENDIF}

{$IFNDEF EH_LIB_17}
function BytesOf(const Val: Pointer; const Len: integer): TBytes; overload;
begin
  SetLength(Result, Len);
  Move(PByte(Val)^, Result[0], Len);
end;
{$ENDIF}

function PropInfo_getPropType(APropInfo: PPropInfo): PTypeInfo;
begin
  Result := APropInfo^.PropType^;
end;

function PropInfo_getName(APropInfo: PPropInfo): String;
begin
  Result := String(APropInfo^.Name);
end;

function PropType_getKind(APropType: PTypeInfo): TTypeKind;
begin
  Result := APropType^.Kind;
end;

procedure VarArrayRedimEh(var A : Variant; HighBound: Integer);
begin
  VarArrayRedim(A, HighBound);
end;

function EmptyRect: TRect;
begin
  Result := Rect(0, 0, 0, 0);
end;

function IsRectEmptyEh(const Rect: TRect): Boolean;
begin
  Result := (Rect.Right <= Rect.Left) or (Rect.Bottom <= Rect.Top);
end;

{$IFNDEF EH_LIB_5}

function GetObjectProp(Instance: TObject; PropInfo: PPropInfo): TObject;
begin
  Result := TObject(GetOrdProp(Instance, PropInfo));
end;

function GetObjectPropClass(Instance: TObject; PropInfo: PPropInfo): TClass;
var
  TypeData: PTypeData;
begin
  TypeData := GetTypeData(PropInfo^.PropType^);
  if TypeData = nil then
    raise Exception.Create('SUnknownProperty');
//    raise EPropertyError.CreateRes(@SUnknownProperty);
  Result := TypeData^.ClassType;
end;

procedure SetObjectProp(Instance: TObject; PropInfo: PPropInfo;
  Value: TObject);
begin
  if (Value is GetObjectPropClass(Instance, PropInfo)) or
     (Value = nil) then
    SetOrdProp(Instance, PropInfo, Integer(Value));
end;

{$ENDIF}

type
  TPersistentCracker = class(TPersistent);
  TComponentCracker = class(TComponent);

function GetUltimateOwner(APersistent: TPersistent): TPersistent;
begin
  Result := TPersistentCracker(APersistent).GetOwner;
end;

{ TFilerAccess }

constructor TFilerAccess.Create(APersistent: TPersistent);
begin
  inherited Create;
  FPersistent := APersistent;
end;

procedure TFilerAccess.DefineProperties(AFiler: TFiler);
begin
  TPersistentCracker(FPersistent).DefineProperties(AFiler);
end;

function TFilerAccess.GetChildOwner: TComponent;
begin
  Result := TComponentCracker(FPersistent).GetChildOwner;
end;

function TFilerAccess.GetChildParent: TComponent;
begin
  Result := TComponentCracker(FPersistent).GetChildParent;
end;

procedure TFilerAccess.GetChildren(Proc: TGetChildProc; Root: TComponent);
begin
  TComponentCracker(FPersistent).GetChildren(Proc, Root);
end;

procedure TFilerAccess.SetAncestor(Value: Boolean);
begin
  TComponentCracker(FPersistent).SetAncestor(Value);
end;

procedure TFilerAccess.SetChildOrder(Child: TComponent; Order: Integer);
begin
  TComponentCracker(FPersistent).SetChildOrder(Child, Order);
end;

procedure TFilerAccess.Updated;
begin
  TComponentCracker(FPersistent).Updated;
end;

procedure TFilerAccess.Updating;
begin
  TComponentCracker(FPersistent).Updating;
end;

{ TMemoryStream }

constructor TMemoryStreamEh.Create;
begin
  inherited Create;
  HalfMemoryDelta := $1000;
end;

function TMemoryStreamEh.Realloc(var NewCapacity: Integer): Pointer;
var
  MemoryDelta: Integer;
begin
  MemoryDelta := HalfMemoryDelta * 2;
  if (NewCapacity > 0) and (NewCapacity <> Size) then
    NewCapacity := (NewCapacity + (MemoryDelta - 1)) and not (MemoryDelta - 1);
  Result := Memory;
  if NewCapacity <> Capacity then
  begin
    if NewCapacity = 0 then
    begin
{$IFDEF MSWINDOWS}
      GlobalFreePtr(Memory);
{$ELSE}
      FreeMem(Memory);
{$ENDIF}
      Result := nil;
    end else
    begin
{$IFDEF MSWINDOWS}
{$WARNINGS OFF}
      if Capacity = 0 then
        Result := GlobalAllocPtr(HeapAllocFlags, NewCapacity)
      else
        Result := GlobalReallocPtr(Memory, NewCapacity, HeapAllocFlags);
{$WARNINGS ON}
{$ELSE}
      if Capacity = 0 then
        GetMem(Result, NewCapacity)
      else
        ReallocMem(Result, NewCapacity);
{$ENDIF}
{$IFDEF EH_LIB_5}
      if Result = nil then raise EStreamError.CreateRes(@SMemoryStreamError);
{$ELSE}
      if Result = nil then raise EStreamError.Create(SMemoryStreamError);
{$ENDIF}
    end;
  end;
end;

{$IFNDEF EH_LIB_6}

{ TDragObjectEx }

procedure TDragObjectEx.BeforeDestruction;
begin
  // Do not call inherited here otherwise DragSave will be cleared and thus
  // we will be unable to automatically free the dragobject.
end;

{$ENDIF}

procedure DataVarCast(var Dest: Variant; const Source: Variant; AVarType: Integer);
//function DataVarCast(const Source: Variant; AVarType: Integer): Variant;
begin
  if VarIsNull(Source) then
    Dest := Null
  else if AVarType = varVariant then
    Dest := Source
  else
    VarCast(Dest, Source, AVarType);
end;

function VariantToRefObject(Value: Variant): TObject;
begin
  Result := TObject(Integer(Value));
end;

function RefObjectToVariant(Value: TObject): Variant;
begin
  Result := Integer(Value);
end;

procedure DataVarCastAsObject(var Dest: Variant; const Source: Variant);
begin
  DataVarCast(Dest, Source, varVariant);
end;

function WStrCopy(Dest: PWideChar; const Source: PWideChar): PWideChar;
var
  Src : PWideChar;
begin
  Result := Dest;
  Src := Source;
  while (Src^ <> #$00) do
  begin
    Dest^ := Src^;
    Inc(Src);
    Inc(Dest);
  end;
  Dest^ := #$00;
end;

{$RANGECHECKS OFF}
// Here and below all routins work without rangecheck

function ExplicitLongwordToLongInt(v: Longword): LongInt;
begin
  Result := LongInt(v);
end;

function VarToWideStr(const V: Variant): WideString;
begin
  if not VarIsNull(V) then
    Result := V
  else
    Result := '';
end;

function SafeGetMouseCursorPos: TPoint;
begin
  if not Windows.GetCursorPos(Result) then
    Result := Point(0, 0);
end;

{$IFDEF EH_LIB_6}
{$ELSE}
function RoundTo(const AValue: Double; const ADigit: TRoundToRange): Double;
var
  LFactor: Double;
begin
  LFactor := IntPower(10, ADigit);
  Result := Round(AValue / LFactor) * LFactor;
end;

type TVarType = Word;

function FindVarData(const V: Variant): PVarData;
begin
  Result := @TVarData(V);
  while Result.VType = varByRef or varVariant do
    Result := PVarData(Result.VPointer);
end;

function VarTypeIsStr(const AVarType: TVarType): Boolean;
begin
  Result := (AVarType = varOleStr) or (AVarType = varString);
end;

function VarIsStr(const V: Variant): Boolean;
begin
  Result := VarTypeIsStr(FindVarData(V)^.VType);
end;
{$ENDIF}

{$IFNDEF EH_LIB_16}

{ TCustomStyleServicesProxyEh }

function TCustomStyleServicesProxyEh.GetSystemColor(Color: TColor): TColor;
begin
  Result := Color;
end;

{$ENDIF}

procedure InitEhLibVCL;
begin
end;

procedure FinalEhLibVCL;
begin
{$IFNDEF EH_LIB_16}
  FreeAndNil(FStyleServices);
{$ENDIF}

{$IFNDEF EH_LIB_17}
  FreeAndNil(FFormatSettings);
{$ENDIF}
end;

initialization
  InitEhLibVCL;
finalization
  FinalEhLibVCL;
end.
