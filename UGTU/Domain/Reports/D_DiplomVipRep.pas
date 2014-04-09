{*
    ����� - ����� ������� � ������� �������� � Excel
    ������: 1.0.0.1
    �������: 02.04.2009
    ��������� ������: 
    �����: ������� �.�.
*}
unit D_DiplomVipRep;
  {#Author tanyav@ist.ugtu.net}

interface
uses
  Classes, SysUtils, ExcelXP, Barcode, Contnrs, ReportsBase, DB, ADODB, uDMDiplom,
    Variants, GeneralController, ApplicationController, ExceptionBase, uDiplOtdKardController;

type
   TDiplomVipExcelReport = class(TExcelReportBase)
  const MainpageNumber = 1;
  const strLength = 80;

  private
    FikZach: integer;
    FikGroup: integer;
    FStudName: string;
    Fik_direction: integer;
    FNameInDatPadez: boolean;
    Fik_fac: integer;
    function GetNextCellVert(cur: String): String;
    function GetPrevCellVert(cur: String): String;
    function GetNextCellHor(cur: String): String;
    function LastPos(subStr, str: string): integer;
    function StringFormat(var str: string; strMaxLen:integer): string;
    procedure SelectNextCellVert(var cur: String; var ActRange: Variant);
    procedure SelectNextCellHor(var cur: String; var ActRange: Variant);
    procedure SendToExcel;
    procedure SendStringToExcel(var str, cur: string; ActRange: Variant; StrMaxLength: integer = 0);
    procedure LoadData;

  protected
    procedure Execute;override;
  public
    property ikZach:integer read FikZach write FikZach;
    property ikGroup:integer read FikGroup write FikGroup;
    property StudName:string read FStudName write FStudName;
    property ik_direction:integer read Fik_direction write Fik_direction;
    property ik_fac:integer read Fik_fac write Fik_fac;
    property NameInDatPadez:boolean read FNameInDatPadez write FNameInDatPadez;
  end;

implementation

function TDiplomVipExcelReport.LastPos(subStr, str: string): integer;
var poss: integer;
begin
  poss:= Pos(subStr, str);
  result:= poss;
  while (poss>0) do
  begin
    str:= Copy(str,poss+1,Length(str)-(poss+1));
    poss:= Pos(subStr, str);
    result:= result+poss;
  end;
end;

procedure TDiplomVipExcelReport.LoadData;
begin
  dmDiplom.adospGetVipiscaForDiplom.Close;
  with dmDiplom.adospGetVipiscaForDiplom.Parameters do
  begin
    Clear;
    CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 4, NULL);
    CreateParameter('@ik_zach', ftInteger, pdInput, 4, FikZach);
    CreateParameter('@ik_CurGroup', ftInteger, pdInput, 4, FikGroup);
  end;
  dmDiplom.adospGetVipiscaForDiplom.Open;

  {if dmDiplom.adospGetVipiscaForDiplom.IsEmpty then
  begin
    raise EApplicationException.Create('� �������� '+FStudName+' ��� ������ �� �������.');
  end; }

  dmDiplom.adospSelUspevForVipisca.Close;
  with dmDiplom.adospSelUspevForVipisca.Parameters do
  begin
    Clear;
    CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 4, NULL);
    CreateParameter('@ik_zach', ftInteger, pdInput, 4, FikZach);
    CreateParameter('@ik_CurGroup', ftInteger, pdInput, 4, FikGroup);
  end;
  dmDiplom.adospSelUspevForVipisca.Open;

  dmDiplom.adospSelKPForVipisca.Close;
  with dmDiplom.adospSelKPForVipisca.Parameters do
  begin
    Clear;
    CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 4, NULL);
    CreateParameter('@ik_zach', ftInteger, pdInput, 4, FikZach);
    CreateParameter('@iK_vid_zanyat', ftInteger, pdInput, 4, 8);
    CreateParameter('@ik_CurGroup', ftInteger, pdInput, 4, FikGroup);
  end;
  dmDiplom.adospSelKPForVipisca.Open;

  dmDiplom.adospSelKRForVipisca.Close;
  with dmDiplom.adospSelKRForVipisca.Parameters do
  begin
    Clear;
    CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 4, NULL);
    CreateParameter('@ik_zach', ftInteger, pdInput, 4, FikZach);
    CreateParameter('@iK_vid_zanyat', ftInteger, pdInput, 4, 9);
    CreateParameter('@ik_CurGroup', ftInteger, pdInput, 4, FikGroup);
  end;
  dmDiplom.adospSelKRForVipisca.Open;

  dmDiplom.adospSelPractForVipisca.Close;
  with dmDiplom.adospSelPractForVipisca.Parameters do
  begin
    Clear;
    CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 4, NULL);
    CreateParameter('@ik_zach', ftInteger, pdInput, 4, FikZach);
    CreateParameter('@ik_CurGroup', ftInteger, pdInput, 4, FikGroup);
  end;
  dmDiplom.adospSelPractForVipisca.Open;

  dmDiplom.adospSelGOSForVipisca.Close;
  with dmDiplom.adospSelGOSForVipisca.Parameters do
  begin
    Clear;
    CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 4, NULL);
    CreateParameter('@ik_zach', ftInteger, pdInput, 4, FikZach);
    CreateParameter('@ik_CurGroup', ftInteger, pdInput, 4, FikGroup);
  end;
  dmDiplom.adospSelGOSForVipisca.Open;

end;

function TDiplomVipExcelReport.GetNextCellVert(cur: String): String;
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



function TDiplomVipExcelReport.GetPrevCellVert(cur: String): String;
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

function TDiplomVipExcelReport.GetNextCellHor(cur: String): String;
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



procedure TDiplomVipExcelReport.SelectNextCellHor(var cur: String;
  var ActRange: Variant);
begin
  cur := GetNextCellHor(cur);
  ActRange := Range[cur,cur];
  ActRange.Select;
end;

procedure TDiplomVipExcelReport.SelectNextCellVert(var cur: String; var ActRange: Variant);
begin
  cur := GetNextCellVert(cur);
  ActRange := Range[cur,cur];
  ActRange.Select;
end;

procedure TDiplomVipExcelReport.SendStringToExcel(var str, cur: string; ActRange: Variant; StrMaxLength: integer = 0);
var i: integer;
  str1: string;
begin
  if (StrMaxLength = 0) then
    StrMaxLength:= strLength;
  while Length(str)>StrMaxLength do
  begin
    for i:= StrMaxLength downto 1 do
      if str[i]=' ' then
      begin
        str1 := Copy(str, 1, i);
        Delete(str, 1, i);
        ActRange.Value := str1;
        SelectNextCellVert(cur, ActRange);
        break;
      end;
  end;
  ActRange.Value := str;
end;

procedure TDiplomVipExcelReport.SendToExcel;
const maxDiscStr = 77;
  MaxKRCount = 6;
  MaxPractCount = 8;
var
  FindRange: Variant;
  ActRange: Variant;
  str, str1: String;   // ������, ������� ����� ��������� � ������ ����� � �������
  cur, cur1: String;
  i: Integer;
begin
  //Name:= dmDiplom.adospGetVipiscaForDiplomStudName.AsString;
  ActivateWorksheet(MainpageNumber);
  // ����� ����� ��������
  if (NameInDatPadez) then
  begin
    Replace('#�������#', dmDiplom.adospGetVipiscaForDiplomClastname.AsString);
    Replace('#���#', dmDiplom.adospGetVipiscaForDiplomFirstName.AsString);
    Replace('#��������#', dmDiplom.adospGetVipiscaForDiplomPatronymic.AsString);
    Replace('#���������#', dmDiplom.adospGetVipiscaForDiplomCplacebirth.AsString);
    Replace('#�������������#', dmDiplom.adospGetVipiscaForDiplomQualifShortName.AsString);
    Replace('#������#', dmDiplom.adospGetVipiscaForDiplomSpecategory.AsString);
    Replace('#������#', dmDiplom.adospGetVipiscaForDiplomattYear.AsString);
    Replace('#��������#', dmDiplom.adospGetVipiscaForDiplomAttSer.AsString);
    Replace('#��������#', dmDiplom.adospGetVipiscaForDiplomAttNumber.AsString);
    str1:= dmDiplom.adospGetVipiscaForDiplom.FieldByName('Cname_qualif').AsString;
    TDiplOtdKardController.Instance.ParseString(str1, str, 50);
    Replace('#������#', str1);
    Replace('#������2#', str);
  end
  else
  begin
    Replace('#�������#', dmDiplom.adospGetVipiscaForDiplomClastname.AsString);
    Replace('#���#', dmDiplom.adospGetVipiscaForDiplomFirstName.AsString);
    Replace('#��������#', dmDiplom.adospGetVipiscaForDiplomPatronymic.AsString);
    Replace('#������#', dmDiplom.adospGetVipiscaForDiplomattYear.AsString);
    Replace('#DocumName#', dmDiplom.adospGetVipiscaForDiplomdocumName.AsString);
    Replace('#shifr#', dmDiplom.adospGetVipiscaForDiplomSh_spec.AsString);
    Replace('#������#', dmDiplom.adospGetVipiscaForDiplom.FieldByName('Cname_qualif').AsString);
    {Replace('#���#', dmDiplom.adospGetVipiscaForDiplomStudName.AsString);
      }
  end;
  str:= TGeneralController.Instance.GetFullDate(dmDiplom.adospGetVipiscaForDiplomDd_birth.AsDateTime)+' ����';
  Replace('#��������#', str);   //docum
  str1:= dmDiplom.adospGetVipiscaForDiplomYearObuch.AsString;
  if (dmDiplom.adospGetVipiscaForDiplomYearObuch.AsInteger >4) then
     str1:= str1 + ' ���'
  else
     str1:= str1 + ' ����';
  i:= dmDiplom.adospGetVipiscaForDiplomMonthObuch.AsInteger;
  if ((i > 0) and (i<5)) then
    str1:= str1 +' '+ dmDiplom.adospGetVipiscaForDiplomMonthObuch.AsString+'������';
  if (i>4) then
    str1:= str1 +' '+ dmDiplom.adospGetVipiscaForDiplomMonthObuch.AsString+'�������';
  Replace('#���#', str1);


  {if dmDiplom.adospGetVipiscaForDiplomDd_VidDipl.Value>0 then
  begin
    str:= TGeneralController.Instance.GetFullDate(dmDiplom.adospGetVipiscaForDiplomDd_VidDipl.AsDateTime);
    Replace('#�������#', str);
  end; }

  if (ik_fac = 22) then
  begin
    Replace('#DocumName#', dmDiplom.adospGetVipiscaForDiplomdocumName.AsString);
    Replace('#�������������#', dmDiplom.adospGetVipiscaForDiplomCname_spec.AsString);
  end;

  //���������� ����, � ������� � ������ ������ �.�. ����
  FindRange := Find('#������#');
  FindRange.Select;
  ActRange := Selection;
  ActRange.Value2:= dmDiplom.adospGetVipiscaForDiplomRegNumber.AsString;
  FindRange := Find('#������#');
  FindRange.Select;
  ActRange := Selection;
  ActRange.Value2:= dmDiplom.adospGetVipiscaForDiplomVipNumber.AsString;
  //Replace('##', );
  // ����� ���� � ������� (�������� �������������, ����. ����� ������ 80
  // ��������)
  if (ik_direction <> 5) then
  begin

    //if (ik_direction <> 3) then
      //Replace('#���������#', dmDiplom.adospGetVipiscaForDiplom.FieldByName('typeQualif').AsString);

    if dmDiplom.adospGetVipiscaForDiplomDd_dipl.Value>0 then
    begin
      str:= TGeneralController.Instance.GetFullDate(dmDiplom.adospGetVipiscaForDiplomDd_dipl.AsDateTime);
    end
    else
      str:= '<�� �������>';
    Replace('#�������#', str);
    //Replace('#������#', dmDiplom.adospGetVipiscaForDiplomyearPostup.AsString);
    //Replace('#�������#', dmDiplom.adospGetVipiscaForDiplomYearGrad.AsString);
    //Replace('#����#', dmDiplom.adospGetVipiscaForDiplomform.AsString);
    Replace('#�������������#', dmDiplom.adospGetVipiscaForDiplomCname_spec.AsString);
    //Replace('#�������������#', dmDiplom.adospGetVipiscaForDiplomcName_spclz.AsString);
    {str := dmDiplom.adospGetVipiscaForDiplomcdiplom.AsString;
    FindRange := Find('#����#');
    FindRange.Select;
    ActRange := Selection;
    cur:= ActRange.Address; 

  SendStringToExcel(str, cur, ActRange);}
  // ����� �������� �����
  dmDiplom.adospSelKRForVipisca.First;
  FindRange := Find('#��#');
  FindRange.Select;
  ActRange := Selection;
  cur:= ActRange.Address;
  //if (dmDiplom.adospSelKRForVipisca.RecordCount=0) then

  repeat
  begin
    if (dmDiplom.adospSelKRForVipisca.Eof) then
      str:= ''
    else
    begin
      str := dmDiplom.adospSelKRForVipisca.FieldByName('cTema').AsString;
      if str = '' then str := '���� �� �������';
      str :=  str+', '+ dmDiplom.adospSelKRForVipisca.FieldByName('cOsenca').AsString;
    end;
    SendStringToExcel(str, cur, ActRange);
    dmDiplom.adospSelKRForVipisca.Next;
    SelectNextCellVert(cur, ActRange);
  end;
  until dmDiplom.adospSelKRForVipisca.Eof;
  // ����� �������� ��������, ���� �� ����
   //if (dmDiplom.adospSelKRForVipisca.RecordCount + dmDiplom.adospSelKPForVipisca.RecordCount <MaxKRCount) then
  begin
    dmDiplom.adospSelKPForVipisca.First;
    ActRange := Range[cur,cur];
    repeat
    begin
      if (dmDiplom.adospSelKPForVipisca.Eof) then
        str:= ''
      else
      begin
        str := dmDiplom.adospSelKPForVipiscacTema.AsString;
        if str = '' then str := '���� �� �������';
        str :=  str+', '+ dmDiplom.adospSelKPForVipiscacOsenca.AsString;
      end;
      SendStringToExcel(str, cur, ActRange);
      dmDiplom.adospSelKPForVipisca.Next;
      SelectNextCellVert(cur, ActRange);
    end;
    until dmDiplom.adospSelKPForVipisca.Eof;
  end;

  {
  //����� �������  #��������#
  dmDiplom.adospSelPractForVipisca.First;
  FindRange := Find('#��������#');
  FindRange.Select;
  ActRange := Selection;
  cur:= ActRange.Address;
  repeat
  begin
    if (dmDiplom.adospSelPractForVipisca.Eof) then
      str:= ''
    else
    begin
      str := dmDiplom.adospSelPractForVipisca.FieldByName('cName_disc').AsString;
      str :=  str+', '+ dmDiplom.adospSelPractForVipisca.FieldByName('weekCount').AsString;
      str :=  str +' ������, '+ dmDiplom.adospSelPractForVipisca.FieldByName('cOsenca').AsString;
    end;
    SendStringToExcel(str, cur, ActRange);
    dmDiplom.adospSelPractForVipisca.Next;
    SelectNextCellVert(cur, ActRange);
  end;
  until dmDiplom.adospSelPractForVipisca.Eof;

  //��� ������� #���#
  dmDiplom.adospSelGOSForVipisca.First;
  if (dmDiplom.adospSelPractForVipisca.RecordCount>MaxPractCount) then
    SelectNextCellVert(cur, ActRange)
  else
  begin
    FindRange := Find('#���#');
    FindRange.Select;
    ActRange := Selection;
    cur:= ActRange.Address;
  end;  
  repeat
  begin
    if (dmDiplom.adospSelGOSForVipisca.Eof) then
      str:= ''
    else
    begin
      if ((ik_direction = 3) or (ik_direction = 1)) then
        str := '����������������� �� �����������'
      else
        str := '����������������� �� �������������';
      str :=  str +', '+ dmDiplom.adospSelGOSForVipisca.FieldByName('cOsenca').AsString;
    end;
    SendStringToExcel(str, cur, ActRange);
    dmDiplom.adospSelGOSForVipisca.Next;
    SelectNextCellVert(cur, ActRange);
  end;
  until dmDiplom.adospSelGOSForVipisca.Eof;
  }

  //********** ������   �������� *******************
  ActivateWorksheet(MainpageNumber+1);
  // ����� ������
  dmDiplom.adospSelUspevForVipisca.First;
  FindRange := Find('#���#');
  FindRange.Select;
  ActRange := Selection;
  cur:= ActRange.Address;
  i:=1;
  repeat
  begin
    str:= '';
    if (not dmDiplom.adospSelUspevForVipisca.Eof) then
    begin
      if (dmDiplom.adospSelUspevForVipisca.FieldByName('iK_disc').AsInteger > 0) then
        str := intToStr(i)+'. ';
      str := str+dmDiplom.adospSelUspevForVipisca.FieldByName('cName_disc').AsString;
    end;
    str1:=StringFormat(str, maxDiscStr);   //���������� ������� ������
    ActRange.Value := str;

    cur1 := Selection.Address;
    SelectNextCellHor(cur1,ActRange);
    str := dmDiplom.adospSelUspevForVipisca.FieldByName('HourCount').AsString;
    ActRange.Value := str;

    if (ik_direction <> 5) then
    begin
      SelectNextCellHor(cur1,ActRange);
      str := FormatFloat('###.00', dmDiplom.adospSelUspevForVipisca.FieldByName('HourCount').AsFloat/36.0);


      ActRange.Value := str;
    end;

    SelectNextCellHor(cur1,ActRange);
    str := dmDiplom.adospSelUspevForVipisca.FieldByName('cOsenca').AsString;
    ActRange.Value := str;

    if (str1<>'') then
    begin
      SelectNextCellVert(cur, ActRange);
      ActRange.Value := str1;    //���������� ������� ������
    end;

    dmDiplom.adospSelUspevForVipisca.Next;
    inc(i);
    SelectNextCellVert(cur, ActRange);
  end;
  until dmDiplom.adospSelUspevForVipisca.Eof;
  cur1:= cur;
  cur1 := GetPrevCellVert(cur1);
  cur1 := GetPrevCellVert(cur1);
  ActRange := Range[cur1,cur1];
  ActRange.Borders.item[8].Weight := 2;
  cur1 := GetNextCellHor(cur1);
  ActRange := Range[cur1,cur1];
  ActRange.Borders.item[8].Weight := 2;
  // ����� �������� ��������, ���� �� ����
  {if (dmDiplom.adospSelKRForVipisca.RecordCount + dmDiplom.adospSelKPForVipisca.RecordCount >=MaxKRCount) then
  begin
    dmDiplom.adospSelKPForVipisca.First;
    ActRange := Range[cur,cur];
    repeat
    begin
      if (dmDiplom.adospSelKPForVipisca.Eof) then
        str:= ''
      else
      begin
        str := dmDiplom.adospSelKPForVipiscacTema.AsString;
        if str = '' then str := '���� �� �������';
        str :=  str+', '+ dmDiplom.adospSelKPForVipiscacOsenca.AsString;
      end;
      SendStringToExcel(str, cur, ActRange);
      dmDiplom.adospSelKPForVipisca.Next;
      SelectNextCellVert(cur, ActRange);
    end;
    until dmDiplom.adospSelKPForVipisca.Eof;
  end
  else
    ActRange := Range[cur,cur];
  ActRange.Borders.item[8].Weight := 2;
  ActRange.Value := '����� ���������';
        }
  end;
  ActRange.HorizontalAlignment := -4108;
  ActivateWorksheet(MainpageNumber);
end;


//���������� ������� ������ ����� strMaxLen (����� ��������� �� ��������)
function TDiplomVipExcelReport.StringFormat(var str: string;
  strMaxLen: integer): string;
var
  CopyPos:integer;
begin
  result:= '';
  if (Length(str)>strMaxLen) then
  begin
    if (str[strMaxLen+1]=' ') then
    begin
      CopyPos:= strMaxLen+1;
    end
    else
    begin
      CopyPos:= LastPos(' ',str);
    end;
      result:= Copy(str, CopyPos + 1, Length(str) - CopyPos);
      str:=Copy(str, 1, CopyPos);
  end;
end;

procedure TDiplomVipExcelReport.Execute;
begin
  inherited;
  //�������� ������
  LoadData;

  //����� � Excel
  SendToExcel;
  {ActiveBarcodeApplet.AppletName := 'PDF417Ctrl1';
  ActiveBarcodeApplet.BarcodeHeader := TBarcodeReportHeader.Create;
  ActiveBarcodeApplet.BarcodeHeader.MajorVersion := 1;
  ActiveBarcodeApplet.BarcodeHeader.MinorVersion := 0;
  ActiveBarcodeApplet.BarcodeHeader.ObjectType := 1;
  ActiveBarcodeApplet.BarcodeHeader.OID := Fik_ved;
  ActiveBarcodeApplet.WriteToApplet; }
  Show;
end;

end.
