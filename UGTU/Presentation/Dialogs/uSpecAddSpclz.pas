unit uSpecAddSpclz;
   {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, Mask,
  DBCtrlsEh, ADODB, DB, UchPlanController;

type
  TfrmSpecAddSpclz = class(TfrmBaseDialog)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbeShSpclz: TDBEditEh;
    dbeName: TDBEditEh;
    dbeNameShort: TDBEditEh;
    Label8: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure dbeShSpclzChange(Sender: TObject);
  private
    dir_text:PAnsiChar; //�������|| ���������|| �������������
    FdirIK:integer;
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    procedure Read();
    property dirIK: Integer read FdirIK write FdirIK;
  end;

var
  frmSpecAddSpclz: TfrmSpecAddSpclz;

implementation

{$R *.dfm}

{ TfrmSpecAddSpclz }     

function TfrmSpecAddSpclz.DoApply: boolean;
begin
  Result:= TUchPlanController.Instance.SaveSpecialization(Tag, IK, dbeShSpclz.Text, dbeName.Text, dbeNameShort.Text)
end;

function TfrmSpecAddSpclz.DoCancel: boolean;
var msg1:PAnsiChar;
begin
     case(dirIK) of
        1:msg1:='��������� �������';
        3:msg1:='��������� ���������';
        else msg1:='��������� �������������';

   end;
  case (Application.MessageBox('��������� ��������� ���������?',msg1,MB_YESNOCANCEL)) of
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

procedure TfrmSpecAddSpclz.Read;
begin
    case(dirIK) of
        1: dir_text:='�������';
        3: dir_text:='���������';
        else dir_text:='�������������';
        end;
  if (Self.Tag >= 0) then
    Caption:= '��������� '+dir_text
  else Caption:= '���������� ' +dir_text;
  IsModified:= false;
end;

procedure TfrmSpecAddSpclz.dbeShSpclzChange(Sender: TObject);
begin
  IsModified:= (dbeShSpclz.Text <> '') and (dbeName.Text <> '') and (dbeNameShort.Text <> '');

  if (dbeShSpclz.Text = '') or (dbeName.Text = '') or (dbeNameShort.Text = '')  then
  begin
  bbOK.Enabled:=false;
  bbApply.Enabled:=false;
  end else
  begin
  bbOK.Enabled:=true;
  bbApply.Enabled:=true;
  end;
end;


end.
