unit uMethodWorkAddItemGos;
  {#Author nnikolenko@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, DBGridEh, StdCtrls, Mask, DBCtrlsEh, DBLookupEh,
  ActnList, Buttons, ExtCtrls, MethodWorkController;

type
  TfrmMethodWorkAddItemGos = class(TfrmBaseDialog)
    Label1: TLabel;
    Label11: TLabel;
    edItem: TEdit;
    procedure edItemChange(Sender: TObject);
  private
    { Private declarations }
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    { Public declarations }
    procedure Read;
  end;

var
  frmMethodWorkAddItemGos: TfrmMethodWorkAddItemGos;

implementation

{$R *.dfm}

function TfrmMethodWorkAddItemGos.DoApply: boolean;
begin
  //Result:= TMethodWorkController.Instance.SaveItemGos(LastGosIK, Label4.Tag, dbcbYear.KeyValue);
end;

function TfrmMethodWorkAddItemGos.DoCancel: boolean;
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

procedure TfrmMethodWorkAddItemGos.edItemChange(Sender: TObject);
begin
  IsModified:= edItem.Text <> '';
end;

procedure TfrmMethodWorkAddItemGos.Read;
begin
  Caption:= 'Добавление названия пункта ГОСа';
end;

end.
