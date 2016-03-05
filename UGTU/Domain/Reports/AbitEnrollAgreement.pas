unit AbitEnrollAgreement;

interface


uses
  Classes, SysUtils, ExcelXP, Barcode, Contnrs, ReportsBase, DB, ADODB, uDMAbiturientAction, Vcl.Dialogs;

type
   TAbitEnrollAgreementReport = class(TExcelReportBase)
  private
    FNN_abit:integer;

  protected
    procedure Execute;override;
    procedure LoadData;
  public
    property NN_abit:integer read FNN_abit write FNN_abit;
  end;

implementation

procedure TAbitEnrollAgreementReport.LoadData;
begin
    dmAbiturientAction.adospPrintZayavl.Close;
	  dmAbiturientAction.adospPrintZayavl.Parameters.ParamByName('@NN_abit').Value:= NN_abit;
	  dmAbiturientAction.adospPrintZayavl.Open;
end;


procedure TAbitEnrollAgreementReport.Execute;
var  tempStr: string;
begin
  inherited;
  LoadData;
  if not dmAbiturientAction.adospPrintZayavl.Active then
    exit;

  if dmAbiturientAction.adospPrintZayavl.RecordCount < 1 then
    exit;

  dmAbiturientAction.adospPrintZayavl.First;
  tempStr:= dmAbiturientAction.adospPrintZayavlFIO.ToString;
  ShowMessage(tempStr);
  Replace('#FIO#', tempStr);
  Replace('#FIOFull#', dmAbiturientAction.adospPrintZayavl.FieldByName('FullName').ToString);
  Replace('#Spec#', dmAbiturientAction.adospPrintZayavl.FieldByName('Cname_spec').ToString);
  //dateStr:= ;
  Replace('#Date#', DateToStr(Date));



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
