unit uNagruzkaAddPrep;
  {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, DBGridEh, DBLookupEh, StdCtrls, Mask, DBCtrlsEh,
  ActnList, Buttons, ExtCtrls, ADODB, DB, GeneralController, NagruzkaController,
  GridsEh, ImgList, ComCtrls, ToolWin, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, DBAxisGridsEh, System.Actions;

type
  TfrmNagruzkaAddPrep = class(TfrmBaseDialog)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbeFam: TDBEditEh;
    dbeName: TDBEditEh;
    dbeCoatch: TDBEditEh;
    CheckBox1: TCheckBox;
    Label7: TLabel;
    Label8: TLabel;
    Panel3: TPanel;
    dbcbFaculty: TDBLookupComboboxEh;
    dbcbFIO: TDBLookupComboboxEh;
    dbcbKafedra: TDBLookupComboboxEh;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dbcbRank: TDBLookupComboboxEh;
    dbcbDegree: TDBLookupComboboxEh;
    ImageList1: TImageList;
    actAddWT: TAction;
    actDelWT: TAction;
    Panel4: TPanel;
    DBGridEh1: TDBGridEh;
    Label9: TLabel;
    Panel2: TPanel;
    ToolBar2: TToolBar;
    ToolButton2: TToolButton;
    ToolBar3: TToolBar;
    ToolButton3: TToolButton;
    dsWorkTypes: TDataSource;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    SpeedButton1: TSpeedButton;
    actSearchPrepAtAnoterKaf: TAction;
    Image1: TImage;
    Image9: TImage;
    Label17: TLabel;
    Label10: TLabel;
    procedure CheckBox1Click(Sender: TObject);
    procedure dbcbFacultyKeyValueChanged(Sender: TObject);
    procedure dbcbKafedraKeyValueChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbcbFIOKeyValueChanged(Sender: TObject);
    procedure dbcbRankKeyValueChanged(Sender: TObject);
    procedure actAddWTExecute(Sender: TObject);
    procedure actDelWTExecute(Sender: TObject);
    procedure actDelWTUpdate(Sender: TObject);
    procedure actAddWTUpdate(Sender: TObject);
    procedure actSpravExecute(Sender: TObject);
    procedure dsWorkTypesStateChange(Sender: TObject);
    procedure actSearchPrepAtAnoterKafUpdate(Sender: TObject);
    procedure actSearchPrepAtAnoterKafExecute(Sender: TObject);
    procedure Label10Click(Sender: TObject);
    procedure Label10MouseEnter(Sender: TObject);
    procedure Label10MouseLeave(Sender: TObject);
    procedure Label17MouseLeave(Sender: TObject);
    procedure Label17MouseEnter(Sender: TObject);
    procedure Label17Click(Sender: TObject);
   private
    isLoad:boolean;
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    procedure Read;
    procedure Load();
  end;

var
  frmNagruzkaAddPrep: TfrmNagruzkaAddPrep;

implementation

{$R *.dfm}

procedure TfrmNagruzkaAddPrep.actAddWTExecute(Sender: TObject);
begin
  dsWorkTypes.DataSet.Insert;
  IsModified:= true;
end;

procedure TfrmNagruzkaAddPrep.actAddWTUpdate(Sender: TObject);
begin
  if dsWorkTypes.DataSet <> nil then
    actAddWT.Enabled:= dsWorkTypes.DataSet.Active 
  else actAddWT.Enabled:= false;
end;

procedure TfrmNagruzkaAddPrep.actDelWTExecute(Sender: TObject);
begin
  dsWorkTypes.DataSet.Delete;
  dbcbRankKeyValueChanged(dbcbRank);
end;

procedure TfrmNagruzkaAddPrep.actDelWTUpdate(Sender: TObject);
begin
  if dsWorkTypes.DataSet <> nil then
  begin
    if dsWorkTypes.DataSet.Active then
      actDelWT.Enabled:= dsWorkTypes.DataSet.RecordCount > 0
    else actDelWT.Enabled:= false; 
  end
  else actDelWT.Enabled:= false;
end;

procedure TfrmNagruzkaAddPrep.actSearchPrepAtAnoterKafExecute(Sender: TObject);
var
  findTabN, findKafIK, findFacIK: integer;
begin
  if TNagruzkaController.Preparation.SearchPrepAtAnotherKaf(dbeFam.Text, dbeName.Text, dbeCoatch.Text, findTabN, findKafIK, findFacIK) then
  begin
    dbcbFaculty.KeyValue:= findFacIK;
    dbcbKafedra.KeyValue:= findKafIK;
    dbcbFIO.KeyValue:= findTabN;
  end
  else Application.MessageBox('Системе не удалось найти преподавателя с таким ФИО!', PChar(Caption), MB_ICONWARNING);
end;

procedure TfrmNagruzkaAddPrep.actSearchPrepAtAnoterKafUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= (dbeFam.Text <> '') and (dbeName.Text <> '') and (dbeCoatch.Text <> '');
end;

procedure TfrmNagruzkaAddPrep.actSpravExecute(Sender: TObject);
begin
  inherited;
  TGeneralController.Instance.RefreshLockupCB(@dbcbRank);
  TGeneralController.Instance.RefreshLockupCB(@dbcbDegree);
end;

procedure TfrmNagruzkaAddPrep.CheckBox1Click(Sender: TObject);
begin
  inherited;
  if (CheckBox1.Checked) then
  begin
    ClientHeight:= 348;
    Panel3.Visible:= true;
    Panel4.Top:= 151;
    if (not isLoad) then Load;
  end
  else
  begin
    ClientHeight:= 273;
    Panel3.Visible:= false;
    Panel4.Top:= 75;
  end;
  dbeFam.ReadOnly:= CheckBox1.Checked;
  dbeName.ReadOnly:= CheckBox1.Checked;
  dbeCoatch.ReadOnly:= CheckBox1.Checked;
  dbcbRank.ReadOnly:= CheckBox1.Checked;
  dbcbDegree.ReadOnly:= CheckBox1.Checked;
  SpeedButton1.Visible:= CheckBox1.Checked;
end;

function TfrmNagruzkaAddPrep.DoApply: boolean;
var
  findTabN, findKafIK, findFacIK: integer;
begin
  Result:= false;
  if (dsWorkTypes.DataSet.State = dsEdit) or (dsWorkTypes.DataSet.State = dsInsert) then dsWorkTypes.DataSet.Post;
  if dsWorkTypes.DataSet.RecordCount = 0 then
  begin
    Application.MessageBox('Необходимо указать хотя бы один вид работы для данного преподавателя!', PChar(Caption), MB_ICONWARNING);
    exit;
  end;

  if CheckBox1.Checked then
  begin
    if dbcbKafedra.KeyValue = Tag then
    begin
      Application.MessageBox('Добавляемый преподаватель уже работает на вашей кафедре!', PChar(Caption), MB_ICONWARNING);
      exit;
    end;
    Result:= TNagruzkaController.Preparation.SaveTeacher(true, dbcbFIO.KeyValue, Tag, dbeFam.Text, dbeName.Text, dbeCoatch.Text, dbcbRank.KeyValue, dbcbDegree.KeyValue)
  end
  else
  begin
    if TNagruzkaController.Preparation.SearchPrepAtAnotherKaf(dbeFam.Text, dbeName.Text, dbeCoatch.Text, findTabN, findKafIK, findFacIK) and (IK = -1) then
      if Application.MessageBox(PChar('Преподаватель с указаным ФИО уже существует в базе данных и работает на кафедре "' + TNagruzkaController.Directory.GetDepartmentName(findKafIK, true) + '"!' +#10#13 + 'Вы уверены, что хотите добавить в систему нового преподавателя?'), PChar(Caption), MB_YESNO) = mrNo then exit;

    Result:= TNagruzkaController.Preparation.SaveTeacher(false, IK, Tag, dbeFam.Text, dbeName.Text, dbeCoatch.Text, dbcbRank.KeyValue, dbcbDegree.KeyValue);
  end;
  if Result then
  begin
    dsWorkTypes.DataSet.Close;
    dsWorkTypes.DataSet.Open;
  end;
end;

function TfrmNagruzkaAddPrep.DoCancel: boolean;
begin
  case (Application.MessageBox('Сохранить внесенные изменения?','Измение информации о преподавателе', MB_YESNOCANCEL)) of
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

procedure TfrmNagruzkaAddPrep.dsWorkTypesStateChange(Sender: TObject);
begin
  dbcbRankKeyValueChanged(nil);
end;

procedure TfrmNagruzkaAddPrep.Label10Click(Sender: TObject);
begin
  actSpravExecute(actSprav);
end;

procedure TfrmNagruzkaAddPrep.Label10MouseEnter(Sender: TObject);
begin
  Label10.Font.Style:= Label10.Font.Style + [fsUnderline];
end;

procedure TfrmNagruzkaAddPrep.Label10MouseLeave(Sender: TObject);
begin
  Label10.Font.Style:= Label10.Font.Style - [fsUnderline];
end;

procedure TfrmNagruzkaAddPrep.Label17Click(Sender: TObject);
var
  key: word;
begin
  key:= 112;
  FormKeyUp(Self, key, []);
end;

procedure TfrmNagruzkaAddPrep.Label17MouseEnter(Sender: TObject);
begin
  Label17.Font.Style:= Label17.Font.Style + [fsUnderline];
end;

procedure TfrmNagruzkaAddPrep.Label17MouseLeave(Sender: TObject);
begin
  Label17.Font.Style:= Label17.Font.Style - [fsUnderline];
end;

procedure TfrmNagruzkaAddPrep.Load;
begin
  TGeneralController.Instance.InitializeLockupCB(@dbcbFaculty, 'ik_fac', 'Cname_fac');
  TGeneralController.Instance.InitializeLockupCB(@dbcbKafedra, 'ik_kaf', 'Cname_kaf');
  TGeneralController.Instance.InitializeLockupCB(@dbcbFIO, 'iTab_n', 'FIO');
  TNagruzkaController.Directory.GetAllFacultyes(@dbcbFaculty.ListSource.DataSet, false);
  isLoad:= true;
end;

procedure TfrmNagruzkaAddPrep.Read;
begin
  TGeneralController.Instance.InitializeLockupCB(@dbcbRank, 'ik_rank', 'cName_rank');
  TNagruzkaController.Directory.GetAllRanks(@dbcbRank.ListSource.DataSet, false);
  TGeneralController.Instance.InitializeLockupCB(@dbcbDegree, 'ik_degree', 'cName_degree');
  TNagruzkaController.Directory.GetAllDegrees(@dbcbDegree.ListSource.DataSet, false);

  if (IK >= 0) then
  begin
    HelpKeyword:= 'Нагрузка\Edit_Teacher.htm';
    Caption:= 'Редактирование информации о преподавателе';
    DataSet:= TADODataSet.Create(nil);
    DataSet.Connection:= Self.Connection;
    (DataSet as TADODataSet).CommandText:= 'Select * From Prepods Where Prepods.iTab_n = ' + IntToStr(IK);
    DataSet.Open;
    dbeFam.Text:= DataSet.FieldByName('clastname').AsString;
    dbeName.Text:= DataSet.FieldByName('cfirstname').AsString;
    dbeCoatch.Text:= DataSet.FieldByName('cotch').AsString;
    dbcbRank.KeyValue:= DataSet.FieldByName('ik_rank').Value;
    dbcbDegree.KeyValue:= DataSet.FieldByName('ik_degree').Value;
    DataSet.Close;
    DataSet.Free;
    ClientHeight:= 251;
    CheckBox1.Visible:= false;
    Panel3.Visible:= false;
    Panel4.Top:= 55;
  end
  else
  begin
    HelpKeyword:= 'Нагрузка\Add_Teacher.htm';
    ClientHeight:= 273;
    Panel3.Visible:= false;
    Panel4.Top:= 75;
    Caption:= 'Добавление преподавателя';
  end;
  dsWorkTypes.DataSet:= TNagruzkaController.Preparation.GetPrepodWorkTypesInfo(Tag, IK);
  IsModified:= False;
end;

procedure TfrmNagruzkaAddPrep.dbcbFacultyKeyValueChanged(Sender: TObject);
begin
  inherited;
  TGeneralController.Instance.CloseLockupCB(@dbcbKafedra);
  if (dbcbFaculty.KeyValue <> NULL) then
    TNagruzkaController.Directory.GetAllDepartments(@dbcbKafedra.ListSource.DataSet, dbcbFaculty.KeyValue, false);
  dbcbRankKeyValueChanged(nil);
end;

procedure TfrmNagruzkaAddPrep.dbcbKafedraKeyValueChanged(Sender: TObject);
begin
  inherited;
  TGeneralController.Instance.CloseLockupCB(@dbcbFIO);
  if (dbcbKafedra.KeyValue <> NULL) then
    TNagruzkaController.Preparation.GetAllPrepInKaf(@dbcbFIO.ListSource.DataSet, dbcbKafedra.KeyValue);
  dbcbRankKeyValueChanged(nil);
end;

procedure TfrmNagruzkaAddPrep.FormCreate(Sender: TObject);
begin
  inherited;
  isLoad:= false;
end;


procedure TfrmNagruzkaAddPrep.dbcbFIOKeyValueChanged(Sender: TObject);
begin
  inherited;
  if (dbcbFIO.KeyValue <> NULL) then
  begin
    dbeFam.Text:= Trim(dbcbFIO.ListSource.DataSet.FieldByName('clastname').AsString);
    dbeName.Text:= Trim(dbcbFIO.ListSource.DataSet.FieldByName('cfirstname').AsString);
    dbeCoatch.Text:= Trim(dbcbFIO.ListSource.DataSet.FieldByName('cotch').AsString);
    dbcbRank.KeyValue:= dbcbFIO.ListSource.DataSet.FieldByName('ik_rank').AsInteger;
    dbcbDegree.KeyValue:= dbcbFIO.ListSource.DataSet.FieldByName('ik_degree').AsInteger;
  end;
  dbcbRankKeyValueChanged(nil);
end;

procedure TfrmNagruzkaAddPrep.dbcbRankKeyValueChanged(Sender: TObject);
begin
  IsModified:= (dbeFam.Text <> '') and (dbeName.Text <> '') and (dbeCoatch.Text <> '');
  if CheckBox1.Checked then IsModified:= IsModified and (dbcbFIO.KeyValue <> NULL);
end;

end.
