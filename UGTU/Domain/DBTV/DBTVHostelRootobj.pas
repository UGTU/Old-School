(*
  Модуль    : DBTVHostelRoot
  Категория : ..
  Версия: 1.0
  Автор : Куделин С. Г.

  Назначение: Объект корень подсистемы "Общежитие" в дереве
*)
unit DBTVHostelRootobj;
 {#Author sergdev@ist.ugtu.net}
interface
uses  Dialogs,
  DBTVFacObj,
  DBTVObj,
  DBTV,
  SysUtils,
  comctrls,
  db,
  graphics,
  ADODB,
  Variants,
  DBTVHabitatsObj,
  DBTVInviteObj;
  type
  TDBHostelNodeRoot = class (TDBNodeObject)

  private
  FDataSet: TADODataSet;
  RootName:string;


  protected
    function DoAddChildNodes: Boolean; override;
  public
   constructor Create;
    procedure AddChild();
    property Name: string read RootName write RootName;
    property AdoDataset: TAdoDataSet read FDataSet write FDataSet;
    function SetADODataset(Connection:TAdoConnection):TAdodataset;
  end;

implementation

constructor TDBHostelNodeRoot.Create();
begin
  inherited Create;
  Actiongroup:='catHostelAct';
end;


function TDBHostelNodeRoot.SetADODataset(Connection:TAdoConnection):TAdodataset;
begin
 Dataset:= TAdoDataSet.Create(TreeView);
 Dataset.Connection:=Connection;
end;

procedure TDBHostelNodeRoot.AddChild();
begin
// no implementation required
end;

function TDBHostelNodeRoot.DoAddChildNodes: Boolean;
var new:TTreeNode;
DBInviteNode:TDBNodeInviteObject;
DBHabitatsNode:TDBNodeHabitatsObject;
begin
  Node.DeleteChildren;

new:=TreeView.Items.AddChild(Node,'Заселение');
DBInviteNode:=TDBNodeInviteObject.create(new,TreeView,true);
DBInviteNode.Name:='Заселение';
//DBInviteNode.ik:=IK;
DBInviteNode.Actiongroup:='catInvite';
DBInviteNode.BaseImageIndex:=1;
DBInviteNode.SetAdoDataset(Dataset.Connection);
new.ImageIndex:=DBInviteNode.BaseImageIndex;
new.Data:=DBInviteNode;


new:=TreeView.Items.AddChild(Node,'Проживающие');
DBHabitatsNode:=TDBNodeHabitatsObject.create(new,TreeView,true);
//DBHabitatsNode.ik:=IK;
DBHabitatsNode.Name:='Проживающие';
DBHabitatsNode.Actiongroup:='catHabitats';
DBHabitatsNode.BaseImageIndex:=1;
DBHabitatsNode.SetAdoDataset(Dataset.Connection);
new.ImageIndex:=DBHabitatsNode.BaseImageIndex;
new.Data:=DBHabitatsNode;

Result:=true;
end;


end.


