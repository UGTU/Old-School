unit VarFileUtils;
   {#Author fmarakasov@ugtu.net}
interface

uses
 Windows,
 SysUtils,
 Classes,
 Variants,
 Dialogs,
 StringUtils,
 FileUtils;

function CreateVariantByFile(FileName:String):OleVariant; overload;
procedure CreateVariantByFile(FileName:String; var Stream:OleVariant); overload;

function CreateFileByVariant(const FileName:String; var Stream:OleVariant):HResult;

function CreateVariantByStream(Stream:TStream):OleVariant;
function CreateStreamByVariant(var VarStream:OleVariant; Stream:TStream):TStream;

function Async_CreateFileByVariant(const FileName:String; var Stream:OleVariant;
  out hFile:THandle; out OrgSize:Cardinal):POverlapped;




implementation
uses
  MapFile,
  OsUtils;

function CreateVariantByFile(FileName:String):OleVariant;
var
  mf:TMapFile;
  pvBytes:Pointer;
begin
  mf:=nil;
  Result:=Unassigned;
  try
    mf:=TMapFile.Create(FileName);
    mf.Active:=true;
    try
      Result:=VarArrayCreate([1, mf.Size], varByte);
      pvBytes:=VarArrayLock(Result);

      if (Assigned(pvBytes)) then
        Move(mf.Data^, pvBytes^, mf.Size);
      //else
      //  raise Exception.Create('������ ������ � �������: ���������� ������ �� ���������������');
    finally
      VarArrayUnlock(Result);
    end;
  finally
    mf.Free;
  end;
end;

procedure CreateVariantByFile(FileName:String; var Stream:OleVariant);
var
  mf:TMapFile;
  pvBytes:Pointer;
begin
  mf:=nil;
  Stream:=Unassigned;
  try
    mf:=TMapFile.Create(FileName);
    mf.Active:=true;
    try
      Stream:=VarArrayCreate([1, mf.Size], varByte);
      pvBytes:=VarArrayLock(Stream);

      if (Assigned(pvBytes)) then
        Move(mf.Data^, pvBytes^, mf.Size);
      //else
      //  raise Exception.Create('������ ������ � �������: ���������� ������ �� ���������������');
    finally
      VarArrayUnlock(Stream);
    end;
  finally
    mf.Free;
  end;
end;


function Async_CreateFileByVariant(const FileName:String; var Stream:OleVariant;
  out hFile:THandle; out OrgSize:Cardinal):POverlapped;

var
  BytesPerSector,
  Count:Cardinal;
  pData:Pointer;
  fOK:Boolean;
begin
  fOK:=false;
  hFile:=INVALID_HANDLE_VALUE;
  Result:=nil;
  try
    // ������� ����� ������ � ������� � �������� ������
    // (������: OsUtils)
    BytesPerSector:=GetBytesPerSector(FileName);

    // ����� ������ � SafeArray
    // ���������� ��-� ������ ����� ��������� �������� �����
    // ���������� ��� �������������� ������:
    //   SetFilePointer(hFile, OrgSize, nil, FILE_BEGIN)
    //   SetEndOfFile(hFile);
    OrgSize:=VarArrayHighBound(Stream, 1);

    // ��������: ������ �� ������ ������ ������� ��������
    if ((OrgSize mod GetBytesPerPage) = 0) then
      // ��! ����� �� �������������� ������
      Count := OrgSize
    else
    begin
      // ���!
      // ���� �� ������������ ������ ������� ��� ������������ �� ��������
      // ������� �������
      Count:=(OrgSize+BytesPerSector-1) and not (BytesPerSector-1);
      VarArrayRedim(Stream, Count);
    end;

    // �������� ��������� �� ������, ��� �� ������� ������� � �����������
    // ���������� ����������� ��� ������ � ������...
    pData:=VarArrayLock(Stream);

    if ((Cardinal(pData) mod BytesPerSector) <> 0) then
      Exit;

    Result:=Async_CreateFileByBytes(pData, Count, FileName, hFile);

    if not Assigned(Result) then
      Exit;

    fOK:=true;

    finally
      if not fOK then
      begin
        CloseHandle(hFile);
        VarArrayUnlock(Stream);
        VarArrayRedim(Stream, OrgSize);
      end;
    end;
end;


function CreateFileByVariant(const FileName:String; var Stream:OleVariant):HResult;
var
  pData:Pointer;
  Count:DWORD;
  LastError:Cardinal;
begin
  // ��������� ������ �������
  Result:=E_FAIL;

  try
    // �������� ��������� �� ������ � ���� ������ � SafeArray
    pData:=VarArrayLock(Stream);
    Count:=VarArrayHighBound(Stream, 1);

    // ������ ����
    if not CreateFileByBytes(pData, Count, FileName) then
      Exit;

    Result:=S_OK;
  finally
    LastError:=GetLastError;

    // ������� �������
    VarArrayUnLock(Stream);
    VarClear(Stream);

    // ���������� ��������
    SetLastError(LastError);
  end;
end;


function CreateVariantByStream(Stream:TStream):OleVariant;
var
  pBytes:Pointer;
begin
  Result:=Unassigned;
  if Assigned(Stream) then
  begin
    Result:=VarArrayCreate([0, Stream.Size], varByte);
    try
      pBytes:=VarArrayLock(Result);
      if Assigned(pBytes) then
      begin
        Stream.Position:=0;
        Stream.Read(pBytes^, Stream.Size);
      end;
    finally
      VarArrayUnlock(Result);
    end;
  end;
end;

function CreateStreamByVariant(var VarStream:OleVariant; Stream:TStream):TStream;
var
  pBytes:Pointer;
begin
  Result:=Stream;
  if Assigned(Result) then
  try
    pBytes:=VarArrayLock(VarStream);
    if Assigned(pBytes) then
    begin
      if Assigned(Result) then
      begin
        Result.Write(pBytes, VarArrayHighBound(VarStream, 1));
      end;
    end;
  finally
     VarArrayUnlock(VarStream);
  end;
end;



end.
