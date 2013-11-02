unit uAcademFrame;
  {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseFrame, StdCtrls, Buttons, ExtCtrls, uDMStudentData, uWaitingController, Menus, ActnList, D_AcademReport,
  GridsEh, DBGridEh, ComCtrls, ToolWin, DBTVFacObj, DBTVSpecObj, uMain, uAcadem, udmPrikaz, udmCauses, udmUGTUStructure;

type
  TfmAcadem = class(TfmBase)
    tbAcadem: TToolBar;
    tbPrint: TToolButton;
    dbgeAcadem: TDBGridEh;
    ActionList1: TActionList;
    actReportToExcel: TAction;
    actEditAcadem: TAction;
    tbEditAcadem: TToolButton;
    ppmAcadem: TPopupMenu;
    actEditAcadem1: TMenuItem;
    procedure actReportToExcelExecute(Sender: TObject);
    procedure dbgeAcademTitleClick(Column: TColumnEh);
    procedure actEditAcademExecute(Sender: TObject);
  private
    { Private declarations }
    CurrentSort: string;
  public
    FrameLevel :integer;
    { Public declarations }
  end;

var
  fmAcadem: TfmAcadem;

implementation

uses uDMStudentSelectionProcs;

{$R *.dfm}

procedure TfmAcadem.actEditAcademExecute(Sender: TObject);
begin
 frmAcademStud:=tfrmAcademStud.Create(self);
 frmAcademStud.EditMode:=true;

 with dmStudentData.adodsAcadem do
 begin

   dmPrikaz.adodsPrikaz.Active:=true;
   dmCauses.adodsAcademCause.Active:=true;
   dmUgtuStructure.adodsFaculty.Active:=true;

   frmAcademStud.RecordBookKey:=FieldByName('ik_zach').Value;
   frmAcademStud.CategoryId:=FieldByName('ik_kat_zach').Value;
   frmAcademStud.ik_group:=FieldByName('ik_grup').Value;

   frmAcademStud.dbcbeNumPrik.KeyValue := FieldByName('ik_prikaz').Value;
   frmAcademStud.dbcbeCause.KeyValue := FieldByName('ik_pric').Value;
   frmAcademStud.cbFreeAt.Checked := FieldByName('IsFreeAttendance').Value;

   frmAcademStud.eOtchObosn.text := FieldByName('cObosnOtch').Value;
   frmAcademStud.dbcbeFac.KeyValue := FieldByName('ik_fac').Value;
   frmAcademStud.dbcbeSpec.KeyValue := FieldByName('ik_spec').Value;
   frmAcademStud.dbcbeGroup.KeyValue :=  FieldByName('ik_newgrup').Value;;

   frmAcademStud.dbdteBegin.Value := FieldByName('Дата начала').Value;
   frmAcademStud.dbdteEnd.Value := FieldByName('Дата окончания').Value;
   frmAcademStud.dbdteLearn.Value := FieldByName('Дата выхода на учебу').Value;
   end;

   frmAcademStud.Showmodal;
   frmAcademStud.Free;
   dmStudentData.adodsAcadem.Close;
   dmStudentData.adodsAcadem.Open;

end;

procedure TfmAcadem.actReportToExcelExecute(Sender: TObject);
var Report:TAcademReport;
begin
dmStudentData.adodsAcadem.DisableControls;

  if FrameLevel = 1 then
  begin
    Report := TAcademReport.Create(nil, dmStudentData.adodsAcadem);
    Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\AcademReport.xlt';
  end;

  if FrameLevel = 2 then
  begin
    Report := TAcademReport.CreateFull(nil, dmStudentData.adodsAcadem, TDBNodeFacultyObject(FrameObject).Name, DateToStr(Date));
    Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\AcademReportFac.xlt';
  end;

   if FrameLevel = 3 then
  begin
    Report := TAcademReport.CreateFull(nil, dmStudentData.adodsAcadem, TDBNodeSpecObject(FrameObject).Name, DateToStr(Date));
    Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\AcademReportSpec.xlt';
  end;

  // Начать построение отчёта

  TWaitingController.GetInstance.Process(Report);
  dmStudentData.adodsAcadem.EnableControls;
  Report.Show;
  Report.Free;
end;

procedure TfmAcadem.dbgeAcademTitleClick(Column: TColumnEh);
var Sort:string;
begin
Sort:='['+Column.Field.FieldName+'] ASC';
if CurrentSort<>Sort then
begin
dmStudentData.adodsAcadem.Sort:=Sort;
CurrentSort:=Sort;
end
else
begin
dmStudentData.adodsAcadem.Sort:='['+Column.Field.FieldName+']'+' DESC';
CurrentSort:='['+Column.Field.FieldName+']'+' DESC';
end;


end;

end.
