unit uWaitingForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ReportUI;

type
  TfrmWaiting = class(TForm)
    ActionComponentUI1: TActionComponentUI;
    eStatus: TEdit;
    Label1: TLabel;
    pbMain: TProgressBar;
    WindowReportControlCollection1: TWindowReportControlCollection;
    ProgressBarReportControl1: TProgressBarReportControl;
    lstep: TLabel;
    procedure FormShow(Sender: TObject);
    procedure WindowReportControlCollection1ProgressMessage(Sender: TObject;
      Step: Integer; StepNote: string; var Msg: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation
uses CommonIntf, CommonIntfImpl;

{$R *.dfm}

procedure TfrmWaiting.FormShow(Sender: TObject);
begin
WindowReportControlCollection1.AddControl(eStatus);
WindowReportControlCollection1.AddControl(self);

ActionComponentUI1.Add(WindowReportControlCollection1);
ActionComponentUI1.Add(ProgressBarReportControl1);
end;

procedure TfrmWaiting.WindowReportControlCollection1ProgressMessage(
  Sender: TObject; Step: Integer; StepNote: string; var Msg: string);
var
  Logger : ILogger;
begin
  Logger := TNullLogger.GetInstance;
  msg:=StepNote;
  lstep.Caption:=inttostr(Step*100 div pbMain.Max)+'%';
  Logger.LogMessage('Должно вывести : '+lstep.Caption);
end;

end.
