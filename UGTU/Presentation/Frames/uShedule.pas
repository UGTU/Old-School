unit uShedule;
    {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseFrame, StdCtrls, Buttons, ExtCtrls, ComCtrls, ImgList, ActnList,
  ToolWin, GridsEh, DBGridEh, DB, ADODB, Menus, ComObj, Grids, Contnrs;

type
  TfmShedule = class(TfmBase)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ImageList1: TImageList;
    ActionList1: TActionList;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    DBGridEh1: TDBGridEh;
    dsSemesterList: TDataSource;
    sgCampusDistance: TStringGrid;
    Panel2: TPanel;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Bevel2: TBevel;
    actCampusSaveChanges: TAction;
    actCampusUndoChanges: TAction;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    Bevel6: TBevel;
    procedure ToolButton3Click(Sender: TObject);
    procedure sgCampusDistanceSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sgCampusDistanceDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgCampusDistanceKeyPress(Sender: TObject; var Key: Char);
    procedure actCampusUndoChangesExecute(Sender: TObject);
    procedure actCampusSaveChangesExecute(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    fCampusDistanceInfo: TObjectList;
    procedure RefreshCampusDistanceInfo;
  protected
    procedure DoRefreshFrame;override;
  public
    procedure Read;
    procedure CloseFrame; override;
  end;

var
  fmShedule: TfmShedule;

implementation

uses NagruzkaController, GeneralController, TestFrameWork, GUITestRunner,
  SheduleController, SheduleClasses, SheduleGrids, uMain, DBTVSemesterScheduleobj;

{$R *.dfm}

procedure TfmShedule.actCampusSaveChangesExecute(Sender: TObject);
var
  i,j: integer;
begin
  for i := 0 to fCampusDistanceInfo.Count - 1 do
    for j := 0 to TCampusDistanceInfo(fCampusDistanceInfo[i]).DistanceCount - 1 do
    if sgCampusDistance.Cells[i+1, j+1] <> '' then
      TCampusDistanceInfo(fCampusDistanceInfo[i]).Distance[j]:= StrToInt(sgCampusDistance.Cells[i+1, j+1])
    else TCampusDistanceInfo(fCampusDistanceInfo[i]).Distance[j]:= 0;
  actCampusSaveChanges.Enabled:= TSheduleController.AccountFunctions.SaveCampusDistance(fCampusDistanceInfo) = false;
  actCampusUndoChanges.Enabled:= actCampusSaveChanges.Enabled;
end;

procedure TfmShedule.actCampusUndoChangesExecute(Sender: TObject);
begin
  RefreshCampusDistanceInfo;
end;

procedure TfmShedule.CloseFrame;
begin
  inherited;
  if actCampusSaveChanges.Enabled then
    if Application.MessageBox(PChar('Вы редактировали расстояния между учебными корпусами и не сохранили изменения.' + #10#13 +
      'Сохранить изменения?'), 'Расстояния между корпусами', MB_YESNO) = mrYes then
      actCampusUndoChangesExecute(actCampusSaveChanges);
  if fCampusDistanceInfo <> nil then FreeAndNil(fCampusDistanceInfo);
end;

procedure TfmShedule.DBGridEh1DblClick(Sender: TObject);
var
  i, yearIK, semIK: integer;
begin
  if (dsSemesterList.DataSet <> nil) then
    if dsSemesterList.DataSet.Active then
    begin
      dsSemesterList.DataSet.DisableControls;
      yearIK:= dsSemesterList.DataSet.FieldByName('ik_year_uch_pl').AsInteger;
      semIK:= dsSemesterList.DataSet.FieldByName('ik_sem_type').AsInteger;
      frmMain.DBDekTreeView_TEST1.Selected.Expand(false);
      for i:= 0 to (frmMain.DBDekTreeView_TEST1.Selected.Count-1) do
        if (TDBNodeSemesterScheduleObject(frmMain.DBDekTreeView_TEST1.Selected.Item[i].Data).IK_Year = yearIK)
          and (TDBNodeSemesterScheduleObject(frmMain.DBDekTreeView_TEST1.Selected.Item[i].Data).IK_Semtype = semIK) then
      begin
        frmMain.DBDekTreeView_TEST1.Selected.Item[i].Selected:= true;
        break;
      end;
      dsSemesterList.DataSet.EnableControls;
  end;
end;

procedure TfmShedule.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    DBGridEh1DblClick(DBGridEh1);  
end;

procedure TfmShedule.DoRefreshFrame;
begin
  inherited;
  Read;
end;

procedure TfmShedule.Read;
begin
  dsSemesterList.DataSet:= DataSet;
  PageControl1.ActivePageIndex:= 0;
  Refresh;
  RefreshCampusDistanceInfo;
end;

procedure TfmShedule.RefreshCampusDistanceInfo;
var
  i, j: integer;
begin
  if fCampusDistanceInfo <> nil then FreeAndNil(fCampusDistanceInfo);
  fCampusDistanceInfo:= TSheduleController.AccountFunctions.GetCampusDistance;
  sgCampusDistance.RowCount:= fCampusDistanceInfo.Count + 1;
  sgCampusDistance.ColCount:= fCampusDistanceInfo.Count + 1;
  for I := 0 to fCampusDistanceInfo.Count - 1 do
  begin
    if (sgCampusDistance.DefaultColWidth < sgCampusDistance.Canvas.TextWidth(TCampusDistanceInfo(fCampusDistanceInfo[i]).CampusName) + 10) then
      sgCampusDistance.DefaultColWidth:= sgCampusDistance.Canvas.TextWidth(TCampusDistanceInfo(fCampusDistanceInfo[i]).CampusName) + 11;
    sgCampusDistance.Cells[0, i+1]:= TCampusDistanceInfo(fCampusDistanceInfo[i]).CampusName;
    sgCampusDistance.Cells[i+1, 0]:= TCampusDistanceInfo(fCampusDistanceInfo[i]).CampusName;
    for j := 0 to TCampusDistanceInfo(fCampusDistanceInfo[i]).DistanceCount - 1 do
      sgCampusDistance.Cells[i+1,j+1]:= IntToStr(TCampusDistanceInfo(fCampusDistanceInfo[i]).Distance[j]);
  end;
end;

procedure TfmShedule.sgCampusDistanceDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  tempStr: string;
begin
  tempStr:= sgCampusDistance.Cells[ACol, ARow];
  if (ARow = ACol) then
    sgCampusDistance.Canvas.Font.Color:= clSilver
  else sgCampusDistance.Canvas.Font.Color:= clBlack;
  sgCampusDistance.Canvas.TextRect(Rect, Rect.Left + round((sgCampusDistance.ColWidths[ACol] - sgCampusDistance.Canvas.TextWidth(tempStr))/2),
    Rect.Top + round((sgCampusDistance.RowHeights[ARow] - sgCampusDistance.Canvas.TextHeight(tempStr))/2), tempStr);
end;

procedure TfmShedule.sgCampusDistanceKeyPress(Sender: TObject; var Key: Char);
const
  allow: set of char = ['0','1','2','3','4','5','6','7','8','9'];
begin
  if not (Key in allow) then
    Key:= #0
  else
  begin
    actCampusSaveChanges.Enabled:= true;
    actCampusUndoChanges.Enabled:= true;
  end;
end;

procedure TfmShedule.sgCampusDistanceSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if ((ARow = 0) or (ACol = 0)) or (ARow = ACol) then
    sgCampusDistance.Options:= sgCampusDistance.Options - [goEditing]
  else
    sgCampusDistance.Options:= sgCampusDistance.Options + [goEditing];
end;

procedure TfmShedule.ToolButton3Click(Sender: TObject);
begin
  GUITestRunner.RunRegisteredTests;
end;

end.
