unit uMethodWorkPrep;
   {#Author nnikolenko@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MethodWorkController, uBaseFrame, StdCtrls, Buttons, ExtCtrls, DB, ADODB, GeneralController,
  DBGridEh, ComCtrls, GridsEh, Mask, DBCtrlsEh,
  DBLookupEh, ToolWin, ActnList, ImgList, DBTVMethodWorkTeacherobj, DBTVMethodWorkdepobj,
  DBCtrls, ApplicationController, ExceptionBase, WinProcs, Grids, OleServer,
  ExcelXP, ToolCtrlsEh, Menus, MethodWorkComboboxFilter, System.Actions;

const
  IID_IFilter : TGUID = '{FF82FCEB-F9F4-4F6F-A0A5-D5F9934DC29C}';

type
  //TAccessDBGrid = class(TDBGridEh);

  TfmMethodWorkPrep = class(TfmBase)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton5: TToolButton;
    ToolButton1: TToolButton;
    ToolButton4: TToolButton;
    Panel7: TPanel;
    ImageList1: TImageList;
    actList: TActionList;
    dsPlanPrep: TDataSource;
    Panel4: TPanel;
    Splitter2: TSplitter;
    ActAddToPlan: TAction;
    GroupBox1: TGroupBox;
    ActEditToPlan: TAction;
    ActDelToPlan: TAction;
    ToolButton15: TToolButton;
    actExportPlan: TAction;
    ToolButton16: TToolButton;
    actAddFactFromPlan: TAction;
    ToolButton17: TToolButton;
    actShowGOS: TAction;
    Panel6: TPanel;
    Label28: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Panel2: TPanel;
    Label27: TLabel;
    dbcbPlan: TDBLookupComboboxEh;
    Label1: TLabel;
    Label5: TLabel;
    actExportFact: TAction;
    SG: TStringGrid;
    dsWarrantFilter: TDataSource;
    dsNameWorkFilter: TDataSource;
    dsMethodWorkFilter: TDataSource;
    ActAutoPlan: TAction;
    Label12: TLabel;
    Label11: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    pmReport: TPopupMenu;
    MSExcel1: TMenuItem;
    MSExcel2: TMenuItem;
    actExportMonitor: TAction;
    MSExcel3: TMenuItem;
    Label3: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    procedure ActAddToPlanExecute(Sender: TObject);
    procedure dbcbPlanKeyValueChanged(Sender: TObject);
    procedure DBGridEh2DblClick(Sender: TObject);
    procedure ActEditToPlanUpdate(Sender: TObject);
    procedure ActAddToPlanUpdate(Sender: TObject);
    procedure ActEditToPlanExecute(Sender: TObject);
    procedure ActDelToPlanExecute(Sender: TObject);
    procedure actExportPlanExecute(Sender: TObject);
    procedure actAddFactFromPlanExecute(Sender: TObject);
    //procedure dbgCurrentPlanDrawColumnCell(Sender: TObject; const Rect: TRect;
    //  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure actExportFactExecute(Sender: TObject);
    procedure DBGridEh2TitleClick(Column: TColumnEh);
    procedure SGDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure SGDblClick(Sender: TObject);
    procedure SGSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SGMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure MyChange(Sender: TObject);
    procedure MyEditButtons0Click3(Sender: TObject; var Handled: Boolean);
    procedure MyEditButtons0Click1(Sender: TObject; var Handled: Boolean);
    procedure MyKeyPress(Sender: TObject; var Key: Char);
    procedure actAddFactFromPlanUpdate(Sender: TObject);
    procedure ActAutoPlanExecute(Sender: TObject);
    procedure ActAutoPlanUpdate(Sender: TObject);
    procedure actExportMonitorExecute(Sender: TObject);
    procedure actExportPlanUpdate(Sender: TObject);
  protected
    procedure DoRefreshFrame;override;
  private
    { Private declarations }
    FEditors : array [1..6] of TDBComboboxFilter;
    fIK: Integer;
    s: integer; //выделенная строка в StringGrid
    LastNormOfTime: Integer;
    VolumeForMW: double; //годовой объем на УМР
    PlanVolumeForMW: TDoubleArray; //запланированный объем на УМР
    procedure ClearRowObjects;
    procedure ReportProgress(Sender:TObject; CurrentStep:Integer; ProgressNote:string);
    procedure ExecuteError(Sender:TObject; E : Exception);
    procedure UpdateStringGrid;
    procedure SetGridWidth(Grid: TStringGrid);
    function GetRect(Left, Top, Bottom, Right : Word) : TRect;
    function IsEditrosNotNil:Boolean;
    function GetRowEntry(Row : Integer) : TPlanEntryViewRow;
    function CreateEditor(const FieldName : string; IsFieldBoolean : Boolean; TypeSign :  TBitwiseType; Items : array of String) : TDBComboboxFilter;
    procedure SetEditorBounds(Grid: TStringGrid);
    procedure FormatFixedCells(ACol: Integer; State: TGridDrawState; Grid: TStringGrid; ARow: Integer; Rect: TRect);
    procedure FormatSelectedCells(Rect: TRect; ARow: Integer; State: TGridDrawState; ACol: Integer; Grid: TStringGrid);
  public
    { Public declarations }
    property ik: Integer read fIK write fIK;
  end;

implementation

uses uMain, uMethodWorkAddPlan, uDMMethodWork, uMethodWorkAddWorkInNorm, uMethodWorkDateFilter,
     MW_PrepodPlanRep, ReportsBase, uWaitingForm, MW_PrepodPlanEditionRep, MW_PrepodFactRep,
     uMethodWorkAutoPlan, ReportDataSet, uMethodWorkAddPlanDep;
{$R *.dfm}

//Фиксировать факт выполнения УМР
procedure TfmMethodWorkPrep.actAddFactFromPlanExecute(Sender: TObject);
begin
  if (SG.Cells[1, s] = '') or (SG.Cells[0, s] = 'Факт') then
  begin
    Application.MessageBox('Фиксирование факта выполнения за выбранной строкой невозможно!','Фиксирование факта выполнения УМР', MB_ICONWARNING);
  end
  else
  begin
  dsPlanPrep.DataSet.Locate('IDMethodEdition', SG.Cells[6,s], []);

  if (dsPlanPrep.DataSet.FieldByName('IDMethodEditionPlan').Value <> NULL) then
  begin
    Application.MessageBox('Факт выполнения уже зафиксирован!','Фиксирование факта выполнения УМР', MB_ICONWARNING);
    exit;
  end;

  if dsPlanPrep.DataSet.FieldByName('Bit_coautor').AsBoolean then
  begin
    Application.MessageBox('Так как вы являетесь соавтором данной УМР, фиксирование её факта выполнения невозможно!','Фиксирование факта выполнения УМР', MB_ICONWARNING);
    exit;
  end;

  frmMethodWorkAddPlan:= TfrmMethodWorkAddPlan.CreateDialog(nil, self.Connection, nil);
try
  frmMethodWorkAddPlan.IK:= dsPlanPrep.DataSet.FieldByName('IDMethodEdition').AsInteger;
  frmMethodWorkAddPlan.PrepIK:= TDBNodeMethodWorkTeacherObject(self.FrameObject).ik;
  frmMethodWorkAddPlan.NormIK:= LastNormOfTime;
  //frmMethodWorkAddPlan.PlanIK:= dbcbPlan.ListSource.DataSet.FieldByName('IDPlanMW').AsInteger;
  //frmMethodWorkAddPlan.YearValue:= dbcbPlan.ListSource.DataSet.FieldByName('year_value').AsInteger;

  frmMethodWorkAddPlan.Read(TDBNodeMethodWorkTeacherObject(self.FrameObject).KafIK, false, false);

  frmMethodWorkAddPlan.dbcbPlan.ListSource.DataSet.Locate('IDPlanMW', dsPlanPrep.DataSet.FieldByName('IDPlanMW').AsInteger, []);
  frmMethodWorkAddPlan.dbcbPlan.KeyValue:= frmMethodWorkAddPlan.dbcbPlan.ListSource.DataSet.FieldByName('ik_year').AsInteger;
  frmMethodWorkAddPlan.dbcbNameDisc.KeyValue:= TMethodWorkController.Instance.LoadMainDiscInDialog(frmMethodWorkAddPlan.IK);
  frmMethodWorkAddPlan.dbcbWarrant.KeyValue:= dsPlanPrep.DataSet.FieldByName('IDWarrant').AsInteger;
  frmMethodWorkAddPlan.dbcbMW.KeyValue:= dsPlanPrep.DataSet.FieldByName('IDContentNorm').AsInteger;
  frmMethodWorkAddPlan.dbeNameEd.text:=dsPlanPrep.DataSet.FieldByName('NameMethodEdition').AsString;
  frmMethodWorkAddPlan.dbeCode.text:=dsPlanPrep.DataSet.FieldByName('Code').AsString;
  frmMethodWorkAddPlan.dbeCharact.text:=dsPlanPrep.DataSet.FieldByName('Characteristic').AsString;
  frmMethodWorkAddPlan.dbeVolume.text:=dsPlanPrep.DataSet.FieldByName('Volume').AsString;
  frmMethodWorkAddPlan.dbeDraw.text:=dsPlanPrep.DataSet.FieldByName('Drawing').AsString;
  frmMethodWorkAddPlan.dbePos.text:=dsPlanPrep.DataSet.FieldByName('Position').AsString;

    if (frmMethodWorkAddPlan.ShowModal() = mrOk) then
    begin
      // обновляем теущий план
      //TMethodWorkController.Instance.GetPlanCloseFact;
      //dsPlanPrep.DataSet:= TMethodWorkController.Instance.LoadPlanPrepForAllDisc(TDBNodeMethodWorkTeacherObject(self.FrameObject).ik, dbcbPlan.ListSource.DataSet.FieldByName('IDPlanMW').AsInteger);

      dbcbPlanKeyValueChanged(nil);
      // обновляем фильтр по срокам годности
      //TMethodWorkController.Instance.GetFilteredFact(TDBNodeMethodWorkTeacherObject(self.FrameObject).KafIK, 12);

    end;
finally
  frmMethodWorkAddPlan.Free;
end;
  end;
end;

procedure TfmMethodWorkPrep.actAddFactFromPlanUpdate(Sender: TObject);
begin
   if dsPlanPrep.DataSet <> nil then
   begin
    if (dsPlanPrep.DataSet.Active) and (SG.Cells[1, s] <> '') and (Assigned(GetRowEntry(s))) and (GetRowEntry(s).IsPlan) then
      (Sender as TAction).Enabled:= dsPlanPrep.DataSet.RecordCount > 0
    else (Sender as TAction).Enabled:= false;
   end
   else (Sender as TAction).Enabled:= false;
end;

// Добавить УМР в текущий план
procedure TfmMethodWorkPrep.ActAddToPlanExecute(Sender: TObject);
var
  i: integer;
  //row: TGridRect;
begin
frmMethodWorkAddPlan:= TfrmMethodWorkAddPlan.CreateDialog(nil, self.Connection, nil);
try
  frmMethodWorkAddPlan.IK:= -1;
  frmMethodWorkAddPlan.PrepIK:= TDBNodeMethodWorkTeacherObject(self.FrameObject).ik;
  frmMethodWorkAddPlan.NormIK:= LastNormOfTime;
  //frmMethodWorkAddPlan.PlanIK:= dbcbPlan.ListSource.DataSet.FieldByName('IDPlanMW').AsInteger;
  //frmMethodWorkAddPlan.YearValue:= dbcbPlan.ListSource.DataSet.FieldByName('year_value').AsInteger;

  frmMethodWorkAddPlan.Read(TDBNodeMethodWorkTeacherObject(self.FrameObject).KafIK, true, false);
  if dbcbPlan.ListSource.DataSet.FieldByName('IDPlanMW').AsInteger <> 0 then
    frmMethodWorkAddPlan.dbcbPlan.KeyValue:= dbcbPlan.KeyValue;

  if (frmMethodWorkAddPlan.ShowModal() = mrOk) then
  begin
    dbcbPlanKeyValueChanged(nil);
    for I := 2 to SG.RowCount - 1 do
      if SG.Cells[6,i] = IntToStr(frmMethodWorkAddPlan.IK) then
      begin
        {row.Left:= 0;
        row.Top:= i;
        row.Right:= 6;
        row.Bottom:= i;
        SG.Selection:= row;}
        SG.Row:= i;
      end;
  end
finally
  frmMethodWorkAddPlan.Free;
end;
end;

procedure TfmMethodWorkPrep.ActAddToPlanUpdate(Sender: TObject);
begin
  (sender as TAction).Enabled:= dbcbPlan.KeyValue <> NULL;
end;

procedure TfmMethodWorkPrep.ActAutoPlanExecute(Sender: TObject);
begin
  if (dbcbPlan.KeyValue <> NULL) then
  begin
  frmMethodWorkAutoPlan:= TfrmMethodWorkAutoPlan.CreateDialog(nil, self.Connection, nil);
try
  frmMethodWorkAutoPlan.IK:= -1;
  frmMethodWorkAutoPlan.PrepIK:= TDBNodeMethodWorkTeacherObject(self.FrameObject).ik;
  //frmMethodWorkAutoPlan.NormIK:= LastNormOfTime;
  frmMethodWorkAutoPlan.KafIK:= TDBNodeMethodWorkTeacherObject(self.FrameObject).KafIK;
  frmMethodWorkAutoPlan.YearIK:= dbcbPlan.ListSource.DataSet.FieldByName('ik_year').AsInteger;
  //frmMethodWorkAutoPlan.YearValue:= dbcbPlan.ListSource.DataSet.FieldByName('year_value').AsInteger;
  frmMethodWorkAutoPlan.PlanIK:= dbcbPlan.ListSource.DataSet.FieldByName('IDPlanMW').AsInteger;
  frmMethodWorkAutoPlan.Caption:= 'Автоматически сформированный план УМР за ' + dbcbPlan.ListSource.DataSet.FieldByName('UchYear').AsString + ' год';

  frmMethodWorkAutoPlan.Read;

  if (frmMethodWorkAutoPlan.ShowModal() = mrOk) then
  begin
    dbcbPlanKeyValueChanged(nil);
  end
finally
  frmMethodWorkAutoPlan.Free;
end;
  end;
end;

procedure TfmMethodWorkPrep.ActAutoPlanUpdate(Sender: TObject);
begin
  (sender as TAction).Enabled:= (dbcbPlan.KeyValue <> NULL) and (dbcbPlan.ListSource.DataSet.FieldByName('IDPlanMW').AsInteger <> 0);
end;

//Удалить УМР из тукущего плана
procedure TfmMethodWorkPrep.ActDelToPlanExecute(Sender: TObject);
var
  temp: Variant;
begin
  if dbcbPlan.ListSource.DataSet.FieldByName('DateRatification').Value <> NULL then
  begin
    Application.MessageBox('План утвержден, удаление выбранной строки невозможно!','Удаление УМР', MB_ICONWARNING);
  end
  else
  begin
    dsPlanPrep.DataSet.Locate('IDMethodEdition', SG.Cells[6,s], []);

    if dsPlanPrep.DataSet.FieldByName('Bit_coautor').AsBoolean then
    begin
      Application.MessageBox('Так как вы являетесь соавтором данной УМР, её удаление невозможно!','Удаление УМР', MB_ICONWARNING);
    end
    else
    if (Application.MessageBox('Вы действительно хотите удалить выбранную УМР?','Удаление УМР', mb_YesNo) = mrYes) then
    begin
      if dsPlanPrep.DataSet.FieldByName('Bit_plan_fact').AsBoolean then
        if (SG.Cells[1, s+1] <> '') then //если присутствует факт
          Application.MessageBox('Зафиксирован факт выполнения данной УМР, её удаление невозможно!','Удаление УМР', MB_ICONWARNING)
        else
          TMethodWorkController.Instance.DeleteMWfromPlan(dsPlanPrep.DataSet.FieldByName('IDMethodEdition').AsInteger)
      else
        TMethodWorkController.Instance.DeleteMWfromFact(dsPlanPrep.DataSet.FieldByName('IDMethodEdition').AsInteger);

      dbcbPlanKeyValueChanged(nil);
    end;
  end;
end;

// Редактировать УМР текущего плана
procedure TfmMethodWorkPrep.ActEditToPlanExecute(Sender: TObject);
var
  row: TGridRect;
begin

if (SG.Cells[1, s] = '') then
begin
  //Application.MessageBox('Редактирование выбранной строки невозможно!','Редактирование УМР', MB_ICONWARNING);
end
else
begin
  dsPlanPrep.DataSet.Locate('IDMethodEdition', SG.Cells[6,s], []);

  frmMethodWorkAddPlan:= TfrmMethodWorkAddPlan.CreateDialog(nil, self.Connection, nil);
try
  frmMethodWorkAddPlan.IK:= dsPlanPrep.DataSet.FieldByName('IDMethodEdition').AsInteger;
  frmMethodWorkAddPlan.NormIK:= LastNormOfTime;
  //frmMethodWorkAddPlan.YearValue:= dbcbPlan.ListSource.DataSet.FieldByName('year_value').AsInteger;

  if dsPlanPrep.DataSet.FieldByName('Bit_plan_fact').AsBoolean then
  begin
    frmMethodWorkAddPlan.Read(TDBNodeMethodWorkTeacherObject(self.FrameObject).KafIK, true, false);
    frmMethodWorkAddPlan.dbeCountFact.Text:= dsPlanPrep.DataSet.FieldByName('PercentCompletion').AsString;
    if dsPlanPrep.DataSet.FieldByName('IDMethodEditionPlan').Value <> NULL then
    begin
      Application.MessageBox('План закрыт фактом, его редактирование невозможно!','Редактирование УМР', MB_ICONWARNING);
      frmMethodWorkAddPlan.bbOK.Enabled:= false;
    end;
  end
  else
  begin
    frmMethodWorkAddPlan.Read(TDBNodeMethodWorkTeacherObject(self.FrameObject).KafIK, false, true);
    frmMethodWorkAddPlan.dbeMark.text:= dsPlanPrep.DataSet.FieldByName('Mark').AsString;
    frmMethodWorkAddPlan.dbeCountFact.Text:= dsPlanPrep.DataSet.FieldByName('CountFactTime').AsString;
  end;
  frmMethodWorkAddPlan.dbcbPlan.ListSource.DataSet.Locate('IDPlanMW', dsPlanPrep.DataSet.FieldByName('IDPlanMW').AsInteger, []);
  frmMethodWorkAddPlan.dbcbPlan.KeyValue:= frmMethodWorkAddPlan.dbcbPlan.ListSource.DataSet.FieldByName('ik_year').AsInteger;
  if (frmMethodWorkAddPlan.dbcbPlan.ListSource.DataSet.FieldByName('DateRatification').Value <> NULL) then
    frmMethodWorkAddPlan.dbcbPlan.Enabled:= false;
  frmMethodWorkAddPlan.dbcbNameDisc.KeyValue:= TMethodWorkController.Instance.LoadMainDiscInDialog(frmMethodWorkAddPlan.IK);
  frmMethodWorkAddPlan.dbcbWarrant.KeyValue:= dsPlanPrep.DataSet.FieldByName('IDWarrant').AsInteger;
  frmMethodWorkAddPlan.dbcbMW.KeyValue:= dsPlanPrep.DataSet.FieldByName('IDContentNorm').AsInteger;
  frmMethodWorkAddPlan.dbeNameEd.text:= dsPlanPrep.DataSet.FieldByName('NameMethodEdition').AsString;
  frmMethodWorkAddPlan.dbeCode.text:= dsPlanPrep.DataSet.FieldByName('Code').AsString;
  frmMethodWorkAddPlan.dbeCharact.text:= dsPlanPrep.DataSet.FieldByName('Characteristic').AsString;
  frmMethodWorkAddPlan.dbeVolume.text:= dsPlanPrep.DataSet.FieldByName('Volume').AsString;
  frmMethodWorkAddPlan.dbeDraw.text:= dsPlanPrep.DataSet.FieldByName('Drawing').AsString;
  frmMethodWorkAddPlan.dbePos.text:= dsPlanPrep.DataSet.FieldByName('Position').AsString;
  frmMethodWorkAddPlan.dbcCurrentEd.Checked:= dsPlanPrep.DataSet.FieldByName('CurrentBitEdition').AsBoolean;
  frmMethodWorkAddPlan.dbcEd.Checked:= dsPlanPrep.DataSet.FieldByName('BitEdition').AsBoolean;

  if dsPlanPrep.DataSet.FieldByName('Bit_coautor').AsBoolean then
  begin
    Application.MessageBox('Так как вы являетесь соавтором данной УМР, её редактирование невозможно!','Редактирование УМР', MB_ICONWARNING);
    frmMethodWorkAddPlan.bbOK.Enabled:= false;
    frmMethodWorkAddPlan.ShowModal();
  end
  else
    if (frmMethodWorkAddPlan.ShowModal() = mrOk) then
    begin
      row:= SG.Selection;
      dbcbPlanKeyValueChanged(nil);
      SG.Selection:= row;

      // обновляем фильтр по срокам годности
      //TMethodWorkController.Instance.GetFilteredFact(TDBNodeMethodWorkTeacherObject(self.FrameObject).KafIK, 12);
    end;
finally
  frmMethodWorkAddPlan.Free;
end;
end;
end;

procedure TfmMethodWorkPrep.ActEditToPlanUpdate(Sender: TObject);
begin
   if dsPlanPrep.DataSet <> nil then
   begin
    if (dsPlanPrep.DataSet.Active) and (Assigned(GetRowEntry(s))) {(SG.Cells[1, s] <> '')} then
      (Sender as TAction).Enabled:= dsPlanPrep.DataSet.RecordCount > 0
    else (Sender as TAction).Enabled:= false;
   end
   else (Sender as TAction).Enabled:= false;
end;

procedure TfmMethodWorkPrep.actExportFactExecute(Sender: TObject);
var
  Report: TReportBase;
  frmWaiting: TfrmWaiting;
begin
  frmMethodWorkAddPlanDep:= TfrmMethodWorkAddPlanDep.CreateDialog(nil, self.Connection, nil);
try
  frmMethodWorkAddPlanDep.IK:= TDBNodeMethodWorkTeacherObject(self.FrameObject).KafIK;
  frmMethodWorkAddPlanDep.LastPlanIK:= 0;
  frmMethodWorkAddPlanDep.Read;
  frmMethodWorkAddPlanDep.Caption:= 'Выбирите учебный год';
  frmMethodWorkAddPlanDep.Label2.Visible:= false;
  frmMethodWorkAddPlanDep.Label5.Visible:= false;
  frmMethodWorkAddPlanDep.Label6.Visible:= false;
  frmMethodWorkAddPlanDep.dbdtDate.Visible:= false;
  frmMethodWorkAddPlanDep.dbeProtocol.Visible:= false;
  frmMethodWorkAddPlanDep.dbcbTypeRep.Visible:= false;
  frmMethodWorkAddPlanDep.Label7.Visible:= false;
  frmMethodWorkAddPlanDep.Label8.Visible:= false;
  frmMethodWorkAddPlanDep.Label9.Visible:= false;
  frmMethodWorkAddPlanDep.bbSprav.Visible:= False;
  if dbcbPlan.KeyValue <> 0 then
    frmMethodWorkAddPlanDep.dbcbYear.KeyValue:= dbcbPlan.KeyValue;

  if (frmMethodWorkAddPlanDep.ShowModal() = mrOk) then
  begin
    Report := TReportBase.CreateReport(TPrepodFactReport);
    Report.FreeOnComplete := true;
    frmWaiting := TfrmWaiting.Create(self);
    try
      //Report.OnReportProgress := ReportProgress;
      Report.OnExecuteError := ExecuteError;
      Report.ReportTemplate :=  ExtractFilePath(Application.ExeName) + 'reports\MW_CurrentFactPrep.xlt';
      //Form2.pbReportStep.Max := Report.TotalSteps;
      TPrepodFactReport(Report).PrepIK:= TDBNodeMethodWorkTeacherObject(self.FrameObject).ik;
      TPrepodFactReport(Report).PlanIK:= frmMethodWorkAddPlanDep.dbcbYear.ListSource.DataSet.FieldByName('IDPlanMW').AsInteger;

      TPrepodFactReport(Report).YearVolMW:= VolumeForMW;
    
      frmWaiting.ActionComponentUI1.ActionComponent:=Report;
      frmWaiting.Show;
      Report.BuildReport;
    finally
      frmWaiting.Free;
    end;
  end;
finally
  frmMethodWorkAddPlanDep.Free;
end;
end;

procedure TfmMethodWorkPrep.actExportMonitorExecute(Sender: TObject);
var
  Report: TReportBase;
  frmWaiting: TfrmWaiting;
begin
  Report := TReportBase.CreateReport(TPrepodPlanEditionReport);
  Report.FreeOnComplete := true;
  frmWaiting := TfrmWaiting.Create(self);

  try
    //Report.OnReportProgress := ReportProgress;
    Report.OnExecuteError := ExecuteError;
    TPrepodPlanEditionReport(Report).SGrid:= SG;
    Report.ReportTemplate :=  ExtractFilePath(Application.ExeName) + 'reports\MW_CurrentPlanEditionPrep.xlt';
    //Form2.pbReportStep.Max := Report.TotalSteps;

    TPrepodPlanEditionReport(Report).PrepIK:= TDBNodeMethodWorkTeacherObject(self.FrameObject).ik;
    TPrepodPlanEditionReport(Report).PlanIK:= dbcbPlan.ListSource.DataSet.FieldByName('IDPlanMW').AsInteger;

    TPrepodPlanEditionReport(Report).YearVolMW:= VolumeForMW;
    
    frmWaiting.ActionComponentUI1.ActionComponent:=Report;
    frmWaiting.Show;
    Report.BuildReport;
  finally
    frmWaiting.Free;
  end;
end;

procedure TfmMethodWorkPrep.actExportPlanExecute(Sender: TObject);
var
  Report: TReportBase;
  frmWaiting: TfrmWaiting;
begin
  frmMethodWorkAddPlanDep:= TfrmMethodWorkAddPlanDep.CreateDialog(nil, self.Connection, nil);
try
  frmMethodWorkAddPlanDep.IK:= TDBNodeMethodWorkTeacherObject(self.FrameObject).KafIK;
  frmMethodWorkAddPlanDep.LastPlanIK:= 0;
  frmMethodWorkAddPlanDep.Read;
  frmMethodWorkAddPlanDep.Caption:= 'Выбирите учебный год';
  frmMethodWorkAddPlanDep.Label2.Visible:= false;
  frmMethodWorkAddPlanDep.Label5.Visible:= false;
  frmMethodWorkAddPlanDep.Label6.Visible:= false;
  frmMethodWorkAddPlanDep.dbdtDate.Visible:= false;
  frmMethodWorkAddPlanDep.dbeProtocol.Visible:= false;
  frmMethodWorkAddPlanDep.dbcbTypeRep.Visible:= false;
  frmMethodWorkAddPlanDep.Label7.Visible:= false;
  frmMethodWorkAddPlanDep.Label8.Visible:= false;
  frmMethodWorkAddPlanDep.Label9.Visible:= false;
  frmMethodWorkAddPlanDep.bbSprav.Visible:= False;
  if dbcbPlan.KeyValue <> 0 then
    frmMethodWorkAddPlanDep.dbcbYear.KeyValue:= dbcbPlan.KeyValue;

  if (frmMethodWorkAddPlanDep.ShowModal() = mrOk) then
  begin
    //TMethodWorkController.Instance.ExportCurrentTeacherPlan(TDBNodeMethodWorkTeacherObject(self.FrameObject).ik, dbcbPlan.Text, VolumeForMW, PlanVolumeForMW[0]);
    Report := TReportBase.CreateReport(TPrepodPlanReport);
    Report.FreeOnComplete := true;
    frmWaiting := TfrmWaiting.Create(self);
    try
      //Report.OnReportProgress := ReportProgress;
      Report.OnExecuteError := ExecuteError;
      Report.ReportTemplate :=  ExtractFilePath(Application.ExeName) + 'reports\MW_CurrentPlanPrep.xlt';
      //Form2.pbReportStep.Max := Report.TotalSteps;
      TPrepodPlanReport(Report).PrepIK:= TDBNodeMethodWorkTeacherObject(self.FrameObject).ik;
      TPrepodPlanReport(Report).PlanIK:= frmMethodWorkAddPlanDep.dbcbYear.ListSource.DataSet.FieldByName('IDPlanMW').AsInteger;

      TPrepodPlanReport(Report).YearVolMW:= VolumeForMW;

      frmWaiting.ActionComponentUI1.ActionComponent:=Report;
      frmWaiting.Show;
      Report.BuildReport;
    finally
      frmWaiting.Free;
    end;
  end;
finally
  frmMethodWorkAddPlanDep.Free;
end;
end;

procedure TfmMethodWorkPrep.actExportPlanUpdate(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfmMethodWorkPrep.ClearRowObjects;
var
  I : Integer;
begin
  for I := 2 to SG.RowCount - 1 do
  begin
    if Assigned(SG.Objects[0, I]) then
    begin
      SG.Objects[0, I].Free;
      SG.Objects[0, I] := nil;
    end;
  end;
end;

function TfmMethodWorkPrep.CreateEditor(const FieldName : string; IsFieldBoolean : Boolean; TypeSign :  TBitwiseType; Items : array of String) : TDBComboboxFilter;
var
  I : Integer;
begin
  Result := TDBComboboxFilter.Create(SG, FieldName, IsFieldBoolean, TypeSign);
  Result.Parent:= SG;
  Result.AutoSize:= false;
  Result.Height:= 21;
  Result.AlwaysShowBorder:= true;
  Result.Items.Clear;
  for I := Low(Items) to High(Items) do
    Result.Items.Add(Items[I]);
  Result.ItemIndex:= 0;
  Result.OnChange:= MyChange;
  Result.OnKeyPress:= MyKeyPress;
end;

procedure TfmMethodWorkPrep.SetEditorBounds(Grid: TStringGrid);
begin
  if IsEditrosNotNil then
  begin
    FEditors[1].SetBounds(0, 0, Grid.ColWidths[0], 21);
    FEditors[2].SetBounds(1 + Grid.ColWidths[0], 0, Grid.ColWidths[1], 21);
    FEditors[3].SetBounds(2 + Grid.ColWidths[0] + Grid.ColWidths[1], 0, Grid.ColWidths[2], 21);
    FEditors[4].SetBounds(3 + Grid.ColWidths[0] + Grid.ColWidths[1] + Grid.ColWidths[2], 0, Grid.ColWidths[3], 21);
    FEditors[5].SetBounds(4 + Grid.ColWidths[0] + Grid.ColWidths[1] + Grid.ColWidths[2] + Grid.ColWidths[3], 0, Grid.ColWidths[4], 21);
    FEditors[6].SetBounds(5 + Grid.ColWidths[0] + Grid.ColWidths[1] + Grid.ColWidths[2] + Grid.ColWidths[3] + Grid.ColWidths[4], 0, Grid.ColWidths[5], 21);
  end;
end;

procedure TfmMethodWorkPrep.FormatFixedCells(ACol: Integer; State: TGridDrawState; Grid: TStringGrid; ARow: Integer; Rect: TRect);
var
  r: TRect;
  F: Word;
begin
  if (gdFixed in State) then
  begin
    with Grid do
    begin
      r := Rect;
      Canvas.FillRect(Rect);
      F := DT_CENTER or DT_WORDBREAK or DT_TOP;
      //DT_EXPANDTABS or DT_VCENTER or DT_WORDBREAK;
      r.Left := r.Left + 2;
      r.Top := r.Top + 2;
      r.Right := r.Right - 2;
      r.Bottom := r.Bottom - 2;
      Canvas.Font.Style := Canvas.Font.Style + [fsBold];
      DrawText(Canvas.Handle, PChar(Cells[ACol, ARow]), length(Cells[ACol, ARow]), r, F);
    end;
  end;
end;

procedure TfmMethodWorkPrep.FormatSelectedCells(Rect: TRect; ARow: Integer; State: TGridDrawState; ACol: Integer; Grid: TStringGrid);
var
  r: TRect;
  F: Word;
begin
  if (gdSelected in State) then
    with Grid do
      if (Cells[0, ARow] <> '') and not(Assigned(GetRowEntry(ARow))) and (Cells[0, ARow] <> FACT_MSG){(Cells[0, ARow] <> 'Факт') and (Cells[0, ARow] <> 'План')} and (Cells[1, ARow] = '') then
      begin
        DefaultDrawing := false;
        if ACol = 0 then
        begin
          r := GetRect(0, Rect.Top, Rect.Bottom, ClientWidth);
          Canvas.Brush.Color := clHighlight;
          Canvas.FillRect(r);
          Canvas.Rectangle(r);
          Canvas.Font.Color := clHighLightText;
          Canvas.TextOut(((r.Right - r.Left) div 2) - (Canvas.TextWidth(Cells[0, ARow]) div 2) - 1, r.Top + 1, Cells[0, ARow]);
        end;
      end
      else
      begin
        Canvas.Brush.Color:= clHighlight;
        r:= Rect;
        Canvas.FillRect(Rect);
        if (ACol = 5) then
        begin
          r.Left:= r.Left+ 9;
          r.Top:= r.Top+ 9;
          r.Right := r.Right- 9;
          r.Bottom := r.Bottom - 9;

          //if Cells[ACol,ARow] = 'Издаётся' then
          if (Assigned(GetRowEntry(ARow))) and (GetRowEntry(ARow).IsEdition) then
		        F := DFCS_CHECKED
		      else
            F := DFCS_BUTTONCHECK;

          DrawFrameControl(Canvas.Handle, r, DFC_BUTTON, F);
        end
        else
        begin
          Canvas.Font.Color := clHighLightText;
          F:= DT_LEFT or DT_WORDBREAK or DT_TOP;
          r.Left:= r.Left+2;
          r.Top:= r.Top+2;
          r.Right := r.Right-2;
          r.Bottom := r.Bottom - 2;

          DrawText(Canvas.Handle,PChar(Cells[ACol,ARow]),length(Cells[ACol,ARow]),r,F);
        end;
      end;
end;

function TfmMethodWorkPrep.GetRect(Left, Top, Bottom, Right: Word): TRect;
begin
  Result.Left := Left;
  Result.Top := Top;
  Result.Bottom := Bottom;
  Result.Right := Right;
end;

function TfmMethodWorkPrep.GetRowEntry(Row: Integer): TPlanEntryViewRow;
begin
  Result := SG.Objects[0, Row] as TPlanEntryViewRow;
end;

procedure TfmMethodWorkPrep.dbcbPlanKeyValueChanged(Sender: TObject);
var
  I : Integer;
begin
  if (dbcbPlan.KeyValue <> NULL) then
  begin
    dsPlanPrep.DataSet:= TMethodWorkController.Instance.LoadPlanPrepForAllDisc(TDBNodeMethodWorkTeacherObject(self.FrameObject).ik, dbcbPlan.ListSource.DataSet.FieldByName('IDPlanMW').AsInteger);

    if IsEditrosNotNil then
    begin
      for I := Low(FEditors) to High(FEditors) do
      begin
        if not(FEditors[I].BooleanField) then
        begin
          FEditors[I].Items.Clear;
          FEditors[I].Items.Add(TDBComboboxFilter.FILTER_ALL);
        end;
      end;

    dsWarrantFilter.DataSet:= TMethodWorkController.Instance.LoadWarrantForFilter(TDBNodeMethodWorkTeacherObject(self.FrameObject).ik, dbcbPlan.ListSource.DataSet.FieldByName('IDPlanMW').AsInteger);
    dsWarrantFilter.DataSet.First;
    while not dsWarrantFilter.DataSet.Eof do
    begin
      FEditors[3].Items.Add(dsWarrantFilter.DataSet.FieldByName('NameWarrant').AsString);
      dsWarrantFilter.DataSet.Next;
    end;
    dsWarrantFilter.DataSet.Close;
    dsWarrantFilter.DataSet.Free;

    dsNameWorkFilter.DataSet:= TMethodWorkController.Instance.LoadMethodEditionForFilter(TDBNodeMethodWorkTeacherObject(self.FrameObject).ik, dbcbPlan.ListSource.DataSet.FieldByName('IDPlanMW').AsInteger);
    dsNameWorkFilter.DataSet.First;
    while not dsNameWorkFilter.DataSet.Eof do
    begin
      FEditors[5].Items.Add(dsNameWorkFilter.DataSet.FieldByName('NameMethodEdition').AsString);
      dsNameWorkFilter.DataSet.Next;
    end;
    dsNameWorkFilter.DataSet.Close;
    dsNameWorkFilter.DataSet.Free;

    dsMethodWorkFilter.DataSet:= TMethodWorkController.Instance.LoadMethodWorkForFilter(TDBNodeMethodWorkTeacherObject(self.FrameObject).ik, dbcbPlan.ListSource.DataSet.FieldByName('IDPlanMW').AsInteger);
    dsMethodWorkFilter.DataSet.First;
    while not dsMethodWorkFilter.DataSet.Eof do
    begin
      FEditors[4].Items.Add(dsMethodWorkFilter.DataSet.FieldByName('NameWork').AsString);
      dsMethodWorkFilter.DataSet.Next;
    end;
    dsMethodWorkFilter.DataSet.Close;
    dsMethodWorkFilter.DataSet.Free;

    for I := Low(FEditors) to High(FEditors) do
      FEditors[I].ItemIndex:=0;

    UpdateStringGrid;
    end;
  end;
  //else frmMain.StatusBar1.Panels[1].Text:= 'Учебный год: <не выбран>';
end;

procedure TfmMethodWorkPrep.DBGridEh2DblClick(Sender: TObject);
begin
 if ActAddToPlan.Enabled then
    ActAddToPlanExecute(ActAddToPlan);
end;

procedure TfmMethodWorkPrep.DBGridEh2TitleClick(Column: TColumnEh);
begin
  if Column.Field.DataType = ftDateTime then
  begin
    TADODataSet(Column.Grid.DataSource.DataSet).IndexFieldNames:= Column.Field.FieldName + ' DESC';
    Column.Title.SortMarker:=smDownEh;
  end
  else
  begin
    TADODataSet(Column.Grid.DataSource.DataSet).IndexFieldNames:= Column.Field.FieldName;
    Column.Title.SortMarker:=smUpEh;
  end;
end;


(*
//выделяем цветом строки плана, которые закрыты фактом
procedure TfmMethodWorkPrep.dbgCurrentPlanDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
  var
    Format: Word;
    CellRect, R1, R2: TRect;
    S1, S2: String;
begin
  //рисуем заголовок в две строки
  //if (gdFixed in State) then
   with TAccessDBGrid(Sender as TDBGridEh) do
   begin
     // Increase title height
    // Titelhohe vergrossern
    RowHeights[0] := 44;

    Canvas.Brush.Style := bsClear;
    Canvas.Font.Color:= clWindowText;

     // Column Titles
    // Spalten Titel setzen 
    case Column.Index of
     0: begin
          Column.Title.Caption := '';
          S1 := 'Row 1';
          S2 := Column.Field.DisplayLabel;
        end;
     1: begin
          Column.Title.Caption := '';
          S1 := 'Row 1';
          S2 := Column.Field.DisplayLabel;
        end;
     end;
     // write title:
    // Titel ausgeben:
    {R1:= Rect;
    R2:= Rect;
    R1.Left:= R1.Left+2;
    R1.Top:= R1.Top+2;
    R2.Left:= R1.Left+2;
    R2.Top:= R1.Top+22;
    Canvas.FillRect(Rect);
    Format := DT_LEFT or DT_WORDBREAK or DT_TOP;
    WinProcs.DrawText(
                    Canvas.Handle,
                    PAnsiChar(S1),
                    StrLen(PAnsiChar(S1)),
                    R1, Format);
    WinProcs.DrawText(
                    Canvas.Handle,
                    PAnsiChar(S2),
                    StrLen(PAnsiChar(S2)),
                    R2, Format);}
    //Canvas.FillRect(Rect);
    Canvas.TextOut(Rect.Left+2, 2, S1);
    Canvas.TextOut(Rect.Left+2, 22, S2);
   end; //конец with

  if (dsPlanPrep.DataSet.FieldByName('IDMethodEditionPlan').Value = NULL) then
  begin
    CellRect := Rect;
    (Sender as TDBGridEh).Canvas.FillRect(Rect);
    (Sender as TDBGridEh).Canvas.Font.Color:= clRed;

    if (Column.Field.DataType = ftString) or (Column.Field.DataType = ftDateTime) then
    begin
      Format := DT_LEFT or DT_WORDBREAK or DT_TOP;
      CellRect.Left:= CellRect.Left+2;
      CellRect.Top:= CellRect.Top+2;
    end
    else
    begin
      Format := DT_RIGHT or DT_WORDBREAK or DT_TOP;
      CellRect.Right:= CellRect.Right-2; //-(Sender as TDBGridEh).Canvas.TextWidth(Column.Field.Text)-2;
      CellRect.Top:= CellRect.Top+2;
    end;

    WinProcs.DrawText(
                    (Sender as TDBGridEh).Canvas.Handle,
                    PAnsiChar(TDBGridEh(Sender).DataSource.DataSet.FieldByName(Column.FieldName).AsString),
                    StrLen(PAnsiChar(TDBGridEh(Sender).DataSource.DataSet.FieldByName(Column.FieldName).AsString)),
                    CellRect,
                    Format);
  end;

  {if (dsPlanPrep.DataSet.FieldByName('IDMethodEditionPlan').Value = NULL) then
  with dbgCurrentPlan.Canvas do
  begin
   //Brush.Color:= clWhite; //clGradientActiveCaption;
   FillRect(Rect);
   Font.Color:= clRed;
   if Column.Field.DataType = ftString then
     TextOut(Rect.Left+2, Rect.Top+2, Column.Field.Text)
   else TextOut(Rect.Right-TextWidth(Column.Field.Text)-2, Rect.Top+2, Column.Field.Text);
  end; }

//else
//dbgCurrentPlan.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;  *)

procedure TfmMethodWorkPrep.DoRefreshFrame;
  procedure InitHeaders;
  begin
    SG.ColCount:= 7;
    SG.RowHeights[0]:= 21;
    SG.Cells[0,1]:= 'План/ Факт';
    SG.Cells[1,1]:= 'Готовность';
    SG.Cells[2,1]:= 'Результат работы';
    SG.Cells[3,1]:= 'Вид работы';
    SG.Cells[4,1]:= 'Наименование работы';
    SG.Cells[5,1]:= 'Издание';
  end;
  
  procedure InitEditors;
  begin
    FEditors[1] := CreateEditor('Bit_plan_fact', true, bwEquals, [TDBComboboxFilter.FILTER_ALL, 'План', 'Факт']);

    FEditors[2] := CreateEditor('DateTransitionInState', false, bwEquals, []);
    FEditors[2].EditButton.Visible:= False;
    FEditors[2].EditButtons.Add;
    FEditors[2].EditButtons[0].Style:= ebsEllipsisEh;
    FEditors[2].EditButtons[0].OnClick:= MyEditButtons0Click1;

    FEditors[3] := CreateEditor('NameWarrant', false, bwEquals, []);
    FEditors[4] := CreateEditor('NameWork', false, bwEquals, []);
    FEditors[5] := CreateEditor('NameMethodEdition', false, bwEquals, []);
    FEditors[6] := CreateEditor('CurrentBitEdition', true, bwEquals, [TDBComboboxFilter.FILTER_ALL, 'Издаётся', 'Не издаётся']);
  end;

begin
  // План УМР преподавателя
  TGeneralController.Instance.InitializeLockupCB(@dbcbPlan, 'ik_year', 'UchYear');

  //определяем нормы времени, текущие для кафедры
  LastNormOfTime:= TMethodWorkController.Instance.GetLastNormOfTime(TDBNodeMethodWorkTeacherObject(self.FrameObject).KafIK);

  //годовой объем на УМР для преподавателя
  VolumeForMW:= TMethodWorkController.Instance.GetVolumeForMW(TDBNodeMethodWorkTeacherObject(self.FrameObject).KafIK, TDBNodeMethodWorkTeacherObject(self.FrameObject).ik, LastNormOfTime);
  Label8.Caption:= FloatToStrF(VolumeForMW, ffFixed, 10, 2) + ' час.';

  InitHeaders;

  if not IsEditrosNotNil then
    InitEditors;

  if dbcbPlan.KeyValue <> NULL then
  begin
    dbcbPlan.KeyValue:= NULL;
  end;

  dbcbPlan.KeyValue:= TMethodWorkController.Instance.GetPlanMWForPlan(@dbcbPlan.ListSource.DataSet, TDBNodeMethodWorkTeacherObject(self.FrameObject).KafIK, true, true);
end;

procedure TfmMethodWorkPrep.ExecuteError(Sender: TObject; E: Exception);
begin
  (Sender as TExcelReportBase).Quit;
  raise EApplicationException.Create('Произошла ошибка при экспорте данных в Excel.',E);
end;

function TfmMethodWorkPrep.IsEditrosNotNil: Boolean;
var
  I : Integer;
begin
  Result := true;
  for I := Low(FEditors) to High(FEditors) do
     Result := Result and Assigned(FEditors[I]);
end;

procedure TfmMethodWorkPrep.MyChange(Sender: TObject);
var
  i: integer;
  FC: MethodWorkComboboxFilter.IFilter;
  Filter : String;
begin
  (Sender as TDBComboBoxEh).Hint:= (Sender as TDBComboBoxEh).Text;
  Filter:= '';

  for I := 0 to SG.ComponentCount - 1 do
    if (SG.Components[i].GetInterface(IID_IFilter, FC)) then
      if (FC.IsFiltered) then
        if Filter = '' then
          Filter := FC.GetQueryText
        else Filter:= Filter + ' AND ' +  FC.GetQueryText;
  //ShowMessage(Filter);
  dsPlanPrep.DataSet.Filter:= Filter;
  dsPlanPrep.DataSet.Filtered:= Filter <> '';

  UpdateStringGrid;
end;

procedure TfmMethodWorkPrep.MyEditButtons0Click1(Sender: TObject;
  var Handled: Boolean);
begin
  frmMethodWorkDateFilter:= TfrmMethodWorkDateFilter.CreateDialog(nil, self.Connection, nil);
  try
    frmMethodWorkDateFilter.IsModified:= true;
    case FEditors[2].TypeSign of
      bwEquals: frmMethodWorkDateFilter.RadioGroup1.ItemIndex:= 0;
      bwGrater:
        begin
          frmMethodWorkDateFilter.RadioGroup1.ItemIndex:= 1;
          frmMethodWorkDateFilter.DateTimePicker1.Date:= StrToDate(FEditors[2].TextField);
        end;
      bwLess:
        begin
          frmMethodWorkDateFilter.RadioGroup1.ItemIndex:= 2;
          frmMethodWorkDateFilter.DateTimePicker2.Date:= StrToDate(FEditors[2].TextField);
        end;
    end;
    if (frmMethodWorkDateFilter.ShowModal() = mrOk) then
    begin
      FEditors[2].TextField:= frmMethodWorkDateFilter.Str;
      case frmMethodWorkDateFilter.IK of
        0: begin
             FEditors[2].TypeSign:= bwEquals;
             FEditors[2].ItemIndex:= 0;
           end;
        1: begin
             FEditors[2].TypeSign:= bwGrater;
             FEditors[2].ItemIndex:= FEditors[2].Items.Add('> ' + frmMethodWorkDateFilter.Str);
           end;
        2: begin
             FEditors[2].TypeSign:= bwLess;
             FEditors[2].ItemIndex:= FEditors[2].Items.Add('< ' + frmMethodWorkDateFilter.Str);
           end;
      end;
    end;
  finally
    frmMethodWorkDateFilter.Free;
  end;
end;

procedure TfmMethodWorkPrep.MyEditButtons0Click3(Sender: TObject;
  var Handled: Boolean);
begin
  frmMethodWorkAddWorkInNorm:= TfrmMethodWorkAddWorkInNorm.CreateDialog(nil, self.Connection, nil);
  try
    frmMethodWorkAddWorkInNorm.Read(NULL);
    if (frmMethodWorkAddWorkInNorm.ShowModal() = mrOk) then
    begin
      FEditors[4].ItemIndex:= FEditors[4].Items.Add(frmMethodWorkAddWorkInNorm.Name);
    end;
  finally
    frmMethodWorkAddWorkInNorm.Free;
  end;
end;

procedure TfmMethodWorkPrep.MyKeyPress(Sender: TObject; var Key: Char);
begin
   Key :=#0;
   SysUtils.Beep;
end;

procedure TfmMethodWorkPrep.ReportProgress(Sender: TObject;
  CurrentStep: Integer; ProgressNote: string);
begin
  ShowMessage('следующий шаг');
end;

procedure TfmMethodWorkPrep.SGDblClick(Sender: TObject);
begin
  inherited;
  if ActEditToPlan.Enabled then
    ActEditToPlanExecute(ActEditToPlan);
end;

procedure TfmMethodWorkPrep.SGDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);

  procedure FormatNotSelectedCells(Grid : TStringGrid);
  var
    r : TRect;
    F: Word;
  begin
    if (gdSelected in State) or (gdFixed in State) then Exit;

    with Grid do
    begin
      if (Cells[0, ARow] <> '') and not(Assigned(GetRowEntry(ARow))) and (Cells[0, ARow] <> FACT_MSG){(Cells[0, ARow] <> 'План')} and (Cells[1, ARow] = '') then
      begin
        DefaultDrawing := false;
        if ACol = 0 then
        begin
          r := GetRect(0, Rect.Top, Rect.Bottom, ClientWidth);
          Canvas.Pen.Color := clRed;
          Canvas.Brush.Color := clBtnFace;
          Canvas.Font.Color := clBlue;
          Canvas.FillRect(r);
          Canvas.Rectangle(r);
          Canvas.TextOut(((r.Right - r.Left) div 2) - (Canvas.TextWidth(Cells[0, ARow]) div 2) - 1, r.Top + 1, Cells[0, ARow]);
        end;
      end
      else
      begin
        Canvas.Brush.Color:= clWindow;
        r:= Rect;
        Canvas.FillRect(Rect);
        if (ACol = 5) then
        begin
          r.Left:= r.Left+ 9;
          r.Top:= r.Top+ 9;
          r.Right := r.Right- 9;
          r.Bottom := r.Bottom - 9;

          //if Cells[ACol,ARow] = 'Издается' then
          if (Assigned(GetRowEntry(ARow))) and (GetRowEntry(ARow).IsEdition) then
		        F := DFCS_CHECKED
		      else
            F := DFCS_BUTTONCHECK;

          DrawFrameControl(Canvas.Handle, r, DFC_BUTTON, F);
        end
        else
        begin
          if (Assigned(GetRowEntry(ARow))) and (GetRowEntry(ARow).IsPlan) {and (Cells[0, ARow] = 'План')} and (Cells[1, ARow+1] <> '') and (StrToDateTime(Cells[1, ARow]) <= StrToDateTime(Cells[1, ARow+1])) then
            Canvas.Font.Color := clRed
          else
            if (Assigned(GetRowEntry(ARow))) and (GetRowEntry(ARow).IsPlan) {(Cells[0, ARow] = 'План')} and (Cells[1, ARow+1] <> '') and (StrToDateTime(Cells[1, ARow]) > StrToDateTime(Cells[1, ARow+1])) then
              Canvas.Font.Color := clGreen
            else
              Canvas.Font.Color := clWindowText;
          F:= DT_LEFT or DT_WORDBREAK or DT_TOP;
          r.Left:= r.Left+2;
          r.Top:= r.Top+2;
          r.Right := r.Right-2;
          r.Bottom := r.Bottom - 2;

          DrawText(Canvas.Handle,PChar(Cells[ACol,ARow]),length(Cells[ACol,ARow]),r,F);
        end;
      end;
    end;
  end;

var
  r: TRect;
  Grid : TStringGrid;
begin

  Grid :=  (Sender as TStringGrid);
  Grid.DefaultDrawing := true;

  // Установка ширины столбцов
  SetGridWidth(Grid);

  // Установка ширины редакторов
  SetEditorBounds(Grid);

  // Установить форматирование для фиксированных ячеек
  FormatFixedCells(ACol, State, Grid, ARow, Rect);

  // Установить форматирование не выделенных, не фиксированных ячеек
  FormatNotSelectedCells(Grid);

  // Установить форматирование выделенных ячеек
  FormatSelectedCells(Rect, ARow, State, ACol, Grid);

end;

procedure TfmMethodWorkPrep.SGMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  c,r: integer;
begin
  {if Y < SG.RowCount*SG.DefaultRowHeight then
  begin
  SG.MouseToCell(X, Y, C, R);
    if ((r <> 1) and (r <> 0)) then
    begin
      //Row := r;
      //Col := c;
      //Application.CancelHint;
      SG.Hint:= SG.Cells[c,r];
    end;
  end;}
end;

procedure TfmMethodWorkPrep.SGSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  inherited;
  (Sender as TStringGrid).Hint:= (Sender as TStringGrid).Cells[ACol,ARow];
  s:= ARow;
end;

procedure TfmMethodWorkPrep.UpdateStringGrid;
var
  i,j,f,k: integer;
  str: string;
begin

  ClearRowObjects;

  Assert(Assigned(FEditors[1]));
  for k := 0 to SG.ColCount-1 do
    for f := 2 to SG.RowCount-1 do
      SG.Cells[k,f]:= '';
  if dsPlanPrep.DataSet.RecordCount = 0 then
    SG.RowCount:= dsPlanPrep.DataSet.RecordCount + 3
  else SG.RowCount:= dsPlanPrep.DataSet.RecordCount + 2;
  i:= 2; //строка
  j:= 0; //столбец
  str:= '0';
  for k:= Low(PlanVolumeForMW) to High(PlanVolumeForMW) do
    PlanVolumeForMW[k]:= 0;

  k:= 0;
  f:= 0;
      dsPlanPrep.DataSet.First;
      while not dsPlanPrep.DataSet.Eof do
      begin
        if (Assigned(GetRowEntry(i-1))) and (GetRowEntry(i-1).IsPlan) and (dsPlanPrep.DataSet.FieldByName('Bit_plan_fact').AsBoolean)
           and (FEditors[1].ItemIndex <> 1) then
        begin
          SG.Cells[j,i]:= FACT_MSG; 
          SG.RowCount:= SG.RowCount + 1;
        end else
        if (dsPlanPrep.DataSet.FieldByName('cName_disc').AsString <> str)and(dsPlanPrep.DataSet.FieldByName('cName_disc').AsString <> '') then
        begin
          SG.Cells[j,i]:= dsPlanPrep.DataSet.FieldByName('cName_disc').AsString;
          str:= dsPlanPrep.DataSet.FieldByName('cName_disc').AsString;
          SG.RowCount:= SG.RowCount + 1;
        end
        else
        begin
          SG.Objects[j, i] := TPlanEntryViewRow.Create(dsPlanPrep.DataSet.FieldByName('Bit_plan_fact').AsBoolean, dsPlanPrep.DataSet.FieldByName('CurrentBitEdition').AsBoolean);
          if (dsPlanPrep.DataSet.FieldByName('PercentCompletion').Value <> NULL) and (dsPlanPrep.DataSet.FieldByName('IDMethodEditionPlan').Value = NULL) then
            GetRowEntry(i).Percent := dsPlanPrep.DataSet.FieldByName('PercentCompletion').AsInteger;
          SG.Cells[j,i] := GetRowEntry(i).GetFormatedRow;

          if GetRowEntry(i).IsPlan then
            inc(k)
          else  inc(f);

          SG.Cells[j+1,i]:= dsPlanPrep.DataSet.FieldByName('DateTransitionInState').AsString;
          SG.Cells[j+2,i]:= dsPlanPrep.DataSet.FieldByName('NameWarrant').AsString;
          SG.Cells[j+3,i]:= dsPlanPrep.DataSet.FieldByName('NameWork').AsString;
          SG.Cells[j+4,i]:= dsPlanPrep.DataSet.FieldByName('NameMethodEdition').AsString;
          SG.Cells[j+5,i] := GetRowEntry(i).GetFormatedRowEd;
          SG.Cells[j+6,i]:= dsPlanPrep.DataSet.FieldByName('IDMethodEdition').AsString;
          str:= dsPlanPrep.DataSet.FieldByName('cName_disc').AsString;
          dsPlanPrep.DataSet.Next;
        end;
        inc(i);
      end;
  if (Assigned(GetRowEntry(i-1))) and (GetRowEntry(i-1).IsPlan) and (FEditors[1].ItemIndex <> 1) then
  begin
    SG.RowCount:= SG.RowCount + 1;
    SG.Cells[j,i]:= FACT_MSG;
  end;

  PlanVolumeForMW:= TMethodWorkController.Instance.GetPlanVolumeForMW(dsPlanPrep.DataSet);
  Label7.Caption:= FloatToStrF(PlanVolumeForMW[0], ffFixed, 10, 2) + ' час.';
  Label5.Caption:= FloatToStrF(PlanVolumeForMW[1], ffFixed, 10, 2) + ' час.';
  Label12.Caption:= FloatToStrF(PlanVolumeForMW[2], ffFixed, 10, 2) + ' час.';
  Label17.Caption:= FloatToStrF(PlanVolumeForMW[3], ffFixed, 10, 2) + ' час.';
  if PlanVolumeForMW[0] > VolumeForMW then
    Label7.Font.Color:= clFuchsia
  else Label7.Font.Color:= clMaroon;
  if PlanVolumeForMW[1] > VolumeForMW then
    Label5.Font.Color:= clFuchsia
  else Label5.Font.Color:= clMaroon;
  Label9.Caption:= IntToStr(k);
  Label10.Caption:= IntToStr(f);
end;

procedure TfmMethodWorkPrep.SetGridWidth(Grid: TStringGrid);
var
  k: integer;
begin
  {if (GetWindowlong(SG.Handle, GWL_STYLE) and WS_VSCROLL) <> 0 then
    k := (Grid.Width - GetSystemMetrics(SM_CXVSCROLL)) div 30
  else} k := (Grid.ClientWidth div 30);
  Grid.ColWidths[0] := 2 * k;
  Grid.ColWidths[1] := 3 * k;
  Grid.ColWidths[2] := 3 * k;
  Grid.ColWidths[3] := 14 * k;
  {if (GetWindowlong(SG.Handle, GWL_STYLE) and WS_VSCROLL) <> 0 then
    Grid.ColWidths[4] := 6 * k + ((Grid.Width - GetSystemMetrics(SM_CXVSCROLL)) mod 30) - 10
  else} Grid.ColWidths[4] := 6 * k + (Grid.ClientWidth mod 30) - 5;
  Grid.ColWidths[5] := 2 * k;
end;

end.
