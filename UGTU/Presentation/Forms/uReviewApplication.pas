unit uReviewApplication;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDMDocuments, uReviewDoc, DBGridEh,
  Vcl.StdCtrls, Vcl.Mask, DBCtrlsEh, DBLookupEh, System.Actions, Vcl.ActnList,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmReviewApplication = class(TfrmReviewDoc)
    cbexReason: TDBLookupComboboxEh;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    rbP: TRadioButton;
    rbL: TRadioButton;
    Edit1: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    cbexTransp: TDBLookupComboboxEh;
    procedure cbexTranspChange(Sender: TObject);
    procedure rbPClick(Sender: TObject);
    procedure rbLClick(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure cbexReasonChange(Sender: TObject);
  private
    { Private declarations }
  public
    Procedure AfterConstruction; Override;

    { Public declarations }
  end;

var
  frmReviewApplication: TfrmReviewApplication;

implementation

{$R *.dfm}

uses uDM, uStudent;
{ TfrmReviewDoc2 }

procedure TfrmReviewApplication.actOKExecute(Sender: TObject);
begin
  inherited;
  if (cbexReason.Text <> '') and (((cbexTransp.Text <> '') and (rbP.Checked)) or
    (rbL.Checked)) then
  begin
  ModalResult := mrOk;
  end
  else
  ModalResult := mrNo;

end;

procedure TfrmReviewApplication.AfterConstruction;
begin
  inherited;
  uDMDocuments.dmDocs.adodsStudAddres.Active := false; // подключам базу
  uDMDocuments.dmDocs.adodsPricina.Active := false;
  dmDocs.adodsStudAddres.Filter := 'ik_StudGrup =' + ik_stud.ToString();
  dmDocs.adodsStudAddres.Filtered := true;
  // dmDocs.adodsStudAddres.CommandText :=
  // ('select * from StudAddress where ik_StudGrup=' + ik_stud.ToString());
  // dmDocs.adodsPricina.CommandText :=
  // ('select * from ReasonForDestination where Ik_destination= 4');
  dmDocs.adodsPricina.Filter := 'Ik_destination = 4';
  dmDocs.adodsPricina.Filtered := true;

  uDMDocuments.dmDocs.adodsStudAddres.Active := true; // подключам базу
  uDMDocuments.dmDocs.adodsPricina.Active := true; // подключам базу
end;

procedure TfrmReviewApplication.BitBtn1Click(Sender: TObject);
begin
  inherited;
   if (cbexReason.Text <> '') and (((cbexTransp.Text <> '') and (rbP.Checked)) or
    (rbL.Checked)) then
  begin
  ModalResult := mrYes;
  end
  else
  ModalResult := mrNo;

end;

procedure TfrmReviewApplication.cbexReasonChange(Sender: TObject);
begin
  inherited;
  if (cbexReason.Text <> '') and (((cbexTransp.Text <> '') and (rbP.Checked)) or
    (rbL.Checked)) then
  begin
   ModalResult := mrYes;
  end
    else
    ModalResult := mrNo;
end;

procedure TfrmReviewApplication.cbexTranspChange(Sender: TObject);
var
  i: integer;
begin
  inherited;

  if cbexTransp.Text <> '' then
  begin
    dmDocs.adodsStudAddres.Open;
  dmDocs.adodsStudAddres.First;
    while not dmDocs.adodsStudAddres.Eof do
    begin
      with dmDocs.adodsStudAddres do
      begin
        if FieldByName('ik_AddressType').AsString = cbexTransp.KeyValue then
        begin
          Label10.Caption := '';
          if FieldByName('Cstrana').AsString <> 'Россия' then
            Label10.Caption := FieldByName('Cstrana').AsString + ', ';
          Label10.Caption := Label10.Caption + FieldByName('Cregion').AsString +
            ', ' + FieldByName('cshort_type_gorod').AsString +
            FieldByName('Cgorod').AsString + ', ' +
            FieldByName('cshort_type_street').AsString + FieldByName('CStreet')
            .AsString + ', д.' + FieldByName('BuildingNumber').AsString +
            ', кв.' + FieldByName('FlatNumber').AsString;

          Label10.Visible := true;
        end;
        dmDocs.adodsStudAddres.Next;
      end;
    end;
  end;
  if (cbexReason.Text <> '') and (((cbexTransp.Text <> '') and (rbP.Checked)) or
    (rbL.Checked)) then
  begin
    bbOk.Enabled := true;
    BitBtn1.Enabled := true;
  end;
end;

procedure TfrmReviewApplication.Panel1Click(Sender: TObject);
begin
  inherited;
//  if (cbexReason.Text = '') or ((cbexTransp.Text = '') and (rbP.Checked)) then
//  begin
//    MessageDlg('Заполните все поля', mtWarning, [mbOK], 0);
//    ModalResult := mrNo;
//  end
//  else
//    ModalResult := mrYes;
end;

procedure TfrmReviewApplication.rbLClick(Sender: TObject);
begin
  inherited;
  if rbL.Checked then
  begin
    cbexTransp.Enabled := false;
    Label10.Visible := false;

  end;
  if (cbexReason.Text <> '') and (((cbexTransp.Text <> '') and (rbP.Checked)) or
    (rbL.Checked)) then
  begin
    bbOk.Enabled := true;
    BitBtn1.Enabled := true;
  end;
end;

procedure TfrmReviewApplication.rbPClick(Sender: TObject);
begin
  inherited;
  if rbP.Checked then
  begin
    cbexTransp.Enabled := true;
    if cbexTransp.Text <> '' then
      Label10.Visible := true;

  end;
    if (cbexReason.Text <> '') and (((cbexTransp.Text <> '') and (rbP.Checked)) or
    (rbL.Checked)) then
  begin
    bbOk.Enabled := true;
    BitBtn1.Enabled := true;
  end
  else
  bbOk.Enabled := false;
  BitBtn1.Enabled := false;
end;

end.
