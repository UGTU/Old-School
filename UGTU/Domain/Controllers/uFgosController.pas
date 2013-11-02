{-----------------------------------------------------------
  Модуль uFgosController:
      uFgosController - контроллер подсистемы
      "Деканат" - ФГОС
  Разработчик: Шелыгина И.В.
-----------------------------------------------------------}

unit uFgosController;

interface

uses
SysUtils, Windows, Messages, Classes, Graphics, Controls, ADODB, DB, uDM, ComCtrls,
Forms, Dialogs, StdCtrls, GeneralController, DBLookupEh, Variants, ExcelXP, ComObj,
ExceptionBase, uDMFgos;

type
TFgosController = class (TObject)
private
    FMessageHandle: HWND;
protected
    constructor CreateInstance;
    constructor Create;
public

 //Instance - возвращает экзепляр данного контроллера
    class function Instance: TFgosController;

  //ReleaseInstance - уничтожает контроллер
    class procedure ReleaseInstance;

    // getFgosBySpec - загружает ФГОС для специальности
    function getFgosBySpec (SpecIK: Integer): TDataSet;

    //загружает компетенции код компеетнций, закрепленных за дисциплиной учебного плана
    function getCompetenceForDiscUchPlan(IKDiscUchPlan, IKUchPlan, IDGos: Integer): TDataSet;

    //загружает дисциплины, которые выступают опорой для IKDiscUchPlan
    function getDiscMainStayFor(IKDiscUchPlan: Integer): TDataSet;

     //загружает дисциплины, на которые опирается  IKDiscUchPlan
    function getDiscBasedOn(IKDiscUchPlan: Integer): TDataSet;

    //getFgosBySpecYearNum - загружает фгос по специальности, году и номеру
    function getFgosBySpecYearNum(SpecIK, YearIK, Num: Integer): TDataSet;

    // getCompetenceSpec - загружает компетенции по типу для специальности
    function getCompetenceSpec (SpecIK, TypeCompetenceIK, FgosIK: Integer): TDataSet;

   // getAllSpecializations - загружает все специализации дял выбранной специальности
    function getAllSpecializations(SourceDataSet: PDataSet; SpecIK: integer;
    isShowFirst: boolean): Variant;

   // getTypeCompetence - загружает все типы компетенций
   function getTypeCompetence(SourceDataSet: PDataSet;isShowFirst: boolean): Variant;

   // getLevel_competence - загружает все составляющие компетенций (знать, уметь, владеть)
   function getLevel_competence(SourceDataSet: PDataSet; isShowFirst: boolean): Variant;

   // getType_level_sformyr - загружает все типы уровней сформированности комп (пороговый, повышенный)
   function getType_level_sformyr(SourceDataSet: PDataSet; isShowFirst: boolean): Variant;

   // getDisciplines - загружает все дисциплины
   function getDisciplines(SourceDataSet: PDataSet;isShowFirst: boolean): Variant;

  {SaveFgos сохраняет ФГОС
  OperationType - тип операции: 1-вставка, 2 - обновление }
    function SaveFgos(OperationType: byte; var FgosIK,
    SpecIK, YearIK, NumFgos, Znach_ZE_IK, hWeekAllLes, hWeekAuditorLess,
      MinHolidayWeek , MaxHolidayWeek, WinterHolidayWeek: integer;
     DateFgos: TDateTime): Boolean;

    
   // SaveFgosException - сохраняет исключение по ЗЕ для текущего ФГОС
   function SaveFgosException(OperationType: byte; var FgosIK: integer; Znach_ZE_IK,
    DiscplIK,ExceptionIK: integer): Boolean;

  //DeleteFgos удаляет ФГОС
  function  DeleteFgos(FgosIK: integer):Boolean;

    //DeleteFgos удаляет исключения для текущего ФГОС
    function DeleteFgosException(ExceptionIK: integer):Boolean;

    //SaveCompetence  сохраняет компетенции для текущего ФГОС

    function SaveCompetence (OperationType: byte; ZnachCompetence, ShName: String; IKTypeCompetence,
    IDGos,IKCompetence:integer): Boolean;
     //DeleteCompetence удаляет компетенции из таблиц Competence и Spec_competence
    function  DeleteCompetence(IKCompetence,IKSpecCompetence:integer): Boolean;

    // SaveStructureCompetence  сохраняет структуру компетенции (знать, уметь, владеть)
    function  SaveStructureCompetence (OperationType: byte; DescriptionContent: string;
    IKStructureCompetence,IKCompetence, IKLevelCompetence: Integer): Boolean;
     //DeleteStructureCompetence удаляет структуру компетенции
    function  DeleteStructureCompetence (IKStructureCompetence:integer): Boolean;

    //  SaveLevelSformyr сохраняет  сформированность компетенции
    function SaveLevelSformyr (OperationType: byte; Value_priznak: string; IKLevelSformyr,
IKCompetence, IKTypeLevelSformyr, IKLevelCompetence: Integer): Boolean;
    //DeleteLevelSformyr удаляет сформированность компетенции
     function  DeleteLevelSformyr (IKLevelSformyr:integer): Boolean;
    //GetExceptionByFgos загружает исключения по ФГОСу
    function GetExceptionByFgos( FgosIK: integer): TDataSet;

    function GetAllAboutFgos(FgosIK:integer): TDataSet;
    //загрузка данных для заполнения титульников приложений
    function GetDataTitle (FgosIK: integer): TDataSet;

  // MessageHandle - Handle для выдачи сообщений
    property MessageHandle: HWND read FMessageHandle write FMessageHandle;

    

end;

implementation


uses uWaitingController;

var
FFgosInstance: TFgosController = nil;

constructor TFgosController.CreateInstance;
begin
  if (dmFgos=nil) then dmFGos := TdmFgos.Create(nil);
  
  inherited Create;
end;

constructor TFgosController.Create;
begin
  inherited Create;
  raise EApplicationException.Create('Ошибка в программе!',Exception.CreateFmt('Доступ к классу %s можно получить только через поле Instance!', [ClassName]));
end;

class function TFgosController.Instance: TFgosController;
begin
  if not Assigned(FFgosInstance) then
      FFgosInstance:= CreateInstance;
end;

class procedure TFgosController.ReleaseInstance;
begin
   if FFgosInstance <> nil then
          begin
            FFgosInstance.Free;
            FFgosInstance:= nil;
          end;
end;

function TFgosController.getFgosBySpec(SpecIK: Integer): TDataSet;
begin
if (dmFgos.aspGetFgosBySpec.Active) then dmFgos.aspGetFgosBySpec.Close;
dmFgos.aspGetFgosBySpec.Parameters.ParamByName('@ik_spec').Value:= SpecIK;
dmFgos.aspGetFgosBySpec.Open;
Result:=dmFgos.aspGetFgosBySpec;
end;

function TFgosController.getDiscBasedOn(IKDiscUchPlan: Integer): TDataSet;
begin
if (dmFgos.aspGetDiscBasedOn.Active) then dmFgos.aspGetDiscBasedOn.Close;
dmFgos.aspGetDiscBasedOn.Parameters.ParamByName('@ik_disc_uch_plan').Value:= IKDiscUchPlan;
dmFgos.aspGetDiscBasedOn.Open;
Result:=dmFgos.aspGetDiscBasedOn;
Result.RecordCount;
end;

function TFgosController.getDiscMainStayFor(IKDiscUchPlan: Integer): TDataSet;
begin
if (dmFgos.aspGetDiscMainStayFor.Active) then dmFgos.aspGetDiscMainStayFor.Close;
dmFgos.aspGetDiscMainStayFor.Parameters.ParamByName('@ik_disc_uch_plan').Value:= IKDiscUchPlan;
dmFgos.aspGetDiscMainStayFor.Open;
Result:=dmFgos.aspGetDiscMainStayFor;
end;

function TFgosController.getCompetenceForDiscUchPlan(IKDiscUchPlan, IKUchPlan, IDGos: Integer): TDataSet;
begin
if (dmFgos.aspGetCompForDicsUchPlan.Active) then dmFgos.aspGetCompForDicsUchPlan.Close;
dmFgos.aspGetCompForDicsUchPlan.Parameters.ParamByName('@ik_disc_uch_plan').Value:= IKDiscUchPlan;
dmFgos.aspGetCompForDicsUchPlan.Parameters.ParamByName('@ik_uch_plan').Value:= IKUchPlan;
dmFgos.aspGetCompForDicsUchPlan.Parameters.ParamByName('@IDGos').Value:= IDGos;
dmFgos.aspGetCompForDicsUchPlan.Open;
Result:=dmFgos.aspGetCompForDicsUchPlan;
end;



function TFgosController.getFgosBySpecYearNum(SpecIK, YearIK, Num: Integer): TDataSet;
begin
if (dmFgos.aspGetFgosSpecYearNum.Active) then dmFgos.aspGetFgosSpecYearNum.Close;
dmFgos.aspGetFgosSpecYearNum.Parameters.ParamByName('@ik_spec').Value:= SpecIK;
dmFgos.aspGetFgosSpecYearNum.Parameters.ParamByName('@year').Value:= YearIK;
dmFgos.aspGetFgosSpecYearNum.Parameters.ParamByName('@num').Value:= Num;
dmFgos.aspGetFgosSpecYearNum.Open;
Result:=dmFgos.aspGetFgosSpecYearNum;
end;

function TFgosController.getCompetenceSpec (SpecIK, TypeCompetenceIK, FgosIK: Integer): TDataSet;
begin
{if (dmFgos.aspGetCompetence.Active) then dmFgos.aspGetCompetence.Close;
dmFgos.aspGetCompetence.Parameters.ParamByName('@ik_spec').Value:= SpecIK;
dmFgos.aspGetCompetence.Parameters.ParamByName('@ik_type_competence').Value:= TypeCompetenceIK;
dmFgos.aspGetCompetence.Parameters.ParamByName('@IDGos').Value:= FgosIK;
dmFgos.aspGetCompetence.Open;
Result:=dmFgos.aspGetCompetence;   }
end;

function TFgosController.GetExceptionByFgos(FgosIK: integer): TDataSet;
begin
if (dmFgos.aspGetFgosException.Active) then dmFgos.aspGetFgosException.Close;
dmFgos.aspGetFgosException.Parameters.ParamByName('@IDGos').Value:= FgosIK;
dmFgos.aspGetFgosException.Open;
Result:=dmFgos.aspGetFgosException;
end;

function TFgosController.GetAllAboutFgos(FgosIK: integer): TDataSet;
begin
if (dmFgos.aspGetAllAboutFgos.Active) then dmFgos.aspGetAllAboutFgos.Close;
dmFgos.aspGetAllAboutFgos.Parameters.ParamByName('@IDGos').Value:= FgosIK;
dmFgos.aspGetAllAboutFgos.Open;
Result:=dmFgos.aspGetAllAboutFgos;
end;


function TFgosController.GetDataTitle (FgosIK: integer): TDataSet;
begin
if (dmFgos.aspGetDataTitle.Active) then dmFgos.aspGetDataTitle.Close;
dmFgos.aspGetDataTitle.Parameters.ParamByName('@IDGos').Value:= FgosIK;
//dmFgos.aspGetDataTitle.Parameters.ParamByName('@IK_spec').Value:= IK_spec;
dmFgos.aspGetDataTitle.Open;
Result:=dmFgos.aspGetDataTitle;
end;

function TFgosController.getAllSpecializations(SourceDataSet: PDataSet;
        SpecIK: integer; isShowFirst: boolean): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet,
   'Select * From spclz Where ik_spec = ' + IntToStr(SpecIK) + ' Order By cName_spclz',
   'ik_spclz', isShowFirst, NULL);
end;

function TFgosController.getTypeCompetence(SourceDataSet: PDataSet; isShowFirst: boolean): Variant;
begin
Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select * From Type_competence',
 'ik_type_competence', isShowFirst, NULL);
end;

function TFgosController.getLevel_competence(SourceDataSet: PDataSet; isShowFirst: boolean): Variant;
begin
Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select * From Level_competence',
 'ik_level_competence', isShowFirst, NULL);
end;

function TFgosController.getType_level_sformyr(SourceDataSet: PDataSet; isShowFirst: boolean): Variant;
begin
Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select * From Type_level_sformyr',
 'ik_type_level_sformyr', isShowFirst, NULL);
end;


function TFgosController.getDisciplines(SourceDataSet: PDataSet;isShowFirst: boolean): Variant;
begin
Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'Select * From discpln Order By cName_disc',
 'iK_disc', isShowFirst, NULL);
end;



function TFgosController.SaveFgosException(OperationType: byte; var FgosIK: integer;
 Znach_ZE_IK, DiscplIK,ExceptionIK: integer): Boolean;
var
  DataSet: TCustomADODataSet;
begin
DataSet:= TADOStoredProc.Create(nil);
DataSet.Connection:= dm.DBConnect;
(DataSet as TADOStoredProc).ProcedureName:= 'UpdateFgosException';
(DataSet as TADOStoredProc).Parameters.CreateParameter('@i_type', ftWord, pdInput,  0, OperationType);
(DataSet as TADOStoredProc).Parameters.CreateParameter('@ik_exception_fgos', ftInteger, pdInput,  0, ExceptionIK);
(DataSet as TADOStoredProc).Parameters.CreateParameter('@ik_znach_ZE', ftInteger, pdInput, 0, Znach_ZE_IK);
(DataSet as TADOStoredProc).Parameters.CreateParameter('@ik_disc', ftInteger, pdInput, 0, DiscplIK);
(DataSet as TADOStoredProc).Parameters.CreateParameter('@IDGos', ftInteger, pdInput,  0, FgosIK);
try
    DataSet.Open;
    ExceptionIK:= DataSet.FieldByName('ReturnValue').AsInteger;
    DataSet.Close;
  except
    if DataSet.Active then DataSet.Close;
    DataSet.Free;
    raise;
  end;
  DataSet.Free;
  Result:= true;
end;

function TFgosController.SaveFgos(OperationType: byte; var FgosIK,
    SpecIK, YearIK, NumFgos, Znach_ZE_IK, hWeekAllLes, hWeekAuditorLess,
      MinHolidayWeek , MaxHolidayWeek, WinterHolidayWeek: integer;
     DateFgos: TDateTime): Boolean;
var
  DataSet: TADOStoredProc;
begin
  DataSet := TGeneralController.Instance.GetNewADOStoredProc('UpdateFgos',false);
  (DataSet as TADOStoredProc).Parameters.CreateParameter('@i_type', ftWord, pdInput,  0, OperationType);
  (DataSet as TADOStoredProc).Parameters.CreateParameter('@IDGos', ftInteger, pdInput,  0, FgosIK);
  (DataSet as TADOStoredProc).Parameters.CreateParameter('@ik_spec', ftInteger, pdInput, 0, SpecIK);
  (DataSet as TADOStoredProc).Parameters.CreateParameter('@ik_year', ftInteger, pdInput, 0, YearIK);
  (DataSet as TADOStoredProc).Parameters.CreateParameter('@NumFgos', ftInteger, pdInput, 0, NumFgos);
  (DataSet as TADOStoredProc).Parameters.CreateParameter('@DateFgos', ftDateTime, pdInput, 0, DateFgos);
   (DataSet as TADOStoredProc).Parameters.CreateParameter('@ik_znach_ZE', ftInteger, pdInput, 0, Znach_ZE_IK);
   (DataSet as TADOStoredProc).Parameters.CreateParameter('@Hours_in_week_all_lesson', ftInteger, pdInput, 0, hWeekAllLes);
  (DataSet as TADOStoredProc).Parameters.CreateParameter('@Hours_in_week_auditor_lesson', ftInteger, pdInput, 0, hWeekAuditorLess);
  (DataSet as TADOStoredProc).Parameters.CreateParameter('@min_holiday_week', ftInteger, pdInput, 0, MinHolidayWeek);
    (DataSet as TADOStoredProc).Parameters.CreateParameter('@max_holiday_week', ftInteger, pdInput, 0, MaxHolidayWeek);
  (DataSet as TADOStoredProc).Parameters.CreateParameter('@winter_holiday_week', ftInteger, pdInput, 0, WinterHolidayWeek);
  try
    DataSet.ExecProc;
    DataSet.Close;
  except
    if DataSet.Active then DataSet.Close;
    raise;
  end;
  DataSet.Free;
  Result:= true;
end;

function TFgosController.SaveCompetence(OperationType: byte; ZnachCompetence, ShName: string; IKTypeCompetence,
IDGos,IKCompetence: Integer): Boolean;
var
  tempDS : TADOStoredProc;
begin
  tempDS := TGeneralController.Instance.GetNewADOStoredProc('UpdateCompetence',false);
  tempDS.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, OperationType);
  tempDS.Parameters.CreateParameter('@ik_competence', ftInteger, pdInput, 0, IKCompetence);
  tempDS.Parameters.CreateParameter('@zhach_competence', ftString, pdInput,MAXINT, ZnachCompetence);
  tempDS.Parameters.CreateParameter('@short_Name', ftString, pdInput,10, ShName);
  tempDS.Parameters.CreateParameter('@ik_type_competence', ftInteger, pdInput, 0, IKTypeCompetence);
  tempDS.Parameters.CreateParameter('@IDGos', ftInteger, pdInput, 0, IDGos);

  try
    tempDS.ExecProc;

    tempDS.Close;
    tempDS.Free;
  except
    tempDS.Close;
    raise;
  end;
  Result:= true;
end;

 function  TFgosController.DeleteCompetence(IKCompetence,
 IKSpecCompetence:integer): Boolean;
var
  tempDS: TADOStoredProc;
begin
  tempDS := TGeneralController.Instance.GetNewADOStoredProc('UpdateCompetence',false);

  tempDS.ProcedureName:= 'UpdateCompetence';
  tempDS.Parameters.CreateParameter('@i_type', ftInteger, pdInput,  0, 3);
  tempDS.Parameters.CreateParameter('@ik_competence', ftInteger, pdInput,  0, IKCompetence);
  tempDS.Parameters.CreateParameter('@zhach_competence', ftString, pdInput,MAXINT, '');
  tempDS.Parameters.CreateParameter('@short_Name', ftString, pdInput,10, '');

  try
    tempDS.ExecProc;
    tempDS.Close;
  except
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
    raise;
  end;
  tempDS.Free;
  Result:= true;
end;

function TFgosController.SaveStructureCompetence (OperationType: byte; DescriptionContent: string; IKStructureCompetence,
IKCompetence, IKLevelCompetence: Integer): Boolean;
var
  tempDS : TADOStoredProc;
begin
  tempDS := TGeneralController.Instance.GetNewADOStoredProc('UpdateStructureCompetence',false);
  tempDS.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, OperationType);
  tempDS.Parameters.CreateParameter('@ik_structure_competence', ftInteger, pdInput, 0, IKStructureCompetence);
  tempDS.Parameters.CreateParameter('@ik_competence', ftInteger, pdInput, 0, IKCompetence);
  tempDS.Parameters.CreateParameter('@ik_level_competence', ftInteger, pdInput, 0, IKLevelCompetence);
  tempDS.Parameters.CreateParameter('@description_content', ftString, pdInput,MAXINT, DescriptionContent);

  try
    tempDS.ExecProc;

    tempDS.Close;
    tempDS.Free;
  except
    tempDS.Close;
    raise;
  end;
  Result:= true;
end;

 function  TFgosController.DeleteStructureCompetence (IKStructureCompetence:integer): Boolean;
var
  tempDS: TADOStoredProc;
begin
  tempDS := TGeneralController.Instance.GetNewADOStoredProc('UpdateStructureCompetence',false);

  tempDS.ProcedureName:= 'UpdateStructureCompetence';
  tempDS.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 3);
  tempDS.Parameters.CreateParameter('@ik_structure_competence', ftInteger, pdInput, 0, IKStructureCompetence);
//  tempDS.Parameters.CreateParameter('@description_content', ftString, pdInput,MAXINT,'');
  try
    tempDS.ExecProc;
    tempDS.Close;
  except
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
    raise;
  end;
  tempDS.Free;
  Result:= true;
end;

function TFgosController.SaveLevelSformyr (OperationType: byte; Value_priznak: string; IKLevelSformyr,
IKCompetence, IKTypeLevelSformyr, IKLevelCompetence: Integer): Boolean;
var
  tempDS : TADOStoredProc;
begin
  tempDS := TGeneralController.Instance.GetNewADOStoredProc('UpdateLevelSformyr',false);
  tempDS.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, OperationType);
  tempDS.Parameters.CreateParameter('@ik_level_sformyr', ftInteger, pdInput, 0, IKLevelSformyr);
  tempDS.Parameters.CreateParameter('@ik_competence', ftInteger, pdInput, 0, IKCompetence);
  tempDS.Parameters.CreateParameter('@ik_type_level_sformyr', ftInteger, pdInput, 0, IKTypeLevelSformyr);
  tempDS.Parameters.CreateParameter('@Value_priznak', ftString, pdInput,MAXINT, Value_priznak);
  tempDS.Parameters.CreateParameter('@ik_level_competence', ftInteger, pdInput, 0, IKLevelCompetence);
  try
    tempDS.ExecProc;

    tempDS.Close;
    tempDS.Free;
  except
    tempDS.Close;
    raise;
  end;
  Result:= true;
end;

 function  TFgosController.DeleteLevelSformyr (IKLevelSformyr:integer): Boolean;
var
  tempDS: TADOStoredProc;
begin
  tempDS := TGeneralController.Instance.GetNewADOStoredProc('UpdateLevelSformyr',false);

  tempDS.ProcedureName:= 'UpdateLevelSformyr';
  tempDS.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 3);
  tempDS.Parameters.CreateParameter('@ik_level_sformyr', ftInteger, pdInput, 0, IKLevelSformyr);
  //tempDS.Parameters.CreateParameter('@Value_priznak', ftString, pdInput,MAXINT,'');
  try
    tempDS.ExecProc;
    tempDS.Close;
  except
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
    raise;
  end;
  tempDS.Free;
  Result:= true;
end;

function TFgosController.DeleteFgos(FgosIK: integer): Boolean;
var
  DataSet: TCustomADODataSet;
  tempDS: TADODataSet;
begin
  tempDS := TGeneralController.Instance.GetNewADODataSet(false);
  tempDS.CommandText := 'select * from MW_Gos, Uch_pl where Uch_pl.ik_spec = MW_Gos.ik_spec and IDGos='+IntToStr(FgosIK);
  tempDS.Open;
  //если есть учебные планы для данной специальности
  if tempDS.RecordCount<>0 then
  begin
    ShowMessage('Невозможно удалить ФГОС. Для текущей специальности присутствуют учебные планы');
    Result := false;
  end
  else
  begin
    DataSet:= TADOStoredProc.Create(nil);
    DataSet.Connection:= dm.DBConnect;
    (DataSet as TADOStoredProc).ProcedureName:= 'UpdateFgos';
    (DataSet as TADOStoredProc).Parameters.CreateParameter('@i_type', ftWord, pdInput,  0, 3);
    (DataSet as TADOStoredProc).Parameters.CreateParameter('@IDGos', ftInteger, pdInput,  0, FgosIK);
    try
      DataSet.Open;
      FgosIK:= DataSet.FieldByName('ReturnValue').AsInteger;
      DataSet.Close;
    except
      if DataSet.Active then DataSet.Close;
      DataSet.Free;
      raise;
    end;
    DataSet.Free;
    Result:= true;
  end;
end;


 function TFgosController.DeleteFgosException(ExceptionIK: integer): Boolean;
var
  DataSet: TADOStoredProc;
begin
  DataSet:= TGeneralController.Instance.GetNewADOStoredProc('UpdateFgosException',false);
  (DataSet as TADOStoredProc).Parameters.CreateParameter('@i_type', ftWord, pdInput,  0, 2);
  (DataSet as TADOStoredProc).Parameters.CreateParameter('@ik_exception_fgos', ftInteger, pdInput,  0, ExceptionIK);
  (DataSet as TADOStoredProc).Parameters.CreateParameter('@ik_znach_ZE', ftInteger, pdInput, 0, 0);
  (DataSet as TADOStoredProc).Parameters.CreateParameter('@ik_disc', ftInteger, pdInput, 0, 0);
  (DataSet as TADOStoredProc).Parameters.CreateParameter('@IDGos', ftInteger, pdInput,  0, 0);
  try
    DataSet.ExecProc;
   // ExceptionIK:= DataSet.FieldByName('ReturnValue').AsInteger;
    DataSet.Close;
  except
    if DataSet.Active then DataSet.Close;
    raise;
  end;
  DataSet.Free;
  Result:= true;
end;

end.





