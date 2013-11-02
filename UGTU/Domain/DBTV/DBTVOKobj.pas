(*
  Модуль    : DBTVOKObj
  Категория : ..
  Версия: 1.0
  Автор : Куделин С. Г.

  Назначение: Объект "Отдел кадров" в дереве
*)
unit DBTVOKObj;
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
    TDBNodeOKObject = class (TDBNodeObject)
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

function TDBNodeOKObject.DoAddChildNodes: Boolean;
begin
result:=false;
end;

  constructor TDBNodeOKObject.Create(Node:TTreeNode; TreeView:TTreeView; IsTerminal:boolean);
begin
  inherited Create;
  Actiongroup:='none';
 
end;

end.
