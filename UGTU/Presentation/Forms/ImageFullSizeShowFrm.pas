unit ImageFullSizeShowFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TImageFullSizeShowForm = class(TForm)
    procedure FormPaint(Sender: TObject);
    procedure FormMouseLeave(Sender: TObject);
    procedure FormClick(Sender: TObject);
  private
    FBitmap : TGraphic;
    procedure SetBitmap(const Value: TGraphic);
    { Private declarations }
  public
    curControl: TImage;
    property Image : TGraphic read FBitmap write SetBitmap;
    { Public declarations }
  end;

var
  ImageFullSizeShowForm: TImageFullSizeShowForm;

implementation

{$R *.dfm}

{ TForm2 }

procedure TImageFullSizeShowForm.FormClick(Sender: TObject);
begin
  Hide;
  curControl.OnClick(nil);
end;

procedure TImageFullSizeShowForm.FormMouseLeave(Sender: TObject);
begin
  Hide;
end;

procedure TImageFullSizeShowForm.FormPaint(Sender: TObject);
begin
  if not Assigned(FBitmap) then Exit;
  Canvas.Pen.Width :=6;
  Canvas.Pen.Color := clGray;
  Canvas.Draw(0, 0, FBitmap);
  Canvas.Polyline([Point(0,0), Point(ClientWidth, 0),
     Point(ClientWidth, ClientHeight), Point(0, ClientHeight), Point(0,0)]);

end;

procedure TImageFullSizeShowForm.SetBitmap(const Value: TGraphic);
begin
  FBitmap := Value;
  Invalidate;
end;

end.
