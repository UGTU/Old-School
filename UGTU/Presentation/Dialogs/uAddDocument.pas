unit uAddDocument;

{ #Author sergdev@ist.ugtu.net }
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, uDMStudentData,
  DBGridEh, DBCtrlsEh, Mask, DBLookupEh, uStuddlg, System.Actions, Vcl.ComCtrls;

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
    Panel2: TPanel;
    UpDown1: TUpDown;
    dbBalls: TDBEditEh;
    Label7: TLabel;
    Label10: TLabel;
    dbcbeDisc: TDBLookupComboboxEh;
    procedure FormShow(Sender: TObject);
    procedure actCheckFieldsUpdate(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure dbcbeKindChange(Sender: TObject);
    procedure bbOKClick(Sender: TObject);
    procedure bbApplyClick(Sender: TObject);
    procedure chbxBonusesClick(Sender: TObject);
  private
    procedure SetAbitElements(const Value: boolean);
    procedure CollectDocProperties;
    { Private declarations }
  public
    studDlg: TftmStudent;
    property isAbit: boolean write SetAbitElements;
    { Public declarations }
  end;

var
  frmAddDocument: TfrmAddDocument;

implementation

uses ConstantRepository;

{$R *.dfm}

function CheckFields: boolean;
begin
  result := true;
  with frmAddDocument do
  begin
    if (dbcbeKind.Text = '') {or (eSer.Text = '') } or (eNum.Text = '') then
      result := false
  end;
end;

procedure TfrmAddDocument.actApplyExecute(Sender: TObject);
begin
  CollectDocProperties;
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

procedure TfrmAddDocument.bbApplyClick(Sender: TObject);
begin
  CollectDocProperties;

  dbcbeKind.value := -1;
  eSer.Text := '';
  eWho.Text := '';
  dbdteGetDate.Text := '  .  .    ';
  eNum.Text := '';
end;

procedure TfrmAddDocument.bbOKClick(Sender: TObject);
begin
  actApplyExecute(Sender);
  close;
end;

procedure TfrmAddDocument.chbxBonusesClick(Sender: TObject);
begin
  inherited;
  Panel2.Visible := chbxBonuses.Checked;
end;

procedure TfrmAddDocument.dbcbeKindChange(Sender: TObject);
begin

  if CheckFields then
  begin
    bbOk.Enabled := true;
    bbApply.Enabled := true;
  end
  else
  begin
    bbOk.Enabled := false;
    bbApply.Enabled := false;
  end;

end;

procedure TfrmAddDocument.FormShow(Sender: TObject);
begin
  dmStudentData.adodsDocType.Active := true;
  dmStudentData.adodsAbitDisc.Active := true;
end;

procedure TfrmAddDocument.SetAbitElements(const Value: boolean);
begin
  chbxBonuses.Visible := Value;
end;

procedure TfrmAddDocument.CollectDocProperties;
var
  balls: Integer;
  rowsc: Integer;
  doc: TDocRecord;
begin
  with studDlg.sgDocs do
  begin
    rowsc := RowCount - 1;
    cells[0, rowsc] := dbcbeKind.Text;
    cells[1, rowsc] := eSer.Text;
    cells[2, rowsc] := eNum.Text;
    if not (dbdteGetDate.value = Null) then
      if not ((DateToStr(dbdteGetDate.value)) = '  .  .    ') then
        cells[3, rowsc] := DateToStr(dbdteGetDate.value);
    cells[4, rowsc] := eWho.Text;
    if chbxBonuses.Checked then
    begin
      cells[5, rowsc] := dbBalls.Text;
      cells[6, rowsc] := dbcbeDisc.Text;
    end;
    RowCount := RowCount + 1;
  end;
  if chbxBonuses.Checked then
    balls := strtoint(dbBalls.Text)
  else
    balls := 0;
  doc := TDocRecord.Create(dbcbeKind.KeyValue, balls, dbcbeDisc.KeyValue, eSer.Text, eNum.Text, eWho.Text, dbeAddInfo.Text, dbdteGetDate.value);
  (Owner as TftmStudent).DocRecordList.Add(doc);
end;

end.
