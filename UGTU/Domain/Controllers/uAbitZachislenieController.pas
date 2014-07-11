{-----------------------------------------------------------
  Модуль AbitZachislenieController:
      TAbitZachislenieController - контроллер подсистемы
      "Абитуриент" зачисление абитуриентов
  Дата создания: 20.10.2007
  Дата последнего изменения: 30.10.2007
  Разработчик: Вокуева Т.А.
-----------------------------------------------------------}
unit uAbitZachislenieController;
 {#Author tanyav@ist.ugtu.net}
interface
uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, ADODB, DB, uDM,
  Forms, Dialogs, DBLookupEh, Variants, StdCtrls, GeneralController, Grids,
  ExcelXP, ComObj, DBGrids, uJoinGroup, ABIT_zachislenie_frame,
  DBGridEh, ApplicationController, ExceptionBase;

 type
  PDBGrid = ^TDBGridEh;
  TAbitZachislenieController = class (TObject)
  protected
    constructor CreateInstance;
 //AccessInstance предоставляет доступ к экземпляру контроллера
    class function AccessInstance(Request: Integer):
       TAbitZachislenieController;
//AccessDataSetInstance предоставляет доступ к DataSet
    function AccessDataSetInstance(nnyear: Integer=0): TDataSet;

    constructor Create;

  public

  //Instance - возвращает экзепляр данного контроллера
    class function Instance: TAbitZachislenieController;
  //ReleaseInstance - уничтожает контроллер
    class procedure ReleaseInstance;

//DataSetInstance возвращает DataSet
    function DataSetInstance(nnyear, ik_fac, ik_spec_fac: Integer): TDataSet;
  //ReleaseDataSetInstance - уничтожает DataSet
    class procedure ReleaseDataSetInstance;

   //RefreshAbitList обновляет список абитуриентов
   //(заново загружает из базы)
    procedure RefreshAbitList();

//GetAbitSpisLoadAbitListok загружает список абитуриентов
    function LoadAbitList(nnyear:integer): Variant;
    //SetAbitSpisokFilter фильтрует список абитуриентов по типу состояния зачисления
//и, если нужно, по типу категории поступления
    procedure SetAbitSpisokFilter(ik_typeSostZach:integer;
         ik_typeKatZach: Variant);

    //GetTypeKatZach загружает список типов категорий зачисления
    function GetTypeKatZach(SourceDataSet: PDataSet): Variant;

//GetProhBalls загружает проходные баллы в DataSet
    function GetProhBalls(SourceDataSet: PDataSet;
  nnyear, ik_fac, ik_spec_fac:integer): Variant;
//IsAbit_HaveAllExam Проверяет, есть ли у абитуриента нужные экзамены
    function IsAbit_HaveAllExam(): boolean;
//IsAbit_HaveAllDocs проверяет, есть ли у абитуриента все документы
    function IsAbit_HaveAllDocs(): boolean;
//IsAbit_CanBeZachisl проверяет, можно ли перевести абитуриента в статус "зачислен"
    function IsAbit_CanBeZachisl():boolean;
//Abit_Get_Ball Возвращает проходной балл для категории поступления набора
    function Abit_Get_Ball(NNrecord, Category: integer): integer;
//IsAbit_ProhodBall Проверяет, набрал ли абитуриент проходной балл
    function IsAbit_ProhodBall(): boolean;
//Abit_StateChange меняет состояние зачисления абитуриента
    function Abit_StateChange(nnAbit, state: integer): boolean;
//Abit_Join зачисляет абитуриента (меняет его состояние на зачисленное,
//но не зачисляет его в группу)
   procedure Abit_Join(nnAbit: integer);
//Abit_Current возвращает абитуриента из списка зачисленных
//в предварительный список на поступление
   function Abit_Current(nnAbit: integer): boolean;
//Abit_Reserve помещает абитуриента в резерв
   procedure Abit_Reserve(nnAbit: integer);
//Abit_Exile присваивает абитуриенту статус не зачислен
   procedure Abit_Exile(nnAbit: integer);
//Abit_DelZachGrup удаляет зачетку и связь зачетки с текущей
//группой
   procedure Abit_DelZachGrup(ik_zach: integer);


   //GetJoinCauses загружает причины поступления в DataSet
   function GetJoinCauses(SourceDataSet: PDataSet): Variant;

    //GetPrikazList загружает cписок приказов в DataSet
   function GetPrikazList(SourceDataSet: PDataSet): Variant;

   //GetGrupList загружает список доступных групп в DataSet
   function GetGrupList(SourceDataSet: PDataSet; ik_spec_fac, nnyear:integer): Variant;

//Abit_AppendRecordBook создает/pедактирует зачетку (номер зачетки)
//и возвращает новый номер
   function Abit_AppendRecordBook(flag, code, zach: integer; nzach:string): integer;
   //Abit_CreateRecordBook создает зачетку (номер зачетки)
//и возвращает новый номер
   function Abit_CreateRecordBook(code: integer; nzach:string): integer;
//Abit_ChangeRecordBook pедактирует зачетку (номер зачетки)
   function Abit_ChangeRecordBook(code, zach: integer; nzach:string): boolean;

//Abit_AppendStudGrup создает/pедактирует связь
//студента и группы
   function Abit_AppendStudGrup(flag, grup, zach, KatZach,
   prikzach, priczach: integer; cObosnZach:string): integer;

//Abit_CreateStudGrup создает связь
//студента и группы
   function Abit_CreateStudGrup(code,grup, zach, KatZach,
   prikzach, priczach: integer; cNameGrup, cObosnZach:string): boolean;

//Abit_ChangeStudGrup pедактирует создает связь
//студента и группы
   function Abit_ChangeStudGrup(code, newgrup, zach: integer; cNameGrup:string): boolean;

//Abit_JoAbit_IsOldZach проверяет есть ли уже заданный
//номер зачетки в базе (если есть, возвращает true)
   function Abit_IsOldZach(nZach: string): boolean;

//GetNewNZach возвращает новый номер зачетки для заданного года
//(на 1 больше максимального из существующих)
   function GetNewNZach(year: integer): string;

   //Abit_JoinGroup зачисляет студента в группу
   //(задает номер зачетки и связь с группой)
   function Abit_JoinGroup(grid: PDBGrid): boolean;

   //Abit_JoinGroup меняет группу и (или) номер зачетки студента в приказе
   function Abit_ChangeGroup(grid: PDBGrid): boolean;


//Вывод предварительных списков в Excel
  //SetColor закрашивает область в нужный цвет
  procedure SetColor(i:integer; Color:TColor; Worksheet:Variant);

//AbitsToExcel выводит в Excel предварительные
//списки абитуриентов на зачисление
   procedure AbitsToExcel(flColor: boolean);


//AbitsWithPolozhOcenkiToExcel выводит в Excel предварительные
//списки абитуриентов ЦКП и бюджет с положит. оценками
   function AbitsWithPolozhOcenkiToExcel(grid: PDBGrid):boolean;


//SpecPrikazToWord экспортирует в Word приказ на зачисление
//сгруппированный по специальностям
   procedure SpecPrikazToWord(grid: PDBGrid);


   //GroupPrikazToWord экспортирует в Word приказ на зачисление
//сгруппированный по группам
   procedure GroupPrikazToWord(grid: PDBGrid);

   //ExportProtokolToExcel экспорт протокола о зачислении в Excel
  procedure ExportProtokolToExcel;

  //AddAllProhBalls добавляет все проходные баллы для набора или
  //для всех наборов текущего года
  procedure AddAllProhBalls(NNyear, ik_fac, ik_spec_fac: Variant);

end;

implementation

var
//FAbitZachislenieControllerInstance - экземпляр контроллера
  FAbitZachislenieControllerInstance: TAbitZachislenieController = nil;  
//FAbitListDataSetInstance - экземпляр DataSet со списком абитуриентов
  FAbitListDataSetInstance: TDataSet = nil;
//год поступления абитуриентов
  Fnnyear: integer = -1;
  Fik_fac: integer = -1; //код факультета
  Fik_spec_fac: integer = -1; //код специальности
  FLoaded: boolean = false;

constructor TAbitZachislenieController.CreateInstance;
begin
  inherited Create;
end;

constructor TAbitZachislenieController.Create;
begin
  inherited Create;
  raise Exception.CreateFmt('Доступ к классу %s можно получить только через поле Instance!', [ClassName]);
end;


class function TAbitZachislenieController.AccessInstance(
  Request: Integer): TAbitZachislenieController;
begin
  case Request of
    0 : ;
    1 : if not Assigned(FAbitZachislenieControllerInstance) then
      FAbitZachislenieControllerInstance:= CreateInstance;
    2 : if FAbitZachislenieControllerInstance <> nil then
          begin
            FAbitZachislenieControllerInstance.Free;
            FAbitZachislenieControllerInstance:= nil;
          end;
    else raise EApplicationException.Create('Ошибка в программе!',Exception.CreateFmt('Неизвестное значение параметра %d в методе AccessInstance контроллера AbitZachislenieController', [Request]));
  end;  Result := FAbitZachislenieControllerInstance;
end;

class procedure TAbitZachislenieController.ReleaseInstance;
begin
   ReleaseDataSetInstance;
   AccessInstance(2);
end;

class procedure TAbitZachislenieController.ReleaseDataSetInstance;
begin
   if FAbitListDataSetInstance<>nil then
   begin
      FAbitListDataSetInstance.Free;
      FAbitListDataSetInstance:= nil;
   end;

end;

class function TAbitZachislenieController.Instance: TAbitZachislenieController;
begin
  Result := AccessInstance(1);
end;

function TAbitZachislenieController.AccessDataSetInstance(nnyear: Integer=0): TDataSet;
begin
   if not Assigned(FAbitListDataSetInstance) then
   begin
      FAbitListDataSetInstance:= TADODataSet.Create(nil);
      LoadAbitList(nnyear);
      FAbitListDataSetInstance.FieldByName('SummBall').Alignment:=taLeftJustify;
      Fnnyear:= nnyear;
   end
   else
{
Проверяем, чтобы год поступления запрашиваемого списка
совпадал с годом поступления загруженного списка абитуриентов
Иначе, заново загружаем список для заданного года}
   begin
      if (nnyear<>Fnnyear) or (not FAbitListDataSetInstance.Active) then
      begin
         LoadAbitList(nnyear);
         Fnnyear:= nnyear;
      end;
   end;
   Result := FAbitListDataSetInstance;
end;

function TAbitZachislenieController.DataSetInstance(nnyear, ik_fac, ik_spec_fac: Integer): TDataSet;
begin
   //создаем DataSet и загружаем список в него
   Result := AccessDataSetInstance(nnyear);
   Fik_spec_fac:= ik_spec_fac;
   Fik_fac:= ik_fac;
end;

//загружает список абитуриентов
function TAbitZachislenieController.LoadAbitList(
  nnyear:integer): Variant;
begin
  TADODataSet(FAbitListDataSetInstance).LockType:=
      ltBatchOptimistic;
  Result:= TGeneralController.Instance.getDataSetValues(@FAbitListDataSetInstance, 'exec ABIT_GetAbitListForZachisl '+IntToStr(nnyear), 'nn_abit', FALSE, NULL);
end;

procedure TAbitZachislenieController.RefreshAbitList();
begin
  TApplicationController.GetInstance.AddLogEntry('Обновление списка абитуриентов.');
  FAbitListDataSetInstance.Close;
  FAbitListDataSetInstance.Open;
end;

procedure TAbitZachislenieController.SetAbitSpisokFilter(ik_typeSostZach:integer;
         ik_typeKatZach: Variant);
var filter:string;
begin
   filter:='';
   if Fik_fac>0 then
      filter:=filter+'(ik_fac='+IntToStr(Fik_fac)+')';
   if (Fik_spec_fac>0) then
   begin
      if filter<>'' then
         filter:=filter+' and ';
      filter:=filter+'(ik_spec_fac='+IntToStr(Fik_spec_fac)+')';
   end;
   if filter<>'' then
         filter:=filter+' and ';
   filter:=filter+'(ik_type_zach='+IntToStr(ik_typeSostZach)+')';
   if ik_typeKatZach<>null then
      filter:= filter+' and (ik_type_kat='+IntToStr(ik_typeKatZach)+')';
   FAbitListDataSetInstance.Filter:=Filter;
   FAbitListDataSetInstance.Filtered:=true;

end;




//загружает список типов категорий зачисления
function TAbitZachislenieController.GetTypeKatZach(SourceDataSet: PDataSet): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'select * from TypeKatZach', 'ik_type_kat', false, NULL);
end;




function TAbitZachislenieController.GetProhBalls(SourceDataSet: PDataSet;
  nnyear, ik_fac, ik_spec_fac:integer): Variant;
var filter:string;
begin
   if nnyear>0 then
      filter:='(nnyear='+IntToStr(nnyear)+')';
   if ik_fac>0 then
      filter:=filter+' and (ik_fac='+IntToStr(ik_fac)+')';
   if ik_spec_fac>0 then
      filter:=filter+' and (ik_spec_fac='+IntToStr(ik_spec_fac)+')';
   if filter<>'' then
      Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'select * from ABIT_MinBalls WHERE '+filter, 'ik_disc_nabor', false, NULL)
   else
      Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'select * from ABIT_MinBalls', 'ik_disc_nabor', false, NULL);
end;

function TAbitZachislenieController.IsAbit_CanBeZachisl: boolean;
begin
  Result:=(IsAbit_HaveAllExam)and(IsAbit_HaveAllDocs);
end;

function TAbitZachislenieController.IsAbit_HaveAllDocs: boolean;
begin
  result := not((FAbitListDataSetInstance.FieldByName('ik_doc_edu').Value=null)
    or(FAbitListDataSetInstance.FieldByName('ik_doc_ident').Value=null));
end;

function TAbitZachislenieController.IsAbit_HaveAllExam(): boolean;
begin
   result:=FAbitListDataSetInstance.FieldByName('notExam').Value=null;
end;

function TAbitZachislenieController.Abit_Get_Ball(NNrecord, Category: integer): integer;
begin
   Result:=100;
   exit;

   {if not (adodsBalls.Active) then
      adodsBalls.Active:=true;

   adodsBalls.Filter:='((NnRecord='''+inttostr(NNrecord)+''') and (ik_kat_zach='+inttostr(Category)+'))';
   adodsBalls.Filtered:=true;
   if adodsBalls.RecordCount=0 then
      result:=0
   else
      result:=adodsBalls.FieldValues['Ball']; }
end;


function TAbitZachislenieController.IsAbit_ProhodBall(): boolean;
begin
  // Result:=true;     //пока возвращаем всегда true
  // exit;


   if FAbitListDataSetInstance.FieldByName('SummBall').Value=Null then
      result:=false
   else
      result:=(FAbitListDataSetInstance.FieldByName('SummBall').Value>=
        Abit_Get_Ball(FAbitListDataSetInstance.FieldByName('NNRecord').Value,
            FAbitListDataSetInstance.FieldByName('ik_kat_zach').Value)); 
end;

function TAbitZachislenieController.Abit_StateChange(nnAbit, state: integer): boolean;
var
  tempStoredProc: TADOStoredProc;
begin
  result:=false;
  tempStoredProc:= TADOStoredProc.Create(nil);
  try
    tempStoredProc.ProcedureName:= 'ABIT_Zachisl;1';
    tempStoredProc.Connection:= dm.DBConnect;
    tempStoredProc.Parameters.CreateParameter('@nn_abit', ftInteger, pdInput, 0, nnAbit);
    tempStoredProc.Parameters.CreateParameter('@ik_zach', ftInteger, pdInput, 0, state);
    tempStoredProc.ExecProc;
    result:=true;
  finally
    tempStoredProc.Free;
  end;
end;

procedure TAbitZachislenieController.Abit_Join(nnAbit: integer);
begin

   TApplicationController.GetInstance.AddLogEntry('Зачисление абитуриента '+
      FAbitListDataSetInstance.FieldByName('fio').AsString);

   if Abit_StateChange(nnAbit,6) then
   begin
      FAbitListDataSetInstance.Edit;
      FAbitListDataSetInstance.FieldByName('cname_zach').Value:='зачислен';
      FAbitListDataSetInstance.FieldByName('ik_zach').Value:=6;
      FAbitListDataSetInstance.FieldByName('ik_type_zach').Value:=2;
      FAbitListDataSetInstance.Next;
   end;

end;

procedure TAbitZachislenieController.Abit_Reserve(nnAbit: integer);
begin
  TApplicationController.GetInstance.AddLogEntry('Отправка абитуриента в резерв'+
      FAbitListDataSetInstance.FieldByName('fio').AsString);


   if Abit_StateChange(nnAbit,4) then
   begin
      FAbitListDataSetInstance.Edit;
      FAbitListDataSetInstance.FieldByName('cname_zach').Value:='в резерве';
      FAbitListDataSetInstance.FieldByName('ik_zach').Value:=4;
      FAbitListDataSetInstance.FieldByName('ik_type_zach').Value:=1;
      FAbitListDataSetInstance.Next;
   end;
end;


procedure TAbitZachislenieController.Abit_DelZachGrup(ik_zach: integer);
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TADOStoredProc.Create(nil);
  try
    //удаляем сначала все группы
    tempStoredProc.Connection:= dm.DBConnect;
    tempStoredProc.ProcedureName:= 'DelStudGrup;1';
    tempStoredProc.Parameters.Clear;
    tempStoredProc.Parameters.CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 4, NULL);
    tempStoredProc.Parameters.CreateParameter('@Ik_zach', ftInteger, pdInput, 4, ik_zach);
    tempStoredProc.ExecProc;

    //удаляем зачетку
    tempStoredProc.Connection:= dm.DBConnect;
    tempStoredProc.ProcedureName:= 'DelZach;1';
    tempStoredProc.Parameters.Clear;
    tempStoredProc.Parameters.CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 4, NULL);
    tempStoredProc.Parameters.CreateParameter('@Ik_zach', ftInteger, pdInput, 4, ik_zach);
    tempStoredProc.ExecProc;
  finally
    tempStoredProc.Free;
  end;
end;

function TAbitZachislenieController.Abit_Current(nnAbit: integer): boolean;
begin
  TApplicationController.GetInstance.AddLogEntry('Отмена зачисления абитуриента '+
      FAbitListDataSetInstance.FieldByName('fio').AsString);

  dm.DBConnect.BeginTrans;
  try
    if (FAbitListDataSetInstance.FieldByName('BookKey').Value<>Null) then
    begin
      //удаляем зачетку
      Abit_DelZachGrup(FAbitListDataSetInstance.FieldByName('BookKey').Value);
      FAbitListDataSetInstance.Edit;
      FAbitListDataSetInstance.FieldByName('Nn_zach').Value:= '';
      FAbitListDataSetInstance.FieldByName('Cname_grup').Value:= '';
      FAbitListDataSetInstance.FieldByName('Ik_grup').Value:= null;
      FAbitListDataSetInstance.FieldByName('Ik_prikazzach').Value:= null;
      FAbitListDataSetInstance.FieldByName('Ik_priczach').Value:= null;
    end;
  except
    on E:Exception do
    begin
      dm.DBConnect.RollbackTrans;
      raise EApplicationException.Create('Отчисление невозможно! Абитуриент '+
              FAbitListDataSetInstance.FieldByName('fio').AsString+' уже является студентом!',E);
    end;
  end;

  try
    //изменяем состояние зачисления
    Abit_StateChange(nnAbit,1);
    FAbitListDataSetInstance.Edit;
    FAbitListDataSetInstance.FieldByName('cname_zach').Value:='текущее';
    FAbitListDataSetInstance.FieldByName('ik_type_zach').Value:=1;
    FAbitListDataSetInstance.FieldByName('ik_zach').Value:=1;
    FAbitListDataSetInstance.FieldByName('nn_zach').Value:=null;
  except
    on E:Exception do
    begin
      dm.DBConnect.RollbackTrans;
      raise EApplicationException.Create('Произошла ошибка при изменении статуса абитуриента!',E);
    end;
  end;

  dm.DBConnect.CommitTrans;
  FAbitListDataSetInstance.Next;
  result:=true;
end;

procedure TAbitZachislenieController.Abit_Exile(nnAbit: integer);
begin
  TApplicationController.GetInstance.AddLogEntry('Отказ в зачислении абитуриенту '+
      FAbitListDataSetInstance.FieldByName('fio').AsString);


   if Abit_StateChange(nnAbit,7) then
   begin
      FAbitListDataSetInstance.Edit;
      FAbitListDataSetInstance.FieldByName('cname_zach').Value:='не зачислен';
      FAbitListDataSetInstance.FieldByName('ik_type_zach').Value:=3;
      FAbitListDataSetInstance.FieldByName('ik_zach').Value:=7;
      FAbitListDataSetInstance.Next;
   end;

end;

function TAbitZachislenieController.GetJoinCauses(SourceDataSet: PDataSet): Variant;
begin
   Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet,'select * from Pricina where  ikTypePric=1', 'Ik_pric', false, NULL)
end;

function TAbitZachislenieController.GetPrikazList(SourceDataSet: PDataSet): Variant;
begin
   Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet,'select Ik_prikaz, RTRIM(Nn_prikaz)+'' от ''+CONVERT(VARCHAR(10),Dd_prikaz,104) as NN_Date from dbo.Prikaz order by Dd_prikaz desc', 'Ik_prikaz', false, NULL)
end;

function TAbitZachislenieController.GetGrupList(SourceDataSet: PDataSet; ik_spec_fac, nnyear:integer): Variant;
begin
   Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet,'select * from Tree_groups where (ik_spec_fac='''+inttostr(ik_spec_fac)+''')and (nYear_post='''+inttostr(nnyear)+''')', 'Ik_grup', false, NULL)
end;


function TAbitZachislenieController.Abit_AppendRecordBook(flag, code, zach: integer; nzach:string): integer;
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.Connection:= dm.DBConnect;
  tempStoredProc.ProcedureName:= 'AppendZach;1';
  tempStoredProc.Parameters.CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 4, NULL);
  tempStoredProc.Parameters.CreateParameter('@flag', ftInteger, pdInput, 4, flag);
  tempStoredProc.Parameters.CreateParameter('@nzach', ftString, pdInput, 6, nzach);
  tempStoredProc.Parameters.CreateParameter('@code', ftInteger, pdInput, 4, code);
  tempStoredProc.Parameters.CreateParameter('@zach', ftInteger, pdInput, 4, zach);
  try
    tempStoredProc.ExecProc;
    result:=tempStoredProc.Parameters.ParamByName('@RETURN_VALUE').Value;;
  finally
    tempStoredProc.Free;
  end;
end;

function TAbitZachislenieController.Abit_CreateRecordBook(code: integer; nzach:string): integer;
var newBookKey:integer;
begin
   newBookKey:= Abit_AppendRecordBook(1, code, -1, nzach);
   if newBookKey>0 then
   begin
     // FAbitListDataSetInstance.GotoBookmark(Pointer(dbgAbitsForZachisl.SelectedRows[i]));
      FAbitListDataSetInstance.Locate('nCode',code,[]);
      FAbitListDataSetInstance.Edit;
      FAbitListDataSetInstance.FieldByName('ik_zach').Value:= newBookKey;    //BookKey
      FAbitListDataSetInstance.FieldByName('Nn_zach').Value:= nzach;
   end;
   result:= newBookKey;
end;

function TAbitZachislenieController.Abit_ChangeRecordBook(code, zach: integer; nzach:string): boolean;
begin
   if Abit_AppendRecordBook(0, code, zach, nzach)=-3 then
      result:= false
   else
   begin
      FAbitListDataSetInstance.Locate('nCode',code,[]);
      FAbitListDataSetInstance.Edit;
      FAbitListDataSetInstance.FieldByName('Nn_zach').Value:= nzach;

      result:= true;
   end;
end;

function TAbitZachislenieController.Abit_AppendStudGrup(flag, grup, zach, KatZach,
   prikzach, priczach: integer; cObosnZach:string): integer;
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.Connection:= dm.DBConnect;
  tempStoredProc.ProcedureName:= 'AppendStudGrup;1';
  tempStoredProc.Parameters.CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 4, NULL);
  tempStoredProc.Parameters.CreateParameter('@flag', ftInteger, pdInput, 4, flag);
  tempStoredProc.Parameters.CreateParameter('@grup', ftInteger, pdInput, 4, grup);
  tempStoredProc.Parameters.CreateParameter('@zach', ftInteger, pdInput, 4, zach);
  tempStoredProc.Parameters.CreateParameter('@KatZach', ftInteger, pdInput, 4, KatZach);
  tempStoredProc.Parameters.CreateParameter('@prikzach', ftInteger, pdInput, 4, prikzach);
  tempStoredProc.Parameters.CreateParameter('@priczach', ftInteger, pdInput, 4, priczach);
  tempStoredProc.Parameters.CreateParameter('@prikOtch', ftInteger, pdInput, 4, NULL);
  tempStoredProc.Parameters.CreateParameter('@pricOtch', ftInteger, pdInput, 4, NULL);
  tempStoredProc.Parameters.CreateParameter('@cObosnZach', ftString, pdInput, 500, cObosnZach);
   try
    tempStoredProc.ExecProc;
    result:=1;
    tempStoredProc.Free;
  except
    tempStoredProc.Free;
    //result:=-3;
    raise;
  end;
end;

function TAbitZachislenieController.Abit_CreateStudGrup(code,grup, zach, KatZach,
   prikzach, priczach: integer; cNameGrup, cObosnZach:string): boolean;
begin
   result:= false;
   if Abit_AppendStudGrup(1, grup, zach, KatZach,
      prikzach, priczach, cObosnZach)<>-3 then
   begin
      FAbitListDataSetInstance.Locate('nCode',code,[]);
      FAbitListDataSetInstance.Edit;
      FAbitListDataSetInstance.FieldByName('Cname_grup').AsString:= cNameGrup;
      FAbitListDataSetInstance.FieldByName('Ik_grup').Value:= grup;
      FAbitListDataSetInstance.FieldByName('Ik_prikazzach').Value:= prikzach;
      FAbitListDataSetInstance.FieldByName('Ik_priczach').Value:= priczach;
      result:= true;
      FAbitListDataSetInstance.Next;
   end;
end;

function TAbitZachislenieController.Abit_ChangeStudGrup(code,newgrup, zach: integer; cNameGrup:string): boolean;
var
  tempStoredProc: TADOStoredProc;
begin
  //result:=false;
  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.Connection:= dm.DBConnect;
  tempStoredProc.ProcedureName:= 'ChangeGrup;1';
  tempStoredProc.Parameters.CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 4, NULL);
  tempStoredProc.Parameters.CreateParameter('@Ik_grupNew', ftInteger, pdInput, 4, newgrup);
  tempStoredProc.Parameters.CreateParameter('@Ik_zach', ftInteger, pdInput, 4, zach);
  try
    tempStoredProc.ExecProc;
    tempStoredProc.Free;
    FAbitListDataSetInstance.Locate('nCode',code,[]);
    FAbitListDataSetInstance.Edit;
    FAbitListDataSetInstance.FieldByName('Cname_grup').Value:= cNameGrup;
    FAbitListDataSetInstance.FieldByName('ik_grup').Value:= newgrup;
    result:=true;
    FAbitListDataSetInstance.Next;
  except
    tempStoredProc.Free;
    raise;
  end;
end;

function TAbitZachislenieController.Abit_IsOldZach(nZach: string): boolean;
var dataSet:TADODataSet;
begin
//Проверяем, чтобы введенного номера зачетки еще не было
  result:= false;
  dataSet:= TADODataSet.Create(nil);
  try
    TGeneralController.Instance.getDataSetValues(@dataSet,'select * from Zach Where (Nn_zach='''+nzach+''')', 'ik_zach', false, NULL);
    if not dataSet.IsEmpty then
      result:= true;
  finally
    dataSet.Free;
  end;
end;

function TAbitZachislenieController.GetNewNZach(year: integer): string;
var dataSet:TADODataSet;
    FirstRecord, LastRecord, nZach: string;
begin
    FirstRecord:=inttostr(year mod 100);
    if length(FirstRecord)=1 then
      FirstRecord:='0'+FirstRecord;
    LastRecord:=FirstRecord+'9999';
    FirstRecord:=FirstRecord+'0000';
//запрашиваем самый большой существующий номер зачетки
//заданного года и возвращаем следующий
    dataSet:= TADODataSet.Create(nil);
    try
      TGeneralController.Instance.getDataSetValues(@dataSet,'select (Max(nn_zach)+1) as maxnzach from Zach  Where (Nn_zach BETWEEN '''+FirstRecord+''' AND '''+LastRecord+''')', 'maxnzach', false, NULL);
      nZach:= dataSet.FieldByName('maxnzach').AsString;
      //наращиваем до 6 знаков в номере
      while length(nZach)<6 do
        nZach:='0'+nZach;
      result:= nZach;
    finally
      dataSet.Free;
    end;
end;

function TAbitZachislenieController.Abit_JoinGroup(grid: PDBGrid): boolean;
var i, spec, group, ik_zach: integer;
  nzach, sort, groupName: string;
  //dataSet:TADODataSet;
begin

   result:=false;
   if grid.SelectedRows.Count=0 then exit;
   spec:=FAbitListDataSetInstance.FieldByName('ik_spec_fac').Value;
   //Проверим, чтобы все выделенные студенты еще не
   //были зачислены и были с одной специальности
   for i := 0 to grid.SelectedRows.Count-1 do
   begin
      FAbitListDataSetInstance.GotoBookmark(Pointer(grid.SelectedRows[I]));
      //if (FAbitListDataSetInstance.FieldByName('nn_zach').Value<>NULL) then
      //begin
      //  raise EApplicationException.Create('Вы выбрали абитуриента, который уже был зачислен!');
      //end;
      if i=0 then
         spec:=FAbitListDataSetInstance.FieldByName('ik_spec_fac').Value
      else
      begin
         if spec<>FAbitListDataSetInstance.FieldByName('ik_spec_fac').Value then
         begin
            raise EApplicationException.Create('Вы выбрали абитуриентов разных специальностей! Зачисление их в одну группу невозможно!');
         end;
      end;
   end;

   TApplicationController.GetInstance.AddLogEntry('Зачисление абитуриентов в группу.');
    	//создаем диалог и передаем ему год и специальность
  frmJoinGroup:=TfrmJoinGroup.create(nil);
  try
	  FAbitListDataSetInstance.GotoBookmark(Pointer(grid.SelectedRows[0]));
	  frmJoinGroup.domspec:= FAbitListDataSetInstance.FieldByName('ik_spec_fac').Value;
	  frmJoinGroup.year:= FAbitListDataSetInstance.FieldByName('NNyear').Value;
	  frmJoinGroup.EditMode:= false;
	  frmJoinGroup.AbitCount:= grid.SelectedRows.Count;

    if FAbitListDataSetInstance.FieldByName('nn_zach').Value<>NULL then
    begin
    frmJoinGroup.eNum.Text:= FAbitListDataSetInstance.FieldByName('nn_zach').Value;
    frmJoinGroup.eNum.Enabled:=false;
    frmJoinGroup.HasZachMode:=true;
    end;

	  frmJoinGroup.ShowModal;

	  if  frmJoinGroup.mrOk then
	  begin

		nzach:= frmJoinGroup.eNum.Text;
	//Проверяем, чтобы введенного номера зачетки еще не было
    if frmJoinGroup.eNum.Enabled then
		if Abit_IsOldZach(nzach) then
		begin
		  raise EApplicationException.Create('Вы внесли уже используемый номер зачетки!');
		  exit;
		end;

	   sort:= TADODataSet(FAbitListDataSetInstance).Sort;
	   if grid.SelectedRows.Count>1 then
		   //сортируем по ФИО
		  TADODataSet(FAbitListDataSetInstance).Sort:= 'fio';

	   group:= frmJoinGroup.DbcbeGroup.KeyValue;
	   //order:= frmJoinGroup.dbcbeOrder.KeyValue;
	   groupName:= frmJoinGroup.DbcbeGroup.Text;
	   try
	//начинаем транзакцию
		  dm.DBConnect.BeginTrans;
		  //зачисляем и вносим группу
		  for i := 0 to grid.SelectedRows.Count-1 do
		  begin
	//Проверяем, чтобы введенного номера зачетки еще не было
        if frmJoinGroup.eNum.Enabled then
				if Abit_IsOldZach(nzach) then
				begin
				  dm.DBConnect.RollbackTrans;
				  raise EApplicationException.Create('Вы внесли уже используемый номер зачетки!');
				  exit;
				end;

				FAbitListDataSetInstance.GotoBookmark(Pointer(grid.SelectedRows[I]));

        TApplicationController.GetInstance.AddLogEntry('Зачисление абитуриента в группу: '+
          FAbitListDataSetInstance.FieldByName('fio').AsString+', '+
          groupName+', '+nzach);

			  //создаем новую зачетку (номер)
        if frmJoinGroup.eNum.Enabled then
				ik_zach:= Abit_CreateRecordBook(FAbitListDataSetInstance.FieldByName('nCode').Value, nzach)
        else
        ik_zach:=FAbitListDataSetInstance.FieldByName('BookKey').Value;

			  //зачисляем студента в группу
				Abit_CreateStudGrup(FAbitListDataSetInstance.FieldByName('nCode').Value,
					group, ik_zach,
					FAbitListDataSetInstance.FieldByName('ik_kat_zach').Value,
					frmJoinGroup.dbcbeOrder.KeyValue,
					frmJoinGroup.dbcbeCause.KeyValue,
					groupName,'');

				//наращиваем номер на 1
				nZach:= IntToStr(StrToInt(nZach)+1);
			  //наращиваем до 6 знаков в номере
				while length(nZach)<6 do
				  nZach:='0'+nZach;

		  end;
	//сохраняем изменения
		  dm.DBConnect.CommitTrans;
		except
      on E:Exception do
      begin
		  dm.DBConnect.RollbackTrans;
		  raise EApplicationException.Create('Неверные данные!',E);
      end;
		end;
		//возвращаем прежнюю сортировку
		TADODataSet(FAbitListDataSetInstance).Sort:= sort;
	  end;
  finally
    frmJoinGroup.Free;
    FAbitListDataSetInstance.Next;
  end;
end;

function TAbitZachislenieController.Abit_ChangeGroup(grid: PDBGrid): boolean;
var i, spec, group: integer;
  nzach, groupName: string;
  //dataSet:TADODataSet;
begin
   result:=false;
   if grid.SelectedRows.Count=0 then
      exit;

   spec:=FAbitListDataSetInstance.FieldByName('ik_spec_fac').Value;
   //Проверим, чтобы все выделенные студенты еще не
   //были зачислены и были с одной специальности
   for i := 0 to grid.SelectedRows.Count-1 do
   begin
      FAbitListDataSetInstance.GotoBookmark(Pointer(grid.SelectedRows[I]));
      if (FAbitListDataSetInstance.FieldByName('nn_zach').Value=NULL) then
      begin
        raise EApplicationException.Create('Вы выбрали абитуриента, который еще не был зачислен!');
        exit;
      end;
      if i=0 then
         spec:=FAbitListDataSetInstance.FieldByName('ik_spec_fac').Value
      else
      begin
         if spec<>FAbitListDataSetInstance.FieldByName('ik_spec_fac').Value then
         begin
            raise EApplicationException.Create('Вы выбрали абитуриентов разных специальностей! Зачисление их в одну группу невозможно!');
            exit;
         end;
      end;
   end;

   TApplicationController.GetInstance.AddLogEntry('Изменение группы, номера зачетки абитуриентов.');

//создаем диалог и передаем ему год и специальность
  frmJoinGroup:=TfrmJoinGroup.create(nil);
  FAbitListDataSetInstance.GotoBookmark(Pointer(grid.SelectedRows[0]));
  frmJoinGroup.domspec:= FAbitListDataSetInstance.FieldByName('ik_spec_fac').Value;
  frmJoinGroup.year:= FAbitListDataSetInstance.FieldByName('NNyear').Value;

  FAbitListDataSetInstance.GotoBookmark(Pointer(grid.SelectedRows[0]));
  frmJoinGroup.DbcbeGroup.KeyValue:= FAbitListDataSetInstance.FieldByName('Ik_grup').Value;
  frmJoinGroup.dbcbeOrder.KeyValue:= FAbitListDataSetInstance.FieldByName('Ik_prikazzach').Value;
  frmJoinGroup.dbcbeCause.KeyValue:= FAbitListDataSetInstance.FieldByName('Ik_priczach').Value;
  frmJoinGroup.eNum.Text:= FAbitListDataSetInstance.FieldByName('Nn_zach').Value;
  frmJoinGroup.EditMode:= true;
  frmJoinGroup.isModified:= false;

  frmJoinGroup.AbitCount:= grid.SelectedRows.Count;
  frmJoinGroup.ShowModal;
  if frmJoinGroup.mrOk then
  begin
  //если был выбран 1 студент, то редактируем зачетку и группу
    group:= frmJoinGroup.DbcbeGroup.KeyValue;
    groupName:= frmJoinGroup.DbcbeGroup.Text;
    if grid.SelectedRows.Count=1 then
    begin
      
      TApplicationController.GetInstance.AddLogEntry('Зачисление абитуриента в группу: '+
          FAbitListDataSetInstance.FieldByName('fio').AsString+', '+
          groupName+', '+nzach);

      FAbitListDataSetInstance.GotoBookmark(Pointer(grid.SelectedRows[0]));
      try
        dm.DBConnect.BeginTrans;
          nzach:= frmJoinGroup.eNum.Text;
          if Abit_ChangeRecordBook(FAbitListDataSetInstance.FieldByName('nCode').Value, FAbitListDataSetInstance.FieldByName('BookKey').Value,nzach) then
          begin
            if Abit_ChangeStudGrup(FAbitListDataSetInstance.FieldByName('nCode').Value, group, FAbitListDataSetInstance.FieldByName('BookKey').Value, groupName) then
              dm.DBConnect.CommitTrans
            else
              raise EApplicationException.Create('Произошла ошибка при смене группы студента '+
                      FAbitListDataSetInstance.FieldByName('fio').AsString);
          end
          else
            raise EApplicationException.Create('Произошла ошибка при смене номера зачетки студента '+
                      FAbitListDataSetInstance.FieldByName('fio').AsString);

      except
      on E:Exception do
      begin
        dm.DBConnect.RollbackTrans;
        raise EApplicationException.Create('Неверные данные!',E);
      end;
      end;

    end
    //иначе только группу
    else
    begin
      try
//начинаем транзакцию
        dm.DBConnect.BeginTrans;
      //зачисляем и вносим группу
        for i := 0 to grid.SelectedRows.Count-1 do
        begin
          FAbitListDataSetInstance.GotoBookmark(Pointer(grid.SelectedRows[I]));
         //изменяем группу на новую
          if not Abit_ChangeStudGrup(FAbitListDataSetInstance.FieldByName('nCode').Value, group, FAbitListDataSetInstance.FieldByName('BookKey').Value, groupName) then
          begin
            raise EApplicationException.Create('Произошла ошибка при смене группы студента '+
                      FAbitListDataSetInstance.FieldByName('fio').AsString);
          end;
        end;
//сохраняем изменения
        dm.DBConnect.CommitTrans;
      except
      on E:Exception do
      begin
        dm.DBConnect.RollbackTrans;
        raise EApplicationException.Create('Неверные данные!',E);
      end;
      end;
    end;
  end;
  frmJoinGroup.Free;
  FAbitListDataSetInstance.Next;
  if dm.DBConnect.InTransaction then
  begin
    dm.DBConnect.RollbackTrans;
    raise EApplicationException.Create('Неверные данные!');
  end;
end;


procedure TAbitZachislenieController.SpecPrikazToWord(grid: PDBGrid);
var W, MyRange, table:variant;
    str, sort:string;
    SmInPoint:real;
    //i,j,k:integer;
    abitCount:integer;
    fac,spec:integer;
begin
  TApplicationController.GetInstance.AddLogEntry('Экспорт в Word приказа на зачисление по специальностям.');

  FAbitListDataSetInstance.DisableControls;
  //отсортировать
  sort:= TADODataSet(FAbitListDataSetInstance).Sort;
  TADODataSet(FAbitListDataSetInstance).Sort:='Cname_fac, cname_spec';
	try
	  SmInPoint:=0.035;
	  W:=CreateOleObject('Word.Application');
	  str := ExtractFilePath(Application.ExeName)+'reports\Prikaz.dot';
	  W.Documents.add(str);
	  W.Visible:=false;
	  str:=DateToStr(Date);
	  str:=copy(str,1,length(str)-4);
	  str:=str+IntToStr(year);
    TGeneralController.Instance.FindAndInsert(W,'#Дата#',str);
	  str:=IntToStr(year);
	  TGeneralController.Instance.FindAndInsert(W,'#Год#',str);


	  //начинаем цикл по выведению зачисленных
	  FAbitListDataSetInstance.First;
	  //i:=1; //
	  fac:=0;
	  spec:=0;
	  while not FAbitListDataSetInstance.Eof do
	  begin
			if fac<>(FAbitListDataSetInstance).FieldByName('ik_fac').AsInteger then
			begin
			  MyRange:=W.ActiveDocument.Range(W.ActiveDocument.Range.End-1,
										  W.ActiveDocument.Range.End-1);
			  W.ActiveDocument.Range.InsertAfter('  ');
			  W.ActiveDocument.Range.InsertAfter(#10#13);
			  W.ActiveDocument.Range.InsertAfter(FAbitListDataSetInstance.FieldByName('Cname_fac').AsString);
			  MyRange:=W.ActiveDocument.Range(W.ActiveDocument.Range.End-3-
				length(FAbitListDataSetInstance.FieldByName('Cname_fac').AsString),W.ActiveDocument.Range.End-1);
			  MyRange.Font.Bold:=true;
			  MyRange.Font.Size:=15;
			  MyRange.ParagraphFormat.Alignment:=1;
			  fac:=FAbitListDataSetInstance.FieldByName('ik_fac').AsInteger;
			end;

			if spec<>FAbitListDataSetInstance.FieldByName('ik_spec_fac').AsInteger then
			begin
			  if spec>0 then
				table.Rows.Item(table.Rows.Count).Delete;
			  MyRange:=W.ActiveDocument.Range(W.ActiveDocument.Range.End-1,
										  W.ActiveDocument.Range.End-1);
			  W.ActiveDocument.Range.InsertAfter('  ');
			  W.ActiveDocument.Range.InsertAfter(#10#13);
			  str:='Специальность '+FAbitListDataSetInstance.FieldByName('Cshort_spec').AsString+
					' ('+FAbitListDataSetInstance.FieldByName('Sh_spec').AsString+')';
			  W.ActiveDocument.Range.InsertAfter(str);
			  MyRange:=W.ActiveDocument.Range(W.ActiveDocument.Range.End-2-
				length(str),W.ActiveDocument.Range.End-1);
			  MyRange.Font.Bold:=true;
			  MyRange.Font.Italic:=true;
			  MyRange.ParagraphFormat.Alignment:=1;
			  W.ActiveDocument.Range.InsertAfter(#10#13);
			  spec:=FAbitListDataSetInstance.FieldByName('ik_spec_fac').AsInteger;

			  //добавляем таблицу
			  MyRange:=W.ActiveDocument.Range(W.ActiveDocument.Range.End-1,
										  W.ActiveDocument.Range.End-1);
			  W.ActiveDocument.Tables.Add(Range:=MyRange,NumRows:=1,NumColumns:=4);
			  table:=W.ActiveDocument.Tables.Item(W.ActiveDocument.Tables.Count);
			  table.Columns.Item(1).Width:=1.2/SmInPoint;
			  table.Columns.Item(2).Width:=8.5/SmInPoint;
			  table.Columns.Item(3).Width:=5.25/SmInPoint;
			  table.Columns.Item(4).Width:=1.75/SmInPoint;
			  abitCount:=0;
			end;

			inc(abitCount);
			table.Rows.Add;
			table.cell(abitCount,1).Range.Text:=IntToStr(abitCount);
			table.cell(abitCount,2).Range.Text:=
			  FAbitListDataSetInstance.FieldByName('fio').AsString;
			table.cell(abitCount,3).Range.Text:=
			  FAbitListDataSetInstance.FieldByName('cname_kat_zach').AsString;
			table.cell(abitCount,4).Range.Text:=
			  FAbitListDataSetInstance.FieldByName('SummBall').AsString;
			FAbitListDataSetInstance.Next;
	  end;
	  if spec>0 then
			table.Rows.Item(table.Rows.Count).Delete;
	  W.Visible:=true;

  finally
	  //отменяем сортировку
    TADODataSet(FAbitListDataSetInstance).Sort:= sort;
    FAbitListDataSetInstance.EnableControls;
  end;

end;

//Экспорт приказа на зачисление по группам в Word
procedure TAbitZachislenieController.GroupPrikazToWord(grid: PDBGrid);
var W, MyRange, table:variant;
    str, sort:string;
    SmInPoint:real;
    abitCount:integer;
    fac,spec,grup:integer;
begin
  TApplicationController.GetInstance.AddLogEntry('Экспорт в Word приказа на зачисление по группам');

  FAbitListDataSetInstance.DisableControls;
  //отсортировать
  sort:= TADODataSet(FAbitListDataSetInstance).Sort;
  TADODataSet(FAbitListDataSetInstance).Sort:=
		  'Cname_fac, cname_spec,Cname_grup';
	try
		SmInPoint:=0.035;
	  W:=CreateOleObject('Word.Application');
	  str := ExtractFilePath(Application.ExeName)+'reports\Prikaz.dot';
	  W.Documents.add(str);
	  W.Visible:=false;
	  str:=DateToStr(Date);
	  str:=copy(str,1,length(str)-4);
	  str:=str+IntToStr(year);
	  TGeneralController.Instance.FindAndInsert(W,'#Дата#',str);
	  str:=IntToStr(year);
	  TGeneralController.Instance.FindAndInsert(W,'#Год#',str);

	  //начинаем цикл по выведению зачисленных в группы
	  FAbitListDataSetInstance.First;
	  //i:=1; //
	  fac:=0;
	  spec:=0;
	  grup:=0;
	  while not FAbitListDataSetInstance.Eof do
	  begin
		  if (FAbitListDataSetInstance.FieldByName('Ik_grup').AsString='') then
		  begin
		    FAbitListDataSetInstance.Next;
		    continue;
		  end;

			if (fac<>FAbitListDataSetInstance.FieldByName('ik_fac').AsInteger) and
			   (FAbitListDataSetInstance.FieldByName('Ik_grup').AsString<>'') then
			begin
			  MyRange:=W.ActiveDocument.Range(W.ActiveDocument.Range.End-1,
										  W.ActiveDocument.Range.End-1);
			  W.ActiveDocument.Range.InsertAfter('  ');
			  W.ActiveDocument.Range.InsertAfter(#10#13);
			  W.ActiveDocument.Range.InsertAfter(FAbitListDataSetInstance.FieldByName('Cname_fac').AsString);
			  MyRange:=W.ActiveDocument.Range(W.ActiveDocument.Range.End-3-
				length(FAbitListDataSetInstance.FieldByName('Cname_fac').AsString),W.ActiveDocument.Range.End-1);
			  MyRange.Font.Bold:=true;
			  MyRange.Font.Size:=15;
			  MyRange.ParagraphFormat.Alignment:=1;
			  fac:=FAbitListDataSetInstance.FieldByName('ik_fac').AsInteger;
			end;

			if (spec<>FAbitListDataSetInstance.FieldByName('ik_spec_fac').AsInteger)  and
			   (FAbitListDataSetInstance.FieldByName('Ik_grup').AsString<>'') then
			begin
			  MyRange:=W.ActiveDocument.Range(W.ActiveDocument.Range.End-1,
										  W.ActiveDocument.Range.End-1);
			  W.ActiveDocument.Range.InsertAfter('  ');
			  W.ActiveDocument.Range.InsertAfter(#10#13);
			  str:=FAbitListDataSetInstance.FieldByName('Cshort_spec').AsString+
					' ('+FAbitListDataSetInstance.FieldByName('Sh_spec').AsString+')';
			  W.ActiveDocument.Range.InsertAfter(str);
			  MyRange.Font.Bold:=true;
			  MyRange.Font.Size:=13;
			  MyRange.Font.Italic:=true;
			  MyRange.ParagraphFormat.Alignment:=1;
			  spec:=FAbitListDataSetInstance.FieldByName('ik_spec_fac').AsInteger;
			end;

			if (grup<>FAbitListDataSetInstance.FieldByName('Ik_grup').AsInteger)  and
			   (FAbitListDataSetInstance.FieldByName('Ik_grup').AsString<>'') then
			begin
			  if grup>0 then
				table.Rows.Item(table.Rows.Count).Delete;
			  MyRange:=W.ActiveDocument.Range(W.ActiveDocument.Range.End-1,
										  W.ActiveDocument.Range.End-1);
			  W.ActiveDocument.Range.InsertAfter('  ');
			  W.ActiveDocument.Range.InsertAfter(#10#13);
			  str:=FAbitListDataSetInstance.FieldByName('Cname_grup').AsString;
			  W.ActiveDocument.Range.InsertAfter(str);
			  MyRange:=W.ActiveDocument.Range(W.ActiveDocument.Range.End-2-
				length(str),W.ActiveDocument.Range.End-1);
			  MyRange.Font.Bold:=true;
			  MyRange.Font.Italic:=true;
			  MyRange.ParagraphFormat.Alignment:=1;
			  grup:=FAbitListDataSetInstance.FieldByName('ik_grup').AsInteger;

			  //добавляем таблицу
			  MyRange:=W.ActiveDocument.Range(W.ActiveDocument.Range.End-1,
										  W.ActiveDocument.Range.End-1);
			  W.ActiveDocument.Tables.Add(Range:=MyRange,NumRows:=1,NumColumns:=3);
			  table:=W.ActiveDocument.Tables.Item(W.ActiveDocument.Tables.Count);
			  table.Columns.Item(1).Width:=1.2/SmInPoint;
			  table.Columns.Item(2).Width:=10/SmInPoint;
			  table.Columns.Item(3).Width:=5.25/SmInPoint;
			  abitCount:=0;
			end;

			inc(abitCount);
			table.Rows.Add;
			table.cell(abitCount,1).Range.Text:=IntToStr(abitCount);
			table.cell(abitCount,2).Range.Text:=
			  FAbitListDataSetInstance.FieldByName('fio').AsString;
			table.cell(abitCount,3).Range.Text:=
			  FAbitListDataSetInstance.FieldByName('cname_kat_zach').AsString;
			FAbitListDataSetInstance.Next;
	  end;
	  if spec>0 then
			table.Rows.Item(table.Rows.Count).Delete;
	  W.Visible:=true;
	finally
	  TADODataSet(FAbitListDataSetInstance).Sort:= sort;
	  FAbitListDataSetInstance.EnableControls;
	end;

  end;

procedure TAbitZachislenieController.SetColor(i:integer; Color:TColor; Worksheet:Variant);
begin
 { Worksheet.Range['A'+IntToStr(i)+':G:'+IntToStr(i)].Interior.ColorIndex:=TColor;
  Worksheet.Range['A'+IntToStr(i)+':G:'+IntToStr(i)].Interior.Pattern:=Color;
  Worksheet.Range['A'+IntToStr(i)+':G:'+IntToStr(i)].Interior.PatternColorIndex:=xlAutomatic;
  }
end;

procedure TAbitZachislenieController.AbitsToExcel(flColor: boolean);
var
E : Variant;
I, ii : Integer;
//cell,fac_spec:string;
//XLApp: TExcelApplication;
begin
  TApplicationController.GetInstance.AddLogEntry('Экспорт в Excel списка абитуриентов.');

  E := CreateOleObject('Excel.Application');
  try
    E.Visible := false;
    E.WorkBooks.Add;
    E.Sheets[1].Select;
    E.DisplayAlerts:= false;
    FAbitListDataSetInstance.DisableControls;
    //R :=FAbitListDataSetInstance.RecordCount+1;
    //C :=7;
    i:= 3;
    E.Cells[i,1]:='№';
    E.Cells[i,2]:='ФИО';
    E.Cells[i,3]:='Факультет';
    E.Cells[i,4]:='Специальность';
    E.Cells[i,5]:='Состояние поступления';
    E.Cells[i,6]:='Категория зачисления';
    E.Cells[i,7]:='Ин. язык';
    E.Cells[i,8]:='Сумма баллов';

    E.Range['A1:H1'].Merge(true);
    E.range['A1:H1'].Font.Size:=16;
    E.range['A1:H1'].HorizontalAlignment:=-4108;

    FAbitListDataSetInstance.First;
    ii:=i;
    E.Cells[1,1]:='Факультет '+FAbitListDataSetInstance.FieldbyName('cshort_name_fac').AsString+', специальность '+
       FAbitListDataSetInstance.FieldbyName('Cname_spec').AsString;
    while not FAbitListDataSetInstance.Eof do
    begin
        inc(ii);
        E.Cells[ii,1]:=inttostr(ii-3);
        E.Cells[ii,2]:=FAbitListDataSetInstance.FieldbyName('fio').AsString;
        E.Cells[ii,3]:=FAbitListDataSetInstance.FieldbyName('cshort_name_fac').AsString;
        E.Cells[ii,4]:=FAbitListDataSetInstance.FieldbyName('Cshort_spec').AsString;
        E.Cells[ii,5]:=FAbitListDataSetInstance.FieldbyName('cname_zach').AsString;
        E.Cells[ii,6]:=FAbitListDataSetInstance.FieldbyName('cname_kat_zach').AsString;
        E.Cells[ii,7]:=FAbitListDataSetInstance.FieldbyName('Cname_lang').AsString;
        E.Cells[ii,8]:=FAbitListDataSetInstance.FieldbyName('SummBall').AsString;
      //отмечаем цветом "абитуриентов"
    //отмечаем всех проходящих
        if flColor then
        begin
          if (not IsAbit_HaveAllExam) then
            E.Range['A'+IntToStr(ii)+':H'+IntToStr(ii)].Interior.Color:=$00C6C6fa   //$00C6C6FF
          else
          begin
            if  TAbitZachislenieController.Instance.IsAbit_ProhodBall then
              E.Range['A'+IntToStr(ii)+':H'+IntToStr(ii)].Interior.Color:=$5300CD3f   //$007BDDBD
    //отмечаем всех непроходящих
            else
              E.Range['A'+IntToStr(ii)+':H'+IntToStr(ii)].Interior.Color:=$7763F5E3;   //$00C6C6FF
          end;
        end;

        FAbitListDataSetInstance.Next;
    end;
    E.Range['A'+IntToStr(i)+':H'+IntToStr(ii)].Borders.Weight:=2;
    E.Columns.AutoFit;
    E.Visible := True; // Показываем Excel
    FAbitListDataSetInstance.EnableControls;
    {if ii=0 then
      exit;}


    E.DisplayAlerts:= true;
  except
  on Ex:Exception do
  begin
    E.Quit;
    E:= UnAssigned;
    FAbitListDataSetInstance.EnableControls;
    raise EApplicationException.Create('Произошла ошибка при экспорте cписка в Excel!', Ex);
  end;
  end;
end;


function TAbitZachislenieController.AbitsWithPolozhOcenkiToExcel(grid: PDBGrid):boolean;
var
WorkBk : _WorkBook; //  определяем WorkBook
WorkSheet : _WorkSheet; //  определяем WorkSheet
I, R, C, ii : Integer;
TabGrid : Variant;
cell,fac_spec:string;
XLApp: TExcelApplication;
begin
  TApplicationController.GetInstance.AddLogEntry('Экспорт в Excel данных абитуриентов категории поступления бюджет и ЦКП.');

    R :=FAbitListDataSetInstance.RecordCount+1;

    C :=7;
    cell:='a3';
  try
    TabGrid := VarArrayCreate([0,(R-1),0,(C - 1)],VarOleStr);

    TabGrid[0,0]:='№';
    TabGrid[0,1]:='ФИО';
    TabGrid[0,2]:='Факультет';
    TabGrid[0,3]:='Специальность';
    TabGrid[0,4]:='Состояние поступления';
    TabGrid[0,5]:='Категория зачисления';
    TabGrid[0,6]:='Сумма баллов';
    FAbitListDataSetInstance.DisableControls;
    FAbitListDataSetInstance.First;
    ii:=0;
    fac_spec:='Факультет '+FAbitListDataSetInstance.FieldbyName('cshort_name_fac').AsString+', специальность '+
       FAbitListDataSetInstance.FieldbyName('Cname_spec').AsString;
    for i:=1 to r-1 do
      begin
      if (FAbitListDataSetInstance.FieldbyName('ik_type_kat').value<>3)
        and (IsAbit_HaveAllExam) then
        begin
        ii:=ii+1;
        TabGrid[ii,0]:=inttostr(ii);
        TabGrid[ii,1]:=FAbitListDataSetInstance.FieldbyName('fio').AsString;
        TabGrid[ii,2]:=FAbitListDataSetInstance.FieldbyName('cshort_name_fac').AsString;
        TabGrid[ii,3]:=FAbitListDataSetInstance.FieldbyName('Cshort_spec').AsString;
        TabGrid[ii,4]:=FAbitListDataSetInstance.FieldbyName('cname_zach').AsString;
        TabGrid[ii,5]:=FAbitListDataSetInstance.FieldbyName('cname_kat_zach').AsString;
        TabGrid[ii,6]:=FAbitListDataSetInstance.FieldbyName('SummBall').AsString;
        end;
      FAbitListDataSetInstance.Next;
      end;

    if ii=0 then
    begin
      result:=false;
      exit;
    end;

    ii:=ii+3;

    XLApp:= TExcelApplication.Create(nil);
    XLApp.Connect; // Соединяемся с сервером TExcelApplication
    XLApp.WorkBooks.Add(xlWBatWorkSheet,0);  // Добавляем WorkBooks в ExcelApplication
    WorkBk := XLApp.WorkBooks.Item[XLApp.WorkBooks.Count];  // Выбираем последнюю (добавленную) WorkBook
    WorkSheet := WorkBk.WorkSheets.Get_Item(1) as _WorkSheet; // Определяем первый WorkSheet

    Worksheet.Range[cell,Worksheet.Cells.Item[ii,C]].Formula := TabGrid; // Сопоставляем Delphi массив-матрицу с матрицей в WorkSheet

    WorkSheet.Name := 'Отчет'; // Заполняем свойства WorkSheet
    WorkSheet.Columns.AutoFit;

    //Worksheet.Range['a2',Worksheet.cells.item[1,2]].font.size:=16;
    Worksheet.cells.item[1,2].font.size:=16;
    Worksheet.cells.item[1,2]:=fac_spec;

    //заливка цветом нулевой строки и столбца
    Worksheet.Range[cell,Worksheet.Cells.Item[3,C]].Interior.ColorIndex:=15;
    Worksheet.Range[cell,Worksheet.Cells.Item[3,C]].Interior.Pattern:=xlSolid;
    Worksheet.Range[cell,Worksheet.Cells.Item[3,C]].Interior.PatternColorIndex:=xlAutomatic;

    Worksheet.Range[cell,Worksheet.Cells.Item[ii,1]].Interior.ColorIndex:=15;
    Worksheet.Range[cell,Worksheet.Cells.Item[ii,1]].Interior.Pattern:=xlSolid;
    Worksheet.Range[cell,Worksheet.Cells.Item[ii,1]].Interior.PatternColorIndex:=xlAutomatic;

    //установить внутренние и внешние границы диапозона
    Worksheet.Range[cell,Worksheet.Cells.Item[ii,1]].Borders[xlDiagonalDown].LineStyle:=xlNone;
    Worksheet.Range[cell,Worksheet.Cells.Item[ii,1]].Borders[xlDiagonalUp].LineStyle:=xlNone;

    Worksheet.Range[cell,Worksheet.Cells.Item[ii,C]].Borders[xlEdgeLeft].LineStyle:=xlContinuous;
    Worksheet.Range[cell,Worksheet.Cells.Item[ii,C]].Borders[xlEdgeLeft].Weight:=xlThin;
    Worksheet.Range[cell,Worksheet.Cells.Item[ii,C]].Borders[xlEdgeLeft].ColorIndex:=xlAutomatic;

    Worksheet.Range[cell,Worksheet.Cells.Item[ii,C]].Borders[xlEdgeTop].LineStyle:=xlContinuous;
    Worksheet.Range[cell,Worksheet.Cells.Item[ii,C]].Borders[xlEdgeTop].Weight:=xlThin;
    Worksheet.Range[cell,Worksheet.Cells.Item[ii,C]].Borders[xlEdgeTop].ColorIndex:=xlAutomatic;

    Worksheet.Range[cell,Worksheet.Cells.Item[ii,C]].Borders[xlEdgeBottom].LineStyle:=xlContinuous;
    Worksheet.Range[cell,Worksheet.Cells.Item[ii,C]].Borders[xlEdgeBottom].Weight:=xlThin;
    Worksheet.Range[cell,Worksheet.Cells.Item[ii,C]].Borders[xlEdgeBottom].ColorIndex:=xlAutomatic;

    Worksheet.Range[cell,Worksheet.Cells.Item[ii,C]].Borders[xlEdgeRight].LineStyle:=xlContinuous;
    Worksheet.Range[cell,Worksheet.Cells.Item[ii,C]].Borders[xlEdgeRight].Weight:=xlThin;
    Worksheet.Range[cell,Worksheet.Cells.Item[ii,C]].Borders[xlEdgeRight].ColorIndex:=xlAutomatic;

    Worksheet.Range[cell,Worksheet.Cells.Item[ii,C]].Borders[xlInsideVertical].LineStyle:=xlContinuous;
    Worksheet.Range[cell,Worksheet.Cells.Item[ii,C]].Borders[xlInsideVertical].Weight:=xlThin;
    Worksheet.Range[cell,Worksheet.Cells.Item[ii,C]].Borders[xlInsideVertical].ColorIndex:=xlAutomatic;

    Worksheet.Range[cell,Worksheet.Cells.Item[ii,C]].Borders[xlInsideHorizontal].LineStyle:=xlContinuous;
    Worksheet.Range[cell,Worksheet.Cells.Item[ii,C]].Borders[xlInsideHorizontal].Weight:=xlThin;
    Worksheet.Range[cell,Worksheet.Cells.Item[ii,C]].Borders[xlInsideHorizontal].ColorIndex:=xlAutomatic;
    FAbitListDataSetInstance.EnableControls;
    //Worksheet.PageSetup.LeftFooter:='&5' + TApplicationController.GetInstance.DocumentFooter;
    XLApp.Visible[0] := True; // Показываем Excel
    TabGrid := Unassigned; // Unassign the Delphi Variant Matrix
    result:= true;
  except
    FAbitListDataSetInstance.EnableControls;
    result:= false;
    {if grid.SelectedRows.Count>0 then
        FAbitListDataSetInstance.GotoBookmark(Pointer(grid.SelectedRows[0]))
    else
        FAbitListDataSetInstance.First;}
    //XLApp.Free;
  end;
end;

//экспорт протокола о зачислении в Excel
procedure TAbitZachislenieController.ExportProtokolToExcel;
const l=6;            //кол-во строк заголовка
      m=11;           //кол-во абитуриентов на 1 странице
      exEnd='E';
var
  E: Variant;
  pagecount, spec :integer;
  path, sort:string;
  i,j, abitcount :integer;
begin
  TApplicationController.GetInstance.AddLogEntry('Экспорт протокола зачисления в Excel');

  try
    E:= CreateOleObject('Excel.Application');
    try
	    path := ExtractFilePath(Application.ExeName)+'reports\AbitProtocol.XLT';
	    E.WorkBooks.Add(path);
      E.DisplayAlerts:=false;
      FAbitListDataSetInstance.DisableControls;
      //отсортировать
      sort:= TADODataSet(FAbitListDataSetInstance).Sort;
      TADODataSet(FAbitListDataSetInstance).Sort:='Cname_fac, cname_spec';
      spec:= -1;
      abitcount:=1;
      i:= l+1;
      //FAbitListDataSetInstance.FieldByName('').AsString
      try
        FAbitListDataSetInstance.First;
        try
        pagecount:=2;
        while true do
        begin
          if (spec<>FAbitListDataSetInstance.FieldByName('ik_spec_fac').Value) or
              (FAbitListDataSetInstance.Eof) then
          begin
            //перенастраиваем старую специальность
            if spec > -1 then
            begin
              dec(i);
              j:= ((abitcount-1) mod m);
              if j>0 then
              begin
                E.range['A'+IntToStr(i-j)+':'+exEnd+IntToStr(i)].Borders.Weight:=2;
                E.Range['A'+IntToStr(i-j)+':'+exEnd+IntToStr(i)].RowHeight:=54;
              end;

            end;
            if FAbitListDataSetInstance.Eof then
               break;
            //добавляем страницу и настраиваем
            E.sheets.Add(after:=E.sheets.item[pagecount-1]);
						E.Sheets[1].Range['A1:'+exEnd+inttoStr(50)].EntireColumn.Copy(EmptyParam); // поместим в БО
						E.Sheets[pagecount].Paste(E.Sheets.item[pagecount].Range['A1:'+exEnd+inttoStr(50), EmptyParam], EmptyParam);
						E.Sheets[1].Range['A1:'+exEnd+inttoStr(50)].EntireRow.Copy(EmptyParam); // поместим в БО
						E.Sheets[pagecount].Paste(E.Sheets.item[pagecount].Range['A1:'+exEnd+inttoStr(50), EmptyParam], EmptyParam);
            E.Sheets[pagecount].PageSetup.LeftMargin:=E.Sheets[1].PageSetup.LeftMargin;
            E.Sheets[pagecount].PageSetup.RightMargin:=E.Sheets[1].PageSetup.RightMargin;
            E.Sheets[pagecount].PageSetup.TopMargin:=E.Sheets[1].PageSetup.TopMargin;
            E.Sheets[pagecount].PageSetup.BottomMargin:=E.Sheets[1].PageSetup.BottomMargin;
            E.Sheets[pagecount].PageSetup.Orientation:=E.Sheets[1].PageSetup.Orientation;

            if  (FAbitListDataSetInstance.FieldByName('ik_direction').Value<>2) then
              E.Sheets[pagecount].name:= FAbitListDataSetInstance.FieldByName('Cshort_name_fac').AsString+' '+
                FAbitListDataSetInstance.FieldByName('Cshort_spec').AsString +
                FAbitListDataSetInstance.FieldByName('ik_direction').AsString
            else
              E.Sheets[pagecount].name:= FAbitListDataSetInstance.FieldByName('Cshort_name_fac').AsString+' '+
                FAbitListDataSetInstance.FieldByName('Cshort_spec').AsString ;
            E.Sheets[pagecount].Select;
            spec:=FAbitListDataSetInstance.FieldByName('ik_spec_fac').Value;
            i:= l+1;
            inc(pagecount);
            abitcount:=1;
          end;
          //добавляем заголовок
          if (abitcount>1) and (((abitcount-1) mod m)=0) then
          begin                  // +exEnd+inttoStr(l)
				 		E.Sheets[1].Range['A1:'+exEnd+inttoStr(l)].EntireRow.Copy(EmptyParam); // поместим в БО
						E.Sheets[pagecount-1].Paste(E.Sheets[pagecount-1].Range['A'+inttoStr(i)+':'+exEnd+inttoStr(i+l-1), EmptyParam], EmptyParam);
            dec(i);
            E.range['A'+IntToStr(i-m)+':'+exEnd+IntToStr(i)].Borders.Weight:=2;
            E.Range['A'+IntToStr(i-m)+':'+exEnd+IntToStr(i)].RowHeight:=54;
            i:=i+l+1;
          end;

          j:=1;
          E.cells[i,j]:=abitcount; inc(j);
          E.cells[i,j]:=FAbitListDataSetInstance.FieldByName('fio').AsString; inc(j);
          E.cells[i,j]:=FAbitListDataSetInstance.FieldByName('RegNomer').AsString; inc(j);
          E.cells[i,j]:=FAbitListDataSetInstance.FieldByName('cName_zaved').AsString; inc(j);
          E.cells[i,j]:='    Зачислить'; inc(j);
          FAbitListDataSetInstance.Next;
          inc(i);     inc(abitcount);
        end;

        except
        on ex:Exception do
        begin
            E.Quit;
            raise EApplicationException.Create('Ошибка при экспорте в Excel', Ex);
        end;
        end;


        if abitcount>1 then
        begin
          E.Sheets[1].Delete;
          E.Sheets[1].Select;
          //E.Sheets[1].PageSetup.LeftFooter:='&5' + TApplicationController.GetInstance.DocumentFooter;
          E.Visible := true;
        end
        else
        begin
          E.Quit;
          raise EApplicationException.Create('Нет зачисленных абитуриентов');
        end;
      finally
        E:= UnAssigned;
      end;
    except
    end;
    finally
      FAbitListDataSetInstance.EnableControls;
    end;
end;


procedure TAbitZachislenieController.AddAllProhBalls(NNyear, ik_fac, ik_spec_fac: Variant);
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TADOStoredProc.Create(nil);
  try
    tempStoredProc.ProcedureName:= 'ABIT_Add_AllProhBalls;1';
    tempStoredProc.Connection:= dm.DBConnect;
    tempStoredProc.Parameters.CreateParameter('@newNNyear', ftInteger, pdInput, 0, NNyear);
    tempStoredProc.Parameters.CreateParameter('@ik_fac', ftInteger, pdInput, 0, ik_fac);
    tempStoredProc.Parameters.CreateParameter('@ik_spec_fac', ftInteger, pdInput, 0, ik_spec_fac);
    tempStoredProc.ExecProc;
  finally
    tempStoredProc.Free;
  end;

end;

end.
