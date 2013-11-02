unit uVinEkz;
  {#Author tanyav@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, DBGridEh, StdCtrls, Mask, DBCtrlsEh, DBLookupEh,
  ActnList, Buttons, ExtCtrls, uUspevGroupController;

type
  TfrmVinEkz = class(TfrmBaseDialog)
    dbcbExamList: TDBLookupComboboxEh;
    Label1: TLabel;
    procedure dbcbExamListClick(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ikGroup, nSem: Integer;
  protected
     function DoApply: Boolean;override;  
     function DoCancel: Boolean;override;
  end;

var
  frmVinEkz: TfrmVinEkz;

implementation

uses uDM, ADODB, DB, uGroup, uDMUspevaemost, ApplicationController;

{$R *.dfm}

procedure TfrmVinEkz.actOKExecute(Sender: TObject);
begin
  DoApply;
  Close;
end;

procedure TfrmVinEkz.bbCancelClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmVinEkz.dbcbExamListClick(Sender: TObject);
begin
  inherited;
  IsModified := true;
  actOK.Enabled := true;
  bbOK.Enabled := true;
end;

function TfrmVinEkz.DoApply: Boolean;
begin
  TApplicationController.GetInstance.AddLogEntry('Создание выносной ведомости '+dbcbExamList.Text);
  //создаем выносную ведомость
  try

    TUspevGroupController.Instance.ApplyVed('', 1, ikGroup,
      dmUspevaemost.adosp4VinVed.FieldByName('ik_vid_zanyat').Value, nSem, dmUspevaemost.adosp4VinVed.FieldByName('ik_disc').Value,
      0, false, false, true, null, null, null, Date);
    Result := true;
  except
    MessageBox(Handle, 'При создании ведомости произошла ошибка.','ИС "УГТУ"',
          MB_OK) ;

  end;
end;

function TfrmVinEkz.DoCancel: Boolean;
begin

  Result := true;
end;

end.
