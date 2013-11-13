unit MW_PrepodPlanRep;
{#Author nnikolenko@ist.ugtu.net}
interface

uses Classes, SysUtils , Dialogs, ExcelXP, ADODB, Windows, DB,
     ReportsBase, uDMMethodWork, uDM, DateUtils, ApplicationController, ExceptionBase, MethodWorkController;

type
  TPrepodPlanReport = class(TExcelReportBase)
  private
    //FTotalSteps: Integer;
    FPrepIK, FPlanIK: integer;
    FYearVolMW: double;
    tempDataSet1: TADODataSet;
  protected
    procedure Execute; override;
    function GetTotalSteps:Integer; override;
    procedure Init; override;
  public
    constructor Create(Aowner:TComponent); override;
    property PrepIK: integer read FPrepIK write FPrepIK;
    property PlanIK: integer read FPlanIK write FPlanIK;
    property YearVolMW: double read FYearVolMW write FYearVolMW;
  end;


implementation

{ TPrepodPlanReports }

constructor TPrepodPlanReport.Create(Aowner:TComponent);
begin
  inherited;
  //FTotalSteps := -1;
end;

procedure TPrepodPlanReport.Execute;
var str: string;
    Rang: Variant;
    i, N: integer;
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
         Replace('#Date#', ' ');
         Replace('#Month#', '_');
         Replace('#Year#', '____');
       end;
       tempDataSet2.Close;
    except
       on E:Exception do
       begin
         raise EApplicationException.Create('Произошла ошибка при экспорте данных в Excel.',E);
         exit;
       end;
    end;

    try
    if Assigned(tempDataSet1) then
    begin
      //TDataSet(tempDataSet1):= TMethodWorkController.Instance.LoadPlanPrepForAllDisc(PrepIK, PlanIK);
      PlanVolMW:= TMethodWorkController.Instance.GetPlanVolumeForMW(tempDataSet1);

      tempDataSet1.First;
      i:= 10; N:= 0;
      while (not tempDataSet1.Eof) do
      begin
         if tempDataSet1.FieldByName('Bit_plan_fact').AsBoolean then
         begin
           inc(N);
           Items[i,1]:= IntToStr(N);
           Items[i,2]:= tempDataSet1.FieldByName('Discpl').Value;
           //Items[i,2]:= tempDataSet1.FieldByName('cName_disc').Value;
           if tempDataSet1.FieldByName('CurrentBitEdition').AsBoolean then
             Items[i,3]:= tempDataSet1.FieldByName('NameWarrant').AsString + ' (Издается)'
           else Items[i,3]:= tempDataSet1.FieldByName('NameWarrant').AsString + ' (Не издается)';
           Items[i,4]:= tempDataSet1.FieldByName('NameWork').Value;
           Items[i,5]:= tempDataSet1.FieldByName('NameMethodEdition').Value;
           Items[i,6]:= tempDataSet1.FieldByName('Uch').Value;
           Items[i,7]:= tempDataSet1.FieldByName('Characteristic').Value;
           Items[i,8]:= tempDataSet1.FieldByName('Volume').Value;
           Items[i,9]:= tempDataSet1.FieldByName('Norma').AsString + ' ч. ' + dmMethodWork.adsPlanPrep.FieldByName('NameUnit').AsString;
           Items[i,11]:= tempDataSet1.FieldByName('Drawing').Value;
           Items[i,12]:= tempDataSet1.FieldByName('Code').Value;
           Items[i,13]:= tempDataSet1.FieldByName('Position').Value;
           Items[i,14]:= tempDataSet1.FieldByName('DateTransitionInState').Value;

           tempDataSet2.CommandText:= 'Select Mark, CountFactTime, DateTransitionInState From MethodEdition as M inner join MW_State ON M.IDMethodEdition = MW_State.IDMethodEdition '+
                   'inner join MethodWork_NormOfTime ON M.IDContentNorm = MethodWork_NormOfTime.IDContentNorm '+
                   'where (M.IDMethodEdition = '+ IntToStr(tempDataSet1.FieldByName('IDMethodEditionPlan').AsInteger) +')and (Bit_plan_fact = 0)and (IDStatus = (select IDStatus from dbo.MW_State where IDMethodEdition = M.IDMethodEdition '+
                   'and DateTransitionInState = (select max(DateTransitionInState) from MW_State inner join MW_Status '+
                   'ON MW_State.IDStatus = MW_Status.IDStatus '+
                   'where Bit_obligation = 1 and IDMethodEdition = M.IDMethodEdition)))';
           tempDataSet2.Open;
           Items[i,10]:= tempDataSet2.FieldByName('CountFactTime').Value;
           Items[i,15]:= tempDataSet2.FieldByName('DateTransitionInState').Value;
           Items[i,16]:= tempDataSet2.FieldByName('Mark').Value;
           tempDataSet2.Close;
           inc(i);
         end;
        tempDataSet1.Next;
        NextStep(1,'Идет загрузка данных');
      end;
    end;
    except
      on E:Exception do
      begin
        raise EApplicationException.Create('Произошла ошибка при экспорте данных в Excel.',E);
        exit;
      end;
    end;

  finally
    if Assigned(tempDataSet1) then
         tempDataSet1.Free;
    if Assigned(tempDataSet2) then
         tempDataSet2.Free;
  end;

     Rang:= Range['A10', 'P'+IntToStr(i-1)];
     Rang.Borders.Weight:=2;

     Items[i+2,2]:= 'Итого:';

     Items[i+2,4]:= 'годовой объем на УМР:';

     Items[i+2,5].Font.Bold:= true;
     Items[i+2,5]:= FloatToStrF(YearVolMW, ffFixed, 10, 2) + ' час.';

     Rang:= Range['F'+IntToStr(i+2), 'G'+IntToStr(i+2)];
     Rang.Merge(true);
     Items[i+2,6]:= 'запланировано:';

     Rang:= Range['H'+IntToStr(i+2), 'I'+IntToStr(i+2)];
     Rang.Merge(true);
     Rang.Font.Bold:= true;
     Items[i+2,8]:= FloatToStrF(PlanVolMW[0], ffFixed, 10, 2) + ' час.';

     Rang:= Range['K'+IntToStr(i+2), 'M'+IntToStr(i+2)];
     Rang.Merge(true);
     Items[i+2,11]:= 'запланировано (эксперт):';

     Rang:= Range['N'+IntToStr(i+2), 'O'+IntToStr(i+2)];
     Rang.Merge(true);
     Rang.Font.Bold:= true;
     Items[i+2,14]:= FloatToStrF(PlanVolMW[1], ffFixed, 10, 2) + ' час.';

     Rang:= Range['F'+IntToStr(i+3), 'G'+IntToStr(i+3)];
     Rang.Merge(true);
     Items[i+3,6]:= 'выполнено:';

     Rang:= Range['H'+IntToStr(i+3), 'I'+IntToStr(i+3)];
     Rang.Merge(true);
     Rang.Font.Bold:= true;
     Items[i+3,8]:= FloatToStrF(PlanVolMW[2], ffFixed, 10, 2) + ' час.';

     Rang:= Range['K'+IntToStr(i+3), 'M'+IntToStr(i+3)];
     Rang.Merge(true);
     Items[i+3,11]:= 'выполнено (эксперт):';

     Rang:= Range['N'+IntToStr(i+3), 'O'+IntToStr(i+3)];
     Rang.Merge(true);
     Rang.Font.Bold:= true;
     Items[i+3,14]:= FloatToStrF(PlanVolMW[3], ffFixed, 10, 2) + ' час.';

     Rang:= Range['F'+IntToStr(i+4), 'G'+IntToStr(i+4)];
     Rang.Merge(true);
     Items[i+4,6]:= 'выполнено по факту:';

     Rang:= Range['H'+IntToStr(i+4), 'I'+IntToStr(i+4)];
     Rang.Merge(true);
     Rang.Font.Bold:= true;
     Items[i+4,8]:= FloatToStrF(PlanVolMW[4], ffFixed, 10, 2) + ' час.';

     //ExAppl.Visible:= true;
     //ExAppl.DisplayAlerts:= true;

  Show;
end;

function TPrepodPlanReport.GetTotalSteps: Integer;
begin
  if Assigned(tempDataSet1) and (tempDataSet1.RecordCount <> 0) then
    result:= tempDataSet1.RecordCount
  else Result:= 1;
end;

procedure TPrepodPlanReport.Init;
begin
  inherited;
  tempDataSet1:= TADODataSet.Create(nil);
  tempDataSet1.Connection:= dm.DBConnect;
  tempDataSet1.CommandText:= {'select Discpl, NameWork, NameMethodEdition, IDMethodEdition, Code, Characteristic, Volume, Drawing, Mark, Position, IDMethodWork, IDMethodEditionPlan, '+
  'DateTransitionInState, Bit_coautor, IDWarrant, NameWarrant, IDContentNorm, Norma, NormaExpert, NameUnit, '+
  'itab_n, IDPlanMW, Bit_plan_fact, cName_disc, BitEdition, CurrentBitEdition, CountFactTime '+
  'from MW_ViewPlanFact inner join MW_DiscEdition() ON MW_ViewPlanFact.IDMethodEdition = MW_DiscEdition.ID '+
  'WHERE (itab_n = ' + IntToStr(PrepIK) + ') and (IDPlanMW = ' + IntToStr(PlanIK) + ') '+
  'order by cName_disc, DateTransitionInState'; }

  'select ID1, Discpl, Uch, NameWork, NameMethodEdition, IDMethodEdition, Code, Characteristic, Volume, Drawing, Mark, Position, IDMethodWork, IDMethodEditionPlan, '+
  'DateTransitionInState, Bit_coautor, IDWarrant, NameWarrant, IDContentNorm, Norma, NormaExpert, NameUnit, '+
  'itab_n, IDPlanMW, Bit_plan_fact, cName_disc, BitEdition, CurrentBitEdition, CountFactTime '+
  'from MW_PlanFactPrep() '+
  'left join MW_ViewPlanFact '+
  'ON MW_PlanFactPrep.ID2 = MW_ViewPlanFact.IDMethodEdition inner join MW_DiscEdition() ON MW_ViewPlanFact.IDMethodEdition = MW_DiscEdition.ID '+
  'inner join MW_UchPlanEdition() ON MW_ViewPlanFact.IDMethodEdition = MW_UchPlanEdition.ID '+
  'WHERE (itab_n = ' + IntToStr(PrepIK) + ') and (IDPlanMW = ' + IntToStr(PlanIK) + ') '+
  'or (ID1+itab_n in (select IDMethodEdition+itab_n from MW_ViewPlanFact where (itab_n = ' + IntToStr(PrepIK) + ') and (IDPlanMW = ' + IntToStr(PlanIK) + '))) '+
  'order by DateTransitionInState, cName_disc, ID1, Bit_plan_fact desc';
  tempDataSet1.Open;
end;

end.
