(*
  Модуль    : DBTVAbitObj
  Категория : ..
  Версия: 0.5
  Автор : Куделин С. Г.

  Назначение: Объект Абитуриент в дереве
*)
unit DBTVHostelRequestObj;
  {#Author sergdev@ist.ugtu.net}
interface
uses  Dialogs,
  DBTVFacObj,
  DBTVAbitYearObj,
   DBTVZachObj,
  DBTVObj,
  DBTV,
  SysUtils,
  comctrls,
  db,
  graphics,
  ADODB,
  Variants,
  DateUtils,
  DBTVHostelRootPersonobj;


  type
  TDBNodeHostelRequestObject = class (TDBNodeHostelRootPersonObject)
  private
  FName:string;
  //FShowAllYears: boolean;

  protected
    function DoAddChildNodes: Boolean; override;
  public
    ik:integer;
    //ncode:integer;
    procedure Refresh;
    function SetADODataset(Connection:TAdoConnection):TAdodataset;
    procedure AddChild(Caption:string;IK:integer;HasAddSpec:boolean);
    property Name: string read FName write FName;
  end;

implementation

function TDBNodeHostelRequestObject.SetADODataset(Connection:TAdoConnection):TAdodataset;
begin
//no implementation required

end;


procedure TDBNodeHostelRequestObject.AddChild(Caption:string;IK:integer;HasAddSpec:boolean);
var new:TTreeNode;
DBNode:TDBNodeAbitYearObject;
begin
//no implementation required
end;

function TDBNodeHostelRequestObject.DoAddChildNodes: Boolean;
begin
//no implementation required
end;

procedure TDBNodeHostelRequestObject.Refresh;
begin
  LoadData;
end;

end.



