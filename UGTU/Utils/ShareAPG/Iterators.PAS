unit Iterators;
   {#Author fmarakasov@ugtu.net}
interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs;

type
  {1 Определяет абстрактный итератор для интерфейсов }
  IInterfaceIterator = interface (IInterface)
    function CurrentItem: IInterface; stdcall;
    procedure First; stdcall;
    function IsDone: Boolean; stdcall;
    procedure Next; stdcall;
  end;
  
  {1 Определяет абстрактный итератор для объектов }
  IObjectIterator = interface (IInterface)
    function CurrentItem: TObject; stdcall;
    procedure First; stdcall;
    function IsDone: Boolean; stdcall;
    procedure Next; stdcall;
  end;
  
  TNullIInterfaceIterator = class (TInterfacedObject, IINterfaceIterator)
  public
    function CurrentItem: IInterface; stdcall;
    procedure First; stdcall;
    function IsDone: Boolean; stdcall;
    procedure Next; stdcall;
  end;
  
  TListInterfaceIterator = class (TInterfacedObject, IInterfaceIterator)
  private
    FList: IInterfaceList;
    FPosition: Integer;
  public
    constructor Create(List:IInterfaceList);
    function CurrentItem: IInterface; stdcall;
    procedure First; stdcall;
    function IsDone: Boolean; stdcall;
    procedure Next; stdcall;
  end;
  


implementation

{
*************************** TNullIInterfaceIterator ****************************
}
function TNullIInterfaceIterator.CurrentItem: IInterface;
begin
  Result:=nil;
end;

procedure TNullIInterfaceIterator.First;
begin
  //
end;

function TNullIInterfaceIterator.IsDone: Boolean;
begin
  Result:=true;
end;

procedure TNullIInterfaceIterator.Next;
begin
  raise Exception.Create('Iterator out of bounds');
end;

{
**************************** TListInterfaceIterator ****************************
}
constructor TListInterfaceIterator.Create(List:IInterfaceList);
begin
  FList:=List;
  FPosition:=0;
end;

function TListInterfaceIterator.CurrentItem: IInterface;
begin
  Result:=FList.Items[FPosition];
end;

procedure TListInterfaceIterator.First;
begin
  FPosition:=0;
end;

function TListInterfaceIterator.IsDone: Boolean;
begin
  Result:=FPosition >= FList.Count;
end;

procedure TListInterfaceIterator.Next;
begin
  inc(FPosition);
end;




end.
