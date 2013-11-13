unit N_PlanDepsSemesters;
{#Author sergdev@ist.ugtu.net}
interface

uses
  Classes, dialogs ,SysUtils, ExcelXP, Barcode, Contnrs, XIntf, CommonIntf, ReportsBase, db, adodb, uDm, N_DepsSemester, N_PlanDepsCompare;

const TableBeg = 5;

type
    TPlanNagrDepartmentsSemestersReport = class(TPlanNagrDepartmentsCompareReport)
    protected
      procedure Execute; override;
      procedure FillDepartment;

      function GetTotalSteps:Integer;override;

    public
      constructor Create (AOwner : TComponent; ik_year:integer; year:string; ik_typeed:integer);
    end;

implementation

  constructor TPlanNagrDepartmentsSemestersReport.Create (AOwner : TComponent; ik_year:integer; year:string; ik_typeed:integer);
  begin
  FIkYear :=  ik_year;
  FYear := year;
  FEdType := ik_typeed;
  FShift:=0;

  FDataset := TADODataSet.Create(Owner);
  FDataset.Connection:= dm.DBConnect;
  FDataset.Active:=false;
  FDataset.CommandText:='select * from [dbo].[Pattern_PlanForSemester]('+inttostr(FIKYear)+', 1,'+inttostr(FEdType)+') ORDER BY Cname_fac, Cname_kaf, Is_plan DESC';
  FDataset.Active:=true;
  FDataset.First;
  end;



  procedure   TPlanNagrDepartmentsSemestersReport.FillDepartment;
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


  procedure TPlanNagrDepartmentsSemestersReport.Execute;
  var
    i,NameDatasetNum: Integer;
    FacName:string;
  begin
     // заполняем шапку
    splect:=0;  sppract:=0;  splab:=0;  spcons:=0;  spzach:=0;  spcourse:=0;  spdipl:=0;  spexam:=0;  sped_pract:=0;  spGEK:=0;  spcontr:=0;  spmagister:=0;  spref:=0;  spcreative:=0;  spserv:=0;  spbus:=0;  spaspir:=0;  spatt:=0;  spnorm:=0;

    Items[2,13] := FYear;
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
   FDataset.CommandText:='select * from [dbo].[Pattern_PlanForSemester]('+inttostr(FIKYear)+', 2,'+inttostr(FEdType)+') ORDER BY Cname_fac, Cname_kaf, Is_plan DESC';
   FDataset.Active:=true;

    FSecondRun:=true;
    FShift:=1;
    splect:=0;  sppract:=0;  splab:=0;  spcons:=0;  spzach:=0;  spcourse:=0;  spdipl:=0;  spexam:=0;  sped_pract:=0;  spGEK:=0;  spcontr:=0;  spmagister:=0;  spref:=0;  spcreative:=0;  spserv:=0;  spbus:=0;  spaspir:=0;  spatt:=0;  spnorm:=0;
    plect:=0;  ppract:=0;  plab:=0;  pcons:=0;  pzach:=0;  pcourse:=0;  pdipl:=0;  pexam:=0;  ped_pract:=0;  pGEK:=0;  pcontr:=0;  pmagister:=0;  pref:=0;  pcreative:=0;  pserv:=0;  pbus:=0;  paspir:=0;  patt:=0;  pnorm:=0;

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
          plect:=0;  ppract:=0;  plab:=0;  pcons:=0;  pzach:=0;  pcourse:=0;  pdipl:=0;  pexam:=0;  ped_pract:=0;  pGEK:=0;  pcontr:=0;  pmagister:=0;  pref:=0;  pcreative:=0;  pserv:=0;  pbus:=0;  paspir:=0;  patt:=0;  pnorm:=0;
          FacName:=FDataset.FieldByName('CName_fac').Value;
          AddFacHeader(FacName);
        end
        else
        begin
          inc(FShift);
          FacName:=FDataset.FieldByName('CName_fac').Value;
        end;
      end;

      if FDataset.FieldByName('is_plan').Value then
      FillDepartment;

      FDataset.Next;
    end;

    AddFacFooter(FacName);
    // Добавляем итог
    AddFooter;
  end;

  function TPlanNagrDepartmentsSemestersReport.GetTotalSteps: Integer;
  begin
  Result := FDataset.RecordCount*2;
  end;

end.
