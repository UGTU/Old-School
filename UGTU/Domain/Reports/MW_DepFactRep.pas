unit MW_DepFactRep;
{#Author nnikolenko@ist.ugtu.net}
interface

uses Classes, SysUtils , Dialogs, ExcelXP, ADODB, Windows,
     ReportsBase, uDMMethodWork, uDM, DateUtils, ApplicationController, ExceptionBase;

type
  TDepFactReport = class(TExcelReportBase)
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

constructor TDepFactReport.Create(Aowner:TComponent);
begin
  inherited;
  //FTotalSteps := -1;
end;

procedure TDepFactReport.Execute;
var str: string;
    Rang: Variant;
    i, N: integer;
    tempDataSet1, tempDataSet2: TADODataSet;
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

     dmMethodWork.adsDepFactAllPrepAllDisc.First;
     i:= 10; N:= 0;
     while (not dmMethodWork.adsDepFactAllPrepAllDisc.Eof) do //and (i <= 10+dmMethodWork.adsPlanPrep.RecordCount) do
       begin
        inc(N);
        Items[i,1]:= IntToStr(N);
        Items[i,2]:= dmMethodWork.adsDepFactAllPrepAllDisc.FieldByName('Discpl').Value;
        Items[i,3]:= dmMethodWork.adsDepFactAllPrepAllDisc.FieldByName('NameWork').Value;
        Items[i,4]:= dmMethodWork.adsDepFactAllPrepAllDisc.FieldByName('NameMethodEdition').Value;
        Items[i,5]:= dmMethodWork.adsDepFactAllPrepAllDisc.FieldByName('Characteristic').Value;
        Items[i,6]:= dmMethodWork.adsDepFactAllPrepAllDisc.FieldByName('Volume').Value;
        Items[i,7]:= dmMethodWork.adsDepFactAllPrepAllDisc.FieldByName('Norma').AsString + ' ч. ' + dmMethodWork.adsDepFactAllPrepAllDisc.FieldByName('NameUnit').AsString;
        Items[i,8]:= dmMethodWork.adsDepFactAllPrepAllDisc.FieldByName('Drawing').Value;
        Items[i,9]:= dmMethodWork.adsDepFactAllPrepAllDisc.FieldByName('Code').Value;
        Items[i,10]:= dmMethodWork.adsDepFactAllPrepAllDisc.FieldByName('Position').Value;
        Items[i,12]:= dmMethodWork.adsDepFactAllPrepAllDisc.FieldByName('DateTransitionInState').Value;
        Items[i,13]:= dmMethodWork.adsDepFactAllPrepAllDisc.FieldByName('Mark').Value;
        Items[i,14]:= dmMethodWork.adsDepFactAllPrepAllDisc.FieldByName('Pr').Value;

        tempDataSet2.CommandText:= 'Select DateTransitionInState From MethodEdition as M inner join MW_State ON M.IDMethodEdition = MW_State.IDMethodEdition '+
                   'where (M.IDMethodEditionPlan = '+ IntToStr(dmMethodWork.adsDepFactAllPrepAllDisc.FieldByName('IDMethodEdition').AsInteger) +')and (IDStatus = (select IDStatus from dbo.MW_State where IDMethodEdition = M.IDMethodEdition '+
                   'and DateTransitionInState = (select max(DateTransitionInState) from MW_State inner join MW_Status '+
                   'ON MW_State.IDStatus = MW_Status.IDStatus '+
                   'where Bit_obligation = 1 and IDMethodEdition = M.IDMethodEdition)))';
        tempDataSet2.Open;
        Items[i,11]:= tempDataSet2.FieldByName('DateTransitionInState').Value;
        tempDataSet2.Close;

        FPlanVolMW:= FPlanVolMW + (dmMethodWork.adsDepFactAllPrepAllDisc.FieldByName('Norma').Value * dmMethodWork.adsDepFactAllPrepAllDisc.FieldByName('Volume').Value);
        FPlanExpertVolMW:= FPlanExpertVolMW + (dmMethodWork.adsDepFactAllPrepAllDisc.FieldByName('NormaExpert').Value * dmMethodWork.adsDepFactAllPrepAllDisc.FieldByName('Volume').Value);

        dmMethodWork.adsDepFactAllPrepAllDisc.Next;
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
     Items[i+2,5]:= 'выполнено:';
     Rang:= Range['F'+IntToStr(i+2), 'G'+IntToStr(i+2)];
     Rang.Merge(true);
     Rang.Font.Bold:= true;
     Items[i+2,6]:= FloatToStrF(FPlanVolMW, ffFixed, 10, 2) + ' час.';;
     Rang:= Range['H'+IntToStr(i+2), 'J'+IntToStr(i+2)];
     Rang.Merge(true);
     Items[i+2,8]:= 'выполнено (эксперт):';
     Rang:= Range['K'+IntToStr(i+2), 'L'+IntToStr(i+2)];
     Rang.Merge(true);
     Rang.Font.Bold:= true;
     Items[i+2,11]:= FloatToStrF(FPlanExpertVolMW, ffFixed, 10, 2) + ' час.';

     //ExAppl.Visible:= true;
     //ExAppl.DisplayAlerts:= true;

  Show;
end;

function TDepFactReport.GetTotalSteps: Integer;
begin
  result:= dmMethodWork.adsDepFactAllPrepAllDisc.RecordCount;
end;

end.
