unit uMethodWorkAddWorkInNorm;
   {#Author nnikolenko@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, uBaseFrame,
  DBTVMethodWorkInNormobj;

type
  TfrmMethodWorkAddWorkInNorm = class(TfrmBaseDialog)
    Panel2: TPanel;
    procedure bbCancelClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    FFrame:TfmBase;
    FName: string;
    procedure SetFrame(FrameClass:TBaseFrameClass);
  protected
    function DoApply:boolean; override;
  public
    { Public declarations }
    procedure Read(ID: Variant);
    property Frame:TBaseFrameClass write SetFrame;
    property Name:string read FName write FName;  //необходимо для отображения в фильтре
  end;

var
  frmMethodWorkAddWorkInNorm: TfrmMethodWorkAddWorkInNorm;

implementation
uses uMethodWorkTreeView;
{$R *.dfm}

procedure TfrmMethodWorkAddWorkInNorm.bbCancelClick(Sender: TObject);
begin
  IsModified:= false;
  inherited;
end;

function TfrmMethodWorkAddWorkInNorm.DoApply: boolean;
begin
  if TfmMethodWorkTreeView(FFrame).DBDekTreeView_TEST1.SelectionCount = 0 then
  begin
    Result:= false;
    Application.MessageBox('Необходимо выделить вид работ!', 'Выбор вида работ', MB_ICONWARNING);
    exit;
  end
  else
  begin
    if (TfmMethodWorkTreeView(FFrame).DBDekTreeView_TEST1.Selected.ImageIndex = 2) or (TfmMethodWorkTreeView(FFrame).DBDekTreeView_TEST1.Selected.ImageIndex = 20) then
    begin
      Result:= false;
      Application.MessageBox('Выбранный узел не является терминальным!', 'Выбор вида работ', MB_ICONWARNING);
      exit;
    end;
    if TDBNodeMethodsWorkNodeObject(TfmMethodWorkTreeView(FFrame).DBDekTreeView_TEST1.Selected.Data).NormIK <> NULL then
      IK:= TDBNodeMethodsWorkNodeObject(TfmMethodWorkTreeView(FFrame).DBDekTreeView_TEST1.Selected.Data).NormIK
    else IK:= TDBNodeMethodsWorkNodeObject(TfmMethodWorkTreeView(FFrame).DBDekTreeView_TEST1.Selected.Data).ID;
    Name:= TDBNodeMethodsWorkNodeObject(TfmMethodWorkTreeView(FFrame).DBDekTreeView_TEST1.Selected.Parent.Data).Name + ': ' +TDBNodeMethodsWorkNodeObject(TfmMethodWorkTreeView(FFrame).DBDekTreeView_TEST1.Selected.Data).Name;
    Result:= TfmMethodWorkTreeView(FFrame).DBDekTreeView_TEST1.SelectionCount <> 0;
  end;
end;

procedure TfrmMethodWorkAddWorkInNorm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  CanClose:= true;
end;

procedure TfrmMethodWorkAddWorkInNorm.Read(ID: Variant);
begin
  Caption:= 'Выбор вида работ';
  Frame:=TfmMethodWorkTreeView;
  FFrame.RefreshFrame;

  if ID <> NULL then
    TfmMethodWorkTreeView(FFrame).ExpandTreeView(ID);

  IsModified:= true;
end;

procedure TfrmMethodWorkAddWorkInNorm.SetFrame(FrameClass: TBaseFrameClass);
begin
  if (FrameClass = nil) then
  begin
     FFrame:=nil;
     exit;
  end;

  FFrame:= FrameClass.CreateFrame(nil, nil, nil);

  FFrame.Align:=alClient;
  FFrame.Parent:= Panel2;
  TfmMethodWorkTreeView(FFrame).ToolBar1.Visible:= false;

  FFrame.Visible:=true;
end;

end.
