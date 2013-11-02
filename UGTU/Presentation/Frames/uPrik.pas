unit uPrik;
  {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseFrame, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, uDm,
  Menus, uMain, ComCtrls, ToolWin, ActnList, Mask, DBCtrlsEh, DBLookupEh, Adodb,
  GridsEh, ApplicationController, ExceptionBase;

type
  TfmPrik = class(TfmBase)
    dbgePrik: TDBGridEh;
    ppmPrik: TPopupMenu;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ActionList1: TActionList;
    actEditPrikaz: TAction;
    actDelPrikaz: TAction;
    dbcbePrikFilter: TDBLookupComboboxEh;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    procedure dbgePrikDblClick(Sender: TObject);
    procedure actEditPrikazExecute(Sender: TObject);
    procedure actDelPrikazExecute(Sender: TObject);
    procedure actEditPrikazUpdate(Sender: TObject);
    procedure actDelPrikazUpdate(Sender: TObject);
    procedure dbgePrikTitleClick(Column: TColumnEh);
    procedure ToolButton5Click(Sender: TObject);
  protected
     procedure DoRefreshFrame;override;
     function DoApply: Boolean;override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPrik: TfmPrik;

implementation

uses uPrikDlg, uDMPrikaz;

procedure TfmPrik.DoRefreshFrame;
begin
  dbcbePrikFilter.KeyValue:=1;
  //dmPrikaz.adodsPrikType.Active:=true;
  //DataSet:= dbgePrik.DataSource.DataSet as TADODataSet;
  if dbgePrik.DataSource.DataSet.Active then
    dbgePrik.DataSource.DataSet.Close;
  dbgePrik.DataSource.DataSet.Open;
end;

function TfmPrik.DoApply: Boolean;
begin
  Result := true;
  dbgePrik.DataSource.DataSet.Refresh;
end;

{$R *.dfm}

procedure TfmPrik.dbgePrikDblClick(Sender: TObject);
begin
  actEditPrikaz.Execute;
end;



procedure TfmPrik.actEditPrikazExecute(Sender: TObject);
var
  r:integer;
begin
  inherited;
  ftmPrikaz:=TftmPrikaz.Create(self);
  try
	  ftmPrikaz.Caption:='Изменить приказ';
    with dbgePrik.DataSource.DataSet do
    begin
	    ftmPrikaz.Tag:= FieldByName('Ik_prikaz').Value;
	    ftmPrikaz.eNum.Value:= FieldByName('Nn_prikaz').Value;//dmPrikaz.adodsPrikazNn_prikaz.Value;
	    ftmPrikaz.dbdtePrikDate.Value:= FieldByName('Dd_prikaz').Value;//dmPrikaz.adodsPrikazDd_prikaz.Value;
	    ftmPrikaz.dbdteVstDate.Value:= FieldByName('Dd_prikazVst').Value;//dmPrikaz.adodsPrikazDd_prikazVst.Value;
	    ftmPrikaz.dbcbePrikType.Value:= FieldByName('ik_typePrikaz').Value;//dmPrikaz.adodsPrikazik_typePrikaz.Value;
    end;
	  r:= ftmPrikaz.showmodal;
	  if (r = mrOk) or (ftmPrikaz.bbApply.Tag = 1) then
	  begin
		  dbgePrik.DataSource.DataSet.Close;
		  dbgePrik.DataSource.DataSet.Open;
	  end;
  finally
    ftmPrikaz.Free;
  end;
end;

procedure TfmPrik.actDelPrikazExecute(Sender: TObject);
var
  i:integer;
  ExceptStr: string;
begin
  inherited;
  if MessageDlg('Вы действительно хотите удалить приказ(ы)?',mtConfirmation,mbYesNoCancel,0) = mrYes then
  begin
    try
			for i := 0 to dbgePrik.SelectedRows.Count-1 do
			begin
			  dbgePrik.DataSource.DataSet.GotoBookmark(Pointer(dbgePrik.SelectedRows[I]));
			  with dmPrikaz.aspPrikaz.Parameters do
			  begin
				clear;
				AddParameter;
				items[0].Value:=-1;
				AddParameter;
				items[1].Value:=dbgePrik.DataSource.DataSet.FieldByName('Nn_prikaz').Value;//dmPrikaz.adodsPrikazNn_prikaz.Value;
				AddParameter;
				items[2].Value:=dbgePrik.DataSource.DataSet.FieldByName('Dd_prikaz').Value;//dmPrikaz.adodsPrikazDd_prikaz.Value;
				AddParameter;
				items[3].Value:=dbgePrik.DataSource.DataSet.FieldByName('Dd_prikazVst').Value;//dmPrikaz.adodsPrikazDd_prikazVst.Value;
				AddParameter;
				items[4].Value:=dbgePrik.DataSource.DataSet.FieldByName('Ik_prikaz').Value;//dmPrikaz.adodsPrikazIk_prikaz.Value;
			  end;
			  try
				dmPrikaz.aspPrikaz.ExecProc;
			  except
				on E:Exception do
				begin
				  ExceptStr:= 'Невозможно удалить приказ № ' +dbgePrik.DataSource.DataSet.FieldByName('NN_Date').AsString+ ', так как он уже используется!';
				  raise EApplicationException.Create(ExceptStr, E);
				end;
			  end;
			end;
    finally
      dbgePrik.DataSource.DataSet.Close;
      dbgePrik.DataSource.DataSet.Open;
    end;
  end;
end;

procedure TfmPrik.actEditPrikazUpdate(Sender: TObject);
begin
  inherited;
  actEditPrikaz.Enabled:= dbgePrik.SelectedRows.Count = 1;
end;

procedure TfmPrik.actDelPrikazUpdate(Sender: TObject);
begin
  inherited;
  actDelPrikaz.Enabled:= dbgePrik.SelectedRows.Count > 0;
end;

procedure TfmPrik.dbgePrikTitleClick(Column: TColumnEh);
begin
inherited;
  (dbgePrik.DataSource.DataSet as TCustomADODataSet).Sort:=Column.Field.FieldName;
end;

procedure TfmPrik.ToolButton5Click(Sender: TObject);
begin
{try
 if Toolbutton5.Down then
  begin
  dmPrikaz.adodsPrikaz.close;
    dmPrikaz.adodsPrikaz.Commandtype:=cmdText;
    dmPrikaz.adodsPrikaz.CommandText:='select * from Prikaz where ik_TypePrikaz='''+inttostr(dbcbePrikFilter.KeyValue)+'''';
    dmPrikaz.adodsPrikaz.Active:=true;
  end
  else
  begin
  dmPrikaz.adodsPrikaz.close;
    dmPrikaz.adodsPrikaz.Commandtype:=cmdTable;
    dmPrikaz.adodsPrikaz.CommandText:='Prikaz';
    dmPrikaz.adodsPrikaz.Active:=true;

 end;
 except
 showMessage('Неверный параметр фильтра!');
 end  }
end;

end.
