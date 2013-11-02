unit uAddSpecAbit;
   {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, DBGridEh, StdCtrls, Mask, DBCtrlsEh, DBLookupEh,
  ActnList, Buttons, ExtCtrls, uDm;

type
  TfrmAdditionalSpec = class(TfrmBaseDialog)
    dbcbeRecruit: TDBLookupComboboxEh;
    Label2: TLabel;
    Label5: TLabel;
    procedure actApplyExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure actApplyUpdate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdditionalSpec: TfrmAdditionalSpec;

implementation

uses uPostupdlg;
{$R *.dfm}

procedure TfrmAdditionalSpec.actApplyExecute(Sender: TObject);
var new:TAdditionalSpec;
begin
try
if frmPostupDlg.AbitList.lAdditionalSpec=nil then
frmPostupDlg.AbitList.lAdditionalSpec:=Tlist.create;
new:=TAdditionalSpec.Create;
new.new:=true;
new.ik_recruit:= dbcbeRecruit.KeyValue;
new.name_recruit:=dbcbeRecruit.Text;
new.num:=frmPostupDlg.AbitList.NewSpecNum;
frmPostupDlg.AbitList.lAdditionalSpec.Add(new);
dbcbeRecruit.Value:=-1;
except
showmessage('Неверные данные!');
end;

frmPostupDlg.Sync;
end;

procedure TfrmAdditionalSpec.actApplyUpdate(Sender: TObject);
begin

if dbcbeRecruit.Text='' then actApply.Enabled:=false else actApply.Enabled:=true;
end;

procedure TfrmAdditionalSpec.bbCancelClick(Sender: TObject);
begin
Close;
end;

procedure TfrmAdditionalSpec.FormShow(Sender: TObject);
begin
dm.adodsAdditionalSpec.Active:=false;
 dm.adodsAdditionalSpec.CommandText:=' select * from AdditionalSpec where NNYear='''+frmPostupDlg.Hint+''' order by Cshort_name_fac,Cname_spec';
dm.adodsAdditionalSpec.Active:=true;
end;

end.
