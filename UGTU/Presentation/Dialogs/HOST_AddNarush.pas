unit HOST_AddNarush;

 {#Author llodigina@ist.ugtu.net}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, DBGridEh,
  ComCtrls, DBCtrlsEh, Mask, DBLookupEh;

type
  TAddNarush = class(TfrmBaseDialog)
    ComBNarush: TDBLookupComboboxEh;
    DateNar: TDBDateTimeEditEh;
    Label1: TLabel;
    Label2: TLabel;
    ListViewProj: TListView;
    ListViewNurush: TListView;
    BTAllRight: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    BTAllleft: TSpeedButton;
    ComBNumRoom: TDBLookupComboboxEh;
    Label4: TLabel;
    Label5: TLabel;
    ComNumEtazh: TDBLookupComboboxEh;
    Label6: TLabel;
    Label7: TLabel;
    procedure ComNumEtazhChange(Sender: TObject);
    procedure ComBNumRoomChange(Sender: TObject);
    procedure ListViewProjDblClick(Sender: TObject);
    procedure ListViewNurushDblClick(Sender: TObject);
    procedure BTAllRightClick(Sender: TObject);
    procedure BTAllleftClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComBNarushChange(Sender: TObject);
    procedure DateNarChange(Sender: TObject);

  private
      FNumHost:integer;
      FFlag:integer;
      FIDNarush:integer;
      function DoApply:boolean; override;
      function DoCancel:boolean; override;
      procedure GetIsModified;
    { Private declarations }
  public
    { Public declarations }
      property NumHost:integer read FNumHost write FNumHost;
      property Flag:integer read FFlag write FFlag;
      property IDNarush:integer read FIDNarush write FIDNarush;
  end;

var
  AddNarush: TAddNarush;

implementation

uses uHOST,HOST_ProjivayushieController,HOST_ZayavlenieController,DateUtils,
ApplicationController;

{$R *.dfm}

procedure TAddNarush.ComBNarushChange(Sender: TObject);
begin
  inherited;
  GetIsModified;
end;

procedure TAddNarush.ComBNumRoomChange(Sender: TObject);
var   li: TListItem;
      ikADr:integer;
begin
  inherited;
   ikADr:=ComBNumRoom.KeyValue;
    THOST_ZayavlenieController.Instance.VivodProj(ikADr);

   AddNarush.ListViewProj.Clear;
   while not dmHOST.ProcProjInRoom.Eof do
   begin
      if (ListViewNurush.FindCaption(0,dmHOST.ProcProjInRoom.FieldValues['FIO'],false,true,true)=nil) then
      begin
        li := AddNarush.ListViewProj.Items.Add;
        li.Caption := dmHOST.ProcProjInRoom.FieldValues['FIO'];
        li.SubItems.Add(dmHOST.ProcProjInRoom.FieldValues['nCode']);
        li.SubItems.Add(dmHOST.ProcProjInRoom.FieldValues['ik_address']);
      end;
      dmHOST.ProcProjInRoom.Next;
   end;
end;

procedure TAddNarush.ComNumEtazhChange(Sender: TObject);
var NumEtazh:integer;
begin
  inherited;
  NumEtazh:=ComNumEtazh.KeyValue;
  THOST_ProjivayushieController.Instance.VivodRoom(NumEtazh);
end;

procedure TAddNarush.DateNarChange(Sender: TObject);
begin
  inherited;
  GetIsModified;
end;

function TAddNarush.DoApply: boolean;
var
Cod,i,IDNar:integer;
begin
 if Flag=1 then
 begin
  IDNar:=THOST_ProjivayushieController.Instance.AddNarushenie(DateNar.Value,ComBNarush.Value);
  for I := 0 to (ListViewNurush.Items.Count - 1) do
  begin
    Cod:=StrToInt(ListViewNurush.Items[i].SubItems[0]);
    THOST_ProjivayushieController.Instance.AddNarushiteley(IDNar,Cod);
  end;
 end
 else
 begin
    THOST_ProjivayushieController.Instance.DeleteNarushiteley(IDNarush);
    THOST_ProjivayushieController.Instance.UpdateNarushiteley(IDNarush,DateNar.Value,ComBNarush.Value);
    for I := 0 to (ListViewNurush.Items.Count - 1) do
    begin
      Cod:=StrToInt(ListViewNurush.Items[i].SubItems[0]);
      THOST_ProjivayushieController.Instance.AddNarushiteley(IDNarush,Cod);
    end;
 end;
 IsModified := false;
 result:= true;
end;

function TAddNarush.DoCancel:boolean;
begin
  IsModified := false;
end;

procedure TAddNarush.FormShow(Sender: TObject);
begin
  inherited;
  THOST_ProjivayushieController.Instance.VivodEtazh(NumHost);
  IsModified := false;
end;

procedure TAddNarush.GetIsModified;
begin
  IsModified:= (ListViewNurush.Items.Count>0)
    and (ComBNarush.Value<>null)
    and (DateNar.Value<>null);
end;

procedure TAddNarush.ListViewNurushDblClick(Sender: TObject);
 var li: TListItem;
begin
  inherited;
  if ListViewNurush.Selected=nil then Exit;

  if ListViewNurush.Selected.SubItems[1]=ComBNumRoom.KeyValue then //поменяла
  begin
      li := ListViewProj.Items.Add;
      li.Caption := ListViewNurush.Selected.Caption;
      li.SubItems.Add(ListViewNurush.Selected.SubItems[0]);
      li.SubItems.Add(ListViewNurush.Selected.SubItems[1]);
  end;
      ListViewNurush.Selected.Delete;
      GetIsModified;
end;

procedure TAddNarush.ListViewProjDblClick(Sender: TObject);
var
  li: TListItem;
begin
  inherited;
  if ListViewProj.Selected=nil then Exit;
  li := ListViewNurush.Items.Add;
  li.Caption := ListViewProj.Selected.Caption;
  li.SubItems.Add(ListViewProj.Selected.SubItems[0]);
  li.SubItems.Add(ListViewProj.Selected.SubItems[1]);
  ListViewProj.Selected.Delete;
  GetIsModified;
end;

procedure TAddNarush.BTAllleftClick(Sender: TObject);
var
  li: TListItem;
begin
  inherited;
  while ListViewNurush.Items.Count > 0 do
  begin
    if ListViewNurush.Items[0].SubItems[1]=ComBNumRoom.KeyValue then  
    begin
      li := ListViewProj.Items.Add;
      li.Caption := ListViewNurush.Items[0].Caption;
      li.SubItems.Add(ListViewNurush.Items[0].SubItems[0]);
      li.SubItems.Add(ListViewNurush.Items[0].SubItems[1]);
      ListViewNurush.Items[0].Delete;
    end
    else
    begin
      ListViewNurush.Items[0].Delete;
    end;
  end;
  GetIsModified;
end;

procedure TAddNarush.BTAllRightClick(Sender: TObject);
var
  li: TListItem;
begin
  inherited;
  while ListViewProj.Items.Count > 0 do
  begin
    li := ListViewNurush.Items.Add;
    li.Caption := ListViewProj.Items[0].Caption;
    li.SubItems.Add(ListViewProj.Items[0].SubItems[0]);
    li.SubItems.Add(ListViewProj.Items[0].SubItems[1]);
    ListViewProj.Items[0].Delete;
  end;
  GetIsModified;
end;

end.
