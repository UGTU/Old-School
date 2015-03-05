unit NewClientVersionDetectedFrm;
  {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ActnList, ExtCtrls, Buttons, ImgList, VersionController,
  System.Actions;

type
  TNewClientVersionDetectedForm = class(TForm)
    ActionList1: TActionList;
    Action1: TAction;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    Action2: TAction;
    ImageList1: TImageList;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Label3: TLabel;
    Label1: TLabel;
    rbUpdate: TRadioButton;
    StaticText1: TStaticText;
    rbDoNotUpdate: TRadioButton;
    StaticText2: TStaticText;
    Label2: TLabel;
    Image1: TImage;
    lCritical: TLabel;
    BitBtn3: TBitBtn;
    actExit: TAction;
    procedure FormCreate(Sender: TObject);
    procedure Action1Update(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure StaticText1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
  private
    FFormHrgn : HRGN;
    { Private declarations }
  protected
    procedure OnNCHitTest(var Msg:TMessage);message WM_NCHITTEST;
  public
    { Public declarations }
  end;
const
  RECT_ROUND = 20;
  BTN_RECT_ROUND = 5;
  BORDER_WIDTH = 3;
var
  NewClientVersionDetectedForm: TNewClientVersionDetectedForm;

implementation
uses  DetailsFrm, GraphUtil, ApplicationController;
{$R *.dfm}

procedure TNewClientVersionDetectedForm.actExitExecute(Sender: TObject);
begin
TApplicationController.GetInstance.FinalizeApplication;
Application.Terminate;
end;

procedure TNewClientVersionDetectedForm.Action1Execute(Sender: TObject);
begin
  if rbUpdate.Checked then
    ModalResult := mrYes
  else
    ModalResult := mrNo;
end;

procedure TNewClientVersionDetectedForm.Action1Update(Sender: TObject);
begin
  (Sender as TAction).Enabled := rbUpdate.Checked or rbDoNotUpdate.Checked;
end;

procedure TNewClientVersionDetectedForm.Action2Execute(Sender: TObject);
begin
 with TDetailsForm.Create(Self) do
 begin
   ShowModal;
   Free;
 end;
end;


procedure TNewClientVersionDetectedForm.FormCreate(Sender: TObject);
var SerVer:IVersion;
app:TApplicationController;
begin
  FFormHrgn := CreateRoundRectRgn(0, 0, Width, Height, RECT_ROUND, RECT_ROUND);
  // FBtnHrgn := CreateRoundRectRgn(0, 0, Button2.Width, Button2.Height, BTN_RECT_ROUND, BTN_RECT_ROUND);
  SetWindowRgn(Handle, FFormHrgn, TRUE);
  // SetWindowRgn(Button2.Handle, FBtnHrgn, FALSE);
  SerVer:=TServerVersion.GetInstance;

  with TApplicationController.GetInstance do begin
  AddLogEntry('На сервере обнаружена новая версия: ' + SerVer.VersionString);
  AddLogEntry('Размер сборки: '+ inttostr(SerVer.BuildSize) +'Мб.');
  AddLogEntry('Описание: '+ SerVer.BuildInfo);
  end;

end;

procedure TNewClientVersionDetectedForm.FormPaint(Sender: TObject);
begin
  Canvas.Pen.Width := BORDER_WIDTH;
  Canvas.Pen.Color := clGreen;

  GradientFillCanvas(Canvas, clBtnFace, clInfoBk, ClientRect, gdHorizontal);
  Canvas.Brush.Style := bsClear;
  Canvas.RoundRect(BORDER_WIDTH - 2, BORDER_WIDTH - 2, Width - BORDER_WIDTH + 1, Height - BORDER_WIDTH + 1, RECT_ROUND, RECT_ROUND);

end;

procedure TNewClientVersionDetectedForm.FormShow(Sender: TObject);
begin
// Tag=1 - статус обновления "критический"
  if (Tag=1) then
  begin
  rbUpdate.Checked:=true;
  rbDoNotUpdate.Enabled:=false;
  lCritical.visible:=true;
  end;
end;

procedure TNewClientVersionDetectedForm.OnNCHitTest(var Msg: TMessage);
begin
  Msg.Result := HTCAPTION;
end;

procedure TNewClientVersionDetectedForm.StaticText1Click(Sender: TObject);
begin
  Application.HelpSystem.ShowTopicHelp((Sender as TStaticText).HelpKeyword,'ugtu_help.chm');
end;

end.

