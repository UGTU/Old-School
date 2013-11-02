unit HOST_UtvZayav;
 {#Author llodigina@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, DBCtrlsEh, Mask,
  ComCtrls;

type
  TUtvZayav = class(TfrmBaseDialog)
    Label2: TLabel;
    dbCBVidDog: TDBCheckBoxEh;
    CheckPrint: TDBCheckBoxEh;
    DateUtv: TDBDateTimeEditEh;
    procedure FormShow(Sender: TObject);
    procedure CheckPrintClick(Sender: TObject);
    //procedure actOKExecute(Sender: TObject);

  private
    { Private declarations }
    function DoApply: boolean; override;
    function DoCancel: boolean; override;
  public
    { Public declarations }
  end;

var
  UtvZayav: TUtvZayav;

implementation

uses uHOST,HOST_ZayavlenieController,HOST_Order, HOST_ReportController, ExceptionBase,DateUtils;

{$R *.dfm}




procedure TUtvZayav.CheckPrintClick(Sender: TObject);
begin
  inherited;
  if CheckPrint.Checked then
  begin
    dbCBVidDog.Checked:=true;
  end;

end;

function TUtvZayav.DoApply: boolean;
begin
  result:= true;
end;

function TUtvZayav.DoCancel: boolean;
begin
  result:= true;
end;

procedure TUtvZayav.FormShow(Sender: TObject);
begin
  inherited;
  IsModified:= true;
end;

end.
