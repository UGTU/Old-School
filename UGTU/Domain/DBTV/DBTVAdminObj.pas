(*
  Модуль    : DBTVAdminObj
  Категория : ..
  Версия: 1.0
  Автор : Куделин С. Г.

  Назначение: Объект Администрирование в дереве
*)
unit DBTVAdminObj;
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
    TDBNodeAdminObject = class (TDBNodeObject)
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

  function TDBNodeAdminObject.DoAddChildNodes: Boolean;
  begin
  result:=false;
  end;

  constructor TDBNodeAdminObject.Create(Node:TTreeNode; TreeView:TTreeView; IsTerminal:boolean);
begin
  inherited Create;
 
end;

end.
