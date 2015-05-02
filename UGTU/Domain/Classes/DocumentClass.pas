unit DocumentClass;

interface

uses System.Generics.Collections, System.Classes;

type
  TDocRecord = class
    ikDoc: integer;
    ikDocVid: integer;
    seria: string;
    number: string;
    get_date: Variant;
    kem_vidan: string;
    isreal: boolean;
    addinfo: string;
    balls: integer;
    ikDisc: Variant;
    isDeleted: boolean;
    docs: TList<TMemoryStream>;
    constructor Create(aDocIK, aikDocVid, aballs: integer; aikDisc: Variant;
      aseria, anumber, akem_vidan, aaddinfo: string;  aisreal: boolean; aget_date: Variant); overload;
    constructor Create(aDocIK: integer; aIsDeleted: boolean);  overload;
    constructor Create(aikDocVid: integer); overload;
    procedure AddDoc(aDoc: TMemoryStream);
  end;

implementation

{ TDocRecord }

constructor TDocRecord.Create(aDocIK, aikDocVid, aballs: integer; aikDisc: Variant;
  aseria, anumber, akem_vidan, aaddinfo: string; aisreal: boolean;
  aget_date: Variant);
begin
  ikDoc := aDocIK;
  ikDocVid := aikDocVid;
  seria := aseria;
  number := anumber;
  get_date := aget_date;
  kem_vidan := akem_vidan;
  isreal := aisreal;
  addinfo := aaddinfo;
  balls := aballs;
  ikDisc := aikDisc;
  isDeleted := False;
  docs := TList<TMemoryStream>.Create;
end;

procedure TDocRecord.AddDoc(aDoc: TMemoryStream);
begin
  docs.Add(aDoc);
end;

constructor TDocRecord.Create(aDocIK: integer; aIsDeleted: boolean);
begin
  ikDoc := aDocIK;
  isDeleted := aIsDeleted;
end;

constructor TDocRecord.Create(aikDocVid: integer);
begin
  ikDocVid := aikDocVid;
end;

end.
