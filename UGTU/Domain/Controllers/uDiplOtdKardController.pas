unit uDiplOtdKardController;
  {#Author tanyav@ist.ugtu.net}
interface
uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, ADODB, DB, uDM,
  Forms, Dialogs, DBLookupEh, Variants, StdCtrls, GeneralController, Grids,
  ExcelXP, ComObj, DBGrids, DBGridEh,WordXP, DateUtils, uDMOtdKadrDiplom, ApplicationController
  , ExceptionBase, ConstantRepository;
type
  PDBGrid = ^TDBGridEh;
  TDiplOtdKardController = class (TObject)
  private
    function OpenOKADRGetGakMemberForExcel(year: Integer; ik_spec_fac, ik_fac: Integer):TADOStoredProc;
    procedure FillTheDiplom(E:OleVariant; count:integer; tempStoredProc:TADOStoredProc; SourceDataSet: PDataSet);
  protected
    constructor CreateInstance;
 //AccessInstance ������������� ������ � ���������� �����������
    class function AccessInstance(Request: Integer):
       TDiplOtdKardController;

  public

    constructor Create;
  //Instance - ���������� �������� ������� �����������
    class function Instance: TDiplOtdKardController;
  //ReleaseInstance - ���������� ����������
    class procedure ReleaseInstance;

  //*********��� ����������*********
  //********������**********
  //GetFacList ��������� ������ �����������
  function GetFacList(cmp: PDBLookupComboboxEh): boolean;
  //GetSpecList ��������� ������ c�������������
  function GetSpecList(cmp: PDBLookupComboboxEh): boolean;
  //GetGroupList ��������� ������ �����
  function GetGroupList(cmp: PDBLookupComboboxEh): boolean;

  //�������
  //FilterSpecList ��������� ������ ��������������
  function FilterSpecList(cmp: PDBLookupComboboxEh; ik_fac:Variant): boolean;
  //FilterGroupList ��������� ������ ����� �� �������������
  function FilterGroupList(cmp: PDBLookupComboboxEh; ik_Gener_spec_fac:Variant): boolean;
  //��������� ������ �������������� ����
  function FilterGAKList(SourceDataSet: PDataSet; ik_fac:Variant; DisplayType: integer): boolean;

  //GetDiplomList ��������� ������ ��������� ������
  function GetDiplomList(SourceDataSet: PDataSet; ik_grup:Variant): boolean;

  //SaveDiploms ��������� �������
  procedure SaveDiploms(SourceDataSet: PDataSet);
  //CancelDiplomUpdates �������� ��������� ��������
  procedure CancelDiplomUpdates(SourceDataSet: PDataSet);

  //SetSizes ��������� ��������
  procedure SetSizes(sh1, sh2:Variant);
  //PrintAllDiploms �������� �������
  function PrintAllDiploms(SourceDataSet: PDataSet; ik_spec_fac, ik_fac,year:integer; OldBlank: boolean):integer;
  //����� ������ str1 �� 2, ���� ��� ���������� (����. ����� ������ MaxStrLength)
  procedure ParseString(var str1,str2: string; MaxStrLength: integer);


  //*************������������ ���****************
  //GetYearList ��������� ������ �����
  function GetYearList(cmp: PDBLookupComboboxEh): boolean;
  //GetSpecGakList ��������� ������ �������������� (��� ���� ���������)
  function GetSpecGakList: boolean;
  //GetGakMemberList ��������� ������ �������������
  function GetGakMemberList(SourceDataSet: PDataSet; ik_year:Variant; DisplayType: integer): boolean;
  //SaveGAK ��������� ���
  procedure SaveGAK(SourceDataSet: PDataSet);
  //CancelUpdatesGAK �������� ���������� ���
  procedure CancelUpdatesGAK(SourceDataSet: PDataSet);


  //************������������***************
  //GetQualifications �������� ������������
  procedure GetQualifications(SourceDataSet: PDataSet);
  //SaveQualif ��������� ������������
  procedure SaveQualif(SourceDataSet: PDataSet);
  //CancelUpdatesQualif �������� ���������� ������������
  procedure CancelUpdatesQualif(SourceDataSet: PDataSet);

end;


implementation

var
//FAbitRaspisanieControllerInstance - ��������� �����������
  FTDiplOtdKardControllerInstance: TDiplOtdKardController = nil;
constructor TDiplOtdKardController.CreateInstance;
begin
  inherited Create;
end;


constructor TDiplOtdKardController.Create;
begin
  inherited Create;
  raise Exception.CreateFmt('������ � ������ %s ����� �������� ������ ����� ���� Instance!', [ClassName]);
end;


class function TDiplOtdKardController.AccessInstance(
  Request: Integer): TDiplOtdKardController;
begin
  case Request of
    0 : ;
    1 : if not Assigned(FTDiplOtdKardControllerInstance) then
      FTDiplOtdKardControllerInstance:= CreateInstance;
    2 : if FTDiplOtdKardControllerInstance <> nil then
          begin
            FTDiplOtdKardControllerInstance.Free;
            FTDiplOtdKardControllerInstance:= nil;
          end;
    else raise EApplicationException.Create('������ � ���������!',Exception.CreateFmt('����������� �������� ��������� %d � ������ AccessInstance ����������� TAbitOtchetsController', [Request]));
  end;  Result := FTDiplOtdKardControllerInstance;
end;


class function TDiplOtdKardController.Instance: TDiplOtdKardController;
begin
  Result := AccessInstance(1);
end;

class procedure TDiplOtdKardController.ReleaseInstance;
begin
   AccessInstance(2);
end;

//*********��� ����������*********
//********������**********
//��������� ������ �����������
function TDiplOtdKardController.GetFacList(cmp: PDBLookupComboboxEh): boolean;
begin
  Result:= false;
  TGeneralController.Instance.InitializeLockupCB(cmp, 'ik_fac', 'Cname_fac');
  TGeneralController.Instance.getDataSetValues(@cmp.ListSource.DataSet, 'EXEC [dbo].[OKADRGetFacs]', 'ik_fac', false, NULL);
  Result:= true;
end;

//��������� ������ c�������������
function TDiplOtdKardController.GetSpecList(cmp: PDBLookupComboboxEh): boolean;
begin
  Result:= false;
  TGeneralController.Instance.InitializeLockupCB(cmp, 'ik_Gener_spec_fac', 'Cname_spec');
  TGeneralController.Instance.getDataSetValues(@cmp.ListSource.DataSet, 'EXEC [dbo].[OKADRGetSpecialities] ', 'ik_Gener_spec_fac', false, NULL);
  Result:= true;
end;

//��������� ������ �����
function TDiplOtdKardController.GetGroupList(cmp: PDBLookupComboboxEh): boolean;
begin
  Result:= false;
  TGeneralController.Instance.InitializeLockupCB(cmp, 'Ik_grup', 'Cname_grup');
  TGeneralController.Instance.getDataSetValues(@cmp.ListSource.DataSet, 'select * from [dbo].[OKADRGetExitGroup_inline]('+IntToStr(YearOf(Today))+')', 'Ik_grup', false, NULL);
  Result:= true;
end;


//�������
//��������� ������ ��������������
function TDiplOtdKardController.FilterSpecList(cmp: PDBLookupComboboxEh; ik_fac:Variant): boolean;
begin
  Result:= false;
  if ik_fac<1 then
  begin
    cmp.Value:= null;
    cmp.Enabled:= false;
  end;
  with cmp.ListSource.DataSet do
  begin
    Filtered:= false;
    Filter:= 'ik_fac='+IntToStr(Ik_fac);
    Filtered:= true;
  end;
  Result:= true;
end;

//��������� ������ �������������� ����
function TDiplOtdKardController.FilterGAKList(SourceDataSet: PDataSet; ik_fac:Variant; DisplayType: integer): boolean;
begin
  Result:= false;
  SourceDataSet.Filtered:= false;
  if ik_fac>1 then
  begin
    if (DisplayType<0) then
        SourceDataSet.Filter:= '(ik_fac='+IntToStr(Ik_fac)+')'
    else
        SourceDataSet.Filter:= '(ik_fac='+IntToStr(Ik_fac)+') and (id_type_branch='+IntToStr(DisplayType+1)+')';
    SourceDataSet.Filtered:= true;
  end;
  Result:= true;
end;

//����� �������
procedure TDiplOtdKardController.FillTheDiplom(E:OleVariant; count:integer; tempStoredProc:TADOStoredProc; SourceDataSet: PDataSet);
const strLength = 40;
var
  str, str2:string;
  iday:integer;
  imonth:integer;
  iyear:integer;
  smonth:string;
  FindRange:OleVariant;
  fam: string;
  RangeRightBorder: string;
  RangeBottomBorder: integer;

begin
  TApplicationController.GetInstance.AddLogEntry('������. ������� ������� �������� '+SourceDataSet.FieldByName('Clastname').AsString);
  case tempStoredProc.FieldByName('Ik_fac').AsInteger  of
  23:
  begin
    RangeRightBorder:= 'JB';
    RangeBottomBorder:= 156;
  end;
  22:
  begin
    RangeRightBorder:= 'T';
    RangeBottomBorder:= 27;
  end;
  else
  begin
    RangeRightBorder:= 'CE';
    RangeBottomBorder:= 50;
  end;
  end;
  E.sheets.Add(after:=E.sheets.item[count-1]);

  E.Sheets[1].Range['A1:'+RangeRightBorder+inttoStr(RangeBottomBorder)].EntireColumn.Copy(EmptyParam); // �������� � ��
  E.Sheets[count].Paste(E.Sheets.item[count].Range['A1:'+RangeRightBorder+inttoStr(RangeBottomBorder), EmptyParam], EmptyParam);
  E.Sheets[1].Range['A1:'+RangeRightBorder+inttoStr(RangeBottomBorder)].EntireRow.Copy(EmptyParam); // �������� � ��
  E.Sheets[count].Paste(E.Sheets.item[count].Range['A1:'+RangeRightBorder+inttoStr(RangeBottomBorder), EmptyParam], EmptyParam);

  E.Sheets[count].PageSetup.LeftMargin:=E.Sheets[1].PageSetup.LeftMargin;
  E.Sheets[count].PageSetup.RightMargin:=E.Sheets[1].PageSetup.RightMargin;
  E.Sheets[count].PageSetup.TopMargin:=E.Sheets[1].PageSetup.TopMargin;
  E.Sheets[count].PageSetup.BottomMargin:=E.Sheets[1].PageSetup.BottomMargin;
  E.Sheets[count].PageSetup.Orientation:=E.Sheets[1].PageSetup.Orientation;

  E.Sheets.item[1].Range['A1:'+RangeRightBorder+inttoStr(RangeBottomBorder)].Copy;
     //E.Sheets.item[count].Range['A1:CE'+inttoStr(50)].Insert;
  if (tempStoredProc.FieldByName('Ik_fac').AsInteger = 23) then
  begin
    E.Sheets[count].Range['A1:'+RangeRightBorder+inttoStr(RangeBottomBorder)].ColumnWidth:=
      E.Sheets[1].Range['A1:A2'].ColumnWidth;
    E.Sheets[count].Range['A1:'+RangeRightBorder+inttoStr(RangeBottomBorder)].RowHeight:=
      E.Sheets[1].Range['A1:B1'].RowHeight;
  end;


  {if (tempStoredProc.FieldByName('Ik_fac').AsInteger = 18) then
  begin
    FindRange := E.Cells.Replace(What := '#surname#',Replacement:=(SourceDataSet.FieldByName('iClastname').AsString));
    FindRange := E.Cells.Replace(What := '#name#',Replacement:=(SourceDataSet.FieldByName('iFirstName').AsString));
    FindRange := E.Cells.Replace(What := '#Patronymic#',Replacement:=(SourceDataSet.FieldByName('iPatronymic').AsString));
    FindRange := E.Cells.Replace(What := '#specname#',Replacement:=tempStoredProc.FieldByName('Cname_spec').AsString);
    FindRange := E.Cells.Replace(What := '#shifr#',Replacement:=tempStoredProc.FieldByName('Sh_spec').AsString);

    //��� ������ �������� ��������� ����, ��� ������� �������� � ������ ��� � �������
    str:=SourceDataSet.FieldByName('RegNumber').AsString   ;
    E.Sheets[count].Range['t34'].Value:=str;
    //FindRange := E.Cells.Replace(What := '#regNum#',Replacement:=str);

    str:=SourceDataSet.FieldByName('Dd_dipl').AsString;
    iday:=DayOf(StrToDate(str));
    imonth:=MonthOf(StrToDate(str));
    iyear:=YearOf(StrToDate(str));

    smonth := TGeneralController.Instance.GetMonthName(imonth);

    str:=Inttostr(iDay)+ ' ' +smonth+ ' ' + inttostr(iyear);

    FindRange := E.Cells.Replace(What := '#date#',Replacement:=str);
  end
  else}
  //begin
  if ((tempStoredProc.FieldByName('Ik_fac').AsInteger = 23) or
      (tempStoredProc.FieldByName('Ik_fac').AsInteger = 22) or
      (tempStoredProc.FieldByName('Ik_fac').AsInteger = 21)) then
  begin
    FindRange := E.Cells.Replace(What := '#surname#',Replacement:=(SourceDataSet.FieldByName('Clastname').AsString));
    FindRange := E.Cells.Replace(What := '#name#',Replacement:=(SourceDataSet.FieldByName('FirstName').AsString));
    FindRange := E.Cells.Replace(What := '#Patronymic#',Replacement:=(SourceDataSet.FieldByName('Patronymic').AsString));
    str:=SourceDataSet.FieldByName('RegNumber').AsString;
    if (tempStoredProc.FieldByName('Ik_fac').AsInteger = 22) or
      (tempStoredProc.FieldByName('Ik_fac').AsInteger = 21) then
    begin
      FindRange := E.Cells.Replace(What := '#specname#',Replacement:=tempStoredProc.FieldByName('Cname_spec').AsString);
      E.Sheets[count].Range['h18'].Value:=str;
    end
    else
      E.Sheets[count].Range['AZ135'].Value:=str;
    //FindRange := E.Cells.Replace(What := '#regNum#',Replacement:=str);


    str:=SourceDataSet.FieldByName('Dd_dipl').AsString;
    iday:=DayOf(StrToDate(str));
    imonth:=MonthOf(StrToDate(str));
    iyear:=YearOf(StrToDate(str));

    smonth := GetMonthR(imonth);

    str:=Inttostr(iDay)+ ' ' +smonth+ ' ' + inttostr(iyear);

    FindRange := E.Cells.Replace(What := '#date#',Replacement:=str);

  end
  else
  begin
    FindRange := E.Cells.Replace(What := '#specname#',Replacement:=tempStoredProc.FieldByName('Cname_spec').AsString);
    FindRange := E.Cells.Replace(What := '#surname#',Replacement:=Ansiuppercase(SourceDataSet.FieldByName('iClastname').AsString));
    FindRange := E.Cells.Replace(What := '#name#',Replacement:=Ansiuppercase(SourceDataSet.FieldByName('iFirstName').AsString));
    FindRange := E.Cells.Replace(What := '#Patronymic#',Replacement:=Ansiuppercase(SourceDataSet.FieldByName('iPatronymic').AsString));
    //��� ������ �������� ��������� ����, ��� ������� �������� � ������ ��� � �������
    str:=SourceDataSet.FieldByName('RegNumber').AsString   ;
    //FindRange := E.Cells.Replace(What := '#regNum#',Replacement:=str);
    E.Sheets[count].Range['t40'].Value:=str;
    FindRange := E.Cells.Replace(What := '#shifr#',Replacement:=tempStoredProc.FieldByName('Sh_spec').AsString);
    E.Sheets[count].Range['AZ35'].Value:=SourceDataSet.FieldByName('VipNumber').AsString;
    //E.Sheets[count].Range['t48'].Value:=str;

    str:=SourceDataSet.FieldByName('Dd_dipl').AsString;
    imonth:=MonthOf(StrToDate(str));
    smonth := GetMonthR(imonth);
    FindRange := E.Cells.Replace(What := '#�����#',Replacement:=smonth);

    iyear:=YearOf(StrToDate(str));
    FindRange := E.Cells.Replace(What := '#���#',Replacement:=IntToStr(iyear));//Copy(IntToStr(iyear),3,2));

    iday:=DayOf(StrToDate(str));
    str:=Inttostr(iDay);
    if (iday < 10) then
      str:= '0'+str;
    E.Sheets[count].Range['BG35'].Value:=str;


  end;
  //end;

  //�������� ��� �������������
  fam:=E.Sheets[count-1].name;
  if fam=SourceDataSet.FieldByName('Clastname').AsString then
    E.Sheets[count].name:=SourceDataSet.FieldByName('Clastname').AsString+'_'
  else
    E.Sheets[count].name:=SourceDataSet.FieldByName('Clastname').AsString;
  E.Sheets[count].Select;

  //������� ������
  str:= GetFullDate(tempStoredProc.FieldByName('DateDiplomDelivery').AsDateTime) +' ����';
  FindRange := E.Cells.Replace(What := '#DateDelivery#',Replacement:=str);
  FindRange := E.Cells.Replace(What := '#fiogak#',Replacement:=tempStoredProc.FieldByName('GakMemberName').AsString);
  FindRange := E.Cells.Replace(What := '#Category#',Replacement:=tempStoredProc.FieldByName('Spec�ategory').AsString);
  FindRange := E.Cells.Replace(What := '#qualifShort#',Replacement:=tempStoredProc.FieldByName('QualifShortName').AsString);
  str:= tempStoredProc.FieldByName('Cname_qualif').AsString;
  ParseString(str, str2, strLength);
  FindRange := E.Cells.Replace(What := '#qualif#',Replacement:=str);
  FindRange := E.Cells.Replace(What := '#qualifPart2#',Replacement:=str2);
  FindRange := E.Cells.Replace(What := '#spec#',Replacement:='');
  {if tempStoredProc.FieldByName('ik_direction').AsInteger=2 then
  begin
     FindRange := E.Cells.Replace(What := '#spec#',Replacement:='�� �������������');
     if (str2<> '') then
       E.Sheets[1].Range['AW37:AW37'].Font.Size:=10.5;
  end
  else
     FindRange := E.Cells.Replace(What := '#spec#',Replacement:='�� �����������');    }
end;

function TDiplOtdKardController.FilterGroupList(cmp: PDBLookupComboboxEh; ik_Gener_spec_fac:Variant): boolean;
begin
  Result:= false;
  if ik_Gener_spec_fac<1 then
  begin
    cmp.Value:= null;
    cmp.Enabled:= false;
  end;
  with cmp.ListSource.DataSet do
  begin
    Filtered:= false;
    Filter:= '(ik_Gener_spec_fac='+IntToStr(ik_Gener_spec_fac)+')';
    Filtered:= true;
  end;
  Result:= true;
end;


//��������� ������ ��������� ������
function TDiplOtdKardController.GetDiplomList(SourceDataSet: PDataSet; ik_grup:Variant): boolean;
begin
  Result:= false;
  TApplicationController.GetInstance.AddLogEntry('������. �������� ������ ��������');
  TGeneralController.Instance.getDataSetValues(SourceDataSet, 'exec OKADRGetStudForDiplom @ik_grup='+IntToStr(ik_grup), 'Ik_zach', false, NULL);
  Result:= true;
end;


//��������� �������
procedure TDiplOtdKardController.SaveDiploms(SourceDataSet: PDataSet);
begin
  TApplicationController.GetInstance.AddLogEntry('������. C��������� ������ ��������');
  try
    SourceDataSet^.UpdateBatch();
  except
    on E:Exception do
      raise EApplicationException.Create('��������� ������ ��� ����������! ��������� ������������ ��������� ������ - ��������������� ����� ������� ������ �������� �� ����� ��� �� 3 ����.',E);
  end;
  SourceDataSet^.Close;
  SourceDataSet^.Open;

end;

//�������� ��������� ��������
procedure TDiplOtdKardController.CancelDiplomUpdates(SourceDataSet: PDataSet);
begin
  TApplicationController.GetInstance.AddLogEntry('������. ������ �������� ��� ������� ��������');
  SourceDataSet^.CancelBatch;
end;

//��������� ��������
procedure TDiplOtdKardController.SetSizes(sh1, sh2:Variant);
var i:integer;
begin
  for i:=1 to 50 do
    sh2.Range['A'+IntToStr(i)+':B'+IntToStr(i)].RowHeight:=
      sh1.Range['A'+IntToStr(i)+':B'+IntToStr(i)].RowHeight;
    //ShowMessage(IntToStr(sh1.Range['A1:A2'].ColumnWidth));
   sh2.Range['A1:A9'].ColumnWidth:=8;
  for I :=65 to 85 do
    sh2.Range[chr(i)+'1:'+chr(i)+'2'].ColumnWidth:=
      sh1.Range[chr(i)+'1:'+chr(i)+'2'].ColumnWidth;

end;

procedure TDiplOtdKardController.ParseString(var str1, str2: string; MaxStrLength: integer);
var i: integer;
begin
  while Length(str1)>MaxStrLength do
  begin
    for i:= MaxStrLength downto 1 do
      if str1[i]=' ' then
      begin
        str2 := Copy(str1, i+1, Length(str1));
        Delete(str1, i+1, Length(str1));
        break;
      end;
  end;
end;

function TDiplOtdKardController.PrintAllDiploms(SourceDataSet: PDataSet; ik_spec_fac, ik_fac, year:integer; OldBlank: boolean):integer;
var
  E, sheet: Variant;
  first, count :integer;
  tempStoredProc:TADOStoredProc;
  path:string;
  HasAllData: boolean;  //���� ����������, ���� �� ���� ���� ����������� ������
begin
  Result:=0;
  TApplicationController.GetInstance.AddLogEntry('������. ������� �������� ');
  tempStoredProc:=OpenOKADRGetGakMemberForExcel(year, ik_spec_fac, ik_fac);
  try
    E:= CreateOleObject('Excel.Application');
    try
      if (tempStoredProc.FieldByName('DiplExcPatternName').AsString <> '') then
        path := ExtractFilePath(Application.ExeName)+'reports\'+tempStoredProc.FieldByName('DiplExcPatternName').AsString
      else
        if (OldBlank) then
          path := ExtractFilePath(Application.ExeName)+'reports\DiplomOld.XLT'
        else
	        path := ExtractFilePath(Application.ExeName)+'reports\Diplom.XLT';
	    E.WorkBooks.Add(path);
      E.DisplayAlerts:=false;
      E.Sheets[1].Select;

      HasAllData:= false;
      SourceDataSet^.DisableControls;
      try
        SourceDataSet.First;
        first:= 2;
        count:= first;
        while not SourceDataSet.Eof do
        begin
          if (SourceDataSet.FieldByName('RegNumber').AsString='') or
             (SourceDataSet.FieldByName('Dd_dipl').Value=null) then
          begin
            SourceDataSet.Next;
            continue;
          end;

          try
            HasAllData:= true;
            FillTheDiplom(E, count, tempStoredProc, SourceDataSet);
          except
            on Ex:Exception do begin
            E.Quit;
            raise EApplicationException.Create('������ ��� �������� � Excel',Ex);
            end;
          end;

          SourceDataSet.Next;
          inc(count);
        end;

        if count>first then
        begin
          E.Sheets.item[1].Delete;
          E.Visible := true;
          result:= 1;
        end
        else
        begin

          E.Quit;
          raise EApplicationException.Create('��� ��������� ��� ������ �������. ���������, ����� ���� ������� ��������������� ������ � ���� ������ ��������.');
        end;
      finally
        SourceDataSet^.EnableControls;
        E:= UnAssigned;
      end;
    except
      result:= -1;
    end;
    finally
      tempStoredProc.Free;
    end;
    if (not HasAllData) then
      Application.MessageBox('��� ��������� ��� ������ �������. ���������, ����� ���� ������� ��������������� ������ � ���� ������ ��������!', '���������� "������"', MB_ICONWARNING);
end;


//*************������������ ���****************
//��������� ������ �����
function TDiplOtdKardController.GetYearList(cmp: PDBLookupComboboxEh): boolean;
begin
  Result:= false;
  TApplicationController.GetInstance.AddLogEntry('������. �������� ����� ����� ��������.');
  TGeneralController.Instance.InitializeLockupCB(cmp, 'ik_year', 'year_value');
  TGeneralController.Instance.getDataSetValues(@cmp.ListSource.DataSet, 'exec OKADRGetYears', 'ik_year', false, NULL);
  cmp.ListSource.DataSet.Locate('year_value',YearOf(date),[]);
  cmp.Value:=
          cmp.ListSource.DataSet.FieldByName('ik_year').AsInteger;
  Result:= true;
end;

//��������� ������ �������������� (��� ���� ���������)
function TDiplOtdKardController.GetSpecGakList: boolean;
begin
  TApplicationController.GetInstance.AddLogEntry('������. �������� ������ �������������� ��� ������������� ���');
  Result:= false;
  DMOtdKadrDiplom.adoqSpec.Close;
  DMOtdKadrDiplom.adoqSpec.SQL[0]:='SELECT * from [dbo].[OKADRGetEducBranch]('+IntToStr(YearOf(today))+')';
  DMOtdKadrDiplom.adoqSpec.Open;
  Result:= true;
end;


//��������� ������ �������������
function TDiplOtdKardController.GetGakMemberList(SourceDataSet: PDataSet; ik_year:Variant; DisplayType: integer): boolean;
begin
  Result:= false;
  TApplicationController.GetInstance.AddLogEntry('������ ������������� ���. �������� ������ �������������.');
  with  DMOtdKadrDiplom.adospGakMember do
  begin
    Close;
    ProcedureName:= 'OKADRGetGakMembers;1';
    Parameters.Clear;
    //Parameters.CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 4, NULL);
    Parameters.CreateParameter('@ik_year', ftInteger, pdInput, 4, ik_year);
    Parameters.CreateParameter('@id_type_branch', ftInteger, pdInput, 4, DisplayType+1);
    Open;
  end;
  Result:= true;
end;

//��������� ���
procedure TDiplOtdKardController.SaveGAK(SourceDataSet: PDataSet);
begin
  TApplicationController.GetInstance.AddLogEntry('������. C��������� ������ ������������� ���');
  SourceDataSet.UpdateBatch();
  SourceDataSet.Close;
  SourceDataSet.Open;
end;

//�������� ���������� ���
procedure TDiplOtdKardController.CancelUpdatesGAK(SourceDataSet: PDataSet);
begin
  TApplicationController.GetInstance.AddLogEntry('������. ������ ��������� � ������ ������������� ���');
  SourceDataSet.CancelBatch;
  SourceDataSet.Close;
  SourceDataSet.Open;
end;

function TDiplOtdKardController.OpenOKADRGetGakMemberForExcel(year: Integer; ik_spec_fac, ik_fac: Integer):TADOStoredProc;
begin
  Result := TADOStoredProc.Create(nil);
  Result.Connection := dm.DBConnect;
  Result.ProcedureName := 'OKADRGetGakMemberForExcel;1';
  Result.Parameters.CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 4, NULL);
  Result.Parameters.CreateParameter('@ik_spec_fac', ftInteger, pdInput, 4, ik_spec_fac);
  Result.Parameters.CreateParameter('@year', ftInteger, pdInput, 4, year);
  Result.Parameters.CreateParameter('@ik_fac', ftInteger, pdInput, 4, ik_fac);
  Result.Open;
end;


//************������������***************
//�������� ������������
procedure TDiplOtdKardController.GetQualifications(SourceDataSet: PDataSet);
begin
  TApplicationController.GetInstance.AddLogEntry('������. �������� ������ ������������');
  SourceDataSet.Close;
  SourceDataSet.Open;
end;

//��������� ������������
procedure TDiplOtdKardController.SaveQualif(SourceDataSet: PDataSet);
begin
  TApplicationController.GetInstance.AddLogEntry('������. C��������� ������ ������������');
  SourceDataSet.UpdateBatch();
  SourceDataSet.Close;
  SourceDataSet.Open;

end;

//�������� ���������� ������������
procedure TDiplOtdKardController.CancelUpdatesQualif(SourceDataSet: PDataSet);
begin
  TApplicationController.GetInstance.AddLogEntry('������. ������ ��������� � ������ ������������');
  SourceDataSet.CancelBatch;
  SourceDataSet.Close;
  SourceDataSet.Open;
end;

end.
