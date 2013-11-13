unit D_BRSRankAverageReport;

interface
uses
  Classes, dialogs ,SysUtils, ExcelXP, Barcode, Contnrs, XIntf, CommonIntf, ReportsBase, db, adodb, Variants, uBRSBallCounter;

const TableBeg = 6;

type
    TBRSRankAverageReport = class(TExcelReportBase)
    private
       FDataset:TADODataset;
       FGroup:string;
       FSemester:integer;
       FExaminator:string;
       FDate:string;
       FNum:string;
       FIkGroup:integer;
    protected
       procedure Execute;override;
       function GetTotalSteps:Integer;override;
    public
       constructor Create(AOwner : TComponent; dsVed : TAdoDataset; group, module:string;sem, IkGroup:integer);
     end;

    implementation


  constructor TBRSRankAverageReport.Create(AOwner : TComponent; dsVed : TAdoDataset; group, module:string;sem, IkGroup:integer);
  begin
  inherited Create(AOwner);
  FDataset := dsVed;
  FGroup := group;
  FSemester := sem;
  FNum:=module;
  FIkGroup:=ikgroup;
  end;

  procedure TBRSRankAverageReport.Execute;
  var
    i,NameDatasetNum, rc : Integer;
  begin
    inherited;
     if FDataset = nil then
     exit;

    FDataset.Active:=true;

    if not FDataset.Active then
     begin
     showmessage('Невозможно сделать выборку!');
     exit;
     end;

    FDataset.DisableControls;
    try
    FDataset.First;

    Items[1,2] := FGroup;
    Items[2,2] := FSemester;
    Items[3,2] := FNum;

    for i := 0 to FDataset.RecordCount-1 do
    begin
      Range['A'+inttostr(TableBeg+i),'D'+inttostr(TableBeg+i)].NumberFormat := '@';
      Items[TableBeg+i,1] := i+1;
      Items[TableBeg+i,2] := FDataset.FieldByName('StudName').Value;
      Items[TableBeg+i,3] := FDataset.FieldByName('nn_zach').Value;
      Items[TableBeg+i,4] := FDataset.FieldByName('i_balls').Value;
      Range['A'+inttostr(TableBeg+i),'D'+inttostr(TableBeg+i)].Font.Size:=10;
      Range['A'+inttostr(TableBeg+i),'D'+inttostr(TableBeg+i)].Font.Name := 'Times New Roman';
      FDataset.Next;
    end;

    Range['A'+inttostr(TableBeg-1),'D'+intToStr(TableBeg+FDataset.RecordCount-1)].Borders.Weight:=2;

    finally
        FDataset.EnableControls;
    end;
  end;

  //Определим общее число шагов в создании рапорта
  //Реальное число шагов скорее всего будет равно количеству
  //записей, возвращённых запросом для отчёта
  //Example: Result := MyDataSet.Recordscount;
  function TBRSRankAverageReport.GetTotalSteps;
  begin
    Result := FDataset.RecordCount;
  end;

  end.
