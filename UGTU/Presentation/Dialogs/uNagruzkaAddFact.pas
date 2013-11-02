unit uNagruzkaAddFact;
   {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, ADODB, DB,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, DBGridEh, SheduleController,
  CheckLst, Mask, DBCtrlsEh, DBLookupEh, NagruzkaController, GeneralController, Grids,
  ToolWin, ComCtrls, GridsEh, SheduleClasses, Contnrs, ImgList;

type
  TfrmNagruzkaAddFact = class(TfrmBaseDialog)
    actAdd: TAction;
    actEdit: TAction;
    Panel4: TPanel;
    Label4: TLabel;
    Label3: TLabel;
    Label16: TLabel;
    Label1: TLabel;
    dbcbPlan: TDBLookupComboboxEh;
    dbcbPrep: TDBLookupComboboxEh;
    dbcbPotok: TDBLookupComboboxEh;
    dbcbDisc: TDBLookupComboboxEh;
    actDel: TAction;
    Panel6: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label29: TLabel;
    Panel5: TPanel;
    Bevel5: TBevel;
    DBGridEh1: TDBGridEh;
    dsFactNagr: TDataSource;
    Label2: TLabel;
    Label5: TLabel;
    Panel3: TPanel;
    ToolBar2: TToolBar;
    ToolButton2: TToolButton;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolBar3: TToolBar;
    ToolButton3: TToolButton;
    ImageList1: TImageList;
    Image9: TImage;
    Label7: TLabel;
    aspContentFactNagr: TADOStoredProc;
    Label6: TLabel;
    Label8: TLabel;
    procedure dbcbPrepKeyValueChanged(Sender: TObject);
    procedure dbcbPlanKeyValueChanged(Sender: TObject);
    procedure dbcbPotokKeyValueChanged(Sender: TObject);
    procedure dbcbDiscKeyValueChanged(Sender: TObject);
    procedure actEditUpdate(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Label7MouseEnter(Sender: TObject);
    procedure Label7MouseLeave(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure dsFactNagrDataChange(Sender: TObject; Field: TField);
    procedure UpdatePickListForVN;
  private
    //fKaf: integer;
    fTakeFactNagr: TObjectList;
    fCurrentSemInfo: TDefaultSemLengthInfo;
    fWithoutSheduler: boolean;
    procedure CalcCurrentHour;

  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    destructor Destroy; override;
    procedure Read(PlanIK, YearIK, SemIK: integer);
    property WithoutSheduler: boolean read fWithoutSheduler write fWithoutSheduler;
  end;

var
  frmNagruzkaAddFact: TfrmNagruzkaAddFact;

implementation

uses uNagruzkaFillFactNagrByCU, uNagruzkaFillFactNagrByVZ, NagruzkaClasses,uDM;

{$R *.dfm}

{ TfrmNagruzkaAddFact }

procedure TfrmNagruzkaAddFact.Read(PlanIK, YearIK, SemIK: integer);
begin
  fTakeFactNagr:= TObjectList.Create(true);
  TGeneralController.Instance.InitializeLockupCB(@dbcbPrep, 'ik_id_prepod', 'FIO');
  TGeneralController.Instance.InitializeLockupCB(@dbcbPlan, 'ik_plan_nagr', 'cName_plan');
  TGeneralController.Instance.InitializeLockupCB(@dbcbPotok, 'ik_potok_semestr', 'Cname_potok');
  TGeneralController.Instance.InitializeLockupCB(@dbcbDisc, 'ik_disc', 'cName_disc');
  TNagruzkaController.PlanNagruzka.GetPlansForTeacher(@dbcbPlan.ListSource.DataSet, IK, YearIK, SemIK, false, PlanIK);
  if fWithoutSheduler then
    Panel3.Visible := false;
  Label6.Visible := fWithoutSheduler;
  Label8.Visible := fWithoutSheduler;

end;

procedure TfrmNagruzkaAddFact.UpdatePickListForVN;
var
  i: integer;
begin
  for i := 0 to DBGridEh1.Columns.Count - 1 do
    if DBGridEh1.Columns.Items[i].FieldName = 'Cname_vid_nagruzki' then
    begin
      TNagruzkaController.PlanNagruzka.GetPickListForVidNagruzki(dbcbPotok.KeyValue, dbcbDisc.KeyValue, dbcbDisc.ListSource.DataSet.FieldByName('ik_type_disc').AsInteger, DBGridEh1.DataSource.DataSet.FieldByName('ik_vid_zanyat').AsInteger, DBGridEh1.Columns.Items[i].PickList);
      break;
    end;
end;

procedure TfrmNagruzkaAddFact.dbcbPrepKeyValueChanged(Sender: TObject);
var
  planHour: double;
begin
  if (dbcbPrep.KeyValue <> NULL) then
    dbcbDisc.KeyValue:= TNagruzkaController.PlanNagruzka.GetDisciplinesFromTeahcerPlan(@dbcbDisc.ListSource.DataSet, dbcbPlan.KeyValue, dbcbPrep.KeyValue, planHour, false, false, TGeneralController.Instance.CloseLockupCB(@dbcbDisc))
  else TGeneralController.Instance.CloseLockupCB(@dbcbDisc);
end;

procedure TfrmNagruzkaAddFact.dbcbPlanKeyValueChanged(Sender: TObject);
var
  chokeDS: PDataSet;
begin
  if (dbcbPlan.KeyValue <> NULL) then
  begin
    fCurrentSemInfo:= TSheduleController.AccountFunctions.GetSemesterLength(TSheduleController.MainFunctions.GetSheduleIK(dbcbPlan.ListSource.DataSet.FieldByName('ik_year').AsInteger, dbcbPlan.ListSource.DataSet.FieldByName('ik_sem_type').AsInteger), false, chokeDS);
    if ((fCurrentSemInfo.MinSemStart = 0) or (fCurrentSemInfo.MinSessionStart = 0) or (fCurrentSemInfo.WorkTimeStart = 0) or (fCurrentSemInfo.WorkTimeEnd = 0))
       and (not fWithoutSheduler) then
    begin
      TGeneralController.Instance.CloseLockupCB(@dbcbPrep);
      Application.MessageBox(PChar('Для данного семестра в подсистеме "Расписание" не заполнена информация о его продолжительности!' + #10#13 + 'Расчет фактической нагрузки невозможен.'),'Заполнение фактической нагрузки',MB_ICONWARNING);
    end
    else
    begin
      dbcbPrep.KeyValue:= TNagruzkaController.PlanNagruzka.GetTeachersFromPlan(@dbcbPrep.ListSource.DataSet, dbcbPlan.KeyValue, false, TGeneralController.Instance.CloseLockupCB(@dbcbPrep));
      if dbcbPrep.Tag > 0 then dbcbPrep.KeyValue:= dbcbPrep.Tag;
    end;
  end
  else TGeneralController.Instance.CloseLockupCB(@dbcbPrep);
end;

procedure TfrmNagruzkaAddFact.dbcbPotokKeyValueChanged(Sender: TObject);
begin
  if (dbcbPotok.KeyValue <> NULL) then
  begin
    if not fWithoutSheduler then
        dsFactNagr.DataSet:= TNagruzkaController.FactNagruzka.LoadTakeFactNagr(IK, dbcbPlan.KeyValue, dbcbPrep.KeyValue, dbcbDisc.KeyValue, dbcbPotok.KeyValue, dbcbPotok.ListSource.DataSet.FieldByName('ik_norm_of_time').AsInteger, fCurrentSemInfo.MinSemStart, fCurrentSemInfo.MaxSemStop, fTakeFactNagr)
      else
      begin
        dm.adsVidZanyat.Close;
        dm.adsVidZanyat.CommandText := 'select * from vid_zaniat where iK_vid_zanyat in (select iK_vid_zanyat from prepod_plan_nagr ppn,Content_plan_nagr cpn,Potok_semestr_shema pss '+
                        'where ppn.ik_content_plan_nagr = cpn.ik_content_plan_nagr and cpn.ik_shema=pss.ik_shema and ik_id_prepod='+IntToStr(dbcbPrep.KeyValue)+' and ik_potok_semestr='+IntToStr(dbcbPotok.KeyValue)+')';
        dm.adsVidZanyat.Open;
        dm.adsFactNagr.Close;
        dm.adsFactNagr.CommandText := 'select * from Nagr_GetTeacherFactNagr('+IntToStr(dbcbPlan.KeyValue)+','+IntToStr(dbcbDisc.KeyValue)+','
                             +IntToStr(dbcbPotok.KeyValue)+','+IntToStr(dbcbPrep.KeyValue)+','+IntToStr(IK)+')';
        dm.adsFactNagr.Open;
        dsFactNagr.DataSet:= dm.adsFactNagr;
        dsFactNagr.DataSet.First;
        with dsFactNagr.DataSet do
        while not Eof do
        begin
          fTakeFactNagr.Add(TTakeFactNagrItem.Create(FieldByName('ik_prepod_plan').AsInteger,dbcbPrep.KeyValue,IK,FieldByName('cur_fact_hour').AsFloat,FieldByName('fact_hour').AsFloat,FieldByName('cur_fact_student').AsInteger));
          dsFactNagr.DataSet.Next;
        end;

        dm.adsFactNagr.Tag := 0;
        DBGridEh1.Columns.Items[0].Width := 120;
        DBGridEh1.Columns.Items[1].Width := 120;
        DBGridEh1.Columns.Items[2].Width := 90;
        DBGridEh1.Columns.Items[3].Width := 50;
        DBGridEh1.Columns.Items[4].Width := 50;
        DBGridEh1.Columns.Items[5].Width := 70;
        DBGridEh1.Columns.Items[6].Width := 70;
        DBGridEh1.Columns.Items[7].Width := 90;
        DBGridEh1.Columns.Items[8].Width := 90;
        DBGridEh1.Columns.Items[9].Width := 90;
        DBGridEh1.Columns.Items[10].Width := 90;

        //цвета другого преподавателя
        DBGridEh1.Columns.Items[9].Color := StringToColor('$d8d7c8');
        DBGridEh1.Columns.Items[10].Color := StringToColor('$d8d7c8');
        

      end;
  end;
  CalcCurrentHour;
end;

procedure TfrmNagruzkaAddFact.dbcbDiscKeyValueChanged(Sender: TObject);
begin
  if (dbcbDisc.KeyValue <> NULL) then
    dbcbPotok.KeyValue:= TNagruzkaController.PlanNagruzka.GetPotoksFromTeacherPlan(@dbcbPotok.ListSource.DataSet, dbcbPrep.KeyValue, dbcbPlan.KeyValue, dbcbDisc.KeyValue, true, TGeneralController.Instance.CloseLockupCB(@dbcbPotok))
  else TGeneralController.Instance.CloseLockupCB(@dbcbPotok);
end;

procedure TfrmNagruzkaAddFact.DBGridEh1DblClick(Sender: TObject);
begin
  if actEdit.Enabled and (not fWithoutSheduler) then
    actAddExecute(actEdit);
end;

procedure TfrmNagruzkaAddFact.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (not fWithoutSheduler) then
    if actEdit.Enabled then
      actAddExecute(actEdit);
end;

destructor TfrmNagruzkaAddFact.Destroy;
begin
  if Assigned(dsFactNagr.DataSet) then
    dsFactNagr.DataSet.Tag := 0;
  inherited;
end;

function TfrmNagruzkaAddFact.DoApply: boolean;
begin
  if not fWithoutSheduler then
  begin
    Result:= TNagruzkaController.FactNagruzka.SaveFact(IK, fTakeFactNagr);
    if Result then
      dbcbPotokKeyValueChanged(dbcbPotok);
  end
  else
  begin
     Result:= TNagruzkaController.FactNagruzka.SaveFactWithoutSheduler(IK,fTakeFactNagr);
     if Result then IsModified := false;
  end;
end;

function TfrmNagruzkaAddFact.DoCancel: boolean;
begin
  Result:= false;
  case (Application.MessageBox('Сохранить внесенные изменения?',PChar(Caption), MB_YESNOCANCEL)) of
    mrYes: OK;
    mrNo: Result:= true;
  end;
end;

procedure TfrmNagruzkaAddFact.dsFactNagrDataChange(Sender: TObject;
  Field: TField);
var tempDS: TADODataSet;
  i: integer;
  allHour, curHour: double;
begin
  //если заполняем фактическую нагрузку без расписания
{if fWithoutSheduler then
  if dsFactNagr.DataSet.Active then
  begin
      if dsFactNagr.DataSet.FieldByName('ik_vid_zanyat').Value <> NULL then
      begin
        UpdatePickListForVN;
      end;
     if (dsFactNagr.DataSet.FieldByName('ik_vid_nagruzki').Value <> NULL)and (dsFactNagr.DataSet.FieldByName('plan_hour').Value = NULL) then
      begin
         tempDS := TGeneralController.Instance.GetNewADODataSet(false);
         tempDS.CommandText := 'select dbo.GetPlanHour('+IntToStr(dbcbPlan.KeyValue)+','+IntToStr(dbcbPrep.KeyValue)+
               ','+IntToStr(dbcbDisc.KeyValue)+','+IntToStr(dbcbPotok.KeyValue)+','+dsFactNagr.DataSet.FieldByName('ik_vid_zanyat').AsString+
               ','+dsFactNagr.DataSet.FieldByName('ik_vid_nagruzki').AsString+')';
         tempDS.Open;
         dsFactNagr.DataSet.FieldByName('plan_hour').Value := tempDS.Fields[0].Value;
         tempDS.Close;
         tempDS.Free;

      end;
  end;    }
  if dsFactNagr.DataSet.Tag<>0 then
  with dsFactNagr.DataSet do
  begin
    allHour := 0;
    curHour := 0;
    for I := 0 to fTakeFactNagr.Count - 1 do

        if (fTakeFactNagr.Items[i] as TTakeFactNagrItem).PlanItemIK=FieldByName('ik_prepod_plan').AsInteger then
        begin
          (fTakeFactNagr.Items[i] as TTakeFactNagrItem).FactHours := FieldByName('cur_fact_hour').AsFloat;
          (fTakeFactNagr.Items[i] as TTakeFactNagrItem).FactStudent := FieldByName('cur_fact_student').AsInteger;

        end;
    IsModified := true;

  end;
  CalcCurrentHour;
end;

procedure TfrmNagruzkaAddFact.FormDestroy(Sender: TObject);
begin
  if dsFactNagr.DataSet <> nil then
    if dsFactNagr.DataSet.Active then
      dsFactNagr.DataSet.Close;
  if Assigned(fTakeFactNagr) then
  begin
    fTakeFactNagr.Clear;
    FreeAndNil(fTakeFactNagr);
  end;
  inherited;
end;       

procedure TfrmNagruzkaAddFact.Label7Click(Sender: TObject);
var
  key: word;
begin
  key:= 112;
  FormKeyUp(Self, key, []);
end;

procedure TfrmNagruzkaAddFact.Label7MouseEnter(Sender: TObject);
begin
  Label7.Font.Style:= Label7.Font.Style + [fsUnderline];
end;

procedure TfrmNagruzkaAddFact.Label7MouseLeave(Sender: TObject);
begin
  Label7.Font.Style:= Label7.Font.Style - [fsUnderline];
end;

procedure TfrmNagruzkaAddFact.actEditUpdate(Sender: TObject);
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

procedure TfrmNagruzkaAddFact.CalcCurrentHour;
var
  allHour, curHour: double;
  i: integer;
begin
  allHour:= 0;
  curHour := 0;
  for I := 0 to fTakeFactNagr.Count - 1 do
     with  fTakeFactNagr.Items[i] as TTakeFactNagrItem do
     begin
         allHour := allHour + FactHours + ForeignHours;
         curHour := curHour + FactHours;
     end;
 { dsFactNagr.DataSet.DisableControls;
  dsFactNagr.DataSet.First;
  while not dsFactNagr.DataSet.Eof do
  begin
    if not fWithoutSheduler then
       allHour:= allHour + dsFactNagr.DataSet.FieldByName('f_hour_per_unit').AsFloat
    else
    begin
       curHour:= curHour + dsFactNagr.DataSet.FieldByName('cur_fact_hour').AsFloat;
       allHour:= allHour + dsFactNagr.DataSet.FieldByName('cur_fact_hour').AsFloat+dsFactNagr.DataSet.FieldByName('fact_hour').AsFloat;
    end;
    dsFactNagr.DataSet.Next;
  end;
  dsFactNagr.DataSet.EnableControls;
  }
  Label10.Caption:= FloatToStrF(curHour, ffFixed, 10, 2) + ' час.';
  Label8.Caption:= FloatToStrF(allHour, ffFixed, 10, 2) + ' час.';
end;

procedure TfrmNagruzkaAddFact.actAddExecute(Sender: TObject);
var
  temp: TfrmNagruzkaFillFactNagrByVZ;
  i: integer;
  curFactHour: double;
  tempTFN: TTakeFactNagrItem;
begin


  //для заполнения с расписанием
  if not fWithoutSheduler then
  begin
  temp:= TfrmNagruzkaFillFactNagrByVZ.CreateDialog(nil, Connection, nil);
  if (Sender as TAction).Tag = 1 then
  begin
    for I := 0 to fTakeFactNagr.Count - 1 do
      if (dsFactNagr.DataSet.FieldByName('ik_content_plan_nagr').AsInteger = TTakeFactNagrItem(fTakeFactNagr[i]).ContentPlanNagrIK) then
        begin
          temp.Tag:= i;
          break;
        end;
  end
  else temp.Tag:= -1;
  if not fWithoutSheduler then temp.CurrentSemInfo:= fCurrentSemInfo;
  temp.WithoutSheduler := fWithoutSheduler; //через расписание или нет
//    else
  temp.Read(IK, dbcbPlan.KeyValue, dbcbPrep.KeyValue, dbcbDisc.KeyValue, dbcbPotok.KeyValue, dbcbPotok.ListSource.DataSet.FieldByName('ik_norm_of_time').AsInteger, fTakeFactNagr);
  if temp.ShowModal = mrOK then
  begin
    if (Sender as TAction).Tag = 1 then
      tempTFN:= fTakeFactNagr[temp.Tag] as TTakeFactNagrItem
    else
    begin
      tempTFN:= fTakeFactNagr[fTakeFactNagr.Count-1] as TTakeFactNagrItem;
      dsFactNagr.DataSet.Insert;
      dsFactNagr.DataSet.FieldByName('ik_content_plan_nagr').AsInteger:= tempTFN.ContentPlanNagrIK;
      dsFactNagr.DataSet.FieldByName('ik_vid_zanyat').AsInteger:= tempTFN.VidZanyatIK;
      dsFactNagr.DataSet.FieldByName('ik_vid_nagruzki').AsInteger:= tempTFN.VidNagruzkiIK;
      dsFactNagr.DataSet.FieldByName('iK_type_vz').AsInteger:= tempTFN.VidZanyatTypeIK;
      dsFactNagr.DataSet.FieldByName('cName_vid_zanyat').AsString:= temp.dbcbVidZanyat.Text;
      dsFactNagr.DataSet.FieldByName('Cname_vid_nagruzki').AsString:= temp.dbcbVidNagruzki.Text;
      dsFactNagr.DataSet.Post;
    end;

    curFactHour:= 0;
    temp.dsFactNagr.DataSet.First;
    while not temp.dsFactNagr.DataSet.Eof do
    begin
      curFactHour:= curFactHour + temp.dsFactNagr.DataSet.FieldByName('f_hour_per_unit').AsFloat;
      temp.dsFactNagr.DataSet.Next;
    end;

    if dsFactNagr.DataSet.Locate('ik_content_plan_nagr; ik_vid_nagruzki', VarArrayOf([tempTFN.ContentPlanNagrIK, tempTFN.VidNagruzkiIK]), [loPartialKey]) then
    begin
      dsFactNagr.DataSet.Edit;
      dsFactNagr.DataSet.FieldByName('f_hour_per_unit').AsFloat:= RoundFloat(curFactHour, 2);
      dsFactNagr.DataSet.Post;
    end;
    IsModified:= true;
    CalcCurrentHour;
  end;
  temp.Free;
  end
  else
  //заполнение фактической нагрузки без расписания
  begin
    dsFactNagr.DataSet.First;
    dsFactNagr.DataSet.Insert;
    IsModified:= true;
  end;
end;

procedure TfrmNagruzkaAddFact.actDelExecute(Sender: TObject);
var
  i: Integer;
begin
  {  if not fWithoutSheduler then
     (Sender as TAction).Enabled:= (dbcbPotok.KeyValue <> NULL) and (dsFactNagr.DataSet <> nil);}

  for I := 0 to fTakeFactNagr.Count - 1 do
    if (dsFactNagr.DataSet.FieldByName('ik_content_plan_nagr').AsInteger = TTakeFactNagrItem(fTakeFactNagr[i]).ContentPlanNagrIK) then
    begin
      TTakeFactNagrItem(fTakeFactNagr[i]).IsRemoved:= true;
      dsFactNagr.DataSet.Delete;
      break;
    end;
  IsModified:= true;
  CalcCurrentHour;
end;

end.
