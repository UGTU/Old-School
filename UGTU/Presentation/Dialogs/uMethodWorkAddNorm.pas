unit uMethodWorkAddNorm;
  {#Author nnikolenko@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, MethodWorkController,
  GeneralController, DBGridEh, GridsEh, ComCtrls, ToolWin, Mask, DBCtrlsEh,
  DBLookupEh, ADODB, DB, ImgList;

type
  TfrmMethodWorkAddNorm = class(TfrmBaseDialog)
    Panel2: TPanel;
    Label3: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    CheckBox1: TCheckBox;
    dbcbYear: TDBLookupComboboxEh;
    dbcbKaf: TDBLookupComboboxEh;
    dbcbNormExists: TDBLookupComboboxEh;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    dbeDolMW: TDBEditEh;
    dbeYearVolum: TDBEditEh;
    StaticText1: TStaticText;
    procedure dbcbKafKeyValueChanged(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure dbeYearVolumKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    //fLastAddNorm: integer;
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    { Public declarations }
    fLastAddNorm: integer;
    procedure Read(AKafIK: integer);
  end;

var
  frmMethodWorkAddNorm: TfrmMethodWorkAddNorm;

implementation

{$R *.dfm}

function TfrmMethodWorkAddNorm.DoApply: boolean;
begin
  if dbeYearVolum.Text = '' then
  begin
   Result:= false;
   Application.MessageBox('Необходимо указать годовой объем нагрузки ППС!', 'Сохранение норм времени', MB_ICONWARNING);
   exit;
  end;
  if dbeDolMW.Text = '' then
  begin
   Result:= false;
   Application.MessageBox('Необходимо указать долю нагрузки на УМР!', 'Сохранение норм времени', MB_ICONWARNING);
   exit;
  end;
  fLastAddNorm:= IK;
  if dbcbKaf.KeyValue = NULL then
    Result:= TMethodWorkController.Instance.SaveNormOfTime(fLastAddNorm, 0, dbcbYear.KeyValue, strToFloat(dbeYearVolum.Text),strToFloat(dbeDolMW.Text))
  else
    Result:= TMethodWorkController.Instance.SaveNormOfTime(fLastAddNorm, dbcbKaf.KeyValue, dbcbYear.KeyValue, strToFloat(dbeYearVolum.Text),strToFloat(dbeDolMW.Text));
end;

function TfrmMethodWorkAddNorm.DoCancel: boolean;
begin
  case (Application.MessageBox('Сохранить внесенные изменения?','Измение информации о нормах времени', MB_YESNOCANCEL)) of
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

procedure TfrmMethodWorkAddNorm.CheckBox1Click(Sender: TObject);
begin
if CheckBox1.Checked then
  begin
    Panel2.Height:= Panel2.Height + 30;
    ClientHeight:= ClientHeight + 30;
  end
  else
  begin
    Panel2.Height:= Panel2.Height - 30;
    ClientHeight:= ClientHeight - 30;
  end;
end;

procedure TfrmMethodWorkAddNorm.dbcbKafKeyValueChanged(Sender: TObject);
begin
  IsModified:= (dbcbYear.KeyValue <> NULL) and (dbeYearVolum.Text <> '') and (dbeDolMW.Text <> '');
end;

procedure TfrmMethodWorkAddNorm.dbeYearVolumKeyPress(Sender: TObject;
  var Key: Char);
//var F: bool;
begin
 //F := false;
 if not(Key in ['0'..'9',',']) and (Key <> #8) and (Key <> #46) or (Key = '.') then
 begin
   Key :=#0;
   Beep;
 end;
    // if (dbeYearVolum.=0) then ;
     //if (StringGrid1->Cells[c][r][StringGrid1->Cells[c][r].Length()]!='-')
      { for (int i=1;i<=StringGrid1->Cells[c][r].Length();i++)
                   if (StringGrid1->Cells[c][r][i]==',')F=true;
       if (F==true) Beep();Key=0;break;;
    else Beep();Key=0;
    else Beep();Key=0;;
    exit;
 // end;
  default: begin
   Beep(); Key :=0;
  end; }
end;

procedure TfrmMethodWorkAddNorm.Read(AKafIK: integer);
begin
  Panel2.Height:= Panel2.Height - 30;
  ClientHeight:= ClientHeight - 30;
  TGeneralController.Instance.InitializeLockupCB(@dbcbKaf, 'ik_kaf', 'Cname_kaf');
  (dbcbKaf.ListSource.DataSet as TADODataSet).CommandText:= 'Select kafedra.* From kafedra Order By Cname_kaf';
  dbcbKaf.ListSource.DataSet.Open;
  TGeneralController.Instance.InitializeLockupCB(@dbcbYear, 'ik_year_uch_pl', 'Year_value');
  (dbcbYear.ListSource.DataSet as TADODataSet).CommandText:= 'Select * From Year_uch_pl Order By Year_value';
  dbcbYear.ListSource.DataSet.Open;

  TGeneralController.Instance.InitializeLockupCB(@dbcbNormExists, 'IDNormOfTime', 'cName_norm');
  dbcbNormExists.KeyValue:= TMethodWorkController.Instance.GetNormsOfTime(@dbcbNormExists.ListSource.DataSet, false);

  if (self.IK < 0) then
  begin
    Caption:= 'Добавление норм времени';
  end
  else
  begin
    Caption:= 'Редактирование норм времени';
  end;

  IsModified:= false;
end;

end.
