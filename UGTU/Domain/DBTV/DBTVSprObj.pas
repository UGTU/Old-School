unit DBTVSprObj;

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
    TDBNodeSprObject = class (TDBNodeObject)
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

  function TDBNodeSprObject.DoAddChildNodes: Boolean;
  begin
  result:=false;
  end;

  constructor TDBNodeSprObject.Create(Node:TTreeNode; TreeView:TTreeView; IsTerminal:boolean);
begin
  inherited Create;

end;

end.
