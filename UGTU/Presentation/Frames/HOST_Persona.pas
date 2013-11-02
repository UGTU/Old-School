unit HOST_Persona;
   {#Author llodigina@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPerson, DBGridEh, ImgList, StdCtrls, Buttons, DBCtrls, ExtCtrls,
  GridsEh, ComCtrls, ToolWin, DBLookupEh, DBCtrlsEh, Mask,DBTVHabitatsPersonObj,
  ActnList;

type
  TfmHOSTPerson = class(TfmPerson)
    TabRegistr: TTabSheet;
    DBGridRegistr: TDBGridEh;
    TabNarush: TTabSheet;
    TabInventar: TTabSheet;
    DBNavigator1: TDBNavigator;
    DBNavigator4: TDBNavigator;
    DBGridInventar: TDBGridEh;
    ActionList1: TActionList;
    actApply: TAction;
    actUndo: TAction;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    ImageList1: TImageList;
    ToolBar3: TToolBar;
    ToolButton2: TToolButton;
    CheckPokVse: TCheckBox;
    ToolButton3: TToolButton;
    BTKartochka: TToolButton;
    DBGridNarush: TDBGridEh;
    procedure PageControl1Change(Sender: TObject);
    procedure PageLichDannieChange(Sender: TObject);
    procedure actApplyUpdate(Sender: TObject);
    procedure actUndoExecute(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
    procedure actUndoUpdate(Sender: TObject);
    procedure DBGridNarushColumns0UpdateData(Sender: TObject; var Text: string;
      var Value: Variant; var UseText, Handled: Boolean);
    procedure DBGridInventarColumns0UpdateData(Sender: TObject;
      var Text: string; var Value: Variant; var UseText, Handled: Boolean);
    procedure DBGridNarushColExit(Sender: TObject);
    procedure DBGridInventarColExit(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure CheckPokVseClick(Sender: TObject);
    procedure BTKartochkaClick(Sender: TObject);
      private
    { Private declarations }
  public
    { Public declarations }
     procedure DoRefreshFrame;override;
     function DoApply: Boolean;override;
     function DoCancel:boolean;
  end;

var
  fmHOSTPerson: TfmHOSTPerson;

implementation

uses uHOST,ApplicationController,HOST_ProjivayushieController,uDMStudentData,
uDMAdress,uDMCauses,uDMStudentSelectionProcs,HOST_ReportController;
{$R *.dfm}


procedure TfmHOSTPerson.actApplyExecute(Sender: TObject);
begin
  inherited;
  DoApply;
  actApply.Enabled:=false;
end;

procedure TfmHOSTPerson.actApplyUpdate(Sender: TObject);
begin
  inherited;
  if Self.Modified then
  actApply.Enabled:=true
  else
  actApply.Enabled:=false;
end;

procedure TfmHOSTPerson.actUndoExecute(Sender: TObject);
begin
  inherited;
  DoCancel;
end;

procedure TfmHOSTPerson.actUndoUpdate(Sender: TObject);
begin
  inherited;
  if Self.Modified then
  actUndo.Enabled:=true else
  actUndo.Enabled:=false;
end;


procedure TfmHOSTPerson.BTKartochkaClick(Sender: TObject);
begin
  TApplicationController.GetInstance.AddLogEntry('Вывод карточки в эксель.');
  inherited;
  THOST_ReportController.Instance.PrintKartochka(ik);
end;

procedure TfmHOSTPerson.CheckPokVseClick(Sender: TObject);
begin
  inherited;
    if CheckPokVse.Checked then
    begin
    dmHOST.ProcVivodInvent.Filter:='';
    dmHOST.ProcVivodInvent.Filtered:=false;
    end
    else
    begin
    dmHOST.ProcVivodInvent.Filter:= 'DataVozvrata='+'null';
    dmHOST.ProcVivodInvent.Filtered:=true;
    end;
end;

procedure TfmHOSTPerson.DBGridInventarColExit(Sender: TObject);
begin
  inherited;
  if (dmHOST.ProcVivodInvent.FieldByName('nCode').AsString = '') then
  begin
    dmHOST.ProcVivodInvent.FieldByName('nCode').Value:=
      (FrameObject as TDBNodeHabitatsPersonObject).ncode;
  end;
end;

procedure TfmHOSTPerson.DBGridInventarColumns0UpdateData(Sender: TObject;
  var Text: string; var Value: Variant; var UseText, Handled: Boolean);
begin
  inherited;
  Modified:=true;
end;

procedure TfmHOSTPerson.DBGridNarushColExit(Sender: TObject);
begin
  inherited;
  if (dmHOST.vNarushPersony.FieldByName('nCode').AsString = '') then
  begin
    dmHOST.vNarushPersony.FieldByName('nCode').Value:=
      (FrameObject as TDBNodeHabitatsPersonObject).ncode;
  end;

end;

procedure TfmHOSTPerson.DBGridNarushColumns0UpdateData(Sender: TObject;
  var Text: string; var Value: Variant; var UseText, Handled: Boolean);
begin
  inherited;
  Modified:=true;
end;

function TfmHOSTPerson.DoApply: Boolean;
begin
  if modified  then
  begin
   //dmHOST.vNarushPersony.UpdateBatch();
   dmHOST.ProcVivodInvent.UpdateBatch();
   modified:= false;
  end;
  result:=true;
end;

function TfmHOSTPerson.DoCancel: boolean;
begin
  dmHOST.vNarushPersony.Close;
  dmHOST.vNarushPersony.Open;
  dmHOST.ProcVivodInvent.Close;
  dmHOST.ProcVivodInvent.Open;
  Result := true;
end;

procedure TfmHOSTPerson.DoRefreshFrame;
begin
  //inherited;
  LoadData;
  modified:= false;
end;

procedure TfmHOSTPerson.PageControl1Change(Sender: TObject);
begin
  inherited;
   if PageControl1.ActivePage = TabNarush then
  begin
    TApplicationController.GetInstance.AddLogEntry('Переход на вкладку нарушения.');
    try
      pnlSave.Visible:=false;
      dmHOST.vNarushPersony.Close;
      dmHOST.vNarushPersony.Open;
      dmHOST.vNarushPersony.Filter:= 'nCode='+IntToStr(ik);
      dmHOST.vNarushPersony.Filtered:=true;
    except
          MessageBox(Handle, 'Ошибка формирования нарушений персоны.',
					  'ИС УГТУ', MB_OK);
    end;
  end;
  if PageControl1.ActivePage = TabLichnDan then
  begin
    TApplicationController.GetInstance.AddLogEntry('Переход на вкладку личные данные.');
    try
    pnlSave.Visible:=false;
    except
          MessageBox(Handle, 'Ошибка формирования личных данных персоны.',
					  'ИС УГТУ', MB_OK);
    end;
  end;
  if PageControl1.ActivePage = TabInventar then
  begin
    TApplicationController.GetInstance.AddLogEntry('Переход на вкладку инвентарь.');
    try
    pnlSave.Visible:=true;
    THOST_ProjivayushieController.Instance.VivodInventPerson(ik);
    dmHOST.VidInvent.Active:=true;
    CheckPokVseClick(Sender);
    except
          MessageBox(Handle, 'Ошибка формирования инвентаря персоны.',
					  'ИС УГТУ', MB_OK);
    end;
  end;
end;

procedure TfmHOSTPerson.PageLichDannieChange(Sender: TObject);
begin
  inherited;
   if PageLichDannie.ActivePage = TabRegistr then
  begin
    TApplicationController.GetInstance.AddLogEntry('Переход на вкладку регистрация.');
    try
    THOST_ProjivayushieController.Instance.VivodRegistrPerson(ik)
    except
          MessageBox(Handle, 'Ошибка формирования регистрации персоны.',
					  'ИС УГТУ', MB_OK);
    end;
  end;
end;

procedure TfmHOSTPerson.ToolButton1Click(Sender: TObject);
begin
  inherited;
  if (MessageBox(Handle, '           Удалить запись?','ИС Деканат',
          MB_YESNO) = IDYES) then
  begin
      //dmHOST.ProcVivodNarush.Delete;
      modified:= true;
      actApply.Enabled:=true;
      actUndo.Enabled:=true;
  end;
end;

procedure TfmHOSTPerson.ToolButton2Click(Sender: TObject);
begin
  inherited;
   if (MessageBox(Handle, '           Удалить запись?','ИС Деканат',
          MB_YESNO) = IDYES) then
    begin
      dmHOST.ProcVivodInvent.Delete;
      modified:= true;
      actApply.Enabled:=true;
      actUndo.Enabled:=true;
    end;
end;

end.
