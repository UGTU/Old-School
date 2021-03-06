unit Spravka;

interface

uses
  Classes, dialogs, SysUtils, ExcelXP, Barcode, Contnrs,
  XIntf, CommonIntf, ReportsBase, db, adodb, ExtCtrls,
  udmUspevaemost, ComCtrls, uAverageBalls, SpravkaHistory2014, Spravka2014,
  System.Generics.Collections;

type
  SpravkaReport = class(TExcelReportBase)
  private
    FReport: TObjectList<TSpravka>;
  protected
    procedure Execute; override;
  public
    property ListDoc: TObjectList<TSpravka> read FReport;
    constructor Create(_ListDoc: TObjectList<TSpravka>);
  end;

implementation

uses ConstantRepository;

{ TBRS2014Report }

constructor SpravkaReport.Create(_ListDoc: TObjectList<TSpravka>);
begin
  FReport := _ListDoc;
end;

{ SpravkaReport }

procedure SpravkaReport.Execute;
var
  str, dop, dir_inst, copystr1, copystr2, datebegin, dateend: string;
  posit, first_str, j, I, num: integer;
begin
  inherited;
  ActivateWorksheet(1);
  if FReport.Count > 1 then
    for I := 0 to FReport.Count - 2 do
      DuplicatePage(1, 1);

  for j := 0 to FReport.Count - 1 do
  begin
    ActivateWorksheet(j + 1);
    str := GetKursP(FReport[j].kurs);

    Replace('#kurs#', str);
    Replace('#fio#', FReport[j].FIO);
    Replace('#fac#', FReport[j].instut);
    Replace('#otdel#', FReport[j].f_obuch);

    dop := FReport[j].Now_day;
    if (dop.Length = 1) then
      dop := '0' + dop;
    Replace('#Date#', dop);
    str := GetMonthR(StrToInt(FReport[j].Now_month));
    Replace('#Month#', str);
    Replace('#Year#', FReport[j].Now_year);
    Replace('#dep_ind#', FReport[j].dep_ind);
    Replace('#num#', FReport[j].NumSpr.ToString());
    //Replace('#phone_inst#', ',' + FReport[j].phone);

    dir_inst := FReport[j].dir_inst;
    posit := Pos(' ', dir_inst);
    copystr1 := Copy(dir_inst, posit + 1, Length(dir_inst));
    copystr2 := Copy(dir_inst, 1, posit - 1);
    copystr1 := copystr1 + ' ' + copystr2;
    Replace('#dir_inst#', copystr1); // ���������� ����� �������
    Replace('#postName#', FReport[j].managerPostName);

    Replace('#birth_y#', FReport[j].birth);
    Replace('#spec#', FReport[j].spec);
    Replace('#shifr#', FReport[j].cypher);

    if FReport[j].type_spr = 2 then
    begin
      Replace('#YearOtch#', FReport[j].year_otch);

      first_str := 20;
      num := 0;

      if (FReport[j].Historyes.Count > 1) then
      begin
        Items[first_str, 5] := '� �������';
        Items[first_str, 7] := '����';
        Items[first_str, 12] := '��� �������';
      end;

      for I := first_str to first_str + FReport[j].Historyes.Count - 1 do
      begin
        if I <> 20 then
        begin
          Items[I, 5] := FReport[j].Historyes[num].NumPric;
          Items[I, 12] := FReport[j].Historyes[num].NamePric;
          if FReport[j].Historyes[num].ikTypePric = 4 then
          begin
            datebegin := FReport[j].Historyes[num].datevih;
            posit := Pos('.', datebegin);
            dop := Copy(datebegin, posit + 1, 2);
            str := GetMonthR(StrToInt(Copy(datebegin, posit + 1, 2)));
            copystr1 := Copy(datebegin, 0, posit - 1) + ' ' + str + ' ' +
              Copy(datebegin, 7, 10);

            dateend := FReport[j].Historyes[num].datevh;
            posit := Pos('.', dateend);
            str := GetMonthR(StrToInt(Copy(dateend, posit + 1, 2)));
            copystr2 := Copy(dateend, 0, posit - 1) + ' ' + str + ' ' +
              Copy(dateend, 7, 10);
            Items[I, 7] := copystr1 + ' - ' + copystr2;

          end
          else
          begin
            str := GetMonthR(StrToInt(FReport[j].Historyes[num].month));
            Items[I, 7] := FReport[j].Historyes[num].day + ' ' + str + ' ' +
              FReport[j].Historyes[num].year;
          end;
          if I <> first_str + FReport[j].Historyes.Count - 1 then
          begin
            Range['A' + inttostr(I + 1), 'N' + inttostr(I + 1)
              ].Insert(xlDown, xlFormatFromLeftOrAbove);
            Range['A' + inttostr(I + 1), 'N' + inttostr(I + 1)].Select;
          end
        end
        else
        begin
          str := GetMonthR(StrToInt(FReport[j].Historyes[num].month));
          Replace('#PrNum#', FReport[j].Historyes[num].NumPric);
          Replace('#DateZ#', FReport[j].Historyes[num].day);
          Replace('#MonthZ#', str);
          Replace('#YearZ#', FReport[j].Historyes[num].year);

        end;
        num := num + 1;
      end;
    end;
    ActiveSheet.Name := '� ' + FReport[j].NumSpr.ToString();
  end;

end;

end.
