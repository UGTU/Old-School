unit N_YearsLectComparison;

{#Author sergdev@ist.ugtu.net}
interface

uses
  Classes, dialogs ,SysUtils, ExcelXP, Barcode, Contnrs, XIntf, CommonIntf, ReportsBase, db, adodb, uDm, N_YearsComparison, N_YearsCommonComparison,Graphics;

const TableBeg = 6;

type
    TNagrYearLectComparisonReport = class(TNagrYearCommonComparisonReport)
    protected
       procedure Execute;override;
       function GetTotalSteps:Integer;override;
       procedure FillDepartment;
    public
       constructor Create (AOwner : TComponent; ik_year1:integer; ik_year2:integer; year1:string; year2:string; ik_typeed:integer);

    end;

    implementation

  constructor TNagrYearLectComparisonReport.Create (AOwner : TComponent; ik_year1:integer; ik_year2:integer; year1:string; year2:string; ik_typeed:integer);
  begin
  inherited Create(AOwner, ik_year1, ik_year2, year1, year2, ik_typeed);
  end;

  procedure TNagrYearLectComparisonReport.FillDepartment;
  var i:integer;
  sum:real;
  begin
      inc(FCurNum);
    // вставляем ячейки
      i:= TableBeg + Fshift;

      // здесь нужен расчет суммы нагрузки
      sum:= FDataset.FieldByName('hour_teach').Value;

      if not FSecondRun then
      begin

      if FShift>0 then
      Range['A6','F6'].Copy(Items[i,1]);

      Items[i,1] := inttostr(FCurNum)+'.';
      Items[i,2] := FDataset.FieldByName('Cname_kaf').Value;
      Items[i,3] := sum;
      end
      else
      Items[i,4] := sum;

      FacHours:=FacHours+sum;
      FShift:= FShift+1;
  end;

  procedure TNagrYearLectComparisonReport.Execute;
  var FacName:string;
  begin
     // заполняем шапку

    Items[5,3] := 'Лекционная нагрузка '+FYear1;
    Items[5,4] := 'Лекционная нагрузка '+FYear2;
    // загружаем данные первого года
    FacName:='';
    FacHours:=0;
    FCurFirst:=1;
    FCurNum:=0;
    TotalHours:=0;

    while not FDataset.eof do
    begin
      NextStep(1,'Построение отчета: кафедра '+FDataset.FieldByName('CName_kaf').Value);
      if FacName<>FDataset.FieldByName('CName_fac').Value then
      begin
        if FacName<>'' then
        begin
          TotalHours := TotalHours + FacHours;
          AddFacFooter(FacName);
          FacHours:=0;
          FCurFirst:=FCurNum+1;
          FacName:=FDataset.FieldByName('CName_fac').Value;
        end
        else
        begin
          FacName:=FDataset.FieldByName('CName_fac').Value;
          //inc(FShift);
        end;
      end;
      if FDataset.FieldByName('is_plan').Value then
      FillDepartment;
      FDataset.Next;
    end;

    TotalHours := TotalHours + FacHours;
    AddFacFooter(FacName);
    AddFooter;

    FDataset.Active:=false;
    FDataset.CommandText:='select * from [dbo].[Pattern_PlanForYear]('+inttostr(FYearKey2)+','+inttostr(FEdType)+')';
    FDataset.Active:=true;
    FDataset.First;

    FacName:='';
    FacHours:=0;
    TotalHours:=0;
    FSecondRun:=true;
    FShift:=0;

    while not FDataset.eof do
    begin
      NextStep(1,'Построение отчета: кафедра '+FDataset.FieldByName('CName_kaf').Value);
      if FacName<>FDataset.FieldByName('CName_fac').Value then
      begin
        if FacName<>'' then
        begin
          TotalHours := TotalHours + FacHours;
          AddFacFooter(FacName);
          FacHours:=0;
          FacName:=FDataset.FieldByName('CName_fac').Value;
        end
        else
        begin
          FacName:=FDataset.FieldByName('CName_fac').Value;
          //inc(FShift);
        end;
      end;
      if FDataset.FieldByName('is_plan').Value then
      FillDepartment;
      FDataset.Next;
    end;

    TotalHours := TotalHours + FacHours;
    AddFacFooter(FacName);
    AddFooter;

  end;

  //Определим общее число шагов в создании рапорта
  //Реальное число шагов скорее всего будет равно количеству
  //записей, возвращённых запросом для отчёта
  //Example: Result := MyDataSet.Recordscount;
  function TNagrYearLectComparisonReport.GetTotalSteps: Integer;
  begin
    Result := FDataset.RecordCount*2;
  end;

end.
