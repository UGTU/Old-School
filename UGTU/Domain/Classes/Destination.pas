unit Destination;

interface
uses Document,System.Generics.Collections;
type

  TDest = class
  private
    FListDoc: TObjectList<TDopDoc>;
    Fik_dest: integer;
  protected

  public
  property ik_dest: integer read Fik_dest;
  property ListDoc: TObjectList<TDopDoc> read FListDoc;
    constructor Create(_ik_dest: integer);
    destructor Destroy; override;

  end;

implementation

{ TDopDoc }

constructor TDest.Create(_ik_dest: integer);
begin
Fik_dest:=_ik_dest;
FListDoc := TObjectList<TDopDoc>.Create;
end;

destructor TDest.Destroy;
begin

  inherited;
end;

end.

