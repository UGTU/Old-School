unit uNagruzkaDividePotok;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, GridsEh, DBGridEh, ADODB,
  NagruzkaClasses, DB;

type
  TfrmDividePotok = class(TfrmBaseDialog)
    rgDivideType: TRadioGroup;
    dbgGroups: TDBGridEh;
    dsGrups: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    fPotokShemaContingent: TPlanPotokInfos;
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    { Public declarations }
    procedure Read;
  end;

var
  frmDividePotok: TfrmDividePotok;

implementation

uses GeneralController,uDM, NagruzkaController;

{$R *.dfm}

function TfrmDividePotok.DoApply: boolean;
begin
try
    Result := false;
    dm.aspDeletePotokSemestr.Parameters.ParamByName('@ik_potok_semestr').Value := Self.IK;
    dm.aspDeletePotokSemestr.ExecProc;
    Result := true;
  finally

  end;
end;

function TfrmDividePotok.DoCancel: boolean;
begin
  Result:= false;
end;

procedure TfrmDividePotok.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  fPotokShemaContingent.Clear;
  fPotokShemaContingent.Destroy;
  dsGrups.DataSet.Close;
  dsGrups.DataSet.Free;
end;

procedure TfrmDividePotok.Read;
var tempDataSet: TADODataSet;
begin
   try
   tempDataSet := TGeneralController.Instance.GetNewADODataSet(true);
   fPotokShemaContingent := TNagruzkaController.Preparation.GetPlanContingent(Self.IK,tempDataSet);
   dsGrups.DataSet := tempDataSet;
   finally
     IsModified := true;
   end;
end;

end.
