unit HOST_ZayavNaZas;
 {*
    Отчет - вывод заявления на заселение в Excel
    Версия:
    Создано: 12.05.2010
    Последняя правка:
    Автор: Лодыгина Л.В.
*}

interface
 {#Author llodigina@ist.ugtu.net}
uses
  Classes, SysUtils, ExcelXP, Barcode, Contnrs, ReportsBase, DB, ADODB,
    DBTVObj, DBTVStudObj, DBTVGroupObj, ComCtrls, StdCtrls, ApplicationController,
    Variants, uDMAbiturientOtchety, GeneralController,uDM, uHOST, DateUtils;

type
   THOST_ZayavNaZas = class(TExcelReportBase)
  private
    FnCode: integer;
  protected
    procedure Execute;override;
    function GetTotalSteps: Integer; override;
  public
    property nCode:integer read FnCode write FnCode;



  end;

implementation


procedure THOST_ZayavNaZas.Execute;
var str: string;
begin
  inherited;
  NextStep(1,'Загрузка данных');

  dmHOST.ProcVivodZayavPoCode.ProcedureName:= 'HOST_VivodZayavPoCode;1';
  dmHOST.ProcVivodZayavPoCode.Close;
  with dmHOST.ProcVivodZayavPoCode.Parameters do
  begin
    Clear;
    CreateParameter('@IDZayav', ftInteger, pdInput, 4, FnCode);

  end;
  dmHOST.ProcVivodZayavPoCode.Open;
  NextStep(4,'Создание заявления на заселение');

  {NextStep(GetTotalSteps div 2,'Начало выгрузки отчета в MS Excel');
          Range['A'+IntToStr(FirstRowNumber),'E'+inttostr(RowNumber-1)].Borders.Weight:=2;
          PageName:= SpecPageName; }
  dmHOST.ProcVivodZayavPoCode.First;
  with  dmHOST.ProcVivodZayavPoCode do
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
        Replace('#н#', FieldByName('NumHostel').AsString);
        Replace('#Группа#', FieldByName('Cname_grup').AsString);
        Replace('#дата#', FieldByName('DataPodachi').AsString);
        Replace('#нач#',  IntToStr(YearOf(Date)));
        Replace('#кон#',  IntToStr(YearOf(Date)+1));

  end;
  NextStep(5,'Создание заявления на заселение');

  Show;
end;

function THOST_ZayavNaZas.GetTotalSteps: Integer;
begin
  result:=10;
end;

end.
