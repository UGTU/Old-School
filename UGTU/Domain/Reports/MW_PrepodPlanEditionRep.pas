unit MW_PrepodPlanEditionRep;
{#Author nnikolenko@ist.ugtu.net}
interface

uses Classes, SysUtils , Dialogs, ExcelXP, ADODB, Windows,
     ReportsBase, uDMMethodWork, uDM, DateUtils, ApplicationController, ExceptionBase,
     ReportDataSet, MethodWorkController, Grids;

type
  TPrepodPlanEditionReport = class(TExcelReportBase)
  private
    //FTotalSteps: Integer;
    FPrepIK, FPlanIK: integer;
    FYearVolMW: double;
    FSGrid: TStringGrid;
  protected
    procedure Execute; override;
    function GetTotalSteps:Integer; override;
  public
    constructor Create(Aowner:TComponent); override;
    property PrepIK: integer read FPrepIK write FPrepIK;
    property PlanIK: integer read FPlanIK write FPlanIK;
    property YearVolMW: double read FYearVolMW write FYearVolMW;
    property SGrid: TStringGrid read FSGrid write FSGrid;
  end;


implementation

{ TPrepodPlanReports }

constructor TPrepodPlanEditionReport.Create(Aowner:TComponent);
begin
  inherited;
  //FTotalSteps := -1;
end;

procedure TPrepodPlanEditionReport.Execute;
var str: string;
    Rang: Variant;
    i, N, j: integer;
    tempDataSet2: TADODataSet;
    PlanVolMW: TDoubleArray;
begin
  NextStep(0,'Началось построение отчета');

     //ExAppl:=CreateOleObject('Excel.Application');
     //ExAppl.DisplayAlerts:= false;
     //str:= ExtractFilePath(Application.ExeName)+'reports\MW_CurrentPlanPrep.XLT';
     //ExAppl.WorkBooks.Add(str);
     //wb:=ExAppl.WorkBooks.item[ExAppl.WorkBooks.count];
  ActiveSheet.Name:= 'Учебно-методическая работа';

  try
    try
       //выводим ФИО преподавателя
       tempDataSet2:= TADODataSet.Create(nil);
       tempDataSet2.Connection:= dm.DBConnect;
       tempDataSet2.CommandText:= 'Select (clastname + ' + #39 + ' ' + #39 + ' + cfirstname + ' + #39 + ' ' + #39 + ' + cotch) as FIO From Prepods where (itab_n = '+ IntToStr(PrepIK) +')';
       tempDataSet2.Open;
       Replace('#FIO#', tempDataSet2.FieldByName('FIO').AsString);
       tempDataSet2.Close;
       if PlanIK <> 0 then
       begin
         tempDataSet2.CommandText:= 'select DateRatification, NumProtocol, NameTypeReport, '+
         '(Convert(nvarchar,year_value) + '' - '' + Convert(nvarchar,year_value+1)) as UchYear from dbo.MW_PlanMethodWork '+
         'inner join dbo.Year_uch_pl ON dbo.MW_PlanMethodWork.ik_year = dbo.Year_uch_pl.ik_year_uch_pl '+
         'left join MW_TypeReport ON MW_PlanMethodWork.IDTypeReport = MW_TypeReport.IDTypeReport '+
         'WHERE (IDPlanMW =  ' + IntToStr(PlanIK) + ')';
         tempDataSet2.Open;
         Replace('#YY#', tempDataSet2.FieldByName('UchYear').AsString);
         Replace('#N#', tempDataSet2.FieldByName('NumProtocol').AsString);
         Replace('#Doc#', tempDataSet2.FieldByName('NameTypeReport').AsString);

         if (tempDataSet2.FieldByName('DateRatification').AsString <> '') then
         begin
           case MonthOf(tempDataSet2.FieldByName('DateRatification').AsDateTime) of
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
           Replace('#Date#', IntToStr(DayOf(tempDataSet2.FieldByName('DateRatification').AsDateTime)));
           Replace('#Month#', str); //FormatDateTime('mmmm', Date));
           Replace('#Year#', IntToStr(YearOf(tempDataSet2.FieldByName('DateRatification').AsDateTime)));
         end
         else
         begin
           Rang:= Range['F1', 'G4'];
           Rang.Clear;
           {Replace('#Date#', ' ');
           Replace('#Month#', '_');
           Replace('#Year#', '____'); }
         end;
         tempDataSet2.Close;
       end
       else
       begin
         Replace('#YY#', '<все>');
         Rang:= Range['F1', 'G4'];
         Rang.Clear;
         {Replace('#N#', ' ');
         Replace('#Doc#', ' ');
         Replace('#Date#', ' ');
         Replace('#Month#', '_');
         Replace('#Year#', '____');}
       end;
    except
      on E:Exception do
      begin
        raise EApplicationException.Create('Произошла ошибка при экспорте данных в Excel.',E);
        exit;
      end;
    end;

  try
    PlanVolMW:= TMethodWorkController.Instance.GetPlanVolumeForMW(dmMethodWork.adsPlanPrep);

    i:= 10; N:= 0;

    {Rang:= Range['A'+IntToStr(i), 'F'+IntToStr(i)];
    Rang.Font.Bold:= true;
    Rang.HorizontalAlignment := xlCenter;
    Items[i,1]:= SGrid.Cells[0,1];
    Items[i,2]:= SGrid.Cells[1,1];
    Items[i,3]:= SGrid.Cells[2,1];
    Items[i,4]:= SGrid.Cells[3,1];
    Items[i,5]:= SGrid.Cells[4,1];
    Items[i,6]:= SGrid.Cells[5,1];
    inc(i);
    NextStep(1,'Идет загрузка данных');}

    for j := 2 to SGrid.RowCount - 1 do
    begin
        if (SGrid.Cells[1,j] = '') and (SGrid.Cells[0,j] <> 'Факт') then
        begin
          Rang:= Range['A'+IntToStr(i), 'G'+IntToStr(i)];
          Rang.Merge(true);
          Rang.Font.Bold:= true;
          Rang.HorizontalAlignment := xlCenter;
          Items[i,1]:= SGrid.Cells[0,j];
        end
        else
        begin
          inc(N);
          Items[i,1]:= IntToStr(N);
          Items[i,2]:= SGrid.Cells[0,j];
          Items[i,3]:= SGrid.Cells[1,j];
          Items[i,4]:= SGrid.Cells[2,j];
          Items[i,5]:= SGrid.Cells[3,j];
          Items[i,6]:= SGrid.Cells[4,j];
          Items[i,7]:= SGrid.Cells[5,j];
        end;
        inc(i);
        NextStep(1,'Идет загрузка данных');
    end;
  except
    on E:Exception do
    begin
      raise EApplicationException.Create('Произошла ошибка при экспорте данных в Excel.',E);
      exit;
    end;
  end;

  finally
    if Assigned(tempDataSet2) then
      tempDataSet2.Free;
  end;

     Rang:= Range['A10', 'G'+IntToStr(i-1)];
     Rang.Borders.Weight:=2;
     Rang.Font.Name:= 'Times New Roman';
     Rang.Font.Size:= 10;
     Rang.WrapText:= true;

     Items[i+2,2]:= 'Итого:';

     Items[i+2,4]:= 'годовой объем на УМР:';

     Items[i+2,5].Font.Bold:= true;
     Items[i+2,5]:= FloatToStrF(YearVolMW, ffFixed, 10, 2) + ' час.';

     Items[i+3,4]:= 'запланировано:';

     Items[i+3,5].Font.Bold:= true;
     Items[i+3,5]:= FloatToStrF(PlanVolMW[0], ffFixed, 10, 2) + ' час.';

     Items[i+3,6]:= 'запланировано (эксперт):';

     Items[i+3,7].Font.Bold:= true;
     Items[i+3,7]:= FloatToStrF(PlanVolMW[1], ffFixed, 10, 2) + ' час.';

     Items[i+4,4]:= 'выполнено:';

     Items[i+4,5].Font.Bold:= true;
     Items[i+4,5]:= FloatToStrF(PlanVolMW[2], ffFixed, 10, 2) + ' час.';

     Items[i+4,6]:= 'выполнено (эксперт):';

     Items[i+4,7].Font.Bold:= true;
     Items[i+4,7]:= FloatToStrF(PlanVolMW[3], ffFixed, 10, 2) + ' час.';

     Items[i+5,4]:= 'выполнено по факту:';

     Items[i+5,5].Font.Bold:= true;
     Items[i+5,5]:= FloatToStrF(PlanVolMW[4], ffFixed, 10, 2) + ' час.';

     //ExAppl.Visible:= true;
     //ExAppl.DisplayAlerts:= true;

  Show;
end;

function TPrepodPlanEditionReport.GetTotalSteps: Integer;
begin
  result:= SGrid.RowCount-2;
end;

end.
