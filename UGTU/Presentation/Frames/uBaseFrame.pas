unit uBaseFrame;
  {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ADODB, StdCtrls, Buttons;

type

  TBaseFrameClass = class of TfmBase;

  TfmBase = class(TFrame)
    Panel1: TPanel;
    pnlSave: TPanel;
    bbSave: TBitBtn;
    bbUndo: TBitBtn;
    lAccessDenied: TLabel;
  private
    { Private declarations }
    FFrameObject:TObject;
    FConnection:TADOConnection;
    FModified:Boolean;
    FDataSet: TADODataSet;
  protected
    function DoApply: Boolean;virtual;
    procedure DoCancel;virtual;
    procedure DoCreate;virtual;
    procedure DoRefreshFrame;virtual;
    procedure DoHandleAccessDeniedException; virtual;
  public
    procedure HandleAccessDeniedException;
    constructor CreateFrame(AOwner:TComponent; AObject:TObject; AConn:TADOConnection);virtual;
    destructor Destroy; override;
    function Apply: Boolean;
    procedure Cancel;
    procedure RefreshFrame;
    procedure CloseFrame; virtual;
    procedure SelectInTree(num:integer);
    procedure SelectInTreeByID(num:integer);
    property Modified:Boolean read FModified write FModified;
    property Connection:TADOConnection read FConnection write FConnection;
    property DataSet: TADODataSet read FDataSet write FDataSet;
    property FrameObject: TObject read FFrameObject write FFrameObject;
  end;

implementation

uses uMain,DBTVObj,DBTVStudObj,DBTVGroupObj, uStudent, uGroup;

{$R *.dfm}

procedure TfmBase.SelectInTree(num:integer);
begin
  frmMain.DBDekTreeView_TEST1.SelectNodeByNum(num,true);
end;

procedure TfmBase.SelectInTreeByID(num:integer);
var i:integer;
begin
frmMain.DBDekTreeView_TEST1.Selected.Expand(false);
for i:=0 to (frmMain.DBDekTreeView_TEST1.Selected.Count-1) do

if TDBNodeStudObject(frmMain.DBDekTreeView_TEST1.Selected.Item[i].Data).ID=num
then begin
frmMain.DBDekTreeView_TEST1.Selected.Item[i].Selected:=true;
break;
end;

end;

function TfmBase.Apply: Boolean;
begin
  Result := DoApply;
  Modified:=false;
end;

procedure TfmBase.Cancel;
begin
  DoCancel;
end;

constructor TfmBase.CreateFrame(AOwner:TComponent; AObject:TObject; AConn:TADOConnection);
begin
  inherited Create(AOwner);
  FFrameObject:=AObject;
  Connection:=AConn;
  DoCreate;
end;

procedure TfmBase.RefreshFrame;
begin
  DoRefreshFrame;
  Modified:=false;
end;

function TfmBase.DoApply: Boolean;
begin
  Result:= true;
end;

procedure TfmBase.DoCancel;
begin
end;

procedure TfmBase.DoCreate;
begin
end;

procedure TfmBase.DoHandleAccessDeniedException;
begin

end;

procedure TfmBase.DoRefreshFrame;
begin
end;

procedure TfmBase.HandleAccessDeniedException;
begin
   Self.Enabled := false;
   Self.Panel1.Visible:=false;
   Self.lAccessDenied.Visible := true;
   DoHandleAccessDeniedException;
end;

procedure TfmBase.CloseFrame;
begin
end;

destructor TfmBase.Destroy;
begin
  CloseFrame;
  inherited;
end;

end.
