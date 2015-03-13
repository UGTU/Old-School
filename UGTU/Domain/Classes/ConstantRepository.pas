unit ConstantRepository;

interface

uses System.Variants, System.SysUtils;

//������� ���������� ��������:
//���� ��������� �������� ������, �� ����� ������� "key_"
const
  key_FBO = 6; //��������� ������������ �������� (���)
  key_CommonProfile = 0;
  FGOS3 = 2;
  FGOS2 = 1;
  key_WorkPlan = 2;
  key_ModelPlan = 1;
  vid_exam = 6;
  GOS_EXAM = 56;
  FISCULTURA_ZE = 2;


  //���� ���������
  typeTypicalDisc = 1;
  typeGosExam = 5;
  typePract = 2;
  typeDiplom = 3;
  typeNIR = 12;

  //������� ���������
  Hours = 1;
  Days = 2;
  KolDaysInWeek = 6;

  //��������� �������
  function IfNull(const Value, Default: OleVariant): OleVariant;

  function GetMonthR(month:integer): string;    //�������� ����� � ���.�. �� ������
  function GetKursP(kurs: integer): string;     //�������� ����� ����� � �����. �. �� ������
  function GetTimeByType(aEdIzm, aHours: integer): string; //��������
  function GetWeekCountName(weekCount: integer): string; //�������� ���-�� ������ � ���� ������
implementation

function IfNull(const Value, Default: OleVariant): OleVariant;
begin
  if Value = NULL then
    Result := Default
  else
    Result := Value;
end;


function GetMonthR(month:integer):string;
var str:string;
begin
    case month of
      1: str := '������';
      2: str := '�������';
      3: str := '�����';
      4: str := '������';
      5: str := '���';
      6: str := '����';
      7: str := '����';
      8: str := '�������';
      9: str := '��������';
      10: str := '�������';
      11: str := '������';
      12: str := '�������';
    end;
    result:= str;
end;

function GetKursP(kurs: integer): string;
var str:string;
begin
  case (kurs) of
      1: str := '������';
      2: str := '������';
      3: str := '�������';
      4: str := '���������';
      5: str := '�����';
      6: str := '������';
  end;
  result:= str;
end;

function GetTimeByType(aEdIzm, aHours: integer): string;
var str: string;
begin
  case aEdIzm of
    Hours: Result := IntToStr(aHours);
    Days: //� ����
    begin
      str := '';
      if aHours>KolDaysInWeek then
         str := IntToStr(aHours div KolDaysInWeek);
      if (aHours mod KolDaysInWeek)>0 then
      begin
        if str<>'' then str := str + ' ';
        str := str + IntToStr(aHours mod KolDaysInWeek) + '/'+IntToStr(KolDaysInWeek);
      end;
      Result := str;
    end;
  end;
end;

function GetWeekCountName(weekCount: integer): string;
var str: string; wMod: integer;
begin
str:= IntToStr(weekCount);
wMod:= weekCount mod 10;
if ((wMod =1) and (weekCount<>11)) then
  str:= str+' ������'
else
begin

if (wMod > 4) or (wMod = 0) or ((weekCount <20) and (weekCount > 10))then
      str :=   str + ' ������'
    else
      str :=   str +' ������'
end;
  result:= str;
end;

end.
