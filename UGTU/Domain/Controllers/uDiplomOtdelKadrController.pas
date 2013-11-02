{-----------------------------------------------------------
  Модуль uDecanatKontingController:
      uDecanatKontingController - контроллер подсистемы
      "Денканат" - контингент
  Дата создания: 03.05.2008
  Дата последнего изменения:
  Разработчик: Вокуева Т.А.
-----------------------------------------------------------}
unit uDiplomOtdelKadrController;

interface                                                    
uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, ADODB, DB, uDM,
  Forms, Dialogs, DBLookupEh, Variants, StdCtrls, GeneralController, Grids,
  ExcelXP, ComObj, DBGrids, uDMUspevaemost, ComCtrls, DateUtils,
  udmUgtuStructure, DBGridEh, uDiplOKadr;
 type
  PDBGrid = ^TDBGridEh;
  TDecanatKontingController = class (TObject)
  protected
    constructor CreateInstance;
 //AccessInstance предоставляет доступ к экземпляру контроллера
    class function AccessInstance(Request: Integer):
       TDecanatKontingController;

  public
    constructor Create;
  //Instance - возвращает экзепляр данного контроллера
    class function Instance: TDecanatKontingController;
  //ReleaseInstance - уничтожает контроллер
    class procedure ReleaseInstance;

//*********НЕПОСРЕДСТВЕННО КОНТИНГЕНТ*********************
//CreateDiplom Создание диплома в отделе кадров (дата защиты, выдачи, реш. номер)
function CreateDiplom(SourceDataSet: PDataSet; grid: PDBGrid): boolean;



end;

implementation
 var
//FAbitZachislenieControllerInstance - экземпляр контроллера
  FTDecanatKontingControllerInstance: TDecanatKontingController = nil;

constructor TDecanatKontingController.CreateInstance;
begin
  inherited Create;
end;

constructor TDecanatKontingController.Create;
begin
  inherited Create;
  raise Exception.CreateFmt('Доступ к классу %s можно получить только через поле Instance!', [ClassName]);
end;


class function TDecanatKontingController.AccessInstance(
  Request: Integer): TDecanatKontingController;
begin
  case Request of
    0 : ;
    1 : if not Assigned(FTDecanatKontingControllerInstance) then
      FTDecanatKontingControllerInstance:= CreateInstance;
    2 : if FTDecanatKontingControllerInstance <> nil then
          begin
            FTDecanatKontingControllerInstance.Free;
            FTDecanatKontingControllerInstance:= nil;
          end;
    else raise Exception.CreateFmt('Неизвестное значение параметра %d в методе AccessInstance контроллера TUspevGroupController', [Request]);
  end;  Result := FTDecanatKontingControllerInstance;
end;

class function TDecanatKontingController.Instance: TDecanatKontingController;
begin
  Result := AccessInstance(1);
end;

class procedure TDecanatKontingController.ReleaseInstance;
begin
   AccessInstance(2);
end;












//*********НЕПОСРЕДСТВЕННО КОНТИНГЕНТ*********************
//Создание диплома в отделе кадров (дата защиты, выдачи, реш. номер)
function TDecanatKontingController.CreateDiplom(SourceDataSet: PDataSet; grid: PDBGrid): boolean;

  //dataSet:TADODataSet;
begin

  result:=false;
  if grid.SelectedRows.Count=0 then
      exit;

   //Проверим, чтобы все выделенные студенты еще не
   //были зачислены и были с одной специальности
  { for i := 0 to grid.SelectedRows.Count-1 do
   begin
      FAbitListDataSetInstance.GotoBookmark(Pointer(grid.SelectedRows[I]));
      if (FAbitListDataSetInstance.FieldByName('nn_zach').Value<>NULL) then
      begin
        raise Exception.Create('Вы выбрали абитуриента, который уже был зачислен!');
        exit;
      end;
      if i=0 then
         spec:=FAbitListDataSetInstance.FieldByName('ik_spec_fac').Value
      else
      begin
         if spec<>FAbitListDataSetInstance.FieldByName('ik_spec_fac').Value then
         begin
            raise Exception.Create('Вы выбрали абитуриентов разных специальностей! Зачисление их в одну группу невозможно!');
            exit;
         end;
      end;
   end;   }

  if frmDiplomOKadr=nil then
    frmDiplomOKadr:=TfrmDiplomOKadr.create(nil);
  frmDiplomOKadr.Tag:=SourceDataSet.FieldByName('ik_zach').Value;
  //frmDiplomOKadr.studname:=SourceDataSet.FieldByName('NameStud').AsString;
  frmDiplomOKadr.ShowModal;
  frmDiplomOKadr.Free;

//создаем диалог и передаем ему год и специальность
  {frmJoinGroup:=TfrmJoinGroup.create(nil);
  FAbitListDataSetInstance.GotoBookmark(Pointer(grid.SelectedRows[0]));
  frmJoinGroup.domspec:= FAbitListDataSetInstance.FieldByName('ik_spec_fac').Value;
  frmJoinGroup.year:= FAbitListDataSetInstance.FieldByName('NNyear').Value;
  frmJoinGroup.EditMode:= false;
  frmJoinGroup.AbitCount:= grid.SelectedRows.Count;
  frmJoinGroup.ShowModal;
  if  frmJoinGroup.mrOk then
  begin
    nzach:= frmJoinGroup.eNum.Text;
//Проверяем, чтобы введенного номера зачетки еще не было
    if Abit_IsOldZach(nzach) then
    begin
      raise Exception.Create('Вы внесли уже используемый номер зачетки!');
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
        if Abit_IsOldZach(nzach) then
        begin
          raise Exception.Create('Вы внесли уже используемый номер зачетки!');
          dm.DBConnect.RollbackTrans;
          exit;
        end;

        FAbitListDataSetInstance.GotoBookmark(Pointer(grid.SelectedRows[I]));

      //создаем новую зачетку (номер)
        ik_zach:= Abit_CreateRecordBook(FAbitListDataSetInstance.FieldByName('nCode').Value, nzach);

      //зачисляем студента в группу
        Abit_CreateStudGrup(FAbitListDataSetInstance.FieldByName('nCode').Value,
            group, ik_zach,
            FAbitListDataSetInstance.FieldByName('ik_kat_zach').Value,
            frmJoinGroup.dbcbeOrder.KeyValue,
            frmJoinGroup.dbcbeCause.KeyValue,
            groupName,'');

        //наращиваем номер на 1 больше
        nZach:= IntToStr(StrToInt(nZach)+1);
      //наращиваем до 6 знаков в номере
        while length(nZach)<6 do
          nZach:='0'+nZach;

      end;
//сохраняем изменения
      dm.DBConnect.CommitTrans;
    except
      raise Exception.Create('Неверные данные!');
      dm.DBConnect.RollbackTrans;
    end;
    //возвращаем прежнюю сортировку
    TADODataSet(FAbitListDataSetInstance).Sort:= sort;
  end;
  frmJoinGroup.Free;
  FAbitListDataSetInstance.Next;   }
end;


end.
