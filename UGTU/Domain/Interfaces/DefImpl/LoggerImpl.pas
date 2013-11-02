unit LoggerImpl;

interface

uses
  Forms, Windows, CoreInterfaces, Classes, DateTimeCore, SysUtils, StdCtrls;
type

  ///
  ///  Класс журналирования без журналирования
  ///
  TNullLogger = class (TInterfacedObject, ILogger)
  protected
    procedure LogMessage(const Message : String);
  strict private
    constructor Create;
  strict private
  class var
    FInstance:TNullLogger;
  public
    class function GetInstance: TNullLogger;
  end;

  ///
  ///  Класс журналирования в список строк в памяти
  TMemoryLogger = class (TInterfacedObject, ILogger)
  private
    FStrings : TStrings;
    function FormatMessage(const Value : String) : String;
  protected
    procedure LogMessage(const Message : String);
  strict private
    constructor Create;
  strict private
  class var
    FInstance:TMemoryLogger;
  public
    class function GetInstance: TMemoryLogger;
    property Log : TStrings read FStrings;
  end;

  ///
  ///  Класс журналирования без журналирования с выводом на экран
  ///
  TScreenLogger = class (TInterfacedObject, ILogger)
  protected
    procedure LogMessage(const Message : String);
  strict private
    constructor Create;
  strict private
  class var
    FInstance:TScreenLogger;
  public
    class function GetInstance: TScreenLogger;
  end;

  ///
  ///  Класс журналирования в текстовый файл
  ///
  TFileLogger = class (TInterfacedObject, ILogger)
  private
    FTextFile : TextFile;
    function GetSessionFileName : String;
  protected
    procedure LogMessage(const Message : String);
  strict private
    constructor Create;
  strict private
  class var
    FInstance:TFileLogger;
  public
    class function GetInstance: TFileLogger;
  end;

  ///
  ///  Класс журналирования в список немодального окна
  TMemoLogger = class (TInterfacedObject, ILogger)
  protected
    procedure LogMessage(const Message : String);
  strict private
    FForm : TForm;
    FMemo : TMemo;
    FNumber : Integer;
    constructor Create;
  strict private
  class var
    FInstance:TMemoLogger;
    procedure Init;
  public
    class function GetInstance: TMemoLogger;
  end;


implementation
uses
  ShellAPI, ShlObj, Controls;

{ TNullLogger }

procedure TNullLogger.LogMessage(const Message: String);
begin
  // Foo Implementation!
end;

constructor TNullLogger.Create;
begin
  inherited;
end;

class function TNullLogger.GetInstance: TNullLogger;
begin
  If FInstance = nil Then
  begin
    FInstance := LoggerImpl.TNullLogger.Create();
  end;
  FInstance._AddRef;
  Result := FInstance;
end;

constructor TMemoryLogger.Create;
begin
  inherited;
  FStrings := TStringList.Create;
end;

function TMemoryLogger.FormatMessage(const Value: String): String;
var
  DateTime : IDateTime;
begin
  DateTime := TDateTimeBase.CreateNow;
  Result := Format('[%s] %s', [DateTime.GetFormatedDateTimeString('dd/mm/yyyy hh:nn:ss'), Value]);
end;

class function TMemoryLogger.GetInstance: TMemoryLogger;
begin
  If FInstance = nil Then
  begin
    FInstance := LoggerImpl.TMemoryLogger.Create();
  end;
  FInstance._AddRef;
  Result := FInstance;
end;

procedure TMemoryLogger.LogMessage(const Message: String);
begin
  FStrings.Add(FormatMessage(Message));
end;

constructor TScreenLogger.Create;
begin
  inherited;
end;

class function TScreenLogger.GetInstance: TScreenLogger;
begin
  If FInstance = nil Then
  begin
    FInstance := LoggerImpl.TScreenLogger.Create();
  end;
  FInstance._AddRef;
  Result := FInstance;
end;

procedure TScreenLogger.LogMessage(const Message: String);
begin
  MessageBox(0, PChar(Message), PChar(Application.Title), MB_OK or MB_ICONINFORMATION);
end;

{ TFileLogger }

procedure TFileLogger.LogMessage(const Message: String);
begin

end;

constructor TFileLogger.Create;
begin
  inherited;
  AssignFile(FTextFile, GetSessionFileName);
  Rewrite(FTextFile);
end;

class function TFileLogger.GetInstance: TFileLogger;
begin
  If FInstance = nil Then
  begin
    FInstance := LoggerImpl.TFileLogger.Create();
  end;
  FInstance._AddRef;
  Result := FInstance;
end;

function TFileLogger.GetSessionFileName: String;
var
  SpecialFolerPath : array[0..MAX_PATH] of WideChar;
begin
  Assert(SHGetSpecialFolderPath(0, SpecialFolerPath, CSIDL_APPDATA, TRUE), 'Failed retreive special folder path!');
end;

constructor TMemoLogger.Create;
begin
  FNumber := 1;
  Init;
  inherited;
end;

class function TMemoLogger.GetInstance: TMemoLogger;
begin
  If FInstance = nil Then
  begin
    FInstance := LoggerImpl.TMemoLogger.Create();
  end;
  FInstance._AddRef;
  Result := FInstance;
end;

procedure TMemoLogger.Init;
begin
  if FForm = nil then
  begin
    FForm := TForm.Create(Application);
    FForm.Caption := 'Logger window of ' + Application.Title;
    FMemo := TMemo.Create(FForm);
    FMemo.Parent := FForm;
    FMemo.Align := alClient;
    FForm.FormStyle := fsStayOnTop;
  end;
end;

procedure TMemoLogger.LogMessage(const Message: String);
begin
  FForm.Show;
  FMemo.Lines.Add(Format('[%d] %s', [FNumber, Message]));
  Inc(FNumber);
  FMemo.Update;
end;

end.
