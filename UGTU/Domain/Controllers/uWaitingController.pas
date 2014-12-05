unit uWaitingController;
  {#Author sergdev@ist.ugtu.net}
interface

uses   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ReportsBase, Barcode, ReportUI, ComCtrls, uWaitingform, ApplicationController, ExceptionBase;

type TWaitingController = class
private
FWaitingForm : TfrmWaiting;

public
class function GetInstance : TWaitingController;
procedure Process(Report:TReportBase);

end;

implementation

uses CommonIntfImpl;

{ TWaitingController }

class function TWaitingController.GetInstance: TWaitingController;
const
  instance : TWaitingController = nil;
begin
  if instance = nil then
    instance.Create;
  Result := instance;
end;

procedure TWaitingController.Process(Report: TReportBase);
begin
 if FWaitingForm<>nil then
 Raise EApplicationException.Create('Построение отчёта уже выполняется!')
 else
 try
    FWaitingForm := TfrmWaiting.Create(nil);
    FWaitingForm.ActionComponentUI1.ActionComponent:=Report;
    FWaitingForm.Show;
    FWaitingForm.Update;
    Report.Logger:=TApplicationController.GetInstance;
    Report.BuildReport;
 finally
    FWaitingForm.Close;
    FWaitingForm.Free;
    FWaitingForm:=nil;
 end;

end;

end.
