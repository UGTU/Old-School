(*
  Модуль    : DBTVRIOYearObj
  Категория : ..
  Версия: 0.5
  Автор : Куделин С. Г.

  Назначение: Объект Год издания в дереве
*)
unit DBTVRIOYearObj;
{#Author sergdev@ist.ugtu.net}
interface
uses  Dialogs,
  DBTVFacObj,
  DBTVRIOPlanObj,
  DBTVRIOPrintOrderObj,
  DBTVObj,
  DBTV,
  SysUtils,
  comctrls,
  db,
  graphics,
  ADODB,
  Variants;


  type
  TDBNodeRIOYearObject = class (TDBNodeObject)
  private
  FName:string;
  FIK:integer;


  protected
    function DoAddChildNodes: Boolean; override;
  public
    property Name: string read FName write FName;
     property ik: integer read FIK write FIK;
  end;

implementation


function TDBNodeRIOYearObject.DoAddChildNodes: Boolean;
var new:TTreeNode;
DBPlanNode:TDBNodeRIOPlanObject;
DBOrderNode:TDBNodeRIOPrintorderObject;
begin
  Node.DeleteChildren;

new:=TreeView.Items.AddChild(Node,'План издания');
DBPlanNode:=TDBNodeRIOPlanObject.create(new,TreeView,true);
DBPlanNode.Name:='План издания';
DBPlanNode.ik:=IK;
DBPlanNode.Actiongroup:='catPlanIzd';
DBPlanNode.BaseImageIndex:=23;
new.ImageIndex:=DBPlanNode.BaseImageIndex;
new.Data:=DBPlanNode;

new:=TreeView.Items.AddChild(Node,'Заявки');
DBOrderNode:=TDBNodeRIOPrintorderObject.create(new,TreeView,true);
DBOrderNode.Name:='Заявки';
DBOrderNode.ik:=IK;
DBOrderNode.Actiongroup:='catPrintOrder';
DBOrderNode.BaseImageIndex:=23;
new.ImageIndex:=DBOrderNode.BaseImageIndex;
new.Data:=DBOrderNode;

Result:=true;
end;

end.



