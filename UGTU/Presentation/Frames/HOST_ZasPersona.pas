unit HOST_ZasPersona;
   {#Author llodigina@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPerson, DBGridEh, ImgList, StdCtrls, Buttons, DBCtrls, ExtCtrls,
  GridsEh, ComCtrls, ToolWin, DBLookupEh, DBCtrlsEh, Mask;

type
  TPersonForZas = class(TfmPerson)
  private
    { Private declarations }
  public
       procedure DoRefreshFrame;override;
    { Public declarations }
  end;

var
  PersonForZas: TPersonForZas;

implementation

{$R *.dfm}

{ TPersonForZas }

procedure TPersonForZas.DoRefreshFrame;
begin
  inherited;
  LoadData;
  modified:= false;
end;

end.
