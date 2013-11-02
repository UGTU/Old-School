unit uMethodWorkAddGos;
 {#Author nnikolenko@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, DBGridEh, Mask,
  DBCtrlsEh, DBLookupEh, GeneralController, MethodWorkController;

type
  TfrmMethodWorkAddGos = class(TfrmBaseDialog)
    Label3: TLabel;
    Label1: TLabel;
    Label11: TLabel;
    dbcbYear: TDBLookupComboboxEh;
    Label4: TLabel;
    procedure dbcbYearKeyValueChanged(Sender: TObject);
  private
    { Private declarations }
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    { Public declarations }
    LastGosIK: integer;
    procedure Read;
  end;

var
  frmMethodWorkAddGos: TfrmMethodWorkAddGos;

implementation

{$R *.dfm}

procedure TfrmMethodWorkAddGos.dbcbYearKeyValueChanged(Sender: TObject);
begin
  IsModified:= (dbcbYear.Value <> NULL);
end;

function TfrmMethodWorkAddGos.DoApply: boolean;
begin
  Result:= TMethodWorkController.Instance.SaveGos(LastGosIK, Label4.Tag, dbcbYear.KeyValue);
end;

function TfrmMethodWorkAddGos.DoCancel: boolean;
begin
  case (Application.MessageBox('Сохранить внесенные изменения?','Измение информации о ГОС', MB_YESNOCANCEL)) of
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

procedure TfrmMethodWorkAddGos.Read;
begin
  TGeneralController.Instance.InitializeLockupCB(@dbcbYear, 'ik_year_uch_pl', 'year_value');
  TMethodWorkController.Instance.GetAllYearsForGos(@dbcbYear.ListSource.DataSet, false, Null);
  Caption:= 'Добавление ГОС на направление подготовки';
end;

end.
