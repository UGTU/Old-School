{-----------------------------------------------------------
  Модуль AbitZachislenieController:
      TAbitZachislenieController - контроллер подсистемы
      "Абитуриент" зачисление абитуриентов
  Дата создания: 29.03.2008
  Дата последнего изменения:
  Разработчик: Вокуева Т.А.
-----------------------------------------------------------}
unit uAbitNaborController;
 {#Author tanyav@ist.ugtu.net}
interface
uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, ADODB, DB, uDM,
  Forms, Dialogs, DBLookupEh, Variants, StdCtrls, GeneralController, Grids,
  ExcelXP, ComObj, DBGrids, uDMAbiturientRasp, uDMAbiturientNabor,
  DBGridEh, ApplicationController, ExceptionBase;

type
  PDBGrid = ^TDBGridEh;
  TAbitNaborController = class (TObject)
  protected
    constructor CreateInstance;
 //AccessInstance предоставляет доступ к экземпляру контроллера
    class function AccessInstance(Request: Integer):
       TAbitNaborController;

  public
    constructor Create;
  //Instance - возвращает экзепляр данного контроллера
    class function Instance: TAbitNaborController;
  //ReleaseInstance - уничтожает контроллер
    class procedure ReleaseInstance;

    //**********САМ КОНТРОЛЛЕР****************
  //GetNabor загружает данные наборов
  function GetNabor(SourceDataSet: PDataSet; nnyear:integer): Variant;
  //AddNabor добавление набора
  function AddNabor(ik_spec_fac,BeginDiapazon,EndDiapazon,NNYear,MestCKP,MestBudjet,MestKontrakt:integer;lRussian:boolean): integer;
  //EditNabor редактирует набор
  procedure EditNabor(ik_spec_fac,BeginDiapazon,EndDiapazon,NNYear,MestCKP,MestBudjet,MestKontrakt:integer;NNrecord:integer;lRussian:boolean);
  //DelNabor Удаляет набор
  procedure DelNabor(NNrecord:integer);
  //ImportNabor импортирует плановые наборы из подсистемы "Нагрузка"
  procedure ImportNabor(NNYear:integer);


  //**************загрузка статистики по набору******************
  //Выбирает статистику по наборам для объекта objectType:
  //1 - весь год, 2 - факультет, 3 - специальность
  //objectID - код соответствующего объекта
  procedure GetNaborStatistik(objectType, objectID, NNyear: integer);

end;

implementation
var
//FAbitNaborControllerInstance - экземпляр контроллера
  FAbitNaborControllerInstance: TAbitNaborController = nil;

constructor TAbitNaborController.CreateInstance;
begin
  inherited Create;
end;


constructor TAbitNaborController.Create;
begin
  inherited Create;
  raise EApplicationException.Create('Доступ к классу %s можно получить только через поле Instance!');
end;


class function TAbitNaborController.AccessInstance(
  Request: Integer): TAbitNaborController;
begin
  case Request of
    0 : ;
    1 : if not Assigned(FAbitNaborControllerInstance) then
      FAbitNaborControllerInstance:= CreateInstance;
    2 : if FAbitNaborControllerInstance <> nil then
          begin
            FAbitNaborControllerInstance.Free;
            FAbitNaborControllerInstance:= nil;
          end;
    else raise EApplicationException.Create('Ошибка в программе!',Exception.CreateFmt('Неизвестное значение параметра %d в методе AccessInstance контроллера AbitZachislenieController', [Request]));
  end;  Result := FAbitNaborControllerInstance;
end;


class function TAbitNaborController.Instance: TAbitNaborController;
begin
  Result := AccessInstance(1);
end;

class procedure TAbitNaborController.ReleaseInstance;
begin
   AccessInstance(2);
end;

//*********ТЕЛО КОНТРОЛЛЕРА**********
//загружает данные наборов
function TAbitNaborController.GetNabor(SourceDataSet: PDataSet; nnyear:integer): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'exec dbo.ABIT_nabor_Get '+IntToStr(nnyear), 'NNrecord', false, NULL);
end;

procedure TAbitNaborController.GetNaborStatistik(objectType, objectID,
  NNyear: integer);
begin
  TApplicationController.GetInstance.AddLogEntry('Наборы. Загрузка статистики поступления.');

  with DMAbiturientNabor.adospAbitNaborStatistik do
  begin
    Close;
    with Parameters do
    begin
      Clear;
      CreateParameter('@objectType',ftBCD,pdInput,0,objectType);
      CreateParameter('@objectID',ftBCD,pdInput,0,objectID);
      CreateParameter('@NNyear',ftBCD,pdInput,0,NNyear);
    end;
    Open;
  end;
end;

//добавление набора
function TAbitNaborController.AddNabor(ik_spec_fac,BeginDiapazon,EndDiapazon,NNYear,MestCKP,MestBudjet,MestKontrakt:integer;lRussian:boolean): integer;
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TADOStoredProc.Create(nil);
  try
    tempStoredProc.Connection:= dm.DBConnect;
    tempStoredProc.ProcedureName:= 'ABIT_Add_Diapazon;1';
    tempStoredProc.Active:=false;
    tempStoredProc.Parameters.Clear;
    //LockType:=ltBatchOptimistic;
    tempStoredProc.Parameters.CreateParameter('@ik_spec_fac',ftBCD,pdInput,0,ik_spec_fac);
    tempStoredProc.Parameters.CreateParameter('@BeginDiapazon',ftBCD,pdInput,0,BeginDiapazon);
    tempStoredProc.Parameters.CreateParameter('@EndDiapazon',ftBCD,pdInput,0,EndDiapazon);
    tempStoredProc.Parameters.CreateParameter('@NNYear',ftBCD,pdInput,0,NNYear);
    tempStoredProc.Parameters.CreateParameter('@MestCKP',ftBCD,pdInput,0,MestCKP);
    tempStoredProc.Parameters.CreateParameter('@MestBudjet',ftBCD,pdInput,0,MestBudjet);
    tempStoredProc.Parameters.CreateParameter('@MestKontrakt',ftBCD,pdInput,0,MestKontrakt);
    tempStoredProc.Parameters.CreateParameter('@lRussian',ftBCD,pdInput,0,lRussian);
    tempStoredProc.Parameters.CreateParameter('@NNrecord',ftInteger,pdOutput,0,0);
    tempStoredProc.ExecProc;
    Result := tempStoredProc.Parameters.ParamByName('@NNrecord').Value;
  finally
    tempStoredProc.Free;
  end;
end;

//редактирует набор
procedure TAbitNaborController.EditNabor(ik_spec_fac,BeginDiapazon,EndDiapazon,NNYear,MestCKP,MestBudjet,MestKontrakt:integer;NNrecord:integer;lRussian:boolean);
var
  tempStoredProc: TADOStoredProc;
begin

  tempStoredProc:= TADOStoredProc.Create(nil);
  try
    //LockType:=ltBatchOptimistic;
    with tempStoredProc do
    begin
      Connection:= dm.DBConnect;
      ProcedureName:= 'ABIT_Edit_Diapazon;1';
      Active:=false;
      Parameters.Clear;
			Parameters.CreateParameter('@ik_spec_fac',ftBCD,pdInput,0,ik_spec_fac);
			Parameters.CreateParameter('@BeginDiapazon',ftBCD,pdInput,0,BeginDiapazon);
			Parameters.CreateParameter('@EndDiapazon',ftBCD,pdInput,0,EndDiapazon);
			Parameters.CreateParameter('@NNYear',ftBCD,pdInput,0,NNYear);
			Parameters.CreateParameter('@MestCKP',ftBCD,pdInput,0,MestCKP);
			Parameters.CreateParameter('@MestBudjet',ftBCD,pdInput,0,MestBudjet);
			Parameters.CreateParameter('@MestKontrakt',ftBCD,pdInput,0,MestKontrakt);
			Parameters.CreateParameter('@nnrecord',ftBCD,pdInput,0,nnrecord);
      tempStoredProc.Parameters.CreateParameter('@lRussian',ftBCD,pdInput,0,lRussian);
      ExecProc;
    end;
  finally
    tempStoredProc.Free;
  end;

end;

//Удаляет набор
procedure TAbitNaborController.DelNabor(NNrecord:integer);
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TADOStoredProc.Create(nil);
  try
    tempStoredProc.Connection:= dm.DBConnect;
    tempStoredProc.ProcedureName:= 'ABIT_Del_Diapazon;1';
    tempStoredProc.Parameters.CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 4, NULL);
    tempStoredProc.Parameters.CreateParameter('@nnrecord',ftBCD,pdInput,0,nnrecord);
    tempStoredProc.ExecProc;
  finally
    tempStoredProc.Free;
  end;


end;

//импортирует плановые наборы из подсистемы "Нагрузка"
procedure TAbitNaborController.ImportNabor(NNYear:integer);
var
  tempStoredProc: TADOStoredProc;
begin
  TApplicationController.GetInstance.AddLogEntry('Наборы. Импорт плановых наборов из подсистемы "Нагрузка".');

  tempStoredProc:= TADOStoredProc.Create(nil);
  try
    tempStoredProc.Connection:= dm.DBConnect;
    tempStoredProc.ProcedureName:= 'ABIT_ImportPlanNaborFromNagr;1';
    tempStoredProc.Parameters.CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 4, NULL);
    tempStoredProc.Parameters.CreateParameter('@NNYear',ftBCD,pdInput,0,NNYear);
    tempStoredProc.ExecProc;
  finally
    tempStoredProc.Free;
  end;


end;


end.
