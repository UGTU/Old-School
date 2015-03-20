unit ConstantRepository;

interface

uses System.Variants, System.SysUtils;

// ѕравила именовани€ констант:
// если константа €вл€етс€ ключом, то пишем префикс "key_"
const
  key_FBO = 6; // факультет безотрывного обучени€ (‘Ѕќ)
  key_CommonProfile = 0;
  FGOS3 = 2;
  FGOS2 = 1;
  key_WorkPlan = 2;
  key_ModelPlan = 1;
  vid_exam = 6;
  GOS_EXAM = 56;
  FISCULTURA_ZE = 2;

  // типы дисциплин
  typeTypicalDisc = 1;
  typeGosExam = 5;
  typePract = 2;
  typeDiplom = 3;
  typeNIR = 12;

  // единицы измерени€
  Hours = 1;
  Days = 2;
  KolDaysInWeek = 6;

  //виды документов
  PassportRF = 4;

  // служебные функции
function IfNull(const Value, Default: OleVariant): OleVariant;

function GetMonthR(month: integer): string; // получить мес€ц в род.п. по номеру
function GetKursP(kurs: integer): string;
// получить номер курса в предл. п. по номеру
function GetTimeByType(aEdIzm, aHours: integer): string; // получить
// function GetWeekCountName(weekCount: integer): string; //получить кол-во недель в виде строки
function GetWeekCountNameFromDays(daysCount: integer): string;
// получить кол-во недель в виде строки из часов

implementation

function IfNull(const Value, Default: OleVariant): OleVariant;
begin
  if Value = NULL then
    Result := Default
  else
    Result := Value;
end;

function GetMonthR(month: integer): string;
var
  str: string;
begin
  case month of
    1:
      str := '€нвар€';
    2:
      str := 'феврал€';
    3:
      str := 'марта';
    4:
      str := 'апрел€';
    5:
      str := 'ма€';
    6:
      str := 'июн€';
    7:
      str := 'июл€';
    8:
      str := 'августа';
    9:
      str := 'сент€бр€';
    10:
      str := 'окт€бр€';
    11:
      str := 'но€бр€';
    12:
      str := 'декабр€';
  end;
  Result := str;
end;

function GetKursP(kurs: integer): string;
var
  str: string;
begin
  case (kurs) of
    1:
      str := 'первом';
    2:
      str := 'втором';
    3:
      str := 'третьем';
    4:
      str := 'четвертом';
    5:
      str := 'п€том';
    6:
      str := 'шестом';
  end;
  Result := str;
end;

function GetTimeByType(aEdIzm, aHours: integer): string;
var
  str: string;
begin
  case aEdIzm of
    Hours:
      Result := IntToStr(aHours);
    Days: // в дн€х
      begin
        str := '';
        if aHours >= KolDaysInWeek then
          str := IntToStr(aHours div KolDaysInWeek);
        if (aHours mod KolDaysInWeek) > 0 then
        begin
          if str <> '' then
            str := str + ' ';
          str := str + IntToStr(aHours mod KolDaysInWeek) + '/' +
            IntToStr(KolDaysInWeek);
        end;
        Result := str;
      end;
  end;
end;

function GetWeekCountName(weekCountStr: string): string;
var
  str: string;
  wMod: integer;
  WeekCount: integer;
begin
  if ((Length(weekCountStr) > 2) or (Length(weekCountStr) = 0)) then
    str := str + ' недели'
  else
  begin
    str := weekCountStr;
    WeekCount := StrToInt(weekCountStr);
    wMod := WeekCount mod 10;
    if ((wMod = 1) and (WeekCount <> 11)) then
      str := str + ' недел€'
    else
    begin

      if (wMod > 4) or (wMod = 0) or ((WeekCount < 20) and (WeekCount > 10))
      then
        str := str + ' недель'
      else
        str := str + ' недели'
    end;
  end;
  Result := str;
end;

function GetWeekCountNameFromDays(daysCount: integer): string;
begin
  Result := GetWeekCountName(GetTimeByType(Days, daysCount));
end;

end.
