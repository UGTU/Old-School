{*
    ����� - ����� ������ ������ � Excel
    ������: 1.0.0.1
    �������: 13.02.2009
    ��������� ������: 13.02.2009 15:00
    �����: ������� �.�.
*}

unit D_FacItogiRep;
   {#Author tanyav@ist.ugtu.net}
interface

uses
  Classes, SysUtils, ExcelXP, Barcode, Contnrs, ReportsBase, DB, ADODB,
  udmFacultetStatistic, ApplicationController, uDMUgtuStructure, ExceptionBase;

type
  TFacItogiExcelReport = class(TExcelReportBase)
    const FacStepCount: integer = 13;   //���-�� ����� �� ���� ���������
      GroupDiscPageNumber: integer = 1; //����� �������� � ������� �� ������� � �����������
      DiscPageNumber: integer = 2;      //����� �������� � ������� �� �����������
      GroupPageNumber: integer = 3;     //����� �������� � ������� �� �������
  private
    FikFac:integer;   //��� ����������
    FYear:integer;    //���, ������������ � ��������� ��������
    FnSem:integer;    //����� ��������
    publicYear: integer;   //���, ��������� � �����
    SemName: string;   //�������� ��������
    FacDataSet: TADODataSet;   //���� ���, �� ����� ���������� ������������
    //GroupDiscFormula: string;    //������� ��� ���������� ����� ������ �� ���� �� 1-� ��������
    DiscFormula: string;         //������� ��� ���������� ����� ������ �� ���� �� 2-� ��������
    GroupFormula: string;        //������� ��� �������e��� ����� ������ �� ���� �� 3-� ��������
    ItogiFacCount: integer;  //���-�� ������� ���������� � ����� �����������

    function GetData: boolean;
    procedure ExportGroupDiscItogi(pageNumber: integer; var rowNumber: integer);
    procedure ExportDiscItogi(pageNumber: integer; var rowNumber: integer);
    procedure ExportGroupItogi(pageNumber: integer; var rowNumber: integer);
    procedure ExportItogiForFac(var GroupDiscItogiRowNumber, DiscItogiRowNumber, GroupItogiRowNumber:integer);


  protected
    procedure FSetikFac(value: integer);
    function  FGetikFac: integer;
    procedure Execute;override;
    function GetTotalSteps: Integer; override;
    procedure Init; override;
  public
    property ikFac:integer read FGetikFac write FSetikFac;
    property Year:integer read FYear write FYear;
    property nSem:integer read FnSem write FnSem;
  end;

implementation


procedure TFacItogiExcelReport.FSetikFac(value: integer);
begin
  FikFac:= value;
end;

function  TFacItogiExcelReport.FGetikFac: integer;
begin
  result:= FikFac;
end;


function TFacItogiExcelReport.GetTotalSteps: Integer;
begin
  result:= 0;
  if DMUgtuStructure.adoqFac.Active then
    result:= FacStepCount*DMUgtuStructure.adoqFac.RecordCount;
end;

function TFacItogiExcelReport.GetData: boolean;
var i:integer;
begin
  inherited;
  result:= false;
  //������� �������� ��� ��������� (�������� ������)

    dmFacultetStatistic.adospSelKursItogi.Close;
    with dmFacultetStatistic.adospSelKursItogi.Parameters do
    begin
    i:= DMUgtuStructure.adoqFac.FieldByName('ik_fac').AsInteger;
      Clear;
      CreateParameter('@fac', ftInteger, pdInput, 4,
              i);
      CreateParameter('@sem', ftInteger, pdInput, 4, FnSem);
      CreateParameter('@year', ftInteger, pdInput, 4, FYear);
    end;
    dmFacultetStatistic.adospSelKursItogi.Open;

    //��������, ����� ������ �� ��������� ����
    if dmFacultetStatistic.adospSelKursItogi.IsEmpty then
    begin
       if FikFac>0 then
         raise EApplicationException.Create('� ��������� ���� �������� ��� �� ����� �� ������ ��������.')
       else
         NextStep(FacStepCount-1,'�������� ������ �� '+DMUgtuStructure.adoqFac.FieldByName('Cshort_name_fac').AsString);
       exit;
    end;

    NextStep(3,'�������� ������ �� '+DMUgtuStructure.adoqFac.FieldByName('Cshort_name_fac').AsString);
    dmFacultetStatistic.adospSelKursItogiCol.Close;
    with dmFacultetStatistic.adospSelKursItogiCol.Parameters do
    begin
      Clear;
      CreateParameter('@fac', ftInteger, pdInput, 4,
              DMUgtuStructure.adoqFac.FieldByName('ik_fac').AsInteger);
      CreateParameter('@sem', ftInteger, pdInput, 4, FnSem);
      CreateParameter('@year', ftInteger, pdInput, 4, FYear);
    end;
    dmFacultetStatistic.adospSelKursItogiCol.Open;

    NextStep(3,'�������� ������ �� '+DMUgtuStructure.adoqFac.FieldByName('Cshort_name_fac').AsString);
    dmFacultetStatistic.adospSelItogiFac.Close;
    with dmFacultetStatistic.adospSelItogiFac.Parameters do
    begin
      Clear;
      CreateParameter('@fac', ftInteger, pdInput, 4,
          DMUgtuStructure.adoqFac.FieldByName('ik_fac').AsInteger);
      CreateParameter('@sem', ftInteger, pdInput, 4, FnSem);
      CreateParameter('@year', ftInteger, pdInput, 4, FYear);
    end;
     dmFacultetStatistic.adospSelItogiFac.Open;

     result:= true;

end;


//����� ������, ���������������� �� ������� � �����������
//(������ �������� ������)
procedure TFacItogiExcelReport.ExportGroupDiscItogi(pageNumber: integer; var rowNumber: integer);
const incRowCount: integer = 6;
var i:integer;  //����� ������� ������
    k:integer;  //����� ������ ������ ��� ����������� ������� ������
    flEnd: boolean;   //������� ��������� ������
    j:integer;
    gr:integer;  //��� ������� ������ ��� ����������
    f1,f2,f3,f4,f5:string;  //������������ ��� ���������� �������
    StudCount: integer;      //���-�� ���������
    temp: integer;
begin
     dmFacultetStatistic.adospSelKursItogiCol.DisableControls;
     //��������� ����� 1-��
     ActivateWorksheet(pageNumber);
     //rowNumber:= rowNumber+incRowCount;
     i:=rowNumber+incRowCount;      //� ������
     k:=i-1;
     gr:=0;
     flEnd:= false;
     //����������� ���� �� ��������������, ������� � �����������
     dmFacultetStatistic.adospSelKursItogi.First;
     while (dmFacultetStatistic.adospSelKursItogi. FieldByName('NameFac').AsString<'0') and
            (not dmFacultetStatistic.adospSelKursItogi.Eof) do
         dmFacultetStatistic.adospSelKursItogi.Next;


     gr:=dmFacultetStatistic.adospSelKursItogi.FieldByName('ik_grup').AsInteger;
     while (gr>0) and
            (not dmFacultetStatistic.adospSelKursItogi.Eof) do
     begin
        //������� ������ � ������� ������
        if(gr<>dmFacultetStatistic.adospSelKursItogi.FieldByName('ik_grup').AsInteger) or (flEnd) then
        begin
           //if (i>rowNumber) then
           //begin
              temp:= dmFacultetStatistic.adospSelKursItogi.FieldByName('ik_grup').AsInteger;
              dmFacultetStatistic.adospSelKursItogiCol.Locate('Ik_grup',gr,[]);
              Items[k,1]:=dmFacultetStatistic.adospSelKursItogiCol.FieldByName('Cname_grup').AsString;
              Range['A'+inttostr(k),'A'+inttostr(k)].font.italic:=true;
              Range['A'+inttostr(k),'A'+inttostr(k)].font.bold:=true;


              StudCount:= dmFacultetStatistic.adospSelKursItogiCol.FieldByName('obcol').AsInteger-
                          dmFacultetStatistic.adospSelKursItogiCol.FieldByName('academcol').AsInteger;
              if (StudCount<dmFacultetStatistic.adospSelKursItogiCol.FieldByName('dopcol').AsInteger) then
                StudCount:= dmFacultetStatistic.adospSelKursItogiCol.FieldByName('dopcol').AsInteger;

              inc(k);
              //Range['B'+inttostr(k),'B'+inttostr(i-1)].Value2:=dmFacultetStatistic.adospSelKursItogiCol.FieldByName('obcol').AsInteger;
              //Range['C'+inttostr(k),'C'+inttostr(i-1)].Value2:= StudCount;
              Items[i,1]:='�� ������:';
              Items[i+1,1]:=' ���.'+inttostr(dmFacultetStatistic.adospSelKursItogiCol.FieldByName('otlcol').AsInteger)+
                             ' ���.'+inttostr(dmFacultetStatistic.adospSelKursItogiCol.FieldByName('horcol').AsInteger)+
                             ' �����.'+inttostr(dmFacultetStatistic.adospSelKursItogiCol.FieldByName('neudcol').AsInteger);
              Range['A'+inttostr(i),'J'+inttostr(i+1)].Font.Bold:=true;

              Items[i,10]:=(dmFacultetStatistic.adospSelKursItogiCol.FieldByName('dopcol').AsInteger-
                  dmFacultetStatistic.adospSelKursItogiCol.FieldByName('neudcol').AsInteger)/ StudCount;
              Items[i,11]:=(dmFacultetStatistic.adospSelKursItogiCol.FieldByName('otlcol').AsInteger+
                  dmFacultetStatistic.adospSelKursItogiCol.FieldByName('horcol').AsInteger)/ StudCount;





						   dmFacultetStatistic.adospSelKursItogi.Locate('ik_grup',gr+1000000,[]);
						  //��������� �������
						  if (dmFacultetStatistic.adospSelKursItogi.FieldByName('dopcol').AsInteger>0) then
							  Items[i,9]:=(5*dmFacultetStatistic.adospSelKursItogi.FieldByName('otlcol').AsFloat+4*dmFacultetStatistic.adospSelKursItogi.FieldByName('horcol').AsFloat
									+3*dmFacultetStatistic.adospSelKursItogi.FieldByName('udvcol').AsFloat+
									2*(dmFacultetStatistic.adospSelKursItogi.FieldByName('dopcol').AsFloat-dmFacultetStatistic.adospSelKursItogi.FieldByName('otlcol').AsFloat
									-dmFacultetStatistic.adospSelKursItogi.FieldByName('horcol').AsFloat-dmFacultetStatistic.adospSelKursItogi.FieldByName('udvcol').AsFloat))/dmFacultetStatistic.adospSelKursItogi.FieldByName('dopcol').AsFloat
						  else
							  Items[i,9]:=0;
                Range['I'+inttostr(k),'I'+inttostr(i-1)].formula:='=IF(C'+inttostr(k)+'>0,(5*E'+inttostr(k)+'+4*F'+inttostr(k)+'+3*G'+inttostr(k)+'+2*H'+inttostr(k)+')/C'+inttostr(k)+',0)';
                Range['J'+inttostr(k),'J'+inttostr(i-1)].formula:='=IF(C'+inttostr(k)+'>0,+(E'+inttostr(k)+'+F'+inttostr(k)+'+G'+inttostr(k)+')/C'+inttostr(k)+',0)';
                //'=(E'+inttostr(k)+'+F'+inttostr(k)+'+G'+inttostr(k)+')/C'+inttostr(k);
                Range['K'+inttostr(k),'K'+inttostr(i-1)].formula:='=IF(C'+inttostr(k)+'>0,+(E'+inttostr(k)+'+F'+inttostr(k)+')/C'+inttostr(k)+',0)';
                //'=(E'+inttostr(k)+'+F'+inttostr(k)+')/C'+inttostr(k);
                Range['H'+inttostr(k),'H'+inttostr(i-1)].formula:= '=D'+inttostr(k)+'-E'+inttostr(k)+'-F'+inttostr(k)+'-G'+inttostr(k);

              i:=i+3; k:=i-1;
           //end;
           if (not flEnd) then
           begin
              dmFacultetStatistic.adospSelKursItogi.Locate('ik_grup',temp,[]);
              gr:=dmFacultetStatistic.adospSelKursItogi.FieldByName('ik_grup').AsInteger;
           end
           else
            gr:= -1;
           //dmFacultetStatistic.adospSelKursItogiCol.Locate('Ik_grup',gr,[]);
        end;

        //���������� ������ �� ������� ���������� ������
        if not flEnd then
        begin
          Items[i,1]:=dmFacultetStatistic.adospSelKursItogi.FieldByName('cName_disc').AsString;
          Items[i,2]:=dmFacultetStatistic.adospSelKursItogi.FieldByName('obcol').AsInteger;

          temp:=dmFacultetStatistic.adospSelKursItogi.FieldByName('obcol').AsInteger-
                       dmFacultetStatistic.adospSelKursItogi.FieldByName('academcol').AsInteger;
          if (temp<dmFacultetStatistic.adospSelKursItogi.FieldByName('dopcol').AsInteger) then
            temp:=dmFacultetStatistic.adospSelKursItogi.FieldByName('dopcol').AsInteger;
          Items[i,3]:= temp;

          //Items[i,4]:=dmFacultetStatistic.adospSelKursItogi.FieldByName('dopcol').AsInteger;
          Items[i,4]:=dmFacultetStatistic.adospSelKursItogi.FieldByName('dopcol').AsInteger;
          Items[i,5]:=dmFacultetStatistic.adospSelKursItogi.FieldByName('otlcol').AsInteger;
          Items[i,6]:=dmFacultetStatistic.adospSelKursItogi.FieldByName('horcol').AsInteger;
          Items[i,7]:=dmFacultetStatistic.adospSelKursItogi.FieldByName('udvcol').AsInteger;
          inc(i);
        end;
        dmFacultetStatistic.adospSelKursItogi.Next;
        //� ����� ��������� �� ���������� ������, ����� ��������� ������ � ��������� ������
        if (dmFacultetStatistic.adospSelKursItogi.FieldByName('nYear_post').AsInteger=0) and (not flEnd) then
        begin
          flEnd:= true;
          dmFacultetStatistic.adospSelKursItogi.Prior;
          //gr:= 0;
        end;
    end;

    k:= rowNumber;
    //�����, ���� �� ������ ���������
    if k>incRowCount then
    begin
		  k:= rowNumber+incRowCount-3;
    end;

		 Range['A'+IntToStr(k),'K'+inttostr(k)].Merge(true);
     Items[k,1]:='����� '+Semname+' ��������������� ������ '+inttostr(publicYear)+'/'
					 +inttostr(publicYear+1)+' ��.�.';

		 inc(k);
		 Range['A'+IntToStr(k),'K'+inttostr(k)].Merge(true);
     Items[k,1]:='�� '+ dmFacultetStatistic.adospSelKursItogi.FieldByName('NameFac').AsString +
					 ' � ������ ��������';
		 Range['A'+inttostr(k-1),'K'+inttostr(k)].Font.Bold:=true;
		 Range['A'+inttostr(k-1),'K'+inttostr(k)].Font.Size:= 12;
		 Range['A'+IntToStr(k-1),'K'+inttostr(k)].HorizontalAlignment:=
			  xlHAlignCenter;

    rowNumber:= rowNumber+ incRowCount-1;
    Range['A'+IntToStr(rowNumber),'K'+inttostr(i-2)].Borders.Weight:=2;
    Range['B'+inttostr(rowNumber),'K'+inttostr(i+1)].HorizontalAlignment:=-4108;
    Range['A'+inttostr(i),'K'+inttostr(i+1)].Font.Bold:=true;
    rowNumber:= i+1;

end;

//����� ������, ���������������� �� �����������
//(������ �������� ������)
procedure TFacItogiExcelReport.ExportDiscItogi(pageNumber: integer; var rowNumber: integer);
const incRowCount: integer = 7;
var i:integer;  //����� ������� ������
  temp: integer;
begin

  //�������� ����� �� ����������� (2-� ��������)
  ActivateWorksheet(pageNumber);

  i:= rowNumber;
  if i>incRowCount then
  begin
    inc(i,3);
  end;

  Items[i,1]:='����� '+SemName+' ��������������� ������ '+inttostr(publicYear)+'/'
             +inttostr(publicYear+1)+' ��.�.';
  Range['A'+IntToStr(i),'K'+inttostr(i)].Merge(true);

  inc(i);
  Items[i,1]:='�� '+ dmFacultetStatistic.adospSelKursItogi.FieldByName('NameFac').AsString +
             ' � ������ ��������';
  Range['A'+IntToStr(i),'K'+inttostr(i)].Merge(true);
  Range['A'+inttostr(i-1),'K'+inttostr(i)].Font.Size:= 12;
  Range['A'+IntToStr(i-1),'K'+inttostr(i)].HorizontalAlignment:=
      xlHAlignCenter;

  inc(i);
  Items[i,1]:='����� ��';

  inc(i);
  Items[i,1]:='����������� ���-��';

  Range['A'+inttostr(i-3),'K'+inttostr(i)].Font.Bold:=true;


  rowNumber:=rowNumber+incRowCount;
  i:=rowNumber;
  dmFacultetStatistic.adospSelKursItogi.Locate('ik_grup',0,[]);
  while not dmFacultetStatistic.adospSelKursItogi.Eof do
  begin
    Items[i,1]:=dmFacultetStatistic.adospSelKursItogi.FieldByName('cName_disc').AsString;
    Items[i,2]:=dmFacultetStatistic.adospSelKursItogi.FieldByName('obcol').AsInteger;

    temp:= dmFacultetStatistic.adospSelKursItogi.FieldByName('obcol').AsInteger-
                       dmFacultetStatistic.adospSelKursItogi.FieldByName('academcol').AsInteger;
    if (temp < dmFacultetStatistic.adospSelKursItogi.FieldByName('dopcol').AsInteger) then
      temp:= dmFacultetStatistic.adospSelKursItogi.FieldByName('dopcol').AsInteger;
    Items[i,3]:= temp;

    Items[i,4]:=dmFacultetStatistic.adospSelKursItogi.FieldByName('dopcol').AsInteger;
    Items[i,5]:=dmFacultetStatistic.adospSelKursItogi.FieldByName('otlcol').AsInteger;
    Items[i,6]:=dmFacultetStatistic.adospSelKursItogi.FieldByName('horcol').AsInteger;
    Items[i,7]:=dmFacultetStatistic.adospSelKursItogi.FieldByName('udvcol').AsInteger;
    inc(i);
    dmFacultetStatistic.adospSelKursItogi.Next;
  end;

  //�������� ������� �� ����������
  dmFacultetStatistic.adospSelKursItogi.Last;
  Items[i,1]:='�� '+dmFacultetStatistic.adospSelKursItogi.FieldByName('NameFac').AsString;
  Range['B'+inttostr(i),'G'+inttostr(i)].formula:='=SUM(B'+inttostr(rowNumber)+':B'+inttostr(i-1)+')';
  Range['H'+inttostr(rowNumber),'H'+inttostr(i)].Formula:=
          '=D'+IntToStr(rowNumber)+
          '-E'+IntToStr(rowNumber)+
          '-F'+IntToStr(rowNumber)+
          '-G'+IntToStr(rowNumber);
  Range['I'+inttostr(rowNumber),'I'+inttostr(i)].Formula:=
        '=IF(C'+IntToStr(rowNumber)+
        '>0,(5*E'+IntToStr(rowNumber)+
        '+4*F'+IntToStr(rowNumber)+
        '+3*G'+IntToStr(rowNumber)+
        '+2*H'+IntToStr(rowNumber)+
        ')/C'+IntToStr(rowNumber)+',0)';
  Range['J'+inttostr(rowNumber),'J'+inttostr(i)].Formula:=
        '=IF(C'+IntToStr(rowNumber)+
        '>0,(E'+IntToStr(rowNumber)+
        '+F'+IntToStr(rowNumber)+
        '+G'+IntToStr(rowNumber)+
        ')/C'+IntToStr(rowNumber)+',0)';
  Range['K'+inttostr(rowNumber),'K'+inttostr(i)].Formula:=
        '=IF(C'+IntToStr(rowNumber)+
        '>0,(E'+IntToStr(rowNumber)+
        '+F'+IntToStr(rowNumber)+
        ')/C'+IntToStr(rowNumber)+',0)';

  Range['A'+inttostr(rowNumber),'K'+inttostr(i)].Borders.Weight:=2;
  Range['A'+inttostr(i),'K'+inttostr(i)].Font.Bold:=true;


  //������ ������� ��� ������ �� ������������
  if FIkFac=0 then
  begin
    if DiscFormula<>'' then
      DiscFormula:= DiscFormula+'+';
    DiscFormula:= DiscFormula+'B'+IntToStr(i);
  end;

  rowNumber:= i+1;

end;

//����� ������, ���������������� �� �������
//(������ �������� ������)
procedure TFacItogiExcelReport.ExportGroupItogi(pageNumber: integer; var rowNumber: integer);
const incRowCount: integer = 3;
var i:integer;  //����� ������� ������
    k:integer;  //����� ������ ������ ��� ����������� ������� ������
    flEnd: boolean;   //������� ��������� ������
    j:integer;
    n:integer;
    //flEnd: boolean;   //������� ��������� ������
    ikSpec:integer;   //��� ������� ������������� ������
    f1,f2, fo, fo1:string;  //������������ ��� ���������� �������
    StudCount: integer;      //���-�� ���������
begin


  //����� ������� ����� ������� (�� ��������������)
  ActivateWorksheet(pageNumber);
  dmFacultetStatistic.adospSelKursItogi.Prior;

  i:= rowNumber;
  if i>incRowCount then
  begin
    inc(i,2);
  end;

  Items[i,1]:='����� '+SemName+' ��������������� ������ '+inttostr(publicYear)+'/'
             +inttostr(publicYear+1)+' ��.�. �� '+dmFacultetStatistic.adospSelKursItogi.FieldByName('NameFac').AsString;
  Range['A'+IntToStr(i),'Q'+inttostr(i)].Merge(true);
  Range['A'+inttostr(i),'Q'+inttostr(i)].Font.Size:= 12;
  Range['A'+IntToStr(i),'Q'+inttostr(i)].HorizontalAlignment:=
      xlHAlignCenter;

  Range['A'+inttostr(i),'Q'+inttostr(i)].Font.Bold:=true;


  i:=rowNumber+incRowCount;
  k:=i;
  flEnd:= false;
  fo:='';   fo1:='';
  n:=0;
  //��� �������������
  dmFacultetStatistic.adospSelItogiFac.First;
  ikSpec:=dmFacultetStatistic.adospSelItogiFac.FieldByName('ik_spec').AsInteger;
  while not dmFacultetStatistic.adospSelItogiFac.Eof do
  begin
    //��� ����� ������������� ������� ����� ������ �� �������������
    if (ikSpec<>dmFacultetStatistic.adospSelItogiFac.FieldByName('ik_spec').AsInteger) then
    begin
      if not flEnd then
        dmFacultetStatistic.adospSelItogiFac.Prior;

      if (flEnd) then
        dmFacultetStatistic.adospSelItogiFac.Next;

      Items[i,1]:='�� '+dmFacultetStatistic.adospSelItogiFac.FieldByName('Cshort_spec').AsString;
      Range['A'+inttostr(i),'Q'+inttostr(i)].Font.Bold:=true;

      //��������� �������� ������� ��� �������������
      f1:='B'+inttostr(k);
      f2:='Q'+inttostr(k);
      for j:=k+1 to i-1 do
      begin
        f1:=f1+'+B'+inttostr(j);
        f2:=f2+'+Q'+inttostr(j);
      end;
      if (fo='') then
      begin
        fo:=f2;
        fo1:=f1;
      end
      else
      begin
        fo:=fo+'+'+f2;
        fo1:=fo1+'+'+f1;
      end;
      j:=i-k;
      n:=n+j;
      Range['B'+inttostr(i),'N'+inttostr(i)].formula:='='+f1;
      Range['Q'+inttostr(i),'Q'+inttostr(i)].formula:='=('+f2+
               ')/'+inttostr(j);

      dmFacultetStatistic.adospSelItogiFac.Next;

      ikSpec:=dmFacultetStatistic.adospSelItogiFac.FieldByName('ik_spec').AsInteger;
      k:=i+1;
    end

    else
    begin
      //������� ��������������� ������ � �������������� ������ �� �������
      dmFacultetStatistic.adospSelKursItogi.Locate('ik_grup',dmFacultetStatistic.adospSelItogiFac.FieldByName('ik_grup').AsInteger+1000000,[]);
      dmFacultetStatistic.adospSelKursItogiCol.Locate('ik_grup',dmFacultetStatistic.adospSelItogiFac.FieldByName('ik_grup').AsInteger,[]);
      Items[i,1]:=dmFacultetStatistic.adospSelKursItogiCol.FieldByName('Cname_grup').AsString;
      Items[i,2]:=dmFacultetStatistic.adospSelKursItogiCol.FieldByName('obcol').AsInteger;
      Items[i,3]:=dmFacultetStatistic.adospSelKursItogiCol.FieldByName('academcol').AsInteger;
      Items[i,5]:=dmFacultetStatistic.adospSelKursItogiCol.FieldByName('dopcol').AsInteger;
      Items[i,7]:=dmFacultetStatistic.adospSelKursItogiCol.FieldByName('otlcol').AsInteger;
      Items[i,8]:=dmFacultetStatistic.adospSelKursItogiCol.FieldByName('horcol').AsInteger;
      Items[i,10]:=dmFacultetStatistic.adospSelItogiFac.FieldByName('onlyudcol').AsInteger;
      Items[i,11]:=dmFacultetStatistic.adospSelKursItogiCol.FieldByName('neudcol').AsInteger;
      Items[i,12]:=dmFacultetStatistic.adospSelItogiFac.FieldByName('oneneudcol').AsInteger;
      Items[i,13]:=dmFacultetStatistic.adospSelItogiFac.FieldByName('twoneudcol').AsInteger;

      //��������� �������
      if (dmFacultetStatistic.adospSelKursItogi.FieldByName('dopcol').AsInteger>0) then
        Items[i,17]:=(5*dmFacultetStatistic.adospSelKursItogi.FieldByName('otlcol').AsFloat+4*dmFacultetStatistic.adospSelKursItogi.FieldByName('horcol').AsFloat
                +3*dmFacultetStatistic.adospSelKursItogi.FieldByName('udvcol').AsFloat+
                2*(dmFacultetStatistic.adospSelKursItogi.FieldByName('dopcol').AsFloat-dmFacultetStatistic.adospSelKursItogi.FieldByName('otlcol').AsFloat
                -dmFacultetStatistic.adospSelKursItogi.FieldByName('horcol').AsFloat-dmFacultetStatistic.adospSelKursItogi.FieldByName('udvcol').AsFloat))/dmFacultetStatistic.adospSelKursItogi.FieldByName('dopcol').AsFloat
      else
        Items[i,17]:=0;

      dmFacultetStatistic.adospSelItogiFac.Next;
    end;

    inc(i);

    if (not flEnd) and (dmFacultetStatistic.adospSelItogiFac.Eof) then
    begin
      flEnd:= true;
      dmFacultetStatistic.adospSelItogiFac.Prior;
      ikSpec:=-1;
    end;

  end;
  j:=i-k;
  n:=n+j;



  //����� �������� ������� ���������
  Range['B'+inttostr(i),'N'+inttostr(i)].formula:='='+f1;
  Range['Q'+inttostr(i),'Q'+inttostr(i)].formula:='=('+f2+
               ')/'+inttostr(j);
  Range['B'+inttostr(i),'N'+inttostr(i)].formula:='='+fo1;
  Range['Q'+inttostr(i),'Q'+inttostr(i)].formula:='=('+fo+
               ')/'+inttostr(n);

  Range['A'+inttostr(i),'Q'+inttostr(i)].Font.Bold:=true;
  dmFacultetStatistic.adospSelKursItogi.Last;
  Items[i,1]:='�� '+dmFacultetStatistic.adospSelKursItogi.FieldByName('NameFac').AsString;


  //������ ������� ��� ������ �� ������������
  if FIkFac=0 then
  begin
    if GroupFormula<>'' then
      GroupFormula:= GroupFormula+'+';

    GroupFormula:= GroupFormula+'B'+IntToStr(i);
    inc(ItogiFacCount);
  end;


  rowNumber:=rowNumber+incRowCount;
  Range['A'+inttostr(rowNumber),'Q'+inttostr(i)].Borders.Weight:=2;
  Range['F'+inttostr(rowNumber),'F'+inttostr(i)].formula:='=E'+IntToStr(rowNumber)+'-K'+IntToStr(rowNumber);
  Range['D'+inttostr(rowNumber),'D'+inttostr(i)].formula:='=MAX(B'+IntToStr(rowNumber)+'-C'+IntToStr(rowNumber)+',E'+IntToStr(rowNumber)+')';
  Range['I'+inttostr(rowNumber),'I'+inttostr(i)].formula:='=F'+IntToStr(rowNumber)+'-G'+IntToStr(rowNumber)+'-J'+IntToStr(rowNumber)+'-H'+IntToStr(rowNumber);
  Range['N'+inttostr(rowNumber),'N'+inttostr(i)].formula:='=K'+IntToStr(rowNumber)+'-L'+IntToStr(rowNumber)+'-M'+IntToStr(rowNumber);
  Range['O'+IntToStr(rowNumber),'O'+inttostr(i)].formula:='=IF(D'+IntToStr(rowNumber)+'>0,F'+IntToStr(rowNumber)+'/D'+IntToStr(rowNumber)+',0)';
  Range['P'+IntToStr(rowNumber),'P'+inttostr(i)].formula:='=IF(D'+IntToStr(rowNumber)+'>0,(G'+IntToStr(rowNumber)+'+H'+IntToStr(rowNumber)+')/D'+IntToStr(rowNumber)+',0)';

  dmFacultetStatistic.adospSelKursItogi.Close;
  dmFacultetStatistic.adospSelItogiFac.Close;
  dmFacultetStatistic.adospSelKursItogiCol.EnableControls;

  rowNumber:= i+1;
end;

procedure TFacItogiExcelReport.ExportItogiForFac(var GroupDiscItogiRowNumber, DiscItogiRowNumber, GroupItogiRowNumber:integer);
var s:string;
begin
  inherited;
  s:=DMUgtuStructure.adoqFac.FieldByName('Cshort_name_fac').AsString;

  NextStep(1,'�������� ������ �� '+s);
  if not GetData then
    exit;

  NextStep(3,'������������ ������ ����� ������  �� '+s);
  ExportGroupDiscItogi(GroupDiscPageNumber,GroupDiscItogiRowNumber);

  NextStep(1,'������������ ������ ����� ������ �� '+s);
  ExportDiscItogi(DiscPageNumber, DiscItogiRowNumber);

  NextStep(1,'������������ ������� ����� ������ �� '+s);
  ExportGroupItogi(GroupPageNumber, GroupItogiRowNumber);

  NextStep(1,'������������ ������ �� '+s+' ���������.');
end;


procedure TFacItogiExcelReport.Init;
begin
  //��������� ������ ���� �����������, �� ������� ����� �������� �����

  //���� ��� ���������� =0, �� ������� ��� ����������, ����� ���
  if FIkFac=0 then
  begin
    DMUgtuStructure.adoqFac.Close;
    DMUgtuStructure.adoqFac.Open;
    //DMUgtuStructure.adoqFac.Filter:='ik_fac<>6';
    DMUgtuStructure.adoqFac.Filter:='ik_fac<>0';
    DMUgtuStructure.adoqFac.Filtered:= true;
    ItogiFacCount:= 0;
    GroupFormula:= '';
    DiscFormula:= '';
  end
  else
  begin
    DMUgtuStructure.adoqFac.Close;
    DMUgtuStructure.adoqFac.Open;
    DMUgtuStructure.adoqFac.Filter:='ik_fac='+IntToStr(FIkFac);
    DMUgtuStructure.adoqFac.Filtered:= true;
  end;

end;


procedure TFacItogiExcelReport.Execute;
var GroupDiscItogiRowNumber: integer;  //����� ������� ������ � ������ ����� ������
    DiscItogiRowNumber: integer;  //����� ������� ������ �� ������ ����� ������
    GroupItogiRowNumber: integer;  //����� ������� ������ � ������� ����� ������
    str: string;
begin
  inherited;

  //������ �������� �������� � ��� ��� ���� ������� ������
  if (FnSem=1) then
  begin
    SemName:= '������';
    publicYear:= FYear;
  end
  else
  begin
    SemName:= '������';
    publicYear:= FYear-1;
  end;


  //����� ������ �� ���� �����������
   GroupDiscItogiRowNumber:= 1;
   DiscItogiRowNumber:= 1;
   GroupItogiRowNumber:= 1;
   DMUgtuStructure.adoqFac.First;
   while not DMUgtuStructure.adoqFac.Eof do
   begin
     ExportItogiForFac(GroupDiscItogiRowNumber, DiscItogiRowNumber, GroupItogiRowNumber);
     //ShowMessage();
     str:= DMUgtuStructure.adoqFac.FieldByName('Cname_fac').AsString;
     DMUgtuStructure.adoqFac.Next;

   end;

   //��������� ������� ��� ����� �� �������
  if FIkFac=0 then
  begin
  //�� ������ �������� (�� �����������)
    ActivateWorksheet(DiscPageNumber);
    Items[DiscItogiRowNumber,1]:= '�����';

    if ItogiFacCount>0 then
      Range['B'+inttostr(DiscItogiRowNumber),'K'+inttostr(DiscItogiRowNumber)].formula:=
         '=('+DiscFormula+')/'+IntToStr(ItogiFacCount);

    Range['B'+inttostr(DiscItogiRowNumber),'H'+inttostr(DiscItogiRowNumber)].formula:= '='+DiscFormula;

    Range['A'+inttostr(DiscItogiRowNumber),'K'+inttostr(DiscItogiRowNumber)].Font.Size:= 11;
    Range['A'+inttostr(DiscItogiRowNumber),'K'+inttostr(DiscItogiRowNumber)].Borders.Weight:=2;
    Range['A'+inttostr(DiscItogiRowNumber),'K'+inttostr(DiscItogiRowNumber)].Font.Bold:=true;

  //�� ������� �������� (�� �������)
    ActivateWorksheet(GroupPageNumber);
    Items[GroupItogiRowNumber,1]:= '�����';
    if ItogiFacCount>0 then
      Range['B'+inttostr(GroupItogiRowNumber),'Q'+inttostr(GroupItogiRowNumber)].formula:=
         '=('+GroupFormula+')/'+IntToStr(ItogiFacCount);
    Range['B'+inttostr(GroupItogiRowNumber),'N'+inttostr(GroupItogiRowNumber)].formula:= '='+GroupFormula;

    Range['A'+inttostr(GroupItogiRowNumber),'Q'+inttostr(GroupItogiRowNumber)].Font.Size:= 11;
    Range['A'+inttostr(GroupItogiRowNumber),'Q'+inttostr(GroupItogiRowNumber)].Borders.Weight:=2;
    Range['A'+inttostr(GroupItogiRowNumber),'Q'+inttostr(GroupItogiRowNumber)].Font.Bold:=true;
  end;

  ActivateWorksheet(1);
  Show;
end;


end.

