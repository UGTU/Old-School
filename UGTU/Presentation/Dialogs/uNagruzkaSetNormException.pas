unit uNagruzkaSetNormException;
   {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrlsEh;

type
  TfrmNagruzkaSetNormException = class(TfrmBaseDialog)
    dbeNormPerStudent: TDBEditEh;
    dbeNormPerUnit: TDBEditEh;
    Label17: TLabel;
    Label18: TLabel;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    dbeNormPerStudentForMin: TDBEditEh;
    dbeNormPerUnitForMin: TDBEditEh;
    Label3: TLabel;
    Label4: TLabel;
    dbeMinContingent: TDBEditEh;
    dbeMaxNormPerStudent: TDBEditEh;
    SpeedButton1: TSpeedButton;
    procedure dbeNormPerStudentKeyPress(Sender: TObject;
      var Key: Char);
    procedure dbeMinContingentKeyPress(Sender: TObject; var Key: Char);
    procedure dbeNormPerStudentChange(Sender: TObject);
    procedure dbeNormPerStudentEnter(Sender: TObject);
    procedure dbeNormPerStudentExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    fVidZanyatIK, fVidNagruzkiIK: integer;
    fDiscTypeCalcAsPractice: boolean;
  protected  
    function DoApply:boolean; override;
    function DoCancel:boolean; override;
  public
    procedure Read(VidZanyatIK, VidNagruzkiIK: integer; DiscTypeCalcAsPractice: boolean);
  end;

var
  frmNagruzkaSetNormException: TfrmNagruzkaSetNormException;

implementation

uses NagruzkaController;

{$R *.dfm}

procedure TfrmNagruzkaSetNormException.dbeMinContingentKeyPress(Sender: TObject;
  var Key: Char);
const
  allow:set of char = ['1','2','3','4','5','6','7','8','9','0', Chr(VK_BACK)];
begin
  if (not (Key in allow)) then
  begin
    key:= #0;
    exit;
  end
end;

procedure TfrmNagruzkaSetNormException.dbeNormPerStudentChange(Sender: TObject);
begin
  IsModified:= (dbeNormPerStudent.Text <> '') and (dbeNormPerUnit.Text <> '') and (dbeMaxNormPerStudent.Text <> '') and (dbeMinContingent.Text <> '') and (dbeNormPerStudentForMin.Text <> '') and (dbeNormPerUnitForMin.Text <> ''); 
end;

procedure TfrmNagruzkaSetNormException.dbeNormPerStudentEnter(Sender: TObject);
begin
  (Sender as TDBEditEh).Color:= clAqua;
end;

procedure TfrmNagruzkaSetNormException.dbeNormPerStudentExit(Sender: TObject);
begin
  (Sender as TDBEditEh).Color:= clWindow;
end;

procedure TfrmNagruzkaSetNormException.dbeNormPerStudentKeyPress(
  Sender: TObject; var Key: Char);
const
  allow:set of char = ['1','2','3','4','5','6','7','8','9','0',',', Chr(VK_BACK)];
begin
  if (not (Key in allow)) then
  begin
    key:= #0;
    exit;
  end
end;

function TfrmNagruzkaSetNormException.DoApply: boolean;
begin
  Result:= TNagruzkaController.PlanNagruzka.SetNormOfTimeExceptionForCurrentDisc(fDiscTypeCalcAsPractice, fVidZanyatIK, fVidNagruzkiIK, StrToFloat(dbeNormPerStudent.Text), StrToFloat(dbeNormPerUnit.Text), StrToFloat(dbeMaxNormPerStudent.Text), StrToFloat(dbeNormPerStudentForMin.Text), StrToFloat(dbeNormPerUnitForMin.Text), StrToInt(dbeMinContingent.Text));
end;

function TfrmNagruzkaSetNormException.DoCancel: boolean;
begin
  case (Application.MessageBox('Сохранить внесенные изменения?', PChar(Caption), MB_YESNOCANCEL)) of
      mrYes:
        begin
          OK;
          Result:= false;
        end;
      mrNo: Result:= true;
      mrCancel: Result:= false;
      else Result:= false;
  end;
end;

procedure TfrmNagruzkaSetNormException.Read(VidZanyatIK, VidNagruzkiIK: integer;
  DiscTypeCalcAsPractice: boolean);
var
  NormPerStudent, NormPerUnit, MaxNormPerStudent, NormPerStudentForMin, NormPerUnitForMin: double;
  MinContingent: integer;
begin
  fVidZanyatIK:= VidZanyatIK;
  fVidNagruzkiIK:= VidNagruzkiIK;
  fDiscTypeCalcAsPractice:= DiscTypeCalcAsPractice;
  TNagruzkaController.PlanNagruzka.GetCurrentNormOfTime(VidZanyatIK, VidNagruzkiIK, DiscTypeCalcAsPractice, NormPerStudent, NormPerUnit, MaxNormPerStudent, NormPerStudentForMin, NormPerUnitForMin, MinContingent);
  dbeNormPerStudent.Text:= FloatToStr(NormPerStudent);
  dbeNormPerUnit.Text:= FloatToStr(NormPerUnit);
  dbeMaxNormPerStudent.Text:= FloatToStr(MaxNormPerStudent);
  dbeMinContingent.Text:= IntToStr(MinContingent);
  dbeNormPerStudentForMin.Text:= FloatToStr(NormPerStudentForMin);
  dbeNormPerUnitForMin.Text:= FloatToStr(NormPerUnitForMin);
  GroupBox1.Visible:= not DiscTypeCalcAsPractice;
  Label1.Visible:= not DiscTypeCalcAsPractice;
  dbeMaxNormPerStudent.Visible:= not DiscTypeCalcAsPractice;
  if DiscTypeCalcAsPractice then
    ClientHeight:= 157
  else ClientHeight:= 259;
  IsModified:= false;
end;

procedure TfrmNagruzkaSetNormException.SpeedButton1Click(Sender: TObject);
var
  NormPerStudent, NormPerUnit, MaxNormPerStudent, NormPerStudentForMin, NormPerUnitForMin: double;
  MinContingent: integer;
begin
  if TNagruzkaController.PlanNagruzka.GetDefaultNormOfTime(fVidZanyatIK, fVidNagruzkiIK, fDiscTypeCalcAsPractice, NormPerStudent, NormPerUnit, MaxNormPerStudent, NormPerStudentForMin, NormPerUnitForMin, MinContingent) then
  begin
    dbeNormPerStudent.Text:= FloatToStr(NormPerStudent);
    dbeNormPerUnit.Text:= FloatToStr(NormPerUnit);
    dbeMaxNormPerStudent.Text:= FloatToStr(MaxNormPerStudent);
    dbeMinContingent.Text:= IntToStr(MinContingent);
    dbeNormPerStudentForMin.Text:= FloatToStr(NormPerStudentForMin);
    dbeNormPerUnitForMin.Text:= FloatToStr(NormPerUnitForMin);
  end
  else Application.MessageBox('Не удалось восстановить исходные значения! Информация о них не найдена в базе данных.', PChar(Caption), MB_ICONWARNING);
end;

end.
