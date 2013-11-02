unit ABIT_add_raspkab_dialog;
  {#Author tanyav@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, StdCtrls, Grids, DBGridEh, ActnList, Buttons,
  ExtCtrls, DBCtrls, ComCtrls, DB, ADODB, DBGrids, ToolWin, ImgList, Mask,
  DBCtrlsEh, DBLookupEh;

type
  TfrmRaspkab = class(TfrmBaseDialog)
    RaspKab: TDataSource;
    DSPrepods: TDataSource;
    ImageList1: TImageList;
    DSAudFree: TDataSource;
    DSprepodsrasp: TDataSource;
    lv1: TListView;
    SpeedButton4: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    lv2: TListView;
    Label1: TLabel;
    actRight: TAction;
    actAllRight: TAction;
    actLeft: TAction;
    actAllLeft: TAction;
    dbcmbxRooms: TDBLookupComboboxEh;
    lik_rasp_kab: TLabel;
    procedure AddOneData();
    procedure AddAllData();
    procedure DelOneData();
    procedure DelAllData();
    procedure AddAllClick(Sender: TObject);
    procedure AddOneClick(Sender: TObject);
    procedure DelOneClick(Sender: TObject);
    procedure DelAllClick(Sender: TObject);
    procedure AddPrepodOne();
    procedure AddPrepodAll();
    procedure DelPrepodOne();
    procedure DelPrepodAll();
    procedure AddpAllClick(Sender: TObject);
    procedure AddPOneClick(Sender: TObject);
    procedure DelPOneClick(Sender: TObject);
    procedure DelPAllClick(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure AudsTitleClick(Column: TColumnEh);
    procedure rassadkaTitleClick(Column: TColumnEh);
    procedure PrepodsTitleClick(Column: TColumnEh);
    procedure raspprepodsTitleClick(Column: TColumnEh);
    procedure actRightUpdate(Sender: TObject);
    procedure actAllRightUpdate(Sender: TObject);
    procedure actLeftUpdate(Sender: TObject);
    procedure actAllLeftUpdate(Sender: TObject);
    procedure actRightExecute(Sender: TObject);
    procedure actAllRightExecute(Sender: TObject);
    procedure actLeftExecute(Sender: TObject);
    procedure actAllLeftExecute(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  protected
    function DoApply:boolean; override;
  public
    constructor create();
    procedure GetKabRaspData();
    { Public declarations }
  end;

var
  frmRaspkab: TfrmRaspkab;
  TB,TE:string;
  dateof:TDatetime;
implementation

uses AbiturientAbitProcs, AbiturientFacade, AbiturientRaspisanieProcs,
  AbiturientBaseProcs, uDM, uDMAbiturientRasp;

{$R *.dfm}

procedure TfrmRaspkab.actRightUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= (lv1.Selected<>nil);
end;

procedure TfrmRaspkab.actAllRightUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= (lv1.Items.Count>0);
end;

procedure TfrmRaspkab.actLeftUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= (lv2.Selected<>nil);
end;

procedure TfrmRaspkab.actAllLeftUpdate(Sender: TObject);
begin
   (Sender as TAction).Enabled:= (lv2.Items.Count>0);
end;

procedure TfrmRaspkab.actRightExecute(Sender: TObject);
var  li: TListItem;
begin
  li := lv2.Items.Add;
  li.Caption := lv1.Selected.Caption;
  li.SubItems.Add(lv1.Selected.SubItems[0]);
  lv1.Selected.Delete;
  isModified:=true;
end;

procedure TfrmRaspkab.actAllRightExecute(Sender: TObject);
var  li: TListItem;
  i:integer;
begin
  for i:=0 to lv1.Items.Count-1 do
  begin
    try
      li := lv2.Items.Add;
      li.Caption := lv1.Items.Item[0].Caption;
      li.SubItems.Add(lv1.Items.Item[0].SubItems[0]);
      lv1.Items.Item[0].Delete;
    except
    end;
  end;
  isModified:=true;
end;

procedure TfrmRaspkab.actLeftExecute(Sender: TObject);
var  li: TListItem;
begin
  li := lv1.Items.Add;
  li.Caption := lv2.Selected.Caption;
  li.SubItems.Add(lv2.Selected.SubItems[0]);
  lv2.Selected.Delete;
  isModified:=true;
end;

procedure TfrmRaspkab.actAllLeftExecute(Sender: TObject);
var  li: TListItem;
  i:integer;
begin
  for i:=0 to lv2.Items.Count-1 do
  begin
    try
      li := lv1.Items.Add;
      li.Caption := lv2.Items.Item[0].Caption;
      li.SubItems.Add(lv2.Items.Item[0].SubItems[0]);
      lv2.Items.Item[0].Delete;
    except
    end;
  end;
  isModified:=true;
end;

function TfrmRaspkab.DoApply: Boolean;
//var  i:integer;
begin
{  //если необходимо, закрепляем кабинет
  if (lik_rasp_kab.Caption='-1') then
  begin
    DMAbiturientRasp.adospAbitUpdateKabMetodist.Close;
    DMAbiturientRasp.adospAbitUpdateKabMetodist.ProcedureName:= 'ABIT_Add_rasp_kab;1';
    with DMAbiturientRasp.adospAbitUpdateKabMetodist.Parameters do
    begin
      Clear;
      CreateParameter('@RETURN_VALUE',ftBCD,pdReturnValue,0,0);
      CreateParameter('@id_rasp',ftBCD,pdInput,0,DMAbiturientRasp.adospAbitNotBusyKabid_rasp.Value);
      CreateParameter('@ik_kab',ftBCD,pdInput,0,DMAbiturientRasp.adospAbitNotBusyKabik_room.Value);
    end;
    DMAbiturientRasp.adospAbitUpdateKabMetodist.ExecProc;
    lik_rasp_kab.Caption:=IntToStr(DMAbiturientRasp.adospAbitUpdateKabMetodist.Parameters.ParamValues['@RETURN_VALUE']);
  end;

  //добавление методистов
  DMAbiturientRasp.adospAbitUpdateKabMetodist.Close;
  DMAbiturientRasp.adospAbitUpdateKabMetodist.ProcedureName:= 'ABIT_add_metodist_rassadka;1';
  with DMAbiturientRasp.adospAbitUpdateKabMetodist.Parameters do
  begin
    Clear;
    AddParameter;
    Items[0].Value := lik_rasp_kab.Caption;
    AddParameter;
    Items[1].Value := 0;
  end;
  DMAbiturientRasp.adospAbitKabMetodists.Filter:='';
  DMAbiturientRasp.adospAbitKabMetodists.Filtered:=false;
  //просматриваем, закрепляем "новых" методистов
  for i:=0 to lv2.Items.Count-1 do
    try
      if DMAbiturientRasp.adospAbitKabMetodists.Locate('ik_metodist',StrToInt(lv2.Items.Item[i].SubItems[0]),[loCaseInsensitive]) then
        if (DMAbiturientRasp.adospAbitKabMetodistsid_rasp_kab.Value=-1) then
        begin
            DMAbiturientRasp.adospAbitUpdateKabMetodist.Parameters.Items[1].Value := StrToInt(lv2.Items.Item[i].SubItems[0]);
            DMAbiturientRasp.adospAbitUpdateKabMetodist.ExecProc;
        end;
    except
    end;

  //удаление методистов закрепленных прежде
  DMAbiturientRasp.adospAbitUpdateKabMetodist.Close;
  DMAbiturientRasp.adospAbitUpdateKabMetodist.ProcedureName:= 'ABIT_del_Metodist_rassadka;1';
  with DMAbiturientRasp.adospAbitUpdateKabMetodist.Parameters do
  begin
    Clear;
    AddParameter;
    Items[0].Value := lik_rasp_kab.Caption;
    AddParameter;
    Items[1].Value := 0;
  end;
  for i:=0 to lv1.Items.Count-1 do
    try
      if DMAbiturientRasp.adospAbitKabMetodists.Locate('ik_metodist',StrToInt(lv1.Items.Item[i].SubItems[0]),[loCaseInsensitive]) then
        if (DMAbiturientRasp.adospAbitKabMetodistsid_rasp_kab.AsString=lik_rasp_kab.Caption) then
        begin
            DMAbiturientRasp.adospAbitUpdateKabMetodist.Parameters.Items[1].Value := StrToInt(lv2.Items.Item[i].SubItems[0]);
            DMAbiturientRasp.adospAbitUpdateKabMetodist.ExecProc;
        end;
    except
    end;
  isModified := false;
  DMAbiturientRasp.adospAbitNotBusyKab.Close;
  DMAbiturientRasp.adospAbitNotBusyKab.Open;
  try
    dbcmbxRooms.KeyValue:=DMAbiturientRasp.adospAbitNotBusyKabik_room.Value;
  except
  end;     }
  result:=true;
end;













procedure TfrmRaspkab.AddPrepodOne();
begin
{ (Facade.ProcList.DataSetByClassType[TRaspisanieABITPrepodsAddGet] as TRaspisanieABITPrepodsAddGet).AddData(StrToInt(id_rasp.Caption),Strtoint(i_tabn.Caption));
 (Facade.ProcList.DataSetByClassType[TRaspisanieABIT_rasp_prepodsGet] as TRaspisanieABIT_rasp_prepodsGet).GetData(StrToInt(id_rasp.caption));
 (Facade.ProcList.DataSetByClassType[TRaspisanieABIT_prepodsGet] as TRaspisanieABIT_prepodsGet).GetData(StrToInt(id_rasp.caption));
 if (Facade.ProcList.DataSetByClassType[TRaspisanieABIT_prepodsGet]).IsEmpty then
  begin AddPOne.Enabled:=false;AddPAll.Enabled:=false; end;
 DelPOne.Enabled:=true;
 DelPAll.Enabled:=true;
 prepods.Refresh;raspprepods.Refresh;  }
end;

procedure TfrmRaspkab.AddPrepodAll();
begin
{ (Facade.ProcList.DataSetByClassType[TRaspisanieABIT_prepodsGet]).First;
 while not (Facade.ProcList.DataSetByClassType[TRaspisanieABIT_prepodsGet]).Eof do
 begin
  (Facade.ProcList.DataSetByClassType[TRaspisanieABITPrepodsAddGet] as TRaspisanieABITPrepodsAddGet).AddData(StrToInt(id_rasp.Caption),Strtoint(i_tabn.Caption));
  (Facade.ProcList.DataSetByClassType[TRaspisanieABIT_prepodsGet]).Next;
 end;
 (Facade.ProcList.DataSetByClassType[TRaspisanieABIT_rasp_prepodsGet] as TRaspisanieABIT_rasp_prepodsGet).GetData(StrToInt(id_rasp.caption));
 (Facade.ProcList.DataSetByClassType[TRaspisanieABIT_prepodsGet] as TRaspisanieABIT_prepodsGet).GetData(StrToInt(id_rasp.caption));
 AddPOne.Enabled:=false;AddPAll.Enabled:=false;
 DelPOne.Enabled:=true;DelPAll.Enabled:=true;
 prepods.Refresh;raspprepods.Refresh; }
end;

procedure TfrmRaspkab.DelPrepodOne();
begin
 {(Facade.ProcList.DataSetByClassType[TRaspisanieABITPrepodsDelGet] as TRaspisanieABITPrepodsDelGet).DelData(StrToInt(id_rasp_prep.Caption));
 (Facade.ProcList.DataSetByClassType[TRaspisanieABIT_rasp_prepodsGet] as TRaspisanieABIT_rasp_prepodsGet).GetData(StrToInt(id_rasp.caption));
 (Facade.ProcList.DataSetByClassType[TRaspisanieABIT_prepodsGet] as TRaspisanieABIT_prepodsGet).GetData(StrToInt(id_rasp.caption));
 if (Facade.ProcList.DataSetByClassType[TRaspisanieABIT_rasp_prepodsGet]).IsEmpty then
  begin DelPOne.Enabled:=false;DelPAll.Enabled:=false; end;
 AddPOne.Enabled:=true;AddPAll.Enabled:=true;
 prepods.Refresh;raspprepods.Refresh; }
end;

procedure TfrmRaspkab.DelPrepodAll();
begin
 {(Facade.ProcList.DataSetByClassType[TRaspisanieABIT_rasp_prepodsGet]).First;
 while not (Facade.ProcList.DataSetByClassType[TRaspisanieABIT_rasp_prepodsGet]).Eof do
 begin
  (Facade.ProcList.DataSetByClassType[TRaspisanieABITPrepodsDelGet] as TRaspisanieABITPrepodsDelGet).DelData(StrToInt(id_rasp_prep.Caption));
  (Facade.ProcList.DataSetByClassType[TRaspisanieABIT_rasp_prepodsGet]).Next;
 end;
 (Facade.ProcList.DataSetByClassType[TRaspisanieABIT_rasp_prepodsGet] as TRaspisanieABIT_rasp_prepodsGet).GetData(StrToInt(id_rasp.caption));
 (Facade.ProcList.DataSetByClassType[TRaspisanieABIT_prepodsGet] as TRaspisanieABIT_prepodsGet).GetData(StrToInt(id_rasp.caption));
 AddPOne.Enabled:=true;AddPAll.Enabled:=true;
 DelPOne.Enabled:=false;DelPAll.Enabled:=false;
 prepods.Refresh;raspprepods.Refresh;   }
end;

procedure TfrmRaspkab.AddOneData();
begin
{ (Facade.ProcList.DataSetByClassType[TRaspisanieRasp_KabAdd] as TRaspisanieRasp_KabAdd).AddData(StrToInt(id_rasp.Caption),Strtoint(ik_kab.Caption));
 (Facade.ProcList.DataSetByClassType[TRaspisanieABIT_rasp_notbusyGet ] as TRaspisanieABIT_rasp_notbusyGet ).GetData(dateof,TB,TE,StrToInt(id_rasp.caption));
 (Facade.ProcList.DataSetByClassType[TRaspisanieRasp_KabGet] as TRaspisanieRasp_KabGet).GetData(StrToInt(id_rasp.caption));
 auds.Refresh();rassadka.Refresh;
 if (Facade.ProcList.DataSetByClassType[TRaspisanieABIT_rasp_notbusyGet ]).IsEmpty then
  begin
   AddOne.Enabled:=false;
   AddAll.Enabled:=false;
  end;
 DelOne.Enabled:=true;DelAll.Enabled:=true;    }
end;

procedure TfrmRaspkab.AddAllData();
begin
 {(Facade.ProcList.DataSetByClassType[TRaspisanieABIT_rasp_notbusyGet]).First;
 while not (Facade.ProcList.DataSetByClassType[TRaspisanieABIT_rasp_notbusyGet]).Eof do
 begin
  (Facade.ProcList.DataSetByClassType[TRaspisanieRasp_KabAdd] as TRaspisanieRasp_KabAdd).AddData(StrToInt(id_rasp.Caption),Strtoint(ik_kab.Caption));
  (Facade.ProcList.DataSetByClassType[TRaspisanieABIT_rasp_notbusyGet ]).Next;
 end;
 (Facade.ProcList.DataSetByClassType[TRaspisanieABIT_rasp_notbusyGet ] as TRaspisanieABIT_rasp_notbusyGet ).GetData(dateof,TB,TE,StrToInt(id_rasp.caption));
 (Facade.ProcList.DataSetByClassType[TRaspisanieRasp_KabGet] as TRaspisanieRasp_KabGet).GetData(StrToInt(id_rasp.caption));
 auds.Refresh();rassadka.Refresh;
 AddOne.Enabled:=false;
 AddAll.Enabled:=false;
 DelOne.Enabled:=true;DelAll.Enabled:=true;  }
end;

procedure TfrmRaspkab.DelOneData();
begin
{ (Facade.ProcList.DataSetByClassType[TRaspisanieRasp_KabDelete] as TRaspisanieRasp_KabDelete).DelData(strtoint(id.Caption));
 (Facade.ProcList.DataSetByClassType[TRaspisanieABIT_rasp_notbusyGet ] as TRaspisanieABIT_rasp_notbusyGet ).GetData(dateof,TB,TE,StrToInt(id_rasp.caption));
 (Facade.ProcList.DataSetByClassType[TRaspisanieRasp_KabGet] as TRaspisanieRasp_KabGet).GetData(StrToInt(id_rasp.caption));
 auds.Refresh();rassadka.Refresh;
 if (Facade.ProcList.DataSetByClassType[TRaspisanieRasp_KabGet]).IsEmpty then
  begin
   DelOne.Enabled:=false;DelAll.Enabled:=false;
  end;
 AddOne.Enabled:=true;
 AddAll.Enabled:=true; }
end;

procedure TfrmRaspkab.DelAllData();
begin
 {(Facade.ProcList.DataSetByClassType[TRaspisanieRasp_KabGet]).First;
 while not (Facade.ProcList.DataSetByClassType[TRaspisanieRasp_KabGet]).Eof do
 begin
  (Facade.ProcList.DataSetByClassType[TRaspisanieRasp_KabDelete] as TRaspisanieRasp_KabDelete).DelData(strtoint(id.Caption));
  (Facade.ProcList.DataSetByClassType[TRaspisanieRasp_KabGet]).Next;
 end;
 (Facade.ProcList.DataSetByClassType[TRaspisanieABIT_rasp_notbusyGet ] as TRaspisanieABIT_rasp_notbusyGet ).GetData(dateof,TB,TE,StrToInt(id_rasp.caption));
 (Facade.ProcList.DataSetByClassType[TRaspisanieRasp_KabGet] as TRaspisanieRasp_KabGet).GetData(StrToInt(id_rasp.caption));
 auds.Refresh();rassadka.Refresh;
 DelOne.Enabled:=false;DelAll.Enabled:=false;
 AddOne.Enabled:=true;
 AddAll.Enabled:=true; }
end;

procedure TfrmRaspkab.GetKabRaspData();
begin
{(Facade.ProcList.DataSetByClassType[TRaspisanieRasp_KabGet] as TRaspisanieRasp_KabGet).GetData(StrToInt(id_rasp.caption));
 RaspKab.DataSet:=Facade.ProcList.DataSetByClassType[TRaspisanieRasp_KabGet];
(Facade.ProcList.DataSetByClassType[TRaspisanieABIT_rasp_notbusyGet ] as TRaspisanieABIT_rasp_notbusyGet ).GetData(dateof,TB,TE,StrToInt(id_rasp.caption));
 DSAudFree.DataSet:=Facade.ProcList.DataSetByClassType[TRaspisanieABIT_rasp_notbusyGet ];
 if (Facade.ProcList.DataSetByClassType[TRaspisanieABIT_rasp_notbusyGet ]).IsEmpty then
  begin AddOne.Enabled:=false;AddAll.Enabled:=false; end
  else
  begin AddOne.Enabled:=true; AddAll.Enabled:=true; end;
 if (Facade.ProcList.DataSetByClassType[TRaspisanieRasp_KabGet]).IsEmpty then
  begin DelOne.Enabled:=false;DelAll.Enabled:=false; end
  else
  begin DelOne.Enabled:=true;DelAll.Enabled:=true; end;

 (Facade.ProcList.DataSetByClassType[TRaspisanieABIT_rasp_prepodsGet] as TRaspisanieABIT_rasp_prepodsGet).GetData(StrToInt(id_rasp.caption));
 DSprepodsrasp.DataSet:=Facade.ProcList.DataSetByClassType[TRaspisanieABIT_rasp_prepodsGet];
 (Facade.ProcList.DataSetByClassType[TRaspisanieABIT_prepodsGet] as TRaspisanieABIT_prepodsGet).GetData(StrToInt(id_rasp.caption));
 DSprepods.DataSet:=Facade.ProcList.DataSetByClassType[TRaspisanieABIT_prepodsGet];
 if (Facade.ProcList.DataSetByClassType[TRaspisanieABIT_prepodsGet]).IsEmpty then
  begin AddPOne.Enabled:=false;AddPAll.Enabled:=false; end
  else
  begin AddPOne.Enabled:=true; AddPAll.Enabled:=true; end;
 if (Facade.ProcList.DataSetByClassType[TRaspisanieABIT_rasp_prepodsGet]).IsEmpty  then
  begin DelPOne.Enabled:=false;DelPAll.Enabled:=false; end
  else
  begin DelPOne.Enabled:=true;DelPAll.Enabled:=true; end;

 prepods.Refresh;raspprepods.Refresh;
 auds.Refresh();rassadka.Refresh;  }
end;

procedure TfrmRaspkab.AddAllClick(Sender: TObject);
begin
  inherited;
 AddOneData();
end;

procedure TfrmRaspkab.AddOneClick(Sender: TObject);
begin
  inherited;
 AddAllData();
end;

procedure TfrmRaspkab.DelOneClick(Sender: TObject);
begin
  inherited;
 DelOneData();
end;

procedure TfrmRaspkab.DelAllClick(Sender: TObject);
begin
  inherited;
 DelAllData();
end;

procedure TfrmRaspkab.AddpAllClick(Sender: TObject);
begin
  inherited;
 AddPrepodAll();
end;

procedure TfrmRaspkab.AddPOneClick(Sender: TObject);
begin
  inherited;
 AddPrepodOne();
end;

procedure TfrmRaspkab.DelPOneClick(Sender: TObject);
begin
  inherited;
 DelPrepodOne();
end;

procedure TfrmRaspkab.DelPAllClick(Sender: TObject);
begin
  inherited;
 DelPrepodAll();
end;

procedure TfrmRaspkab.bbCancelClick(Sender: TObject);
begin
  isModified:=false;
  close;
end;

constructor TfrmRaspkab.create;
begin

end;

procedure TfrmRaspkab.AudsTitleClick(Column: TColumnEh);
begin
  inherited;
TAbiturientFacade.Instance.ProcList.DataSetByClassType[TRaspisanieABIT_rasp_notbusyGet].Sort:=Column.Field.DisplayName;
end;

procedure TfrmRaspkab.rassadkaTitleClick(Column: TColumnEh);
begin
  inherited;
  TAbiturientFacade.Instance.Instance.ProcList.DataSetByClassType[TRaspisanieRasp_KabGet].Sort:=Column.Field.DisplayName;
end;

procedure TfrmRaspkab.PrepodsTitleClick(Column: TColumnEh);
begin
  inherited;
  TAbiturientFacade.Instance.Instance.ProcList.DataSetByClassType[TRaspisanieABIT_prepodsGet].Sort:=Column.Field.DisplayName;
end;

procedure TfrmRaspkab.raspprepodsTitleClick(Column: TColumnEh);
begin
  inherited;
  TAbiturientFacade.Instance.Instance.ProcList.DataSetByClassType[TRaspisanieABIT_rasp_prepodsGet].Sort:=Column.Field.DisplayName;
end;

procedure TfrmRaspkab.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Key=112)	then
Application.HelpSystem.ShowTopicHelp('A_Edit_array_metodistov.htm','ugtu_help.chm');
end;

end.
