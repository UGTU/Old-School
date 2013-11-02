unit DataProcessingSplashDialog;
  {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TDataProcessingSplashDlg = class(TForm)
    Image3: TImage;
    Label1: TLabel;
    Label3: TLabel;
    procedure FormActivate(Sender: TObject);
  private

  protected
    { Private declarations }
  public

    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TDataProcessingSplashDlg }




procedure TDataProcessingSplashDlg.FormActivate(Sender: TObject);
begin
  Update;
end;

end.
