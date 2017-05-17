unit UNaprExcelReport;

  {#Author tanyav@ist.ugtu.net}

interface
uses
  Classes, SysUtils, ExcelXP, Barcode, Contnrs, ReportsBase, DB, ADODB,
    DBTVObj, DBTVStudObj, DBTVGroupObj, ComCtrls, StdCtrls, ApplicationController,
    Variants, ExceptionBase, udmUspevaemost;

type
  //TReportCondition = (allOchn=1,allZaochn,realOchn,realZaochn, ReportEnd);

TNaprExcelReport = class(TExcelReportBase)
  private
    Fik_ved: Integer;
    function Getik_ved: Integer;
    procedure Setik_ved(value: Integer);

  protected

  public
    procedure Execute; override;
    function GetTotalSteps: Integer; override;
    property ik_ved: Integer read Getik_ved write Setik_ved;
  end;

implementation
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
  Replace('#Num#', dmUspevaemost.adospSelNapr.FieldByName('cNumber_ved').AsString);

  if dmUspevaemost.adospSelNapr.FieldByName('ik_vid_zanyat').AsInteger = 6 then
  // Range['p13','p13'].Clear;
  begin
    Replace('#vid_zanyat#', 'экзамена');
    Replace('#v_z#', 'экзамена');
  end;

  if dmUspevaemost.adospSelNapr.FieldByName('ik_vid_zanyat').AsInteger = 7 then
  // Range['l13','n13'].Clear;
  begin
    Replace('#vid_zanyat#', 'зачета');
    Replace('#v_z#', 'зачета');
  end;
  if (dmUspevaemost.adospSelNapr.FieldByName('ik_vid_zanyat').AsInteger > 7) and
    (dmUspevaemost.adospSelNapr.FieldByName('ik_vid_zanyat').AsInteger < 10)
  then
  begin
    // Range['p13','p13'].Clear;
    // Range['l13','n13'].Clear;
    Replace('#vid_zanyat#', 'курсовой работы(проекта)');
    Replace('#v_z#', 'КР(П)');
  end;
  if dmUspevaemost.adospSelNapr.FieldByName('ik_vid_zanyat').AsInteger = 27 then
  begin
    // Range['p13','p13'].Clear;
    // Range['l13','n13'].Clear;
    Replace('#vid_zanyat#', 'практики');
    Replace('#v_z#', 'практики');
  end;

  NextStep(1, 'Формирование бланка');
  Replace('#fac#', dmUspevaemost.adospSelNapr.FieldByName('Cshort_name_fac')
    .AsString);
  // Replace('#dir_ins#',dmUspevaemost.adospSelNapr.FieldByName('dir_name').AsString);
  // Range['w12','w12'].Value2:= dmUspevaemost.adospSelNapr.FieldByName('cshort_vid_zanyat').AsString +' ('+
  // dmUspevaemost.adospSelNapr.FieldByName('SemHourCount').AsString+' ч.)';
  Replace('#dir_ins#', '');
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

  Replace('#Mark#', dmUspevaemost.adospSelNapr.FieldByName('MainVedMark')
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
    // date:=date+4;
    // Replace('#dateEnd#',DateToStr(date));
  end;
  // else
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
