(*
  Модуль    : DBTVFacultyObj
  Категория : ..
  Версия: 1.0
  Автор : Куделин С. Г.

  Назначение: Объект факультет в дереве ABIT
*)
unit DBTVFacRecObj;

{ #Author sergdev@ist.ugtu.net }
interface

uses
  Dialogs,
  DBTVObj,
  DBTVSpecRecObj,
  DBTVGroupObj,
  SysUtils,
  comctrls,
  db,
  ADODB,
  graphics,
  Variants;

type
  TDBNodeFacRecObject = class(TDBNodeObject)
  private
    FName: string;
    FIK: integer;
    FYear: integer;
    FDataSet: TADODataSet;
  protected
    function DoAddChildNodes: Boolean; override;
  public
    function SetADODataset(Connection: TAdoConnection): TADODataSet;
    procedure AddChild(Caption: string; Sname: string; ik: integer;
      NNrec: integer; NNyear: integer; direct: string; id_fe: integer;
      name_fe: string);
    property Name: string read FName write FName;
    property ik: integer read FIK write FIK;
    property Year: integer read FYear write FYear;
    property AdoDataset: TADODataSet read FDataSet write FDataSet;

  end;

implementation

function TDBNodeFacRecObject.SetADODataset(Connection: TAdoConnection)
  : TADODataSet;
begin
  AdoDataset := TADODataSet.Create(TreeView);
  AdoDataset.Connection := Connection;
  AdoDataset.CommandType := cmdText;
  AdoDataset.CommandText :=
    'select * from TREE_ABIT_specialties where ik_fac=''' + inttostr(ik) +
    ''' and nnyear=''' + inttostr(Year) + ''' order by CName_spec';
  AdoDataset.Active := true;
  if (AdoDataset.RecordCount = 0) then
    Node.HasChildren := false;
  Result := AdoDataset;
end;

procedure TDBNodeFacRecObject.AddChild(Caption: string; Sname: string;
  ik: integer; NNrec: integer; NNyear: integer; direct: string; id_fe: integer;
  name_fe: string);
var
  new: TTreeNode;
  DBnode: TDBNodeSpecrecObject;
begin
  new := TreeView.Items.AddChildFirst(Node, Caption + ' (' + direct + ')');
  DBnode := TDBNodeSpecrecObject.Create(new, TreeView);
  DBnode.ik := ik;
  DBnode.ShortName := Sname;
  DBnode.Name := Caption + ' (' + direct + ')';
  DBnode.NNRecord := NNrec;
  DBnode.Year := NNyear;
  DBnode.SetADODataset(AdoDataset.Connection);
  DBnode.BaseImageIndex := 5;
  DBnode.ShowCurrent := true;
  DBnode.ShowChecked := true;

  DBnode.EdFormKey := id_fe;
  DBnode.EdFormName := name_fe;

  new.Data := DBnode;
  new.ImageIndex := DBnode.BaseImageIndex;

end;

function TDBNodeFacRecObject.DoAddChildNodes: Boolean;
var
  i: integer;
  nfe, lfe: string;
begin
  Node.DeleteChildren;

  AdoDataset.Last;
  for i := 0 to (AdoDataset.RecordCount - 1) do
  begin
    nfe := AdoDataset.FieldValues['CName_form_ed'];
    case AdoDataset.FieldValues['ik_form_ed'] of
      1: lfe := '';
      2,6: lfe := '(' + nfe[1] + ') ';
      7: lfe := '(О/З) ';
    end;

    AddChild(lfe + AdoDataset.FieldValues['CName_spec'],
      AdoDataset.FieldValues['Cshort_spec'],
      AdoDataset.FieldValues['ik_spec_fac'], AdoDataset.FieldValues['NNRecord'],
      AdoDataset.FieldValues['NNyear'],
      AdoDataset.FieldValues['cname_direction'],
      AdoDataset.FieldValues['ik_form_ed'], nfe);
    AdoDataset.Prior;
  end;
  Result := true;
end;

end.
