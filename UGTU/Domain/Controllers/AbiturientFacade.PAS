unit AbiturientFacade;
 {#Author tanyav@ist.ugtu.net}
interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, AbiturientBaseProcs, ADODB,AbiturientBaseTables,uDM;

type
  TAbiturientFacade = class
  private
    FConnection: TADOConnection;
    FProcList: TProcList;
    FTableList: TTableList;
    constructor Create;
  protected
    constructor CreateInstance;
    class function AccessInstance(Request: Integer): TAbiturientFacade;
  public
    destructor Destroy; override;
    class function Instance: TAbiturientFacade;
    class procedure ReleaseInstance;
    property Connection: TADOConnection read FConnection;
    property ProcList: TProcList read FProcList;
    property TableList: TTableList read FTableList;
  end;
  


//var Facade: TAbiturientFacade;

implementation
uses
  ComObj;

var FInstance: TAbiturientFacade = nil;

{
****************************** TAbiturientFacade *******************************
}
constructor TAbiturientFacade.Create;
begin
  inherited Create;
end;

constructor TAbiturientFacade.CreateInstance;
begin
  inherited Create;
  CoInitializeEx(nil, 0);
  FConnection:=dm.DBConnect;
  FProcList := TProcList.Create(nil);
  FTableList := TTableList.Create(nil);
end;

destructor TAbiturientFacade.Destroy;
begin
  if AccessInstance(0) = Self then AccessInstance(2);
  FProcList.Free;
  FTableList.Free;
  inherited Destroy;
end;

class function TAbiturientFacade.AccessInstance(Request: Integer): 
        TAbiturientFacade;


  
begin
  case Request of
    0 : ;
    1 : if not Assigned(FInstance) then FInstance := CreateInstance;
    2 : FInstance := nil;
  else
    raise Exception.CreateFmt('Illegal request %d in AccessInstance',
            [Request]);
  end;
  Result := FInstance;
end;

class function TAbiturientFacade.Instance: TAbiturientFacade;
begin
  Result := AccessInstance(1);
end;

class procedure TAbiturientFacade.ReleaseInstance;
begin
  AccessInstance(0).Free;
end;


end.
