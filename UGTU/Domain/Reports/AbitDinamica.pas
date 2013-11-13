{*
    ����� - ����� ������ ��������������� ������ �� ���������� � Excel
    ������: 1.0.0.1
    �������: 28.07.2009
    ��������� ������:
    �����: ������� �.�.
*}
unit AbitDinamica;
  {#Author tanyav@ist.ugtu.net}

interface
uses
  Classes, SysUtils, ExcelXP, Barcode, Contnrs, ReportsBase, DB, ADODB,
    DBTVObj, DBTVStudObj, DBTVGroupObj, ComCtrls, StdCtrls, ApplicationController,
    Variants, uDMAbiturientOtchety, ExceptionBase;

type
  //TReportCondition = (allOchn=1,allZaochn,realOchn,realZaochn, ReportEnd);

   TAbitDinamicaReport = class(TExcelReportBase)
  private
    FNNyear: integer;
    FikFac: integer;
    FikSpecFac: integer;
    FDate: TDateTime;
    function  GetIncStepsCount(PageNumber: integer): integer;
    function  GetPageNumber: integer;
  protected
    procedure Execute;override;
    function GetTotalSteps: Integer; override;
    procedure ExportPage;
  public
    property NNyear:integer read FNNyear write FNNyear;
    property ikFac:integer read FikFac write FikFac;
    property ikSpecFac:integer read FikSpecFac write FikSpecFac;
    property Date:TDateTime read FDate write FDate;

  end;

implementation

var reportDataSet: TADOStoredProc;   //�������� ������

procedure TAbitDinamicaReport.ExportPage;
const
  FirstRowNumber = 3;     //����� ������ ������, � ������� ���������� ������
  FirstColNumber = 1;     //����� ������ �������, � ������� ���������� ������
var
  RowNumber: integer;  //����� ������� ������ Excel
  ColNumber: integer;   //����� �������� ������� Excel
  idFormEd: integer;     //������� ����� ��������
  Realy_postup: integer;  //������� ������� ����������������
  bujCount, zcpCount, kontrCount: integer;   //���-��
  bujDiffCount, zcpDiffCount, kontrDiffCount: string;    //��������
  tempStr: string;
begin
  Replace('#date#', DateToStr(FDate));

  with reportDataSet do
  begin   //FieldByName('').AsString

    RowNumber:= FirstRowNumber;
    idFormEd:=FieldByName('Ik_form_ed').AsInteger;
    Realy_postup:= FieldByName('Realy_postup').AsInteger;

    while (idFormEd=FieldByName('Ik_form_ed').AsInteger)
        and (Realy_postup = FieldByName('Realy_postup').AsInteger)
        and (not Eof) do
    begin
      ColNumber:= FirstColNumber;

      bujCount:= FieldByName('AbitCount').AsInteger;
      bujDiffCount:= FieldByName('YesterdayDifference').AsString;
      Next;
      zcpCount:= FieldByName('AbitCount').AsInteger;
      zcpDiffCount:= FieldByName('YesterdayDifference').AsString;
      Next;
      kontrCount:= FieldByName('AbitCount').AsInteger;
      kontrDiffCount:= FieldByName('YesterdayDifference').AsString;

      if (bujCount<>0) or (zcpCount<>0) or (kontrCount<>0) then
      begin
			  Items[RowNumber, ColNumber] := FieldByName('Cshort_spec').AsString;
			  inc(ColNumber);
        tempStr:= IntToStr(bujCount); //bujDiffCount+' '+
			  if idFormEd<>2 then  //��� ��������� ��� ���
          tempStr:= tempStr+' + '+IntToStr(zcpCount);       //+' '+zcpDiffCount
        Items[RowNumber, ColNumber]:=tempStr;
			  inc(ColNumber);
			  Items[RowNumber, ColNumber] := IntToStr(kontrCount);
			  inc(ColNumber);
			  Items[RowNumber, ColNumber] := IntToStr(bujCount+zcpCount+kontrCount);

        inc(RowNumber);
      end;
      

      Next;
    end;
    Range['A'+IntToStr(FirstRowNumber),'D'+inttostr(RowNumber-1)].Borders.Weight:=2;
  end;


end;

//���������� ���-�� �����, ������� ����� "���������"
function  TAbitDinamicaReport.GetIncStepsCount(PageNumber: integer): integer;
begin
  result:= ((GetTotalSteps div 2)+(GetTotalSteps div 8)*(PageNumber-1))   //������� ������ ����
        -CurrentStep;      //- ������� ����
end;

//��������� ����� ��������� ��������
function TAbitDinamicaReport.GetPageNumber: integer;
begin
  with reportDataSet do
    result:= FieldByName('Realy_postup').AsInteger*2+FieldByName('Ik_form_ed').AsInteger;
end;

procedure TAbitDinamicaReport.Execute;
var PageNumber: integer;
    ReportCondition: string;  //������������ ��� ������ ����
    ReportStepNumber: integer;   //��� ������
    DeletePageNumber: integer;
    DeletedPageCount: integer;  //���-�� ��������� �������
begin
  inherited;
  DisplayAlerts:= false;
  NextStep(1,'�������� ������');
  //��������� ��������������� ������
  reportDataSet:= dmAbiturientOtchety.adospAbitGetDinamika;
  reportDataSet.ProcedureName:= 'Abit_GetDinamika;1';
  reportDataSet.Close;
  with reportDataSet.Parameters do
  begin
    Clear;
    CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 4, NULL);
    CreateParameter('@NNyear', ftInteger, pdInput, 4, NNyear);
    CreateParameter('@ik_fac', ftInteger, pdInput, 4, ikFac);
    CreateParameter('@ik_spec_fac', ftInteger, pdInput, 4, ikSpecFac);

  end;
  reportDataSet.Open;
  
  with reportDataSet do
  begin
    First;
    ReportStepNumber:= 1;
    DeletedPageCount:= 0;

    while PageNumber<>5 do
    begin
      if Eof then
        PageNumber:= 5
      else
      begin
      	PageNumber:= GetPageNumber;
				ActivateWorksheet(PageNumber-DeletedPageCount);
				case PageNumber of
				  1:
			    ReportCondition:= '�������� � MS Excel �������';
				  2:
					ReportCondition:= '�������� � MS Excel ���������';
				  3:
					ReportCondition:= '�������� � MS Excel ������� (���������)';
				  4:
					ReportCondition:= '�������� � MS Excel ��������� (���������)';
				end;

		    NextStep(GetIncStepsCount(PageNumber),ReportCondition);

				ExportPage;
      end;

      //������� �������������� ��������
      for DeletePageNumber:=ReportStepNumber to PageNumber-1 do
      begin
        DeletePage(DeletePageNumber-DeletedPageCount);
        inc(DeletedPageCount);
      end;
      
      ReportStepNumber:= PageNumber+1;
    end;
  end;

  {for DeletePageNumber:=ReportStepNumber to 4 do
    DeletePage(DeletePageNumber-DeletedPageCount);     }

  //CurrentStep
  NextStep(GetTotalSteps - CurrentStep,'���������� ������������ ������.');

  ActivateWorksheet(1);
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

function TAbitDinamicaReport.GetTotalSteps: Integer;
begin
  result:=10000;
end;

end.
