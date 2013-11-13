unit Fgos_Application4Report;

interface

uses
Classes, dialogs ,SysUtils, ExcelXP, Barcode, Contnrs, XIntf, CommonIntf,
ReportsBase, db, adodb, comObj;

const TableBeg = 4;  //начало данных в таблице

type
    TFgos_Application4Report= class(TExcelReportBase)
    private
       FDataset:TADODataset;
    protected
       procedure Execute;override;
       function GetTotalSteps:Integer;override;
    public
       constructor Create (AOwner : TComponent; ds : TAdoDataset);
    end;

    implementation

 constructor TFgos_Application4Report.Create (AOwner : TComponent; ds : TAdoDataset);
  begin
  inherited Create(AOwner);
  FDataset := ds;
  end;

  procedure TFgos_Application4Report.Execute;
  var
    i : Integer;
    RangeE: ExcelRange;

  begin
    inherited;
    if FDataset = nil then
     exit;

     if not FDataset.Active then
     begin
     showmessage('Отчет не сформирован!');
     exit;
     end;

    FDataset.First;
    // под свой отчет организовать
    for i := 0 to FDataset.RecordCount-1 do
    begin
      Range['A'+inttostr(TableBeg+i+1),'L'+inttostr(TableBeg+i+1)].NumberFormat := '@';
      Items[TableBeg+1+i,1] := FDataset.FieldByName('short_Name').Value;
      Items[TableBeg+1+i,2] := FDataset.FieldByName('zhach_competence').Value;
      Items[TableBeg+1+i,3] := FDataset.FieldByName('name_level_competence').Value + ': '+#13+
      + FDataset.FieldByName('description_content').Value;
      Range['A'+inttostr(TableBeg+i+1),'C'+inttostr(TableBeg+i+1)].HorizontalAlignment:= 2 ;
      FDataset.Next;
    end;
      Range['A'+inttostr(TableBeg),'C'+intToStr(TableBeg+FDataset.RecordCount)].Borders.Weight:=2;
  end;


  //Определим общее число шагов в создании рапорта
  //Реальное число шагов скорее всего будет равно количеству
  //записей, возвращённых запросом для отчёта
  //Example: Result := MyDataSet.Recordscount;
  function TFgos_Application4Report.GetTotalSteps: Integer;
  begin
    Result := FDataset.RecordCount;
  end;
end.

