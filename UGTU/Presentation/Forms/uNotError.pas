unit uNotError;
  {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ShellAPI, adodb, db, ImgList, ComCtrls;

type
  TfrmNotError = class(TForm)
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    Image2: TImage;
    BitBtn1: TBitBtn;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    fErrorType: string;
    fErrorString: TStringList;
    fCaptionString: string;
    //fErrorCode: integer;
  public
    property ErrorType: string read fErrorType write fErrorType;
    property ErrorString: TStringList read fErrorString write fErrorString;
    property CaptionString: string read fCaptionString write fCaptionString;
  end;

var
  frmNotError: TfrmNotError;

implementation

uses uErrorInfo;
{$R *.dfm}

procedure TfrmNotError.FormCreate(Sender: TObject);
begin
  fErrorString:= TStringList.Create;
end;

end.
