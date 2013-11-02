unit FileCls;
   {#Author fmarakasov@ugtu.net}
interface
uses
  Windows, SysUtils, classes;
const
  // Не определено в Windows.pas (по крайней мере до Delphi 6 включительно)
  // Ошибка функции SetFilePointer
  INVALID_SET_FILE_POINTER = $FFFFFFF;
type

  // Атрибуты и флаги создания файла
  TFlagsAndAttributes = (faArchive,  faHidden, faNormal,
    faOffline, faReadOnly, faSystem, faTemorary, faWriteThrough, faOverlapped,
    faNoBuffering, faRandomAccess, faSequentalScan, faDeleteOnCLose, faBackup, faPosix);

  // Набор атрибутов и флагов файла
  TFlagsAndAttributesSet = set of TFlagsAndAttributes;

  // Флаги запрашиваемого доступа к файлу
  TDesiredAccess = (daQuery, daWrite, daRead);
  TDesiredAccessSet = set of TDesiredAccess;

  // Флаги разделения файла
  TShareMode = (smShareDelete, smShareRead, smShareWrite);
  TShareModeSet = set of TShareMode;

  // Флаги открытия файла
  TCreationDisposition = (cdCreateNew, cdCreateAlways, cdOpenExisting, cdOpenAlways,
    cdTurnateExisting);

  // Тип файла
  TFileType = (ftUnknown, ftDisk, ftChar, ftPipe);

  // Метод перемещения позиции для SetFilePointer
  TMoveMethod = (mmBegin, mmCurrent, mmEnd);

  // Обобщённый класс "файл" с недоступным конструктором
  // Предназначен только для наследования
  // классами TFile и TAsyncFile для синхронного и асинхронного доступа к файлу
  // соответственно.
  TCustomFile = class (TPersistent)
  private
     FName:String;
     FFile:THandle;
     FOVR:TOverlapped;
     FFlags:TFlagsAndAttributesSet;
     FAccess:TDesiredAccessSet;
     FShare:TShareModeSet;
     FCreation:TCreationDisposition;
     function GetFileSize:int64;
     function GetFileAttributes:TFlagsAndAttributesSet;
     function GetFileInfo:BY_HANDLE_FILE_INFORMATION;
     function GetFileType:TFileType;
     function GetCreationTime:TDateTime;
     function GetLastAccessTime:TDateTime;
     function GetLastWriteTime:TDateTime;
     function GetVolumeSerNum:Cardinal;
     function NumberOfLinks:Cardinal;
     function GetFileIndex:int64;
  protected
     constructor Create(_FileName:string; DesiredAccess:TDesiredAccessSet = [daRead, daWrite];
       ShareMode:TShareModeSet = []; CreationDisposition:TCreationDisposition = cdCreateNew;
       FlagsAndAttributes:TFlagsAndAttributesSet = []);overload;


     // Отменить оперции ввода/вывода
     function CancelIo:boolean;

     // Ожидание окончания асинхронной операции
     procedure GetOverlappedResult(out BytesTrasferred:Cardinal; fWait:Boolean);
  public
     constructor Create;overload;
     destructor Destroy;override;

     // TPersisten implementation
     procedure Assign(Source: TPersistent); override;
     procedure AssignTo(Dest: TPersistent); override;


     // Читает из файла в Buffer число байт BytesToRead, записывает реальное кол-во
     // байт в BytesOfRead.
     // Для асинхронных операций (если установлен флаг faOverlapped) передать
     // в Offset смещение внутри файла для задания позиции чтения.
     function ReadFile(Buffer:Pointer; BytesToRead:Cardinal; out BytesOfRead:Cardinal; Offset:int64=0 ):boolean;virtual;

     // Пишеит в файл из Buffer число байт BytesToWrite, записывает реальное кол-во
     // байт в BytesOfWritten.
     // Для асинхронных операций (если установлен флаг faOverlapped) передать
     // в Offset смещение внутри файла для задания позиции записи.
     function WriteFile(Buffer:Pointer; BytesToWrite:Cardinal; out BytesOfWritten:Cardinal; Offset:int64=0 ):boolean;virtual;

     // Перемещает текущую позицию в файле
     procedure SetFilePointer(Offset:int64; Method:TMoveMethod);

     // Установка конца файла
     procedure SetEndOfFile;

     // Сброс буферов
     procedure FlushFileBuffers;

     // Блокировка файла начиная с позиции Offset число байт BytesToLock
     procedure Lock(LockOffset, BytesToLock:int64);

     // Разблокировка файла начиная с позиции Offset число байт BytesToLock
     procedure Unlock(LockOffset, BytesToLock:int64);

     // Получить атрибуты файла
     property FileAttributes:TFlagsAndAttributesSet read GetFileAttributes;

     // Время создания файла
     property FileCreationTime:TDateTime read GetCreationTime;

     // Время последнего доступа
     property FileLastAccessTime:TDateTime read GetLastAccessTime;

     // Время модификации
     property FileLastWriteTime:TDateTime read GetLastWriteTime;

     // Серийный номемр тома
     property FileVolumeSerialNumber:Cardinal read GetVolumeSerNum;

     // Число связей с файлом
     property FileNumberOfLinks:Cardinal read NumberOfLinks;

     // Индекс файла
     property FileIndex:int64 read GetFileIndex;


     // Размер файла
     property FileSize:int64 read GetFileSize;

     // Тип файла
     property FileType:TFileType read GetFileType;

     // Путь к файлу
     property FileName:String read FName;

     // Описатель файла
     property Handle:THandle read FFile;

  end;

  // Класс "Файл" для синхронных операций
  TFile = class (TCustomFile)
  public
    constructor Create(_FileName:string; DesiredAccess:TDesiredAccessSet = [daRead, daWrite];
       ShareMode:TShareModeSet = []; CreationDisposition:TCreationDisposition = cdCreateNew;
       FlagsAndAttributes:TFlagsAndAttributesSet = []);overload;
    constructor Create;overload;
  end;

  // Класс "файл" для асинхронных операций
  TAsyncFile = class (TCustomFile)
  public
    constructor Create(_FileName:string; DesiredAccess:TDesiredAccessSet = [daRead, daWrite];
       ShareMode:TShareModeSet = []; CreationDisposition:TCreationDisposition = cdCreateNew;
       FlagsAndAttributes:TFlagsAndAttributesSet = [faOverlapped]);overload;


    function CancelIo:boolean;
    procedure GetOverlappedResult(out BytesTrasferred:Cardinal; fWait:Boolean);
  end;


implementation
uses
  Dialogs;

const Flags:array[0..14] of Cardinal =
   (FILE_ATTRIBUTE_ARCHIVE, FILE_ATTRIBUTE_HIDDEN,
    FILE_ATTRIBUTE_NORMAL, FILE_ATTRIBUTE_OFFLINE,
    FILE_ATTRIBUTE_READONLY, FILE_ATTRIBUTE_SYSTEM, FILE_ATTRIBUTE_TEMPORARY,
    FILE_FLAG_WRITE_THROUGH, FILE_FLAG_OVERLAPPED, FILE_FLAG_NO_BUFFERING,
    FILE_FLAG_RANDOM_ACCESS, FILE_FLAG_SEQUENTIAL_SCAN, FILE_FLAG_DELETE_ON_CLOSE,
    FILE_FLAG_BACKUP_SEMANTICS, FILE_FLAG_POSIX_SEMANTICS);

const Access:array[0..2] of Cardinal =
   (0, GENERIC_WRITE, GENERIC_READ);

const Share:array[0..2] of Cardinal =
   (FILE_SHARE_DELETE, FILE_SHARE_READ, FILE_SHARE_WRITE);

const Creation:array[0..4] of Cardinal =
   (CREATE_NEW, CREATE_ALWAYS, OPEN_EXISTING, OPEN_ALWAYS, TRUNCATE_EXISTING);

const FileTypes:array[0..3] of Cardinal =
   (FILE_TYPE_UNKNOWN, FILE_TYPE_DISK, FILE_TYPE_CHAR, FILE_TYPE_PIPE);

const MoveMethods:array[0..2] of Cardinal =
   (FILE_BEGIN, FILE_CURRENT, FILE_END);


constructor TCustomFile.Create(_FileName:string; DesiredAccess:TDesiredAccessSet;
       ShareMode:TShareModeSet; CreationDisposition:TCreationDisposition;
       FlagsAndAttributes:TFlagsAndAttributesSet);
var
  _Flags, _Share, _Access, _Creation:Cardinal;

  f:TFlagsAndAttributes;
  s:TShareMode;
  a:TDesiredAccess;
begin
  _Flags:=0; _Share:=0; _Access:=0;
  FFlags:=FlagsAndAttributes;
  FShare:=ShareMode; FAccess:=DesiredAccess;
  FCreation:=CreationDisposition;


  // Setting AccessAndFlags
  for f:=Low(TFlagsAndAttributes) to High(TFlagsAndAttributes) do
    if  f in FlagsAndAttributes then
      _Flags:=_Flags or Flags[Ord(f)];

  // Setting Share
  for s:=Low(TShareMode) to High(TShareMode) do
    if  s in ShareMode then
      _Share:=_Share or Share[Ord(s)];

  // Setting Access
  for a:=Low(TDesiredAccess) to High(TDesiredAccess) do
    if  a in DesiredAccess then
      _Access:=_Access or Access[Ord(a)];

  _Creation:=Creation[Ord(CreationDisposition)];

  FFile:=CreateFile(PChar(_FileName), _Access, _Share, nil, _Creation, _Flags, 0);
  if (FFile = INVALID_HANDLE_VALUE) then RaiseLastOSError;

  FName:=_FileName;
end;

constructor TCustomFile.Create;
begin
  inherited;
end;

destructor TCustomFile.Destroy;
begin
  CloseHandle(FFile);
end;


procedure TCustomFile.Assign(Source: TPersistent);
var
  Src:TCustomFile;
  FHandle:THandle;
begin
  Src:=(Source as TCustomFile);
  if (DuplicateHandle(GetCurrentProcess(), Src.Handle,GetCurrentProcess(),
  @FHandle, 0, FALSE, DUPLICATE_SAME_ACCESS)) then
  begin
    CloseHandle(FFile);
    FFile:=FHandle;
  end
  else RaiseLastOSError;
end;

procedure TCustomFile.AssignTo(Dest: TPersistent);
var
  Dst:TCustomFile;
  FHandle:THandle;
begin
  Dst:=(Dest as TCustomFile);
  if (DuplicateHandle(GetCurrentProcess(), Handle,GetCurrentProcess(),
  @FHandle, 0, FALSE, DUPLICATE_SAME_ACCESS)) then
  begin
    CloseHandle(Dst.Handle);
    Dst.FFile:=FHandle;
  end
  else RaiseLastOSError;
end;



function TCustomFile.CancelIo:boolean;
begin
  Result:=Windows.CancelIo(FFile);
end;

function TCustomFile.GetFileSize:int64;
var
  FLow, FHigh:Cardinal;
begin
  FLow:=Windows.GetFileSize(FFile, Pointer(@FHigh));
  Result:=FHigh;
  Result:=Result shl 32;
  Result:=Result+FLow;
end;

function TCustomFile.GetFileInfo:BY_HANDLE_FILE_INFORMATION;
begin
  if ( not GetFileInformationByHandle(FFile, Result)) then
    RaiseLastOSError;
end;

function TCustomFile.GetFileAttributes:TFlagsAndAttributesSet;
var
  fl:Cardinal;
  fc:TFlagsAndAttributes;
  i:Integer;
begin
  Result:=[];
  fc:=Low(TFlagsAndAttributes);
  fl:=GetFileInfo.dwFileAttributes;
  for i:=Low(Flags) to High(Flags) do
  begin
    if ((Flags[i] and fl) > 0) then
      Result:=Result+[fc];
    inc(fc);
  end;
end;

function TCustomFile.GetFileType:TFileType;
var
  FType:Cardinal;
  i:Integer;
begin
  Result:=ftUnknown;
  FType:=Windows.GetFileType(FFile);
  for i:=Low(FileTypes) to High(FileTypes) do
  begin
    if (FType = FileTypes[i]) then Exit;
    inc(Result);
  end;
end;

function GetLocalSystemTime(ft:TFileTime):TSystemTime;
begin
  FileTimeToLocalFileTime(ft, ft);
  FileTimeToSystemTime(ft, Result);
end;

function TCustomFile.GetCreationTime:TDateTime;
begin
  Result:=SystemTimeToDateTime(GetLocalSystemTime(GetFileInfo.ftCreationTime));
end;

function TCustomFile.GetLastAccessTime:TDateTime;
begin
  Result:=SystemTimeToDateTime(GetLocalSystemTime(GetFileInfo.ftLastAccessTime));
end;

function TCustomFile.GetLastWriteTime:TDateTime;
begin
  Result:=SystemTimeToDateTime(GetLocalSystemTime(GetFileInfo.ftLastWriteTime));
end;

function TCustomFile.GetVolumeSerNum:Cardinal;
begin
  Result:=GetFileInfo.dwVolumeSerialNumber;
end;

function TCustomFile.NumberOfLinks:Cardinal;
begin
  Result:=GetFileInfo.nNumberOfLinks;
end;

function TCustomFile.GetFileIndex:int64;
var
  bhfi:BY_HANDLE_FILE_INFORMATION;
begin
  bhfi:=GetFileInfo;
  Result:=bhfi.nFileSizeHigh;
  Result:=Result shl 32;
  Result:=Result+bhfi.nFileIndexLow;
end;



procedure TCustomFile.Lock(LockOffset, BytesToLock:int64);
begin
  if not (LockFile(FFile, LockOffset and $FFFFFFF, LockOffset shr 32,
    BytesToLock and $FFFFFFF, BytesToLock shr 32)) then RaiseLastOsError;
end;

procedure TCustomFile.Unlock(LockOffset, BytesToLock:int64);
begin
  if not (UnlockFile(FFile, LockOffset and $FFFFFFF, LockOffset shr 32,
    BytesToLock and $FFFFFFF, BytesToLock shr 32)) then RaiseLastOsError;
end;

function TCustomFile.ReadFile(Buffer:Pointer; BytesToRead:Cardinal; out BytesOfRead:Cardinal; Offset:int64):boolean;
begin
  if (faOverlapped in FFlags) then
  begin
    ZeroMemory(@FOvr, sizeof(FOvr));
    FOvr.Offset:=Offset and $FFFFFFF;
    FOvr.OffsetHigh:=Offset shr 32;
    Result:=Windows.ReadFile(FFile, Buffer^, BytesToRead, BytesOfRead, @FOvr);
  end
  else
    Result:=Windows.ReadFile(FFile, Buffer^, BytesToRead, BytesOfRead, nil);

end;

function TCustomFile.WriteFile(Buffer:Pointer; BytesToWrite:Cardinal; out BytesOfWritten:Cardinal;Offset:int64):boolean;
begin
  if (faOverlapped in FFlags) then
  begin
    ZeroMemory(@FOvr, sizeof(FOvr));
    FOvr.Offset:=Offset and $FFFFFFF;
    FOvr.OffsetHigh:=Offset shr 32;
    Result:=Windows.WriteFile(FFile, Buffer^, BytesToWrite, BytesOfWritten, @FOvr);
  end
  else
    Result:=Windows.WriteFile(FFile, Buffer^, BytesToWrite, BytesOfWritten, nil);
end;

procedure TCustomFile.SetFilePointer(Offset:int64; Method:TMoveMethod);
var
  MoveHigh:Cardinal;
begin
  MoveHigh:=Offset shr 32;
  if (Windows.SetFilePointer(FFile, Offset and $FFFFFFF,
    @MoveHigh, MoveMethods[Ord(Method)]) = INVALID_SET_FILE_POINTER) then
      RaiseLastOSError;
end;

procedure TCustomFile.SetEndOfFile;
begin
  if (not Windows.SetEndOfFile(FFile)) then
    RaiseLastOSError;
end;

procedure TCustomFile.FlushFileBuffers;
begin
  if (not Windows.FlushFileBuffers(FFile)) then
    RaiseLastOSError;

end;

procedure TCustomFile.GetOverlappedResult(out BytesTrasferred:Cardinal; fWait:Boolean);
begin
  if ( not Windows.GetOverlappedResult(FFile, FOvr, BytesTrasferred, fWait )) then
    RaiseLastOSError;
end;

constructor TFile.Create(_FileName:string; DesiredAccess:TDesiredAccessSet = [daRead, daWrite];
       ShareMode:TShareModeSet = []; CreationDisposition:TCreationDisposition = cdCreateNew;
       FlagsAndAttributes:TFlagsAndAttributesSet = []);
begin
  FlagsAndAttributes:=FlagsAndAttributes-[faOverlapped];
  inherited Create(_FileName, DesiredAccess, ShareMode, CreationDisposition, FlagsAndAttributes);
end;

constructor TFile.Create;
begin
  inherited;
end;


constructor TAsyncFile.Create(_FileName:string; DesiredAccess:TDesiredAccessSet = [daRead, daWrite];
       ShareMode:TShareModeSet = []; CreationDisposition:TCreationDisposition = cdCreateNew;
       FlagsAndAttributes:TFlagsAndAttributesSet = [faOverlapped]);
begin
  FlagsAndAttributes:=FlagsAndAttributes+[faOverlapped];
  inherited Create(_FileName, DesiredAccess, ShareMode, CreationDisposition, FlagsAndAttributes);
end;

procedure TAsyncFile.GetOverlappedResult(out BytesTrasferred:Cardinal; fWait:Boolean);
begin
  inherited;
end;

function TAsyncFile.CancelIo:boolean;
begin
  Result:=inherited CancelIo;
end;



end.
