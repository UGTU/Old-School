unit Document;

interface
uses System.Generics.Collections;
type

  TDopDoc = class
  private
 //   ListDoc: TObjectList<TDopDoc>;
    Fik_doc: integer;
  protected

  public
  property ik_doc: integer read Fik_doc;
    constructor Create(_ik_doc: integer);
    destructor Destroy; override;

  end;

implementation

{ TDopDoc }

constructor TDopDoc.Create(_ik_doc: integer);
begin
Fik_doc:=_ik_doc;
//ListDoc := TObjectList<TDopDoc>.Create;
end;

destructor TDopDoc.Destroy;
begin

  inherited;
end;

end.
