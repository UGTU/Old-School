unit uAbitZach;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseDialog, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, DBGridEh, Vcl.Mask,
  DBCtrlsEh, DBLookupEh;

type
  TfrmAbitZachDialog = class(TfrmBaseDialog)
    dbcbeOrder: TDBLookupComboboxEh;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure actOKUpdate(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
  private
    { Private declarations }
  public
    isModified, mrOk: boolean;
    dPrikaz: TDate;
    { Public declarations }
  end;

var
  frmAbitZachDialog: TfrmAbitZachDialog;

implementation

uses uMain, uAbitZachislenieController, GeneralController;

{$R *.dfm}

procedure TfrmAbitZachDialog.actOKExecute(Sender: TObject);
begin
  dPrikaz := dbcbeOrder.ListSource.DataSet.FieldByName('Dd_prikaz').Value;
  mrOk:= true;
  self.Close;
end;

procedure TfrmAbitZachDialog.actOKUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (dbcbeOrder.Text<>'');
end;

procedure TfrmAbitZachDialog.FormShow(Sender: TObject);
begin
 //загружаем список приказов
 TGeneralController.Instance.InitializeLockupCB(@dbcbeOrder, 'Ik_prikaz', 'NN_Date');
 TAbitZachislenieController.Instance.GetPrikazList(@dbcbeOrder.ListSource.DataSet);
 mrOk := false;
end;

procedure TfrmAbitZachDialog.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  frmMain.actAddPrikaz.Execute;
  dbcbeOrder.ListSource.DataSet.Close;
  dbcbeOrder.ListSource.DataSet.Open;
end;

end.
