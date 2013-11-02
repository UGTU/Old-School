(*
  Модуль    : DBTVScheduleObj
  Категория : ..
  Версия: 1.0
  Автор : Куделин С. Г.

  Назначение: Объект Расписание в дереве
*)
unit DBTVScheduleObj;
{#Author sergdev@ist.ugtu.net}
interface
uses
Dialogs,
  DBTVObj,
  SysUtils,
  comctrls,
  db,
  ADODB,
  graphics,
  Variants;

  type
    TDBNodeScheduleObject = class (TDBNodeObject)
    private
      FName:string;
      FIK:integer;
      protected
    function DoAddChildNodes: Boolean; override;

    public
    constructor Create(Node:TTreeNode; TreeView:TTreeView; IsTerminal:boolean);
      property Name: string read FName write FName;
      property ik: integer read Fik write Fik;
    end;

implementation

  constructor TDBNodeScheduleObject.Create(Node:TTreeNode; TreeView:TTreeView; IsTerminal:boolean);
begin
  inherited Create;
 
end;

function TDBNodeScheduleObject.DoAddChildNodes: Boolean;
begin
result:=false;
end;

end.
 