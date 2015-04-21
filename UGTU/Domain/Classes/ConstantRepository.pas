unit ConstantRepository;

interface

uses System.Variants, System.SysUtils, DateUtils;

// Правила именования констант:
// если константа является ключом, то пишем префикс "key_"
const
  Male = 1;
  Female = 0;

  Russia = 2;

  DefaultMaleStatus = 9;
  DefaultFemaleStatus = 7;

  TypeAddressPropiska = 2;

  key_FBO = 6; // факультет безотрывного обучения (ФБО)
  key_CommonProfile = 0;
  FGOS3 = 2;
  FGOS2 = 1;
  key_WorkPlan = 2;
  key_ModelPlan = 1;
  vid_exam = 6;
  GOS_EXAM = 56;
  FISCULTURA_ZE = 2;

  //ErrorCode
  NoError = 0;
  ExistError = 1;
  FailError = 2;
  StatusError = 3;

  // типы дисциплин
  typeTypicalDisc = 1;
  typeGosExam = 5;
  typePract = 2;
  typeDiplom = 3;
  typeNIR = 12;

  // единицы измерения
  Hours = 1;
  Days = 2;
  KolDaysInWeek = 6;

  //виды документов
  PassportRF = 4;

  //состояния студентов
  AcademReturn = 13;      //Возврат после отпуска

  // служебные функции
function IfNull(const Value, Default: OleVariant): OleVariant;

function GetMonthR(month: integer): string; // получить месяц в род.п. по номеру
function GetFullDate(ddate:TDateTime):string; //получить полную запись даты
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
      str := 'января';
    2:
      str := 'февраля';
    3:
      str := 'марта';
    4:
      str := 'апреля';
    5:
      str := 'мая';
    6:
      str := 'июня';
    7:
      str := 'июля';
    8:
      str := 'августа';
    9:
      str := 'сентября';
    10:
      str := 'октября';
    11:
      str := 'ноября';
    12:
      str := 'декабря';
  end;
  Result := str;
end;

function GetFullDate(ddate:TDateTime):string;
  begin
   // date:= DateOf(ddate);
   if (DayOf(ddate)<10) then
      Result:='0'+IntToStr(DayOf(ddate))+' '+GetMonthR(MonthOf(ddate))+' '+IntToStr(YearOf(ddate))
   else
      Result:=IntToStr(DayOf(ddate))+' '+GetMonthR(MonthOf(ddate))+' '+IntToStr(YearOf(ddate));
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
      str := 'пятом';
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
    Days: // в днях
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
      str := str + ' неделя'
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
