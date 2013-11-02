unit uMethodWorkTreeView;
   {#Author nnikolenko@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseFrame, ActnList, ImgList, ComCtrls, ToolWin, StdCtrls, Buttons,
  ExtCtrls, ADODB, MethodWorkController, GeneralController, DBTV, DBTVDekanat,
  DBDekTreeView_TEST, ApplicationController, DBTVObj, DBTVMethodWorkInNormobj, uDm, DB;

type
  TfmMethodWorkTreeView = class(TfmBase, IDBActionSubscriber)
    ToolBar1: TToolBar;
    ToolButton7: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ImageList1: TImageList;
    actList: TActionList;
    actAddWork: TAction;
    actEditWork: TAction;
    actDelWork: TAction;
    actAddSectionWork: TAction;
    DBDekTreeView_TEST1: TDBDekTreeView_TEST;
    procedure actAddSectionWorkUpdate(Sender: TObject);
    procedure actAddSectionWorkExecute(Sender: TObject);
    procedure actAddWorkUpdate(Sender: TObject);
    procedure actAddWorkExecute(Sender: TObject);
    procedure actEditWorkUpdate(Sender: TObject);
    procedure actEditWorkExecute(Sender: TObject);
    procedure actDelWorkExecute(Sender: TObject);
    procedure DBDekTreeView_TEST1AdvancedCustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; Stage: TCustomDrawStage;
      var PaintImages, DefaultDraw: Boolean);
  private
    { Private declarations }
    procedure FindIDInTreeView(IDWork: integer);
  protected
    procedure DoRefreshFrame;override;
    procedure Notify(Sender : TObject; DataSet : TDataSet; DBAction : TDBAction);
  public
    { Public declarations }
    constructor CreateFrame(AOwner:TComponent; AObject:TObject; AConn:TADOConnection);override;
    procedure ExpandTreeView(IDWork: integer);
    //procedure CloseFrame; override;
  end;

var
  fmMethodWorkTreeView: TfmMethodWorkTreeView;

implementation
uses uMethodWorkAddWork;

{$R *.dfm}
//----------------------------------------------------------------------------
{ TfmMethodWork }

procedure TfmMethodWorkTreeView.actAddSectionWorkExecute(Sender: TObject);
begin
  frmMethodWorkAddWork:= TfrmMethodWorkAddWork.CreateDialog(nil, self.Connection, nil);
try
  frmMethodWorkAddWork.Read(true);
  if (frmMethodWorkAddWork.ShowModal() = mrOk) or (frmMethodWorkAddWork.bbApply.Tag = 1) then
  begin
    TDBNodeMethodsWorkNodeObject.UpdateDataSet;
    TDBNodeMethodsWorkNodeObject.CreateRootNodeObjects(DBDekTreeView_TEST1);
  end;
finally
  frmMethodWorkAddWork.Free;
end;
end;

procedure TfmMethodWorkTreeView.actAddSectionWorkUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= true;
end;

procedure TfmMethodWorkTreeView.actAddWorkExecute(Sender: TObject);
begin
  frmMethodWorkAddWork:= TfrmMethodWorkAddWork.CreateDialog(nil, self.Connection, nil);
try
  frmMethodWorkAddWork.IKParent:= TDBNodeMethodsWorkNodeObject(DBDekTreeView_TEST1.Selected.Data).ID;
  frmMethodWorkAddWork.IK:= -1;
  frmMethodWorkAddWork.Read(false);
  if (frmMethodWorkAddWork.ShowModal() = mrOk) or (frmMethodWorkAddWork.bbApply.Tag = 1) then
  begin
    TDBNodeMethodsWorkNodeObject.UpdateDataSet;
    TDBNodeMethodsWorkNodeObject.CreateRootNodeObjects(DBDekTreeView_TEST1);
    ExpandTreeView(frmMethodWorkAddWork.fLastAddWork);
  end;
finally
  frmMethodWorkAddWork.Free;
end;
end;

procedure TfmMethodWorkTreeView.actAddWorkUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= (DBDekTreeView_TEST1.SelectionCount > 0);
end;

procedure TfmMethodWorkTreeView.actDelWorkExecute(Sender: TObject);
begin
  if ((DBDekTreeView_TEST1.Selected.ImageIndex = 2) or (DBDekTreeView_TEST1.Selected.ImageIndex = 20)) and
   (Application.MessageBox('¬ы уверены, что хотите удалить выбранный раздел?' + #10#13#10#13 +
   'ѕри этом будут удалены все виды работ в данном разделе!'
   ,'”даление раздела работ', mb_YesNo) = mrYes) then
  begin
    TMethodWorkController.Instance.DeleteWork(TDBNodeMethodsWorkNodeObject(DBDekTreeView_TEST1.Selected.Data).ID);
    DBDekTreeView_TEST1.Items.Delete(DBDekTreeView_TEST1.Selected);
    TDBNodeMethodsWorkNodeObject.UpdateDataSet;
  end
  else if ((DBDekTreeView_TEST1.Selected.ImageIndex = 16) or (DBDekTreeView_TEST1.Selected.ImageIndex = 1)) and
    (Application.MessageBox('¬ы действительно хотите удалить выбранный вид работ?','”даление вида работ', mb_YesNo) = mrYes) then
  begin
    TMethodWorkController.Instance.DeleteWork(TDBNodeMethodsWorkNodeObject(DBDekTreeView_TEST1.Selected.Data).ID);
    DBDekTreeView_TEST1.Items.Delete(DBDekTreeView_TEST1.Selected);
    TDBNodeMethodsWorkNodeObject.UpdateDataSet;
  end;
end;

procedure TfmMethodWorkTreeView.actEditWorkExecute(Sender: TObject);
begin
  frmMethodWorkAddWork:= TfrmMethodWorkAddWork.CreateDialog(nil, self.Connection, nil);
try
  frmMethodWorkAddWork.IK:= TDBNodeMethodsWorkNodeObject(DBDekTreeView_TEST1.Selected.Data).ID;
  frmMethodWorkAddWork.dbeNameW.Text:= DBDekTreeView_TEST1.Selected.Text;
  frmMethodWorkAddWork.Read(false);
  if DBDekTreeView_TEST1.Selected.Parent = nil then
    begin
      frmMethodWorkAddWork.IKParent:= 0;
      frmMethodWorkAddWork.CBox.Visible:= false;
    end
  else
    begin
      frmMethodWorkAddWork.IKParent:= TDBNodeMethodsWorkNodeObject(DBDekTreeView_TEST1.Selected.Parent.Data).ID;
      if (DBDekTreeView_TEST1.Selected.ImageIndex = 16) or (DBDekTreeView_TEST1.Selected.ImageIndex = 1) then
      begin
        frmMethodWorkAddWork.CBox.Checked:= false;
        frmMethodWorkAddWork.CBoxEdition.Checked:= DBDekTreeView_TEST1.Selected.ImageIndex = 16;
        frmMethodWorkAddWork.dbcbWarrant.KeyValue:= TDBNodeMethodsWorkNodeObject(DBDekTreeView_TEST1.Selected.Data).Value;
      end;
    end;
  frmMethodWorkAddWork.IsModified:= false;
  if (frmMethodWorkAddWork.ShowModal() = mrOk) or (frmMethodWorkAddWork.bbApply.Tag = 1) then
  begin
    TDBNodeMethodsWorkNodeObject.UpdateDataSet;
    TDBNodeMethodsWorkNodeObject.CreateRootNodeObjects(DBDekTreeView_TEST1);
    ExpandTreeView(frmMethodWorkAddWork.IK);

    {DBDekTreeView_TEST1.Selected.Text:= frmMethodWorkAddWork.dbeNameW.Text;

    if (frmMethodWorkAddWork.CBox.Visible) then
      if frmMethodWorkAddWork.CBox.Checked then
           tvWork.Selected.ImageIndex:= 2
        else if frmMethodWorkAddWork.CBoxEdition.Checked then
               tvWork.Selected.ImageIndex:= 16
             else tvWork.Selected.ImageIndex:= 1;}
  end;
finally
  frmMethodWorkAddWork.Free;
end;
end;

procedure TfmMethodWorkTreeView.actEditWorkUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= (DBDekTreeView_TEST1.SelectionCount > 0);
end;

constructor TfmMethodWorkTreeView.CreateFrame(AOwner: TComponent;
  AObject: TObject; AConn: TADOConnection);
var
  publisher : IDBActionPublisher;
begin
  inherited CreateFrame(AOwner, AObject, AConn);
  publisher := IDBActionPublisher(dm);
  publisher.AddSubscriber(IDBActionSubscriber(Self));
end;

procedure TfmMethodWorkTreeView.DBDekTreeView_TEST1AdvancedCustomDrawItem(
  Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState;
  Stage: TCustomDrawStage; var PaintImages, DefaultDraw: Boolean);
begin
  inherited;
  //(Sender as TTreeView).Canvas.Font.Color :=TDBNodeObject(Node.Data).Font.Color;
  //DefaultDraw := true;
end;

procedure TfmMethodWorkTreeView.DoRefreshFrame;
begin
  inherited;
  TDBNodeMethodsWorkNodeObject.CreateRootNodeObjects(DBDekTreeView_TEST1);
end;


procedure TfmMethodWorkTreeView.Notify(Sender: TObject; DataSet: TDataSet;
  DBAction: TDBAction);
begin
   ShowMessage('OK');
end;

procedure TfmMethodWorkTreeView.FindIDInTreeView(IDWork: integer);
var i: integer;
begin
  for i:=0 to DBDekTreeView_TEST1.Items.Count-1 do
    if TDBNodeMethodsWorkNodeObject(DBDekTreeView_TEST1.Items[i].Data).ID = IDWork then
      begin
        DBDekTreeView_TEST1.Select(DBDekTreeView_TEST1.Items[i]);
        DBDekTreeView_TEST1.Selected.Expand(false);
        Break;
      end;
end;

procedure TfmMethodWorkTreeView.ExpandTreeView(IDWork: integer);
var
  tempDS: TADODataSet;
begin
    tempDS:= TADODataSet.Create(nil);
    tempDS.Connection:= dm.DBConnect;
    tempDS.CommandText:= 'select * from [MW_FindRoot] (' + IntToStr(IDWork) + ')';
    try
    try
      tempDS.Open;
      tempDS.Last;
      while not (tempDS.Bof) do
      begin
        FindIDInTreeView(tempDS.FieldByName('ID').AsInteger);
        tempDS.Prior;
      end;
      tempDS.Close;
    except
      raise;
    end;
    finally
      tempDS.Free;
    end;
end;

end.
