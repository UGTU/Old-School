{*
    Отчет - вывод успеваемости студента в Excel
    Версия: 1.0.0.1
    Создано: 29.12.2008
    Последняя правка: 29.12.2008 13:00
    Автор: Вокуева Т.А.
*}
unit D_StudUspevRep;
 {#Author sofo@ist.ugtu.net}
interface
uses
  Classes, SysUtils, ExcelXP, Barcode, Contnrs, ReportsBase, DB, ADODB;

type
   TStudUspevExcelReport = class(TExcelReportBase)
  private
    FDataSet: TADODataSet;
    FIsSmall:boolean;

  protected
    procedure Execute;override;
  public
    property DataSet:TADODataSet read FDataSet write FDataSet;
    property IsSmall:boolean read FIsSmall write FIsSmall;
  end;

implementation

procedure TStudUspevExcelReport.Execute;
var  i: integer;
begin
  inherited;
  if not FDataSet.Active then
    exit;
  i:=2;
  FDataSet.DisableControls;
  try
	  FDataSet.First;
	  while not FDataSet.Eof do
	  begin
		 if (FDataSet.FieldByName('n_sem').Value=0) and (FIsSmall) then
		 begin //средний балл не выводим
			FDataSet.Next;
			continue;
		 end;

		 Items[i,1] := FDataSet.FieldByName('cName_disc').AsString;
		 Items[i,2] := FDataSet.FieldByName('HourCount').AsString;
		 Items[i,3] := FDataSet.FieldByName('cName_vid_zanyat').AsString;
		 Items[i,4] := FDataSet.FieldByName('ShortName').AsString;
		 Items[i,5] := FDataSet.FieldByName('Dd_exam').AsString;
		 if not FIsSmall then
		 begin
			Items[i,6] := FDataSet.FieldByName('PrepName').AsString;
			Items[i,7] := FDataSet.FieldByName('n_sem').AsString;
		 end;
		 Inc(i);
		 FDataSet.Next;
	  end;
	  Range['A1','G'+intToStr(i-1)].Borders.Weight:=2;
	  if FIsSmall then
	  begin
		 Range['F1','G'+intToStr(i-1)].ColumnWidth:=0;
	  end;
  finally
    FDataSet.EnableControls;
  end;


  {ActiveBarcodeApplet.AppletName := 'PDF417Ctrl1';
  ActiveBarcodeApplet.BarcodeHeader := TBarcodeReportHeader.Create;
  ActiveBarcodeApplet.BarcodeHeader.MajorVersion := 1;
  ActiveBarcodeApplet.BarcodeHeader.MinorVersion := 0;
  ActiveBarcodeApplet.BarcodeHeader.ObjectType := 1;
  ActiveBarcodeApplet.BarcodeHeader.OID := Fik_ved;
  ActiveBarcodeApplet.WriteToApplet; }
  Show;
end;

end.
