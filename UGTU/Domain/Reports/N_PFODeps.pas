unit N_PFODeps;
{#Author sergdev@ist.ugtu.net}
interface

uses
  Classes, dialogs ,SysUtils, ExcelXP, Barcode, Contnrs, XIntf, CommonIntf, ReportsBase, db, adodb, uDm, Graphics, N_FactDeps;

const TableBeg = 5;

type
    TNagrPFODepartmentsReport = class(TNagrFactDepartmentsReport)
    protected

       FFacLessons:integer;
       FFacLections:integer;
       FFacHourLessons:integer;

       FTotalLessons:integer;
       FTotalLections:integer;
       FTotalHourLessons:integer;

       procedure AddFooter;
       procedure FillDepartment;
       procedure AddFacFooter(name:string);
       procedure IncSums;

       procedure Execute;override;
       function GetTotalSteps:Integer;override;
    public
       constructor Create (AOwner : TComponent; ik_year:integer; year:string; ik_typeed:integer);

    end;

    implementation

  constructor TNagrPFODepartmentsReport.Create (AOwner : TComponent; ik_year:integer; year:string; ik_typeed:integer);
  begin
  FIkYear :=  ik_year;
  FYear := year;
  FEdType := ik_typeed;
  FShift:=0;
  FSecondRun:=false;

  FDataset := TADODataSet.Create(Owner);
  FDataset.Connection:= dm.DBConnect;
  FDataset.Active:=false;
  FDataset.CommandText:='select * from [dbo].[Pattern_PlanForYear]('+inttostr(FIKYear)+','+inttostr(FEdType)+')';FDataset.Active:=true;
  FDataset.First;
  end;

  procedure TNagrPFODepartmentsReport.IncSums;
  begin
  FTotalLessons:=FTotalLessons+FFacLessons;
  FTotalLections:=FTotalLections+FFacLections;
  FTotalHourLessons:=FTotalHourLessons+FFacHourLessons;
  end;

  procedure TNagrPFODepartmentsReport.AddFacFooter(name:string);
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
  end;

  // заполняем кортеж
   i:= TableBeg+Fshift;

   Items[i,3] := FFacLessons;
   Items[i,4] := FFacLections;
   Items[i,5] := FFacHourLessons;

   FShift:=FShift+1;

  end;

  procedure TNagrPFODepartmentsReport.AddFooter;
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
  end;

  // заполняем кортеж

   i:= TableBeg+Fshift;

   Items[i,3] := FTotalLessons;
   Items[i,4] := FTotalLections;
   Items[i,5] := FTotalHourLessons;

  end;

  procedure TNagrPFODepartmentsReport.FillDepartment;
  var i:integer;
  begin
      inc(FCurNum);

    // вставляем ячейки
      i:= TableBeg + Fshift;

      if not FSecondRun then
      begin

      if FShift>1 then
      Range['A6','F6'].Copy(Items[i,1]);

      Items[i,1] := inttostr(FCurNum)+'.';
      Items[i,2] := FDataset.FieldByName('Cname_kaf').Value;

      end;

      Items[i,3] := FDataset.FieldByName('summ').Value+FDataset.FieldByName('Hour_teach').Value;
      Items[i,4] := FDataset.FieldByName('lekc').Value;
      Items[i,5] := FDataset.FieldByName('Hour_teach').Value;

      FFacLessons:=FFacLessons+FDataset.FieldByName('summ').Value+FDataset.FieldByName('Hour_teach').Value;;
      FFacLections:=FFacLections+FDataset.FieldByName('lekc').Value;;
      FFacHourLessons:=FFacHourLessons+FDataset.FieldByName('Hour_teach').Value;

      FShift:= FShift+1;
  end;

  procedure TNagrPFODepartmentsReport.Execute;
  var
    i,NameDatasetNum: Integer;
    FacName, sem:string;
  begin
     // заполняем шапку
  FTotalLessons:=0;
  FTotalLections:=0;
  FTotalHourLessons:=0;

  FFacLessons:=0;
  FFacLections:=0;
  FFacHourLessons:=0;

  FCurFirst:=1;

  Items[4,1] := 'на '+FYear+' учебный год';

    // строим таблицу
    while not FDataset.eof do
    begin
      NextStep(1,'Построение отчета: кафедра '+FDataset.FieldByName('CName_kaf').Value);

      if FacName<>FDataset.FieldByName('CName_fac').Value then
      begin
        if FacName<>'' then
        begin
          IncSums;
          AddFacFooter(FacName);
          FCurFirst:=FCurNum+1;
          FFacLessons:=0;
          FFacLections:=0;
          FFacHourLessons:=0;
          FacName:=FDataset.FieldByName('CName_fac').Value;
        end
        else
        begin
          FacName:=FDataset.FieldByName('CName_fac').Value;
          inc(FShift);
        end;
      end;
      FillDepartment;
      FDataset.Next;
    end;

    AddFacFooter(FacName);
    // Добавляем итог
    AddFooter;

  end;

  //Определим общее число шагов в создании рапорта
  //Реальное число шагов скорее всего будет равно количеству
  //записей, возвращённых запросом для отчёта
  //Example: Result := MyDataSet.Recordscount;
  function TNagrPFODepartmentsReport.GetTotalSteps: Integer;
  begin
  Result := FDataset.RecordCount;
  end;

end.
