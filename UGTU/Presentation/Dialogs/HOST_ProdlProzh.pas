unit HOST_ProdlProzh;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, DBGridEh, Mask,
  DBCtrlsEh, DBLookupEh;

type
  TfrmProdlProzh = class(TfrmBaseDialog)
    ComBEtazh: TDBLookupComboboxEh;
    ComBRoom: TDBLookupComboboxEh;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ComBNumHost: TDBLookupComboboxEh;
    procedure FormShow(Sender: TObject);
    procedure ComBEtazhChange(Sender: TObject);
    procedure ComBNumHostChange(Sender: TObject);
  private
        FNumHost:integer;
    { Private declarations }
     function DoApply: boolean; override;
     function DoCancel: boolean; override;
  public
    { Public declarations }
  end;

var
  frmProdlProzh: TfrmProdlProzh;

implementation

uses HOST_ProjivayushieController,uHOST;

{$R *.dfm}

{ TfrmProdlProzh }

procedure TfrmProdlProzh.ComBEtazhChange(Sender: TObject);
var NumEtazh:integer;
begin
  inherited;
  NumEtazh:=ComBEtazh.KeyValue;
  THOST_ProjivayushieController.Instance.VivodRoom(NumEtazh);
end;

procedure TfrmProdlProzh.ComBNumHostChange(Sender: TObject);
var NHost:integer;
begin
  inherited;
  NHost:=ComBNumHost.KeyValue;
  THOST_ProjivayushieController.Instance.VivodEtazh(NHost);
end;

function TfrmProdlProzh.DoApply: boolean;
begin
  result:= true;
end;

function TfrmProdlProzh.DoCancel: boolean;
begin
  result:= true;
end;

procedure TfrmProdlProzh.FormShow(Sender: TObject);
begin
  inherited;
  IsModified:= true;
end;

end.
