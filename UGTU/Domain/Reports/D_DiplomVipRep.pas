{*
    Отчет - вывод выписки к диплому студента в Excel
    Версия: 1.0.0.1
    Создано: 02.04.2009
    Последняя правка: 
    Автор: Вокуева Т.А.
*}
unit D_DiplomVipRep;
  {#Author tanyav@ist.ugtu.net}

interface
uses
  Classes, SysUtils, ExcelXP, Barcode, Contnrs, ReportsBase, DB, ADODB, uDMDiplom,
    Variants, GeneralController, ApplicationController, ExceptionBase, uDiplOtdKardController;

type
   TDiplomVipExcelReport = class(TExcelReportBase)
  const MainpageNumber = 1;
  const strLength = 60;

  private
    FikZach: integer;
    FikGroup: integer;
    FStudName: string;
    Fik_direction: integer;
    FNameInDatPadez: boolean;
    Fik_fac: integer;
    function GetNextCellVert(cur: String): String;
    function GetPrevCellVert(cur: String): String;
    function GetNextCellHor(cur: String): String;
    function LastPos(subStr, str: string): integer;
    function StringFormat(var str: string; strMaxLen:integer): string;
    function IsNapravl:boolean;
    procedure SelectNextCellVert(var cur: String; var ActRange: Variant);
    procedure SelectNextCellHor(var cur: String; var ActRange: Variant);
    procedure SendToExcel;
    procedure SendStringToExcel(var str, cur: string; ActRange: Variant; StrMaxLength: integer = 0);
    procedure LoadData;
    procedure SendExamRowToExcel(Disc, HourCount, Mark: string; var cur: String;
        var ActRange: Variant);
    function GetWeekCountName(weekCount:integer) : string;
  protected
    procedure Execute;override;
  public
    property ikZach:integer read FikZach write FikZach;
    property ikGroup:integer read FikGroup write FikGroup;
    property StudName:string read FStudName write FStudName;
    property ik_direction:integer read Fik_direction write Fik_direction;
    property ik_fac:integer read Fik_fac write Fik_fac;
    property NameInDatPadez:boolean read FNameInDatPadez write FNameInDatPadez;
  end;

implementation

function TDiplomVipExcelReport.IsNapravl:boolean;
begin
  if ((ik_direction=1) or (ik_direction=3)) then
    result:= true
  else
    result:= false;
end;

function TDiplomVipExcelReport.LastPos(subStr, str: string): integer;
var poss: integer;
begin
  poss:= Pos(subStr, str);
  result:= poss;
  while (poss>0) do
  begin
    str:= Copy(str,poss+1,Length(str)-(poss+1));
    poss:= Pos(subStr, str);
    result:= result+poss;
  end;
end;

procedure TDiplomVipExcelReport.LoadData;
begin
  dmDiplom.adospGetVipiscaForDiplom.Close;
  with dmDiplom.adospGetVipiscaForDiplom.Parameters do
  begin
    Clear;
    CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 4, NULL);
    CreateParameter('@ik_zach', ftInteger, pdInput, 4, FikZach);
    CreateParameter('@ik_CurGroup', ftInteger, pdInput, 4, FikGroup);
  end;
  dmDiplom.adospGetVipiscaForDiplom.Open;

  {if dmDiplom.adospGetVipiscaForDiplom.IsEmpty then
  begin
    raise EApplicationException.Create('У студента '+FStudName+' нет данных по диплому.');
  end; }

  dmDiplom.adospSelUspevForVipisca.Close;
  with dmDiplom.adospSelUspevForVipisca.Parameters do
  begin
    Clear;
    CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 4, NULL);
    CreateParameter('@ik_zach', ftInteger, pdInput, 4, FikZach);
    CreateParameter('@ik_CurGroup', ftInteger, pdInput, 4, FikGroup);
  end;
  dmDiplom.adospSelUspevForVipisca.Open;

  dmDiplom.adospSelKPForVipisca.Close;
  with dmDiplom.adospSelKPForVipisca.Parameters do
  begin
    Clear;
    CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 4, NULL);
    CreateParameter('@ik_zach', ftInteger, pdInput, 4, FikZach);
    CreateParameter('@iK_vid_zanyat', ftInteger, pdInput, 4, 8);
    CreateParameter('@ik_CurGroup', ftInteger, pdInput, 4, FikGroup);
  end;
  dmDiplom.adospSelKPForVipisca.Open;

  {dmDiplom.adospSelKRForVipisca.Close;
  with dmDiplom.adospSelKRForVipisca.Parameters do
  begin
    Clear;
    CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 4, NULL);
    CreateParameter('@ik_zach', ftInteger, pdInput, 4, FikZach);
    CreateParameter('@iK_vid_zanyat', ftInteger, pdInput, 4, 9);
    CreateParameter('@ik_CurGroup', ftInteger, pdInput, 4, FikGroup);
  end;
  dmDiplom.adospSelKRForVipisca.Open;   }

  dmDiplom.adospSelPractForVipisca.Close;
  with dmDiplom.adospSelPractForVipisca.Parameters do
  begin
    Clear;
    CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 4, NULL);
    CreateParameter('@ik_zach', ftInteger, pdInput, 4, FikZach);
    CreateParameter('@ik_CurGroup', ftInteger, pdInput, 4, FikGroup);
  end;
  dmDiplom.adospSelPractForVipisca.Open;

  dmDiplom.adospSelGOSForVipisca.Close;
  with dmDiplom.adospSelGOSForVipisca.Parameters do
  begin
    Clear;
    CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 4, NULL);
    CreateParameter('@ik_zach', ftInteger, pdInput, 4, FikZach);
    CreateParameter('@ik_CurGroup', ftInteger, pdInput, 4, FikGroup);
  end;
  dmDiplom.adospSelGOSForVipisca.Open;

end;

function TDiplomVipExcelReport.GetNextCellVert(cur: String): String;
var
  num: Integer;
  i: Integer;
  nstr: String;
  bstr: String;
begin
  i := 1;
  while i<=Length(cur) do
  begin
    if (cur[i]<='9') and (cur[i]>='0') then
      break;
    Inc(i);
  end;
  nstr := Copy(cur, i, Length(cur)-i+1);
  bstr := Copy(cur, 1, i-1);
  num := StrToInt(nstr);
  num := num+1;
  //переход на следующую страницу
  if (num>59) then
    Result := '$F$8'
  else
    Result := bstr+IntToStr(num);
end;



function TDiplomVipExcelReport.GetPrevCellVert(cur: String): String;
var
  num: Integer;
  i: Integer;
  nstr: String;
  bstr: String;
begin
  i := 1;
  while i<=Length(cur) do
  begin
    if (cur[i]<='9') and (cur[i]>='0') then
      break;
    Inc(i);
  end;
  nstr := Copy(cur, i, Length(cur)-i+1);
  bstr := Copy(cur, 1, i-1);
  num := StrToInt(nstr);
  num := num-1;
  Result := bstr+IntToStr(num);
end;

function TDiplomVipExcelReport.GetWeekCountName(weekCount: integer): string;
var str: string; wMod: integer;
begin
str:= IntToStr(weekCount);
wMod:= weekCount mod 10;
if ((wMod =1) and (weekCount<>11)) then
  str:= str+' неделя'
else
begin

if (wMod > 4) or (wMod = 0) or ((weekCount <20) and (weekCount > 10))then
      str :=   str + ' недель'
    else
      str :=   str +' недели'
end;
  result:= str;
end;

function TDiplomVipExcelReport.GetNextCellHor(cur: String): String;
var
  i: Integer;
begin
  i := 2;
  while i<=Length(cur) do
  begin
    if (cur[i]<='A') or (cur[i]>='Z') then
      break;
    Inc(i);
  end;
  Dec(i);
  cur[i] := chr(ord(cur[i])+1);
  Result := cur;
end;



procedure TDiplomVipExcelReport.SelectNextCellHor(var cur: String;
  var ActRange: Variant);
begin
  cur := GetNextCellHor(cur);
  ActRange := Range[cur,cur];
  ActRange.Select;
end;

procedure TDiplomVipExcelReport.SelectNextCellVert(var cur: String; var ActRange: Variant);
begin
  cur := GetNextCellVert(cur);
  ActRange := Range[cur,cur];
  ActRange.Select;
end;

procedure TDiplomVipExcelReport.SendExamRowToExcel(Disc, HourCount,
  Mark: string; var cur: String;
        var ActRange: Variant);
begin

end;

procedure TDiplomVipExcelReport.SendStringToExcel(var str, cur: string; ActRange: Variant; StrMaxLength: integer = 0);
var i: integer;
  str1: string;
begin
  if (StrMaxLength = 0) then
    StrMaxLength:= strLength;
  while Length(str)>StrMaxLength do
  begin
    for i:= StrMaxLength downto 1 do
      if str[i]=' ' then
      begin
        str1 := Copy(str, 1, i);
        Delete(str, 1, i);
        ActRange.Value := str1;
        SelectNextCellVert(cur, ActRange);
        break;
      end;
  end;
  ActRange.Value := str;
end;

procedure TDiplomVipExcelReport.SendToExcel;
const maxDiscStr = 70;
  MaxKRCount = 6;
  MaxPractCount = 8;
var
  FindRange: Variant;
  ActRange: Variant;
  str, str1: String;   // строка, которую будем вставлять в нужное место в шаблоне
  cur, cur1: String;
  i: Integer;
begin
  //Name:= dmDiplom.adospGetVipiscaForDiplomStudName.AsString;
  ActivateWorksheet(MainpageNumber);
  // вывод общих сведений
  if (NameInDatPadez) then
  begin
    Replace('#Фамилия#', dmDiplom.adospGetVipiscaForDiplomClastname.AsString);
    Replace('#Имя#', dmDiplom.adospGetVipiscaForDiplomFirstName.AsString);
    Replace('#Отчество#', dmDiplom.adospGetVipiscaForDiplomPatronymic.AsString);
    Replace('#МестоРожд#', dmDiplom.adospGetVipiscaForDiplomCplacebirth.AsString);
    Replace('#КвалифКоротко#', dmDiplom.adospGetVipiscaForDiplomQualifShortName.AsString);
    Replace('#Разряд#', dmDiplom.adospGetVipiscaForDiplomSpecategory.AsString);
    Replace('#АттГод#', dmDiplom.adospGetVipiscaForDiplomattYear.AsString);
    Replace('#АттСерия#', dmDiplom.adospGetVipiscaForDiplomAttSer.AsString);
    Replace('#АттНомер#', dmDiplom.adospGetVipiscaForDiplomAttNumber.AsString);
    str1:= dmDiplom.adospGetVipiscaForDiplom.FieldByName('Cname_qualif').AsString;
    TDiplOtdKardController.Instance.ParseString(str1, str, 50);
    Replace('#Квалиф#', str1);
    Replace('#Квалиф2#', str);
  end
  else
  begin
    Replace('#Фамилия#', dmDiplom.adospGetVipiscaForDiplomiClastname.AsString);
    Replace('#Имя#', dmDiplom.adospGetVipiscaForDiplomiFirstName.AsString);
    Replace('#Отчество#', dmDiplom.adospGetVipiscaForDiplomiPatronymic.AsString);
    Replace('#АттГод#', dmDiplom.adospGetVipiscaForDiplomattYear.AsString);
    Replace('#DocumName#', dmDiplom.adospGetVipiscaForDiplomdocumName.AsString);
    Replace('#shifr#', dmDiplom.adospGetVipiscaForDiplomSh_spec.AsString);
    Replace('#Квалиф#', dmDiplom.adospGetVipiscaForDiplom.FieldByName('Cname_qualif').AsString);
    //Replace('#Форм#', dmDiplom.adospGetVipiscaForDiplomform.AsString);
    //Replace('#Декан#', dmDiplom.adospGetVipiscaForDiplomManagerSmallName.AsString);
    {Replace('#ФИО#', dmDiplom.adospGetVipiscaForDiplomStudName.AsString);
      }
  end;
  str:= TGeneralController.Instance.GetFullDate(dmDiplom.adospGetVipiscaForDiplomDd_birth.AsDateTime)+' года';
  Replace('#ДатаРожд#', str);   //docum
  
  i:= dmDiplom.adospGetVipiscaForDiplomYearObuch.AsInteger;
  //для заочников уменьшаем кол-во лет обучения на 1 год
  if (dmDiplom.adospGetVipiscaForDiplomIk_form_ed.AsInteger=2) then
    dec(i);
  str1:= IntToStr(i);
  if (i >4) then
     str1:= str1 + ' лет'
  else
     str1:= str1 + ' года';
  i:= dmDiplom.adospGetVipiscaForDiplomMonthObuch.AsInteger;
  if ((i > 0) and (i<5)) then
    str1:= str1 +' '+ dmDiplom.adospGetVipiscaForDiplomMonthObuch.AsString+'месяца';
  if (i>4) then
    str1:= str1 +' '+ dmDiplom.adospGetVipiscaForDiplomMonthObuch.AsString+'месяцев';
  Replace('#Лет#', str1);


  {if dmDiplom.adospGetVipiscaForDiplomDd_VidDipl.Value>0 then
  begin
    str:= TGeneralController.Instance.GetFullDate(dmDiplom.adospGetVipiscaForDiplomDd_VidDipl.AsDateTime);
    Replace('#ДатаВыд#', str);
  end; }

  if (ik_fac = 22) then
  begin
    Replace('#DocumName#', dmDiplom.adospGetVipiscaForDiplomdocumName.AsString);
    Replace('#Специальность#', dmDiplom.adospGetVipiscaForDiplomCname_spec.AsString);
  end;

  //записываем поля, в которых в начале строки м.б. нули
  FindRange := Find('#РегНом#');
  FindRange.Select;
  ActRange := Selection;
  ActRange.Value2:= dmDiplom.adospGetVipiscaForDiplomRegNumber.AsString;
  FindRange := Find('#НомВып#');
  FindRange.Select;
  ActRange := Selection;
  ActRange.Value2:= dmDiplom.adospGetVipiscaForDiplomVipNumber.AsString;
  //Replace('##', );
  // вывод инфы о дипломе (возможен многострочный, макс. длина строки 80
  // символов)
  if (ik_direction <> 5) then
  begin

    //if (ik_direction <> 3) then
      //Replace('#ТипКвалиф#', dmDiplom.adospGetVipiscaForDiplom.FieldByName('typeQualif').AsString);

    {if dmDiplom.adospGetVipiscaForDiplomDd_dipl.Value>0 then
    begin
      str:= TGeneralController.Instance.GetFullDate(dmDiplom.adospGetVipiscaForDiplomDd_dipl.AsDateTime);
    end
    else
      str:= '<не указана>';
    Replace('#ДатаКом#', str); }
    //Replace('#Поступ#', dmDiplom.adospGetVipiscaForDiplomyearPostup.AsString);
    //Replace('#ЗавОбуч#', dmDiplom.adospGetVipiscaForDiplomYearGrad.AsString);
    //Replace('#Форм#', dmDiplom.adospGetVipiscaForDiplomform.AsString);
    if (dmDiplom.adospGetVipiscaForDiplomIsExcellent.AsBoolean) then
      Replace('#СОтличием#', 'С ОТЛИЧИЕМ')
    else
      Replace('#СОтличием#', '');
    str:= dmDiplom.adospGetVipiscaForDiplomCname_spec.AsString;
    str1:=StringFormat(str, 48);
    Replace('#Специальность#', str);
    Replace('#Специальность2#', str1);
    i:= 1;
    if (dmDiplom.adospGetVipiscaForDiplomcName_spclz.AsString<>'') then
    begin
      if ((IsNapravl())) then
      begin
        str:= 'Направленность (профиль) образовательной программы: '+dmDiplom.adospGetVipiscaForDiplomcName_spclz.AsString;
        str1:=StringFormat(str, 45);
        Replace('#Доп'+IntToStr(i), str);
        inc(i);
        Replace('#Доп'+IntToStr(i), str1);
      end
      else
        Replace('#Доп'+IntToStr(i), 'Специализация: '+dmDiplom.adospGetVipiscaForDiplomcName_spclz.AsString);
      //
      inc(i);
    end;


    //строчки из доп сведений редактируем
    //так приходится делать из-за того, что ячейки объединенные
  if (dmDiplom.adospGetVipiscaForDiplomik_direction.AsInteger = 2) and
      (dmDiplom.adospGetVipiscaForDiplomYearObuch.AsInteger < 5) then
  begin
      Replace('#Доп'+IntToStr(i), 'Пройдено ускоренное обучение по образовательной программе.');
      inc(i);
  end;
  if (dmDiplom.adospGetVipiscaForDiplomOverVUZ.AsBoolean) then
  begin
     Replace('#Доп'+IntToStr(i),'Часть образовательной программы в объеме ___ недель освоена в____________.');
     inc(i);
  end;
  while (i<4) do
  begin
    Replace('#Доп'+IntToStr(i),'');
    inc(i);
  end;

  //ActRange.Value :='';

    {str := dmDiplom.adospGetVipiscaForDiplomcdiplom.AsString;
    FindRange := Find('#дипл#');
    FindRange.Select;
    ActRange := Selection;
    cur:= ActRange.Address;

  SendStringToExcel(str, cur, ActRange);}
  // вывод курсовых работ
  //dmDiplom.adospSelKRForVipisca.First;
  FindRange := Find('#КР#');
  FindRange.Select;
  ActRange := Selection;
  cur:= ActRange.Address;
  //if (dmDiplom.adospSelKRForVipisca.RecordCount=0) then

  {repeat
  begin
    if (dmDiplom.adospSelKRForVipisca.Eof) then
      str:= ''
    else
    begin
      str := dmDiplom.adospSelKRForVipisca.FieldByName('cTema').AsString;
      if str = '' then str := 'тема не указана';
      //str :=  str+', '+ dmDiplom.adospSelKRForVipisca.FieldByName('cOsenca').AsString;
    end;
    SendStringToExcel(str, cur, ActRange);
    dmDiplom.adospSelKRForVipisca.Next;
    SelectNextCellVert(cur, ActRange);
  end;    
  until dmDiplom.adospSelKRForVipisca.Eof; }
  // вывод курсовых проектов, если их мало
   //if (dmDiplom.adospSelKRForVipisca.RecordCount + dmDiplom.adospSelKPForVipisca.RecordCount <MaxKRCount) then
  begin
    dmDiplom.adospSelKPForVipisca.First;
    ActRange := Range[cur,cur];
    repeat
    begin
      if (dmDiplom.adospSelKPForVipisca.Eof) then
        str:= ''
      else
      begin
        str := dmDiplom.adospSelKPForVipiscadiscName.AsString;
        if str = '' then str := 'тема не указана';
        //str :=  str+', '+ dmDiplom.adospSelKPForVipiscacOsenca.AsString;
      end;
      	str1:=StringFormat(str, maxDiscStr);   //запоминаем остаток строки
				ActRange.Value := str;

				cur1 := Selection.Address;

				SelectNextCellHor(cur1,ActRange);
				str := dmDiplom.adospSelKPForVipiscacOsenca.AsString;
				ActRange.Value := str;

				if (str1<>'') then
				begin
				  SelectNextCellVert(cur, ActRange);
				  ActRange.Value := str1;    //записываем остаток строки
				end;
      dmDiplom.adospSelKPForVipisca.Next;
      SelectNextCellVert(cur, ActRange);
    end;
    until dmDiplom.adospSelKPForVipisca.Eof;
  end;

  {
  //вывод практик  #Практики#
  dmDiplom.adospSelPractForVipisca.First;
  FindRange := Find('#Практики#');
  FindRange.Select;
  ActRange := Selection;
  cur:= ActRange.Address;
  repeat
  begin
    if (dmDiplom.adospSelPractForVipisca.Eof) then
      str:= ''
    else
    begin
      str := dmDiplom.adospSelPractForVipisca.FieldByName('cName_disc').AsString;
      str :=  str+', '+ dmDiplom.adospSelPractForVipisca.FieldByName('weekCount').AsString;
      str :=  str +' недель, '+ dmDiplom.adospSelPractForVipisca.FieldByName('cOsenca').AsString;
    end;
    SendStringToExcel(str, cur, ActRange);
    dmDiplom.adospSelPractForVipisca.Next;
    SelectNextCellVert(cur, ActRange);
  end;
  until dmDiplom.adospSelPractForVipisca.Eof;

  //гос экзамен #ГОС#
  dmDiplom.adospSelGOSForVipisca.First;
  if (dmDiplom.adospSelPractForVipisca.RecordCount>MaxPractCount) then
    SelectNextCellVert(cur, ActRange)
  else
  begin
    FindRange := Find('#ГОС#');
    FindRange.Select;
    ActRange := Selection;
    cur:= ActRange.Address;
  end;
  repeat
  begin
    if (dmDiplom.adospSelGOSForVipisca.Eof) then
      str:= ''
    else
    begin
      if ((ik_direction = 3) or (ik_direction = 1)) then
        str := 'междисциплинарный по направлению'
      else
        str := 'междисциплинарный по специальности';
      str :=  str +', '+ dmDiplom.adospSelGOSForVipisca.FieldByName('cOsenca').AsString;
    end;
    SendStringToExcel(str, cur, ActRange);
    dmDiplom.adospSelGOSForVipisca.Next;
    SelectNextCellVert(cur, ActRange);
  end;
  until dmDiplom.adospSelGOSForVipisca.Eof;
  }

  //********** ВТОРАЯ   СТРАНИЦА *******************
  ActivateWorksheet(MainpageNumber+1);
  // вывод оценок
  dmDiplom.adospSelUspevForVipisca.First;
  FindRange := Find('#Экз#');
  FindRange.Select;
  ActRange := Selection;
  cur:= ActRange.Address;
  //i:=1;
  repeat
  begin
    str:= '';
    if (not dmDiplom.adospSelUspevForVipisca.Eof) then
    begin
      if (dmDiplom.adospSelUspevForVipisca.FieldByName('iK_disc').AsInteger > 0) then
        //str := intToStr(i)+'. ';
      str := str+dmDiplom.adospSelUspevForVipisca.FieldByName('cName_disc').AsString;
    end;
    str1:=StringFormat(str, maxDiscStr);   //запоминаем остаток строки
    ActRange.Value := str;

    cur1 := Selection.Address;
    SelectNextCellHor(cur1,ActRange);
    if ({(ik_direction = 1) or }(ik_direction = 3)) then
    begin
      str := FormatFloat('###.', dmDiplom.adospSelUspevForVipisca.FieldByName('HourCount').AsFloat/36.0)+' з.е.';
    end
    else
      str := dmDiplom.adospSelUspevForVipisca.FieldByName('HourCount').AsString+' час.';
    ActRange.Value := str;


    SelectNextCellHor(cur1,ActRange);
    str := dmDiplom.adospSelUspevForVipisca.FieldByName('cOsenca').AsString;
    ActRange.Value := str;

    if (str1<>'') then
    begin
      SelectNextCellVert(cur, ActRange);
      ActRange.Value := str1;    //записываем остаток строки
    end;

    dmDiplom.adospSelUspevForVipisca.Next;
    //inc(i);
    SelectNextCellVert(cur, ActRange);
  end;
  until (dmDiplom.adospSelUspevForVipisca.FieldByName('iK_disc').AsInteger <= 0);

  {SelectNextCellVert(cur, ActRange);
  str:=  'Практики';
  SendStringToExcel(str, cur, ActRange); }
  

  SelectNextCellVert(cur, ActRange);
  //вывод практик  #Практики#
  dmDiplom.adospSelPractForVipisca.First;
  repeat
  begin
    if (dmDiplom.adospSelPractForVipisca.Eof) then
      str:= ''
    else
    begin
      str := dmDiplom.adospSelPractForVipisca.FieldByName('DiscName').AsString;
      //str :=  str+' '+ dmDiplom.adospSelPractForVipisca.FieldByName('weekCount').AsString;
      //str :=  str +' недель, '+ dmDiplom.adospSelPractForVipisca.FieldByName('cOsenca').AsString;
    end;
    cur1 := Selection.Address;
    SendStringToExcel(str, cur, ActRange);
    SelectNextCellHor(cur1,ActRange);
    str:= GetWeekCountName(dmDiplom.adospSelPractForVipisca.FieldByName('weekCount').AsInteger);
    ActRange.Value := str;

    SelectNextCellHor(cur1,ActRange);
    str := dmDiplom.adospSelPractForVipisca.FieldByName('cOsenca').AsString;
    ActRange.Value := str;
    if (dmDiplom.adospSelPractForVipisca.FieldByName('n_sem').AsInteger=0) then
    begin
      SelectNextCellVert(cur, ActRange);
      str:= 'в том числе:';
      SendStringToExcel(str, cur, ActRange);
    end;
    dmDiplom.adospSelPractForVipisca.Next;
    SelectNextCellVert(cur, ActRange);
  end;
  until dmDiplom.adospSelPractForVipisca.Eof;


  SelectNextCellVert(cur, ActRange);
  str:=  'Государственная итоговая аттестация';
  SendStringToExcel(str, cur, ActRange);
  dmDiplom.adospSelGOSForVipisca.Last;

  cur1 := Selection.Address;
  SelectNextCellHor(cur1,ActRange);
  if (dmDiplom.adospSelGOSForVipisca.FieldByName('iHour_gos').AsInteger>0) then
    str:= GetWeekCountName(dmDiplom.adospSelGOSForVipisca.FieldByName('iHour_gos').AsInteger)
  else
    str := 'x';
  ActRange.Value := str;
  SelectNextCellHor(cur1,ActRange);
  str := 'x';

  ActRange.Value := str;
  SelectNextCellVert(cur, ActRange);
  str:= 'в том числе:';
  SendStringToExcel(str, cur, ActRange);

  SelectNextCellVert(cur, ActRange);
  //гос экзамен #ГОС#
  dmDiplom.adospSelGOSForVipisca.First;
  if (dmDiplom.adospSelGOSForVipisca.Eof) then
      str:= ''
  else
  begin
      if (IsNapravl()) then
        str := 'Итоговый госудаственный междисциплинарный экзамен по направлению подготовки'
      else
        str := 'Итоговый госудаственный междисциплинарный экзамен по специальности'//'Итоговый государственный междисциплинарный экзамен';
    end;
    cur1 := Selection.Address;
    SendStringToExcel(str, cur, ActRange);
    SelectNextCellHor(cur1,ActRange);
    str := 'x';
    ActRange.Value := str;
    SelectNextCellHor(cur1,ActRange);
    str := dmDiplom.adospSelGOSForVipisca.FieldByName('cOsenca').AsString;
    ActRange.Value := str;
    SendStringToExcel(str, cur, ActRange);

    SelectNextCellVert(cur, ActRange);
  end;


  //диплом
  str:=  'Выпускная квалификационная работа';
  SendStringToExcel(str, cur, ActRange);
  SelectNextCellVert(cur, ActRange);
  str := dmDiplom.adospGetVipiscaForDiplomcdiplom.AsString;
  SendStringToExcel(str, cur, ActRange);
    cur1 := Selection.Address;
    SelectNextCellHor(cur1,ActRange);
    str := 'x';
    ActRange.Value := str;
    SelectNextCellHor(cur1,ActRange);
    str := dmDiplom.adospGetVipiscaForDiplomOcencaDiplom.AsString;
    ActRange.Value := str;

  //Общее кол-во часов
  SelectNextCellVert(cur, ActRange);
  SelectNextCellVert(cur, ActRange);

  repeat
  begin
    str:= '';
    if (not dmDiplom.adospSelUspevForVipisca.Eof) then
    begin
      str := dmDiplom.adospSelUspevForVipisca.FieldByName('cName_disc').AsString;
    end;
    //str1:=StringFormat(str, maxDiscStr);   //запоминаем остаток строки
    //ActRange.Value := str;
    cur1 := Selection.Address;
    SendStringToExcel(str, cur, ActRange);
    SelectNextCellHor(cur1,ActRange);
    if ((dmDiplom.adospSelUspevForVipisca.FieldByName('iK_disc').AsInteger<0) and (ik_direction = 3)) then
    begin
      str := FormatFloat('###.', dmDiplom.adospSelUspevForVipisca.FieldByName('HourCount').AsFloat/36.0)+' з.е.';
    end
    else
      str := dmDiplom.adospSelUspevForVipisca.FieldByName('HourCount').AsString+' час.';
    ActRange.Value := str;

    SelectNextCellHor(cur1,ActRange);
    str := dmDiplom.adospSelUspevForVipisca.FieldByName('cOsenca').AsString;
    ActRange.Value := str;

    {if (str1<>'') then
    begin
      SelectNextCellVert(cur, ActRange);
      ActRange.Value := str1;    //записываем остаток строки
    end; }

    dmDiplom.adospSelUspevForVipisca.Next;
    inc(i);
    SelectNextCellVert(cur, ActRange);
  end;
  until (dmDiplom.adospSelUspevForVipisca.Eof);
  {cur1:= cur;
  cur1 := GetPrevCellVert(cur1);
  cur1 := GetPrevCellVert(cur1);
  ActRange := Range[cur1,cur1];
  ActRange.Borders.item[8].Weight := 2;
  cur1 := GetNextCellHor(cur1);
  ActRange := Range[cur1,cur1];
  ActRange.Borders.item[8].Weight := 2;    }
  // вывод курсовых проектов, если их мало
  {if (dmDiplom.adospSelKRForVipisca.RecordCount + dmDiplom.adospSelKPForVipisca.RecordCount >=MaxKRCount) then
  begin
    dmDiplom.adospSelKPForVipisca.First;
    ActRange := Range[cur,cur];
    repeat
    begin
      if (dmDiplom.adospSelKPForVipisca.Eof) then
        str:= ''
      else
      begin
        str := dmDiplom.adospSelKPForVipiscacTema.AsString;
        if str = '' then str := 'тема не указана';
        str :=  str+', '+ dmDiplom.adospSelKPForVipiscacOsenca.AsString;
      end;
      SendStringToExcel(str, cur, ActRange);
      dmDiplom.adospSelKPForVipisca.Next;
      SelectNextCellVert(cur, ActRange);
    end;
    until dmDiplom.adospSelKPForVipisca.Eof;
  end
  else
    ActRange := Range[cur,cur];
  ActRange.Borders.item[8].Weight := 2;
  ActRange.Value := 'Конец документа';
        }
  //end;
  //ActRange.HorizontalAlignment := -4108;
  ActivateWorksheet(MainpageNumber);
end;


//возвращает остаток строки после strMaxLen (слова разбивает по пробелам)
function TDiplomVipExcelReport.StringFormat(var str: string;
  strMaxLen: integer): string;
var
  CopyPos:integer;
begin
  result:= '';
  if (Length(str)>strMaxLen) then
  begin
    if (str[strMaxLen+1]=' ') then
    begin
      CopyPos:= strMaxLen+1;
    end
    else
    begin
      CopyPos:= LastPos(' ',str);
    end;
      result:= Copy(str, CopyPos + 1, Length(str) - CopyPos);
      str:=Copy(str, 1, CopyPos);
  end;
end;

procedure TDiplomVipExcelReport.Execute;
begin
  inherited;
  //загрузка данных
  LoadData;

  //вывод в Excel
  SendToExcel;
  {ActiveBarcodeApplet.AppletName := 'PDF417Ctrl1';
  ActiveBarcodeApplet.BarcodeHeader := TBarcodeReportHeader.Create;
  ActiveBarcodeApplet.BarcodeHeader.MajorVersion := 1;
  ActiveBarcodeApplet.BarcodeHeader.MinorVersion := 0;
  ActiveBarcodeApplet.BarcodeHeader.ObjectType := 1;
  ActiveBarcodeApplet.BarcodeHeader.OID := Fik_ved;
  ActiveBarcodeApplet.WriteToApplet; }
  Show;
end;

end.
