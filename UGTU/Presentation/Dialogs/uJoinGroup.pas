unit uJoinGroup;
   {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, StdCtrls, ActnList, Buttons, ExtCtrls, uDm,
  DBGridEh, DBCtrlsEh, Mask, DBLookupEh, Contnrs, ApplicationController, ExceptionBase,
  System.Actions;

type
  TfrmJoinGroup = class(TfrmBaseDialog)
    DbcbeGroup: TDBLookupComboboxEh;
    Label2: TLabel;
    dbcbeCause: TDBLookupComboboxEh;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    SpeedButton2: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure AddGroupClick(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure actOKUpdate(Sender: TObject);
    procedure DbcbeGroupChange(Sender: TObject);
    procedure eNumChange(Sender: TObject);
  private
    { Private declarations }
  public
    isModified, mrOk: boolean;
    EditMode, HasZachMode:boolean;
    AbitCount:integer;
    domspec:integer;
    year:integer;
    FirstRecord,LastRecord:string;
    destructor Destroy;override;
    { Public declarations }
  end;

var
  frmJoinGroup: TfrmJoinGroup;

implementation

uses uMain, ADODB, Math, uDMRecordBook,
  uAbitZachislenieController,
  GeneralController;
{$R *.dfm}



procedure TfrmJoinGroup.FormShow(Sender: TObject);
begin
 //загружаем список причин поступления
 TGeneralController.Instance.InitializeLockupCB(@dbcbeCause, 'Ik_pric', 'Cname_pric');
 TAbitZachislenieController.Instance.GetJoinCauses(@dbcbeCause.ListSource.DataSet);

 //загружаем список групп
 TGeneralController.Instance.InitializeLockupCB(@DbcbeGroup, 'Ik_grup', 'Cname_grup');
 TAbitZachislenieController.Instance.GetGrupList(@DbcbeGroup.ListSource.DataSet, domspec, year);

  if EditMode then
  begin
    Caption:='Изменить группу';
    dbcbeCause.Enabled:=false;
  end
  else
  begin
    dbcbeCause.KeyValue:=115;
    self.Caption:='Зачисление в группу';
  end;

  mrOk:= false;
  isModified:= false;

end;

procedure TfrmJoinGroup.SpeedButton2Click(Sender: TObject);
begin
   frmMain.actAddPrikaz.Execute;
end;

procedure TfrmJoinGroup.AddGroupClick(Sender: TObject);
begin
   frmMain.actAddGroup.Tag:=domspec;
   frmMain.actAddGroup.Execute;
   DbcbeGroup.ListSource.DataSet.Close;
   DbcbeGroup.ListSource.DataSet.Open;
end;


procedure TfrmJoinGroup.actOKExecute(Sender: TObject);
begin
  isModified:= false;
  mrOk:= true;
  self.Close;
end;

procedure TfrmJoinGroup.actOKUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:=
    ((EditMode) and (isModified) and (DbcbeGroup.Text<>''))or
    ((not EditMode) and (DbcbeGroup.Text<>'') and (dbcbeCause.Text<>''));

end;

procedure TfrmJoinGroup.DbcbeGroupChange(Sender: TObject);
begin
  isModified:= true;
end;

destructor TfrmJoinGroup.Destroy;
begin
  inherited;
end;

procedure TfrmJoinGroup.eNumChange(Sender: TObject);
begin
  isModified:= true;
end;

end.
