unit uAbitRaspisanieController;
 {#Author tanyav@ist.ugtu.net}
interface
uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, ADODB, DB, uDM,
  Forms, Dialogs, DBLookupEh, Variants, StdCtrls, GeneralController, Grids,
  ExcelXP, ComObj, DBGrids, uDMAbiturientRasp,
  DBGridEh, udmAbiturientOtchety, DateUtils, ExceptionBase, ApplicationController;

type
  PDBGrid = ^TDBGridEh;
  TAbitRaspisanieController = class (TObject)
  protected
    constructor CreateInstance;
 //AccessInstance предоставляет доступ к экземпляру контроллера
    class function AccessInstance(Request: Integer):
       TAbitRaspisanieController;
        constructor Create;
  public

  //Instance - возвращает экзепляр данного контроллера
    class function Instance: TAbitRaspisanieController;
  //ReleaseInstance - уничтожает контроллер
    class procedure ReleaseInstance;

    //**********САМ КОНТРОЛЛЕР****************
  //СОЗДАНИЕ/РЕДАКТИРОВАНИЕ МЕРОПРИЯТИЯ
  //DoLoadRasp загружает список меропритий дня
  function DoLoadRasp(raspDate:Variant; year:integer):boolean;
  //GetListOfDisc загружает список дисциплин
  function GetListOfDisc(SourceDataSet: PDataSet; NNyear: integer): Variant;
  //GetListOfVidSdachi загружает список видов сдачи
  function GetListOfVidSdachi(SourceDataSet: PDataSet; NNyear: integer): Variant;
  //GetListOfTypeMeropr загружает список типов мероприятий
  function GetListOfTypeMeropr(SourceDataSet: PDataSet): Variant;
  //создает новое мероприятие
  procedure AddNewMeropr(mdate:Variant;ik_sdach,ik_disc:OleVariant;TimeBegin,TimeEnd:Tdatetime;ik_typ_mer:OleVariant);
  //копирует мероприятие
  procedure CopyMeropr(id_raspOld:integer; mdate:Tdatetime;ik_sdach,ik_disc:OleVariant;TimeBegin,TimeEnd:Tdatetime;ik_typ_mer:OleVariant);
  //EditMeropr редактирование мероприятия
  procedure EditMeropr(date:Variant;id_rasp:integer;ik_sdach,ik_disc:OleVariant;TimeBegin,TimeEnd:Tdatetime;ik_typ_mer:OleVariant);

  //********СПИСОК ЗАКРЕПЛЕННЫХ АУДИТОРИЙ*******
  //OpenRaspKab открывает список аудиторий
  function OpenRaspKab(id_rasp:integer):boolean;overload;
  //OpenRaspKab обновляет список аудиторий
  function OpenRaspKab:boolean;overload;
  //AddKab добавляет новую в список аудиторий
  function AddKab:boolean;
  //SaveKabsUpdates сохраняет изменения в списоке аудиторий
  function SaveKabsUpdates:boolean;
  //CancelKabsUpdates отменяет изменения в списоке аудиторий
  function CancelKabsUpdates:boolean;

  //********CПИСОК АБИТУРИЕНТОВ**********
  //OpenAllForRasp загрузка списка абитуриентов (и кабинетов)
  function OpenAllForRasp:boolean;
  //ClearKabsFromAbitList очищает аудитории в списке абитуриентов
  procedure ClearKabsFromAbitList;
  //фильтрует список абитуриентов
  procedure FilterAbitList(NNyear, ik_fac, ik_spec_fac:Variant);

end;

implementation
var
//FAbitRaspisanieControllerInstance - экземпляр контроллера
  FAbitRaspisanieControllerInstance: TAbitRaspisanieController = nil;

constructor TAbitRaspisanieController.CreateInstance;
begin
  inherited Create;
end;


constructor TAbitRaspisanieController.Create;
begin
  inherited Create;
  raise Exception.CreateFmt('Доступ к классу %s можно получить только через поле Instance!', [ClassName]);
end;


class function TAbitRaspisanieController.AccessInstance(
  Request: Integer): TAbitRaspisanieController;
begin
  case Request of
    0 : ;
    1 : if not Assigned(FAbitRaspisanieControllerInstance) then
      FAbitRaspisanieControllerInstance:= CreateInstance;
    2 : if FAbitRaspisanieControllerInstance <> nil then
          begin
            FAbitRaspisanieControllerInstance.Free;
            FAbitRaspisanieControllerInstance:= nil;
          end;
    else raise EApplicationException.Create('Ошибка в программе!',Exception.CreateFmt('Неизвестное значение параметра %d в методе AccessInstance контроллера AbitZachislenieController', [Request]));
  end;  Result := FAbitRaspisanieControllerInstance;
end;


class function TAbitRaspisanieController.Instance: TAbitRaspisanieController;
begin
  Result := AccessInstance(1);
end;

class procedure TAbitRaspisanieController.ReleaseInstance;
begin
   AccessInstance(2);
end;


//**********САМ КОНТРОЛЛЕР****************
//СОЗДАНИЕ/РЕДАКТИРОВАНИЕ МЕРОПРИЯТИЯ
//загружает список меропритий дня
function TAbitRaspisanieController.DoLoadRasp(raspDate:Variant; year:integer):boolean;
begin
  TApplicationController.GetInstance.AddLogEntry('Загрузка списка мероприятий.');
  try
    DMAbiturientRasp.adospGetRasp.Close;
    DMAbiturientRasp.adospGetRasp.Parameters.ParamByName('@date_of').Value:=raspDate;
    DMAbiturientRasp.adospGetRasp.Parameters.ParamByName('@year').Value:=year;
    DMAbiturientRasp.adospGetRasp.Open;
    result:= true;
  except
  on E:Exception do
  begin
    raise EApplicationException.Create('Произошла ошибка при загрузке данных расписания!',E);
    result:= false;
  end;
  end;

end;

//загружает сTAbitRaspisanieControllerписок дисциплин
function TAbitRaspisanieController.GetListOfDisc(SourceDataSet: PDataSet; NNyear: integer): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'exec dbo.ABIT_Get_disc_abit @NNyear='+IntToStr(NNyear), 'ik_disc', false, NULL);
end;

//загружает список видов сдачи
function TAbitRaspisanieController.GetListOfVidSdachi(SourceDataSet: PDataSet; NNyear: integer): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'exec dbo.ABIT_Get_sdacha_abit @NNyear='+IntToStr(NNyear), 'ik_sdach', false, NULL);
end;

//загружает список типов мероприятий
function TAbitRaspisanieController.GetListOfTypeMeropr(SourceDataSet: PDataSet): Variant;
begin
  Result:= TGeneralController.Instance.getDataSetValues(SourceDataSet, 'exec dbo.ABIT_Get_Meropriatie', 'ik_typ_mer', false, NULL);
end;

//создает новое мероприятие
procedure TAbitRaspisanieController.AddNewMeropr(mdate:Variant;ik_sdach,ik_disc:OleVariant;TimeBegin,TimeEnd:Tdatetime;ik_typ_mer:OleVariant);
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TADOStoredProc.Create(nil);
  try
	  try
		tempStoredProc.Connection:= dm.DBConnect;
		tempStoredProc.ProcedureName:= 'ABIT_Add_Raspisanie;1';
		with tempStoredProc do
		begin
		  Active:=false;
		  Parameters.Clear;
		  Parameters.CreateParameter('@date',ftdatetime,pdInput,0,mdate);
		  Parameters.CreateParameter('@ik_sdach',ftBCD,pdInput,0,ik_sdach);
		  Parameters.CreateParameter('@ik_disc',ftBCD,pdInput,0,ik_disc);
		  Parameters.CreateParameter('@TimeBegin',ftdatetime,pdInput,5,TimeBegin);
		  Parameters.CreateParameter('@TimeEnd',ftdatetime,pdInput,5,TimeEnd);
		  Parameters.CreateParameter('@ik_typ_mer',ftBCD,pdInput,0,ik_typ_mer);
		  Parameters.CreateParameter('@id_rasp',ftInteger,pdOutput,0,0);
		  ExecProc;
		end;
	  except
	    on E:Exception do
		    raise EApplicationException.Create('Произошла ошибка при добавлении мероприятия',E);
	  end;
  finally
    tempStoredProc.Free;
  end;
end;

//копирует мероприятие
procedure TAbitRaspisanieController.CopyMeropr(id_raspOld:integer; mdate:Tdatetime;ik_sdach,ik_disc:OleVariant;TimeBegin,TimeEnd:Tdatetime;ik_typ_mer:OleVariant);
var
  tempStoredProc: TADOStoredProc;
begin
  TApplicationController.GetInstance.AddLogEntry('Копирование мероприятия.');

  tempStoredProc:= TADOStoredProc.Create(nil);
  try
	  try
		tempStoredProc.Connection:= dm.DBConnect;
		tempStoredProc.ProcedureName:= 'ABIT_CopyMeropr;1';
		with tempStoredProc do
		begin
		  Active:=false;
		  Parameters.Clear;
		  Parameters.CreateParameter('@id_rasp',ftInteger,pdInput,0,id_raspOld);
		  Parameters.CreateParameter('@ik_disc',ftBCD,pdInput,0,ik_disc);
		  Parameters.CreateParameter('@ik_sdach',ftBCD,pdInput,0,ik_sdach);
		  Parameters.CreateParameter('@date_of',ftdatetime,pdInput,0,mdate);
		  Parameters.CreateParameter('@TimeBegin',ftdatetime,pdInput,5,TimeBegin);
		  Parameters.CreateParameter('@TimeEnd',ftdatetime,pdInput,5,TimeEnd);
		  ExecProc;
		end;
	  except
	  on E:Exception do
		  raise EApplicationException.Create('Произошла ошибка при копировании данных мероприятия',E);
	  end;
  finally
    tempStoredProc.Free;
  end;
end;

//редактирование мероприятия
procedure TAbitRaspisanieController.EditMeropr(date:Variant;id_rasp:integer;ik_sdach,ik_disc:OleVariant;TimeBegin,TimeEnd:Tdatetime;ik_typ_mer:OleVariant);
var
  tempStoredProc: TADOStoredProc;
begin
  TApplicationController.GetInstance.AddLogEntry('Редактирование мероприятия.');

  tempStoredProc:= TADOStoredProc.Create(nil);
  try
    try
      tempStoredProc.Connection:= dm.DBConnect;
      tempStoredProc.ProcedureName:= 'ABIT_Edit_Raspisanie;1';
      with tempStoredProc do
      begin
        Active:=false;
        Parameters.Clear;
        Parameters.CreateParameter('@date',ftdatetime,pdInput,0,date);
        Parameters.CreateParameter('@id_rasp',ftBCD,pdInput,0,id_rasp);
        Parameters.CreateParameter('@ik_sdach',ftBCD,pdInput,0,ik_sdach);
        Parameters.CreateParameter('@ik_disc',ftBCD,pdInput,0,ik_disc);
        Parameters.CreateParameter('@TimeBegin',ftdatetime,pdInput,5,TimeBegin);
        Parameters.CreateParameter('@TimeEnd',ftdatetime,pdInput,5,TimeEnd);
        Parameters.CreateParameter('@ik_typ_mer',ftBCD,pdInput,0,ik_typ_mer);
        ExecProc;
      end;
    except
    on E:Exception do
      raise EApplicationException.Create('Произошла ошибка при редактировании данных расписания',E);
    end;
  finally
    tempStoredProc.Free;
  end;
end;

//********СПИСОК ЗАКРЕПЛЕННЫХ АУДИТОРИЙ*******
//открывает список аудиторий
function TAbitRaspisanieController.OpenRaspKab(id_rasp:integer):boolean;
begin
  try
    with DMAbiturientRasp do
    begin
		  //загружаем списки закрепленных кабинетов
		   adospAbitGetRaspKab.Close;
		   adospAbitGetRaspKab.SQL.Clear;
		   adospAbitGetRaspKab.SQL.Add('exec dbo.ABIT_get_raspkab '+IntToStr(id_rasp));
		   adospAbitGetRaspKab.Open;
		//загружаем списки закрепленных кабинетов
		   adospAbitRaspKab.Close;
		   adospAbitRaspKab.SQL.Strings[1]:='where id_rasp='+IntToStr(id_rasp);
		   adospAbitRaspKab.Open;
    end;
    Result:= true;
  except
    Result:= false;
  end;
end;

//обновляет список аудиторий
function TAbitRaspisanieController.OpenRaspKab:boolean;
begin
  try
    with DMAbiturientRasp do
    begin
		  //загружаем списки закрепленных кабинетов
		   adospAbitGetRaspKab.Close;
		   adospAbitGetRaspKab.Open;
		//загружаем списки закрепленных кабинетов
		   adospAbitRaspKab.Close;
		   adospAbitRaspKab.Open;
    end;
    Result:= true;
  except
    Result:= false;
  end;
end;

//добавляет новую в список аудиторий
function TAbitRaspisanieController.AddKab:boolean;
begin
  try
    DMAbiturientRasp.adospAbitRaspKab.Insert;
    DMAbiturientRasp.adospAbitRaspKab.FieldByName('id_rasp').Value:= DMAbiturientRasp.adospGetRaspid_rasp.Value;
    Result:= true;
  except
    Result:= false;
  end;
end;

//сохраняет изменения в списоке аудиторий
function TAbitRaspisanieController.SaveKabsUpdates:boolean;
begin
  try
    DMAbiturientRasp.adospAbitRaspKab.UpdateBatch();
    Result:= true;
  except
    Result:= false;
  end;
end;

//отменяет изменения в списоке аудиторий
function TAbitRaspisanieController.CancelKabsUpdates:boolean;
begin
  try
    DMAbiturientRasp.adospAbitRaspKab.CancelUpdates;
    Result:= true;
  except
    Result:= false;
  end;
end;



//********CПИСОК АБИТУРИЕНТОВ**********
//загрузка списка абитуриентов (и кабинетов)
function TAbitRaspisanieController.OpenAllForRasp:boolean;
var str:string;
begin
//загружаем список возможных кабинетов
  TApplicationController.GetInstance.AddLogEntry('Переход на мероприятие:  '+DMAbiturientRasp.adospGetRasp.FieldByName('disc').AsString+', '+DMAbiturientRasp.adospGetRasp.FieldByName('cname_sdach').AsString);
  try

    DMAbiturientRasp.adospAbitNotBusyKab.Close;
    DMAbiturientRasp.adospAbitNotBusyKab.Open;
		//загружаем списки закрепленных кабинетов
    TApplicationController.GetInstance.AddLogEntry('Загрузка списка закрепленных аудиторий');
    OpenRaspKab(DMAbiturientRasp.adospGetRaspid_rasp.Value);

    dmAbiturientOtchety.adospAbitRaspKab.Close;
    dmAbiturientOtchety.adospAbitRaspKab.Parameters.ParamByName('@id_rasp').Value:=DMAbiturientRasp.adospGetRaspid_rasp.Value;
    dmAbiturientOtchety.adospAbitRaspKab.Open;

		//загружаем список абитуриентов
    TApplicationController.GetInstance.AddLogEntry('Загрузка списка абитуриентов');
    DMAbiturientRasp.adospAbitGetSpisok.Close;
    str:='WHERE';

    if (DMAbiturientRasp.adospGetRaspik_disc.AsString='') or
        (DMAbiturientRasp.adospGetRaspik_sdach.AsString='') then
			 DMAbiturientRasp.adospAbitGetSpisok.SQL.Strings[1]:='WHERE (ik_disc IS NULL)'
    else
    begin
			DMAbiturientRasp.adospAbitGetSpisok.SQL.Strings[1]:='WHERE (ik_disc='+DMAbiturientRasp.adospGetRaspik_disc.AsString+' and  ik_sdach='+
      DMAbiturientRasp.adospGetRaspik_sdach.AsString+' and (id_rasp IS NULL OR id_rasp='+DMAbiturientRasp.adospGetRaspid_rasp.AsString+'))';
    end;
    FilterAbitList(YearOf(DMAbiturientRasp.adospGetRaspdate_of.Value), null, null);
    DMAbiturientRasp.adospAbitGetSpisok.Open;
    result:= true;
  except
    result:= false;
  end;
end;

//очищает аудитории в списке абитуриентов
procedure TAbitRaspisanieController.ClearKabsFromAbitList;
begin
  try
	  DMAbiturientRasp.adospAbitGetSpisok.DisableControls;
	  DMAbiturientRasp.adospAbitGetSpisok.First;
	  while not DMAbiturientRasp.adospAbitGetSpisok.Eof do
	  begin
		DMAbiturientRasp.adospAbitGetSpisok.Edit;
		DMAbiturientRasp.adospAbitGetSpisokid_rasp_kab.AsString:='';
		DMAbiturientRasp.adospAbitGetSpisok.Next;
	  end;
	  DMAbiturientRasp.adospAbitGetSpisok.First;
	  DMAbiturientRasp.adospAbitGetSpisok.EnableControls;
  finally
	  DMAbiturientRasp.adospAbitGetSpisok.EnableControls;
  end;
end;

//фильтрует список абитуриентов
procedure TAbitRaspisanieController.FilterAbitList(NNyear, ik_fac, ik_spec_fac:Variant);
var filter:string;
begin
  TApplicationController.GetInstance.AddLogEntry('Наложение фильтра на список абитуриентов.');

  filter:='';
  DMAbiturientRasp.adospAbitGetSpisok.Close;
  if (NNyear>1990) then
    filter:=filter+'and (NNyear='+IntToStr(NNyear)+')';
  if ik_fac>0 then
    filter:=filter+' and (ik_fac='+IntToStr(ik_fac)+')';
  if ik_spec_fac>0 then
    filter:=filter+' and (ik_spec_fac='+IntToStr(ik_spec_fac)+')';
  DMAbiturientRasp.adospAbitGetSpisok.SQL.Strings[2]:=filter;
  DMAbiturientRasp.adospAbitGetSpisok.Open;
end;


end.
