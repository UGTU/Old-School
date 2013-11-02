unit uDiplOKadr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, DBGridEh,
  DBCtrlsEh, DBLookupEh, Mask;

type
  TfrmDiplomOKadr = class(TfrmBaseDialog)
    Label1: TLabel;
    edtRegNumber: TDBEditEh;
    Label8: TLabel;
    dteZashita: TDBDateTimeEditEh;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
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
  frmDiplomOKadr: TfrmDiplomOKadr;
  flag: Byte;

implementation

uses uDM, uBlankRep, ComObj, DB, uDMStudentData;

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
  str := dm.adospGetVipiscaForDiplomStudName.Value;
  FindRange := E.Cells.Replace(What := '#ФИО#',Replacement:=str);
  str := dm.adospGetVipiscaForDiplomDd_birth.AsString;
  FindRange := E.Cells.Replace(What := '#ДатаРожд#',Replacement:=str);
  str := dm.adospGetVipiscaForDiplomYearObuch.AsString;
  FindRange := E.Cells.Replace(What := '#Лет#',Replacement:=str);
  str := dm.adospGetVipiscaForDiplomyearPostup.AsString;
  FindRange := E.Cells.Replace(What := '#Поступ#',Replacement:=str);
  str := dm.adospGetVipiscaForDiplomYearGrad.AsString;
  FindRange := E.Cells.Replace(What := '#ЗавОбуч#',Replacement:=str);
  str := dm.adospGetVipiscaForDiplomform.AsString;
  FindRange := E.Cells.Replace(What := '#Форм#',Replacement:=str);
  str := dm.adospGetVipiscaForDiplomCname_spec.AsString;
  FindRange := E.Cells.Replace(What := '#Специальность#',Replacement:=str);
  str := dm.adospGetVipiscaForDiplomcName_spclz.AsString;
  FindRange := E.Cells.Replace(What := '#Специализация#',Replacement:=str);
  str := dm.adospGetVipiscaForDiplomDd_dipl.AsString;
  FindRange := E.Cells.Replace(What := '#ДатаКом#',Replacement:=str);
  str := dm.adospGetVipiscaForDiplomDd_VidDipl.AsString;
  FindRange := E.Cells.Replace(What := '#ДатаВыд#',Replacement:=str);
  str := dm.adospGetVipiscaForDiplomVipNumber.AsString;
  FindRange := E.Cells.Replace(What := '#НомВып#',Replacement:=str);
  str := dm.adospGetVipiscaForDiplomRegNumber.AsString;
  FindRange := E.Cells.Replace(What := '#РегНом#',Replacement:=str);
  // вывод инфы о дипломе (возможен многострочный, макс. длина строки 80
  // символов)
  str := dm.adospGetVipiscaForDiplomcdiplom.AsString;
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
        dm.adospSelKRForVipisca.Next;
        cur := GetNextCellVert(cur);
        Range := E.ActiveSheet.Range[cur];
        Range.Select;
        break;
      end;
  end;
  Range.Value := str;
  // вывод курсовых работ
  dm.adospSelKRForVipisca.First;
  FindRange := E.Cells.Find(What := '#КР#');
  FindRange.Select;
  cur := E.Selection.Address;
  Range := E.ActiveSheet.Range[cur];
  while not dm.adospSelKRForVipisca.Eof do
  begin
    str := dm.adospSelKRForVipiscacTema.AsString;
    if str = '' then str := 'тема не указана';
    str :=  str+', '+ dm.adospSelKPForVipiscacOsenca.AsString;
    Range.Value := str;
    dm.adospSelKRForVipisca.Next;
    cur := GetNextCellVert(cur);
    Range := E.ActiveSheet.Range[cur];
    Range.Select;
  end;
  //********** ВТОРАЯ   СТРАНИЦА *******************
  E.Sheets[2].Select;
  // вывод оценок
  dm.adospSelUspevForVipisca.First;
  FindRange := E.Cells.Find(What := '#Экз#');
  FindRange.Select;
  cur := E.Selection.Address;
  Range := E.ActiveSheet.Range[cur];
  while not dm.adospSelUspevForVipisca.Eof do
  begin
    str := dm.adospSelUspevForVipiscacName_disc.AsString;
    Range.Value := str;

    cur1 := E.Selection.Address;
    cur1 := GetNextCellHor(cur1);
    Range := E.ActiveSheet.Range[cur1];
    Range.Select;
    str := dm.adospSelUspevForVipiscaHourCount.AsString;
    Range.Value := str;

    cur1 := GetNextCellHor(cur1);
    Range := E.ActiveSheet.Range[cur1];
    Range.Select;
    str := dm.adospSelUspevForVipiscacOsenca.AsString;
    Range.Value := str;

    dm.adospSelUspevForVipisca.Next;
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
  dm.adospSelKPForVipisca.First;
  FindRange := E.Cells.Find(What := '#КП#');
  FindRange.Select;
  cur := E.Selection.Address;
  Range := E.ActiveSheet.Range[cur];
  while not dm.adospSelKPForVipisca.Eof do
  begin
    str := dm.adospSelKPForVipiscacTema.AsString;
    if str = '' then str := 'тема не указана';
    str :=  str+', '+ dm.adospSelKPForVipiscacOsenca.AsString;
    Range.Value := str;
    dm.adospSelKPForVipisca.Next;
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

function TfrmDiplomOKadr.DoApply: boolean;
begin
// запись информации о дипломе
  dm.adospAppendDiplom.Active := false;
  SendToExcel;

  Result := true;
end;

function TfrmDiplomOKadr.DoCancel: boolean;
begin
  Result := true;
end;

procedure TfrmDiplomOKadr.FormShow(Sender: TObject);
begin
  inherited;
  dteZashita.Value:= date();
  
end;

procedure TfrmDiplomOKadr.FormCreate(Sender: TObject);
begin
  inherited;
{  dmStudentData.adotblPredpr.Active := false;
  dmStudentData.adotblPredpr.Active := true;
  dm.adotbltypeTema.Active := false;
  dm.adotbltypeTema.Active := true;     }
end;

procedure TfrmDiplomOKadr.edtVipNumderChange(Sender: TObject);
begin
  inherited;
  CheckRequired;
end;

procedure TfrmDiplomOKadr.CheckRequired;
begin
  IsModified := true;
end;

end.
