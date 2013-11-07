unit N_FactDeps;
{#Author sergdev@ist.ugtu.net}
interface

uses
  Classes, dialogs ,SysUtils, ExcelXP, Barcode, Contnrs, XIntf, CommonIntf, ReportsBase, db, adodb, uDm, Graphics;

const TableBeg = 5;

type
    TNagrFactDepartmentsReport = class(TExcelReportBase)
    protected
       FDataset:TADODataset;
       FYear:string;
       FIkYear:integer;
       FSemType:integer;
       FEdType:integer;
       FShift:integer;
       FSecondRun:boolean;

       FCurFirst:integer;
       FCurNum:integer;

       FFacLessons:integer;
       FFacLections:integer;
       FFacGradLessons:integer;
       FFacGradLections:integer;
       FAllLessons:integer;
       FAllLections:integer;
       FAllGradLessons:integer;
       FAllGradLections:integer;

       procedure AddFooter;
       procedure FillDepartment;
       procedure AddFacFooter(name:string);
       procedure IncSums;

       procedure Execute;override;
       function GetTotalSteps:Integer;override;
    public
       constructor Create (AOwner : TComponent; ik_year:integer; year:string; typesem:integer; ik_typeed:integer);

    end;

    implementation

  constructor TNagrFactDepartmentsReport.Create (AOwner : TComponent; ik_year:integer; year:string; typesem:integer; ik_typeed:integer);
  begin
  FIkYear :=  ik_year;
  FYear := year;
  FEdType := ik_typeed;
  FSemType := typesem;
  FShift:=0;
  FSecondRun:=false;

  FDataset := TADODataSet.Create(Owner);
  FDataset.Connection:= dm.DBConnect;
  FDataset.Active:=false;
  if typesem = 3 then FDataset.CommandText:='select * from [dbo].[Pattern_OrderExecYear](3,'+inttostr(FIKYear)+','+inttostr(FEdType)+') ORDER BY Cname_fac, Cname_kaf DESC' else
  FDataset.CommandText:='select * from [dbo].[Pattern_OrderExecSemester](3,'+inttostr(FIKYear)+','+inttostr(FSemType)+','+inttostr(FEdType)+') ORDER BY Cname_fac, Cname_kaf DESC';
  FDataset.Active:=true;
  FDataset.First;
  end;

  procedure TNagrFactDepartmentsReport.IncSums;
  begin
  FAllLessons:=FAllLessons+FFacLessons;
  FAllLections:=FAllLections+FFacLections;
  FAllGradLessons:=FAllGradLessons+FFacGradLessons;
  FAllGradLections:=FAllGradLections+FFacGradLections;
  end;

  procedure TNagrFactDepartmentsReport.AddFacFooter(name:string);
  var i:integer;
  begin

  if not FSecondRun then
  begin
  // вставляем ячейки из резерва
   Range['A6','J6'].font.bold:=true;
   Range['A6','J6'].font.color:=clRed;
   Range['A6','J6'].interior.color:=clSilver;
   Range['A6','J6'].Copy(Items[TableBeg+FShift,1]);
   Range['A6','J6'].font.color:=clBlack;
   Range['A6','J6'].interior.color:=clWhite;
   Range['A6','J6'].font.bold:=false;

   Items[TableBeg+FShift,1] := inttostr(FCurFirst)+'.-'+inttostr(FCurNum)+'.';
   Items[TableBeg+FShift,2] := name;
  end;

  // заполняем кортеж
   i:= TableBeg+Fshift;

   Items[i,3] := FFacLessons;
   Items[i,4] := FFacLections;
   Items[i,6] := FFacGradLessons;
   Items[i,8] := FFacGradLections;

   if (FFacLessons>0)and(FFacGradLessons>0)and(FFacLections>0) then begin

   Items[i,5] := (FFacLections/FFacLessons)*100;
   Items[i,7] := (FFacGradLessons/FFacLessons)*100;
   Items[i,9] := (FFacGradLections/FFacGradLessons)*100;
   Items[i,10] := (FFacGradLections/FFacLections)*100;
   end;

   FShift:=FShift+1;
  end;

  procedure TNagrFactDepartmentsReport.AddFooter;
  var i:integer;
  begin

  if not FSecondRun then
  begin
  // вставляем ячейки из резерва
   Range['A6','J6'].font.color:=clRed;
   Range['A6','J6'].font.size:=11;
   Range['A6','J6'].interior.color:=clSilver;
   Range['A6','J6'].Copy(Items[TableBeg+FShift,1]);
   Range['A6','J6'].font.color:=clBlack;
   Range['A6','J6'].font.size:=8;
   Range['A6','J6'].interior.color:=clWhite;

   Items[TableBeg+FShift,1] := '1.-'+inttostr(FCurNum)+'.';
   Items[TableBeg+FShift,2] := 'Итого';
  end;

  // заполняем кортеж

   i:= TableBeg+Fshift;

   Items[i,3] := FAllLessons;
   Items[i,4] := FAllLections;
   Items[i,6] := FAllGradLessons;
   Items[i,8] := FAllGradLections;

   if (FAllLessons>0)and(FAllGradLessons>0)and(FAllLections>0) then begin

   Items[i,5] := (FAllLections/FAllLessons)*100;
   Items[i,7] := (FAllGradLessons/FAllLessons)*100;
   Items[i,9] := (FAllGradLections/FAllGradLessons)*100;
   Items[i,10] := (FAllGradLections/FAllLections)*100;

   end;

  end;

  procedure TNagrFactDepartmentsReport.FillDepartment;
  var i:integer;
  begin
      inc(FCurNum);

    // вставляем ячейки
      i:= TableBeg + Fshift;

      if not FSecondRun then
      begin

      if FShift>1 then
      Range['A6','J6'].Copy(Items[i,1]);

      Items[i,1] := inttostr(FCurNum)+'.';
      Items[i,2] := FDataset.FieldByName('Cname_kaf').Value;

      end;

      Items[i,3] := FDataset.FieldByName('all_fact').Value;
      Items[i,4] := FDataset.FieldByName('vid_fact').Value;
      Items[i,6] := FDataset.FieldByName('step_all').Value;
      Items[i,8] := FDataset.FieldByName('step_vid').Value;

      FFacLessons:=FFacLessons+FDataset.FieldByName('all_fact').Value;;
      FFacLections:=FFacLections+FDataset.FieldByName('vid_fact').Value;;
      FFacGradLessons:=FFacGradLessons+FDataset.FieldByName('step_all').Value;
      FFacGradLections:=FFacGradLections+FDataset.FieldByName('step_vid').Value;

      FShift:= FShift+1;
  end;

  procedure TNagrFactDepartmentsReport.Execute;
  var
    i,NameDatasetNum: Integer;
    FacName, sem:string;
  begin
     // заполняем шапку
  FAllLessons:=0;
  FAllLections:=0;
  FAllGradLessons:=0;
  FAllGradLections:=0;
  FFacLessons:=0;
  FFacLections:=0;
  FFacGradLessons:=0;
  FFacGradLections:=0;
  FCurFirst:=1;

    if Fsemtype=1 then
    sem := 'осенний семестр' else
    if Fsemtype=2 then
    sem := 'весенний семестр';

    if FSemtype < 3 then
    Items[2,3] := 'за '+sem+' '+FYear+' уч. года'
    else Items[2,3] := 'за '+FYear+' учебный год';
    
    FacName:= '';

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
          FFacGradLessons:=0;
          FFacGradLections:=0;
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
  function TNagrFactDepartmentsReport.GetTotalSteps: Integer;
  begin
  Result := FDataset.RecordCount;
  end;

end.
