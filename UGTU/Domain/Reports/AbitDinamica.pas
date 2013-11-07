{*
    Отчет - вывод отчета предварительный список на зачисление в Excel
    Версия: 1.0.0.1
    Создано: 28.07.2009
    Последняя правка:
    Автор: Вокуева Т.А.
*}
unit AbitDinamica;
  {#Author tanyav@ist.ugtu.net}

interface
uses
  Classes, SysUtils, ExcelXP, Barcode, Contnrs, ReportsBase, DB, ADODB,
    DBTVObj, DBTVStudObj, DBTVGroupObj, ComCtrls, StdCtrls, ApplicationController,
    Variants, uDMAbiturientOtchety, ExceptionBase;

type
  //TReportCondition = (allOchn=1,allZaochn,realOchn,realZaochn, ReportEnd);

   TAbitDinamicaReport = class(TExcelReportBase)
  private
    FNNyear: integer;
    FikFac: integer;
    FikSpecFac: integer;
    FDate: TDateTime;
    function  GetIncStepsCount(PageNumber: integer): integer;
    function  GetPageNumber: integer;
  protected
    procedure Execute;override;
    function GetTotalSteps: Integer; override;
    procedure ExportPage;
  public
    property NNyear:integer read FNNyear write FNNyear;
    property ikFac:integer read FikFac write FikFac;
    property ikSpecFac:integer read FikSpecFac write FikSpecFac;
    property Date:TDateTime read FDate write FDate;

  end;

implementation

var reportDataSet: TADOStoredProc;   //источник данных

procedure TAbitDinamicaReport.ExportPage;
const
  FirstRowNumber = 3;     //номер первой строки, с которой начинаются записи
  FirstColNumber = 1;     //номер первой колонки, с которой начинаются записи
var
  RowNumber: integer;  //номер текущей строки Excel
  ColNumber: integer;   //номер текущего столбца Excel
  idFormEd: integer;     //текущая форма обучения
  Realy_postup: integer;  //текущий признак действительности
  bujCount, zcpCount, kontrCount: integer;   //кол-ва
  bujDiffCount, zcpDiffCount, kontrDiffCount: string;    //разности
  tempStr: string;
begin
  Replace('#date#', DateToStr(FDate));

  with reportDataSet do
  begin   //FieldByName('').AsString

    RowNumber:= FirstRowNumber;
    idFormEd:=FieldByName('Ik_form_ed').AsInteger;
    Realy_postup:= FieldByName('Realy_postup').AsInteger;

    while (idFormEd=FieldByName('Ik_form_ed').AsInteger)
        and (Realy_postup = FieldByName('Realy_postup').AsInteger)
        and (not Eof) do
    begin
      ColNumber:= FirstColNumber;

      bujCount:= FieldByName('AbitCount').AsInteger;
      bujDiffCount:= FieldByName('YesterdayDifference').AsString;
      Next;
      zcpCount:= FieldByName('AbitCount').AsInteger;
      zcpDiffCount:= FieldByName('YesterdayDifference').AsString;
      Next;
      kontrCount:= FieldByName('AbitCount').AsInteger;
      kontrDiffCount:= FieldByName('YesterdayDifference').AsString;

      if (bujCount<>0) or (zcpCount<>0) or (kontrCount<>0) then
      begin
			  Items[RowNumber, ColNumber] := FieldByName('Cshort_spec').AsString;
			  inc(ColNumber);
        tempStr:= IntToStr(bujCount); //bujDiffCount+' '+
			  if idFormEd<>2 then  //для заочников нет ЦКП
          tempStr:= tempStr+' + '+IntToStr(zcpCount);       //+' '+zcpDiffCount
        Items[RowNumber, ColNumber]:=tempStr;
			  inc(ColNumber);
			  Items[RowNumber, ColNumber] := IntToStr(kontrCount);
			  inc(ColNumber);
			  Items[RowNumber, ColNumber] := IntToStr(bujCount+zcpCount+kontrCount);

        inc(RowNumber);
      end;
      

      Next;
    end;
    Range['A'+IntToStr(FirstRowNumber),'D'+inttostr(RowNumber-1)].Borders.Weight:=2;
  end;


end;

//возвращает кол-во шагов, которые нужно "нарастить"
function  TAbitDinamicaReport.GetIncStepsCount(PageNumber: integer): integer;
begin
  result:= ((GetTotalSteps div 2)+(GetTotalSteps div 8)*(PageNumber-1))   //сколько должно быть
        -CurrentStep;      //- сколько есть
end;

//вычисляет номер следующей страницы
function TAbitDinamicaReport.GetPageNumber: integer;
begin
  with reportDataSet do
    result:= FieldByName('Realy_postup').AsInteger*2+FieldByName('Ik_form_ed').AsInteger;
end;

procedure TAbitDinamicaReport.Execute;
var PageNumber: integer;
    ReportCondition: string;  //используется для вывода шага
    ReportStepNumber: integer;   //шаг отчета
    DeletePageNumber: integer;
    DeletedPageCount: integer;  //кол-во удаленных страниц
begin
  inherited;
  DisplayAlerts:= false;
  NextStep(1,'Загрузка данных');
  //загружаем предварительный список
  reportDataSet:= dmAbiturientOtchety.adospAbitGetDinamika;
  reportDataSet.ProcedureName:= 'Abit_GetDinamika;1';
  reportDataSet.Close;
  with reportDataSet.Parameters do
  begin
    Clear;
    CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 4, NULL);
    CreateParameter('@NNyear', ftInteger, pdInput, 4, NNyear);
    CreateParameter('@ik_fac', ftInteger, pdInput, 4, ikFac);
    CreateParameter('@ik_spec_fac', ftInteger, pdInput, 4, ikSpecFac);

  end;
  reportDataSet.Open;
  
  with reportDataSet do
  begin
    First;
    ReportStepNumber:= 1;
    DeletedPageCount:= 0;

    while PageNumber<>5 do
    begin
      if Eof then
        PageNumber:= 5
      else
      begin
      	PageNumber:= GetPageNumber;
				ActivateWorksheet(PageNumber-DeletedPageCount);
				case PageNumber of
				  1:
			    ReportCondition:= 'Выгрузка в MS Excel очников';
				  2:
					ReportCondition:= 'Выгрузка в MS Excel заочников';
				  3:
					ReportCondition:= 'Выгрузка в MS Excel очников (оригиналы)';
				  4:
					ReportCondition:= 'Выгрузка в MS Excel заочников (оригиналы)';
				end;

		    NextStep(GetIncStepsCount(PageNumber),ReportCondition);

				ExportPage;
      end;

      //удаляем неиспользуемые страницы
      for DeletePageNumber:=ReportStepNumber to PageNumber-1 do
      begin
        DeletePage(DeletePageNumber-DeletedPageCount);
        inc(DeletedPageCount);
      end;
      
      ReportStepNumber:= PageNumber+1;
    end;
  end;

  {for DeletePageNumber:=ReportStepNumber to 4 do
    DeletePage(DeletePageNumber-DeletedPageCount);     }

  //CurrentStep
  NextStep(GetTotalSteps - CurrentStep,'Завершение формирования отчета.');

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

function TAbitDinamicaReport.GetTotalSteps: Integer;
begin
  result:=10000;
end;

end.
