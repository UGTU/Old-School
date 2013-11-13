unit N_PlanDepsCompare;
{#Author sergdev@ist.ugtu.net}
interface

uses
  Classes, dialogs ,SysUtils, ExcelXP, Barcode, Contnrs, XIntf, CommonIntf, ReportsBase, db, adodb, uDm, N_DepsSemester;

const TableBeg = 5;

type
    TPlanNagrDepartmentsCompareReport = class(TNagrSemesterDepartmentsReport)
    protected
      FIkYear2:integer;
      FYear2:string;
      FSecondSem:boolean;
      procedure Execute; override;
      procedure AddFacFooter(name:string);
      procedure AddFooter;
      procedure FillDepartment;

      function GetTotalSteps:Integer;override;

    public
      constructor Create (AOwner : TComponent; ik_year1:integer; year1:string; ik_year2:integer; year2:string; ik_typeed:integer);
    end;

implementation

  constructor TPlanNagrDepartmentsCompareReport.Create (AOwner : TComponent; ik_year1:integer; year1:string; ik_year2:integer; year2:string; ik_typeed:integer);
  begin
  FIkYear :=  ik_year1;
  FYear := year1;
  FIkYear2 :=  ik_year2;
  FYear2 := year2;
  FEdType := ik_typeed;
  FShift:=0;

  FDataset := TADODataSet.Create(Owner);
  FDataset.Connection:= dm.DBConnect;
  FDataset.Active:=false;
  FDataset.CommandText:='select * from [dbo].[Pattern_PlanForYear]('+inttostr(FIKYear)+','+inttostr(FEdType)+') ORDER BY Cname_fac, Cname_kaf, Is_plan DESC';
  FDataset.Active:=true;
  FDataset.First;
  end;

  procedure TPlanNagrDepartmentsCompareReport.AddFacFooter(name:string);
  var i:integer;
  begin

  if not FSecondRun then
  begin
  // вставляем ячейки из резерва
   Range['A6','V9'].Copy(Items[TableBeg+FShift,1]);
   Items[TableBeg+FShift,1] := name;
  end;

     // заполняем кортеж

   i:= TableBeg+Fshift;
   Items[i,3] := plect;
   Items[i,4] := ppract;
   Items[i,5] := plab;
   Items[i,6] := pcons;
   Items[i,7] := pcourse;
   Items[i,8] := pdipl;
   Items[i,9] := pexam;
   Items[i,10] := pzach;
   Items[i,11] := ped_pract;
   Items[i,12] := pGEK;
   Items[i,13] := pcontr;
   Items[i,14] := pmagister;
   Items[i,15] := pref;
   Items[i,16] := pcreative;
   Items[i,17] := pserv;
   Items[i,18] := pbus;
   Items[i,19] := paspir;
   Items[i,20] := patt;
   Items[i,21] := pnorm;

   FShift:=FShift+4;

  end;

  procedure TPlanNagrDepartmentsCompareReport.FillDepartment;
  var i:integer;
  begin

      plect := plect + FDataset.FieldByName('lekc').Value;
      ppract := ppract + FDataset.FieldByName('pract_zan').Value;
      plab := plab + FDataset.FieldByName('lab').Value;
      pcons := pcons + FDataset.FieldByName('cons').Value;
      pcourse := pcourse + FDataset.FieldByName('kurs').Value;
      pdipl := pdipl + FDataset.FieldByName('dipl').Value;
      pexam := pexam + FDataset.FieldByName('exam').Value;
      pzach := pzach + FDataset.FieldByName('zach').Value;
      ped_pract := ped_pract + FDataset.FieldByName('uch_prakt').Value;
      pGEK := pGEK + FDataset.FieldByName('GEK').Value;
      pcontr := pcontr + FDataset.FieldByName('kontr').Value;
      pmagister := pmagister + FDataset.FieldByName('magistr').Value;
      pref := pref + FDataset.FieldByName('ref').Value;
      pcreative := pcreative + FDataset.FieldByName('tvorch').Value;
      pserv := pserv + FDataset.FieldByName('obsluzh').Value;
      pbus := pbus + FDataset.FieldByName('delov').Value;
      paspir := paspir + FDataset.FieldByName('aspir').Value;
      patt := patt + FDataset.FieldByName('attest').Value;
      pnorm := pnorm + FDataset.FieldByName('norm').Value;

    // вставляем ячейки
      i:= TableBeg+Fshift;

      if not FSecondRun then
      begin
        if FShift>1 then
          Range['A6','V9'].Copy(Items[i,1]);
        Items[i,1] := FDataset.FieldByName('Cname_kaf').Value;
      end;

      if not FSecondrun then Items[TableBeg+FShift,2] := FYear
      else Items[TableBeg+FShift,2] := FYear2;
    // заполняем кортеж

      Items[i,3] := FDataset.FieldByName('lekc').Value;
      Items[i,4] := FDataset.FieldByName('pract_zan').Value;
      Items[i,5] := FDataset.FieldByName('lab').Value;
      Items[i,6] := FDataset.FieldByName('cons').Value;
      Items[i,7] := FDataset.FieldByName('kurs').Value;
      Items[i,8] := FDataset.FieldByName('dipl').Value;
      Items[i,9] := FDataset.FieldByName('exam').Value;
      Items[i,10] := FDataset.FieldByName('zach').Value;
      Items[i,11] := FDataset.FieldByName('uch_prakt').Value;
      Items[i,12] := FDataset.FieldByName('GEK').Value;
      Items[i,13] := FDataset.FieldByName('kontr').Value;
      Items[i,14] := FDataset.FieldByName('magistr').Value;
      Items[i,15] := FDataset.FieldByName('ref').Value;
      Items[i,16] := FDataset.FieldByName('tvorch').Value;
      Items[i,17] := FDataset.FieldByName('obsluzh').Value;
      Items[i,18] := FDataset.FieldByName('delov').Value;
      Items[i,19] := FDataset.FieldByName('aspir').Value;
      Items[i,20] := FDataset.FieldByName('attest').Value;
      Items[i,21] := FDataset.FieldByName('norm').Value;

      FShift:= FShift+4;
  end;

  procedure TPlanNagrDepartmentsCompareReport.AddFooter;
  var i:integer;
  begin

  if not FSecondRun then
  begin
  // вставляем ячейки из резерва
   Range['A6','V9'].Copy(Items[TableBeg+FShift,1]);
   Items[TableBeg+FShift,1] := 'Итого по университету';
  end;

  // заполняем кортеж
   i:= TableBeg+Fshift;
   Items[i,3] := splect;
   Items[i,4] := sppract;
   Items[i,5] := splab;
   Items[i,6] := spcons;
   Items[i,7] := spcourse;
   Items[i,8] := spdipl;
   Items[i,9] := spexam;
   Items[i,10] := spzach;
   Items[i,11] := sped_pract;
   Items[i,12] := spGEK;
   Items[i,13] := spcontr;
   Items[i,14] := spmagister;
   Items[i,15] := spref;
   Items[i,16] := spcreative;
   Items[i,17] := spserv;
   Items[i,18] := spbus;
   Items[i,19] := spaspir;
   Items[i,20] := spatt;
   Items[i,21] := spnorm;

  end;

  procedure TPlanNagrDepartmentsCompareReport.Execute;
  var
    i,NameDatasetNum: Integer;
    FacName:string;
  begin
     // заполняем шапку
    splect:=0;  sppract:=0;  splab:=0;  spcons:=0;  spzach:=0;  spcourse:=0;  spdipl:=0;  spexam:=0;  sped_pract:=0;  spGEK:=0;  spcontr:=0;  spmagister:=0;  spref:=0;  spcreative:=0;  spserv:=0;  spbus:=0;  spaspir:=0;  spatt:=0;  spnorm:=0;

    Items[2,13] := FYear;
    Items[2,17] := FYear2;
    FacName:= '';

    // строим таблицу
    while not FDataset.eof do
    begin

      NextStep(1,'Построение отчета: кафедра '+FDataset.FieldByName('CName_kaf').Value+', '+FYear);

      if FacName<>FDataset.FieldByName('CName_fac').Value then
      begin
        if FacName<>'' then
        begin
          IncSums;
          AddFacFooter(FacName);
          plect:=0;  ppract:=0;  plab:=0;  pcons:=0;  pzach:=0;  pcourse:=0;  pdipl:=0;  pexam:=0;  ped_pract:=0;  pGEK:=0;  pcontr:=0;  pmagister:=0;  pref:=0;  pcreative:=0;  pserv:=0;  pbus:=0;  paspir:=0;  patt:=0;  pnorm:=0;
          FacName:=FDataset.FieldByName('CName_fac').Value;
          AddFacHeader(FacName);
        end
        else
        begin
          FacName:=FDataset.FieldByName('CName_fac').Value;
          Items[TableBeg,1] := FacName;
          inc(FShift);
        end;
      end;

      if FDataset.FieldByName('is_plan').Value then
      FillDepartment;
      FDataset.Next;
    end;

    AddFacFooter(FacName);
    // Добавляем итог
    AddFooter;

    FDataset.Active:=false;
   FDataset.CommandText:='select * from [dbo].[Pattern_PlanForYear]('+inttostr(FIKYear2)+','+inttostr(FEdType)+') ORDER BY Cname_fac, Cname_kaf, Is_plan DESC';
   FDataset.Active:=true;

    FSecondRun:=true;
    FShift:=1;
    splect:=0;  sppract:=0;  splab:=0;  spcons:=0;  spzach:=0;  spcourse:=0;  spdipl:=0;  spexam:=0;  sped_pract:=0;  spGEK:=0;  spcontr:=0;  spmagister:=0;  spref:=0;  spcreative:=0;  spserv:=0;  spbus:=0;  spaspir:=0;  spatt:=0;  spnorm:=0;
    FacName:= '';

    while not FDataset.eof do
    begin

      NextStep(1,'Построение отчета: кафедра '+FDataset.FieldByName('CName_kaf').Value+', '+FYear2);

      if FacName<>FDataset.FieldByName('CName_fac').Value then
      begin
        if FacName<>'' then
        begin
          IncSums;
          AddFacFooter(FacName);
          plect:=0;  ppract:=0;  plab:=0;  pcons:=0;  pzach:=0;  pcourse:=0;  pdipl:=0;  pexam:=0;  ped_pract:=0;  pGEK:=0;  pcontr:=0;  pmagister:=0;  pref:=0;  pcreative:=0;  pserv:=0;  pbus:=0;  paspir:=0;  patt:=0;  pnorm:=0;
          FacName:=FDataset.FieldByName('CName_fac').Value;
          AddFacHeader(FacName);
        end
        else
          inc(FShift);
          FacName:=FDataset.FieldByName('CName_fac').Value;
      end;

      if FDataset.FieldByName('is_plan').Value then
      FillDepartment;

      FDataset.Next;
    end;
    
    AddFacFooter(FacName);
    // Добавляем итог
    AddFooter;
  end;

  function TPlanNagrDepartmentsCompareReport.GetTotalSteps: Integer;
  begin
  Result := FDataset.RecordCount*2;
  end;

end.
