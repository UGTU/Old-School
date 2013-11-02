unit uNagruzkaPotokManager;
   {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Grids,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, ToolWin, ImgList, ActnList, Contnrs;

type
  TPotokManagementItemObjectType = (pmitGradeLevel = 0, pmitDiscipline = 1, pmitSpecialitiesUnion = 2, pmitSepGroupsUnion = 3, pmitPotokUnion = 4);

  TPotokManagementItemObject = class

  end;

  TPotokManagementItem = class(TObjectList)
  private
    FText: string;
    FObject: TPotokManagementItemObject;
    FSelectedIndex: Integer;
    function getPMItem(index: integer): TPotokManagementItem;
    procedure setPMItem(index: integer; const Value: TPotokManagementItem);
  public
    constructor Create(AText: string; AObject: TPotokManagementItemObject);
    property Items[index: integer]: TPotokManagementItem read getPMItem write setPMItem;
  end;

  TPotokManagementGrid = class(TCustomDrawGrid)
  private
    RootItem: TPotokManagementItem;
    function getSelectedItem: TPotokManagementItem;
    function getItems(index: integer): TPotokManagementItem;
    function getItemsCount: integer;
    procedure setItems(index: integer; const Value: TPotokManagementItem);
    function getSelectedIndex: integer;

  protected
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState); override;
  public
    procedure ReadInformation;
    property Items[index: integer]: TPotokManagementItem read getItems write setItems;
    property Count: integer read getItemsCount;
    property SelectedIndex: integer read getSelectedIndex;
    property SelectedItem: TPotokManagementItem read getSelectedItem;
  end;

  TfrmNagruzkaPotokManager = class(TForm)
    actList: TActionList;
    actEditPotok: TAction;
    actDelPotok: TAction;
    actAddPotokShema: TAction;
    actEditPotokShema: TAction;
    actDelPotokShema: TAction;
    ImageList1: TImageList;
    actAddPotok: TAction;
    ToolBar1: TToolBar;
    Panel1: TPanel;
    Button1: TButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    actJoinSpecialitiesInPotok: TAction;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNagruzkaPotokManager: TfrmNagruzkaPotokManager;

implementation

{$R *.dfm}

procedure TfrmNagruzkaPotokManager.Button1Click(Sender: TObject);
begin
  Close();
end;


{ TPotokManagementItem }

constructor TPotokManagementItem.Create(AText: string;
  AObject: TPotokManagementItemObject);
begin
  inherited Create(true);
  FText:= AText;
  FObject:= AObject;
end;

function TPotokManagementItem.getPMItem(index: integer): TPotokManagementItem;
begin
  Result:= TPotokManagementItem(inherited Items[index]);
end;

procedure TPotokManagementItem.setPMItem(index: integer;
  const Value: TPotokManagementItem);
begin
  Items[index]:= Value;
end;

{ TPotokManagementGrid }

procedure TPotokManagementGrid.DrawCell(ACol, ARow: Integer; ARect: TRect;
  AState: TGridDrawState);
begin
  if ACol = 0 then
  begin
    Canvas.TextOut(2, 2, '');
  end;
end;

function TPotokManagementGrid.getItems(index: integer): TPotokManagementItem;
begin

end;

function TPotokManagementGrid.getItemsCount: integer;
begin

end;

function TPotokManagementGrid.getSelectedIndex: integer;
begin

end;

function TPotokManagementGrid.getSelectedItem: TPotokManagementItem;
begin

end;

procedure TPotokManagementGrid.ReadInformation;
begin

end;

procedure TPotokManagementGrid.setItems(index: integer;
  const Value: TPotokManagementItem);
begin

end;

end.
