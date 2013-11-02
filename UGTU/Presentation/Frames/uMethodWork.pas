unit uMethodWork;
  {#Author nnikolenko@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseFrame, ActnList, StdCtrls, Buttons, ExtCtrls, GridsEh, DBGridEh,
  ComCtrls, DB, DBTVMethodWorkObj, Mask, DBCtrlsEh, DBLookupEh, ToolWin, ImgList,
  ADODB, MethodWorkController, GeneralController;

type
  TfmMethodWork = class(TfmBase)
    ActionList1: TActionList;
    actUndo: TAction;
    actSave: TAction;
    PageControl1: TPageControl;
    tsFac: TTabSheet;
    dbgeFac: TDBGridEh;
    DSFac: TDataSource;
    TabSheet1: TTabSheet;
    ImageList1: TImageList;
    ToolBar2: TToolBar;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    Panel2: TPanel;
    actList: TActionList;
    actAddNorm: TAction;
    actEditNorm: TAction;
    actDelNorm: TAction;
    dsNormOfTime: TDataSource;
    Panel3: TPanel;
    dbgMethodWork: TDBGridEh;
    Panel4: TPanel;
    sbDelString: TSpeedButton;
    sbAddString: TSpeedButton;
    Panel5: TPanel;
    dbcbNorm: TDBLookupComboboxEh;
    Label1: TLabel;
    actAdd: TAction;
    actRem: TAction;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Panel6: TPanel;
    Panel13: TPanel;
    Label9: TLabel;
    dbcbMW: TDBLookupComboboxEh;
    Panel14: TPanel;
    DBGridEh2: TDBGridEh;
    Panel15: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    dsSrok: TDataSource;
    actAddSrok: TAction;
    actRemSrok: TAction;
    procedure dbcbNormKeyValueChanged(Sender: TObject);
    procedure actEditNormUpdate(Sender: TObject);
    procedure actAddNormExecute(Sender: TObject);
    procedure actSaveUpdate(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actAddUpdate(Sender: TObject);
    procedure actRemExecute(Sender: TObject);
    procedure actRemUpdate(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actUndoExecute(Sender: TObject);
    procedure dsNormOfTimeDataChange(Sender: TObject; Field: TField);
    procedure dbgMethodWorkColumns0EditButtonClick(Sender: TObject;
      var Handled: Boolean);
    procedure actEditNormExecute(Sender: TObject);
    procedure actDelNormExecute(Sender: TObject);
    procedure dsSrokDataChange(Sender: TObject; Field: TField);
    procedure dbcbMWKeyValueChanged(Sender: TObject);
    procedure actAddSrokUpdate(Sender: TObject);
    procedure actRemSrokUpdate(Sender: TObject);
    procedure actAddSrokExecute(Sender: TObject);
    procedure actRemSrokExecute(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
  private
    { Private declarations }
    flagNormChange, flagSrokChange: boolean;
    FFrame:TfmBase;
    procedure SetFrame(FrameClass:TBaseFrameClass);
  protected
    procedure DoRefreshFrame;override;
  public
    { Public declarations }
    property Frame:TBaseFrameClass write SetFrame;
  end;

var
  fmMethodWork: TfmMethodWork;

implementation
uses uMain, uMethodWorkAddNorm, uMethodWorkAddWorkInNorm, uMethodWorkTreeView;

{$R *.dfm}
//----------------------------------------------------------------------------
{ TfmMethodWork }
procedure TfmMethodWork.actAddExecute(Sender: TObject);
begin
 dsNormOfTime.DataSet.First;
 dsNormOfTime.DataSet.Insert;
 flagNormChange:= true;
end;

procedure TfmMethodWork.actAddNormExecute(Sender: TObject);
begin
  frmMethodWorkAddNorm:= TfrmMethodWorkAddNorm.CreateDialog(nil, self.Connection, nil);
try
  frmMethodWorkAddNorm.IK:= -1;
  //dsNormOfTime.DataSet:= nil;
  frmMethodWorkAddNorm.Read(0);
  if (frmMethodWorkAddNorm.ShowModal() = mrOk) or (frmMethodWorkAddNorm.bbApply.Tag = 1) then
  begin
    TGeneralController.Instance.CloseLockupCB(@dbcbNorm);
    dbcbNorm.KeyValue:= TMethodWorkController.Instance.GetNormsOfTime(@dbcbNorm.ListSource.DataSet, false);
    dbcbNorm.KeyValue:= frmMethodWorkAddNorm.fLastAddNorm;

    if (frmMethodWorkAddNorm.CheckBox1.Checked) and (frmMethodWorkAddNorm.dbcbNormExists.KeyValue <> NULL) then
      TMethodWorkController.Instance.LoadExistsNormOfTime(frmMethodWorkAddNorm.dbcbNormExists.KeyValue);
  end
  else dbcbNormKeyValueChanged(nil);
finally
  frmMethodWorkAddNorm.Free;
end;
end;

procedure TfmMethodWork.actAddSrokExecute(Sender: TObject);
begin
  dsSrok.DataSet.First;
  dsSrok.DataSet.Insert;
end;

procedure TfmMethodWork.actAddSrokUpdate(Sender: TObject);
begin
  if dsSrok.DataSet <> nil then
    actAddSrok.Enabled:= (dsSrok.DataSet.Active) and (dbcbMW.KeyValue <> NULL)
  else actAddSrok.Enabled:= false;
end;

procedure TfmMethodWork.actAddUpdate(Sender: TObject);
begin
  if dsNormOfTime.DataSet <> nil then
    actAdd.Enabled:= (dsNormOfTime.DataSet.Active) and (dbcbNorm.KeyValue <> NULL)
  else actAdd.Enabled:= false;
end;

procedure TfmMethodWork.actDelNormExecute(Sender: TObject);
begin
  if (Application.MessageBox('Вы действительно хотите удалить выбранные нормы времени?','Удаление норм времени', mb_YesNo) = mrYes) then
  begin
    TMethodWorkController.Instance.DeleteNormOfTime(dbcbNorm.KeyValue);
    TGeneralController.Instance.CloseLockupCB(@dbcbNorm);
    dbcbNorm.KeyValue:= TMethodWorkController.Instance.GetNormsOfTime(@dbcbNorm.ListSource.DataSet, true);
  end;
end;

procedure TfmMethodWork.actEditNormExecute(Sender: TObject);
var
  i: integer;
begin
  frmMethodWorkAddNorm:= TfrmMethodWorkAddNorm.CreateDialog(nil, self.Connection, nil);
try
  frmMethodWorkAddNorm.IK:= dbcbNorm.KeyValue;
  frmMethodWorkAddNorm.Read(0);
  frmMethodWorkAddNorm.dbcbKaf.KeyValue:= dbcbNorm.ListSource.DataSet.FieldByName('ik_kaf').AsInteger;
  frmMethodWorkAddNorm.dbcbYear.KeyValue:= dbcbNorm.ListSource.DataSet.FieldByName('ik_year').AsInteger;
  frmMethodWorkAddNorm.dbeYearVolum.Text:= dbcbNorm.ListSource.DataSet.FieldByName('Vnagr').AsString;
  frmMethodWorkAddNorm.dbeDolMW.Text:= dbcbNorm.ListSource.DataSet.FieldByName('DnagrMW').AsString;
  frmMethodWorkAddNorm.IsModified:= false;
  if (frmMethodWorkAddNorm.ShowModal() = mrOk) or (frmMethodWorkAddNorm.bbApply.Tag = 1) then
  begin
    TGeneralController.Instance.CloseLockupCB(@dbcbNorm);
    dbcbNorm.KeyValue:= TMethodWorkController.Instance.GetNormsOfTime(@dbcbNorm.ListSource.DataSet, false);
    dbcbNorm.KeyValue:= frmMethodWorkAddNorm.fLastAddNorm;

    if (frmMethodWorkAddNorm.CheckBox1.Checked) and (frmMethodWorkAddNorm.dbcbNormExists.KeyValue <> NULL) then
    begin
      dsNormOfTime.DataSet.First;
      for i := 0 to dsNormOfTime.DataSet.RecordCount - 1 do
        dsNormOfTime.DataSet.Delete;
      TMethodWorkController.Instance.LoadExistsNormOfTime(frmMethodWorkAddNorm.dbcbNormExists.KeyValue);
    end;
  end
  else dbcbNormKeyValueChanged(nil);
finally
  frmMethodWorkAddNorm.Free;
end;
end;

procedure TfmMethodWork.actEditNormUpdate(Sender: TObject);
begin
  if (dbcbNorm.ListSource.DataSet.Active) then
    (Sender as TAction).Enabled:= dbcbNorm.KeyValue <> NULL
  else (Sender as TAction).Enabled:= false;
end;

procedure TfmMethodWork.actRemExecute(Sender: TObject);
begin
  dsNormOfTime.DataSet.Delete;
  flagNormChange:= true;
end;

procedure TfmMethodWork.actRemSrokExecute(Sender: TObject);
begin
  dsSrok.DataSet.Delete;
  flagSrokChange:= true;
end;

procedure TfmMethodWork.actRemSrokUpdate(Sender: TObject);
begin
  if (dsSrok.DataSet <> nil) then
  begin
    if (dsSrok.DataSet.Active) then
      actRemSrok.Enabled:= dsSrok.DataSet.RecordCount > 0
    else actRemSrok.Enabled:= false;
  end
  else actRemSrok.Enabled:= false;
end;

procedure TfmMethodWork.actRemUpdate(Sender: TObject);
begin
  if (dsNormOfTime.DataSet <> nil) then
  begin
    if (dsNormOfTime.DataSet.Active) then
      actRem.Enabled:= dsNormOfTime.DataSet.RecordCount > 0
    else actRem.Enabled:= false;
  end
  else actRem.Enabled:= false;
end;

procedure TfmMethodWork.actSaveExecute(Sender: TObject);
begin
  if PageControl1.ActivePageIndex = 2 then
  begin
    dsNormOfTime.DataSet.First;
    while (not dsNormOfTime.DataSet.Eof) do
    begin
      if (dsNormOfTime.DataSet.FieldByName('NameW').Value = NULL) or (dsNormOfTime.DataSet.FieldByName('Norma').Value = NULL)
       or (dsNormOfTime.DataSet.FieldByName('NormaExpert').Value = NULL) or (dsNormOfTime.DataSet.FieldByName('IDUnit').Value = NULL) then
      begin
        Application.MessageBox('Необходимо указать вид работы, норму времени для его выполнения и единицу измерения работы для каждой записи!', 'Сохранение норм времени', MB_ICONWARNING);
        exit;
      end;
      dsNormOfTime.DataSet.Next;
    end;
    flagNormChange:= not TMethodWorkController.Instance.SaveContentNormOfTime(dbcbNorm.KeyValue);
  end

  else if PageControl1.ActivePageIndex = 3 then
  begin
    dsSrok.DataSet.First;
    while (not dsSrok.DataSet.Eof) do
    begin
      if (dsSrok.DataSet.FieldByName('NameStatus').Value = NULL) or (dsSrok.DataSet.FieldByName('EffectiveDate').Value = NULL) then
      begin
        Application.MessageBox('Необходимо указать наименование статуса и срок действия для каждой записи!', 'Сохранение сроков действия', MB_ICONWARNING);
        exit;
      end;
      dsSrok.DataSet.Next;
    end;
    flagSrokChange:= not TMethodWorkController.Instance.SaveSrokMW(dbcbMW.KeyValue);
  end;
end;

procedure TfmMethodWork.actSaveUpdate(Sender: TObject);
begin
  if PageControl1.ActivePageIndex = 2 then
    (Sender as TAction).Enabled:= flagNormChange and (dbcbNorm.KeyValue <> NULL)
  else if PageControl1.ActivePageIndex = 3 then
    (Sender as TAction).Enabled:= flagSrokChange and (dbcbMW.KeyValue <> NULL);
end;

procedure TfmMethodWork.actUndoExecute(Sender: TObject);
begin
  if Application.MessageBox('Вы уверены, что хотите отменить сделанные изменения?', 'Отмена изменений', MB_YESNO) = mrYes then
  begin
    if PageControl1.ActivePageIndex = 2 then
    begin
      dsNormOfTime.DataSet.Close;
      dsNormOfTime.DataSet.Open;
      flagNormChange:= false;
    end
    else if PageControl1.ActivePageIndex = 3 then
    begin
      dsSrok.DataSet.Close;
      dsSrok.DataSet.Open;
      flagSrokChange:= false;
    end;
  end;
end;

procedure TfmMethodWork.dbcbMWKeyValueChanged(Sender: TObject);
begin
  if (dbcbMW.KeyValue <> NULL) then
    dsSrok.DataSet:= TMethodWorkController.Instance.LoadSrokMethodWork(dbcbMW.ListSource.DataSet.FieldByName('IDWarrant').AsInteger);
  flagSrokChange:= false;
end;

procedure TfmMethodWork.dbcbNormKeyValueChanged(Sender: TObject);
begin
  if (dbcbNorm.KeyValue <> NULL) then
  begin
    dsNormOfTime.DataSet:= TMethodWorkController.Instance.LoadNormOfTime(dbcbNorm.ListSource.DataSet.FieldByName('IDNormOfTime').AsInteger);
    frmMain.StatusBar1.Panels[1].Text:= 'Нормы времени: ' + dbcbNorm.Text;
  end
  else frmMain.StatusBar1.Panels[1].Text:= 'Нормы времени: <не выбраны>';
  flagNormChange:= false;
end;

procedure TfmMethodWork.dbgMethodWorkColumns0EditButtonClick(Sender: TObject;
  var Handled: Boolean);
begin
  frmMethodWorkAddWorkInNorm:= TfrmMethodWorkAddWorkInNorm.CreateDialog(nil, self.Connection, nil);
try
  frmMethodWorkAddWorkInNorm.Read(dsNormOfTime.DataSet.FieldByName('IDMethodWork').Value);
  if (frmMethodWorkAddWorkInNorm.ShowModal() = mrOk) then
  begin
    if (dsNormOfTime.DataSet.State <> dsEdit) and (dsNormOfTime.DataSet.State <> dsInsert) then
      dsNormOfTime.DataSet.Edit;
    dsNormOfTime.DataSet.FieldByName('IDMethodWork').AsInteger:= frmMethodWorkAddWorkInNorm.IK;
  end;
finally
  frmMethodWorkAddWorkInNorm.Free;
end;
end;

procedure TfmMethodWork.SetFrame(FrameClass: TBaseFrameClass);
begin
  if (FrameClass = nil) then
  begin
     FFrame:=nil;
     exit;
  end;

  if Assigned(FFrame) then
  begin
    FFrame.Visible:= false;
    FFrame.CloseFrame;
  end
  else FFrame:= FrameClass.CreateFrame(nil, nil, nil);

  FFrame.Align:=alClient;
  FFrame.Parent:= TabSheet2;

  FFrame.Visible:=true;
end;

procedure TfmMethodWork.DoRefreshFrame;
begin
  inherited;
  PageControl1Change(nil);

  // Список факультетов
  DSFac.DataSet:=DataSet;

  // Виды работ
  Frame:=TfmMethodWorkTreeView;
  FFrame.RefreshFrame;

  // Нормы времени
  TGeneralController.Instance.InitializeLockupCB(@dbcbNorm, 'IDNormOfTime', 'cName_norm');
  dbcbNorm.KeyValue:= TMethodWorkController.Instance.GetNormsOfTime(@dbcbNorm.ListSource.DataSet, true);
  //dbcbNorm.KeyValue:= NULL;
  flagNormChange:= false;

  // Сроки действия обеспечения
  TGeneralController.Instance.InitializeLockupCB(@dbcbMW, 'IDWarrant', 'NameWarrant');
  dbcbMW.KeyValue:= TMethodWorkController.Instance.GetWarrant(@dbcbMW.ListSource.DataSet, true);
  flagSrokChange:= false;

end;

procedure TfmMethodWork.dsNormOfTimeDataChange(Sender: TObject; Field: TField);
begin
  if (dsNormOfTime.DataSet.State = dsEdit) or (dsNormOfTime.DataSet.State = dsInsert) then
    flagNormChange:= dbcbNorm.KeyValue <> NULL;
end;

procedure TfmMethodWork.dsSrokDataChange(Sender: TObject; Field: TField);
begin
  if (dsSrok.DataSet.State = dsEdit) or (dsSrok.DataSet.State = dsInsert) then
    flagSrokChange:= dbcbMW.KeyValue <> NULL;
end;

procedure TfmMethodWork.PageControl1Change(Sender: TObject);
begin
  case PageControl1.ActivePageIndex of
  2:begin
      bbUndo.Visible:= true;
      bbSave.Visible:= true;
    end;
  3:begin
      bbUndo.Visible:= true;
      bbSave.Visible:= true;
    end
  else
    begin
      bbUndo.Visible:= false;
      bbSave.Visible:= false;
    end;
  end;
end;

end.
