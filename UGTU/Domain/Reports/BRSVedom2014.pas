unit BRSVedom2014;

interface
uses
Classes, dialogs ,SysUtils, ExcelXP, Barcode, Contnrs,
XIntf, CommonIntf, ReportsBase, db, adodb, ExtCtrls,
 udmUspevaemost, ComCtrls, uAverageBalls;
type
    TBRS2014VedomostReport = class(TExcelReportBase)
    private
//       FDataset:TADODataset;
//       FListView:TListView;
      ikVed: integer;
      ikGrup, nSem,  ikFac, ikSpec: integer;
       tempStoredProc: TADOStoredProc;
    protected
       procedure Execute;override;
       function GetTotalSteps:Integer;override;
    public
       constructor Create (_ikGrup, _nSem, _ikVed, _ikFac,
_ikSpec: integer; _tempStoredProc: TADOStoredProc);


    end;
implementation

{ TBRS2014Report }

constructor TBRS2014VedomostReport.Create(_ikGrup, _nSem, _ikVed, _ikFac,
_ikSpec: integer; _tempStoredProc: TADOStoredProc);
begin
  //inherited Create(AOwner);
        ikGrup := _ikGrup;
        nSem:=_nSem;
        ikVed:=_ikVed;
        ikFac:=_ikFac;
        ikSpec:=_ikSpec;
        tempStoredProc:=_tempStoredProc;
end;

procedure TBRS2014VedomostReport.Execute;
begin
  inherited;
  //Replace('#institut#','bjkhjhkjhkjhkjh');
  NextStep(1, 'Выгружаем отчёт');
end;

function TBRS2014VedomostReport.GetTotalSteps: Integer;
begin
  Result:=1;
end;
end.
