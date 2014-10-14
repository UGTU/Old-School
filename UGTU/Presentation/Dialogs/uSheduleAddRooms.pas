unit uSheduleAddRooms;
  {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, DBGridEh, Mask,
  DBCtrlsEh, DBLookupEh, ADODB, System.Actions;

type
  TfrmSheduleAddRooms = class(TfrmBaseDialog)
    Label4: TLabel;
    Label5: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    ListBox1: TListBox;
    dbcbCampus: TDBLookupComboboxEh;
    Label1: TLabel;
    Label2: TLabel;
    Splitter1: TSplitter;
    Panel4: TPanel;
    Label3: TLabel;
    ListBox2: TListBox;
    sbAddMany: TSpeedButton;
    sbAddOne: TSpeedButton;
    sbDelMany: TSpeedButton;
    sbDelOne: TSpeedButton;
    actAddOne: TAction;
    SpeedButton1: TSpeedButton;
    Image1: TImage;
    Image9: TImage;
    Label17: TLabel;
    Label7: TLabel;
    procedure dbcbCampusKeyValueChanged(Sender: TObject);
    procedure sbAddManyClick(Sender: TObject);
    procedure sbDelManyClick(Sender: TObject);
    procedure sbDelOneClick(Sender: TObject);
    procedure actSpravExecute(Sender: TObject);
    procedure actAddOneExecute(Sender: TObject);
    procedure actAddOneUpdate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Label7MouseEnter(Sender: TObject);
    procedure Label7MouseLeave(Sender: TObject);
    procedure Label17MouseEnter(Sender: TObject);
    procedure Label17MouseLeave(Sender: TObject);
    procedure Label17Click(Sender: TObject);
  private
    fAddedRoomsList, fFullCampusRoomList, fCampusRoomsList: TStringList;
    fKafIK, fSheduleIK: integer;
    procedure LoadRoomFund;
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    procedure Read(KafIK, SheduleIK: integer);
  end;

var
  frmSheduleAddRooms: TfrmSheduleAddRooms;

implementation

uses NagruzkaController, GeneralController, SheduleController;

{$R *.dfm}

{ TfrmSheduleAddRooms }

procedure TfrmSheduleAddRooms.actAddOneExecute(Sender: TObject);
begin
  ListBox2.Items.Add(ListBox1.Items[ListBox1.ItemIndex]);
  fAddedRoomsList.Add(fCampusRoomsList[ListBox1.ItemIndex]);
  fCampusRoomsList.Delete(ListBox1.ItemIndex);
  ListBox1.Items.Delete(ListBox1.ItemIndex);
  IsModified:= true;
end;

procedure TfrmSheduleAddRooms.actAddOneUpdate(Sender: TObject);
begin
  sbAddMany.Enabled:= ListBox1.SelCount > 1;
  actAddOne.Enabled:= ListBox1.SelCount = 1;
  sbDelOne.Enabled:= ListBox2.SelCount = 1;
  sbDelMany.Enabled:= ListBox2.SelCount > 1;
end;

procedure TfrmSheduleAddRooms.actSpravExecute(Sender: TObject);
begin
  inherited;
  TGeneralController.Instance.RefreshLockupCB(@dbcbCampus);
end;

procedure TfrmSheduleAddRooms.dbcbCampusKeyValueChanged(Sender: TObject);
var
  tempDS: TADODataSet;
begin
  ListBox1.Items.Clear;
  fCampusRoomsList.Clear;
  if dbcbCampus.KeyValue <> NULL then
  begin
    tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
    TSheduleController.MainFunctions.GetFreedomCampusRooms(@tempDS, dbcbCampus.KeyValue, fSheduleIK, fKafIK);
    while not tempDS.Eof do
    begin
      if fAddedRoomsList.IndexOf(tempDS.FieldByName('ik_room').AsString) < 0 then
      begin
        if Length(tempDS.FieldByName('Cname_room').AsString) > 3 then
          ListBox1.Items.Add(tempDS.FieldByName('Cname_room').AsString + ' ' + tempDS.FieldByName('cName_campus').AsString)
        else ListBox1.Items.Add(tempDS.FieldByName('Cname_room').AsString + tempDS.FieldByName('cName_campus').AsString);
        fCampusRoomsList.Add(tempDS.FieldByName('ik_room').AsString);
      end;
      fFullCampusRoomList.Add(tempDS.FieldByName('ik_room').AsString);
      tempDS.Next;
    end;
    tempDS.Close;
    tempDS.Free;
  end;
end;

function TfrmSheduleAddRooms.DoApply: boolean;
begin
  Result:= TSheduleController.AccountFunctions.SaveDepRoomList(fKafIK, fSheduleIK, fAddedRoomsList);
end;

function TfrmSheduleAddRooms.DoCancel: boolean;
begin
  Result:= false;
  case (Application.MessageBox('Сохранить внесенные изменения?','Измение аудиторного фонда кафедры', MB_YESNOCANCEL)) of
    mrYes: OK;
    mrNo: Result:= true;
    mrCancel: Result:= false;
  end;
end;

procedure TfrmSheduleAddRooms.Label17Click(Sender: TObject);
var
  key: word;
begin
  key:= 112;
  FormKeyUp(Self, key, []);
end;

procedure TfrmSheduleAddRooms.Label17MouseEnter(Sender: TObject);
begin
  Label17.Font.Style:= Label17.Font.Style + [fsUnderline];
end;

procedure TfrmSheduleAddRooms.Label17MouseLeave(Sender: TObject);
begin
  Label17.Font.Style:= Label17.Font.Style - [fsUnderline];
end;

procedure TfrmSheduleAddRooms.Label7MouseEnter(Sender: TObject);
begin
  Label7.Font.Style:= Label7.Font.Style + [fsUnderline];
end;

procedure TfrmSheduleAddRooms.Label7MouseLeave(Sender: TObject);
begin
  Label7.Font.Style:= Label7.Font.Style - [fsUnderline];
end;

procedure TfrmSheduleAddRooms.LoadRoomFund;
var
  tempDS: TADODataSet;
begin
  ListBox2.Items.Clear;
  fAddedRoomsList.Clear;
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  TSheduleController.AccountFunctions.GetRoomFund(@tempDS, fKafIK, fSheduleIK);
  while not tempDS.Eof do
  begin
    if Length(tempDS.FieldByName('Cname_room').AsString) > 3 then
      ListBox2.Items.Add(tempDS.FieldByName('Cname_room').AsString + ' ' + tempDS.FieldByName('cName_campus').AsString)
    else ListBox2.Items.Add(tempDS.FieldByName('Cname_room').AsString + tempDS.FieldByName('cName_campus').AsString);
    fAddedRoomsList.Add(tempDS.FieldByName('ik_room').AsString);
    tempDS.Next;
  end;
  tempDS.Close;
  tempDS.Free;
end;

procedure TfrmSheduleAddRooms.Read(KafIK, SheduleIK: integer);
begin
  fKafIK:= KafIK;
  fSheduleIK:= SheduleIK;
  fAddedRoomsList:= TStringList.Create;
  fCampusRoomsList:= TStringList.Create;
  fFullCampusRoomList:= TStringList.Create;
  Caption:= 'Аудиторный фонд кафедры ' + TNagruzkaController.Directory.GetDepartmentName(KafIK, true);
  Label5.Caption:= TSheduleController.MainFunctions.GetStudyPeriodName(SheduleIK);
  TGeneralController.Instance.InitializeLockupCB(@dbcbCampus, 'ik_campus', 'cName_campus');
  LoadRoomFund;
  dbcbCampus.KeyValue:= TSheduleController.MainFunctions.GetAllCampus(@dbcbCampus.ListSource.DataSet, true, NULL);
end;

procedure TfrmSheduleAddRooms.sbAddManyClick(Sender: TObject);
var
  i: integer;
begin
  i:= 0;
  while i <= ListBox1.Items.Count-1 do
  begin
    if ListBox1.Selected[i] then
    begin
      ListBox2.Items.Add(ListBox1.Items[i]);
      fAddedRoomsList.Add(fCampusRoomsList[i]);
      fCampusRoomsList.Delete(i);
      ListBox1.Items.Delete(i);
    end
    else inc(i);
  end;
  IsModified:= true;
end;

procedure TfrmSheduleAddRooms.sbDelManyClick(Sender: TObject);
var
  i: integer;
begin
  i:= 0;
  while i <= ListBox2.Items.Count-1 do
  begin
    if ListBox2.Selected[i] then
    begin
      if (fFullCampusRoomList.IndexOf(fAddedRoomsList[i]) >= 0) then
      begin
        ListBox1.Items.Add(ListBox2.Items[i]);
        fCampusRoomsList.Add(fAddedRoomsList[i]);
      end;
      fAddedRoomsList.Delete(i);
      ListBox2.Items.Delete(i);
    end
    else inc(i);
  end;
  IsModified:= true;
end;

procedure TfrmSheduleAddRooms.sbDelOneClick(Sender: TObject);
begin
  if (fFullCampusRoomList.IndexOf(fAddedRoomsList[ListBox2.ItemIndex]) >= 0) then
  begin
    ListBox1.Items.Add(ListBox2.Items[ListBox2.ItemIndex]);
    fCampusRoomsList.Add(fAddedRoomsList[ListBox2.ItemIndex]);
  end;
  fAddedRoomsList.Delete(ListBox2.ItemIndex);
  ListBox2.Items.Delete(ListBox2.ItemIndex);
  IsModified:= true;
end;

procedure TfrmSheduleAddRooms.SpeedButton1Click(Sender: TObject);
begin
  if TSheduleController.AccountFunctions.CopyRoomListFromPrevSemester(fSheduleIK, fKafIK) then
  begin
    LoadRoomFund;
    IsModified:= true;
  end;
  dbcbCampusKeyValueChanged(dbcbCampus);
end;

end.
