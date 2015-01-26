unit uChangeKatZach;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, DBGridEh,
  DBCtrlsEh, Mask, DBLookupEh, uDm, dbtvStudObj, uDmStudentData, System.Actions;

type
  TfrmChangeKatZach = class(TfrmBaseDialog)
    Label2: TLabel;
    Label57: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    dbcbeCause: TDBLookupComboboxEh;
    SpeedButton2: TSpeedButton;
    dbcbeNumPrik: TDBLookupComboboxEh;
    Label4: TLabel;
    Label3: TLabel;
    dbcbeNewKat: TDBLookupComboboxEh;
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
    procedure dbcbeCauseChange(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    student: TDBNodeStudObject;
    { Public declarations }
  end;

var
  frmChangeKatZach: TfrmChangeKatZach;

implementation

uses uDMCauses, uDMStudentActions, uDMPrikaz, uMain;
{$R *.dfm}

function CheckFields: boolean;
begin
  result := true;
  with frmChangeKatZach do
  begin
    if (dbcbeNumPrik.Text = '') or (dbcbeCause.Text = '') or
      (dbcbeNewKat.Text = '') then
      result := false
  end;
end;

procedure TfrmChangeKatZach.actApplyExecute(Sender: TObject);
begin
  dmStudentActions.aspChangeKatZach.Active := false;

  with dmStudentActions.aspChangeKatZach.Parameters do
  begin
    items[1].Value := 0;
    items[2].Value := dbcbeNumPrik.KeyValue;
    items[3].Value := student.RecordbookKey;
    items[4].Value := dbcbeCause.KeyValue;
    items[5].Value := dbcbeNewKat.KeyValue;
  end;

  try
    dmStudentActions.aspChangeKatZach.ExecProc;
  except
    showmessage('Неверно заданы параметры!');
  end;
  bbOk.Enabled := false;
  bbApply.Enabled := false;
end;

procedure TfrmChangeKatZach.actOKExecute(Sender: TObject);
begin
  actApplyExecute(Sender);
  close;
end;

procedure TfrmChangeKatZach.bbCancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmChangeKatZach.dbcbeCauseChange(Sender: TObject);
begin

  if CheckFields then
  begin
    bbOk.Enabled := true;
    bbApply.Enabled := true;
  end
  else
  begin
    bbOk.Enabled := false;
    bbApply.Enabled := false;
  end;
end;

procedure TfrmChangeKatZach.FormShow(Sender: TObject);
begin
  dmPrikaz.adodsPrikaz.Active := true;
  dmCauses.adodsKatZachCause.Active := true;
  dbcbeCause.KeyValue := 146;
end;

procedure TfrmChangeKatZach.SpeedButton2Click(Sender: TObject);
begin
  frmMain.actAddPrikaz.execute;
end;

end.
