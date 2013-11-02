unit uDipl;
   {#Author tanyav@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, DBGridEh,
  DBCtrlsEh, DBLookupEh, Mask;

type
  TfrmDiplom = class(TfrmBaseDialog)
    Label1: TLabel;
    Label2: TLabel;
    edtRegNumber: TDBEditEh;
    edtVipNumder: TDBEditEh;
    Label3: TLabel;
    dbcmbxPredpr: TDBLookupComboboxEh;
    dbcmbxTypeTema: TDBLookupComboboxEh;
    Label5: TLabel;
    edtPrep: TDBEditEh;
    Label7: TLabel;
    edtTema: TDBEditEh;
    Label8: TLabel;
    dteZashita: TDBDateTimeEditEh;
    Label6: TLabel;
    Label4: TLabel;
    dteVidano: TDBDateTimeEditEh;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    nedtOtsenka: TDBNumberEditEh;
    Label17: TLabel;
    Label18: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtVipNumderChange(Sender: TObject);
  private
    { Private declarations }
    procedure CheckRequired;
  public
    { Public declarations }
    ik: Integer;
  protected
    function DoApply: Boolean; override;
    function DoCancel: Boolean; override;
  end;

var
  frmDiplom: TfrmDiplom;
  flag: Byte;

implementation

uses uDM, uBlankRep, ComObj, DB, uDMStudentData, udmDiplom;

{$R *.dfm}
function GetNextCellVert(cur: String): String;
var
  num: Integer;
  i: Integer;
  nstr: String;
  bstr: String;
begin
  i := 1;
  while i<=Length(cur) do
  begin
    if (cur[i]<='9') and (cur[i]>='0') then
      break;
    Inc(i);
  end;
  nstr := Copy(cur, i, Length(cur)-i+1);
  bstr := Copy(cur, 1, i-1);
  num := StrToInt(nstr);
  num := num+1;
  Result := bstr+IntToStr(num);
end;

function GetPrevCellVert(cur: String): String;
var
  num: Integer;
  i: Integer;
  nstr: String;
  bstr: String;
begin
  i := 1;
  while i<=Length(cur) do
  begin
    if (cur[i]<='9') and (cur[i]>='0') then
      break;
    Inc(i);
  end;
  nstr := Copy(cur, i, Length(cur)-i+1);
  bstr := Copy(cur, 1, i-1);
  num := StrToInt(nstr);
  num := num-1;
  Result := bstr+IntToStr(num);
end;

function GetNextCellHor(cur: String): String;
var
  i: Integer;
begin
  i := 2;
  while i<=Length(cur) do
  begin
    if (cur[i]<='A') or (cur[i]>='Z') then
      break;
    Inc(i);
  end;
  Dec(i);
  cur[i] := chr(ord(cur[i])+1);
  Result := cur;
end;

procedure SendToExcel;
var
  E: Variant;
  TmplFile: String;
  FindRange: Variant;
  Range: Variant;
  str, str1: String;   // строка, которую будем вставлять в нужное место в шаблоне
  cur, cur1: String;
  i: Integer;
begin
  E := CreateOleObject('Excel.Application');
  E.Visible := false;
  TmplFile := ExtractFilePath(Application.ExeName)+'reports\Vkl.xlt';
  E.WorkBooks.Add(TmplFile);
  E.Sheets[1].Select;
  // вывод общих сведений
  str := dmDiplom.adospGetVipiscaForDiplomStudName.Value;
  FindRange := E.Cells.Replace(What := '#ФИО#',Replacement:=str);
  str := dmDiplom.adospGetVipiscaForDiplomDd_birth.AsString;
  FindRange := E.Cells.Replace(What := '#ДатаРожд#',Replacement:=str);
  str := dmDiplom.adospGetVipiscaForDiplomYearObuch.AsString;
  FindRange := E.Cells.Replace(What := '#Лет#',Replacement:=str);
  str := dmDiplom.adospGetVipiscaForDiplomyearPostup.AsString;
  FindRange := E.Cells.Replace(What := '#Поступ#',Replacement:=str);
  str := dmDiplom.adospGetVipiscaForDiplomYearGrad.AsString;
  FindRange := E.Cells.Replace(What := '#ЗавОбуч#',Replacement:=str);
  str := dmDiplom.adospGetVipiscaForDiplomform.AsString;
  FindRange := E.Cells.Replace(What := '#Форм#',Replacement:=str);
  str := dmDiplom.adospGetVipiscaForDiplomCname_spec.AsString;
  FindRange := E.Cells.Replace(What := '#Специальность#',Replacement:=str);
  str := dmDiplom.adospGetVipiscaForDiplomcName_spclz.AsString;
  FindRange := E.Cells.Replace(What := '#Специализация#',Replacement:=str);
  str := dmDiplom.adospGetVipiscaForDiplomDd_dipl.AsString;
  FindRange := E.Cells.Replace(What := '#ДатаКом#',Replacement:=str);
  str := dmDiplom.adospGetVipiscaForDiplomDd_VidDipl.AsString;
  FindRange := E.Cells.Replace(What := '#ДатаВыд#',Replacement:=str);
  str := dmDiplom.adospGetVipiscaForDiplomVipNumber.AsString;
  FindRange := E.Cells.Replace(What := '#НомВып#',Replacement:=str);
  str := dmDiplom.adospGetVipiscaForDiplomRegNumber.AsString;
  FindRange := E.Cells.Replace(What := '#РегНом#',Replacement:=str);
  // вывод инфы о дипломе (возможен многострочный, макс. длина строки 80
  // символов)
  str := dmDiplom.adospGetVipiscaForDiplomcdiplom.AsString;
  FindRange := E.Cells.Find(What := '#дипл#');
  FindRange.Select;
  cur := E.Selection.Address;
  Range := E.ActiveSheet.Range[cur];
  while Length(str)>80 do 
  begin
    for i:= 80 downto 1 do
      if str[i]=' ' then
      begin
        str1 := Copy(str, 1, i);
        Delete(str, 1, i);
        Range.Value := str1;
        dmDiplom.adospSelKRForVipisca.Next;
        cur := GetNextCellVert(cur);
        Range := E.ActiveSheet.Range[cur];
        Range.Select;
        break;
      end;
  end;
  Range.Value := str;
  // вывод курсовых работ
  dmDiplom.adospSelKRForVipisca.First;
  FindRange := E.Cells.Find(What := '#КР#');
  FindRange.Select;
  cur := E.Selection.Address;
  Range := E.ActiveSheet.Range[cur];
  while not dmDiplom.adospSelKRForVipisca.Eof do
  begin
    str := dmDiplom.adospSelKRForVipiscacTema.AsString;
    if str = '' then str := 'тема не указана';
    str :=  str+', '+ dmDiplom.adospSelKPForVipiscacOsenca.AsString;
    Range.Value := str;
    dmDiplom.adospSelKRForVipisca.Next;
    cur := GetNextCellVert(cur);
    Range := E.ActiveSheet.Range[cur];
    Range.Select;
  end;
  //********** ВТОРАЯ   СТРАНИЦА *******************
  E.Sheets[2].Select;
  // вывод оценок
  dmDiplom.adospSelUspevForVipisca.First;
  FindRange := E.Cells.Find(What := '#Экз#');
  FindRange.Select;
  cur := E.Selection.Address;
  Range := E.ActiveSheet.Range[cur];
  while not dmDiplom.adospSelUspevForVipisca.Eof do
  begin
    str := dmDiplom.adospSelUspevForVipisca.FieldByName('cName_disc').AsString;
    Range.Value := str;

    cur1 := E.Selection.Address;
    cur1 := GetNextCellHor(cur1);
    Range := E.ActiveSheet.Range[cur1];
    Range.Select;
    str := dmDiplom.adospSelUspevForVipisca.FieldByName('HourCount').AsString;
    Range.Value := str;

    cur1 := GetNextCellHor(cur1);
    Range := E.ActiveSheet.Range[cur1];
    Range.Select;
    str := dmDiplom.adospSelUspevForVipisca.FieldByName('cOsenca').AsString;
    Range.Value := str;

    dmDiplom.adospSelUspevForVipisca.Next;
    cur := GetNextCellVert(cur);
    Range := E.ActiveSheet.Range[cur];
    Range.Select;
  end;
  cur := GetPrevCellVert(cur);cur := GetPrevCellVert(cur);
  Range := E.ActiveSheet.Range[cur];
  Range.Borders.item[8].Weight := 2;
  cur := GetNextCellHor(cur);
  Range := E.ActiveSheet.Range[cur];
  Range.Borders.item[8].Weight := 2;
  // вывод курсовых проектов
  dmDiplom.adospSelKPForVipisca.First;
  FindRange := E.Cells.Find(What := '#КП#');
  FindRange.Select;
  cur := E.Selection.Address;
  Range := E.ActiveSheet.Range[cur];
  while not dmDiplom.adospSelKPForVipisca.Eof do
  begin
    str := dmDiplom.adospSelKPForVipiscacTema.AsString;
    if str = '' then str := 'тема не указана';
    str :=  str+', '+ dmDiplom.adospSelKPForVipiscacOsenca.AsString;
    Range.Value := str;
    dmDiplom.adospSelKPForVipisca.Next;
    cur := GetNextCellVert(cur);
    Range := E.ActiveSheet.Range[cur];
    Range.Select;
  end;
  Range.Borders.item[8].Weight := 2;
  Range.Value := 'Конец документа';
  Range.HorizontalAlignment := -4108;
  cur := GetNextCellHor(cur);
  Range := E.ActiveSheet.Range[cur];
  Range.Borders.item[8].Weight := 2;
  E.Visible := true;
end;

{ TfrmDiplom }

function TfrmDiplom.DoApply: boolean;
begin
// запись информации о дипломе
  dmDiplom.adospAppendDiplom.Active := false;
  with dmDiplom.adospAppendDiplom.Parameters do
  begin
    Items[1].Value := flag;
    Items[2].Value := edtRegNumber.Value;
    Items[3].Value := ik;
    Items[4].Value := edtVipNumder.Text;
    Items[5].Value := edtTema.Text;
    Items[6].Value := edtPrep.Text;
    Items[7].Value := dbcmbxPredpr.KeyValue;
    Items[8].Value := dbcmbxTypeTema.KeyValue;  
    Items[9].Value := nedtOtsenka.Value;
    Items[10].Value := dteZashita.Value;
    Items[11].Value := dteVidano.Value;
  end;
  try
    dmDiplom.adospAppendDiplom.ExecProc;
  except
    ShowMessage('Данные введены некорректно');
  end;
// вывод информации о дипломе
  dmDiplom.adospGetVipiscaForDiplom.Active := false;
  with dmDiplom.adospGetVipiscaForDiplom.Parameters do
    Items[1].Value := ik;
  dmDiplom.adospGetVipiscaForDiplom.ExecProc;
  dmDiplom.adospGetVipiscaForDiplom.Active := true;

  dmDiplom.adospSelUspevForVipisca.Active := false;
  with dmDiplom.adospSelUspevForVipisca.Parameters do
    Items[1].Value := ik;
  dmDiplom.adospSelUspevForVipisca.ExecProc;
  dmDiplom.adospSelUspevForVipisca.Active := true;

  dmDiplom.adospSelKRForVipisca.ExecProc;
  dmDiplom.adospSelKRForVipisca.Active := true;

  dmDiplom.adospSelKPForVipisca.ExecProc;
  dmDiplom.adospSelKPForVipisca.Active := true;
  SendToExcel;

  Result := true;
end;

function TfrmDiplom.DoCancel: boolean;
begin
  Result := true;
end;

procedure TfrmDiplom.FormShow(Sender: TObject);
begin
  inherited;
  dmDiplom.adospGetVipiscaForDiplom.Active := false;
  with dmDiplom.adospGetVipiscaForDiplom.Parameters do
    Items[1].Value := ik;
  dmDiplom.adospGetVipiscaForDiplom.ExecProc;
  dmDiplom.adospGetVipiscaForDiplom.Active := true;
  if dmDiplom.adospGetVipiscaForDiplom.RecordCount <> 0 then
  begin
    flag := 0;
    edtVipNumder.Value := dmDiplom.adospGetVipiscaForDiplomVipNumber.Value;
    edtRegNumber.Value := dmDiplom.adospGetVipiscaForDiplomRegNumber.Value;
    dteVidano.Value := dmDiplom.adospGetVipiscaForDiplomDd_VidDipl.Value;
    dteZashita.Value := dmDiplom.adospGetVipiscaForDiplomDd_dipl.Value;
    dteZashita.Value := dmDiplom.adospGetVipiscaForDiplomDd_dipl.Value;
   // nedtOtsenka.Value := dmDiplom.adospGetVipiscaForDiplomCosenca.Value;
    //dbcmbxPredpr.KeyValue := dmDiplom.adospGetVipiscaForDiplomik_pred.Value;
    //dbcmbxTypeTema.KeyValue := dmDiplom.adospGetVipiscaForDiplomik_typeTema.Value;
   // edtPrep.Value := dmDiplom.adospGetVipiscaForDiplomcTeacher.Value;
  //  edtTema.Value := dmDiplom.adospGetVipiscaForDiplomcTema.Value;
  end
  else
  begin
    flag := 1;
    dteVidano.Value := Date;
    dteZashita.Value := Date;
  end;
end;

procedure TfrmDiplom.FormCreate(Sender: TObject);
begin
  inherited;
{  dmStudentData.adotblPredpr.Active := false;
  dmStudentData.adotblPredpr.Active := true;
  dmDiplom.adotbltypeTema.Active := false;
  dmDiplom.adotbltypeTema.Active := true;     }
  dbcmbxPredpr.KeyValue := 0;
  dbcmbxTypeTema.KeyValue := 1;
end;

procedure TfrmDiplom.edtVipNumderChange(Sender: TObject);
begin
  inherited;
  CheckRequired;
end;

procedure TfrmDiplom.CheckRequired;
begin
  if edtRegNumber.Value = '' then
  begin
    IsModified := false;
    Exit;
  end;
  if edtVipNumder.Value = '' then
  begin
    IsModified := false;
    Exit;
  end;
  if edtPrep.Value = '' then
  begin
    IsModified := false;
    Exit;
  end;
  if edtTema.Value = '' then
  begin
    IsModified := false;
    Exit;
  end;
  if dteZashita.Text = '  .  .    ' then
  begin
    IsModified := false;
    Exit;
  end;
  if dteVidano.Text = '  .  .    ' then
  begin
    IsModified := false;
    Exit;
  end;
  if dbcmbxPredpr.KeyValue = -1 then
  begin
    IsModified := false;
    Exit;
  end;
  if dbcmbxTypeTema.KeyValue = -1 then
  begin
    IsModified := false;
    Exit;
  end;      
  if nedtOtsenka.Text = '' then
  begin
    IsModified := false;
    Exit;
  end;
  IsModified := true;
end;

end.
