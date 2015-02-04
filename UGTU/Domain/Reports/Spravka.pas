unit Spravka;

interface

uses
  Classes, dialogs, SysUtils, ExcelXP, Barcode, Contnrs,
  XIntf, CommonIntf, ReportsBase, db, adodb, ExtCtrls,
  udmUspevaemost, ComCtrls, uAverageBalls, Vedomost2014, Assemly_Report2014;

type
  SpravkaReport = class(TExcelReportBase)
  private
  protected
    procedure Execute; override;
  public
  end;


implementation

{ SpravkaReport }

procedure SpravkaReport.Execute;
begin
  inherited;

end;

end.
