unit uQMController;
  {#Author sergdev@ist.ugtu.net}


interface
uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, uDM,GR32_Image,
  uVisualDBObjectsForQM, uQMDataModule, adodb, db;


type
TDBFilter = class
public
   command:string;
   commandRus:string;
   Param1DBname:string;
   Param2DBname:string;
   param1:variant;
   param2:variant;

   function BuildRusCommand:string;
   function BuildSQLCommand:string;
   function CheckParams:boolean;
end;

type
 TDBObject = class
  protected
  FID: integer;
  FDBName:string;
  FCaption:string;
  FVisualObject: TVBlock;

    constructor Create(ID:integer;dbname:string;Caption:string);
    public
    property ID: integer read FID;
    Property DBName :string read FDbname;
  end;


type
  TDBField = class(TDBObject)
  protected
  FChecked:boolean;
  FVisible:boolean;
  FVisualObject: TVDBItem;
  FFilters:TList;
  FIsOrderField:boolean;
  FMode:string;

  function CreateVisual(im:Timage32):TVDBItem;
  constructor Create(ID:integer;dbname:string;Caption:string;visible:boolean);

  public
  property IsOrderField:boolean read FIsOrderField write FIsOrderField;
  property Mode:string read FMode write Fmode;

  function BuildRusFilter:TStrings;
  function BuildSQLFilter:TStrings;

  procedure Check;
  procedure DeleteLastFilter;
  procedure FreeThis;

  end;

  type
  TDBEntity = class(TDBObject)
  protected
  FFields: TList;
  FVisualObject: TVDBEntity;
  FIsDispatched:boolean;

  constructor Create(ID:integer;dbname:string;Caption:string);
  function CreateVisual(im:Timage32):TVDBEntity;
  procedure AddField(field:TDBField);
  public
  procedure FreeThis;
   function FieldByIK(ik:integer): TDBField;
  end;

type
  TDBRelation = class(TDBObject)
  protected
  FLeftKey:TDBField;
  FRightKey:TDBField;
  FLeft:TDBEntity;
  FRight:TDBEntity;
  FVisualObject:TVDBRelation;

  public
  constructor Create(id:integer; LeftKey:TDBField; RightKey:TDBField;  Left:TDBEntity; Right:TDBEntity);
  procedure FreeThis;
     property ID: integer read FID;
  end;

  type
  TRelation = class
  protected
  FLeftID:integer;
  FRightID:integer;
  FDontSeek:boolean;
  public
     function OtherSide(ik:integer):integer;

     property LeftID: integer read FLeftID;
     property RightID:integer read FRightID;
     property DontSeek: boolean read FDontSeek write FDontSeek;
     constructor Create(ik1:integer;ik2:integer);
  end;

type
  TQMQueryController = class (TComponent)
  private

   FResultDataset:TADODataSet;
  FTableDataset:TAdoDataset;
  FFieldsDataset:TAdoDataset;
  FRelationsDataset:TAdoDataset;
  FEntities:TList;
  FRelations:TList;
  FCommand:TStrings;
  FImage:TImage32;
  FMode:string;
  FPathFound:boolean;
  FRelationsMap:Tlist;
  FSortList:TList;
  FGroupBy:boolean;
  
    function GetFieldsDataset: TAdoDataset;
    function GetRelationsDataset: TAdoDataset;
    procedure SetFieldsDataset(const Value: TAdoDataset);
    procedure SetRelationsDataset(const Value: TAdoDataset);
    function GetTableDataset : TAdoDataset;
    procedure SetTableDataset(val : TAdoDataset);
    procedure SyncRelations;
    procedure SyncFieldChecks;
    procedure LoadRelationsMap;
    function GetFieldsForQuery: Tstrings;
    function GetTablesArrayForQuery: Tstrings;
    function GetFiltersForQuery:TStrings;
    function GetOrderForQuery:TStrings;
    function GetGroupForQuery:TStrings;
    function GetParametersForQuery:TStrings;
    function FindNonDispatchedRelation(ent:TDBEntity):TDBRelation;
    function FindRelationsWith(ik:integer):TList;
    function FindRelationWith(ik1:integer;ik2:integer):TRelation;
    procedure AddEntity(ik:integer);
    procedure Relate(Ent:TDBEntity);


  protected

  //published
  public

    var
    property TableDataset : TAdoDataset read GetTableDataset write SetTableDataset;
    property FieldsDataset : TAdoDataset read GetFieldsDataset write SetFieldsDataset;
    property RelationsDataset : TAdoDataset read GetRelationsDataset write SetRelationsDataset;
    property Command: Tstrings read Fcommand;
    property ResultDataset: TADODataSet read FResultDataset;
    property Mode: string read FMode write FMode;
    property GroupBy: boolean read FGroupBy write FGroupBy;

    function EntityByIK(ik:integer): TDBEntity;
    function EntityByVisual(vis:TVDBEntity): TDBEntity;
    function FieldByVisual(vis:TVDBItem): TDBField;
    function FieldByIK(ik:integer): TDBField;
    function RelationByIK(ik:integer): TDBRelation;
    function CountCheckedFields: integer;
    function FindRoute(ik1:integer;ik2:integer; IKRouteList:TList):TList;
    function SaveToFile(fname:string):boolean;
    function ReadFromFile(fname:string):boolean;

    procedure AddSortField(field:TDBField);
    procedure RemoveSortField(field:TDBField);
    function IsInSortList(field:TDBField):Boolean;
    procedure GetRusFilters(lb:TListbox);
    procedure DirectFieldsDataset;
    procedure CreateEntity(DoRelate:boolean);
    procedure AddFilter(field:TDBField; filter:TDBFilter);
    procedure DeleteFilter(filter:TDBFilter);
    procedure DestroyEntity(ent:TDBEntity);
    procedure BuildQuery;
    procedure ExecuteQuery;
    PROCEDURE ResetRelationsMap;

    constructor Create(tableds:TAdoDataset; fieldsds:TAdoDataset; relds:TAdoDataset; image:TImage32);

  end;

implementation

procedure TQMQueryController.AddEntity(ik: integer);
var
  SearchOptions: TLocateOptions;
begin
  SearchOptions := [loPartialKey];
  FTableDataset.Locate('ik_table', ik, SearchOptions);
  DirectFieldsDataset;
  CreateEntity(false);
end;

procedure TQMQueryController.AddFilter(field: TDBField; filter:TDBFilter );
begin
field.FFilters.Add(filter);
end;

procedure TQMQueryController.AddSortField(field: TDBField);
begin
FSortList.Add(field);
end;

procedure TQMQueryController.BuildQuery;
begin
FCommand:=TStringList.Create;
SyncFieldChecks;

FCommand.AddStrings(GetParametersForQuery);

FCommand.Add('SELECT ');

if Fmode='Average' then
FCommand.Add('AVG( ');
if Fmode='Count' then
FCommand.Add('Count(*) ') else

FCommand.AddStrings(GetFieldsForQuery);

if (Fmode='Average') then
FCommand.Add(')');

FCommand.Add('FROM ');
FCommand.AddStrings(GetTablesArrayForQuery);

FCommand.AddStrings(GetFiltersForQuery);

if GroupBy then FCommand.AddStrings(GetGroupForQuery);
FCommand.AddStrings(GetOrderForQuery);

end;

procedure TQMQueryController.GetRusFilters(lb: TListbox);
var i,j,k:integer;
filter:TDBFilter;
begin
lb.Clear;
for i := 0 to FEntities.Count - 1 do
For j:= 0 to (TDBEntity(FEntities.Items[i]).FFields.Count-1) do
For k:= 0 to (TDBField(TDBEntity(FEntities.Items[i]).FFields[j]).FFilters.Count-1) do
begin
filter:=(TDBField(TDBEntity(FEntities.Items[i]).FFields[j]).FFilters.Items[k]);
lb.Items.AddObject(TDBField(TDBEntity(FEntities.Items[i]).FFields[j]).FCaption+' '+filter.BuildRusCommand,filter);
end;
end;

function TQMQueryController.CountCheckedFields: integer;
var i,j:integer;
begin
result:=0;
 for I := 0 to FEntities.Count - 1 do
 for j := 0 to (TDBEntity(FEntities.Items[i]).FFields.Count-1) do
 if TDBField(TDBEntity(FEntities.Items[i]).FFields.Items[j]).FVisualObject<>nil then
 if TVDBItem(TDBField(TDBEntity(FEntities.Items[i]).FFields.Items[j]).FVisualObject).Checked then inc(result);

end;

constructor TQMQueryController.Create(tableds, fieldsds, relds: TAdoDataset; image:Timage32);
begin
TableDataset:=tableds;
RelationsDataset:=relds;
FieldsDataset:=fieldsds;
FImage:=image;
FEntities:=Tlist.Create;
FRelations:=Tlist.Create;
FSortList:=TList.Create;

FResultDataset:=TADODataSet.Create(nil);
FResultDataset.Connection:=Dm.DBConnect;
FMode:='none';
LoadRelationsMap;
end;

procedure TQMQueryController.CreateEntity(DoRelate:boolean);
var i:integer;
entity:TDBEntity;
begin
if EntityByIK(FTableDataset.FieldByName('ik_table').Value)<>nil then exit;

if FTableDataset.FieldByName('ctable_caption').Value<>Null then
entity:=TDBEntity.Create(FTableDataset.FieldByName('ik_table').Value,FTableDataset.FieldByName('ctable_name').Value,FTableDataset.FieldByName('ctable_caption').Value)
else
entity:=TDBEntity.Create(FTableDataset.FieldByName('ik_table').Value,FTableDataset.FieldByName('ctable_name').Value,'');


FieldsDataset.First;
for I := 0 to (FieldsDataset.RecordCount - 1) do
begin
if FieldsDataset.FieldByName('cfield_caption').Value<>Null then
entity.AddField(TDBField.Create(FieldsDataset.FieldByName('ik_field').Value,FTableDataset.FieldByName('ctable_name').Value+'.'+FieldsDataset.FieldByName('cfield_name').Value,FieldsDataset.FieldByName('cfield_caption').Value, FieldsDataset.FieldByName('lvisible').Value))
else
entity.AddField(TDBField.Create(FieldsDataset.FieldByName('ik_field').Value,FTableDataset.FieldByName('ctable_name').Value+'.'+FieldsDataset.FieldByName('cfield_name').Value,'', FieldsDataset.FieldByName('lvisible').Value));

FieldsDataset.next;
end;
entity.CreateVisual(Fimage);
FEntities.add(entity);
if DoRelate then Relate(entity);

SyncRelations;
end;


procedure TQMQueryController.DeleteFilter(filter: TDBFilter);
var i,j,k:integer;
fil:TDBFilter;
begin
for i := 0 to FEntities.Count - 1 do
For j:= 0 to (TDBEntity(FEntities.Items[i]).FFields.Count-1) do
For k:= 0 to (TDBField(TDBEntity(FEntities.Items[i]).FFields[j]).FFilters.Count-1) do
begin
fil:=(TDBField(TDBEntity(FEntities.Items[i]).FFields[j]).FFilters.Items[k]);
if fil=filter then
TDBField(TDBEntity(FEntities.Items[i]).FFields[j]).FFilters.Remove(filter);
end;

end;

procedure TQMQueryController.DestroyEntity(ent: TDBEntity);
var rel:TDBRelation;
begin
rel:=FindNonDispatchedRelation(ent) ;
while rel<>nil do
begin
FRelations.Remove(rel);
rel.FreeThis;
rel:=FindNonDispatchedRelation(ent) ;
end;

FEntities.Remove(ent);
ent.FreeThis;

end;

procedure TQMQueryController.DirectFieldsDataset;
begin
FieldsDataset.Active:=False;
FieldsDataset.CommandText:='select * from QM_Fields where ik_table='''+inttostr(TableDataset.FieldByName('ik_table').value)+'''';
FieldsDataset.Active:=true;
end;

function TQMQueryController.EntityByIK(ik: integer): TDBEntity;
var i:integer;
begin
result:=nil;
for I := 0 to FEntities.Count - 1 do
if TDBEntity(FEntities.Items[i]).ID=ik then
begin
result:=FEntities.Items[i];
exit;
  end;
end;

function TQMQueryController.EntityByVisual(vis:TVDBEntity): TDBEntity;
var i:integer;
begin
result:=nil;
 for I := 0 to FEntities.Count - 1 do
 if TDBEntity(FEntities.Items[i]).FVisualObject=vis then
 result:=FEntities.Items[i];

end;


procedure TQMQueryController.ExecuteQuery;
begin
FResultDataset.Active:=False;
FResultDataset.CommandType:=cmdText;
FResultDataset.CommandText:=Command.Text;
FResultDataset.Active:=true;
end;

function TQMQueryController.FieldByIK(ik: integer): TDBField;
var i,j:integer;
begin
result:=nil;
 for I := 0 to FEntities.Count - 1 do
 for j := 0 to (TDBEntity(FEntities.Items[i]).FFields.Count-1) do
 if TDBField(TDBEntity(FEntities.Items[i]).FFields.Items[j]).FID=ik
 then result:=TDBField(TDBEntity(FEntities.Items[i]).FFields.Items[j]);
end;

function TQMQueryController.FieldByVisual(vis: TVDBItem): TDBField;
var i,j:integer;
begin
result:=nil;
 for I := 0 to FEntities.Count - 1 do
 for j := 0 to (TDBEntity(FEntities.Items[i]).FFields.Count-1) do
 if TDBField(TDBEntity(FEntities.Items[i]).FFields.Items[j]).FVisualObject=vis
 then result:=TDBField(TDBEntity(FEntities.Items[i]).FFields.Items[j]);
end;

function TQMQueryController.FindNonDispatchedRelation(ent:TDBEntity): TDBRelation;
var i:integer;
begin
result:=nil;
for i:= 0 to (FRelations.Count - 1) do
if ((not(TDBRelation(FRelations.Items[i]).FLeft.FIsDispatched))or(not(TDBRelation(FRelations.Items[i]).FRight.FIsDispatched)))
and((TDBRelation(FRelations.Items[i]).FLeft=ent)or(TDBRelation(FRelations.Items[i]).Fright=ent)) then
begin
result:=FRelations.Items[i];
exit;
end;

end;


function TQMQueryController.FindRelationsWith(ik: integer): TList;
var i:integer;
begin
result:=TList.Create;
for i:=0 to (FRelationsMap.Count-1)  do
begin
if ((TRelation(FRelationsMap.Items[i]).FLeftID=ik)or(TRelation(FRelationsMap.Items[i]).FRightID=ik))and(not (TRelation(FRelationsMap.Items[i]).FDontSeek)) then
Result.Add(FRelationsMap.Items[i]);
end;
end;

function TQMQueryController.FindRelationWith(ik1, ik2: integer): TRelation;
var i:integer;
begin
result:=nil;
for i:=0 to (FRelationsMap.Count-1)  do
begin
if ((TRelation(FRelationsMap.Items[i]).FLeftID=ik1)or(TRelation(FRelationsMap.Items[i]).FRightID=ik1))
and ((TRelation(FRelationsMap.Items[i]).FLeftID=ik2)or(TRelation(FRelationsMap.Items[i]).FRightID=ik2)) then
begin
Result:=(FRelationsMap.Items[i]);
exit;
end;
end;

end;

function TQMQueryController.FindRoute(ik1, ik2: integer;
  IKRouteList: TList): TList;
var i,j:integer;
otherRelations:TList;
otherList:Tlist;
rel:Trelation;
  begin
OtherList:=nil;
Result:=IKRouteList;


if result=nil then result:=TList.create;


  if FindRelationWith(ik1,ik2)=nil then
  begin
  otherRelations:=FindRelationsWith(ik1);
  for i := 0 to otherRelations.Count - 1 do
  begin
  if OtherList=nil then
  OtherList:=Tlist.create else
  OtherList.Clear;
  if IKRouteList<>nil then
  for j := 0 to IKRouteList.Count - 1 do
  begin
  //rel:=IKRouteList.Items[j];
  OtherList.Add(IKRouteList.Items[j]);
  end;

  rel:=otherRelations.Items[i];

  OtherList.Add(rel);
  TRelation(otherRelations.Items[i]).FDontSeek:=true;
  result:=FindRoute(TRelation(otherRelations.Items[i]).OtherSide(ik1),ik2,otherList);
  if FPathfound then begin
  exit;
  end;
  end;
  OtherList.Free;
  end else
  begin
  result.Add(FindRelationWith(ik1,ik2));
  FPathfound:=true;
  end;

end;

function TQMQueryController.GetFieldsDataset: TAdoDataset;
begin
result:=FFieldsDataset;
end;

function TQMQueryController.GetFieldsForQuery: Tstrings;
var i,j:integer;
first:boolean;
field:TDBField;
begin
first:=true;
result:=TStringlist.Create;
for i := 0 to FEntities.Count - 1 do
For j:= 0 to (TDBEntity(FEntities.Items[i]).FFields.Count-1) do
begin
Field:=TDBField(TDBEntity(FEntities.Items[i]).FFields.Items[j]);
if Field.FChecked then
if First then begin
if (Field.FCaption<>'') then
begin
if field.Mode='Avg' then result.Add('AVG('+Field.FDBName+')'+' AS [Среднее_'+Field.FCaption+']') else
if field.Mode='Max' then result.Add('Max('+Field.FDBName+')'+' AS [Наибольшее_'+Field.FCaption+']') else
if field.Mode='Min' then result.Add('Min('+Field.FDBName+')'+' AS [Наименьшее_'+Field.FCaption+']') else
result.Add(Field.FDBName+' AS ['+Field.FCaption+']')
end
else begin
if field.Mode='Avg' then result.Add('AVG('+Field.FDBName+')') else
if field.Mode='Max' then result.Add('Max('+Field.FDBName+')') else
if field.Mode='Min' then result.Add('Min('+Field.FDBName+')') else
result.Add(Field.FDBName);
end;
First:=false;
end else
if (Field.FCaption<>'') then begin
if field.Mode='Avg' then result.Add(', '+'AVG('+Field.FDBName+')'+' AS [Среднее_'+Field.FCaption+']') else
if field.Mode='Max' then result.Add(', '+'Max('+Field.FDBName+')'+' AS [Наибольшее_'+Field.FCaption+']') else
if field.Mode='Min' then result.Add(', '+'Min('+Field.FDBName+')'+' AS [Наименьшее_'+Field.FCaption+']') else
result.Add(', '+Field.FDBName+' AS ['+Field.FCaption+']')
end
else
begin
if field.Mode='Avg' then result.Add('AVG('+Field.FDBName+')') else
if field.Mode='Max' then result.Add('Max('+Field.FDBName+')') else
if field.Mode='Min' then result.Add('Min('+Field.FDBName+')') else
result.Add(', '+Field.FDBName+'');

end;
end;
end;



function TQMQueryController.GetFiltersForQuery: TStrings;
var i,j:integer;
first:boolean;
//field:TDBField;
begin
first:=true;
result:=TStringlist.Create;
for i := 0 to FEntities.Count - 1 do
For j:= 0 to (TDBEntity(FEntities.Items[i]).FFields.Count-1) do
if (TDBField(TDBEntity(FEntities.Items[i]).FFields.Items[j]).FFilters.Count>0) then
begin
if First then begin
result.Add(' WHERE (');
First:=false;
end else
result.Add(' AND (');
result.AddStrings(TDBField(TDBEntity(FEntities.Items[i]).FFields.Items[j]).BuildSQLFilter);
result.Add(') ');
end;
end;

function TQMQueryController.GetGroupForQuery: TStrings;
var i,j:integer;
first:boolean;
field:TDBField;
begin
first:=true;
result:=TStringlist.Create;

for i := 0 to FEntities.Count - 1 do
For j:= 0 to (TDBEntity(FEntities.Items[i]).FFields.Count-1) do
begin
Field:=TDBField(TDBEntity(FEntities.Items[i]).FFields.Items[j]);
if (Field.Mode<>'Avg')and(Field.Mode<>'Max')and(Field.Mode<>'Min')and(Field.FChecked) then
if First then begin
result.Add(' GROUP BY ');
result.Add(Field.DBName);
First:=false;
end else
result.Add(', '+Field.DBName);

end;
end;

function TQMQueryController.GetOrderForQuery: TStrings;
var i:integer;
first:boolean;
//field:TDBField;
begin
first:=true;
result:=TStringlist.Create;
for i := 0 to FSortList.Count - 1 do
begin
if First then begin
result.Add(' ORDER BY ');
result.Add(TDBField(FSortList.Items[i]).DBName);
First:=false;
end else
result.Add(', '+TDBField(FSortList.Items[i]).DBName);

end;
end;

function TQMQueryController.GetParametersForQuery: TStrings;
var i,j,k:integer;
Num:integer;
filter:TDBFilter;
begin
result:=TStringlist.Create;
num:=0;
for i := 0 to FEntities.Count - 1 do
For j:= 0 to (TDBEntity(FEntities.Items[i]).FFields.Count-1) do
For k:= 0 to (TDBField(TDBEntity(FEntities.Items[i]).FFields.Items[j]).FFilters.Count-1) do
begin

Filter:=TDBField(TDBEntity(FEntities.Items[i]).FFields.Items[j]).FFilters[k];
filter.Param1DBname:='@param'+inttostr(num);
inc(num);
Result.Add('Declare '+Filter.Param1DBname+' varchar('+inttostr(length(filter.param1)+2)+');');
if filter.command='LIKE' then
Result.Add('set '+Filter.Param1DBname+'=''%'+filter.param1+'%'';') else
Result.Add('set '+Filter.Param1DBname+'='''+filter.param1+''';');

if (filter.command='BETWEEN')or(filter.command='NOT BETWEEN') then
begin
filter.Param2DBname:='@param'+inttostr(num);
inc(num);
Result.Add('Declare '+Filter.Param2DBname+' varchar('+inttostr(length(filter.param2))+');');
Result.Add('set '+Filter.Param2DBname+'='''+filter.param2+''';');
end;
result.Add('');
end;
end;

function TQMQueryController.GetRelationsDataset: TAdoDataset;
begin
result:=FRelationsDataset;
end;

function TQMQueryController.GetTableDataset: TAdoDataset;
begin
result:=FTableDataset;
end;

function TQMQueryController.GetTablesArrayForQuery: Tstrings;
var i:integer;
//first:boolean;
current,candidate:TDBEntity;
candidates:TList;
rel: TDBRelation;
begin
try
candidates:=Tlist.create;
result:=TStringlist.Create;
Result.Add(TDBEntity(FEntities.Items[0]).DBName);
TDBEntity(FEntities.Items[0]).FIsDispatched:=true;
   current:=TDBEntity(FEntities.Items[0]);
   rel:=FindNonDispatchedRelation(current);

  while rel<>nil do
  begin
  candidate:=current;

  if rel.FLeft.FIsDispatched then begin
  Result.Add(' LEFT JOIN '+rel.FRight.DBName);
  Result.Add(' ON '+rel.FLeftKey.DBName+'='+rel.FRightKey.DBName);
  rel.FRight.FIsDispatched:=true;
  if FindNonDispatchedRelation(rel.FRight)<>nil then candidate:=rel.FRight;
  end else begin
  Result.Add(' LEFT JOIN '+rel.Fleft.DBName);
  Result.Add(' ON '+rel.FLeftKey.DBName+'='+rel.FRightKey.DBName);
  rel.FLeft.FIsDispatched:=true;
  if FindNonDispatchedRelation(rel.FLeft)<>nil then candidate:=rel.FLeft;
  end;

  if (FindNonDispatchedRelation(current)=nil) then begin
  if candidate<>current then current:=candidate else
  if Candidates.Count>0 then begin
  current:=candidates.Items[0];
  candidates.Remove(current);
  end;
  end
  else
  if candidate<>current then candidates.Add(candidate);

  rel:=FindNonDispatchedRelation(current);
end;
candidates.Free;
finally
  for i := 0 to (FEntities.Count - 1) do
  TDBEntity(FEntities.Items[i]).FIsDispatched:=false;

end;
end;

function TQMQueryController.IsInSortList(field: TDBField): Boolean;
begin
result:= (FSortList.IndexOf(field)>=0);

end;

procedure TQMQueryController.LoadRelationsMap;
var //new:TRelation;
i:integer;
begin
if FRelationsMap=nil then
FRelationsMap:=TList.create else
FRelationsMap.Clear;

RelationsDataset.Open;
RelationsDataset.First;
for i:=0 to RelationsDataset.RecordCount-1  do
begin
FRelationsMap.Add(TRelation.Create(RelationsDataset.FieldByName('ik_table1').Value,RelationsDataset.FieldByName('ik_table2').Value));
RelationsDataset.Next;
end;

end;



procedure TQMQueryController.Relate(Ent: TDBEntity);
var route:TList;
rel:TRelation;
i:integer;
begin
route:=nil;
ResetRelationsMap;
if FEntities.Count>1 then
route:=FindRoute(Ent.ID,TDBEntity(FEntities.Items[FEntities.Count-2]).ID,nil);
if route<>nil then

for i := 0 to route.Count - 1 do
begin
 rel:=Route.Items[i];
 if EntityByIK(rel.FLeftID)=nil then
 AddEntity(rel.FLeftID);
  if EntityByIK(rel.FRightID)=nil then
 AddEntity(rel.FRightID);
end;

end;

function TQMQueryController.RelationByIK(ik: integer): TDBRelation;
var i:integer;
begin
result:=nil;
for I := 0 to FRelations.Count - 1 do
if TDBRelation(FRelations.Items[i]).ID=ik then
begin
result:=FRelations.Items[i];
exit;
  end;
end;

procedure TQMQueryController.RemoveSortField(field: TDBField);
begin
FSortList.Remove(field);
end;

procedure TQMQueryController.ResetRelationsMap;
var i:integer;
begin
for i:=0 to FRelationsMap.Count - 1 do
TRelation(FRelationsMap.Items[i]).FDontSeek:=false;

FPathFound:=false;
end;

function TQMQueryController.SaveToFile(fname: string): boolean;
var fs: TFileStream;
begin
result:=false;
// not implemented yet

{fs := TFileStream.Create(fname, fmCreate or fmOpenWrite);
fs.Write(self, self.InstanceSize);
fs.Free;
result:=true;}

end;

function TQMQueryController.ReadFromFile(fname: string): boolean;
var fs: TFileStream;
begin
result:=false;
// not implemented yet

{fs := TFileStream.Create(fname, fmOpenRead);
fs.Read(self, fs.Size);
fs.Free;
result:=true;}

end;

procedure TQMQueryController.SetFieldsDataset(const Value: TAdoDataset);
begin
FFieldsDataset:=Value;
end;

procedure TQMQueryController.SetRelationsDataset(const Value: TAdoDataset);
begin
FRelationsDataset:=Value;
end;

procedure TQMQueryController.SetTableDataset(val : TAdoDataset);
begin
FTableDataset:=val;
end;

procedure TQMQueryController.SyncFieldChecks;
var i,j:integer;
field:TDBField;
begin
for i := 0 to FEntities.Count - 1 do
For j:= 0 to (TDBEntity(FEntities.Items[i]).FFields.Count-1) do
begin
Field:=TDBField(TDBEntity(FEntities.Items[i]).FFields.Items[j]);
if field.FVisualObject<>nil then
Field.FChecked:=field.FVisualObject.Checked else
Field.FChecked:=false;
end;
end;

procedure TQMQueryController.SyncRelations;
var i, ik  :integer;
ent1, ent2: TDBEntity;
newRel:TDBRelation;
begin
RelationsDataset.close;
RelationsDataset.Open;
RelationsDataset.First;

for i:=0 to (RelationsDataset.RecordCount - 1) do
begin
ik:=RelationsDataset.FieldByName('ik_relation').Value;
ent1:=EntityByIK(RelationsDataset.FieldByName('ik_table1').Value);
ent2:=EntityByIK(RelationsDataset.FieldByName('ik_table2').Value);
if (RelationByIK(ik)=nil)and
(ent1<>nil)and
(ent2<>nil) then
begin
newRel:=TDBRelation.Create(ik, ent1.FieldByIK(RelationsDataset.FieldByName('ik_field1').Value),
ent2.FieldByIK(RelationsDataset.FieldByName('ik_field2').Value), ent1,ent2);
newRel.FVisualObject:=TVDBRelation.Create(FImage.Layers,FImage, ent1.FVisualObject, ent2.FVisualObject);
FRelations.Add(newRel);

end;
RelationsDataset.Next;
end;


end;

{ TDBField }

function TDBField.BuildRusFilter: TStrings;
var i:integer;
begin
 result:=TStringlist.Create;
 result.Clear;
 for I := 0 to (FFilters.Count - 1) do
 begin
 if i=0 then
 result.Add(FCaption+' '+TDBFilter(FFilters.Items[i]).BuildRusCommand) else
 result.Add(',или '+FCaption+' '+TDBFilter(FFilters.Items[i]).BuildRusCommand);
 end;

end;

function TDBField.BuildSQLFilter: TStrings;
var i:integer;
begin
 result:=TStringlist.Create;
 result.Clear;
 for I := 0 to (FFilters.Count - 1) do
 begin
 if i=0 then
 result.Add('('+FDBName+TDBFilter(FFilters.Items[i]).BuildSQLCommand+')') else
 result.Add(' OR ('+FDBName+TDBFilter(FFilters.Items[i]).BuildSQLCommand+')');
 end;

end;

procedure TDBField.Check;
begin
TVDBItem(FVisualObject).Checked:=true;
FChecked:=true;
end;

constructor TDBField.Create(ID: integer; dbname, Caption: string;
  visible: boolean);
begin
inherited Create(ID, dbname,Caption);
Fvisible:=visible;
 FFilters:=Tlist.create;
end;

function TDBField.CreateVisual(im:Timage32):TVDBItem;
begin
if Fvisible then
FVisualObject:=TVDBItem.Create(im.Layers,im,Fcaption);
result:=FVisualObject;
end;

procedure TDBField.DeleteLastFilter;
var filter:TDBFilter;
begin
if FFilters.Count>0 then begin
  filter:=FFilters.Items[FFilters.Count-1];
FFilters.Remove(filter);
filter.Free;
end;
end;

procedure TDBField.FreeThis;
var i:integer;
begin
FVisualObject.Free;
for I := 0 to FFilters.Count - 1 do
TDBFilter(FFilters.Items[FFilters.Count-1]).Free;
FFilters.Free;
self.Free;
end;

{ TDBEntity }

procedure TDBEntity.AddField(field: TDBField);
begin
FFields.Add(field);
end;

constructor TDBEntity.Create(ID: integer; dbname, Caption: string);
begin
inherited Create(ID, dbname, Caption);
FFields:=Tlist.Create;
FIsDispatched:=false;
end;

Function TDBEntity.CreateVisual(im: Timage32):TVDBEntity;
var i:integer;
var item:TVDBItem;
begin
FVisualObject:=TVDBEntity.Create(im.Layers,im,Fcaption);
for i := 0 to (FFields.Count - 1) do begin
item:=TDBField(FFields.Items[i]).CreateVisual(im);
if item<>nil then
FVisualObject.AddItem(item);

end;
result:=nil;
end;

procedure TDBEntity.FreeThis;
var i:integer;
f:TDBField;
begin
for I := 0 to FFields.Count - 1 do
begin
f:=FFields.Items[0];
FFields.Remove(f);
f.FreeThis;
end;

FFields.Free;
FVisualObject.Free;
self.Free;
end;

function TDBEntity.FieldByIK(ik: integer): TDBField;
var i:integer;
begin
result:=nil;
for I := 0 to FFields.Count - 1 do
if TDBField(FFields.Items[i]).ID=ik then
begin
result:=FFields.Items[i];
exit;
  end;
end;

{ TDBObject }

constructor TDBObject.Create(ID: integer; dbname, Caption: string);
begin
FID:=Id;
FDBName:=dbname;
FCaption:=caption;
end;

{ TDBRelation }

constructor TDBRelation.Create(id: integer; LeftKey, RightKey: TDBField; Left,
  Right: TDBEntity);
begin
inherited Create(id,'','');
 FID:=id;
 FLeft:=Left;
 FRight:=Right;
 FLeftKey:=LeftKey;
 FRightKey:=RightKey;
end;

procedure TDBRelation.FreeThis;
begin

FVisualObject.Free;
self.Free;
end;

{ TDBFilter }

function  TDBFilter.BuildRusCommand:string;
begin
if (command='BETWEEN')or(command='NOT BETWEEN') then
result:=commandRus+' "'+param1+'" и "'+param2+'"' else
if (command='IS NULL')or(command='IS NOT NULL') then
result:=commandRus else
result:=commandRus+' "'+param1+'"';
end;

function TDBFilter.BuildSQLCommand: string;
begin
if (command='BETWEEN')or(command='NOT BETWEEN') then
result:=' '+command+' '+param1DBName+' AND '+param2DBName else
if command='LIKE' then
result:=' '+command+' '+param1DBName else
if (command='IS NULL')or(command='IS NOT NULL') then
result:=' '+command else
result:=command+' '+param1DBName;
end;

function TDBFilter.CheckParams: boolean;
var s:string;
begin
s:=param1;

if (pos('''',s)>0)
or (pos('(',s)>0)
or (pos(')',s)>0)
or (pos('"',s)>0)
or (pos(';',s)>0)
then
result:=false else
result:=true;

end;

{ TRelation }

constructor TRelation.Create(ik1, ik2: integer);
begin
FLeftID:=ik1;
FRightID:=ik2;
FDontSeek:=false;
end;

function TRelation.OtherSide(ik: integer): integer;
begin
result:=-1;
if ik=FLeftID then result:=FRightID;
if ik=FRightID then result:=FLeftID;

end;

end.
