unit uNagruzkaAddNorm;
  {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, DBGridEh,
  Grids, Mask, DBCtrlsEh, DBLookupEh, ADODB, DB, GeneralController, NagruzkaController,
  GridsEh, Menus, ImgList, ComCtrls, ToolWin;

type
  TfrmNagruzkaAddNorm = class(TfrmBaseDialog)
    actAdd: TAction;
    actRem: TAction;
    actLoadExists: TAction;
    CheckBox1: TCheckBox;
    dbcbNormExists: TDBLookupComboboxEh;
    dbcbSpeciality: TDBLookupComboboxEh;
    dbcbYear: TDBLookupComboboxEh;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    StaticText1: TStaticText;
    Image1: TImage;
    Image9: TImage;
    Label17: TLabel;
    Label7: TLabel;
    procedure dbcbYearKeyValueChanged(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure actSpravExecute(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure Label7MouseEnter(Sender: TObject);
    procedure Label7MouseLeave(Sender: TObject);
    procedure Label17MouseEnter(Sender: TObject);
    procedure Label17MouseLeave(Sender: TObject);
    procedure Label17Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    private
    fLastAddedNorm: integer;
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    procedure Read(AFacIK: integer);
    property LastAddedNorm: integer read fLastAddedNorm;
  end;

var
  frmNagruzkaAddNorm: TfrmNagruzkaAddNorm;

implementation

{$R *.dfm}

{ TfrmNagruzkaAddNorm }

function TfrmNagruzkaAddNorm.DoApply: boolean;
begin
  fLastAddedNorm:= IK;
  if CheckBox1.Checked then
    Result:= TNagruzkaController.Preparation.SaveNormOfTime(fLastAddedNorm, dbcbNormExists.KeyValue, dbcbSpeciality.KeyValue, dbcbYear.KeyValue)
  else Result:= TNagruzkaController.Preparation.SaveNormOfTime(fLastAddedNorm, -1, dbcbSpeciality.KeyValue, dbcbYear.KeyValue);
end;

function TfrmNagruzkaAddNorm.DoCancel: boolean;
begin
  Result:= false;
  case (Application.MessageBox('Сохранить внесенные изменения?','Измение информации о нормах времени учета нагрузки', MB_YESNOCANCEL)) of
    mrYes: OK;
    mrNo: Result:= true;
  end;
end;       

procedure TfrmNagruzkaAddNorm.FormShow(Sender: TObject);
begin
  dbcbSpeciality.SetFocus;
end;

procedure TfrmNagruzkaAddNorm.Label17Click(Sender: TObject);
var
  key: word;
begin
  key:= 112;
  FormKeyUp(Self, key, []);
end;

procedure TfrmNagruzkaAddNorm.Label17MouseEnter(Sender: TObject);
begin
  Label17.Font.Style:= Label17.Font.Style + [fsUnderline];
end;

procedure TfrmNagruzkaAddNorm.Label17MouseLeave(Sender: TObject);
begin
  Label17.Font.Style:= Label17.Font.Style - [fsUnderline];
end;

procedure TfrmNagruzkaAddNorm.Label7Click(Sender: TObject);
begin
  actSpravExecute(actSprav);
end;

procedure TfrmNagruzkaAddNorm.Label7MouseEnter(Sender: TObject);
begin
  Label7.Font.Style:= Label7.Font.Style + [fsUnderline];
end;

procedure TfrmNagruzkaAddNorm.Label7MouseLeave(Sender: TObject);
begin
  Label7.Font.Style:= Label7.Font.Style - [fsUnderline];
end;

procedure TfrmNagruzkaAddNorm.Read(AFacIK: integer);
begin
  TGeneralController.Instance.InitializeLockupCB(@dbcbSpeciality, 'ik_spec_fac', 'Cname_spec');
  (dbcbSpeciality.ListSource.DataSet as TADODataSet).CommandText:= 'Select rsf.ik_spec_fac, Cname_spec From Relation_spec_fac rsf INNER JOIN Spec_stud ON rsf.ik_spec = Spec_stud.ik_spec INNER JOIN Fac ON rsf.ik_fac = Fac.ik_fac WHERE rsf.ik_fac = ' + IntToStr(AFacIK) + ' Order By Cname_spec';
  dbcbSpeciality.ListSource.DataSet.Open;
  TGeneralController.Instance.InitializeLockupCB(@dbcbYear, 'ik_year_uch_pl', 'Year_value');
  TNagruzkaController.Directory.GetAllYears(@dbcbYear.ListSource.DataSet, false, NULL);

  if (self.IK < 0) then
  begin
    Caption:= 'Добавление норм времени';
    HelpKeyword:= 'Нагрузка\Add_NormOfTime.htm';
    ClientHeight:= 152;
    TGeneralController.Instance.InitializeLockupCB(@dbcbNormExists, 'ik_norm_of_time', 'Cname_norm');
    dbcbNormExists.KeyValue:= TNagruzkaController.Preparation.GetAllNormsOfTime(@dbcbNormExists.ListSource.DataSet, false, NULL);
  end
  else
  begin
    CheckBox1.Enabled:= false;
    Caption:= 'Изменение норм времени';
    HelpKeyword:= 'Нагрузка\Edit_NormOfTime.htm';
    ClientHeight:= 130;
    CheckBox1.Visible:= false;   
  end;
  IsModified:= false;
end;

procedure TfrmNagruzkaAddNorm.dbcbYearKeyValueChanged(Sender: TObject);
begin
  if CheckBox1.Checked then
    IsModified:= (dbcbYear.KeyValue <> NULL) and (dbcbNormExists.KeyValue <> NULL)
  else IsModified:= (dbcbYear.KeyValue <> NULL);
end;

procedure TfrmNagruzkaAddNorm.actSpravExecute(Sender: TObject);
begin
  inherited;
  TGeneralController.Instance.RefreshLockupCB(@dbcbYear);
end;

procedure TfrmNagruzkaAddNorm.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
    ClientHeight:= 178
  else ClientHeight:= 152;
  Label2.Visible:= CheckBox1.Checked;
  Label6.Visible:= CheckBox1.Checked;
  dbcbNormExists.Visible:= CheckBox1.Checked;
end;

end.
