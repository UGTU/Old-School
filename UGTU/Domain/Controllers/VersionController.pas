unit VersionController;
  {#Author sergdev@ist.ugtu.net}
interface
type
  IVersion = interface
    function GetMajorVersion : Integer;
    function GetMinorVersion : Integer;
    function GetRelease : Integer;
    function GetBuild : Integer;
    function GetSize : Integer;
    function GetBuildInfo : string;
    function GetBuildTimeInfo : TDateTime;
    function GetVersionString :string;
    function GetState:integer;

    property MajorVersion : Integer read GetMajorVersion;
    property MinorVersion : Integer read GetMinorVersion;
    property Release      : Integer read GetRelease;
    property Build        : Integer read GetBuild;
    property BuildSize    : Integer read GetSize;
    property BuildTimeInfo : TDateTime read GetBuildTimeInfo;
    property BuildInfo    : string  read GetBuildInfo;
    property VersionString : string read GetVersionString;
    property State : integer read GetState;
  end;

  TVersionController = class
  private
    function GetCurrentVersion : IVersion;
    function GetServerVersion : IVersion;
    function GetUpdateNeeded:Boolean;
    // {v1 == v2 --> 0}
    // {v1 > v2 -- > 1}
    // {v1 < v2 -- > -1}
    function CompareVersions( const v1, v2 : IVersion):Integer;
    constructor Create;
  public
    class function GetInstance : TVersionController;
    property CurrentVersion : IVersion read GetCurrentVersion;
    property ServerVersion : IVersion read GetServerVersion;
    property UpdateNeeded:Boolean read GetUpdateNeeded;

    //  Загрузить версию с сервера
    //  OCL:
    //  Predefine: {CurrentVersion < ServerVersion}
    procedure UpdateVersion;
  end;

  const
    NOT_DEF = 'Не определено';
  type
    TNullVersion = class (TInterfacedObject, IVersion)
    private
      constructor Create;
    public
      class function GetInstance: TNullVersion;
    protected
      function GetMajorVersion : Integer;
      function GetMinorVersion : Integer;
      function GetRelease : Integer;
      function GetBuild : Integer;
      function GetSize : Integer;
      function GetBuildInfo : string;
      function GetBuildTimeInfo : TDateTime;
      function GetVersionString :string;
      function GetState:integer;
    end;

    type
    TAppVersion = class (TInterfacedObject, IVersion)
    private
    FMajor : integer;
    FMinor : integer;
    FRelease : integer;
    FBuild : integer;
    FSize : integer;
    FBuildInfo : string;
    FBuildTime : TDateTime;

      constructor Create;
    public
      procedure VersionRegister;
      class function GetInstance: TAppVersion;
    protected
      function GetMajorVersion : Integer;
      function GetMinorVersion : Integer;
      function GetRelease : Integer;
      function GetBuild : Integer;
      function GetSize : Integer;
      function GetBuildInfo : string;
      function GetBuildTimeInfo : TDateTime;
      function GetVersionString: String;
      function GetState:integer;
    end;

     type
    TServerVersion = class (TInterfacedObject, IVersion)
    private
    FMajor : integer;
    FMinor : integer;
    FRelease : integer;
    FBuild : integer;
    FSize : integer;
    FBuildInfo : string;
    FBuildTime : TDateTime;
    FState:integer;

      constructor Create;
    protected
      function GetMajorVersion : Integer;
      function GetMinorVersion : Integer;
      function GetRelease : Integer;
      function GetBuild : Integer;
      function GetSize : Integer;
      function GetBuildInfo : string;
      function GetBuildTimeInfo : TDateTime;
      function GetVersionString: string;
      function GetState:integer;

    public
      class function GetInstance: TServerVersion;

    end;

implementation
uses SysUtils, Dialogs,Wininet, shlobj, ShellAPI, DBCtrls,ComObj, uDm,
Variants, Classes, ComCtrls, AdoDB, DB, Windows, Forms, ApplicationController, ExceptionBase;



var
  NullVersioninstance : TNullVersion = nil;
  VersionControllerInstance : TVersionController = nil;
  AppVersionInstance : TAppVersion = nil;

{ TNullVersion }

constructor TNullVersion.Create;
begin
   inherited;
end;

function TNullVersion.GetBuild: Integer;
begin
  Result := -1;
end;

function TNullVersion.GetBuildInfo: string;
begin
  Result := NOT_DEF;
end;

function TNullVersion.GetBuildTimeInfo: TDateTime;
begin
  Result := 0;
end;

class function TNullVersion.GetInstance: TNullVersion;

begin
  if NullVersioninstance = nil then
    NullVersioninstance := TNullVersion.Create
  else
    NullVersioninstance._AddRef;

  Result := NullVersioninstance;
end;

function TNullVersion.GetMajorVersion: Integer;
begin
  Result := -1;
end;

function TNullVersion.GetMinorVersion: Integer;
begin
  Result := -1;
end;

function TNullVersion.GetRelease: Integer;
begin
  Result := -1;
end;

function TNullVersion.GetSize: Integer;
begin
  Result := -1;
end;
function TNullVersion.GetState: integer;
begin
  Result := -1;
end;

function TNullVersion.GetVersionString: string;
begin
  result := IntTostr(GetMajorVersion)+'.'+IntTostr(GetMinorVersion)+'.'+IntTostr(GetRelease)+'.'+IntTostr(GetBuild);
end;

{ TVersionController }

function TVersionController.CompareVersions(const v1, v2: IVersion): Integer;
var
  last, new: String;
begin
  if (v1 = nil) or (v2 = nil) then raise EApplicationException.Create('Ошибка в программе!',Exception.Create('Параметры v1 и v2 не могут быть nil.'));

   last := v1.GetVersionString;
   new  := v2.GetVersionString;
  if (last>new) then result := 1
  else
  if last=new then result:= 0
  else
  result := -1;
end;

constructor TVersionController.Create;
begin
  inherited;
end;

procedure TVersionController.UpdateVersion;
var
  hSession: HINTERNET;
  hService: HINTERNET;
  lpBuffer: array[0..1024 + 1] of Char;
  dwBytesRead: DWORD;
  aUrl: String;
  f: File;
  path: PITEMIDLIST;
  strPath: array[0..MAX_PATH] of char;
  SearchOptions: TLocateOptions;
  iniDir: String;
begin
  if (CompareVersions(CurrentVersion, ServerVersion) > -1) then
     raise EInvalidOp.Create('Установлена актуальная версия программы.')
     else
     begin

  aUrl:=TApplicationController.GetInstance.ApplicationSource;

  hSession := InternetOpen('ИС УГТУ', INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
  try
    if Assigned(hSession) then
    begin
      hService := InternetOpenUrl(hSession, PChar(aUrl), nil, 0, 0, 0);
      if Assigned(hService) then
        try
          iniDir := TApplicationController.GetInstance.IniDir+'setup.msi';
          AssignFile(f, iniDir);
          Rewrite(f);
          while True do
          begin
            dwBytesRead := 1024;
            InternetReadFile(hService, @lpBuffer, 1024, dwBytesRead);
            if dwBytesRead = 0 then break;
            lpBuffer[dwBytesRead] := #0;
            BlockWrite(f, lpBuffer, dwBytesRead div 128);
          end;
          CloseFile(f);
        finally
          InternetCloseHandle(hService);
        end;
    end; 
  finally
    InternetCloseHandle(hSession);
  end;
   
end;

end;

function TVersionController.GetCurrentVersion: IVersion;
begin
  Result := TAppVersion.GetInstance;
end;

class function TVersionController.GetInstance: TVersionController;
begin
  if VersionControllerInstance = nil then VersionControllerInstance := TVersionController.Create;
  Result := VersionControllerInstance;
end;

function TVersionController.GetServerVersion: IVersion;
begin
   Result := TServerVersion.GetInstance;
end;

function TVersionController.GetUpdateNeeded: Boolean;
begin
  // Stub!
  // Stop shouting on me! I'm not a stub... SERG

  if (CompareVersions(CurrentVersion, ServerVersion)=-1) then
  Result := true
  else
  Result := false;
end;

{ TVersion }



{ TAppVersion }

constructor TAppVersion.Create;
begin
inherited;
end;

function TAppVersion.GetBuild: Integer;
begin
 result:=FBuild;
end;

function TAppVersion.GetBuildInfo: string;
begin
 result:=FBuildInfo;
end;

function TAppVersion.GetBuildTimeInfo: TDateTime;
begin
 result:=FBuildTime;
end;

class function TAppVersion.GetInstance: TAppVersion;
type
  TVerInfo=packed record
    Nevazhno: array[0..47] of byte; // ненужные нам 48 байт
    Minor,Major,Build,Release: word; // а тут версия
  end;
var
info: pointer;
infosize: dword;
fileinfo: pvsfixedfileinfo;
fileinfosize: dword;
tmp: dword;
filename: string;
s:TResourceStream;
v:TVerInfo;
begin

  if AppVersionInstance = nil then
  begin
    AppVersionInstance := TAppVersion.Create;
    //filename := Application.ExeName;
   { filename := ParamStr(0);
   // get the size of the fileversioninformatioin
    infosize := getfileversioninfosize(pchar(filename), tmp);

  // if infosize = 0, then the file may not exist, or
  // it may not have file version information in it.
    if infosize = 0 then  }
    s:=TResourceStream.Create(HInstance,'#1',RT_VERSION); // достаём ресурс
    if s.Size=0 then
      raise EApplicationException.create('Ошибка в программе!',Exception.create('can''t get file version information for '
      + filename));
      // allocate memory for the file version information
   { getmem(info, infosize);        }
    try
      // get the information
     { getfileversioninfo(pchar(filename), 0, infosize, info);
      // query the information for the version
      verqueryvalue(info, '', pointer(fileinfo), fileinfosize);
      // now fill in the version information
      instance.FMajor := fileinfo.dwfileversionms shr 16;
      instance.FMinor := fileinfo.dwfileversionms and $ffff;
      instance.FRelease := fileinfo.dwfileversionls shr 16;
      instance.FBuild := fileinfo.dwfileversionls and $ffff;      }
      s.Read(v,SizeOf(v));
      AppVersionInstance.FMajor := v.Major;
      AppVersionInstance.FMinor := v.Minor;
      AppVersionInstance.FRelease := v.Release;
      AppVersionInstance.FBuild := v.Build;
      //Result:= IntToStr(major) + '.' + IntToStr(minor) + '.' + IntToStr(rls) + '.' + IntToStr(build);
    finally
    {  freemem(info, fileinfosize);         }
    end;
  end;

  AppVersionInstance._AddRef;
  //else
  result:=AppVersionInstance;


end;

function TAppVersion.GetMajorVersion: Integer;
begin
 result:=FMajor;
end;

function TAppVersion.GetMinorVersion: Integer;
begin
 result:=FMinor;
end;

function TAppVersion.GetRelease: Integer;
begin
 result:=FRelease;
end;

function TAppVersion.GetSize: Integer;
begin
 result:=FSize;
end;

function TAppVersion.GetState: integer;
begin
 result:=0;
end;

function TAppVersion.GetVersionString: String;
begin
 result := IntTostr(GetMajorVersion)+'.'+IntTostr(GetMinorVersion)+'.'+IntTostr(GetRelease)+'.'+IntTostr(GetBuild);
end;

procedure TAppVersion.VersionRegister;
begin

      self:=TAppVersion.GetInstance;
      dm.adospWriteVer.Active := false;
      with dm.adospWriteVer.Parameters do
      begin
        Items[1].Value := Fmajor;
        Items[2].Value := Fminor;
        Items[3].Value := FRelease;
        Items[4].Value := FBuild;
      end;
      try
        dm.adospWriteVer.ExecProc;
        dm.adospWriteVer.Active := false;
      except
      // Do nothing, do not even disturb user

      end;

end;

{ TServerVersion }

constructor TServerVersion.Create;
begin
inherited;
end;

function TServerVersion.GetBuild: Integer;
begin
Result := FBuild;
end;

function TServerVersion.GetBuildInfo: string;
begin
Result := FBuildInfo;
end;

function TServerVersion.GetBuildTimeInfo: TDateTime;
begin
Result := FBuildTime;
end;

class function TServerVersion.GetInstance: TServerVersion;
const
  instance : TServerVersion = nil;
var s:string;
begin
 if instance = nil then
 begin
  instance := TServerVersion.Create;
  dm.adodsVer.Active:=false;
  s:=TApplicationController.GetInstance.LoginName;
  dm.adodsVer.CommandText:='select * from GetVersionsForUser('''+s+''')';
  dm.adodsVer.Active := true;
  dm.adodsVer.First;
  if not (dm.adodsVer.Fields[0].Value=Null) then
  begin
    instance.FMajor:=dm.adodsVer.Fields[0].Value;
    instance.FMinor:=dm.adodsVer.Fields[1].Value;
    instance.FRelease:=dm.adodsVer.Fields[2].Value;
    instance.FBuild:=dm.adodsVer.Fields[3].Value;
    if dm.adodsVer.FieldByName('RegisterDate').Value<>Null then
    instance.FBuildTime:=dm.adodsVer.FieldByName('RegisterDate').Value;
    if dm.adodsVer.FieldByName('Filesize').Value<>Null then
    instance.FSize:=dm.adodsVer.FieldByName('Filesize').Value;
    if dm.adodsVer.FieldByName('Description').Value<>Null then
    instance.FBuildInfo:=dm.adodsVer.FieldByName('Description').Value;

    if dm.adodsVer.FieldByName('State').Value<>Null then
    instance.FState:=dm.adodsVer.FieldByName('State').Value
    else
    instance.FState:=0;

    while not dm.adodsVer.Eof do
    begin
      with dm.adodsVer do
      begin
        Next;
        if (FieldByName('State').Value = 1)and((IntTostr(Fields[0].Value)+'.'+IntTostr(Fields[1].Value)+'.'+IntTostr(Fields[2].Value)+'.'+IntTostr(Fields[3].Value))>TAppVersion.GetInstance.GetVersionString) then
      instance.FState:=1;
      end;
    end;
    

  end;
 end;
  instance._AddRef;
  result:=instance;

end;

function TServerVersion.GetMajorVersion: Integer;
begin
Result := FMajor;
end;

function TServerVersion.GetMinorVersion: Integer;
begin
Result := FMinor;
end;

function TServerVersion.GetRelease: Integer;
begin
Result := FRelease;
end;

function TServerVersion.GetSize: Integer;
begin
Result := FSize;
end;

function TServerVersion.GetState: integer;
begin
result := FState;
end;

function TServerVersion.GetVersionString: string;
begin
 result := IntTostr(GetMajorVersion)+'.'+IntTostr(GetMinorVersion)+'.'+IntTostr(GetRelease)+'.'+IntTostr(GetBuild);

end;

end.
