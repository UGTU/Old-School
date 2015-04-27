unit uDiplOtdKardController;
  {#Author tanyav@ist.ugtu.net}
interface
uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, ADODB, DB, uDM,
  Forms, Dialogs, DBLookupEh, Variants, StdCtrls, GeneralController, Grids,
  ExcelXP, ComObj, DBGrids, DBGridEh,WordXP, DateUtils, uDMOtdKadrDiplom, ApplicationController
  , ExceptionBase, ConstantRepository;
type
  PDBGrid = ^TDBGridEh;
  TDiplOtdKardController = class (TObject)
  private
    function OpenOKADRGetGakMemberForExcel(year: Integer; ik_spec_fac, ik_fac: Integer):TADOStoredProc;
    procedure FillTheDiplom(E:OleVariant; count:integer; tempStoredProc:TADOStoredProc; SourceDataSet: PDataSet);
  protected
    constructor CreateInstance;
 //AccessInstance предоставляет доступ к экземпляру контроллера
    class function AccessInstance(Request: Integer):
       TDiplOtdKardController;

  public

    constructor Create;
  //Instance - возвращает экзепляр данного контроллера
    class function Instance: TDiplOtdKardController;
  //ReleaseInstance - уничтожает контроллер
    class procedure ReleaseInstance;

  //*********САМ КОНТРОЛЛЕР*********
  //********ДИПЛОМ**********
  //GetFacList загружает список факультетов
  function GetFacList(cmp: PDBLookupComboboxEh): boolean;
  //GetSpecList загружает список cпециальностей
  function GetSpecList(cmp: PDBLookupComboboxEh): boolean;
  //GetGroupList загружает список групп
  function GetGroupList(cmp: PDBLookupComboboxEh): boolean;

  //Фильтры
  //FilterSpecList фильтрует список специальностей
  function FilterSpecList(cmp: PDBLookupComboboxEh; ik_fac:Variant): boolean;
  //FilterGroupList фильтрует список групп по специальности
  function FilterGroupList(cmp: PDBLookupComboboxEh; ik_Gener_spec_fac:Variant): boolean;
  //фильтрует список специальностей ГАКа
  function FilterGAKList(SourceDataSet: PDataSet; ik_fac:Variant; DisplayType: integer): boolean;

  //GetDiplomList загружает список студентов группы
  function GetDiplomList(SourceDataSet: PDataSet; ik_grup:Variant): boolean;

  //SaveDiploms сохраняет дипломы
  procedure SaveDiploms(SourceDataSet: PDataSet);
  //CancelDiplomUpdates отменяет изменения дипломов
  procedure CancelDiplomUpdates(SourceDataSet: PDataSet);

  //SetSizes Установка размеров
  procedure SetSizes(sh1, sh2:Variant);
  //PrintAllDiploms печатает дипломы
  function PrintAllDiploms(SourceDataSet: PDataSet; ik_spec_fac, ik_fac,year:integer; OldBlank: boolean):integer;
  //делит строку str1 на 2, если это необходимо (макс. длина строки MaxStrLength)
  procedure ParseString(var str1,str2: string; MaxStrLength: integer);


  //*************ПРЕДСЕДАТЕЛЬ ГАК****************
  //GetYearList загружает список годов
  function GetYearList(cmp: PDBLookupComboboxEh): boolean;
  //GetSpecGakList загружает список специальностей (для поля просмотра)
  function GetSpecGakList: boolean;
  //GetGakMemberList загружает список председателей
  function GetGakMemberList(SourceDataSet: PDataSet; ik_year:Variant; DisplayType: integer): boolean;
  //SaveGAK сохраняет ГАК
  procedure SaveGAK(SourceDataSet: PDataSet);
  //CancelUpdatesGAK отменяет сохранение ГАК
  procedure CancelUpdatesGAK(SourceDataSet: PDataSet);


  //************КВАЛИФИКАЦИИ***************
  //GetQualifications загрузка квалификаций
  procedure GetQualifications(SourceDataSet: PDataSet);
  //SaveQualif сохраняет квалификаций
  procedure SaveQualif(SourceDataSet: PDataSet);
  //CancelUpdatesQualif отменяет сохранение квалификаций
  procedure CancelUpdatesQualif(SourceDataSet: PDataSet);

end;


implementation

var
//FAbitRaspisanieControllerInstance - экземпляр контроллера
  FTDiplOtdKardControllerInstance: TDiplOtdKardController = nil;
constructor TDiplOtdKardController.CreateInstance;
begin
  inherited Create;
end;


constructor TDiplOtdKardController.Create;
begin
  inherited Create;
  raise Exception.CreateFmt('Доступ к классу %s можно получить только через поле Instance!', [ClassName]);
end;


class function TDiplOtdKardController.AccessInstance(
  Request: Integer): TDiplOtdKardController;
begin
  case Request of
    0 : ;
    1 : if not Assigned(FTDiplOtdKardControllerInstance) then
      FTDiplOtdKardControllerInstance:= CreateInstance;
    2 : if FTDiplOtdKardControllerInstance <> nil then
          begin
            FTDiplOtdKardControllerInstance.Free;
            FTDiplOtdKardControllerInstance:= nil;
          end;
    else raise EApplicationException.Create('Ошибка в программе!',Exception.CreateFmt('Неизвестное значение параметра %d в методе AccessInstance контроллера TAbitOtchetsController', [Request]));
  end;  Result := FTDiplOtdKardControllerInstance;
end;


class function TDiplOtdKardController.Instance: TDiplOtdKardController;
begin
  Result := AccessInstance(1);
end;

class procedure TDiplOtdKardController.ReleaseInstance;
begin
   AccessInstance(2);
end;

//*********САМ КОНТРОЛЛЕР*********
//********ДИПЛОМ**********
//загружает список факультетов
function TDiplOtdKardController.GetFacList(cmp: PDBLookupComboboxEh): boolean;
begin
  Result:= false;
  TGeneralController.Instance.InitializeLockupCB(cmp, 'ik_fac', 'Cname_fac');
  TGeneralController.Instance.getDataSetValues(@cmp.ListSource.DataSet, 'EXEC [dbo].[OKADRGetFacs]', 'ik_fac', false, NULL);
  Result:= true;
end;

//загружает список cпециальностей
function TDiplOtdKardController.GetSpecList(cmp: PDBLookupComboboxEh): boolean;
begin
  Result:= false;
  TGeneralController.Instance.InitializeLockupCB(cmp, 'ik_Gener_spec_fac', 'Cname_spec');
  TGeneralController.Instance.getDataSetValues(@cmp.ListSource.DataSet, 'EXEC [dbo].[OKADRGetSpecialities] ', 'ik_Gener_spec_fac', false, NULL);
  Result:= true;
end;

//загружает список групп
function TDiplOtdKardController.GetGroupList(cmp: PDBLookupComboboxEh): boolean;
begin
  Result:= false;
  TGeneralController.Instance.InitializeLockupCB(cmp, 'Ik_grup', 'Cname_grup');
  TGeneralController.Instance.getDataSetValues(@cmp.ListSource.DataSet, 'select * from [dbo].[OKADRGetExitGroup_inline]('+IntToStr(YearOf(Today))+')', 'Ik_grup', false, NULL);
  Result:= true;
end;


//Фильтры
//фильтрует список специальностей
function TDiplOtdKardController.FilterSpecList(cmp: PDBLookupComboboxEh; ik_fac:Variant): boolean;
begin
  Result:= false;
  if ik_fac<1 then
  begin
    cmp.Value:= null;
    cmp.Enabled:= false;
  end;
  with cmp.ListSource.DataSet do
  begin
    Filtered:= false;
    Filter:= 'ik_fac='+IntToStr(Ik_fac);
    Filtered:= true;
  end;
  Result:= true;
end;

//фильтрует список специальностей ГАКа
function TDiplOtdKardController.FilterGAKList(SourceDataSet: PDataSet; ik_fac:Variant; DisplayType: integer): boolean;
begin
  Result:= false;
  SourceDataSet.Filtered:= false;
  if ik_fac>1 then
  begin
    if (DisplayType<0) then
        SourceDataSet.Filter:= '(ik_fac='+IntToStr(Ik_fac)+')'
    else
        SourceDataSet.Filter:= '(ik_fac='+IntToStr(Ik_fac)+') and (id_type_branch='+IntToStr(DisplayType+1)+')';
    SourceDataSet.Filtered:= true;
  end;
  Result:= true;
end;

//вывод диплома
procedure TDiplOtdKardController.FillTheDiplom(E:OleVariant; count:integer; tempStoredProc:TADOStoredProc; SourceDataSet: PDataSet);
const strLength = 40;
var
  str, str2:string;
  iday:integer;
  imonth:integer;
  iyear:integer;
  smonth:string;
  FindRange:OleVariant;
  fam: string;
  RangeRightBorder: string;
  RangeBottomBorder: integer;

begin
  TApplicationController.GetInstance.AddLogEntry('Диплом. Экспорт диплома студента '+SourceDataSet.FieldByName('Clastname').AsString);
  case tempStoredProc.FieldByName('Ik_fac').AsInteger  of
  23:
  begin
    RangeRightBorder:= 'JB';
    RangeBottomBorder:= 156;
  end;
  22:
  begin
    RangeRightBorder:= 'T';
    RangeBottomBorder:= 27;
  end;
  else
  begin
    RangeRightBorder:= 'CE';
    RangeBottomBorder:= 50;
  end;
  end;
  E.sheets.Add(after:=E.sheets.item[count-1]);

  E.Sheets[1].Range['A1:'+RangeRightBorder+inttoStr(RangeBottomBorder)].EntireColumn.Copy(EmptyParam); // поместим в БО
  E.Sheets[count].Paste(E.Sheets.item[count].Range['A1:'+RangeRightBorder+inttoStr(RangeBottomBorder), EmptyParam], EmptyParam);
  E.Sheets[1].Range['A1:'+RangeRightBorder+inttoStr(RangeBottomBorder)].EntireRow.Copy(EmptyParam); // поместим в БО
  E.Sheets[count].Paste(E.Sheets.item[count].Range['A1:'+RangeRightBorder+inttoStr(RangeBottomBorder), EmptyParam], EmptyParam);

  E.Sheets[count].PageSetup.LeftMargin:=E.Sheets[1].PageSetup.LeftMargin;
  E.Sheets[count].PageSetup.RightMargin:=E.Sheets[1].PageSetup.RightMargin;
  E.Sheets[count].PageSetup.TopMargin:=E.Sheets[1].PageSetup.TopMargin;
  E.Sheets[count].PageSetup.BottomMargin:=E.Sheets[1].PageSetup.BottomMargin;
  E.Sheets[count].PageSetup.Orientation:=E.Sheets[1].PageSetup.Orientation;

  E.Sheets.item[1].Range['A1:'+RangeRightBorder+inttoStr(RangeBottomBorder)].Copy;
     //E.Sheets.item[count].Range['A1:CE'+inttoStr(50)].Insert;
  if (tempStoredProc.FieldByName('Ik_fac').AsInteger = 23) then
  begin
    E.Sheets[count].Range['A1:'+RangeRightBorder+inttoStr(RangeBottomBorder)].ColumnWidth:=
      E.Sheets[1].Range['A1:A2'].ColumnWidth;
    E.Sheets[count].Range['A1:'+RangeRightBorder+inttoStr(RangeBottomBorder)].RowHeight:=
      E.Sheets[1].Range['A1:B1'].RowHeight;
  end;


  {if (tempStoredProc.FieldByName('Ik_fac').AsInteger = 18) then
  begin
    FindRange := E.Cells.Replace(What := '#surname#',Replacement:=(SourceDataSet.FieldByName('iClastname').AsString));
    FindRange := E.Cells.Replace(What := '#name#',Replacement:=(SourceDataSet.FieldByName('iFirstName').AsString));
    FindRange := E.Cells.Replace(What := '#Patronymic#',Replacement:=(SourceDataSet.FieldByName('iPatronymic').AsString));
    FindRange := E.Cells.Replace(What := '#specname#',Replacement:=tempStoredProc.FieldByName('Cname_spec').AsString);
    FindRange := E.Cells.Replace(What := '#shifr#',Replacement:=tempStoredProc.FieldByName('Sh_spec').AsString);

    //при замене теряются начальные нули, при вставке напрямую в ячейку все в порядке
    str:=SourceDataSet.FieldByName('RegNumber').AsString   ;
    E.Sheets[count].Range['t34'].Value:=str;
    //FindRange := E.Cells.Replace(What := '#regNum#',Replacement:=str);

    str:=SourceDataSet.FieldByName('Dd_dipl').AsString;
    iday:=DayOf(StrToDate(str));
    imonth:=MonthOf(StrToDate(str));
    iyear:=YearOf(StrToDate(str));

    smonth := TGeneralController.Instance.GetMonthName(imonth);

    str:=Inttostr(iDay)+ ' ' +smonth+ ' ' + inttostr(iyear);

    FindRange := E.Cells.Replace(What := '#date#',Replacement:=str);
  end
  else}
  //begin
  if ((tempStoredProc.FieldByName('Ik_fac').AsInteger = 23) or
      (tempStoredProc.FieldByName('Ik_fac').AsInteger = 22) or
      (tempStoredProc.FieldByName('Ik_fac').AsInteger = 21)) then
  begin
    FindRange := E.Cells.Replace(What := '#surname#',Replacement:=(SourceDataSet.FieldByName('Clastname').AsString));
    FindRange := E.Cells.Replace(What := '#name#',Replacement:=(SourceDataSet.FieldByName('FirstName').AsString));
    FindRange := E.Cells.Replace(What := '#Patronymic#',Replacement:=(SourceDataSet.FieldByName('Patronymic').AsString));
    str:=SourceDataSet.FieldByName('RegNumber').AsString;
    if (tempStoredProc.FieldByName('Ik_fac').AsInteger = 22) or
      (tempStoredProc.FieldByName('Ik_fac').AsInteger = 21) then
    begin
      FindRange := E.Cells.Replace(What := '#specname#',Replacement:=tempStoredProc.FieldByName('Cname_spec').AsString);
      E.Sheets[count].Range['h18'].Value:=str;
    end
    else
      E.Sheets[count].Range['AZ135'].Value:=str;
    //FindRange := E.Cells.Replace(What := '#regNum#',Replacement:=str);


    str:=SourceDataSet.FieldByName('Dd_dipl').AsString;
    iday:=DayOf(StrToDate(str));
    imonth:=MonthOf(StrToDate(str));
    iyear:=YearOf(StrToDate(str));

    smonth := GetMonthR(imonth);

    str:=Inttostr(iDay)+ ' ' +smonth+ ' ' + inttostr(iyear);

    FindRange := E.Cells.Replace(What := '#date#',Replacement:=str);

  end
  else
  begin
    FindRange := E.Cells.Replace(What := '#specname#',Replacement:=tempStoredProc.FieldByName('Cname_spec').AsString);
    FindRange := E.Cells.Replace(What := '#surname#',Replacement:=Ansiuppercase(SourceDataSet.FieldByName('iClastname').AsString));
    FindRange := E.Cells.Replace(What := '#name#',Replacement:=Ansiuppercase(SourceDataSet.FieldByName('iFirstName').AsString));
    FindRange := E.Cells.Replace(What := '#Patronymic#',Replacement:=Ansiuppercase(SourceDataSet.FieldByName('iPatronymic').AsString));
    //при замене теряются начальные нули, при вставке напрямую в ячейку все в порядке
    str:=SourceDataSet.FieldByName('RegNumber').AsString   ;
    //FindRange := E.Cells.Replace(What := '#regNum#',Replacement:=str);
    E.Sheets[count].Range['t40'].Value:=str;
    FindRange := E.Cells.Replace(What := '#shifr#',Replacement:=tempStoredProc.FieldByName('Sh_spec').AsString);
    E.Sheets[count].Range['AZ35'].Value:=SourceDataSet.FieldByName('VipNumber').AsString;
    //E.Sheets[count].Range['t48'].Value:=str;

    str:=SourceDataSet.FieldByName('Dd_dipl').AsString;
    imonth:=MonthOf(StrToDate(str));
    smonth := GetMonthR(imonth);
    FindRange := E.Cells.Replace(What := '#месяц#',Replacement:=smonth);

    iyear:=YearOf(StrToDate(str));
    FindRange := E.Cells.Replace(What := '#год#',Replacement:=IntToStr(iyear));//Copy(IntToStr(iyear),3,2));

    iday:=DayOf(StrToDate(str));
    str:=Inttostr(iDay);
    if (iday < 10) then
      str:= '0'+str;
    E.Sheets[count].Range['BG35'].Value:=str;


  end;
  //end;

  //проверка для однофамильцев
  fam:=E.Sheets[count-1].name;
  if fam=SourceDataSet.FieldByName('Clastname').AsString then
    E.Sheets[count].name:=SourceDataSet.FieldByName('Clastname').AsString+'_'
  else
    E.Sheets[count].name:=SourceDataSet.FieldByName('Clastname').AsString;
  E.Sheets[count].Select;

  //заносим данные
  str:= GetFullDate(tempStoredProc.FieldByName('DateDiplomDelivery').AsDateTime) +' года';
  FindRange := E.Cells.Replace(What := '#DateDelivery#',Replacement:=str);
  FindRange := E.Cells.Replace(What := '#fiogak#',Replacement:=tempStoredProc.FieldByName('GakMemberName').AsString);
  FindRange := E.Cells.Replace(What := '#Category#',Replacement:=tempStoredProc.FieldByName('SpecСategory').AsString);
  FindRange := E.Cells.Replace(What := '#qualifShort#',Replacement:=tempStoredProc.FieldByName('QualifShortName').AsString);
  str:= tempStoredProc.FieldByName('Cname_qualif').AsString;
  ParseString(str, str2, strLength);
  FindRange := E.Cells.Replace(What := '#qualif#',Replacement:=str);
  FindRange := E.Cells.Replace(What := '#qualifPart2#',Replacement:=str2);
  FindRange := E.Cells.Replace(What := '#spec#',Replacement:='');
  {if tempStoredProc.FieldByName('ik_direction').AsInteger=2 then
  begin
     FindRange := E.Cells.Replace(What := '#spec#',Replacement:='по специальности');
     if (str2<> '') then
       E.Sheets[1].Range['AW37:AW37'].Font.Size:=10.5;
  end
  else
     FindRange := E.Cells.Replace(What := '#spec#',Replacement:='по направлению');    }
end;

function TDiplOtdKardController.FilterGroupList(cmp: PDBLookupComboboxEh; ik_Gener_spec_fac:Variant): boolean;
begin
  Result:= false;
  if ik_Gener_spec_fac<1 then
  begin
    cmp.Value:= null;
    cmp.Enabled:= false;
  end;
  with cmp.ListSource.DataSet do
  begin
    Filtered:= false;
    Filter:= '(ik_Gener_spec_fac='+IntToStr(ik_Gener_spec_fac)+')';
    Filtered:= true;
  end;
  Result:= true;
end;


//загружает список студентов группы
function TDiplOtdKardController.GetDiplomList(SourceDataSet: PDataSet; ik_grup:Variant): boolean;
begin
  Result:= false;
  TApplicationController.GetInstance.AddLogEntry('Диплом. Загрузка списка дипломов');
  TGeneralController.Instance.getDataSetValues(SourceDataSet, 'exec OKADRGetStudForDiplom @ik_grup='+IntToStr(ik_grup), 'Ik_zach', false, NULL);
  Result:= true;
end;


//сохраняет дипломы
procedure TDiplOtdKardController.SaveDiploms(SourceDataSet: PDataSet);
begin
  TApplicationController.GetInstance.AddLogEntry('Диплом. Cохранение данных дипломов');
  try
    SourceDataSet^.UpdateBatch();
  except
    on E:Exception do
      raise EApplicationException.Create('Произошла ошибка при сохранении! Проверьте правильность введенных данных - регистрационный номер диплома должен состоять не менее чем из 3 цифр.',E);
  end;
  SourceDataSet^.Close;
  SourceDataSet^.Open;

end;

//отменяет изменения дипломов
procedure TDiplOtdKardController.CancelDiplomUpdates(SourceDataSet: PDataSet);
begin
  TApplicationController.GetInstance.AddLogEntry('Диплом. Отмена действий над списком дипломов');
  SourceDataSet^.CancelBatch;
end;

//Установка размеров
procedure TDiplOtdKardController.SetSizes(sh1, sh2:Variant);
var i:integer;
begin
  for i:=1 to 50 do
    sh2.Range['A'+IntToStr(i)+':B'+IntToStr(i)].RowHeight:=
      sh1.Range['A'+IntToStr(i)+':B'+IntToStr(i)].RowHeight;
    //ShowMessage(IntToStr(sh1.Range['A1:A2'].ColumnWidth));
   sh2.Range['A1:A9'].ColumnWidth:=8;
  for I :=65 to 85 do
    sh2.Range[chr(i)+'1:'+chr(i)+'2'].ColumnWidth:=
      sh1.Range[chr(i)+'1:'+chr(i)+'2'].ColumnWidth;

end;

procedure TDiplOtdKardController.ParseString(var str1, str2: string; MaxStrLength: integer);
var i: integer;
begin
  while Length(str1)>MaxStrLength do
  begin
    for i:= MaxStrLength downto 1 do
      if str1[i]=' ' then
      begin
        str2 := Copy(str1, i+1, Length(str1));
        Delete(str1, i+1, Length(str1));
        break;
      end;
  end;
end;

function TDiplOtdKardController.PrintAllDiploms(SourceDataSet: PDataSet; ik_spec_fac, ik_fac, year:integer; OldBlank: boolean):integer;
var
  E, sheet: Variant;
  first, count :integer;
  tempStoredProc:TADOStoredProc;
  path:string;
  HasAllData: boolean;  //флаг показывает, есть ли хоть один заполненный диплом
begin
  Result:=0;
  TApplicationController.GetInstance.AddLogEntry('Диплом. Экспорт дипломов ');
  tempStoredProc:=OpenOKADRGetGakMemberForExcel(year, ik_spec_fac, ik_fac);
  try
    E:= CreateOleObject('Excel.Application');
    try
      if (tempStoredProc.FieldByName('DiplExcPatternName').AsString <> '') then
        path := ExtractFilePath(Application.ExeName)+'reports\'+tempStoredProc.FieldByName('DiplExcPatternName').AsString
      else
        if (OldBlank) then
          path := ExtractFilePath(Application.ExeName)+'reports\DiplomOld.XLT'
        else
	        path := ExtractFilePath(Application.ExeName)+'reports\Diplom.XLT';
	    E.WorkBooks.Add(path);
      E.DisplayAlerts:=false;
      E.Sheets[1].Select;

      HasAllData:= false;
      SourceDataSet^.DisableControls;
      try
        SourceDataSet.First;
        first:= 2;
        count:= first;
        while not SourceDataSet.Eof do
        begin
          if (SourceDataSet.FieldByName('RegNumber').AsString='') or
             (SourceDataSet.FieldByName('Dd_dipl').Value=null) then
          begin
            SourceDataSet.Next;
            continue;
          end;

          try
            HasAllData:= true;
            FillTheDiplom(E, count, tempStoredProc, SourceDataSet);
          except
            on Ex:Exception do begin
            E.Quit;
            raise EApplicationException.Create('Ошибка при экспорте в Excel',Ex);
            end;
          end;

          SourceDataSet.Next;
          inc(count);
        end;

        if count>first then
        begin
          E.Sheets.item[1].Delete;
          E.Visible := true;
          result:= 1;
        end
        else
        begin

          E.Quit;
          raise EApplicationException.Create('Нет студентов для выдачи диплома. Проверьте, чтобы были введены регистрационные номера и даты защиты дипломов.');
        end;
      finally
        SourceDataSet^.EnableControls;
        E:= UnAssigned;
      end;
    except
      result:= -1;
    end;
    finally
      tempStoredProc.Free;
    end;
    if (not HasAllData) then
      Application.MessageBox('Нет студентов для выдачи диплома. Проверьте, чтобы были введены регистрационные номера и даты защиты дипломов!', 'Подсистема "Диплом"', MB_ICONWARNING);
end;


//*************ПРЕДСЕДАТЕЛЬ ГАК****************
//загружает список годов
function TDiplOtdKardController.GetYearList(cmp: PDBLookupComboboxEh): boolean;
begin
  Result:= false;
  TApplicationController.GetInstance.AddLogEntry('Диплом. Загрузка годов сдачи дипломов.');
  TGeneralController.Instance.InitializeLockupCB(cmp, 'ik_year', 'year_value');
  TGeneralController.Instance.getDataSetValues(@cmp.ListSource.DataSet, 'exec OKADRGetYears', 'ik_year', false, NULL);
  cmp.ListSource.DataSet.Locate('year_value',YearOf(date),[]);
  cmp.Value:=
          cmp.ListSource.DataSet.FieldByName('ik_year').AsInteger;
  Result:= true;
end;

//загружает список специальностей (для поля просмотра)
function TDiplOtdKardController.GetSpecGakList: boolean;
begin
  TApplicationController.GetInstance.AddLogEntry('Диплом. Загрузка списка специальностей для председателей ГАК');
  Result:= false;
  DMOtdKadrDiplom.adoqSpec.Close;
  DMOtdKadrDiplom.adoqSpec.SQL[0]:='SELECT * from [dbo].[OKADRGetEducBranch]('+IntToStr(YearOf(today))+')';
  DMOtdKadrDiplom.adoqSpec.Open;
  Result:= true;
end;


//загружает список председателей
function TDiplOtdKardController.GetGakMemberList(SourceDataSet: PDataSet; ik_year:Variant; DisplayType: integer): boolean;
begin
  Result:= false;
  TApplicationController.GetInstance.AddLogEntry('Список председателей ГАК. Загрузка списка председателей.');
  with  DMOtdKadrDiplom.adospGakMember do
  begin
    Close;
    ProcedureName:= 'OKADRGetGakMembers;1';
    Parameters.Clear;
    //Parameters.CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 4, NULL);
    Parameters.CreateParameter('@ik_year', ftInteger, pdInput, 4, ik_year);
    Parameters.CreateParameter('@id_type_branch', ftInteger, pdInput, 4, DisplayType+1);
    Open;
  end;
  Result:= true;
end;

//сохраняет ГАК
procedure TDiplOtdKardController.SaveGAK(SourceDataSet: PDataSet);
begin
  TApplicationController.GetInstance.AddLogEntry('Диплом. Cохранение списка председателей ГАК');
  SourceDataSet.UpdateBatch();
  SourceDataSet.Close;
  SourceDataSet.Open;
end;

//отменяет сохранение ГАК
procedure TDiplOtdKardController.CancelUpdatesGAK(SourceDataSet: PDataSet);
begin
  TApplicationController.GetInstance.AddLogEntry('Диплом. Отмена изменений в списке председателей ГАК');
  SourceDataSet.CancelBatch;
  SourceDataSet.Close;
  SourceDataSet.Open;
end;

function TDiplOtdKardController.OpenOKADRGetGakMemberForExcel(year: Integer; ik_spec_fac, ik_fac: Integer):TADOStoredProc;
begin
  Result := TADOStoredProc.Create(nil);
  Result.Connection := dm.DBConnect;
  Result.ProcedureName := 'OKADRGetGakMemberForExcel;1';
  Result.Parameters.CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 4, NULL);
  Result.Parameters.CreateParameter('@ik_spec_fac', ftInteger, pdInput, 4, ik_spec_fac);
  Result.Parameters.CreateParameter('@year', ftInteger, pdInput, 4, year);
  Result.Parameters.CreateParameter('@ik_fac', ftInteger, pdInput, 4, ik_fac);
  Result.Open;
end;


//************КВАЛИФИКАЦИИ***************
//загрузка квалификаций
procedure TDiplOtdKardController.GetQualifications(SourceDataSet: PDataSet);
begin
  TApplicationController.GetInstance.AddLogEntry('Диплом. Загрузка списка квалификаций');
  SourceDataSet.Close;
  SourceDataSet.Open;
end;

//сохраняет квалификаций
procedure TDiplOtdKardController.SaveQualif(SourceDataSet: PDataSet);
begin
  TApplicationController.GetInstance.AddLogEntry('Диплом. Cохранение списка квалификаций');
  SourceDataSet.UpdateBatch();
  SourceDataSet.Close;
  SourceDataSet.Open;

end;

//отменяет сохранение квалификаций
procedure TDiplOtdKardController.CancelUpdatesQualif(SourceDataSet: PDataSet);
begin
  TApplicationController.GetInstance.AddLogEntry('Диплом. Отмена изменений в списке квалификаций');
  SourceDataSet.CancelBatch;
  SourceDataSet.Close;
  SourceDataSet.Open;
end;

end.
