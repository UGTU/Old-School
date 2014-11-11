unit uUchPlanSemLength;
 {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, StdCtrls, Buttons, ExtCtrls, DB, Grids, DBGridEh, ADODB,
  DBCtrls, ActnList, GridsEh, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, DBAxisGridsEh, System.Actions;

type
  TfrmUchPlSemLength = class(TfrmBaseDialog)
    dsSem: TDataSource;
    actAdd: TAction;
    actRem: TAction;
    Panel3: TPanel;
    Bevel5: TBevel;
    dbgSem: TDBGridEh;
    Panel2: TPanel;
    sbDelString: TSpeedButton;
    sbAddString: TSpeedButton;
    Bevel3: TBevel;
    procedure actRemExecute(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actAddUpdate(Sender: TObject);
    procedure actRemUpdate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsSemStateChange(Sender: TObject);
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    procedure Read;
  end;

var
  frmUchPlSemLength: TfrmUchPlSemLength;

implementation

{$R *.dfm}

function TfrmUchPlSemLength.DoApply: boolean;
var
  listSem: TStringList;
  n_sem:integer;
begin
try
  listSem:= TStringList.Create;
   dsSem.DataSet.DisableControls;
   dsSem.DataSet.First;
   while (not dsSem.DataSet.Eof) do
   begin
    n_sem:= dsSem.DataSet.FieldByName('n_sem').AsInteger;
    if (listSem.IndexOf(IntToStr(n_sem)) = -1) then
      listSem.Add(intToStr(n_sem))
    else
    begin
      Application.MessageBox('Семестр может быть добавлен в учебный план только один раз!','Продолжительность семестров', MB_ICONERROR);
      Result:= false;
      listSem.Free;
      dsSem.DataSet.EnableControls;
      exit;
    end;
    if dsSem.DataSet.FieldByName('n_sem').AsInteger <= 0 then
    begin
      Application.MessageBox('В поле "Количество недель" для каждого семестра может быть указано только целое положительное значение!','Продолжительность семестров', MB_ICONERROR);
      Result:= false;
      listSem.Free;
      dsSem.DataSet.EnableControls;
      exit;
    end;
    dsSem.DataSet.Next;
   end;
   dsSem.DataSet.EnableControls;
  (dsSem.DataSet as TCustomADODataSet).UpdateBatch;
  if (dsSem.DataSet.Active) then
    dsSem.DataSet.Close;
  dsSem.DataSet.Open;
  dsSem.DataSet.FieldByName('ik_uch_plan').Visible:= false;
  dsSem.DataSet.FieldByName('n_sem').DisplayLabel:= 'Номер семестра';
  dsSem.DataSet.FieldByName('kol_ned').DisplayLabel:= 'Количество недель';
  Result:= true;
except
  raise;
end;
end;

function TfrmUchPlSemLength.DoCancel: boolean;
begin
  case (Application.MessageBox('Сохранить изменения?','Измение продолжительности семестров', MB_YESNOCANCEL)) of
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

procedure TfrmUchPlSemLength.Read;
begin
  if (dsSem.DataSet.Active) then dsSem.DataSet.Close;
  dsSem.DataSet.Open;
  dsSem.DataSet.FieldByName('ik_uch_plan').Visible:= false;
  dsSem.DataSet.FieldByName('n_sem').DisplayLabel:= 'Номер семестра';
  dsSem.DataSet.FieldByName('kol_ned').DisplayLabel:= 'Количество недель';
  IsModified:= false;
end;

procedure TfrmUchPlSemLength.actRemExecute(Sender: TObject);
begin
  inherited;
  dsSem.DataSet.Delete;
  IsModified:= true;
end;

procedure TfrmUchPlSemLength.actAddExecute(Sender: TObject);
var
  max: integer;
begin
  inherited;
  max:= 0;
  dsSem.DataSet.DisableControls;
  dsSem.DataSet.First;
  while (not dsSem.DataSet.Eof) do
  begin
    if (dsSem.DataSet.FieldByName('n_sem').AsInteger > max) then
      max:= dsSem.DataSet.FieldByName('n_sem').AsInteger;
    dsSem.DataSet.Next;
  end;
  dsSem.DataSet.EnableControls;
  dsSem.DataSet.First;
  dsSem.DataSet.Insert;
  dsSem.DataSet.FieldByName('ik_uch_plan').Value:= IK;
  if (max < 12) then inc(max);
  dsSem.DataSet.FieldByName('n_sem').Value:= max;
  dsSem.DataSet.FieldByName('kol_ned').Value:= 17;
  IsModified:= true;
end;

procedure TfrmUchPlSemLength.actAddUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled:= dsSem.DataSet.RecordCount < 12;
end;

procedure TfrmUchPlSemLength.actRemUpdate(Sender: TObject);
begin
  inherited;
  if (dsSem.DataSet.Active) then
    (Sender as TAction).Enabled:= dsSem.DataSet.RecordCount > 0
  else (Sender as TAction).Enabled:= false;
end;

procedure TfrmUchPlSemLength.FormShow(Sender: TObject);
begin
  inherited;
  dsSem.DataSet.First;
  dbgSem.SetFocus;
end;

procedure TfrmUchPlSemLength.dsSemStateChange(Sender: TObject);
begin
  IsModified:= true;
end;

end.
