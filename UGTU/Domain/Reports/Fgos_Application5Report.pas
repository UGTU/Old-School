unit Fgos_Application5Report;

interface

uses
Classes, dialogs ,SysUtils, ExcelXP, Barcode, Contnrs, XIntf, CommonIntf,
ReportsBase, db, adodb, comObj;

const
      Spec = 15;
      Spclz = 18;
      Qualif = 21;
      Year = 35;
      beg_week = 6;// F6
      end_week = 10;//F10
      Beg_tab = 13; //F13

type
    TFgos_Application5Report= class(TExcelReportBase)
    private
//       FDataset:TADODataset;
       dsTitle: TDataset;
    protected
       procedure Execute;override;
       function GetTotalSteps:Integer;override;
    public
       constructor Create (AOwner : TComponent;{ ds : TAdoDataset;} Title:TDataset);
    end;

    implementation

 constructor TFgos_Application5Report.Create (AOwner : TComponent; {ds : TAdoDataset;} Title:TDataset);
  begin
  inherited Create(AOwner);
//  FDataset := ds;
  dsTitle:= Title;
  end;

  procedure TFgos_Application5Report.Execute;
  var
    i : Integer;

  begin
    {inherited;
    if FDataset = nil then
     exit; }

     if not dsTitle.Active then
     begin
     showmessage('Отчет не сформирован!');
     exit;
     end;
    self.ActivateWorksheet(1); 
    if (dsTitle <> nil)  then
    begin
    Items[Spec,3]:=dsTitle.FieldByName('Sh_spec').Value+' '+  dsTitle.FieldByName('Cname_spec').Value;
    Items[Spclz,3]:=dsTitle.FieldByName('cName_spclz').Value;
    Items[Qualif,3]:= dsTitle.FieldByName('Cname_qualif').Value;
    Items[Year,1]:= CurrentYear();
    end else ShowMessage('Титульный лист не заполнен!');

    self.ActivateWorksheet(2);

   { FDataset.First;
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
      Range['A'+inttostr(TableBeg),'C'+intToStr(TableBeg+FDataset.RecordCount)].Borders.Weight:=2; }
  end;


  //Определим общее число шагов в создании рапорта
  //Реальное число шагов скорее всего будет равно количеству
  //записей, возвращённых запросом для отчёта
  //Example: Result := MyDataSet.Recordscount;
  function TFgos_Application5Report.GetTotalSteps: Integer;
  begin
 //   Result := FDataset.RecordCount;
  end;
end.

