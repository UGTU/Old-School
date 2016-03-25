unit uAbitOtchetsController;
 {#Author tanyav@ist.ugtu.net}
interface
uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, ADODB, DB, uDM,
  Forms, Dialogs, DBLookupEh, Variants, StdCtrls, GeneralController, Grids,
  ExcelXP, ComObj, DBGrids, uDMAbiturientRasp, udmUgtuStructure,
  DBGridEh,WordXP, udmAbiturientOtchety, DateUtils,
  uAbitZachislenieController, udmAbiturientAction, udmStudentSelectionProcs,
  ApplicationController, uDMAbiturientNabor, ExceptionBase,
  AbitVstupExamStatistic, ReportsBase, uWaitingController, ConstantRepository,
  AbitEnrollAgreement, ABIT_zhurnal;

type
  PDBGrid = ^TDBGridEh;
  TAbitOtchetsController = class (TObject)
  protected
    constructor CreateInstance;
 //AccessInstance ������������� ������ � ���������� �����������
    class function AccessInstance(Request: Integer):
       TAbitOtchetsController;

  public

    constructor Create;
  //Instance - ���������� �������� ������� �����������
    class function Instance: TAbitOtchetsController;
  //ReleaseInstance - ���������� ����������
    class procedure ReleaseInstance;

  //*********��� ����������*********
  //*************����� ���*******************
  //ExpSpisForEGEToExc ������������ ������ ��� ��� � Excel
  procedure ExpSpisForEGEToExc(year: integer);

  //********������ �� ������**********
  procedure MoveRight(WordAppl: TWordApplication;dir, count, extend: OleVariant);
  //ExportNaborWord ������������ ������ ������� � Word
  procedure ExportNaborWord(DataSet:TDataSet);
  //StatToExcel ������������ ���������� �� ������ � Excel
  procedure StatToExcel;
  //ExamsStatToExcel ������������ ���������� �� ����� ��������� � Excel
  procedure ExamsStatToExcel(year: integer; ik_fac, ik_spec_fac: Variant; OnlyZachisl: boolean);

  //********************������ �� ���������� ������������� ���������************************
  //ExpExamSpisAbitsToExc ��������� ������ ������������ �� ������� � Excel
  procedure ExpExamSpisAbitsToExc;
  //ExpExamVedsToExc ��������� ��������������� ���������  ���. �������� � Excel (��� ������ ������������� ����)
  procedure ExpExamVedsToExc;
  //ExpExamResultsToExc ��������� ���������� �������� � Excel
  procedure ExpExamResultsToExc;

  //**********����� ����� (�������)**************
  //PrintObColvo ���������������
  procedure PrintObColvo(E:Variant;var i:integer);
  //ExportAbitToZhurnal ������� ���� ������ � ������ (1 �����������)
  procedure ExportAbitToZhurnal(E:Variant;var i:integer);
  //OpenAllStat ��������� ��� ��������� � ������� ��� �������
  function OpenAllStat(year,ik_spec_fac,dd_pod_zayav:Variant):boolean;
  //ExportAllStatToExcel ������� ����� (��� ���������� �� ���) � Excel
  function ExportAllStatToExcel(year:integer; filter:string):boolean;
  //PrintMag ��������������� ������� �������
  procedure PrintMag(ik_spec_fac:integer; E:Variant; ZhDate:string);
  //ExportDaysMagToExcel ������� ������� �� 1 ���� � �� ������������ �������������
  function ExportDaysMagToExcel(ik_spec_fac:Variant; zurDate:TDateTime): boolean;
  //SetSizes ������ ������� ����� ����� ��� �������
  //��������� ���� Excel
  procedure SetSizes(sh:Variant);
  //ExportAllZhurnals ������� ���� ��������� ��������
  function ExportAllZhurnals(zurDate:TDateTime): boolean;
  //ExportItogiPostupl ������� ������ ����������� (������)
  procedure ExportItogiPostupl(year:variant);
  //OpenDataForItogi ��������� ��� ��������� � ������� ��� ������ ������
  function OpenDataForItogi:boolean;
  //GetAbitListForItogi ��������� ������ ������������ ��� ������ ������
  function GetAbitListForItogi(year,ik_spec_fac:Variant):boolean;
  //PrintItogiPost ��������������� ������ ������ �� 1 �������������
  procedure PrintItogiPost(ik_spec_fac:integer; E:Variant);
  //SetItogiSizes
  procedure SetItogiSizes(sh, sh1:Variant);
  //ExportItogiPostuplForSpec ������� ������ ����������� (������)  ��� �������������
  procedure ExportItogiPostuplForSpec(year, ik_spec_fac:variant);

  //ExportAbitListForDopSpecToExcel ������� ������ ������������ �� �������������� ������������� � Excel
  procedure ExportAbitListForDopSpecToExcel(nnyear:integer );
  //OpenAbitListForDopSpec ��������� ������ ������������ ��� ���. �������������
  function OpenAbitListForDopSpec(nnyear:integer):TADOStoredProc;

  //****************������� ��������� � Excel*******************
  //��������� ������ ������������ ��� ���. �������������
  procedure ExportZayavl(NN_abit:integer);
  //������������ ������ � ���������
  procedure FillTheZayavl(E:OleVariant);

  //�������� ������ ��� �������� ��������� �� �������� ��������
  function GetAbitDataForGazpromZayavl(NNAbit:integer):TADOStoredProc;
  //������� ��������� �� �������� � �������
  procedure GazpromBankStatementToWord(NNAbit: integer);
  //������� ������ �� ���������������� ����������
  procedure ExportPredvSpisok(NNyear:integer);

  //������� �������� �� ����������
  procedure ExportEnrollAgreement(NN_abit:integer);

  // ExportProtokolToExcel ������� ��������� � ������������ � Excel
    procedure ExportProtokolToExcel(year: integer);
end;

implementation
var
//FAbitRaspisanieControllerInstance - ��������� �����������
  FAbitOtchetsControllerInstance: TAbitOtchetsController = nil;
constructor TAbitOtchetsController.CreateInstance;
begin
  inherited Create;
end;


constructor TAbitOtchetsController.Create;
begin
  inherited Create;
  raise EApplicationException.CreateFmt('������ � ������ %s ����� �������� ������ ����� ���� Instance!', [ClassName]);
end;


class function TAbitOtchetsController.AccessInstance(
  Request: Integer): TAbitOtchetsController;
begin
  case Request of
    0 : ;
    1 : if not Assigned(FAbitOtchetsControllerInstance) then
      FAbitOtchetsControllerInstance:= CreateInstance;
    2 : if FAbitOtchetsControllerInstance <> nil then
          begin
            FAbitOtchetsControllerInstance.Free;
            FAbitOtchetsControllerInstance:= nil;
          end;
    else raise EApplicationException.Create('������ � ���������!',Exception.CreateFmt('����������� �������� ��������� %d � ������ AccessInstance ����������� TAbitOtchetsController', [Request]));
  end;  Result := FAbitOtchetsControllerInstance;
end;


class function TAbitOtchetsController.Instance: TAbitOtchetsController;
begin
  Result := AccessInstance(1);
end;

class procedure TAbitOtchetsController.ReleaseInstance;
begin
   AccessInstance(2);
end;

//*********��� ����������*********

//*************����� ���*******************
//ExpSpisForEGEToExc ������������ ������ ��� ��� � Excel
procedure TAbitOtchetsController.ExpSpisForEGEToExc(year: integer);
var i,j:integer;
      E:Variant;
      formula:string;
begin
	  dm.adotEgeOtchet.Close;
	  dm.adotEgeOtchet.Open;
    dm.adotEgeOtchet.Filter:= 'NNyear='+IntToStr(year);
    dm.adotEgeOtchet.Filtered:= true;

  E := CreateOleObject('Excel.Application');
  try
	  try
		  E.WorkBooks.Add;
		  E.DisplayAlerts:= false;
		  E.Visible := false;
		  E.Sheets[1].Select;
		  //�����
		  i:=1; //�������u
		  j:=1;
		  E.cells[i,j]:='�������';   inc(j);
		  E.cells[i,j]:='���'; inc(j);
		  E.cells[i,j]:='��������'; inc(j);
		  E.cells[i,j]:='����� ���������'; inc(j);
		  E.cells[i,j]:='����� ���������'; inc(j);
		  E.cells[i,j]:='��� ��������� (� ������������ �� ������������)'; inc(j);
		  E.cells[i,j]:='��� (�/�)'; inc(j);
		  E.cells[i,j]:='���'; inc(j);
		  E.cells[i,j]:='���'; inc(j);
		  E.cells[i,j]:='���'; inc(j);
		  E.cells[i,j]:='���'; inc(j);
		  E.cells[i,j]:='���'; inc(j);
		  E.cells[i,j]:='���'; inc(j);
		  E.cells[i,j]:='���'; inc(j);
		  E.cells[i,j]:='���'; inc(j);
		  E.cells[i,j]:='���'; inc(j);
		  E.cells[i,j]:='���� ��������'; inc(j);
		  E.cells[i,j]:='����� ��������� �� �����������';

		  E.Range['A1'].ColumnWidth:=12;
		  E.Range['B2'].ColumnWidth:=10;
		  E.Range['C3'].ColumnWidth:=13;
		  E.Range['D4'].ColumnWidth:=8.6;
		  E.Range['E5'].ColumnWidth:=9;
		  E.Range['F6'].ColumnWidth:=12.4;
		  E.Range['G7'].ColumnWidth:=4.8;
		  E.Range['H8:P8'].ColumnWidth:=4;
		  E.Range['Q9'].ColumnWidth:=9.5;
		  E.Range['R10'].ColumnWidth:=12.5;
		  E.Range['O11'].ColumnWidth:=4.5;
		  E.Range['A1'].RowHeight:=64;
		  E.range['A1:R1'].HorizontalAlignment:=-4108;
		  E.range['A1:R1'].VerticalAlignment:=-4108;

		  //����� ������
		  dm.adotEgeOtchet.First;
		  while not dm.adotEgeOtchet.Eof do
		  begin
			j:=1;
			inc(i);
			E.cells[i,j]:=dm.adotEgeOtchetClastname.AsString; inc(j);
			E.cells[i,j]:=dm.adotEgeOtchetCfirstname.AsString; inc(j);
			E.cells[i,j]:=dm.adotEgeOtchetCotch.AsString; inc(j);
			E.cells[i,j]:=dm.adotEgeOtchetCd_seria.AsString; inc(j);
			E.cells[i,j]:=dm.adotEgeOtchetNp_number.AsString; inc(j);
			E.cells[i,j]:=1; inc(j);
			if  dm.adotEgeOtchetlSex.Value then
				E.cells[i,j]:='�'
			else E.cells[i,j]:='�';  inc(j);
			E.cells[i,j]:=dm.adotEgeOtchetRuss.AsString; inc(j);
			E.cells[i,j]:=dm.adotEgeOtchetMath.AsString; inc(j);
			E.cells[i,j]:=dm.adotEgeOtchetPhis.AsString; inc(j);
			E.cells[i,j]:=dm.adotEgeOtchetChem.AsString; inc(j);
			E.cells[i,j]:=dm.adotEgeOtchetBiol.AsString; inc(j);
			E.cells[i,j]:=dm.adotEgeOtchetHist.AsString; inc(j);
			E.cells[i,j]:=dm.adotEgeOtchetGeog.AsString; inc(j);
			E.cells[i,j]:=dm.adotEgeOtchetObch.AsString; inc(j);
			E.cells[i,j]:=dm.adotEgeOtchetLitr.AsString; inc(j);
			E.cells[i,j]:=dm.adotEgeOtchetDd_birth.AsString; inc(j);
			E.cells[i,j]:=dm.adotEgeOtchetcAttest.AsString;

			dm.adotEgeOtchet.Next;
		  end;
		  E.StandardFontSize:=9;
		  E.ActiveSheet.PageSetup.Orientation:=2; //��������� ����������

		 //������� �����
		 if i>2 then
			formula:='=H2';
		 for j := 3 to i do
			 formula:=formula+'+H'+IntToStr(j);
		 inc(i);
		 E.range['H'+inttostr(i)+':P'+inttostr(i)].formula:=formula;
		 E.cells[i,1]:= '  �����';
		 E.range['A'+inttostr(i)+':Z'+inttostr(i)].font.Bold:=true;
		  E.range['F2:Q'+IntToStr(i)].HorizontalAlignment:=-4108;
		  E.Range['A1:R'+IntToStr(i)].Borders.Weight:=2;
		  E.Range['A1:R'+IntToStr(i)].WrapText:=true;
		  E.Visible := true;
		  E.DisplayAlerts:= true;
    except
      on Ex:Exception do
      begin
        E.Quit;
        raise EApplicationException.Create('������ ��� �������� � Excel',Ex);
      end;
    end;

  finally
		E:= UnAssigned;
  end;
end;

//********������ �� ������**********
procedure TAbitOtchetsController.MoveRight(WordAppl: TWordApplication;dir, count, extend: OleVariant);
begin
  WordAppl.Selection.MoveRight(dir,count,extend);
end;

//������������ ������ ������� � Word
procedure TAbitOtchetsController.ExportNaborWord(DataSet:TDataSet);
var j:integer;
    Doc:_document;
    Tab:Table;
    WordApplication1: TWordApplication;
begin
  TApplicationController.GetInstance.AddLogEntry('������. ������� � Word ������ �������.');

  DataSet.DisableControls;
  try
		WordApplication1:= TWordApplication.Create(nil);
		try
			try
			  WordApplication1.Connect;
			  doc:=WordApplication1.Documents.Add(EmptyParam,EmptyParam,EmptyParam,EmptyParam);
			  WordApplication1.Visible:=false;
			  Doc.Tables.Add(Doc.Range(EmptyParam,EmptyParam),DataSet.RecordCount-2,5,EmptyParam,EmptyParam);
			  Tab:=Doc.Tables.Item(1);
			  WordApplication1.Selection.TypeText('���������');
			  MoveRight(WordApplication1,wdCell,1,0);
			  WordApplication1.Selection.TypeText('�������������');
			  MoveRight(WordApplication1,wdCell,1,0);
		 	  WordApplication1.Selection.TypeText('������ (���� /����/ ���������)');
			  MoveRight(WordApplication1,wdCell,1,0);
		 	  WordApplication1.Selection.TypeText('��� (���� /����/ ���������)');
			  MoveRight(WordApplication1,wdCell,1,0);
		 	  WordApplication1.Selection.TypeText('�������� (���� /����/ ���������)');
			 //MoveRight(WordApplication1,wdCell,1,0);

			  DataSet.First;
			  while not DataSet.Eof do
			  begin
				 for j:=3 to 7 do
				 begin
					 MoveRight(WordApplication1,wdCell,1,0);
				   WordApplication1.Selection.TypeText(DataSet.Fields[j].AsString);
				 end;
				 DataSet.Next;
			  end;
			  DataSet.EnableControls;
			  WordApplication1.Visible:=true;
			 //WordApplication1.Disconnect;
		  except
        on Ex:Exception do
        begin
          WordApplication1.Quit;
          raise EApplicationException.Create('������ ��� �������� � MS Word',Ex);
        end;
			 //WordApplication1.Disconnect;
		  end;
	  finally
		 WordApplication1.Free;
	  end;
   finally
		 DataSet.EnableControls;
   end;
end;

//������������ ���������� �� ������ � Excel
procedure TAbitOtchetsController.StatToExcel;
var
WorkBk : _WorkBook; //  ���������� WorkBook
WorkSheet : _WorkSheet; //  ���������� WorkSheet
I, J, R, C : Integer;
realCount: integer;    //���-�� �������������� ���������
mainCount: integer;    //���-�� ��������� ���������
abitCount: array [1..3] of integer;  //������ ���-�� ��������� �� ���������� ����������
TabGrid : Variant;
XLApp: TExcelApplication;
begin
  TApplicationController.GetInstance.AddLogEntry('������� ������ ������ ������������ � Excel');
  with DMAbiturientNabor.adospAbitGetPostupStatistika do
  begin
    Active:=true;
    DisableControls;
    try
      R :=RecordCount+2;
      C :=12;
      TabGrid := VarArrayCreate([0,(R-1),0,(C - 1)],VarOleStr);

      TabGrid[0,0]:='��������������� �����';
      TabGrid[0,1]:='���';
      TabGrid[0,2]:='���� ������ ���������';
      TabGrid[0,3]:='���������';
      TabGrid[0,4]:='�������������';
      TabGrid[0,5]:='��������� ����������';
      TabGrid[0,6]:='������';
      TabGrid[0,7]:='��������� �����������';
      TabGrid[0,8]:='����� ������';
      TabGrid[0,9]:='������� ����';
      TabGrid[0,10]:='��������� ��������';
      TabGrid[0,11]:='��������� �������������';

      for I := 1 to 3 do
        abitCount[i]:=0;
      realCount:= 0;
      mainCount:= 0;
      First;
      for i:=1 to r-2 do
      begin
        j:= 0;
        TabGrid[i,j]:=FieldByName('RegNomer').AsString; inc(j);
        TabGrid[i,j]:=FieldByName('fio').AsString; inc(j);
        TabGrid[i,j]:=FieldByName('dd_pod_zayav').AsString; inc(j);
        TabGrid[i,j]:=FieldByName('Cshort_name_fac').AsString; inc(j);
        TabGrid[i,j]:=FieldByName('cname_spec').AsString; inc(j);
        TabGrid[i,j]:=FieldByName('zach').AsString; inc(j);
        TabGrid[i,j]:=FieldByName('cmedal').AsString; inc(j);
        TabGrid[i,j]:=FieldByName('post').AsString; inc(j);
        TabGrid[i,j]:=FieldByName('sum_ball').AsString; inc(j);
        TabGrid[i,j]:=FieldByName('sredBall').AsString; inc(j);
        if FieldByName('IsMain').AsBoolean then
        begin
           TabGrid[i,j]:='��';
           if FieldByName('ik_type_zach').AsInteger<>3 then
              inc(mainCount);
        end
        else
           TabGrid[i,j]:='���';

        inc(j);
        if FieldByName('Realy_postup').AsBoolean then
        begin
           TabGrid[i,j]:='��';
           if FieldByName('ik_type_zach').AsInteger<>3 then
              inc(realCount);
        end
        else
           TabGrid[i,j]:='���';

        if (FieldByName('ik_type_zach').AsInteger>0)
          and (FieldByName('ik_type_zach').AsInteger<length(abitCount)) then
           inc(abitCount[FieldByName('ik_type_zach').AsInteger]);

        Next;
      end;

      //����� �������� ������ �� ������
      TabGrid[r-1,1]:= '�����: '+IntToStr(abitCount[1])+' ������� ���������, '
        +IntToStr(abitCount[2])+' ���������, �� ��� ��������� '
        +IntToStr(mainCount)
        +', �������������� '+IntToStr(realCount)+' ���������, '+IntToStr(abitCount[3])+
        ' ������� ���������';
    finally
      EnableControls;
    end;
  end;

  XLApp:= TExcelApplication.Create(nil);
  try
    try
			 XLApp.Connect; // ����������� � �������� TExcelApplication
			 XLApp.WorkBooks.Add(xlWBatWorkSheet,0);  // ��������� WorkBooks � ExcelApplication
			 WorkBk := XLApp.WorkBooks.Item[XLApp.WorkBooks.Count];  // �������� ��������� (�����������) WorkBook
			 WorkSheet := WorkBk.WorkSheets.Get_Item(1) as _WorkSheet; // ���������� ������ WorkSheet

			 Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Formula := TabGrid; // ������������ Delphi ������-������� � �������� � WorkSheet

			 WorkSheet.Name := '�����'; // ��������� �������� WorkSheet
			 WorkSheet.Columns.AutoFit;
			 Worksheet.Range[Worksheet.Cells.Item[R,1],Worksheet.Cells.Item[R,C]].Font.Bold:=true;
			 Worksheet.Range[Worksheet.Cells.Item[R,1],Worksheet.Cells.Item[R,C]].Font.Italic:=true;

			 //������� ������ ������� ������ � �������
			 Worksheet.Range['A1',Worksheet.Cells.Item[1,C]].Interior.ColorIndex:=15;
			 Worksheet.Range['A1',Worksheet.Cells.Item[1,C]].Interior.Pattern:=xlSolid;
			 Worksheet.Range['A1',Worksheet.Cells.Item[1,C]].Interior.PatternColorIndex:=xlAutomatic;

			 Worksheet.Range['A1',Worksheet.Cells.Item[R,1]].Interior.ColorIndex:=15;
			 Worksheet.Range['A1',Worksheet.Cells.Item[R,1]].Interior.Pattern:=xlSolid;
			 Worksheet.Range['A1',Worksheet.Cells.Item[R,1]].Interior.PatternColorIndex:=xlAutomatic;

			 //���������� ���������� � ������� ������� ���������
			 Worksheet.Range['A1',Worksheet.Cells.Item[R,1]].Borders[xlDiagonalDown].LineStyle:=xlNone;
			 Worksheet.Range['A1',Worksheet.Cells.Item[R,1]].Borders[xlDiagonalUp].LineStyle:=xlNone;

			 Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlEdgeLeft].LineStyle:=xlContinuous;
			 Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlEdgeLeft].Weight:=xlThin;
			 Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlEdgeLeft].ColorIndex:=xlAutomatic;

			 Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlEdgeTop].LineStyle:=xlContinuous;
			 Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlEdgeTop].Weight:=xlThin;
			 Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlEdgeTop].ColorIndex:=xlAutomatic;

			 Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlEdgeBottom].LineStyle:=xlContinuous;
			 Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlEdgeBottom].Weight:=xlThin;
			 Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlEdgeBottom].ColorIndex:=xlAutomatic;

			 Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlEdgeRight].LineStyle:=xlContinuous;
			 Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlEdgeRight].Weight:=xlThin;
			 Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlEdgeRight].ColorIndex:=xlAutomatic;

			 Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlInsideVertical].LineStyle:=xlContinuous;
			 Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlInsideVertical].Weight:=xlThin;
			 Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlInsideVertical].ColorIndex:=xlAutomatic;

			 Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlInsideHorizontal].LineStyle:=xlContinuous;
			 Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlInsideHorizontal].Weight:=xlThin;
			 Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlInsideHorizontal].ColorIndex:=xlAutomatic;

			 XLApp.Visible[0] := True; // ���������� Excel
    except
      on Ex:Exception do
      begin
        XLApp.Quit;
        raise EApplicationException.Create('������ ��� �������� � Excel',Ex);
      end;
    end;

  finally
    //XLApp.Free;
  end;
    //XLApp.Disconnect; // ��������� ����� � ��������
    TabGrid := Unassigned; // Unassign the Delphi Variant Matrix
end;



//***************������ �� ���������� ������������� ���������*******************

//ExpExamSpisAbitsToExc ��������� ������ ������������ �� ������� � Excel
procedure TAbitOtchetsController.ExpExamSpisAbitsToExc;
const EndCopyRowNumber = 4; //����� ������ �� ������� ����������
    firstPageNumber = 1;    //����� ������ �������� ������
var i, k, id, cell, maxi, AbitCount:integer;
      E: Variant;
      Room:string;
      CurrentPage: integer;   //����� ������� ��������
      ReportTemplateName: string;   //�������� ����� �������
begin
  TApplicationController.GetInstance.AddLogEntry('������� ������ ������������ ������������.');

  E := CreateOleObject('Excel.Application');
  try
   try
    E.Visible := false;
    ReportTemplateName := ExtractFilePath(Application.ExeName)+'reports\AbitVstupExamSpisok.XLT';
    E.WorkBooks.Add(ReportTemplateName);
    E.DisplayAlerts:= false;

    //E.ActiveWindow.View:=xlPageBreakPreview;
    CurrentPage:= firstPageNumber;
    E.Sheets[CurrentPage].Select;
    {E.range['A1:A4'].ColumnWidth:=5;
    E.range['B1:B4'].ColumnWidth:=37;
    E.range['C1:C4'].ColumnWidth:=5;
    E.range['D1:D4'].ColumnWidth:=37;  
    for i:=1 to 2 do
      E.range['A'+inttostr(i)+':D'+inttostr(i)].Merge(true);
    E.Range['A1:D3'].Font.Bold:=true;
    E.Range['A1:D3'].Font.Size:=12;
    E.Range['A1:D2'].RowHeight:=25;
    E.range['A1:D3'].HorizontalAlignment:=-4108;}
    // ����� �����
    E.Cells[1,1]:='������� �� '+DMAbiturientRasp.adospGetRaspdisc.AsString;
    E.Cells[2,1]:=DMAbiturientRasp.adospGetRaspdate_of.AsString +' ������ '+ Copy(TimeToStr(DMAbiturientRasp.adospGetRaspTimeBegin.AsDateTime),1,length(TimeToStr(DMAbiturientRasp.adospGetRaspTimeBegin.AsDateTime))-3);
    // ����� ������
  //��������� ���. ������ ������������
    DMAbiturientRasp.adoqHelp.Close;
    DMAbiturientRasp.adoqHelp.SQL.Text:=DMAbiturientRasp.adospAbitGetSpisok.SQL.Text;
    DMAbiturientRasp.adoqHelp.Open;
    DMAbiturientRasp.adoqHelp.Sort:='id_rasp_kab';
    DMAbiturientRasp.adoqHelp.First;
    Room:= '';
    i:=1;
    while not DMAbiturientRasp.adoqHelp.Eof do
    begin
    //���� ���������� ���������, ������� ��� � Excel
      if DMAbiturientRasp.adoqHelp.FieldByName('id_rasp_kab').AsString<>'' then
      begin
        //���� ��������� ������, �� ������� ������� �
        if Room<>DMAbiturientRasp.adoqHelp.FieldByName('Cname_room').AsString then
        begin

          if Room<>'' then
          begin
            E.Range['A'+intToStr(maxi-((AbitCount+1) div 2))+':D'+intToStr(maxi-1)].Borders.Weight:=2;
          end;

          //��������� ����� ��������
          E.sheets.Add(after:=E.sheets.item[CurrentPage]);
          inc(CurrentPage);

          E.Sheets[firstPageNumber].Range['A1:CE'+inttoStr(EndCopyRowNumber)].EntireColumn.Copy(EmptyParam); // �������� � ��
          E.Sheets[CurrentPage].Paste(E.Sheets.item[CurrentPage].Range['A1:CE'+inttoStr(EndCopyRowNumber), EmptyParam], EmptyParam);
          E.Sheets[firstPageNumber].Range['A1:CE'+inttoStr(EndCopyRowNumber)].EntireRow.Copy(EmptyParam); // �������� � ��
          E.Sheets[CurrentPage].Paste(E.Sheets.item[CurrentPage].Range['A1:CE'+inttoStr(EndCopyRowNumber), EmptyParam], EmptyParam);

          E.Sheets[CurrentPage].Select;


          Room:= DMAbiturientRasp.adoqHelp.FieldByName('Cname_room').AsString;
          //������� ���-�� ������������ � ������ ���������
          id:=DMAbiturientRasp.adoqHelpid_VstEx.Value;
          AbitCount:=0;
          while (Room=DMAbiturientRasp.adoqHelp.FieldByName('Cname_room').AsString) and (not DMAbiturientRasp.adoqHelp.Eof) do
          begin
            inc(AbitCount);
            DMAbiturientRasp.adoqHelp.Next;
          end;
          //������ ������� �� ������� � ������ � ���������
          DMAbiturientRasp.adoqHelp.Locate('id_VstEx',id,[loCaseInsensitive]);


          i:=EndCopyRowNumber;
          E.Cells[i,1]:='��������� '+Room;
          //E.Sheets[CurrentPage].name:=Room;
          {E.range['A'+inttoStr(i)+':D'+inttoStr(i)].Font.Size:=12;
          E.range['A'+inttoStr(i)+':D'+inttoStr(i)].HorizontalAlignment:=-4108;
          E.Range['A'+inttoStr(i)+':D'+inttoStr(i)].Font.Bold:=true;
          E.range['A'+inttostr(i)+':D'+inttostr(i)].Merge(true);
          E.Range['A'+inttoStr(i)+':D'+inttoStr(i)].RowHeight:=25; }
          maxi:=6;
          inc(i);
          k:=1;
        end;
        if (((AbitCount+1) div 2)>=k) and (cell<>1) then
          cell:=1
        else
          if (((AbitCount+1) div 2)<k) and (cell<>3) then
          begin
            cell:=3;
            if maxi<i then
              maxi:=i;
            id:=i-k+1;
            i:=id;
          end;
        E.Cells[i,cell]:=IntToStr(k);
        E.Cells[i,cell+1]:= DMAbiturientRasp.adoqHelp.FieldByName('StudName').AsString;
        inc(i);
        inc(k);
      end;
      DMAbiturientRasp.adoqHelp.Next;
    end;
    if Room<>'' then
      E.Range['A'+intToStr(maxi-((AbitCount+1) div 2))+':D'+intToStr(maxi-1)].Borders.Weight:=2;
    //E.Sheets[1].PageSetup.LeftFooter:='&5' + TApplicationController.GetInstance.DocumentFooter;
    E.Sheets.item[1].Delete;
    E.DisplayAlerts:= true;
    E.Visible := true;
   except
      on Ex:Exception do
      begin
        E.Quit;
        raise EApplicationException.Create('��������� ������ ��� �������� ������ � Excel',Ex);
      end;

   end;
  finally
    E:= UnAssigned;
  end;
end;

//��������� ��������������� ���������  ���. �������� � Excel (��� ������ ������������� ����)
procedure TAbitOtchetsController.ExpExamVedsToExc;
var i,k,m:integer;
      E,sh:Variant;
      spec:integer;
      str:string;
      Firstspec:integer;
      FindRange: Variant;
      count:integer; //���-�� ���������� (�������)
begin
  TApplicationController.GetInstance.AddLogEntry('������� ���������� � ���������.');

  //�������� ������
    dmUgtuStructure.adoqSpecFac.Open;
    dmUgtuStructure.adoqSpecFac.Filtered:=false;
    //��������� ���. ������ ������������
    DMAbiturientRasp.adoqHelp.Close;
    DMAbiturientRasp.adoqHelp.SQL.Text:=DMAbiturientRasp.adospAbitGetSpisok.SQL.Text;
    DMAbiturientRasp.adoqHelp.Open;
    DMAbiturientRasp.adoqHelp.Sort:='ik_spec_fac';  //��������� �� �������������
    DMAbiturientRasp.adoqHelp.First;

  E := CreateOleObject('Excel.Application');
  try
   try
    str := ExtractFilePath(Application.ExeName)+'reports\Vedomost.XLT';
    E.WorkBooks.Add(str);
    sh:=E.WorkBooks.item[1];
    E.Visible := false;
    E.DisplayAlerts:= false;
    E.Sheets[1].Select;

    //������ ������ ������������

    spec:= -1;   Firstspec:=-1;
    i:=12; m:=11; k:=1;
    count:= 2;
      while (i>0) do
      begin
        //������ ������ ���������� �������������
        if (((spec<>DMAbiturientRasp.adoqHelpik_spec_fac.Value) and
            (DMAbiturientRasp.adoqHelp.FieldByName('id_rasp_kab').AsString<>'')) or
             (DMAbiturientRasp.adoqHelp.Eof))  and (spec<>-1) then
        begin
          E.Range['A'+inttoStr(i-k)+':E'+inttoStr(i-1)].Borders.Weight:=2;
          dmUgtuStructure.adoqSpecFac.Locate('ik_spec_fac',spec,[loCaseInsensitive]);
          str := dmUgtuStructure.adoqSpecFacCname_spec.AsString;
          E.Cells[5,1]:='�������������  '+dmUgtuStructure.adoqSpecFacCname_spec.AsString;
          str := DMAbiturientRasp.adospGetRaspdate_of.AsString;
          E.Range['L1:M2'].Copy;
          E.Range['D'+inttoStr(i)+':E'+inttoStr(i+1)].Insert;
          E.Cells[1,10]:='';
          E.Range['L1:M2'].Delete;
          FindRange := E.Cells.Replace(What := '#������#',Replacement:=str);
          str :=DMAbiturientRasp.adospGetRaspdisc.AsString;
          FindRange := E.Cells.Replace(What := '#�������#',Replacement:=str);
          str := Copy(TimeToStr(DMAbiturientRasp.adospGetRaspTimeBegin.AsDateTime),1,length(TimeToStr(DMAbiturientRasp.adospGetRaspTimeBegin.AsDateTime))-3);
          FindRange := E.Cells.Replace(What := '#������#',Replacement:=str);
          str := Copy(TimeToStr(DMAbiturientRasp.adospGetRaspTimeEnd.AsDateTime),1,5);
          FindRange := E.Cells.Replace(What := '#�����#',Replacement:=str);
          str := Copy(DMAbiturientRasp.adospGetRaspdate_of.AsString,1,2);
          FindRange := E.Cells.Replace(What := '#����#',Replacement:=str);
          str := Copy(DMAbiturientRasp.adospGetRaspdate_of.AsString,4,2);
          str := GetMonthR(StrToInt(str));
          FindRange := E.Cells.Replace(What := '#�����#',Replacement:=str);
          str := Copy(DMAbiturientRasp.adospGetRaspdate_of.AsString,7,4);
          FindRange := E.Cells.Replace(What := '#���#',Replacement:=str);
          E.Range['A'+inttoStr(i-k)+':E'+inttoStr(i-1)].Borders.Weight:=2;
        end;
        if (DMAbiturientRasp.adoqHelp.Eof) then
        begin
          i:=-3;
          break;
        end;
        
    //���� ���������� ���������, ������� ��� � Excel
        if (DMAbiturientRasp.adoqHelp.FieldByName('id_rasp_kab').AsString<>'')  then
        begin
					//��������� ������������� - ��������� ����� ��������
          if (spec<>DMAbiturientRasp.adoqHelpik_spec_fac.Value)  then
          begin
						 //E.Sheets.item[count].Range['A1:CE'+inttoStr(50)].Insert;
              //E.Sheets[count-1].PageSetup.LeftFooter:='&5' + TApplicationController.GetInstance.DocumentFooter;
              E.sheets.Add(after:=E.sheets.item[count-1]);

              E.Sheets[1].Range['A1:CE'+inttoStr(50)].EntireColumn.Copy(EmptyParam); // �������� � ��
              E.Sheets[count].Paste(E.Sheets.item[count].Range['A1:CE'+inttoStr(50), EmptyParam], EmptyParam);
              E.Sheets[1].Range['A1:CE'+inttoStr(50)].EntireRow.Copy(EmptyParam); // �������� � ��
              E.Sheets[count].Paste(E.Sheets.item[count].Range['A1:CE'+inttoStr(50), EmptyParam], EmptyParam);

              E.Sheets[count].PageSetup.LeftMargin:=E.Sheets[1].PageSetup.LeftMargin;
              E.Sheets[count].PageSetup.RightMargin:=E.Sheets[1].PageSetup.RightMargin;
              E.Sheets[count].PageSetup.TopMargin:=E.Sheets[1].PageSetup.TopMargin;
              E.Sheets[count].PageSetup.BottomMargin:=E.Sheets[1].PageSetup.BottomMargin;
              E.Sheets[count].PageSetup.Orientation:=E.Sheets[1].PageSetup.Orientation;
              //E.Sheets.item[1].Range['A1:CE'+inttoStr(50)].Copy;
						  dmUgtuStructure.adoqSpecFac.Locate('ik_spec_fac',DMAbiturientRasp.adoqHelpik_spec_fac.Value,[loCaseInsensitive]);
						  str := dmUgtuStructure.adoqSpecFacCshort_spec.AsString+'('+
							dmUgtuStructure.adoqSpecFacCshort_name_fac.AsString+')';
              E.Sheets[count].name:=str;
              E.Sheets[count].Select;
						  str := dmUgtuStructure.adoqSpecFacCname_spec.AsString;
						  FindRange := E.Range['A'+inttoStr(i)+':E'+inttoStr(i+m)].Replace(What := '#����#',Replacement:=str);
						  E.Range['A'+inttoStr(i+m-1)+':E'+inttoStr(i+m-1)].RowHeight:=35;
						  i:=12;
						  k:=1;
						  inc(count);
          end;
          spec:= DMAbiturientRasp.adoqHelpik_spec_fac.Value;
          E.Cells[i,1]:=IntToStr(k);
          E.Cells[i,2]:= DMAbiturientRasp.adoqHelp.FieldByName('StudName').AsString;
              //���������, ����� ��� �������� ����� ���������� �����/�������
          if (DMAbiturientRasp.adospGetRaspik_disc.Value=3) and (DMAbiturientRasp.adospGetRaspik_sdach.Value>=2)
            and (DMAbiturientRasp.adospGetRaspik_sdach.Value<=5) and (DMAbiturientRasp.adoqHelpcosenka.Value>-1)
             and (DMAbiturientRasp.adoqHelpcosenka.Value<2) then
          begin
            if DMAbiturientRasp.adoqHelpcosenka.Value=1 then
              E.Cells[i,3]:=' �����'
            else
              E.Cells[i,3]:=' �������';
          end
          else
            E.Cells[i,3]:='   '+DMAbiturientRasp.adoqHelpcosenka.AsString;
          inc(i);
          inc(k);
        end;
        DMAbiturientRasp.adoqHelp.Next;
        
      end;

    E.DisplayAlerts:= false;
    if count>2 then
    begin
      E.Sheets.item[1].Delete;
      E.Visible := true;
    end
    else
    begin
      E.Quit;
      raise EApplicationException.Create('��� ������ ��� ������ ����������');
    end;
    E.DisplayAlerts:= true;
    dmUgtuStructure.adoqSpecFac.Filtered:=true;
   except
    on Ex:Exception do
    begin
      E.Quit;
      raise EApplicationException.Create('������ ��� �������� � Excel',Ex);
    end;
   end;
  finally
    E:= UnAssigned;
  end;
end;


//��������� ���������� �������� � Excel
procedure TAbitOtchetsController.ExamsStatToExcel(year: integer; ik_fac,
  ik_spec_fac: Variant; OnlyZachisl: boolean);
var
  Report:TReportBase;
begin
//fbz
    //LoadDataFromQuery(DMAbiturientNabor.adoqExamStatistic);
    Report := TReportBase.CreateReport(TAbitExamStatisticReport);
    Report.FreeOnComplete := true;
    //Report.OnExecuteError := ExecuteError;
    TAbitExamStatisticReport(Report).OnlyZachisl:= OnlyZachisl;
    TAbitExamStatisticReport(Report).Year:= year;
    TAbitExamStatisticReport(Report).ik_fac:= ik_fac;
    TAbitExamStatisticReport(Report).ik_spec_fac:= ik_spec_fac;
    Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\AbitExamStatistic.XLT';
    TWaitingController.GetInstance.Process(Report);

end;

procedure TAbitOtchetsController.ExpExamResultsToExc;
var i,k:integer;
      E:Variant;
begin
  TApplicationController.GetInstance.AddLogEntry('������� ����������� ��������.');

    // ����� ������
    //��������� ������ ���������
  DMAbiturientRasp.adoqHelp.Close;
  DMAbiturientRasp.adoqHelp.SQL.Text:=DMAbiturientRasp.adospAbitGetSpisok.SQL.Text;
  DMAbiturientRasp.adoqHelp.Open;

  E := CreateOleObject('Excel.Application');
  try
   try
    E.WorkBooks.Add;
    E.Visible := false;
    E.DisplayAlerts:= false;
    E.Sheets[1].Select;
    // ����� �����
    E.range['A1:A4'].ColumnWidth:=5;
    E.range['B1:B4'].ColumnWidth:=50;
    E.range['C1:C4'].ColumnWidth:=24;
    for i:=1 to 2 do
      E.range['A'+inttostr(i)+':C'+inttostr(i)].Merge(true);
    E.Range['A1:D2'].Font.Size:=12;
    E.Range['A1:D2'].RowHeight:=25;
    E.Cells[1,1]:='���������� �������� �� '+DMAbiturientRasp.adospGetRaspdisc.AsString;
    E.Cells[2,1]:=DMAbiturientRasp.adospGetRaspdate_of.AsString;

    //����� �������
    i:=4;
    E.range['A1:C'+IntToStr(i)].HorizontalAlignment:=-4108;
    E.Range['A1:C'+IntToStr(i)].Font.Bold:=true;
    E.Range['A'+IntToStr(i)+':C'+IntToStr(i)].Font.Size:=9;

    E.Cells[i,1]:='� �/�';
    E.Cells[i,2]:='�������, ���, ��������';
    E.Cells[i,3]:='���������� ������';
    DMAbiturientRasp.adoqHelp.Sort:='StudName';  //��������� �� ���
    DMAbiturientRasp.adoqHelp.First;
    inc(i);
    k:=1;
    while not DMAbiturientRasp.adoqHelp.Eof do
    begin
      if DMAbiturientRasp.adoqHelp.FieldByName('id_rasp_kab').AsString<>'' then
      begin
        E.Cells[i,1]:=IntToStr(k);;
        E.Cells[i,2]:='   '+DMAbiturientRasp.adoqHelpStudName.AsString;
        //���������, ����� ��� �������� ����� ���������� �����/�������
        if (DMAbiturientRasp.adospGetRaspik_disc.Value=3) and (DMAbiturientRasp.adospGetRaspik_sdach.Value>=2)
          and (DMAbiturientRasp.adospGetRaspik_sdach.Value<=5) and (DMAbiturientRasp.adoqHelpcosenka.Value>-1)
             and (DMAbiturientRasp.adoqHelpcosenka.Value<2) then
        begin
          if DMAbiturientRasp.adoqHelpcosenka.Value=1 then
            E.Cells[i,3]:=' �����'
          else
            E.Cells[i,3]:=' �������';
        end
        else
          E.Cells[i,3]:='   '+DMAbiturientRasp.adoqHelpcosenka.AsString;
        inc(i);
        inc(k);
      end;
      DMAbiturientRasp.adoqHelp.Next;
    end;

    E.Range['A'+intToStr(i-k)+':C'+intToStr(i-1)].Borders.Weight:=2;
    E.range['A1:A'+IntToStr(i-1)].HorizontalAlignment:=-4108;
    E.range['C1:C'+IntToStr(i-1)].HorizontalAlignment:=-4108;
    E.Range['A'+intToStr(i-k)+':C'+intToStr(i-1)].Borders.Weight:=2;
    E.Range['A'+intToStr(i-k)+':C'+intToStr(i-1)].Font.Size :=14;
    E.Range['A'+intToStr(i-k)+':C'+intToStr(i-1)].RowHeight:=20;
    //E.Sheets[1].PageSetup.LeftFooter:='&5' + TApplicationController.GetInstance.DocumentFooter;
    E.Visible := true;
    E.DisplayAlerts:= true;
   except
    on Ex:Exception do
    begin
      E.Quit;
      raise EApplicationException.Create('��������� ������ ��� �������� ����������� �������� � Excel',Ex);
    end;
   end;
  finally
    E:= UnAssigned;
  end;

end;


//���������������
procedure TAbitOtchetsController.PrintObColvo(E:Variant;var i:integer);
var j:integer;
begin
  j:=7;
  E.cells[i,j]:=dm.adoqAbitItogiCountObFCount.Value+
                dm.adoqAbitItogiCountZCPFCount.Value+
                dm.adoqAbitItogiCountContrCount.Value;
  inc(i);
  E.cells[i,j]:='����� �������:';
  E.cells[i,j+2]:=dm.adoqAbitItogiCountObFCount.AsString;
  inc(i);
  E.cells[i,j]:='���:';
  E.cells[i,j+2]:=dm.adoqAbitItogiCountZCPFCount.AsString;
  inc(i);
  E.cells[i,j]:='��������:';
  E.cells[i,j+2]:=dm.adoqAbitItogiCountContrCount.AsString;
  inc(i);
  E.cells[i,j]:='����������:';
  E.cells[i,j+2]:=dm.adoqAbitItogiCountMedalCount.AsString;
  E.Range['A'+inttoStr(i-4)+':J'+inttoStr(i)].Font.Bold:=true;
  i:=i+3;
end;

//������� ���� ������ � ������ (1 �����������)
procedure TAbitOtchetsController.ExportAbitToZhurnal(E:Variant;var i:integer);
var j, balls, excount:integer;
    str:string;
begin
    //����� ����� ����������
      j:=1;
      E.cells[i,j]:=dmAbiturientOtchety.adospAbitZhurnalRegNomer.AsString; inc(j);
      E.cells[i,j]:=dmAbiturientOtchety.adospAbitZhurnaldd_pod_zayav.AsString;  inc(j);
      E.cells[i,j]:=dmAbiturientOtchety.adospAbitZhurnalStudname.AsString; inc(j);
      E.cells[i,j]:=dmAbiturientOtchety.adospAbitZhurnalDd_birth.AsString;  inc(j);
      if dmAbiturientOtchety.adospAbitZhurnallSex.Value then
       E.cells[i,j]:='�'
      else
       E.cells[i,j]:='�';   inc(j);

      //�����������
      str:='';
      if dmAbiturientOtchety.adospAbitZhurnalik_kat_zaved.AsString<>'' then
        str:=dmAbiturientOtchety.adospAbitZhurnalcKat_Zaved.AsString;
      str:=str+' '+dmAbiturientOtchety.adospAbitZhurnalcName_zaved.AsString;
      E.cells[i,j]:=str;

      str:='';  //����� ������, ��������� � ����
        inc(j);
      if dmAbiturientOtchety.adospAbitZhurnalCname_pred.AsString<>'' then
        str:=dmAbiturientOtchety.adospAbitZhurnalCname_pred.AsString;
      if dmAbiturientOtchety.adospAbitZhurnalcDolgnost.AsString<>'' then
        if str<>'' then
          str:=str+', '+dmAbiturientOtchety.adospAbitZhurnalcDolgnost.AsString
        else
          str:=dmAbiturientOtchety.adospAbitZhurnalcDolgnost.AsString;
      if (dmAbiturientOtchety.adospAbitZhurnalStazYear.AsString<>'') then
        if str<>'' then
          str:=str+', '+dmAbiturientOtchety.adospAbitZhurnalStazYear.AsString+' ���'
        else
          str:=dmAbiturientOtchety.adospAbitZhurnalStazYear.AsString+' ���';
      if dmAbiturientOtchety.adospAbitZhurnalStazMonth.AsString<>'' then
        if str<>'' then
          str:=str+', '+dmAbiturientOtchety.adospAbitZhurnalStazMonth.AsString+' �������'
        else
          str:=dmAbiturientOtchety.adospAbitZhurnalStazMonth.AsString+' �������';

      E.cells[i,j]:=str;   inc(j);

      E.cells[i,j]:=dmAbiturientOtchety.adospAbitZhurnalCname_kat_zach.AsString;
      inc(j);

      //����� ����������
      str:='';
      if dmAbiturientOtchety.adospAbitDocsForZhurnal.Locate('nCode',dmAbiturientOtchety.adospAbitZhurnalnCode.Value,[loCaseInsensitive]) then
      begin
        while (not dmAbiturientOtchety.adospAbitDocsForZhurnal.Eof) and
          (dmAbiturientOtchety.adospAbitDocsForZhurnalnCode.Value=dmAbiturientOtchety.adospAbitZhurnalnCode.Value) do
        begin
          if str='' then
            str:=dmAbiturientOtchety.adospAbitDocsForZhurnalcvid_doc.AsString
          else
            str:=str+'; '+dmAbiturientOtchety.adospAbitDocsForZhurnalcvid_doc.AsString;
          if dmAbiturientOtchety.adospAbitDocsForZhurnalCd_seria.AsString<>'' then
            str:=str+' ����� '+dmAbiturientOtchety.adospAbitDocsForZhurnalCd_seria.AsString;
          if dmAbiturientOtchety.adospAbitDocsForZhurnalNp_number.AsString<>'' then
            str:=str+' � '+dmAbiturientOtchety.adospAbitDocsForZhurnalNp_number.AsString;
          if dmAbiturientOtchety.adospAbitDocsForZhurnalDd_vidan.AsString<>'' then
            str:=str+' ����� '+dmAbiturientOtchety.adospAbitDocsForZhurnalDd_vidan.AsString+' �.';
          dmAbiturientOtchety.adospAbitDocsForZhurnal.Next;
        end;
      end;
      E.cells[i,j]:=str;  inc(j);

      //����� �������
      str:='';  //�����������
      if dmAbiturientOtchety.adospAbitZhurnalIk_Street_fact.AsString<>'' then
        if dmAbiturientOtchety.adospAbitAddressForZhurnal.Locate('Ik_street',
          dmAbiturientOtchety.adospAbitZhurnalIk_Street_fact.Value,[loCaseInsensitive]) then
        begin
            str:=dmAbiturientOtchety.adospAbitAddressForZhurnalAddress.AsString+', '+
              dmAbiturientOtchety.adospAbitZhurnalAddressf.AsString;
        end;
    //��������
      if (dmAbiturientOtchety.adospAbitZhurnalIk_Street_prop.AsString<>'') and
        (dmAbiturientOtchety.adospAbitZhurnalIk_Street_prop.Value<>dmAbiturientOtchety.adospAbitZhurnalIk_Street_fact.Value) then
        if dmAbiturientOtchety.adospAbitAddressForZhurnal.Locate('Ik_street',
          dmAbiturientOtchety.adospAbitZhurnalIk_Street_prop.Value,[loCaseInsensitive]) then
        begin
          if str<>'' then
            str:=str+'; '+dmAbiturientOtchety.adospAbitAddressForZhurnalAddress.AsString+', '+
              dmAbiturientOtchety.adospAbitZhurnalAddressp.AsString
          else
            str:=dmAbiturientOtchety.adospAbitAddressForZhurnalAddress.AsString+', '+
              dmAbiturientOtchety.adospAbitZhurnalAddressp.AsString;
        end;

    //������ ���������
      if (dmAbiturientOtchety.adospAbitZhurnalctelefon.AsString<>'') then
        if (str<>'') then
          str := str+'; '+dmAbiturientOtchety.adospAbitZhurnalctelefon.AsString
        else
          str := dmAbiturientOtchety.adospAbitZhurnalctelefon.AsString;
      if (dmAbiturientOtchety.adospAbitZhurnalcSotTel.AsString<>'') then
        if (str<>'') then
          str := str+'; '+dmAbiturientOtchety.adospAbitZhurnalcSotTel.AsString
        else
          str := dmAbiturientOtchety.adospAbitZhurnalcSotTel.AsString;

      E.cells[i,j]:=str;
      inc(j);
      if dmAbiturientOtchety.adospAbitZhurnalLobchegit.Value then
        E.cells[i,j]:='��'
      else
        E.cells[i,j]:='���';   inc(j);

      if dmAbiturientOtchety.adospAbitZhurnalik_medal.Value<>1 then
        E.cells[i,j]:='��'
      else
        E.cells[i,j]:='���';
      j:=j+3;;
      //����� ��. ������
      str:='';
      if dmAbiturientOtchety.adospAbitLangForZhurnal.Locate('nCode',dmAbiturientOtchety.adospAbitZhurnalnCode.Value,[loCaseInsensitive])
      then
        while (not dmAbiturientOtchety.adospAbitLangForZhurnal.Eof) and
          (dmAbiturientOtchety.adospAbitLangForZhurnalnCode.Value=dmAbiturientOtchety.adospAbitZhurnalnCode.Value) do
       begin
          if str='' then
            str:=dmAbiturientOtchety.adospAbitLangForZhurnalCname_lang.AsString
          else
            str:=str+', '+dmAbiturientOtchety.adospAbitLangForZhurnalCname_lang.AsString;
          dmAbiturientOtchety.adospAbitLangForZhurnal.Next;
        end;
      E.cells[i,j]:=str;  inc(j);

    //����� ���������
      balls:=0;  //����� ���-�� ������
      exCount:=0; //���-�� ���������

      if dmAbiturientOtchety.adospAbitExForZhurnal.Locate('NN_abit',dmAbiturientOtchety.adospAbitZhurnalNN_abit.Value,[loCaseInsensitive])
      then
        while (not dmAbiturientOtchety.adospAbitExForZhurnal.Eof) and
        (dmAbiturientOtchety.adospAbitExForZhurnalNN_abit.Value=dmAbiturientOtchety.adospAbitZhurnalNN_abit.Value) do
        begin
        if (dmAbiturientOtchety.adospAbitExForZhurnalik_disc.Value<>3) and
            (dmAbiturientOtchety.adospAbitExForZhurnalcosenka.Value>0) then
          begin
            balls:=balls+dmAbiturientOtchety.adospAbitExForZhurnalcosenka.Value;
            inc(exCount);
          end;
          if dmAbiturientOtchety.adospAbitExForZhurnalik_disc.Value <>3 then
          begin
            if dmAbiturientOtchety.adospAbitExForZhurnalcosenka.AsString<>'' then
              str:=dmAbiturientOtchety.adospAbitExForZhurnalcosenka.AsString
            else
              str:='+';
          end;
          case dmAbiturientOtchety.adospAbitExForZhurnalik_disc.Value of
            1:  //����������
              E.cells[i,j]:=str;
            2:  //������
              E.cells[i,j+1]:=str;
            3:  //�������
              if dmAbiturientOtchety.adospAbitExForZhurnalcosenka.AsString<>'' then
              begin
                if dmAbiturientOtchety.adospAbitExForZhurnalcosenka.Value=0 then
                  E.cells[i,j+2]:='�������';
                if dmAbiturientOtchety.adospAbitExForZhurnalcosenka.Value=1 then
                  E.cells[i,j+2]:='�����';
                if dmAbiturientOtchety.adospAbitExForZhurnalcosenka.Value>1 then
                  E.cells[i,j+2]:=dmAbiturientOtchety.adospAbitExForZhurnalcosenka.AsString;
              end
              else
                E.cells[i,j+2]:='+';
            4:  //�����������
              E.cells[i,j+3]:=str;
            5:  //��������������
              E.cells[i,j+4]:=str;
            8:  //��. �������
              E.cells[i,j+5]:=str;
            7:  //���. �����.
              E.cells[i,j+6]:=str;
            9:  //��������
              E.cells[i,j+7]:=str;
            10:  //����������
              E.cells[i,j+8]:=str;
            11:  //�������
              E.cells[i,j+9]:=str;
            12:  //��������
              E.cells[i,j+10]:=str;
          end;
          dmAbiturientOtchety.adospAbitExForZhurnal.Next;
        end;
      j:=j+11;
      if balls>0 then
        E.cells[i,j]:=FloatToStr(balls/exCount);inc(j);
      if balls>0 then
        E.cells[i,j]:=IntToStr(balls);
      inc(i);
end;

//��������� ��� ��������� � ������� ��� �������
function TAbitOtchetsController.OpenAllStat(year,ik_spec_fac,dd_pod_zayav:Variant):boolean;
begin
  result:=false;
  try
		  //��������� �������� �������
		  dmAbiturientOtchety.adospAbitZhurnal.Close;   //����� ����������
		  dmAbiturientOtchety.adospAbitZhurnal.ProcedureName:='ABIT_get_InfForZhurnal;1';
		  dmAbiturientOtchety.adospAbitZhurnal.Parameters.Clear;
		  dmAbiturientOtchety.adospAbitZhurnal.Parameters.CreateParameter('@ik_spec_fac',ftInteger,pdInput,4,ik_spec_fac);
		  dmAbiturientOtchety.adospAbitZhurnal.Parameters.CreateParameter('@dd_pod_zayav',ftDateTime,pdInput,8,dd_pod_zayav);
		  dmAbiturientOtchety.adospAbitZhurnal.Parameters.CreateParameter('@NNyear',ftInteger,pdInput,4,year);
		  //dmAbiturientOtchety.adospAbitZhurnal.Parameters.CreateParameter('@RETURN_VALUE',ftBCD,pdReturnValue,0,0);
		  dmAbiturientOtchety.adospAbitZhurnal.Open;
      if dmAbiturientOtchety.adospAbitZhurnal.RecordCount=0 then
      begin
        exit;
      end;

		  dmAbiturientOtchety.adospAbitLangForZhurnal.Close;   //������ ��. ������
		  dmAbiturientOtchety.adospAbitLangForZhurnal.ProcedureName:='ABIT_get_LangvsForZhurnal;1';
		  dmAbiturientOtchety.adospAbitLangForZhurnal.Parameters.Clear;
		  dmAbiturientOtchety.adospAbitLangForZhurnal.Parameters.CreateParameter('@ik_spec_fac',ftInteger,pdInput,4,ik_spec_fac);
		  dmAbiturientOtchety.adospAbitLangForZhurnal.Parameters.CreateParameter('@dd_pod_zayav',ftDateTime,pdInput,8,dd_pod_zayav);
		  dmAbiturientOtchety.adospAbitLangForZhurnal.Parameters.CreateParameter('@NNyear',ftInteger,pdInput,4,year);
		  dmAbiturientOtchety.adospAbitLangForZhurnal.Open;

		  dmAbiturientOtchety.adospAbitDocsForZhurnal.Close;   //������ ����������
		  dmAbiturientOtchety.adospAbitDocsForZhurnal.ProcedureName:='ABIT_get_DocsForZhurnal;1';
		  dmAbiturientOtchety.adospAbitDocsForZhurnal.Parameters.Clear;
		  dmAbiturientOtchety.adospAbitDocsForZhurnal.Parameters.CreateParameter('@ik_spec_fac',ftInteger,pdInput,4,ik_spec_fac);
		  dmAbiturientOtchety.adospAbitDocsForZhurnal.Parameters.CreateParameter('@dd_pod_zayav',ftDateTime,pdInput,8,dd_pod_zayav);
		  dmAbiturientOtchety.adospAbitDocsForZhurnal.Parameters.CreateParameter('@NNyear',ftInteger,pdInput,4,year);
		  dmAbiturientOtchety.adospAbitDocsForZhurnal.Open;

		  dmAbiturientOtchety.adospAbitExForZhurnal.Close;   //������ ���������
		  dmAbiturientOtchety.adospAbitExForZhurnal.ProcedureName:='ABIT_Get_ekz_Spisok_ForZhurnal;1';
		  dmAbiturientOtchety.adospAbitExForZhurnal.Parameters.Clear;
		  dmAbiturientOtchety.adospAbitExForZhurnal.Parameters.CreateParameter('@ik_spec_fac',ftInteger,pdInput,4,ik_spec_fac);
		  dmAbiturientOtchety.adospAbitExForZhurnal.Parameters.CreateParameter('@dd_pod_zayav',ftDateTime,pdInput,8,dd_pod_zayav);
		  dmAbiturientOtchety.adospAbitExForZhurnal.Parameters.CreateParameter('@NNyear',ftInteger,pdInput,4,year);
		  dmAbiturientOtchety.adospAbitExForZhurnal.Open;

		  dmAbiturientOtchety.adospAbitAddressForZhurnal.Close;   //������
		  dmAbiturientOtchety.adospAbitAddressForZhurnal.ProcedureName:='ABIT_get_AddrForZhurnal;1';
		  dmAbiturientOtchety.adospAbitAddressForZhurnal.Parameters.Clear;
		  dmAbiturientOtchety.adospAbitAddressForZhurnal.Parameters.CreateParameter('@ik_spec_fac',ftInteger,pdInput,4,ik_spec_fac);
		  dmAbiturientOtchety.adospAbitAddressForZhurnal.Parameters.CreateParameter('@dd_pod_zayav',ftDateTime,pdInput,8,dd_pod_zayav);
		  dmAbiturientOtchety.adospAbitAddressForZhurnal.Parameters.CreateParameter('@NNyear',ftInteger,pdInput,4,year);
		  dmAbiturientOtchety.adospAbitAddressForZhurnal.Open;
  result:= true;

  except
    raise EApplicationException.Create('��������� ������ ��� �������� ������ ��� ������ � �������.');
  end;
end;

//������� ����� (��� ���������� �� ���) � Excel
function TAbitOtchetsController.ExportAllStatToExcel(year:integer; filter:string):boolean;
var i,k:integer;
			  E:Variant;
			  fac:integer;
			  str:string;
			  FindRange: Variant;
			  fl:boolean;
begin
  result:=false;
  //��������� ��o������ �������
  if not OpenAllStat(year,null,null) then
  begin
    exit;
  end;

  try
    		  //��������� ������y ����� ������
		  str:='('+IntToStr(year)+')';
		  dm.adoqAbitItogiCount.SQL.Strings[1]:=str;
		  dm.adoqAbitItogiCount.Open;
		  //����������� ������ � ����������� �� ���������� �������
      dm.adoqAbitItogiCount.Filter:=Filter;
		  dm.adoqAbitItogiCount.Filtered:=true;
  except
    raise EApplicationException.Create('��������� ������ ��� �������� ������ ��� ������ � �������.');
    exit;
  end;

  E := CreateOleObject('Excel.Application');
//c�� �������
  try
    try
		  str := ExtractFilePath(Application.ExeName)+'Reports\AbitItogi.XLT';
		  E.WorkBooks.Add(str);
		  E.Visible := false;
		  E.Sheets[1].Select;
      E.DisplayAlerts:= false;

		  //����� ���� �� �������  adoqAbitItogiCount (�� ��������������)
		  i:=2;  //� ������ � Excel
		  fl:=false;
		  k:=0; //���-�� ������������ �� �������������
		  dm.adoqAbitItogiCount.First;
		  //����� ����
      if year=YearOf(Date) then
        str:=DateToStr(Date)
      else
        str:='31.08.'+IntToStr(year);
		  FindRange := E.Cells.Replace(What := '#����#',Replacement:=str);

		  //����� �������� ����������
		  fac:=dm.adoqAbitItogiCountIk_fac.Value;
		  E.cells[i,1]:=dm.adoqAbitItogiCountCname_fac.AsString;
		  E.cells[i+1,1]:=dm.adoqAbitItogiCountCname_spec.AsString;
		  i:=6;
		  while (not dm.adoqAbitItogiCount.Eof) do
		  begin
		  //����� ����� ������������� � ������
			if fl then
			begin
			 if k>0 then
			 begin
			  E.Range['A'+inttoStr(i-k)+':AE'+inttoStr(i-1)].RowHeight:=105;
			  E.Range['A'+inttoStr(i-k)+':AE'+inttoStr(i-1)].Borders.Weight:=2;
			 end;
			  E.Range['A'+inttoStr(i)+':F'+inttoStr(i)].Merge(true);
			  E.cells[i,1]:='����� �� '+dm.adoqAbitItogiCountCname_spec.AsString;
			  PrintObColvo(E,i);
			  dm.adoqAbitItogiCount.Next;

			  //����� ������ �� ����������
			  while ((dm.adoqAbitItogiCountik_spec_fac.AsString='') or
					(dm.adoqAbitItogiCountik_fac.AsString='')) and
					(not dm.adoqAbitItogiCount.Eof) do
			  begin
				E.Range['A'+inttoStr(i)+':F'+inttoStr(i)].Merge(true);
				if (dm.adoqAbitItogiCountik_fac.AsString='') then
				begin
				  E.cells[i,1]:='����� �� ������������ ';
				  E.Range['A'+inttoStr(i-4)+':J'+inttoStr(i)].Font.Size:=13;
				end
				else
				  E.cells[i,1]:='����� �� '+dm.adoqAbitItogiCountCname_fac.AsString;
				PrintObColvo(E,i);
				dm.adoqAbitItogiCount.Next;
			  end;

			  if  dm.adoqAbitItogiCount.Eof then
			  begin
				  E.Visible := true;
          result:=true;
				  exit;
			  end;


			  //����� �������� ����������
			  if fac<>dm.adoqAbitItogiCountIk_fac.Value then
			  begin
				  E.Range['A'+inttoStr(i)+':J'+inttoStr(i)].Merge(true);
				  E.cells[i,1]:=dm.adoqAbitItogiCountCname_fac.AsString;
				  fac:=dm.adoqAbitItogiCountIk_fac.Value;
				  E.Range['A'+inttoStr(i)+':J'+inttoStr(i)].Font.Size:=14;
				  E.Range['A'+inttoStr(i)+':J'+inttoStr(i)].Font.Bold:=true;
				  inc(i);
			  end;

			  E.Range['A3:AE5'].Copy;
			  E.Range['A'+inttoStr(i)+':AE'+inttoStr(i+3)].Insert;
			  E.Range['A'+inttoStr(i)+':AE'+inttoStr(i)].RowHeight:=22.5;
			  E.Range['A'+inttoStr(i+1)+':AE'+inttoStr(i+1)].RowHeight:=19;
			  E.Range['A'+inttoStr(i+2)+':AE'+inttoStr(i+2)].RowHeight:=84;
			  E.cells[i,1]:=dm.adoqAbitItogiCountCname_spec.AsString;
			  i:=i+3;
			  k:=0;  //���-�� ������������ �� �������������
			end;
			//����� ����� �������������
			//E.Range['A'+inttoStr(j)+':J'+inttoStr(i)].Clear;


		  //����� �������
			dmAbiturientOtchety.adospAbitZhurnal.First;
			dmAbiturientOtchety.adospAbitZhurnal.Locate('ik_spec_fac',dm.adoqAbitItogiCountik_spec_fac.Value,[loCaseInsensitive]);
			while (dm.adoqAbitItogiCountik_spec_fac.Value=dmAbiturientOtchety.adospAbitZhurnalik_spec_fac.Value)
			  and (not dmAbiturientOtchety.adospAbitZhurnal.Eof) do
			begin
			  ExportAbitToZhurnal(E.ActiveSheet, i);
			  dmAbiturientOtchety.adospAbitZhurnal.Next;
			  inc(k);
			end;
			if not fl then
			  fl:=true;
		  end;
		  //��������� ���������, ������������� � ����
		  {if dm.adoqSpecFac.Locate('ik_spec_fac',TDBNodeSpecRecObject(DBDekTreeView_TEST1.SelectedObject).ik,[loCaseInsensitive]) then
		  begin
			 str:=dm.adoqSpecFacCname_spec.AsString;
			 FindRange := E.Cells.Replace(What := '#����#',Replacement:=str);
			 str:=dm.adoqSpecFacCshort_name_fac.AsString;
			 FindRange := E.Cells.Replace(What := '#���#',Replacement:=str);
		  end;  }

		  //E.Sheets[1].PageSetup.LeftFooter:='&5' + TApplicationController.GetInstance.DocumentFooter;
      E.Visible := true;
      E.DisplayAlerts:= true;
      result:=true;

   except
    on Ex:Exception do
    begin
      E.Quit;
      raise EApplicationException.Create('������ ��� �������� � Excel',Ex);
    end;
   end;
  finally
    E:= UnAssigned;
  end;
end;

//��������������� ������� ������� �� 1 ����
procedure TAbitOtchetsController.PrintMag(ik_spec_fac:integer; E:Variant; ZhDate:string);
const m=4;   //���-�� ������������ �� ����� �����
var i,j,k,balls,exCount, count:integer;
      //sh:Variant;
      //spec:integer;
      str:string;
      FindRange: Variant;
begin
  //m:=4;
  //���������� ���-�� ������
  count:=(dmAbiturientOtchety.adospAbitZhurnal.RecordCount div m);
  if (dmAbiturientOtchety.adospAbitZhurnal.RecordCount mod m)>0 then
    inc(count);
    //��������� ������ ��������
  for i:=1 to count-1 do
  begin
     E.Range['A1:AF'+inttoStr(3+m)].Copy;
     E.Range['A'+inttoStr(i*(3+m)+1)+':AF'+inttoStr((i+1)*(3+m))].Insert;
     E.Range['A'+inttoStr(i*(3+m)+1)+':AF'+inttoStr(i*(3+m)+1)].RowHeight:=22.5;
     E.Range['A'+inttoStr(i*(3+m)+2)+':AF'+inttoStr(i*(3+m)+1)].RowHeight:=19;
     E.Range['A'+inttoStr(i*(3+m)+3)+':AF'+inttoStr(i*(3+m)+3)].RowHeight:=84;
     E.Range['A'+inttoStr(i*(3+m)+4)+':AF'+inttoStr((i+1)*(3+m))].RowHeight:=105;
  end;
  //�������� �����
  i:=4; //� ������ � Excel
  k:=1; //� ������������� �����������
  while not dmAbiturientOtchety.adospAbitZhurnal.Eof do
  begin
    if (k>1) and (((k-1) mod m)=0) then
      i:=i+3;
    j:=1;
    //����� ����� ����������
    E.cells[i,j]:=dmAbiturientOtchety.adospAbitZhurnalRegNomer.AsString; inc(j);
    E.cells[i,j]:=dmAbiturientOtchety.adospAbitZhurnaldd_pod_zayav.AsString;  inc(j);
    E.cells[i,j]:=dmAbiturientOtchety.adospAbitZhurnalStudname.AsString; inc(j);
    E.cells[i,j]:=dmAbiturientOtchety.adospAbitZhurnalDd_birth.AsString;  inc(j);
    if dmAbiturientOtchety.adospAbitZhurnallSex.Value then
       E.cells[i,j]:='�'
    else
       E.cells[i,j]:='�';   inc(j);

    //�����������
    str:='';
    if dmAbiturientOtchety.adospAbitZhurnalik_kat_zaved.AsString<>'' then
      str:=dmAbiturientOtchety.adospAbitZhurnalcKat_Zaved.AsString;
    str:=str+' '+dmAbiturientOtchety.adospAbitZhurnalcName_zaved.AsString;
    E.cells[i,j]:=str;

    str:='';  //����� ������, ��������� � ����
    inc(j);
    if dmAbiturientOtchety.adospAbitZhurnalCname_pred.AsString<>'' then
      str:=dmAbiturientOtchety.adospAbitZhurnalCname_pred.AsString;
    if dmAbiturientOtchety.adospAbitZhurnalcDolgnost.AsString<>'' then
      if str<>'' then
        str:=str+', '+dmAbiturientOtchety.adospAbitZhurnalcDolgnost.AsString
      else
        str:=dmAbiturientOtchety.adospAbitZhurnalcDolgnost.AsString;
    if (dmAbiturientOtchety.adospAbitZhurnalStazYear.AsString<>'') then
      if str<>'' then
        str:=str+', '+dmAbiturientOtchety.adospAbitZhurnalStazYear.AsString+' ���'
      else
        str:=dmAbiturientOtchety.adospAbitZhurnalStazYear.AsString+' ���';
    if dmAbiturientOtchety.adospAbitZhurnalStazMonth.AsString<>'' then
      if str<>'' then
        str:=str+', '+dmAbiturientOtchety.adospAbitZhurnalStazMonth.AsString+' �������'
      else
        str:=dmAbiturientOtchety.adospAbitZhurnalStazMonth.AsString+' �������';

    E.cells[i,j]:=str;   inc(j);

    E.cells[i,j]:=dmAbiturientOtchety.adospAbitZhurnalCname_kat_zach.AsString;
     inc(j);

    //����� ����������
    str:='';
    if dmAbiturientOtchety.adospAbitDocsForZhurnal.Locate('nCode',dmAbiturientOtchety.adospAbitZhurnalnCode.Value,[loCaseInsensitive]) then
    begin
      while (not dmAbiturientOtchety.adospAbitDocsForZhurnal.Eof) and
        (dmAbiturientOtchety.adospAbitDocsForZhurnalnCode.Value=dmAbiturientOtchety.adospAbitZhurnalnCode.Value) do
      begin
        if (dmAbiturientOtchety.adospAbitDocsForZhurnalIk_vid_doc.Value=6) then
        begin
          if str='' then
            str:='��������'
          else
            str:=str+'; '+'��������';
        end
        else
        begin
          if str='' then
            str:=dmAbiturientOtchety.adospAbitDocsForZhurnalcvid_doc.AsString
          else
            str:=str+'; '+dmAbiturientOtchety.adospAbitDocsForZhurnalcvid_doc.AsString;
        end;
        if dmAbiturientOtchety.adospAbitDocsForZhurnalCd_seria.AsString<>'' then
           str:=str+' ����� '+dmAbiturientOtchety.adospAbitDocsForZhurnalCd_seria.AsString;
        if dmAbiturientOtchety.adospAbitDocsForZhurnalNp_number.AsString<>'' then
           str:=str+' � '+dmAbiturientOtchety.adospAbitDocsForZhurnalNp_number.AsString;
        if dmAbiturientOtchety.adospAbitDocsForZhurnalDd_vidan.AsString<>'' then
           str:=str+' ����� '+dmAbiturientOtchety.adospAbitDocsForZhurnalDd_vidan.AsString+' �.';
        dmAbiturientOtchety.adospAbitDocsForZhurnal.Next;
      end;
    end;
    E.cells[i,j]:=str;  inc(j);

    //����� �������
    str:='';  //�����������
    if dmAbiturientOtchety.adospAbitZhurnalIk_Street_fact.AsString<>'' then
      if dmAbiturientOtchety.adospAbitAddressForZhurnal.Locate('Ik_street',
          dmAbiturientOtchety.adospAbitZhurnalIk_Street_fact.Value,[loCaseInsensitive]) then
      begin
            str:=dmAbiturientOtchety.adospAbitAddressForZhurnalAddress.AsString+', '+
              dmAbiturientOtchety.adospAbitZhurnalAddressf.AsString;
      end;
    //��������
    if (dmAbiturientOtchety.adospAbitZhurnalIk_Street_prop.AsString<>'') and
        (dmAbiturientOtchety.adospAbitZhurnalIk_Street_prop.Value<>dmAbiturientOtchety.adospAbitZhurnalIk_Street_fact.Value)or
        (dmAbiturientOtchety.adospAbitZhurnalAddressf.Value<>dmAbiturientOtchety.adospAbitZhurnalAddressp.Value) then
      if dmAbiturientOtchety.adospAbitAddressForZhurnal.Locate('Ik_street',
          dmAbiturientOtchety.adospAbitZhurnalIk_Street_prop.Value,[loCaseInsensitive]) then
      begin
        if str<>'' then
            str:=str+'; '+dmAbiturientOtchety.adospAbitAddressForZhurnalAddress.AsString+', '+
              dmAbiturientOtchety.adospAbitZhurnalAddressp.AsString
        else
            str:=dmAbiturientOtchety.adospAbitAddressForZhurnalAddress.AsString+', '+
              dmAbiturientOtchety.adospAbitZhurnalAddressp.AsString;
      end;

    //������ ���������
    if (dmAbiturientOtchety.adospAbitZhurnalctelefon.AsString<>'') then
      if (str<>'') then
        str := str+'; '+dmAbiturientOtchety.adospAbitZhurnalctelefon.AsString
      else
        str := dmAbiturientOtchety.adospAbitZhurnalctelefon.AsString;
    if (dmAbiturientOtchety.adospAbitZhurnalcSotTel.AsString<>'') then
      if (str<>'') then
        str := str+'; '+dmAbiturientOtchety.adospAbitZhurnalcSotTel.AsString
      else
        str := dmAbiturientOtchety.adospAbitZhurnalcSotTel.AsString;

    E.cells[i,j]:=str;
     inc(j);
    if dmAbiturientOtchety.adospAbitZhurnalLobchegit.Value then
      E.cells[i,j]:='��'
    else
      E.cells[i,j]:='���';   inc(j);

    if dmAbiturientOtchety.adospAbitZhurnalik_medal.Value<>1 then
      E.cells[i,j]:='��'
    else
      E.cells[i,j]:='���';
     j:=j+3;;
    //����� ��. ������
    str:='';
    if dmAbiturientOtchety.adospAbitLangForZhurnal.Locate('nCode',dmAbiturientOtchety.adospAbitZhurnalnCode.Value,[loCaseInsensitive])
      then
      while (not dmAbiturientOtchety.adospAbitLangForZhurnal.Eof) and
          (dmAbiturientOtchety.adospAbitLangForZhurnalnCode.Value=dmAbiturientOtchety.adospAbitZhurnalnCode.Value) do
      begin
        if str='' then
          str:=dmAbiturientOtchety.adospAbitLangForZhurnalCname_lang.AsString
        else
          str:=str+', '+dmAbiturientOtchety.adospAbitLangForZhurnalCname_lang.AsString;
        dmAbiturientOtchety.adospAbitLangForZhurnal.Next;
      end;
    E.cells[i,j]:=str;  inc(j);

    //����� ���������
    balls:=0;  //����� ���-�� ������
    exCount:=0; //���-�� ���������

    if dmAbiturientOtchety.adospAbitExForZhurnal.Locate('NN_abit',dmAbiturientOtchety.adospAbitZhurnalNN_abit.Value,[loCaseInsensitive])
      then
      while (not dmAbiturientOtchety.adospAbitExForZhurnal.Eof) and
        (dmAbiturientOtchety.adospAbitExForZhurnalNN_abit.Value=dmAbiturientOtchety.adospAbitZhurnalNN_abit.Value) do
      begin
        if ((dmAbiturientOtchety.adospAbitExForZhurnalik_disc.Value<>3) or
            (dmAbiturientOtchety.adospAbitZhurnal.FieldByName('lRussian').AsBoolean)) and
            (dmAbiturientOtchety.adospAbitExForZhurnalcosenka.Value>0) then
        begin
          balls:=balls+dmAbiturientOtchety.adospAbitExForZhurnalcosenka.Value;
          inc(exCount);
        end;
        if (dmAbiturientOtchety.adospAbitExForZhurnalik_disc.Value <>3) or
          (dmAbiturientOtchety.adospAbitZhurnal.FieldByName('lRussian').AsBoolean) then
        begin
          if dmAbiturientOtchety.adospAbitExForZhurnalcosenka.AsString<>'' then
            str:=dmAbiturientOtchety.adospAbitExForZhurnalcosenka.AsString
          else
            str:='+';
        end;
        case dmAbiturientOtchety.adospAbitExForZhurnalik_disc.Value of
          1:  //����������
              E.cells[i,j]:=str;
          2:  //������
              E.cells[i,j+1]:=str;
          3:  //�������
            if dmAbiturientOtchety.adospAbitExForZhurnalcosenka.AsString<>'' then
            begin   //�� ��������� �������
              if not dmAbiturientOtchety.adospAbitZhurnal.FieldByName('lRussian').AsBoolean then
              begin
                if dmAbiturientOtchety.adospAbitExForZhurnalcosenka.Value=0 then
                  E.cells[i,j+2]:='�������';
                if dmAbiturientOtchety.adospAbitExForZhurnalcosenka.Value=1 then
                  E.cells[i,j+2]:='�����';
                if dmAbiturientOtchety.adospAbitExForZhurnalcosenka.Value>1 then
                  E.cells[i,j+2]:=dmAbiturientOtchety.adospAbitExForZhurnalcosenka.AsString;
              end
              else    //���������
                E.cells[i,j+2]:=dmAbiturientOtchety.adospAbitExForZhurnalcosenka.AsString;
            end
            else
              E.cells[i,j+2]:='+';
          4:  //�����������
            E.cells[i,j+3]:=str;
          5:  //��������������
            E.cells[i,j+4]:=str;
          8:  //��. �������
            E.cells[i,j+5]:=str;
          7:  //���. �����.
            E.cells[i,j+6]:=str;
          9:  //��������
            E.cells[i,j+7]:=str;
          10:  //����������
            E.cells[i,j+8]:=str;
          11:  //�������
            E.cells[i,j+9]:=str;
          12:  //��������
            E.cells[i,j+10]:=str;
        end;
        dmAbiturientOtchety.adospAbitExForZhurnal.Next;
      end;
    j:=j+11;
    if balls>0 then
      E.cells[i,j]:=FloatToStrF(balls/exCount,ffFixed,3,1);inc(j);
    if balls>0 then
      E.cells[i,j]:=IntToStr(balls);
    j:= j+4;
    if dmAbiturientOtchety.adospAbitZhurnal.FieldByName('IsMain').AsBoolean then
      E.cells[i,j]:= '��'
    else
      E.cells[i,j]:= '���';
    //if ik_spec_fac= 73 then
     // str:='
    dmAbiturientOtchety.adospAbitZhurnal.Next;
    inc(k);
    inc(i);
  end;
  //��������� ���������, ������������� � ����
  dmUgtuStructure.adoqSpecFac.Open;
  dmUgtuStructure.adoqSpecFac.Filter:='';
  if dmUgtuStructure.adoqSpecFac.Locate('ik_spec_fac',ik_spec_fac,[loCaseInsensitive]) then
  begin
     str:=dmUgtuStructure.adoqSpecFacCname_spec.AsString;
     FindRange := E.Cells.Replace(What := '#����#',Replacement:=str);
     str:=dmUgtuStructure.adoqSpecFacCshort_name_fac.AsString;
     FindRange := E.Cells.Replace(What := '#���#',Replacement:=str);
    if (dmUgtuStructure.adoqSpecFacik_direction.AsInteger=2) then
       E.ActiveSheet.Name:=dmUgtuStructure.adoqSpecFacCshort_name_fac.AsString+' '+dmUgtuStructure.adoqSpecFacCshort_spec.AsString
     else
       E.ActiveSheet.Name:=dmUgtuStructure.adoqSpecFacCshort_name_fac.AsString+' '+dmUgtuStructure.adoqSpecFacCshort_spec.AsString
                    +dmUgtuStructure.adoqSpecFacik_direction.AsString;
  end;
  FindRange := E.Cells.Replace(What := '#����#',Replacement:=ZhDate);
end;

//������� ������� �� 1 ���� � �� ������������ �������������
function TAbitOtchetsController.ExportDaysMagToExcel(ik_spec_fac:Variant; zurDate:TDateTime): boolean;
var  E:Variant;
  str:string;
begin
  result:=false;
//��������� ��o������ �������
  if not OpenAllStat(null,ik_spec_fac,zurDate) then
  begin
    exit;
  end;

  TApplicationController.GetInstance.AddLogEntry('������ ������� ������������� �� '+DateToStr(zurDate));

  E := CreateOleObject('Excel.Application');
  try
   try
	  //frmAbitZhurnal.dbdtmDate.Value:=Date();
	  str := ExtractFilePath(Application.ExeName)+'reports\Zhurnal.XLT';
	  E.WorkBooks.Add(str);
	  E.Visible := false;
    E.DisplayAlerts:= false;
	  E.Sheets[1].Select;
	  PrintMag(ik_spec_fac,E,DateToStr(zurDate));
	  //E.Sheets[1].PageSetup.LeftFooter:='&5' + TApplicationController.GetInstance.DocumentFooter;
    E.Visible := true;
    E.DisplayAlerts:= true;
    result:= true;
   except
    on Ex:Exception do
    begin
    raise EApplicationException.Create('��������� ������ ��� �������� ������ � Excel.', Ex);
    E.Quit;
    end;
   end;
  finally
    E:= UnAssigned;
  end;
end;

//������ ������� ����� ����� ��� �������
//��������� ���� Excel
procedure TAbitOtchetsController.SetSizes(sh:Variant);
var SmInPoint:real;
begin
  try
    SmInPoint:=0.035; //���-�� �� � 1 �����
    sh.PageSetup.Orientation:=2; //��������� ����������
      sh.Range['A1:AE1'].RowHeight:=22.5;
      sh.Range['A2:AE2'].RowHeight:=19;
      sh.Range['A3:AE3'].RowHeight:=84;
      sh.Range['A4:AE7'].RowHeight:=105;
      sh.Range['A1'].ColumnWidth:=5.14;
      sh.Range['B1'].ColumnWidth:=6;
      sh.Range['C1'].ColumnWidth:=18.43;
      sh.Range['D1'].ColumnWidth:=5.86;
      sh.Range['E1'].ColumnWidth:=3.43;
      sh.Range['F1'].ColumnWidth:=12.29;
      sh.Range['G1'].ColumnWidth:=13.14;
      sh.Range['H1'].ColumnWidth:=11.43;
      sh.Range['I1'].ColumnWidth:=29.86;
      sh.Range['J1'].ColumnWidth:=24.43;
      sh.Range['K1'].ColumnWidth:=4.86;
      sh.Range['L1'].ColumnWidth:=4.86;
      sh.Range['M1'].ColumnWidth:=12.29;
      sh.Range['N1'].ColumnWidth:=8.71;
      sh.Range['O1'].ColumnWidth:=5.4;
      sh.Range['P1:AB1'].ColumnWidth:=3.57;
      //sh.Range['R1'].ColumnWidth:=8.57;
      sh.Range['AA1'].ColumnWidth:=5.29;
      sh.Range['AC1'].ColumnWidth:=9.43;
      sh.Range['AD1'].ColumnWidth:=17;
      sh.Range['AE1'].ColumnWidth:=8.43;
      sh.Range['AF1'].ColumnWidth:=7;
      //������ ���� � ��������
      sh.PageSetup.LeftMargin:=1/SmInPoint;
      sh.PageSetup.RightMargin:=1/SmInPoint;
      sh.PageSetup.TopMargin:=1.2/SmInPoint;
      sh.PageSetup.BottomMargin:=1/SmInPoint;
      sh.PageSetup.Order:=2;
  except

  end;

end;

//������� ���� ��������� ��������
function TAbitOtchetsController.ExportAllZhurnals(zurDate:TDateTime): boolean;
var  E:Variant;
  str:string;
  count:integer;  //���-�� ������ � �����
  fl:boolean;  //���������, ������� �� ��������� ����� ����
begin
  TApplicationController.GetInstance.AddLogEntry('������ ���� �������� �������������� �� '+DateToStr(zurDate));

  E := CreateOleObject('Excel.Application');
  try
   try
	  str := ExtractFilePath(Application.ExeName)+'reports\Zhurnal.XLT';
	  E.WorkBooks.Add(str);
	  E.Visible := false;
	  E.Sheets[1].Select;
	  //���������� ���� ��������������, �� ������� ������� ������
	  //� ������� ������������
	  dm.adoqAbitSpecPermisions.Open;
	  //�������� ���� ������ �� ���� ��������������
	  dm.adoqAbitSpecPermisions.First;
	  fl:=true; count:=1;
	  dmUgtuStructure.adoqSpecFac.Open;
	  dmUgtuStructure.adoqSpecFac.Filter:='';
	  while not dm.adoqAbitSpecPermisions.Eof do
	  begin
		//�������� ����
		if fl then
		begin
		  //������ ������� ����� ������������ �����
      try
		    if E.Sheets.Count>1 then
			    SetSizes(E.Sheets.item[count-1]);
		    E.sheets.Add(after:=E.sheets.item[count]);
		    inc(count);
		    E.Sheets.item[count-1].Range['A1:AF'+inttoStr(3+4)].Copy;
		    E.Sheets.item[count].Range['A1:AF'+inttoStr(3+4)].Insert;
		    E.Sheets[count-1].Select;
      except

      end;
      fl:=false;
		end;
		if dmUgtuStructure.adoqSpecFac.Locate('ik_spec_fac',dm.adoqAbitSpecPermisionsik_spec_fac.Value,[loCaseInsensitive]) then
		begin
      //��������� ��o������ �������
      if OpenAllStat(null,dmUgtuStructure.adoqSpecFacik_spec_fac.Value,zurDate) then
      begin

        //fl:= false;  
        //break;                     
        PrintMag(dmUgtuStructure.adoqSpecFacik_spec_fac.Value, E,DateToStr(ZurDate));
		    fl:=true;
        //
      end;
      //PrintMag(dmUgtuStructure.adoqSpecFacik_spec_fac.Value, E,DateToStr(ZurDate));
		  //fl:=true;
		end;
		dm.adoqAbitSpecPermisions.Next;
	  end;
	  //������ ������� ����� ������������ �����
	  if E.Sheets.Count>2 then
	  begin
		  SetSizes(E.Sheets.item[count-2]);

	    //������� ������ ��������
		  E.DisplayAlerts:=false;
      E.Sheets[1].Select;
		  //for count:=(count-1) to E.Sheets.count do
      E.Sheets.item[count].Delete;
      if not fl then
        E.Sheets.item[count-1].Delete;
		  E.Sheets[1].Select;
		  E.DisplayAlerts:=true;
	  end;

	  //E.Sheets[1].PageSetup.LeftFooter:='&5' + TApplicationController.GetInstance.DocumentFooter;
    E.Visible := true;
    E.DisplayAlerts:= true;
    result:=true;

   except
    on Ex:Exception do
    begin
    raise EApplicationException.Create('��������� ������ ��� �������� ������ � Excel.', Ex);
    E.Quit;
    end;
   end;
  finally
    E:= UnAssigned;
  end;
end;

//��������� ��� ��������� � ������� ��� ������ ������
function TAbitOtchetsController.OpenDataForItogi:boolean;
begin
  result:=false;
  try

		  dmAbiturientOtchety.adospAbitLangForZhurnal.Close;   //������ ��. ������
		  dmAbiturientOtchety.adospAbitLangForZhurnal.ProcedureName:='ABIT_get_LangvsForZhurnal;1';
		  dmAbiturientOtchety.adospAbitLangForZhurnal.Parameters.Clear;
		  {dmAbiturientOtchety.adospAbitLangForZhurnal.Parameters.CreateParameter('@ik_spec_fac',ftInteger,pdInput,4,ik_spec_fac);
		  dmAbiturientOtchety.adospAbitLangForZhurnal.Parameters.CreateParameter('@dd_pod_zayav',ftDateTime,pdInput,8,dd_pod_zayav);
		  dmAbiturientOtchety.adospAbitLangForZhurnal.Parameters.CreateParameter('@NNyear',ftInteger,pdInput,4,year);
		  }dmAbiturientOtchety.adospAbitLangForZhurnal.Open;

		  dmAbiturientOtchety.adospAbitExForZhurnal.Close;   //������ ���������
		  dmAbiturientOtchety.adospAbitExForZhurnal.ProcedureName:='ABIT_Get_ekz_Spisok_ForZhurnal;1';
		  dmAbiturientOtchety.adospAbitExForZhurnal.Parameters.Clear;
		 { dmAbiturientOtchety.adospAbitExForZhurnal.Parameters.CreateParameter('@ik_spec_fac',ftInteger,pdInput,4,ik_spec_fac);
		  dmAbiturientOtchety.adospAbitExForZhurnal.Parameters.CreateParameter('@dd_pod_zayav',ftDateTime,pdInput,8,dd_pod_zayav);
		  dmAbiturientOtchety.adospAbitExForZhurnal.Parameters.CreateParameter('@NNyear',ftInteger,pdInput,4,year);
		 } dmAbiturientOtchety.adospAbitExForZhurnal.Open;

		  dmAbiturientOtchety.adospAbitAddressForZhurnal.Close;   //������
		  dmAbiturientOtchety.adospAbitAddressForZhurnal.ProcedureName:='ABIT_get_AddrForZhurnal;1';
		  dmAbiturientOtchety.adospAbitAddressForZhurnal.Parameters.Clear;
		 { dmAbiturientOtchety.adospAbitAddressForZhurnal.Parameters.CreateParameter('@ik_spec_fac',ftInteger,pdInput,4,ik_spec_fac);
		  dmAbiturientOtchety.adospAbitAddressForZhurnal.Parameters.CreateParameter('@dd_pod_zayav',ftDateTime,pdInput,8,dd_pod_zayav);
		  dmAbiturientOtchety.adospAbitAddressForZhurnal.Parameters.CreateParameter('@NNyear',ftInteger,pdInput,4,year);
		  }dmAbiturientOtchety.adospAbitAddressForZhurnal.Open;
  result:= true;

  except
    on E:Exception do
    raise EApplicationException.Create('��������� ������ ��� �������� ������ ��� ������ � �������.', E);
  end;
end;

//��������� ������ ������������ ��� ������ ������
function TAbitOtchetsController.GetAbitListForItogi(year,ik_spec_fac:Variant):boolean;
begin
  result:=false;
  try
		  //��������� ��������� �������
		  dmAbiturientOtchety.adospItogiPostuplAbitList.Close;   //����� ����������
		  dmAbiturientOtchety.adospItogiPostuplAbitList.ProcedureName:='ABIT_get_AbitListForItogiPostupl;1';
		  dmAbiturientOtchety.adospItogiPostuplAbitList.Parameters.Clear;
		  dmAbiturientOtchety.adospItogiPostuplAbitList.Parameters.CreateParameter('@ik_spec_fac',ftInteger,pdInput,4,ik_spec_fac);
		  dmAbiturientOtchety.adospItogiPostuplAbitList.Parameters.CreateParameter('@NNyear',ftInteger,pdInput,4,year);
		  //dmAbiturientOtchety.adospAbitZhurnal.Parameters.CreateParameter('@RETURN_VALUE',ftBCD,pdReturnValue,0,0);
		  dmAbiturientOtchety.adospItogiPostuplAbitList.Open;
      if dmAbiturientOtchety.adospItogiPostuplAbitList.RecordCount>0 then
           result:= true;

  except
  on E:Exception do
    raise EApplicationException.Create('��������� ������ ��� �������� ������ ��� ������ � �������.', E);
  end;
end;


//��������������� ������ ������ �� 1 �������������
procedure TAbitOtchetsController.PrintItogiPost(ik_spec_fac:integer; E:Variant);
var i,j,k,d,balls,exCount, m, count, abitcount:integer;
      //sh:Variant;
      //spec:integer;
      str, kat_zach:string;
      //FindRange: Variant;
      print:boolean;
begin
  m:=6;    //���-�� ������������ �� ����� �����
  //���������� ���-�� ������
  count:=(dmAbiturientOtchety.adospItogiPostuplAbitList.RecordCount div m)+4;
  if (dmAbiturientOtchety.adospItogiPostuplAbitList.RecordCount mod m)>0 then
    inc(count);
    //��������� ������ ��������
  for i:=1 to count-1 do
  begin
     E.Range['A1:Y'+inttoStr(3+m)].Copy;
     E.Range['A'+inttoStr(i*(3+m)+1)+':Y'+inttoStr((i+1)*(3+m))].Insert;
     E.Range['A'+inttoStr(i*(3+m)+1)+':Y'+inttoStr(i*(3+m)+1)].RowHeight:=38;
     E.Range['A'+inttoStr(i*(3+m)+2)+':Y'+inttoStr(i*(3+m)+1)].RowHeight:=24;
     E.Range['A'+inttoStr(i*(3+m)+3)+':Y'+inttoStr(i*(3+m)+3)].RowHeight:=91;
     E.Range['A'+inttoStr(i*(3+m)+4)+':Y'+inttoStr((i+1)*(3+m))].RowHeight:=108;
  end;
  dmUgtuStructure.adoqSpecFac.Open;
  dmUgtuStructure.adoqSpecFac.Filter:='';
  dmUgtuStructure.adoqSpecFac.Locate('ik_spec_fac',ik_spec_fac,[loCaseInsensitive]);
  //�������� �����
  i:=4; //� ������ � Excel
  k:=1; //� ������������� �����������
  abitcount:=1;
  dmAbiturientOtchety.adospItogiPostuplAbitList.First;
  kat_zach:= '';
  while not dmAbiturientOtchety.adospItogiPostuplAbitList.Eof do
  begin
    if (k>1) and (((k-1) mod m)=0) then
      i:=i+3;
    j:=1;
    if (kat_zach <> dmAbiturientOtchety.adospItogiPostuplAbitList.FieldByName('Cname_kat_zach').AsString) then
    begin
      if (dmAbiturientOtchety.adospItogiPostuplAbitList.FieldByName('ik_kat_zach').Value=1) or
        (dmAbiturientOtchety.adospItogiPostuplAbitList.FieldByName('ik_kat_zach').Value=10) or
        (dmAbiturientOtchety.adospItogiPostuplAbitList.FieldByName('ik_kat_zach').Value=9) or
        (dmAbiturientOtchety.adospItogiPostuplAbitList.FieldByName('ik_kat_zach').Value=19)  then
      begin
        d:=m-((k-1) mod m);
        if d<m then
        begin
          k:=k+d;
          i:=i+d;
          continue;
        end;
      end;

      inc(k);
      if (k>2) and (((k-1) mod m)=0) then
      begin
        inc(i);
        continue;
      end;

      E.Range['A'+inttoStr(i)+':Y'+inttoStr(i)].Merge(true);
      E.Range['A'+inttoStr(i)+':Y'+inttoStr(i)].VerticalAlignment:=xlVAlignCenter;
      E.Range['A'+inttoStr(i)+':Y'+inttoStr(i)].Font.Size:=17;
      kat_zach:= dmAbiturientOtchety.adospItogiPostuplAbitList.FieldByName('Cname_kat_zach').AsString;
      E.cells[i,j]:= dmUgtuStructure.adoqSpecFacCshort_spec.AsString+' '+kat_zach;
      inc(i);
      continue;
    end;
    //����� ����� ����������
    //E.cells[i,j]:=IntToStr(abitcount);
    inc(j);
    E.cells[i,j]:=dmAbiturientOtchety.adospItogiPostuplAbitList.FieldByName('RegNomer').AsString; inc(j);
    E.cells[i,j]:=dmAbiturientOtchety.adospItogiPostuplAbitList.FieldByName('Studname').AsString; inc(j);
    E.cells[i,j]:=dmAbiturientOtchety.adospItogiPostuplAbitList.FieldByName('Dd_birth').AsString; inc(j);
    if dmAbiturientOtchety.adospItogiPostuplAbitList.FieldByName('lSex').Value then
       E.cells[i,j]:='�'
    else
       E.cells[i,j]:='�';   inc(j);

    //�����������
    str:='';
    str:=dmAbiturientOtchety.adospItogiPostuplAbitList.FieldByName('cName_zaved').AsString;
    if str<>'' then
       str:=str+', '+dmAbiturientOtchety.adospItogiPostuplAbitList.FieldByName('Ngodokon').AsString+' ���'
    else
       str:=dmAbiturientOtchety.adospItogiPostuplAbitList.FieldByName('Ngodokon').AsString+' ���';
    E.cells[i,j]:=str;

    str:='';  //����� ������, ���������
     inc(j);
    if dmAbiturientOtchety.adospItogiPostuplAbitList.FieldByName('Cname_pred').AsString<>'' then
      str:=dmAbiturientOtchety.adospItogiPostuplAbitList.FieldByName('Cname_pred').AsString;
    if dmAbiturientOtchety.adospItogiPostuplAbitList.FieldByName('cDolgnost').AsString<>'' then
      if str<>'' then
        str:=str+', '+dmAbiturientOtchety.adospItogiPostuplAbitList.FieldByName('cDolgnost').AsString
      else
        str:=dmAbiturientOtchety.adospItogiPostuplAbitList.FieldByName('cDolgnost').AsString;
    E.cells[i,j]:=str;   inc(j);
    str:='';
    if (dmAbiturientOtchety.adospItogiPostuplAbitList.FieldByName('StazYear').AsString<>'') then
      str:=dmAbiturientOtchety.adospItogiPostuplAbitList.FieldByName('StazYear').AsString+' ���';
    if dmAbiturientOtchety.adospItogiPostuplAbitList.FieldByName('StazMonth').AsString<>'' then
      if str<>'' then
        str:=str+', '+dmAbiturientOtchety.adospItogiPostuplAbitList.FieldByName('StazMonth').AsString+' �������'
      else
        str:=dmAbiturientOtchety.adospItogiPostuplAbitList.FieldByName('StazMonth').AsString+' �������';

    E.cells[i,j]:=str;   inc(j);


    //����� �����a
    str:='';  //�����������
    if dmAbiturientOtchety.adospItogiPostuplAbitList.FieldByName('Ik_Street_fact').AsString<>'' then
      if dmAbiturientOtchety.adospAbitAddressForZhurnal.Locate('Ik_street',
          dmAbiturientOtchety.adospItogiPostuplAbitList.FieldByName('Ik_Street_fact').Value,[loCaseInsensitive]) then
      begin
            str:=dmAbiturientOtchety.adospAbitAddressForZhurnalAddress.AsString+', '+
              dmAbiturientOtchety.adospItogiPostuplAbitList.FieldByName('Addressf').AsString;
      end;

    E.cells[i,j]:=str;

     inc(j);
    if dmAbiturientOtchety.adospItogiPostuplAbitList.FieldByName('ik_medal').Value<>1 then
      E.cells[i,j]:='��'
    else
      E.cells[i,j]:='���';
      inc(j);
    if dmAbiturientOtchety.adospItogiPostuplAbitList.FieldByName('Lobchegit').Value then
      E.cells[i,j]:='��'
    else
      E.cells[i,j]:='���';   inc(j);

    if dmAbiturientOtchety.adospItogiPostuplAbitList.FieldByName('ik_gorod').Value=504 then
      E.cells[i,j]:='��'
    else
      E.cells[i,j]:='���';   inc(j);

    //����� ��. ������
    str:='';
    if dmAbiturientOtchety.adospAbitLangForZhurnal.Locate('nCode',
        dmAbiturientOtchety.adospItogiPostuplAbitList.FieldByName('nCode').Value,[loCaseInsensitive])
      then
      while (not dmAbiturientOtchety.adospAbitLangForZhurnal.Eof) and
          (dmAbiturientOtchety.adospAbitLangForZhurnalnCode.Value=
              dmAbiturientOtchety.adospItogiPostuplAbitList.FieldByName('nCode').Value) do
      begin
        if str='' then
          str:=dmAbiturientOtchety.adospAbitLangForZhurnalCname_lang.AsString
        else
          str:=str+', '+dmAbiturientOtchety.adospAbitLangForZhurnalCname_lang.AsString;
        dmAbiturientOtchety.adospAbitLangForZhurnal.Next;
      end;
    E.cells[i,j]:=str;  inc(j);

    //����� ���������
    balls:=0;  //����� ���-�� ������
    exCount:=0; //���-�� ���������
    print:=false;
    if dmAbiturientOtchety.adospAbitExForZhurnal.Locate('NN_abit',
        dmAbiturientOtchety.adospItogiPostuplAbitList.FieldByName('NN_abit').Value,[loCaseInsensitive])
      then
      while (not dmAbiturientOtchety.adospAbitExForZhurnal.Eof) and
        (dmAbiturientOtchety.adospAbitExForZhurnalNN_abit.Value=
          dmAbiturientOtchety.adospItogiPostuplAbitList.FieldByName('NN_abit').Value) do
      begin
        if ((dmAbiturientOtchety.adospItogiPostuplAbitList.FieldByName('ik_type_kat').Value<>3) and
            (dmAbiturientOtchety.adospItogiPostuplAbitList.FieldByName('proh_ball').AsInteger>dmAbiturientOtchety.adospAbitExForZhurnalcosenka.AsInteger)) then
           print:=true;
        if ((dmAbiturientOtchety.adospAbitExForZhurnalik_disc.Value<>3) or
            (dmAbiturientOtchety.adospItogiPostuplAbitList.FieldByName('lRussian').AsBoolean)) and
            (dmAbiturientOtchety.adospAbitExForZhurnalcosenka.Value>0) then
        begin
          balls:=balls+dmAbiturientOtchety.adospAbitExForZhurnalcosenka.Value;
          inc(exCount);
        end;
        if (dmAbiturientOtchety.adospAbitExForZhurnalik_disc.Value <>3) or
          (dmAbiturientOtchety.adospItogiPostuplAbitList.FieldByName('lRussian').AsBoolean) then
        begin
          if dmAbiturientOtchety.adospAbitExForZhurnalcosenka.AsString<>'' then
            str:=dmAbiturientOtchety.adospAbitExForZhurnalcosenka.AsString
          else
            str:='+';
        end;

        case dmAbiturientOtchety.adospAbitExForZhurnalik_disc.Value of
          1:  //����������
              E.cells[i,j]:=str;
          2:  //������
              E.cells[i,j+1]:=str;
          3:  //�������
            if dmAbiturientOtchety.adospAbitExForZhurnalcosenka.AsString<>'' then
            begin   //�� ��������� �������
              if not dmAbiturientOtchety.adospItogiPostuplAbitList.FieldByName('lRussian').AsBoolean then
              begin
                if dmAbiturientOtchety.adospAbitExForZhurnalcosenka.Value=0 then
                  E.cells[i,j+2]:='�������';
                if dmAbiturientOtchety.adospAbitExForZhurnalcosenka.Value=1 then
                  E.cells[i,j+2]:='�����';
                if dmAbiturientOtchety.adospAbitExForZhurnalcosenka.Value>1 then
                  E.cells[i,j+2]:=dmAbiturientOtchety.adospAbitExForZhurnalcosenka.AsString;
              end
              else    //���������
                E.cells[i,j+2]:=dmAbiturientOtchety.adospAbitExForZhurnalcosenka.AsString;
            end
            else
              E.cells[i,j+2]:='+';
          4:  //�����������
            E.cells[i,j+3]:=str;
          5:  //��������������
            E.cells[i,j+4]:=str;
          8:  //��. �������
            E.cells[i,j+5]:=str;
          7:  //���. �����.
            E.cells[i,j+6]:=str;
          9:  //��������
            E.cells[i,j+7]:=str;
          10:  //����������
            E.cells[i,j+8]:=str;
          11:  //�������
            E.cells[i,j+9]:=str;
          12:  //��������
            E.cells[i,j+10]:=str;
        end;
        dmAbiturientOtchety.adospAbitExForZhurnal.Next;
      end;
    j:=j+11;
    if print then
    begin
       dmAbiturientOtchety.adospItogiPostuplAbitList.Next;
       if (k>1) and (((k-1) mod m)=0) then
          i:=i-3;
       continue;
    end;
    if balls>0 then
      E.cells[i,j]:=IntToStr(balls);
    //if ik_spec_fac= 73 then
     // str:='
    dmAbiturientOtchety.adospItogiPostuplAbitList.Next;
    inc(k);
    inc(i);
    inc(abitcount);
  end;
  //��������� ���������, ������������� � ����
  dmUgtuStructure.adoqSpecFac.Open;
  dmUgtuStructure.adoqSpecFac.Filter:='';
  if dmUgtuStructure.adoqSpecFac.Locate('ik_spec_fac',ik_spec_fac,[loCaseInsensitive]) then
  begin
    if (dmUgtuStructure.adoqSpecFacik_direction.AsInteger=2) then
       E.ActiveSheet.Name:=dmUgtuStructure.adoqSpecFacCshort_name_fac.AsString+' '+dmUgtuStructure.adoqSpecFacCshort_spec.AsString
     else
       E.ActiveSheet.Name:=dmUgtuStructure.adoqSpecFacCshort_name_fac.AsString+' '+dmUgtuStructure.adoqSpecFacCshort_spec.AsString
                    +dmUgtuStructure.adoqSpecFacik_direction.AsString;
  end;
 // E.Range['A'+inttoStr(i)+':Y'+inttoStr((i+10))].Merge(false);
  E.Range['A'+inttoStr(i)+':Y'+inttoStr((i+100))].Delete;
end;

//������ ������� ����� ����� ��� �������
//��������� ���� Excel
procedure TAbitOtchetsController.SetItogiSizes(sh, sh1:Variant);
//var SmInPoint:real;
begin
    {SmInPoint:=0.035; //���-�� �� � 1 �����
    sh.PageSetup.PaperSize:=xlPaperA3;
    sh.PageSetup.Orientation:=sh1.PageSetup.Orientation; //��������� ����������
      sh.Range['A1:AE1'].RowHeight:=sh1.Range['A1:AE1'].RowHeight;
      sh.Range['A2:AE2'].RowHeight:=sh1.Range['A2:AE2'].RowHeight;
      sh.Range['A3:AE3'].RowHeight:=sh1.Range['A3:AE3'].RowHeight;
      sh.Range['A4:AE7'].RowHeight:=sh1.Range['A4:AE7'].RowHeight;
      sh.Range['A1'].ColumnWidth:=sh1.Range['A1'].ColumnWidth;
      sh.Range['B1'].ColumnWidth:=sh1.Range['B1'].ColumnWidth;
      sh.Range['C1'].ColumnWidth:=sh1.Range['C1'].ColumnWidth;
      sh.Range['D1'].ColumnWidth:=sh1.Range['D1'].ColumnWidth;
      sh.Range['E1'].ColumnWidth:=sh1.Range['E1'].ColumnWidth;
      sh.Range['F1'].ColumnWidth:=sh1.Range['F1'].ColumnWidth;
      sh.Range['G1'].ColumnWidth:=sh1.Range['G1'].ColumnWidth;
      sh.Range['H1'].ColumnWidth:=sh1.Range['H1'].ColumnWidth;
      sh.Range['I1'].ColumnWidth:=sh1.Range['I1'].ColumnWidth;
      sh.Range['J1'].ColumnWidth:=sh1.Range['J1'].ColumnWidth;
      sh.Range['K1'].ColumnWidth:=sh1.Range['K1'].ColumnWidth;
      sh.Range['L1'].ColumnWidth:=sh1.Range['L1'].ColumnWidth;
      sh.Range['M1'].ColumnWidth:=sh1.Range['M1'].ColumnWidth;
      sh.Range['N1'].ColumnWidth:=sh1.Range['N1'].ColumnWidth;
      sh.Range['O1'].ColumnWidth:=sh1.Range['O1'].ColumnWidth;
      sh.Range['P1:AB1'].ColumnWidth:=sh1.Range['P1:AB1'].ColumnWidth;
      sh.Range['R1'].ColumnWidth:=sh1.Range['R1'].ColumnWidth;
      sh.Range['AA1'].ColumnWidth:=sh1.Range['AA1'].ColumnWidth;
      sh.Range['AC1'].ColumnWidth:=sh1.Range['AC1'].ColumnWidth;
      sh.Range['AD1'].ColumnWidth:=sh1.Range['AD1'].ColumnWidth;
      sh.Range['AE1'].ColumnWidth:=sh1.Range['AE1'].ColumnWidth;
      //������ ���� � ��������
      sh.PageSetup.LeftMargin:=sh1.PageSetup.LeftMargin;
      sh.PageSetup.RightMargin:=sh1.PageSetup.RightMargin;
      sh.PageSetup.TopMargin:=sh1.PageSetup.TopMargin;
      sh.PageSetup.BottomMargin:=sh1.PageSetup.BottomMargin;
      sh.PageSetup.Order:=sh1.PageSetup.Order; }

end;


//������� ������ ����������� (������)  ��� �������������
procedure TAbitOtchetsController.ExportItogiPostuplForSpec(year, ik_spec_fac:variant);
var  E:Variant;
  str:string;
begin
  TApplicationController.GetInstance.AddLogEntry('������� ������ ����������� �� �������������.');

  E := CreateOleObject('Excel.Application');
  try
   try
	  str := ExtractFilePath(Application.ExeName)+'reports\AbitAllZhurnals.XLT';
	  E.WorkBooks.Add(str);
	  E.Visible := false;
    E.DisplayAlerts:= false;
	  E.Sheets[1].Select;
    OpenDataForItogi; //��������� ����������� ������
	  //�������� ���� ������ �� ���� ��������������

	  dmUgtuStructure.adoqSpecFac.Open;
	  dmUgtuStructure.adoqSpecFac.Filter:='';
		if dmUgtuStructure.adoqSpecFac.Locate('ik_spec_fac',ik_spec_fac,[loCaseInsensitive]) then
		begin
      //��������� ��o������ �������
      if GetAbitListForItogi(year,ik_spec_fac) then
      begin
        PrintItogiPost(dmUgtuStructure.adoqSpecFacik_spec_fac.Value, E);
      end;
		end;
		  E.DisplayAlerts:=true;
	  //E.Sheets[1].PageSetup.LeftFooter:='&5' + TApplicationController.GetInstance.DocumentFooter;
    E.Visible := true;
    E.DisplayAlerts:= true;

   except
    on Ex:Exception do
    begin
    raise EApplicationException.Create('��������� ������ ��� �������� ������ � Excel.', Ex);
    E.Quit;
    end;
   end;
  finally
    E:= UnAssigned;
  end;
end;


//������� ������ ����������� (������)
procedure TAbitOtchetsController.ExportItogiPostupl(year:variant);
var  E:Variant;
  str:string;
  count:integer;  //���-�� ������ � �����
  fl:boolean;  //���������, ������� �� ��������� ����� ����
begin
  TApplicationController.GetInstance.AddLogEntry('������ ����� ������ �����������.');

  E := CreateOleObject('Excel.Application');
  try
   try
	  str := ExtractFilePath(Application.ExeName)+'reports\AbitAllZhurnals.XLT';
	  E.WorkBooks.Add(str);
	  E.Visible := false;
    E.DisplayAlerts:= false;
	  E.Sheets[1].Select;
    OpenDataForItogi; //��������� ����������� ������
	  //���������� ���� ��������������, �� ������� ������� ������
	  //� ������� ������������
	  dm.adoqAbitSpecPermisions.Open;
	  //�������� ���� ������ �� ���� ��������������
	  dm.adoqAbitSpecPermisions.First;
	  fl:=true; count:=1;
	  dmUgtuStructure.adoqSpecFac.Open;
	  dmUgtuStructure.adoqSpecFac.Filter:='';
	  while not dm.adoqAbitSpecPermisions.Eof do
    //if not dm.adoqAbitSpecPermisions.Eof then
	  begin
		//�������� ����
		if fl then
		begin
		  //������ ������� ����� ������������ �����
		  {if E.Sheets.Count>1 then
			SetSizes(E.Sheets.item[count-1]);  }
		  E.sheets.Add(after:=E.sheets.item[count]);
		  inc(count);
		 { E.Sheets.item[count-1].Range['A1:Y'+inttoStr(3+4)].Copy;
		  E.Sheets.item[count].Range['A1:Y'+inttoStr(3+4)].Insert;   }
      E.Sheets[1].Range['A1:Y'+inttoStr(50)].EntireColumn.Copy(EmptyParam); // �������� � ��
      E.Sheets[count].Paste(E.Sheets.item[count].Range['A1:Y'+inttoStr(50), EmptyParam], EmptyParam);
      E.Sheets[1].Range['A1:Y'+inttoStr(50)].EntireRow.Copy(EmptyParam); // �������� � ��
      E.Sheets[count].Paste(E.Sheets.item[count].Range['A1:Y'+inttoStr(50), EmptyParam], EmptyParam);
      E.Sheets[count].PageSetup.PaperSize:=xlPaperA3;
		  E.Sheets[count-1].Select;
      fl:=false;
		end;
		if dmUgtuStructure.adoqSpecFac.Locate('ik_spec_fac',dm.adoqAbitSpecPermisionsik_spec_fac.Value,[loCaseInsensitive]) then
		begin
      //��������� ��o������ �������
      if GetAbitListForItogi(year,dmUgtuStructure.adoqSpecFacik_spec_fac.Value) then
      begin
        PrintItogiPost(dmUgtuStructure.adoqSpecFacik_spec_fac.Value, E);
		    fl:=true;
      end;
		end;
		dm.adoqAbitSpecPermisions.Next;
	  end;
	  //������ ������� ����� ������������ �����
	  if E.Sheets.Count>2 then
	  begin
		  //SetItogiSizes(E.Sheets.item[count-2],E.Sheets.item[1]);

	    //������� ������ ��������
      E.Sheets[1].Select;
		  //for count:=(count-1) to E.Sheets.count do
      E.Sheets.item[count].Delete;
      if not fl then
        E.Sheets.item[count-1].Delete;
		  E.Sheets[1].Select;
		  E.DisplayAlerts:=true;
	  end;

	  //E.Sheets[1].PageSetup.LeftFooter:='&5' + TApplicationController.GetInstance.DocumentFooter;
    E.Visible := true;
    E.DisplayAlerts:= true;

   except
    on Ex:Exception do
    begin
    raise EApplicationException.Create('��������� ������ ��� �������� ������ � Excel.', Ex);
    E.Quit;
    end;
   end;
  finally
    E:= UnAssigned;
  end;
end;

//������� ������ ������������ �� �������������� ������������� � Excel
procedure TAbitOtchetsController.ExportAbitListForDopspecToExcel(nnyear:integer );
const l=2;            //���-�� ����� ���������
      m=46;           //���-�� ������������ �� 1 ��������
      exEnd='G';
var
  E: Variant;
  pagecount, specNumber:integer;
  path, sort:string;
  i,j, abitcount :integer;
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:=OpenAbitListForDopSpec( nnyear);
  try
    E:= CreateOleObject('Excel.Application');
    try
	    path := ExtractFilePath(Application.ExeName)+'reports\AbitDopSpec.XLT';
	    E.WorkBooks.Add(path);
      E.DisplayAlerts:=false;

      abitcount:=1;
      pagecount:=2;
      i:= l+1;
      //FAbitListDataSetInstance.FieldByName('').AsString
      try
        tempStoredProc.First;
        try
        while true do
        begin
          if (specNumber<>tempStoredProc.FieldByName('SpecNumber').Value) or
              (tempStoredProc.Eof) then
          begin
            //��������������� ������ �������������
            if specNumber > -1 then
            begin
              dec(i);
              j:= ((abitcount-1) mod m);
              if j>0 then
              begin
                E.range['A'+IntToStr(i-j)+':'+exEnd+IntToStr(i)].Borders.Weight:=2;
                //E.Sheets[pagecount-1].PageSetup.LeftFooter:='&5' + TApplicationController.GetInstance.DocumentFooter;
              end;

            end;
            if tempStoredProc.Eof then
               break;
            //��������� �������� � �����������
            E.sheets.Add(after:=E.sheets.item[pagecount-1]);
						E.Sheets[1].Range['A1:'+exEnd+inttoStr(50)].EntireColumn.Copy(EmptyParam); // �������� � ��
						E.Sheets[pagecount].Paste(E.Sheets.item[pagecount].Range['A1:'+exEnd+inttoStr(50), EmptyParam], EmptyParam);
						E.Sheets[1].Range['A1:'+exEnd+inttoStr(50)].EntireRow.Copy(EmptyParam); // �������� � ��
						E.Sheets[pagecount].Paste(E.Sheets.item[pagecount].Range['A1:'+exEnd+inttoStr(50), EmptyParam], EmptyParam);
            E.Sheets[pagecount].PageSetup.LeftMargin:=E.Sheets[1].PageSetup.LeftMargin;
            E.Sheets[pagecount].PageSetup.RightMargin:=E.Sheets[1].PageSetup.RightMargin;
            E.Sheets[pagecount].PageSetup.TopMargin:=E.Sheets[1].PageSetup.TopMargin;
            E.Sheets[pagecount].PageSetup.BottomMargin:=E.Sheets[1].PageSetup.BottomMargin;
            E.Sheets[pagecount].PageSetup.Orientation:=E.Sheets[1].PageSetup.Orientation;
            specNumber:=tempStoredProc.FieldByName('SpecNumber').Value;

            E.Sheets[pagecount].name:= IntToStr(SpecNumber)+'-� �������������';
            E.Sheets[pagecount].Select;
            E.Cells.Replace(What := '#SpecNumber#',Replacement:=IntToStr(SpecNumber));
            //�������� �� ������ �������� �������������
            i:= l+1;
            inc(pagecount);
            abitcount:=1;
          end;

          //��������� ���������
          if (abitcount>1) and (((abitcount-1) mod m)=0) or (tempStoredProc.Eof) then
          begin                  // +exEnd+inttoStr(l)
				 		E.Sheets[pagecount-1].Range['A1:'+exEnd+inttoStr(l)].EntireRow.Copy(EmptyParam); // �������� � ��
						E.Sheets[pagecount-1].Paste(E.Sheets[pagecount-1].Range['A'+inttoStr(i)+':'+exEnd+inttoStr(i+l-1), EmptyParam], EmptyParam);
            dec(i);
            {if tempStoredProc.Eof then
            begin
              j:=(abitcount-1) mod m;
              if j>0 then
              begin
                E.range['A'+IntToStr(i-j)+':'+exEnd+IntToStr(i)].Borders.Weight:=2;
                E.Range['A'+IntToStr(i-j)+':'+exEnd+IntToStr(i)].RowHeight:=54;
              end;
              break;
            end; }
            E.range['A'+IntToStr(i-m)+':'+exEnd+IntToStr(i)].Borders.Weight:=2;
            i:=i+l+1;
          end;

          j:=1;
          E.cells[i,j]:=tempStoredProc.FieldByName('Dopfac').AsString; inc(j);
          E.cells[i,j]:=tempStoredProc.FieldByName('dopSpec').AsString; inc(j);
          E.cells[i,j]:=tempStoredProc.FieldByName('NameStud').AsString; inc(j);
          E.cells[i,j]:=tempStoredProc.FieldByName('RegNomer').AsString; inc(j);
          E.cells[i,j]:=tempStoredProc.FieldByName('sum_ball').AsString; inc(j);
          E.cells[i,j]:=tempStoredProc.FieldByName('osnFac').AsString; inc(j);
          E.cells[i,j]:=tempStoredProc.FieldByName('osnspec').AsString; inc(j);
          tempStoredProc.Next;
          inc(i);     inc(abitcount);
        end;

        except
            E.Quit;
            raise EApplicationException.Create('������ ��� �������� � Excel');
        end;


        if abitcount>1 then
        begin
          E.Sheets[1].Delete;
          E.Sheets[1].Select;
          E.Visible := true;
        end
        else
        begin
          E.Quit;
          raise EApplicationException.Create('����� ������������ ���.');
        end;
      finally
        E:= UnAssigned;
      end;
    except
    end;
    finally
      tempStoredProc.Free;
    end;
end;

//��������� ������ ������������ ��� ���. �������������
function TAbitOtchetsController.OpenAbitListForDopSpec( nnyear:integer):TADOStoredProc;
begin
  Result := TADOStoredProc.Create(nil);
  Result.Connection := dm.DBConnect;
  Result.ProcedureName := 'ABIT_GetAbitListForDopSpec;1';
  Result.Parameters.CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 4, NULL);
  Result.Parameters.CreateParameter('@nnyear', ftInteger, pdInput, 4, nnyear);
  Result.Open;
end;


//��������� ������ ��� �������� ��������� �� �������� ��������
function TAbitOtchetsController.GetAbitDataForGazpromZayavl(NNAbit:integer):TADOStoredProc;
begin
  Result := TADOStoredProc.Create(nil);
  Result.Connection := dm.DBConnect;
  Result.ProcedureName := 'ABIT_get_InfForGazpromZayavl;1';
  Result.Parameters.CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 4, NULL);
  Result.Parameters.CreateParameter('@NN_abit', ftInteger, pdInput, 4, NNAbit);
  Result.Open;
end;

procedure TAbitOtchetsController.GazpromBankStatementToWord(NNAbit: integer);
const MaxNameSymbol=19;
var W, MyRange, table:variant;
    LastName, str, FirstName:string;
    SmInPoint:real;
    i: integer;
    DataForStatement: TADOStoredProc;
begin
  TApplicationController.GetInstance.AddLogEntry('������� � Word ��������� �� �������� �������.');
  DataForStatement:= GetAbitDataForGazpromZayavl(NNAbit);
	try
	  W:=CreateOleObject('Word.Application');
	  str := ExtractFilePath(Application.ExeName)+'reports\ZayavlKartaGazprom.dot';
	  W.Documents.add(str);
	  W.Visible:=false;
	  TGeneralController.Instance.FindAndInsert(W,'#BirthDate#',DataForStatement.FieldByName('Dd_birth').AsString);
    TGeneralController.Instance.FindAndInsert(W,'#FIO#',DataForStatement.FieldByName('FullStudName').AsString);
    TGeneralController.Instance.FindAndInsert(W,'#Citizenship#',DataForStatement.FieldByName('c_grazd').AsString);
    TGeneralController.Instance.FindAndInsert(W,'#BirthPlace#',DataForStatement.FieldByName('Cplacebirth').AsString);
    TGeneralController.Instance.FindAndInsert(W,'#indexPr#',DataForStatement.FieldByName('cIndex_prop').AsString);
    TGeneralController.Instance.FindAndInsert(W,'#AddressPr#',DataForStatement.FieldByName('PropAddress').AsString);
    TGeneralController.Instance.FindAndInsert(W,'#IndexFc#',DataForStatement.FieldByName('cIndex_fact').AsString);
    TGeneralController.Instance.FindAndInsert(W,'#AddressFc#',DataForStatement.FieldByName('FactAddress').AsString);
    TGeneralController.Instance.FindAndInsert(W,'#FormEd#',DataForStatement.FieldByName('Cname_form_ed').AsString);
    TGeneralController.Instance.FindAndInsert(W,'#TelNumber#',DataForStatement.FieldByName('ctelefon').AsString);
    TGeneralController.Instance.FindAndInsert(W,'#SotTelNumber#',DataForStatement.FieldByName('cSotTel').AsString);
    TGeneralController.Instance.FindAndInsert(W,'#eMail#',DataForStatement.FieldByName('cEmail').AsString);
    TGeneralController.Instance.FindAndInsert(W,'#Passport#',DataForStatement.FieldByName('PCd_kem_vidan').AsString);
    TGeneralController.Instance.FindAndInsert(W,'#Non#','����� ����� �����');

    LastName:= DataForStatement.FieldByName('TrLastName').AsString;
    FirstName:= DataForStatement.FieldByName('TrFirstName').AsString;
    str:= LastName;
    if (length(LastName)<(MaxNameSymbol-1)) then
    begin
      if (length(LastName+' '+FirstName)<=MaxNameSymbol) then
        str:= LastName+' '+FirstName
      else
        str:= LastName+' '+Copy(FirstName,1,1);
    end;
    for i := 19 downto  1 do
    begin
      if (length(str) < i) then
        TGeneralController.Instance.FindAndInsert(W,'#'+IntToStr(i),'')
      else
        TGeneralController.Instance.FindAndInsert(W,'#'+IntToStr(i),str[i]);
    end;
    //TGeneralController.Instance.FindAndInsert(W,'#AddressFc#',DataForStatement.FieldByName('FullStudName').AsString);
    if (DataForStatement.FieldByName('lSex').AsBoolean) then
    begin
      TGeneralController.Instance.FindAndInsert(W,'#M#','+');
      TGeneralController.Instance.FindAndInsert(W,'#W#','');
    end
    else
    begin
      TGeneralController.Instance.FindAndInsert(W,'#W#','+');
      TGeneralController.Instance.FindAndInsert(W,'#M#','');
    end;
    
	  W.Visible:=true;
  finally
	  DataForStatement.Free;
  end;

end;


//****************������� ��������� � Excel*******************
//��������� ������ ������������ ��� ���. �������������
procedure TAbitOtchetsController.ExportZayavl(NN_abit:integer);
var
  E: Variant;
  TmplFile: String;
  FindRange: Variant;
//  Range: Variant;
  str, str1: String;   // ������, ������� ����� ��������� � ������ ����� � �������
  i: Integer;
begin
  try

	  dmAbiturientAction.adospPrintZayavl.Close;
	  dmAbiturientAction.adospPrintZayavl.Parameters.ParamByName('@NN_abit').Value:= NN_abit;
	  dmAbiturientAction.adospPrintZayavl.Open;

	  dmAbiturientOtchety.adoPrintExams.Close;
	  dmAbiturientOtchety.adoPrintExams.Parameters.ParamByName('@NN_abit').Value:= NN_abit;
	  dmAbiturientOtchety.adoPrintExams.Open;
	  dmAbiturientOtchety.adoPrintExams.Filter:='cosenka>0';
	  dmAbiturientOtchety.adoPrintExams.Filtered:=true;

    dmAbiturientAction.adospAbit_docsForZayavl.Close;
	  dmAbiturientAction.adospAbit_docsForZayavl.Parameters.ParamByName('@NN_abit').Value:= NN_abit;
	  dmAbiturientAction.adospAbit_docsForZayavl.Open;

    dmStudentSelectionProcs.aspSelLanguage.Close;
    dmStudentSelectionProcs.aspSelLanguage.Parameters.Clear;
    dmStudentSelectionProcs.aspSelLanguage.Parameters.CreateParameter('@code',ftInteger,pdInput,4,
        dmAbiturientAction.adospPrintZayavl.FieldByName('nCode').AsInteger);
    dmStudentSelectionProcs.aspSelLanguage.Open;

	  E := CreateOleObject('Excel.Application');
    try
      E.Visible := false;
		  TmplFile := ExtractFilePath(Application.ExeName)+'reports\Zayavl2016.xlt';
		  E.WorkBooks.Add(TmplFile);
		  E.Sheets[1].Select;
      try
        FillTheZayavl(E);
        E.Visible := true;

      except
      on Ex:Exception do
      begin
        E.Quit;
        raise EApplicationException.Create('������ ��� �������� ��������� � Excel', Ex);
      end;
      end;
    finally
      E:= UnAssigned;

    end;

  finally

  end;

end;

//������������ ������ � ���������
procedure TAbitOtchetsController.FillTheZayavl(E:OleVariant);
var
  FindRange: Variant;
  i: Integer;
  paspMonth: string;  //����� ������ ��������
  zayavlMonth: string;  //����� ������ ���������
  str, str1:string;
begin

    TApplicationController.GetInstance.AddLogEntry('����������. ������� ��������� '+dmAbiturientAction.adospPrintZayavlClastname.AsString);
	  // ����� ����� ��������
	  str := dmAbiturientAction.adospPrintZayavlRegNomer.AsString;
	  FindRange := E.Cells.Replace(What := '#�����#',Replacement:=str);
	  str := dmAbiturientAction.adospPrintZayavlClastname.AsString;
	  FindRange := E.Cells.Replace(What := '#�������#',Replacement:=str);
	  str := dmAbiturientAction.adospPrintZayavlCfirstname.AsString;
	  FindRange := E.Cells.Replace(What := '#���#',Replacement:=str);
	  str := dmAbiturientAction.adospPrintZayavlCotch.AsString;
	  FindRange := E.Cells.Replace(What := '#��������#',Replacement:=str);
	  str := dmAbiturientAction.adospPrintZayavlDd_birth.AsString;
	  FindRange := E.Cells.Replace(What := '#�����#',Replacement:=str);
	  str := dmAbiturientAction.adospPrintZayavlCplacebirth.AsString;
	  FindRange := E.Cells.Replace(What := '#������#',Replacement:=str);
	  str := dmAbiturientAction.adospPrintZayavlc_grazd.AsString;
	  FindRange := E.Cells.Replace(What := '#�����#',Replacement:=str);
	  str := dmAbiturientAction.adospPrintZayavludostover.AsString;
	  FindRange := E.Cells.Replace(What := '#����#',Replacement:=str);
	  str := dmAbiturientAction.adospPrintZayavlPCd_seria.AsString;
	  FindRange := E.Cells.Replace(What := '#������#',Replacement:=str);
	  str := dmAbiturientAction.adospPrintZayavlPNp_number.AsString;
	  FindRange := E.Cells.Replace(What := '#������#',Replacement:=str);
	  str := dmAbiturientAction.adospPrintZayavlPDate.AsString;
	  FindRange := E.Cells.Replace(What := '#�������#',Replacement:=str);
    paspMonth := GetMonthR(dmAbiturientAction.adospPrintZayavlPMonth.Value);
	  FindRange := E.Cells.Replace(What := '#�����#',Replacement:=paspMonth);
	  str := dmAbiturientAction.adospPrintZayavlPYear.AsString;
	  FindRange := E.Cells.Replace(What := '#���#',Replacement:=str);
	  str := dmAbiturientAction.adospPrintZayavlPCd_kem_vidan.AsString;
	  FindRange := E.Cells.Replace(What := '#�����#',Replacement:=str);
	  if (dmAbiturientAction.adospPrintZayavlcIndex_fact.AsString='') then
		  str := ''
	  else
      str:=dmAbiturientAction.adospPrintZayavlcIndex_fact.AsString+', ';
	  str:=str+dmAbiturientAction.adospPrintZayavlAddress1.AsString;
	  FindRange := E.Cells.Replace(What := '#�����1#',Replacement:=str);
	  str := dmAbiturientAction.adospPrintZayavlAddress2.AsString;
	  FindRange := E.Cells.Replace(What := '#�����2#',Replacement:=str);
	  str := dmAbiturientAction.adospPrintZayavlAddress3.AsString;
	  FindRange := E.Cells.Replace(What := '#�����3#',Replacement:=str);
	  str := '';
	  if (dmAbiturientAction.adospPrintZayavlctelefon.AsString<>'') then
		  str := dmAbiturientAction.adospPrintZayavlctelefon.AsString;
	  if (dmAbiturientAction.adospPrintZayavlcSotTel.AsString<>'') then
    begin
		  if (str<>'') then
		    str := str+', '+dmAbiturientAction.adospPrintZayavlcSotTel.AsString
		  else
		    str := dmAbiturientAction.adospPrintZayavlcSotTel.AsString ;
    end;

	  FindRange := E.Cells.Replace(What := '#�������#',Replacement:=str);
	  str := dmAbiturientAction.adospPrintZayavlCname_spec.AsString;
	  FindRange := E.Cells.Replace(What := '#����#',Replacement:=str);
	  str := dmAbiturientAction.adospPrintZayavlCname_fac.AsString;
	  FindRange := E.Cells.Replace(What := '#���#',Replacement:=str);
	  if dmAbiturientAction.adospPrintZayavl.FieldByName('Ik_form_ed').AsInteger=1 then
		 E.Range['B'+inttostr(26)+':B'+inttostr(26)]:='R'
	  else
		 E.Range['G'+inttostr(26)+':G'+inttostr(26)]:='R';

	  case dmAbiturientAction.adospPrintZayavlik_type_kat.AsInteger of
		  1:E.Range['K'+inttostr(27)+':K'+inttostr(27)]:='R';
		  2:E.Range['K'+inttostr(29)+':K'+inttostr(29)]:='R';
		  3:E.Range['K'+inttostr(28)+':K'+inttostr(28)]:='R';
	  end;



	  str := dmAbiturientAction.adospPrintZayavlNgodokon.AsString;
	  FindRange := E.Cells.Replace(What := '#�����#',Replacement:=str);
	  case dmAbiturientAction.adospPrintZayavlAIk_vid_doc.AsInteger of
		  6: //������������������� ������
		    E.Range['AD4:AD4']:='R';
      14: //������������������� ��������
		    E.Range['AD3:AD3']:='R';
		  8: //���������
		    E.Range['AC5:AC5']:='R';
		  7: //�������
		    E.Range['AC6:AC6']:='R';
	  end;

    if (dmAbiturientAction.adospPrintZayavlAIk_vid_doc.AsInteger=14) then
      str:= '���'
    else
      str:= '���';
	  FindRange := E.Cells.Replace(What := '#������#',Replacement:=str);

	  str := dmAbiturientAction.adospPrintZayavlACd_seria.AsString;
	  FindRange := E.Cells.Replace(What := '#�����#',Replacement:=str);
	  str := dmAbiturientAction.adospPrintZayavlANp_number.AsString;
	  FindRange := E.Cells.Replace(What := '#�������#',Replacement:=str);
	  if dmAbiturientAction.adospPrintZayavlik_medal.AsInteger<>1 then
		  E.Range['X'+inttostr(8)+':X'+inttostr(8)]:='R';

	  if dmAbiturientAction.adospPrintZayavlLobchegit.AsBoolean then
		 E.Range['T'+inttostr(15)+':T'+inttostr(15)]:='R'
	  else
		 E.Range['X'+inttostr(15)+':X'+inttostr(15)]:='R';

    if dmAbiturientAction.adospPrintZayavl.FieldByName('IsRussOlimpWinner').AsBoolean then
		 E.Range['Y'+inttostr(9)+':Y'+inttostr(9)]:='R';


	  if ((dmAbiturientAction.adospPrintZayavlAIk_vid_doc.AsInteger=6) or
        (dmAbiturientAction.adospPrintZayavlAIk_vid_doc.AsInteger=14)) then
		 E.Range['P'+inttostr(7)+':P'+inttostr(7)]:='R'
	  else
		if dmAbiturientAction.adospPrintZayavlAIk_vid_doc.AsString<>'' then
		  E.Range['S'+inttostr(7)+':S'+inttostr(7)]:='R';

	  if (not dmAbiturientAction.adospPrintZayavlIsNotFirstEducation.AsBoolean) then
		 E.Range['AA'+inttostr(21)+':AA'+inttostr(21)]:='R';

	  //����� ����������� ������


	  dmStudentSelectionProcs.aspSelLanguage.First;
	  str:='';
	  if (dmStudentSelectionProcs.aspSelLanguage.Eof) then
		E.Range['Y'+inttostr(12)+':Y'+inttostr(12)]:='R';
	  while not dmStudentSelectionProcs.aspSelLanguage.Eof do
	  begin
		  if dmStudentSelectionProcs.aspSelLanguageIk_lang.AsInteger>4 then
      begin
		    if str='' then
			    str:=dmStudentSelectionProcs.aspSelLanguageLang.AsString
		    else
			    str:=str+', '+dmStudentSelectionProcs.aspSelLanguageLang.AsString;
      end;
			case dmStudentSelectionProcs.aspSelLanguageIk_lang.AsInteger of
			  0: //�� ������
				 E.Range['Y'+inttostr(12)+':Y'+inttostr(12)]:='R';
			  1: //����������
				 E.Range['Q'+inttostr(11)+':Q'+inttostr(11)]:='R';
			  2: //�����������
				 E.Range['AB'+inttostr(11)+':AB'+inttostr(11)]:='R';
			  3: //��������
				 E.Range['X'+inttostr(11)+':X'+inttostr(11)]:='R';
			  4: //������
				 E.Range['P'+inttostr(12)+':P'+inttostr(12)]:='R';
			end;
			dmStudentSelectionProcs.aspSelLanguage.Next;
	  end;

	  FindRange := E.Cells.Replace(What := '#��������#',Replacement:=str);
	  if (str<>'') then
		  E.Range['P'+inttostr(12)+':P'+inttostr(12)]:='R';

	  str:=dmAbiturientAction.adospPrintZayavlCLgot.AsString;
	  FindRange := E.Cells.Replace(What := '#������#',Replacement:=str);
	  str:=dmAbiturientAction.adospPrintZayavlFIO.AsString;
	  FindRange := E.Cells.Replace(What := '#���#',Replacement:=str);

	  //����� ���������
	  //E.Sheets[1].Select;
	  dmAbiturientOtchety.adoPrintExams.First;
	  i:=33; //����� ��������� ������
	  while (not dmAbiturientOtchety.adoPrintExams.Eof)
		  and (dmAbiturientOtchety.adoPrintExamscosenka.Value>-1) do
	  begin
			E.Cells[i,1]:='   '+dmAbiturientOtchety.adoPrintExamsname_disc.AsString;
			E.Range['D'+inttostr(i)+':D'+inttostr(i)]:=dmAbiturientOtchety.adoPrintExamscosenka.AsString;
			case dmAbiturientOtchety.adoPrintExamsik_sdach.AsInteger of
				3:  //���������
				E.Range['I'+inttostr(i)+':I'+inttostr(i)]:='+';
				5:  //���
				E.Range['H'+inttostr(i)+':H'+inttostr(i)]:='+';
			end;
			E.Range['J'+inttostr(i)+':J'+inttostr(i)]:=dmAbiturientOtchety.adoPrintExamsNNvedom.AsString;
			dmAbiturientOtchety.adoPrintExams.Next;
			inc(i);
	  end;

	  str := dmAbiturientAction.adospPrintZayavlZDate.AsString;
	  FindRange := E.Cells.Replace(What := '#�����#',Replacement:=str);
    zayavlMonth := GetMonthR(dmAbiturientAction.adospPrintZayavlZMonth.AsInteger);
	  FindRange := E.Cells.Replace(What := '#������#',Replacement:=zayavlMonth);
	  str := dmAbiturientAction.adospPrintZayavlZYear.AsString;
	  FindRange := E.Cells.Replace(What := '#����#',Replacement:=str);
    str := dmAbiturientAction.adospPrintZayavl.FieldByName('cEmail').AsString;
	  FindRange := E.Cells.Replace(What := '#�������#',Replacement:=str);

    if (dmAbiturientAction.adospPrintZayavl.FieldByName('currentIK_kat_zaved').AsInteger < 4) then
      E.Range['O21:Z21'].VerticalAlignment:=integer(xlVAlignDistributed);
	  str := dmAbiturientAction.adospPrintZayavl.FieldByName('EducationLevelName').AsString;
	  FindRange := E.Cells.Replace(What := '#educLevel#',Replacement:=str);

	  //����� ���������, ������� ����� ���������
	  dmAbiturientOtchety.adoPrintExams.Filter:='cosenka<0';
	  dmAbiturientOtchety.adoPrintExams.Filtered:=true;
	  str := '';
	  dmAbiturientOtchety.adoPrintExams.First;
    i:= 40;
	  while not dmAbiturientOtchety.adoPrintExams.Eof do
	  begin
		  E.Cells[i,3]:= str+dmAbiturientOtchety.adoPrintExamsname_disc.AsString;
			case dmAbiturientOtchety.adoPrintExamsik_sdach.AsInteger of
				5:  //���
				  E.Range['G'+inttostr(i)+':G'+inttostr(i)]:='R';
        else
          E.Range['N'+inttostr(i)+':N'+inttostr(i)]:='R';
			end;
      inc(i);
		  dmAbiturientOtchety.adoPrintExams.Next;
	  end;

	  //� ��� �������� ��������� ������ � ��������
	  str:=dmAbiturientAction.adospPrintZayavlCdopsved.AsString;
	  dmAbiturientAction.adospAbit_docsForZayavl.First;
	  str1:='';
	  while not dmAbiturientAction.adospAbit_docsForZayavl.Eof do
	  begin
			if str1='' then
			  str1:= dmAbiturientAction.adospAbit_docsForZayavlcvid_doc.AsString+' '
			else
			  str1:=str1+', '+ dmAbiturientAction.adospAbit_docsForZayavlcvid_doc.AsString+' ';
			if (dmAbiturientAction.adospAbit_docsForZayavlCd_seria.AsString<>'') then
			  str1:= str1+'����� '+dmAbiturientAction.adospAbit_docsForZayavlCd_seria.AsString+' ';
			if (dmAbiturientAction.adospAbit_docsForZayavlNp_number.AsString<>'') then
			  str1:= str1+'� '+dmAbiturientAction.adospAbit_docsForZayavlNp_number.AsString+'';
			dmAbiturientAction.adospAbit_docsForZayavl.Next;
	  end;
	  if (str1<>'') and (str<>'') then
		  str:=str+', '+str1;
	  if (str1<>'') and  (str='') then
		  str:=str1;
	  //E.Sheets[1].PageSetup.LeftFooter:='&5' + TApplicationController.GetInstance.DocumentFooter;


end;


//������� ������ �� ���������������� ����������
procedure TAbitOtchetsController.ExportPredvSpisok(NNyear:integer);
var
  E: Variant;
  TmplFile: String;
  FindRange: Variant;
//  Range: Variant;
  str, str1: String;   // ������, ������� ����� ��������� � ������ ����� � �������
  i: Integer;
begin
  try
	  dmAbiturientOtchety.adospABITGetPredvSpisok.Close;
    dmAbiturientOtchety.adospABITGetPredvSpisok.Parameters.CreateParameter('@NNyear',ftInteger,pdInput,4,NNyear);
	  dmAbiturientOtchety.adospABITGetPredvSpisok.Open;


	  E := CreateOleObject('Excel.Application');
    try
      E.Visible := false;
		  TmplFile := ExtractFilePath(Application.ExeName)+'reports\Zayavl.xlt';
		  E.WorkBooks.Add(TmplFile);
		  E.Sheets[1].Select;
      try
        FillTheZayavl(E);
        E.Visible := true;

      except
      on Ex:Exception do
      begin
        E.Quit;
        raise EApplicationException.Create('������ ��� �������� ��������� � Excel', Ex);
      end;
      end;
    finally
      E:= UnAssigned;

    end;

  finally

  end;

end;


//****************������� ��������� � Excel*******************
//��������� ������ ������������ ��� ���. �������������
procedure TAbitOtchetsController.ExportEnrollAgreement(NN_abit:integer);
var
  Report:TReportBase;
begin
    Report := TReportBase.CreateReport(TAbitEnrollAgreementReport);
    Report.FreeOnComplete := true;
    Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\AbitEnrollAgreement.XLT';
    TAbitEnrollAgreementReport(Report).NN_abit := NN_abit;
    TWaitingController.GetInstance.Process(Report);

end;


// ������� ��������� � ���������� � Excel
procedure TAbitOtchetsController.ExportProtokolToExcel(year: integer);
const
  l = 12; // ���-�� ����� ���������
  m = 1000; // ���-�� ������������ �� 1 ��������
  exEnd = 'E';
  RowHeigh = 45;
  ResultState = '���������';
var
  E: Variant;
  pagecount, spec: Integer;
  path, currentSort: string;
  i, j, AbitCount: Integer;
  FindRange: Variant;
  dateProt: TDateTime;
begin
  if ((YearOf(Date)<>year) and (year>2000)) or (MonthOf(Date) < 6) or (MonthOf(Date) > 8) then
  begin
     dateProt:=StrToDate('15.07.'+IntToStr(year));
  end
  else
    dateProt:=Date;
  if not TGeneralController.Instance.SetReportDate(dateProt, '���������') then
    exit;

  TApplicationController.GetInstance.AddLogEntry
    ('������� ��������� ���������� � Excel');
  with DMAbiturientNabor.adospAbitGetPostupStatistika do
  begin
      DisableControls;
      // �������������
      currentSort := sort;
      //sort := 'dd_pod_zayav,Cshort_name_fac, cname_spec, ik_spec_fac, fio';
      sort := 'ik_spec_fac';
      spec := -1;
      AbitCount := 1;
      i := l + 1;
      try
        First;

  try
    E := CreateOleObject('Excel.Application');
    try
      path := ExtractFilePath(Application.ExeName) + 'reports\AbitProtocol.XLT';
      E.WorkBooks.add(path);
      E.DisplayAlerts := false;

      //E.Visible := true;
        try
          pagecount := 2;
          while true do
          begin

            if (spec <> FieldByName('ik_spec_fac').Value) or (Eof) then
            begin

              // ��������������� ������ �������������
              if spec > -1 then
              begin
                dec(i);
                j := ((AbitCount - 1) mod m);

                if j > 0 then
                begin
                  E.Range['A' + IntToStr(i - j) + ':' + exEnd + IntToStr(i)
                    ].Borders.Weight := 2;
                  E.Range['A' + IntToStr(i - j) + ':' + exEnd + IntToStr(i)
                    ].RowHeight := RowHeigh;
                  E.Range['A' + IntToStr(i+1) + ':' + exEnd + IntToStr(i+3)
                    ].RowHeight := 19;
                end;

                inc(i);
                E.Cells[i, 1] :='������������� ���������';
                E.Range['A'+IntToStr(i)+':B'+IntToStr(i)].HorizontalAlignment:= 2 ;
                E.Range['A'+IntToStr(i)+':B'+IntToStr(i)].Merge(true);

                inc(i);
                E.Cells[i, 1] :='�������� ��������';
                E.Cells[i, 5] := HeadOfPrCom;
                E.Range['D'+IntToStr(i)+':E'+IntToStr(i)].Merge(true);
                E.Range['A'+IntToStr(i)+':B'+IntToStr(i)].Merge(true);
                E.Range['A'+IntToStr(i)+':B'+IntToStr(i)].HorizontalAlignment:= 2 ;
                E.Range['D'+IntToStr(i)+':E'+IntToStr(i)].HorizontalAlignment:= 4 ;

	              FindRange := E.Cells.Replace(What := '#D#',Replacement:=DayOf(dateProt));
	              FindRange := E.Cells.Replace(What := '#Mn#',Replacement:=GetMonthR(MonthOf(dateProt)));
	              FindRange := E.Cells.Replace(What := '#Y#',Replacement:=YearOf(dateProt));
              end;

              if Eof then
                break;

              // ��������� �������� � �����������
              E.Sheets.add(after := E.Sheets.Item[pagecount - 1]);
              E.Sheets[1].Range['A1:' + exEnd + IntToStr(50)
                ].EntireColumn.copy(EmptyParam); // �������� � ��
              E.Sheets[pagecount].Paste(E.Sheets.Item[pagecount].Range
                ['A1:' + exEnd + IntToStr(50), EmptyParam], EmptyParam);
              E.Sheets[1].Range['A1:' + exEnd + IntToStr(50)
                ].EntireRow.copy(EmptyParam); // �������� � ��
              E.Sheets[pagecount].Paste(E.Sheets.Item[pagecount].Range
                ['A1:' + exEnd + IntToStr(50), EmptyParam], EmptyParam);
              E.Sheets[pagecount].PageSetup.LeftMargin :=
                E.Sheets[1].PageSetup.LeftMargin;
              E.Sheets[pagecount].PageSetup.RightMargin :=
                E.Sheets[1].PageSetup.RightMargin;
              E.Sheets[pagecount].PageSetup.TopMargin :=
                E.Sheets[1].PageSetup.TopMargin;
              E.Sheets[pagecount].PageSetup.BottomMargin :=
                E.Sheets[1].PageSetup.BottomMargin;
              E.Sheets[pagecount].PageSetup.Orientation :=
                E.Sheets[1].PageSetup.Orientation;
              E.Sheets[pagecount].Name := FieldByName('Cshort_name_fac').AsString + ' ' +
                  FieldByName('Cshort_spec').AsString +
                  FieldByName('ik_spec_fac').AsString;
              E.Sheets[pagecount].Select;
              spec := FieldByName('ik_spec_fac').Value;
              i := l + 1;
              inc(pagecount);
              AbitCount := 1;
            end;

            if (DateToStr(dateProt) <> DateToStr(FieldByName('dd_pod_zayav').Value)) then
            begin
              //ShowMessage(DateToStr(dateProt)+' '+DateToStr(FieldByName('dd_pod_zayav').Value));
              Next;
              Continue;
            end;

            // ��������� ���������
            if (AbitCount > 1) and (((AbitCount - 1) mod m) = 0) then
            begin // +exEnd+inttoStr(l)
              E.Sheets[1].Range['A1:' + exEnd + IntToStr(l)
                ].EntireRow.copy(EmptyParam); // �������� � ��
              E.Sheets[pagecount - 1]
                .Paste(E.Sheets[pagecount - 1].Range['A' + IntToStr(i) + ':' +
                exEnd + IntToStr(i + l - 1), EmptyParam], EmptyParam);
              dec(i);
              E.Range['A' + IntToStr(i - m) + ':' + exEnd + IntToStr(i)
                ].Borders.Weight := 2;
              E.Range['A' + IntToStr(i - m) + ':' + exEnd + IntToStr(i)
                ].RowHeight := RowHeigh;
              i := i + l + 1;
            end;

            j := 1;
            E.Cells[i, j] := AbitCount;
            inc(j);
            E.Cells[i, j] := FieldByName('fio').AsString;
            inc(j);
            E.Cells[i, j] := FieldByName('zach').AsString;
            inc(j);
            E.Cells[i, j] := FieldByName('cName_zaved').AsString;
            inc(j);
            E.Cells[i, j] := ResultState;
            inc(j);
            Next;
            inc(i);
            inc(AbitCount);
        end;

        except
          on Ex: Exception do
          begin
            E.Quit;
            raise EApplicationException.Create
              ('������ ��� �������� � Excel', Ex);
          end;
        end;

        if (AbitCount > 1) or (pagecount > 1) then
        begin
          E.Sheets[1].Delete;
          E.Sheets[1].Select;
          // E.Sheets[1].PageSetup.LeftFooter:='&5' + TApplicationController.GetInstance.DocumentFooter;
          E.Visible := true;
        end
        else
        begin
          E.Quit;
          raise EApplicationException.Create('��� ����������� ������������');
        end;

      finally
        E := UnAssigned;
      end;
    except
    end;
  finally
    sort:= currentSort;
    EnableControls;
  end;
  end;
end;
end.
