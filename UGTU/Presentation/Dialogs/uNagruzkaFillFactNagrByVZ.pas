unit uNagruzkaFillFactNagrByVZ;
   {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, DBGridEh, Mask,
  DBCtrlsEh, DBLookupEh, GridsEh, NagruzkaClasses, NagruzkaController, GeneralController,
  DB, SheduleClasses, Contnrs, ComCtrls, ToolWin, ImgList, ADODB;

type
  TfrmNagruzkaFillFactNagrByVZ = class(TfrmBaseDialog)
    Panel2: TPanel;
    dbcbVidZanyat: TDBLookupComboboxEh;
    Label8: TLabel;
    Label7: TLabel;
    dbcbVidNagruzki: TDBLookupComboboxEh;
    Panel6: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Bevel5: TBevel;
    Panel3: TPanel;
    Panel5: TPanel;
    DBGridEh1: TDBGridEh;
    actAdd: TAction;
    actDel: TAction;
    actEdit: TAction;
    dsFactNagr: TDataSource;
    ImageList1: TImageList;
    ToolBar2: TToolBar;
    ToolButton2: TToolButton;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolBar3: TToolBar;
    ToolButton3: TToolButton;
    Image9: TImage;
    Label1: TLabel;
    adsFactNagrWithoutSh: TADODataSet;
    adsFactNagrWithoutShik_plan_nagr: TIntegerField;
    adsFactNagrWithoutShik_disc: TIntegerField;
    adsFactNagrWithoutShcName_disc: TStringField;
    adsFactNagrWithoutShik_potok: TIntegerField;
    adsFactNagrWithoutShcName_potok: TStringField;
    adsFactNagrWithoutShplan_hour: TFloatField;
    adsFactNagrWithoutShbusy_hour: TFloatField;
    adsFactNagrWithoutShn_sem: TIntegerField;
    adsFactNagrWithoutShik_type_disc: TWordField;
    adsFactNagrWithoutShbit_calc_as_practice: TBooleanField;
    procedure dbcbVidZanyatKeyValueChanged(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure dbcbVidNagruzkiKeyValueChanged(Sender: TObject);
    procedure actAddUpdate(Sender: TObject);
    procedure actDelUpdate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Label1MouseEnter(Sender: TObject);
    procedure Label1MouseLeave(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private
    fTeahcerIK: integer;
    fPlanIK: integer;
    fPlanTeacherIK: integer;
    fDiscIK: integer;
    fPotokIK: integer;
    fPotokNormIK: integer;
    fCurTFN: TTakeFactNagrItem;
    fTakeFactNagr: TObjectList;
    fCurrentSemInfo: TDefaultSemLengthInfo;
    fWithoutSheduler: boolean;
    procedure GetNagrForEdit;
    procedure CalcCurrentHour;
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    procedure Read(TeahcerIK, PlanIK, PlanTeacherIK, DiscIK, PotokIK, PotokNormIK: integer; TakeFactNagr: TObjectList);
    property TeahcerIK: integer read fTeahcerIK;
    property PlanIK: integer read fPlanIK;
    property DiscIK: integer read fDiscIK;
    property PotokIK: integer read fPotokIK;
    property WithoutSheduler: boolean read fWithoutSheduler write fWithoutSheduler;
    property CurrentSemInfo: TDefaultSemLengthInfo read fCurrentSemInfo write fCurrentSemInfo;
    property CurTFN: TTakeFactNagrItem read fCurTFN write fCurTFN;
  end;

var
  frmNagruzkaFillFactNagrByVZ: TfrmNagruzkaFillFactNagrByVZ;

implementation

uses uNagruzkaFillFactNagrByCU;

{$R *.dfm}

{ TfrmNagruzkaFillFactNagrByVZ }

procedure TfrmNagruzkaFillFactNagrByVZ.actAddExecute(Sender: TObject);
var
  temp: TfrmNagruzkaFillFactNagrByCU;
  i: integer;
begin
  if not WithoutSheduler then
  begin
    temp:= TfrmNagruzkaFillFactNagrByCU.CreateDialog(nil, Connection, nil);
    if (Sender as TAction).Tag = 1 then
    begin
      for I := 0 to fCurTFN.GetItemsList.Count - 1 do
      begin
        if (dsFactNagr.DataSet.FieldByName('ik_prepod_plan').AsInteger = fCurTFN.Items[i].PrepodPlanNagrIK) then
        begin
          temp.Tag:= i;
          break;
        end;
      end;
    end
    else temp.Tag:= -1;
    temp.Read(fTeahcerIK, fPlanTeacherIK, self);
    if (Sender as TAction).Tag = 1 then
    begin
      temp.dbcbCalcUnit.KeyValue:= dsFactNagr.DataSet.FieldByName('ik_calc_unit').AsInteger;
      temp.dbcbByPlanNumber.KeyValue:= dsFactNagr.DataSet.FieldByName('by_plan_number').AsInteger;
      temp.dbcbCalcUnit.Enabled:= false;
      temp.dbcbByPlanNumber.Enabled:= false;
    end;
    if (temp.ShowModal = mrOk) then
    begin
      GetNagrForEdit;
      IsModified:= true;
    end;
    temp.Free;
  end
  //добавление фактической нагрузки не через расписание
  else
  begin
    DBGridEh1.DataSource.DataSet.Insert;


  end;
end;

procedure TfrmNagruzkaFillFactNagrByVZ.actAddUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= (dbcbVidNagruzki.KeyValue <> NULL) and (dsFactNagr.DataSet <> nil);
end;

procedure TfrmNagruzkaFillFactNagrByVZ.actDelExecute(Sender: TObject);
var
  i: Integer;
begin
  for I := 0 to fCurTFN.GetItemsList.Count - 1 do
    begin
      if (dsFactNagr.DataSet.FieldByName('ik_prepod_plan').AsInteger = fCurTFN.Items[i].PrepodPlanNagrIK) then
        begin
          fCurTFN.Items[i].IsRemoved:= true;
          dsFactNagr.DataSet.Delete;
          break;
        end;
    end;
  IsModified:= true;
  CalcCurrentHour;
end;

procedure TfrmNagruzkaFillFactNagrByVZ.actDelUpdate(Sender: TObject);
begin
  if dsFactNagr.DataSet <> nil then
  begin
    if dsFactNagr.DataSet.Active then
      (Sender as TAction).Enabled:= dsFactNagr.DataSet.RecordCount > 0
    else
      (Sender as TAction).Enabled:= false;
  end
  else
    (Sender as TAction).Enabled:= false;
end;

procedure TfrmNagruzkaFillFactNagrByVZ.CalcCurrentHour;
var
  curAllHour: double;
begin
  curAllHour:= 0;
  dsFactNagr.DataSet.DisableControls;
  dsFactNagr.DataSet.First;
  while not dsFactNagr.DataSet.Eof do
  begin
    curAllHour:= curAllHour + dsFactNagr.DataSet.FieldByName('f_hour_per_unit').AsFloat;
    dsFactNagr.DataSet.Next;
  end;
  dsFactNagr.DataSet.EnableControls;
  Label10.Caption:= FloatToStrF(curAllHour, ffFixed, 10, 2) + ' час.';  
end;

procedure TfrmNagruzkaFillFactNagrByVZ.dbcbVidNagruzkiKeyValueChanged(
  Sender: TObject);
var
  curNormPerUnit, curNormPerStudent, curMaxNormPerStudent, curNormPerUnitForMin, curNormPerStudentForMin: double;
  curMinContingent, i: integer;
begin
  if dsFactNagr.DataSet <> nil then
   if dsFactNagr.DataSet.Active then
     dsFactNagr.DataSet.Close;
  if dbcbVidNagruzki.KeyValue <> NULL then
  begin
    if Tag = -1 then
    begin
      if Assigned(fCurTFN) then FreeAndNil(fCurTFN);
      // сначала попытаемся найти fCurTFN среди уже заполненных видов занятий
      for I := 0 to fTakeFactNagr.Count - 1 do
        if (TTakeFactNagrItem(fTakeFactNagr[i]).ContentPlanNagrIK = dbcbVidNagruzki.ListSource.DataSet.FieldByName('ik_content_plan_nagr').AsInteger) then
        begin
          fCurTFN:= TTakeFactNagrItem.Create(TTakeFactNagrItem(fTakeFactNagr[i]));;
          GetNagrForEdit;
          if TTakeFactNagrItem(fTakeFactNagr[i]).IsRemoved then IsModified:= true;          
          exit;
        end;
      // если не нашли то создадим его в процедуре LoadTakeFactNagrItem
      dsFactNagr.DataSet:= TNagruzkaController.FactNagruzka.LoadTakeFactNagrItem(true, fCurTFN, dbcbVidNagruzki.ListSource.DataSet.FieldByName('ik_content_plan_nagr').AsInteger, dbcbVidZanyat.KeyValue, dbcbVidZanyat.ListSource.DataSet.FieldByName('iK_type_vz').AsInteger,
        dbcbVidZanyat.ListSource.DataSet.FieldByName('ikTypeZanyat').AsInteger, dbcbVidNagruzki.KeyValue);
      TNagruzkaController.PlanNagruzka.GetNormValues(fPotokNormIK, fPlanIK, fDiscIK, fPotokIK, dbcbVidZanyat.KeyValue, dbcbVidNagruzki.KeyValue, dbcbVidNagruzki.ListSource.DataSet.FieldByName('ik_content_plan_nagr').AsInteger, curNormPerUnit, curNormPerStudent, curMaxNormPerStudent, curMinContingent, curNormPerUnitForMin, curNormPerStudentForMin);
//      TNagruzkaController.Instance.GetCalcUnits(false, nil, fPlanTeacherIK, dbcbVidNagruzki.ListSource.DataSet.FieldByName('ik_content_plan_nagr').AsInteger, curMinContingent, curNormPerUnit, curNormPerUnitForMin, curInPlanCount);
     // curInPlanCount:= 1;
      fCurTFN.NormPerUnit:= curNormPerUnit;
      fCurTFN.NormPerStudent:= curNormPerStudent;
      fCurTFN.MaxNormPerStudent:= curMaxNormPerStudent;
      fCurTFN.MinContingent:= curMinContingent;
      fCurTFN.NormPerUnitForMin:= curNormPerUnitForMin;
      fCurTFN.NormPerStudentForMin:= curNormPerStudentForMin;
  //    fCurTFN.InPlanCount:= curInPlanCount;
      Label10.Caption:= '0 час.';
      dsFactNagr.DataSet.FieldByName('by_plan_number').Visible:= true;
    end
    else GetNagrForEdit;
  end;
end;

procedure TfrmNagruzkaFillFactNagrByVZ.dbcbVidZanyatKeyValueChanged(
  Sender: TObject);
begin
  TGeneralController.Instance.CloseLockupCB(@dbcbVidNagruzki);
  if (dbcbVidZanyat.KeyValue <> NULL) then
    dbcbVidNagruzki.KeyValue:= TNagruzkaController.PlanNagruzka.GetVidNagruzkiFromDepPlan(@dbcbVidNagruzki.ListSource.DataSet, PlanIK, DiscIK, PotokIK, dbcbVidZanyat.KeyValue, true)
end;

procedure TfrmNagruzkaFillFactNagrByVZ.DBGridEh1DblClick(Sender: TObject);
begin
    if actEdit.Enabled then
      actAddExecute(actEdit);
end;

procedure TfrmNagruzkaFillFactNagrByVZ.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    if actEdit.Enabled then
      actAddExecute(actEdit);
end;

function TfrmNagruzkaFillFactNagrByVZ.DoApply: boolean;
var
  i: integer;
begin
  if Tag = -1 then
  begin
    for I := 0 to fTakeFactNagr.Count - 1 do
      if (TTakeFactNagrItem(fTakeFactNagr[i]).ContentPlanNagrIK = dbcbVidNagruzki.ListSource.DataSet.FieldByName('ik_content_plan_nagr').AsInteger) then
      begin
        fCurTFN.IsRemoved:= false;
        fTakeFactNagr.Delete(i);
        break;
      end;
    fTakeFactNagr.Add(TTakeFactNagrItem.Create(fCurTFN));
  end
  else TTakeFactNagrItem(fTakeFactNagr[Tag]).Assign(fCurTFN);
  Result:= true;
end;

function TfrmNagruzkaFillFactNagrByVZ.DoCancel: boolean;
begin
  Result:= true;
end;

procedure TfrmNagruzkaFillFactNagrByVZ.FormDestroy(Sender: TObject);
begin
  if dsFactNagr.DataSet <> nil then
    if dsFactNagr.DataSet.Active then
      dsFactNagr.DataSet.Close;
  if Assigned(fCurTFN) then FreeAndNil(fCurTFN);
end;

procedure TfrmNagruzkaFillFactNagrByVZ.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key=112)	then
Application.HelpSystem.ShowTopicHelp('Нагрузка\Add_DistributionNagrDep.htm','ugtu_help.chm');
end;

procedure TfrmNagruzkaFillFactNagrByVZ.GetNagrForEdit;
var
  i,j: integer;
  curFactHour: double;
  RecordHasManyInPlanCount: boolean;
begin
  dsFactNagr.DataSet:= TNagruzkaController.FactNagruzka.LoadTakeFactNagrItem(false, fCurTFN, 0, 0, 0, 0, 0);
  RecordHasManyInPlanCount:= false;
  for I := 0 to fCurTFN.GetItemsList.Count - 1 do
  begin
    if fCurTFN.Items[i].IsRemoved then continue;
  
    curFactHour:= 0;
    for j := 0 to fCurTFN.Items[i].GetEventList.Count - 1 do
      if fCurTFN.Items[i].Events[j].CheckBox.Checked then
        curFactHour:= curFactHour + (fCurTFN.Items[i].Events[j].GroupHour + fCurTFN.Items[i].Events[j].StudentCount * fCurTFN.Items[i].NormPerStudent) * fCurTFN.Items[i].WeekInPlanCount * fCurTFN.Items[i].TaskCount;
    dsFactNagr.DataSet.Insert;
    dsFactNagr.DataSet.FieldByName('ik_prepod_plan').AsInteger:= fCurTFN.Items[i].PrepodPlanNagrIK;
    dsFactNagr.DataSet.FieldByName('ik_calc_unit').AsInteger:= fCurTFN.Items[i].CalcUnitIK;
    dsFactNagr.DataSet.FieldByName('cName_calc_unit').AsString:= fCurTFN.Items[i].CalcUnitName;
    dsFactNagr.DataSet.FieldByName('by_plan_number').AsInteger:= fCurTFN.Items[i].ByPlanNumber;
    if (fCurTFN.Items[i].ByPlanNumber > 1) then RecordHasManyInPlanCount:= true;
    dsFactNagr.DataSet.FieldByName('i_student_count').AsInteger:= fCurTFN.Items[i].DefStudentCount;
    dsFactNagr.DataSet.FieldByName('f_hour_per_unit').AsFloat:= RoundFloat(curFactHour, 2);
    dsFactNagr.DataSet.Post;
  end;
  CalcCurrentHour;
  dsFactNagr.DataSet.FieldByName('by_plan_number').Visible:= RecordHasManyInPlanCount;
end;

procedure TfrmNagruzkaFillFactNagrByVZ.Label1Click(Sender: TObject);
var
  key: word;
begin
  key:= 112;
  FormKeyUp(Self, key, []);
end;

procedure TfrmNagruzkaFillFactNagrByVZ.Label1MouseEnter(Sender: TObject);
begin
  Label1.Font.Style:= Label1.Font.Style + [fsUnderline];
end;

procedure TfrmNagruzkaFillFactNagrByVZ.Label1MouseLeave(Sender: TObject);
begin
  Label1.Font.Style:= Label1.Font.Style - [fsUnderline];
end;

procedure TfrmNagruzkaFillFactNagrByVZ.Read(TeahcerIK, PlanIK, PlanTeacherIK,
  DiscIK, PotokIK, PotokNormIK: integer; TakeFactNagr: TObjectList);
begin
  fTeahcerIK:= TeahcerIK;
  fPlanIK:= PlanIK;
  fPlanTeacherIK:= PlanTeacherIK;
  fDiscIK:= DiscIK;
  fPotokIK:= PotokIK;
  fTakeFactNagr:= TakeFactNagr;
  fPotokNormIK:= PotokNormIK;
  TGeneralController.Instance.InitializeLockupCB(@dbcbVidZanyat, 'iK_vid_zanyat', 'cName_vid_zanyat');
  TGeneralController.Instance.InitializeLockupCB(@dbcbVidNagruzki, 'ik_vid_nagruzki', 'Cname_vid_nagruzki');
  TNagruzkaController.PlanNagruzka.GetVidZanyatFromTeacherPlan(@dbcbVidZanyat.ListSource.DataSet, PlanTeacherIK, PlanIK, DiscIK, PotokIK, false, NULL);
  if Tag >= 0 then
  begin
    fCurTFN:= TTakeFactNagrItem.Create(TakeFactNagr[Tag] as TTakeFactNagrItem);
    dbcbVidZanyat.KeyValue:= fCurTFN.VidZanyatIK;
    dbcbVidNagruzki.KeyValue:= fCurTFN.VidNagruzkiIK;
    dbcbVidZanyat.Enabled:= false;
    dbcbVidNagruzki.Enabled:= false;
  end;
  IsModified:= false;
end;

end.
