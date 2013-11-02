unit uNagruzkaSetVidZanyatTaskCount;
   {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, DB, ImgList,
  ComCtrls, ToolWin, GridsEh, DBGridEh;

type
  TfrmNagruzkaSetVidZanyatTaskCount = class(TfrmBaseDialog)
    Panel2: TPanel;
    Bevel3: TBevel;
    Bevel5: TBevel;
    dbgTaskCount: TDBGridEh;
    Panel3: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolBar2: TToolBar;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    actAddRecord: TAction;
    actDelRecord: TAction;
    dsVidZanyatTaskCount: TDataSource;
  private
    fVidZanyatIK, fVidNagruzkiIK: integer;
  public
    procedure Read(AVidZanyatIK, AVidNagruzkiIK: integer);
  end;

var
  frmNagruzkaSetVidZanyatTaskCount: TfrmNagruzkaSetVidZanyatTaskCount;

implementation

uses NagruzkaController;

{$R *.dfm}

{ TfrmNagruzkaSetVidZanyatTaskCount }

procedure TfrmNagruzkaSetVidZanyatTaskCount.Read(AVidZanyatIK,
  AVidNagruzkiIK: integer);
begin
  fVidZanyatIK:= AVidZanyatIK;
  fVidNagruzkiIK:= AVidNagruzkiIK;
  dsVidZanyatTaskCount.DataSet:= TNagruzkaController.PlanNagruzka.LoadVidZanyatTaskCountInfo(AVidZanyatIK, AVidNagruzkiIK, dbgTaskCount.Columns.Items[0].PickList);
end;

end.
