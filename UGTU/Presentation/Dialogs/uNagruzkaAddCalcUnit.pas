unit uNagruzkaAddCalcUnit;
 {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, DBGridEh,
  DBCtrlsEh, Mask, DBLookupEh;

type
  TfrmNagruzkaAddCalcUnit = class(TfrmBaseDialog)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbcbGrups: TDBLookupComboboxEh;
    dbeUnitName: TDBEditEh;
    dbcbUchPlan: TDBLookupComboboxEh;
    Label8: TLabel;
    Label4: TLabel;
    procedure dbcbGrupsKeyValueChanged(Sender: TObject);
    procedure dbeUnitNameChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  private
    fFormStartClosing: boolean;
  public
    destructor Destroy; override;
    procedure Read;
  end;

var
  frmNagruzkaAddCalcUnit: TfrmNagruzkaAddCalcUnit;

implementation

uses GeneralController, NagruzkaController;

{$R *.dfm}

{ TfrmAddCalcUnit }

procedure TfrmNagruzkaAddCalcUnit.dbcbGrupsKeyValueChanged(Sender: TObject);
begin
  if fFormStartClosing then exit;  
  if dbcbGrups.KeyValue <> NULL then
  begin
    if Tag = -1 then
      dbeUnitName.Text:= dbcbGrups.Text;
    if dbcbGrups.ListSource.DataSet.FieldByName('ik_uch_plan').Value <> NULL then
      dbcbUchPlan.KeyValue:= dbcbGrups.ListSource.DataSet.FieldByName('ik_uch_plan').AsInteger
    else dbcbUchPlan.KeyValue:= TNagruzkaController.Preparation.GetDefaultUchPlanForPotok(IK);
  end
  else
  begin
    if Tag = -1 then dbeUnitName.Text:= '';
  end;
  if self.Showing then dbeUnitName.SetFocus;
  dbeUnitName.SelStart:= Length( dbeUnitName.Text);
  dbeUnitNameChange(nil);
end;

procedure TfrmNagruzkaAddCalcUnit.dbeUnitNameChange(Sender: TObject);
begin
  IsModified:= (dbeUnitName.Text <> '') and (dbcbUchPlan.KeyValue <> NULL);
end;

destructor TfrmNagruzkaAddCalcUnit.Destroy;
begin
  fFormStartClosing:= true;
  TGeneralController.Instance.ReleaseLockupCB(@dbcbUchPlan);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbGrups);
  inherited;
end;

function TfrmNagruzkaAddCalcUnit.DoApply: boolean;
begin
  if Length(dbeUnitName.Text) > 30 then
  begin
    Application.MessageBox('Максимальная длина для названия расчетной единицы составляет 30 символов!', PChar(Caption), MB_ICONWARNING);
    Result:= false;
  end
  else Result:= true;
end;

function TfrmNagruzkaAddCalcUnit.DoCancel: boolean;
begin
  Result:= false;
  case (Application.MessageBox('Сохранить внесенные изменения?',PChar(Caption), MB_YESNOCANCEL)) of
    mrYes: OK;
    mrNo: Result:= true;
  end;
end;

procedure TfrmNagruzkaAddCalcUnit.FormShow(Sender: TObject);
begin
  dbeUnitName.SetFocus;
end;

procedure TfrmNagruzkaAddCalcUnit.Read;
begin
  fFormStartClosing:= false;
  TGeneralController.Instance.InitializeLockupCB(@dbcbGrups, 'ik_grup', 'cName_grup');
  TGeneralController.Instance.InitializeLockupCB(@dbcbUchPlan, 'ik_uch_plan', 'full_name');

  TNagruzkaController.Preparation.GetAllGroupsFromPotok(@dbcbGrups.ListSource.DataSet, self.IK, true);
  TNagruzkaController.Preparation.GetAllUchPlanForPotok(@dbcbUchPlan.ListSource.DataSet, self.IK);

  if Tag = -1 then
    Caption:= 'Добавление расчетной единицы'
  else Caption:= 'Изменение расчетной единицы';
end;

end.
