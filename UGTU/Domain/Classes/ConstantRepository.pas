unit ConstantRepository;

interface

uses System.Variants;

//ѕравила именовани€ констант:
//если константа €вл€етс€ ключом, то пишем префикс "key_"
const
  key_FBO = 6; //факультет безотрывного обучени€ (‘Ѕќ)
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


  //типы дисциплин
  typeTypicalDisc = 1;
  typeGosExam = 5;
  typePract = 2;
  typeDiplom = 3;
  typeNIR = 12;

  //единицы измерени€
  Hours = 1;
  Days = 2;
  KolDaysInWeek = 6;

  //служебные функции
  function IfNull(const Value, Default: OleVariant): OleVariant;

  function GetMonthR(month:integer): string;    //получить мес€ц в род.п. по номеру
  function GetKursP(kurs: integer): string;     //получить номер курса в предл. п. по номеру

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

function GetKursP(kurs: integer): string;
var str:string;
begin
  case (kurs) of
      1: str := 'первом';
      2: str := 'втором';
      3: str := 'третьем';
      4: str := 'четвертом';
      5: str := 'п€том';
      6: str := 'шестом';
  end;
  result:= str;
end;


end.
