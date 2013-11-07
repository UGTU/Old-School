unit N_YearsComparison;
{#Author sergdev@ist.ugtu.net}
interface

uses
  Classes, dialogs ,SysUtils, ExcelXP, Barcode, Contnrs, XIntf, CommonIntf, ReportsBase, db, adodb, uDm;

const TableBeg = 7;

type
    TNagrYearComparisonReport = class(TExcelReportBase)
    private

    protected
       FDataset:TADODataset;
       FYear1:string;
       FYear2:string;
       FYearKey1:integer;
       FYearKey2:integer;
       FEdType:integer;
       procedure FillSemester(shift:integer);
       procedure Execute;override;
       function GetTotalSteps:Integer;override;
    public
       constructor Create (AOwner : TComponent; ik_year1:integer; ik_year2:integer; year1:string; year2:string; ik_typeed:integer);

    end;

    implementation

  constructor TNagrYearComparisonReport.Create (AOwner : TComponent; ik_year1:integer; ik_year2:integer; year1:string; year2:string; ik_typeed:integer);
  begin
  inherited Create(AOwner);
  FYear1 :=  year1;
  FYear2 :=  year2;
  FYearKey1 :=  ik_year1;
  FYearKey2 :=  ik_year2;
  FEdType := ik_typeed;
  end;

  procedure   TNagrYearComparisonReport.FillSemester(shift:integer);
  var
  i:integer;
  lect, pract, lab, cons, zach, course, dipl, exam, ed_pract, GEK, contr, magister, ref, creative, serv, bus, aspir, att, norm : real;
  begin
    lect:=0;  pract:=0;  lab:=0;  cons:=0;  zach:=0;  course:=0;  dipl:=0;  exam:=0;  ed_pract:=0;  GEK:=0;  contr:=0;  magister:=0;  ref:=0;  creative:=0;  serv:=0;  bus:=0;  aspir:=0;  att:=0;  norm:=0;

    for i := 0 to FDataset.RecordCount-1 do
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
    end;

    // заполняем таблицы

      Items[TableBeg+shift,3] := lect;
      Items[TableBeg+shift,4] := pract;
      Items[TableBeg+shift,5] := lab;
      Items[TableBeg+shift,6] := cons;
      Items[TableBeg+shift,7] := course;
      Items[TableBeg+shift,8] := dipl;
      Items[TableBeg+shift,9] := exam;
      Items[TableBeg+shift,10] := zach;
      Items[TableBeg+shift,11] := ed_pract;
      Items[TableBeg+shift,12] := GEK;
      Items[TableBeg+shift,13] := contr;
      Items[TableBeg+shift,14] := magister;
      Items[TableBeg+shift,15] := ref;
      Items[TableBeg+shift,16] := creative;
      Items[TableBeg+shift,17] := serv;
      Items[TableBeg+shift,18] := bus;
      Items[TableBeg+shift,19] := aspir;
      Items[TableBeg+shift,20] := att;
      Items[TableBeg+shift,21] := norm;

      end;

  procedure TNagrYearComparisonReport.Execute;
  var
    i,NameDatasetNum, rc : Integer;
    lect, pract, lab, cons, zach, course, dipl, exam, ed_pract, GEK, contr, magister, ref, creative, serv, bus, aspir, att, norm : real;
  begin

     if FDataset = nil then
     FDataset := TADODataSet.Create(Owner);
     FDataset.Connection:= dm.DBConnect;

     // заполняем шапку

    Items[3,7] := FYear1;
    Items[3,13] := FYear2;

    Items[7,1] := FYear1;
    Items[8,1] := FYear2;
    Items[12,1] := FYear1;
    Items[13,1] := FYear2;
    Items[17,1] := FYear1;
    Items[18,1] := FYear2;

    // загружаем данные осеннего семестра

    FDataset.Active:=false;
    FDataset.CommandText:='select * from [dbo].[Pattern_PlanForSemester]('+inttostr(FYearKey1)+',1,'+inttostr(FEdType)+')';
    FDataset.Active:=true;
    FDataset.First;
    rc:=FDataset.RecordCount;

    FillSemester(0);

    FDataset.Active:=false;
    FDataset.CommandText:='select * from [dbo].[Pattern_PlanForSemester]('+inttostr(FYearKey2)+',1,'+inttostr(FEdType)+')';
    FDataset.Active:=true;
    FDataset.First;

    FillSemester(1);

    FDataset.Active:=false;
    FDataset.CommandText:='select * from [dbo].[Pattern_PlanForSemester]('+inttostr(FYearKey1)+',2,'+inttostr(FEdType)+')';
    FDataset.Active:=true;
    FDataset.First;

    FillSemester(5);

    FDataset.Active:=false;
    FDataset.CommandText:='select * from [dbo].[Pattern_PlanForSemester]('+inttostr(FYearKey2)+',2,'+inttostr(FEdType)+')';
    FDataset.Active:=true;
    FDataset.First;

    FillSemester(6);

  end;

  //Определим общее число шагов в создании рапорта
  //Реальное число шагов скорее всего будет равно количеству
  //записей, возвращённых запросом для отчёта
  //Example: Result := MyDataSet.Recordscount;
  function TNagrYearComparisonReport.GetTotalSteps: Integer;
  begin
    Result := FDataset.RecordCount*3;
  end;

end.
