unit OleUtils;
  {#Author fmarakasov@ugtu.net}
interface
uses
  Windows, classes, ActiveX, axctrls, SysUtils, ComObj;

type

  //PStatStg

  TSTATList = class(TList)
  protected
    function GetItem(Index:Integer):PStatStg;
    procedure PutItem(Index:Integer; Item:PStatStg);
  public
    procedure Clear;override;
    function Add(Item: PStatStg): Integer;
    property Itmes[Index:Integer]:PStatStg read GetItem write PutItem; default;
  end;

  TOleStorage = class
  private
    FStorage:IStorage;
    FStreamList:TSTATList;
    FStorageList:TSTATList;

    FOpned:TInterfaceList;

    procedure ReadStorage;

  protected
    function GetStream(Index:Integer; Mode:DWord):TOleStream;
    function GetStorage(Index:Integer; Mode:DWord):TOleStorage;
  public
    constructor Create(const Storage:IStorage);
    destructor Destroy;override;



    function AddStorage(const Name:String; const Mode:DWord):TOleStorage;
    function AddStream(const Name:String; const Mode:DWord):TOleStream;

    property Stream[Index:Integer; Mode:DWORD]:TOleStream read GetStream;
    property Storage[Index:Integer;Mode:DWORD]:TOleStorage read GetStorage;
    property StorageImp:IStorage read FStorage;

    property Streams:TSTATList read FStreamList;
    property Storages:TSTATList read FStorageList;

  end;

implementation

function TSTATList.GetItem(Index:Integer):PStatStg;
begin
  Result:=PStatStg(inherited Get(Index));
end;

procedure TSTATList.PutItem(Index:Integer; Item:PStatStg);
begin
  inherited Put(Index, Pointer(Item));
end;

procedure TSTATList.Clear;
var
 i:Integer;
begin
 for i:=0 to Count - 1 do Dispose(Items[i]);
 inherited Clear;
end;

function TSTATList.Add(Item: PStatStg): Integer;
var
  stg:PStatStg;
begin
  stg:=new(PStatStg);
  System.Move(Item^, stg^, sizeof(Item^));
  Result:=inherited Add(Pointer(stg));
end;

constructor TOleStorage.Create(const Storage:IStorage);
begin
  inherited Create;

  FStorage:=Storage;
  FStreamList:=TSTATList.Create;
  FStorageList:=TSTATList.Create;

  FOpned:=TInterfaceList.Create;

  ReadStorage;

end;

destructor TOleStorage.Destroy;
//var
// i:Integer;
begin
//  for i:=0 to FStreamList
  FStreamList.Free;
  FStorageList.Free;
  FOpned.Free;

  inherited;
end;




procedure TOleStorage.ReadStorage;
var
 pSTG:IEnumSTATSTG;
 Fetched:Integer;
 stg:TStatStg;

begin
  if Assigned(FStorage) then
  begin
    OleCheck(FStorage.EnumElements(0, nil, 0, pSTG));

    if Assigned(  FStreamList ) and Assigned( FStorageList ) then
    begin
      FStreamList.Clear;
      FStorageList.Clear;

      while( pSTG.Next(1, stg, @Fetched) = S_OK ) do
      begin
        if stg.dwType = STGTY_STORAGE  then FStorageList.Add(@stg);
        if stg.dwType = STGTY_STREAM   then FStreamList.Add(@stg);
      end;
    end;
  end;
end;

function TOleStorage.GetStream(Index:Integer; Mode:DWord):TOleStream;
var
 stg:TStatStg;
 Stream:IStream;
begin

 ReadStorage;

 Result:=nil;
 if Assigned(FStreamList) then
 begin
   stg:=FStreamList.Itmes[Index]^;
   OleCheck(FStorage.OpenStream(stg.pwcsName, nil, Mode, 0, Stream));
   Result:=TOleStream.Create(Stream);
   FOpned.Add(Stream);
 end;
end;

function TOleStorage.GetStorage(Index:Integer; Mode:DWord):TOleStorage;
var
 stg:TStatStg;
 Storage:IStorage;
begin

 ReadStorage;

 Result:=nil;
 if Assigned(FStreamList) then
 begin
   stg:=FStorageList.Itmes[Index]^;
   OleCheck(FStorage.OpenStorage(stg.pwcsName, nil, Mode, nil, 0, Storage));
   Result:=TOleStorage.Create(Storage);
   FOpned.Add(Storage);
 end;
end;


function TOleStorage.AddStorage(const Name:String; const Mode:DWord):TOleStorage;
var
  Storage:IStorage;
  wcName:PWideChar;
begin
  Result:=nil;
  wcName:=nil;

  if Assigned(FStorage) then
  begin
    try
      GetMem(wcName, MAX_PATH*sizeof(wchar));
      wcName:=StringToWideChar(Name, wcName, MAX_PATH);
      OleCheck(FStorage.CreateStorage(wcName, Mode, 0, 0, Storage));
      Result:=TOleStorage.Create(Storage);
      FOpned.Add(Storage);
      ReadStorage;
    finally
      FreeMem(wcName);
    end;
  end;
end;

function TOleStorage.AddStream(const Name:String; const Mode:DWord):TOleStream;
var
  Stream:IStream;
  wcName:PWideChar;
begin
  Result:=nil;
  wcName:=nil;
  if Assigned(FStorage) then
  begin
    try
      GetMem(wcName, MAX_PATH*sizeof(wchar));
      wcName:=StringToWideChar(Name, wcName, MAX_PATH);
      OleCheck(FStorage.CreateStream(wcName, Mode, 0, 0, Stream));
      Result:=TOleStream.Create(Stream);
      FOpned.Add(Stream);
      ReadStorage;
    finally
      FreeMem(wcName);
    end;

  end;
end;

end.
