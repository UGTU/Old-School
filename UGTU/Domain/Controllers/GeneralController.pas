{-----------------------------------------------------------
  Модуль GeneralController  - содержит:
    TGeneralController - главный контроллер для ИС УГТУ
  Дата создания: 5.03.2007
  Дата последнего изменения: 16.03.2008
  Разработчик: Павловский Михаил
-----------------------------------------------------------}
unit GeneralController;
  {#Author villain@ist.ugtu.net}
interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, ADODB, DB, uDM,
  Forms, Dialogs, DBLookupEh, Variants, StdCtrls, ApplicationController, DateUtils, ExceptionBase;

type
  PDataSet = ^TCustomADODataSet;
  PList = ^TList;
  PLabel = ^TLabel;
  PDBLookupComboboxEh = ^TDBLookupComboboxEh;

  TGeneralController = class (TObject)
  protected
    constructor CreateInstance;
    class function AccessInstance(Request: Integer): TGeneralController;
    constructor Create;
  public

    {
        Instance - возвращает экзепляр данного контроллера
    }
    class function Instance: TGeneralController;
    {
        ReleaseInstance - уничтожает контроллер
    }
    class procedure ReleaseInstance;
    {
        getDataSetValues - выборка в SourceDataSet всех значений, удовлетворяющих запросу AQuary
        если isShowFirst, то возвращает значение атрибута keyField первой записи, иначе NULL 
    }
    function getDataSetValues(SourceDataSet: PDataSet; AQuary:WideString; keyField: string; isShowFirst: boolean; defaultValue: Variant): Variant;
    {
        CloseLockupCB - выполняет закрытие и сброс компонента DBLookupComboBoxEh
    }
    function CloseLockupCB(cmp: PDBLookupComboboxEh): Variant;
    {
        RefreshLockupCB - выполняет обновление DataSet в компоненте DBLookupComboBoxEh
    }
    procedure RefreshLockupCB(cmp: PDBLookupComboboxEh);
    {
        InitializeLockupCB - выполняет создание DataSet в компоненте DBLookupComboBoxEh,
        а затем инициализацию самого компонента
    }
    procedure InitializeLockupCB(cmp: PDBLookupComboboxEh; keyField, listField: string);
    {
        SetCaptionDots - выводит в lpSource.Caption текст strCapt согласно правилу многоточия
        (т.е. если длина текста превышает maxWidth, то в конец текста добавляются '...'
    }
    procedure ReleaseLockupCB(cmp: PDBLookupComboboxEh);
    procedure SetCaptionDots(lpSource: PLabel; strCapt: string; maxWidth:integer);
    function GetNewADODataSet(isBatchOptimistic: boolean): TADODataSet;
    function GetNewADOStoredProc(procName: string; isBatchOptimistic: boolean): TADOStoredProc;
    function GetMainConnection(): TADOConnection;
    function getStringListFromStr(sourceStr: string):TStringList;
    function ParseExcelSumExpression(sourceRange: AnsiString): AnsiString;
    function GetExcelColumnLetter(colNumber: integer): string;
    function GetMonthName(imonth:integer):string;
    function GetFullDate(ddate:TDateTime):string;

    function GetAltKeyState: boolean;

    //Вывод приказов в Word
//FindAndInsert заменяет в документе FindText на ReplacementText
    function FindAndInsert(W:Variant; FindText, ReplacementText:string):boolean;
  end;

  const
    DayNames: array[1..6] of string = ('Понедельник','Вторник','Среда','Четверг','Пятница','Суббота');
    Excel_GUID: TGUID = '{000208D5-0000-0000-C000-000000000046}';
    ADO_ERROR: integer = -2147467259;
    ADO_ERROR_TWO: integer = -2147217864;
    MAX_EXCEL_SUM_ARGUMENTS = 16;
    
implementation

var
  FGeneralControllerInstance: TGeneralController = nil;

{
****************************** TGeneralController ******************************
}

constructor TGeneralController.Create;
begin
  inherited Create;
  raise Exception.CreateFmt('Доступ к классу %s можно получить только через поле Instance!', [ClassName]);
end;

constructor TGeneralController.CreateInstance;
begin
  inherited Create;
end;

function TGeneralController.GetAltKeyState: boolean;
var
  State: TKeyboardState;
begin
  GetKeyboardState(State);
  Result:= ((State[vk_Menu] and 128) <> 0);
end;

class function TGeneralController.AccessInstance(Request: Integer):
        TGeneralController;
begin
  case Request of
    0 : ;
    1 : if not Assigned(FGeneralControllerInstance) then FGeneralControllerInstance := CreateInstance;
    2 :
      begin
        if FGeneralControllerInstance <> nil then
          FreeAndNil(FGeneralControllerInstance);
      end
   else raise EApplicationException.Create('Ошибка в программе!',Exception.CreateFmt('Неизвестное значение параметра %d в методе AccessInstance контроллера GeneralController', [Request]));
  end;
  Result := FGeneralControllerInstance;
end;

function TGeneralController.FindAndInsert(W:Variant; FindText, ReplacementText:string):boolean;
begin
  W.Selection.Find.Text:=FindText;
  W.Selection.Find.Replacement.Text:=ReplacementText;
  result:=W.Selection.Find.Execute(Replace:=2);
end;

class function TGeneralController.Instance: TGeneralController;
begin
  Result := AccessInstance(1);
end;

function TGeneralController.ParseExcelSumExpression(
  sourceRange: AnsiString): AnsiString;
var
  i, n, m: integer;
  tempStr: AnsiString;
begin
  tempStr:= '';
  Result:= '';
  n:= 0;
  m:= 0;
  for I := 1 to Length(sourceRange) do
  begin
    if sourceRange[i] = ',' then inc(n);
    if n <= MAX_EXCEL_SUM_ARGUMENTS then
    begin
      tempStr:= tempStr + sourceRange[i];
      continue;
    end
    else
    begin
      Result:= Result + 'SUM(' + tempStr + '),';
      tempStr:= '';
      n:= 0;
      inc(m);
    end;
  end;
  if tempStr <> '' then
  begin
    Result:= Result + 'SUM(' + tempStr + ')';
    inc(m);
  end;
  if m = 1 then Result:= '=' + Result
  else Result:= '=SUM(' + Result + ')';
end;

class procedure TGeneralController.ReleaseInstance;
begin
  AccessInstance(2);
end;

procedure TGeneralController.ReleaseLockupCB(cmp: PDBLookupComboboxEh);
begin
  if (cmp^ <> nil) then
  begin
    //cmp^.KeyValue:= NULL;
    if (cmp^.ListSource <> nil) then
    begin
      if cmp^.ListSource.DataSet <> nil then
      begin
        if cmp^.ListSource.DataSet.Active then
          cmp^.ListSource.DataSet.Close;
        cmp^.ListSource.DataSet.Free;
      end;
      cmp^.ListSource.Free;
    end;
  end;
end;

procedure TGeneralController.InitializeLockupCB(cmp: PDBLookupComboboxEh;
  keyField, listField: string);
begin
  cmp^.ListSource:= TDataSource.Create(nil);
  cmp^.ListSource.DataSet:= GetNewADODataSet(false);
  cmp^.KeyField:= keyField;
  cmp^.ListField:= listField;
end;

procedure TGeneralController.RefreshLockupCB(cmp: PDBLookupComboboxEh);
var
  oldValue: Variant;
begin
  if (cmp^.ListSource <> nil) then
  begin
    oldValue:= cmp^.KeyValue;
    if (cmp^.ListSource.DataSet.Active) then
      cmp^.ListSource.DataSet.Close;
    cmp^.KeyValue:= NULL;
    cmp^.ListSource.DataSet.Open;
    cmp^.KeyValue:= oldValue;
  end;
end;

procedure TGeneralController.SetCaptionDots(lpSource: PLabel;
  strCapt: string; maxWidth: integer);
var
  i:integer;
begin
  lpSource^.Caption:= '';
  for i:= 1 to Length(strCapt) do
  begin
    lpSource^.Caption:= lpSource^.Caption + strCapt[i];
    lpSource^.Refresh;
    if (lpSource^.Width > maxWidth-5) then
    begin
      lpSource^.Caption:= lpSource^.Caption + '...';
      Break;
    end;
  end;
end;

function TGeneralController.CloseLockupCB(cmp: PDBLookupComboboxEh): Variant;
begin
  if (cmp^ <> nil) then
  begin
    if (cmp^.ListSource <> nil) then
      if (cmp^.ListSource.DataSet.Active) then
        cmp^.ListSource.DataSet.Close;
    Result:= cmp^.KeyValue;
    cmp^.KeyValue:= NULL;
  end;
end;

function TGeneralController.getDataSetValues(SourceDataSet: PDataSet;
  AQuary: WideString; keyField: string; isShowFirst: boolean; defaultValue: Variant): Variant;
begin
  if (SourceDataSet^ <> nil) then
  begin
    if (SourceDataSet^.Active) then SourceDataSet^.Close;
  end
  else exit;
  (SourceDataSet^ as TADODataSet).Connection:= dm.DBConnect;
  (SourceDataSet^ as TADODataSet).CommandText:= AQuary;
  SourceDataSet^.Open;
  if (isShowFirst) then
  begin
    if (SourceDataSet^.RecordCount > 0) then
      Result:= SourceDataSet^.FieldByName(keyField).Value
    else
      Result:= NULL;
  end
  else
  begin
    if defaultValue <> NULL then
    begin
      if SourceDataSet^.Locate(keyField, defaultValue, [loPartialKey]) then
        Result:= defaultValue
      else
        Result:= NULL;
    end
    else
    begin
      if (SourceDataSet^.RecordCount = 1) then
        Result:= SourceDataSet^.FieldByName(keyField).Value
      else
        Result:= NULL;
    end;
  end;
end;

function TGeneralController.GetExcelColumnLetter(colNumber: integer): string;
var
  l, m: integer;
const
  cols: array[0..25] of STRING = ('A','B','C','D','E','F','G', 'H','I','J','K','L','M','N', 'O','P','Q','R','S','T','U','V','W','X','Y','Z');
begin
  l:= colNumber div 26;
  m:= colNumber mod 26;
  if l > 0 then
    Result:= cols[l-1] + cols[m]
  else Result:= cols[m];
end;

function TGeneralController.GetMainConnection: TADOConnection;
begin
  Result:= dm.DBConnect;
end;

function TGeneralController.GetNewADODataSet(isBatchOptimistic: boolean): TADODataSet;
begin
  Result:= TADODataSet.Create(nil);
  Result.Connection:= dm.DBConnect;
  if isBatchOptimistic then
    Result.LockType:= ltBatchOptimistic;
end;

function TGeneralController.GetNewADOStoredProc(procName: string;
  isBatchOptimistic: boolean): TADOStoredProc;
begin
  Result:= TADOStoredProc.Create(nil);
  Result.Connection:= dm.DBConnect;
  Result.ProcedureName:= procName;
end;

function TGeneralController.getStringListFromStr(
  sourceStr: string): TStringList;
var
  i:integer;
  number: string;
const
  allow: set of char = ['1','2','3','4','5','6','7','8','9','0'];
begin
  Result:= TStringList.Create;
  if (Length(sourceStr) > 0) then
  begin
    number:= '';
    if Length(sourceStr) > 0 then
      for i:= 1 to Length(sourceStr) do
      begin
        if ((sourceStr[i] = ',') or (sourceStr[i] = '\') or (sourceStr[i] = ' ') or (Length(number) > 2)) then
        begin
          if (Length(number) > 0) then Result.Add(number);
          number:= '';
        end
        else
        begin
          if (sourceStr[i] in allow) then
            number:= number + sourceStr[i]
          else
            begin
              Application.MessageBox(PChar('Указанно неверное значение: ' + sourceStr), 'Изменение дисциплины в учебном плане', MB_ICONWARNING);
              Result:= TStringList.Create;
              exit;
            end;
        end;
      end;
    if (Length(number) > 0) then Result.Add(number);
  end;
end;

function TGeneralController.GetMonthName(imonth:integer):string;
  begin
    Result:='Нет данных';
    case imonth of
    1: Result:='января';
    2: Result:='февраля';
    3: Result:='марта';
    4: Result:='апреля';
    5: Result:='мая';
    6: Result:='июня';
    7: Result:='июля';
    8: Result:='августа';
    9: Result:='сентября';
    10: Result:='октября';
    11: Result:='ноября';
    12: Result:='декабря';
    end;
  end;

function TGeneralController.GetFullDate(ddate:TDateTime):string;
  begin
   // date:= DateOf(ddate);
   if (DayOf(ddate)<10) then
      Result:='0'+IntToStr(DayOf(ddate))+' '+GetMonthName(MonthOf(ddate))+' '+IntToStr(YearOf(ddate))
   else
      Result:=IntToStr(DayOf(ddate))+' '+GetMonthName(MonthOf(ddate))+' '+IntToStr(YearOf(ddate));
  end;

end.
