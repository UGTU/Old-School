unit uNagruzkaShowCalculationScheme;
  {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, Grids;

type
  TfrmNagruzkaShowCalculationScheme = class(TfrmBaseDialog)
    Panel2: TPanel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Panel3: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    procedure FormCreate(Sender: TObject);
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    procedure Read(PlanIK, SchemaOfPotokIK, VidZanyatIK, VidNagruzkiIK, CommissionCount: integer; ifDiscCalcAsPractice: boolean);
  end;

var
  frmNagruzkaShowCalculationScheme: TfrmNagruzkaShowCalculationScheme;

implementation

uses NagruzkaController;

{$R *.dfm}

{ TfrmNagruzkaShowCalculationScheme }

function TfrmNagruzkaShowCalculationScheme.DoApply: boolean;
begin
  Result:= true;
end;

function TfrmNagruzkaShowCalculationScheme.DoCancel: boolean;
begin
  Result:= true;
end;

procedure TfrmNagruzkaShowCalculationScheme.FormCreate(Sender: TObject);
begin
  inherited;
  WindowState:= wsMaximized;
end;

procedure TfrmNagruzkaShowCalculationScheme.Read(PlanIK, SchemaOfPotokIK, VidZanyatIK, VidNagruzkiIK, CommissionCount: integer; ifDiscCalcAsPractice: boolean);
begin
  Label12.Caption:= FloatToStrF(TNagruzkaController.PlanNagruzka.GetCalculationSchemeGrid(Self, PlanIK, SchemaOfPotokIK, VidZanyatIK, VidNagruzkiIK, CommissionCount, ifDiscCalcAsPractice), ffFixed, 10, 2) + ' час.';
end;

end.
