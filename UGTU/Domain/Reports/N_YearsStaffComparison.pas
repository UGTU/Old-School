unit N_YearsStaffComparison;
{#Author sergdev@ist.ugtu.net}
interface

uses
  Classes, dialogs ,SysUtils, ExcelXP, Barcode, Contnrs, XIntf, CommonIntf, ReportsBase, db, adodb, uDm, N_YearsComparison, Graphics;

const TableBeg = 7;

type
    TNagrYearStaffComparisonReport = class(TNagrYearComparisonReport)
    private
       FacHours1 :real;
       TotalHours1:real;
       FacHours2 :real;
       TotalHours2:real;

       FacStaff :real;
       TotalStaff:real;

       FCurFirst:integer;
       FCurNum:integer;

       FShift:integer;

       procedure AddFacFooter(name:string);
       procedure AddFooter;
       procedure FillDepartment;
    protected
       procedure Execute;override;
       function GetTotalSteps:Integer;override;
    public
       constructor Create (AOwner : TComponent; ik_year1:integer; ik_year2:integer; year1:string; year2:string; ik_typeed:integer);

    end;

    implementation

  constructor TNagrYearStaffComparisonReport.Create (AOwner : TComponent; ik_year1:integer; ik_year2:integer; year1:string; year2:string; ik_typeed:integer);
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
  FDataset.CommandText:='select * from [dbo].[Pattern_PlanWithStaff]('+inttostr(FYearKey1)+','+inttostr(FYearKey2)+','+inttostr(FEdType)+')';
  FDataset.Active:=true;
  FDataset.First;
  end;

  procedure TNagrYearStaffComparisonReport.AddFacFooter(name:string);
  var i:integer;
  begin

  // вставл€ем €чейки из резерва
   Range['A7','H7'].font.bold:=true;
   Range['A7','H7'].font.color:=clRed;
   Range['A7','H7'].interior.color:=clSilver;
   Range['A7','H7'].Copy(Items[TableBeg+FShift,1]);
   Range['A7','H7'].font.color:=clBlack;
   Range['A7','H7'].interior.color:=clWhite;
   Range['A7','H7'].font.bold:=false;

   Items[TableBeg+FShift,1] := inttostr(FCurFirst)+'.-'+inttostr(FCurNum)+'.';
   Items[TableBeg+FShift,2] := name;
   Items[TableBeg+FShift,3] := FacHours1;
   Items[TableBeg+FShift,4] := FacHours2;
   Items[TableBeg+FShift,6] := FacStaff;
  FShift:=FShift+1;
  end;

  procedure TNagrYearStaffComparisonReport.AddFooter;
  var i:integer;
  begin

  // вставл€ем €чейки из резерва
   Range['A7','H7'].font.color:=clRed;
   Range['A7','H7'].font.size:=11;
   Range['A7','H7'].interior.color:=clSilver;
   Range['A7','H7'].Copy(Items[TableBeg+FShift,1]);
   Range['A7','H7'].font.color:=clBlack;
   Range['A7','H7'].font.size:=8;
   Range['A7','H7'].interior.color:=clWhite;

   Items[TableBeg+FShift,1] := inttostr(FCurFirst)+'.-'+inttostr(FCurNum)+'.';
   Items[TableBeg+FShift,2] := '»“ќ√ќ:';
   Items[TableBeg+FShift,3] := TotalHours1;
   Items[TableBeg+FShift,4] := TotalHours1;
   Items[TableBeg+FShift,6] := TotalStaff;
  end;

  procedure TNagrYearStaffComparisonReport.FillDepartment;
  var i:integer;
  sum:real;
  begin
      inc(FCurNum);
    // вставл€ем €чейки
      i:= TableBeg + Fshift;

      if FShift>0 then
      Range['A7','H7'].Copy(Items[i,1]);

      Items[i,1] := inttostr(FCurNum)+'.';
      Items[i,2] := FDataset.FieldByName('Cname_kaf').Value;
      Items[i,3] := FDataset.FieldByName('plan_year1').Value;
      Items[i,4] := FDataset.FieldByName('plan_year2').Value;
      Items[i,6] := FDataset.FieldByName('staff').Value;

      FacHours1:=FacHours1+FDataset.FieldByName('plan_year1').Value;
      FacHours2:=FacHours2+FDataset.FieldByName('plan_year2').Value;
      FacStaff:=FacStaff+FDataset.FieldByName('staff').Value;

      FShift:= FShift+1;
  end;

  procedure TNagrYearStaffComparisonReport.Execute;
  var FacName:string;
  begin
     // заполн€ем шапку

    Items[3,1] := 'в сравнении '+FYear1+' с '+FYear2+' уч.гг.';
    Items[6,3] := FYear1;
    Items[6,4] := FYear2;

    Items[6,7] := FYear1;
    Items[6,8] := FYear2;

    FacName:='';
    FacHours1:=0;
    FacHours2:=0;
    FacStaff:=0;
    FCurFirst:=1;
    FCurNum:=0;
    TotalHours1:=0;
    TotalHours2:=0;
    TotalStaff:=0;

    while not FDataset.eof do
    begin
      NextStep(1,'ѕостроение отчета: кафедра '+FDataset.FieldByName('CName_kaf').Value);
      if FacName<>FDataset.FieldByName('CName_fac').Value then
      begin
        if FacName<>'' then
        begin
          TotalHours1 := TotalHours1 + FacHours1;
          TotalHours2 := TotalHours2 + FacHours2;
          TotalStaff := TotalStaff + FacStaff;
          AddFacFooter(FacName);
          FacHours1:=0;
          FacHours2:=0;
          FacStaff:=0;
          FCurFirst:=FCurNum+1;
          FacName:=FDataset.FieldByName('CName_fac').Value;
        end
        else
        begin
          FacName:=FDataset.FieldByName('CName_fac').Value;
          //inc(FShift);
        end;
      end;

      FillDepartment;
      FDataset.Next;
    end;

    TotalHours1 := TotalHours1 + FacHours1;
    TotalHours2 := TotalHours2 + FacHours2;
    TotalStaff := TotalStaff + FacStaff;
    AddFacFooter(FacName);
    AddFooter;

  end;

  //ќпределим общее число шагов в создании рапорта
  //–еальное число шагов скорее всего будет равно количеству
  //записей, возвращЄнных запросом дл€ отчЄта
  //Example: Result := MyDataSet.Recordscount;
  function TNagrYearStaffComparisonReport.GetTotalSteps: Integer;
  begin
    Result := FDataset.RecordCount;
  end;

end.
