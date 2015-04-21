unit uAddDocument;

{ #Author sergdev@ist.ugtu.net }
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, uDMStudentData,
  DBGridEh, DBCtrlsEh, Mask, DBLookupEh, uStuddlg, System.Actions, Vcl.ComCtrls,
  CommandController, DocumentClass, Data.Win.ADODB;

type
  TfrmAddDocument = class(TfrmBaseDialog)
    Label1: TLabel;
    Label8: TLabel;
    Label2: TLabel;
    dbcbeKind: TDBLookupComboboxEh;
    Label3: TLabel;
    eSer: TDBEditEh;
    Label6: TLabel;
    eNum: TDBEditEh;
    Label11: TLabel;
    Label4: TLabel;
    eWho: TDBEditEh;
    dbdteGetDate: TDBDateTimeEditEh;
    actCheckFields: TAction;
    Label5: TLabel;
    dbeAddInfo: TDBEditEh;
    btnLoad: TButton;
    odOpenFile: TOpenDialog;
    chbxBonuses: TCheckBox;
    pnlBonuses: TPanel;
    UpDown1: TUpDown;
    dbBalls: TDBEditEh;
    Label7: TLabel;
    Label10: TLabel;
    dbcbeDisc: TDBLookupComboboxEh;
    cbReal: TCheckBox;
    procedure actCheckFieldsUpdate(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure dbcbeKindChange(Sender: TObject);
    procedure chbxBonusesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
  private
    FnCode: integer;
    FDocID: integer;
    FisEdit: boolean;
    FTypeGrazd: integer;
    procedure SetAbitElements(const Value: boolean);
    procedure CollectForParentDialog(aDoc: TDocRecord);
    procedure SetEditProperties;
    procedure SetTypeGrazd(const Value: integer);
    { Private declarations }
  public
    studDlg: TftmStudent;
    property isEdit: boolean write FisEdit;
    property isAbit: boolean write SetAbitElements;
    property nCode: integer read FnCode write FnCode;
    property DocID: integer read FDocID write FDocID;
    property TypeGrazd: integer write SetTypeGrazd;

    { Public declarations }
  end;

var
  frmAddDocument: TfrmAddDocument;

implementation

uses ConstantRepository, PersonController, uStudent;

{$R *.dfm}

function CheckFields: boolean;
begin
  result := true;
  with frmAddDocument do
  begin
    if (dbcbeKind.Text = '') { or (eSer.Text = '') } or (eNum.Text = '') then
      result := false
  end;
end;

procedure TfrmAddDocument.actApplyExecute(Sender: TObject);
var
  doc: TDocRecord;
begin
  doc := TDocRecord.Create(FDocID, dbcbeKind.KeyValue, StrToInt(dbBalls.Text),
    dbcbeDisc.KeyValue, eSer.Text, eNum.Text, eWho.Text, dbeAddInfo.Text,
    cbReal.Checked, dbdteGetDate.Value);

  if Assigned(studDlg) then
  begin
    CollectForParentDialog(doc);
    (Owner as TftmStudent).DocRecordList.Add(doc);
  end
  else
  begin
    with (Owner as TfmStudent).dbgeDocuments.DataSource.DataSet do
    begin
      if FisEdit then Edit else Insert;
      FieldByName('cvid_doc').Value := dbcbeKind.Text;
      FieldByName('Np_number').Value := doc.number;
      FieldByName('Cd_seria').Value := doc.seria;
      FieldByName('Dd_vidan').Value := doc.get_date;
      FieldByName('Cd_kem_vidan').Value := doc.kem_vidan;
      FieldByName('isreal').Value := doc.isreal;
      FieldByName('balls').Value := doc.balls;
      FieldByName('сname_disc').Value := dbcbeDisc.Text;
      FieldByName('addinfo').Value := doc.addinfo;
      FieldByName('ik_disc').Value := doc.ikDisc;
      FieldByName('ik_vid_doc').Value := doc.ikDocVid;
    end;

    // добавляем в коллекцию документов родителя
   (Owner as TfmStudent).DocRecordList.Add(doc);
   (Owner as TfmStudent).modified := true;
  end;

  IsModified := false;

  if FDocID = 0 then
    begin
      dbcbeKind.Value := -1;
      eSer.Text := '';
      eWho.Text := '';
      dbdteGetDate.Text := '  .  .    ';
      eNum.Text := '';
      dbBalls.Text := '0';
      dbcbeDisc.Value := -1;
      pnlBonuses.Visible := False;
    end;
end;

procedure TfrmAddDocument.actCheckFieldsUpdate(Sender: TObject);
begin
  inherited;
  if (eNum.Text = '') or (dbcbeKind.Text = '') or (eSer.Text = '') then
  begin
    bbOk.Enabled := false;
    bbApply.Enabled := false;
  end
  else
  begin
    bbOk.Enabled := true;
    bbApply.Enabled := true;
  end;
end;

procedure TfrmAddDocument.actOKExecute(Sender: TObject);
begin
  actApplyExecute(Sender);
  close;
end;

procedure TfrmAddDocument.chbxBonusesClick(Sender: TObject);
begin
  inherited;
  pnlBonuses.Visible := chbxBonuses.Checked;
  if not chbxBonuses.Checked then
    dbBalls.Text := '0';
  dbcbeKindChange(Sender);
end;

procedure TfrmAddDocument.dbcbeKindChange(Sender: TObject);
begin
  IsModified := CheckFields;
end;

procedure TfrmAddDocument.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dmStudentData.adodsDocType.Active := false;
  dmStudentData.adodsAbitDisc.Active := false;
end;

procedure TfrmAddDocument.FormCreate(Sender: TObject);
begin
  inherited;
  dmStudentData.adodsDocType.Active := true;
  dmStudentData.adodsAbitDisc.Active := true;
  FnCode := 0;
  FDocID := 0;
  FisEdit := False;
end;

procedure TfrmAddDocument.FormShow(Sender: TObject);
begin
  inherited;
  SetEditProperties;
end;

procedure TfrmAddDocument.SetAbitElements(const Value: boolean);
begin
  chbxBonuses.Visible := Value;
end;

{procedure TfrmAddDocument.SetDocProperties(const Value: integer);
var
  FDocument: TDocumentSelect;
begin
  FDocID := Value;
  FDocument := TDocumentSelect.Create(FDocID);
  with FDocument do
  begin
    dbcbeKind.KeyValue := VidIK;
    eSer.Text := IfNull(seria,'');
    eNum.Text := IfNull(number,'');
    if GetDate <> NULL then
      dbdteGetDate.Text := DateToStr(GetDate);
    eWho.Text := IfNull(Who,'');
    cbReal.Checked := isreal;
    dbeAddInfo.Text := IfNull(addinfo,'');
    pnlBonuses.Visible := (balls > 0);
    dbBalls.Text := IntToStr(IfNull(balls,0));
    dbcbeDisc.KeyValue := ikDisc;
  end;
  FDocument.Free;
end;      }

procedure TfrmAddDocument.SetEditProperties;
begin
  if FisEdit then
  begin
    frmAddDocument.Caption := 'Редактировать документ';
    with (Owner as TfmStudent).dbgeDocuments.DataSource.DataSet do
    begin
      dbcbeKind.KeyValue := FieldByName('ik_vid_doc').Value;
      eSer.Text := IfNull(FieldByName('cd_seria').Value,'');
      eNum.Text := IfNull(FieldByName('np_number').Value,'');
      dbdteGetDate.Text := IfNull(FieldByName('dd_vidan').AsString,'  .  .    ');
      eWho.Text := IfNull(FieldByName('cd_kem_vidan').Value,'');
      cbReal.Checked := FieldByName('isreal').Value;
      dbeAddInfo.Text := IfNull(FieldByName('addinfo').Value,'');
      pnlBonuses.Visible := (FieldByName('balls').Value > 0);
      chbxBonuses.Checked := (FieldByName('balls').Value > 0);
      dbBalls.Text := IntToStr(IfNull(FieldByName('balls').Value,0));
      dbcbeDisc.KeyValue := FieldByName('ik_disc').Value;
    end;
  end;
  IsModified := False;
end;

procedure TfrmAddDocument.SetTypeGrazd(const Value: integer);
begin
  (dmStudentData.adodsDocType as TADODataSet).Filtered := False;
  (dmStudentData.adodsDocType as TADODataSet).Filter := '((ik_type_grazd = null) or (ik_type_grazd = ' + IntToStr(Value) + '))';   //  //or )
  (dmStudentData.adodsDocType as TADODataSet).Filtered := True;
end;

procedure TfrmAddDocument.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
  dbcbeKindChange(Sender);
end;

procedure TfrmAddDocument.CollectForParentDialog(aDoc: TDocRecord);
var
  rowsc: integer;
begin
  // добавляем в Grid
  with studDlg.sgDocs do
  begin
    rowsc := RowCount - 1;
    cells[0, rowsc] := dbcbeKind.Text;
    cells[1, rowsc] := eSer.Text;
    cells[2, rowsc] := eNum.Text;
    if not(dbdteGetDate.Value = NULL) then
      if not((DateToStr(dbdteGetDate.Value)) = '  .  .    ') then
        cells[3, rowsc] := DateToStr(dbdteGetDate.Value);
    cells[4, rowsc] := eWho.Text;
    if cbReal.Checked then
      cells[5, rowsc] := 'Да';
    if chbxBonuses.Checked then
    begin
      cells[6, rowsc] := dbBalls.Text;
      cells[7, rowsc] := dbcbeDisc.Text;
    end;
    RowCount := RowCount + 1;
  end;
end;

end.
