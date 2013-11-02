unit uMethodWorkPlanCurrentMW;
  {#Author nnikolenko@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, StdCtrls, ActnList, Buttons, ExtCtrls, GridsEh, DBGridEh,
  DB, MethodWorkController;

type
  TfrmMethodWorkPlanCurrentMW = class(TfrmBaseDialog)
    Label1: TLabel;
    Label15: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbgMW: TDBGridEh;
    dsMW: TDataSource;
    Image1: TImage;
    GroupBox1: TGroupBox;
    Panel5: TPanel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label16: TLabel;
    Label17: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Read(PlanIK: integer);
  end;

var
  frmMethodWorkPlanCurrentMW: TfrmMethodWorkPlanCurrentMW;

implementation

{$R *.dfm}

procedure TfrmMethodWorkPlanCurrentMW.Read(PlanIK: integer);
var
  PlanVolumeForMW: TDoubleArray;
begin
  Self.Caption:= 'Просмотр запланированных УМР';
  dsMW.DataSet:= TMethodWorkController.Instance.LoadCurrentMW(PlanIK, Label2.Tag, Label3.Tag);
  PlanVolumeForMW:= TMethodWorkController.Instance.GetFactVolumeForMW(dsMW.DataSet);
  Label12.Caption:= FloatToStrF(PlanVolumeForMW[0], ffFixed, 10, 2) + ' час.';
  Label17.Caption:= FloatToStrF(PlanVolumeForMW[1], ffFixed, 10, 2) + ' час.';
end;

end.
