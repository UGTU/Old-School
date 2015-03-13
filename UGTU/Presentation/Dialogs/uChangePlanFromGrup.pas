unit uChangePlanFromGrup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseDialog, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, DBGridEh, Data.DB,
  Vcl.Mask, DBCtrlsEh, DBLookupEh, Data.Win.ADODB;

type
  TfrmChangeGrupPlan = class(TfrmBaseDialog)
    dbcmbxGrupPlans: TDBLookupComboboxEh;
    dsGrupPlans: TDataSource;
    Label7: TLabel;
    procedure actApplyExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FGrupIK: integer;
    procedure SetGrupIK(const Value: integer);
    { Private declarations }
  public
    { Public declarations }
    property GrupIK: integer read FGrupIK write SetGrupIK;
  end;

var
  frmChangeGrupPlan: TfrmChangeGrupPlan;

implementation

uses GeneralController, udm, UchPlanController, uDMGroupActions, ExceptionBase;

{$R *.dfm}

procedure TfrmChangeGrupPlan.actApplyExecute(Sender: TObject);
var
  UchPlanIK: integer;
begin
  dm.DBConnect.BeginTrans;
  try
    // создаем новый уч. план
    with dm.aspAddRupGrup do
    begin
      Connection := dm.DBConnect;
      Active := false;
      Parameters.ParamByName('@ik_main_plan').Value := dbcmbxGrupPlans.KeyValue;
      Parameters.ParamByName('@grup_comment').Value :=
        dsGrupPlans.DataSet.FieldByName('Cname_grup').AsString;
      Parameters.ParamByName('@vidgos').Value := dsGrupPlans.DataSet.FieldByName
        ('VidGos').AsInteger;
      Parameters.ParamByName('@ik_spec_fac').Value :=
        dsGrupPlans.DataSet.FieldByName('ik_spec_fac').AsInteger;
      Parameters.ParamByName('@year').Value := dsGrupPlans.DataSet.FieldByName
        ('Nyear').AsInteger;
      ExecProc;
      UchPlanIK := Parameters.ParamByName('@inserted_uch_plan').Value;
    end;

    // копируем успеваемость
    TUchPlanController.Instance.UpdateUspev(FGrupIK, UchPlanIK);

    // устанавливаем ссылку на новый план
    with dmGroupActions.adospAppendGrup.Parameters do
    begin
      ParamByName('@flag').Value := 0;
      ParamByName('@ik_spec_fac').Value := dsGrupPlans.DataSet.FieldByName
        ('ik_spec_fac').AsInteger;
      ParamByName('@Cname_grup').Value := dsGrupPlans.DataSet.FieldByName
        ('Cname_grup').AsString;;
      ParamByName('@ik_uch_plan').Value := UchPlanIK;
      ParamByName('@nYear_post').Value := dsGrupPlans.DataSet.FieldByName
        ('Nyear').AsInteger;
      ParamByName('@Ik_grup').Value := FGrupIK;
      ParamByName('@DateCreate').Value := dsGrupPlans.DataSet.FieldByName
        ('DateCreate').AsDateTime;
      ParamByName('@DateExit').Value := dsGrupPlans.DataSet.FieldByName
        ('DateExit').AsDateTime;
    end;
    dmGroupActions.adospAppendGrup.ExecProc;
    dm.DBConnect.CommitTrans;
  except
    on E:Exception do
    begin
         raise EApplicationException.Create('Не удалось прикрепить группе новый план.',E);
         dm.DBConnect.RollbackTrans;
    end;
  end;
  Close;
end;

procedure TfrmChangeGrupPlan.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dsGrupPlans.DataSet.Close;
  dsGrupPlans.DataSet.Free;
end;

procedure TfrmChangeGrupPlan.SetGrupIK(const Value: integer);
begin
  FGrupIK := Value;
  dsGrupPlans.DataSet := TGeneralController.Instance.GetNewADODataSet(false);
  (dsGrupPlans.DataSet as TADODataSet).CommandText :=
    'select * from GetGrupsUchPlan(' + IntToStr(Value) + ')';
  dsGrupPlans.DataSet.Open;
  dbcmbxGrupPlans.KeyValue := dsGrupPlans.DataSet.FieldByName('ik_uch_plan')
    .AsInteger;
end;

end.
