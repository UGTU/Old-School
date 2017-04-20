unit uNapr;

{ #Author sergdev@ist.ugtu.net }
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, DBCtrlsEh, StdCtrls, Mask, ActnList, Buttons,
  ExtCtrls, DBGridEh, DBLookupEh, DBTVStudObj, DBTVGroupObj, ComObj,
  ReportsBase, Barcode, ReportUI, ComCtrls, uWaitingController, System.Actions, UNaprExcelReport;

type
  TftmNapr = class(TfrmBaseDialog)
    Label1: TLabel;
    Label2: TLabel;
    dbdteOut: TDBDateTimeEditEh;
    dbdteTo: TDBDateTimeEditEh;
    Label4: TLabel;
    eNum: TDBNumberEditEh;
    Label5: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    dbcbeVidExam: TDBLookupComboboxEh;
    dbcbeDisc: TDBLookupComboboxEh;
    dbcbeNum: TDBNumberEditEh;
    cbPrintExcel: TCheckBox;
    cbBlankNapr: TCheckBox;
    procedure dbdteOutChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbcbeNumChange(Sender: TObject);
    procedure eNumChange(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actOKExecute(Sender: TObject);
    procedure cbPrintExcelClick(Sender: TObject);
    procedure ProgressBarReportControl1Complete(Sender: TObject);
    procedure WindowReportControlCollection1ProgressMessage(Sender: TObject;
      Step: Integer; StepNote: string; var Msg: string);
  private
    procedure ExecuteError(Sender: TObject; E: Exception);
    procedure LoadVedForNapr();

    { Private declarations }
  public
    studobj: TDBNodeStudObject; { Public declarations }
    procedure PrintNapr(ik_ved: Integer; EmptyNapr: boolean);

  end;



var
  ftmNapr: TftmNapr;

implementation

uses udm, uStudDlg, uMain, uDMUspevaemost, uDMUgtuStructure,
  ApplicationController;
{$R *.dfm}

function ChangeMonthDayPlaces(date: TDateTime): string;
var
  s1: string;
begin
  result := DatetoStr(date);
  s1 := result;
  result[1] := s1[4];
  result[2] := s1[5];
  result[4] := s1[1];
  result[5] := s1[2];
end;

function CheckFields: boolean;
begin
  result := true;
  with ftmNapr do
  begin
    if (dbcbeVidExam.Text = '') or (dbcbeDisc.Text = '') or
      (dbdteOut.Text = '  .  .    ') or (dbdteTo.Text = '  .  .    ') then
      result := false
  end;
end;

procedure TftmNapr.dbdteOutChange(Sender: TObject);
begin
  eNumChange(Sender);
  if ((DayOfWeek(dbdteOut.value) = 2) or (DayOfWeek(dbdteOut.value) = 3)) then
    dbdteTo.value := dbdteOut.value + 4
  else
    dbdteTo.value := dbdteOut.value + 5;
  // dbdteto.Value:=dbdteOut.Value+2;
end;

procedure TftmNapr.FormShow(Sender: TObject);
begin
  TApplicationController.GetInstance.AddLogEntry
    ('Направление. Открыто окно выдачи направления ' + studobj.LastName);
  Caption := 'Направление ' + studobj.LastName;
  dbcbeVidExam.KeyValue := 1;
  dbdteOut.value := date;

  // проверка номера направления
  // выдает последний номер за вчерашнее число
  dmUspevaemost.adospGetNomerNapr.Active := false;
  with dmUspevaemost.adospGetNomerNapr.Parameters do
  begin
    clear;
    addParameter;
    items[0].value := Hint;
    addParameter;
    items[1].value := (studobj.Parent as TDBNodeGroupObject).ik;
  end;
  dmUspevaemost.adospGetNomerNapr.Active := true;
  // dmUspevaemost.adospGetNomerNapr.ExecProc;

  if dmUspevaemost.adospGetNomerNapr.RecordCount <> 0 then

    if dmUspevaemost.adospGetNomerNapr.Fields[0].AsString <> '' then
      eNum.Text := inttostr(dmUspevaemost.adospGetNomerNapr.Fields[0]
        .AsInteger + 1)
    else
      eNum.Text := '1';

  LoadVedForNapr;
  // dm.adodsVidOtch.Active:=true;
  dm.adodsVidExam.Active := true;

end;

procedure TftmNapr.LoadVedForNapr;
begin
  TApplicationController.GetInstance.AddLogEntry
    ('Направление. Загрузка списка ведомостей для выдачи направления за ' +
    dbcbeNum.Text + ' семестр.');
  dmUspevaemost.adospPredmStud.Active := false;
  if (dbcbeNum.Text <> '') then
  begin
    with dmUspevaemost.adospPredmStud.Parameters do
    begin
      clear;
      addParameter;
      items[0].value := studobj.StudGrupKey;
      addParameter;

      items[1].value := dbcbeNum.Text;
    end;
    dmUspevaemost.adospPredmStud.Open;
  end;
end;

procedure TftmNapr.dbcbeNumChange(Sender: TObject);
begin
  // if studobj=nil then exit;
  eNumChange(Sender);
  LoadVedForNapr;
end;

procedure TftmNapr.eNumChange(Sender: TObject);
begin

  if CheckFields then
  begin
    bbOk.Enabled := true;
    bbApply.Enabled := true;
  end
  else
  begin
    bbOk.Enabled := false;
    bbApply.Enabled := false;
  end;

end;

procedure TftmNapr.actApplyExecute(Sender: TObject);
begin
  TApplicationController.GetInstance.AddLogEntry
    ('Направление. Сохранение направления по ' +
    dmUspevaemost.adospPredmStud.FieldValues['NaprName']);
  dmUspevaemost.aspNapr.Active := false;

  with dmUspevaemost.aspNapr.Parameters do
  begin
    clear;
    addParameter;
    items[0].value := dbcbeNum.value;
    addParameter;
    items[1].value := dmUspevaemost.adospPredmStud.FieldValues['iK_disc'];
    addParameter;
    items[2].value := dmUspevaemost.adospPredmStud.FieldValues['ik_vid_zanyat'];
    // AddParameter;
    // items[3].Value:=null;
    addParameter;
    items[3].value := studobj.RecordbookKey;
    addParameter;
    items[4].value := dbdteOut.value;
    addParameter;
    items[5].value := dbdteTo.value;
    addParameter;
    items[6].value := dbcbeVidExam.KeyValue;
    addParameter;
    if eNum.Text = '' then
      items[7].value := ''
    else
      items[7].value := eNum.value;
    addParameter;
    addParameter;
    if Hint = '6' then
    begin
      items[8].value := ' ';
      items[9].value := '____________'
    end
    else
    begin
      items[9].value := ' ';
      items[8].value := '____________'
    end;
    addParameter;
    if dbcbeVidExam.KeyValue = 1 then
      items[10].value := '____________'
    else
      items[10].value := ' ';
    addParameter;
    if dbcbeVidExam.KeyValue = 2 then
      items[11].value := '____________'
    else
      items[11].value := ' ';
    addParameter;
    if dbcbeVidExam.KeyValue = 3 then
      items[12].value := '____________'
    else
      items[12].value := ' ';

    addParameter;
    addParameter;
    if dmUspevaemost.adospPredmStud.FieldValues['ik_vid_zanyat'] = 6 then
      items[13].value := '____________'
    else
      items[13].value := ' ';
    if (dmUspevaemost.adospPredmStud.FieldValues['ik_vid_zanyat'] = 7) or
      (dmUspevaemost.adospPredmStud.FieldValues['ik_vid_zanyat'] = 17) then
      items[14].value := '____________'
    else
      items[14].value := ' ';
    addParameter;
    items[15].value := dbcbeDisc.value;
  end;

  // try

  dmUspevaemost.aspNapr.Active := true;
  { except
    showmessage('Невозможно выдать направление!');
    exit;
    end; }
  TApplicationController.GetInstance.AddLogEntry
    ('Направление. Направление сохранено');

  // frmRepPreview.RvProject2.ExecuteReport('Report1');
  if cbPrintExcel.Checked then
    PrintNapr(dmUspevaemost.aspNapr.FieldByName('ik_ved').AsInteger,
      cbBlankNapr.Checked);

end;

procedure TftmNapr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ftmNapr.FreeOnRelease;
end;

procedure TftmNapr.actOKExecute(Sender: TObject);
begin
  actApplyExecute(Sender);
  close;

end;

procedure TftmNapr.cbPrintExcelClick(Sender: TObject);
begin
  if cbPrintExcel.Checked then
    cbBlankNapr.Enabled := true
  else
  begin
    cbBlankNapr.Enabled := false;
    cbBlankNapr.Checked := false;
  end;
end;

procedure TftmNapr.PrintNapr(ik_ved: Integer; EmptyNapr: boolean);
var
  Report: TReportBase;
begin
  TApplicationController.GetInstance.AddLogEntry
    ('Направление. Печать направления за ');
  Report := TReportBase.CreateReport(TNaprExcelReport);
  Report.FreeOnComplete := true;
  dmUspevaemost.adospSelNapr.Active := false;

  with dmUspevaemost.adospSelNapr.Parameters do
  begin
    clear;
    addParameter;
    items[0].value := ik_ved;
  end;
  dmUspevaemost.adospSelNapr.ExecProc;
  dmUspevaemost.adospSelNapr.Open;
  if dmUspevaemost.adospSelNapr.FieldByName('Ik_vid_exam').AsInteger <> 1 then
  begin
    if EmptyNapr then
      Report.ReportTemplate := ExtractFilePath(Application.ExeName) +
        'reports\new_napr_pust_с.XLT'
    else
      Report.ReportTemplate := ExtractFilePath(Application.ExeName) +
        'reports\new_napr_с.XLT';
    TNaprExcelReport(Report).ik_ved := ik_ved;
  end
  else
  begin
    // Report.OnExecuteError := ExecuteError;
    if EmptyNapr then
      Report.ReportTemplate := ExtractFilePath(Application.ExeName) +
        'reports\new_napr_pust.XLT'
    else
      Report.ReportTemplate := ExtractFilePath(Application.ExeName) +
        'reports\new_napr.XLT';
    TNaprExcelReport(Report).ik_ved := ik_ved;
  end;
  TWaitingController.GetInstance.Process(Report);

end;

procedure TftmNapr.ProgressBarReportControl1Complete(Sender: TObject);
begin
  inherited;
  // ProgressBar1.Visible := false;
end;

procedure TftmNapr.WindowReportControlCollection1ProgressMessage
  (Sender: TObject; Step: Integer; StepNote: string; var Msg: string);
begin
  inherited;
  Msg := StepNote;
end;

procedure TftmNapr.ExecuteError(Sender: TObject; E: Exception);
begin
  ShowMessage('Произошла ошибка при создании направления: ' + E.Message);
  (Sender as TReportBase).Quit;
end;


end.
