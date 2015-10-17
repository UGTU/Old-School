unit uPricDialog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uDMDocuments, uBaseDialog, DBGridEh,
  Vcl.StdCtrls, Vcl.Mask, DBCtrlsEh, DBLookupEh, System.Actions, Vcl.ActnList,
  Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmPricDialog = class(TfrmBaseDialog)
    Label2: TLabel;
    dbcbePric: TDBLookupComboboxEh;
    procedure actOKExecute(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
  private
    { Private declarations }
 public
   Procedure AfterConstruction; Override;
  end;

var
  frmPricDialog: TfrmPricDialog;

implementation

{$R *.dfm}

{ TfrmPricDialog }

procedure TfrmPricDialog.actOKExecute(Sender: TObject);
begin
  inherited;
ModalResult:= mrOk;
end;

procedure TfrmPricDialog.AfterConstruction;
begin
  inherited;
uDMDocuments.dmDocs.adodsPric.Active := true; // подключам базу
end;

procedure TfrmPricDialog.bbCancelClick(Sender: TObject);
begin
  inherited;
ModalResult:= mrNo;
end;

end.
