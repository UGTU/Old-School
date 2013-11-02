(*
  Модуль    : DBTVMethodWorkTeacherObj
  Категория : ..
  Версия: 1.0
  Автор : Куделин С. Г.

  Назначение: Объект преподаватель в дереве
*)
unit DBTVMethodWorkTeacherobj;
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
    TDBNodeMethodWorkTeacherObject = class (TDBNodeObject)
    private
      FName:string;
      FOrderID:integer;
      FFirstName,FLastName,FMiddleName:string;

      FIK:integer;
      FDataSet: TADODataSet;
      fDegreeName: string;
      fCapacityName: string;
      fRankName: string;
      FIKk:integer;
    protected
    function DoAddChildNodes: Boolean; override;

    public
    constructor Create(Node:TTreeNode; TreeView:TTreeView; IsTerminal:boolean);

    procedure LoadData;
    property Name: string read FName write FName;
    property FirstName: string read FFirstName write FFirstName;
    property LastName: string read FLastName write FLastName;
    property MiddleName: string read FMiddleName write FMiddleName;
    property DegreeName: string read fDegreeName write fDegreeName;
    property RankName: string read fRankName write fRankName;
    property CapacityName: string read fCapacityName write fCapacityName;
    property ik: integer read Fik write Fik;
    property KafIK: integer read Fikk write Fikk;
    property OrderID: integer read FOrderID write FOrderID;

    property AdoDataset: TAdoDataSet read FDataSet write FDataSet;

    end;

implementation


  function TDBNodeMethodWorkTeacherObject.DoAddChildNodes: Boolean;
begin
result:=false;
end;

procedure TDBNodeMethodWorkTeacherObject.LoadData;

  begin
 // not implemented

  end;

  constructor TDBNodeMethodWorkTeacherObject.Create(Node:TTreeNode; TreeView:TTreeView; IsTerminal:boolean);
begin
  inherited Create;
  Actiongroup:='none';
end;

end.

