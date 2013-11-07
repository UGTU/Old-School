{
    ������ � �������������� OLE-�������� (MS Office)
    ����������� ������ �� DataSet � DBGrid

    ������: 1.0.0.3
    �������: 27.09.2009
    ��������� ������:
    �����: ������� �.�.

}
unit ReportDataSet;
   {#Author tanyav@ist.ugtu.net}
interface
uses
  Classes, SysUtils, ExcelXP, Barcode, Contnrs, XIntf, CommonIntf, ReportsBase,
  ADODB, DB, GridsEh, DBGrids, DBGridEh;
type

  // ������� ����� ��� �������� DataSet (DBGrid) � Excel
  TExcelBaseReportDataSet = class(TExcelReportBase)
  private
    FDataSet: TDataSet;
    FFirstRowNum: integer;
    FFirstColNum: integer;

  protected
    procedure Execute;override;
    //��������� ������� �� �������
    function IsVisibleCol(ColName:string): boolean; virtual; abstract;
    function GetColDisplayName(ColName: string): string; virtual;abstract;
    function GetTotalSteps: Integer; override;
  public
    constructor Create(AOwner : TComponent);override;
    destructor Destroy;override;
    property DataSet: TDataSet read FDataSet write FdataSet;
    property FirstRowNum: integer read FFirstRowNum write FFirstRowNum; //����� ������ ������ � Excel
    property FirstColNum: integer read FFirstColNum write FFirstColNum; //����� ������� ������� � Excel

  end;


  // ����� ��� �������� DataSet � Excel
  TExcelReportDataSet = class(TExcelBaseReportDataSet)
  private

  protected
    //��������� ������� �� �������
    function IsVisibleCol(ColName:string): boolean; override;
    function GetColDisplayName(ColName: string): string; override;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy;override;
  end;


  // ����� ��� �������� DBGrid � Excel
  TExcelReportDBGrid = class(TExcelBaseReportDataSet)
  private

    FDBGrid: TDBGridEh;
  protected
    //��������� ������� �� �������
    function IsVisibleCol(ColName:string): boolean; override;
    function GetColDisplayName(ColName: string): string; override;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    property DBGrid:TDBGridEh read FDBGrid write FDBGrid;
  end;

implementation

{ TExcelReportBase }

constructor TExcelBaseReportDataSet.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TExcelBaseReportDataSet.Destroy;
begin
  inherited;
end;

procedure TExcelBaseReportDataSet.Execute;
//const
var DSColNumber: integer;    //������� ����� ������� � dataSet
  ExcColNumber, ExcRowNumber: integer;  //������� ������ ������ � ������� � Excel
  stepsInc: integer;    //���-�� ����� ��� �����������
  x: string;
begin
  if (FirstRowNum<1) then
    FirstRowNum := 1;

  if (FirstColNum<1) then
    FirstColNum := 1;

  //Items[FirstRowNum-1, FirstColNum]:='Begin';
  FDataSet.DisableControls;
  try
	  FDataSet.First;
	  //���� �� ����� ������, ������� �������� ��������
	  if (ReportTemplate='') then
	  begin
		  ExcColNumber:= FirstColNum;
		  for  DSColNumber:= 0 to FDataSet.Fields.Count-1 do
		  begin
		    //���� ������� ������� ��������� ��� ��������
		    if IsVisibleCol(FdataSet.Fields[DSColNumber].FullName) then
		    begin
			    Items[FirstRowNum, ExcColNumber]:= GetColDisplayName(FdataSet.Fields[DSColNumber].FullName);
			    inc(ExcColNumber);
		    end;
		  end;
	  end;

	  stepsInc:= GetTotalSteps() div FDataSet.RecordCount;

	  //������� ������
	  ExcRowNumber:=FirstRowNum+1;
	  while not FDataSet.Eof do
	  begin
		  ExcColNumber:= FirstColNum;
		  for  DSColNumber:= 0 to FDataSet.Fields.Count-1 do
		  begin
		    //���� ������� ������� ��������� ��� ��������
		    if IsVisibleCol(FdataSet.Fields[DSColNumber].FullName) then
		    begin
			    Items[ExcRowNumber, ExcColNumber]:= FDataSet.Fields[DSColNumber].AsString;
			    inc(ExcColNumber);
		    end;

		  end;
		  FDataSet.Next;
		  NextStep(stepsInc, '���������� ������.');
		  inc(ExcRowNumber);
	  end;

  finally
    FDataSet.EnableControls;
  end;

  //������� ���������� ������ �� Z (25 ��������)
  Range[chr(ord('A')+FirstColNum-1)+IntToStr(FirstRowNum),
      chr(ord('A')+ExcColNumber-2)+inttostr(ExcRowNumber-1)].Borders.Weight:=2;
  Range[chr(ord('A')+FirstColNum-1)+IntToStr(FirstRowNum),
      chr(ord('A')+ExcColNumber-2)+inttostr(FirstRowNum)].Font.Bold:=true;
  Range[chr(ord('A')+FirstColNum-1)+IntToStr(FirstRowNum),
      chr(ord('A')+ExcColNumber-2)+inttostr(FirstRowNum)].Interior.ColorIndex:=15;
end;



function TExcelBaseReportDataSet.GetTotalSteps: Integer;
begin
  result:=1000000;
end;

{ TExcelReportDataSet }

constructor TExcelReportDataSet.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TExcelReportDataSet.Destroy;
begin
  inherited;
end;

function TExcelReportDataSet.GetColDisplayName(ColName: string): string;
begin
  result:= DataSet.FieldByName(ColName).DisplayName;
end;

function TExcelReportDataSet.IsVisibleCol(ColName: string): boolean;
begin
  result:= DataSet.FieldByName(ColName).Visible;
end;




{ TExcelReportDBGrid }

constructor TExcelReportDBGrid.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TExcelReportDBGrid.Destroy;
begin
  inherited;
end;

function TExcelReportDBGrid.GetColDisplayName(ColName: string): string;
var ColNumber: integer;
begin
  //(&DBGrid.Columns.FieldAddress(ColName) as TField).
  for ColNumber := 0 to DBGrid.Columns.Count-1 do
  begin
    if (DBGrid.Columns[ColNumber].FieldName = ColName) then
    begin
      result:= DBGrid.Columns[ColNumber].Title.Caption;
      exit;
    end;
  end;
  result:= '';
end;

function TExcelReportDBGrid.IsVisibleCol(ColName: string): boolean;
var ColNumber: integer;
begin
  //(&DBGrid.Columns.FieldAddress(ColName) as TField).
  for ColNumber := 0 to DBGrid.Columns.Count-1 do
  begin
    if (DBGrid.Columns[ColNumber].FieldName = ColName) then
    begin
      result:= DBGrid.Columns[ColNumber].Visible;
      exit;
    end;
  end;
  result:= false;
end;

end.
