unit DBTVWorkTypeObj;
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
  Variants,
  Classes;


  type
    TDBNodeWorkTypeObject = class (TDBNodeObject)
    private
      FName:string;
      FShortName:string;
      FOrderID:integer;
      FIK:integer;
      FKafIK: integer;
      FIK_semtype:integer;
      FIK_Year:integer;
      fiTab_n: integer;
      FDataSet: TADODataSet;
    protected
      function DoAddChildNodes: Boolean; override;
    public
      constructor Create(Node:TTreeNode; TreeView:TTreeView; IsTerminal:boolean);
      procedure LoadData;
      property Name: string read FName write FName;
      property ShortName: string read FShortName write FShortName;
      property ik: integer read Fik write Fik;
      property KafIK: integer read FKafIK write FKafIK;
      property IK_Semtype: integer read FIK_semtype write FIK_semtype;
      property IK_Year: integer read FIK_Year write FIK_Year;
      property AdoDataset: TAdoDataSet read FDataSet write FDataSet;
      property OrderID: integer read FOrderID write FOrderID;
      property iTab_n: integer read fiTab_n write fiTab_n;
    end;

implementation

{ TDBNodeWorkTypeObject }

constructor TDBNodeWorkTypeObject.Create(Node: TTreeNode; TreeView: TTreeView;
  IsTerminal: boolean);
begin
  inherited Create;
  Actiongroup:= 'catNagruzkaPrep';
end;

function TDBNodeWorkTypeObject.DoAddChildNodes: Boolean;
begin
result:=false;
end;

procedure TDBNodeWorkTypeObject.LoadData;
begin
   // not implemented
end;

end.
