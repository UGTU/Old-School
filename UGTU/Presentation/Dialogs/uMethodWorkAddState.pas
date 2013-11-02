unit uMethodWorkAddState;
  {#Author nnikolenko@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, DB, GridsEh,
  DBGridEh, MethodWorkController, DateUtils;

type
  TfrmMethodWorkAddState = class(TfrmBaseDialog)
    Panel4: TPanel;
    Bevel5: TBevel;
    Bevel2: TBevel;
    Panel5: TPanel;
    sbDelString: TSpeedButton;
    sbAddString: TSpeedButton;
    dbgState: TDBGridEh;
    dsState: TDataSource;
    actAdd: TAction;
    actRem: TAction;
    procedure actAddExecute(Sender: TObject);
    procedure actRemExecute(Sender: TObject);
    procedure actAddUpdate(Sender: TObject);
    procedure actRemUpdate(Sender: TObject);
  private
    { Private declarations }
    row: integer;
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    { Public declarations }
    procedure Read;
  end;

var
  frmMethodWorkAddState: TfrmMethodWorkAddState;

implementation

{$R *.dfm}

procedure TfrmMethodWorkAddState.actAddExecute(Sender: TObject);
begin
 dsState.DataSet.First;
 dsState.DataSet.Insert;
 dsState.DataSet.FieldByName('DateTransitionInState').AsDateTime:= Today;
 row:= 1;
end;

procedure TfrmMethodWorkAddState.actAddUpdate(Sender: TObject);
begin
  if (dsState.DataSet <> nil) then
    actAdd.Enabled:= dsState.DataSet.Active
  else actAdd.Enabled:= false;
  dbgState.Enabled:= actAdd.Enabled;
end;

procedure TfrmMethodWorkAddState.actRemExecute(Sender: TObject);
begin
 dsState.DataSet.Delete;
 if dsState.DataSet.RecordCount = 0 then
   row:= 0;
end;

procedure TfrmMethodWorkAddState.actRemUpdate(Sender: TObject);
begin
  if (dsState.DataSet <> nil) then
  begin
    if (dsState.DataSet.Active) then
      actRem.Enabled:= dsState.DataSet.RecordCount > 0
    else actRem.Enabled:= false;
  end
  else actRem.Enabled:= false;
end;

function TfrmMethodWorkAddState.DoApply: boolean;
begin
  Result:= true;
end;

function TfrmMethodWorkAddState.DoCancel: boolean;
begin
  if row <> 0 then
  case (Application.MessageBox('Ввод статуса УМР и даты перехода в данный статус является обязательным условием для сохранения запланированной УМР. Сохранить внесенные изменения?','Изменение информации о запланированных УМР', MB_YESNOCANCEL)) of
      mrYes:
        begin
          OK;
          Result:= false;
        end;
      mrNo: Result:= true;
      mrCancel: Result:= false;
      else Result:= false;
  end
  else
    case (Application.MessageBox('Для сохранения запланированной УМР необходимо указать статус УМР и дату перехода в данный статус. Продолжить ввод данных?','Изменение информации о запланированных УМР', MB_YESNOCANCEL)) of
      mrYes: Result:= false;
      mrNo: Result:= true;
      mrCancel: Result:= false;
      else Result:= false;
    end;
end;

procedure TfrmMethodWorkAddState.Read;
begin
  if (self.IK < 0) then
  begin
    Caption:= 'Добавление состояния УМР';
      //не забыть передать необходимые параметры
    dsState.DataSet:= TMethodWorkController.Instance.LoadState(0);
    dsState.DataSet.Insert;
    dsState.DataSet.FieldByName('DateTransitionInState').AsDateTime:= Today;
    row:= 1;
    IsModified:= true;
  end;
  //else SetEditMode;


end;

end.
