unit uNapr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, DBCtrlsEh, StdCtrls, Mask, ActnList, Buttons,
  ExtCtrls, DBGridEh, DBLookupEh, DBTVStudObj, DBTVGroupObj, ComObj,
  ReportsBase, Barcode, ReportUI, ComCtrls, uWaitingController, System.Actions,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh,
  DBAxisGridsEh, Data.DB, Vcl.Menus;

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
    dbgrdNapr: TDBGridEh;
    Label3: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label13: TLabel;
    dsPredmStud: TDataSource;
    dsNapr: TDataSource;
    ppmNaprGrid: TPopupMenu;
    actClose: TMenuItem;
    N93: TMenuItem;
    actAnnul: TMenuItem;
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
    procedure dbcbeDiscChange(Sender: TObject);
    procedure N92Click(Sender: TObject);
    procedure actCloseClick(Sender: TObject);
    procedure actAnnulClick(Sender: TObject);
  private
    FZachIK: Integer;
    FGrupIK: Integer;
    FFacIK: Integer;
    FStudGrupKey: Integer;

    procedure ExecuteError(Sender: TObject; E: Exception);
    procedure LoadVedForNapr();

    { Private declarations }
  public
    studobj: TDBNodeStudObject; { Public declarations }
    procedure PrintNapr(ik_ved: Integer; EmptyNapr: boolean);
    property ZachIK: Integer write FZachIK;
    property StudGrupKey: Integer write FStudGrupKey;
    property GrupIK: Integer write FGrupIK;
    property FacIK: Integer write FFacIK;
  end;


  private
    Fik_ved: Integer;
    function Getik_ved: Integer;
    procedure Setik_ved(value: Integer);

  protected
    procedure Execute; override;
    function GetTotalSteps: Integer; override;
    function GetTotalSteps: Integer; override;

  public
  end;

var
  ftmNapr: TftmNapr;

implementation

uses udm, uStudDlg, uMain, uDMUspevaemost, uDMUgtuStructure,
  ApplicationController, uUspevGroupController, uNaprClose;
{$R *.dfm}

function ChangeMonthDayPlaces(date: TDateTime): string;
var
  s1: string;
begin
begin
  result := DatetoStr(date);
  s1 := result;
  result[1] := s1[4];
  result[2] := s1[5];
  result[4] := s1[1];
end;


begin
begin
  result := true;
  with ftmNapr do
  begin
    if (dbcbeVidExam.Text = '') or (dbcbeDisc.Text = '') or
      (dbdteOut.Text = '  .  .    ') or (dbdteTo.Text = '  .  .    ') then
      result := false
end;

procedure TftmNapr.dbdteOutChange(Sender: TObject);
begin
begin
  eNumChange(Sender);
  if ((DayOfWeek(dbdteOut.value) = 2) or (DayOfWeek(dbdteOut.value) = 3)) then
    dbdteTo.value := dbdteOut.value + 4
  else
    dbdteTo.value := dbdteOut.value + 5;
end;

procedure TftmNapr.FormShow(Sender: TObject);
begin
begin
  TApplicationController.GetInstance.AddLogEntry
    ('Направление. Открыто окно выдачи направления ' + studobj.LastName);
  Caption := 'Направление ' + studobj.LastName;
  dbcbeVidExam.KeyValue := 1;


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

  dsPredmStud.DataSet := TUspevGroupController.Instance.GetContentDS
    (FStudGrupKey, FZachIK);
  dsNapr.DataSet := TUspevGroupController.Instance.GetNapravDS;


    if dmUspevaemost.adospGetNomerNapr.Fields[0].AsString <> '' then
      eNum.Text := inttostr(dmUspevaemost.adospGetNomerNapr.Fields[0]
        .AsInteger + 1)
    else

  // LoadVedForNapr;
  // dm.adodsVidOtch.Active:=true;
  dm.adodsVidExam.Active := true;

end;

procedure TftmNapr.LoadVedForNapr;
var
  cont: Integer;
begin
  if (dbcbeDisc.KeyValue = NULL) then
    cont := 0
  else
    cont := dbcbeDisc.KeyValue;
  TUspevGroupController.Instance.SetContentNaprav(cont);

  { TApplicationController.GetInstance.AddLogEntry
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
    dmUspevaemost.adospPredmStud.Active := true;
    end; }
end;

procedure TftmNapr.N92Click(Sender: TObject);
var
  vedIK: Integer;
begin
  if dbgrdNapr.SelectedRows.Count > 0 then
  begin
    vedIK := dsNapr.DataSet.FieldByName('ik_ved').AsInteger;
    // TUspevGroupController.Instance.CloseNapr(dsNapr.DataSet.FieldByName('ik_ved').AsInteger);
  end
  else
    ShowMessage('Выберите направление, которое необходимо удалить');
end;

procedure TftmNapr.dbcbeDiscChange(Sender: TObject);
begin
  LoadVedForNapr;
  eNumChange(Sender);
end;

procedure TftmNapr.dbcbeNumChange(Sender: TObject);
begin
  // if studobj=nil then exit;
  TUspevGroupController.Instance.SetNapravSemester(StrToInt(dbcbeNum.Text));
  LoadVedForNapr;
  eNumChange(Sender);
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

  actClose.Enabled := Assigned(dsNapr.DataSet) and (dsNapr.DataSet.Active) and
    (dsNapr.DataSet.RecordCount > 0);
  actAnnul.Enabled := Assigned(dsNapr.DataSet) and (dsNapr.DataSet.Active) and
    (dsNapr.DataSet.RecordCount > 0);
end;

procedure TftmNapr.actAnnulClick(Sender: TObject);
begin
  if dsNapr.DataSet.FieldByName('lClose').value = false then
  begin
    TUspevGroupController.Instance.AnnulNapr
      (dsNapr.DataSet.FieldByName('ik_ved').AsInteger);
  end
  else
    ShowMessage
      ('Невозможно аннулировать уже закрытое или аннулированное направление');
end;

procedure TftmNapr.actApplyExecute(Sender: TObject);
var
  vedIK: Integer;
begin
  TApplicationController.GetInstance.AddLogEntry
    ('Направление. Сохранение направления по ' + dbcbeDisc.Text +
    ' для студента ' + inttostr(FZachIK));

  vedIK := TUspevGroupController.Instance.AddNapr(dbcbeVidExam.KeyValue,
    StrToDateTime(dbdteOut.Text), StrToDateTime(dbdteTo.Text), eNum.Text,
    dbcbeVidExam.Text);

  eNumChange(Sender);

  { dmUspevaemost.adospPredmStud.FieldValues['NaprName']);
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
    if (dmUspevaemost.adospPredmStud.FieldValues['ik_vid_zanyat'] = 7) or
    items[14].value := '____________'
    else
    items[14].value := ' ';
    addParameter;
    items[15].value := dbcbeDisc.value;
    end; }

  // try

  { dmUspevaemost.aspNapr.Active := true;
    except
    showmessage('Невозможно выдать направление!');
    exit;
    end; }
  TApplicationController.GetInstance.AddLogEntry
    ('Направление. Направление сохранено');

  // frmRepPreview.RvProject2.ExecuteReport('Report1');
  if cbPrintExcel.Checked then
    PrintNapr( { dmUspevaemost.aspNapr.FieldByName('ik_ved').AsInteger } vedIK,
      cbBlankNapr.Checked);

end;

procedure TftmNapr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ftmNapr.FreeOnRelease;
end;

procedure TftmNapr.actCloseClick(Sender: TObject);
begin
  if dsNapr.DataSet.FieldByName('lClose').value = false then
  begin
    ftmNaprClose := TftmNaprClose.Create(self);
    ftmNaprClose.vedIK := dsNapr.DataSet.FieldByName('ik_ved').AsInteger;
    ftmNaprClose.ShowModal;
    ftmNaprClose.Free;
  end
  else
    ShowMessage
      ('Невозможно закрыть уже закрытое или аннулированное направление');
end;

procedure TftmNapr.actOKExecute(Sender: TObject);
begin
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
  { dmUspevaemost.adospSelNapr.Active:=false;

    with dmUspevaemost.adospSelNapr.Parameters do begin
    clear;
    clear;
    addParameter;
    end;
    dmUspevaemost.adospSelNapr.ExecProc;
    dmUspevaemost.adospSelNapr.Open; }
  if dsNapr.DataSet.FieldByName('Ik_vid_exam').AsInteger <> 1 then
  begin
  begin
    if EmptyNapr then
      Report.ReportTemplate := ExtractFilePath(Application.ExeName) +
    else
    else
      Report.ReportTemplate := ExtractFilePath(Application.ExeName) +
        'reports\new_napr_с.XLT';
  end
  end
  else
  begin
    if EmptyNapr then
    if EmptyNapr then
      Report.ReportTemplate := ExtractFilePath(Application.ExeName) +
    else
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
  inherited;
end;


procedure TftmNapr.WindowReportControlCollection1ProgressMessage
begin
  inherited;
  Msg := StepNote;
end;

procedure TftmNapr.ExecuteError(Sender: TObject; E: Exception);
begin
  ShowMessage('Произошла ошибка при создании направления: ' + E.Message);
  (Sender as TReportBase).Quit;
end;


begin
begin
end;

function TNaprExcelReport.GetTotalSteps: Integer;
begin
begin
end;


begin
begin
end;

procedure TNaprExcelReport.Execute;
procedure TNaprExcelReport.Execute;
var
  str: string;
begin
  inherited;
  inherited;
  NextStep(1, 'Загрузка данных');


  with dmUspevaemost.adospSelNapr.Parameters do
    clear;
    clear;
    addParameter;
  end;

  dmUspevaemost.adospSelNapr.ExecProc;
  dmUspevaemost.adospSelNapr.Open;


  // вывод только надписей для распечатки на готовом бланке
  // if BlankNapr then
  // begin
  // end;
  NextStep(2, 'Формирование бланка');


  if dmUspevaemost.adospSelNapr.FieldByName('ik_vid_zanyat').AsInteger = 6 then
  // Range['p13','p13'].Clear;
  begin
    Replace('#vid_zanyat#', 'экзамена');
    Replace('#v_z#', 'экзамена');
  end;

  if dmUspevaemost.adospSelNapr.FieldByName('ik_vid_zanyat').AsInteger = 7 then
  begin
  begin
    Replace('#vid_zanyat#', 'зачета');
  end;
  end;
  if (dmUspevaemost.adospSelNapr.FieldByName('ik_vid_zanyat').AsInteger > 7) and
    (dmUspevaemost.adospSelNapr.FieldByName('ik_vid_zanyat').AsInteger < 10)
  begin
  begin
    // Range['p13','p13'].Clear;
    // Range['l13','n13'].Clear;
    Replace('#vid_zanyat#', 'курсовой работы(проекта)');
  end;
  end;
  if dmUspevaemost.adospSelNapr.FieldByName('ik_vid_zanyat').AsInteger = 27 then
  begin
    // Range['p13','p13'].Clear;
    // Range['l13','n13'].Clear;
    Replace('#vid_zanyat#', 'практики');
    Replace('#v_z#', 'практики');


  NextStep(1, 'Формирование бланка');
  Replace('#fac#', dmUspevaemost.adospSelNapr.FieldByName('Cshort_name_fac')
    .AsString);
  // Replace('#dir_ins#',dmUspevaemost.adospSelNapr.FieldByName('dir_name').AsString);
  // Range['w12','w12'].Value2:= dmUspevaemost.adospSelNapr.FieldByName('cshort_vid_zanyat').AsString +' ('+
  // dmUspevaemost.adospSelNapr.FieldByName('SemHourCount').AsString+' ч.)';
  Replace('#dir_ins#', '');
  if dmUspevaemost.adospSelNapr.FieldByName('Ik_form_ed').AsInteger = 2 then
    // Range['k6','m6'].Clear
  else
  else
    Replace('#f_obuch#', 'очная');


  begin
  begin
    Replace('#vid_napr#', 'первичное');
    // Range['V8','W8'].Clear;
  end;
  end;
  NextStep(1, 'Формирование бланка');
  begin
  begin
    Replace('#vid_napr#', 'первичное на комиссию');
    // Range['V6','W6'].Clear;
  end;


  begin
  begin
    Replace('#vid_napr#', 'вторичное на комиссию');
    // Range['V6','W6'].Clear;
  end;

  NextStep(1, 'Формирование бланка');
  NextStep(1, 'Формирование бланка');
  //
  // if dmUspevaemost.adospSelNapr.FieldByName('Ik_vid_exam').AsInteger=0 then
  // begin
  // Range['V6','W6'].Clear;
  // Range['V8','W8'].Clear;
  // Range['V10','W10'].Clear;

  if dmUspevaemost.adospSelNapr.FieldByName('n_sem').AsInteger mod 2 = 1 then
  if dmUspevaemost.adospSelNapr.FieldByName('n_sem').AsInteger mod 2 = 1 then
    str := inttostr(dmUspevaemost.adospSelNapr.FieldByName('n_sem')
  else
  else
    str := inttostr(dmUspevaemost.adospSelNapr.FieldByName('n_sem')
      .AsInteger div 2);
  str := str + ' (' + inttostr(dmUspevaemost.adospSelNapr.FieldByName('n_sem')
    .AsInteger) + ' сем)';

  Replace('#group#', dmUspevaemost.adospSelNapr.FieldByName('Cname_grup')
  Replace('#group#', dmUspevaemost.adospSelNapr.FieldByName('Cname_grup')

  Replace('#disc#', dmUspevaemost.adospSelNapr.FieldByName('cname_disc')
  Replace('#disc#', dmUspevaemost.adospSelNapr.FieldByName('cname_disc')

  Replace('#StudName#', dmUspevaemost.adospSelNapr.FieldByName('NameStud')
  Replace('#StudName#', dmUspevaemost.adospSelNapr.FieldByName('NameStud')

  Replace('#zach#', dmUspevaemost.adospSelNapr.FieldByName('Nn_zach').AsString);
  Replace('#zach#', dmUspevaemost.adospSelNapr.FieldByName('Nn_zach').AsString);
  // Range['J20','J20'].Value2:=dmUspevaemost.adospSelNapr.FieldByName('Nn_zach').AsString;
  Replace('#dateVid#', dmUspevaemost.adospSelNapr.FieldByName('dD_vydano')

  NextStep(1, 'Формирование бланка');


  begin
  begin
    date := StrToDate(dmUspevaemost.adospSelNapr.FieldByName('dD_vydano')
      .AsString);
    // date:=date+4;
    // Replace('#dateEnd#',DateToStr(date));
  end;
  // else

  NextStep(1, 'Формирование бланка');

  if dmUspevaemost.adospSelNapr.FieldByName('lClose').AsBoolean then
  begin
  begin
    if dmUspevaemost.adospSelNapr.FieldByName('ik_vid_zanyat').AsInteger = 7
    then
      Replace('#Ocenca#', dmUspevaemost.adospSelNapr.FieldByName
    else
    else
      Replace('#Ocenca#', dmUspevaemost.adospSelNapr.FieldByName('Otsenca')


    Replace('#PrepName#', dmUspevaemost.adospSelNapr.FieldByName('PrepName')
      .AsString);
    Replace('#DateSdach#', dmUspevaemost.adospSelNapr.FieldByName('Dd_exam')
  end
  else
  begin
  begin
    Replace('#PrepName#', '');
    Replace('#Ocenca#', '');
  end;
  end;

  NextStep(2, 'Формирование бланка');

  { ActiveBarcodeApplet.AppletName := 'PDF417Ctrl1';
  { ActiveBarcodeApplet.AppletName := 'PDF417Ctrl1';
    ActiveBarcodeApplet.BarcodeHeader := TBarcodeReportHeader.Create;
    ActiveBarcodeApplet.BarcodeHeader.MajorVersion := 1;
    ActiveBarcodeApplet.BarcodeHeader.MinorVersion := 0;
    ActiveBarcodeApplet.BarcodeHeader.ObjectType := 1;
    ActiveBarcodeApplet.BarcodeHeader.OID := Fik_ved;

end;


