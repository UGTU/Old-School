unit EditsEx;
   {#Author fmarakasov@ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TAutoFillComboBox = class(TComboBox)
  private
    { Private declarations }
    bAutoFill:Boolean;
  protected
    procedure OnComboBoxKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    { Protected declarations }
  public
    constructor Create(AOwner:TComponent);override;
    procedure ResolveToSave;
    { Public declarations }
  published
    property AutoFill:Boolean read bAutoFill write bAutoFill;

    { Published declarations }
  end;

procedure Register;

implementation
uses
  VCLUtils;

procedure Register;
begin
  RegisterComponents('A2PG', [TAutoFillComboBox]);
end;

constructor TAutoFillComboBox.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  OnKeyUp:=OnComboBoxKeyUp;
  bAutoFill:=True;
  Sorted:=True;
  MaxLength:=MAX_PATH;
end;

procedure TAutoFillComboBox.OnComboBoxKeyUp(Sender: TObject;
                                            var Key: Word; Shift: TShiftState);
begin
  if bAutoFill then
     if (Key <> VK_DELETE) and (Key <> VK_BACK) and
        ((Key < 33) or (Key > 40)) then AutoFillEditText(Self, Items);
end;


procedure TAutoFillComboBox.ResolveToSave;
begin
  VCLUtils.ResolveToSave(Self);
end;

end.
