{*
    Отчет - вывод выписки к диплому студента в Excel
    Версия: 1.0.0.1
    Создано: 02.04.2009
    Последняя правка:
    Автор: Вокуева Т.А.

    ПРИМЕЧАНИЯ:
    Если студент зачислялся с другого вуза и у него есть перезачеты, то надо
    указывать, сколько недель он проучился в другом ВУЗе.
    Для этого считать приблизительное число недель:
    Кол-во недель = 42 недели в году*кол-во лет обучения

    Кол-во недель на итоговую аттестацию указывается в уч плане.
    вид занятий - выпускная работа.
    Считается кол-во недель с ГОС экзамена до защиты.

    Для восстанавливающихся из филиала не надо указыват перезачеты и все остальное.
*}
unit D_DiplomVipRep;
  {#Author tanyav@ist.ugtu.net}

interface
uses
    Classes, SysUtils, ExcelXP, Barcode, Contnrs, ReportsBase, DB, ADODB, uDMDiplom,
    Variants, GeneralController, ApplicationController, ExceptionBase, uDiplOtdKardController,
    ConstantRepository;

type
    TDiplomVipExcelReport = class(TExcelReportBase)
    const MainpageNumber = 1;
    const strLength = 60;
    const DiscNextPageAddress = '$F$8';

private
    FikZach: integer;
    FikGroup: integer;
    FStudName: string;
    Fik_direction: integer;
    FNameInDatPadez: boolean;
    Fik_VidGos: integer;
    Fik_fac: integer;
    CurrentDiskPageNumber: integer;
    function GetNextCellVert(cur: String; StrRest: string = ''): String;
    function GetPrevCellVert(cur: String): String;
    function GetNextCellHor(cur: String): String;
    function LastPos(subStr, str: string): integer;
    function StringFormat(var str: string; strMaxLen:integer): string;
    //function IsNapravl:boolean;
    procedure SelectNextCellVert(var cur: String; var ActRange: Variant; StrRest: string = '');
    procedure SelectPrevCellVert(var cur: String; var ActRange: Variant);
    procedure SelectNextCellHor(var cur: String; var ActRange: Variant);
    procedure SendToExcel;
    procedure SendStringToExcel(var str, cur: string; ActRange: Variant; StrMaxLength: integer = 0);
    procedure LoadData;
    procedure SendExamRowToExcel(Disc, HourCount, Mark: string; var cur: String; var ActRange: Variant);
protected
    procedure Execute;override;
public
    property ikZach:integer read FikZach write FikZach;
    property ikGroup:integer read FikGroup write FikGroup;
    property StudName:string read FStudName write FStudName;
    property ik_direction:integer read Fik_direction write Fik_direction;
    property ik_VidGos:integer read Fik_VidGos write Fik_VidGos;
    property ik_fac:integer read Fik_fac write Fik_fac;
    property NameInDatPadez:boolean read FNameInDatPadez write FNameInDatPadez;
end;

//#NG
//Класс для хранения данных о дисциплине
TCustom = class
public
    Name: string;
    ZE: string;
    Mark: string;
end;
//#NG

implementation

function TDiplomVipExcelReport.LastPos(subStr, str: string): integer;
var poss: integer;
begin
    poss := Pos(subStr, str);
    result := poss;
    while (poss > 0) do
    begin
        str := Copy(str, poss + 1, Length(str) - poss + 1);
        poss := Pos(subStr, str);
        result := result + poss;
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
        CreateParameter('@spec', ftInteger, pdInput, 4, 0);
        CreateParameter('@ik_CurGroup', ftInteger, pdInput, 4, FikGroup);
    end;

    dmDiplom.adospGetVipiscaForDiplom.Open;
    dmDiplom.adospSelUspevForVipisca.Close;

    with dmDiplom.adospSelUspevForVipisca.Parameters do
    begin
        Clear;
        CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 4, NULL);
        CreateParameter('@ik_zach', ftInteger, pdInput, 4, FikZach);
        CreateParameter('@ik_CurGroup', ftInteger, pdInput, 4, FikGroup);
    end;

    dmDiplom.adospSelUspevForVipisca.Open;
    dmDiplom.adospSelUspevForVipisca.First;
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

function TDiplomVipExcelReport.GetNextCellVert(cur: String; StrRest: string = ''): String;
var
    num: Integer;
    i: Integer;
    nstr: String;
    bstr: String;
begin
    i := 1;
    while (i <= Length(cur)) do
    begin
        if (cur[i] <= '9') and (cur[i] >= '0') then break;
        Inc(i);
    end;

    nstr := Copy(cur, i, Length(cur)-i+1);
    bstr := Copy(cur, 1, i-1);
    num := StrToInt(nstr);
    num := num+1;

    //переход на следующую страницу
    if (num > 57) or ((num > 56) and (StrRest.Length > 0 ))
    then begin
        CurrentDiskPageNumber := CurrentDiskPageNumber + 1;
        Result := DiscNextPageAddress
    end
    else Result := bstr+IntToStr(num);
end;

function TDiplomVipExcelReport.GetPrevCellVert(cur: String): String;
var
    num: Integer;
    i: Integer;
    nstr: String;
    bstr: String;
begin
    i := 1;
    while i <= Length(cur) do
    begin
        if (cur[i] <= '9') and (cur[i] >= '0') then break;
        Inc(i);
    end;

    nstr := Copy(cur, i, Length(cur)-i+1);
    bstr := Copy(cur, 1, i-1);
    num := StrToInt(nstr);
    num := num-1;
    Result := bstr+IntToStr(num);
end;

function TDiplomVipExcelReport.GetNextCellHor(cur: String): String;
var
    i: Integer;
begin
    i := 2;
    while i <= Length(cur) do
    begin
        if (cur[i] <= 'A') or (cur[i] >= 'Z') then break;
        Inc(i);
    end;

    Dec(i);
    cur[i] := chr(ord(cur[i])+1);
    Result := cur;
end;

procedure TDiplomVipExcelReport.SelectNextCellHor(var cur: String; var ActRange: Variant);
begin
    cur := GetNextCellHor(cur);
    ActRange := Range[cur,cur];
    ActRange.Select;
end;

procedure TDiplomVipExcelReport.SelectNextCellVert(var cur: String; var ActRange: Variant; StrRest: string = '');
begin
    cur := GetNextCellVert(cur, StrRest);
    ActRange := Range[cur,cur];
    ActRange.Select;
end;

procedure TDiplomVipExcelReport.SelectPrevCellVert(var cur: String; var ActRange: Variant);
begin
    cur := GetPrevCellVert(cur);
    ActRange := Range[cur,cur];
    ActRange.Select;
end;

procedure TDiplomVipExcelReport.SendExamRowToExcel(Disc, HourCount, Mark: string; var cur: String; var ActRange: Variant);
begin

end;

procedure TDiplomVipExcelReport.SendStringToExcel(var str, cur: string; ActRange: Variant; StrMaxLength: integer = 0);
var i: integer;
    str1: string;
begin
    if (StrMaxLength = 0) then StrMaxLength := strLength;

    while (Length(str) > StrMaxLength) do
    begin
        for i := StrMaxLength downto 1 do
        begin
            if (str[i] = ' ')
            then begin
                str1 := Copy(str, 1, i);
                Delete(str, 1, i);
                ActRange.Value := str1;
                SelectNextCellVert(cur, ActRange);
                break;
            end;
        end;
    end;
    ActRange.Value := str;
end;

procedure TDiplomVipExcelReport.SendToExcel;
const maxDiscStr = 63;
    MaxKRCount = 6;
    MaxPractCount = 8;
var
    FindRange: Variant;
    ActRange: Variant;
    str, str1: String;   // строка, которую будем вставлять в нужное место в шаблоне
    cur, cur1: String;
    i, weekCount: Integer;
    WithZachEd: boolean;

    //#NG
    FacList: TList;   //Список факультативов
    ElecList: TList;  //Список элективов
    Custom: TCustom;
    varInt: integer;
    varInt2: integer;
    varNegCountZE: integer;           //Сумма з.е, что не должа входить в итог
    varCountAuditHourFacult: integer;
    direction : integer;
    //#NG
begin
    ActivateWorksheet(MainpageNumber);
    CurrentDiskPageNumber := 1;

    //определяем, выводить ли зачетные единицы или часы
    WithZachEd := (ik_direction=3) or (ik_VidGos=2);

    // вывод общих сведений
    if NameInDatPadez
    then begin
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
    else begin
        Replace('#Фамилия#', dmDiplom.adospGetVipiscaForDiplom.FieldByName('iClastname').Value);
        Replace('#Имя#', dmDiplom.adospGetVipiscaForDiplomiFirstName.AsString);
        Replace('#Отчество#', dmDiplom.adospGetVipiscaForDiplomiPatronymic.AsString);
        Replace('#АттГод#', dmDiplom.adospGetVipiscaForDiplomattYear.AsString);
        Replace('#DocumName#', dmDiplom.adospGetVipiscaForDiplomdocumName.AsString);
        Replace('#shifr#', dmDiplom.adospGetVipiscaForDiplomSh_spec.AsString);
        Replace('#Квалиф#', dmDiplom.adospGetVipiscaForDiplom.FieldByName('Cname_qualif').AsString);
    end;

    str:= GetFullDate(dmDiplom.adospGetVipiscaForDiplomDd_birth.AsDateTime) + ' года';
    Replace('#ДатаРожд#', str);   //docum

    i:= dmDiplom.adospGetVipiscaForDiplomOchYearObuch.AsInteger;
    str1:= IntToStr(i);

    if (i > 4) then str1 := str1 + ' лет'
    else str1 := str1 + ' года';

    i := dmDiplom.adospGetVipiscaForDiplomMonthObuch.AsInteger;

    if (i > 0) and (i < 5) then str1 := str1 + ' ' + dmDiplom.adospGetVipiscaForDiplomMonthObuch.AsString + ' месяца';
    if (i > 4) then str1 := str1 + ' ' + dmDiplom.adospGetVipiscaForDiplomMonthObuch.AsString + ' месяцев';

    Replace('#Лет#', str1);

    if (ik_fac = 22)
    then begin
        Replace('#DocumName#', dmDiplom.adospGetVipiscaForDiplomdocumName.AsString);
        Replace('#Специальность#', dmDiplom.adospGetVipiscaForDiplomCname_spec.AsString);
    end;

    Replace('#DateDelivery#', GetFullDate(dmDiplom.adospGetVipiscaForDiplom.FieldByName('DateDiplomDelivery').AsDateTime) + ' года');

    //записываем поля, в которых в начале строки м.б. нули
    FindRange := Find('#РегНом#');
    FindRange.Select;
    ActRange := Selection;
    ActRange.Value2:= dmDiplom.adospGetVipiscaForDiplomRegNumber.AsString;
    FindRange := Find('#НомВып#');
    FindRange.Select;
    ActRange := Selection;
    ActRange.Value2 := dmDiplom.adospGetVipiscaForDiplomVipNumber.AsString;

    // вывод инфы о дипломе (возможен многострочный, макс. длина строки 80
    // символов)
    if (ik_direction <> 5)
    then begin
        if (dmDiplom.adospGetVipiscaForDiplomIsExcellent.AsBoolean) then Replace('#СОтличием#', 'С ОТЛИЧИЕМ')
        else Replace('#СОтличием#', '');

        str := dmDiplom.adospGetVipiscaForDiplomCname_spec.AsString;
        str1 := StringFormat(str, 58);
        Replace('#Специальность#', str);
        Replace('#Специальность2#', str1);
        i := 1;
        if (dmDiplom.adospGetVipiscaForDiplomcName_spclz.AsString <> '')
        then begin
            if (WithZachEd) then str := 'Направленность (профиль) образовательной программы: ' + dmDiplom.adospGetVipiscaForDiplomcName_spclz.AsString
            else str:= 'Специализация: '+dmDiplom.adospGetVipiscaForDiplomcName_spclz.AsString;

            str1 := StringFormat(str, 95);
            Replace('#Доп'+IntToStr(i), str);
            inc(i);

            if (str1 <> '')
            then begin
                Replace('#Доп' + IntToStr(i), str1);
                inc(i);
            end;
        end;

        //строчки из доп сведений редактируем
        //так приходится делать из-за того, что ячейки объединенные
        direction := dmDiplom.adospGetVipiscaForDiplomik_direction.AsInteger;
        if (direction = 9)
            OR ((direction = 2) AND (direction < 5))
            OR (dmDiplom.adospGetVipiscaForDiplomik_spec_fac.AsInteger = 169)
            OR (FikGroup = 6244)
        then begin
            Replace('#Доп' + IntToStr(i), 'Пройдено ускоренное обучение по образовательной программе.');
            inc(i);
        end;

        if (dmDiplom.adospGetVipiscaForDiplomOverVWeekCount.AsInteger > 0)
            and (dmDiplom.adospGetVipiscaForDiplomOverVUZName.AsString <> '')
        then begin
            weekCount:= dmDiplom.adospGetVipiscaForDiplomOverVWeekCount.AsInteger;

            if (weekCount mod 10 = 1) and (weekCount <> 11) then str:= 'Часть образовательной программы в объеме ' + IntToStr(weekCount) + ' недели'
            else str:= 'Часть образовательной программы в объеме '+IntToStr(weekCount)+' недель';

            str := str + ' освоена в ' + dmDiplom.adospGetVipiscaForDiplomOverVUZName.AsString + '.';
            str1 := StringFormat(str, 95);
            Replace('#Доп'+IntToStr(i), str);
            inc(i);
            Replace('#Доп'+IntToStr(i), str1);
            inc(i);
        end;

        while (i < 6) do
        begin
            Replace('#Доп'+IntToStr(i),'');
            inc(i);
        end;

        FindRange := Find('#КР#');
        FindRange.Select;
        ActRange := Selection;
        cur:= ActRange.Address;
        dmDiplom.adospSelKPForVipisca.First;
        ActRange := Range[cur,cur];

        repeat
            if (dmDiplom.adospSelKPForVipisca.Eof) then str := ''
            else begin
                str := dmDiplom.adospSelKPForVipiscadiscName.AsString;
                if (str = '') then str := 'тема не указана';
            end;

            str1 := StringFormat(str, maxDiscStr);   //запоминаем остаток строки
            ActRange.Value := str;

            if (str1 <> '')
            then begin
                SelectNextCellVert(cur, ActRange);
                ActRange.Value := str1;    //записываем остаток строки
            end;

            cur1 := Selection.Address;
            SelectNextCellHor(cur1,ActRange);
            str := dmDiplom.adospSelKPForVipiscacOsenca.AsString;
            ActRange.Value := str;
            dmDiplom.adospSelKPForVipisca.Next;
            SelectNextCellVert(cur, ActRange);
        until dmDiplom.adospSelKPForVipisca.Eof;
    end;


    //********** ВТОРАЯ   СТРАНИЦА *******************
    ActivateWorksheet(MainpageNumber+1);
    // вывод оценок
    dmDiplom.adospSelUspevForVipisca.First;
    FindRange := Find('#Экз#');
    FindRange.Select;
    ActRange := Selection;
    cur := ActRange.Address;
    SelectPrevCellVert(cur, ActRange);

    //#NG
    FacList := TList.Create;
    ElecList := TList.Create;
    varNegCountZE := 0;
    varCountAuditHourFacult := 0;

    //#NG
    repeat
        str:= '';

        if (not dmDiplom.adospSelUspevForVipisca.Eof)
        then begin
            varInt := dmDiplom.adospSelUspevForVipisca.FieldByName('iK_disc').AsInteger;

            if (varInt > 0)
            then begin
                varInt2 := dmDiplom.adospSelUspevForVipisca.FieldByName('IdTypeDiscipline').AsInteger;

                if (varInt2 = 20)
                then begin
                    Custom := TCustom.Create;
                    Custom.Name := dmDiplom.adospSelUspevForVipisca.FieldByName('cName_disc').AsString;
                    Custom.ZE := dmDiplom.adospSelUspevForVipisca.FieldByName('ZECount').AsString;
                    if (Custom.ZE = '0') then Custom.ZE := 'x'
                    else Custom.ZE := Custom.ZE + ' з.е.';
                    Custom.Mark := dmDiplom.adospSelUspevForVipisca.FieldByName('cOsenca').AsString;

                    if (varInt = 5211)
                    then begin
                        ElecList.Add(Custom);
                    end
                    else begin
                        FacList.Add(Custom);
                        varCountAuditHourFacult := varCountAuditHourFacult + dmDiplom.adospSelUspevForVipisca.FieldByName('AuditHourCount').AsInteger;
                    end;
                end
                else begin
                    str := str+dmDiplom.adospSelUspevForVipisca.FieldByName('cName_disc').AsString;
                    str1 := StringFormat(str, maxDiscStr);   //запоминаем остаток строки
                    SelectNextCellVert(cur, ActRange, str1);
                    ActRange.Value := str;

                    if (str1 <> '')
                    then begin
                        SelectNextCellVert(cur, ActRange);
                        ActRange.Value := str1;    //записываем остаток строки
                    end;

                    cur1 := Selection.Address;
                    SelectNextCellHor(cur1,ActRange);

                    if WithZachEd
                    then begin
                        str := dmDiplom.adospSelUspevForVipisca.FieldByName('ZECount').AsString;

                        if (StrToInt(str) = 0) then str := 'x'
                        else str := str + ' з.е.'
                    end
                    else str := dmDiplom.adospSelUspevForVipisca.FieldByName('HourCount').AsString + ' час.';

                    ActRange.Value := str;
                    SelectNextCellHor(cur1,ActRange);
                    str := dmDiplom.adospSelUspevForVipisca.FieldByName('cOsenca').AsString;
                    ActRange.Value := str;
                end;
            end;
        end;
        dmDiplom.adospSelUspevForVipisca.Next;
    until (dmDiplom.adospSelUspevForVipisca.FieldByName('iK_disc').AsInteger <= 0);

    //вывод практик  #Практики#
    dmDiplom.adospSelPractForVipisca.First;

    //переход на след страницу, если его еще не было
    if (CurrentDiskPageNumber = 2)
    then begin
        SelectNextCellVert(cur, ActRange);
        SelectNextCellVert(cur, ActRange);
    end
    else begin
        cur := DiscNextPageAddress;
        ActRange := Range[cur,cur];
        ActRange.Select;
    end;

    repeat
        if (dmDiplom.adospSelPractForVipisca.Eof) then str := ''
        else str := dmDiplom.adospSelPractForVipisca.FieldByName('DiscName').AsString;

        //для ТЛП-14 название практик с срочной буквы
        if (FikGroup = 6180) AND (str <> 'Практики')
        then begin
            str := AnsiLowerCase(str);
        end;
        //для МЛК-14 название практик с заглавной буквы
        if (FikGroup = 6178) AND (str <> 'Практики') then str[1] := AnsiUpperCase(Copy(str, 1, 1))[1];

        SendStringToExcel(str, cur, ActRange);
        cur1 := Selection.Address;
        SelectNextCellHor(cur1, ActRange);

        if WithZachEd
        then begin
            str := dmDiplom.adospSelPractForVipisca.FieldByName('ZECount').AsString + ' з.е.';
        end
        else str := GetWeekCountName(dmDiplom.adospSelPractForVipisca.FieldByName('weekCount').AsString);

        ActRange.Value := str;
        SelectNextCellHor(cur1, ActRange);
        str := dmDiplom.adospSelPractForVipisca.FieldByName('cOsenca').AsString;
        ActRange.Value := str;

        if (dmDiplom.adospSelPractForVipisca.FieldByName('n_sem').AsInteger = 0)
        then begin
            SelectNextCellVert(cur, ActRange);
            str := 'в том числе:';
            SendStringToExcel(str, cur, ActRange);
        end;

        dmDiplom.adospSelPractForVipisca.Next;
        SelectNextCellVert(cur, ActRange);
    until dmDiplom.adospSelPractForVipisca.Eof;

    SelectNextCellVert(cur, ActRange);
    str :=  'Государственная итоговая аттестация';
    SendStringToExcel(str, cur, ActRange);
    dmDiplom.adospSelGOSForVipisca.Last;

    cur1 := Selection.Address;
    SelectNextCellHor(cur1,ActRange);

    if ((dmDiplom.adospSelGOSForVipisca.FieldByName('iHour_gos').AsInteger > 0) and (dmDiplom.adospSelGOSForVipisca.FieldByName('ik_vid_zanyat').AsInteger = 31))
    then begin
        if WithZachEd then str := dmDiplom.adospSelGOSForVipisca.FieldByName('ZECount').AsString+' з.е.'
        else str:= GetWeekCountName(dmDiplom.adospSelGOSForVipisca.FieldByName('iHour_gos').AsString);
    end
    else begin
        str := 'x';
        ikZach := -1;
    end;

    ActRange.Value := str;
    SelectNextCellHor(cur1, ActRange);
    str := 'x';

    ActRange.Value := str;
    SelectNextCellVert(cur, ActRange);
    str := 'в том числе:';
    SendStringToExcel(str, cur, ActRange);
    SelectNextCellVert(cur, ActRange);

    //гос экзамен #ГОС#
    dmDiplom.adospSelGOSForVipisca.First;

    if (not dmDiplom.adospSelGOSForVipisca.Eof) and (dmDiplom.adospSelGOSForVipisca.FieldByName('ik_vid_zanyat').AsInteger = 56)
    then begin
        //if (WithZachEd) then
        str := 'Итоговый государственный экзамен';//'Итоговый государственный междисциплинарный экзамен';
        SendStringToExcel(str, cur, ActRange);
        cur1 := Selection.Address;
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
    str :=  'Выпускная квалификационная работа';
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
        str:= '';

        if (not dmDiplom.adospSelUspevForVipisca.Eof) then str := dmDiplom.adospSelUspevForVipisca.FieldByName('cName_disc').AsString;

        SendStringToExcel(str, cur, ActRange);
        cur1 := Selection.Address;
        SelectNextCellHor(cur1,ActRange);

        if (dmDiplom.adospSelUspevForVipisca.FieldByName('iK_disc').AsInteger < 0) and WithZachEd
        then begin
            dmDiplom.adospSelPractForVipisca.First;
            dmDiplom.adospSelGOSForVipisca.Last;
            varInt := dmDiplom.adospSelUspevForVipisca.FieldByName('ZECount').AsInteger
                        + dmDiplom.adospSelPractForVipisca.FieldByName('ZECount').AsInteger
                        + dmDiplom.adospSelGOSForVipisca.FieldByName('ZECount').AsInteger
                        - varNegCountZE; //вычитаем факультативы
            str := IntToStr(varInt) + ' з.е.';
        end
        else begin
            varInt := dmDiplom.adospSelUspevForVipisca.FieldByName('HourCount').AsInteger - varCountAuditHourFacult;
            str := IntToStr(varInt) + ' час.';
        end;

        ActRange.Value := str;
        SelectNextCellHor(cur1, ActRange);
        str := dmDiplom.adospSelUspevForVipisca.FieldByName('cOsenca').AsString;
        ActRange.Value := str;

        dmDiplom.adospSelUspevForVipisca.Next;
        inc(i);
        SelectNextCellVert(cur, ActRange);
    until dmDiplom.adospSelUspevForVipisca.Eof;

    if(FacList.Count > 0)
    then begin
         SelectNextCellVert(cur, ActRange);
         str := 'Факультативные дисциплины';
         SendStringToExcel(str, cur, ActRange);

         SelectNextCellVert(cur, ActRange);
         str := 'в том числе:';
         SendStringToExcel(str, cur, ActRange);

         while (FacList.Count > 0) do
         begin
             //название
             Custom := FacList.First;
             str:= Custom.Name;
             str1:=StringFormat(str, maxDiscStr);     //запоминаем остаток строки
             SelectNextCellVert(cur, ActRange, str1);
             ActRange.Value := str;

             if (str1 <> '')
             then begin
                 SelectNextCellVert(cur, ActRange);
                 ActRange.Value := str1;              //записываем остаток строки
             end;

             //зач. ед.
             cur1 := Selection.Address;
             SelectNextCellHor(cur1,ActRange);
             str := Custom.ZE;
             ActRange.Value := str;

             //оценка
             SelectNextCellHor(cur1,ActRange);
             str := Custom.Mark;
             ActRange.Value := str;

             //SelectNextCellVert(cur, ActRange);
             FacList.Remove(FacList.First);
         end;
    end;

    SelectNextCellVert(cur, ActRange);

    while (ElecList.Count > 0) do
    begin
        //название
        Custom := ElecList.First;
        str := Custom.Name;
        str1 := StringFormat(str, maxDiscStr);   //запоминаем остаток строки
        SelectNextCellVert(cur, ActRange, str1);
        ActRange.Value := str;

        if (str1 <> '')
        then begin
            SelectNextCellVert(cur, ActRange);
            ActRange.Value := str1;    //записываем остаток строки
        end;

        //зач. ед.
        cur1 := Selection.Address;
        SelectNextCellHor(cur1, ActRange);
        str := Custom.ZE;
        ActRange.Value := str;

        //оценка
        SelectNextCellHor(cur1, ActRange);
        str := Custom.Mark;
        ActRange.Value := str;

        //SelectNextCellVert(cur, ActRange);
        ElecList.Remove(ElecList.First);
    end;
    ActivateWorksheet(MainpageNumber);
end;

//возвращает остаток строки после strMaxLen (слова разбивает по пробелам)
function TDiplomVipExcelReport.StringFormat(var str: string; strMaxLen: integer): string;
var
    CopyPos:integer;
begin
    result:= '';

    if (Length(str) > strMaxLen)
    then begin
        if (str[strMaxLen+1] = ' ') then CopyPos := strMaxLen+1
        else CopyPos:= LastPos(' ', Copy(str, 1, strMaxLen));

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
    Show;
end;

end.


