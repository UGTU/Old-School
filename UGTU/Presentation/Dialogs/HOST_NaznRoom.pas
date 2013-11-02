unit HOST_NaznRoom;
  {#Author llodigina@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, StdCtrls, DBCtrlsEh, Mask, ActnList, Buttons, ExtCtrls,
  DBGridEh, DBLookupEh, GridsEh;

type
  TNaznRoom = class(TfrmBaseDialog)
    Label3: TLabel;
    ComBRoom: TDBLookupComboboxEh;
    GridProjInRoom: TDBGridEh;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure ComBRoomKeyValueChanged(Sender: TObject);

  private
    { Private declarations }
        function DoApply: boolean; override;
        function DoCancel: boolean; override;
        private
    FNumHost:integer;
  public
  property NumHost:integer read FNumHost write FNumHost;
    { Public declarations }
  end;

var
  NaznRoom: TNaznRoom;

implementation

uses uHOST,HOST_ZayavlenieController;
{$R *.dfm}


procedure TNaznRoom.ComBRoomKeyValueChanged(Sender: TObject);
var Room:integer;
begin
  Room:=ComBRoom.KeyValue;
  inherited;
  THOST_ZayavlenieController.Instance.VivodProj(Room);
  IsModified:= true;
end;

function TNaznRoom.DoApply: boolean;
begin
   result:= true;
end;

function TNaznRoom.DoCancel: boolean;
begin
  result:= true;
end;

procedure TNaznRoom.FormShow(Sender: TObject);
begin
  inherited;
 Caption := 'Указать комнату (общежитие №'+IntToStr(NumHost)+')';
 THOST_ZayavlenieController.Instance.VivodRoom(NumHost);
 IsModified:= true;
end; 

end.
