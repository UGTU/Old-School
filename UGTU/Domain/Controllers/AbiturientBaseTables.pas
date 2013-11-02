unit AbiturientBaseTables;
 {#Author tanyav@ist.ugtu.net}
interface
uses    SysUtils, Windows, Messages, Classes, Graphics, Controls,
        Forms, Dialogs, ADODB, Contnrs,db;

type
  TTable = class;
  TTableList = class;
  TGetTable = class;
  TTableClass = class of TTable;

  TTable = class (TAdoTable)
  public
    constructor Create(AOwner: TComponent); override;
  end;
  
  TTableList = class (TObjectList)
  private
    FOwner: TComponent;
    function GetDataSetByClassType(AClassType: TTableClass): TAdoTable;
    function GetItems(Index: Integer): TTable;
  public
    property DataSetByClassType[AClassType: TTableClass]: TAdoTable read
            GetDataSetByClassType; default;
    property Items[Index: Integer]: TTable read GetItems;
    property Owner: TComponent read FOwner;
    constructor Create(AOwner: TComponent);
  end;

  TGetTable = class (TTable)
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation
uses AbiturientFacade;


{
************************************ TTable *************************************
}
constructor TTable.Create(AOwner: TComponent);
begin
  inherited;
  Connection := TAbiturientFacade.Instance.Connection;
end;

{
********************************** TTableList ***********************************
}
constructor TTableList.Create(AOwner: TComponent);
begin
  inherited Create(false);
  FOwner := AOwner;
end;

function TTableList.GetDataSetByClassType(AClassType: TTableClass): TAdoTable;
var i: integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
  if Items[i] is AClassType then
  begin
    Result := Items[i] as AClassType;
    break;
  end;

  if not Assigned(Result) then
  begin
    Result := AClassType.Create(Owner);
    Add(Result);
  end;
end;

function TTableList.GetItems(Index: Integer): TTable;
begin
  Result := inherited Items[Index] as TTable;
end;

{
*********************************** TGetTAble ***********************************
}
constructor TGetTAble.Create(AOwner: TComponent);
begin
  inherited;
end;

end.
 