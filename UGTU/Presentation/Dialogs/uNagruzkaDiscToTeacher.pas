unit uNagruzkaDiscToTeacher;
  {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, DBGridEh,
  Mask, DBCtrlsEh, DBLookupEh, NagruzkaController, GeneralController,
  DB, GridsEh, Contnrs, ComCtrls, ToolWin, ImgList;

type
  TfrmNagruzkaDiscToTeacher = class(TfrmBaseDialog)
    Panel3: TPanel;
    dbcbDisc: TDBLookupComboboxEh;
    dbcbPotok: TDBLookupComboboxEh;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    dsTakeNagr: TDataSource;
    Panel4: TPanel;
    Label10: TLabel;
    Label9: TLabel;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    Panel6: TPanel;
    actEditTCU: TAction;
    actAddTCU: TAction;
    actDelTCU: TAction;
    Bevel5: TBevel;
    SpeedButton4: TSpeedButton;
    actLoadAllDiscNagr: TAction;
    Label3: TLabel;
    Label4: TLabel;
    SpeedButton5: TSpeedButton;
    actShowDistrNagr: TAction;
    dbcbPlan: TDBLookupComboboxEh;
    actGiveDutyToAnotherTeacher: TAction;
    ImageList1: TImageList;
    ToolBar2: TToolBar;
    ToolButton2: TToolButton;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolBar3: TToolBar;
    ToolButton3: TToolButton;
    ToolBar4: TToolBar;
    ToolButton4: TToolButton;
    Bevel2: TBevel;
    Image9: TImage;
    Label6: TLabel;
    procedure dbcbDiscKeyValueChanged(Sender: TObject);
    procedure dbcbPotokKeyValueChanged(Sender: TObject);
    procedure actAddTCUExecute(Sender: TObject);
    procedure actAddTCUUpdate(Sender: TObject);
    procedure actEditTCUUpdate(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actDelTCUExecute(Sender: TObject);
    procedure actLoadAllDiscNagrExecute(Sender: TObject);
    procedure actShowDistrNagrExecute(Sender: TObject);
    procedure dbcbPlanKeyValueChanged(Sender: TObject);
    procedure actGiveDutyToAnotherTeacherExecute(Sender: TObject);
    procedure Label6MouseEnter(Sender: TObject);
    procedure Label6MouseLeave(Sender: TObject);
    procedure Label6Click(Sender: TObject);
  
  private
    fYearIK, fSemTypeIK: integer;
    fTakeNagr: TObjectList; // of TTakeNagrUnit
    procedure CalcCurHour;
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    destructor Destroy; override;
    procedure Read(PlanIK, YearIK, SemTypeIK: integer);
    property TakeNagr: TObjectList read fTakeNagr write fTakeNagr;
  end;

var
  frmNagruzkaDiscToTeacher: TfrmNagruzkaDiscToTeacher;

implementation

uses uNagruzkaFillTakeNagr, uNagruzkaDistributedDuty, uNagruzkaSelectTeacher, NagruzkaClasses;

{$R *.dfm}

{ TfrmNagruzkaDiscToTeacher }

procedure TfrmNagruzkaDiscToTeacher.DBGridEh1DblClick(Sender: TObject);
begin
  if actEditTCU.Enabled then
    actAddTCUExecute(actEditTCU);
end;

procedure TfrmNagruzkaDiscToTeacher.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    if actEditTCU.Enabled then
      actAddTCUExecute(actEditTCU);
end;

destructor TfrmNagruzkaDiscToTeacher.Destroy;
begin
  if Assigned(fTakeNagr) then
  begin
    fTakeNagr.Clear;
    fTakeNagr.Free;
  end;             
  inherited;
end;

function TfrmNagruzkaDiscToTeacher.DoApply: boolean;
begin
  Result:= TNagruzkaController.PlanNagruzka.SaveDiscToTeacher(self.IK, fTakeNagr)
//  else Result:= TNagruzkaController.Instance.SaveAllDiscToTeacher(self.IK, dbcbPlan.KeyValue, dbcbDisc.KeyValue, dbcbPotok.KeyValue);
end;

function TfrmNagruzkaDiscToTeacher.DoCancel: boolean;
begin
Result:= false;
  case (Application.MessageBox('—охранить внесенные изменени€?','«акрепление нагрузки за преподавателем', MB_YESNOCANCEL)) of
      mrYes: OK;
      mrNo: Result:= true;
  end;
end;

procedure TfrmNagruzkaDiscToTeacher.Label6Click(Sender: TObject);
var
  key: word;
begin
  key:= 112;
  FormKeyUp(Self, key, []);
end;

procedure TfrmNagruzkaDiscToTeacher.Label6MouseEnter(Sender: TObject);
begin
  Label6.Font.Style:= Label6.Font.Style + [fsUnderline];
end;

procedure TfrmNagruzkaDiscToTeacher.Label6MouseLeave(Sender: TObject);
begin
  Label6.Font.Style:= Label6.Font.Style - [fsUnderline];
end;

procedure TfrmNagruzkaDiscToTeacher.Read(PlanIK, YearIK, SemTypeIK: integer);
begin
  fTakeNagr:= TObjectList.Create(true);
  fYearIK:= YearIK;
  fSemTypeIK:= SemTypeIK;
  Label3.Caption:= TNagruzkaController.Preparation.GetTeacherFIO(self.IK);
  TGeneralController.Instance.InitializeLockupCB(@dbcbPlan, 'ik_plan_nagr', 'cname_plan');
  TGeneralController.Instance.InitializeLockupCB(@dbcbDisc, 'ik_disc', 'cname_disc');
  TGeneralController.Instance.InitializeLockupCB(@dbcbPotok, 'ik_potok_semestr', 'cname_potok');
  dbcbPlan.KeyValue:= TNagruzkaController.PlanNagruzka.GetPlansForTeacher(@dbcbPlan.ListSource.DataSet, IK, YearIK, SemTypeIK, false, PlanIK);
end;

procedure TfrmNagruzkaDiscToTeacher.dbcbDiscKeyValueChanged(
  Sender: TObject);
begin
  TGeneralController.Instance.CloseLockupCB(@dbcbPotok);
  if dbcbDisc.KeyValue <> NULL then
    dbcbPotok.KeyValue:= TNagruzkaController.PlanNagruzka.GetPotoksFromDepPlan(@dbcbPotok.ListSource.DataSet, dbcbPlan.KeyValue, dbcbDisc.KeyValue, true);
end;

procedure TfrmNagruzkaDiscToTeacher.dbcbPlanKeyValueChanged(Sender: TObject);
begin
  TGeneralController.Instance.CloseLockupCB(@dbcbDisc);
  if dbcbPlan.KeyValue <> NULL then
    dbcbDisc.KeyValue:= TNagruzkaController.PlanNagruzka.GetDisciplinesFromDepPlan(@dbcbDisc.ListSource.DataSet, dbcbPlan.KeyValue, false);
end;

procedure TfrmNagruzkaDiscToTeacher.dbcbPotokKeyValueChanged(
  Sender: TObject);
begin
  if dsTakeNagr.DataSet <> nil then
  begin
    if dsTakeNagr.DataSet.Active then
      dsTakeNagr.DataSet.Close;
    dsTakeNagr.DataSet:= nil;
    fTakeNagr.Clear;
  end;
  if dbcbPotok.KeyValue <> NULL then
  begin
    dsTakeNagr.DataSet:= TNagruzkaController.PlanNagruzka.LoadTakeNagr(nil, dbcbPlan.KeyValue, dbcbDisc.KeyValue, dbcbPotok.KeyValue, dbcbPotok.ListSource.DataSet.FieldByName('ik_norm_of_time').AsInteger, self.IK, fTakeNagr);
    CalcCurHour;
  end
  else Label10.Caption:= '0 час.';
end;

procedure TfrmNagruzkaDiscToTeacher.actAddTCUExecute(Sender: TObject);
var
  temp: TfrmNagruzkaFillTakeNagr;
  i, j: integer;
  tempTCU: TTakeNagrUnit;
  curTakeHour: double;
begin
  temp:= TfrmNagruzkaFillTakeNagr.CreateDialog(nil, self.Connection, nil);
  temp.Read(fTakeNagr, dbcbPlan.KeyValue, dbcbDisc.KeyValue, dbcbPotok.KeyValue, dbcbPotok.ListSource.DataSet.FieldByName('ik_norm_of_time').AsInteger);
  temp.IK:= (Sender as TAction).Tag;
  if (Sender as TAction).Tag = 1 then
  begin
    temp.dbcbVidZanyat.KeyValue:= dsTakeNagr.DataSet.FieldByName('ik_vid_zanyat').AsInteger;
    temp.dbcbVidNagruzki.KeyValue:= dsTakeNagr.DataSet.FieldByName('ik_vid_nagruzki').AsInteger;
    temp.dbcbVidNagruzki.Enabled:= false;
    temp.dbcbVidZanyat.Enabled:= false;
    temp.myTACheckBoxChange(nil);
  end;
  if (temp.ShowModal = mrOk) then
  begin
    if temp.MyTeacherAttach.Tag = 0 then
    begin
      fTakeNagr.Add(TTakeNagrUnit.Create(temp.dbcbVidNagruzki.ListSource.DataSet.FieldByName('ik_content_plan_nagr').AsInteger, temp.dbcbVidZanyat.KeyValue, temp.dbcbVidNagruzki.KeyValue, '', '', temp.MyTeacherAttach.NormPerUnit, temp.MyTeacherAttach.NormPerStudent, temp.MyTeacherAttach.MaxNormPerStudent, temp.MyTeacherAttach.MinContingent, temp.MyTeacherAttach.NormPerUnitForMin, temp.MyTeacherAttach.NormPerStudentForMin, temp.MyTeacherAttach.GetCalcUnits));
      tempTCU:= TTakeNagrUnit(fTakeNagr[fTakeNagr.Count-1]);
      curTakeHour:= 0;
      for J := 0 to tempTCU.GetTakeCalcUnits.Count - 1 do
      if tempTCU.TakeCalcUnits[j].CheckBox.Checked then
      begin
         curTakeHour:= curTakeHour + tempTCU.TakeCalcUnits[j].CalcAllHour(tempTCU.MinContingent, tempTCU.NormPerStudent, tempTCU.NormPerStudentForMin, tempTCU.MaxNormPerStudent);

     {   if tempTCU.TakeCalcUnits[j].CurrentStudentValue < temp.MyTeacherAttach.MinContingent then
        begin
          if (tempTCU.TakeCalcUnits[j].MaxStudentValue * tempTCU.NormPerStudentForMin * tempTCU.TakeCalcUnits[j].InPlanCountForThisCalcUnit > tempTCU.TakeCalcUnits[j].MaxStudentValue * tempTCU.MaxNormPerStudent) and (tempTCU.MaxNormPerStudent <> 0) then
            curTakeHour:= curTakeHour + tempTCU.TakeCalcUnits[j].CurrentStudentValue * (tempTCU.MaxNormPerStudent/tempTCU.TakeCalcUnits[j].InPlanCountForThisCalcUnit) * tempTCU.TakeCalcUnits[j].WeekInPlanCount + tempTCU.TakeCalcUnits[j].CurrentHourValue
          else
            curTakeHour:= curTakeHour + tempTCU.TakeCalcUnits[j].CurrentStudentValue * tempTCU.NormPerStudentForMin * tempTCU.TakeCalcUnits[j].WeekInPlanCount + tempTCU.TakeCalcUnits[j].CurrentHourValue;
        end
        else
        begin
          if (tempTCU.TakeCalcUnits[j].MaxStudentValue * tempTCU.NormPerStudent * tempTCU.TakeCalcUnits[j].InPlanCountForThisCalcUnit > tempTCU.TakeCalcUnits[j].MaxStudentValue * tempTCU.MaxNormPerStudent) and (tempTCU.MaxNormPerStudent <> 0) then
            curTakeHour:= curTakeHour + tempTCU.TakeCalcUnits[j].CurrentStudentValue * (tempTCU.MaxNormPerStudent/tempTCU.TakeCalcUnits[j].InPlanCountForThisCalcUnit) * tempTCU.TakeCalcUnits[j].WeekInPlanCount + tempTCU.TakeCalcUnits[j].CurrentHourValue
          else
            curTakeHour:= curTakeHour + tempTCU.TakeCalcUnits[j].CurrentStudentValue * tempTCU.NormPerStudent * tempTCU.TakeCalcUnits[j].WeekInPlanCount + tempTCU.TakeCalcUnits[j].CurrentHourValue;
        end;    }

      end;
      dsTakeNagr.DataSet.Insert;
      dsTakeNagr.DataSet.FieldByName('ik_content_plan_nagr').AsInteger:= temp.dbcbVidNagruzki.ListSource.DataSet.FieldByName('ik_content_plan_nagr').AsInteger;
      dsTakeNagr.DataSet.FieldByName('ik_vid_zanyat').AsInteger:= temp.dbcbVidZanyat.KeyValue;
      dsTakeNagr.DataSet.FieldByName('cName_vid_zanyat').AsString:= temp.dbcbVidZanyat.Text;
      dsTakeNagr.DataSet.FieldByName('ik_vid_nagruzki').AsInteger:= temp.dbcbVidNagruzki.KeyValue;
      dsTakeNagr.DataSet.FieldByName('Cname_vid_nagruzki').AsString:= temp.dbcbVidNagruzki.Text;
      dsTakeNagr.DataSet.FieldByName('take_hour').AsFloat:= RoundFloat(curTakeHour,2);
      dsTakeNagr.DataSet.Post;
    end
    else
    begin
      for I := 0 to fTakeNagr.Count - 1 do
      begin
        tempTCU:= TTakeNagrUnit(fTakeNagr[i]);
        if (tempTCU.ContentPlanNagrIK = temp.dbcbVidNagruzki.ListSource.DataSet.FieldByName('ik_content_plan_nagr').AsInteger) then
        begin
          if tempTCU.IsRemoved then
          begin
            tempTCU.IsRemoved:= false;
            dsTakeNagr.DataSet.Insert;
            dsTakeNagr.DataSet.FieldByName('ik_content_plan_nagr').AsInteger:= temp.dbcbVidNagruzki.ListSource.DataSet.FieldByName('ik_content_plan_nagr').AsInteger;
            dsTakeNagr.DataSet.FieldByName('ik_vid_zanyat').AsInteger:= temp.dbcbVidZanyat.KeyValue;
            dsTakeNagr.DataSet.FieldByName('cName_vid_zanyat').AsString:= temp.dbcbVidZanyat.Text;
            dsTakeNagr.DataSet.FieldByName('ik_vid_nagruzki').AsInteger:= temp.dbcbVidNagruzki.KeyValue;
            dsTakeNagr.DataSet.FieldByName('Cname_vid_nagruzki').AsString:= temp.dbcbVidNagruzki.Text;
            dsTakeNagr.DataSet.Post;
          end;
          tempTCU.AssignTakeCalcUnits(temp.MyTeacherAttach.GetCalcUnits);
          curTakeHour:= 0;
          for J := 0 to tempTCU.GetTakeCalcUnits.Count - 1 do
            if tempTCU.TakeCalcUnits[j].CheckBox.Checked then
            begin
              curTakeHour:= curTakeHour + tempTCU.TakeCalcUnits[j].CalcAllHour(tempTCU.MinContingent, tempTCU.NormPerStudent, tempTCU.NormPerStudentForMin, tempTCU.MaxNormPerStudent);

         {     if tempTCU.TakeCalcUnits[j].CurrentStudentValue < tempTCU.MinContingent then
              begin
                if (tempTCU.TakeCalcUnits[j].MaxStudentValue * tempTCU.NormPerStudentForMin * tempTCU.TakeCalcUnits[j].InPlanCountForThisCalcUnit > tempTCU.TakeCalcUnits[j].MaxStudentValue * tempTCU.MaxNormPerStudent) and (tempTCU.MaxNormPerStudent <> 0) then
                  curTakeHour:= curTakeHour + tempTCU.TakeCalcUnits[j].CurrentStudentValue * (tempTCU.MaxNormPerStudent/tempTCU.TakeCalcUnits[j].InPlanCountForThisCalcUnit) * tempTCU.TakeCalcUnits[j].WeekInPlanCount + tempTCU.TakeCalcUnits[j].CurrentHourValue
                else
                  curTakeHour:= curTakeHour + tempTCU.TakeCalcUnits[j].CurrentStudentValue * tempTCU.NormPerStudentForMin * tempTCU.TakeCalcUnits[j].WeekInPlanCount + tempTCU.TakeCalcUnits[j].CurrentHourValue;
              end
              else
              begin
                if (tempTCU.TakeCalcUnits[j].MaxStudentValue * tempTCU.NormPerStudent * tempTCU.TakeCalcUnits[j].InPlanCountForThisCalcUnit > tempTCU.TakeCalcUnits[j].MaxStudentValue * tempTCU.MaxNormPerStudent) and (tempTCU.MaxNormPerStudent <> 0) then
                  curTakeHour:= curTakeHour + tempTCU.TakeCalcUnits[j].CurrentStudentValue * (tempTCU.MaxNormPerStudent/tempTCU.TakeCalcUnits[j].InPlanCountForThisCalcUnit) * tempTCU.TakeCalcUnits[j].WeekInPlanCount + tempTCU.TakeCalcUnits[j].CurrentHourValue
                else
                  curTakeHour:= curTakeHour + tempTCU.TakeCalcUnits[j].CurrentStudentValue * tempTCU.NormPerStudent * tempTCU.TakeCalcUnits[j].WeekInPlanCount + tempTCU.TakeCalcUnits[j].CurrentHourValue;
              end;    }
            end;
          dsTakeNagr.DataSet.First;
          while not dsTakeNagr.DataSet.Eof do
          begin
            if (dsTakeNagr.DataSet.FieldByName('ik_content_plan_nagr').AsInteger = tempTCU.ContentPlanNagrIK) then
            begin
              dsTakeNagr.DataSet.Edit;
              dsTakeNagr.DataSet.FieldByName('take_hour').AsFloat:= RoundFloat(curTakeHour,2);
              dsTakeNagr.DataSet.Post;
              break;
            end;
            dsTakeNagr.DataSet.Next;
          end;
          break;
        end;
      end;
    end;
    CalcCurHour;
    dsTakeNagr.DataSet.Locate('ik_content_plan_nagr', temp.dbcbVidNagruzki.ListSource.DataSet.FieldByName('ik_content_plan_nagr').AsInteger, [loPartialKey]);
    IsModified:= true;
  end;
  temp.Free;
end;

procedure TfrmNagruzkaDiscToTeacher.actAddTCUUpdate(Sender: TObject);
begin
  if dsTakeNagr.DataSet <> nil then
    (Sender as TAction).Enabled:= dsTakeNagr.DataSet.Active and (dbcbDisc.KeyValue <> NULL) and (dbcbPotok.KeyValue <> NULL)
  else
    (Sender as TAction).Enabled:= false;
end;

procedure TfrmNagruzkaDiscToTeacher.actDelTCUExecute(Sender: TObject);
var
  i: integer;
  tempTCU: TTakeNagrUnit;
begin
  for I := 0 to fTakeNagr.Count - 1 do
  begin
    tempTCU:= TTakeNagrUnit(fTakeNagr[i]);
    if (tempTCU.ContentPlanNagrIK = dsTakeNagr.DataSet.FieldByName('ik_content_plan_nagr').AsInteger) then
    begin
      tempTCU.IsRemoved:= true;
      break;
    end;
  end;
  if dsTakeNagr.DataSet.RecordCount > 0 then
    dsTakeNagr.DataSet.Delete;
  CalcCurHour;
  IsModified:= true;
end;

procedure TfrmNagruzkaDiscToTeacher.actEditTCUUpdate(Sender: TObject);
begin
  if dsTakeNagr.DataSet <> nil then
    (Sender as TAction).Enabled:= (dsTakeNagr.DataSet.RecordCount > 0)
  else
    (Sender as TAction).Enabled:= false;
end;

procedure TfrmNagruzkaDiscToTeacher.actGiveDutyToAnotherTeacherExecute(
  Sender: TObject);
var
  tempST: TfrmNagruzkaSelectTeacher;
begin
  tempST:= TfrmNagruzkaSelectTeacher.CreateDialog(nil, Connection, nil);
  try
    tempST.Read(dbcbPlan.ListSource.DataSet.FieldByName('ik_kaf').AsInteger, fYearIK, fSemTypeIK);
    if tempST.ShowModal = mrOk then
      if TNagruzkaController.PlanNagruzka.GiveDutyToAnotherTeacher(Self.IK, tempST.dbcbWorkType.KeyValue, 0, 0, 0, dsTakeNagr.DataSet.FieldByName('ik_content_plan_nagr').AsInteger) then
        actDelTCUExecute(actDelTCU);
  finally
    if Assigned(tempST) then tempST.Free;
  end;
end;

procedure TfrmNagruzkaDiscToTeacher.actLoadAllDiscNagrExecute(Sender: TObject);
var
  i, j: integer;
  tempTCU: TTakeNagrUnit;
  curTakeHour, allTakeHour: double;
  tempDN: TfrmNagruzkaDistributedDuty;
begin
  TNagruzkaController.PlanNagruzka.TakeAllNagrOnDiscToTeacher(self.IK, dbcbPlan.KeyValue, dbcbDisc.KeyValue, dbcbPotok.KeyValue, dbcbPotok.ListSource.DataSet.FieldByName('ik_norm_of_time').AsInteger, fTakeNagr);
  dsTakeNagr.DataSet.First;
  while not dsTakeNagr.DataSet.Eof do
    dsTakeNagr.DataSet.Delete;
  allTakeHour:= 0;
  i:= 0;

  while i <= fTakeNagr.Count - 1 do
  begin
    tempTCU:= TTakeNagrUnit(fTakeNagr[i]);
    curTakeHour:= 0;
    if tempTCU.GetTakeCalcUnits.Count = 0 then
    begin
      fTakeNagr.Clear;
      Application.MessageBox(PChar('—писок расчетных единиц дл€ вида зан€тий "' + tempTCU.VidZanyatName + '" (вид нагрузки: "' + tempTCU.VidNagruzkiName + '") пуст!' + #10#13 + '¬озможно не заполнен ожидаемый контингент дл€ соответсвующей схемы делени€ потока'),
       '«акрепление учебной нагрузки за преподавателем', MB_ICONWARNING);
      exit;
    end;

    for J := 0 to tempTCU.GetTakeCalcUnits.Count - 1 do
    begin
       curTakeHour:= curTakeHour + tempTCU.TakeCalcUnits[j].CalcAllHour(tempTCU.MinContingent, tempTCU.NormPerStudent, tempTCU.NormPerStudentForMin, tempTCU.MaxNormPerStudent);

    {  if tempTCU.TakeCalcUnits[j].CurrentStudentValue < tempTCU.MinContingent then
      begin
        if (tempTCU.TakeCalcUnits[j].MaxStudentValue * tempTCU.NormPerStudentForMin * tempTCU.TakeCalcUnits[j].InPlanCountForThisCalcUnit > tempTCU.TakeCalcUnits[j].MaxStudentValue * tempTCU.MaxNormPerStudent) and (tempTCU.MaxNormPerStudent <> 0) then
          curTakeHour:= curTakeHour + tempTCU.TakeCalcUnits[j].CurrentStudentValue * (tempTCU.MaxNormPerStudent/tempTCU.TakeCalcUnits[j].InPlanCountForThisCalcUnit) * tempTCU.TakeCalcUnits[j].WeekInPlanCount + tempTCU.TakeCalcUnits[j].CurrentHourValue
        else
          curTakeHour:= curTakeHour + tempTCU.TakeCalcUnits[j].CurrentStudentValue * tempTCU.NormPerStudentForMin * tempTCU.TakeCalcUnits[j].WeekInPlanCount + tempTCU.TakeCalcUnits[j].CurrentHourValue;
      end
      else
      begin
        if (tempTCU.TakeCalcUnits[j].MaxStudentValue * tempTCU.NormPerStudent * tempTCU.TakeCalcUnits[j].InPlanCountForThisCalcUnit > tempTCU.TakeCalcUnits[j].MaxStudentValue * tempTCU.MaxNormPerStudent) and (tempTCU.MaxNormPerStudent <> 0) then
          curTakeHour:= curTakeHour + tempTCU.TakeCalcUnits[j].CurrentStudentValue * (tempTCU.MaxNormPerStudent/tempTCU.TakeCalcUnits[j].InPlanCountForThisCalcUnit) * tempTCU.TakeCalcUnits[j].WeekInPlanCount + tempTCU.TakeCalcUnits[j].CurrentHourValue
        else
          curTakeHour:= curTakeHour + tempTCU.TakeCalcUnits[j].CurrentStudentValue * tempTCU.NormPerStudent * tempTCU.TakeCalcUnits[j].WeekInPlanCount + tempTCU.TakeCalcUnits[j].CurrentHourValue;
      end;        }


{      if (not isNeedShowDistributedNagr) and ((tempTCU.TakeCalcUnits[j].BusyHourValue > 0) or (tempTCU.TakeCalcUnits[j].BusyStudentValue > 0)) then
        if (tempTCU.TakeCalcUnits[j].BusyHourValue > tempTCU.TakeCalcUnits[j].CurrentHourValue) or (tempTCU.TakeCalcUnits[j].BusyStudentValue > tempTCU.TakeCalcUnits[j].CurrentStudentValue) then
          isNeedShowDistributedNagr:= true;   }
    end;
    if (curTakeHour = 0) then
    begin
      fTakeNagr.Delete(i);
      continue;
    end;
    dsTakeNagr.DataSet.Insert;
    dsTakeNagr.DataSet.FieldByName('ik_content_plan_nagr').AsInteger:= tempTCU.ContentPlanNagrIK;
    dsTakeNagr.DataSet.FieldByName('ik_vid_zanyat').AsInteger:= tempTCU.VidZanyatIK;
    dsTakeNagr.DataSet.FieldByName('cName_vid_zanyat').AsString:= tempTCU.VidZanyatName;
    dsTakeNagr.DataSet.FieldByName('ik_vid_nagruzki').AsInteger:= tempTCU.VidNagruzkiIK;
    dsTakeNagr.DataSet.FieldByName('Cname_vid_nagruzki').AsString:= tempTCU.VidNagruzkiName;
    dsTakeNagr.DataSet.FieldByName('take_hour').AsFloat:= RoundFloat(curTakeHour,2);
    dsTakeNagr.DataSet.Post;
    allTakeHour:= allTakeHour + curTakeHour;
    inc(i);
  end;
  Label10.Caption:= FloatToStrF(allTakeHour, ffFixed, 10 ,2) + ' час.';

  if dsTakeNagr.DataSet.RecordCount = 0 then
  begin
    tempDN:= TfrmNagruzkaDistributedDuty.CreateDialog(nil, Connection, nil);
    tempDN.Tag:= 2;
    tempDN.Label9.Visible:= false;
    tempDN.Label10.Visible:= false;
    tempDN.Label1.Left:= 9;
    tempDN.Label2.Left:= 124;
    tempDN.Read(dbcbPlan.KeyValue, dbcbPlan.ListSource.DataSet.FieldByName('ik_year').AsInteger, dbcbPlan.ListSource.DataSet.FieldByName('ik_sem_type').AsInteger, dbcbDisc.KeyValue, dbcbPotok.KeyValue, TNagruzkaController.Preparation.GetKafedraIKFromTeacherIK(IK), 0);
    tempDN.CalcHour;
    tempDN.ShowModal;
    tempDN.Free;
  end
  else IsModified:= true;
end;

procedure TfrmNagruzkaDiscToTeacher.actShowDistrNagrExecute(Sender: TObject);
var
  tempDN: TfrmNagruzkaDistributedDuty;
begin
  tempDN:= TfrmNagruzkaDistributedDuty.CreateDialog(nil, Connection, nil);
  tempDN.Tag:= 2;
  tempDN.Label9.Visible:= false;
  tempDN.Label10.Visible:= false;
  tempDN.Label1.Left:= 9;
  tempDN.Label2.Left:= 124;
  tempDN.Read(dbcbPlan.KeyValue, dbcbPlan.ListSource.DataSet.FieldByName('ik_year').AsInteger, dbcbPlan.ListSource.DataSet.FieldByName('ik_sem_type').AsInteger, dbcbDisc.KeyValue, dbcbPotok.KeyValue, TNagruzkaController.Preparation.GetKafedraIKFromTeacherIK(IK), 0);
  tempDN.CalcHour;
  tempDN.ShowModal;
  tempDN.Free;
end;

procedure TfrmNagruzkaDiscToTeacher.CalcCurHour;
var
  curAllHour: double;
begin
  curAllHour:= 0;
    dsTakeNagr.DataSet.First;
    while not dsTakeNagr.DataSet.Eof do
    begin
      curAllHour:= curAllHour + dsTakeNagr.DataSet.FieldByName('take_hour').AsFloat;
      dsTakeNagr.DataSet.Next;
    end;
    Label10.Caption:= FloatToStrF(curAllHour, ffFixed, 10 ,2) + ' час.';
end;

end.
