unit uMethodWorkAddContentDiscOnGos;
  {#Author nnikolenko@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, DBGridEh, Mask,
  DBCtrlsEh, DBLookupEh, DBCtrls, DB, GeneralController, MethodWorkController,
  ImgList, ComCtrls, ToolWin;

type
  TfrmMethodWorkAddContentDiscOnGos = class(TfrmBaseDialog)
    GroupBox4: TGroupBox;
    Panel9: TPanel;
    Panel10: TPanel;
    dbcbYear: TDBLookupComboboxEh;
    Label1: TLabel;
    Label4: TLabel;
    dbcbCklDisc: TDBLookupComboboxEh;
    Label12: TLabel;
    dbcbGrpDisc: TDBLookupComboboxEh;
    Label5: TLabel;
    dbcbDiscGos: TDBLookupComboboxEh;
    Label7: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    DBMemo2: TDBMemo;
    dsDiscGos: TDataSource;
    dbeCode: TDBEditEh;
    dbeHour: TDBEditEh;
    Label11: TLabel;
    Label3: TLabel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ImageList1: TImageList;
    actLoad: TAction;
    procedure dbcbYearKeyValueChanged(Sender: TObject);
    procedure actLoadExecute(Sender: TObject);
    procedure dbeHourKeyPress(Sender: TObject; var Key: Char);
    procedure dbcbDiscGosKeyValueChanged(Sender: TObject);
    procedure dbcbCklDiscKeyValueChanged(Sender: TObject);
  private
    { Private declarations }
    Kaf: integer;
    procedure SetEditMode;
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    { Public declarations }
    fLastAddDiscGos: integer;
    procedure Read(KafIK: integer);
  end;

var
  frmMethodWorkAddContentDiscOnGos: TfrmMethodWorkAddContentDiscOnGos;

implementation

{$R *.dfm}

procedure TfrmMethodWorkAddContentDiscOnGos.actLoadExecute(Sender: TObject);
begin
  dbcbDiscGos.KeyValue:= TMethodWorkController.Instance.GetDiscForGos(@dbcbDiscGos.ListSource.DataSet, 0, true);
end;

procedure TfrmMethodWorkAddContentDiscOnGos.dbcbCklDiscKeyValueChanged(
  Sender: TObject);
begin
  IsModified:= (dbcbYear.Value <> NULL) and (dbcbCklDisc.KeyValue <> NULL) and (dbcbDiscGos.KeyValue <> NULL);
end;

procedure TfrmMethodWorkAddContentDiscOnGos.dbcbDiscGosKeyValueChanged(
  Sender: TObject);
begin
if (dbcbYear.KeyValue <> NULL) and (dbcbDiscGos.KeyValue <> NULL) then
   begin
    dsDiscGos.DataSet:= TMethodWorkController.Instance.LoadDiscGos(dbcbYear.ListSource.DataSet.FieldByName('IDGos').AsInteger, dbcbDiscGos.ListSource.DataSet.FieldByName('ik_disc').AsInteger);
   if (self.IK < 0) then
      if dsDiscGos.DataSet.RecordCount > 0 then
      begin
        if Application.MessageBox('Такая дисциплина в ГОСе уже существует!' + #10#13 + 'Перейти из режима добавления в режим редактирования дисциплин ГОСа?','Дисциплины ГОСа',MB_YESNO) = mrYes then
        begin
          self.IK:= dsDiscGos.DataSet.FieldByName('IDContentDiscOnGos').AsInteger;
          SetEditMode;
        end
        else
        begin
          dbcbCklDisc.Enabled:= false;
          dbcbGrpDisc.Enabled:= false;
          dbeCode.Enabled:= false;
          dbeHour.Enabled:= false;
          DBMemo2.Enabled:= false;
        end;
        dbeCode.Text:= dsDiscGos.DataSet.FieldByName('Code').AsString;
        dbeHour.Text:= dsDiscGos.DataSet.FieldByName('TotalHour').AsString;
        dbcbCklDisc.KeyValue:= dsDiscGos.DataSet.FieldByName('IK_ckl_disc').AsInteger;
        if dsDiscGos.DataSet.FieldByName('IK_grp_disc').Value = NULL then dbcbGrpDisc.KeyValue:= NULL
        else dbcbGrpDisc.KeyValue:= dsDiscGos.DataSet.FieldByName('IK_grp_disc').AsInteger;
      end
      else
      begin
        dbcbCklDisc.Enabled:= true;
        dbcbGrpDisc.Enabled:= true;
        dbeCode.Enabled:= true;
        dbeHour.Enabled:= true;
        DBMemo2.Enabled:= true;
        dbeCode.Text:= '';
        dbeHour.Text:= '';
        dbcbCklDisc.KeyValue:= NULL;
        dbcbGrpDisc.KeyValue:= NULL;
      end;
   end
else
begin
  dsDiscGos.DataSet:= nil;
  dbeCode.Text:= '';
  dbeHour.Text:= '';
  dbcbCklDisc.KeyValue:= NULL;
  dbcbGrpDisc.KeyValue:= NULL;
end;
  IsModified:= (dbcbYear.Value <> NULL) and (dbcbCklDisc.KeyValue <> NULL) and (dbcbDiscGos.KeyValue <> NULL);
end;

procedure TfrmMethodWorkAddContentDiscOnGos.dbcbYearKeyValueChanged(
  Sender: TObject);
begin
  dbcbDiscGos.KeyValue:= TMethodWorkController.Instance.GetDiscForGos(@dbcbDiscGos.ListSource.DataSet, Kaf, false);
  IsModified:= (dbcbYear.Value <> NULL) and (dbcbCklDisc.KeyValue <> NULL) and (dbcbDiscGos.KeyValue <> NULL);
end;

procedure TfrmMethodWorkAddContentDiscOnGos.dbeHourKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not(Key in ['0'..'9']) and (Key <> #8) and (Key <> #46) then
 begin
   Key :=#0;
   Beep;
 end;
end;

function TfrmMethodWorkAddContentDiscOnGos.DoApply: boolean;
begin
if DBMemo2.Text = '' then
  begin
   Result:= false;
   Application.MessageBox('Необходимо указать содержание дисциплины ГОСа!', 'Сохранение дисциплины ГОСа', MB_ICONWARNING);
   exit;
  end;
if dbcbGrpDisc.KeyValue = NULL then dbcbGrpDisc.KeyValue:= -1;
if dbeCode.Text = '' then dbeCode.Text:= ' ';
if dbeHour.Text = '' then dbeHour.Text:= '0';
  fLastAddDiscGos:= ik;
  Result:= TMethodWorkController.Instance.SaveDiscGos(fLastAddDiscGos, dbcbYear.KeyValue, dbcbDiscGos.KeyValue, dbcbCklDisc.KeyValue, dbcbGrpDisc.KeyValue, dbeCode.Text, StrToInt(dbeHour.Text), DBMemo2.Text);
end;

function TfrmMethodWorkAddContentDiscOnGos.DoCancel: boolean;
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

procedure TfrmMethodWorkAddContentDiscOnGos.Read(KafIK: integer);
begin
  Kaf:= KafIK;
  TGeneralController.Instance.InitializeLockupCB(@dbcbYear, 'IDGos', 'year_value');
  TGeneralController.Instance.InitializeLockupCB(@dbcbCklDisc, 'IK_ckl_disc', 'name_ckl_disc');
  TGeneralController.Instance.InitializeLockupCB(@dbcbGrpDisc, 'IK_grp_disc', 'name_grp_disc');
  TGeneralController.Instance.InitializeLockupCB(@dbcbDiscGos, 'iK_disc', 'cName_disc');

  //dbcbYear.KeyValue:= TMethodWorkController.Instance.GetYearGos(@dbcbYear.ListSource.DataSet, StrToInt(TMethodWorkController.Instance.GetSpecName(KafIK, false)), true);
  dbcbCklDisc.KeyValue:= TMethodWorkController.Instance.getAllDisciplineCycles(@dbcbCklDisc.ListSource.DataSet, false);
  dbcbGrpDisc.KeyValue:= TMethodWorkController.Instance.getAllDisciplineGroups(@dbcbGrpDisc.ListSource.DataSet, false);

  if (self.IK < 0) then
    Caption:= 'Добавление дисциплины ГОСа'
  else SetEditMode;
end;

procedure TfrmMethodWorkAddContentDiscOnGos.SetEditMode;
begin
  Caption:= 'Редактирование содержания дисциплины по ГОСу';
  dbcbYear.Enabled:= false;
  dbcbDiscGos.Enabled:= false;
  //dbcbDiscGos.KeyValue:= TMethodWorkController.Instance.GetDiscForGos(@dbcbDiscGos.ListSource.DataSet, 0, true);
  IsModified:= false;
end;

end.
