unit uNagruzkaSelectTeacher;
   {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, DBGridEh, StdCtrls, Mask, DBCtrlsEh, DBLookupEh,
  ActnList, Buttons, ExtCtrls;

type
  TfrmNagruzkaSelectTeacher = class(TfrmBaseDialog)
    dbcbPrep: TDBLookupComboboxEh;
    dbcbWorkType: TDBLookupComboboxEh;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    procedure dbcbPrepKeyValueChanged(Sender: TObject);
    procedure dbcbWorkTypeKeyValueChanged(Sender: TObject);
  private
    fKafIK, fYearIK, fSemTypeIK: integer;
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    procedure Read(KafIK, YearIK, SemTypeIK: integer);
  end;

var
  frmNagruzkaSelectTeacher: TfrmNagruzkaSelectTeacher;

implementation

uses GeneralController, NagruzkaController;

{$R *.dfm}

{ TfrmNagruzkaSelectTeacher }

procedure TfrmNagruzkaSelectTeacher.dbcbPrepKeyValueChanged(Sender: TObject);
begin
  TGeneralController.Instance.CloseLockupCB(@dbcbWorkType);
  if dbcbPrep.KeyValue <> NULL then
    dbcbWorkType.KeyValue:= TNagruzkaController.Preparation.GetAllPrepWorkTypes(@dbcbWorkType.ListSource.DataSet, dbcbPrep.KeyValue, fKafIK, fYearIK, fSemTypeIK, false);
  dbcbWorkTypeKeyValueChanged(dbcbWorkType);
end;

procedure TfrmNagruzkaSelectTeacher.dbcbWorkTypeKeyValueChanged(
  Sender: TObject);
begin
  IsModified:= dbcbWorkType.KeyValue <> NULL;
end;

function TfrmNagruzkaSelectTeacher.DoApply: boolean;
begin
  Result:= true;
end;

function TfrmNagruzkaSelectTeacher.DoCancel: boolean;
begin
  Result:= true;
end;

procedure TfrmNagruzkaSelectTeacher.Read(KafIK, YearIK, SemTypeIK: integer);
begin
  fKafIK:= KafIK;
  fYearIK:= YearIK;
  fSemTypeIK:= SemTypeIK;
  TGeneralController.Instance.InitializeLockupCB(@dbcbPrep, 'iTab_n', 'FIO');
  TGeneralController.Instance.InitializeLockupCB(@dbcbWorkType, 'ik_id_prepod', 'cName_work_type');
  TNagruzkaController.Preparation.GetAllWorkedPrepInKaf(@dbcbPrep.ListSource.DataSet, KafIK, YearIK, SemTypeIK);
end;

end.
