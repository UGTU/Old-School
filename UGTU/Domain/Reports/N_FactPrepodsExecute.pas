unit N_FactPrepodsExecute;
{#Author sergdev@ist.ugtu.net}
interface

uses
  Classes, dialogs ,SysUtils, ExcelXP, Barcode, Contnrs, XIntf, CommonIntf, ReportsBase, db, adodb, uDm, Graphics, Variants;

const TableBeg = 9;
    type
    TNagrFactPrepodsExecuteReport = class(TExcelReportBase)
    protected
       FDataset:TADODataset;
       FYear:string;
       FIkKaf:integer;
       FIkYear:integer;
       FSemType:integer;
       FEdType:integer;
       FShift:integer;

       FCurPrepNum:integer;
       FStepsCount:integer;

       FPlanCurrentSums: array[0..13] of double;
       FPlanTotalSums: array[0..13] of double;

       FFactCurrentSums: array[0..13] of double;
       FFactTotalSums: array[0..13] of double;

       FFactKTNStaff: array[0..13] of double;
       FFactProfStaff: array[0..13] of double;
       FFactKTNDJ: array[0..13] of double;
       FFactProfDJ: array[0..13] of double;
       FFactKTNHour: array[0..13] of double;
       FFactProfHour: array[0..13] of double;

       FPlanKTNStaff: array[0..13] of double;
       FPlanProfStaff: array[0..13] of double;
       FPlanKTNDJ: array[0..13] of double;
       FPlanProfDJ: array[0..13] of double;
       FPlanKTNHour: array[0..13] of double;
       FPlanProfHour: array[0..13] of double;

       procedure AddFooter;
       procedure FillAllPrepods;
       procedure PreparePrepDataset(PrepType:integer; bdatestr, edatestr:string);
       procedure FillCurrentPrep(Dataset:TAdoDataset; IdPrepod:integer);
       procedure AddDivFooter(name:string);
       procedure ClearSums;
       procedure Fillrow(i:integer;sums:array of double); overload;
       procedure Fillrow(i:integer;Dataset:TAdoDataset); overload;

       procedure IncCurrentPlanSums(Dataset:TAdoDataset);
       procedure IncCurrentFactSums(Dataset:TAdoDataset);
       procedure IncTotalPlanSums(Dataset:TAdoDataset);
       procedure IncTotalFactSums(Dataset:TAdoDataset);

       procedure IncPlanKTNStaff(Dataset:TAdoDataset);
       procedure IncFactKTNStaff(Dataset:TAdoDataset);
       procedure IncPlanProfStaff(Dataset:TAdoDataset);
       procedure IncFactProfStaff(Dataset:TAdoDataset);

       procedure IncPlanKTNHour(Dataset:TAdoDataset);
       procedure IncFactKTNHour(Dataset:TAdoDataset);
       procedure IncPlanProfHour(Dataset:TAdoDataset);
       procedure IncFactProfHour(Dataset:TAdoDataset);

       procedure IncPlanKTNDJ(Dataset:TAdoDataset);
       procedure IncFactKTNDJ(Dataset:TAdoDataset);
       procedure IncPlanProfDJ(Dataset:TAdoDataset);
       procedure IncFactProfDJ(Dataset:TAdoDataset);

       procedure IncDegreedSums(Dataset:TAdoDataset; inctype:integer);


       procedure Execute;override;
       function GetTotalSteps:Integer;override;
    public
       constructor Create (AOwner : TComponent; ik_year:integer; ik_kaf:integer; typesem:integer; ik_type_ed:integer);

    end;

    implementation

  constructor TNagrFactPrepodsExecuteReport.Create (AOwner : TComponent; ik_year:integer; ik_kaf:integer; typesem:integer; ik_type_ed:integer);
  begin
  FIkYear :=  ik_year;
  FSemType := typesem;
  FIkKaf := ik_kaf;
  FShift:=0;
  FEdType := ik_type_ed;

  FDataset := TADODataSet.Create(Owner);
  FDataset.Connection:= dm.DBConnect;

    FDataset.Active:=false;
  Fdataset.CommandText:= 'select * from [Year_uch_pl] where ([ik_year_uch_pl] ='''+Inttostr(FIkYear)+''')';
  FDataset.Active:=true;

  FDataset.First;
  FYear := FDataset.FieldByName('year_value').Value;

  FDataset.Active:=false;
  Fdataset.CommandText:= 'select * from PrepodWorks where (Ik_kaf ='''+Inttostr(FikKaf)+''')';
  FDataset.Active:=true;

  FStepsCount := FDataset.RecordCount;
  end;

  procedure TNagrFactPrepodsExecuteReport.PreparePrepDataset(PrepType:integer; bdatestr, edatestr:string);
  begin
    FDataset.Active:=false;
    Fdataset.CommandText:= 'select * from PrepodWorks where (Ik_kaf ='''+Inttostr(FikKaf)+''')';

    if (PrepType=1) then
    Fdataset.CommandText:= Fdataset.CommandText +' and (ik_degree is not null) and (ik_work_type <> 4) and (ik_work_type <> 2)'
    else
    if (PrepType=2) then  Fdataset.CommandText:= Fdataset.CommandText +' and (ik_degree is null) and (ik_work_type <> 4)and (ik_work_type <> 2)'
    else
    if (PrepType=3) then  Fdataset.CommandText:= Fdataset.CommandText +' and (ik_degree is not null) and ((ik_work_type = 4)or (ik_work_type = 2))'
        else
    if (PrepType=4) then  Fdataset.CommandText:= Fdataset.CommandText +' and (ik_degree is null) and ((ik_work_type = 4)or (ik_work_type = 2))';
    Fdataset.CommandText:= Fdataset.CommandText +' and ((release_date is NULL)or(release_date>'''+bdatestr+''')) and ((employ_date is NULL)or(employ_date<'''+edatestr+''')) Order by Clastname';

    FDataset.Active:=true;
    FDataset.First;
  end;

    // из-за передачи массиву в процедуру по значению я расклонировал эти простыни для всех массивов, где считаются суммы
    procedure TNagrFactPrepodsExecuteReport.IncPlanKTNStaff(Dataset:TAdoDataset);
  begin
      FPlanKTNStaff[0]:= FPlanKTNStaff[0]+Dataset.FieldByName('lekc').AsFloat;
      FPlanKTNStaff[1]:= FPlanKTNStaff[1]+Dataset.FieldByName('lab').AsFloat;
      FPlanKTNStaff[2]:= FPlanKTNStaff[2]+Dataset.FieldByName('pract_zan').AsFloat;
      FPlanKTNStaff[3]:= FPlanKTNStaff[3]+Dataset.FieldByName('cons').AsFloat;
      FPlanKTNStaff[4]:= FPlanKTNStaff[4]+Dataset.FieldByName('kurs').AsFloat;
      FPlanKTNStaff[5]:= FPlanKTNStaff[5]+Dataset.FieldByName('kontr').AsFloat;
      FPlanKTNStaff[6]:= FPlanKTNStaff[6]+Dataset.FieldByName('ref').AsFloat;
      FPlanKTNStaff[7]:= FPlanKTNStaff[7]+Dataset.FieldByName('zach').AsFloat;
      FPlanKTNStaff[8]:= FPlanKTNStaff[8]+Dataset.FieldByName('exam').AsFloat;
      FPlanKTNStaff[9]:= FPlanKTNStaff[9]+Dataset.FieldByName('uch_prakt').AsFloat;
      FPlanKTNStaff[10]:= FPlanKTNStaff[10]+Dataset.FieldByName('GEK').AsFloat;
      FPlanKTNStaff[11]:= FPlanKTNStaff[11]+Dataset.FieldByName('dipl').AsFloat;
      FPlanKTNStaff[12]:= FPlanKTNStaff[12]+Dataset.FieldByName('norm').AsFloat;
      FPlanKTNStaff[13]:= FPlanKTNStaff[13]+Dataset.FieldByName('aspir').AsFloat;
  end;

      procedure TNagrFactPrepodsExecuteReport.IncFactKTNStaff(Dataset:TAdoDataset);
  begin
      FFactKTNStaff[0]:= FFactKTNStaff[0]+Dataset.FieldByName('lekc').AsFloat;
      FFactKTNStaff[1]:= FFactKTNStaff[1]+Dataset.FieldByName('lab').AsFloat;
      FFactKTNStaff[2]:= FFactKTNStaff[2]+Dataset.FieldByName('pract_zan').AsFloat;
      FFactKTNStaff[3]:= FFactKTNStaff[3]+Dataset.FieldByName('cons').AsFloat;
      FFactKTNStaff[4]:= FFactKTNStaff[4]+Dataset.FieldByName('kurs').AsFloat;
      FFactKTNStaff[5]:= FFactKTNStaff[5]+Dataset.FieldByName('kontr').AsFloat;
      FFactKTNStaff[6]:= FFactKTNStaff[6]+Dataset.FieldByName('ref').AsFloat;
      FFactKTNStaff[7]:= FFactKTNStaff[7]+Dataset.FieldByName('zach').AsFloat;
      FFactKTNStaff[8]:= FFactKTNStaff[8]+Dataset.FieldByName('exam').AsFloat;
      FFactKTNStaff[9]:= FFactKTNStaff[9]+Dataset.FieldByName('uch_prakt').AsFloat;
      FFactKTNStaff[10]:= FFactKTNStaff[10]+Dataset.FieldByName('GEK').AsFloat;
      FFactKTNStaff[11]:= FFactKTNStaff[11]+Dataset.FieldByName('dipl').AsFloat;
      FFactKTNStaff[12]:= FFactKTNStaff[12]+Dataset.FieldByName('norm').AsFloat;
      FFactKTNStaff[13]:= FFactKTNStaff[13]+Dataset.FieldByName('aspir').AsFloat;
  end;

      procedure TNagrFactPrepodsExecuteReport.IncPlanProfStaff(Dataset:TAdoDataset);
  begin
      FPlanProfStaff[0]:= FPlanProfStaff[0]+Dataset.FieldByName('lekc').AsFloat;
      FPlanProfStaff[1]:= FPlanProfStaff[1]+Dataset.FieldByName('lab').AsFloat;
      FPlanProfStaff[2]:= FPlanProfStaff[2]+Dataset.FieldByName('pract_zan').AsFloat;
      FPlanProfStaff[3]:= FPlanProfStaff[3]+Dataset.FieldByName('cons').AsFloat;
      FPlanProfStaff[4]:= FPlanProfStaff[4]+Dataset.FieldByName('kurs').AsFloat;
      FPlanProfStaff[5]:= FPlanProfStaff[5]+Dataset.FieldByName('kontr').AsFloat;
      FPlanProfStaff[6]:= FPlanProfStaff[6]+Dataset.FieldByName('ref').AsFloat;
      FPlanProfStaff[7]:= FPlanProfStaff[7]+Dataset.FieldByName('zach').AsFloat;
      FPlanProfStaff[8]:= FPlanProfStaff[8]+Dataset.FieldByName('exam').AsFloat;
      FPlanProfStaff[9]:= FPlanProfStaff[9]+Dataset.FieldByName('uch_prakt').AsFloat;
      FPlanProfStaff[10]:= FPlanProfStaff[10]+Dataset.FieldByName('GEK').AsFloat;
      FPlanProfStaff[11]:= FPlanProfStaff[11]+Dataset.FieldByName('dipl').AsFloat;
      FPlanProfStaff[12]:= FPlanProfStaff[12]+Dataset.FieldByName('norm').AsFloat;
      FPlanProfStaff[13]:= FPlanProfStaff[13]+Dataset.FieldByName('aspir').AsFloat;
  end;

      procedure TNagrFactPrepodsExecuteReport.IncFactProfStaff(Dataset:TAdoDataset);
  begin
      FFactProfStaff[0]:= FFactProfStaff[0]+Dataset.FieldByName('lekc').AsFloat;
      FFactProfStaff[1]:= FFactProfStaff[1]+Dataset.FieldByName('lab').AsFloat;
      FFactProfStaff[2]:= FFactProfStaff[2]+Dataset.FieldByName('pract_zan').AsFloat;
      FFactProfStaff[3]:= FFactProfStaff[3]+Dataset.FieldByName('cons').AsFloat;
      FFactProfStaff[4]:= FFactProfStaff[4]+Dataset.FieldByName('kurs').AsFloat;
      FFactProfStaff[5]:= FFactProfStaff[5]+Dataset.FieldByName('kontr').AsFloat;
      FFactProfStaff[6]:= FFactProfStaff[6]+Dataset.FieldByName('ref').AsFloat;
      FFactProfStaff[7]:= FFactProfStaff[7]+Dataset.FieldByName('zach').AsFloat;
      FFactProfStaff[8]:= FFactProfStaff[8]+Dataset.FieldByName('exam').AsFloat;
      FFactProfStaff[9]:= FFactProfStaff[9]+Dataset.FieldByName('uch_prakt').AsFloat;
      FFactProfStaff[10]:= FFactProfStaff[10]+Dataset.FieldByName('GEK').AsFloat;
      FFactProfStaff[11]:= FFactProfStaff[11]+Dataset.FieldByName('dipl').AsFloat;
      FFactProfStaff[12]:= FFactProfStaff[12]+Dataset.FieldByName('norm').AsFloat;
      FFactProfStaff[13]:= FFactProfStaff[13]+Dataset.FieldByName('aspir').AsFloat;
  end;

      procedure TNagrFactPrepodsExecuteReport.IncPlanKTNDJ(Dataset:TAdoDataset);
  begin
      FPlanKTNDJ[0]:= FPlanKTNDJ[0]+Dataset.FieldByName('lekc').AsFloat;
      FPlanKTNDJ[1]:= FPlanKTNDJ[1]+Dataset.FieldByName('lab').AsFloat;
      FPlanKTNDJ[2]:= FPlanKTNDJ[2]+Dataset.FieldByName('pract_zan').AsFloat;
      FPlanKTNDJ[3]:= FPlanKTNDJ[3]+Dataset.FieldByName('cons').AsFloat;
      FPlanKTNDJ[4]:= FPlanKTNDJ[4]+Dataset.FieldByName('kurs').AsFloat;
      FPlanKTNDJ[5]:= FPlanKTNDJ[5]+Dataset.FieldByName('kontr').AsFloat;
      FPlanKTNDJ[6]:= FPlanKTNDJ[6]+Dataset.FieldByName('ref').AsFloat;
      FPlanKTNDJ[7]:= FPlanKTNDJ[7]+Dataset.FieldByName('zach').AsFloat;
      FPlanKTNDJ[8]:= FPlanKTNDJ[8]+Dataset.FieldByName('exam').AsFloat;
      FPlanKTNDJ[9]:= FPlanKTNDJ[9]+Dataset.FieldByName('uch_prakt').AsFloat;
      FPlanKTNDJ[10]:= FPlanKTNDJ[10]+Dataset.FieldByName('GEK').AsFloat;
      FPlanKTNDJ[11]:= FPlanKTNDJ[11]+Dataset.FieldByName('dipl').AsFloat;
      FPlanKTNDJ[12]:= FPlanKTNDJ[12]+Dataset.FieldByName('norm').AsFloat;
      FPlanKTNDJ[13]:= FPlanKTNDJ[13]+Dataset.FieldByName('aspir').AsFloat;
  end;

      procedure TNagrFactPrepodsExecuteReport.IncFactKTNDJ(Dataset:TAdoDataset);
  begin
      FFactKTNDJ[0]:= FFactKTNDJ[0]+Dataset.FieldByName('lekc').AsFloat;
      FFactKTNDJ[1]:= FFactKTNDJ[1]+Dataset.FieldByName('lab').AsFloat;
      FFactKTNDJ[2]:= FFactKTNDJ[2]+Dataset.FieldByName('pract_zan').AsFloat;
      FFactKTNDJ[3]:= FFactKTNDJ[3]+Dataset.FieldByName('cons').AsFloat;
      FFactKTNDJ[4]:= FFactKTNDJ[4]+Dataset.FieldByName('kurs').AsFloat;
      FFactKTNDJ[5]:= FFactKTNDJ[5]+Dataset.FieldByName('kontr').AsFloat;
      FFactKTNDJ[6]:= FFactKTNDJ[6]+Dataset.FieldByName('ref').AsFloat;
      FFactKTNDJ[7]:= FFactKTNDJ[7]+Dataset.FieldByName('zach').AsFloat;
      FFactKTNDJ[8]:= FFactKTNDJ[8]+Dataset.FieldByName('exam').AsFloat;
      FFactKTNDJ[9]:= FFactKTNDJ[9]+Dataset.FieldByName('uch_prakt').AsFloat;
      FFactKTNDJ[10]:= FFactKTNDJ[10]+Dataset.FieldByName('GEK').AsFloat;
      FFactKTNDJ[11]:= FFactKTNDJ[11]+Dataset.FieldByName('dipl').AsFloat;
      FFactKTNDJ[12]:= FFactKTNDJ[12]+Dataset.FieldByName('norm').AsFloat;
      FFactKTNDJ[13]:= FFactKTNDJ[13]+Dataset.FieldByName('aspir').AsFloat;
  end;

      procedure TNagrFactPrepodsExecuteReport.IncPlanProfDJ(Dataset:TAdoDataset);
  begin
      FPlanProfDJ[0]:= FPlanProfDJ[0]+Dataset.FieldByName('lekc').AsFloat;
      FPlanProfDJ[1]:= FPlanProfDJ[1]+Dataset.FieldByName('lab').AsFloat;
      FPlanProfDJ[2]:= FPlanProfDJ[2]+Dataset.FieldByName('pract_zan').AsFloat;
      FPlanProfDJ[3]:= FPlanProfDJ[3]+Dataset.FieldByName('cons').AsFloat;
      FPlanProfDJ[4]:= FPlanProfDJ[4]+Dataset.FieldByName('kurs').AsFloat;
      FPlanProfDJ[5]:= FPlanProfDJ[5]+Dataset.FieldByName('kontr').AsFloat;
      FPlanProfDJ[6]:= FPlanProfDJ[6]+Dataset.FieldByName('ref').AsFloat;
      FPlanProfDJ[7]:= FPlanProfDJ[7]+Dataset.FieldByName('zach').AsFloat;
      FPlanProfDJ[8]:= FPlanProfDJ[8]+Dataset.FieldByName('exam').AsFloat;
      FPlanProfDJ[9]:= FPlanProfDJ[9]+Dataset.FieldByName('uch_prakt').AsFloat;
      FPlanProfDJ[10]:= FPlanProfDJ[10]+Dataset.FieldByName('GEK').AsFloat;
      FPlanProfDJ[11]:= FPlanProfDJ[11]+Dataset.FieldByName('dipl').AsFloat;
      FPlanProfDJ[12]:= FPlanProfDJ[12]+Dataset.FieldByName('norm').AsFloat;
      FPlanProfDJ[13]:= FPlanProfDJ[13]+Dataset.FieldByName('aspir').AsFloat;
  end;

      procedure TNagrFactPrepodsExecuteReport.IncFactProfDJ(Dataset:TAdoDataset);
  begin
      FFactProfDJ[0]:= FFactProfDJ[0]+Dataset.FieldByName('lekc').AsFloat;
      FFactProfDJ[1]:= FFactProfDJ[1]+Dataset.FieldByName('lab').AsFloat;
      FFactProfDJ[2]:= FFactProfDJ[2]+Dataset.FieldByName('pract_zan').AsFloat;
      FFactProfDJ[3]:= FFactProfDJ[3]+Dataset.FieldByName('cons').AsFloat;
      FFactProfDJ[4]:= FFactProfDJ[4]+Dataset.FieldByName('kurs').AsFloat;
      FFactProfDJ[5]:= FFactProfDJ[5]+Dataset.FieldByName('kontr').AsFloat;
      FFactProfDJ[6]:= FFactProfDJ[6]+Dataset.FieldByName('ref').AsFloat;
      FFactProfDJ[7]:= FFactProfDJ[7]+Dataset.FieldByName('zach').AsFloat;
      FFactProfDJ[8]:= FFactProfDJ[8]+Dataset.FieldByName('exam').AsFloat;
      FFactProfDJ[9]:= FFactProfDJ[9]+Dataset.FieldByName('uch_prakt').AsFloat;
      FFactProfDJ[10]:= FFactProfDJ[10]+Dataset.FieldByName('GEK').AsFloat;
      FFactProfDJ[11]:= FFactProfDJ[11]+Dataset.FieldByName('dipl').AsFloat;
      FFactProfDJ[12]:= FFactProfDJ[12]+Dataset.FieldByName('norm').AsFloat;
      FFactProfDJ[13]:= FFactProfDJ[13]+Dataset.FieldByName('aspir').AsFloat;
  end;

      procedure TNagrFactPrepodsExecuteReport.IncPlanKTNHour(Dataset:TAdoDataset);
  begin
      FPlanKTNHour[0]:= FPlanKTNHour[0]+Dataset.FieldByName('lekc').AsFloat;
      FPlanKTNHour[1]:= FPlanKTNHour[1]+Dataset.FieldByName('lab').AsFloat;
      FPlanKTNHour[2]:= FPlanKTNHour[2]+Dataset.FieldByName('pract_zan').AsFloat;
      FPlanKTNHour[3]:= FPlanKTNHour[3]+Dataset.FieldByName('cons').AsFloat;
      FPlanKTNHour[4]:= FPlanKTNHour[4]+Dataset.FieldByName('kurs').AsFloat;
      FPlanKTNHour[5]:= FPlanKTNHour[5]+Dataset.FieldByName('kontr').AsFloat;
      FPlanKTNHour[6]:= FPlanKTNHour[6]+Dataset.FieldByName('ref').AsFloat;
      FPlanKTNHour[7]:= FPlanKTNHour[7]+Dataset.FieldByName('zach').AsFloat;
      FPlanKTNHour[8]:= FPlanKTNHour[8]+Dataset.FieldByName('exam').AsFloat;
      FPlanKTNHour[9]:= FPlanKTNHour[9]+Dataset.FieldByName('uch_prakt').AsFloat;
      FPlanKTNHour[10]:= FPlanKTNHour[10]+Dataset.FieldByName('GEK').AsFloat;
      FPlanKTNHour[11]:= FPlanKTNHour[11]+Dataset.FieldByName('dipl').AsFloat;
      FPlanKTNHour[12]:= FPlanKTNHour[12]+Dataset.FieldByName('norm').AsFloat;
      FPlanKTNHour[13]:= FPlanKTNHour[13]+Dataset.FieldByName('aspir').AsFloat;
  end;

      procedure TNagrFactPrepodsExecuteReport.IncFactKTNHour(Dataset:TAdoDataset);
  begin
      FFactKTNHour[0]:= FFactKTNHour[0]+Dataset.FieldByName('lekc').AsFloat;
      FFactKTNHour[1]:= FFactKTNHour[1]+Dataset.FieldByName('lab').AsFloat;
      FFactKTNHour[2]:= FFactKTNHour[2]+Dataset.FieldByName('pract_zan').AsFloat;
      FFactKTNHour[3]:= FFactKTNHour[3]+Dataset.FieldByName('cons').AsFloat;
      FFactKTNHour[4]:= FFactKTNHour[4]+Dataset.FieldByName('kurs').AsFloat;
      FFactKTNHour[5]:= FFactKTNHour[5]+Dataset.FieldByName('kontr').AsFloat;
      FFactKTNHour[6]:= FFactKTNHour[6]+Dataset.FieldByName('ref').AsFloat;
      FFactKTNHour[7]:= FFactKTNHour[7]+Dataset.FieldByName('zach').AsFloat;
      FFactKTNHour[8]:= FFactKTNHour[8]+Dataset.FieldByName('exam').AsFloat;
      FFactKTNHour[9]:= FFactKTNHour[9]+Dataset.FieldByName('uch_prakt').AsFloat;
      FFactKTNHour[10]:= FFactKTNHour[10]+Dataset.FieldByName('GEK').AsFloat;
      FFactKTNHour[11]:= FFactKTNHour[11]+Dataset.FieldByName('dipl').AsFloat;
      FFactKTNHour[12]:= FFactKTNHour[12]+Dataset.FieldByName('norm').AsFloat;
      FFactKTNHour[13]:= FFactKTNHour[13]+Dataset.FieldByName('aspir').AsFloat;
  end;

      procedure TNagrFactPrepodsExecuteReport.IncPlanProfHour(Dataset:TAdoDataset);
  begin
      FPlanProfHour[0]:= FPlanProfHour[0]+Dataset.FieldByName('lekc').AsFloat;
      FPlanProfHour[1]:= FPlanProfHour[1]+Dataset.FieldByName('lab').AsFloat;
      FPlanProfHour[2]:= FPlanProfHour[2]+Dataset.FieldByName('pract_zan').AsFloat;
      FPlanProfHour[3]:= FPlanProfHour[3]+Dataset.FieldByName('cons').AsFloat;
      FPlanProfHour[4]:= FPlanProfHour[4]+Dataset.FieldByName('kurs').AsFloat;
      FPlanProfHour[5]:= FPlanProfHour[5]+Dataset.FieldByName('kontr').AsFloat;
      FPlanProfHour[6]:= FPlanProfHour[6]+Dataset.FieldByName('ref').AsFloat;
      FPlanProfHour[7]:= FPlanProfHour[7]+Dataset.FieldByName('zach').AsFloat;
      FPlanProfHour[8]:= FPlanProfHour[8]+Dataset.FieldByName('exam').AsFloat;
      FPlanProfHour[9]:= FPlanProfHour[9]+Dataset.FieldByName('uch_prakt').AsFloat;
      FPlanProfHour[10]:= FPlanProfHour[10]+Dataset.FieldByName('GEK').AsFloat;
      FPlanProfHour[11]:= FPlanProfHour[11]+Dataset.FieldByName('dipl').AsFloat;
      FPlanProfHour[12]:= FPlanProfHour[12]+Dataset.FieldByName('norm').AsFloat;
      FPlanProfHour[13]:= FPlanProfHour[13]+Dataset.FieldByName('aspir').AsFloat;
  end;

      procedure TNagrFactPrepodsExecuteReport.IncFactProfHour(Dataset:TAdoDataset);
  begin
      FFactProfHour[0]:= FFactProfHour[0]+Dataset.FieldByName('lekc').AsFloat;
      FFactProfHour[1]:= FFactProfHour[1]+Dataset.FieldByName('lab').AsFloat;
      FFactProfHour[2]:= FFactProfHour[2]+Dataset.FieldByName('pract_zan').AsFloat;
      FFactProfHour[3]:= FFactProfHour[3]+Dataset.FieldByName('cons').AsFloat;
      FFactProfHour[4]:= FFactProfHour[4]+Dataset.FieldByName('kurs').AsFloat;
      FFactProfHour[5]:= FFactProfHour[5]+Dataset.FieldByName('kontr').AsFloat;
      FFactProfHour[6]:= FFactProfHour[6]+Dataset.FieldByName('ref').AsFloat;
      FFactProfHour[7]:= FFactProfHour[7]+Dataset.FieldByName('zach').AsFloat;
      FFactProfHour[8]:= FFactProfHour[8]+Dataset.FieldByName('exam').AsFloat;
      FFactProfHour[9]:= FFactProfHour[9]+Dataset.FieldByName('uch_prakt').AsFloat;
      FFactProfHour[10]:= FFactProfHour[10]+Dataset.FieldByName('GEK').AsFloat;
      FFactProfHour[11]:= FFactProfHour[11]+Dataset.FieldByName('dipl').AsFloat;
      FFactProfHour[12]:= FFactProfHour[12]+Dataset.FieldByName('norm').AsFloat;
      FFactProfHour[13]:= FFactProfHour[13]+Dataset.FieldByName('aspir').AsFloat;
  end;

  procedure TNagrFactPrepodsExecuteReport.IncCurrentPlanSums(Dataset:TAdoDataset);
  begin
      FPlanCurrentSums[0]:= FPlanCurrentSums[0]+Dataset.FieldByName('lekc').AsFloat;
      FPlanCurrentSums[1]:= FPlanCurrentSums[1]+Dataset.FieldByName('lab').AsFloat;
      FPlanCurrentSums[2]:= FPlanCurrentSums[2]+Dataset.FieldByName('pract_zan').AsFloat;
      FPlanCurrentSums[3]:= FPlanCurrentSums[3]+Dataset.FieldByName('cons').AsFloat;
      FPlanCurrentSums[4]:= FPlanCurrentSums[4]+Dataset.FieldByName('kurs').AsFloat;
      FPlanCurrentSums[5]:= FPlanCurrentSums[5]+Dataset.FieldByName('kontr').AsFloat;
      FPlanCurrentSums[6]:= FPlanCurrentSums[6]+Dataset.FieldByName('ref').AsFloat;
      FPlanCurrentSums[7]:= FPlanCurrentSums[7]+Dataset.FieldByName('zach').AsFloat;
      FPlanCurrentSums[8]:= FPlanCurrentSums[8]+Dataset.FieldByName('exam').AsFloat;
      FPlanCurrentSums[9]:= FPlanCurrentSums[9]+Dataset.FieldByName('uch_prakt').AsFloat;
      FPlanCurrentSums[10]:= FPlanCurrentSums[10]+Dataset.FieldByName('GEK').AsFloat;
      FPlanCurrentSums[11]:= FPlanCurrentSums[11]+Dataset.FieldByName('dipl').AsFloat;
      FPlanCurrentSums[12]:= FPlanCurrentSums[12]+Dataset.FieldByName('norm').AsFloat;
      FPlanCurrentSums[13]:= FPlanCurrentSums[13]+Dataset.FieldByName('aspir').AsFloat;
  end;

    procedure TNagrFactPrepodsExecuteReport.IncCurrentFactSums(Dataset:TAdoDataset);
  begin
      FFactCurrentSums[0]:= FFactCurrentSums[0]+Dataset.FieldByName('lekc').AsFloat;
      FFactCurrentSums[1]:= FFactCurrentSums[1]+Dataset.FieldByName('lab').AsFloat;
      FFactCurrentSums[2]:= FFactCurrentSums[2]+Dataset.FieldByName('pract_zan').AsFloat;
      FFactCurrentSums[3]:= FFactCurrentSums[3]+Dataset.FieldByName('cons').AsFloat;
      FFactCurrentSums[4]:= FFactCurrentSums[4]+Dataset.FieldByName('kurs').AsFloat;
      FFactCurrentSums[5]:= FFactCurrentSums[5]+Dataset.FieldByName('kontr').AsFloat;
      FFactCurrentSums[6]:= FFactCurrentSums[6]+Dataset.FieldByName('ref').AsFloat;
      FFactCurrentSums[7]:= FFactCurrentSums[7]+Dataset.FieldByName('zach').AsFloat;
      FFactCurrentSums[8]:= FFactCurrentSums[8]+Dataset.FieldByName('exam').AsFloat;
      FFactCurrentSums[9]:= FFactCurrentSums[9]+Dataset.FieldByName('uch_prakt').AsFloat;
      FFactCurrentSums[10]:= FFactCurrentSums[10]+Dataset.FieldByName('GEK').AsFloat;
      FFactCurrentSums[11]:= FFactCurrentSums[11]+Dataset.FieldByName('dipl').AsFloat;
      FFactCurrentSums[12]:= FFactCurrentSums[12]+Dataset.FieldByName('norm').AsFloat;
      FFactCurrentSums[13]:= FFactCurrentSums[13]+Dataset.FieldByName('aspir').AsFloat;
  end;

        procedure TNagrFactPrepodsExecuteReport.IncTotalFactSums(Dataset:TAdoDataset);
  begin
      FFactTotalSums[0]:= FFactTotalSums[0]+Dataset.FieldByName('lekc').AsFloat;
      FFactTotalSums[1]:= FFactTotalSums[1]+Dataset.FieldByName('lab').AsFloat;
      FFactTotalSums[2]:= FFactTotalSums[2]+Dataset.FieldByName('pract_zan').AsFloat;
      FFactTotalSums[3]:= FFactTotalSums[3]+Dataset.FieldByName('cons').AsFloat;
      FFactTotalSums[4]:= FFactTotalSums[4]+Dataset.FieldByName('kurs').AsFloat;
      FFactTotalSums[5]:= FFactTotalSums[5]+Dataset.FieldByName('kontr').AsFloat;
      FFactTotalSums[6]:= FFactTotalSums[6]+Dataset.FieldByName('ref').AsFloat;
      FFactTotalSums[7]:= FFactTotalSums[7]+Dataset.FieldByName('zach').AsFloat;
      FFactTotalSums[8]:= FFactTotalSums[8]+Dataset.FieldByName('exam').AsFloat;
      FFactTotalSums[9]:= FFactTotalSums[9]+Dataset.FieldByName('uch_prakt').AsFloat;
      FFactTotalSums[10]:= FFactTotalSums[10]+Dataset.FieldByName('GEK').AsFloat;
      FFactTotalSums[11]:= FFactTotalSums[11]+Dataset.FieldByName('dipl').AsFloat;
      FFactTotalSums[12]:= FFactTotalSums[12]+Dataset.FieldByName('norm').AsFloat;
      FFactTotalSums[13]:= FFactTotalSums[13]+Dataset.FieldByName('aspir').AsFloat;
  end;

    procedure TNagrFactPrepodsExecuteReport.IncTotalPlanSums(Dataset:TAdoDataset);
  begin
      FPlanTotalSums[0]:= FPlanTotalSums[0]+Dataset.FieldByName('lekc').AsFloat;
      FPlanTotalSums[1]:= FPlanTotalSums[1]+Dataset.FieldByName('lab').AsFloat;
      FPlanTotalSums[2]:= FPlanTotalSums[2]+Dataset.FieldByName('pract_zan').AsFloat;
      FPlanTotalSums[3]:= FPlanTotalSums[3]+Dataset.FieldByName('cons').AsFloat;
      FPlanTotalSums[4]:= FPlanTotalSums[4]+Dataset.FieldByName('kurs').AsFloat;
      FPlanTotalSums[5]:= FPlanTotalSums[5]+Dataset.FieldByName('kontr').AsFloat;
      FPlanTotalSums[6]:= FPlanTotalSums[6]+Dataset.FieldByName('ref').AsFloat;
      FPlanTotalSums[7]:= FPlanTotalSums[7]+Dataset.FieldByName('zach').AsFloat;
      FPlanTotalSums[8]:= FPlanTotalSums[8]+Dataset.FieldByName('exam').AsFloat;
      FPlanTotalSums[9]:= FPlanTotalSums[9]+Dataset.FieldByName('uch_prakt').AsFloat;
      FPlanTotalSums[10]:= FPlanTotalSums[10]+Dataset.FieldByName('GEK').AsFloat;
      FPlanTotalSums[11]:= FPlanTotalSums[11]+Dataset.FieldByName('dipl').AsFloat;
      FPlanTotalSums[12]:= FPlanTotalSums[12]+Dataset.FieldByName('norm').AsFloat;
      FPlanTotalSums[13]:= FPlanTotalSums[13]+Dataset.FieldByName('aspir').AsFloat;
  end;

  procedure TNagrFactPrepodsExecuteReport.ClearSums;
  var i:integer;
  begin
  for i := 0 to length(FPlanCurrentSums) - 1 do
    FPlanCurrentSums[i]:=0;

      for i := 0 to length(FFactCurrentSums) - 1 do
    FFactCurrentSums[i]:=0;
  end;

  procedure TNagrFactPrepodsExecuteReport.Fillrow(i:integer;sums:array of double);
  var j:integer;
  begin
  for j := 6 to 19 do
    Items[i,j] := sums[j-6];
  end;

  procedure TNagrFactPrepodsExecuteReport.Fillrow(i:integer;Dataset:TAdoDataset);
  begin
      Items[i,6] := Dataset.FieldByName('lekc').Value;
      Items[i,7] := Dataset.FieldByName('lab').Value;
      Items[i,8] := Dataset.FieldByName('pract_zan').Value;
      Items[i,9] := Dataset.FieldByName('cons').Value;
      Items[i,10] := Dataset.FieldByName('kurs').Value;
      Items[i,11] := Dataset.FieldByName('kontr').Value;
      Items[i,12] := Dataset.FieldByName('ref').Value;
      Items[i,13] := Dataset.FieldByName('zach').Value;
      Items[i,14] := Dataset.FieldByName('exam').Value;;
      Items[i,15] := Dataset.FieldByName('uch_prakt').Value;
      Items[i,16] := Dataset.FieldByName('GEK').Value;
      Items[i,17] := Dataset.FieldByName('dipl').Value;
      Items[i,18] := Dataset.FieldByName('norm').Value;
      Items[i,19] := Dataset.FieldByName('aspir').Value;
  end;

  procedure TNagrFactPrepodsExecuteReport.AddDivFooter(name:string);
  var i:integer;
  begin

   i:= TableBeg + Fshift;

   Range['U7','AN9'].Copy(Items[i,1]);

      Items[i,1] := name;

      inc(i);
      Fillrow(i,FPlanCurrentSums);


      inc(i);
      Fillrow(i,FFactCurrentSums);
      ClearSums;

      FShift:= FShift+3;
  end;

  procedure TNagrFactPrepodsExecuteReport.AddFooter;
  var i:integer;
  begin
      i:= TableBeg + Fshift;

      Range['U10','AN40'].Copy(Items[i,1]);

      Fillrow(i,FPlanTotalSums);
      inc(i);
      Fillrow(i,FFactTotalSums);

      FShift:= FShift+6;
      i:=i+6;
      
      Fillrow(i,FPlanProfStaff);
      inc(i);
      Fillrow(i,FFactProfStaff);
      inc(i);
      Fillrow(i,FPlanKTNStaff);
      inc(i);
      Fillrow(i,FFactKTNStaff);
      i:=i+3;

      Fillrow(i,FPlanProfDJ);
      inc(i);
      Fillrow(i,FFactProfDJ);
      inc(i);
      Fillrow(i,FPlanKTNDJ);
      inc(i);
      Fillrow(i,FFactKTNDJ);
      i:=i+3;

      Fillrow(i,FPlanProfHour);
      inc(i);
      Fillrow(i,FFactProfHour);
      inc(i);
      Fillrow(i,FPlanKTNHour);
      inc(i);
      Fillrow(i,FFactKTNHour);

  end;

  procedure TNagrFactPrepodsExecuteReport.IncDegreedSums(Dataset:TAdoDataset; inctype:integer);
  begin
  // плановая нагрузка
  if (inctype = 1) then

      if FDataset.FieldByName('Cname_degree').Value <> null then
      if FDataset.FieldByName('Cname_degree').AsString[1] = 'д' then
      begin
      if (FDataset.FieldByName('ik_work_type').Value = 1) then IncPlanProfStaff(Dataset);
      if (FDataset.FieldByName('ik_work_type').Value = 3) then IncPlanProfHour(Dataset);
      if (FDataset.FieldByName('ik_work_type').Value = 2) or (FDataset.FieldByName('ik_work_type').Value = 4) then IncPlanProfDJ(Dataset);
      end
      else
      if FDataset.FieldByName('Cname_degree').AsString[1] = 'к' then
      begin
      if (FDataset.FieldByName('ik_work_type').Value = 1) then IncPlanKTNStaff(Dataset);
      if (FDataset.FieldByName('ik_work_type').Value = 3) then IncPlanKTNHour(Dataset);
      if (FDataset.FieldByName('ik_work_type').Value = 2) or (FDataset.FieldByName('ik_work_type').Value = 4) then IncPlanKTNDJ(Dataset);
      end;
  // фактическая нагрузка
  if (inctype = 2) then

      if FDataset.FieldByName('Cname_degree').Value <> null then
      if FDataset.FieldByName('Cname_degree').AsString[1] = 'д' then
      begin
      if (FDataset.FieldByName('ik_work_type').Value = 1) then IncFactProfStaff(Dataset);
      if (FDataset.FieldByName('ik_work_type').Value = 3) then IncFactProfHour(Dataset);
      if (FDataset.FieldByName('ik_work_type').Value = 2) or (FDataset.FieldByName('ik_work_type').Value = 4) then IncFactProfDJ(Dataset);
      end
      else
      if FDataset.FieldByName('Cname_degree').AsString[1] = 'к' then
      begin
      if (FDataset.FieldByName('ik_work_type').Value = 1) then IncFactKTNStaff(Dataset);
      if (FDataset.FieldByName('ik_work_type').Value = 3) then IncFactKTNHour(Dataset);
      if (FDataset.FieldByName('ik_work_type').Value = 2) or (FDataset.FieldByName('ik_work_type').Value = 4) then IncFactKTNDJ(Dataset);
      end;
  end;

  procedure TNagrFactPrepodsExecuteReport.FillCurrentPrep(Dataset:TAdoDataset; IdPrepod:integer);
  var i:integer;
  name:string;
  begin
      inc(FCurPrepNum);

    // вставляем ячейки
      i:= TableBeg + Fshift;

      Range['U1','AN6'].Copy(Items[i,1]);

      name := FDataset.FieldByName('CLastname').AsString;
      if (FDataset.FieldByName('Cfirstname').Value<>Null) then
      if (Length(FDataset.FieldByName('Cfirstname').AsString)>1) then
      name := name +' '+FDataset.FieldByName('Cfirstname').AsString[1]+'. ';
      if (FDataset.FieldByName('Cotch').Value<>Null) then
      if (Length(FDataset.FieldByName('Cotch').AsString)>1) then
      name := name +FDataset.FieldByName('Cotch').AsString[1]+'.';
      Items[i,1] := name;
      Items[i,2] := FDataset.FieldByName('Cname_capacity').AsString+', '+FDataset.FieldByName('Cname_degree').AsString;
      Items[i,3] := FDataset.FieldByName('cName_work_type_short').AsString+', '+FDataset.FieldByName('f_rates').AsString;

      //план - очники
      FillRow(i,Dataset);
      IncCurrentPlansums(Dataset);
      IncTotalPlansums(Dataset);
      IncDegreedSums(Dataset, 1);

      //факт - очники
      Dataset.Next;
      inc(i);

      FillRow(i,Dataset);

      IncCurrentFactsums(Dataset);
      IncTotalFactsums(Dataset);
      IncDegreedSums(Dataset, 2);
      //план - заочники

      Dataset.Active:=false;
      if FSemType>0 then
      Dataset.CommandText:='select * from [dbo].[Pattern_PlanForPrepodSemesterWithKatZach]('+inttostr(FIkYear)+','+inttostr(FSemType)+','+inttostr(FEdType)+',2,'+inttostr(IdPrepod)+')'
      else
      Dataset.CommandText:='select * from [dbo].[Pattern_PlanForPrepodYearWithKatZach]('+inttostr(FIkYear)+','+inttostr(FEdType)+',2,'+inttostr(IdPrepod)+')';

      Dataset.Active:=true;
      Dataset.First;
      inc(i);

      FillRow(i,Dataset);
      IncCurrentPlansums(Dataset);
      IncTotalPlansums(Dataset);
      IncDegreedSums(Dataset, 1);

      //факт - заочники
      Dataset.Next;
      inc(i);

      IncCurrentFactsums(Dataset);
      IncTotalFactsums(Dataset);
      IncDegreedSums(Dataset, 2);

      FillRow(i,Dataset);

      FShift:= FShift+6;
  end;

  procedure TNagrFactPrepodsExecuteReport.Execute;
  var
    i,NameDatasetNum: Integer;
    FacName, sem, bdatestr, edatestr, typestr:string;

  begin

    // обнуляем суммы
    ClearSums();

    // заполняем шапку
    if Fsemtype=0 then
    begin
    sem := FYear+' год';
    bdatestr := '01.09.'+FYear;
    edatestr := '01.06.'+IntToStr(StrToInt(FYear)+1);
    end
    else
    if Fsemtype=1 then
    begin
    sem := 'осенний семестр '+FYear+' года';
    bdatestr := '01.09.'+FYear;
    edatestr := '01.01.'+IntToStr(StrToInt(FYear)+1);
    end
    else
    if Fsemtype=2 then
    begin
    sem := 'весенний семестр '+FYear+' года';
    bdatestr := '01.02.'+IntToStr(StrToInt(FYear)+1);
    edatestr := '01.06.'+IntToStr(StrToInt(FYear)+1);
    end;

    if FEdType = 1 then
    typestr := ' (бюджет)'
    else
    typestr := ' (контракт)';

    Items[1,1] := 'Сведения о фактическом выполнении нагрузки профессорско-преподавательским составом кафедры за ' + sem + typestr;

    //заполним остепененных преподавателей
    PreparePrepDataset(1, bdatestr, edatestr);
    FillAllPrepods;
    AddDivFooter('Итого по остепененным преподавателям');

    //заполним неостепененных преподавателей
    PreparePrepDataset(2, bdatestr, edatestr);
    FillAllPrepods;
    AddDivFooter('Итого по неостепененным преподавателям');

    //заполним остепененных совместителей
    PreparePrepDataset(3, bdatestr, edatestr);
    FillAllPrepods;
    AddDivFooter('Итого по остепененным совместителям');

    //заполним неостепененных совместителей
    PreparePrepDataset(4, bdatestr, edatestr);
    FillAllPrepods;
    AddDivFooter('Итого по неостепененным совместителям');

    AddFooter;

    Range['U1','AN40'].Clear;

  end;

  //Определим общее число шагов в создании рапорта
  //Реальное число шагов скорее всего будет равно количеству
  //записей, возвращённых запросом для отчёта
  //Example: Result := MyDataSet.Recordscount;
  function TNagrFactPrepodsExecuteReport.GetTotalSteps: Integer;
  begin
  Result:=FStepsCount;
  end;


  procedure TNagrFactPrepodsExecuteReport.FillAllPrepods;
  var IdPrepod: Integer;
  PrepodHoursDS:TAdoDataset;
  begin
    FDataset.First;
  
    PrepodHoursDS := TADODataSet.Create(Owner);
    PrepodHoursDS.Connection:= dm.DBConnect;

    while not FDataset.eof do
    begin
    PrepodHoursDS.Active:=false;
    IdPrepod := FDataset.FieldByName('ik_id_prepod').Value;
    if FSemType>0 then
        PrepodHoursDS.CommandText:='select * from [dbo].[Pattern_PlanForPrepodSemesterWithKatZach]('+inttostr(FIkYear)+','+inttostr(FSemType)+','+inttostr(FEdType)+',1,'+inttostr(IdPrepod)+')'
    else
        PrepodHoursDS.CommandText:='select * from [dbo].[Pattern_PlanForPrepodYearWithKatZach]('+inttostr(FIkYear)+','+inttostr(FEdType)+',1,'+inttostr(IdPrepod)+')';
    PrepodHoursDS.Active:=true;

    PrepodHoursDS.First;

    // рисуем часы препода
    FillCurrentPrep(PrepodHoursDS,IdPrepod);

    FDataset.Next;
    NextStep(1,FDataset.FieldByName('CLastname').Value);
    end;

  end;

end.
