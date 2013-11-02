unit MapFile;
  {#Author fmarakasov@ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StringUtils;

type
  TMapFile = class(TObject)
  private
    FName:String;
    FOpen:Boolean;
    FSize:DWORD;
    FData:Pointer;

    { Private declarations }
  protected
    function Open:Boolean;virtual;
    function Close:Boolean;virtual;

    procedure SetOpen(const Value:Boolean);

    { Protected declarations }
  public
    constructor Create(FileName:String);overload;
    constructor Create(Sz:Cardinal);overload;
    destructor Destroy;override;

    property Data:Pointer read FData;
    property Size:DWORD read FSize;

    property Active:Boolean read FOpen write SetOpen;
    { Public declarations }
  published
    { Published declarations }
  end;

  TMapFileStream = class (TFileStream)
  private
    FData:Pointer;
  public
    constructor Create(const FileName: string; Mode: Word); overload;
    constructor Create(const FileName: string; Mode: Word; Rights: Cardinal); overload;
    destructor Destroy;override;

    property Memory:Pointer read FData write FData default nil;

    function Read(var Buffer; Count: Longint): Longint; override;
    function Seek(Offset: Longint; Origin: Word): Longint; overload; override;
    function Seek(const Offset: Int64; Origin: TSeekOrigin): Int64; overload;override;
    function Write(const Buffer; Count: Longint): Longint; override;
  end;

implementation

constructor TMapFile.Create(FileName:String);
begin
  inherited Create;
  FName:=FileName;
  FData:=nil;
  FOpen:=false;
end;

constructor TMapFile.Create(Sz:Cardinal);
begin
  inherited Create;
  FName:='';
  FSize:=Sz;
end;


destructor TMapFile.Destroy;
begin
  Close;
  inherited;
end;

function TMapFile.Open:Boolean;
var
  hFile:THandle;
  hMap:THandle;
  LastError:Cardinal;
  {PageAttrib,} MapAttrib:Integer;
begin
  hMap:=0;
  FData:=nil;
  Result:=false;
  hFile:=INVALID_HANDLE_VALUE;
//  PageAttrib:=PAGE_READONLY;
  MapAttrib:=FILE_MAP_READ;
  try
    if FName <> '' then
    begin
      hFile:=CreateFile(PChar(FName), GENERIC_READ, FILE_SHARE_READ, nil,
        OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL or FILE_FLAG_SEQUENTIAL_SCAN, 0);
      if (hFile = INVALID_HANDLE_VALUE) then  Exit;
      FSize:=GetFileSize(hFile, nil);
      if (FSize = INVALID_FILE_SIZE) then   Exit;
    end;
    // else
     //PageAttrib:=PAGE_READWRITE;


    hMap:=CreateFileMapping(hFile, nil, PAGE_READONLY, 0, FSize, nil);

    if (hMap = 0) then
      Exit;

    FData:=MapViewOfFile(hMap, MapAttrib, 0, 0, FSize);

    if FData = nil then
      Exit;

    Result:=true;
  finally
    FOpen:=Result;
    LastError:=GetLastError;
    CloseHandle(hMap);
    CloseHandle(hFile);

    if (not Result) then
    begin
      if (Assigned(FData)) then
        UnmapViewOfFile(FData);
      SetLastError(LastError);
      raise  Exception.Create(FormatedWin32Error(FName));
    end;
  end;
end;

function TMapFile.Close:Boolean;
begin
  if FOpen then
  begin
    Result:=UnMapViewOfFile(FData);
    FOpen:=false;
  end
  else Result:=false;

end;

procedure TMapFile.SetOpen(const Value:Boolean);
begin
  if Value then Open else Close;
end;


constructor TMapFileStream.Create(const FileName: string; Mode: Word);
begin
  inherited Create(FileName, Mode);
end;

constructor TMapFileStream.Create(const FileName: string; Mode: Word; Rights: Cardinal);
begin
  inherited Create(FileName, Mode, Rights);
end;

destructor TMapFileStream.Destroy;
begin
  inherited;
end;

function TMapFileStream.Read(var Buffer; Count: Longint): Longint;
begin
  Result:=0;
end;


function TMapFileStream.Seek(Offset: Longint; Origin: Word): Longint;
begin
  Result:=0;
end;

function TMapFileStream.Seek(const Offset: Int64; Origin: TSeekOrigin): Int64;
begin
  Result:=0;
end;

function TMapFileStream.Write(const Buffer; Count: Longint): Longint;
begin
  Result:=0;
end;

end.
