unit DocumentClass;

interface

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
    constructor Create(aDocIK, aikDocVid, aballs: integer; aikDisc: Variant;
      aseria, anumber, akem_vidan, aaddinfo: string;  aisreal: boolean; aget_date: Variant); overload;
    constructor Create(aDocIK: integer; aIsDeleted: boolean);  overload;
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
end;

constructor TDocRecord.Create(aDocIK: integer; aIsDeleted: boolean);
begin
  ikDoc := aDocIK;
  isDeleted := aIsDeleted;
end;

end.
