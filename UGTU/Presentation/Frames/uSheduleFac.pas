unit uSheduleFac;
    {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseFrame, StdCtrls, Buttons, ExtCtrls, ComCtrls, GridsEh, DBGridEh,
  ImgList, DB, Tabs, DockTabSet, uLessonShedule, uExaminationShedule, ADODB;

type
  TfmSheduleFac = class(TfmBase)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGridEh1: TDBGridEh;
    ImageList1: TImageList;
    DockTabSet2: TDockTabSet;
    Panel2: TPanel;
    Bevel1: TBevel;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    fmLessonShedule1: TfmLessonShedule;
    fmExaminationShedule1: TfmExaminationShedule;
    dsDepartments: TDataSource;
    Bevel6: TBevel;
    procedure DockTabSet2Change(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    fIK: integer;
    fYearIK: integer;
    fSemIK: integer;
    fSheduleIK: integer;
    lastTabSheet, lastSheduleTabSheet: integer;
  protected
    procedure DoRefreshFrame;override;
  public
    constructor CreateFrame(AOwner:TComponent; AObject:TObject; AConn:TADOConnection); override;
    procedure Read;
    procedure CloseFrame; override;
    property IK: Integer read fIK write fIK;
    property YearIK: Integer read fYearIK write fYearIK;
    property SemIK: Integer read fSemIK write fSemIK;
  end;

var
  fmSheduleFac: TfmSheduleFac;

implementation

uses NagruzkaController, GeneralController, SheduleController, uMain, DBTVDepScheduleObj;

{$R *.dfm}

{ TfmSheduleFac }

procedure TfmSheduleFac.CloseFrame;
begin
  inherited;
  lastTabSheet:= PageControl1.ActivePageIndex;
  lastSheduleTabSheet:= PageControl2.ActivePageIndex;
end;

constructor TfmSheduleFac.CreateFrame(AOwner: TComponent; AObject: TObject;
  AConn: TADOConnection);
begin
  inherited CreateFrame(AOwner, AObject, AConn);
  lastTabSheet:= 0;
  lastSheduleTabSheet:= 0;
end;

procedure TfmSheduleFac.DBGridEh1DblClick(Sender: TObject);
var
  i, depIK: integer;
begin
  if (dsDepartments.DataSet <> nil) then
    if dsDepartments.DataSet.Active then
    begin
      dsDepartments.DataSet.DisableControls;
      depIK:= dsDepartments.DataSet.FieldByName('ik_kaf').AsInteger;
      frmMain.DBDekTreeView_TEST1.Selected.Expand(false);
      for i:= 0 to (frmMain.DBDekTreeView_TEST1.Selected.Count-1) do
        if (TDBNodeScheduledepartmentObject(frmMain.DBDekTreeView_TEST1.Selected.Item[i].Data).IK = depIK) then
      begin
        frmMain.DBDekTreeView_TEST1.Selected.Item[i].Selected:= true;
        break;
      end;
      dsDepartments.DataSet.EnableControls;
  end;
end;

procedure TfmSheduleFac.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    DBGridEh1DblClick(DBGridEh1);  
end;

procedure TfmSheduleFac.DockTabSet2Change(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
  PageControl2.ActivePageIndex:= NewTab;
  case NewTab of
  0: fmLessonShedule1.IsFullScreen:= fmExaminationShedule1.IsFullScreen;
  1: fmExaminationShedule1.IsFullScreen:= fmLessonShedule1.IsFullScreen;
  end;
end;

procedure TfmSheduleFac.DoRefreshFrame;
begin
  inherited;
  Read;
end;


procedure TfmSheduleFac.Read;
begin
  if (fYearIK = 0) and (fSemIK = 0) then
    raise Exception.Create('Ќе указан номер семестра и год обучени€');
  dsDepartments.DataSet:= DataSet;
  fSheduleIK:= TSheduleController.MainFunctions.GetSheduleIK(fYearIK, fSemIK);
  if not fmLessonShedule1.IsFrameLoad then
    fmLessonShedule1.Read(false, fIK, fSheduleIK)
  else
  begin
    if fmLessonShedule1.CurrentSheduleGrid.IsLoad then
      fmLessonShedule1.CurrentSheduleGrid.GoToDate(fmLessonShedule1.CurrentSheduleGrid.PeriodStart);
  end;
  if not fmExaminationShedule1.IsFrameLoad then
    fmExaminationShedule1.Read(false, fIK, fSheduleIK)
  else
  begin
    if fmExaminationShedule1.CurrentSheduleGrid.IsLoad then
      fmExaminationShedule1.CurrentSheduleGrid.UpdateVisibleEvents;
  end;
  fmLessonShedule1.IsLoadInWindow:= false;
  PageControl1.ActivePageIndex:= lastTabSheet;
  PageControl2.ActivePageIndex:= lastSheduleTabSheet;
  DockTabSet2.TabIndex:= lastSheduleTabSheet;

  fmLessonShedule1.ikyear :=fYearIK;
  fmLessonShedule1.iksemtype := fSemIK;

end;

end.
