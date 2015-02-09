unit ConstantRepository;

interface

//Правила именования констант:
//если константа является ключом, то пишем префикс "key_"
const
  key_FBO = 6; //факультет безотрывного обучения (ФБО)
  key_CommonProfile = 0;
  FGOS3 = 2;
  FGOS2 = 1;
  key_WorkPlan = 2;
  key_ModelPlan = 1;
  vid_exam = 6;
  GOS_EXAM = 56;

  //служебные функции
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
      1: str := 'января';
      2: str := 'февраля';
      3: str := 'марта';
      4: str := 'апреля';
      5: str := 'мая';
      6: str := 'июня';
      7: str := 'июля';
      8: str := 'августа';
      9: str := 'сентября';
      10: str := 'октября';
      11: str := 'ноября';
      12: str := 'декабря';
    end;
    result:= str;
end;

function GetKursP(kurs: integer): string;
var str:string;
begin
  case (kurs) of
      1: str := 'первом';
      2: str := 'втором';
      3: str := 'третьем';
      4: str := 'четвертом';
      5: str := 'пятом';
      6: str := 'шестом';
  end;
  result:= str;
end;


end.
