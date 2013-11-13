unit MW_DepPlanRep;
{#Author nnikolenko@ist.ugtu.net}
interface

uses Classes, SysUtils , Dialogs, ExcelXP, ADODB, Windows,
     ReportsBase, uDMMethodWork, uDM, DateUtils, ApplicationController, ExceptionBase;

type
  TDepPlanReport = class(TExcelReportBase)
  private
    //FTotalSteps: Integer;
    FKafIK: integer;
    FYearPlan: string;
    FYearVolMW, FPlanVolMW, FPlanExpertVolMW: double;
  protected
    procedure Execute; override;
    function GetTotalSteps:Integer; override;
  public
    constructor Create(Aowner:TComponent); override;
    property KafIK: integer read FKafIK write FKafIK;
    property YearPlan: string read FYearPlan write FYearPlan;
    property YearVolMW: double read FYearVolMW write FYearVolMW;
  end;


implementation

{ TPrepodPlanReports }

constructor TDepPlanReport.Create(Aowner:TComponent);
begin
  inherited;
  //FTotalSteps := -1;
end;

procedure TDepPlanReport.Execute;
var str: string;
    Rang: Variant;
    i, N: integer;
    tempDataSet1, tempDataSet2: TADODataSet;
    sumFact, sumFactEx: double;
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
       //выводим название кафедры
       tempDataSet1:= TADODataSet.Create(nil);
       tempDataSet1.Connection:= dm.DBConnect;
       tempDataSet1.CommandText:= 'Select cname_kaf From kafedra where (ik_kaf = '+ IntToStr(KafIK) +')';
       tempDataSet1.Open;
       Replace('#FIO#', tempDataSet1.FieldByName('cname_kaf').AsString);
     except
       on E:Exception do
       begin
         raise EApplicationException.Create('Произошла ошибка при экспорте данных в Excel.',E);
         exit;
       end;
     end;
     finally
       tempDataSet1.Free;
     end;

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
     Replace('#Date#', IntToStr(DayOf(Date)));
     Replace('#Month#', str); //FormatDateTime('mmmm', Date));
     Replace('#Year#', IntToStr(YearOf(Date)));
     Replace('#YY#', YearPlan);

  try
  try
     tempDataSet2:= TADODataSet.Create(nil);
     tempDataSet2.Connection:= dm.DBConnect;

     dmMethodWork.adsPlanDep.First;
     i:= 10; N:= 0; sumFact:= 0; sumFactEx:= 0;
     while (not dmMethodWork.adsPlanDep.Eof) do //and (i <= 10+dmMethodWork.adsPlanPrep.RecordCount) do
       begin
        inc(N);
        Items[i,1]:= IntToStr(N);
        Items[i,2]:= dmMethodWork.adsPlanDep.FieldByName('Discpl').Value;
        Items[i,3]:= dmMethodWork.adsPlanDep.FieldByName('NameWork').Value;
        Items[i,4]:= dmMethodWork.adsPlanDep.FieldByName('NameMethodEdition').Value;
        Items[i,5]:= dmMethodWork.adsPlanDep.FieldByName('Characteristic').Value;
        Items[i,6]:= dmMethodWork.adsPlanDep.FieldByName('Volume').Value;
        Items[i,7]:= dmMethodWork.adsPlanDep.FieldByName('Norma').AsString + ' ч. ' + dmMethodWork.adsPlanDep.FieldByName('NameUnit').AsString;
        Items[i,8]:= dmMethodWork.adsPlanDep.FieldByName('Drawing').Value;
        Items[i,9]:= dmMethodWork.adsPlanDep.FieldByName('Code').Value;
        Items[i,10]:= dmMethodWork.adsPlanDep.FieldByName('Position').Value;
        Items[i,11]:= dmMethodWork.adsPlanDep.FieldByName('DateTransitionInState').Value;
        Items[i,14]:= dmMethodWork.adsPlanDep.FieldByName('Pr').Value;

  tempDataSet2.CommandText:= 'Select Mark, DateTransitionInState, Norma*Volume as Norm, NormaExpert*Volume as NormEx From MethodEdition as M inner join MW_State ON M.IDMethodEdition = MW_State.IDMethodEdition '+
                   'inner join MethodWork_NormOfTime ON M.IDContentNorm = MethodWork_NormOfTime.IDContentNorm '+
                   'where (M.IDMethodEdition = '+ IntToStr(dmMethodWork.adsPlanDep.FieldByName('IDMethodEditionPlan').AsInteger) +')and (Bit_plan_fact = 0)and (IDStatus = (select IDStatus from dbo.MW_State where IDMethodEdition = M.IDMethodEdition '+
                   'and DateTransitionInState = (select max(DateTransitionInState) from MW_State inner join MW_Status '+
                   'ON MW_State.IDStatus = MW_Status.IDStatus '+
                   'where Bit_obligation = 1 and IDMethodEdition = M.IDMethodEdition)))';
  tempDataSet2.Open;
  Items[i,12]:= tempDataSet2.FieldByName('DateTransitionInState').Value;
  Items[i,13]:= tempDataSet2.FieldByName('Mark').Value;
  sumFact:= sumFact + tempDataSet2.FieldByName('Norm').AsFloat;
  sumFactEx:= sumFactEx + tempDataSet2.FieldByName('NormEx').AsFloat;
  tempDataSet2.Close;

  FPlanVolMW:= FPlanVolMW + (dmMethodWork.adsPlanDep.FieldByName('Norma').Value * dmMethodWork.adsPlanDep.FieldByName('Volume').Value);
  FPlanExpertVolMW:= FPlanExpertVolMW + (dmMethodWork.adsPlanDep.FieldByName('NormaExpert').Value * dmMethodWork.adsPlanDep.FieldByName('Volume').Value);

        dmMethodWork.adsPlanDep.Next;
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
    tempDataSet2.Free;
  end;

     Rang:= Range['A10', 'N'+IntToStr(i-1)];
     Rang.Borders.Weight:=2;

     Items[i+2,2]:= 'Итого:';
     Items[i+2,3]:= 'годовой объем на УМР:';
     Items[i+2,4].Font.Bold:= true;
     Items[i+2,4]:= FloatToStrF(YearVolMW, ffFixed, 10, 2) + ' час.';
     Items[i+2,5]:= 'запланировано:';
     Rang:= Range['F'+IntToStr(i+2), 'G'+IntToStr(i+2)];
     Rang.Merge(true);
     Rang.Font.Bold:= true;
     Items[i+2,6]:= FloatToStrF(FPlanVolMW, ffFixed, 10, 2) + ' час.';;
     Rang:= Range['H'+IntToStr(i+2), 'J'+IntToStr(i+2)];
     Rang.Merge(true);
     Items[i+2,8]:= 'запланировано (эксперт):';
     Rang:= Range['K'+IntToStr(i+2), 'L'+IntToStr(i+2)];
     Rang.Merge(true);
     Rang.Font.Bold:= true;
     Items[i+2,11]:= FloatToStrF(FPlanExpertVolMW, ffFixed, 10, 2) + ' час.';

     Items[i+3,5]:= 'выполнено:';
     Rang:= Range['F'+IntToStr(i+3), 'G'+IntToStr(i+3)];
     Rang.Merge(true);
     Rang.Font.Bold:= true;
     Items[i+3,6]:= FloatToStrF(sumFact, ffFixed, 10, 2) + ' час.';;
     Rang:= Range['H'+IntToStr(i+3), 'J'+IntToStr(i+3)];
     Rang.Merge(true);
     Items[i+3,8]:= 'выполнено (эксперт):';
     Rang:= Range['K'+IntToStr(i+3), 'L'+IntToStr(i+3)];
     Rang.Merge(true);
     Rang.Font.Bold:= true;
     Items[i+3,11]:= FloatToStrF(sumFactEx, ffFixed, 10, 2) + ' час.';

     //ExAppl.Visible:= true;
     //ExAppl.DisplayAlerts:= true;

  Show;
end;

function TDepPlanReport.GetTotalSteps: Integer;
begin
  result:= dmMethodWork.adsPlanDep.RecordCount;
end;

end.
