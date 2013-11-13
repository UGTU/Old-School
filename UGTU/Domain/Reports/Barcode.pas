unit Barcode;
{#Author fmarakasov@ist.ugtu.net}
interface
uses
  SysUtils;
const
  IID_IBarcodeHeader : TGUID = '{9E1616BE-8428-4d7e-BD5C-F864A57D3A33}';
  IID_IBarcode : TGUID = '{016B51E0-D944-450f-AC17-7830E7FD367A}';
  IID_IBarcodeApplet : TGUID = '{FA309F30-6258-4b36-84A1-069CEA213117}';
  IID_ISite : TGUID = '{BC8D65D1-47CF-4cbd-ACB8-9346420CBAB4}';
type

  TOID = Integer;

  // Определяет фундаментальное поведение по преобразованию строки в штрих-код
  // (Decode) и обратную операцию (Encode)
  IBarcode = interface(IInterface)
     ['{016B51E0-D944-450f-AC17-7830E7FD367A}']
     function  Encode:string;
     procedure Decode(BarcodeStr: WideString);
  end;

  // Определяет заголовок штрих-кода
  IBarcodeHeader = interface (IBarcode)
    ['{9E1616BE-8428-4d7e-BD5C-F864A57D3A33}']
    procedure SetMajorVersion(Value : Integer);
    procedure SetMinorVersion(Value : Integer);
    procedure SetObjectType(Value : Integer);
    procedure SetOID(Value : TOID);

    function GetMajorVersion:Integer;
    function GetMinorVersion:Integer;
    function GetObjectType:Integer;
    function GetOID:Integer;

    property MajorVersion : Integer read GetMajorVersion write SetMajorVersion;
    property MinorVersion : Integer read GetMinorVersion write SetMinorVersion;
    property ObjectType :  Integer read GetObjectType write SetObjectType;
    property OID        :  TOID read GetOID write SetOID;
  end;

  // Апплет со штрих-кодом
  IBarcodeApplet = interface  (IInterface)
    ['{FA309F30-6258-4b36-84A1-069CEA213117}']
    function GetAppletName:string;
    procedure SetAppletName(Value : string);
    function GetBarcodeHeader:IBarcodeHeader;
    procedure SetBarcodeHeader(Value : IBarcodeHeader);
    // Имя аплета со штрих-кодом (например, PDF417Ctrl1)
    property AppletName:string read GetAppletName write SetAppletName;
    property BarcodeHeader:IBarcodeHeader read GetBarcodeHeader write SetBarcodeHeader;
    // Записать значение штрих-кода в апплет
    procedure WriteToApplet;
  end;

  // Определяет контракт между объектом-контейнером (Site) и апплетом (Applet)
  ISite  = interface (IInterface)
  ['{BC8D65D1-47CF-4cbd-ACB8-9346420CBAB4}']
    function GetApplet:IBarcodeApplet;
    function GetSite : IDispatch;
    // Получает контейнер в котором располагается апплет со штрих-кодом
    property Site:IDispatch read GetSite;
    // Апплет со штрих-кодом
    property Applet:IBarcodeApplet read GetApplet;
  end;

  // Стандартная реализация IBarcodeHeader
  TBarcodeReportHeader = class (TInterfacedObject, IBarcodeHeader)
  private
     FMajorVersion : Integer;
     FMinorVersion : Integer;
     FObjectType   : Integer;
     FOID          : TOID;
     FPattern      : string;
     procedure RaiseBarcodeException;
  private
    procedure SetMajorVersion(Value : Integer);
    procedure SetMinorVersion(Value : Integer);
    procedure SetObjectType(Value : Integer);
    procedure SetOID(Value : TOID);

    function GetMajorVersion:Integer;
    function GetMinorVersion:Integer;
    function GetObjectType:Integer;
    function GetOID:Integer;

    procedure SetPattern(Value:string);
    function GetPattern:string;
  protected
    function  Encode:string;
    procedure Decode(BarcodeStr: WideString);
    property MajorVersion : Integer read GetMajorVersion write SetMajorVersion;
    property MinorVersion : Integer read GetMinorVersion write SetMinorVersion;
    property ObjectType   : Integer read GetObjectType write SetObjectType;
    property OID          : TOID read GetOID write SetOID;
    property Pattern:string read GetPattern write SetPattern;
  end;

  // Стандартная реализация IBarcodeApplet
  TBarcodeApplet = class(TInterfacedObject, IBarcodeApplet)
  private
    FAppletName:string;
    FBarcodeHeader : IBarcodeHeader;
  protected
    procedure AssignBarcodeValue(barcode:string);virtual;abstract;
  protected
    function GetAppletName:string;
    procedure SetAppletName(Value : string);
    function GetBarcodeHeader:IBarcodeHeader;
    procedure SetBarcodeHeader(Value : IBarcodeHeader);
    property AppletName:string read GetAppletName write SetAppletName;
    property BarcodeHeader:IBarcodeHeader read GetBarcodeHeader write SetBarcodeHeader;
    procedure WriteToApplet;
  end;

  EBarcodeException = class (Exception);

implementation
uses
  RegularEx;

{ TBarcodeReportHeader }

procedure TBarcodeReportHeader.Decode(BarcodeStr: WideString);
var
  Matches : TMatchCollection;
begin
  Matches := TRegularExpression.Execute(Pattern, BarcodeStr);
  if ((Matches.Count <> 1) or (Matches[0].SubMatches.Count <> 3)) then
    RaiseBarcodeException;

  MajorVersion := StrToInt(Matches[0].SubMatches[0]);
  MinorVersion := StrToInt(Matches[0].SubMatches[1]);
  ObjectType := StrToInt(Matches[0].SubMatches[2]);
  OID := StrToInt(Matches[0].SubMatches[3]);
end;

function TBarcodeReportHeader.Encode: string;
const
  Pattern = '%d.%d#%d#%d';
begin
  Result:=Format(Pattern, [MajorVersion, MinorVersion, ObjectType, OID]);
end;

function TBarcodeReportHeader.GetMajorVersion: Integer;
begin
  Result := FMajorVersion;
end;

function TBarcodeReportHeader.GetMinorVersion: Integer;
begin
  Result := FMinorVersion;
end;

function TBarcodeReportHeader.GetObjectType: Integer;
begin
  Result := FObjectType;
end;

function TBarcodeReportHeader.GetOID: Integer;
begin
  Result := FOID;
end;

function TBarcodeReportHeader.GetPattern: string;
begin
  Result := FPattern;
end;

procedure TBarcodeReportHeader.SetMajorVersion(Value: Integer);
begin
  FMajorVersion := Value;
end;

procedure TBarcodeReportHeader.SetMinorVersion(Value: Integer);
begin
  FMinorVersion := Value;
end;

procedure TBarcodeReportHeader.SetObjectType(Value: Integer);
begin
  FObjectType := Value;
end;

procedure TBarcodeReportHeader.SetOID(Value: TOID);
begin
  FOID := Value;
end;


procedure TBarcodeReportHeader.SetPattern(Value: string);
begin
  FPattern := Value;
end;

{ IBarcode }


procedure TBarcodeReportHeader.RaiseBarcodeException;
begin
  raise EBarcodeException.Create('Формат строки штрих-кода задан не правильно.');
end;

{ TBarcodeApplet }

function TBarcodeApplet.GetAppletName: string;
begin
  Result := FAppletName;
end;

function TBarcodeApplet.GetBarcodeHeader: IBarcodeHeader;
begin
  Result := FBarcodeHeader;
end;

procedure TBarcodeApplet.SetAppletName(Value: string);
begin
  FAppletName := Value;
end;

procedure TBarcodeApplet.SetBarcodeHeader(Value: IBarcodeHeader);
begin
  FBarcodeHeader := Value;
end;

//<<Template Method>>
procedure TBarcodeApplet.WriteToApplet;
var
  barcodeString : String;
begin
  Assert(Assigned(FBarcodeHeader), 'Не задан объект типа IBarcodeHeader');
  barcodeString := FBarcodeHeader.Encode;

  AssignBarcodeValue(barcodeString);
end;

end.
