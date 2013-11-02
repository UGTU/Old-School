unit HOST_Viselit;
 {#Author llodigina@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, DBGridEh,
  DBCtrlsEh, Mask, DBLookupEh;

type
  TViselit = class(TfrmBaseDialog)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ComBNumPrik: TDBLookupComboboxEh;
    ComBPrichVis: TDBLookupComboboxEh;
    DatePicDataVis: TDBDateTimeEditEh;
    SpeedButton2: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
      function DoApply: boolean; override;
      function DoCancel: boolean; override;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Viselit: TViselit;

implementation

uses uHOST,uDMPrikaz, uMain;

{$R *.dfm}

function TViselit.DoApply: boolean;
begin
  result:= true;
end;

function TViselit.DoCancel: boolean;
begin
  result:= true;
end;

procedure TViselit.FormShow(Sender: TObject);
begin
  inherited;
  IsModified:= true;
  dmPrikaz.adodsPrikaz.Active:=true;
  dmHOST.vVivodPrichVis.Active:=true;
end;

procedure TViselit.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  frmMain.actAddPrikaz.Execute;
  dmPrikaz.adodsPrikaz.Active:=false;
  dmPrikaz.adodsPrikaz.Active:=true;
end;

end.
