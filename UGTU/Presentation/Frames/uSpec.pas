(*   РАБОТА С ВЫДЕЛЕННЫМ ФРАГМЕНТОМ ТАБЛИЦЫ
  for i := 0 to DBGridEh1.SelectedRows.Count-1 do
  begin
    DBGridEh1.DataSource.DataSet.GotoBookmark(Pointer(DBGridEh1.SelectedRows[I]));
    ShowMessage(DBGridEh1.DataSource.DataSet['cname_grup']);
  end;

*)


unit uSpec;
   {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseFrame, StdCtrls, Buttons, ToolWin, ComCtrls, ExtCtrls, DB,
  ADODB, Grids, DBGridEh, uUchPlan, ImgList, ActnList, DateUtils, UchPlanController,
  GridsEh, uAcademFrame, udmStudentData, udmUspevaemost, uAverageBalls, uFgos,
  uFgosController, ConstantRepository;

type
  TfmSpec = class(TfmBase)
    DataSource1: TDataSource;
    PageControl1: TPageControl;
    tsGroups: TTabSheet;
    DBGridEh1: TDBGridEh;
    TabSheet1: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton8: TToolButton;
    actList: TActionList;
    actAddGroup: TAction;
    actEdtGroup: TAction;
    actDelGroup: TAction;
    ImageList1: TImageList;
    tsSpclz: TTabSheet;
    dbgSpclz: TDBGridEh;
    ToolBar2: TToolBar;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    actAddSpclz: TAction;
    actEditSpclz: TAction;
    actDelSpclz: TAction;
    dsSpclz: TDataSource;
    tsAcadem: TTabSheet;
    fmAcadem: TfmAcadem;
    tsAverageBalls: TTabSheet;
    fmAverageBallsSpec: TfmAverageBalls;
    TabSheet2: TTabSheet;
    fmFgos1: TfmFgos;
    tsWorkPlan: TTabSheet;
    fmUchPlan2: TfmUchPlan;
    fmUchPlan1: TfmUchPlan;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure actAddGroupExecute(Sender: TObject);
    procedure actEdtGroupExecute(Sender: TObject);
    procedure actDelGroupExecute(Sender: TObject);
    procedure actDelGroupUpdate(Sender: TObject);
    procedure actEdtGroupUpdate(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure actAddSpclzExecute(Sender: TObject);
    procedure actAddSpclzUpdate(Sender: TObject);
    procedure actEditSpclzUpdate(Sender: TObject);
    procedure actDelSpclzExecute(Sender: TObject);
    procedure dbgSpclzDblClick(Sender: TObject);
    procedure fmUchPlan1ToolButton2Click(Sender: TObject);
    procedure dsSpclzDataChange(Sender: TObject; Field: TField);
    procedure PageControl1Change(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure fmUchPlan2ToolButton12Click(Sender: TObject);
  private
    SpFacik: Integer;
    SpecIK: Integer;
    directionIK:integer;
    VidGos:integer;
    procedure RefreshGroup;

  public
    property ik: Integer read SpFacik write SpFacik;
    procedure Read;
    procedure DoRefreshFrame;override;
    procedure CloseFrame; override;
  end;

var
  fmSpec: TfmSpec;

implementation

uses uDM, uGroupEdtDlg, uMain, DBTVgroupObj, DBTVSpecObj, DBTVFacObj,
  ToolCtrlsEh, uSpecAddSpclz, uDMGroupActions, ApplicationController;

{$R *.dfm}

{ TfmSpec }

procedure TfmSpec.Read;
begin
  DataSource1.DataSet := DataSet;
  PageControl1.ActivePageIndex:=0;
  SpecIK:= TUchPlanController.Instance.getSpecFromSpecFac(IK);
  directionIK:=TUchPlanController.Instance.getDirFromSpec(SpecIK);
  VidGos:=TUchPlanController.Instance.getVidGosFromSpecFac(IK);
  case(directionIK) of
  1:begin
      tsSpclz.Caption:='Список профилей';
      ToolButton3.Caption:='Добавить профиль';
      ToolButton4.Caption:='Изменить профиль';
      ToolButton5.Caption:='Удалить профиль';
      ToolButton3.Hint:='Добавить профиль';
      ToolButton4.Hint:='Изменить профиль';
      ToolButton5.Hint:='Удалить профиль';
    end;
  3:begin
      tsSpclz.Caption:='Список программ';
      ToolButton3.Caption:='Добавить программу';
      ToolButton4.Caption:='Изменить программу';
      ToolButton5.Caption:='Удалить программу';
      ToolButton3.Hint:='Добавить программу';
      ToolButton4.Hint:='Изменить программу';
      ToolButton5.Hint:='Удалить программу';
    end;
  end;

  if (VidGos>FGOS2) then
  begin
  //работа с планами-эталонами
    fmUchPlan1.SpecIK:= SpecIK;
    fmUchPlan1.dirIK:=directionIK;
    fmUchPlan1.VidGos:= VidGos;
    fmUchPlan1.Connection:= Connection;
    fmUchPlan1.ReadModelUchPlan;
    fmUchPlan1.Refresh;
  end;

  //планы-эталоны правятся только для ФГОС3
  fmUchPlan1.Visible := (VidGos>FGOS2);

  //работа с рабочими учебными планами групп
  fmUchPlan2.SpecIK:= SpecIK;
  fmUchPlan2.SpecFacIK := SpFacik;
  fmUchPlan2.dirIK:=directionIK;
  fmUchPlan2.VidGos:= VidGos;
  fmUchPlan2.Connection:= Connection;
  fmUchPlan2.ReadWorkUchPlan;
  fmUchPlan2.Refresh;

  TabSheet2.TabVisible:=(VidGos>FGOS2);  //скрыть вкладку ФГОС для старых специальностей
  dsSpclz.DataSet:= TADODataSet.Create(nil);
  TUchPlanController.Instance.getAllSpecializations(@dsSpclz.DataSet, SpecIK, false);

  if VidGos>FGOS2 then
  begin
    fmFgos1.IK:= SpecIK;
    fmFgos1.vidGos:= VidGos;
    fmFgos1.Connection:= Connection;
    fmFgos1.Read;
    fmFgos1.Refresh;
  end;

  PageControl1Change(PageControl1);
end;

procedure TfmSpec.RefreshGroup;
begin
  DataSet.Active:=false;
  DataSet.Active:=true;
  fmUchPlan2.dbcbGroup.ListSource.DataSet.Close;
  fmUchPlan2.dbcbGroup.ListSource.DataSet.Open;
  //fmUchPlan2.ReadWorkUchPlan;
  fmUchPlan2.Group := fmUchPlan2.dbcbGroup.KeyValue;
  DBGridEh1.DataSource.DataSet.Refresh;
  //frmMain.DBDekTreeView_TEST1.RefreshNodeExecute(frmMain.DBDekTreeView_TEST1.Selected.Parent);
end;

procedure TfmSpec.ToolButton7Click(Sender: TObject);
begin
  frmMain.ActGroupMgr.Execute;
end;

procedure TfmSpec.DBGridEh1DblClick(Sender: TObject);
var r:integer;
begin
 
  if frmMain.DBDekTreeView_TEST1.Selected.HasChildren then
  begin
  r:=DBGridEh1.Row;
  DataSource1.DataSet:=nil;
  SelectInTree(r);
  DataSource1.DataSet:=Dataset;
  end;
end;

procedure TfmSpec.DoRefreshFrame;
begin
  PageControl1Change(self);

  if FrameObject=nil then exit;
  DataSet := (FrameObject as TDBNodeSpecObject).AdoDataset;
  read;
  DBGridEh1.Refresh;
end;

procedure TfmSpec.dsSpclzDataChange(Sender: TObject; Field: TField);
var spclz: string;
begin
  if (dsSpclz.DataSet <> nil) then
    if (dsSpclz.DataSet.Active) then
    begin
        case(directionIK) of
        1: spclz:='Профиль';
        3: spclz:='Программа';
        else spclz:='Специализация';
        end;
      frmMain.StatusBar1.Panels[1].Text:=spclz + dsSpclz.DataSet.FieldByName('cName_spclz_short').AsString;
    end;
end;

procedure TfmSpec.actAddGroupExecute(Sender: TObject);
var
  r:integer;
begin
  inherited;
 { dm.adospGetUchPlnGroup.Active := false;
  with dm.adospGetUchPlnGroup.Parameters do
  begin
    Clear;
    AddParameter;
    Items[0].Value := TDBNodeSpecObject(frmMain.DBDekTreeView_TEST1.SelectedObject).ik;
  end;
  dm.adospGetUchPlnGroup.ExecProc;
  dm.adospGetUchPlnGroup.Active := true;    }
  frmGroupEdt:=TfrmGroupEdt.Create(self);
  frmGroupEdt.SpecFacIK := TDBNodeSpecObject(frmMain.DBDekTreeView_TEST1.SelectedObject).ik;
  frmGroupEdt.WithSpec := false;
  frmGroupEdt.Edit := false;
  try
   {
    frmGroupEdt.dbneYear.MaxValue := CurrentYear;
    frmGroupEdt.Caption := 'Добавление группы';
    frmGroupEdt.edtName.Text := TDBNodeSpecObject(frmMain.DBDekTreeView_TEST1.SelectedObject).ShortName;
    frmGroupEdt.edtName.Text := frmGroupEdt.edtName.Text+'-'+Copy(IntToStr(CurrentYear), 3, 2);
    frmGroupEdt.IsModified:= (frmGroupEdt.edtName.Text <> '') and (frmGroupEdt.dbneYear.Text <> '') and (frmGroupEdt.dblcbUchPln.KeyValue <> NULL);}
    r:= frmGroupEdt.ShowModal;
    if ((r = mrOK) or (frmGroupEdt.bbApply.Tag = 1)) then
    begin
      DataSet.Active:=false;
      DataSet.Active:=true;
      frmMain.DBDekTreeView_TEST1.RefreshNodeExecute(frmMain.DBDekTreeView_TEST1.Selected);
    end;
  finally
    frmGroupEdt.Free;
  end;
end;

procedure TfmSpec.actEdtGroupExecute(Sender: TObject);
var
  r:integer;
begin
  inherited;
  frmGroupEdt:=TfrmGroupEdt.Create(self);
  frmGroupEdt.ik := DataSet.FieldByName('Ik_grup').Value;
  frmGroupEdt.WithSpec := false;
  frmGroupEdt.Edit := true;
  r:= frmGroupEdt.ShowModal;
  if ((r = mrOK) or (frmGroupEdt.bbApply.Tag = 1)) then
  begin
     RefreshGroup;

   // frmMain.DBDekTreeView_TEST1.RefreshNodeExecute(frmMain.DBDekTreeView_TEST1.Selected);
  end;
  frmGroupEdt.Free;
end;

procedure TfmSpec.actDelGroupExecute(Sender: TObject);
var
  i: Integer;
  ik: Integer;
begin
  inherited;
  if MessageDlg('Вы уверены что хотите удалить выбранные группы?', mtConfirmation,
               [mbYes, mbNo], 0) = mrYes then
  begin
    for i := 0 to DBGridEh1.SelectedRows.Count-1 do
    begin
      DBGridEh1.DataSource.DataSet.GotoBookmark(Pointer(DBGridEh1.SelectedRows[I]));
      ik := DBGridEh1.DataSource.DataSet['Ik_grup'];
      with dmGroupActions.adospAppendGrup.Parameters do
      begin
        ParamByName('@flag').Value:= -1;
        ParamByName('@ik_spec_fac').Value:= Null;
        ParamByName('@Cname_grup').Value:= Null;
        ParamByName('@Ik_uch_plan').Value:= Null;
        ParamByName('@nYear_post').Value:= Null;
        ParamByName('@Ik_grup').Value:= ik;
      end;
      dmGroupActions.adospAppendGrup.ExecProc;
    end;
    DataSet.Active:=false;
    DataSet.Active:=true;
    frmMain.DBDekTreeView_TEST1.RefreshNodeExecute(frmMain.DBDekTreeView_TEST1.Selected);
  end;
end;

procedure TfmSpec.actDelGroupUpdate(Sender: TObject);
begin
  inherited;
  //Пока от удаления групп отказываемся
  //actDelGroup.Enabled:= DBGridEh1.SelectedRows.Count > 0;
end;

procedure TfmSpec.actEdtGroupUpdate(Sender: TObject);
begin
  inherited;
  if (DBGridEh1.DataSource.DataSet.Active) then
    actEdtGroup.Enabled:= DBGridEh1.SelectedRows.Count = 1
  else
    actEdtGroup.Enabled:= false;
end;

procedure TfmSpec.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  if (DataSource1.DataSet <> nil) then
    if (DataSource1.DataSet.Active) then
      frmMain.StatusBar1.Panels[1].Text:= 'Группа: ' + DataSource1.DataSet.FieldByName('Cname_grup').AsString;
end;

procedure TfmSpec.actAddSpclzExecute(Sender: TObject);
var
  r:integer;
begin
  inherited;
  frmSpecAddSpclz:= TfrmSpecAddSpclz.CreateDialog(Application, Connection, nil);
  frmSpecAddSpclz.IK:= SpecIK;
  frmSpecAddSpclz.dirIK:= directionIK;
  if ((Sender as TAction).Tag = 1) then
    frmSpecAddSpclz.Tag:= -1
  else
  begin
    frmSpecAddSpclz.Tag:= dsSpclz.DataSet.FieldByName('iK_spclz').AsInteger;
    frmSpecAddSpclz.dbeShSpclz.Text:= dsSpclz.DataSet.FieldByName('Csh_spclz').AsString;
    frmSpecAddSpclz.dbeName.Text:= dsSpclz.DataSet.FieldByName('cName_spclz').AsString;
    frmSpecAddSpclz.dbeNameShort.Text:= dsSpclz.DataSet.FieldByName('cName_spclz_short').AsString;
  end;
  frmSpecAddSpclz.Read();
  r:= frmSpecAddSpclz.ShowModal();
  if ((r = mrOk) or (frmSpecAddSpclz.bbApply.Tag = 1)) then
  begin
    dsSpclz.DataSet.Close;
    dsSpclz.DataSet.Open;
   { if VidGos=FGOS2 then
    begin
      fmUchPlan1.dbcbSpclz.ListSource.DataSet.Close;
      fmUchPlan1.dbcbSpclz.ListSource.DataSet.Open;
    end;  }
  end;
end;

procedure TfmSpec.actAddSpclzUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled:= true;
end;

procedure TfmSpec.actEditSpclzUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled:= dsSpclz.DataSet.Active;
end;

procedure TfmSpec.actDelSpclzExecute(Sender: TObject);
var
  tempStoredProc: TADOStoredProc;
  msg1, msg2: PAnsiChar;
begin
  inherited;
   case(directionIK) of
        1:
        begin
          msg1:='Вы уверены, что хотите удалить выбранный профиль?';
          msg2:='Удаление профиля';
        end;
        3:
        begin
          msg1:='Вы уверены, что хотите удалить выбранную программу?';
          msg2:='Удаление программы';
        end
        else
        begin
          msg1:='Вы уверены, что хотите удалить выбранную специализацию?';
          msg2:='Удаление специализации';
        end;
   end;
  if (Application.MessageBox(msg1,msg2, mb_YesNoCancel) = mrYes) then
  begin
    tempStoredProc:= TADOStoredProc.Create(nil);
    tempStoredProc.Connection:= Connection;
    tempStoredProc.ProcedureName:= 'UpdateSpclz';
    tempStoredProc.Parameters.CreateParameter('@i_type', ftWord, pdInput, 0, 3);
    tempStoredProc.Parameters.CreateParameter('@ik_spclz', ftInteger, pdInput, 0, dbgSpclz.DataSource.DataSet.FieldByName('iK_spclz').AsInteger);
    try
      tempStoredProc.Connection.BeginTrans;
      tempStoredProc.ExecProc;
      tempStoredProc.Connection.CommitTrans;
      tempStoredProc.Free;
    except
      tempStoredProc.Connection.RollbackTrans;
      tempStoredProc.Free;
    end;
    dsSpclz.DataSet.Close;
    dsSpclz.DataSet.Open;
  end;
end;

procedure TfmSpec.dbgSpclzDblClick(Sender: TObject);
begin
  inherited;
  if actEditSpclz.Enabled then
    actAddSpclzExecute(actEditSpclz);
end;

procedure TfmSpec.CloseFrame;
begin
  fmUchPlan1.CloseFrame;
  fmUchPlan2.CloseFrame;
  if dsSpclz.DataSet <> nil then
    if dsSpclz.DataSet.Active then dsSpclz.DataSet.Close;
  inherited;
end;

procedure TfmSpec.fmUchPlan1ToolButton2Click(Sender: TObject);
begin
  inherited;
  fmUchPlan1.ActionEditUchPlanExecute(Sender);

end;

procedure TfmSpec.fmUchPlan2ToolButton12Click(Sender: TObject);
var grIK: integer;
begin
  //inherited;
  grIK := fmUchPlan2.dbcbGroup.KeyValue;
  DataSet :=  fmUchPlan2.dbcbGroup.ListSource.DataSet as TADODataSet;
  actEdtGroupExecute(nil);
 // fmUchPlan2.dbcbGroup.KeyValue :=  grIK;
 // PageControl1.ActivePageIndex := 6;
end;

procedure TfmSpec.PageControl1Change(Sender: TObject);
begin
  case PageControl1.ActivePageIndex of
  0:
  begin
  TApplicationController.GetInstance.AddLogEntry('Переход на список групп');
  if (DataSource1.DataSet <> nil) then
      if (DataSource1.DataSet.Active) then
        frmMain.StatusBar1.Panels[1].Text:= 'Группа: ' + DataSource1.DataSet.FieldByName('Cname_grup').AsString;
  end;
  1:
   begin
  TApplicationController.GetInstance.AddLogEntry('Переход на список специализаций');
  if (dsSpclz.DataSet <> nil) then
      if (dsSpclz.DataSet.Active) then
       frmMain.StatusBar1.Panels[1].Text:= 'Специализация: ' + dsSpclz.DataSet.FieldByName('cName_spclz_short').AsString;
   end;
  2:  if (VidGos>FGOS2) then begin
  TApplicationController.GetInstance.AddLogEntry('Переход на список учебных планов');
  if ((fmUchPlan1.dbcbSpclz.KeyValue <> NULL) and (fmUchPlan1.dbcbFormEd.KeyValue <> NULL) and (fmUchPlan1.dbcbYear.KeyValue <> NULL)) then
      frmMain.StatusBar1.Panels[1].Text:= 'Учебный план: ' + fmUchPlan1.dbcbSpclz.ListSource.DataSet.FieldByName('cName_spclz_short').AsString + ', ' + AnsiLowerCase(fmUchPlan1.dbcbFormEd.Text) + ', ' + fmUchPlan1.dbcbYear.Text
     else
       frmMain.StatusBar1.Panels[1].Text:= 'Учебный план: <не выбран>';
  end;

  3: begin
    dmStudentData.adodsAcadem.Active:=false;
    dmStudentData.adodsAcadem.CommandText := 'select * from AcademStud where [Ik_spec]='+inttostr(SpFacik);
    dmStudentData.adodsAcademStringField11.Visible:=false;
    dmStudentData.adodsAcadem.Active:=true;
    frmMain.Comment(TDBNodeSpecObject(FrameObject).Name, 'Академических отпусков: '+inttostr(dmStudentData.adodsAcadem.RecordCount));
    fmAcadem.FrameLevel := 3;
    fmAcadem.FrameObject := FrameObject;
  end;
  4: begin
    frmMain.Comment('Средние баллы студентов', 'Направление подготовки '+(FrameObject as TDBNodeSpecObject).Name);
    fmAverageBallsSpec.FrameObject := FrameObject;
    fmAverageBallsSpec.FrameType:=3;
    fmAverageBallsSpec.ObjectId := (FrameObject as TDBNodeSpecObject).ik;
    fmAverageBallsSpec.ShowStudents := (FrameObject as TDBNodeSpecObject).ShowStudents;
    fmAverageBallsSpec.StudyYears:= (FrameObject as TDBNodeSpecObject).StudyYears;
    fmAverageBallsSpec.ShowActualGroup := (FrameObject as TDBNodeSpecObject).showActual;
    fmAverageBallsSpec.FillListView;
  end;

  end;
end;

end.
