unit uExaminationSheduleOnForm;
   {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uExaminationShedule;

type
  TExaminationSheduleOnForm = class(TForm)
    fmExaminationShedule1: TfmExaminationShedule;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ExaminationSheduleOnForm: TExaminationSheduleOnForm;

implementation

{$R *.dfm}

procedure TExaminationSheduleOnForm.FormCreate(Sender: TObject);
begin
  SetWindowLong(Handle, GWL_EXSTYLE, GetWindowLong(Handle, GWL_EXSTYLE) or WS_EX_APPWINDOW);
end;

end.
