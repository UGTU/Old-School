unit Spravka;

interface

uses
  Classes, dialogs, SysUtils, ExcelXP, Barcode, Contnrs,
  XIntf, CommonIntf, ReportsBase, db, adodb, ExtCtrls,
  udmUspevaemost, ComCtrls, uAverageBalls, SpravkaHistory2014, Spravka2014;

type
  SpravkaReport = class(TExcelReportBase)
  private
    FReport: TSpravka;
  protected
    procedure Execute; override;
  public
    property Report: TSpravka read FReport;
    constructor Create(Report: TSpravka);
    // function GetMonthR(month:integer):string;
  end;

implementation

uses ConstantRepository;

{ TBRS2014Report }

constructor SpravkaReport.Create(Report: TSpravka);
begin
  FReport := Report;
end;
{ SpravkaReport }

procedure SpravkaReport.Execute;
var
  str, dop, dir_inst, copystr1, copystr2,datebegin,dateend: string;
  posit, first_str, I, num: integer;
  YearPric, MonthPric, DayPric: Word;
begin
  inherited;

  str := GetKursP(FReport.kurs);

  Replace('#kurs#', str);
  Replace('#fio#', FReport.FIO);
  Replace('#fac#', FReport.instut);
  Replace('#otdel#', FReport.f_obuch);
  Replace('#YearOtch#', FReport.year_otch);
  dop := FReport.Now_day;
  if (dop.Length = 1) then
    dop := '0' + dop;
  Replace('#Date#', dop);
  str := GetMonthR(StrToInt(FReport.Now_month));
  Replace('#Month#', str);
  Replace('#Year#', FReport.Now_year);
  Replace('#dep_ind#', FReport.dep_ind);
  Replace('#num#', FReport.NumSpr.ToString());
  Replace('#phone_inst#', ',' + FReport.phone);

  dir_inst := FReport.dir_inst;
  posit := Pos(' ', dir_inst);
  copystr1 := Copy(dir_inst, posit + 1, Length(dir_inst));
  copystr2 := Copy(dir_inst, 1, posit - 1);
  copystr1 := copystr1 + ' ' + copystr2;
  Replace('#dir_inst#', copystr1); // переставит буквы местами

  if FReport.type_spr = 1 then
  begin
    Replace('#birth_y#', FReport.birth);
    Replace('#spec#', FReport.specshort);
    first_str := 20;
    num := 0;

    if (FReport.Historyes.Count > 1) then
    begin
      Items[first_str, 5] := '№ Приказа';
      Items[first_str, 7] := 'Дата';
      Items[first_str, 12] := 'Тип приказа';
    end;


    for I := first_str to first_str + FReport.Historyes.Count - 1 do
    begin
      if I <> 20 then
      begin
        Items[I, 5] := FReport.Historyes[num].NumPric;
        Items[I, 12] := FReport.Historyes[num].NamePric;
                if FReport.Historyes[num].ikTypePric=4 then
                begin
                  datebegin := FReport.Historyes[num].datevih;
                  posit := Pos('-', datebegin);
                  dop:= Copy(datebegin, posit+1, 2);
                  str := GetMonthR(StrToInt(Copy(datebegin, posit+1, 2)));
                  copystr1 := Copy(datebegin, 9, 10)+' '+str+' '+Copy(datebegin, 0, 4);

                  dateend := FReport.Historyes[num].datevh;
                  posit := Pos('-', datebegin);
                  str := GetMonthR(StrToInt(Copy(dateend, posit+1, 2)));
                  copystr2 := Copy(datebegin, 9, 10)+' '+str+' '+Copy(datebegin, 0, 4);
                  Items[I, 7] := copystr1+' - ' + copystr2;

                end
                else
                  begin
                    str := GetMonthR(StrToInt(FReport.Historyes[num].month));
                    Items[I, 7] := FReport.Historyes[num].day + ' ' + str + ' ' +
                    FReport.Historyes[num].year;
                  end;
        if I <> first_str + FReport.Historyes.Count - 1 then
        begin
          Range['A' + inttostr(I + 1), 'N' + inttostr(I + 1)
            ].Insert(xlDown, xlFormatFromLeftOrAbove);
          Range['A' + inttostr(I + 1), 'N' + inttostr(I + 1)].Select;
        end
      end
      else
      begin
        str := GetMonthR(StrToInt(FReport.Historyes[num].month));
        Replace('#PrNum#', FReport.Historyes[num].NumPric);
        Replace('#DateZ#', FReport.Historyes[num].day);
        Replace('#MonthZ#', str);
        Replace('#YearZ#', FReport.Historyes[num].year);

      end;
      num := num + 1;
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
