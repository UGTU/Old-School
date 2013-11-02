(*
  ������    : DBTVSemesterScheduleobj
  ��������� : ..
  ������: 1.0
  ����� : ������� �. �.

  ����������: ������ ������� � ������
*)
unit DBTVSemesterNagrObj;
{#Author sergdev@ist.ugtu.net}
interface
uses  Dialogs,
  DBTVFacDepObj,
  DBTVObj,
  DBTV,
  SysUtils,
  comctrls,
  db,
  graphics,
  ADODB,
  Variants;


  type
  TDBNodeSemesterNagrObject = class (TDBNodeObject)
  private
  FDataSet: TADODataSet;
  FName:string;
  FIK_semtype:integer;
  FIK_Year:integer;

  protected
    function DoAddChildNodes: Boolean; override;
  public
    procedure AddChild(Caption:string;IK:integer);
    property Name: string read FName write FName;
    property AdoDataset: TAdoDataSet read FDataSet write FDataSet;
    property IK_Semtype: integer read FIK_semtype write FIK_semtype;
     property IK_Year: integer read FIK_Year write FIK_Year;

    function SetADODataset(Connection:TAdoConnection):TAdodataset;
  end;

implementation

function TDBNodeSemesterNagrObject.SetADODataset(Connection:TAdoConnection):TAdodataset;
begin
 AdoDataset:= TAdoDataSet.Create(TreeView);
 AdoDataset.Connection:=Connection;
 AdoDataset.CommandType:=cmdTable;
 AdoDataset.CommandText:='TREE_Nagr_fac';

 AdoDataset.Active:=true;
 if (AdoDataset.RecordCount=0) then
   Node.HasChildren:=false;
 Result := AdoDataset;

end;

procedure TDBNodeSemesterNagrObject.AddChild(Caption:string;IK:integer);
var new:TTreeNode;
DBnode:TDBNodeFacultyDepObject;
begin

new:=TreeView.Items.AddChild(Node,Caption);
DBnode:=TDBNodeFacultyDepObject.create(new,TreeView);
DBNode.ik:=IK;
DBNode.Name:=Caption;
DBnode.IK_Semtype:=IK_Semtype;
DBnode.IK_year:=IK_year;
DBNode.BaseImageIndex:=3;
new.ImageIndex:=DBNode.BaseImageIndex;
DBnode.SetAdoDataset(AdoDataset.Connection);
new.Data:=DBnode;


end;

function TDBNodeSemesterNagrObject.DoAddChildNodes: Boolean;
begin
  Node.DeleteChildren;
  AdoDataset.First;
  while not AdoDataset.Eof do
  begin
    AddChild(AdoDataset.FieldValues['CName_fac'],AdoDataset.FieldValues['IK_fac']);
    AdoDataset.Next;
end;
Result:=true;
end;

end.


