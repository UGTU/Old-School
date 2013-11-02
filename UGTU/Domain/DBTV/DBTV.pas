(*
  Модуль    : DBTV
  Категория : ..
  Версия: 1.0
  Автор : Маракасов Ф. В.

  Назначение:
*)

{ --- Последняя генерация: 26.02.2003  23:52:47 --- }

unit DBTV;
  {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, comctrls, classes, DBTVObj, db, ShEvent,dialogs;
type


  // Событие до вызова AddChildNodes
  TBeforeAddChildEvent = procedure (Sender:TDBNodeObject; var Allow:Boolean) of
          object;
  // Событие после вызова AddChildNodes
  TAfterAddChildEvent = procedure (Sender:TDBNodeObject) of object;
  TDBTreeView = class (TTreeView)
  private
    FAfterAdd: TAfterAddChildEvent;
    FBeforeAdd: TBeforeAddChildEvent;
    FOnCanAddExecute: TCanActionEvent;
    FOnCanCopyExecute: TCanActionEvent;
    FOnCanCutExecute: TCanActionEvent;
    FOnCanDeleteExecute: TCanActionEvent;
    FOnCanPasteExecute: TCanActionEvent;
    FOnCanSelectAllExecute: TCanActionEvent;
    FOnCanUpdateExecute: TCanActionEvent;
    function GetCanActionEvent(FEvent:TCanActionEvent; bCan:boolean): Boolean;
    function GetCanAdd: Boolean;
    function GetCanCopy: Boolean;
    function GetCanCut: Boolean;
    function GetCanDelete: Boolean;
    function GetCanPaste: Boolean;
    function GetCanSelectAll: Boolean;
    function GetCanUpdate: Boolean;
    function GetNodeActionCaption(NodeAction:TNodeAction): string;
  protected
    function CanExpand(Node: TTreeNode): Boolean; override;
    function GetNodeObject(Node:TTreeNode): TDBNodeObject; virtual;
    function GetObject: TDBNodeObject; virtual;
    procedure NodeDeletion(Sender: TObject; Node: TTreeNode);
  public
    constructor Create(AOwner:TComponent); override;
    procedure AddExecute(Sender:TObject); virtual;
    procedure CopyExecute(Sender:TObject); virtual;

    function CreateNewNodeObject(ParentNode:TTreeNode; Caption:String;
        TNodeClass:TDBNodeClass): TDBNodeObject;

    function CreateNewDBNode(ParentNode:TTreeNode; TNodeClass:TDBNodeClass;
            DataSet:TDataSet): TTreeNode; virtual;
    function CreateNewNode(ParentNode:TTreeNode; Caption:String;
            TNodeClass:TDBNodeClass): TTreeNode; virtual;
    procedure CutExecute(Sender:TObject); virtual;
    procedure DeleteExecute(Sender:TObject); virtual;
    procedure PasteExecute(Sender:TObject); virtual;
    procedure RefreshExecute(Sender:TObject); virtual;
    procedure SelectAllExecute(Sender:TObject); virtual;
    procedure UpdateExecute(Sender:TObject); virtual;
    property CanAdd: Boolean read GetCanAdd;
    property CanCopy: Boolean read GetCanCopy;
    property CanCut: Boolean read GetCanCut;
    property CanDelete: Boolean read GetCanDelete;
    property CanPaste: Boolean read GetCanPaste;
    property CanSelectAll: Boolean read GetCanSelectAll;
    property CanUpdate: Boolean read GetCanUpdate;
    property NodeActionCaption[NodeAction:TNodeAction]: string read
            GetNodeActionCaption;
    property NodeObject[Node:TTreeNode]: TDBNodeObject read GetNodeObject;
    property SelectedObject: TDBNodeObject read GetObject;
  published
    property OnAfterAddChild: TAfterAddChildEvent read FAfterAdd write
            FAfterAdd;
    property OnBeforeAddChild: TBeforeAddChildEvent read FBeforeAdd write
            FBeforeAdd;
    property OnCanAddExecute: TCanActionEvent read FOnCanAddExecute write
            FOnCanAddExecute;
    property OnCanCopyExecute: TCanActionEvent read FOnCanCopyExecute write
            FOnCanCopyExecute;
    property OnCanCutExecute: TCanActionEvent read FOnCanCutExecute write
            FOnCanCutExecute;
    property OnCanDeleteExecute: TCanActionEvent read FOnCanDeleteExecute write
            FOnCanDeleteExecute;
    property OnCanPasteExecute: TCanActionEvent read FOnCanPasteExecute write 
            FOnCanPasteExecute;
    property OnCanSelectAllExecute: TCanActionEvent read FOnCanSelectAllExecute 
            write FOnCanSelectAllExecute;
    property OnCanUpdateExecute: TCanActionEvent read FOnCanUpdateExecute write 
            FOnCanUpdateExecute;
  end;

implementation

uses
  Controls, SysUtils;


///////////////////////////////////////////////////////////////////////////

{
********************************* TDBTreeView **********************************
}
constructor TDBTreeView.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  ChangeDelay:=300;
  ReadOnly:=true;
  OnDeletion:=NodeDeletion;
end;

procedure TDBTreeView.AddExecute(Sender:TObject);
begin
  if Selected <> nil then
    SelectedObject.AddExecute(Sender);
end;

function TDBTreeView.CanExpand(Node: TTreeNode): Boolean;
var
  Obj: TDBNodeObject;
  Allow: Boolean;
begin
  // Получаем ссылку на объект узла
  Obj:=TDBNodeObject(Node.Data);
  Cursor:=crHourGlass;
  // По умолчанию позволяем вызов функции AddChildNodes
  Allow:=true;
  try
    if Assigned(Obj) then
    begin
      // Событие до добавления
      if Assigned (FBeforeAdd) then FBeforeAdd(Obj, Allow);
      // Если позволено вызывать AddChildNodes
      if (Allow) then begin
        Obj.AddChildNodes;
        // Событие после добавления
        if Assigned (FAfterAdd) then FAfterAdd(Obj);
      end;
    end;
    Result:=inherited CanExpand(Node);
  finally
    Node.HasChildren:=(Node.Count >0);
    Cursor:=crDefault;
  end;
end;

procedure TDBTreeView.CopyExecute(Sender:TObject);
begin
  if Selected <> nil then
    SelectedObject.CopyExecute(Sender);
end;

function TDBTreeView.CreateNewDBNode(ParentNode:TTreeNode; 
        TNodeClass:TDBNodeClass; DataSet:TDataSet): TTreeNode;
begin
  Result:=nil;
end;


function TDBTreeView.CreateNewNode(ParentNode:TTreeNode; Caption:String;
        TNodeClass:TDBNodeClass): TTreeNode;
begin
  Result:=Items.AddChild(ParentNode, Caption);
  if (Assigned (Result)) then
  begin
    Result.Data:=TNodeClass.Create(Result, Self);
  end;
end;

function TDBTreeView.CreateNewNodeObject(ParentNode: TTreeNode; Caption: String;
  TNodeClass: TDBNodeClass): TDBNodeObject;
var
  Node : TTreeNode;
begin
  Result := nil;
  Node :=  CreateNewNode(ParentNode, Caption, TNodeClass);
  if (Assigned(Node)) then
     Result := TDBNodeObject(Node.Data);
end;

procedure TDBTreeView.CutExecute(Sender:TObject);
begin
  if Selected <> nil then
    SelectedObject.CutExecute(Sender);
end;

procedure TDBTreeView.DeleteExecute(Sender:TObject);
begin
  if Selected <> nil then
    SelectedObject.DeleteExecute(Sender);
end;

function TDBTreeView.GetCanActionEvent(FEvent:TCanActionEvent; bCan:boolean): 
        Boolean;
begin
  if Assigned(FEvent) then FEvent(Self, bCan);
  Result:=bCan;
end;

function TDBTreeView.GetCanAdd: Boolean;
begin
  if Selected <> nil then Result:=SelectedObject.CanAddExecute
  else Result:=true;
  Result:=GetCanActionEvent(FOnCanAddExecute, Result);
end;

function TDBTreeView.GetCanCopy: Boolean;
begin
  if Selected <> nil then Result:=SelectedObject.CanCopyExecute
  else Result:=true;
  Result:=GetCanActionEvent(FOnCanCopyExecute, Result);
end;

function TDBTreeView.GetCanCut: Boolean;
begin
  if Selected <> nil then Result:=SelectedObject.CanCutExecute
  else Result:=true;
  Result:=GetCanActionEvent(FOnCanCutExecute, Result);
end;

function TDBTreeView.GetCanDelete: Boolean;
begin
  if Selected <> nil then Result:=SelectedObject.CanDeleteExecute
  else Result:=true;
  Result:=GetCanActionEvent(FOnCanDeleteExecute, Result);
end;

function TDBTreeView.GetCanPaste: Boolean;
begin
  if Selected <> nil then Result:=SelectedObject.CanPasteExecute
  else Result:=true;
  Result:=GetCanActionEvent(FOnCanPasteExecute, Result);
end;

function TDBTreeView.GetCanSelectAll: Boolean;
begin
  Result:=Selected<>nil;
end;

function TDBTreeView.GetCanUpdate: Boolean;
begin
  if Selected <> nil then Result:=SelectedObject.CanUpdateExecute
  else Result:=true;
  Result:=GetCanActionEvent(FOnCanUpdateExecute, Result);
end;

function TDBTreeView.GetNodeActionCaption(NodeAction:TNodeAction): string;
begin
  if Assigned(Selected) then
    Result:=SelectedObject.NodeActionCaption[NodeAction]
  else Result:='';
end;

function TDBTreeView.GetNodeObject(Node:TTreeNode): TDBNodeObject;
begin
  Result:=nil;
  if Assigned(Node) then
    if Assigned(Node.Data) then Result:=TDBNodeObject(Node.Data);
end;

function TDBTreeView.GetObject: TDBNodeObject;
begin
  Result:=nil;
  if Assigned(Selected) then
    if Assigned(Selected.Data) then
       Result:=TDBNodeObject(Selected.Data);
end;

procedure TDBTreeView.NodeDeletion(Sender: TObject; Node: TTreeNode);
var
  Obj: TObject;
begin
  if (Assigned(Node)) then
  begin
    Obj:= TObject(Node.Data);
    if Assigned(Node.Data) then
      if ( Obj is TDBNodeObject) then FreeAndNil(Obj);
  end;
end;

procedure TDBTreeView.PasteExecute(Sender:TObject);
begin
  if Selected <> nil then
    SelectedObject.PasteExecute(Sender);
end;

procedure TDBTreeView.RefreshExecute(Sender:TObject);
var
  NodeObj: TDBNodeObject;
  NodeText: string;
  NodeIndex: Integer;
  Expanded: Boolean;
begin

  if Selected <> nil then
  begin
    // Запомним текст и индекс обновляемого узла
    NodeText:=Selected.Text;
    NodeIndex:=Selected.Index;

    // Определяем, что будет обновляемым узлом: текущий или родительский
    //if (Selected.Expanded) or (Selected.Parent = nil) then
      NodeObj:=SelectedObject;
    //else
     // NodeObj:=SelectedObject.Parent;
  
    // Запомним состояние узла до обновления
    Expanded:=NodeObj.Node.Expanded;
    NodeObj.Refresh;
  
    if Expanded then
    begin
      NodeObj.Node.Expand(false);
      // Переход к запомненному узлу (если он существует)
      if NodeObj.Node.Count > NodeIndex then
        if CompareStr(NodeObj.Node[NodeIndex].Text, NodeText) = 0 then
          NodeObj.Node[NodeIndex].Selected:=true;
    end;
  end;
  
end;

procedure TDBTreeView.SelectAllExecute(Sender:TObject);
var
  i: Integer;
  Node: TTreeNode;
begin
  if MultiSelect then
  begin
    if Selected <> nil then
    begin
      if Selected.Expanded then Node:=Selected
      else
        if Selected.Parent <> nil then
           Node:=Selected.Parent
        else
           Node:=nil;
        if Assigned(Node) then
        begin
          for i:=0 to Node.Count - 1 do
             Subselect(Node.Item[i]);
        end
        else
          for i:=0 to Items.Count - 1 do
             Subselect(Items[i]);
    end;
  end;
end;

procedure TDBTreeView.UpdateExecute(Sender:TObject);
begin
  if Selected <> nil then
    SelectedObject.UpdateExecute(Sender);
end;



end.
