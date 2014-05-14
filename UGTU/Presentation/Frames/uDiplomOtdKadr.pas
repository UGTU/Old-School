unit uDiplomOtdKadr;
  {#Author tanyav@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseFrame, StdCtrls, Buttons, ExtCtrls, DBGridEh, Mask, DBCtrlsEh,
  DBLookupEh, ComCtrls, ToolWin, uDiplOtdKardController, GridsEh,
  ADODB, DB, ActnList, DateUtils, uDMOtdKadrDiplom, DBCtrls, ApplicationController, ExceptionBase,
  uDiplomController;

type
  TfmDiplomOtdKadr = class(TfmBase)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    dbcmbxFac: TDBLookupComboboxEh;
    dbcmbxSpec: TDBLookupComboboxEh;
    dbcmbxGroup: TDBLookupComboboxEh;
    dbgStudList: TDBGridEh;
    actList: TActionList;
    actCreateDiploms: TAction;
    ToolButton2: TToolButton;
    actPrintDipl: TAction;
    ToolButton3: TToolButton;
    actSaveDipl: TAction;
    actCancelDiplUpd: TAction;
    pcOtdKadr: TPageControl;
    tshDiplom: TTabSheet;
    tshGak: TTabSheet;
    dbgMemberGak: TDBGridEh;
    ToolBar3: TToolBar;
    dbcmbxYear: TDBLookupComboboxEh;
    actSaveGak: TAction;
    actCancelUpdGak: TAction;
    DBNavigator1: TDBNavigator;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    actDelGakMember: TAction;
    tsQualif: TTabSheet;
    dbgQualif: TDBGridEh;
    ToolButton6: TToolButton;
    actUpdateDiploms: TAction;
    ToolButton7: TToolButton;
    actPrintOldDipl: TAction;
    procedure dbcmbxFacChange(Sender: TObject);
    procedure dbcmbxSpecChange(Sender: TObject);
    procedure dbcmbxGroupChange(Sender: TObject);
    procedure actCreateDiplomsExecute(Sender: TObject);
    procedure actCreateDiplomsUpdate(Sender: TObject);
    procedure dbgStudListTitleClick(Column: TColumnEh);
    procedure actPrintDiplExecute(Sender: TObject);
    procedure dbgStudListCellClick(Column: TColumnEh);
    procedure dbgStudListMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbgStudListMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure dbgStudListMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbgStudListColumns1UpdateData(Sender: TObject; var Text: string;
      var Value: Variant; var UseText, Handled: Boolean);
    procedure dbgStudListColumns2UpdateData(Sender: TObject; var Text: string;
      var Value: Variant; var UseText, Handled: Boolean);
    procedure actSaveDiplExecute(Sender: TObject);
    procedure actCancelDiplUpdExecute(Sender: TObject);
    procedure pcOtdKadrChange(Sender: TObject);
    procedure dbcmbxYearChange(Sender: TObject);
    procedure pcOtdKadrChanging(Sender: TObject; var AllowChange: Boolean);
    procedure actSaveGakUpdate(Sender: TObject);
    procedure actCancelUpdGakUpdate(Sender: TObject);
    procedure dbgMemberGakColumns0UpdateData(Sender: TObject; var Text: string;
      var Value: Variant; var UseText, Handled: Boolean);
    procedure actSaveDiplUpdate(Sender: TObject);
    procedure actCancelDiplUpdUpdate(Sender: TObject);
    procedure dbgMemberGakKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actDelGakMemberExecute(Sender: TObject);
    procedure actDelGakMemberUpdate(Sender: TObject);
    procedure dbgQualifColumns1UpdateData(Sender: TObject; var Text: string;
      var Value: Variant; var UseText, Handled: Boolean);
    procedure actPrintDiplUpdate(Sender: TObject);
    procedure dbgQualifTitleClick(Column: TColumnEh);
    procedure actUpdateDiplomsExecute(Sender: TObject);
    procedure actPrintOldDiplExecute(Sender: TObject);
  protected
     procedure DoCancel;override;
     procedure DoCreate;override;
     function DoApply: Boolean;override;
     procedure DoRefreshFrame; override;
     function DoModified():boolean;

  public
    { Public declarations }
  end;

var
  fmDiplomOtdKadr: TfmDiplomOtdKadr;
  ik_group, ik_fac, ik_spec: integer;
  ik_year: integer;
  CurrentNum:string;
  CurrentDate:TDatetime;
  bdown, editMode, NumColumn:boolean;
implementation

{$R *.dfm}
procedure TfmDiplomOtdKadr.DoCreate;
begin
    Modified:= false;
    dbgStudList.DataSource:= TDataSource.Create(nil);
    dbgStudList.DataSource.DataSet:= TADODataSet.Create(nil);
    TADODataSet(dbgStudList.DataSource.DataSet).LockType:= ltBatchOptimistic;

    if (DMOtdKadrDiplom = nil) then
       DMOtdKadrDiplom:= TdmOtdKadrDiplom.Create(nil);

  	//инициализируем списки (combo box)
	//факультет
    ik_fac:= 0;
	  TDiplOtdKardController.Instance.GetFacList(@dbcmbxFac);
	//специальность
    ik_spec:= 0;
	  TDiplOtdKardController.Instance.GetSpecList(@dbcmbxSpec);
  //группа
    TDiplOtdKardController.Instance.GetGroupList(@dbcmbxGroup);
    ik_group:= 0;
    dbcmbxFac.Value:= dbcmbxFac.ListSource.DataSet.FieldByName('ik_fac').AsInteger;
    pcOtdKadr.ActivePageIndex:= 0;
    ik_year:= 0;
end;


procedure TfmDiplomOtdKadr.DoCancel;
begin
    case pcOtdKadr.ActivePageIndex of
    0:  //Диплом
     begin

        TDiplOtdKardController.Instance.CancelDiplomUpdates(@dbgStudList.DataSource.DataSet);
        dbgStudList.DataSource.DataSet.Close;
        dbgStudList.DataSource.DataSet.Open;
        Modified:= false;

     end;
    1:  //ГАК
    begin

      //отменяем сохранение списка
        TDiplOtdKardController.Instance.CancelUpdatesGAK(@dbgMemberGak.DataSource.DataSet);
        dbgMemberGak.DataSource.DataSet.Close;
        dbgMemberGak.DataSource.DataSet.Open;
        Modified:= false;

    end;
    2:  //квалификации
    begin

      //отменяем сохранение списка
        TDiplOtdKardController.Instance.CancelUpdatesQualif(@dbgQualif.DataSource.DataSet);
        dbgQualif.DataSource.DataSet.Close;
        dbgQualif.DataSource.DataSet.Open;
        Modified:= false;

    end;
    end;
end;

function TfmDiplomOtdKadr.DoApply:boolean;
begin
  result:= false;
  case pcOtdKadr.ActivePageIndex of
    0:  //Диплом
     begin

      //сохраняем список
        TDiplOtdKardController.Instance.SaveDiploms(@dbgStudList.DataSource.DataSet);
        Modified:= false;
        result:= true;

     end;
    1:  //ГАК
    begin
      try
      //сохраняем список
        TDiplOtdKardController.Instance.SaveGAK(@dbgMemberGak.DataSource.DataSet);
        dbgMemberGak.DataSource.DataSet.Close;
        dbgMemberGak.DataSource.DataSet.Open;
        Modified:= false;
        result:= true;
      except
        {MessageBox(Handle, 'Произошла ошибка при сохранении списка паредседателей ГАК.','ИС "УГТУ"',
          MB_OK) ;}
      end;

    end;
    2:  //квалификации
    begin
      try
      //сохраняем список
        TDiplOtdKardController.Instance.SaveQualif(@dbgQualif.DataSource.DataSet);
        dbgQualif.DataSource.DataSet.Close;
        dbgQualif.DataSource.DataSet.Open;
        Modified:= false;
        result:= true;
      except
        {MessageBox(Handle, 'Произошла ошибка при сохранении списка паредседателей ГАК.','ИС "УГТУ"',
          MB_OK) ;}
      end;

    end;
  end;
end;


procedure TfmDiplomOtdKadr.DoRefreshFrame;
begin
  ik_group:= 0;
  ik_year:= 0;
  dbcmbxFac.ListSource.DataSet.First;
  dbcmbxFac.Value:= dbcmbxFac.ListSource.DataSet.FieldByName('ik_fac').AsInteger;
  pcOtdKadr.ActivePageIndex:= 0;
  Modified:= false;
end;

procedure TfmDiplomOtdKadr.pcOtdKadrChange(Sender: TObject);
begin
  case pcOtdKadr.ActivePageIndex of
    0:  //ГАК
    begin
       TApplicationController.GetInstance.AddLogEntry('Диплом. Переход на вкладку дипломы.');
    end;
    1:  //ГАК
    begin
       TApplicationController.GetInstance.AddLogEntry('Диплом. Переход на вкладку председатели ГАК');
        //открываем справочник специальности
        TDiplOtdKardController.Instance.GetSpecGakList;
	      //годы загружаем
	      if dbcmbxYear.ListSource=nil then
          TDiplOtdKardController.Instance.GetYearList(@dbcmbxYear);

    end;
    2:  //квалификации
    begin
       TApplicationController.GetInstance.AddLogEntry('Диплом. Переход на вкладку Квалификации');
       //открываем справочник специальности
       TDiplOtdKardController.Instance.GetQualifications(@dbgQualif.DataSource.DataSet);

    end;
  end;

end;

procedure TfmDiplomOtdKadr.pcOtdKadrChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange:=DoModified();
end;

function TfmDiplomOtdKadr.DoModified():boolean;
var tmpStr:string;
begin
  result:= true;
  if Modified then
  begin
    case pcOtdKadr.ActivePageIndex of
      0:  //Диплом
          tmpStr := 'Данные диплома были изменены. Сохранить изменения?';
      1:  //ГАК
          tmpStr := 'Список председателей ГАК был изменен. Сохранить изменения?';
      2:  //Квалификации
          tmpStr := 'Список клалификаций был изменен. Сохранить изменения?';

    end;
    case MessageBox(Handle, PAnsiChar(tmpStr),'ИС "УГТУ"',
          MB_YESNOCANCEL)  of
     ID_YES:
        Apply;
     ID_NO:
        Cancel;
     ID_CANCEL:
     begin
        result:=false;
        exit;
     end;
    end;
  end;
end;

procedure TfmDiplomOtdKadr.actCreateDiplomsUpdate(Sender: TObject);
begin
  if (dbgStudList.DataSource<>nil) and
      (dbgStudList.DataSource.DataSet<>nil) then
    (Sender as TAction).Enabled:= (ik_group>0) and
      (dbgStudList.DataSource.DataSet.RecordCount<1);
end;

procedure TfmDiplomOtdKadr.actDelGakMemberExecute(Sender: TObject);
begin
    dbgMemberGak.DataSource.DataSet.Edit;
    dbgMemberGak.DataSource.DataSet.Delete;
    modified:= true;

end;

procedure TfmDiplomOtdKadr.actDelGakMemberUpdate(Sender: TObject);
begin
    if (dbgMemberGak.DataSource<>nil)  then
      (Sender as TAction).Enabled:= (dbgMemberGak.RowCount>0);


end;

procedure TfmDiplomOtdKadr.actPrintDiplExecute(Sender: TObject);
begin
  if not DoModified then
    exit;
  TDiplOtdKardController.Instance.PrintAllDiploms(@dbgStudList.DataSource.DataSet,
    ik_spec, YearOf(Date), false);
  {case TDiplOtdKardController.Instance.PrintAllDiploms(@dbgStudList.DataSource.DataSet,
    ik_spec, YearOf(Date)) of
    -2:
      MessageBox(Handle, 'Произошла ошибка при выборке данных для дипломов.','ИС "УГТУ"',
          MB_OK) ;
    -1:
      MessageBox(Handle, 'Произошла ошибка при экспорте данных для дипломов.','ИС "УГТУ"',
          MB_OK) ;
    0:
      MessageBox(Handle, 'Не заполнены данные для дипломов. Экспорт невозможен.','ИС "УГТУ"',
          MB_OK) ;
  end; }

end;

procedure TfmDiplomOtdKadr.actPrintDiplUpdate(Sender: TObject);
begin
    if (dbgStudList.DataSource<>nil) and
      (dbgStudList.DataSource.DataSet<>nil) and
      (dbgStudList.DataSource.DataSet.Active) then
      (Sender as TAction).Enabled:= (dbgStudList.DataSource.DataSet.RecordCount>0);
end;

procedure TfmDiplomOtdKadr.actPrintOldDiplExecute(Sender: TObject);
begin
  if not DoModified then
    exit;
  TDiplOtdKardController.Instance.PrintAllDiploms(@dbgStudList.DataSource.DataSet,
    ik_spec, YearOf(Date), true);
end;

procedure TfmDiplomOtdKadr.actSaveDiplExecute(Sender: TObject);
begin
  Apply;

end;

procedure TfmDiplomOtdKadr.actSaveDiplUpdate(Sender: TObject);
begin
  inherited;
  if (dbgStudList.DataSource<>nil) and
      (dbgStudList.DataSource.DataSet<>nil) then
    (Sender as TAction).Enabled:= Modified;

end;

procedure TfmDiplomOtdKadr.actSaveGakUpdate(Sender: TObject);
begin
  if (dbgMemberGak.DataSource<>nil) and
      (dbgMemberGak.DataSource.DataSet<>nil) then
    (Sender as TAction).Enabled:= Modified;

end;

procedure TfmDiplomOtdKadr.actUpdateDiplomsExecute(Sender: TObject);
begin
  inherited;
  ik_group := 0;
  dbcmbxGroupChange(Sender);
end;

procedure TfmDiplomOtdKadr.dbcmbxFacChange(Sender: TObject);
begin
  if not DoModified then
  begin
    Modified:= false;
    dbcmbxFac.Value:= ik_fac;
    Modified:= true;
  end;
  TApplicationController.GetInstance.AddLogEntry('Диплом. Выбор факультета '+dbcmbxFac.Text);
  //фильтруем список специальностей
    if ik_fac<>dbcmbxFac.Value then
    begin
      TDiplOtdKardController.Instance.FilterSpecList(@dbcmbxSpec,dbcmbxFac.Value);
      dbcmbxSpec.Value:= dbcmbxSpec.ListSource.DataSet.FieldByName('ik_spec_fac').AsInteger;
      ik_fac:= dbcmbxFac.Value;
    end;

end;


procedure TfmDiplomOtdKadr.dbcmbxSpecChange(Sender: TObject);
begin
  if not DoModified then
  begin
    Modified:= false;
    dbcmbxSpec.Value:= ik_spec;
    Modified:= true;
  end;
  TApplicationController.GetInstance.AddLogEntry('Диплом. Выбор специальности '+dbcmbxSpec.Text);
  //фильтруем список групп

    if ik_spec<>dbcmbxSpec.Value then
    begin
      TDiplOtdKardController.Instance.FilterGroupList(@dbcmbxGroup,dbcmbxSpec.Value);
      dbcmbxGroup.Value:= dbcmbxGroup.ListSource.DataSet.FieldByName('ik_grup').AsInteger;
      ik_spec:= dbcmbxSpec.Value;
    end;


end;

procedure TfmDiplomOtdKadr.dbcmbxYearChange(Sender: TObject);
begin
  if not DoModified  then
  begin
    Modified:= false;
    dbcmbxYear.Value:= ik_year;
    Modified:= true;
  end;

  TApplicationController.GetInstance.AddLogEntry('Список председателей ГАК. Выбор года поступления '+dbcmbxYear.Text);
  if (dbcmbxYear.Value = ik_year)  then
    exit;
    //загружаем список
    TDiplOtdKardController.Instance.GetGakMemberList(@dbgMemberGak.DataSource.DataSet,dbcmbxYear.Value);
    if (dbcmbxYear.Value<>NULL) then
      ik_year:= dbcmbxYear.Value;

end;

procedure TfmDiplomOtdKadr.actCancelDiplUpdExecute(Sender: TObject);
begin
  inherited;
  Cancel;
end;

procedure TfmDiplomOtdKadr.actCancelDiplUpdUpdate(Sender: TObject);
begin
  inherited;
  if (dbgStudList.DataSource<>nil) and
      (dbgStudList.DataSource.DataSet<>nil) then
    (Sender as TAction).Enabled:= Modified;

end;

procedure TfmDiplomOtdKadr.actCancelUpdGakUpdate(Sender: TObject);
begin
  if (dbgMemberGak.DataSource<>nil) and
      (dbgMemberGak.DataSource.DataSet<>nil) then
    (Sender as TAction).Enabled:= Modified;

end;

procedure TfmDiplomOtdKadr.actCreateDiplomsExecute(Sender: TObject);
begin
    TApplicationController.GetInstance.AddLogEntry('Диплом. Создание дипломов для группы.');
    TDiplomController.Instance.CreateDiploms(ik_group);
    dbgStudList.DataSource.DataSet.Close;
    dbgStudList.DataSource.DataSet.Open;


end;

procedure TfmDiplomOtdKadr.dbcmbxGroupChange(Sender: TObject);
begin
  if not DoModified  then
  begin
    Modified:= false;
    dbcmbxGroup.Value:= ik_group;
    Modified:= true;
  end;
  if (dbcmbxGroup.Value = ik_group) then
    exit;
  try
    //загружаем список
    TApplicationController.GetInstance.AddLogEntry('Диплом. Выбор группы '+dbcmbxGroup.Text);
    TDiplOtdKardController.Instance.GetDiplomList(@dbgStudList.DataSource.DataSet,dbcmbxGroup.Value);
    ik_group:= dbcmbxGroup.Value;
  except
   on E:Exception do
   Begin
    raise EApplicationException.Create('Произошла ошибка при выборе данных о дипломах.',Exception.Create(E.Message));
    //если не загрузили, возвращаем прежнее значение группы
    dbcmbxGroup.Value:= ik_group;
    exit;
   End;
  end;
    //если список пуст, предлагаем создать дипломы
  if (dbgStudList.DataSource.DataSet.RecordCount<1) and
      ((dbcmbxGroup.Value>1)) then
  begin
      if (MessageBox(Handle, 'Для выбранной группы дипломы еще не созданы. Создать дипломы сейчас?','ИС "УГТУ"',
          MB_YESNO))=IDYES then
      begin
        actCreateDiplomsExecute(Sender);
      end;
  end
  //иначе обновляем список дипломов (досоздаем)
  else
    actCreateDiplomsExecute(Sender);

  //dgStudList.Options:=[dgEditing,dgTitles,dgColumnResize,dgRowLines,dgTabs,dgConfirmDelete,dgCancelOnExit,dgMultiSelect];  //, dgRowSelect
end;

procedure TfmDiplomOtdKadr.dbgMemberGakColumns0UpdateData(Sender: TObject;
  var Text: string; var Value: Variant; var UseText, Handled: Boolean);
begin
  modified:= true;
  dbgMemberGak.DataSource.DataSet.FieldByName('ik_year').Value:= ik_year;
end;

procedure TfmDiplomOtdKadr.dbgMemberGakKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  modified:= true;
end;

procedure TfmDiplomOtdKadr.dbgQualifColumns1UpdateData(Sender: TObject;
  var Text: string; var Value: Variant; var UseText, Handled: Boolean);
begin
  modified:= true;
end;

procedure TfmDiplomOtdKadr.dbgQualifTitleClick(Column: TColumnEh);
begin
    TADODataSet(dbgQualif.DataSource.DataSet).Sort:=
      Column.Field.DisplayName;
end;

procedure TfmDiplomOtdKadr.dbgStudListCellClick(Column: TColumnEh);
begin

  if (Column.Field.FieldName='RegNumber') or (Column.Field.FieldName='Dd_dipl') or (Column.Field.FieldName='VipNumber') then
  begin
   dbgStudList.Options:= dbgStudList.Options-[dgRowSelect]+[dgEditing];
   editMode:=true;

  end else
  begin
   dbgStudList.Options:=dbgStudList.Options+[dgRowSelect]-[dgEditing];
   editMode:=false;
  end;
end;

procedure TfmDiplomOtdKadr.dbgStudListColumns1UpdateData(Sender: TObject;
  var Text: string; var Value: Variant; var UseText, Handled: Boolean);
begin
  Modified:= true;
end;

procedure TfmDiplomOtdKadr.dbgStudListColumns2UpdateData(Sender: TObject;
  var Text: string; var Value: Variant; var UseText, Handled: Boolean);
begin
  Modified:= true;
  if Text='' then
     exit;
  try
    Text:=DateToStr(StrToDate(Text));
  except
    raise EApplicationException.Create('Введена неверная дата.');
  end;
end;

procedure TfmDiplomOtdKadr.dbgStudListMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 CurrentNum:='';
 CurrentDate:=0;
bdown:=true;
if dbgStudList.DataSource.DataSet.FieldByName('RegNumber').Value<>Null then
   if dbgStudList.SelectedField.FieldName='RegNumber' then
   begin
   CurrentDate:=0;
   CurrentNum:=dbgStudList.DataSource.DataSet.FieldByName('RegNumber').Value;
   end;
   if dbgStudList.DataSource.DataSet.FieldByName('Dd_dipl').Value<>Null then
   if dbgStudList.SelectedField.FieldName='Dd_dipl' then
   begin
   CurrentNum:='';
   CurrentDate:=dbgStudList.DataSource.DataSet.FieldByName('Dd_dipl').Value;
   end;
end;

procedure TfmDiplomOtdKadr.dbgStudListMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
  var i,j:integer;
  begin
   if (bdown)and(CurrentNum<>'')and((dbgStudList.SelectedField.Value=Null)or(dbgStudList.SelectedField.Value='')) then
      try
      dbgStudList.DataSource.dataset.Edit;
      i:=1;
      while (Currentnum[i]='0')and(i<Length(Currentnum)) do
      inc(i);
      Currentnum:=inttostr(strtoint(Currentnum)+1);
      dbgStudList.SelectedField.Value:='';
      for j := 2 to i do
      dbgStudList.SelectedField.Value:=dbgStudList.SelectedField.Value+'0';
      dbgStudList.SelectedField.Value:=dbgStudList.SelectedField.Value+Currentnum;
      Currentnum:=dbgStudList.SelectedField.Value;
      except
      dbgStudList.SelectedField.Value:=(Currentnum);
      end;

      if (bdown)and(CurrentDate<>0)and(dbgStudList.SelectedField.Value=Null) then
      begin
      dbgStudList.DataSource.dataset.Edit;
      dbgStudList.SelectedField.Value:=Currentdate;
      end;
end;

procedure TfmDiplomOtdKadr.dbgStudListMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  begin
  bdown:=false;
  end;



procedure TfmDiplomOtdKadr.dbgStudListTitleClick(Column: TColumnEh);
begin

    TADODataSet(dbgStudList.DataSource.DataSet).Sort:=
      Column.Field.DisplayName;

end;

end.
