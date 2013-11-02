unit ExceptionBase;
  {#Author fmarakasov@ugtu.net}
interface
uses
  SysUtils, Classes, CommonIntf, windows, comObj;
type
  ///  Класс исключений
  ///  вызов метода запрещён
  ECallProhibited = class (Exception)
    constructor Create;
  end;

  ///  Класс исключений
  ///  метод ещё не реализован
  ENotImplemented = class (Exception)
  public
    constructor Create;
  end;

  ///  Класс исключений
  ///  повторное назначение свойства объекту запрещено
  ///  испоьзуется для задания неизменных (readonly) свойств
  ///  классов.
  EReadonlyResetProhibited = class (Exception)
    constructor Create;
  end;

  ///  Класс исключений
  ///  любой недопустимой операции
  EInvalidOperation = class (Exception)
    constructor Create;
  end;

   ///  Класс исключений
  ///  ошибка, предусмотренная в приложении
EApplicationException = class (Exception)
 protected
 FErrorCode :integer;
 FInnerException : Exception;
 public

 constructor Create(MyMessage:string;Inner:Exception); overload;
 constructor Create(MyMessage:string); overload;
 constructor Create(MyMessage:string;Inner:Exception;Code:integer); overload;
 procedure AfterAction; virtual;

 property ErrorCode: integer read FErrorCode;
 property InnerException : Exception read FInnerException write FInnerException;
end;

   ///  Класс исключений
  ///  фатальная ошибка,приводит к завершению работы программы
 EApplicationFatalException = class (EApplicationException)
 private
 FApplication: IApplicationController;

 function GetFatalMessage:string;
 public
 constructor Create(mes:string; App:IApplicationController); overload;
  constructor Create(mes:string; App:IApplicationController; Inner:Exception); overload;

 procedure AfterAction; override;

 property FatalMessage: string read GetFatalMessage;

end;

EApplicationLoginFail = class (EApplicationFatalException)
end;

  TExceptionsFactory = class
  public
    class procedure RaiseNotImplemented;
    class procedure RaiseCallProhibited;
    class procedure RaiseReadonlyResetProhibited;
    class procedure RaiseInvalidOperation;
  end;

  IExceptionParser = interface
  ['{72D203AB-37A3-45ee-BF9A-C61654966BEF}']
     function Parse(E : Exception; var Handled : Boolean) : Exception;
  end;

  TExceptionParserCollection = class
  private
    FCollection : TInterfaceList;
    function GetItem(I : Integer ) : IExceptionParser;
    function GetItemCount(): integer;

  public
    constructor Create;
    destructor Destroy;override;
    procedure RegisterParser(Parser : IExceptionParser);
    procedure UnregisterParser(Parser : IExceptionParser);
    function Parse(E : Exception ) : Exception;

    property Item[I : Integer] : IExceptionParser read GetItem;
    property ItemCount : integer read GetItemCount;
  end;


implementation

{ ENotImplemented }

constructor ENotImplemented.Create;
begin
  Self.Message := 'Метод ещё не реализован!';
end;

{ ECallProhibited }

constructor ECallProhibited.Create;
begin
  Message := 'Вызов этого метода запрещён';
end;

{ EReadonlyResetProhibited }

constructor EReadonlyResetProhibited.Create;
begin
  Message := 'Допускается только однократное присвоение значения!';
end;

{ EApplicationException }

constructor EApplicationException.Create(MyMessage: string;
  Inner: Exception);
begin
if (Inner is EOleException) then
FInnerException:=EOleException.Create(inner.Message,(inner as EOleException).ErrorCode,'','',0)
else
if (Inner is EApplicationException) then
FInnerException:=EApplicationException.Create(inner.Message)
else FInnerException:=EApplicationException.Create(Inner.message);

self.Message:=MyMessage;
FErrorCode:=0;
end;

procedure EApplicationException.AfterAction;
begin
// no implementation required
end;

constructor EApplicationException.Create(MyMessage: string;
  Inner: Exception; Code: integer);
begin
if (Inner is EOleException) then
FInnerException:=EOleException.Create(inner.Message,(inner as EOleException).ErrorCode,'','',0)
else
if Inner<>nil then
if (Inner is EApplicationException) then
FInnerException:=EApplicationException.Create(inner.Message)
else FInnerException:=EApplicationException.Create(Inner.message);

Self.Message:=MyMessage;
FErrorCode:=Code;
end;

constructor EApplicationException.Create(MyMessage: string);
begin
Self.Message:=MyMessage;
FErrorCode:=0;
end;

{ EApplicationFatalException }

procedure EApplicationFatalException.AfterAction;
begin
   FApplication.FinalizeApplication;
   FApplication.Terminate;
   ExitProcess($FF);
end;

constructor EApplicationFatalException.Create(mes: string;
  App: IApplicationController);
begin
Message:=mes;
FApplication:=App;
end;

constructor EApplicationFatalException.Create(mes: string;
  App: IApplicationController; Inner: Exception);
begin
Message:=mes;
FApplication:=App;
FInnerException:=Inner;
end;

function EApplicationFatalException.GetFatalMessage: string;
begin
result:=self.Message+' Приложение будет закрыто.';
end;

{ TExcpetionsFactory }

class procedure TExceptionsFactory.RaiseCallProhibited;
begin
  raise ECallProhibited.Create;
end;

class procedure TExceptionsFactory.RaiseInvalidOperation;
begin
  raise EInvalidOperation.Create;
end;

class procedure TExceptionsFactory.RaiseNotImplemented;
begin
  raise ENotImplemented.Create;
end;

class procedure TExceptionsFactory.RaiseReadonlyResetProhibited;
begin
  raise EReadonlyResetProhibited.Create;
end;

{ TExceptionParserCollection }

constructor TExceptionParserCollection.Create;
begin
  FCollection := TInterfaceList.Create;
end;

destructor TExceptionParserCollection.Destroy;
begin
  FCollection.Free;
  inherited;
end;

function TExceptionParserCollection.GetItem(I: Integer): IExceptionParser;
begin
  Result := IExceptionParser(FCollection[I]);
end;

function TExceptionParserCollection.GetItemCount: integer;
begin
result:=FCollection.Count;
end;

function TExceptionParserCollection.Parse(E: Exception): Exception;
var
  I : Integer;
  Handled : Boolean;
  ParserResult : Exception;
begin
  Assert(E <> nil, 'TExceptionParserCollection.RegisterParser: аргумент Parser не может быть nil.');
  Result := E;
  for I := 0 to FCollection.Count - 1 do
  begin
    ParserResult := Item[I].Parse(E, Handled);
    if Handled then
    begin
      Result := ParserResult;
      Exit;
    end;
  end;
end;

procedure TExceptionParserCollection.RegisterParser(Parser: IExceptionParser);
begin
  Assert(Parser <> nil, 'TExceptionParserCollection.RegisterParser: аргумент Parser не может быть nil.');
  if FCollection.IndexOf(Parser) <> -1 then
    TExceptionsFactory.RaiseInvalidOperation;
  FCollection.Add(Parser);
end;

procedure TExceptionParserCollection.UnregisterParser(Parser: IExceptionParser);
begin
  Assert(Parser <> nil, 'TExceptionParserCollection.UnregisterParser: аргумент Parser не может быть nil.');
  if FCollection.IndexOf(Parser) = -1 then
    TExceptionsFactory.RaiseInvalidOperation;
  FCollection.Remove(Parser);
end;

{ EInvalidOperation }

constructor EInvalidOperation.Create;
begin
  Message := 'Операция недопустима в данном контексте или с указанными параметрами.';
end;

end.
