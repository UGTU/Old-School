unit N_FullDepsSemester;
{#Author sergdev@ist.ugtu.net}
interface

uses
  Classes, dialogs ,SysUtils, ExcelXP, Barcode, Contnrs, XIntf, CommonIntf, ReportsBase, db, adodb, uDm, N_DepsSemester;

const TableBeg = 5;

type
    TNagrSemesterDepartmentsFullReport = class(TNagrSemesterDepartmentsReport)
    protected

      FSecondSem:boolean;
      procedure Execute; override;
      procedure AddFacFooter(name:string);
      procedure AddFooter;
      procedure FillDepartment;

      function GetTotalSteps:Integer;override;

    public
      constructor Create (AOwner : TComponent; ik_year:integer; year:string; ik_typeed:integer);
    end;

implementation

  constructor TNagrSemesterDepartmentsFullReport.Create (AOwner : TComponent; ik_year:integer; year:string; ik_typeed:integer);
  begin
  FIkYear :=  ik_year;
  FYear := year;
  FEdType := ik_typeed;
  FShift:=0;

  FDataset := TADODataSet.Create(Owner);
  FDataset.Connection:= dm.DBConnect;
  FDataset.Active:=false;
  FDataset.CommandText:='select * from [dbo].[Pattern_PlanForSemester]('+inttostr(FIKYear)+',1,'+inttostr(FEdType)+') ORDER BY Cname_fac, Cname_kaf, Is_plan DESC';
  FDataset.Active:=true;
  FDataset.First;
  end;

  procedure TNagrSemesterDepartmentsFullReport.AddFacFooter(name:string);
  var i:integer;
  begin

  if not FSecondRun then
  begin
  // вставляем ячейки из резерва
   Range['A6','V15'].Copy(Items[TableBeg+FShift,1]);
   Items[TableBeg+FShift,1] := 'Итого по '+name;
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

   inc(i);

   Items[i,3] := lect;
   Items[i,4] := pract;
   Items[i,5] := lab;
   Items[i,6] := cons;
   Items[i,7] := course;
   Items[i,8] := dipl;
   Items[i,9] := exam;
   Items[i,10] := zach;
   Items[i,11] := ed_pract;
   Items[i,12] := GEK;
   Items[i,13] := contr;
   Items[i,14] := magister;
   Items[i,15] := ref;
   Items[i,16] := creative;
   Items[i,17] := serv;
   Items[i,18] := bus;
   Items[i,19] := aspir;
   Items[i,20] := att;
   Items[i,21] := norm;

   FShift:=FShift+10;

  end;

  procedure   TNagrSemesterDepartmentsFullReport.FillDepartment;
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
          Range['A6','V15'].Copy(Items[i,1]);
        Items[i,1] := FDataset.FieldByName('Cname_kaf').Value;
      end;

      //Items[TableBeg+FShift,1] := FDataset.FieldByName('').Value;
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

      FShift:= FShift+1;
  end;

  procedure TNagrSemesterDepartmentsFullReport.AddFooter;
  var i:integer;
  begin

  if not FSecondRun then
  begin
  // вставляем ячейки из резерва
   Range['A6','V15'].Copy(Items[TableBeg+FShift,1]);
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

   inc(i);

   Items[i,3] := slect;
   Items[i,4] := spract;
   Items[i,5] := slab;
   Items[i,6] := scons;
   Items[i,7] := scourse;
   Items[i,8] := sdipl;
   Items[i,9] := sexam;
   Items[i,10] := szach;
   Items[i,11] := sed_pract;
   Items[i,12] := sGEK;
   Items[i,13] := scontr;
   Items[i,14] := smagister;
   Items[i,15] := sref;
   Items[i,16] := screative;
   Items[i,17] := sserv;
   Items[i,18] := sbus;
   Items[i,19] := saspir;
   Items[i,20] := satt;
   Items[i,21] := snorm;

  end;

  procedure TNagrSemesterDepartmentsFullReport.Execute;
  var
    i,NameDatasetNum: Integer;
    FacName:string;
  begin
     // заполняем шапку
    slect:=0;  spract:=0;  slab:=0;  scons:=0;  szach:=0;  scourse:=0;  sdipl:=0;  sexam:=0;  sed_pract:=0;  sGEK:=0;  scontr:=0;  smagister:=0;  sref:=0;  screative:=0;  sserv:=0;  sbus:=0;  saspir:=0;  satt:=0;  snorm:=0;
    splect:=0;  sppract:=0;  splab:=0;  spcons:=0;  spzach:=0;  spcourse:=0;  spdipl:=0;  spexam:=0;  sped_pract:=0;  spGEK:=0;  spcontr:=0;  spmagister:=0;  spref:=0;  spcreative:=0;  spserv:=0;  spbus:=0;  spaspir:=0;  spatt:=0;  spnorm:=0;

    Items[2,16] := FYear;

    FacName:= '';

    // строим таблицу
    while not FDataset.eof do
    begin

      NextStep(1,'Построение отчета: кафедра '+FDataset.FieldByName('CName_kaf').Value+', осень');

      if FacName<>FDataset.FieldByName('CName_fac').Value then
      begin
        if FacName<>'' then
        begin
          IncSums;
          AddFacFooter(FacName);
          lect:=0;  pract:=0;  lab:=0;  cons:=0;  zach:=0;  course:=0;  dipl:=0;  exam:=0;  ed_pract:=0;  GEK:=0;  contr:=0;  magister:=0;  ref:=0;  creative:=0;  serv:=0;  bus:=0;  aspir:=0;  att:=0;  norm:=0;
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
      FillDepartment else
      begin
        FillFact;
        FShift:=FShift+6;
      end;
      FDataset.Next;
    end;

    AddFacFooter(FacName);
    // Добавляем итог
    AddFooter;

    FDataset.Active:=false;
    FDataset.CommandText:='select * from [dbo].[Pattern_PlanForSemester]('+inttostr(FIKYear)+', 2,'+inttostr(FEdType)+') ORDER BY Cname_fac, Cname_kaf, Is_plan DESC';
    FDataset.Active:=true;

    FSecondRun:=true;
    FShift:=3;
    slect:=0;  spract:=0;  slab:=0;  scons:=0;  szach:=0;  scourse:=0;  sdipl:=0;  sexam:=0;  sed_pract:=0;  sGEK:=0;  scontr:=0;  smagister:=0;  sref:=0;  screative:=0;  sserv:=0;  sbus:=0;  saspir:=0;  satt:=0;  snorm:=0;
    splect:=0;  sppract:=0;  splab:=0;  spcons:=0;  spzach:=0;  spcourse:=0;  spdipl:=0;  spexam:=0;  sped_pract:=0;  spGEK:=0;  spcontr:=0;  spmagister:=0;  spref:=0;  spcreative:=0;  spserv:=0;  spbus:=0;  spaspir:=0;  spatt:=0;  spnorm:=0;
    FacName:= '';


    while not FDataset.eof do
    begin

      NextStep(1,'Построение отчета: кафедра '+FDataset.FieldByName('CName_kaf').Value+', весна');

      if FacName<>FDataset.FieldByName('CName_fac').Value then
      begin
        if FacName<>'' then
        begin
          IncSums;
          AddFacFooter(FacName);
          lect:=0;  pract:=0;  lab:=0;  cons:=0;  zach:=0;  course:=0;  dipl:=0;  exam:=0;  ed_pract:=0;  GEK:=0;  contr:=0;  magister:=0;  ref:=0;  creative:=0;  serv:=0;  bus:=0;  aspir:=0;  att:=0;  norm:=0;
          plect:=0;  ppract:=0;  plab:=0;  pcons:=0;  pzach:=0;  pcourse:=0;  pdipl:=0;  pexam:=0;  ped_pract:=0;  pGEK:=0;  pcontr:=0;  pmagister:=0;  pref:=0;  pcreative:=0;  pserv:=0;  pbus:=0;  paspir:=0;  patt:=0;  pnorm:=0;
          FacName:=FDataset.FieldByName('CName_fac').Value;
          AddFacHeader(FacName);
        end
        else
          inc(FShift);
          FacName:=FDataset.FieldByName('CName_fac').Value;
      end;

      if FDataset.FieldByName('is_plan').Value then
      FillDepartment else
      begin
        FillFact;
        FShift:=FShift+6;
      end;
      FDataset.Next;
    end;
    
    AddFacFooter(FacName);
    // Добавляем итог
    AddFooter;
  end;

  function TNagrSemesterDepartmentsFullReport.GetTotalSteps: Integer;
  begin
  Result := FDataset.RecordCount*2;
  end;

end.
