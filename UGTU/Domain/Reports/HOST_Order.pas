 {*
    Отчет - вывод ордера в Excel
    Версия:
    Создано: 20.04.2010
    Последняя правка:
    Автор: Лодыгина Л.В.
*}

unit HOST_Order;
 {#Author llodigina@ist.ugtu.net}
interface
uses
  Classes, SysUtils, ExcelXP, Barcode, Contnrs, ReportsBase, DB, ADODB,
    DBTVObj, DBTVStudObj, DBTVGroupObj, ComCtrls, StdCtrls, ApplicationController,
    Variants, uDMAbiturientOtchety, GeneralController,uDM, uHOST, DateUtils;

type
   THOST_OrderReport = class(TExcelReportBase)
  private
    FIDZayavlenie: integer;
  protected
    procedure Execute;override;
    function GetTotalSteps: Integer; override;
  public
    property IDZayavlenie:integer read FIDZayavlenie write FIDZayavlenie;



  end;

implementation


procedure THOST_OrderReport.Execute;
var str: string;
begin
  inherited;
  NextStep(1,'Загрузка данных');

  dmHOST.ProcVivodOrdera.ProcedureName:= 'HOST_VivodOrderaPoCode;1';
  dmHOST.ProcVivodOrdera.Close;
  with dmHOST.ProcVivodOrdera.Parameters do
  begin
    Clear;
    CreateParameter('@IDZayav', ftInteger, pdInput, 4, FIDZayavlenie);

  end;
  dmHOST.ProcVivodOrdera.Open;
  NextStep(4,'Создание ордера');

  {NextStep(GetTotalSteps div 2,'Начало выгрузки отчета в MS Excel');
          Range['A'+IntToStr(FirstRowNumber),'E'+inttostr(RowNumber-1)].Borders.Weight:=2;
          PageName:= SpecPageName; }
  dmHOST.ProcVivodOrdera.First;
  with  dmHOST.ProcVivodOrdera do
  begin
       case MonthOf(Date) of
      1: str:= 'января';
      2: str:= 'февраля';
      3: str:= 'марта';
      4: str:= 'апреля';
      5: str:= 'мая';
      6: str:= 'июня';
      7: str:= 'июля';
      8: str:= 'августа';
      9: str:= 'сентября';
      10: str:= 'октября';
      11: str:= 'ноября';
      12: str:= 'декабря';
     end;

        ActivateWorksheet(1);
        Replace('#ФИО#', FieldByName('fio').AsString);
        Replace('#Улица#', FieldByName('CStreet').AsString);
        Replace('#Дом#', FieldByName('BuildingNumber').AsString);
        Replace('#Чис#', IntToStr(DayOf(Date)));
        Replace('#Месяц#',str);
        Replace('#Год#',  IntToStr(YearOf(Date)));

  end;
  NextStep(5,'Создание ордера');

  Show;
end;

function THOST_OrderReport.GetTotalSteps: Integer;
begin
  result:=10;
end;

end.
