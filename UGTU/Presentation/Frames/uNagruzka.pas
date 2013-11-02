unit uNagruzka;
  {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseFrame, ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, ComObj,
  DBGridEh, DB, ADODB, ToolWin, ImgList, NagruzkaController, ActnList, Menus,
  GridsEh, DBCtrlsEh, DBLookupEh, Mask, GeneralController;

type
  TfmNagruzkaMain = class(TfmBase)
    PageControl1: TPageControl;
    tsFac: TTabSheet;
    dsSemesters: TDataSource;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actAdd: TAction;
    actDelete: TAction;
    actExport: TAction;
    PopupMenu2: TPopupMenu;
    actExportAllNagrByFaculty: TAction;
    actExportCompireYears: TAction;
    actExportAllFactNagrByDepartments: TAction;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton10: TToolButton;
    actOKToExportAllNagrByFaculty: TAction;
    Panel9: TPanel;
    Label6: TLabel;
    ProgressBar1: TProgressBar;
    actOKToExportCompireYears: TAction;
    actExportAllNagrByYearForStaffCalc: TAction;
    N5: TMenuItem;
    Bevel6: TBevel;
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel2: TBevel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    dbcbYearNagr: TDBLookupComboboxEh;
    dbcbTypeEd: TDBLookupComboboxEh;
    Panel5: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Bevel3: TBevel;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Label9: TLabel;
    dbcbYearOneCompire: TDBLookupComboboxEh;
    dbcbTypeEdCompire: TDBLookupComboboxEh;
    dbcbYearTwoCompire: TDBLookupComboboxEh;
    Label1: TLabel;
    dbcbeRepType: TDBComboBoxEh;
    dbcbeYearsRepType: TDBComboBoxEh;
    Label2: TLabel;
    Panel3: TPanel;
    Label3: TLabel;
    Label10: TLabel;
    Bevel1: TBevel;
    SpeedButton3: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Label11: TLabel;
    dbcbYearFact: TDBLookupComboboxEh;
    dbcbTypeEdFact: TDBLookupComboboxEh;
    dbcbeRepTypeFact: TDBComboBoxEh;
    actOKToExportAllFactNagr: TAction;
    Panel4: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    Bevel4: TBevel;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    dbcbePFOYear: TDBLookupComboboxEh;
    dbcbePFOEdType: TDBLookupComboboxEh;
    actOkToExportFPO: TAction;
    procedure actAddUpdate(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actExportAllNagrByFacultyExecute(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure actOKToExportAllNagrByFacultyExecute(Sender: TObject);
    procedure actOKToExportAllNagrByFacultyUpdate(Sender: TObject);
    procedure actExportCompireYearsExecute(Sender: TObject);
    procedure actOKToExportCompireYearsExecute(Sender: TObject);
    procedure actExportAllFactNagrByDepartmentsExecute(Sender: TObject);
    procedure actExportAllNagrByYearForStaffCalcExecute(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure actOKToExportCompireYearsUpdate(Sender: TObject);
    procedure actExportUpdate(Sender: TObject);
    procedure actOKToExportAllFactNagrExecute(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure actOkToExportFPOExecute(Sender: TObject);
    procedure actOkToExportFPOUpdate(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
  protected
    procedure DoRefreshFrame;override;
  public
    procedure Read;

  end;

var
  fmNagruzkaMain: TfmNagruzkaMain;

implementation

uses
  uMain, uNagruzkaUchOtdelMaster, DBTVSemesterNagrObj;

{$R *.dfm}

{ TfmNagruzkaMain }

procedure TfmNagruzkaMain.DoRefreshFrame;
begin
  inherited;
  Read;
end;

procedure TfmNagruzkaMain.PopupMenu2Popup(Sender: TObject);
begin
  inherited;
  Panel2.Visible:=false;
  Panel3.Visible:=false;
  Panel4.Visible:=false;
  Panel5.Visible:=false;
end;

procedure TfmNagruzkaMain.Read;
begin
  TGeneralController.Instance.InitializeLockupCB(@dbcbYearNagr, 'ik_year_uch_pl', 'big_year_value');
  TNagruzkaController.Directory.GetAllYears(@dbcbYearNagr.ListSource.DataSet, false, NULL);
  TGeneralController.Instance.InitializeLockupCB(@dbcbTypeEd, 'ik_type_ed', 'cName_type_ed');
  TNagruzkaController.Directory.GetAllPlanTypes(@dbcbTypeEd.ListSource.DataSet);
  TGeneralController.Instance.InitializeLockupCB(@dbcbTypeEd, 'ik_type_ed', 'cName_type_ed');
  TNagruzkaController.Directory.GetAllPlanTypes(@dbcbTypeEd.ListSource.DataSet);

  TGeneralController.Instance.InitializeLockupCB(@dbcbYearOneCompire, 'ik_year_uch_pl', 'big_year_value');
  TNagruzkaController.Directory.GetAllYears(@dbcbYearOneCompire.ListSource.DataSet, false, NULL);
  TGeneralController.Instance.InitializeLockupCB(@dbcbYearTwoCompire, 'ik_year_uch_pl', 'big_year_value');
  TNagruzkaController.Directory.GetAllYears(@dbcbYearTwoCompire.ListSource.DataSet, false, NULL);
  TGeneralController.Instance.InitializeLockupCB(@dbcbTypeEdCompire, 'ik_type_ed', 'cName_type_ed');
  TNagruzkaController.Directory.GetAllPlanTypes(@dbcbTypeEdCompire.ListSource.DataSet);

    TGeneralController.Instance.InitializeLockupCB(@dbcbYearFact, 'ik_year_uch_pl', 'big_year_value');
  TNagruzkaController.Directory.GetAllYears(@dbcbYearFact.ListSource.DataSet, false, NULL);
    TGeneralController.Instance.InitializeLockupCB(@dbcbTypeEdFact, 'ik_type_ed', 'cName_type_ed');
  TNagruzkaController.Directory.GetAllPlanTypes(@dbcbTypeEdFact.ListSource.DataSet);

 TGeneralController.Instance.InitializeLockupCB(@dbcbePFOYear, 'ik_year_uch_pl', 'big_year_value');
  TNagruzkaController.Directory.GetAllYears(@dbcbePFOYear.ListSource.DataSet, false, NULL);
  TGeneralController.Instance.InitializeLockupCB(@dbcbePFOEdType, 'ik_type_ed', 'cName_type_ed');
  TNagruzkaController.Directory.GetAllPlanTypes(@dbcbePFOEdType.ListSource.DataSet);
//  PageControl1.ActivePageIndex:= 0;
  dsSemesters.DataSet:= DataSet;
end;

procedure TfmNagruzkaMain.SpeedButton2Click(Sender: TObject);
begin
  Panel2.Visible:= false;
end;

procedure TfmNagruzkaMain.SpeedButton5Click(Sender: TObject);
begin
  Panel5.Visible:= false;
end;

procedure TfmNagruzkaMain.SpeedButton6Click(Sender: TObject);
begin
    Panel3.Visible:= false;

end;

procedure TfmNagruzkaMain.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  Panel4.Visible:= false;
  TNagruzkaController.PrintDepsPFONagr(dbcbePFOYear.KeyValue, dbcbePFOYear.Text, dbcbePFOEdType.KeyValue);
end;

procedure TfmNagruzkaMain.SpeedButton8Click(Sender: TObject);
begin
  Panel4.Visible:=false;

end;

procedure TfmNagruzkaMain.actAddUpdate(Sender: TObject);
begin
  (sender as TAction).Enabled:= true;
end;

procedure TfmNagruzkaMain.actExportAllFactNagrByDepartmentsExecute(Sender: TObject);
begin
  Panel3.Visible:= true;

end;

procedure TfmNagruzkaMain.actExportAllNagrByFacultyExecute(Sender: TObject);
begin
  Panel2.Visible:= true;
  Panel2.Tag:= 1;
end;

procedure TfmNagruzkaMain.actExportAllNagrByYearForStaffCalcExecute(
  Sender: TObject);
begin
  Panel4.Visible:= true;
end;

procedure TfmNagruzkaMain.actExportCompireYearsExecute(Sender: TObject);
begin
  Panel5.Visible:= true;
end;

procedure TfmNagruzkaMain.actExportUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= true;
end;

procedure TfmNagruzkaMain.actOKToExportAllFactNagrExecute(Sender: TObject);
var i:integer;
begin
  inherited;
    Panel3.Visible:= false;

    if dbcbeRepTypeFact.Text='год' then
      i:= 3 else
    if dbcbeRepTypeFact.Text='осенний семестр' then
      i:= 1 else
      i:= 2;
    TNagruzkaController.PrintFactDepsNagrForSemester(dbcbYearFact.KeyValue, dbcbYearFact.Text, i,dbcbTypeEdFact.KeyValue);
end;

procedure TfmNagruzkaMain.actOKToExportAllNagrByFacultyExecute(Sender: TObject);
var i:integer;
begin
  Panel2.Visible:= false;

  if dbcbeRepType.Text='осень и весна (план)' then
  TNagruzkaController.PrintPlanDepsNagrForSemesters(dbcbYearNagr.KeyValue, dbcbYearNagr.Text, dbcbTypeEd.KeyValue)
  else
  if dbcbeRepType.Text='сводный отчет' then
  TNagruzkaController.PrintFullDepsNagrForSemester(dbcbYearNagr.KeyValue, dbcbYearNagr.Text, dbcbTypeEd.KeyValue)
  else
  begin
    if dbcbeRepType.Text='год' then
      i:= 3 else
    if dbcbeRepType.Text='осенний семестр' then
      i:= 1 else
      i:= 2;
    TNagruzkaController.PrintDepsNagrForSemester(dbcbYearNagr.KeyValue, dbcbYearNagr.Text, i,dbcbTypeEd.KeyValue);
  end;
end;

procedure TfmNagruzkaMain.actOKToExportAllNagrByFacultyUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= (dbcbYearNagr.KeyValue <> NULL) and (dbcbTypeEd.KeyValue <> NULL);
end;

procedure TfmNagruzkaMain.actOKToExportCompireYearsExecute(Sender: TObject);
begin

  Panel5.Visible:= false;

  if dbcbeYearsRepType.Text='по видам нагрузки' then
  TNagruzkaController.PrintNagrComparison(dbcbYearOneCompire.KeyValue, dbcbYearTwoCompire.KeyValue, dbcbYearOneCompire.Text, dbcbYearTwoCompire.Text, dbcbTypeEdCompire.KeyValue)
  else
  if dbcbeYearsRepType.Text='по общей нагрузке' then
  TNagruzkaController.PrintNagrCommonComparison(dbcbYearOneCompire.KeyValue, dbcbYearTwoCompire.KeyValue, dbcbYearOneCompire.Text, dbcbYearTwoCompire.Text, dbcbTypeEdCompire.KeyValue)
  else
  if dbcbeYearsRepType.Text='по нагрузке штата' then
  TNagruzkaController.PrintNagrStaffComparison(dbcbYearOneCompire.KeyValue, dbcbYearTwoCompire.KeyValue, dbcbYearOneCompire.Text, dbcbYearTwoCompire.Text, dbcbTypeEdCompire.KeyValue)
  else
  if dbcbeYearsRepType.Text='по лекционной нагрузке' then
  TNagruzkaController.PrintNagrLectComparison(dbcbYearOneCompire.KeyValue, dbcbYearTwoCompire.KeyValue, dbcbYearOneCompire.Text, dbcbYearTwoCompire.Text, dbcbTypeEdCompire.KeyValue)
  else
  TNagruzkaController.PrintNagrDepsComparison(dbcbYearOneCompire.KeyValue, dbcbYearTwoCompire.KeyValue, dbcbYearOneCompire.Text, dbcbYearTwoCompire.Text, dbcbTypeEdCompire.KeyValue)

end;

procedure TfmNagruzkaMain.actOKToExportCompireYearsUpdate(Sender: TObject);
begin
(Sender as TAction).Enabled:= (dbcbYearOneCompire.KeyValue <> NULL) and (dbcbYearTwoCompire.KeyValue <> NULL) and (dbcbTypeEdCompire.KeyValue<> NULL);
end;

procedure TfmNagruzkaMain.actOkToExportFPOExecute(Sender: TObject);
begin
  Panel4.Visible:= false;
  TNagruzkaController.PrintDepsPFONagr(dbcbePFOYear.KeyValue, dbcbePFOYear.text, dbcbePFOEdType.KeyValue)

end;

procedure TfmNagruzkaMain.actOkToExportFPOUpdate(Sender: TObject);
begin
  inherited;
(Sender as TAction).Enabled:= (dbcbePFOYear.KeyValue <> NULL) and (dbcbePFOEdType.KeyValue <> NULL);
end;

procedure TfmNagruzkaMain.DBGridEh1DblClick(Sender: TObject);
var
  i, semIK, yearIK: integer;
begin
  if (DBGridEh1.DataSource.DataSet <> nil) then
  if  DBGridEh1.DataSource.DataSet.Active then
  begin
    DBGridEh1.DataSource.DataSet.DisableControls;
    try
      semIK:= DBGridEh1.DataSource.DataSet.FieldByName('ik_sem_type').AsInteger;
      yearIK:= DBGridEh1.DataSource.DataSet.FieldByName('ik_year_uch_pl').AsInteger;
      frmMain.DBDekTreeView_TEST1.Selected.Expand(false);
      for i:=0 to (frmMain.DBDekTreeView_TEST1.Selected.Count-1) do
        if ((TDBNodeSemesterNagrObject(frmMain.DBDekTreeView_TEST1.Selected.Item[i].Data).IK_Semtype = semIK) and
        (TDBNodeSemesterNagrObject(frmMain.DBDekTreeView_TEST1.Selected.Item[i].Data).IK_Year = yearIK)) then
        begin
          frmMain.DBDekTreeView_TEST1.Selected.Item[i].Selected:=true;
          break;
        end;
    finally
      DBGridEh1.DataSource.DataSet.EnableControls;
    end;
  end;
end;

procedure TfmNagruzkaMain.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    DBGridEh1DblClick(DBGridEh1);
end;

end.
