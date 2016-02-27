unit uAddDocument;

{ #Author sergdev@ist.ugtu.net }
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, uDMStudentData,
  DBGridEh, DBCtrlsEh, Mask, DBLookupEh, uStuddlg, System.Actions, Vcl.ComCtrls,
  CommandController, DocumentClass, Data.Win.ADODB, Vcl.ExtDlgs, System.Generics.Collections;

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
    chbxBonuses: TCheckBox;
    pnlBonuses: TPanel;
    UpDown1: TUpDown;
    dbBalls: TDBEditEh;
    Label7: TLabel;
    Label10: TLabel;
    dbcbeDisc: TDBLookupComboboxEh;
    cbReal: TCheckBox;
    opDocs: TOpenPictureDialog;
    Action1: TAction;
    Label9: TLabel;
    WhoRequired: TLabel;
    procedure actCheckFieldsUpdate(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure dbcbeKindChange(Sender: TObject);
    procedure chbxBonusesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure btnLoadClick(Sender: TObject);
    procedure DelDocClick(Sender: TObject);
    procedure GrowImage(Sender: TObject);
    procedure DoNothing(Sender: TObject);
    procedure eSerExit(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
  private
    FnCode: integer;
    FDocID: integer;
    FisEdit: boolean;
    FTypeGrazd: integer;
    fLeft: integer;
    fTop: integer;
    fDocCount: integer;
    procedure SetAbitElements(const Value: boolean);
    procedure CollectForParentDialog(aDoc: TDocRecord);
    procedure SetEditProperties;
    procedure SetTypeGrazd(const Value: integer);
    procedure SetImageFiles(const Value: TList<TMemoryStream>);
    procedure CreateDocFrame(aFile: TMemoryStream);
  protected
    { Private declarations }
    function DoCancel:boolean; override;
  public
    studDlg: TftmStudent;
    property isEdit: boolean write FisEdit;
    property isAbit: boolean write SetAbitElements;
    property nCode: integer read FnCode write FnCode;
    property DocID: integer read FDocID write FDocID;
    property TypeGrazd: integer write SetTypeGrazd;
    property ImageFiles: TList<TMemoryStream> write SetImageFiles;

    { Public declarations }
  end;

var
  frmAddDocument: TfrmAddDocument;

implementation

uses ConstantRepository, PersonController, uStudent, ImageFullSizeShowFrm,
     VarFileUtils, Vcl.Imaging.jpeg;

{$R *.dfm}

function CheckFields: boolean;
begin
  result := true;
  with frmAddDocument do
  begin
    if (dbcbeKind.Text = '') { or (eSer.Text = '') } or (eNum.Text = '') then
      result := false;
    if (dbcbeKind.Text <> '') then
      if (dbcbeKind.ListSource.DataSet.FieldByName('IsIdentity').AsBoolean) or
         (dbcbeKind.ListSource.DataSet.FieldByName('IsEducational').AsBoolean) then
      begin
         if (eWho.Text = '') then
          result := false;
         WhoRequired.Visible := true;
      end
      else
        WhoRequired.Visible := false;
  end;
end;

procedure TfrmAddDocument.actApplyExecute(Sender: TObject);
var
  doc: TDocRecord;
  i: integer;
  stream : TMemoryStream;
  iDoc: TImage;
  iLabel: TLabel;
begin
  doc := TDocRecord.Create(FDocID, dbcbeKind.KeyValue, StrToInt(dbBalls.Text),
    dbcbeDisc.KeyValue, eSer.Text, eNum.Text, eWho.Text, dbeAddInfo.Text,
    cbReal.Checked, dbdteGetDate.Value);

  for i := 0 to fDocCount - 1 do
  begin
    stream := TMemoryStream.Create;
    (FindComponent('Image' + IntToStr(i)) as TImage).Picture.Graphic.SaveToStream(stream);
    doc.AddDoc(stream);
  end;

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
      FieldByName('DocCount').Value := doc.docs.Count;
    end;

    // добавляем/правим в коллекции документов родителя
    With (Owner as TfmStudent) do
    begin
      for i := 0 to DocRecordList.Count - 1 do
         if (DocRecordList[i].ikDocVid = doc.ikDocVid) and
         (DocRecordList[i].number = doc.number) then
         begin
           DocRecordList.Delete(i);
           break;
         end;

      DocRecordList.Add(doc);
      modified := true;
    end;
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
      for I := 0 to fDocCount - 1 do
      begin
        iDoc := FindComponent('Image' + IntToStr(i)) as TImage;
        iDoc.Destroy;
        iLabel := FindComponent('Lab' + IntToStr(i)) as TLabel;
        iLabel.Destroy;
      end;
      fDocCount := 0;
      fLeft := 150;
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

procedure TfrmAddDocument.bbCancelClick(Sender: TObject);
begin
  inherited;
  (dmStudentData.adodsDocType as TADODataSet).Filtered := False;
end;

procedure TfrmAddDocument.btnLoadClick(Sender: TObject);
begin
  inherited;
  if opDocs.Execute then
  begin
    CreateDocFrame(nil);
    IsModified := CheckFields;
  end;
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

procedure TfrmAddDocument.DelDocClick(Sender: TObject);
var
  iDoc, iMoveDoc: TImage;
  iLabel, iMoveLabel: TLabel;
  i: integer;
begin
  iDoc := FindComponent('Image' + IntToStr((Sender as TLabel).Tag)) as TImage;
  iDoc.Destroy;
  Sender.Destroy;

  for i := (Sender as TLabel).Tag + 1 to fDocCount - 1 do
  begin
    iMoveDoc := FindComponent('Image' + IntToStr(i)) as TImage;
    iMoveDoc.Name := 'Image' + IntToStr(i-1);
    iMoveDoc.Left := iMoveDoc.Left - 65;
    iMoveLabel := FindComponent('Lab' + IntToStr(i)) as TLabel;
    iMoveLabel.Name := 'Lab' + IntToStr(i-1);
    iMoveLabel.Left := iMoveLabel.Left - 65;
  end;
  fDocCount := fDocCount - 1;
  fLeft := fLeft - 65;
  IsModified := CheckFields;
end;

function TfrmAddDocument.DoCancel: boolean;
begin
  Result := true;
end;

procedure TfrmAddDocument.DoNothing(Sender: TObject);
begin
  //ничего не делать
end;

procedure TfrmAddDocument.eSerExit(Sender: TObject);
var tempST: string;
begin
  inherited;
  tempST := StringReplace(eSer.Text,' ','', [rfReplaceAll, rfIgnoreCase]);  //без пробелов
  tempST := StringReplace(tempST,'-','', [rfReplaceAll, rfIgnoreCase]);     //без прочерков
  eSer.Text := tempST;
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

  fDocCount := 0;
  fLeft:= 150;
  fTop:= 206;

  FisEdit := False;
end;

procedure TfrmAddDocument.FormShow(Sender: TObject);
begin
  inherited;
  SetEditProperties;
end;

procedure TfrmAddDocument.GrowImage(Sender: TObject);
  var
  pt: TPoint;
  h, w: integer;
  prop: double;
begin
  if not Assigned((Sender as TImage).Picture.Graphic) then
    exit;

  pt := (Sender as TImage).ClientToScreen(Point(0, 0));

  if (Sender as TImage).Picture.Graphic.Height > Screen.WorkAreaHeight then
  begin
    h := Screen.WorkAreaHeight - 50;
    prop :=  (Sender as TImage).Height / h;
    w := Round((Sender as TImage).Width / prop);
  end else
    begin
      h := (Sender as TImage).Picture.Graphic.Height;
      w := (Sender as TImage).Picture.Graphic.Width;
    end;

  ImageFullSizeShowForm.curControl := Sender as TImage;
  ImageFullSizeShowForm.Height := h;
  ImageFullSizeShowForm.Width := w;
  ImageFullSizeShowForm.Top := pt.Y - (ImageFullSizeShowForm.Height div 2 - (Sender as TImage).Height div 2);
  ImageFullSizeShowForm.Left := pt.X - (ImageFullSizeShowForm.Width div 2 - (Sender as TImage).Width div 2);

  ImageFullSizeShowForm.Image := (Sender as TImage).Picture.Graphic;
  ImageFullSizeShowForm.Show;
end;

procedure TfrmAddDocument.SetAbitElements(const Value: boolean);
begin
  chbxBonuses.Visible := Value;
end;

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
  end else
    bbApply.Caption := 'Добавить';
  IsModified := False;
end;

procedure TfrmAddDocument.SetImageFiles(const Value: TList<TMemoryStream>);
var i: integer;
begin
  for I := 0 to Value.Count - 1 do
    CreateDocFrame(Value[i]);
end;

procedure TfrmAddDocument.CreateDocFrame(aFile: TMemoryStream);
var
  iDelLabel: TLabel;
  iDoc: TImage;
begin
  iDoc := TImage.Create(Self);


  if Assigned(aFile) then
  begin
    aFile.Position := 0;
    iDoc.Picture.Graphic := TJPEGImage.Create;
    iDoc.Picture.Graphic.LoadFromStream(aFile);
  end
    else
      iDoc.Picture.LoadFromFile(opDocs.FileName);  //из файла


  iDelLabel := TLabel.Create(Self);
  iDoc.Name := 'Image' + IntToStr(fDocCount);
  iDelLabel.Name := 'Lab' + IntToStr(fDocCount);
  iDelLabel.Tag := fDocCount;
  iDoc.Left := fLeft;
  iDelLabel.Left := fLeft + 10;
  iDoc.Top := fTop;

  iDoc.Width := 59;
  iDoc.Height := Round(iDoc.Picture.Graphic.Height*(59/iDoc.Picture.Graphic.Width));
  iDelLabel.Top := fTop + iDoc.Height + 3;
  iDelLabel.Caption := 'удалить';
  iDoc.Parent := Self;
  iDelLabel.Parent := Self;

  iDoc.Stretch := true;
  iDelLabel.Font.Style := [fsUnderline];
  iDelLabel.Font.Color := clHotLight;
  iDelLabel.OnClick := DelDocClick;
  iDoc.OnMouseEnter := GrowImage;
  iDoc.OnClick := DoNothing;
  fDocCount := fDocCount + 1;
  fLeft := fLeft + 65;
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
