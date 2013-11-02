unit uUni;
  {#Author sergdev@ist.ugtu.net}
interface
//{$DEFINE ALPHA}
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseFrame, StdCtrls, ExtCtrls, DB, Grids, DBGridEh, ADODB,
  ComCtrls, Buttons, ImgList, GridsEh, Spin, ToolWin, DateUtils,
  ReportsBase, uWaitingForm, D_FacItogiRep, uWaitingController, Menus, ActnList, D_AcademReport,
  uAcademFrame, uAverageBalls, DBTVSpecObj, DBTVGroupObj;

type
  TfmUni = class(TfmBase)
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    PageControl1: TPageControl;
    tsFacList: TTabSheet;
    DBGridEh1: TDBGridEh;
    ImageList1: TImageList;
    tsItogi: TTabSheet;
    ToolBar1: TToolBar;
    SpeedButton2: TSpeedButton;
    ToolButton3: TToolButton;
    SpeedButton1: TSpeedButton;
    ToolButton2: TToolButton;
    cbSemestr: TComboBox;
    ToolButton4: TToolButton;
    spYear: TSpinEdit;
    dbgrItogi: TDBGridEh;
    tsCont: TTabSheet;
    ToolBar2: TToolBar;
    tbSortStud: TToolButton;
    ppmSortMenu: TPopupMenu;
    miAll: TMenuItem;
    miCur: TMenuItem;
    MiEx: TMenuItem;
    miAcadem: TMenuItem;
    alUni: TActionList;
    actSort: TAction;
    tsAcadem: TTabSheet;
    dbgeStudents: TDBGridEh;
    actExcelExport: TAction;
    fmAcadem: TfmAcadem;
    tsAverageBalls: TTabSheet;
    fmAverageBallsUni: TfmAverageBalls;
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure actSortExecute(Sender: TObject);
    procedure miAllClick(Sender: TObject);
    procedure actExcelExportExecute(Sender: TObject);
    procedure DBGridEh2TitleClick(Column: TColumnEh);
    procedure FrameEnter(Sender: TObject);
  protected
     CurrentSort :string;

     procedure DoCreate; override;
     procedure DoRefreshFrame; override;
  end;

var
  fmUni: TfmUni;

implementation

uses uDM, uDMStudentData, uMain, uDmUspevaemost;

{$R *.dfm}

procedure TfmUni.DoCreate;
begin
//  inherited CreateFrame(AOwner, AObject, AConn);
  //создание фрейма: conn - связь с базой данных,
  Modified:=false;
  ADOTable1.Connection:=Connection;
  //загружаем список справочников
  ADOTable1.Active:=true;
  ADOTable1.First;
  PageControl1.TabIndex:= 0;
  CurrentSort := 'Все студенты';
end;

procedure TfmUni.actExcelExportExecute(Sender: TObject);
var Report:TAcademReport;
begin
dmStudentData.adodsAcadem.DisableControls;
Report := TAcademReport.Create(nil, dmStudentData.adodsAcadem);
  //Report.FreeOnComplete := true;
  Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\AcademReport.xlt';
  // Начать построение отчёта

  TWaitingController.GetInstance.Process(Report);
  dmStudentData.adodsAcadem.EnableControls;
  Report.Show;
  Report.Free;
end;

procedure TfmUni.actSortExecute(Sender: TObject);
begin
  actSort.Caption := CurrentSort;

  with dmStudentData.adodsAllStud do
  begin
  Active := false;
  CommandType:=cmdText;
  CommandText:='select * from Cont';

  if miEx.Checked then
    CommandText:=CommandText+' Where (ikTypePricOtch=''2'' )' else
  if miCur.Checked then
    CommandText:=CommandText+' Where (Ik_prikazOtch IS NULL)' else
  if miAcadem.Checked then
    CommandText:=CommandText+' Where (ikTypePricOtch=''3'')';

  CommandText:=CommandText+'Order by NameStud' ;
  Active:=true;
  end;
end;

procedure TfmUni.DBGridEh1DblClick(Sender: TObject);
begin
  inherited;
  SelectInTree(DBGridEh1.Row);
end;

procedure TfmUni.DBGridEh2TitleClick(Column: TColumnEh);
begin

dmStudentData.adodsAcadem.Sort:='['+Column.Field.FieldName+']';
end;

procedure TfmUni.DoRefreshFrame;
begin
  inherited;             
  ADOTable1.Active:=false;
  ADOTable1.Active:=true;
  ADOTable1.First;
  PageControl1Change(self);
end;

procedure TfmUni.FrameEnter(Sender: TObject);
begin
  PageControl1Change(self);
end;

procedure TfmUni.miAllClick(Sender: TObject);
begin
actSortExecute(Sender);
end;

procedure TfmUni.PageControl1Change(Sender: TObject);
begin
  inherited;
  if PageControl1.ActivePage = tsItogi then
  begin
     cbSemestr.ItemIndex:=0;
     spYear.MaxValue:=YearOf(Date());
     if (MonthOf(date())<6) then
     begin
        spYear.Value:=YearOf(Date())-1;
        cbSemestr.ItemIndex:=1;
     end
     else
     begin
        spYear.Value:=YearOf(Date());
        cbSemestr.ItemIndex:=0;
     end

  end;

  if PageControl1.ActivePage = tsCont then
  begin
    dmStudentData.adodsAllStud.Active := false;
    dmStudentData.adodsAllStud.CommandText:='select * from Cont';
    dmStudentData.adodsAllStud.Active := true;
  end;

  if PageControl1.ActivePage = tsAcadem then
  begin
    dmStudentData.adodsAcadem.Active := false;
    dmStudentData.adodsAcadem.CommandText:='select * from AcademStud';
    dmStudentData.adodsAcademStringField11.Visible:=true;
    dmStudentData.adodsAcadem.Active := true;
    frmMain.Comment('Студенты в академическом отпуске', 'Отпусков: '+inttostr(dmStudentData.adodsAcadem.RecordCount));
    fmAcadem.FrameLevel := 1;
    fmAcadem.FrameObject := FrameObject;
  end;

  if PageControl1.ActivePage = tsAverageBalls then
  begin
    frmMain.Comment('Средние баллы студентов', '');
    fmAverageBallsUni.FrameType:=1;
    fmAverageBallsUni.FrameObject := FrameObject;
    fmAverageBallsUni.ShowStudents := ssShowActualOnly;
    fmAverageBallsUni.StudyYears:= 6;
    fmAverageBallsUni.ShowActualGroup := true;

    fmAverageBallsUni.FillListView;
  end;

end;

procedure TfmUni.SpeedButton1Click(Sender: TObject);
var
  Report:TReportBase;
begin
    Report := TReportBase.CreateReport(TFacItogiExcelReport);
    Report.FreeOnComplete := true;
    //Report.OnExecuteError := ExecuteError;
    Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\Itogi.XLT';
    TFacItogiExcelReport(Report).ikFac:= 0;
    TFacItogiExcelReport(Report).Year:= spYear.Value;
    TFacItogiExcelReport(Report).nSem:= cbSemestr.ItemIndex;

    TWaitingController.GetInstance.Process(Report);

end;

end.
