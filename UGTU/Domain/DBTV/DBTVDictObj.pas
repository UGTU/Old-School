(*
  Модуль    : DBTVDictObj
  Категория : ..
  Версия: 1.0
  Автор : Куделин С. Г.

  Назначение: Объект справочники в дереве
*)
unit DBTVDictObj;
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
    TDBNodeDictObject = class (TDBNodeObject)
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

function TDBNodeDictObject.DoAddChildNodes: Boolean;
begin
result:=true;
end;

  constructor TDBNodeDictObject.Create(Node:TTreeNode; TreeView:TTreeView; IsTerminal:boolean);
begin
  inherited Create;
  Actiongroup:='none';
 
end;

end.
