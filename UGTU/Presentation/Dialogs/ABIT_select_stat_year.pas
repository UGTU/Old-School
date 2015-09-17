unit ABIT_select_stat_year;
  {#Author tanyav@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, StdCtrls, DBCtrlsEh, ActnList, Buttons, ExtCtrls,
  System.Actions;

type
  TviborStat = class(TfrmBaseDialog)
    DBCheckBoxEh1: TDBCheckBoxEh;
    DBCheckBoxEh2: TDBCheckBoxEh;
    DBCheckBoxEh3: TDBCheckBoxEh;
    DBCheckBoxEh4: TDBCheckBoxEh;
    DBCheckBoxEh5: TDBCheckBoxEh;
    DBCheckBoxEh6: TDBCheckBoxEh;
    Label1: TLabel;
    procedure DBCheckBoxEh1Click(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;




var
  viborStat: TviborStat;

implementation
uses uABitDinamica,uMain;
{$R *.dfm}

{ TfrmBaseDialog2 }



procedure TviborStat.DBCheckBoxEh1Click(Sender: TObject);
begin
  inherited;
 bbok.Enabled:=true;
 if DBCheckBoxEh1.Checked=false then
  if DBCheckBoxEh2.Checked=false then
   if DBCheckBoxEh3.Checked=false then
    if DBCheckBoxEh4.Checked=false then
     if DBCheckBoxEh5.Checked=false then
      if DBCheckBoxEh6.Checked=false then
        bbok.Enabled:=false;
end;

procedure TviborStat.actOKExecute(Sender: TObject);
begin
 actApplyExecute(sender);
 close;
end;

procedure TviborStat.bbCancelClick(Sender: TObject);
begin
  close;
end;

procedure TviborStat.actApplyExecute(Sender: TObject);
begin
if DBCheckBoxEh1.Checked then
 TfmABITDinamica(frmMain.ActiveFrame).p1:=1 else  TfmABITDinamica(frmMain.ActiveFrame).p1:=0;
  if DBCheckBoxEh2.Checked then
 TfmABITDinamica(frmMain.ActiveFrame).p2:=1 else  TfmABITDinamica(frmMain.ActiveFrame).p2:=0;
  if DBCheckBoxEh3.Checked then
 TfmABITDinamica(frmMain.ActiveFrame).p3:=1 else  TfmABITDinamica(frmMain.ActiveFrame).p3:=0;
  if DBCheckBoxEh4.Checked then
 TfmABITDinamica(frmMain.ActiveFrame).p4:=1 else  TfmABITDinamica(frmMain.ActiveFrame).p4:=0;
  if DBCheckBoxEh5.Checked then
 TfmABITDinamica(frmMain.ActiveFrame).p5:=1 else  TfmABITDinamica(frmMain.ActiveFrame).p5:=0;
  if DBCheckBoxEh6.Checked then
 TfmABITDinamica(frmMain.ActiveFrame).p6:=1 else  TfmABITDinamica(frmMain.ActiveFrame).p6:=0;


end;

end.
