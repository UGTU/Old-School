unit uUchPlanEditControlVZ;
  {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, StdCtrls, Buttons, ExtCtrls, ADODB, DB, ActnList,
  Grids, Menus, DBGridEh, ImgList, UchPlanController, GridsEh, ComCtrls, ToolWin;

type
  TfrmEditControlVZ = class(TfrmBaseDialog)
    actRem: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    DataSource1: TDataSource;
    actAdd: TAction;
    Panel2: TPanel;
    dbgContent: TDBGridEh;
    Panel3: TPanel;
    Bevel3: TBevel;
    Bevel5: TBevel;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolBar2: TToolBar;
    ToolButton2: TToolButton;
    procedure actRemUpdate(Sender: TObject);
    procedure actRemExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DataSource1StateChange(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actAddUpdate(Sender: TObject);
    procedure DataSource1UpdateData(Sender: TObject);
  private
    fVidZanyatIK: integer;
    fDefaultKafIK: integer;
    DiscUPIK: integer;
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    procedure Read(defaultKafIK, DiscInUchPlanIK, vidZanyatIK: integer; vidZanyatName: string);
  end;

var
  frmEditControlVZ: TfrmEditControlVZ;

implementation

{$R *.dfm}

uses uDM;

procedure TfrmEditControlVZ.Read(defaultKafIK, DiscInUchPlanIK, vidZanyatIK: integer; vidZanyatName: string);
begin
  fDefaultKafIK:= defaultKafIK;
  fVidZanyatIK:= vidZanyatIK;
  DiscUPIK := DiscInUchPlanIK;

  Caption:= Caption + vidZanyatName + '"';
  dbgContent.DataSource.DataSet:= TUchPlanController.Instance.LoadControlVZ(DiscInUchPlanIK, vidZanyatIK);
  if (fVidZanyatIK=33) then
  begin
  dbgContent.DataSource.DataSet.FieldByName('n_module').Visible:=true;
  dbgContent.DataSource.DataSet.FieldByName('i_balls').Visible:=true;
  end
  else
  begin
  dbgContent.DataSource.DataSet.FieldByName('n_module').Visible:=false;
  if (fVidZanyatIK=6) then
  dbgContent.DataSource.DataSet.FieldByName('i_balls').Visible:=true else
  dbgContent.DataSource.DataSet.FieldByName('i_balls').Visible:=false;
  end;

  IsModified:= false;
end;

function TfrmEditControlVZ.DoApply: boolean;
begin
  if (dbgContent.DataSource.DataSet.State = dsInsert) or (dbgContent.DataSource.DataSet.State = dsEdit) then dbgContent.DataSource.DataSet.Post;
  Result:= TUchPlanController.Instance.SaveControlVZ(DiscUPIK, fVidZanyatIK);
end;

function TfrmEditControlVZ.DoCancel: boolean;
begin
    case (Application.MessageBox('Сохранить внесенные изменения?','Изменение параметров дисциплины учебного плана',MB_YESNOCANCEL)) of
      mrYes:
        begin
          OK;
          Result:= false;
        end;
      mrNo: Result:= true;
      mrCancel: Result:= false;
      else Result:= false;
    end;
end;

procedure TfrmEditControlVZ.actRemUpdate(Sender: TObject);
begin
  if (dbgContent.DataSource.DataSet.Active) then
    (Sender as TAction).Enabled:= dbgContent.DataSource.DataSet.RecordCount > 0
  else (Sender as TAction).Enabled:= false;
end;

procedure TfrmEditControlVZ.actRemExecute(Sender: TObject);
begin
  dbgContent.DataSource.DataSet.Delete;
  IsModified:= true;
end;

procedure TfrmEditControlVZ.FormDestroy(Sender: TObject);
begin
  inherited;
  dm.adsContentVZ.Close;
end;

procedure TfrmEditControlVZ.FormShow(Sender: TObject);
begin
  inherited;
  dbgContent.SetFocus;
end;

procedure TfrmEditControlVZ.DataSource1StateChange(Sender: TObject);
begin
  inherited;
  IsModified:= true;
end;

procedure TfrmEditControlVZ.actAddExecute(Sender: TObject);
var
  max: integer;
begin
try
  max:= 0;
  dbgContent.DataSource.DataSet.DisableControls;
  dbgContent.DataSource.DataSet.First;
  while (not dbgContent.DataSource.DataSet.Eof) do
  begin
    if (dbgContent.DataSource.DataSet.FieldByName('n_sem').AsInteger > max) then
      max:= dbgContent.DataSource.DataSet.FieldByName('n_sem').AsInteger;
    dbgContent.DataSource.DataSet.Next;
  end;
  dbgContent.DataSource.DataSet.EnableControls;
  dbgContent.DataSource.DataSet.First;
  dbgContent.DataSource.DataSet.Insert;
  dbgContent.DataSource.DataSet.FieldByName('n_sem').Value:= max+1;
  dbgContent.DataSource.DataSet.FieldByName('ik_kaf').Value:= fDefaultKafIK;
  dbgContent.DataSource.DataSet.Post;
  dbgContent.SetFocus;
  IsModified:= true;
except
  raise;
end;
end;

procedure TfrmEditControlVZ.actAddUpdate(Sender: TObject);
begin
  if dbgContent.DataSource.DataSet <> nil then
    (Sender as TAction).Enabled:= dbgContent.DataSource.DataSet.Active
  else (Sender as TAction).Enabled:= false;
end;

procedure TfrmEditControlVZ.DataSource1UpdateData(Sender: TObject);
begin
  inherited;
  IsModified:= true;
end;

end.
