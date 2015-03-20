unit ConstantRepository;

interface

uses System.Variants, System.SysUtils;

// ������� ���������� ��������:
// ���� ��������� �������� ������, �� ����� ������� "key_"
const
  key_FBO = 6; // ��������� ������������ �������� (���)
  key_CommonProfile = 0;
  FGOS3 = 2;
  FGOS2 = 1;
  key_WorkPlan = 2;
  key_ModelPlan = 1;
  vid_exam = 6;
  GOS_EXAM = 56;
  FISCULTURA_ZE = 2;

  // ���� ���������
  typeTypicalDisc = 1;
  typeGosExam = 5;
  typePract = 2;
  typeDiplom = 3;
  typeNIR = 12;

  // ������� ���������
  Hours = 1;
  Days = 2;
  KolDaysInWeek = 6;

  //���� ����������
  PassportRF = 4;

  // ��������� �������
function IfNull(const Value, Default: OleVariant): OleVariant;

function GetMonthR(month: integer): string; // �������� ����� � ���.�. �� ������
function GetKursP(kurs: integer): string;
// �������� ����� ����� � �����. �. �� ������
function GetTimeByType(aEdIzm, aHours: integer): string; // ��������
// function GetWeekCountName(weekCount: integer): string; //�������� ���-�� ������ � ���� ������
function GetWeekCountNameFromDays(daysCount: integer): string;
// �������� ���-�� ������ � ���� ������ �� �����

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
      str := '������';
    2:
      str := '�������';
    3:
      str := '�����';
    4:
      str := '������';
    5:
      str := '���';
    6:
      str := '����';
    7:
      str := '����';
    8:
      str := '�������';
    9:
      str := '��������';
    10:
      str := '�������';
    11:
      str := '������';
    12:
      str := '�������';
  end;
  Result := str;
end;

function GetKursP(kurs: integer): string;
var
  str: string;
begin
  case (kurs) of
    1:
      str := '������';
    2:
      str := '������';
    3:
      str := '�������';
    4:
      str := '���������';
    5:
      str := '�����';
    6:
      str := '������';
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
    Days: // � ����
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
    str := str + ' ������'
  else
  begin
    str := weekCountStr;
    WeekCount := StrToInt(weekCountStr);
    wMod := WeekCount mod 10;
    if ((wMod = 1) and (WeekCount <> 11)) then
      str := str + ' ������'
    else
    begin

      if (wMod > 4) or (wMod = 0) or ((WeekCount < 20) and (WeekCount > 10))
      then
        str := str + ' ������'
      else
        str := str + ' ������'
    end;
  end;
  Result := str;
end;

function GetWeekCountNameFromDays(daysCount: integer): string;
begin
  Result := GetWeekCountName(GetTimeByType(Days, daysCount));
end;

end.
