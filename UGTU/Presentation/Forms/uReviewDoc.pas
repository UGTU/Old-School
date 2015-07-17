unit uReviewDoc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseDialog, Vcl.StdCtrls,
  System.Actions, Vcl.ActnList, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfrmReviewDoc = class(TfrmBaseDialog)
    Label1: TLabel;
    Label2: TLabel;
    eDest: TEdit;
    Label3: TLabel;
    eNum: TEdit;
    Label4: TLabel;
    eInd: TEdit;
    Label5: TLabel;
    dtUtv: TDateTimePicker;
    dtGot: TDateTimePicker;
    BitBtn1: TBitBtn;
    procedure actOKExecute(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReviewDoc: TfrmReviewDoc;

implementation

{$R *.dfm}

procedure TfrmReviewDoc.actOKExecute(Sender: TObject);
begin
  inherited;
Close();
ModalResult:=mrOK;
end;

procedure TfrmReviewDoc.BitBtn1Click(Sender: TObject);
begin
  inherited;
Close();
ModalResult:=mrYes;
end;

end.
