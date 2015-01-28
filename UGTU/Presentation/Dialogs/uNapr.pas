unit uNapr;

{ #Author sergdev@ist.ugtu.net }
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
    FZachIK: integer;
    FGrupIK: integer;
    FFacIK: integer;
    FStudGrupKey: integer;

    procedure ExecuteError(Sender: TObject; E: Exception);
    procedure LoadVedForNapr();

    { Private declarations }
  public
    studobj: TDBNodeStudObject; { Public declarations }
    procedure PrintNapr(ik_ved: Integer; EmptyNapr: boolean);
    property  ZachIK: integer write FZachIK;
    property StudGrupKey: integer write FStudGrupKey;
    property  GrupIK: integer write FGrupIK;
    property FacIK: integer write FFacIK;
  end;

  TNaprExcelReport = class(TExcelReportBase)
  private
    Fik_ved: Integer;
    function Getik_ved: Integer;
    procedure Setik_ved(value: Integer);

  protected
    procedure Execute; override;
    function GetTotalSteps: Integer; override;
    property ik_ved: Integer read Getik_ved write Setik_ved;

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
    items[0].value := FFacIK;
    addParameter;
    items[1].value := (studobj.Parent as TDBNodeGroupObject).ik;
  end;
  dmUspevaemost.adospGetNomerNapr.Active := true;
  // dmUspevaemost.adospGetNomerNapr.ExecProc;

  dsPredmStud.DataSet := TUspevGroupController.Instance.GetContentDS(FStudGrupKey, FZachIK);
  dsNapr.DataSet := TUspevGroupController.Instance.GetNapravDS;


  if dmUspevaemost.adospGetNomerNapr.RecordCount <> 0 then
    if dmUspevaemost.adospGetNomerNapr.Fields[0].AsString <> '' then
      eNum.Text := inttostr(dmUspevaemost.adospGetNomerNapr.Fields[0]
        .AsInteger + 1)
    else
      eNum.Text := '1';



  //LoadVedForNapr;
  // dm.adodsVidOtch.Active:=true;
  dm.adodsVidExam.Active := true;

end;

procedure TftmNapr.LoadVedForNapr;
var cont: integer;
begin
  if (dbcbeDisc.KeyValue = NULL) then cont := 0
    else cont:= dbcbeDisc.KeyValue;
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
  end;               }
end;


procedure TftmNapr.N92Click(Sender: TObject);
var vedIK: integer;
begin
  if dbgrdNapr.SelectedRows.Count>0 then
  begin
    vedIK := dsNapr.DataSet.FieldByName('ik_ved').AsInteger;
    //TUspevGroupController.Instance.CloseNapr(dsNapr.DataSet.FieldByName('ik_ved').AsInteger);
  end
  else ShowMessage('Выберите направление, которое необходимо удалить');
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

  actClose.Enabled := Assigned(dsNapr.DataSet)and(dsNapr.DataSet.Active)and(dsNapr.DataSet.RecordCount>0);
  actAnnul.Enabled := Assigned(dsNapr.DataSet)and(dsNapr.DataSet.Active)and(dsNapr.DataSet.RecordCount>0);
end;

procedure TftmNapr.actAnnulClick(Sender: TObject);
begin
  if dsNapr.DataSet.FieldByName('lClose').Value=False then
  begin
    TUspevGroupController.Instance.AnnulNapr(dsNapr.DataSet.FieldByName('ik_ved').AsInteger);
  end else ShowMessage('Невозможно аннулировать уже закрытое или аннулированное направление');
end;

procedure TftmNapr.actApplyExecute(Sender: TObject);
var VedIK: integer;
begin
  TApplicationController.GetInstance.AddLogEntry
    ('Направление. Сохранение направления по ' +
    dbcbeDisc.Text + ' для студента ' + IntToStr(FZachIK));

  VedIK := TUspevGroupController.Instance.AddNapr(dbcbeVidExam.KeyValue, StrToDateTime(dbdteOut.Text),
      StrToDateTime(dbdteTo.Text), eNum.Text, dbcbeVidExam.Text);

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
      (dmUspevaemost.adospPredmStud.FieldValues['ik_vid_zanyat'] = 17) then
      items[14].value := '____________'
    else
      items[14].value := ' ';
    addParameter;
    items[15].value := dbcbeDisc.value;
  end;     }

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
    PrintNapr({dmUspevaemost.aspNapr.FieldByName('ik_ved').AsInteger}VedIK,
      cbBlankNapr.Checked);

end;

procedure TftmNapr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ftmNapr.FreeOnRelease;
end;

procedure TftmNapr.actCloseClick(Sender: TObject);
begin
  if dsNapr.DataSet.FieldByName('lClose').Value=False then
  begin
    ftmNaprClose := TftmNaprClose.Create(self);
    ftmNaprClose.VedIK := dsNapr.DataSet.FieldByName('ik_ved').AsInteger;
    ftmNaprClose.ShowModal;
    ftmNaprClose.Free;
  end else ShowMessage('Невозможно закрыть уже закрытое или аннулированное направление');
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
    TApplicationController.GetInstance.AddLogEntry('Направление. Печать направления за ');
    Report := TReportBase.CreateReport(TNaprExcelReport);
    Report.FreeOnComplete := true;
      dmUspevaemost.adospSelNapr.Active:=false;

  with dmUspevaemost.adospSelNapr.Parameters do begin
    clear;
    AddParameter;
    items[0].Value:=ik_ved;
  end;
  dmUspevaemost.adospSelNapr.ExecProc;
  dmUspevaemost.adospSelNapr.Open;
  if dmUspevaemost.adospSelNapr.FieldByName('Ik_vid_exam').AsInteger<>1 then
  begin
      if EmptyNapr then
      Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\new_napr_pust_с.XLT'
    else
      Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\new_napr_с.XLT';
    TNaprExcelReport(Report).ik_ved:= ik_ved;
  end
    else
    begin
    //Report.OnExecuteError := ExecuteError;
    if EmptyNapr then
      Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\new_napr_pust.XLT'
    else
      Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\new_napr.XLT';
    TNaprExcelReport(Report).ik_ved:= ik_ved;
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

function TNaprExcelReport.Getik_ved: Integer;
begin
  result := Fik_ved;
end;

function TNaprExcelReport.GetTotalSteps: Integer;
begin
  result := 10;
end;

procedure TNaprExcelReport.Setik_ved(value: Integer);
begin
  Fik_ved := value;
end;

procedure TNaprExcelReport.Execute;
var
  date: TDateTime;
  str: string;
begin
  inherited;
  NextStep(1, 'Загрузка данных');
  dmUspevaemost.adospSelNapr.Active := false;

  with dmUspevaemost.adospSelNapr.Parameters do
  begin
    clear;
    addParameter;
    items[0].value := Fik_ved;
  end;

  dmUspevaemost.adospSelNapr.ExecProc;
  dmUspevaemost.adospSelNapr.Open;

  // вывод только надписей для распечатки на готовом бланке
  // if BlankNapr then
  // begin
  // end;
  NextStep(2, 'Формирование бланка');
  Replace('#Num#', dmUspevaemost.adospSelNapr.FieldByName('cNumber_ved')
    .AsString);

  if dmUspevaemost.adospSelNapr.FieldByName('ik_vid_zanyat').AsInteger = 6 then
  // Range['p13','p13'].Clear;
  begin
    Replace('#vid_zanyat#', 'экзамена');
    Replace('#v_z#', 'экзамена');
  end;
  if dmUspevaemost.adospSelNapr.FieldByName('ik_vid_zanyat').AsInteger=7 then
//    Range['l13','n13'].Clear;
begin
Replace('#vid_zanyat#','зачета');
Replace('#v_z#','зачета');
end ;
  if (dmUspevaemost.adospSelNapr.FieldByName('ik_vid_zanyat').AsInteger>7)
  and (dmUspevaemost.adospSelNapr.FieldByName('ik_vid_zanyat').AsInteger<10) then
  // Range['l13','n13'].Clear;
  begin
    Replace('#vid_zanyat#', 'зачета');
    Replace('#v_z#', 'зачета');
   if dmUspevaemost.adospSelNapr.FieldByName('ik_vid_zanyat').AsInteger=27 then
  begin
//    Range['p13','p13'].Clear;
//    Range['l13','n13'].Clear;
Replace('#vid_zanyat#','практики');
Replace('#v_z#','практики');
  end;
  end;

  NextStep(1, 'Формирование бланка');
  Replace('#fac#', dmUspevaemost.adospSelNapr.FieldByName('Cshort_name_fac')
    .AsString);
  Replace('#dir_ins#', dmUspevaemost.adospSelNapr.FieldByName('dir_name')
    .AsString);
  // Range['w12','w12'].Value2:= dmUspevaemost.adospSelNapr.FieldByName('cshort_vid_zanyat').AsString +' ('+
  // dmUspevaemost.adospSelNapr.FieldByName('SemHourCount').AsString+' ч.)';

  if dmUspevaemost.adospSelNapr.FieldByName('Ik_form_ed').AsInteger = 2 then
    // Range['k6','m6'].Clear
    Replace('#f_obuch#', 'заочная')
  else
    Replace('#f_obuch#', 'очная');
  // Range['n6','o6'].Clear;

  if dmUspevaemost.adospSelNapr.FieldByName('Ik_vid_exam').AsInteger = 1 then
  begin
    Replace('#vid_napr#', 'первичное');
    // Range['V8','W8'].Clear;
    // Range['V10','W10'].Clear;
  end;
  NextStep(1, 'Формирование бланка');
  if dmUspevaemost.adospSelNapr.FieldByName('Ik_vid_exam').AsInteger = 2 then
  begin
    Replace('#vid_napr#', 'первичное на комиссию');
    // Range['V6','W6'].Clear;
    // Range['V10','W10'].Clear;
  end;

  if dmUspevaemost.adospSelNapr.FieldByName('Ik_vid_exam').AsInteger = 3 then
  begin
    Replace('#vid_napr#', 'вторичное на комиссию');
    // Range['V6','W6'].Clear;
    // Range['V8','W8'].Clear;
  end;

  NextStep(1, 'Формирование бланка');
  //
  // if dmUspevaemost.adospSelNapr.FieldByName('Ik_vid_exam').AsInteger=0 then
  // begin
  // Range['V6','W6'].Clear;
  // Range['V8','W8'].Clear;
  // Range['V10','W10'].Clear;
  // end;

  if dmUspevaemost.adospSelNapr.FieldByName('n_sem').AsInteger mod 2 = 1 then
    str := inttostr(dmUspevaemost.adospSelNapr.FieldByName('n_sem')
      .AsInteger div 2 + 1)
  else
    str := inttostr(dmUspevaemost.adospSelNapr.FieldByName('n_sem')
      .AsInteger div 2);
  str := str + ' (' + inttostr(dmUspevaemost.adospSelNapr.FieldByName('n_sem')
    .AsInteger) + ' сем)';
  Replace('#sem#', str);

  Replace('#group#', dmUspevaemost.adospSelNapr.FieldByName('Cname_grup')
    .AsString);

  Replace('#disc#', dmUspevaemost.adospSelNapr.FieldByName('cname_disc')
    .AsString);

  Replace('#StudName#', dmUspevaemost.adospSelNapr.FieldByName('NameStud')
    .AsString);

  Replace('#zach#', dmUspevaemost.adospSelNapr.FieldByName('Nn_zach').AsString);
  // Range['J20','J20'].Value2:=dmUspevaemost.adospSelNapr.FieldByName('Nn_zach').AsString;
  Replace('#dateVid#', dmUspevaemost.adospSelNapr.FieldByName('dD_vydano')
    .AsString);

  NextStep(1, 'Формирование бланка');

  if dmUspevaemost.adospSelNapr.FieldByName('dD_vydano').AsString <> '' then
  begin
    date := StrToDate(dmUspevaemost.adospSelNapr.FieldByName('dD_vydano')
      .AsString);
    date := date + 4;
    Replace('#dateEnd#', DatetoStr(date));
  end
  else
    Replace('#dateEnd#', '');

  NextStep(1, 'Формирование бланка');

  if dmUspevaemost.adospSelNapr.FieldByName('lClose').AsBoolean then
  begin
    if dmUspevaemost.adospSelNapr.FieldByName('ik_vid_zanyat').AsInteger = 7
    then
      Replace('#Ocenca#', dmUspevaemost.adospSelNapr.FieldByName
        ('Name_osenca').AsString)
    else
      Replace('#Ocenca#', dmUspevaemost.adospSelNapr.FieldByName('Otsenca')
        .AsString);

    Replace('#PrepName#', dmUspevaemost.adospSelNapr.FieldByName('PrepName')
      .AsString);
    Replace('#DateSdach#', dmUspevaemost.adospSelNapr.FieldByName('Dd_exam')
      .AsString);
  end
  else
  begin
    Replace('#PrepName#', '');
    Replace('#Ocenca#', '');
    Replace('#DateSdach#', '');
  end;
  // ActiveSheet.PageSetup.LeftFooter:='&5' + TApplicationController.GetInstance.DocumentFooter;

  NextStep(2, 'Формирование бланка');

  { ActiveBarcodeApplet.AppletName := 'PDF417Ctrl1';
    ActiveBarcodeApplet.BarcodeHeader := TBarcodeReportHeader.Create;
    ActiveBarcodeApplet.BarcodeHeader.MajorVersion := 1;
    ActiveBarcodeApplet.BarcodeHeader.MinorVersion := 0;
    ActiveBarcodeApplet.BarcodeHeader.ObjectType := 1;
    ActiveBarcodeApplet.BarcodeHeader.OID := Fik_ved;
    ActiveBarcodeApplet.WriteToApplet; }

end;

end.
