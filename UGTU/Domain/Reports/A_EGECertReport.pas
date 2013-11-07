unit A_EGECertReport;

interface
uses
  Classes, dialogs ,SysUtils, ExcelXP, Barcode, Contnrs, XIntf, CommonIntf, ReportsBase, db, adodb, uXMLEGEReader;

const TableBeg = 9;

type
    TEGECertificateReport = class(TExcelReportBase)
    private
       FCertificate:TCertificateDescription;
    protected
       procedure Execute;override;
       function GetTotalSteps:Integer;override;
    public
       constructor Create (AOwner : TComponent; cert:TCertificateDescription);

    end;


implementation

{ TEGECertificateReport }

constructor TEGECertificateReport.Create(AOwner: TComponent;
  cert: TCertificateDescription);
begin
inherited Create(AOwner);
FCertificate:=cert;
end;

procedure TEGECertificateReport.Execute;
var mark:TExamDescription;
i:integer;
begin
inherited;

// замен€ем метки на значени€
Replace('#номер#',FCertificate.CertificateNumber);
Replace('#статус#',FCertificate.status);
Replace('#‘»ќ#',FCertificate.LastName+' '+FCertificate.FirstName+' '+FCertificate.PatronName);
Replace('#год#',inttostr(FCertificate.Year));

// переносим подвал направо
Range['A10','C18'].Copy(Range['D10','F18']);
Range['A10','C18'].Clear;

// ставим подвал место
Range['D10','F18'].Copy(Range['A'+intToStr(TableBeg+1+FCertificate.Marks.Count),'C'+intToStr(TableBeg+9+FCertificate.Marks.Count)]);
Range['D10','F18'].Clear;

// удлинн€ем и запол€ем таблицу
 for i := 0 to FCertificate.Marks.Count-1 do
    begin
      mark:=FCertificate.Marks[i];

      Range['A'+inttostr(TableBeg+i),'C'+inttostr(TableBeg+i)].NumberFormat := '@';
      Items[TableBeg+i,1] := mark.Subject;
      Items[TableBeg+i,3] := floatToStr(mark.Mark);
      Range['A'+inttostr(TableBeg+i),'C'+inttostr(TableBeg+i)].Font.Size:=12;
      Range['A'+inttostr(TableBeg+i),'C'+inttostr(TableBeg+i)].Font.Name := 'Arial';
      Range['A'+inttostr(TableBeg+i),'C'+inttostr(TableBeg+i)].HorizontalAlignment:= xlCenter ;
    end;

end;

function TEGECertificateReport.GetTotalSteps: Integer;
begin

end;

end.
