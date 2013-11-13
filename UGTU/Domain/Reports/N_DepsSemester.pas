unit N_DepsSemester;
{#Author sergdev@ist.ugtu.net}
interface

uses
  Classes, dialogs ,SysUtils, ExcelXP, Barcode, Contnrs, XIntf, CommonIntf, ReportsBase, db, adodb, uDm;

const TableBeg = 5;

type
    TNagrSemesterDepartmentsReport = class(TExcelReportBase)
    protected
       FDataset:TADODataset;
       FYear:string;
       FIkYear:integer;
       FSemType:integer;
       FEdType:integer;
       FShift:integer;
       FSecondRun:boolean;
       lect, pract, lab, cons, zach, course, dipl, exam, ed_pract, GEK, contr, magister, ref, creative, serv, bus, aspir, att, norm : real;
       slect, spract, slab, scons, szach, scourse, sdipl, sexam, sed_pract, sGEK, scontr, smagister, sref, screative, sserv, sbus, saspir, satt, snorm : real;
       plect, ppract, plab, pcons, pzach, pcourse, pdipl, pexam, ped_pract, pGEK, pcontr, pmagister, pref, pcreative, pserv, pbus, paspir, patt, pnorm : real;
       splect, sppract, splab, spcons, spzach, spcourse, spdipl, spexam, sped_pract, spGEK, spcontr, spmagister, spref, spcreative, spserv, spbus, spaspir, spatt, spnorm : real;

       procedure AddFooter;
       procedure FillDepartment;
       procedure FillFact;
       procedure AddFacHeader(name:string);
       procedure AddFacFooter(name:string);
       procedure IncSums;

       procedure Execute;override;
       function GetTotalSteps:Integer;override;
    public
       constructor Create (AOwner : TComponent; ik_year:integer; year:string; typesem:integer; ik_typeed:integer);

    end;

    implementation

  constructor TNagrSemesterDepartmentsReport.Create (AOwner : TComponent; ik_year:integer; year:string; typesem:integer; ik_typeed:integer);
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
  if typesem = 3 then FDataset.CommandText:='select * from [dbo].[Pattern_PlanForYear]('+inttostr(FIKYear)+','+inttostr(FEdType)+') ORDER BY Cname_fac, Cname_kaf, Is_plan DESC' else
  FDataset.CommandText:='select * from [dbo].[Pattern_PlanForSemester]('+inttostr(FIKYear)+','+inttostr(FSemType)+','+inttostr(FEdType)+') ORDER BY Cname_fac, Cname_kaf, Is_plan DESC';
  FDataset.Active:=true;
  FDataset.First;
  end;

  procedure TNagrSemesterDepartmentsReport.IncSums;
  begin
      splect := plect + splect;
      sppract := ppract + sppract;
      splab := plab + splab;
      spcons := pcons + spcons;
      spcourse := pcourse + spcourse;
      spdipl := pdipl + spdipl;
      spexam := pexam + spexam;
      spzach := pzach + spzach;
      sped_pract := ped_pract + sped_pract;
      spGEK := pGEK + spGEK;
      spcontr := pcontr + spcontr;
      spmagister := pmagister + spmagister;
      spref := pref + spref;
      spcreative := pcreative + spcreative;
      spserv := pserv + spserv;
      spbus := pbus + spbus;
      spaspir := paspir + spaspir;
      spatt := patt + spatt;
      spnorm := pnorm + spnorm;

      slect := lect + slect;
      spract := pract + spract;
      slab := lab + slab;
      scons := cons + scons;
      scourse := course + scourse;
      sdipl := dipl + sdipl;
      sexam := exam + sexam;
      szach := zach + szach;
      sed_pract := ed_pract + sed_pract;
      sGEK := GEK + sGEK;
      scontr := contr + scontr;
      smagister := magister + smagister;
      sref := ref + sref;
      screative := creative + screative;
      sserv := serv + sserv;
      sbus := bus + sbus;
      saspir := aspir + saspir;
      satt := att + satt;
      snorm := norm + snorm;
  end;

  procedure TNagrSemesterDepartmentsReport.AddFacFooter(name:string);
  var i:integer;
  begin

  if not FSecondRun then
  begin
  // вставл€ем €чейки из резерва
   Range['A6','V9'].Copy(Items[TableBeg+FShift,1]);
   Items[TableBeg+FShift,1] := name;
  end;

     // заполн€ем кортеж

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

   FShift:=FShift+4;

  end;

  procedure TNagrSemesterDepartmentsReport.AddFooter;
  var i:integer;
  begin

  if not FSecondRun then
  begin
  // вставл€ем €чейки из резерва
   Range['A6','V9'].Copy(Items[TableBeg+FShift,1]);
   Items[TableBeg+FShift,1] := '»того по университету';
  end;

  // заполн€ем кортеж
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

  procedure TNagrSemesterDepartmentsReport.AddFacHeader(name:string);
  begin
  // вставл€ем €чейки
  if not FSecondRun then
  begin
    Range['A5','V5'].Copy(Items[TableBeg+FShift,1]);
    Items[TableBeg+FShift,1] := name;
  end;
  inc(FShift);
  end;

  procedure   TNagrSemesterDepartmentsReport.FillDepartment;
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

    // вставл€ем €чейки
      i:= TableBeg+Fshift;

      if not FSecondRun then
      begin

      if FShift>1 then
      Range['A6','V9'].Copy(Items[i,1]);

      Items[i,1] := FDataset.FieldByName('Cname_kaf').Value;

      if FSemType=3 then Items[i,2] := 'год' else
      if FSemType=1 then Items[i,2] := 'осень'
      else if FSemType=2 then Items[i,2] := 'весна';

      end;

      //Items[TableBeg+FShift,1] := FDataset.FieldByName('').Value;
    // заполн€ем кортеж

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

  procedure   TNagrSemesterDepartmentsReport.FillFact;
  var i:integer;
  begin
      lect := lect + FDataset.FieldByName('lekc').Value;
      pract := pract + FDataset.FieldByName('pract_zan').Value;
      lab := lab + FDataset.FieldByName('lab').Value;
      cons := cons + FDataset.FieldByName('cons').Value;
      course := course + FDataset.FieldByName('kurs').Value;
      dipl := dipl + FDataset.FieldByName('dipl').Value;
      exam := exam + FDataset.FieldByName('exam').Value;
      zach := zach + FDataset.FieldByName('zach').Value;
      ed_pract := ed_pract + FDataset.FieldByName('uch_prakt').Value;
      GEK := GEK + FDataset.FieldByName('GEK').Value;
      contr := contr + FDataset.FieldByName('kontr').Value;
      magister := magister + FDataset.FieldByName('magistr').Value;
      ref := ref + FDataset.FieldByName('ref').Value;
      creative := creative + FDataset.FieldByName('tvorch').Value;
      serv := serv + FDataset.FieldByName('obsluzh').Value;
      bus := bus + FDataset.FieldByName('delov').Value;
      aspir := aspir + FDataset.FieldByName('aspir').Value;
      att := att + FDataset.FieldByName('attest').Value;
      norm := norm + FDataset.FieldByName('norm').Value;

      i:= TableBeg+FShift;
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

      FShift:=FShift+3;
  end;

  procedure TNagrSemesterDepartmentsReport.Execute;
  var
    i,NameDatasetNum: Integer;
    FacName:string;
  begin
     // заполн€ем шапку
    slect:=0;  spract:=0;  slab:=0;  scons:=0;  szach:=0;  scourse:=0;  sdipl:=0;  sexam:=0;  sed_pract:=0;  sGEK:=0;  scontr:=0;  smagister:=0;  sref:=0;  screative:=0;  sserv:=0;  sbus:=0;  saspir:=0;  satt:=0;  snorm:=0;
    splect:=0;  sppract:=0;  splab:=0;  spcons:=0;  spzach:=0;  spcourse:=0;  spdipl:=0;  spexam:=0;  sped_pract:=0;  spGEK:=0;  spcontr:=0;  spmagister:=0;  spref:=0;  spcreative:=0;  spserv:=0;  spbus:=0;  spaspir:=0;  spatt:=0;  spnorm:=0;

    Items[2,16] := FYear;

    FacName:= '';

    // строим таблицу
    while not FDataset.eof do
    begin
      NextStep(1,'ѕостроение отчета: кафедра '+FDataset.FieldByName('CName_kaf').Value);

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
      FillFact;
      FDataset.Next;
    end;
         AddFacFooter(FacName);

    // ƒобавл€ем итог
         AddFooter;

  end;

  //ќпределим общее число шагов в создании рапорта
  //–еальное число шагов скорее всего будет равно количеству
  //записей, возвращЄнных запросом дл€ отчЄта
  //Example: Result := MyDataSet.Recordscount;
  function TNagrSemesterDepartmentsReport.GetTotalSteps: Integer;
  begin
  Result := FDataset.RecordCount;
  end;

end.
