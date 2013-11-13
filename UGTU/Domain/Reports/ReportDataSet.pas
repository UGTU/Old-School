{
    Отчёты с использованием OLE-серверов (MS Office)
    выгружающие данные из DataSet и DBGrid

    Версия: 1.0.0.3
    Создано: 27.09.2009
    Последняя правка:
    Автор: Вокуева Т.А.

}
unit ReportDataSet;
   {#Author tanyav@ist.ugtu.net}
interface
uses
  Classes, SysUtils, ExcelXP, Barcode, Contnrs, XIntf, CommonIntf, ReportsBase,
  ADODB, DB, GridsEh, DBGrids, DBGridEh;
type

  // Базовый класс для выгрузки DataSet (DBGrid) в Excel
  TExcelBaseReportDataSet = class(TExcelReportBase)
  private
    FDataSet: TDataSet;
    FFirstRowNum: integer;
    FFirstColNum: integer;

  protected
    procedure Execute;override;
    //проверяет видимый ли столбец
    function IsVisibleCol(ColName:string): boolean; virtual; abstract;
    function GetColDisplayName(ColName: string): string; virtual;abstract;
    function GetTotalSteps: Integer; override;
  public
    constructor Create(AOwner : TComponent);override;
    destructor Destroy;override;
    property DataSet: TDataSet read FDataSet write FdataSet;
    property FirstRowNum: integer read FFirstRowNum write FFirstRowNum; //номер первой строки в Excel
    property FirstColNum: integer read FFirstColNum write FFirstColNum; //номер первого столбца в Excel

  end;


  // Класс для выгрузки DataSet в Excel
  TExcelReportDataSet = class(TExcelBaseReportDataSet)
  private

  protected
    //проверяет видимый ли столбец
    function IsVisibleCol(ColName:string): boolean; override;
    function GetColDisplayName(ColName: string): string; override;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy;override;
  end;


  // Класс для выгрузки DBGrid в Excel
  TExcelReportDBGrid = class(TExcelBaseReportDataSet)
  private

    FDBGrid: TDBGridEh;
  protected
    //проверяет видимый ли столбец
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
var DSColNumber: integer;    //текущий номер столбца в dataSet
  ExcColNumber, ExcRowNumber: integer;  //текущие номера строки и столбца в Excel
  stepsInc: integer;    //кол-во шагов для наращивания
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
	  //если не задан шаблон, заносим названия столбцов
	  if (ReportTemplate='') then
	  begin
		  ExcColNumber:= FirstColNum;
		  for  DSColNumber:= 0 to FDataSet.Fields.Count-1 do
		  begin
		    //если столбец видимый выгружаем его значение
		    if IsVisibleCol(FdataSet.Fields[DSColNumber].FullName) then
		    begin
			    Items[FirstRowNum, ExcColNumber]:= GetColDisplayName(FdataSet.Fields[DSColNumber].FullName);
			    inc(ExcColNumber);
		    end;
		  end;
	  end;

	  stepsInc:= GetTotalSteps() div FDataSet.RecordCount;

	  //выводим данные
	  ExcRowNumber:=FirstRowNum+1;
	  while not FDataSet.Eof do
	  begin
		  ExcColNumber:= FirstColNum;
		  for  DSColNumber:= 0 to FDataSet.Fields.Count-1 do
		  begin
		    //если столбец видимый выгружаем его значение
		    if IsVisibleCol(FdataSet.Fields[DSColNumber].FullName) then
		    begin
			    Items[ExcRowNumber, ExcColNumber]:= FDataSet.Fields[DSColNumber].AsString;
			    inc(ExcColNumber);
		    end;

		  end;
		  FDataSet.Next;
		  NextStep(stepsInc, 'Построение отчета.');
		  inc(ExcRowNumber);
	  end;

  finally
    FDataSet.EnableControls;
  end;

  //границы очерчивает только до Z (25 столбцов)
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
