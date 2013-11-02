unit HOST_AddRoom;
  {#Author llodigina@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, DBGridEh,
  DBLookupEh, Mask, DBCtrlsEh;

type
  TAddRoom = class(TfrmBaseDialog)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    TextBNumRoom: TDBEditEh;
    ComBNumHost: TDBLookupComboboxEh;
    ComBNumEtazh: TDBLookupComboboxEh;
    TextBKolMest: TDBEditEh;
    procedure ComBNumHostChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FTipDial,FikAdr: integer;
    function DoApply: boolean; override;
    function DoCancel: boolean; override;
  public
    property TipDial:integer read FTipDial write FTipDial;
    property ikAdr:integer read FikAdr write FikAdr;
   { Public declarations }
  end;
var
  AddRoom: TAddRoom;

implementation

uses  HOST_ProjivayushieController,ApplicationController,uHOST;

{$R *.dfm}

procedure TAddRoom.ComBNumHostChange(Sender: TObject);
var NumHost:integer;
begin
  inherited;
  NumHost:=ComBNumHost.KeyValue;
  THOST_ProjivayushieController.Instance.VivodEtazh(NumHost);
  IsModified:= true;
end;

function TAddRoom.DoApply: boolean;
var NumHost,KolMes,NumEt,FlatNum:integer;
begin
  KolMes:=TextBKolMest.Value;
  TApplicationController.GetInstance.AddLogEntry('Открытие формы "Добавление комнаты".');

  if TipDial=1 then
  begin
    NumHost:=ComBNumHost.Value;
    NumEt:=ComBNumEtazh.Value;
    FlatNum:=TextBNumRoom.Value;
    THOST_ProjivayushieController.Instance.AddRoom(NumHost,KolMes,NumEt,FlatNum);
  end
  else
  begin
    THOST_ProjivayushieController.Instance.IzmKolMest(ikAdr,KolMes);
  end;
end;

function TAddRoom.DoCancel: boolean;
begin
  result:= true;
end;

procedure TAddRoom.FormShow(Sender: TObject);
begin
  inherited;
  if TipDial=1 then
  begin
    Caption:= 'Добавление комнаты';
    ComBNumHost.ReadOnly:=false;
    ComBNumEtazh.ReadOnly:=false;
    TextBNumRoom.ReadOnly:=false;
  end
    else
    begin
      Caption:= 'Редактирование комнаты';
      ComBNumHost.ReadOnly:=true;
      ComBNumEtazh.ReadOnly:=true;
      TextBNumRoom.ReadOnly:=true;
    end;
end;

end.
