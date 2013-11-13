unit D_BRSExamVedomost;
{#Author sergdev@ist.ugtu.net}
interface

uses
  Classes, dialogs ,SysUtils, ExcelXP, Barcode, Contnrs, XIntf, CommonIntf, ReportsBase, db, adodb, Variants, uBRSBallCounter;

const TableBeg = 13;

type
    TBRSExamVedomost = class(TExcelReportBase)
    private
       FDataset:TADODataset;
       FFaculty:string;
       FGroup:string;
       FSemester:integer;
       FDiscipline:string;
       FExaminator:string;
       FDate:string;
       FNum:string;
       FIkDisc:integer;
       FIkGroup:integer;
    protected
       procedure Execute;override;
       function GetTotalSteps:Integer;override;
    public
       constructor Create (AOwner : TComponent; dsVed : TAdoDataset; fac,group,disc,exam, num, date:string;sem, IkDisc, IkGroup:integer);
    end;

    implementation


  constructor TBRSExamVedomost.Create (AOwner : TComponent; dsVed : TAdoDataset; fac,group,disc,exam, num, date:string;sem, IkDisc, IkGroup:integer);
  begin
  inherited Create(AOwner);
  FDataset := dsVed;
  FFaculty := fac;
  FGroup := group;
  FSemester := sem;
  FDiscipline := disc;
  FExaminator := exam;
  FDate:=date;
  FNum:=num;
  FIkGroup:=ikgroup;
  FIkDisc:=ikdisc;
  end;

  procedure TBRSExamVedomost.Execute;
  var
    i,NameDatasetNum, rc : Integer;
  begin
    inherited;
     if FDataset = nil then
     exit;

    FDataset.Active:=true;

    if not FDataset.Active then
     begin
     showmessage('Выберите ведомость для печати!');
     exit;
     end;

    FDataset.DisableControls;
    try
    FDataset.First;

    Range['B15','H21'].Copy(Range['I15','O21']);
    Range['B15','H21'].Clear;
    Range['I15','O21'].Copy(Range['B'+intToStr(TableBeg+2+FDataset.RecordCount-1),'H'+intToStr(TableBeg+8+FDataset.RecordCount-1)]);
    Range['I15','O21'].Clear;

    Items[4,3] := FFaculty;
    Items[5,3] := FGroup;
    Items[6,3] := FSemester;
    Items[7,3] := FDiscipline;
    Items[8,3] := FExaminator;
    Items[9,3] := FDate;

    for i := 0 to FDataset.RecordCount-1 do
    begin
      Range['A'+inttostr(TableBeg+i),'H'+inttostr(TableBeg+i)].NumberFormat := '@';
      Items[TableBeg+i,1] := i+1;
      Items[TableBeg+i,2] := FDataset.FieldByName('StudName').Value;
      Items[TableBeg+i,3] := FDataset.FieldByName('nn_zach').Value;
      Items[TableBeg+i,4] := FDataset.FieldByName('i_sumballs').Value;
      Items[TableBeg+i,5] := FDataset.FieldByName('i_balls').Value;

      if (FDataset.FieldByName('i_balls').Value<>null) then
            Items[TableBeg+i,6] := IntToStr(FDataset.FieldByName('i_balls').Value+FDataset.FieldByName('i_sumballs').Value);
            if (FDataset.FieldByName('i_grade').Value<>null) then
            Items[TableBeg+i,7] := IntToStr(FDataset.FieldByName('i_grade').Value);
            //IntTostr(TBRSBallCounter.GetTraditionalMark(FDataset.FieldByName('i_balls').Value+FDataset.FieldByName('i_sumballs').Value));

      Range['A'+inttostr(TableBeg+i),'H'+inttostr(TableBeg+i)].Font.Size:=11;
      Range['A'+inttostr(TableBeg+i),'H'+inttostr(TableBeg+i)].Font.Name := 'Times New Roman';
      Range['B'+inttostr(TableBeg+i),'B'+inttostr(TableBeg+i)].HorizontalAlignment:= xlLeft ;
      Range['C'+inttostr(TableBeg+i),'H'+inttostr(TableBeg+i)].HorizontalAlignment:= xlCenter ;
      FDataset.Next;
    end;

    Range['A'+inttostr(TableBeg-1),'H'+intToStr(TableBeg+FDataset.RecordCount-1)].Borders.Weight:=2;

    finally
        FDataset.EnableControls;
    end;
  end;

  //Определим общее число шагов в создании рапорта
  //Реальное число шагов скорее всего будет равно количеству
  //записей, возвращённых запросом для отчёта
  //Example: Result := MyDataSet.Recordscount;
  function TBRSExamVedomost.GetTotalSteps: Integer;
  begin
    Result := FDataset.RecordCount;
  end;

end.
