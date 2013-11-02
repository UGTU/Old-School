unit uMethodWorkAddMWvidZan;
 {#Author nnikolenko@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MethodWorkController, GeneralController, uBaseDialog, ActnList,
  StdCtrls, Buttons, ExtCtrls, ADODB, DB, DBGridEh, GridsEh, Mask, DBCtrlsEh, DBLookupEh;

type
  TfrmMethodWorkAddMWvidZan = class(TfrmBaseDialog)
    Panel2: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    dbcbVidZan: TDBLookupComboboxEh;
    Panel3: TPanel;
    sbDelString: TSpeedButton;
    sbAddString: TSpeedButton;
    Panel4: TPanel;
    Bevel5: TBevel;
    Bevel2: TBevel;
    dbgMethodWork: TDBGridEh;
    DSMethodWork: TDataSource;
    actAdd: TAction;
    actRem: TAction;
    procedure dbcbVidZanKeyValueChanged(Sender: TObject);
    procedure actAddUpdate(Sender: TObject);
    procedure actRemUpdate(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actRemExecute(Sender: TObject);
  private
    { Private declarations }
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    { Public declarations }
    procedure Read;
  end;

var
  frmMethodWorkAddMWvidZan: TfrmMethodWorkAddMWvidZan;

implementation

{$R *.dfm}

function TfrmMethodWorkAddMWvidZan.DoApply: boolean;
begin
  IK:= dbcbVidZan.KeyValue;
  Result:= TMethodWorkController.Instance.SaveMWvidZan(dbcbVidZan.KeyValue);
end;

function TfrmMethodWorkAddMWvidZan.DoCancel: boolean;
begin
  case (Application.MessageBox('Сохранить внесенные изменения?','Измение информации об обеспечении занятий', MB_YESNOCANCEL)) of
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

procedure TfrmMethodWorkAddMWvidZan.actAddExecute(Sender: TObject);
begin
 DSMethodWork.DataSet.First;
 DSMethodWork.DataSet.Insert;
 IsModified:= (dbcbVidZan.KeyValue <> NULL);
end;

procedure TfrmMethodWorkAddMWvidZan.actAddUpdate(Sender: TObject);
begin
  if DSMethodWork.DataSet <> nil then
    actAdd.Enabled:= DSMethodWork.DataSet.Active
  else actAdd.Enabled:= false;
  dbgMethodWork.Enabled:= actAdd.Enabled;
end;

procedure TfrmMethodWorkAddMWvidZan.actRemExecute(Sender: TObject);
begin
 DSMethodWork.DataSet.Delete;
 IsModified:= (dbcbVidZan.KeyValue <> NULL);
end;

procedure TfrmMethodWorkAddMWvidZan.actRemUpdate(Sender: TObject);
begin
  if (DSMethodWork.DataSet <> nil) then
  begin
    if (DSMethodWork.DataSet.Active) then
      actRem.Enabled:= DSMethodWork.DataSet.RecordCount > 0
    else actRem.Enabled:= false;
  end
  else actRem.Enabled:= false;
end;

procedure TfrmMethodWorkAddMWvidZan.dbcbVidZanKeyValueChanged(Sender: TObject);
begin
  if (dbcbVidZan.KeyValue <> NULL) then
    DSMethodWork.DataSet:= TMethodWorkController.Instance.LoadMethodWorkVidZan(dbcbVidZan.ListSource.DataSet.FieldByName('iK_vid_zanyat').AsInteger);
end;

procedure TfrmMethodWorkAddMWvidZan.Read;
begin
  Caption:= 'Добавление обеспечения занятий';
  TGeneralController.Instance.InitializeLockupCB(@dbcbVidZan, 'iK_vid_zanyat', 'cName_ZAN');
  dbcbVidZan.KeyValue:= TMethodWorkController.Instance.GetVidZan(@dbcbVidZan.ListSource.DataSet, 1, true);
  dbcbVidZan.KeyValue:= self.IK;
end;

end.
