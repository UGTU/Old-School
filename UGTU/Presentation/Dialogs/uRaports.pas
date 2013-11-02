unit uRaports;
 {#Author tanyav@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, Grids,
  DBGridEh, ComCtrls, Mask, DBCtrlsEh, DBLookupEh, uUspevGroupController;

type
  TfrmRaporsDlg = class(TfrmBaseDialog)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    actAllRight: TAction;
    actRight: TAction;
    actLeft: TAction;
    actAllLeft: TAction;
    Label1: TLabel;
    Label2: TLabel;
    lvDop: TListView;
    lvNDop: TListView;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblGroup: TLabel;
    lblSemestr: TLabel;
    lv2: TListView;
    lv1: TListView;
    cmbx_UpContent: TDBLookupComboboxEh;
    procedure actAllRightExecute(Sender: TObject);
    procedure actRightExecute(Sender: TObject);
    procedure actLeftExecute(Sender: TObject);
    procedure actAllLeftExecute(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure cmbx_UpContentChange(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
    procedure actAllRightUpdate(Sender: TObject);
    procedure actAllLeftUpdate(Sender: TObject);
  private
    { Private declarations }   
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    { Public declarations }
    nSem: Integer;
    ikGroup: Integer;
    ikDisc: Integer;
    ikVidZan: Integer;
  end;

var
  frmRaporsDlg: TfrmRaporsDlg;

implementation

uses uDM, ADODB, uDMUspevaemost;

{$R *.dfm}

procedure TfrmRaporsDlg.actAllLeftUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled:= (lvNDop.Items.Count>0);
end;

procedure TfrmRaporsDlg.actAllRightExecute(Sender: TObject);
var
  li: TListItem;
begin
  inherited;
  while lvDop.Items.Count > 0 do
  begin
    li := lvNDop.Items.Add;
    li.Caption := lvDop.Items[0].Caption;
    li.SubItems.Add(lvDop.Items[0].SubItems[0]);
    li.SubItems.Add(lvDop.Items[0].SubItems[1]);
    lvDop.Items[0].Delete;
  end;
  IsModified := true;
end;

procedure TfrmRaporsDlg.actAllRightUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled:= (lvDop.Items.Count>0);
end;

procedure TfrmRaporsDlg.actApplyExecute(Sender: TObject);
begin
  inherited;
  cmbx_UpContentChange(Sender);
end;

procedure TfrmRaporsDlg.actRightExecute(Sender: TObject);
var
  li: TListItem;
begin
  inherited;
  if lvDop.Selected=nil then Exit;
  li := lvNDop.Items.Add;
  li.Caption := lvDop.Selected.Caption;
  li.SubItems.Add(lvDop.Selected.SubItems[0]);
  li.SubItems.Add(lvDop.Selected.SubItems[1]);
  lvDop.Selected.Delete;    
  IsModified := true;
end;

procedure TfrmRaporsDlg.actLeftExecute(Sender: TObject);
var
  li: TListItem;
begin
  inherited;
  if lvNDop.Selected=nil then Exit;
  li := lvDop.Items.Add;
  li.Caption := lvNDop.Selected.Caption;
  li.SubItems.Add(lvNDop.Selected.SubItems[0]);
  li.SubItems.Add(lvNDop.Selected.SubItems[1]);
  lvNDop.Selected.Delete;
  IsModified := true;
end;

procedure TfrmRaporsDlg.actAllLeftExecute(Sender: TObject);
var
  li: TListItem;
begin
  inherited;
  while lvNDop.Items.Count > 0 do
  begin
    li := lvDop.Items.Add;
    li.Caption := lvNDop.Items[0].Caption;
    li.SubItems.Add(lvNDop.Items[0].SubItems[0]);
    li.SubItems.Add(lvNDop.Items[0].SubItems[1]);
    lvNDop.Items[0].Delete;
  end;
  IsModified := true;
end;

function TfrmRaporsDlg.DoApply: boolean;
begin
  if cmbx_UpContent.KeyValue=null then
  begin
    MessageBox(Handle, 'Выберите дисциплину!','ИС "УГТУ"',
          MB_OK) ;
    Result:= false;
    exit;
  end;

  if not TUspevGroupController.Instance.DoRaports(lv1, lv2, lvDop, lvNDop,
      ikGroup, cmbx_UpContent.KeyValue) then
  begin
    MessageBox(Handle, 'Произошла ошибка при сохранении рапортов','ИС "УГТУ"',
          MB_OK) ;
    Result:= false;
    exit;
  end;

  Result:= true;
end;

function TfrmRaporsDlg.DoCancel: boolean;
begin
  Result:= true;
end;
procedure TfrmRaporsDlg.bbCancelClick(Sender: TObject);
begin
  inherited;
  DoCancel;
end;

//загрузка списков допущенных и недопущенных
procedure TfrmRaporsDlg.cmbx_UpContentChange(Sender: TObject);  var
  li: TListItem;
begin
  if cmbx_UpContent.KeyValue=null then
    exit;
  //загружаем список допущенных
  if not TUspevGroupController.Instance.GetDopusksList(@dmUspevaemost.adodsGetDopuskForVedom,
      ikGroup, cmbx_UpContent.KeyValue, 1) then
        exit;
  frmRaporsDlg.lvDop.Clear;
  frmRaporsDlg.lv1.Clear;
  //загружаем список недопущенных
  if not TUspevGroupController.Instance.GetDopusksList(@dmUspevaemost.adodsGetDopuskForVedom0,
      ikGroup, cmbx_UpContent.KeyValue, 0) then
        exit;
  frmRaporsDlg.lvNDop.Clear;
  frmRaporsDlg.lv2.Clear;
  while not dmUspevaemost.adodsGetDopuskForVedom.Eof do
  begin
    li := frmRaporsDlg.lvDop.Items.Add;
    li.Caption := dmUspevaemost.adodsGetDopuskForVedom.FieldValues['Nn_zach'];
    li.SubItems.Add(dmUspevaemost.adodsGetDopuskForVedom.FieldValues['FIO']);
    li.SubItems.Add(dmUspevaemost.adodsGetDopuskForVedom.FieldValues['ik_Zach']);
    //ShowMessage(IntToStr(frmRaporsDlg.lvDop.Items.Count));
    li := frmRaporsDlg.lv1.Items.Add;
    li.Caption := dmUspevaemost.adodsGetDopuskForVedom.FieldValues['Nn_zach'];
    li.SubItems.Add(dmUspevaemost.adodsGetDopuskForVedom.FieldValues['FIO']);
    li.SubItems.Add(dmUspevaemost.adodsGetDopuskForVedom.FieldValues['ik_Zach']);
    //ShowMessage(IntToStr(frmRaporsDlg.lv1.Items.Count));
    dmUspevaemost.adodsGetDopuskForVedom.Next;
  end;
  dmUspevaemost.adodsGetDopuskForVedom0.First;
  while not dmUspevaemost.adodsGetDopuskForVedom0.Eof do
  begin
    li := frmRaporsDlg.lvNDop.Items.Add;
    li.Caption := dmUspevaemost.adodsGetDopuskForVedom0.FieldValues['Nn_zach'];
    li.SubItems.Add(dmUspevaemost.adodsGetDopuskForVedom0.FieldValues['FIO']);
    li.SubItems.Add(dmUspevaemost.adodsGetDopuskForVedom0.FieldValues['ik_Zach']);
    //ShowMessage(IntToStr(frmRaporsDlg.lvNDop.Items.Count));
    li := frmRaporsDlg.lv2.Items.Add;
    li.Caption := dmUspevaemost.adodsGetDopuskForVedom0.FieldValues['Nn_zach'];
    li.SubItems.Add(dmUspevaemost.adodsGetDopuskForVedom0.FieldValues['FIO']);
    li.SubItems.Add(dmUspevaemost.adodsGetDopuskForVedom0.FieldValues['ik_Zach']);
    //ShowMessage(IntToStr(frmRaporsDlg.lv2.Items.Count));
    dmUspevaemost.adodsGetDopuskForVedom0.Next;
  end;
end;

end.
