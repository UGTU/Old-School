unit HOST_Projivaysh;

 {#Author llodigina@ist.ugtu.net}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseFrame, StdCtrls, Buttons, ExtCtrls, GridsEh, DBGridEh, ComCtrls,
  Menus, ImgList, ActnList, ToolWin;

type
  TfmHOST_Projivaysh = class(TfmBase)
    PageProjiv: TPageControl;
    TabSpisokObj: TTabSheet;
    TabSpisokRoom: TTabSheet;
    TabSpisokProj: TTabSheet;
    DBGridSpisObj: TDBGridEh;
    ToolBar1: TToolBar;
    alHOSTActions: TActionList;
    actUtvZayav: TAction;
    ImageList1: TImageList;
    DBGridSpisRoom: TDBGridEh;
    DBGridSpisProj: TDBGridEh;
    BTAddRoom: TToolButton;
    BTDeleteRoom: TToolButton;
    actSaveRooms: TAction;
    actCancelUpdRooms: TAction;
    ToolBar2: TToolBar;
    BTPereselit: TToolButton;
    BTViselit: TToolButton;
    BTRedaktRoom: TToolButton;
    TabSpisokNarush: TTabSheet;
    ToolBar3: TToolBar;
    DBGridSpisokNarush: TDBGridEh;
    BTAddNarush: TToolButton;
    BTEditNarush: TToolButton;
    BTDeleteNar: TToolButton;
    BTProdlitProzh: TToolButton;
    BTPordlProzhVDrRoom: TToolButton;
    procedure DBGridSpisObjTitleClick(Column: TColumnEh);
    procedure DBGridSpisRoomTitleClick(Column: TColumnEh);
    procedure DBGridSpisProjTitleClick(Column: TColumnEh);
    procedure PageProjivChange(Sender: TObject);
    procedure BTAddRoomClick(Sender: TObject);
    procedure actSaveRoomsExecute(Sender: TObject);
    procedure actSaveRoomsUpdate(Sender: TObject);
    procedure DBGridSpisRoomColumns2UpdateData(Sender: TObject;
      var Text: string; var Value: Variant; var UseText, Handled: Boolean);
    procedure actCancelUpdRoomsExecute(Sender: TObject);
    procedure BTDeleteRoomClick(Sender: TObject);
    procedure BTPereselitClick(Sender: TObject);
    procedure BTRedaktRoomClick(Sender: TObject);
    procedure BTViselitClick(Sender: TObject);
    procedure BTAddNarushClick(Sender: TObject);
    procedure BTEditNarushClick(Sender: TObject);
    procedure DBGridSpisokNarushTitleClick(Column: TColumnEh);
    procedure BTDeleteNarClick(Sender: TObject);
    procedure BTPordlProzhVDrRoomClick(Sender: TObject);
    procedure BTProdlitProzhClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure DoRefreshFrame;override;
    function DoApply():boolean; override;
    procedure DoCancel(); override;
    { Public declarations }
  end;

var
  fmHOST_Projivaysh: TfmHOST_Projivaysh;

implementation

{$R *.dfm}
uses uHOST,ApplicationController,HOST_AddRoom,HOST_ZamenaRoom,HOST_ZayavlenieController,
HOST_ProjivayushieController,HOST_Viselit,HOST_AddNarush,DBTVHabitatsObj,DBTVHabitatsHostObj,
DateUtils,HOST_ProdlProzh,DBTVHabitatsFloorObj,DBTVHabitatsRoomObj;


procedure TfmHOST_Projivaysh.actCancelUpdRoomsExecute(Sender: TObject);
begin
  inherited;
  Cancel;
end;

procedure TfmHOST_Projivaysh.actSaveRoomsExecute(Sender: TObject);
begin
  inherited;
  Apply;
end;

procedure TfmHOST_Projivaysh.actSaveRoomsUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := modified;
end;

procedure TfmHOST_Projivaysh.BTAddNarushClick(Sender: TObject);
begin
  TApplicationController.GetInstance.AddLogEntry('Открытие формы "Добавление нарушения".');
inherited;
  AddNarush:=TAddNarush.Create(self);
    try
      AddNarush.DateNar.value:= today;
      AddNarush.Flag:=1;
      AddNarush.NumHost:= TDBNodeHabitatsHostObject(FrameObject).ik;
      AddNarush.Caption := 'Добавление нарушения в (общежитие №'+IntToStr(TDBNodeHabitatsHostObject(FrameObject).ik)+')';
      AddNarush.ShowModal;
    finally
      AddNarush.Free;
      THOST_ProjivayushieController.Instance.VivodNarushPoObj(TDBNodeHabitatsHostObject(FrameObject).ik)
    end;
end;

procedure TfmHOST_Projivaysh.BTAddRoomClick(Sender: TObject);
begin
  TApplicationController.GetInstance.AddLogEntry('Открытие формы "Добавление комнаты".');
inherited;
  AddRoom:=TAddRoom.Create(self);
    try
        if (FrameObject is TDBNodeHabitatsHostObject) then
     begin
        AddRoom.ComBNumHost.KeyValue:=TDBNodeHabitatsHostObject(FrameObject).ik;
        AddRoom.ComBNumHost.Enabled:=false;
        THOST_ProjivayushieController.Instance.VivodEtazh(TDBNodeHabitatsHostObject(FrameObject).ik);
     end;

      if (FrameObject is TDBNodeHabitatsFloorObject) then
      begin
        AddRoom.ComBNumHost.KeyValue:=TDBNodeHabitatsHostObject(TDBNodeHabitatsFloorObject(FrameObject).Parent).ik;
        AddRoom.ComBNumHost.Enabled:=false;
        AddRoom.ComBNumEtazh.KeyValue:=TDBNodeHabitatsFloorObject(FrameObject).ik;
        AddRoom.ComBNumEtazh.Enabled:=false;
     end;

      AddRoom.TipDial:=1;
      AddRoom.ShowModal;
    finally
      AddRoom.Free;
      dmHOST.vVklSpisRoom.Active:=false;
      dmHOST.vVklSpisRoom.Active:=true;
    end;
end;

procedure TfmHOST_Projivaysh.BTDeleteNarClick(Sender: TObject);
var IDNar:integer;
begin
  inherited;
  if (MessageBox(Handle, '           Удалить нарушение и всех его нарушителей?','ИС "УГТУ"',
          MB_YESNO) = IDYES) then
          begin
            IDNar:=dmHOST.ProcVivodNurushPoOb.FieldByName('IDNarushenie').AsInteger;
            THOST_ProjivayushieController.Instance.DeleteFromSpisokNarush(IDNar);
            THOST_ProjivayushieController.Instance.VivodNarushPoObj(TDBNodeHabitatsHostObject(FrameObject).ik)
          end;
end;

procedure TfmHOST_Projivaysh.BTDeleteRoomClick(Sender: TObject);
var ikAdr:integer;
begin
  inherited;
  if (MessageBox(Handle, '           Удалить комнату?','ИС "УГТУ"',
          MB_YESNO) = IDYES) then
  begin
      ikAdr:=dmHOST.vVklSpisRoom.FieldByName('ik_address').AsInteger;
      TApplicationController.GetInstance.AddLogEntry('Удаление комнаты');
      THOST_ProjivayushieController.Instance.DeleteFromvVklSpisRoom(ikAdr);
      dmHOST.vVklSpisRoom.Close;
      dmHOST.vVklSpisRoom.Open;
  end;
end;

procedure TfmHOST_Projivaysh.BTEditNarushClick(Sender: TObject);
var IDNar:integer;
 li: TListItem;
begin
TApplicationController.GetInstance.AddLogEntry('Открытие формы "Редактирование нарушения".');
  inherited;
  AddNarush:=TAddNarush.Create(self);
  try
    AddNarush.NumHost:= TDBNodeHabitatsHostObject(FrameObject).ik;
    AddNarush.Flag:=0;
    IDNar:=dmHOST.ProcVivodNurushPoOb.FieldByName('IDNarushenie').AsInteger;
    AddNarush.IDNarush:=IDNar;
    AddNarush.ComBNarush.KeyValue:=dmHOST.ProcVivodNurushPoOb.FieldByName('IDVidNurush').Value;
    AddNarush.DateNar.value:=dmHOST.ProcVivodNurushPoOb.FieldByName('DataNurush').Value;

    AddNarush.Caption:='Редактирование нарушения';
    THOST_ProjivayushieController.Instance.VivodPersonPoNarush(IDNar);
    AddNarush.ListViewNurush.Clear;

    while not dmHOST.ProcPersonPoNarush.Eof do
    begin
        li := AddNarush.ListViewNurush.Items.Add;
        li.Caption := dmHOST.ProcPersonPoNarush.FieldValues['FIO'];
        li.SubItems.Add(dmHOST.ProcPersonPoNarush.FieldValues['nCode']);
        li.SubItems.Add(dmHOST.ProcPersonPoNarush.FieldValues['ik_address']);
        dmHOST.ProcPersonPoNarush.Next;
    end;
    AddNarush.ShowModal;
  finally
    AddNarush.Free;
    THOST_ProjivayushieController.Instance.VivodNarushPoObj(TDBNodeHabitatsHostObject(FrameObject).ik)
  end;
end;

procedure TfmHOST_Projivaysh.BTPereselitClick(Sender: TObject);
var i,idAdr,Cod: integer;
    ZamenaRoom:TZamenaRoom;
begin
  inherited;
  TApplicationController.GetInstance.AddLogEntry('Открытие формы "Замена комнаты". Изменение номера комнаты персоне');
  inherited;
  if DBGridSpisProj.SelectedRows.Count = 0   then
  begin
    MessageBox(Handle, 'Выберите персону!',
					  'ИС УГТУ', MB_OK);
  exit;
  end;
  ZamenaRoom:=TZamenaRoom.Create(self);
  try
    if (FrameObject is TDBNodeHabitatsHostObject) then
     begin
        ZamenaRoom.ComBNumHost.KeyValue:=TDBNodeHabitatsHostObject(FrameObject).ik;
        ZamenaRoom.ComBNumHost.Enabled:=false;
        THOST_ProjivayushieController.Instance.VivodEtazh(TDBNodeHabitatsHostObject(FrameObject).ik);
     end;

      if (FrameObject is TDBNodeHabitatsFloorObject) then
      begin
        ZamenaRoom.ComBNumHost.KeyValue:=TDBNodeHabitatsHostObject(TDBNodeHabitatsFloorObject(FrameObject).Parent).ik;
        ZamenaRoom.ComBNumHost.Enabled:=false;
        THOST_ProjivayushieController.Instance.VivodEtazh(TDBNodeHabitatsHostObject(TDBNodeHabitatsFloorObject(FrameObject).Parent).ik);
     end;

     if (FrameObject is TDBNodeHabitatsRoomObject) then
      begin
        ZamenaRoom.ComBNumHost.KeyValue:=TDBNodeHabitatsHostObject(TDBNodeHabitatsFloorObject(TDBNodeHabitatsRoomObject(FrameObject).Parent).Parent).ik;
        ZamenaRoom.ComBNumHost.Enabled:=false;
        THOST_ProjivayushieController.Instance.VivodEtazh(TDBNodeHabitatsHostObject(TDBNodeHabitatsFloorObject(TDBNodeHabitatsRoomObject(FrameObject).Parent).Parent).ik);
     end;

     ZamenaRoom.ShowModal;
    if (ZamenaRoom.ModalResult=mrOk) then
    begin
      for i := 0 to (DBGridSpisProj.SelectedRows.Count-1) do
      begin
        idAdr:=ZamenaRoom.ComBNumRoom.KeyValue;
        Cod:=dmHOST.vSpisProj.FieldByName('nCode').AsInteger;
        DBGridSpisProj.DataSource.DataSet.GotoBookmark(Pointer(DBGridSpisProj.SelectedRows[i]));
        THOST_ZayavlenieController.Instance.ZamenaRoom(idAdr,Cod);
      end;
    end;
  finally
    ZamenaRoom.Free;
    dmHOST.vSpisProj.Active:=false;
    dmHOST.vSpisProj.Active:=true;
  end;
end;

procedure TfmHOST_Projivaysh.BTPordlProzhVDrRoomClick(Sender: TObject);
var i,Cod,IDZayav,numHost:integer;
    frmProdlProzh: TfrmProdlProzh;
begin
  TApplicationController.GetInstance.AddLogEntry('Открытие формы "Продление проживания".');
  inherited;
  frmProdlProzh:= TfrmProdlProzh.Create(self);
  try
     if (FrameObject is TDBNodeHabitatsHostObject) then
     begin
        frmProdlProzh.ComBNumHost.KeyValue:=TDBNodeHabitatsHostObject(FrameObject).ik;
        frmProdlProzh.ComBNumHost.Enabled:=false;
        THOST_ProjivayushieController.Instance.VivodEtazh(TDBNodeHabitatsHostObject(FrameObject).ik);
     end;

      if (FrameObject is TDBNodeHabitatsFloorObject) then
      begin
        frmProdlProzh.ComBNumHost.KeyValue:=TDBNodeHabitatsHostObject(TDBNodeHabitatsFloorObject(FrameObject).Parent).ik;
        frmProdlProzh.ComBNumHost.Enabled:=false;
        THOST_ProjivayushieController.Instance.VivodEtazh(TDBNodeHabitatsHostObject(TDBNodeHabitatsFloorObject(FrameObject).Parent).ik);
     end;

     if (FrameObject is TDBNodeHabitatsRoomObject) then
      begin
        frmProdlProzh.ComBNumHost.KeyValue:=TDBNodeHabitatsHostObject(TDBNodeHabitatsFloorObject(TDBNodeHabitatsRoomObject(FrameObject).Parent).Parent).ik;
        frmProdlProzh.ComBNumHost.Enabled:=false;
        THOST_ProjivayushieController.Instance.VivodEtazh(TDBNodeHabitatsHostObject(TDBNodeHabitatsFloorObject(TDBNodeHabitatsRoomObject(FrameObject).Parent).Parent).ik);
      end;

    frmProdlProzh.ShowModal;
    if (frmProdlProzh.ModalResult=mrOk) then
    begin
      for i := 0 to (DBGridSpisProj.SelectedRows.Count-1) do
      begin
        DBGridSpisProj.DataSource.DataSet.GotoBookmark(Pointer(DBGridSpisProj.SelectedRows[i]));
        Cod:=dmHOST.vSpisProj.FieldByName('nCode').AsInteger;
        numHost:=frmProdlProzh.ComBNumHost.KeyValue;
        IDZayav:=THOST_ProjivayushieController.Instance.AddZayavNaProdlProj(today,Cod,numHost);
        THOST_ProjivayushieController.Instance.AddZayavNaZasInRoom(IDZayav,frmProdlProzh.ComBRoom.KeyValue);
      end;
    end;
  finally
    frmProdlProzh.Free;
    dmHOST.vSpisProj.Active:=false;
    dmHOST.vSpisProj.Active:=true;
  end;
end;

procedure TfmHOST_Projivaysh.BTProdlitProzhClick(Sender: TObject);
var i,Cod,IDZayav,numHost:integer;
begin
 TApplicationController.GetInstance.AddLogEntry('Продление проживание на текущую комнату".');
  inherited;
 if (MessageBox(Handle, '           Добавить заявление на продление проживания персонам?','ИС "УГТУ"',
          MB_YESNO) = IDYES) then
          begin
             try
                for i := 0 to (DBGridSpisProj.SelectedRows.Count-1) do
                begin
                  DBGridSpisProj.DataSource.DataSet.GotoBookmark(Pointer(DBGridSpisProj.SelectedRows[i]));
                  Cod:=dmHOST.vSpisProj.FieldByName('nCode').AsInteger;
                  numHost:=frmProdlProzh.ComBNumHost.KeyValue;
                  IDZayav:=THOST_ProjivayushieController.Instance.AddZayavNaProdlProj(today,Cod,numHost);
                  THOST_ProjivayushieController.Instance.AddZayavNaZasInRoom(IDZayav,dmHOST.vSpisProj.FieldByName('ik_address').AsInteger);
                end;
              finally
                dmHOST.vSpisProj.Active:=false;
                dmHOST.vSpisProj.Active:=true;
              end;
           end;
end;

procedure TfmHOST_Projivaysh.BTRedaktRoomClick(Sender: TObject);
begin
  inherited;
  TApplicationController.GetInstance.AddLogEntry('Открытие формы "Редактирование комнаты".');
  AddRoom:=TAddRoom.Create(self);
    try
      AddRoom.TipDial:=2;
      AddRoom.ikAdr:=dmHOST.vVklSpisRoom.FieldByName('ik_address').AsInteger;
      AddRoom.ComBNumHost.Value:= dmHOST.vVklSpisRoom.FieldByName('NumHostel').AsInteger;
      AddRoom.ComBNumEtazh.Value:= dmHOST.vVklSpisRoom.FieldByName('NumEtazh').AsInteger;
      AddRoom.TextBNumRoom.Value:= dmHOST.vVklSpisRoom.FieldByName('FlatNumber').AsInteger;
      AddRoom.TextBKolMest.Value:= dmHOST.vVklSpisRoom.FieldByName('KolMest').AsInteger;
      AddRoom.ShowModal;
    finally
      AddRoom.Free;
      dmHOST.vVklSpisRoom.Active:=false;
      dmHOST.vVklSpisRoom.Active:=true;
    end;
end;

procedure TfmHOST_Projivaysh.BTViselitClick(Sender: TObject);
var i,Cod,idPrik,idPrich: integer;
    DataVis:tdatetime;
    Viselit: TViselit;
begin
  TApplicationController.GetInstance.AddLogEntry('Открытие формы "Выселение персоны". Добавление приказа и причины о выселении.');
  inherited;
  begin
  Viselit:=TViselit.Create(self);
  try
    Viselit.ShowModal;
    if (Viselit.ModalResult=mrOk) then
    begin
      for i := 0 to (DBGridSpisProj.SelectedRows.Count-1) do
      begin
        DBGridSpisProj.DataSource.DataSet.GotoBookmark(Pointer(DBGridSpisProj.SelectedRows[i]));
        Cod:=dmHOST.vSpisProj.FieldByName('nCode').AsInteger;
        idPrik:=Viselit.ComBNumPrik.KeyValue;
        idPrich:=Viselit.ComBPrichVis.KeyValue;
        DataVis:=Viselit.DatePicDataVis.Value;
        THOST_ProjivayushieController.Instance.Viselit(Cod,idPrik,idPrich,DataVis);
      end;
    end;
  finally
    Viselit.Free;
    dmHOST.vSpisProj.Active:=false;
    dmHOST.vSpisProj.Active:=true;
  end;
 end;
end;

procedure TfmHOST_Projivaysh.DBGridSpisObjTitleClick(Column: TColumnEh);
begin
  inherited;
   dmHOST.vHostel.Sort:=
      Column.Field.DisplayName;
end;

procedure TfmHOST_Projivaysh.DBGridSpisokNarushTitleClick(Column: TColumnEh);
begin
  inherited;
  dmHOST.ProcVivodNurushPoOb.Sort:=
      Column.Field.DisplayName;
end;

procedure TfmHOST_Projivaysh.DBGridSpisProjTitleClick(Column: TColumnEh);
begin
  inherited;
   dmHOST.vSpisProj.Sort:=
      Column.Field.DisplayName;
end;

procedure TfmHOST_Projivaysh.DBGridSpisRoomColumns2UpdateData(Sender: TObject;
  var Text: string; var Value: Variant; var UseText, Handled: Boolean);
begin
  inherited;
  Modified:= true;
end;

procedure TfmHOST_Projivaysh.DBGridSpisRoomTitleClick(Column: TColumnEh);
begin
  inherited;
   dmHOST.vVklSpisRoom.Sort:=
      Column.Field.DisplayName;
end;

function TfmHOST_Projivaysh.DoApply: boolean;
begin
  dmHOST.vVklSpisRoom.UpdateBatch();
  dmHOST.vVklSpisRoom.Close;
  dmHOST.vVklSpisRoom.Open;
  Modified:= false;
end;

procedure TfmHOST_Projivaysh.DoCancel;
begin
  inherited;
  dmHOST.vVklSpisRoom.Close;
  dmHOST.vVklSpisRoom.Open;
  Modified:= false;
end;

procedure TfmHOST_Projivaysh.DoRefreshFrame;
begin
  inherited;
   if FrameObject is TDBNodeHabitatsObject then //Проживающие
  begin
    TabSpisokObj.TabVisible:= true;
    DBGridSpisRoom.Columns[0].Visible:= true;
    DBGridSpisProj.Columns[0].Visible:= true;
    TabSpisokNarush.TabVisible:= false;
    dmHOST.vVklSpisRoom.Filter:= '';
    dmHOST.vVklSpisRoom.Filtered:=false;
    dmHOST.vSpisProj.Filter:= '';
    dmHOST.vSpisProj.Filtered:=false;
    dmHOST.ProcVivodNurushPoOb.Filtered:=false;
  end;

  if FrameObject is TDBNodeHabitatsHostObject then //Общежитие
  begin
    dmHOST.vVklSpisRoom.Filter:= 'numhostel='+IntToStr(TDBNodeHabitatsHostObject(FrameObject).ik);
    dmHOST.vVklSpisRoom.Filtered:=true;
    dmHOST.vSpisProj.Filter:= 'numhostel='+IntToStr(TDBNodeHabitatsHostObject(FrameObject).ik);
    dmHOST.vSpisProj.Filtered:=true;
    dmHOST.ProcVivodNurushPoOb.Filter:= 'numhostel='+IntToStr(TDBNodeHabitatsHostObject(FrameObject).ik);
    dmHOST.ProcVivodNurushPoOb.Filtered:=true;

    TabSpisokObj.TabVisible:= false;
    DBGridSpisRoom.Columns[0].Visible:= false;
    DBGridSpisProj.Columns[0].Visible:= false;
    TabSpisokNarush.TabVisible:= true;
    BTProdlitProzh.Visible:= true;
    BTPordlProzhVDrRoom.Visible:= true;
    dmHOST.vVklSpisRoom.Active := false;
    dmHOST.vVklSpisRoom.Active := true;

  end;

  if  FrameObject is TDBNodeHabitatsFloorObject then   //этаж
  begin
    dmHOST.vVklSpisRoom.Filter:= '(numhostel='+IntToStr(TDBNodeHabitatsHostObject(TDBNodeHabitatsFloorObject(FrameObject).Parent).ik)
    + ') and (NumEtazh='+IntToStr(TDBNodeHabitatsFloorObject(FrameObject).ik)+')';
    dmHOST.vVklSpisRoom.Filtered:=true;
    dmHOST.vSpisProj.Filter:= '(numhostel='+IntToStr(TDBNodeHabitatsHostObject(TDBNodeHabitatsFloorObject(FrameObject).Parent).ik)
    + ') and (NumEtazh='+IntToStr(TDBNodeHabitatsFloorObject(FrameObject).ik)+')';
    dmHOST.vSpisProj.Filtered:=true;
    TabSpisokObj.TabVisible:= false;
    DBGridSpisRoom.Columns[0].Visible:= false;
    DBGridSpisRoom.Columns[1].Visible:= false;
    DBGridSpisProj.Columns[0].Visible:= false;
    TabSpisokNarush.TabVisible:= false;
    BTProdlitProzh.Visible:= true;
    BTPordlProzhVDrRoom.Visible:= true;
  end;

    if  FrameObject is TDBNodeHabitatsRoomObject then   //комната
  begin
    dmHOST.vSpisProj.Filter:= '(numhostel='+IntToStr(TDBNodeHabitatsHostObject(TDBNodeHabitatsFloorObject(TDBNodeHabitatsRoomObject(FrameObject).Parent).Parent).ik)
    + ') and (NumEtazh='+IntToStr(TDBNodeHabitatsHostObject(TDBNodeHabitatsFloorObject(TDBNodeHabitatsRoomObject(FrameObject).Parent).Parent).ik)
    +') and (ik_address='+IntToStr(TDBNodeHabitatsRoomObject(FrameObject).ik)+')';
    dmHOST.vSpisProj.Filtered:=true;
    TabSpisokObj.TabVisible:= false;
    DBGridSpisRoom.Columns[0].Visible:= false;
    DBGridSpisRoom.Columns[1].Visible:= false;
    DBGridSpisProj.Columns[0].Visible:= false;
    DBGridSpisProj.Columns[1].Visible:= false;
    TabSpisokRoom.TabVisible:= false;
    TabSpisokNarush.TabVisible:= false;
    BTProdlitProzh.Visible:= true;
    BTPordlProzhVDrRoom.Visible:= true;
    dmHOST.vSpisProj.Active := false;
    dmHOST.vSpisProj.Active := true;

  end;

  dmHOST.vHostel.Close;
  dmHOST.vHostel.Active:=true;
  dmHOST.tHostel.Close;
  dmHOST.tHostel.Active:=true;

  TApplicationController.GetInstance.AddLogEntry('Обновление фрейма.');
end;

procedure TfmHOST_Projivaysh.PageProjivChange(Sender: TObject);
begin
  inherited;
 if PageProjiv.ActivePage = TabSpisokRoom then
  begin
    TApplicationController.GetInstance.AddLogEntry('Переход на вкладку Список комнат.');
    dmHOST.vVklSpisRoom.Active := false;
    try
      dmHOST.vVklSpisRoom.Active := true;
      modified:= false;
    except
          MessageBox(Handle, 'Ошибка формирования списка комнат.',
					  'ИС УГТУ', MB_OK);
    end;
  end;

  if PageProjiv.ActivePage = TabSpisokProj then
  begin
    TApplicationController.GetInstance.AddLogEntry('Переход на вкладку Список проживающих.');
    dmHOST.vSpisProj.Active := false;
    try
      dmHOST.vSpisProj.Active := true;
    except
      MessageBox(Handle, 'Ошибка формирования списка проживающих.',
       'ИС УГТУ', MB_OK);
    end;
  end;

  if PageProjiv.ActivePage = TabSpisokObj then
  begin
    TApplicationController.GetInstance.AddLogEntry('Переход на вкладку Список общежитий.');
  end;

   if PageProjiv.ActivePage = TabSpisokNarush then
  begin
    TApplicationController.GetInstance.AddLogEntry('Переход на вкладку Список нарушений.');
    try
      THOST_ProjivayushieController.Instance.VivodNarushPoObj(TDBNodeHabitatsHostObject(FrameObject).ik)
    except
      MessageBox(Handle, 'Ошибка формирования списка нарушений.',
       'ИС УГТУ', MB_OK);
    end;
  end;
end;

end.
