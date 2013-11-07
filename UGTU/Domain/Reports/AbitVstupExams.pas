{*
    Отчет - вывод отчета о вступ экзаменах в Excel
    Версия: 1.0.0.1
    Создано: 11.07.2011
    Последняя правка:
    Автор: Вокуева Т.А.
*}
unit AbitVstupExams;
  {#Author tanyav@ist.ugtu.net}

interface
uses
  Classes, SysUtils, ExcelXP, Barcode, Contnrs, ReportsBase, DB, ADODB,
    DBTVObj, DBTVStudObj, DBTVGroupObj, ComCtrls, StdCtrls, ApplicationController,
    Variants, uDMAbiturientOtchety, ExceptionBase,
    uDMAbiturientNabor;

type
  //TReportCondition = (allOchn=1,allZaochn,realOchn,realZaochn, ReportEnd);

   TAbitExamsReport = class(TExcelReportBase)
  private
  protected
    procedure Execute;override;
    function GetTotalSteps: Integer; override;
  public
    {property NNyear:integer read FNNyear write FNNyear;
    property ikFac:integer read FikFac write FikFac;
    property ikSpecFac:integer read FikSpecFac write FikSpecFac;
    property Date:TDateTime read FDate write FDate; }

  end;

implementation





procedure TAbitExamsReport.Execute;
const firstRowNumber = 4;
      firstColNumber = 1;
var CurrRowNumber: integer;
    CurrColNumber: integer;
    AbitCode:integer;
begin
  inherited;
  DisplayAlerts:= false;
  NextStep(1,'Проверка данных');
  //проверяем, чтобы были загружены нужные наборы данных
  if ((not DMAbiturientNabor.adoqAbitExams.Active) or
      (not DMAbiturientNabor.adospAbitGetPostupStatistika.Active))  then
      raise EApplicationException.Create('Ошибка при экспорте в MS Excel. Не загружены все необходимые данные!');
  CurrRowNumber:= firstRowNumber;
  NextStep(25,'Выгрузка данных');
  TApplicationController.GetInstance.AddLogEntry('Экспорт данных.');
  with DMAbiturientNabor.adospAbitGetPostupStatistika do
  begin
    DisableControls;
    try
      filter:= 'ik_type_zach<>3';
      filtered:= true;
      Sort:='Cshort_name_fac,cname_spec,ik_type_kat,zach,RegNomer';
      First();
      while (not Eof) do
      begin
        CurrColNumber:= firstColNumber;
        //Items[CurrRowNumber,CurrColNumber]:=
        Items[CurrRowNumber,CurrColNumber]:=FieldByName('Cshort_name_fac').AsString; inc(CurrColNumber);
        Items[CurrRowNumber,CurrColNumber]:=FieldByName('cname_spec').AsString; inc(CurrColNumber);
        Items[CurrRowNumber,CurrColNumber]:=FieldByName('zach').AsString; inc(CurrColNumber);
        Items[CurrRowNumber,CurrColNumber]:=FieldByName('RegNomer').AsString; inc(CurrColNumber);
        Items[CurrRowNumber,CurrColNumber]:=FieldByName('fio').AsString; inc(CurrColNumber);
        Items[CurrRowNumber,CurrColNumber]:=FieldByName('dd_pod_zayav').AsString; inc(CurrColNumber);
        Items[CurrRowNumber,CurrColNumber]:=FieldByName('cmedal').AsString; inc(CurrColNumber);
        Items[CurrRowNumber,CurrColNumber]:=FieldByName('post').AsString; inc(CurrColNumber);
        Items[CurrRowNumber,CurrColNumber]:=FieldByName('sum_ball').AsString; inc(CurrColNumber);
        Items[CurrRowNumber,CurrColNumber]:=FieldByName('sredBall').AsString; inc(CurrColNumber);

        if FieldByName('IsMain').AsBoolean then
        begin
           Items[CurrRowNumber,CurrColNumber]:='Да';
           {if FieldByName('ik_type_zach').AsInteger<>3 then
              inc(mainCount);}
        end
        else
           Items[CurrRowNumber,CurrColNumber]:='Нет';

        inc(CurrColNumber);
        if FieldByName('Realy_postup').AsBoolean then
        begin
           Items[CurrRowNumber,CurrColNumber]:='Да';
           {if FieldByName('ik_type_zach').AsInteger<>3 then
              inc(realCount);}
        end
        else
           Items[CurrRowNumber,CurrColNumber]:='Нет';

        inc(CurrColNumber);
        //вывод экзаменов
        AbitCode:= FieldByName('nn_abit').AsInteger;
        with DMAbiturientNabor.adoqAbitExams do
        begin
          Locate('NN_abit',IntToStr(AbitCode),[]);
          while ((FieldByName('NN_abit').AsInteger=AbitCode) and (not Eof)) do
          begin
            Items[CurrRowNumber,CurrColNumber+(FieldByName('OrderNumber').AsInteger-1)*2]:=FieldByName('cshort_sdach').AsString;
            Items[CurrRowNumber,CurrColNumber+(FieldByName('OrderNumber').AsInteger-1)*2+1]:=FieldByName('cosenka').AsString;
            Next;
          end;

        end;

        Next;
        inc(CurrRowNumber);

      end;
      Range['A'+IntToStr(FirstRowNumber),'AJ'+inttostr(CurrRowNumber-1)].Borders.Weight:=2;
    finally
      filter:= '';
      filtered:= false;
      Sort:='';
      First;
      EnableControls;
    end;
  end;
  Show;

  ActivateWorksheet(1);
  {ActiveBarcodeApplet.AppletName := 'PDF417Ctrl1';
  ActiveBarcodeApplet.BarcodeHeader := TBarcodeReportHeader.Create;
  ActiveBarcodeApplet.BarcodeHeader.MajorVersion := 1;
  ActiveBarcodeApplet.BarcodeHeader.MinorVersion := 0;
  ActiveBarcodeApplet.BarcodeHeader.ObjectType := 1;
  ActiveBarcodeApplet.BarcodeHeader.OID := Fik_ved;
  ActiveBarcodeApplet.WriteToApplet; }
  DisplayAlerts:= true;
  Show;

end;

function TAbitExamsReport.GetTotalSteps: Integer;
begin
  result:=150;
end;

end.



