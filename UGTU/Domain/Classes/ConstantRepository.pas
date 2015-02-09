unit ConstantRepository;

interface

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

  //��������� �������
  function GetMonthR(month:integer): string;
  function GetKursP(kurs:integer): string;

  //ErrorCode
  NoError = 0;
  ExistError = 1;
  FailError = 2;
  StatusError = 3;

implementation

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


end.
