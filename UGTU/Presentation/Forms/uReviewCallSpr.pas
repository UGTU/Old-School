unit uReviewCallSpr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uReviewDoc, System.Actions,
  Vcl.ActnList, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, EhLibADO,
  Data.Win.ADODB,DateUtils;

type
  TfmСhallengeSpr = class(TfrmReviewDoc)
    Label6: TLabel;
    cbeSem: TComboBoxEx;
    Label7: TLabel;
    cbeReason: TComboBoxEx;
    Label8: TLabel;
    dtpBegin: TDateTimePicker;
    dtpEnd: TDateTimePicker;
    Label9: TLabel;
    Label10: TLabel;
    lblNumDate: TLabel;
    eNumDate: TEdit;
    Label12: TLabel;
    Label11: TLabel;
    procedure cbeSemChange(Sender: TObject);
    procedure cbeReasonChange(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmСhallengeSpr: TfmСhallengeSpr;
  ds, df:TDateTime;
  ik_contentup:integer;

implementation

{$R *.dfm}

uses uDM, uStudent;

procedure TfmСhallengeSpr.actOKExecute(Sender: TObject);
begin
  inherited;
ModalResult:=mrOk;
end;

procedure TfmСhallengeSpr.BitBtn1Click(Sender: TObject);
begin
  inherited;
ModalResult:=mrYes;
end;

procedure TfmСhallengeSpr.cbeReasonChange(Sender: TObject);
var
   z: TDateTime;
  AYear, AMonth, ADay: word;
  week1, week2, numweek, k, h, i, sem, year: integer;
  mask1, mask2: string;
  sp_vidz: TADODataSet;
begin
  inherited;
  // предоставить информацию о документе
  // Создать документ
  // достать из базы данные по документу
  DecodeDate(Now, AYear, AMonth, ADay);
  if cbeReason.ItemsEx.Count > 0 then
  begin
    k := 0;
    if (cbeReason.Text = 'Промежуточная аттестация') then
      k := 55;
    if (cbeReason.Text = 'Государственный экзамен') then
      k := 56;
    if (cbeReason.Text = 'Выпускная работа') then
      k := 31;
    // k:=    Integer(cbeReason.Items.Objects[cbeReason.ItemIndex]);
    sp_vidz := TADODataSet.Create(nil);
    sp_vidz.CommandText := 'select * from Graph_Uch_Proc Where Ik_studGrup=' +
      uStudent.ik_stud.ToString() + 'and n_sem=' + cbeSem.Text +
      ' and iK_vid_zanyat=' + k.ToString();
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
    eNumDate.Text :=  IntToStr(DaysBetween(df, ds)+1);//обе даны включительно
  end;
     if (cbeSem.Text <> '')and ((cbeReason.Text <> '') ) then
  begin
    bbOk.Enabled:=true;
    BitBtn1.Enabled:=true;
  end;
end;

procedure TfmСhallengeSpr.cbeSemChange(Sender: TObject);
var
  k: integer;
  sp_vidz: TADODataSet;
  sp_info: TADOStoredProc;
begin
  inherited;
  try
    if cbeSem.ItemIndex > -1 then
    begin
    cbeReason.Items.Clear();
    cbeReason.Text:='';
      // найти предстоящие мероприятия у студента в текущем семестре (title - группа, семестр)
      sp_vidz := TADODataSet.Create(nil);
      sp_vidz.CommandText := 'select * from StudAction(' +
        uStudent.ik_stud.ToString() + ',' + cbeSem.Text + ')';
      sp_vidz.Connection := dm.DBConnect;
      sp_vidz.Open;
      sp_vidz.First;
      // предоставить пользователю виды занятий (сессия, госы, диплом)

      // fAsk.Caption:=sp_info.FieldByName('Cname_grup').AsString()+' '+sem.ToString()+ ' семестр';
      While not sp_vidz.Eof do
      begin
        if (sp_vidz.FieldByName('iK_vid_zanyat').AsInteger = 55) then
          cbeReason.Items.AddObject('Промежуточная аттестация', TObject(55));
        if (sp_vidz.FieldByName('iK_vid_zanyat').AsInteger = 56) then
          cbeReason.Items.AddObject('Государственный экзамен', TObject(56));
        if (sp_vidz.FieldByName('iK_vid_zanyat').AsInteger = 31) then
          cbeReason.Items.AddObject('Выпускная работа', TObject(31));
        sp_vidz.Next;
      end;
      if cbeReason.ItemsEx.Count > 0 then
      begin
        cbeReason.ItemIndex := 0;

      end;
    end;
   if (cbeSem.Text <> '') and ((cbeReason.Text <> '') ) then
  begin
    bbOk.Enabled:=true;
    BitBtn1.Enabled:=true;
  end;
  finally

    sp_info.Free;
    sp_vidz.Free;

  end;

end;

end.
