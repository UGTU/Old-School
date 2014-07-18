unit HOST_Zaselenie;
   {#Author llodigina@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseFrame, StdCtrls, Buttons, ExtCtrls, GridsEh, DBGridEh, ComCtrls,
  ToolWin, ActnMan, ActnCtrls, ActnMenus, ImgList, ActnList, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, System.Actions, DBAxisGridsEh;

type
  TfmHOST_Zaselenie = class(TfmBase)
    PageZayavlenia: TPageControl;
    TabSpisokObj: TTabSheet;
    TabSvedOKomn: TTabSheet;
    DBGridObj: TDBGridEh;
    TabSpisokZayav: TTabSheet;
    TabPredvSpisok: TTabSheet;
    DBGridInfoRoom: TDBGridEh;
    DBGridSpisokZayav: TDBGridEh;
    TabPrikaz: TTabSheet;
    alHOSTActions: TActionList;
    ToolBar1: TToolBar;
    BTUtvZayav: TToolButton;
    BTNaznRoom: TToolButton;
    ImageList1: TImageList;
    BTOtkazat: TToolButton;
    actUtvZayav: TAction;
    ToolBar2: TToolBar;
    BTAddVPrik: TToolButton;
    DBGridPredvSpisok: TDBGridEh;
    ToolBar3: TToolBar;
    ToolButton6: TToolButton;
    ToolButton8: TToolButton;
    DBGridPrikaz: TDBGridEh;
    BTVidDogovor: TToolButton;
    BTZamenaRoom: TToolButton;
    procedure actUtvZayavExecute(Sender: TObject);
    procedure DBGridSpisokZayavTitleClick(Column: TColumnEh);
    procedure DBGridInfoRoomTitleClick(Column: TColumnEh);
    procedure DBGridObjTitleClick(Column: TColumnEh);
    procedure PageZayavleniaChange(Sender: TObject);
    procedure BTNaznRoomClick(Sender: TObject);
    procedure BTOtkazatClick(Sender: TObject);
    procedure DBGridPredvSpisokTitleClick(Column: TColumnEh);
    procedure DBGridPrikazTitleClick(Column: TColumnEh);
    procedure BTAddVPrikClick(Sender: TObject);
    procedure BTZamenaRoomClick(Sender: TObject);
    procedure BTVidDogovorClick(Sender: TObject);

  private
    { Private declarations }
  public
    procedure DoRefreshFrame;override;    { Public declarations }
  end;

var
  fmHOST_Zaselenie: TfmHOST_Zaselenie;

implementation

uses HOST_UtvZayav, uHOST, HOST_ReportController, ApplicationController,HOST_NaznRoom, uBaseDialog,
HOST_ZayavlenieController,DateUtils,HOST_UkazPrikaz,HOST_ZamenaRoom,
DBTVInviteHostObj, DBTVInviteObj,HOST_AddZayav;

{$R *.dfm}

procedure TfmHOST_Zaselenie.actUtvZayavExecute(Sender: TObject);
var i,Cod,idz: integer;
    RDate,DataVid:tdatetime;
    UtvZayav: TUtvZayav;
begin
  TApplicationController.GetInstance.AddLogEntry('Открытие формы "Утверждение заявления". Добавление даты рассмотрения заявления, а также даты выдачи ордера. Вывод на печать ордера.');
  inherited;
if dmHOST.vVkSpisokZayav.FieldByName('DataUtv').AsString <> ''   then
  begin
    MessageBox(Handle, 'Заявка уже утверждена!',
					  'ИС УГТУ', MB_OK);
  exit;
  end;

  UtvZayav:= TUtvZayav.Create(self);
  try
    UtvZayav.DateUtv.Value:=date;

    UtvZayav.ShowModal;
    if (UtvZayav.ModalResult=mrOk) then
    begin
      RDate:= UtvZayav.DateUtv.Value;
      for i := 0 to (DBGridSpisokZayav.SelectedRows.Count-1) do
      begin
        DBGridSpisokZayav.DataSource.DataSet.GotoBookmark(Pointer(DBGridSpisokZayav.SelectedRows[i]));
        idz:= dmHOST.vVkSpisokZayav.FieldByName('IDZayavlenie').AsInteger;
        DataVid:= Today;
        Cod:=dmHOST.vVkSpisokZayav.FieldByName('nCode').AsInteger;
        if UtvZayav.dbCBVidDog.Checked then
        begin
          THOST_ZayavlenieController.Instance.AddDateVidOrdera(Cod,idz,DataVid,RDate,2);
          if UtvZayav.CheckPrint.Checked then
          begin
             THOST_ReportController.Instance.PrintOrder(idz);
          end;     
        end
        else
          THOST_ZayavlenieController.Instance.AddDateUtv(DBGridSpisokZayav.DataSource.DataSet.FieldValues['IDZayavlenie'],2,RDate);
      end;
    end;
  finally
    UtvZayav.Free;
    dmHOST.vVkSpisokZayav.Active:=false;
    dmHOST.vVkSpisokZayav.Active:=true;
  end;
end;

procedure TfmHOST_Zaselenie.BTNaznRoomClick(Sender: TObject);
 var i,idAdr,Cod: integer;
    DataReg:tdatetime;
    NaznRoom: TNaznRoom;
    HostNumber: integer;
begin
  TApplicationController.GetInstance.AddLogEntry('Открытие формы "Заселить в комнату".');
  inherited;
  if DBGridSpisokZayav.SelectedRows.Count = 0   then
  begin
    MessageBox(Handle, 'Выделите заявление!',
					  'ИС УГТУ', MB_OK);
  exit;
  end;
  if dmHOST.vVkSpisokZayav.FieldByName('IDStatusZayav').AsInteger = 1   then
  begin
    MessageBox(Handle, 'Заявление персоны не утверждено!',
					  'ИС УГТУ', MB_OK);
  exit;
  end;


  NaznRoom:= TNaznRoom.Create(self);
  try
      for i := 0 to (DBGridSpisokZayav.SelectedRows.Count-1) do
      begin
        DBGridSpisokZayav.DataSource.DataSet.GotoBookmark(Pointer(DBGridSpisokZayav.SelectedRows[i]));
        if i=0 then
          HostNumber:= dmHOST.vVkSpisokZayav.FieldByName('NumHostel').AsInteger
        else
          if HostNumber<>dmHOST.vVkSpisokZayav.FieldByName('NumHostel').AsInteger then
          begin
            MessageBox(Handle, 'Выберите заявления, поданные в одно общежитие!',
					  'ИС УГТУ', MB_OK);
            exit;
          end;
      end;
    NaznRoom.NumHost:= HostNumber;
    NaznRoom.ShowModal;
    if (NaznRoom.ModalResult=mrOk) then
    begin
      for i := 0 to (DBGridSpisokZayav.SelectedRows.Count-1) do
      begin
        idAdr:=NaznRoom.ComBRoom.KeyValue;
        DataReg:= Now;
        Cod:=dmHOST.vVkSpisokZayav.FieldByName('nCode').AsInteger;
        DBGridSpisokZayav.DataSource.DataSet.GotoBookmark(Pointer(DBGridSpisokZayav.SelectedRows[i]));
        THOST_ZayavlenieController.Instance.NaznRoom(idAdr,DataReg,1,Cod);
      end;
    end;
  finally
    NaznRoom.Free;
    dmHOST.vVkSpisokZayav.Active:=false;
    dmHOST.vVkSpisokZayav.Active:=true;
  end;
end;

procedure TfmHOST_Zaselenie.BTOtkazatClick(Sender: TObject);
var i,idz: integer;
    RDate:tdatetime;
begin
  TApplicationController.GetInstance.AddLogEntry('Отказ в заселении.');
  if MessageBox(Handle, PWideChar('Вы действительно хотите отказать персонам в заселении?'), 'ИС УГТУ', MB_YESNO)=IDYES then
  begin
    inherited;
    try
      RDate:= Today;
      for i := 0 to (DBGridSpisokZayav.SelectedRows.Count-1) do
      begin
        DBGridSpisokZayav.DataSource.DataSet.GotoBookmark(Pointer(DBGridSpisokZayav.SelectedRows[i]));
        idz:= dmHOST.vVkSpisokZayav.FieldByName('IDZayavlenie').AsInteger;
        THOST_ZayavlenieController.Instance.AddDateUtv(idz,3,RDate);
      end;
    finally
      dmHOST.vVkSpisokZayav.Active:=false;
      dmHOST.vVkSpisokZayav.Active:=true;
    end;
  end;
end;

procedure TfmHOST_Zaselenie.BTVidDogovorClick(Sender: TObject);
var Cod,i:integer;
begin
  inherited;
  if DBGridPredvSpisok.SelectedRows.Count = 0   then
  begin
    MessageBox(Handle, 'Выберите персону!',
					  'ИС УГТУ', MB_OK);
  exit;
  end;
  for i := 0 to (DBGridPredvSpisok.SelectedRows.Count-1) do
    begin
    DBGridPredvSpisok.DataSource.DataSet.GotoBookmark(Pointer(DBGridPredvSpisok.SelectedRows[i]));
    Cod:=dmHOST.vHOST_PredvSpisok.FieldByName('nCode').AsInteger;
    THOST_ReportController.Instance.PrintDogovor(Cod);
    end;
end;

procedure TfmHOST_Zaselenie.BTZamenaRoomClick(Sender: TObject);
var i,idAdr,Cod: integer;
    HostNumber: integer;
    ZamenaRoom:TZamenaRoom;
begin
  TApplicationController.GetInstance.AddLogEntry('Открытие формы "Замена комнаты". Изменение номера комнаты персоне');
  inherited;
  if DBGridPredvSpisok.SelectedRows.Count = 0   then
  begin
    MessageBox(Handle, 'Выберите персону!',
					  'ИС УГТУ', MB_OK);
  exit;
  end;
  ZamenaRoom:=TZamenaRoom.Create(self);
  try
    ZamenaRoom.ShowModal;
    if (ZamenaRoom.ModalResult=mrOk) then
    begin
      for i := 0 to (DBGridPredvSpisok.SelectedRows.Count-1) do
      begin
        idAdr:=ZamenaRoom.ComBNumRoom.KeyValue;
        Cod:=dmHOST.vHOST_PredvSpisok.FieldByName('nCode').AsInteger;
        DBGridPredvSpisok.DataSource.DataSet.GotoBookmark(Pointer(DBGridPredvSpisok.SelectedRows[i]));
        THOST_ZayavlenieController.Instance.ZamenaRoom(idAdr,Cod);
      end;
    end;
  finally
    ZamenaRoom.Free;
    dmHOST.vHOST_PredvSpisok.Active:=false;
    dmHOST.vHOST_PredvSpisok.Active:=true;
  end;
end;

procedure TfmHOST_Zaselenie.DBGridInfoRoomTitleClick(Column: TColumnEh);
begin
  inherited;
  dmHOST.vInfoRoom.Sort:=
      Column.Field.DisplayName;
end;                             

procedure TfmHOST_Zaselenie.DBGridObjTitleClick(Column: TColumnEh);
begin
  inherited;
   dmHOST.vHostel.Sort:=
      Column.Field.DisplayName;
end;

procedure TfmHOST_Zaselenie.DBGridPredvSpisokTitleClick(Column: TColumnEh);
begin
  inherited;
  dmHOST.vHOST_PredvSpisok.Sort:=
      Column.Field.DisplayName;
end;

procedure TfmHOST_Zaselenie.DBGridPrikazTitleClick(Column: TColumnEh);
begin
  inherited;
 dmHOST.vPrikazNaZas.Sort:=
      Column.Field.DisplayName;
end;

procedure TfmHOST_Zaselenie.DBGridSpisokZayavTitleClick(Column: TColumnEh);
begin
  inherited;
  dmHOST.vVkSpisokZayav.Sort:=
      Column.Field.DisplayName;
end;

procedure TfmHOST_Zaselenie.DoRefreshFrame;
begin
  inherited;
  dmHOST.vInfoRoom.Close;
  dmHOST.vHostel.Close;

  dmHOST.vInfoRoom.Active:=true;
  THOST_ReportController.Instance.GetZayavl;


  if FrameObject is TDBNodeInviteHostObject then //общежитие
  begin
    dmHOST.vInfoRoom.Filter:= 'numhostel='+IntToStr(TDBNodeInviteHostObject(FrameObject).ik);
    dmHOST.vInfoRoom.Filtered:=true;
    dmHOST.vVkSpisokZayav.Filter:= 'numhostel='+IntToStr(TDBNodeInviteHostObject(FrameObject).ik);
    dmHOST.vVkSpisokZayav.Filtered:=true;
    dmHOST.vHOST_PredvSpisok.Filter:= 'numhostel='+IntToStr(TDBNodeInviteHostObject(FrameObject).ik);
    dmHOST.vHOST_PredvSpisok.Filtered:=true;
    dmHOST.vPrikazNaZas.Filter:= 'numhostel='+IntToStr(TDBNodeInviteHostObject(FrameObject).ik);
    dmHOST.vPrikazNaZas.Filtered:=true;
    TabSpisokObj.TabVisible:= false;
    TabSvedOKomn.TabVisible:= false;
    DBGridSpisokZayav.Columns[5].Visible:= false;
    DBGridPredvSpisok.Columns[3].Visible:= false;
    DBGridPrikaz.Columns[3].Visible:= false;
  end;

  if FrameObject is TDBNodeInviteObject then //общий заселение
  begin
    dmHOST.vInfoRoom.Filter:='';
    dmHOST.vInfoRoom.Filtered:=false;
    dmHOST.vVkSpisokZayav.Filter:='';
    dmHOST.vVkSpisokZayav.Filtered:=false;
    dmHOST.vHOST_PredvSpisok.Filter:='';
    dmHOST.vHOST_PredvSpisok.Filtered:=false;
    dmHOST.vPrikazNaZas.Filter:='';
    dmHOST.vPrikazNaZas.Filtered:=false;
    TabSpisokObj.TabVisible:= true;
    TabSvedOKomn.TabVisible:= true;
    DBGridSpisokZayav.Columns[5].Visible:= true;
    DBGridPredvSpisok.Columns[3].Visible:= true;
    DBGridPrikaz.Columns[3].Visible:= true;

    dmHOST.vHostel.Active:=true;
  end;

  TApplicationController.GetInstance.AddLogEntry('Обновление фрейма.');
end;

procedure TfmHOST_Zaselenie.PageZayavleniaChange(Sender: TObject);
begin
  inherited;
   if PageZayavlenia.ActivePage = TabSpisokZayav then
  begin
    TApplicationController.GetInstance.AddLogEntry('Переход на вкладку Список заявок.');
  dmHOST.vVkSpisokZayav.Active := false;
    try
      dmHOST.vVkSpisokZayav.Active := true;
    except
          MessageBox(Handle, 'Ошибка формирования списка заявлений.',
					  'ИС УГТУ', MB_OK);
    end;
  end;
  if PageZayavlenia.ActivePage = TabPredvSpisok then
  begin
  TApplicationController.GetInstance.AddLogEntry('Переход на вкладку Предварительный список.');
  dmHOST.vHOST_PredvSpisok.Active := false;
    try
      dmHOST.vHOST_PredvSpisok.Active := true;
    except
      MessageBox(Handle, 'Ошибка формирования предварительного списка.',
       'ИС УГТУ', MB_OK);
    end;
  end;
   if PageZayavlenia.ActivePage = TabPrikaz then
  begin
  TApplicationController.GetInstance.AddLogEntry('Переход на вкладку Приказ на заселение.');
  dmHOST.vPrikazNaZas.Active := false;
    try
      dmHOST.vPrikazNaZas.Active := true;
    except
      MessageBox(Handle, 'Ошибка формирования приказа на заселение.',
       'ИС УГТУ', MB_OK);
    end;
  end;
end;

procedure TfmHOST_Zaselenie.BTAddVPrikClick(Sender: TObject);
 var i,idz,idPrik: integer;
    PrikazOZas: TPrikazOZas;
    HostNumber: integer;
begin
  TApplicationController.GetInstance.AddLogEntry('Открытие формы "Приказ о заселении". Добавление номера приказа о заселении.');
  inherited;
   if DBGridPredvSpisok.SelectedRows.Count = 0   then
  begin
    MessageBox(Handle, 'Выделите персон(у)!',
					  'ИС УГТУ', MB_OK);
  exit;
  end;
   PrikazOZas:= TPrikazOZas.Create(self);
  try
    PrikazOZas.ShowModal;
    if (PrikazOZas.ModalResult=mrOk) then
    begin
      for i := 0 to (DBGridPredvSpisok.SelectedRows.Count-1) do
      begin
        idz:= dmHOST.vHOST_PredvSpisok.FieldByName('IDZayavlenie').AsInteger;
        idPrik:=PrikazOZas.dbcbeNumPrik.KeyValue;
        DBGridPredvSpisok.DataSource.DataSet.GotoBookmark(Pointer(DBGridPredvSpisok.SelectedRows[i]));
        THOST_ZayavlenieController.Instance.AddPrikOZas(idz,idPrik);
      end;
    end;
  finally
    PrikazOZas.Free;
    dmHOST.vHOST_PredvSpisok.Active:=false;
    dmHOST.vHOST_PredvSpisok.Active:=true;
  end;
end;

end.
