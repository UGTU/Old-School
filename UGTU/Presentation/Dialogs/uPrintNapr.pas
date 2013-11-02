unit uPrintNapr;
    {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, DBGridEh, StdCtrls, Mask, DBCtrlsEh, DBLookupEh,
  ActnList, Buttons, ExtCtrls,uDm;

type
  TfrmPrintNaprDialog = class(TfrmBaseDialog)
    dbcbeNapr: TDBLookupComboboxEh;
    Label1: TLabel;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrintNaprDialog: TfrmPrintNaprDialog;

implementation

uses uDMUspevaemost;

{$R *.dfm}

function CheckFields:boolean;
begin
result:=true;
with frmPrintNaprDialog do
begin
if (dbcbeNapr.Text='')
then result:=false
end;
end;

procedure TfrmPrintNaprDialog.FormShow(Sender: TObject);
begin
dmUspevaemost.adodsNapravl.Active:=false;
dmUspevaemost.adodsNapravl.CommandText:='select * from Napr_View where ik_zach='''+inttostr(Tag)+'''';
dmUspevaemost.adodsNapravl.Active:=true;
end;

end.
