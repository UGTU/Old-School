unit ABIT_select_stat_ALL;
  {#Author tanyav@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, StdCtrls, DBCtrlsEh, ActnList, Buttons, ExtCtrls,
  System.Actions;

type
  TfrmBaseDialog1 = class(TfrmBaseDialog)
    DBCheckBoxEh1: TDBCheckBoxEh;
    DBCheckBoxEh2: TDBCheckBoxEh;
    DBCheckBoxEh3: TDBCheckBoxEh;
    DBCheckBoxEh4: TDBCheckBoxEh;
    DBCheckBoxEh5: TDBCheckBoxEh;
    DBCheckBoxEh6: TDBCheckBoxEh;
    DBCheckBoxEh7: TDBCheckBoxEh;
    DBCheckBoxEh8: TDBCheckBoxEh;
    DBCheckBoxEh9: TDBCheckBoxEh;
    DBCheckBoxEh10: TDBCheckBoxEh;
    DBCheckBoxEh11: TDBCheckBoxEh;
    DBCheckBoxEh12: TDBCheckBoxEh;
    DBCheckBoxEh13: TDBCheckBoxEh;
    DBCheckBoxEh14: TDBCheckBoxEh;
    DBCheckBoxEh15: TDBCheckBoxEh;
    DBCheckBoxEh16: TDBCheckBoxEh;
    DBCheckBoxEh17: TDBCheckBoxEh;
    Label1: TLabel;
    Label2: TLabel;
  private
    { Private declarations }
  public
  procedure createframe();
    { Public declarations }
  end;

var
  frmBaseDialog1: TfrmBaseDialog1;

implementation

{$R *.dfm}

{ TfrmBaseDialog1 }

{ TfrmBaseDialog1 }

procedure TfrmBaseDialog1.createframe;
begin
 bbOk.Enabled:=true;
end;



end.
