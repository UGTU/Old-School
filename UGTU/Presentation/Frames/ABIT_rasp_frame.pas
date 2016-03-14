unit ABIT_rasp_frame;
   {#Author tanyav@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseFrame, StdCtrls, ComCtrls, Grids, DBGridEh, Buttons,
  ToolWin, DBCtrls, ExtCtrls, Mask, DBCtrlsEh, ImgList, DB, Menus,
  OleServer, WordXP, ExcelXP, DBLookupEh, ActnList, GridsEh, ADODB,
  ApplicationController, ExceptionBase, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, System.Actions, DBAxisGridsEh;

type
  TfmAbitRasp = class(TfmBase)
    RaspisanieAllData: TDataSource;
    Disc: TDBText;
    Vidsd: TDBText;
    Mer: TDBText;
    Nach: TDBText;
    Konc: TDBText;
    id_rasp: TDBText;
    date_of: TDBText;
    ik_disc: TDBText;
    ik_sdach: TDBText;
    Label1: TLabel;
    GroupBox4: TGroupBox;
    rasp: TDBGridEh;
    GroupBox1: TGroupBox;
    dbgSpisok: TDBGridEh;
    PopupMenu1: TPopupMenu;
    Word1: TMenuItem;
    N1: TMenuItem;
    ImageList1: TImageList;
    Bevel1: TBevel;
    Bevel2: TBevel;
    dbcmbxFac: TDBLookupComboboxEh;
    Spec_Fac: TDBLookupComboboxEh;
    ImageList3: TImageList;
    actList: TActionList;
    actAddRasp: TAction;
    actEditRasp: TAction;
    actDelRasp: TAction;
    actAddKab: TAction;
    actRaspredAbit: TAction;
    actEditKab: TAction;
    actDelKab: TAction;
    GroupBox2: TGroupBox;
    ToolBar1: TToolBar;
    SpeedButton2: TSpeedButton;
    ToolButton3: TToolButton;
    ToolButton6: TToolButton;
    moncal: TDBDateTimeEditEh;
    actSave: TAction;
    actCancel: TAction;
    actSpisToExel: TAction;
    actVedToExcel: TAction;
    actRezToExel: TAction;
    actClearKabs: TAction;
    Panel2: TPanel;
    Panel3: TPanel;
    ToolBar3: TToolBar;
    ToolButton7: TToolButton;
    ToolButton1: TToolButton;
    ToolButton8: TToolButton;
    ToolBar4: TToolBar;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton19: TToolButton;
    ppmSpisToExcel: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    actVedToExcel1: TMenuItem;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    dbgRooms: TDBGridEh;
    actSaveKabsList: TAction;
    ToolButton5: TToolButton;
    actCancelKabChange: TAction;
    actCopyMeropr: TAction;
    ToolButton9: TToolButton;
    ppmAbitList: TPopupMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Excel1: TMenuItem;
    Excel2: TMenuItem;
    Excel3: TMenuItem;
    PopupMenu2: TPopupMenu;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    actClearKabs1: TMenuItem;
    Panel4: TPanel;
    Splitter1: TSplitter;
    procedure MoncalChange(Sender: TObject);
    procedure Delraspisanie(id_rasp:integer);
    procedure raspKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure raspTitleClick(Column: TColumnEh);
    constructor CreateFrame(AOwner:TComponent; AObject:TObject; AConn:TADOConnection);override;
    procedure dbcmbxFacChange(Sender: TObject);
    procedure InitializeAddingRasp();
    procedure actEditRaspExecute(Sender: TObject);
    procedure actAddRaspExecute(Sender: TObject);
    procedure actDelRaspExecute(Sender: TObject);
    procedure actEditKabUpdate(Sender: TObject);
    procedure actEditRaspUpdate(Sender: TObject);
    procedure actDelRaspUpdate(Sender: TObject);
    procedure dbgRoomsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actDelKabExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actRaspredAbitUpdate(Sender: TObject);
    procedure actRaspredAbitExecute(Sender: TObject);
    procedure actSpisToExelExecute(Sender: TObject);
    procedure actVedToExcelExecute(Sender: TObject);
    procedure actSpisToExelUpdate(Sender: TObject);
    procedure actVedToExcelUpdate(Sender: TObject);
    procedure actRezToExelExecute(Sender: TObject);
    procedure actClearKabsExecute(Sender: TObject);
    procedure dbgSpisokColumns2UpdateData(Sender: TObject; var Text: string;
      var Value: Variant; var UseText, Handled: Boolean);
    procedure actAddKabExecute(Sender: TObject);
    procedure actSaveKabsListExecute(Sender: TObject);
    procedure OpenKabsList;
    procedure actCancelKabChangeExecute(Sender: TObject);
    procedure dbgRoomsColumns0UpdateData(Sender: TObject; var Text: string;
      var Value: Variant; var UseText, Handled: Boolean);
    procedure actSaveUpdate(Sender: TObject);
    procedure actCopyMeroprExecute(Sender: TObject);
    procedure dbgSpisokColumns3UpdateData(Sender: TObject; var Text: string;
      var Value: Variant; var UseText, Handled: Boolean);
    procedure dbgSpisokCellClick(Column: TColumnEh);
    procedure dbgSpisokColumns0UpdateData(Sender: TObject; var Text: string;
      var Value: Variant; var UseText, Handled: Boolean);
    

  protected
     function DoApply: Boolean; override;
    procedure DoCancel; override;
  private
    { Private declarations }
    procedure RefreshRasp();
    procedure LoadRasp(raspDate:Variant);
  public
    procedure GetRaspScroll();
  published
    procedure DoRefreshFrame; override;
    { Public declarations }
  end;

var
  s:string='';
  fmAbitRasp: TfmAbitRasp;
  aR:integer=1;
  Ac:integer=0;
  OnEdit:boolean=false;
  ListOfAudit:TStringList;  //Список занятых аудиторий
  i:integer;
  MDate:TDateTime;
implementation

uses AbiturientRaspisanieProcs, AbiturientBaseProcs, AbiturientFacade,
   AbiturientExamProcs, ABIT_add_rasp_dialog,
  AbiturientListsBeforeExamProcs,DBTVScheduleObj, uDM, ComObj,
  uDMAbiturientOtchety, uDMAbiturientRasP, DateUtils, uAbitOtchetsController,
  GeneralController, uAbitRaspisanieController;

{$R *.dfm}


procedure TfmAbitRasp.LoadRasp(raspDate:Variant);
begin
try
  Modified:=false;
  if not TAbitRaspisanieController.Instance.DoLoadRasp(raspDate,TDBNodeScheduleObject(FrameObject).ik) then
  begin
    exit;
  end;
  DMAbiturientRasp.adospGetRasp.First;
  if (DMAbiturientRasp.adospGetRasp.RecordCount>0) and
     (DMAbiturientRasp.adospGetRaspdate_of.AsDateTime<>Moncal.Value) then
  begin
    Moncal.Value:= DMAbiturientRasp.adospGetRaspdate_of.AsDateTime;
    Moncal.EditText:= DateToStr(DMAbiturientRasp.adospGetRaspdate_of.AsDateTime);
  end;
  if Moncal.Value<>null then
     MDate:= Moncal.Value
  else
  begin
    if  TDBNodeScheduleObject(FrameObject).ik=YearOf(Date) then
      Moncal.Value:=date
    else
      Moncal.EditText:='07.07.'+
        IntToStr(TDBNodeScheduleObject(FrameObject).ik);
  end;
except
  MessageBox(Handle,'Произошла ошибка при загрузке данных расписания.','ИС "УГТУ"',MB_OK);

end;
end;


procedure TfmAbitRasp.RefreshRasp();
begin
  try
    TApplicationController.GetInstance.AddLogEntry('Обновление кадра расписание экзаменов.');

	  LoadRasp(null);
	  DMAbiturientRasp.adospGetRasp.Last;
	  DMAbiturientRasp.adoqFac.Open;
	  DMAbiturientRasp.adoqSpecFac.Open;
	  dbcmbxFacChange(nil);
  except
  end;
end;

constructor TfmAbitRasp.CreateFrame(AOwner:TComponent; AObject:TObject; AConn:TADOConnection);
begin
  inherited;
  try
    Modified:=false;
    ListOfAudit:=TStringList.Create;
    RefreshRasp;
  except
  end;
end;

procedure TfmAbitRasp.MoncalChange(Sender: TObject);
begin
  try
  //Проверка, чтобы дата соответствовала году
	  if (length(Moncal.EditText)<10) then
		  exit;
	  if (YearOf(Moncal.Value)<>
		  TDBNodeScheduleObject(FrameObject).ik) and
		  (YearOf(MDate)=
		  TDBNodeScheduleObject(FrameObject).ik) then
	  begin
		 //MessageBox(Handle,'Выбранная дата не соответствует году поступления.','ИС "УГТУ"',MB_OK);
		 Moncal.Value:= MDate;
		 Moncal.EditText:= DateToStr(MDate);
		 exit;
	  end;

    if (Moncal.Value<>MDate) then
	    LoadRasp(Moncal.Value);
	  DMAbiturientRasp.adospGetRasp.First;
  except

  end;
  TApplicationController.GetInstance.AddLogEntry(' Выбор даты меториятий '+Moncal.Text);
end;

procedure OpenProc(proc: TADOStoredProc);
begin
   proc.Close;
   proc.Open;
end;

procedure TfmAbitRasp.raspKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_DELETE then
    actDelRaspExecute(Sender);
end;

procedure TfmAbitRasp.dbcmbxFacChange(Sender: TObject);
begin
  inherited;
  TApplicationController.GetInstance.AddLogEntry('Выбор фильтра по факультет '+dbcmbxFac.Text+
        ', специальность '+Spec_Fac.Text);

  IF (dbcmbxFac.KeyValue<0) then
  begin
    Spec_Fac.Enabled:=false;
    Spec_Fac.KeyValue:=-1;
  end
  else
    Spec_Fac.Enabled:=true;
  if (dbcmbxFac.KeyValue>-1) then
  begin
    if (dbcmbxFac.KeyValue<>DMAbiturientRasp.adoqSpecFacik_fac.Value) then
    begin
      Spec_Fac.KeyValue:=-1;
      DMAbiturientRasp.adoqSpecFac.Filter:='ik_fac='+IntToStr(dbcmbxFac.KeyValue);
      DMAbiturientRasp.adoqSpecFac.Filtered:=true;
    end;
  end;

  //накладываем фильтр
  TAbitRaspisanieController.Instance.FilterAbitList(YearOf(DMAbiturientRasp.adospGetRaspdate_of.Value), dbcmbxFac.KeyValue, Spec_Fac.KeyValue);

end;

procedure TfmAbitRasp.dbgSpisokCellClick(Column: TColumnEh);
begin
  if (Column.Field.FieldName='StudName')  then
  begin
    dbgSpisok.Options:=dbgSpisok.Options+[dgRowSelect]-[dgEditing];
  end else
  begin
    dbgSpisok.Options:= dbgSpisok.Options-[dgRowSelect]+[dgEditing];
  end;
end;

procedure TfmAbitRasp.dbgSpisokColumns0UpdateData(Sender: TObject;
  var Text: string; var Value: Variant; var UseText, Handled: Boolean);
begin
  inherited;
  Modified:= true;
end;

procedure TfmAbitRasp.dbgSpisokColumns2UpdateData(Sender: TObject;
  var Text: string; var Value: Variant; var UseText, Handled: Boolean);
begin
  {ShowMessage(Text+', '+DMAbiturientRasp.adospAbitGetSpisok.FieldByName('DiscVedomName').Value+'-'+
        DMAbiturientRasp.adoqMaxVedomNumber.FieldByName('MaxNumber').Value);      }
  Modified:= true;
  try
    if (DMAbiturientRasp.adospAbitGetSpisok.FieldByName('Cname_room').AsString='')
        and (Text <> '') then
    begin
      Text:= '';
      exit;
    end;
    if (Value<0)  then
    begin
      Text:= '0';
    end;
    if (Value>100)  then
    begin
      Text:= '100';
    end;

    if (Value <> null) then
    begin
      DMAbiturientRasp.adospAbitGetSpisok.FieldByName('nnvedom').Value:=
        DMAbiturientRasp.adospAbitGetSpisok.FieldByName('DiscVedomName').Value+'-'+
        DMAbiturientRasp.adoqMaxVedomNumber.FieldByName('MaxNumber').Value;
    end;
  except
  end;

end;

procedure TfmAbitRasp.dbgSpisokColumns3UpdateData(Sender: TObject;
  var Text: string; var Value: Variant; var UseText, Handled: Boolean);
begin
  modified:=true;
  TApplicationController.GetInstance.AddLogEntry('Указание абитуриенту '+
          DMAbiturientRasp.adospAbitGetSpisok.FieldByName('StudName').AsString+
          ' аудитории '+Text);
end;

procedure TfmAbitRasp.raspTitleClick(Column: TColumnEh);
begin
  inherited;
  DMAbiturientRasp.adospGetRasp.Sort:=Column.FieldName;
end;

procedure TfmAbitRasp.InitializeAddingRasp();
begin
  //виды мероприятий
  TGeneralController.Instance.InitializeLockupCB(@frmDialRasp.Meropr, 'ik_typ_mer', 'cname_mer');
  TAbitRaspisanieController.Instance.GetListOfTypeMeropr(@frmDialRasp.Meropr.ListSource.DataSet);
  //дисциплины
  TGeneralController.Instance.InitializeLockupCB(@frmDialRasp.Disc, 'ik_disc', 'сname_disc');
  TAbitRaspisanieController.Instance.GetListOfDisc(@frmDialRasp.Disc.ListSource.DataSet, TDBNodeScheduleObject(FrameObject).ik);
  //виды сдачи
  TGeneralController.Instance.InitializeLockupCB(@frmDialRasp.vidsd, 'ik_sdach', 'cname_sdach');
  TAbitRaspisanieController.Instance.GetListOfVidSdachi(@frmDialRasp.vidsd.ListSource.DataSet, TDBNodeScheduleObject(FrameObject).ik);
end;


procedure TfmAbitRasp.actEditRaspExecute(Sender: TObject);
begin
  TApplicationController.GetInstance.AddLogEntry('Вызов диалога редактирования мероприятия с кодом '+DMAbiturientRasp.adospGetRaspid_rasp.AsString);

  frmDialRasp:=TfrmDialRasp.create(self);
  try
	  InitializeAddingRasp;
	  frmDialRasp.Disc.Value:= DMAbiturientRasp.adospGetRaspik_disc.Value;
	  frmDialRasp.Meropr.Value:= DMAbiturientRasp.adospGetRaspik_typ_mer.Value;
	  frmDialRasp.Vidsd.Value:= DMAbiturientRasp.adospGetRaspik_sdach.Value;
	  frmDialRasp.MonCal.value:=DMAbiturientRasp.adospGetRaspdate_of.Value;
	  frmDialRasp.TimeBegin.Value:= DMAbiturientRasp.adospGetRaspTimeBegin.Value;
	  frmDialRasp.TimeEnd.Value:= DMAbiturientRasp.adospGetRaspTimeEnd.Value;
	  frmDialRasp.id_raspOld:= -1;
	  frmDialRasp.id_rasp:= DMAbiturientRasp.adospGetRaspid_rasp.Value;
	  frmDialRasp.bbOK.Enabled:=false;
	  frmDialRasp.bbApply.Enabled:=false;
	  frmDialRasp.Disc.Enabled:=false;
	  frmDialRasp.Vidsd.Enabled:=false;
	  frmDialRasp.Meropr.Enabled:=false;
	  frmDialRasp.IsModified:=false;
	  frmDialRasp.year:=TDBNodeScheduleObject(FrameObject).ik;
	  frmDialRasp.ShowModal;
	  if (frmDialRasp.ModalResult<> mrCancel) then
		  LoadRasp(frmDialRasp.MonCal.value);
  finally
    frmDialRasp.Free;
  end;
end;



procedure TfmAbitRasp.actAddKabExecute(Sender: TObject);
begin
  TApplicationController.GetInstance.AddLogEntry('Закрепление новой аудитории за мероприятием.');
  if not  TAbitRaspisanieController.Instance.AddKab then
    MessageBox(Handle,'Произошла ошибка при попытке добавить новую аудиторию.','ИС "УГТУ"',MB_OK);
end;

procedure TfmAbitRasp.actAddRaspExecute(Sender: TObject);
begin
  TApplicationController.GetInstance.AddLogEntry('Вызов диалога добавления мероприятия.');

  frmDialRasp:=TfrmDialRasp.create(self);
  try
	  InitializeAddingRasp;
	  if (YearOf(Date)=TDBNodeScheduleObject(FrameObject).ik) and
		      (MonthOf(Date)<9) and (MonthOf(Date)>6) then
      frmDialRasp.MonCal.value:=Date()
	  else
		  frmDialRasp.MonCal.value:= moncal.Value;
	  frmDialRasp.id_rasp:=-1;
	  frmDialRasp.id_raspOld:=-1;
	  frmDialRasp.Disc.Value:=null;
	  frmDialRasp.Meropr.Value:=null;
	  frmDialRasp.Vidsd.Value:=null;
	  frmDialRasp.TimeBegin.Text:='  :  :  ';
	  frmDialRasp.TimeEnd.Text:='  :  :  ';
	  frmDialRasp.bbOK.Enabled:=false;
	  frmDialRasp.bbApply.Enabled:=false;
	  frmDialRasp.Disc.Enabled:=true;
	  frmDialRasp.Vidsd.Enabled:=true;
	  frmDialRasp.Meropr.Enabled:=true;
	  frmDialRasp.Disc.Enabled:=true;
	  frmDialRasp.Vidsd.Enabled:=true;
	  frmDialRasp.Meropr.Enabled:=true;
	  frmDialRasp.IsModified:= false;
	  frmDialRasp.year:=TDBNodeScheduleObject(FrameObject).ik;
	  frmDialRasp.ShowModal;
	  if (frmDialRasp.ModalResult<> mrCancel) then
		  LoadRasp(frmDialRasp.MonCal.value);
  finally
    frmDialRasp.Free;

  end;
end;

procedure TfmAbitRasp.actDelRaspExecute(Sender: TObject);
//var str:string;
begin
    if MessageBox(Handle, 'Вы действительно хотите удалить мероприятие и всех закрепленных абитуриентов за ним из расписания?',
					  'ИС УГТУ', MB_YESNO)=IDYES then
    begin
      DelRaspisanie(DMAbiturientRasp.adospGetRaspid_rasp.Value);
    end;

  OpenProc(DMAbiturientRasp.adospGetRasp);
  //переоткрываем расписание
  if DMAbiturientRasp.adospGetRasp.RecordCount=0 then
    RefreshRasp;
  DMAbiturientRasp.adospGetRaspAfterScroll(nil);

end;

procedure TfmAbitRasp.actEditKabUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= (dbgSpisok.RowCount>0);
end;

procedure TfmAbitRasp.actEditRaspUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= (DMAbiturientRasp.adospGetRasp.RecordCount<>0) and
              (rasp.SelectedRows<>nil);
end;

procedure TfmAbitRasp.actDelRaspUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= (DMAbiturientRasp.adospGetRasp.RecordCount<>0) and
    (DMAbiturientRasp.adospGetRaspid_rasp.Value>0);
end;

procedure TfmAbitRasp.actRaspredAbitUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= (DMAbiturientRasp.adospAbitGetSpisok.RecordCount>0) and
      (dmAbiturientOtchety.adospAbitRaspKab.RecordCount>0) {and
      (DMAbiturientRasp.adospAbitGetSpisok.Locate('Cname_room','',[loCaseInsensitive]))};
end;


procedure TfmAbitRasp.dbgRoomsColumns0UpdateData(Sender: TObject;
  var Text: string; var Value: Variant; var UseText, Handled: Boolean);
begin
  inherited;
  TApplicationController.GetInstance.AddLogEntry('Закрепление аудитории '+Text);

  if DMAbiturientRasp.adospAbitRaspKab.FieldByName('id_rasp').AsString='' then
    DMAbiturientRasp.adospAbitRaspKab.FieldByName('id_rasp').Value:=
        DMAbiturientRasp.adospGetRaspid_rasp.Value;
end;

procedure TfmAbitRasp.dbgRoomsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_DELETE then
    actDelKabExecute(Sender);

end;

procedure TfmAbitRasp.actDelKabExecute(Sender: TObject);
begin
   TApplicationController.GetInstance.AddLogEntry('Удаление аудитории из списка закрепленных за мероприятием.');
   if (MessageBox(Handle, '           Удалить запись?','ИС "УГТУ"',
          MB_YESNO) = IDNO) then
      exit;
   try
     DMAbiturientRasp.adospAbitRaspKab.Delete;
   except
     MessageBox(Handle, 'Произошла ошибка при удалении аудитории.','ИС "УГТУ"',
          MB_OK);
   end;
end;

procedure TfmAbitRasp.DoCancel;
begin
  TApplicationController.GetInstance.AddLogEntry('Отмена изменений в списке абитуриентов.');

  try
    //отменяем все изменения и загружаем данные заново
    try
      DMAbiturientRasp.adospAbitGetSpisok.CancelUpdates;
      modified:=false;
    except
      MessageBox(Handle, 'Произошла ошибка при отмене изменений в списке абитуриентов.','ИС "УГТУ"',
          MB_OK);
    end;
  finally
    DMAbiturientRasp.adospAbitGetSpisok.Close;
    DMAbiturientRasp.adospAbitGetSpisok.Open;
  end;
end;

procedure TfmAbitRasp.actSaveExecute(Sender: TObject);
begin
  Apply;

end;

procedure TfmAbitRasp.actCancelExecute(Sender: TObject);
begin
  Cancel;
end;



procedure TfmAbitRasp.OpenKabsList;
begin
  if not TAbitRaspisanieController.Instance.OpenRaspKab then
     MessageBox(Handle, 'Произошла ошибка при обновлении списка аудиторий.','ИС "УГТУ"',
          MB_OK);
end;




procedure TfmAbitRasp.actSaveKabsListExecute(Sender: TObject);
begin
  TApplicationController.GetInstance.AddLogEntry('Сохранение списка аудиторий, закрепленных за мероприятием.');
  if not TAbitRaspisanieController.Instance.SaveKabsUpdates then
     MessageBox(Handle, 'Произошла ошибка при сохранении списка аудиторий.','ИС "УГТУ"',
          MB_OK);
  OpenKabsList;
end;


procedure TfmAbitRasp.actSaveUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= Modified;

end;

procedure TfmAbitRasp.actCancelKabChangeExecute(Sender: TObject);
begin
  TApplicationController.GetInstance.AddLogEntry('Отмена изменений в списке аудитории, закрепленных за мероприятием.');
  if not TAbitRaspisanieController.Instance.CancelKabsUpdates then
     MessageBox(Handle, 'Произошла ошибка при отмене изменений в списке аудиторий.','ИС "УГТУ"',
          MB_OK);
  OpenKabsList;
end;



//процедура удаления записей из расписания
procedure TfmAbitRasp.Delraspisanie(id_rasp:integer);
begin
  TApplicationController.GetInstance.AddLogEntry(' Удаление мероприятия с кодом '
        +IntToStr(id_rasp));

 (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TRaspisanieDelete] as TRaspisanieDelete).DelData(id_rasp);
end;




 {

//передаем в Word текущее расписание
procedure TfmAbitRasp.n1Click(Sender: TObject);
var Doc:_document;
    Tab:Table;
    cols:integer;
begin
   inherited;
 WordApplication1.Connect;
 doc:=WordApplication1.Documents.Add(EmptyParam,EmptyParam,EmptyParam,EmptyParam);
 if MonCal.Value= null then MonCal.Value:=Now();
 (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TRaspisanieGet] as TRaspisanieGet).GetData(StrToDatetime(copy(DateTimeToStr(Moncal.value),1,10)),1);
 if (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TRaspisanieGet]).RecordCount=0 then cols:=1
  else cols:=(TAbiturientFacade.Instance.ProcList.DataSetByClassType[TRaspisanieGet]).RecordCount;
 Doc.Tables.Add(Doc.Range(EmptyParam,EmptyParam),cols,5,EmptyParam,EmptyParam);
 Tab:=Doc.Tables.Item(1);
 //шапка таблицы
 WordApplication1.Selection.TypeText('Мероприятие');
 MoveRight(wdCell,1,0);
 WordApplication1.Selection.TypeText('Дисциплина');
 MoveRight(wdCell,1,0);
 WordApplication1.Selection.TypeText('Вид сдачи');
 MoveRight(wdCell,1,0);
 WordApplication1.Selection.TypeText('Время начала');
 MoveRight(wdCell,1,0);
 WordApplication1.Selection.TypeText('Время окончания');
 MoveRight(wdCell,1,0);
 //содержание таблицы
 (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TRaspisanieGet]).First;
 while not (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TRaspisanieGet]).Eof do
  begin
   WordApplication1.Selection.TypeText((TAbiturientFacade.Instance.ProcList.DataSetByClassType[TRaspisanieGet]).Fields[1].AsString);
   MoveRight(wdCell,1,0);
   WordApplication1.Selection.TypeText((TAbiturientFacade.Instance.ProcList.DataSetByClassType[TRaspisanieGet]).Fields[2].AsString);
   MoveRight(wdCell,1,0);
   WordApplication1.Selection.TypeText((TAbiturientFacade.Instance.ProcList.DataSetByClassType[TRaspisanieGet]).Fields[3].AsString);
   MoveRight(wdCell,1,0);
   WordApplication1.Selection.TypeText((TAbiturientFacade.Instance.ProcList.DataSetByClassType[TRaspisanieGet]).Fields[4].AsString);
   MoveRight(wdCell,1,0);
   WordApplication1.Selection.TypeText((TAbiturientFacade.Instance.ProcList.DataSetByClassType[TRaspisanieGet]).Fields[5].AsString);
   MoveRight(wdCell,1,0);
   (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TRaspisanieGet]).Next;
  end;
 WordApplication1.Visible:=true;
 WordApplication1.Disconnect;
end;
//передаем все расписание в Word
procedure TfmAbitRasp.word1Click(Sender: TObject);
var Doc:_document;
    Tab:Table;
    cols:integer;
begin
   inherited;
 WordApplication1.Connect;
 doc:=WordApplication1.Documents.Add(EmptyParam,EmptyParam,EmptyParam,EmptyParam);
 if MonCal.Value= null then MonCal.Value:=Now();
 (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TRaspisanieGet] as TRaspisanieGet).GetData(StrToDatetime(copy(DateTimeToStr(Moncal.value),1,10)),0);
 if (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TRaspisanieGet]).RecordCount=0 then cols:=1
  else cols:=(TAbiturientFacade.Instance.ProcList.DataSetByClassType[TRaspisanieGet]).RecordCount;
 Doc.Tables.Add(Doc.Range(EmptyParam,EmptyParam),cols,6,EmptyParam,EmptyParam);
 Tab:=Doc.Tables.Item(1);
 //шапка таблицы
 WordApplication1.Selection.TypeText('Дата проведения');
 MoveRight(wdCell,1,0);
 WordApplication1.Selection.TypeText('Мероприятие');
 MoveRight(wdCell,1,0);
 WordApplication1.Selection.TypeText('Дисциплина');
 MoveRight(wdCell,1,0);
 WordApplication1.Selection.TypeText('Вид сдачи');
 MoveRight(wdCell,1,0);
 WordApplication1.Selection.TypeText('Время начала');
 MoveRight(wdCell,1,0);
 WordApplication1.Selection.TypeText('Время окончания');
 MoveRight(wdCell,1,0);
 //содержание таблицы
 (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TRaspisanieGet]).First;
 while not (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TRaspisanieGet]).Eof do
  begin
   WordApplication1.Selection.TypeText((TAbiturientFacade.Instance.ProcList.DataSetByClassType[TRaspisanieGet]).Fields[0].AsString);
   MoveRight(wdCell,1,0);
   WordApplication1.Selection.TypeText((TAbiturientFacade.Instance.ProcList.DataSetByClassType[TRaspisanieGet]).Fields[1].AsString);
   MoveRight(wdCell,1,0);
   WordApplication1.Selection.TypeText((TAbiturientFacade.Instance.ProcList.DataSetByClassType[TRaspisanieGet]).Fields[2].AsString);
   MoveRight(wdCell,1,0);
   WordApplication1.Selection.TypeText((TAbiturientFacade.Instance.ProcList.DataSetByClassType[TRaspisanieGet]).Fields[3].AsString);
   MoveRight(wdCell,1,0);
   WordApplication1.Selection.TypeText((TAbiturientFacade.Instance.ProcList.DataSetByClassType[TRaspisanieGet]).Fields[4].AsString);
   MoveRight(wdCell,1,0);
   WordApplication1.Selection.TypeText((TAbiturientFacade.Instance.ProcList.DataSetByClassType[TRaspisanieGet]).Fields[5].AsString);
   MoveRight(wdCell,1,0);
   (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TRaspisanieGet]).Next;
  end;
 WordApplication1.Visible:=true;
 WordApplication1.Disconnect;
 //чтобы в таблице на фрейме отображалась информация по текущей дате
 (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TRaspisanieGet] as TRaspisanieGet).GetData(StrToDatetime(copy(DateTimeToStr(Moncal.value),1,10)),1);
end;
//передаем список в Word
procedure TfmAbitRasp.toolButton2Click(Sender: TObject);
var //i,j:integer;
    Doc:_document;
    //Tab:Table;
begin
   inherited;
 WordApplication1.Connect;
 doc:=WordApplication1.Documents.Add(EmptyParam,EmptyParam,EmptyParam,EmptyParam);
 WordApplication1.Visible:=true;
 WordApplication1.Disconnect;
end;

procedure TfmAbitRasp.toExcel(Sender:TStringGrid);
var
WorkBk : _WorkBook; //  определяем WorkBook
WorkSheet : _WorkSheet; //  определяем WorkSheet
I, J, R, C : Integer;
TabGrid : Variant; 
begin
    R :=Sender.RowCount;
    C :=Sender.ColCount;
    TabGrid := VarArrayCreate([0,(R - 1),0,(C - 1)],VarOleStr);

    for i:=0 to r-1 do
     for j:=0 to c-1 do
      TabGrid[i,j]:=Sender.Cells[j,i];

    XLApp.Connect; // Соединяемся с сервером TExcelApplication
    XLApp.WorkBooks.Add(xlWBatWorkSheet,0);  // Добавляем WorkBooks в ExcelApplication
    WorkBk := XLApp.WorkBooks.Item[1];  // Выбираем первую WorkBook
    WorkSheet := WorkBk.WorkSheets.Get_Item(1) as _WorkSheet; // Определяем первый WorkSheet

    Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Formula := TabGrid; // Сопоставляем Delphi массив-матрицу с матрицей в WorkSheet

    WorkSheet.Name := 'Отчет'; // Заполняем свойства WorkSheet
    WorkSheet.Columns.AutoFit;

    //заливка цветом нулевой строки и столбца
    Worksheet.Range['A1',Worksheet.Cells.Item[1,C]].Interior.ColorIndex:=15;
    Worksheet.Range['A1',Worksheet.Cells.Item[1,C]].Interior.Pattern:=xlSolid;
    Worksheet.Range['A1',Worksheet.Cells.Item[1,C]].Interior.PatternColorIndex:=xlAutomatic;

    Worksheet.Range['A1',Worksheet.Cells.Item[R,1]].Interior.ColorIndex:=15;
    Worksheet.Range['A1',Worksheet.Cells.Item[R,1]].Interior.Pattern:=xlSolid;
    Worksheet.Range['A1',Worksheet.Cells.Item[R,1]].Interior.PatternColorIndex:=xlAutomatic;

    //установить внутренние и внешние границы диапозона
    Worksheet.Range['A1',Worksheet.Cells.Item[R,1]].Borders[xlDiagonalDown].LineStyle:=xlNone;
    Worksheet.Range['A1',Worksheet.Cells.Item[R,1]].Borders[xlDiagonalUp].LineStyle:=xlNone;

    Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlEdgeLeft].LineStyle:=xlContinuous;
    Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlEdgeLeft].Weight:=xlThin;
    Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlEdgeLeft].ColorIndex:=xlAutomatic;

    Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlEdgeTop].LineStyle:=xlContinuous;
    Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlEdgeTop].Weight:=xlThin;
    Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlEdgeTop].ColorIndex:=xlAutomatic;

    Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlEdgeBottom].LineStyle:=xlContinuous;
    Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlEdgeBottom].Weight:=xlThin;
    Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlEdgeBottom].ColorIndex:=xlAutomatic;

    Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlEdgeRight].LineStyle:=xlContinuous;
    Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlEdgeRight].Weight:=xlThin;
    Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlEdgeRight].ColorIndex:=xlAutomatic;

    Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlInsideVertical].LineStyle:=xlContinuous;
    Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlInsideVertical].Weight:=xlThin;
    Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlInsideVertical].ColorIndex:=xlAutomatic;

    Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlInsideHorizontal].LineStyle:=xlContinuous;
    Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlInsideHorizontal].Weight:=xlThin;
    Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlInsideHorizontal].ColorIndex:=xlAutomatic;

    XLApp.Visible[0] := True; // Показываем Excel
    XLApp.Disconnect; // Разрываем связь с сервером
    TabGrid := Unassigned; // Unassign the Delphi Variant Matrix

end;
}

function TfmAbitRasp.DoApply:boolean;
begin
  TApplicationController.GetInstance.AddLogEntry('Cохранение изменений в списке абитуриентов.');
  try
    try
      DMAbiturientRasp.adospAbitGetSpisok.UpdateBatch(arAll);;
    except

    end;
  finally
    DMAbiturientRasp.adospAbitGetSpisok.Close;
    DMAbiturientRasp.adospAbitGetSpisok.Open;
  end;
  modified:=false;
  result:=true;
end;

procedure TfmAbitRasp.doRefreshFrame;
begin
  inherited;

  RefreshRasp;
end;

//подсчитываем кол-во абитуриентов в аудитории
function GetAbitCount(CabName:string):integer;
//var count:integer;
begin
  //count:=0;
  result:=1;
  if not DMAbiturientRasp.adospAbitGetSpisok.Locate('Cname_room',CabName,[loCaseInsensitive]) then
    result:=0
  else
  begin
  DMAbiturientRasp.adospAbitGetSpisok.First;
    while not DMAbiturientRasp.adospAbitGetSpisok.Eof do
    begin
      if DMAbiturientRasp.adospAbitGetSpisokCname_room.AsString=CabName then
        //inc(count);
      DMAbiturientRasp.adospAbitGetSpisok.Next;
    end;
  end;
end;

//автоматически распределяем абитуриентов по аудиториям
//не изменяет уже внесенных данных
procedure TfmAbitRasp.actRaspredAbitExecute(Sender: TObject);
var MestCount:integer;
begin
  TApplicationController.GetInstance.AddLogEntry('Распределение абитуриентов по аудиториям.');
  
  modified:= true;
  try
	  MestCount:=dmAbiturientOtchety.adospAbitRaspKab.FieldByName('iSeatCount').Value;
    for i := 0 to (dbgSpisok.SelectedRows.Count-1) do
    begin
      DMAbiturientRasp.adospAbitGetSpisok.GotoBookmark(Pointer(dbgSpisok.SelectedRows[i]));
		  DMAbiturientRasp.adospAbitGetSpisok.Edit;
		  DMAbiturientRasp.adospAbitGetSpisokid_rasp_kab.Value:=
			  DMAbiturientRasp.adospAbitRaspKab.FieldByName('id').Value;

      TApplicationController.GetInstance.AddLogEntry('Закрепление абитуриента '+
          DMAbiturientRasp.adospAbitGetSpisok.FieldByName('StudName').AsString+
          ' за аудиторией '+DMAbiturientRasp.adospAbitGetSpisok.FieldByName('Cname_room').AsString);

		  if (i>MestCount) and
		    (not DMAbiturientRasp.adospAbitGetSpisok.Eof) then
		  begin
		    MessageBox(Handle, 'В аудитории не хватает мест для всех абитуриентов.','ИС "УГТУ"',
			    MB_OK);
		    exit;
		  end;
    end;
  except
     on E:Exception do
     raise EApplicationException.Create('Произошла ошибка при распределении абитуриентов по аудитории!', E);
  end;


end;

//экспорт списка абитуриентов в Excel
procedure TfmAbitRasp.actSpisToExelExecute(Sender: TObject);
begin
    if Modified then
    begin
      MessageBox(Handle, 'Прежде чем совершить выгрузку, необходимо сохранить изменения.','ИС "УГТУ"',
          MB_OK) ;
      exit;
    end;
    TAbitOtchetsController.Instance.ExpExamSpisAbitsToExc;

end;

//экспорт ведомости в Excel
procedure TfmAbitRasp.actVedToExcelExecute(Sender: TObject);
begin
  if Modified then
  begin
    MessageBox(Handle, 'Прежде чем совершить выгрузку, необходимо сохранить изменения.','ИС "УГТУ"',
          MB_OK) ;
    exit;
  end;

  TAbitOtchetsController.Instance.ExpExamVedsToExc;

end;

procedure TfmAbitRasp.actSpisToExelUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= (DMAbiturientRasp.adospAbitGetSpisok.RecordCount>0) and
      (dmAbiturientOtchety.adospAbitRaspKab.RecordCount>0);
end;

procedure TfmAbitRasp.actVedToExcelUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= (DMAbiturientRasp.adospAbitGetSpisok.RecordCount>0) and
      (dmAbiturientOtchety.adospAbitRaspKab.RecordCount>0);
end;

procedure TfmAbitRasp.actRezToExelExecute(Sender: TObject);
begin
  if Modified then
  begin
     MessageBox(Handle, 'Прежде чем совершить выгрузку, необходимо сохранить изменения.','ИС "УГТУ"',
          MB_OK) ;
     exit;
  end;

  TAbitOtchetsController.Instance.ExpExamResultsToExc;
end;

//очищает все аудитории из списка
procedure TfmAbitRasp.actClearKabsExecute(Sender: TObject);
var asked, flYes:boolean;
begin
  TApplicationController.GetInstance.AddLogEntry('Очистка распределения абитуриентов по аудиториям.');
  
  asked:= false;   //признак спрашивали
  flYes:= true;   //признак ответа да
  try
    for i := 0 to (dbgSpisok.SelectedRows.Count-1) do
    begin
      DMAbiturientRasp.adospAbitGetSpisok.GotoBookmark(Pointer(dbgSpisok.SelectedRows[i]));
      if (DMAbiturientRasp.adospAbitGetSpisok.FieldByName('cosenka').AsString<>'') and
        flYes then
      begin
        if (not asked) then
        begin
          flYes:= (MessageBox(Handle, 'Для некоторых абитуриентов уже была выставлена оценка. Удалить оценку и аудиторию?',
              'ИС УГТУ', MB_YESNO)=IDYES);
          asked:= true;
        end;
        if flYes then
        begin   //удаляем оценку
		      DMAbiturientRasp.adospAbitGetSpisok.Edit;
		      DMAbiturientRasp.adospAbitGetSpisok.FieldByName('cosenka').AsString:='';
          TApplicationController.GetInstance.AddLogEntry('Удаление оценки абитуриента '+
              DMAbiturientRasp.adospAbitGetSpisok.FieldByName('StudName').AsString);

        end
        else
          continue;
      end;

      if (DMAbiturientRasp.adospAbitGetSpisok.FieldByName('cosenka').AsString='') then
      begin
		    DMAbiturientRasp.adospAbitGetSpisok.Edit;
		    DMAbiturientRasp.adospAbitGetSpisokid_rasp_kab.AsString:='';
        TApplicationController.GetInstance.AddLogEntry('Очистка аудитории для абитуриента '+
              DMAbiturientRasp.adospAbitGetSpisok.FieldByName('StudName').AsString);

      end;
      //TAbitZachislenieController.Instance.Abit_Join(dbgAbitsForZachisl.DataSource.DataSet.FieldValues['NN_abit']);
    end;
  finally
    modified:= true;
  end;
  

  

  //TAbitRaspisanieController.Instance.ClearKabsFromAbitList;
end;

procedure TfmAbitRasp.actCopyMeroprExecute(Sender: TObject);
begin
  TApplicationController.GetInstance.AddLogEntry('Вызов диалога копирования мероприятия с кодом '+DMAbiturientRasp.adospGetRaspid_rasp.AsString);

  frmDialRasp:=TfrmDialRasp.create(self);
  try
	  InitializeAddingRasp;
	  frmDialRasp.Meropr.Value:= DMAbiturientRasp.adospGetRaspik_typ_mer.Value;
	  frmDialRasp.Vidsd.Value:= DMAbiturientRasp.adospGetRaspik_sdach.Value;
	  frmDialRasp.MonCal.value:=DMAbiturientRasp.adospGetRaspdate_of.Value;
	  frmDialRasp.TimeBegin.Value:= DMAbiturientRasp.adospGetRaspTimeBegin.Value;
	  frmDialRasp.TimeEnd.Value:= DMAbiturientRasp.adospGetRaspTimeEnd.Value;
	  frmDialRasp.id_raspOld:= DMAbiturientRasp.adospGetRaspid_rasp.Value;
	   frmDialRasp.id_rasp:= -1;
	  frmDialRasp.bbOK.Enabled:=false;
	  frmDialRasp.bbApply.Enabled:=false;
	  frmDialRasp.Disc.Enabled:=true;
	  frmDialRasp.Vidsd.Enabled:=true;
	  frmDialRasp.Meropr.Enabled:=false;
	  frmDialRasp.IsModified:=false;
	  frmDialRasp.year:=TDBNodeScheduleObject(FrameObject).ik;
	  frmDialRasp.ShowModal;
	  if (frmDialRasp.ModalResult<> mrCancel) then
		  LoadRasp(frmDialRasp.MonCal.value);
  finally
    frmDialRasp.Free;
  end;

end;

//переход на др. мероприятие
procedure TfmAbitRasp.GetRaspScroll();
begin
  if Modified then
  begin
    if MessageBox(Handle, 'Сохранить изменения в списке абитуриентов?','ИС "УГТУ"',
          MB_YESNO)=IDYES then
    begin
      Apply;
    end;
  end;
  if not TAbitRaspisanieController.Instance.OpenAllForRasp then
    raise Exception.CreateFmt('Произошла ошибка при загрузке данных с сервера', []);
  Modified:=false;
end;

end.

