unit uMethodWorkSrokMW;
 {#Author nnikolenko@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, DBGridEh,
  GridsEh, Mask, DBCtrlsEh, DB, DBLookupEh, MethodWorkController, GeneralController;

type
  TfrmMethodWorkSrokMW = class(TfrmBaseDialog)
    Panel2: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    dbcbMW: TDBLookupComboboxEh;
    Panel3: TPanel;
    sbDelString: TSpeedButton;
    sbAddString: TSpeedButton;
    Panel4: TPanel;
    Bevel5: TBevel;
    Bevel2: TBevel;
    dbgMethodWork: TDBGridEh;
    dsSrok: TDataSource;
    actAdd: TAction;
    actRem: TAction;
    procedure dbcbMWKeyValueChanged(Sender: TObject);
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
  frmMethodWorkSrokMW: TfrmMethodWorkSrokMW;

implementation

{$R *.dfm}

function TfrmMethodWorkSrokMW.DoApply: boolean;
begin
  IK:= dbcbMW.KeyValue;
  Result:= TMethodWorkController.Instance.SaveSrokMW(dbcbMW.KeyValue);
end;

function TfrmMethodWorkSrokMW.DoCancel: boolean;
begin
  case (Application.MessageBox('Сохранить внесенные изменения?','Измение информации о сроках действия обеспечения', MB_YESNOCANCEL)) of
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

procedure TfrmMethodWorkSrokMW.actAddExecute(Sender: TObject);
begin
 dsSrok.DataSet.First;
 dsSrok.DataSet.Insert;
 IsModified:= (dbcbMW.KeyValue <> NULL);
end;

procedure TfrmMethodWorkSrokMW.actAddUpdate(Sender: TObject);
begin
  if dsSrok.DataSet <> nil then
    actAdd.Enabled:= dsSrok.DataSet.Active
  else actAdd.Enabled:= false;
  dbgMethodWork.Enabled:= actAdd.Enabled;
end;

procedure TfrmMethodWorkSrokMW.actRemExecute(Sender: TObject);
begin
 dsSrok.DataSet.Delete;
 IsModified:= (dbcbMW.KeyValue <> NULL);
end;

procedure TfrmMethodWorkSrokMW.actRemUpdate(Sender: TObject);
begin
  if (dsSrok.DataSet <> nil) then
  begin
    if (dsSrok.DataSet.Active) then
      actRem.Enabled:= dsSrok.DataSet.RecordCount > 0
    else actRem.Enabled:= false;
  end
  else actRem.Enabled:= false;
end;

procedure TfrmMethodWorkSrokMW.dbcbMWKeyValueChanged(Sender: TObject);
begin
if (dbcbMW.KeyValue <> NULL) then
    dsSrok.DataSet:= TMethodWorkController.Instance.LoadSrokMethodWork(dbcbMW.ListSource.DataSet.FieldByName('IDMethodWork').AsInteger);
end;

procedure TfrmMethodWorkSrokMW.Read;
begin
  Caption:= 'Добавление сроков действия обеспечения';
  TGeneralController.Instance.InitializeLockupCB(@dbcbMW, 'IDMethodWork', 'NameWork');
  dbcbMW.KeyValue:= TMethodWorkController.Instance.GetMethodWork(@dbcbMW.ListSource.DataSet, true);
  dbcbMW.KeyValue:= self.IK;
end;

end.
