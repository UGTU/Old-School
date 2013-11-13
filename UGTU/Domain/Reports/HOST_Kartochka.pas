unit HOST_Kartochka;
 {*
    Отчет - вывод личной карточки проживающего в Excel
    Версия:
    Создано: 24.05.2010
    Последняя правка:
    Автор: Лодыгина Л.В.
*}

interface
uses
  Classes, SysUtils, ExcelXP, Barcode, Contnrs, ReportsBase, DB, ADODB,
    DBTVObj, DBTVStudObj, DBTVGroupObj, ComCtrls, StdCtrls, ApplicationController,
    Variants, GeneralController,uHOST, DateUtils;

const TableBeg = 17;

type
   THOST_Kartochka = class(TExcelReportBase)
  private
    FnCode: integer;
  protected
    procedure Execute;override;
    function GetTotalSteps: Integer; override;
  public
    property nCode:integer read FnCode write FnCode;



  end;

implementation


procedure THOST_Kartochka.Execute;
var str: string;   i:integer;
  imonth:integer;
  smonth:string;
begin
  inherited;
  NextStep(1,'Загрузка данных');

  dmHOST.ProcVivodKartochk.ProcedureName:= 'HOST_VivodKartochki;1';
  dmHOST.ProcVivodKartochk.Close;
  with dmHOST.ProcVivodKartochk.Parameters do
  begin
    Clear;
    CreateParameter('@nCode', ftInteger, pdInput, 4, FnCode);

  end;
  dmHOST.ProcVivodKartochk.Open;
  NextStep(4,'Создание личной карточки проживающего');
  dmHOST.ProcVivodKartochk.First;

  Range['B21','C22'].Copy(Range['K21','L22']);
  Range['B21','C22'].Clear;
  Range['K21','L22'].Copy(Range['B'+intToStr(21+dmHOST.ProcVivodKartochk.RecordCount-1),'C'+intToStr(22+dmHOST.ProcVivodKartochk.RecordCount-1)]);
  Range['K21','L22'].Clear;

  with  dmHOST.ProcVivodKartochk do
  begin
        dmHOST.ProcVivodKartochk.Locate('ik_AddressType',1,[]);
        imonth:=MonthOf(Date);
        smonth := TGeneralController.Instance.GetMonthName(imonth);

        ActivateWorksheet(1);
        Replace('#н#', FieldByName('NumHostel').AsString);
        Replace('#ком#', FieldByName('FlatNumber').AsString);
        Replace('#ФИО#', FieldByName('fio').AsString);
        Replace('#датаРожд#', FieldByName('Dd_birth').AsString);
        dmHOST.ProcVivodKartochk.Locate('ik_AddressType',2,[]);
        Replace('#адрес#', FieldByName('Adress').AsString);
        Replace('#Дата#', IntToStr(DayOf(Date)));
        Replace('#Месяц#',smonth);
        Replace('#Год#',  IntToStr(YearOf(Date)));

    for i := 0 to dmHOST.ProcVivodKartochk.RecordCount-1 do
    begin
      Range['A'+inttostr(TableBeg+i),'E'+inttostr(TableBeg+i)].NumberFormat := '@';
      Items[TableBeg+i,1] := i+1;
      Items[TableBeg+i,2] := dmHOST.ProcVivodKartochk.FieldByName('DataVidachi').Value;
      Items[TableBeg+i,3] := dmHOST.ProcVivodKartochk.FieldByName('NAMETipInven').Value;
      Items[TableBeg+i,4] := dmHOST.ProcVivodKartochk.FieldByName('Kolvo').Value;
      Range['A'+inttostr(TableBeg+i),'E'+inttostr(TableBeg+i)].Font.Size:=12;
      Range['A'+inttostr(TableBeg+i),'E'+inttostr(TableBeg+i)].Font.Name := 'Times New Roman';
      Range['A'+inttostr(TableBeg+i),'E'+inttostr(TableBeg+i)].HorizontalAlignment:= xlCenter ;
      NextStep(1, 'Progress '+ IntToStr(i+1));
      dmHOST.ProcVivodKartochk.Next;
    end;

    Range['A'+inttostr(TableBeg-1),'E'+intToStr(17+dmHOST.ProcVivodKartochk.RecordCount-1)].Borders.Weight:=2;
  end;
  NextStep(5,'Создание личной карточки проживающего');

  Show;
end;

function THOST_Kartochka.GetTotalSteps: Integer;
begin
  result:=15;
end;

end.
