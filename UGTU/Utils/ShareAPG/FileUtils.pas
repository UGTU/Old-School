unit FileUtils;
  {#Author fmarakasov@ugtu.net}
interface

uses
  Windows, Classes, SysUtils, ShellAPI;

const
   INVALID_SET_FILE_POINTER = $FFFFFFFF;

{

  interface functions

}

  // Создаёт список файлов, заданных маской, не осуществляя поиск в подкаталогах.
  procedure FileSearch({[out]} List:TStrings; const Mask:string);

  // Создаёт список файлов, заданных маской, осуществляя рекурсивный поиск в подкаталогах
  procedure RecursiveFileSearch({[out]} List:TStrings; const Mask:String);

  // Создаёт список файлов заданного каталога
  function CreateFileFolderList(const Folder:String):TStrings;

  // Удаляет заданную папку, независимо от того пустая она или нет.
  function DeletePath(const Path:String):Integer;

  // Создаёт дерево вложенных папок
  function CreatePath(const Path:String):Boolean;

  // Изменяет длину заданного файла.
  // полезна при работе с асинхронным доступом к файлам
  function SetFileSize(FileName:String; Size:Cardinal; HighPart:PCardinal = nil):Boolean;

  // Записывает данные в файл. Операция синхронная
  function CreateFileByBytes(Bytes:Pointer; Count:Cardinal; FileName:String):Boolean;

  // Записывает данные в файл. Асинхронная операция
  // После окончания записи установите длину файла равной Count.
  // Если Count кратен длине сектора, то делать это не обязательно
  function Async_CreateFileByBytes(Bytes:Pointer; Count:Cardinal; FileName:String; out hFile:THandle):POverlapped;


implementation
uses
  OsUtils;

function IsChildDir(const ffd: _WIN32_FIND_DATA):Boolean;
begin
  Result:= ((ffd.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) = FILE_ATTRIBUTE_DIRECTORY) and (
           (StrComp(ffd.cFileName, '.') = 0) or (StrComp(ffd.cFileName, '..') = 0));
end;

function IsDir(const ffd: _WIN32_FIND_DATA):Boolean;
begin
  Result:= ((ffd.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) = FILE_ATTRIBUTE_DIRECTORY) and (
           (StrComp(ffd.cFileName, '.') <> 0) and (StrComp(ffd.cFileName, '..') <> 0));
end;

procedure AddFFDToList(List:TStrings; const Folder:string; const ffd: _WIN32_FIND_DATA);
begin
  if Assigned(List) then
    if not (IsDir(ffd) or IsChildDir(ffd)) then
       List.AddObject(Folder+ffd.cFileName, TObject(@ffd));
end;


procedure FileSearch(List:TStrings; const Mask:String);
var
  ffd: _WIN32_FIND_DATA;
  hFind:THandle;
  Folder:string;
begin
  hFind:=FindFirstFile(PChar(Mask), ffd);

  Folder:=ExtractFilePath(Mask);

  if hFind <> INVALID_HANDLE_VALUE then
  begin
    try
      AddFFDToList(List, Folder, ffd);
      while FindNextFile(hFind, ffd) do
         AddFFDToList(List, Folder, ffd);
    finally
      Windows.FindClose(hFind);
    end;
  end;

end;


procedure RecursiveFileSearch(List:TStrings; const Mask:String);
var
  ffd: _WIN32_FIND_DATA;
  hFind:THandle;
  Path:String;
  FolderName:string;
begin
  if not Assigned(List) then Exit;
  FolderName:=ExtractFilePath(Mask);
  Path:=FolderName+'*.*';
  hFind:=FindFirstFile(PChar(Path), ffd);
  if hFind <> INVALID_HANDLE_VALUE then
  begin
    try
      if IsDir(ffd) then
      begin
        Path:=FolderName+ffd.cFileName+'\'+ExtractFileName(Mask);
        RecursiveFileSearch(List, Path);
      end;

      FileSearch(List, Mask);

      while FindNextFile(hFind, ffd) do
      begin
        if IsDir(ffd) then
        begin
          Path:=FolderName+ffd.cFileName+'\'+ExtractFileName(Mask);
          RecursiveFileSearch(List, Path);
        end;
      end;
    finally
      Windows.FindClose(hFind);
    end;
  end;
end;

// Ищет все файлы, осуществляя рекурсивный поиск в подкаталогах.
// Оптимизирована для работы с функцией CreateFileFolderList.

procedure RecursiveFileSearch2(List:TStrings; const Mask:String);
var
  ffd: _WIN32_FIND_DATA;
  hFind:THandle;
  Path:String;
  FolderName:string;
begin

  if not Assigned(List) then Exit;

  FolderName:=ExtractFilePath(Mask);
  hFind:=FindFirstFile(PChar(Mask), ffd);
  if hFind <> INVALID_HANDLE_VALUE then
  begin
    try
     if ((ffd.dwFileAttributes  and  FILE_ATTRIBUTE_DIRECTORY) <> 0) then
     begin
       if not IsChildDir(ffd) then
       begin
         Path:=FolderName+ffd.cFileName+'\'+ExtractFileName(Mask);
         RecursiveFileSearch2(List, PChar(Path));
       end;
     end
     else
       List.Add(FolderName+ffd.cFileName);

     while FindNextFile(hFind, ffd) do
     begin
     if ((ffd.dwFileAttributes  and  FILE_ATTRIBUTE_DIRECTORY) <> 0) then
     begin
       if not IsChildDir(ffd) then
       begin
         Path:=FolderName+ffd.cFileName+'\'+ExtractFileName(Mask);
         RecursiveFileSearch2(List, PChar(Path));
       end;
     end
     else
       List.Add(FolderName+ffd.cFileName);
     end;
    finally
      Windows.FindClose(hFind);
    end;
  end;
end;



function CreateFileFolderList(const Folder:String):TStrings;
begin
  Result:=TStringList.Create;
  if Assigned (Result) and (Length(Folder) > 0) then
     RecursiveFileSearch2(Result, Folder+'\*.*');
end;


function CreatePath(const Path:String):Boolean;
var
  Folders:TStrings;
  Tmp:String;
  i, j, l:Integer;
  Flag:Boolean;
begin
  Result:=true;
  Folders:=TStringList.Create;
  if Assigned(Folders) then
  begin
    try
    j:=2;
    Flag:=true;
    while Flag do
    begin
      l:=0;
      i:=1;
      while (l < j) do
      begin
        while (Path[i] <> '\') and (i < length(Path)) do inc(i);
        inc(i);
        inc(l);
      end;
      if (i < Length(Path)) then
      begin
        Tmp:=Copy(Path, 1, i-1);
        Folders.Add(Tmp);
        inc(j);
      end
      else
      begin
        Flag:=false;
        Folders.Add(Path);
      end;
    end;

    for i:=0 to Folders.Count - 1 do
    begin
      if not CreateDirectory(PChar(Folders.Strings[i]), nil) then
         Result:=false;
    end;
    finally
      if Assigned(Folders) then Folders.Free;
    end;

  end;

end;

function DeletePath(const Path:String):Integer;
var
  shs:TSHFileOpStruct;
begin
  shs.Wnd:=0;
  shs.wFunc:=FO_DELETE;
  shs.pFrom:=PChar(Path+#0);
  shs.pTo:=nil;
  shs.fFlags:=FOF_NOCONFIRMATION or FOF_NOERRORUI or FOF_SILENT ;
  shs.fAnyOperationsAborted:=false;
  shs.hNameMappings:=nil;
  shs.lpszProgressTitle:=nil;
  Result:=ShFileOperation(shs);
end;

function SetFileSize(FileName:String; Size:Cardinal; HighPart:PCardinal):Boolean;
var
  hFile:THandle;
  LastError:Cardinal;
begin
  Result:=false;

  hFile:=CreateFile(PChar(FileName), GENERIC_WRITE, 0, nil,
    OPEN_EXISTING, FILE_FLAG_SEQUENTIAL_SCAN, 0);
  try
    if hFile = INVALID_HANDLE_VALUE then exit;

    if SetFilePointer(hFile, Size, HighPart, FILE_BEGIN) = $FFFFFFFF then exit;

    if not SetEndOfFile(hFile) then Exit;

    Result:=true;
  finally
    LastError:=GetLastError;
    CloseHandle(hFile);
    SetLastError(LastError);
  end;
end;

// Записывает данные в файл. Операция синхронная.
function CreateFileByBytes(Bytes:Pointer; Count:Cardinal; FileName:String):Boolean;
var
  hFile:THandle;
  BytesWritten:Cardinal;
  fDelFile:Boolean;
  LastError:Cardinal;
begin
  Result:=false;
  fDelFile:=false;

  if not Assigned(Bytes) or (Count = 0) or (FileName='') then
    Exit;

  hFile:=CreateFile(PChar(FileName), GENERIC_WRITE, FILE_SHARE_READ, nil,
    CREATE_NEW, FILE_FLAG_SEQUENTIAL_SCAN, 0);
  if hFile = INVALID_HANDLE_VALUE then
    Exit;

  try
    // Файл открыт. Но если будут ошибки надо его удалить
    fDelFile:=true;

    // Устанавливаем длину файла, равную Count
    if SetFilePointer(hFile, Count, nil, FILE_BEGIN) = INVALID_SET_FILE_POINTER then
      Exit;

    if not SetEndOfFile(hFile) then
      Exit;

    // Переходим опять на начало файла
    if SetFilePointer(hFile, 0, nil, FILE_BEGIN) = INVALID_SET_FILE_POINTER then
      Exit;

    // Пишем данные
    if not WriteFile(hFile, Bytes^, Count, BytesWritten, nil) then
      Exit;

    // Прошли все операции. Устанавливаем флаг удачи :)
    Result:=true;
  finally
    LastError:=GetLastError;
    CloseHandle(hFile);
    if not Result then
      if fDelFile then DeleteFile(FileName);
    SetLastError(LastError);
  end;
end;

// Записывает данные в файл. Асинхронная операция
// Адрес должен быть кратным размеру сектора. (VirtualAlloc -- надёжное средство)
// После окончания записи установите нужную длину файла.
// Result:
//   Указатель на OVERLAPPED в случае удачи.
//   Nil в случае ошибки. Расширенная информация: GetLastError

function Async_CreateFileByBytes(Bytes:Pointer; Count:Cardinal; FileName:String; out hFile:THandle):POverlapped;
var
  BytesWritten:Cardinal;
  LastError:Cardinal;
  fDelFile:Boolean;
  fOK:Boolean;
begin
  Result:=nil;

  if not Assigned(Bytes) or (Count = 0) or (FileName='') then
    Exit;

  fDelFile:=false; // Удалять ли мусор в случае сбоя
  fOK:=false; // Все необходимые процедуры не выполнены

  // Новая структура. За удаление отвечает вызывающая процедура
  // Удаление: Dispose
  Result:=New(POverlapped);

  // Пишем с начала файла
  Result^.Internal:=0;
  Result^.InternalHigh:=0;
  Result^.Offset:=0;
  Result^.OffsetHigh:=0;
  Result^.hEvent:=0;


  // Откроем файл без буфферизации. Это гарантирует асинхронную операцию.
  hFile:=CreateFile(PChar(FileName), GENERIC_WRITE, 0, nil,
    CREATE_NEW, FILE_FLAG_OVERLAPPED or FILE_FLAG_NO_BUFFERING, 0);

  try
    // Если файл не открылся, то выход...
    if (hFile = INVALID_HANDLE_VALUE) then
      Exit;

    // Файл открыт. Но если будут ошибки надо его удалить
    fDelFile:=true;


    // Устанавливаем длину файла, равную Count
    // После завершения операции записи следует воспользоваться
    // ф-й SetFileSize(OrgSize) из  модуля FileUtils.
    if (SetFilePointer(hFile, Count, nil, FILE_BEGIN) = INVALID_HANDLE_VALUE) then
      Exit;

    if not SetEndOfFile(hFile) then
      Exit;

    //
    //  Переходить на начало файла не надо, т.к. всё необходиое содержится в
    //  структуре TOvelapped (Result)
    //

    // Даём запрос на запись...
    if not WriteFile(hFile, Bytes^, Count, BytesWritten, Result)  then
      // Если функция не отработала, то может быть, пошла асинхронная операция...
      if (GetLastError <> ERROR_IO_PENDING) then
        // Нет! ошибка где-то в другом измерении...
        Exit
      else
        OutputDebugString('!!! Async file operation !!!');
    // Всё отработало удачно
    fOK:=true;

  finally
    // Если были ошибки при записи...
    if not fOK then
    begin
      // Запомним результат поледней операции
      LastError:=GetLastError();

      // Ели надо удалить мусор, то...
      if   fDelFile then
      begin
        CloseHandle(hFile);
        DeleteFile(FileName);
      end;

      Dispose(Result);
      Result:=nil;

      // Востанавливаем результат
      SetLastError(LastError);
    end;
  end;
end;

end.
