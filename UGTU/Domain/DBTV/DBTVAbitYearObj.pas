(*
  Модуль    : DBTVAbitYearObj
  Категория : ..
  Версия: 0.5
  Автор : Куделин С. Г.

  Назначение: Объект Абитуриент в дереве
*)
unit DBTVAbitYearObj;
  {#Author sergdev@ist.ugtu.net}
interface
uses  Dialogs,
  DBTVFacObj,
  DBTVRecruitObj,
  DBTVScheduleObj,
   DBTVZachObj,
  DBTVObj,
  DBTV,
  SysUtils,
  comctrls,
  db,
  graphics,
  ADODB,
  Variants;


  type
  TDBNodeAbitYearObject = class (TDBNodeObject)
  private
  FName:string;
  FIK:integer;
  FHasAddSpec:boolean;

  protected
    function DoAddChildNodes: Boolean; override;
  public
    property Name: string read FName write FName;
    property ik: integer read FIK write FIK;
    property HasAddSpec: boolean read FHasAddSpec write FHasAddSpec;
  end;

implementation


function TDBNodeAbitYearObject.DoAddChildNodes: Boolean;
var new:TTreeNode;
DBRecruitNode:TDBNodeRecruitObject;
DBScheduleNode:TDBNodeScheduleObject;
DBEnterNode:TDBNodeZachObject;
begin
  Node.DeleteChildren;

new:=TreeView.Items.AddChild(Node,'Приём заявлений');
DBRecruitNode:=TDBNodeRecruitObject.create(new,TreeView,true);
DBRecruitNode.Name:='Приём заявлений';
DBRecruitNode.ik:=IK;
DBRecruitNode.Actiongroup:='catRecruit';
DBRecruitNode.BaseImageIndex:=23;
DBRecruitNode.SetAdoDataset(Dataset.Connection);
new.ImageIndex:=DBRecruitNode.BaseImageIndex;
new.Data:=DBRecruitNode;


new:=TreeView.Items.AddChild(Node,'Вступительные экзамены');
DBScheduleNode:=TDBNodeScheduleObject.create(new,TreeView,true);
DBScheduleNode.ik:=IK;
DBScheduleNode.Name:='Вступительные экзамены';
DBScheduleNode.Actiongroup:='catSchedule';
DBScheduleNode.BaseImageIndex:=21;
new.ImageIndex:=DBScheduleNode.BaseImageIndex;
new.Data:=DBScheduleNode;

 new:=TreeView.Items.AddChild(Node,'Зачисление');
DBEnterNode:=TDBNodeZachObject.create(new,TreeView);
DBEnterNode.Name:='Зачисление';
DBEnterNode.Actiongroup:='catEnter';
DBEnterNode.ik:=IK;
DBEnterNode.BaseImageIndex:=26;
DBEnterNode.SetAdoDataset(Dataset.Connection);
new.ImageIndex:=DBEnterNode.BaseImageIndex;
new.Data:=DBEnterNode;


Result:=true;
end;

end.



