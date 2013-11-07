unit N_YearsCommonComparison;
{#Author sergdev@ist.ugtu.net}
interface

uses
  Classes, dialogs ,SysUtils, ExcelXP, Barcode, Contnrs, XIntf, CommonIntf, ReportsBase, db, adodb, uDm, N_YearsComparison, Graphics;

const TableBeg = 6;

type
    TNagrYearCommonComparisonReport = class(TNagrYearComparisonReport)
    protected
       FacHours :real;
       TotalHours:real;
       FCurFirst:integer;
       FCurNum:integer;
       FSecondRun:boolean;
       FShift:integer;
       procedure AddFacFooter(name:string);
       procedure AddFooter;
       procedure FillDepartment;
       procedure Execute;override;
       function GetTotalSteps:Integer;override;
    public
       constructor Create (AOwner : TComponent; ik_year1:integer; ik_year2:integer; year1:string; year2:string; ik_typeed:integer);

    end;

    implementation

  constructor TNagrYearCommonComparisonReport.Create (AOwner : TComponent; ik_year1:integer; ik_year2:integer; year1:string; year2:string; ik_typeed:integer);
  begin
  FYear1 :=  year1;
  FYear2 :=  year2;
  FYearKey1 :=  ik_year1;
  FYearKey2 :=  ik_year2;
  FEdType := ik_typeed;

  if FDataset = nil then
     FDataset := TADODataSet.Create(Owner);
     FDataset.Connection:= dm.DBConnect;

  FDataset.Active:=false;
  FDataset.CommandText:='select * from [dbo].[Pattern_PlanForYear]('+inttostr(FYearKey1)+','+inttostr(FEdType)+')';
  FDataset.Active:=true;
  FDataset.First;
  end;

  procedure TNagrYearCommonComparisonReport.AddFacFooter(name:string);
  var i:integer;
  begin
  if not FSecondRun then
  begin
  // вставляем ячейки из резерва
   Range['A6','F6'].font.bold:=true;
   Range['A6','F6'].font.color:=clRed;
   Range['A6','F6'].interior.color:=clSilver;
   Range['A6','F6'].Copy(Items[TableBeg+FShift,1]);
   Range['A6','F6'].font.color:=clBlack;
   Range['A6','F6'].interior.color:=clWhite;
   Range['A6','F6'].font.bold:=false;

   Items[TableBeg+FShift,1] := inttostr(FCurFirst)+'.-'+inttostr(FCurNum)+'.';
   Items[TableBeg+FShift,2] := name;
   Items[TableBeg+FShift,3] := FacHours;
  end
  else
  Items[TableBeg+FShift,4] := FacHours;

  FShift:=FShift+1;
  end;

  procedure TNagrYearCommonComparisonReport.AddFooter;
  var i:integer;
  begin

  if not FSecondRun then
  begin
  // вставляем ячейки из резерва
   Range['A6','F6'].font.color:=clRed;
   Range['A6','F6'].font.size:=11;
   Range['A6','F6'].interior.color:=clSilver;
   Range['A6','F6'].Copy(Items[TableBeg+FShift,1]);
   Range['A6','F6'].font.color:=clBlack;
   Range['A6','F6'].font.size:=8;
   Range['A6','F6'].interior.color:=clWhite;

   Items[TableBeg+FShift,1] := '1.-'+inttostr(FCurNum)+'.';
   Items[TableBeg+FShift,2] := 'Итого';
   Items[TableBeg+FShift,3] := TotalHours;
  end
  else

  // заполняем кортеж

   Items[TableBeg+FShift,4] := TotalHours;

  end;

  procedure TNagrYearCommonComparisonReport.FillDepartment;
  var i:integer;
  sum:real;
  begin
      inc(FCurNum);
    // вставляем ячейки
      i:= TableBeg + Fshift;

      // здесь нужен расчет суммы нагрузки
      sum:= FDataset.FieldByName('Summ').Value;

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

  procedure TNagrYearCommonComparisonReport.Execute;
  var FacName:string;
  begin
     // заполняем шапку

    Items[3,1] := 'в сравнении '+FYear1+' с '+FYear2+' уч.гг.';
    Items[5,3] := 'Общая нагрузка '+FYear1;
    Items[5,4] := 'Общая нагрузка '+FYear2;
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
  function TNagrYearCommonComparisonReport.GetTotalSteps: Integer;
  begin
    Result := FDataset.RecordCount*2;
  end;

end.
