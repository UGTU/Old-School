unit uStudInfo;
   {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, StdCtrls, DBCtrlsEh, ActnList, Buttons, ExtCtrls,
  ComObj, uDM, D_GroupListRep, ReportsBase;

type
  TfrmStudInfo = class(TfrmBaseDialog)
    actCheckAll: TAction;
    actUnCheckAll: TAction;
    lbAvail: TListBox;
    lbSel: TListBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    actSel: TAction;
    actDeSel: TAction;
    procedure FormShow(Sender: TObject);
    procedure actCheckAllExecute(Sender: TObject);
    procedure actUnCheckAllExecute(Sender: TObject);
    procedure cbxnNZachClick(Sender: TObject);
    procedure actSelExecute(Sender: TObject);
    procedure actDeSelExecute(Sender: TObject);
    procedure ExecuteError(Sender: TObject; E: Exception);

  private
    { Private declarations }
    procedure OutInfo;      
    procedure Check(Sender: TObject);
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    { Public declarations }
  end;

Const
  ChartCount = 25;
var
  frmStudInfo: TfrmStudInfo;
  arrCmbx: array[1..ChartCount] of TDBCheckBoxEh;

implementation

uses uMain, DBTVObj, DBTVStudObj, DBTVGroupObj, ComCtrls, uWaitingController;

{$R *.dfm}

{ TfrmStudInfo }

procedure TfrmStudInfo.Check(Sender: TObject);
var
  i: Integer;
begin
  frmStudInfo.bbOK.Enabled := false;
  for i := 1 to ChartCount do
    if arrCmbx[i].Checked then
      frmStudInfo.bbOK.Enabled := true;
end;

function TfrmStudInfo.DoApply: boolean;
begin
  OutInfo;
  Result := true;
end;

function TfrmStudInfo.DoCancel: boolean;
begin
  Result:= true;
end;

procedure TfrmStudInfo.FormShow(Sender: TObject);
begin
  inherited;
  IsModified := true;
end;

procedure TfrmStudInfo.ExecuteError(Sender: TObject; E: Exception);
begin
  ShowMessage('Произошла ошибка при экспорте данных о группе: ' + E.Message);
  (Sender as TReportBase).Quit;
end;


procedure TfrmStudInfo.OutInfo;
var
  Report:TReportBase;
begin
    Report := TReportBase.CreateReport(TGroupListExcelReport);
    Report.FreeOnComplete := true;
    Report.OnExecuteError := ExecuteError;
    TGroupListExcelReport(Report).GroupObject:=
        frmMain.DBDekTreeView_TEST1.SelectedObject as TDBNodeGroupObject;
    TGroupListExcelReport(Report).FieldsList:= lbSel;
    TWaitingController.GetInstance.Process(Report);
    //Report.BuildReport;
end;

procedure TfrmStudInfo.actCheckAllExecute(Sender: TObject);
begin
  lbSel.Items.AddStrings(lbAvail.Items);
  lbAvail.Clear;
  bbOK.Enabled := true;
end;

procedure TfrmStudInfo.actUnCheckAllExecute(Sender: TObject);
begin
  lbAvail.Items.AddStrings(lbSel.Items);
  lbSel.Clear;
  bbOK.Enabled := false;
end;

procedure TfrmStudInfo.cbxnNZachClick(Sender: TObject);
begin
  inherited;
  Check(Sender);
end;

procedure TfrmStudInfo.actSelExecute(Sender: TObject);
var
  tmp: Integer;
begin
  inherited;
  if lbAvail.ItemIndex = -1 then
    Exit;
  lbSel.Items.Add(lbAvail.Items[lbAvail.ItemIndex]);
  tmp := lbAvail.ItemIndex;
  lbAvail.DeleteSelected;
  if tmp<>0 then Dec(tmp);
  lbAvail.ItemIndex := tmp;
  bbOK.Enabled := true;
end;

procedure TfrmStudInfo.actDeSelExecute(Sender: TObject);
var
  tmp: Integer;
begin
  inherited;
  if lbSel.ItemIndex = -1 then
    Exit;
  lbAvail.Items.Add(lbSel.Items[lbSel.ItemIndex]);
  tmp := lbSel.ItemIndex;
  lbSel.DeleteSelected;
  if tmp<>0 then Dec(tmp);
  lbSel.ItemIndex := tmp;
  if lbSel.Count=0 then
    bbOK.Enabled := false;
end;



end.
