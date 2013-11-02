(*
  Категория : ..
  Версия: 0.5
  Автор : Куделин С. Г.

  Назначение: Объект "Персона" ветки "Проживающие" в дереве
*)
unit DBTVHabitatsPersonObj;
  {#Author sergdev@ist.ugtu.net}
interface
uses  Dialogs,
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


  type TAdress = record

  end;
  type
  TDBNodeHabitatsPersonObject = class (TDBNodeHostelRootPersonObject)
  private
  FName:string;

  protected
    function DoAddChildNodes: Boolean; override;
  public
    //ncode:integer;
    procedure Refresh;
    function SetADODataset(Connection:TAdoConnection):TAdodataset;
    procedure AddChild(Caption:string;IK:integer;HasAddSpec:boolean);
    property Name: string read FName write FName;
  end;

implementation

function TDBNodeHabitatsPersonObject.SetADODataset(Connection:TAdoConnection):TAdodataset;
begin
 //no implementation required
end;


procedure TDBNodeHabitatsPersonObject.AddChild;
begin
 //no implementation required
 //result:= false;
end;

function TDBNodeHabitatsPersonObject.DoAddChildNodes: Boolean;
begin
//no implementation required
  result:= false;
end;

procedure TDBNodeHabitatsPersonObject.Refresh;
  begin
  LoadData;
end;

end.



