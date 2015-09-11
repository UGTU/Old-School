{-----------------------------------------------------------
  Модуль uDiplomController:
      uDiplomController - контроллер подсистемы
      "Деканат" - диплом
  Дата создания: 01.04.2009
  Дата последнего изменения:
  Разработчик: Вокуева Т.А.
-----------------------------------------------------------}
unit uDiplomController;
 {#Author tanyav@ist.ugtu.net}
interface                                                    
uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, ADODB, DB, uDM,
  Forms, Dialogs, DBLookupEh, Variants, StdCtrls, GeneralController, Grids,
  DBGrids, ComCtrls, DateUtils,
  DBGridEh, ApplicationController, uDMDiplom, D_DiplomVipRep, ReportsBase, ExceptionBase;
 type
  PDBGrid = ^TDBGridEh;
  TVedType = (exam,zach,KP,KR);
  TDiplomController = class (TObject)
  protected
    constructor CreateInstance;
    constructor Create;
  public

  //Instance - возвращает экзепляр данного контроллера
    class function Instance: TDiplomController;
  //ReleaseInstance - уничтожает контроллер
    class procedure ReleaseInstance;

//*********НЕПОСРЕДСТВЕННО ДИПЛОМ*********************
  //ДИПЛОМЫ НА ФРЕЙМЕ ГРУППА

  //проверяет - сейчас загружен текущий список дипломов
  function IsCurrentDiplomList(ik_group:integer): boolean;
  //GetDiplomList загружает созданные дипломы группы
  procedure GetDiplomList(ik_group:integer);
  //создает дипломы
  procedure CreateDiploms(ik_grup:Variant);
  //SaveDiploms сохранияет дипломы
  procedure SaveDiploms;
  //отменяет изменения в дипломах
  procedure CancelDiplomUpdates;

  //Печать выписки
  procedure ExecuteError(Sender: TObject; E: Exception);
  function PrintDiplVip(ikZach, ikGroup:integer; StudName, ExcelPatternName: string; ik_direction, ik_fac, ik_VidGos: integer; NameInDatPadez: boolean): boolean;



end;

implementation

uses uWaitingController;

 var
//FAbitZachislenieControllerInstance - экземпляр контроллера
  FDiplomInstance: TDiplomController = nil;
constructor TDiplomController.CreateInstance;
begin
  inherited Create;
end;

constructor TDiplomController.Create;
begin
  inherited Create;
  raise EApplicationException.Create('Ошибка в программе!',Exception.CreateFmt('Доступ к классу %s можно получить только через поле Instance!', [ClassName]));
end;



class function TDiplomController.Instance: TDiplomController;
begin
  if not Assigned(FDiplomInstance) then
      FDiplomInstance:= CreateInstance;
end;

class procedure TDiplomController.ReleaseInstance;
begin
   if FDiplomInstance <> nil then
          begin
            FDiplomInstance.Free;
            FDiplomInstance:= nil;
          end;
end;



//*********НЕПОСРЕДСТВЕННО ДИПЛОМ*********************
//ДИПЛОМЫ НА ФРЕЙМЕ ГРУППА

//проверяет - сейчас загружен текущий список дипломов
function TDiplomController.IsCurrentDiplomList(ik_group:integer): boolean;
begin
  result:= false;
  if dmDiplom.adospDiplomList.Active then
  begin
    if dmDiplom.adospDiplomList.Parameters.ParamByName('@ik_grup').Value=ik_group then
      result:=true;
  end;
end;

//загружает созданные дипломы группы
procedure TDiplomController.GetDiplomList(ik_group:integer);
begin
  TApplicationController.GetInstance.AddLogEntry('Диплом. Выбор списка дипломов группы');
  dmDiplom.adospDiplomList.Close;
  with  dmDiplom.adospDiplomList.Parameters do
  begin
    Clear;
    CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 4, NULL);
    CreateParameter('@ik_grup', ftInteger, pdInput, 4, ik_group);
  end;
  dmDiplom.adospDiplomList.Open;
end;


//создает дипломы
procedure TDiplomController.CreateDiploms(ik_grup:Variant);
var
  tempStoredProc: TADOStoredProc;
begin
  TApplicationController.GetInstance.AddLogEntry('Диплом. Создание (досоздание) дипломов.');
  tempStoredProc:= TADOStoredProc.Create(nil);
  try
    tempStoredProc.Connection:= dm.DBConnect;
    tempStoredProc.ProcedureName:= 'OKADRCreateDiploms;1';
    tempStoredProc.Parameters.CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 4, NULL);
    tempStoredProc.Parameters.CreateParameter('@ik_grup', ftInteger, pdInput, 4, ik_grup);
    tempStoredProc.ExecProc;
  finally
    tempStoredProc.Free;
  end;
end;


//сохранияет дипломы
procedure TDiplomController.SaveDiploms;
begin
  TApplicationController.GetInstance.AddLogEntry('Диплом. Сохранение дипломов группы');
  try
    dmDiplom.adospDiplomList.UpdateBatch();
  except
    on E:Exception do
      raise EApplicationException.Create('Произошла ошибка при сохранении! Проверьте правильность введенных данных - регистрационный номер диплома должен состоять не менее чем из 3 цифр.',E);
  end;
  dmDiplom.adospDiplomList.Close;
  dmDiplom.adospDiplomList.Open;
end;


//отменяет изменения в дипломах
procedure TDiplomController.CancelDiplomUpdates;
begin
  TApplicationController.GetInstance.AddLogEntry('Диплом. Отмена изменений');
  dmDiplom.adospDiplomList.Close;
  dmDiplom.adospDiplomList.Open;
end;

procedure TDiplomController.ExecuteError(Sender: TObject; E: Exception);
begin
  (Sender as TExcelReportBase).Quit;
  raise EApplicationException.Create('Произошла ошибка при экспорте выписки к диплому. Возможно у выбранного студента нет данных по диплому.',E);
end;

 //отменяет изменения в дипломах
function TDiplomController.PrintDiplVip(ikZach, ikGroup:integer; StudName, ExcelPatternName: string; ik_direction, ik_fac, ik_VidGos: integer; NameInDatPadez: boolean): boolean;
var
  Report:TDiplomVipExcelReport;
begin
    TApplicationController.GetInstance.AddLogEntry('Диплом. Экспорт вкладки к диплому '+StudName);

    Report := TReportBase.CreateReport(TDiplomVipExcelReport) as TDiplomVipExcelReport;
    Report.FreeOnComplete := true;
    Report.OnExecuteError := ExecuteError;
    if ((ExcelPatternName='') or (ExcelPatternName=null)) then
       ExcelPatternName:= 'DiplomVkl.XLT';
    Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\'+ExcelPatternName;
    Report.ikZach:= ikZach;
    Report.ikGroup:= ikGroup;
    Report.StudName:= StudName;
    Report.ik_direction:= ik_direction;
    Report.ik_fac:= ik_fac;
    Report.ik_VidGos:= ik_VidGos;
    Report.NameInDatPadez:= NameInDatPadez;
    TWaitingController.GetInstance.Process(Report);
    result:= Report.ikZach>0;
    
    //Report.BuildReport;
end;

end.




