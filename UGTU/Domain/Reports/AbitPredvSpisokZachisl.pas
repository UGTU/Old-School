{*
    Отчет - вывод отчета предварительный список на зачисление в Excel
    Версия: 1.0.0.1
    Создано: 22.07.2009
    Последняя правка: 
    Автор: Вокуева Т.А.
*}
unit AbitPredvSpisokZachisl;
  {#Author tanyav@ist.ugtu.net}
interface
uses
  Classes, SysUtils, ExcelXP, Barcode, Contnrs, ReportsBase, DB, ADODB,
    DBTVObj, DBTVStudObj, DBTVGroupObj, ComCtrls, StdCtrls, ApplicationController,
    Variants, uDMAbiturientOtchety;

type
   TAbitPredvSpisokZachislReport = class(TExcelReportBase)
  private
    FNNyear: integer;
    FikFac: variant;
    FikSpecFac: variant;
  protected
    procedure Execute;override;
    function GetTotalSteps: Integer; override;
  public
    property NNyear:integer read FNNyear write FNNyear;
    property ikFac:variant read FikFac write FikFac;
    property ikSpecFac:variant read FikSpecFac write FikSpecFac;

  end;

implementation


procedure TAbitPredvSpisokZachislReport.Execute;
const
  CopiingPageNumber = 1;   //номер копируемой страницы отчета
  FirstRowNumber = 6;     //номер первой строки, с которой начинаются записи абитуриентов
  FirstColNumber = 1;     //номер первой колонки, с которой начинаются записи абитуриентов
var
  SpecPageName: string;    //название страницы текущей специальности (идентификатор с названием)
  PageNumber:integer;        //номер текущей страницы Excel
  RowNumber: integer;  //номер текущей строки Excel
  ColNumber: integer;   //номер текущего столбца Excel

  AbitListEnd: boolean;   //
begin
  inherited;
  NextStep(1,'Загрузка данных');
  //загружаем предварительный список
  dmAbiturientOtchety.adospABITGetPredvSpisok.ProcedureName:= 'ABIT_GetPredvSpisok;1';
  dmAbiturientOtchety.adospABITGetPredvSpisok.Close;
  with dmAbiturientOtchety.adospABITGetPredvSpisok.Parameters do
  begin
    Clear;
    CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 4, NULL);
    CreateParameter('@NNyear', ftInteger, pdInput, 4, NNyear);
    CreateParameter('@ik_fac', ftInteger, pdInput, 4, ikFac);
    CreateParameter('@ik_spec_fac', ftInteger, pdInput, 4, ikSpecFac);

  end;
  dmAbiturientOtchety.adospABITGetPredvSpisok.Open;

  NextStep(GetTotalSteps div 2,'Начало выгрузки отчета в MS Excel');
  SpecPageName:= '';
  PageNumber:= CopiingPageNumber;
  dmAbiturientOtchety.adospABITGetPredvSpisok.First;
  AbitListEnd:= false;
  DisplayAlerts:= false;
  while not AbitListEnd do
  begin
    with dmAbiturientOtchety.adospABITGetPredvSpisok do
    begin     //FieldByName('').AsString
      if dmAbiturientOtchety.adospABITGetPredvSpisok.Eof then
      begin
        AbitListEnd:= true;
      end;

      if (SpecPageName<>FieldByName('SpecPageName').AsString) or (AbitListEnd) then
      begin
        if SpecPageName<>'' then
        begin
          Range['A'+IntToStr(FirstRowNumber),'E'+inttostr(RowNumber-1)].Borders.Weight:=2;
          PageName:= SpecPageName;

          if AbitListEnd then
          begin
            DeletePage(CopiingPageNumber);
            continue;
          end;
          NextStep(GetTotalSteps div (2*100),'Выгрузка отчета в MS Excel');
        end;

        //копируем страницу
        self.DuplicatePage(CopiingPageNumber, PageNumber);
        //FieldByName('').AsString

        SpecPageName:= FieldByName('SpecPageName').AsString;
        RowNumber:= FirstRowNumber;
        inc(PageNumber);

        ActivateWorksheet(PageNumber);
        Replace('#fac#', FieldByName('Cname_fac').AsString);
        Replace('#spec#', FieldByName('Cname_spec').AsString);
        Replace('#buj#', FieldByName('MestBudjet').AsString);
        if FieldByName('MestCKP').AsInteger>0 then
          Replace('#zkp#', ', в том числе ЦКП - '+FieldByName('MestCKP').AsString)
        else
          Replace('#zkp#', '');
      end;

      ColNumber:= FirstColNumber;
      Items[RowNumber, ColNumber] := IntToStr(RowNumber-FirstRowNumber+1);
      inc(ColNumber);
      Items[RowNumber, ColNumber] := FieldByName('Cname_kat_zach').AsString;
      inc(ColNumber);
      Items[RowNumber, ColNumber] := FieldByName('AbitName').AsString;
      inc(ColNumber);
      Items[RowNumber, ColNumber] := FieldByName('SumBall').AsString;
      inc(ColNumber);

      {if FieldByName('IsMain').AsBoolean then
        Items[RowNumber, ColNumber] := 'Да'
      else
        Items[RowNumber, ColNumber] := 'Нет';
      inc(ColNumber); }

      if FieldByName('Realy_postup').AsBoolean then
        Items[RowNumber, ColNumber] := 'Оригинал'
      else
        Items[RowNumber, ColNumber] := 'Копия';

      inc(RowNumber);
      Next;
    end;
  end;


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

function TAbitPredvSpisokZachislReport.GetTotalSteps: Integer;
begin
  result:=10000;
end;

end.
