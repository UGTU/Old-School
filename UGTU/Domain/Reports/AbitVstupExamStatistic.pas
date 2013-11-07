{*
    ����� - ����� ������ �� ���������� ����� ��������� � Excel
    ������: 1.0.0.1
    �������: 21.07.2011
    ��������� ������:
    �����: ������� �.�.
*}
unit AbitVstupExamStatistic;
  {#Author tanyav@ist.ugtu.net}

interface
uses
  Classes, SysUtils, ExcelXP, Barcode, Contnrs, ReportsBase, DB, ADODB,
    DBTVObj, DBTVStudObj, DBTVGroupObj, ComCtrls, StdCtrls, ApplicationController,
    Variants, uDMAbiturientOtchety, ExceptionBase;

type
  //TReportCondition = (allOchn=1,allZaochn,realOchn,realZaochn, ReportEnd);

   TAbitExamStatisticReport = class(TExcelReportBase)
  private
  protected
    FOnlyZachisl: boolean;
    FYear: integer;
    Fik_fac: Variant;
    Fik_spec_fac: Variant;
    procedure LoadData;
    procedure Execute;override;
    function GetTotalSteps: Integer; override;
    function GetFirstVidSdColNumber(VidSdNumber, KatPostCount, dataFirstColNumber:integer):integer;
  public
    property OnlyZachisl:boolean read FOnlyZachisl write FOnlyZachisl;
    property Year: integer read FYear write FYear;
    property ik_fac: Variant read Fik_fac write Fik_fac;
    property ik_spec_fac: Variant read Fik_spec_fac write Fik_spec_fac;
  end;

implementation





procedure TAbitExamStatisticReport.Execute;
const firstRowNumber = 3;
      firstColNumber = 1;
      dataFirstRowNumber = firstRowNumber+2;
      dataFirstColNumber = 4;
      MaxKatPostCount = 20;   //������ ���� ���� ���-�� ��� ����������, �.�. ���������� �� �����������
var CurrRowNumber: integer;
    CurrColNumber: integer;
    CurrFacid: integer;
    CurrSpecid: integer;
    CurrDiscid: integer;
    vidSdNumber: integer;
    katPostNumber: integer;
    KatPostCount: integer;
    KatPostList: TStringList;
    VidSdachList: TStringList;
    tempVidSdNumber: integer;
    firstDiscRowNumber: integer;
begin
  inherited;
  DisplayAlerts:= false;
  NextStep(2,'�������� ������');
  LoadData;
  //���������, ����� ���� ��������� ������ ������ ������
  if ((not DMAbiturientOtchety.adoqExamStatistic.Active))  then
      raise EApplicationException.Create('������ ��� �������� � MS Excel. �� ��������� ��� ����������� ������!');
  //���������, ����� ������ ������ ����
  if ((not DMAbiturientOtchety.adoqExamStatistic.RecordCount=0))  then
      raise EApplicationException.Create('����� �� �������� ������!');
  with  DMAbiturientOtchety.adoqExamStatistic do
  begin
  //try
    //DMAbiturientNabor.adoqExamStatistic.
    if (OnlyZachisl) then
      Replace('#abitState#', '�����������')
    else
      Replace('#abitState#', '�����������');
    Replace('#year#', FieldByName('NNyear').AsString);

    //����������� ��������� - ����������� ��� ���� ����� � ��������� �����������
    //���������� ���� ����� ��������� �����������
    NextStep(1,'������������ ���������');
    katPostNumber:= 1;   //��� ������� �� 2
    KatPostList:= TStringList.Create;
    while (Locate('ik_type_kat',katPostNumber,[]) or (katPostNumber<=MaxKatPostCount))  do
    begin
      if (katPostNumber=FieldByName('ik_type_kat').AsInteger) then
      begin
        KatPostList.Add(FieldByName('CType_kat').AsString);
      end;
      inc(katPostNumber);
    end;
    KatPostCount:= KatPostList.Count;
    //����������� ��� ���� ����� � ��������� �����������
    tempVidSdNumber:= 1;
    VidSdachList:= TStringList.Create;
    CurrRowNumber:=firstRowNumber;
    CurrColNumber:= dataFirstColNumber;
    while ((Locate('VidSdOrderNumber',tempVidSdNumber,[])) or (tempVidSdNumber<=MaxKatPostCount))  do
    begin
      if (FieldByName('VidSdOrderNumber').AsInteger=tempVidSdNumber) then
      begin
        VidSdachList.Add(FieldByName('cshort_sdach').AsString);
        Range[chr(ord('A')+CurrColNumber-1)+IntToStr(CurrRowNumber),
          chr(ord('A')+CurrColNumber+KatPostCount-2)+IntToStr(CurrRowNumber)].Merge(true);
        {Range[chr(ord('A')+CurrColNumber-1)+IntToStr(CurrRowNumber),
          chr(ord('A')+CurrColNumber+KatPostCount-2)+IntToStr(CurrRowNumber)].HorizontalAlignment:=-4108;  }
        Items[CurrRowNumber,CurrColNumber]:= FieldByName('cshort_sdach').AsString;
        for katPostNumber := 0 to KatPostCount-1 do
        begin
          Items[CurrRowNumber+1,CurrColNumber]:= KatPostList[katPostNumber];
          inc(CurrColNumber);
        end;
      end;
      inc(tempVidSdNumber);
    end;
    
    //������ ������
    NextStep(2,'������� ������');
    TApplicationController.GetInstance.AddLogEntry('������� ������ � Excel.');
    CurrRowNumber:= dataFirstRowNumber;
    First;
    while not Eof do
    begin
      CurrFacid:= FieldByName('Ik_fac').AsInteger;
      Items[CurrRowNumber,firstColNumber]:= FieldByName('Cshort_name_fac').AsString;
      while (CurrFacid = FieldByName('Ik_fac').AsInteger) and (not Eof) do
      begin
        CurrSpecid:= FieldByName('ik_spec_fac').AsInteger;
        Items[CurrRowNumber,firstColNumber+1]:= FieldByName('Cshort_spec').AsString;
        firstDiscRowNumber:= CurrRowNumber;
        while (CurrSpecid = FieldByName('ik_spec_fac').AsInteger)
          and (CurrFacid = FieldByName('Ik_fac').AsInteger)
          and (not Eof) do
        begin
          CurrDiscid:= FieldByName('ik_disc').AsInteger;
          Items[CurrRowNumber,firstColNumber+2]:= FieldByName('�name_disc').AsString;
          while (CurrDiscid = FieldByName('ik_disc').AsInteger)
            and (CurrSpecid = FieldByName('ik_spec_fac').AsInteger)
            and (not Eof) do
          begin
            vidSdNumber:= VidSdachList.IndexOf(FieldByName('cshort_sdach').AsString);
            while (VidSdachList[vidSdNumber] = FieldByName('cshort_sdach').AsString)
              and (CurrDiscid = FieldByName('ik_disc').AsInteger)
              and (not Eof) do
            begin
              CurrColNumber:= GetFirstVidSdColNumber(VidSdNumber, KatPostCount, dataFirstColNumber);
              katPostNumber:= KatPostList.IndexOf(FieldByName('CType_kat').AsString);
              Items[CurrRowNumber,CurrColNumber+katPostNumber]:= FieldByName('SrBall').AsFloat;
              Next;
            end;
          end;
          inc(CurrRowNumber);
        end;
        //����� �� �������������
        if Eof then
          Last
        else
          Prior;
        Items[CurrRowNumber-1,firstColNumber+1]:= FieldByName('Cshort_spec').AsString;
        Next;
        Range[chr(ord('A')++firstColNumber-1)+IntToStr(CurrRowNumber-1),
            chr(ord('A')+GetFirstVidSdColNumber(VidSdachList.Count, KatPostCount,
            dataFirstColNumber)-2)+IntToStr(CurrRowNumber-1)].Font.Italic:= True;
      end;
      //����� �� ����������
      if Eof then
        Last
      else
        Prior;
      Items[CurrRowNumber-1,firstColNumber]:= FieldByName('Cshort_name_fac').AsString;
      Next;
      Range[chr(ord('A')++firstColNumber-1)+IntToStr(CurrRowNumber-1),
            chr(ord('A')+GetFirstVidSdColNumber(VidSdachList.Count, KatPostCount, dataFirstColNumber)-2)+
            IntToStr(CurrRowNumber-1)].Font.Bold:=true;
      Range[chr(ord('A')++firstColNumber-1)+IntToStr(CurrRowNumber-1),
        chr(ord('A')+GetFirstVidSdColNumber(VidSdachList.Count, KatPostCount, dataFirstColNumber)-2)+
        IntToStr(CurrRowNumber-1)].Font.Italic:= True;
      Range[chr(ord('A')+firstColNumber-1)+IntToStr(CurrRowNumber-1),
          chr(ord('A')+firstColNumber)+IntToStr(CurrRowNumber-1)].Merge(true);
   end;
  end;
  //����� �����
  NextStep(4,'������ �������� ������');
  if (ik_fac=0)and(ik_spec_fac=0) then
  begin
    Items[CurrRowNumber-1,firstColNumber]:= '����� �� ������������';
    Range[chr(ord('A')++firstColNumber-1)+IntToStr(CurrRowNumber-1),
            chr(ord('A')+GetFirstVidSdColNumber(VidSdachList.Count,
            KatPostCount, dataFirstColNumber)-2)+
            IntToStr(CurrRowNumber-1)].Font.Bold:=true;
    Range[chr(ord('A')+firstColNumber-1)+IntToStr(CurrRowNumber-1),
          chr(ord('A')+firstColNumber)+IntToStr(CurrRowNumber-1)].Merge(true);
    Range[chr(ord('A')+firstColNumber-1)+IntToStr(firstRowNumber),
          chr(ord('A')+GetFirstVidSdColNumber(VidSdachList.Count,
          KatPostCount, dataFirstColNumber)-2)+IntToStr(CurrRowNumber-1)].Borders.Weight:=2;
  end;
  NextStep(1,'���������� ������.');



  {ActiveBarcodeApplet.AppletName := 'PDF417Ctrl1';
  ActiveBarcodeApplet.BarcodeHeader := TBarcodeReportHeader.Create;
  ActiveBarcodeApplet.BarcodeHeader.MajorVersion := 1;
  ActiveBarcodeApplet.BarcodeHeader.MinorVersion := 0;
  ActiveBarcodeApplet.BarcodeHeader.ObjectType := 1;
  ActiveBarcodeApplet.BarcodeHeader.OID := Fik_ved;
  ActiveBarcodeApplet.WriteToApplet; }
  DisplayAlerts:= true;
  Show;

end;

//���������� ����� ������� ������� ��� ��������� ������ ���� �����
function TAbitExamStatisticReport.GetFirstVidSdColNumber(VidSdNumber,
  KatPostCount, dataFirstColNumber: integer): integer;
begin
  if (vidSdNumber<0) then
    raise EApplicationException.Create('��������� ����������� ������ ��� �������� ������!');
  if (KatPostCount<1) then
    raise EApplicationException.Create('��������� ����������� ������ ��� �������� ������!');
  if (dataFirstColNumber<1) then
    raise EApplicationException.Create('��������� ����������� ������ ��� �������� ������!');
  result:= vidSdNumber*KatPostCount+dataFirstColNumber;
end;


function TAbitExamStatisticReport.GetTotalSteps: Integer;
begin
  result:=10;
end;

procedure TAbitExamStatisticReport.LoadData;
begin
  inherited;
  if (year<0) then
    raise EApplicationException.Create('��������� ����������� ������ ��� �������� ������! �� ����� ��������.');
  TApplicationController.GetInstance.AddLogEntry('�������� ������ ��� ������.');
  with DMAbiturientOtchety.adoqExamStatistic do
  begin
    Close;
    SQL[2]:='';
    SQL[3]:='';

    SQL[1]:='('+IntToStr(year)+',';
    if OnlyZachisl then
      SQL[1]:=SQL[1]+'1)'
    else
      SQL[1]:=SQL[1]+'0)';

    //���������
    if ik_fac>0 then
      SQL[2]:='where (ik_fac =' + inttostr(ik_fac)+')';

    //�������������
    if ik_spec_fac>0 then
      SQL[2]:='where (ik_spec_fac =' + inttostr(ik_spec_fac)+')';

    Open;
  end;

end;

end.







