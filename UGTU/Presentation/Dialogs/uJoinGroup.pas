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
    Label1: TLabel;
    dbcbeOrder: TDBLookupComboboxEh;
    DbcbeGroup: TDBLookupComboboxEh;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Label3: TLabel;
    eNum: TDBEditEh;
    Bevel2: TBevel;
    dbcbeCause: TDBLookupComboboxEh;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure actOKUpdate(Sender: TObject);
    procedure DbcbeGroupChange(Sender: TObject);
    procedure eNumChange(Sender: TObject);
  private
    //FJoinList:TObjectList;
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


 //загружаем список приказов
 TGeneralController.Instance.InitializeLockupCB(@dbcbeOrder, 'Ik_prikaz', 'NN_Date');
 TAbitZachislenieController.Instance.GetPrikazList(@dbcbeOrder.ListSource.DataSet);

 //загружаем список групп
 TGeneralController.Instance.InitializeLockupCB(@DbcbeGroup, 'Ik_grup', 'Cname_grup');
 TAbitZachislenieController.Instance.GetGrupList(@DbcbeGroup.ListSource.DataSet, domspec, year);

  if EditMode then
  begin
    Caption:='Изменить группу';
    dbcbeCause.Enabled:=false;
    dbcbeOrder.Enabled:=false;
//При редактировании нескольких абитуриентов номер зачетки неизменяем
    if AbitCount>1 then
    begin
      Label3.Visible:=false;
      eNum.Visible:=false;
      Height:=210;
    end;
  end
  else
  begin
  //генерируем новый номер зачетки
  if eNum.Text='' then
    eNum.Text:= TAbitZachislenieController.Instance.GetNewNZach(year);
    dbcbeCause.KeyValue:=115;
    self.Caption:='Зачисление в группу';
  end;

  if AbitCount<2 then
    Label3.Caption:='Номер зачетной книжки'
  else
    begin
      Label3.Caption:='Начиная с номера зачетной книжки';
      Label3.Left := 209;
    end;
  mrOk:= false;
  isModified:= false;

end;

procedure TfrmJoinGroup.SpeedButton2Click(Sender: TObject);
begin
   frmMain.actAddPrikaz.Execute;
   dbcbeOrder.ListSource.DataSet.Close;
   dbcbeOrder.ListSource.DataSet.Open;
end;

procedure TfrmJoinGroup.SpeedButton1Click(Sender: TObject);
begin
   frmMain.actAddGroup.Tag:=domspec;
   frmMain.actAddGroup.Execute;
   DbcbeGroup.ListSource.DataSet.Close;
   DbcbeGroup.ListSource.DataSet.Open;
end;


procedure TfrmJoinGroup.actOKExecute(Sender: TObject);
begin
//Проверяем, чтобы такого номера зачетки еще не было в базе
  if True then
  
  if (not EditMode)and (not HasZachMode) and (TAbitZachislenieController.Instance.Abit_IsOldZach(eNum.Text)) then
  begin
    raise EApplicationException.Create('Вы внесли уже используемый номер зачетки!');
    exit;
  end;
  isModified:= false;
  mrOk:= true;
  self.Close;
end;                  

procedure TfrmJoinGroup.actOKUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:=
    ((EditMode) and (isModified) and (DbcbeGroup.Text<>'') and (eNum.Text<>''))or
    ((not EditMode) and (DbcbeGroup.Text<>'') and (eNum.Text<>'') and (dbcbeOrder.Text<>'') and (dbcbeCause.Text<>''));

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
