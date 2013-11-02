unit uMethodWorkAddContentItemGos;
 {#Author nnikolenko@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, GeneralController, MethodWorkController,
  DBGridEh, DB, DBCtrls, Mask, DBCtrlsEh, DBLookupEh, ComCtrls, ToolWin, ImgList,
  uMethodWorkAddItemGos;

type
  TfrmMethodWorkAddContentItemGos = class(TfrmBaseDialog)
    Label1: TLabel;
    Label11: TLabel;
    dbcbYear: TDBLookupComboboxEh;
    dsItemGos: TDataSource;
    GroupBox4: TGroupBox;
    Panel9: TPanel;
    Panel10: TPanel;
    DBMemo1: TDBMemo;
    Label2: TLabel;
    Label3: TLabel;
    dbcbItemGos: TDBLookupComboboxEh;
    Label18: TLabel;
    dbcbSpec: TDBLookupComboboxEh;
    Label4: TLabel;
    ImageList1: TImageList;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    actAddItem: TAction;
    procedure dbcbItemGosKeyValueChanged(Sender: TObject);
    procedure dbcbYearKeyValueChanged(Sender: TObject);
    procedure DBMemo1Change(Sender: TObject);
    procedure dbcbSpecChange(Sender: TObject);
    procedure actAddItemExecute(Sender: TObject);
  private
    { Private declarations }
    procedure SetEditMode;
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    { Public declarations }
    fLastAddItemGos: integer;
    procedure Read(KafIK: integer);
  end;

var
  frmMethodWorkAddContentItemGos: TfrmMethodWorkAddContentItemGos;

implementation

{$R *.dfm}

procedure TfrmMethodWorkAddContentItemGos.actAddItemExecute(Sender: TObject);
begin
  {frmMethodWorkAddItemGos:= TfrmMethodWorkAddItemGos.CreateDialog(nil, self.Connection, nil);
try
  //frmMethodWorkAddItemGos.IK:= TDBNodeMethodWorkDepartmentObject(self.FrameObject).ik;
  //frmMethodWorkAddItemGos.Label4.Caption:= dbcbSpec.Text;
  //frmMethodWorkAddItemGos.Label4.Tag:= dbcbSpec.KeyValue;
  frmMethodWorkAddItemGos.Read;
  frmMethodWorkAddItemGos.IsModified:= false;
  if (frmMethodWorkAddItemGos.ShowModal() = mrOk) or (frmMethodWorkAddItemGos.bbApply.Tag = 1) then
  begin
    //TGeneralController.Instance.CloseLockupCB(@dbcbYearGos);
    //dbcbYearGos.KeyValue:= TMethodWorkController.Instance.GetYearGos(@dbcbYearGos.ListSource.DataSet, dbcbSpec.ListSource.DataSet.FieldByName('ik_spec').AsInteger, true);
    //dbcbYearGos.KeyValue:= frmMethodWorkAddGos.LastGosIK;
  end;
finally
  frmMethodWorkAddItemGos.Free;
end;}
end;

procedure TfrmMethodWorkAddContentItemGos.dbcbItemGosKeyValueChanged(
  Sender: TObject);
begin
if (dbcbYear.KeyValue <> NULL) and (dbcbItemGos.KeyValue <> NULL) then
   begin
    dsItemGos.DataSet:= TMethodWorkController.Instance.LoadItemGos(dbcbYear.ListSource.DataSet.FieldByName('IDGos').AsInteger, dbcbItemGos.ListSource.DataSet.FieldByName('IDItemGos').AsInteger);
    if (self.IK < 0) then
      if dsItemGos.DataSet.RecordCount > 0 then
        if Application.MessageBox('Такой пункт ГОСа уже существует!' + #10#13 + 'Перейти из режима добавления в режим редактирования пунктов ГОСа?','Пункты ГОСа',MB_YESNO) = mrYes then
        begin
          self.IK:= dsItemGos.DataSet.FieldByName('IDContentItemGos').AsInteger;
          SetEditMode;
        end;
   end
else dsItemGos.DataSet:= nil;
  IsModified:= (dbcbSpec.KeyValue <> NULL) and (dbcbYear.Value <> NULL) and (dbcbItemGos.KeyValue <> NULL);
end;

procedure TfrmMethodWorkAddContentItemGos.dbcbSpecChange(Sender: TObject);
begin
  if dbcbSpec.KeyValue <> NULL then
    dbcbYear.KeyValue:= TMethodWorkController.Instance.GetYearGos(@dbcbYear.ListSource.DataSet, dbcbSpec.KeyValue, false);
  IsModified:= (dbcbSpec.KeyValue <> NULL) and (dbcbYear.Value <> NULL) and (dbcbItemGos.KeyValue <> NULL);
end;

procedure TfrmMethodWorkAddContentItemGos.dbcbYearKeyValueChanged(
  Sender: TObject);
begin
  dbcbItemGos.KeyValue:= TMethodWorkController.Instance.GetAllItemGos(@dbcbItemGos.ListSource.DataSet, false);
  IsModified:= (dbcbSpec.KeyValue <> NULL) and (dbcbYear.Value <> NULL) and (dbcbItemGos.KeyValue <> NULL);
end;

procedure TfrmMethodWorkAddContentItemGos.DBMemo1Change(Sender: TObject);
begin
  IsModified:= (dbcbSpec.KeyValue <> NULL) and (dbcbYear.Value <> NULL) and (dbcbItemGos.KeyValue <> NULL);
end;

function TfrmMethodWorkAddContentItemGos.DoApply: boolean;
begin
  {if DBMemo1.Text = '' then
  begin
   Result:= false;
   Application.MessageBox('Необходимо указать содержание пункта ГОСа!', 'Сохранение пунктов ГОСа', MB_ICONWARNING);
   exit;
  end;}
  fLastAddItemGos:= ik;
  Result:= TMethodWorkController.Instance.SaveItemGos(fLastAddItemGos, dbcbYear.KeyValue, dbcbItemGos.KeyValue, DBMemo1.Text);
end;

function TfrmMethodWorkAddContentItemGos.DoCancel: boolean;
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

procedure TfrmMethodWorkAddContentItemGos.Read(KafIK: integer);
begin
  TGeneralController.Instance.InitializeLockupCB(@dbcbSpec, 'ik_spec', 'Cshort_spec');
  TGeneralController.Instance.InitializeLockupCB(@dbcbYear, 'IDGos', 'year_value');
  TGeneralController.Instance.InitializeLockupCB(@dbcbItemGos, 'IDItemGos', 'NameItemGos');

  dbcbSpec.KeyValue:= TMethodWorkController.Instance.GetSpec(@dbcbSpec.ListSource.DataSet, false);

  if (self.IK < 0) then
    Caption:= 'Добавление пунктов ГОСа'
  else SetEditMode;
end;

procedure TfrmMethodWorkAddContentItemGos.SetEditMode;
begin
  Caption:= 'Редактирование пунктов ГОСа';
  dbcbItemGos.Enabled:= false;
  dbcbYear.Enabled:= false;
  IsModified:= false;
end;

end.
