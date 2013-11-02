unit HOST_UkazPrikaz;
 {#Author llodigina@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, DBGridEh, Mask,
  DBCtrlsEh, DBLookupEh;

type
  TPrikazOZas = class(TfrmBaseDialog)
    Label1: TLabel;
    dbcbeNumPrik: TDBLookupComboboxEh;
    SpeedButton2: TSpeedButton;
    Label57: TLabel;
    procedure SpeedButton2Click(Sender: TObject);
    //rocedure actOKExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbcbeNumPrikChange(Sender: TObject);
  private
  function DoApply: boolean; override;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrikazOZas: TPrikazOZas;

implementation
 uses uDM, uDMPrikaz, uMain;
{$R *.dfm}

procedure TPrikazOZas.FormShow(Sender: TObject);
begin
 dmPrikaz.adodsPrikaz.Active:=true;

end;

procedure TPrikazOZas.dbcbeNumPrikChange(Sender: TObject);
begin
  inherited;
  if (dbcbeNumPrik.KeyValue>0) then
    IsModified:= true;
  
end;

function TPrikazOZas.DoApply: boolean;
begin

   result:= true;
end;

procedure TPrikazOZas.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  frmMain.actAddPrikaz.Execute;
  dmPrikaz.adodsPrikaz.Active:=false;
  dmPrikaz.adodsPrikaz.Active:=true;
end;

end.
