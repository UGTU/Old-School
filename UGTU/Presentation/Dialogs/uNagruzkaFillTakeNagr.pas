unit uNagruzkaFillTakeNagr;
  {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Contnrs,
  Dialogs, uBaseDialog, DBGridEh, StdCtrls, Mask, DBCtrlsEh, DBLookupEh, uNagruzkaDiscToTeacher,
  ActnList, Buttons, ExtCtrls, NagruzkaController, GeneralController, NagruzkaClasses;

type
  TfrmNagruzkaFillTakeNagr = class(TfrmBaseDialog)
    Panel5: TPanel;
    Panel7: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Panel8: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    dbcbVidNagruzki: TDBLookupComboboxEh;
    dbcbVidZanyat: TDBLookupComboboxEh;
    Panel9: TPanel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Image9: TImage;
    Label1: TLabel;
    procedure dbcbVidZanyatKeyValueChanged(Sender: TObject);
    procedure dbcbVidNagruzkiKeyValueChanged(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actOKToAddTCUUpdate(Sender: TObject);
    procedure Label1MouseEnter(Sender: TObject);
    procedure Label1MouseLeave(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private
    fPlanIK: integer;
    fDiscIK: integer;
    fPotokIK: integer;
    fPotokNormOfTimeIK: integer;
    fTakeNagr: TObjectList;
    fMyTeacherAttach: TTeacherAttach;
    procedure myTASetEditText(Sender: TObject; ACol, ARow: Integer; const Value: String);
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    procedure myTACheckBoxChange(Sender: TObject);
    procedure Read(TakeNagr: TObjectList; PlanIK, DiscIK, PotokIK, PotokNormOfTimeIK: integer);
    property MyTeacherAttach: TTeacherAttach read fMyTeacherAttach write fMyTeacherAttach;
  end;

var
  frmNagruzkaFillTakeNagr: TfrmNagruzkaFillTakeNagr;

implementation

{$R *.dfm}

procedure TfrmNagruzkaFillTakeNagr.actOKToAddTCUUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= (dbcbVidNagruzki.KeyValue <> NULL) and (fMyTeacherAttach.RowCount > 1);
end;

procedure TfrmNagruzkaFillTakeNagr.dbcbVidNagruzkiKeyValueChanged(
  Sender: TObject);
var
  NormPerUnit, NormPerStudent, MaxNormPerStudent, NormPerUnitForMin, NormPerStudentForMin: double;
  temp: TObjectList;
  tempTCU: TTakeNagrUnit;
  i, minContingent: integer;
begin
  fMyTeacherAttach.Clear;
  if dbcbVidNagruzki.KeyValue <> NULL then
  begin
    for I := 0 to fTakeNagr.Count - 1 do
    begin
      tempTCU:= TTakeNagrUnit(fTakeNagr[i]);
      if (tempTCU.ContentPlanNagrIK = dbcbVidNagruzki.ListSource.DataSet.FieldByName('ik_content_plan_nagr').AsInteger) then
      begin
        fMyTeacherAttach.NormPerUnit:= tempTCU.NormPerUnit;
        fMyTeacherAttach.NormPerStudent:= tempTCU.NormPerStudent;
        fMyTeacherAttach.MaxNormPerStudent:= tempTCU.MaxNormPerStudent;
        fMyTeacherAttach.MinContingent:= tempTCU.MinContingent;
        fMyTeacherAttach.NormPerUnitForMin:= tempTCU.NormPerUnitForMin;
        fMyTeacherAttach.NormPerStudentForMin:= tempTCU.NormPerStudentForMin;
        fMyTeacherAttach.AssignCalcUnits(tempTCU.GetTakeCalcUnits);
        fMyTeacherAttach.Tag:= 1; //такой TakeCalcUnit уже есть, т.е. его не надо добавлять после нажатия ОК
        myTACheckBoxChange(nil);
        exit;
      end;
    end;
    TNagruzkaController.PlanNagruzka.GetNormValues(fPotokNormOfTimeIK, fPlanIK, fDiscIK, fPotokIK, dbcbVidZanyat.KeyValue, dbcbVidNagruzki.KeyValue, dbcbVidNagruzki.ListSource.DataSet.FieldByName('ik_content_plan_nagr').AsInteger, NormPerUnit, NormPerStudent, MaxNormPerStudent, minContingent, NormPerUnitForMin, NormPerStudentForMin);
    fMyTeacherAttach.NormPerUnit:= NormPerUnit;
    fMyTeacherAttach.NormPerStudent:= NormPerStudent;
    fMyTeacherAttach.MaxNormPerStudent:= MaxNormPerStudent;
    fMyTeacherAttach.MinContingent:= minContingent;
    fMyTeacherAttach.NormPerUnitForMin:= NormPerUnitForMin;
    fMyTeacherAttach.NormPerStudentForMin:= NormPerStudentForMin;
    temp:= TNagruzkaController.PlanNagruzka.GetCalcUnits(Panel9, self.IK, dbcbVidNagruzki.ListSource.DataSet.FieldByName('ik_content_plan_nagr').AsInteger, minContingent, NormPerUnit, NormPerUnitForMin);
    fMyTeacherAttach.AssignCalcUnits(temp);
    temp.Free;
    fMyTeacherAttach.Tag:= 0;
  end;
  myTACheckBoxChange(nil);
end;

procedure TfrmNagruzkaFillTakeNagr.dbcbVidZanyatKeyValueChanged(
  Sender: TObject);
begin
  TGeneralController.Instance.CloseLockupCB(@dbcbVidNagruzki);
  if dbcbVidZanyat.KeyValue <> NULL then
    dbcbVidNagruzki.KeyValue:= TNagruzkaController.PlanNagruzka.GetVidNagruzkiFromDepPlan(@dbcbVidNagruzki.ListSource.DataSet, fPlanIK, fDiscIK, fPotokIK, dbcbVidZanyat.KeyValue, true)
end;

function TfrmNagruzkaFillTakeNagr.DoApply: boolean;
begin
  Result:= true;
end;

function TfrmNagruzkaFillTakeNagr.DoCancel: boolean;
begin
  Result:= true;
end;

procedure TfrmNagruzkaFillTakeNagr.FormDestroy(Sender: TObject);
begin
  inherited;
  fMyTeacherAttach.Clear;
  fMyTeacherAttach.Free;
end;



procedure TfrmNagruzkaFillTakeNagr.Label1Click(Sender: TObject);
var
  key: word;
begin
  key:= 112;
  FormKeyUp(Self, key, []);
end;

procedure TfrmNagruzkaFillTakeNagr.Label1MouseEnter(Sender: TObject);
begin
  Label1.Font.Style:= Label1.Font.Style + [fsUnderline];
end;

procedure TfrmNagruzkaFillTakeNagr.Label1MouseLeave(Sender: TObject);
begin
  Label1.Font.Style:= Label1.Font.Style - [fsUnderline];
end;

procedure TfrmNagruzkaFillTakeNagr.myTACheckBoxChange(Sender: TObject);
var
  i: integer;
  hour: double;
begin
  hour:= 0;
  for i:= 0 to fMyTeacherAttach.getCalcUnitsCount-1 do
    if fMyTeacherAttach.CalcUnits[i].CheckBox.Checked then
      hour:= hour +  fMyTeacherAttach.CalcUnits[i].CalcAllHour(fMyTeacherAttach.MinContingent, fMyTeacherAttach.NormPerStudent, fMyTeacherAttach.NormPerStudentForMin, fMyTeacherAttach.MaxNormPerStudent);  //StrToFloat(fMyTeacherAttach.Cells[4 + fMyTeacherAttach.IsManyInCommission + fMyTeacherAttach.IsManyInPlan, i+1]);
  Label6.Caption:= FloatToStrF(hour, ffFixed, 10 ,2) + ' час.';
  IsModified:= true;
end;

procedure TfrmNagruzkaFillTakeNagr.myTASetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
  IsModified:= true;
end;

procedure TfrmNagruzkaFillTakeNagr.Read(TakeNagr: TObjectList; PlanIK, DiscIK,
  PotokIK, PotokNormOfTimeIK: integer);
begin
  fPlanIK:= PlanIK;
  fDiscIK:= DiscIK;
  fPotokIK:= PotokIK;
  fPotokNormOfTimeIK:= PotokNormOfTimeIK;
  fTakeNagr:= TakeNagr;
  fMyTeacherAttach:= TTeacherAttach.Create(Panel9);
  fMyTeacherAttach.OnCheckBoxChange:= myTACheckBoxChange;
  fMyTeacherAttach.OnSetEditText:= myTASetEditText;
  fMyTeacherAttach.AllCheckBox.Parent:= Panel9;
  TGeneralController.Instance.InitializeLockupCB(@dbcbVidZanyat, 'iK_vid_zanyat', 'cName_vid_zanyat');
  TGeneralController.Instance.InitializeLockupCB(@dbcbVidNagruzki, 'ik_vid_nagruzki', 'Cname_vid_nagruzki');
  dbcbVidZanyat.KeyValue:= TNagruzkaController.PlanNagruzka.GetVidZanyatsFromDepPlan(@dbcbVidZanyat.ListSource.DataSet, PlanIK, DiscIK, PotokIK, false);
end;

end.
