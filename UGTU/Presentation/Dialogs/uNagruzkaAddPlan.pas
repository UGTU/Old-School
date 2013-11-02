unit uNagruzkaAddPlan;
  {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, DBGridEh, UchPlanController,
  Mask, DBCtrlsEh, DBLookupEh, ADODB, DB, NagruzkaController, GeneralController;

type
  TfrmNagruzkaAddPlan = class(TfrmBaseDialog)
    Label4: TLabel;
    Label3: TLabel;
    dbcbTypeEd: TDBLookupComboboxEh;
    Label5: TLabel;
    Label6: TLabel;
    dbcbFormEd: TDBLookupComboboxEh;
    Label8: TLabel;
    Label9: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Image9: TImage;
    Label17: TLabel;
    Image1: TImage;
    Label7: TLabel;
    procedure dbcbYearKeyValueChanged(Sender: TObject);
    procedure Label4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure actSpravExecute(Sender: TObject);
    procedure Label17MouseEnter(Sender: TObject);
    procedure Label17MouseLeave(Sender: TObject);
    procedure Label7MouseLeave(Sender: TObject);
    procedure Label7MouseEnter(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure Label17Click(Sender: TObject);
  private
    fYearIK, fSemIK: integer;
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    LastPlanIK: integer;
    procedure Read(YearIK, SemIK: integer);
  end;

var
  frmNagruzkaAddPlan: TfrmNagruzkaAddPlan;

implementation

{$R *.dfm}

{ TfrmNagruzkaAddPlan }

function TfrmNagruzkaAddPlan.DoApply: boolean;
begin
  LastPlanIK:= Tag;
  Result:= TNagruzkaController.PlanNagruzka.SavePlan(LastPlanIK, self.IK, fYearIK, fSemIK, dbcbTypeEd.KeyValue, dbcbFormEd.KeyValue);
end;

function TfrmNagruzkaAddPlan.DoCancel: boolean;
begin
  case (Application.MessageBox('Сохранить внесенные изменения?','Измение информации о планируемой нагрузке', MB_YESNOCANCEL)) of
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



procedure TfrmNagruzkaAddPlan.Read(YearIK, SemIK: integer);
begin
  fYearIK:= YearIK;
  fSemIK:= SemIK;
{  TGeneralController.Instance.InitializeLockupCB(@dbcbYear, 'ik_year_uch_pl', 'big_year_value');
  TNagruzkaController.Instance.GetAllYears(@dbcbYear.ListSource.DataSet, false, NULL);
  TGeneralController.Instance.InitializeLockupCB(@dbcbSem, 'ik_sem_type','Cname_sem_type');
  TNagruzkaController.Instance.GetAllSemesters(@dbcbSem.ListSource.DataSet);
 }
  Label2.Caption:= TNagruzkaController.Directory.GetSemesterName(fYearIK, fSemIK);
  TGeneralController.Instance.InitializeLockupCB(@dbcbTypeEd, 'ik_type_ed', 'cName_type_ed');
  TNagruzkaController.Directory.GetAllPlanTypes(@dbcbTypeEd.ListSource.DataSet);
  TGeneralController.Instance.InitializeLockupCB(@dbcbFormEd, 'ik_form_ed', 'cName_form_ed');
  TUchPlanController.Instance.getAllFormEd(@dbcbFormEd.ListSource.DataSet, false);
  TGeneralController.Instance.SetCaptionDots(@Label4, TNagruzkaController.Directory.GetDepartmentName(self.IK, false), 375);
  if (Tag < 0) then
  begin
    Caption:= 'Добавление плана учебной нагрузки';
    HelpKeyword:= 'Нагрузка\Add_NagrDep.htm';
  end
  else
  begin
    Caption:= 'Изменение плана учебной нагрузки';
    HelpKeyword:= 'Нагрузка\Edit_NagrDep.htm';
  end;
end;

procedure TfrmNagruzkaAddPlan.actSpravExecute(Sender: TObject);
begin
  inherited;
  TGeneralController.Instance.RefreshLockupCB(@dbcbTypeEd);
  TGeneralController.Instance.RefreshLockupCB(@dbcbFormEd);
end;

procedure TfrmNagruzkaAddPlan.dbcbYearKeyValueChanged(Sender: TObject);
begin
  IsModified:= (dbcbTypeEd.KeyValue <> NULL) and (dbcbFormEd.KeyValue <> NULL);
end;

procedure TfrmNagruzkaAddPlan.Label17Click(Sender: TObject);
var
  key: word;
begin
  key:= 112;
  FormKeyUp(Self, key, []);
end;

procedure TfrmNagruzkaAddPlan.Label17MouseEnter(Sender: TObject);
begin
  Label17.Font.Style:= Label17.Font.Style + [fsUnderline];
end;

procedure TfrmNagruzkaAddPlan.Label17MouseLeave(Sender: TObject);
begin
  Label17.Font.Style:= Label17.Font.Style - [fsUnderline];
end;

procedure TfrmNagruzkaAddPlan.Label4MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  Label4.ShowHint:= true;
end;

procedure TfrmNagruzkaAddPlan.Label7Click(Sender: TObject);
begin
  actSpravExecute(actSprav);
end;

procedure TfrmNagruzkaAddPlan.Label7MouseEnter(Sender: TObject);
begin
  Label7.Font.Style:= Label7.Font.Style + [fsUnderline];
end;

procedure TfrmNagruzkaAddPlan.Label7MouseLeave(Sender: TObject);
begin
  Label7.Font.Style:= Label7.Font.Style - [fsUnderline];
end;

end.
