unit uSprForGroup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uReviewCallSpr, DBGridEh,
  System.Actions,
  Vcl.ActnList, Vcl.Mask, DBCtrlsEh, DBLookupEh, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, GridsEh, DBAxisGridsEh, uDMDocuments, DateUtils, Data.Win.ADODB;

type
  TfmSprForGroup = class(TfmСhallengeSpr)
    dbgAddr: TDBGridEh;
    cbePrich: TComboBoxEx;
    procedure dbgAddrDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure dbgAddrColExit(Sender: TObject);
    procedure cbeSemChange(Sender: TObject);
    procedure cbeReasonChange(Sender: TObject);
    procedure cbePrichChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure AfterConstruction; Override;
  end;

var
  fmSprForGroup: TfmSprForGroup;

implementation

uses uDM, uMain;
{$R *.dfm}
{ TfmSprForGroup }

procedure TfmSprForGroup.actOKExecute(Sender: TObject);
begin
  inherited;
ModalResult:=mrOk;
end;

procedure TfmSprForGroup.AfterConstruction;
begin
  inherited;
  uDMDocuments.dmDocs.adodsStudGrup.Active := false; // подключам базу
  dmDocs.adodsStudGrup.Filter := 'ik_grup =' + id_grup.ToString();
  dmDocs.adodsStudGrup.Filtered := true;
  uDMDocuments.dmDocs.adodsStudGrup.Active := true; // подключам базу
end;

procedure TfmSprForGroup.BitBtn1Click(Sender: TObject);
begin
  inherited;
ModalResult:=mrYes;
end;

procedure TfmSprForGroup.cbePrichChange(Sender: TObject);
var
  z: TDateTime;
  AYear, AMonth, ADay: word;
  week1, week2, numweek, k, h, i, sem, year: Integer;
  mask1, mask2: string;
  sp_vidz: TADODataSet;
begin
  inherited;
//   предоставить информацию о документе
//   Создать документ
//   достать из базы данные по документу
  DecodeDate(Now, AYear, AMonth, ADay);
  if cbePrich.ItemsEx.Count > 0 then
  begin
    k := 0;
    if (cbePrich.Text = 'Промежуточная аттестация') then
      k := 55;
    if (cbePrich.Text = 'Государственный экзамен') then
      k := 56;
    if (cbePrich.Text = 'Выпускная работа') then
      k := 31;
    // k:=    Integer(cbeReason.Items.Objects[cbeReason.ItemIndex]);
    sp_vidz := TADODataSet.Create(nil);
    sp_vidz.CommandText := 'select * from Graph_Uch_Proc Where Ik_Grup=' +
      id_grup.ToString() + 'and n_sem=' + cbeSem.Text + ' and iK_vid_zanyat=' +
      k.ToString();
    // String(cbeReason.Items.Objects[cbeReason.ItemIndex]);
    sp_vidz.Connection := dm.DBConnect;
    sp_vidz.Open;
    sp_vidz.First;

    // week1 := 40;
    // week2 := 42;
    // mask1 := '001111';
    // mask2 := '111000';
    week1 := sp_vidz.FieldByName('Num1').AsInteger;
    week2 := sp_vidz.FieldByName('Num2').AsInteger;
    mask1 := sp_vidz.FieldByName('mask_week1').AsString;
    mask2 := sp_vidz.FieldByName('mask_week2').AsString;
    numweek := 1;
    k := 0;

    df := date;
    ds := date;
    z := date;

    if date() > StrToDateTime('01.09.' + AYear.ToString()) then
      df := StrToDateTime('01.09.' + AYear.ToString())
    else
    begin
      df := StrToDateTime('01.09.' + (StrToInt(AYear.ToString()) - 1)
        .ToString());
      AYear := StrToInt(AYear.ToString()) - 1;
    end;

    if DayOfWeek(df) = 1 then
      df := StrToDateTime('02.09.' + AYear.ToString());

    while numweek <> week1 do
    begin
      df := df + 7;
      numweek := numweek + 1;
    end;
    if week1 <> week2 then
    begin
      ds := df;
      For i := 1 to (week2 - week1) * 7 + Pos('0', mask2) - 2 do
        ds := ds + 1;
    end
    else
      ds := df + 6 - DayOfWeek(df);
    For i := 1 to (Pos('1', mask1) - 1) do
      df := df + 1;
    dtpBegin.date := df;
    dtpEnd.date := ds;
    eNumDate.Text := IntToStr(DaysBetween(df, ds) + 1); // обе даны включительно
  end;
  if (cbePrich.Text <> '') then
  begin
    bbOk.Enabled := true;
    BitBtn1.Enabled := true;
  end;

end;

procedure TfmSprForGroup.cbeReasonChange(Sender: TObject);
var
  z: TDateTime;
  AYear, AMonth, ADay: word;
  week1, week2, numweek, k, h, i, sem, year: Integer;
  mask1, mask2: string;
  sp_vidz: TADODataSet;
begin
  inherited;
  // предоставить информацию о документе
  // Создать документ
  // достать из базы данные по документу
//  DecodeDate(Now, AYear, AMonth, ADay);
//  if cbeReason.ItemsEx.Count > 0 then
//  begin
//    k := 0;
//    if (cbeReason.Text = 'Промежуточная аттестация') then
//      k := 55;
//    if (cbeReason.Text = 'Государственный экзамен') then
//      k := 56;
//    if (cbeReason.Text = 'Выпускная работа') then
//      k := 31;
//    // k:=    Integer(cbeReason.Items.Objects[cbeReason.ItemIndex]);
//    sp_vidz := TADODataSet.Create(nil);
//    sp_vidz.CommandText := 'select * from Graph_Uch_Proc Where Ik_Grup=' +
//      id_grup.ToString() + 'and n_sem=' + cbeSem.Text + ' and iK_vid_zanyat=' +
//      k.ToString();
//    // String(cbeReason.Items.Objects[cbeReason.ItemIndex]);
//    sp_vidz.Connection := dm.DBConnect;
//    sp_vidz.Open;
//    sp_vidz.First;
//
//    // week1 := 40;
//    // week2 := 42;
//    // mask1 := '001111';
//    // mask2 := '111000';
//    week1 := sp_vidz.FieldByName('Num1').AsInteger;
//    week2 := sp_vidz.FieldByName('Num2').AsInteger;
//    mask1 := sp_vidz.FieldByName('mask_week1').AsString;
//    mask2 := sp_vidz.FieldByName('mask_week2').AsString;
//    numweek := 1;
//    k := 0;
//
//    df := date;
//    ds := date;
//    z := date;
//
//    if date() > StrToDateTime('01.09.' + AYear.ToString()) then
//      df := StrToDateTime('01.09.' + AYear.ToString())
//    else
//    begin
//      df := StrToDateTime('01.09.' + (StrToInt(AYear.ToString()) - 1)
//        .ToString());
//      AYear := StrToInt(AYear.ToString()) - 1;
//    end;
//
//    if DayOfWeek(df) = 1 then
//      df := StrToDateTime('02.09.' + AYear.ToString());
//
//    while numweek <> week1 do
//    begin
//      df := df + 7;
//      numweek := numweek + 1;
//    end;
//    if week1 <> week2 then
//    begin
//      ds := df;
//      For i := 1 to (week2 - week1) * 7 + Pos('0', mask2) - 2 do
//        ds := ds + 1;
//    end
//    else
//      ds := df + 6 - DayOfWeek(df);
//    For i := 1 to (Pos('1', mask1) - 1) do
//      df := df + 1;
//    dtpBegin.date := df;
//    dtpEnd.date := ds;
//    eNumDate.Text := IntToStr(DaysBetween(df, ds) + 1); // обе даны включительно
//  end;
//  if (cbeReason.Text <> '') and (((cbexTransp.Text <> '') and (rbP.Checked)) or
//    (rbL.Checked)) then
//  begin
//    bbOk.Enabled := true;
//    BitBtn1.Enabled := true;
//  end;

end;

procedure TfmSprForGroup.cbeSemChange(Sender: TObject);
var
  k: Integer;
  sp_vidz: TADODataSet;
  sp_info: TADOStoredProc;
  i: Integer;
begin
  inherited;
  try
    i := 0;
    if cbeSem.ItemIndex > -1 then
    begin
      cbePrich.Items.Clear();
      cbePrich.Text := '';
      // найти предстоящие мероприятия у студента в текущем семестре (title - группа, семестр)
      sp_vidz := TADODataSet.Create(nil);
      sp_vidz.CommandText := 'select * from StudAction(' +
        uMain.id_grup.ToString() + ',' + cbeSem.Text + ')';
      sp_vidz.Connection := dm.DBConnect;
      sp_vidz.Open;
      sp_vidz.First;
      // предоставить пользователю виды занятий (сессия, госы, диплом)

      // fAsk.Caption:=sp_info.FieldByName('Cname_grup').AsString()+' '+sem.ToString()+ ' семестр';
      While not sp_vidz.Eof do
      begin
        if (sp_vidz.FieldByName('iK_vid_zanyat').AsInteger = 55) then
          cbePrich.Items.AddObject('Промежуточная аттестация', TObject(55));
        if (sp_vidz.FieldByName('iK_vid_zanyat').AsInteger = 56) then
          cbePrich.Items.AddObject('Государственный экзамен', TObject(56));
        if (sp_vidz.FieldByName('iK_vid_zanyat').AsInteger = 31) then
          cbePrich.Items.AddObject('Выпускная работа', TObject(31));
        sp_vidz.Next;
      end;
      if cbePrich.ItemsEx.Count > 0 then
      begin
        cbePrich.ItemIndex := i;
//
      end;
    end;

  finally
    sp_vidz.Free;
    sp_info.Free;

  end;
end;

procedure TfmSprForGroup.dbgAddrColExit(Sender: TObject);
begin
  inherited;
  { При выходе с поля ComboBox надо скрыть }
  // if dbgAddr.SelectedField.FieldName = lcbTypeaddr.DataField then
  // lcbTypeaddr.Visible := false;
end;

procedure TfmSprForGroup.dbgAddrDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var
  t: string;
begin
  inherited;
  // if (gdFocused in State) then
  // if (Column.Field.FieldName = lcbTypeaddr.ListField) then begin
  // { Вместо стандартного InplaceEditorа показываем ComboBox }
  // lcbTypeaddr.Left := Rect.Left + dbgAddr.Left;
  // lcbTypeaddr.Top := Rect.Top + dbgAddr.top;
  // lcbTypeaddr.Width := Rect.Right - Rect.Left + 2;
  // lcbTypeaddr.Visible := True;
  // if lcbTypeaddr.Text.Length>0 then
  // begin
  // Column.Field.AsString:= lcbTypeaddr.Text;
  // // Column.Field.Value:= lcbTypeaddr.KeyValue;
  // //    dbgAddr.DataSource.DataSet.Fields.Fields[1].Value:=lcbTypeaddr.KeyValue;
  // end;
  // end;

end;

end.
