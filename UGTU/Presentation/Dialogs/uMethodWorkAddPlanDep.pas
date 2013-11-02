unit uMethodWorkAddPlanDep;
  {#Author nnikolenko@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, DBGridEh, StdCtrls, Mask, DBCtrlsEh, DBLookupEh,
  ActnList, Buttons, ExtCtrls, GeneralController, MethodWorkController, DateUtils;

type
  TfrmMethodWorkAddPlanDep = class(TfrmBaseDialog)
    Label3: TLabel;
    Label1: TLabel;
    Label11: TLabel;
    dbcbYear: TDBLookupComboboxEh;
    Label4: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dbdtDate: TDBDateTimeEditEh;
    dbcbTypeRep: TDBLookupComboboxEh;
    dbeProtocol: TDBEditEh;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure dbcbYearKeyValueChanged(Sender: TObject);
    procedure dbeProtocolKeyPress(Sender: TObject; var Key: Char);
    procedure dbdtDateChange(Sender: TObject);
  private
    { Private declarations }
    FLastPlanIK: integer;
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    { Public declarations }
    procedure Read;
    property LastPlanIK: integer read FLastPlanIK write FLastPlanIK;
  end;

var
  frmMethodWorkAddPlanDep: TfrmMethodWorkAddPlanDep;

implementation
uses
   ExceptionBase;
{$R *.dfm}

procedure TfrmMethodWorkAddPlanDep.dbdtDateChange(Sender: TObject);
begin
  IsModified:= (dbcbTypeRep.Value <> NULL) and (dbeProtocol.Text <> '') and (dbdtDate.Text <> '');
end;

procedure TfrmMethodWorkAddPlanDep.dbeProtocolKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not(Key in ['0'..'9']) and (Key <> #8) and (Key <> #46) then
 begin
   Key :=#0;
   Beep;
 end;
end;

function TfrmMethodWorkAddPlanDep.DoApply: boolean;
begin
if LastPlanIK <> 0 then
try
  TMethodWorkController.Instance.SavePlanDep(FLastPlanIK, self.IK, dbcbYear.KeyValue, dbdtDate.Text, dbcbTypeRep.KeyValue, dbeProtocol.Text);
  LastPlanIK:= dbcbYear.KeyValue;
except
  on e: EApplicationException do
  begin
    Application.MessageBox(PChar(e.Message), 'ИС Учебно-методическая работа', MB_ICONWARNING);
    exit;
  end;
end;
Result:= true;
end;

function TfrmMethodWorkAddPlanDep.DoCancel: boolean;
begin
if LastPlanIK <> 0 then
  case (Application.MessageBox('Сохранить внесенные изменения?','Измение информации о планируемых УМР', MB_YESNOCANCEL)) of
      mrYes:
        begin
          OK;
          Result:= false;
        end;
      mrNo: Result:= true;
      mrCancel: Result:= false;
      else Result:= false;
  end
else
  Result:= true;
end;

procedure TfrmMethodWorkAddPlanDep.dbcbYearKeyValueChanged(Sender: TObject);
begin
  IsModified:= (dbcbYear.KeyValue <> NULL);
end;

procedure TfrmMethodWorkAddPlanDep.Read;
begin
  if LastPlanIK = 0 then
  begin
    TGeneralController.Instance.InitializeLockupCB(@dbcbYear, 'ik_year', 'UchYear');
    dbcbYear.KeyValue:= TMethodWorkController.Instance.GetPlanMWForPlan(@dbcbYear.ListSource.DataSet, IK, false, true);
  end
  else
  begin
    TGeneralController.Instance.InitializeLockupCB(@dbcbYear, 'ik_year_uch_pl', 'big_year_value');
    TMethodWorkController.Instance.GetAllYears(@dbcbYear.ListSource.DataSet, false, Null);
    TGeneralController.Instance.InitializeLockupCB(@dbcbTypeRep, 'IDTypeReport', 'NameTypeReport');
    dbcbTypeRep.KeyValue:= TMethodWorkController.Instance.GetTypeReport(@dbcbTypeRep.ListSource.DataSet, true, Null);

    Label4.Caption:= TMethodWorkController.Instance.GetDepartmentName(self.IK, true);
    dbdtDate.Value:= Today;
  end;

end;

end.
