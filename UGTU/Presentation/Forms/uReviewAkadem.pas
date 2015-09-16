unit uReviewAkadem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uReviewDoc, Vcl.StdCtrls, Vcl.ComCtrls,
  System.Actions, Vcl.ActnList, Vcl.Buttons, Vcl.ExtCtrls, DBGridEh, Vcl.Mask,
  DBCtrlsEh, DBLookupEh,uDMDocuments;

type
  TfrmReviewAkadem = class(TfrmReviewDoc)
    Label6: TLabel;
    cbexOsnov: TDBLookupComboboxEh;
    Label12: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure cbexOsnovChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReviewAkadem: TfrmReviewAkadem;

implementation

{$R *.dfm}
uses uDM,uStudent;
procedure TfrmReviewAkadem.actOKExecute(Sender: TObject);
begin
  inherited;

    ModalResult := mrOk;
end;

procedure TfrmReviewAkadem.BitBtn1Click(Sender: TObject);
begin
  inherited;

    ModalResult := mrYes;
end;

procedure TfrmReviewAkadem.cbexOsnovChange(Sender: TObject);
begin
  inherited;
  if cbexOsnov.Text <> '' then
  begin
    bbOk.Enabled:=true;
    BitBtn1.Enabled:=true;
  end;
end;

end.
