{*
    ����� - ����� ������ ��������������� ������ �� ���������� � Excel
    ������: 1.0.0.1
    �������: 22.07.2009
    ��������� ������: 
    �����: ������� �.�.
*}
unit AbitPredvSpisokZachisl;
  {#Author tanyav@ist.ugtu.net}
interface
uses
  Classes, SysUtils, ExcelXP, Barcode, Contnrs, ReportsBase, DB, ADODB,
    DBTVObj, DBTVStudObj, DBTVGroupObj, ComCtrls, StdCtrls, ApplicationController,
    Variants, uDMAbiturientOtchety;

type
   TAbitPredvSpisokZachislReport = class(TExcelReportBase)
  private
    FNNyear: integer;
    FikFac: variant;
    FikSpecFac: variant;
  protected
    procedure Execute;override;
    function GetTotalSteps: Integer; override;
  public
    property NNyear:integer read FNNyear write FNNyear;
    property ikFac:variant read FikFac write FikFac;
    property ikSpecFac:variant read FikSpecFac write FikSpecFac;

  end;

implementation


procedure TAbitPredvSpisokZachislReport.Execute;
const
  CopiingPageNumber = 1;   //����� ���������� �������� ������
  FirstRowNumber = 6;     //����� ������ ������, � ������� ���������� ������ ������������
  FirstColNumber = 1;     //����� ������ �������, � ������� ���������� ������ ������������
var
  SpecPageName: string;    //�������� �������� ������� ������������� (������������� � ���������)
  PageNumber:integer;        //����� ������� �������� Excel
  RowNumber: integer;  //����� ������� ������ Excel
  ColNumber: integer;   //����� �������� ������� Excel

  AbitListEnd: boolean;   //
begin
  inherited;
  NextStep(1,'�������� ������');
  //��������� ��������������� ������
  dmAbiturientOtchety.adospABITGetPredvSpisok.ProcedureName:= 'ABIT_GetPredvSpisok;1';
  dmAbiturientOtchety.adospABITGetPredvSpisok.Close;
  with dmAbiturientOtchety.adospABITGetPredvSpisok.Parameters do
  begin
    Clear;
    CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 4, NULL);
    CreateParameter('@NNyear', ftInteger, pdInput, 4, NNyear);
    CreateParameter('@ik_fac', ftInteger, pdInput, 4, ikFac);
    CreateParameter('@ik_spec_fac', ftInteger, pdInput, 4, ikSpecFac);

  end;
  dmAbiturientOtchety.adospABITGetPredvSpisok.Open;

  NextStep(GetTotalSteps div 2,'������ �������� ������ � MS Excel');
  SpecPageName:= '';
  PageNumber:= CopiingPageNumber;
  dmAbiturientOtchety.adospABITGetPredvSpisok.First;
  AbitListEnd:= false;
  DisplayAlerts:= false;
  while not AbitListEnd do
  begin
    with dmAbiturientOtchety.adospABITGetPredvSpisok do
    begin     //FieldByName('').AsString
      if dmAbiturientOtchety.adospABITGetPredvSpisok.Eof then
      begin
        AbitListEnd:= true;
      end;

      if (SpecPageName<>FieldByName('SpecPageName').AsString) or (AbitListEnd) then
      begin
        if SpecPageName<>'' then
        begin
          Range['A'+IntToStr(FirstRowNumber),'E'+inttostr(RowNumber-1)].Borders.Weight:=2;
          PageName:= SpecPageName;

          if AbitListEnd then
          begin
            DeletePage(CopiingPageNumber);
            continue;
          end;
          NextStep(GetTotalSteps div (2*100),'�������� ������ � MS Excel');
        end;

        //�������� ��������
        self.DuplicatePage(CopiingPageNumber, PageNumber);
        //FieldByName('').AsString

        SpecPageName:= FieldByName('SpecPageName').AsString;
        RowNumber:= FirstRowNumber;
        inc(PageNumber);

        ActivateWorksheet(PageNumber);
        Replace('#fac#', FieldByName('Cname_fac').AsString);
        Replace('#spec#', FieldByName('Cname_spec').AsString);
        Replace('#buj#', FieldByName('MestBudjet').AsString);
        if FieldByName('MestCKP').AsInteger>0 then
          Replace('#zkp#', ', � ��� ����� ��� - '+FieldByName('MestCKP').AsString)
        else
          Replace('#zkp#', '');
      end;

      ColNumber:= FirstColNumber;
      Items[RowNumber, ColNumber] := IntToStr(RowNumber-FirstRowNumber+1);
      inc(ColNumber);
      Items[RowNumber, ColNumber] := FieldByName('Cname_kat_zach').AsString;
      inc(ColNumber);
      Items[RowNumber, ColNumber] := FieldByName('AbitName').AsString;
      inc(ColNumber);
      Items[RowNumber, ColNumber] := FieldByName('SumBall').AsString;
      inc(ColNumber);

      {if FieldByName('IsMain').AsBoolean then
        Items[RowNumber, ColNumber] := '��'
      else
        Items[RowNumber, ColNumber] := '���';
      inc(ColNumber); }

      if FieldByName('Realy_postup').AsBoolean then
        Items[RowNumber, ColNumber] := '��������'
      else
        Items[RowNumber, ColNumber] := '�����';

      inc(RowNumber);
      Next;
    end;
  end;


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

function TAbitPredvSpisokZachislReport.GetTotalSteps: Integer;
begin
  result:=10000;
end;

end.
