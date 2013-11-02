unit AbiturientBaseProcs;
 {#Author tanyav@ist.ugtu.net}
interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ADODB, Contnrs;

type
  TProc = class;
  TProcList = class;
  TGetProc = class;
  TDeleteProc = class;
  TAddProc = class;
  TEditProc = class;
  TProcClass = class of TProc;

  TProc = class (TAdoStoredProc)
  public

    constructor Create(AOwner: TComponent); override;
  end;
  
  TProcList = class (TObjectList)
  private
    FOwner: TComponent;
    function GetDataSetByClassType(AClassType: TProcClass): TAdoStoredProc;
    function GetItems(Index: Integer): TProc;
  public
    property DataSetByClassType[AClassType: TProcClass]: TAdoStoredProc read
            GetDataSetByClassType; default;
    property Items[Index: Integer]: TProc read GetItems;
    property Owner: TComponent read FOwner;
    constructor Create(AOwner: TComponent);  
  end;
  
  TGetProc = class (TProc)
  public
    procedure MakeList(AStrings,AKeys: TStrings); virtual;
    procedure MakeListOfDates(AStrings: TStrings); virtual;
    constructor Create(AOwner: TComponent); override;
  end;
  
  TDeleteProc = class (TProc)
  public
    constructor Create(AOwner: TComponent); override;
  end;
  
  TAddProc = class (TProc)
  public
    constructor Create(AOwner: TComponent); override;
  end;
  
  TEditProc = class (TProc)
  end;
  



procedure Register;

implementation

uses AbiturientFacade;

procedure Register;
begin
end;

{
************************************ TProc *************************************
}
constructor TProc.Create(AOwner: TComponent);
begin
  inherited;
  Connection := TAbiturientFacade.Instance.Connection;
end;

{
********************************** TProcList ***********************************
}
constructor TProcList.Create(AOwner: TComponent);
begin
  inherited Create(false);
  FOwner := AOwner;

end;

function TProcList.GetDataSetByClassType(AClassType: TProcClass): TAdoStoredProc;
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

function TProcList.GetItems(Index: Integer): TProc;
begin
  Result := inherited Items[Index] as TProc;
end;

{
*********************************** TGetProc ***********************************
}
constructor TGetProc.Create(AOwner: TComponent);
begin
  inherited;
end;

procedure TGetProc.MakeList(AStrings,AKeys: TStrings);
begin
  if not Active then Open;
  AStrings.Clear;
  AKeys.Clear;
  while not Eof do
  begin
    AStrings.AddObject(Fields[1].AsString, TObject(Fields[0].AsInteger));
    AKeys.AddObject(Fields[0].AsString, TObject(Fields[0].AsInteger));
    Next;
  end;
  close;
end;

procedure TGetProc.MakeListOfDates(AStrings: TStrings);
begin
  if not Active then Open;
  AStrings.Clear;
  while not Eof do
  begin
    AStrings.AddObject(Fields[0].AsString, TObject(Fields[0].AsString));
    Next;
  end;
  close;
end;
{
********************************* TDeleteProc **********************************
}
constructor TDeleteProc.Create(AOwner: TComponent);
begin
 inherited;
end;

{
*********************************** TAddProc ***********************************
}
constructor TAddProc.Create(AOwner: TComponent);
begin
 inherited;
end;

end.
