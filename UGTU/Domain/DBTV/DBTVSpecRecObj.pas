(*
  Модуль    : DBTVSpecObj
  Категория : ..
  Версия: 1.0
  Автор : Куделин С. Г.

  Назначение: Объект специальность в дереве
*)
unit DBTVspecRecObj;
{#Author sergdev@ist.ugtu.net}
interface
uses
Dialogs,
  DBTVObj,
  DBTVGroupObj,
  DBTVStudAbitObj,
  SysUtils,
  comctrls,
  db,
  ADODB,
  graphics,
  Variants;

  type
    TDBNodeSpecRecObject = class (TDBNodeObject)
    private
      FName:string;
      FShortName:string;
      FIK:integer;
      FDataSet: TADODataSet;
      FNNRecord:integer;
      FYear:integer;
      FEdFormKey:integer;
      FEdFormName:string;
      FShowExiled, FShowMoved, FShowCurrent, FShowChecked, FShowSecondary, FShowPrimary, FShowReal  : boolean;
    protected
      function DoAddChildNodes: Boolean; override;
    public
      constructor Create(Node:TTreeNode; TreeView:TTreeView); override;
      function SetADODataset(Connection:TAdoConnection):TAdodataset;
      procedure AddChild(Caption:string;ik:integer;RegNum:integer;NNabit:integer;ikzach:integer;IsPrior:boolean;Real:boolean);
      property Name: string read FName write FName;
      property ShortName: string read FShortName write FShortName;
      property ik: integer read Fik write Fik;
      property AdoDataset: TAdoDataSet read FDataSet write FDataSet;
      property NNRecord: integer read FNNRecord write FNNRecord;
      property Year: integer read FYear write FYear;
      property ShowExiled: boolean  read FShowExiled write FShowExiled;
      property ShowMoved: boolean  read FShowMoved write FShowMoved;
      property ShowCurrent: boolean  read FShowCurrent write FShowCurrent;
      property ShowChecked: boolean  read FShowChecked write FShowChecked;

      property ShowSecondary: boolean  read FShowSecondary write FShowSecondary;
      property ShowPrimary: boolean  read FShowPrimary write FShowPrimary;
      property ShowReal: boolean  read FShowReal write FShowReal;

      property EdFormKey: integer read FEdFormKey write FEdFormKey;
      property EdFormName:string read FEdFormName write FEdFormName;
    end;

implementation

uses  DBTVDekanat;

constructor TDBNodeSpecRecObject.Create(Node:TTreeNode; TreeView:TTreeView);
begin
inherited Create(Node,TreeView);
Actiongroup:='catAbitSpec';
ShowCurrent:=true;
ShowChecked:=true;
ShowReal:=true;
ShowPrimary:=true;
ShowSecondary:=true;
end;

function TDBNodeSpecRecObject.SetADODataset(Connection:TAdoConnection):TAdodataset;
begin

AdoDataset:= TAdoDataSet.Create(TreeView);
 AdoDataset.Connection:=Connection;
AdoDataset.CommandType:=cmdText;
AdoDataset.CommandText:='select * from TREE_Abit_Abiturients where (NNRecord='''+inttostr(NNRecord)+''')and(';

if ShowExiled then
AdoDataset.CommandText:=AdoDataset.CommandText+'((ik_zach=''3'')or(ik_zach=''7''))';
if ShowMoved then
if ShowExiled then
AdoDataset.CommandText:=AdoDataset.CommandText+'or(ik_zach=''2'')' else AdoDataset.CommandText:=AdoDataset.CommandText+'(ik_zach=''2'')';
if ShowCurrent then
if (ShowExiled or ShowMoved) then
AdoDataset.CommandText:=AdoDataset.CommandText+'or(ik_type_zach=''1'')' else AdoDataset.CommandText:=AdoDataset.CommandText+'(ik_type_zach=''1'')';
if ShowChecked then
if (ShowExiled or ShowMoved or ShowCurrent) then
AdoDataset.CommandText:=AdoDataset.CommandText+'or(ik_type_zach=''2'')' else AdoDataset.CommandText:=AdoDataset.CommandText+'(ik_type_zach=''2'')';

AdoDataset.CommandText:=AdoDataset.CommandText+')and(';

if ShowPrimary then ShowReal:=true;

if ShowReal then
AdoDataset.CommandText:=AdoDataset.CommandText+'(Realy_postup=''True'')';
if ShowPrimary then AdoDataset.CommandText:=AdoDataset.CommandText+'or (IsPrior=''True'')';

if ShowSecondary then
if (ShowReal or ShowPrimary) then
AdoDataset.CommandText:=AdoDataset.CommandText+'or (IsPrior=''False'')'
else AdoDataset.CommandText:=AdoDataset.CommandText+'(IsPrior=''False'')';

AdoDataset.CommandText:=AdoDataset.CommandText+') order by Namestud';

 AdoDataset.Active:=true;
 if (AdoDataset.RecordCount=0) then Node.HasChildren:=false;
 result:=AdoDataset;
end;

procedure TDBNodeSpecRecObject.AddChild(Caption:string;ik:integer;RegNum:integer;NNabit:integer;ikzach:integer; IsPrior:boolean; Real:boolean);
var new:TTreeNode;
DBnode:TDBNodeAbitStudObject;
begin
new:=TreeView.Items.AddChildFirst(Node,Caption);
DBNode:=TDBNodeAbitStudObject.create(new,TreeView);
DBNode.ik:=ik;
DBNode.id:=ik;
DBNode.RegNum:=RegNum;
DBNode.NNAbit:=nnAbit;
DBNode.name:=Caption;

DBnode.BaseImageIndex:=9;
if not IsPrior then DBnode.BaseImageIndex:=47;
if Real then DBnode.BaseImageIndex:=48;

if ikzach=2 then
DBnode.BaseImageIndex:=25;
if ikzach=3 then
DBnode.BaseImageIndex:=12;

if (ikzach=5)or(ikzach=6) then
DBnode.BaseImageIndex:=46;

new.ImageIndex:=DBnode.BaseImageIndex;
DBNode.Node:=new;
DBNode.AdoDataSet:=AdoDataSet;

if adoDataSet.FieldValues['Cvoen_zvanie']<>NULL then
DBNode.MilitaryState:=AdoDataSet.FieldValues['Cvoen_zvanie'];

new.Data:=DBnode;
end;

function TDBNodeSpecRecObject.DoAddChildNodes: Boolean;
var i:integer;
begin

Node.DeleteChildren;
SetADODataset(AdoDataSet.Connection);
AdoDataset.Last;
for i:=0 to (AdoDataset.RecordCount-1) do
begin
if (not (AdoDataset.FieldValues['NameStud']=NULL)) then
AddChild(AdoDataset.FieldValues['NameStud'],AdoDataset.FieldValues['ncode'],AdoDataset.FieldValues['RegNomer'],AdoDataset.FieldValues['nn_abit'],AdoDataset.FieldValues['ik_zach'], AdoDataset.FieldValues['IsPrior'], AdoDataset.FieldValues['Realy_Postup'])
else AddChild('Безымянный',AdoDataset.FieldValues['ncode'],AdoDataset.FieldValues['RegNomer'],AdoDataset.FieldValues['nn_abit'],AdoDataset.FieldValues['ik_zach'], AdoDataset.FieldValues['IsPrior'],AdoDataset.FieldValues['Realy_Postup']);
AdoDataset.prior;
end;
Result:=true;

end;

end.
