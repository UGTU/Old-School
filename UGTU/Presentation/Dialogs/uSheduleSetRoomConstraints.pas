unit uSheduleSetRoomConstraints;
  {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, DBGridEh,
  GridsEh, Mask, DBCtrlsEh, DBLookupEh, ADODB, DB, ExceptionBase;

type
  TfrmSheduleSetRoomConstraints = class(TfrmBaseDialog)
    RadioButton1: TRadioButton;
    StaticText1: TStaticText;
    RadioButton2: TRadioButton;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    dbcbCampus: TDBLookupComboboxEh;
    Panel4: TPanel;
    Label3: TLabel;
    sbAddMany: TSpeedButton;
    sbAddOne: TSpeedButton;
    sbDelMany: TSpeedButton;
    sbDelOne: TSpeedButton;
    ListBox2: TListBox;
    DBGridEh1: TDBGridEh;
    dsCampusRooms: TDataSource;
    Label4: TLabel;
    Label5: TLabel;
    actAddOne: TAction;
    dbcbKaf: TDBLookupComboboxEh;
    Image1: TImage;
    Image9: TImage;
    Label17: TLabel;
    Label7: TLabel;
    procedure dbcbCampusKeyValueChanged(Sender: TObject);
    procedure sbAddManyClick(Sender: TObject);
    procedure sbDelOneClick(Sender: TObject);
    procedure sbDelManyClick(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure actAddOneExecute(Sender: TObject);
    procedure actAddOneUpdate(Sender: TObject);
    procedure Label7MouseEnter(Sender: TObject);
    procedure Label7MouseLeave(Sender: TObject);
    procedure Label17MouseEnter(Sender: TObject);
    procedure Label17MouseLeave(Sender: TObject);
    procedure Label17Click(Sender: TObject);
  private
    fKafIK, fSemIK, fYearIK: integer;
    fAddedRoomsList: TStringList;
    fPrepodPlanIKList: TStringList;
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    procedure Read(KafIK, YearIK, SemIK: integer; PrepodPlanIKList: TStringList; PlanNagrCaption: string);
  end;

var
  frmSheduleSetRoomConstraints: TfrmSheduleSetRoomConstraints;

implementation

uses NagruzkaController, SheduleController, GeneralController, UchPlanController;

{$R *.dfm}

procedure TfrmSheduleSetRoomConstraints.actAddOneExecute(Sender: TObject);
begin
  dsCampusRooms.DataSet.GotoBookmark(Pointer(DBGridEh1.SelectedRows[0]));
  ListBox2.Items.Add(dsCampusRooms.DataSet.FieldByName('Cname_room').AsString + dsCampusRooms.DataSet.FieldByName('CName_campus').AsString);
  fAddedRoomsList.Add(dsCampusRooms.DataSet.FieldByName('ik_room').AsString);
  dsCampusRooms.DataSet.Delete;
  IsModified:= ListBox2.Count > 0;
end;

procedure TfrmSheduleSetRoomConstraints.actAddOneUpdate(Sender: TObject);
begin
  sbAddMany.Enabled:= DBGridEh1.SelectedRows.Count > 1;
  actAddOne.Enabled:= DBGridEh1.SelectedRows.Count = 1;
  sbDelOne.Enabled:= ListBox2.SelCount = 1;
  sbDelMany.Enabled:= ListBox2.SelCount > 1;
end;

procedure TfrmSheduleSetRoomConstraints.dbcbCampusKeyValueChanged(
  Sender: TObject);
begin
  if dsCampusRooms.DataSet <> nil then
  begin
    if dsCampusRooms.DataSet.Active then dsCampusRooms.DataSet.Close;
    dsCampusRooms.DataSet.Free;
  end;
  if dbcbCampus.KeyValue <> NULL then
  begin
    dsCampusRooms.DataSet:= TGeneralController.Instance.GetNewADODataSet(true);
    TSheduleController.MainFunctions.GetAllCampusRooms(@dsCampusRooms.DataSet, dbcbCampus.KeyValue);
    while not dsCampusRooms.DataSet.Eof do
    begin
      if fAddedRoomsList.IndexOf(dsCampusRooms.DataSet.FieldByName('ik_room').AsString) >= 0 then
        dsCampusRooms.DataSet.Delete
      else dsCampusRooms.DataSet.Next;
    end;
  end;
end;

function TfrmSheduleSetRoomConstraints.DoApply: boolean;
begin
  Result:= TSheduleController.ConstraintFunctions.SaveRoomConstraint(RadioButton1.Checked, dbcbKaf.KeyValue, fPrepodPlanIKList, fAddedRoomsList);
end;

function TfrmSheduleSetRoomConstraints.DoCancel: boolean;
begin
  Result:= false;
  case (Application.MessageBox('—охранить внесенные изменени€?','»змение аудиторного фонда кафедры', MB_YESNOCANCEL)) of
    mrYes: OK;
    mrNo: Result:= true;
    mrCancel: Result:= false;
  end;
end;

procedure TfrmSheduleSetRoomConstraints.Label17Click(Sender: TObject);
var
  key: word;
begin
  key:= 112;
  FormKeyUp(Self, key, []);
end;

procedure TfrmSheduleSetRoomConstraints.Label17MouseEnter(Sender: TObject);
begin
  Label17.Font.Style:= Label17.Font.Style + [fsUnderline];
end;

procedure TfrmSheduleSetRoomConstraints.Label17MouseLeave(Sender: TObject);
begin
  Label17.Font.Style:= Label17.Font.Style - [fsUnderline];
end;

procedure TfrmSheduleSetRoomConstraints.Label7MouseEnter(Sender: TObject);
begin
  Label7.Font.Style:= Label7.Font.Style + [fsUnderline];
end;

procedure TfrmSheduleSetRoomConstraints.Label7MouseLeave(Sender: TObject);
begin
  Label7.Font.Style:= Label7.Font.Style - [fsUnderline];
end;

procedure TfrmSheduleSetRoomConstraints.RadioButton1Click(Sender: TObject);
begin
  dbcbCampus.Enabled:= not RadioButton1.Checked;
  DBGridEh1.Enabled:= not RadioButton1.Checked;
  ListBox2.Enabled:= not RadioButton1.Checked;
  Label2.Enabled:= not RadioButton1.Checked;
  Label1.Enabled:= not RadioButton1.Checked;
  Label3.Enabled:= not RadioButton1.Checked;
  IsModified:= RadioButton1.Checked or (ListBox2.Items.Count > 0);
end;

procedure TfrmSheduleSetRoomConstraints.Read(KafIK, YearIK, SemIK: integer;
  PrepodPlanIKList: TStringList; PlanNagrCaption: string);
var
  tempDS: TADODataSet;
begin
  TGeneralController.Instance.InitializeLockupCB(@dbcbKaf, 'ik_kaf', 'short_name_kaf');
  TUchPlanController.Instance.getAllDepartments(@dbcbKaf.ListSource.DataSet, true);
  if dbcbKaf.ListSource.DataSet.Locate('ik_kaf', KafIK, [loPartialKey]) then
    dbcbKaf.KeyValue:= KafIK;

  if not Assigned(PrepodPlanIKList) then
    raise EApplicationException.Create('Ќе указаны записи плана учебной нагрузки, дл€ которых устанавливаетс€ ограничение')
  else
    if PrepodPlanIKList.Count = 0 then
      raise EApplicationException.Create('Ќе указаны записи плана учебной нагрузки, дл€ которых устанавливаетс€ ограничение');
  fKafIK:= KafIK;
  fYearIK:= YearIK;
  fSemIK:= SemIK;
  fAddedRoomsList:= TStringList.Create;
  fPrepodPlanIKList:= TStringList.Create;
  fPrepodPlanIKList.Assign(PrepodPlanIKList);
  TGeneralController.Instance.SetCaptionDots(@Label5, PlanNagrCaption, 327);
  Label5.Hint:= PlanNagrCaption;
  TGeneralController.Instance.InitializeLockupCB(@dbcbCampus, 'ik_campus', 'cName_campus');
  dbcbCampus.KeyValue:= TSheduleController.MainFunctions.GetAllCampus(@dbcbCampus.ListSource.DataSet, true, NULL);
  //RadioButton1.Caption:= 'јудитории кафедры ' + TNagruzkaController.Instance.GetDepartmentName(KafIK, true);
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  KafIK:= TSheduleController.MainFunctions.GetRoomsForPrepodPlanIKList(@tempDS, PrepodPlanIKList);
  if tempDS.RecordCount > 0 then dbcbCampus.KeyValue:= tempDS.FieldByName('ik_campus').AsInteger;
  if KafIK >= 0 then
  begin
    RadioButton1.Checked:= true;
    if dbcbKaf.ListSource.DataSet.Locate('ik_kaf', KafIK, [loPartialKey]) then
      dbcbKaf.KeyValue:= KafIK;
  end
  else
  begin
    RadioButton2.Checked:= true;
    while not tempDS.Eof do
    begin
      ListBox2.Items.Add(tempDS.FieldByName('Cname_room').AsString + tempDS.FieldByName('cName_campus').AsString);
      fAddedRoomsList.Add(tempDS.FieldByName('ik_room').AsString);
      if dsCampusRooms.DataSet.Locate('ik_room', tempDS.FieldByName('ik_room').AsInteger, [loPartialKey]) then
        dsCampusRooms.DataSet.Delete;      
      tempDS.Next;
    end;
  end;
  tempDS.Close;
  tempDS.Free;
end;

procedure TfrmSheduleSetRoomConstraints.sbAddManyClick(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to DBGridEh1.SelectedRows.Count-1 do
    begin
      dsCampusRooms.DataSet.GotoBookmark(Pointer(DBGridEh1.SelectedRows[I]));
      ListBox2.Items.Add(dsCampusRooms.DataSet.FieldByName('Cname_room').AsString + dsCampusRooms.DataSet.FieldByName('CName_campus').AsString);
      fAddedRoomsList.Add(dsCampusRooms.DataSet.FieldByName('ik_room').AsString);
      dsCampusRooms.DataSet.Delete;
    end;
  IsModified:= ListBox2.Count > 0;
end;

procedure TfrmSheduleSetRoomConstraints.sbDelManyClick(Sender: TObject);
var
  i: integer;
begin
  i:= 0;
  while i <= ListBox2.Items.Count-1 do
  begin
    if ListBox2.Selected[i] then
    begin
      fAddedRoomsList.Delete(i);
      ListBox2.Items.Delete(i);
    end
    else inc(i);
  end;
  dbcbCampusKeyValueChanged(dbcbCampus);
  IsModified:= ListBox2.Count > 0;
end;

procedure TfrmSheduleSetRoomConstraints.sbDelOneClick(Sender: TObject);
begin
  fAddedRoomsList.Delete(ListBox2.ItemIndex);
  ListBox2.Items.Delete(ListBox2.ItemIndex);
  dbcbCampusKeyValueChanged(dbcbCampus);
  IsModified:= ListBox2.Count > 0;
end;

end.
