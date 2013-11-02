unit HOST_ZamenaRoom;
  {#Author llodigina@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls,DBLookupEh,
  DBGridEh, Mask, DBCtrlsEh, GridsEh;

type
  TZamenaRoom = class(TfrmBaseDialog)
    Label1: TLabel;
    Label2: TLabel;
    ComBNumHost: TDBLookupComboboxEh;
    ComBNumRoom: TDBLookupComboboxEh;
    GridProjInRoom: TDBGridEh;
    Label3: TLabel;
    Label4: TLabel;
    ComBEtazh: TDBLookupComboboxEh;
    procedure ComBNumRoomKeyValueChanged(Sender: TObject);
    procedure ComBNumHostKeyValueChanged(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComBEtazhKeyValueChanged(Sender: TObject);
  private
    function DoApply: boolean; override;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ZamenaRoom: TZamenaRoom;

implementation

uses uHOST,HOST_ZayavlenieController,HOST_ProjivayushieController;
{$R *.dfm}

procedure TZamenaRoom.ComBEtazhKeyValueChanged(Sender: TObject);
var NumEtazh:integer;
begin
  inherited;
  NumEtazh:=ComBEtazh.KeyValue;
  THOST_ProjivayushieController.Instance.VivodRoom(NumEtazh);
end;

procedure TZamenaRoom.ComBNumHostKeyValueChanged(Sender: TObject);
var NumHost:integer;
begin
  inherited;
  NumHost:=ComBNumHost.KeyValue;
  THOST_ProjivayushieController.Instance.VivodEtazh(NumHost);
end;

procedure TZamenaRoom.ComBNumRoomKeyValueChanged(Sender: TObject);
var Room:integer;
begin
  Room:=ComBNumRoom.KeyValue;
  inherited;
  THOST_ZayavlenieController.Instance.VivodProj(Room);
  IsModified:= true;
end;

function TZamenaRoom.DoApply: boolean;
begin
   result:= true;
end;
procedure TZamenaRoom.FormShow(Sender: TObject);
begin
  inherited;
  dmHOST.tHostel.Active:=true;
  dmHOST.ProcProjInRoom.Close;
  dmHOST.ProcProjInRoom.Open;
end;

end.
