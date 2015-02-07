unit Spravka;

interface

uses
  Classes, dialogs, SysUtils, ExcelXP, Barcode, Contnrs,
  XIntf, CommonIntf, ReportsBase, db, adodb, ExtCtrls,
  udmUspevaemost, ComCtrls, uAverageBalls,SpravkaHistory2014,Spravka2014;

type
  SpravkaReport = class(TExcelReportBase)
  private
  FReport: TSpravka;
  protected
    procedure Execute; override;
  public
  property Report: TSpravka read FReport;
  constructor Create(Report: TSpravka);
  function GetMonthR(month:integer):string;
  end;


implementation
uses ConstantRepository;

{ TBRS2014Report }

constructor SpravkaReport.Create(Report: TSpravka);
begin
  FReport := Report;
end;
{ SpravkaReport }
function SpravkaReport.GetMonthR(month:integer):string;
var str:string;
begin
    case month of
      1: str := '€нвар€';
      2: str := 'феврал€';
      3: str := 'марта';
      4: str := 'апрел€';
      5: str := 'ма€';
      6: str := 'июн€';
      7: str := 'июл€';
      8: str := 'августа';
      9: str := 'сент€бр€';
      10: str := 'окт€бр€';
      11: str := 'но€бр€';
      12: str := 'декабр€';
    end;
    result:= str;
end;
procedure SpravkaReport.Execute;
var
    str,dop,dir_inst,copystr1,copystr2:string;
     posit,first_str,I,num:integer;
     YearPric,MonthPric,DayPric:Word;
begin
  inherited;
      case (FReport.kurs) of
      1: str := 'первом';
      2: str := 'втором';
      3: str := 'третьем';
      4: str := 'четвертом';
      5: str := 'п€том';
      6: str := 'шестом';
    end;

    Replace('#kurs#', str);
    Replace('#fio#', FReport.FIO);
    Replace('#fac#', FReport.instut);
    Replace('#otdel#', FReport.f_obuch);
    Replace('#YearOtch#', FReport.year_otch);
    dop:=  FReport.Now_day;
    if (dop.Length=1) then  dop:='0'+dop;
    Replace('#Date#', dop);
    str:= GetMonthR(StrToInt(FReport.Now_month));
    Replace('#Month#', str);
    Replace('#Year#', FReport.Now_year);
    Replace('#dep_ind#', FReport.dep_ind);
    Replace('#phone_inst#', ','+FReport.phone);


    dir_inst:=FReport.dir_inst;
    posit:=Pos(' ', dir_inst);
    copystr1:=Copy(dir_inst,posit+1,Length(dir_inst));
    copystr2:=Copy(dir_inst,1,posit-1);
    copystr1:=copystr1+' '+copystr2;
    Replace('#dir_inst#', copystr1); //переставит буквы местами

     if FReport.type_spr=1 then 
     begin
        Replace('#birth_y#', FReport.birth);
        Replace('#spec#', FReport.specshort);
        first_str:=20;
        num:=0;
        for I := first_str to first_str + FReport.Historyes.Count - 1 do
         begin
         if     I<>20 then
            begin
            Items[I, 5] := FReport.Historyes[num].NumPric;
            Items[I, 11] := FReport.Historyes[num].NamePric;
            str:= GetMonthR(StrToInt(FReport.Historyes[num].month));
            Items[I, 7] := FReport.Historyes[num].day+' '+str+' '+FReport.Historyes[num].year;
            if I <> first_str + FReport.Historyes.Count - 1 then
                begin
                Range['A' + inttostr(I + 1), 'N' + inttostr(I + 1)].Insert(xlDown, xlFormatFromLeftOrAbove);
                Range['A' + inttostr(I + 1), 'N' + inttostr(I + 1)].Select;
                end
           end
        else
        begin
          str:= GetMonthR(StrToInt(FReport.Historyes[num].month));
          Replace('#PrNum#', FReport.Historyes[num].NumPric);
          Replace('#DateZ#', FReport.Historyes[num].day);
          Replace('#MonthZ#', str);
          Replace('#YearZ#', FReport.Historyes[num].year);

      end;
      num:=num+1;
  end;
     end
     else
     begin
    Replace('#YearZ#', FReport.year_post);
    Replace('#podgot#', FReport.podgot);
    Replace('#spec#', FReport.spec);
     end;
end;
end.
