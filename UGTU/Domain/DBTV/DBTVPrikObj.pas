(*
  ������    : DBTVDictObj
  ��������� : ..
  ������: 1.0
  ����� : ������� �. �.

  ����������: ������ ������� � ������
*)
unit DBTVPrikObj;
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
    TDBNodePrikObject = class (TDBNodeObject)
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

function TDBNodePrikObject.DoAddChildNodes: Boolean;
begin
result:=false;
end;

  constructor TDBNodePrikObject.Create(Node:TTreeNode; TreeView:TTreeView; IsTerminal:boolean);
begin
  inherited Create;
    Actiongroup:='catPrikaz';
end;

end.
 