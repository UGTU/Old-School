(*
  Модуль    : DBTVObj
  Категория : ..
  Версия: 1.0
  Автор : Маракасов Ф. В.

  Назначение:
*)


unit DBTVObj;
{#Author fmarakasov@ist.ugtu.net}
interface
uses
Dialogs,
  SysUtils,
  comctrls,
  db,
  graphics,
  Variants, Controls, Forms,ADODB;
type


  // Типы операций над узлом
  TNodeAction = (taAdd, taDelete, taUpdate, taCopy, taPaste, taCut);

  TDBNodeObject = class;

  TDBNodeClass = class of TDBNodeObject;

  //:
  TDBNodeObject = class (TObject)
  private
    FAssociatedObject: TObject;
    FTag:integer;
    FDataSet: TADODataSet;
    FFont: TFont;
    FID: Integer;
    FNode: TTreeNode;
    FParent: TDBNodeObject;
    FTreeView: TTreeView;
    FValue: Variant;
    FFrameClass:TCustomFrameClass;
    FBaseImageIndex:integer;
    FActionGroup:string;
    function GetCanAddExecute: Boolean;
    function GetCanCopyExecute: Boolean;
    function GetCanCutExecute: Boolean;
    function GetCanDeleteExecute: Boolean;
    function GetCanPasteExecute: Boolean;
    function GetCanUpdateExecute: Boolean;
    function GetNodeActionCaption(NodeAction:TNodeAction): string;
  protected
    FChildAdded: Boolean;
    FName: string;
    function DoCanAddExecute: Boolean; virtual;
    function DoCanCopyExecute: Boolean; virtual;
    function DoCanCutExecute: Boolean; virtual;
    function DoCanDeleteExecute: Boolean; virtual;
    function DoCanPasteExecute: Boolean; virtual;
    function DoCanUpdateExecute: Boolean; virtual;
    function DoNodeActionCaption(NodeAction:TNodeAction): string; virtual;
    procedure SetFont(const Font: TFont);

    function DoAddChildNodes:Boolean;virtual;abstract;

  public
    constructor Create(Node:TTreeNode; TreeView:TTreeView); overload; virtual;
    constructor Create(Node:TTreeNode; TreeView:TTreeView; IsTerminal: boolean); overload;
    destructor Destroy; override;

    function AddChildNodes: Boolean; virtual;

    function CreateNewNode(Caption:String; TNodeClass:TDBNodeClass): TTreeNode;

    procedure AddExecute(Sender:TObject); virtual;
    procedure CopyExecute(Sender:TObject); virtual;
    procedure CutExecute(Sender:TObject); virtual;
    procedure DeleteExecute(Sender:TObject); virtual;
    procedure PasteExecute(Sender:TObject); virtual;
    procedure Refresh;
    procedure SaveData; virtual;
    procedure UpdateExecute(Sender:TObject); virtual;
    property CanAddExecute: Boolean read GetCanAddExecute;
    property CanCopyExecute: Boolean read GetCanCopyExecute;
    property CanCutExecute: Boolean read GetCanCutExecute;
    property CanDeleteExecute: Boolean read GetCanDeleteExecute;
    property CanPasteExecute: Boolean read GetCanPasteExecute;
    property CanUpdateExecute: Boolean read GetCanUpdateExecute;
    property DataSet: TADODataSet read FDataSet write FDataSet;
    property Font: TFont read FFont write SetFont;
    property Tag: Integer read FTag write FTag;
    property ID: Integer read FID write FID;
    property Name: string read FName write FName;
    property Node: TTreeNode read FNode write FNode;
    property NodeActionCaption[NodeAction:TNodeAction]: string read
            GetNodeActionCaption;
    property Parent: TDBNodeObject read FParent write FParent;
    property TreeView: TTreeView read FTreeView write FTreeView;
    property Value: Variant read FValue write FValue;
    property FrameClass:TCustomFrameClass read FFrameClass write FFrameClass;
    property BaseImageIndex:integer read FBaseImageIndex write FBaseImageIndex;
    property Actiongroup:string read FActiongroup write FActiongroup;
    property AssociatedObject: TObject read FAssociatedObject write FAssociatedObject;
  end;

implementation
uses
   DBTV;

{
******************************** TDBNodeObject *********************************
}

constructor TDBNodeObject.Create(Node:TTreeNode; TreeView:TTreeView);
begin
  inherited Create;
  Create(Node, TreeView, false);
end;

constructor TDBNodeObject.Create(Node:TTreeNode; TreeView:TTreeView; IsTerminal:boolean);
begin
  inherited Create;
  FID:=-1;
  FNode:=Node;
  FDataSet:=nil;
  FChildAdded:=false;
  FValue:=Unassigned;
  FFont:=TFont.Create;
  FTreeView:=TreeView;
  FName:=Node.Text;
  if Assigned(Node.Parent) then
    FParent:=TDBNodeObject(Node.Parent.Data);
  if not (IsTerminal) then
  Node.HasChildren:=true;
end;

destructor TDBNodeObject.Destroy;
begin
  FreeAndNil(FFont);
  inherited;
end;

function TDBNodeObject.AddChildNodes: Boolean;
begin
  if (not FChildAdded) then
    FChildAdded:=DoAddChildNodes;
  Result:=FChildAdded;
end;

procedure TDBNodeObject.AddExecute(Sender:TObject);
begin
end;

procedure TDBNodeObject.CopyExecute(Sender:TObject);
begin
end;

procedure TDBNodeObject.CutExecute(Sender:TObject);
begin
end;

procedure TDBNodeObject.DeleteExecute(Sender:TObject);
begin
end;

function TDBNodeObject.DoCanAddExecute: Boolean;
begin
  Result:=true;
end;

function TDBNodeObject.DoCanCopyExecute: Boolean;
begin
  Result:=true;
end;

function TDBNodeObject.DoCanCutExecute: Boolean;
begin
  Result:=true;
end;

function TDBNodeObject.DoCanDeleteExecute: Boolean;
begin
  Result:=true;
end;

function TDBNodeObject.DoCanPasteExecute: Boolean;
begin
  Result:=true;
end;

function TDBNodeObject.DoCanUpdateExecute: Boolean;
begin
  Result:=true;
end;

{{
Возвращает символьные имена операций над узлом дерева.
--- Переопределите массив в производных классах ---
}
function TDBNodeObject.DoNodeActionCaption(NodeAction:TNodeAction): string;
  
  const
    NodeCaptionArray:array[Low(TNodeAction)..High(TNodeAction)] of string =
      ('Добавить объект', 'Удалить объект',
       'Редактировать объект', 'Копировать объект', 'Вырезать объект',
               'Вставить объект');
  
begin
  Result:=NodeCaptionArray[NodeAction];
end;

function TDBNodeObject.GetCanAddExecute: Boolean;
begin
  Result:=DoCanAddExecute;
end;

function TDBNodeObject.GetCanCopyExecute: Boolean;
begin
  Result:=DoCanCopyExecute;
end;

function TDBNodeObject.GetCanCutExecute: Boolean;
begin
  Result:=DoCanCutExecute;
end;

function TDBNodeObject.GetCanDeleteExecute: Boolean;
begin
  Result:=DoCanDeleteExecute;
end;

function TDBNodeObject.GetCanPasteExecute: Boolean;
begin
  Result:=DoCanPasteExecute;
end;

function TDBNodeObject.GetCanUpdateExecute: Boolean;
begin
  Result:=DoCanUpdateExecute;
end;

function TDBNodeObject.GetNodeActionCaption(NodeAction:TNodeAction): string;
begin
  Result:=DoNodeActionCaption(NodeAction);
end;

procedure TDBNodeObject.PasteExecute(Sender:TObject);
begin
end;

procedure TDBNodeObject.Refresh;
begin
  if Assigned(Node) then
  Node.DeleteChildren;
  FChildAdded:=false;
  AddChildNodes;
end;

procedure TDBNodeObject.SaveData;
begin

end;

procedure TDBNodeObject.SetFont(const Font: TFont);
begin
  if Assigned(FFont) then FFont.Assign(Font);
end;

procedure TDBNodeObject.UpdateExecute(Sender:TObject);
begin
end;

function TDBNodeObject.CreateNewNode(Caption: String;
  TNodeClass: TDBNodeClass): TTreeNode;
begin
  Result:=nil;
  if Assigned(self.TreeView) then
    Result:=(Self.TreeView as TDBTreeView).CreateNewNode(Node, Caption, TNodeClass);
end;

end.
