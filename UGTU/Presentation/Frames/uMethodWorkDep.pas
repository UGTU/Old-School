unit uMethodWorkDep;
   {#Author nnikolenko@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Controls, Graphics, Forms,
  Dialogs, MethodWorkController, uBaseFrame, DBGridEh, StdCtrls, ExtCtrls, DBCtrlsEh, Buttons, Mask,
  DBLookupEh, ComCtrls, GridsEh, ToolWin, DB, ADODB, DBTVMethodWorkdepobj, GeneralController,
  ImgList, ActnList, DBCtrls, WinProcs, ApplicationController, ExceptionBase,
  Grids, MethodWorkComboboxFilter;

const
  IID_IFilter : TGUID = '{FF82FCEB-F9F4-4F6F-A0A5-D5F9934DC29C}';


type
  TfmMethodWorkDep = class(TfmBase)
    PageControl1: TPageControl;
    tsPrepods: TTabSheet;
    tsPlan: TTabSheet;
    DSPrep: TDataSource;
    TabSheet1: TTabSheet;
    ToolBar5: TToolBar;
    ToolButton30: TToolButton;
    Panel2: TPanel;
    ImageList1: TImageList;
    actList: TActionList;
    actAddPlan: TAction;
    actEditPlan: TAction;
    actDelPlan: TAction;
    actLoadCurrentPlan: TAction;
    DSWarrant: TDataSource;
    TabSheet3: TTabSheet;
    ToolBar3: TToolBar;
    ToolButton7: TToolButton;
    ToolButton9: TToolButton;
    Panel4: TPanel;
    dsPlanDep: TDataSource;
    ToolButton8: TToolButton;
    ToolBar4: TToolBar;
    Panel5: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    dbgPlanEd: TDBGridEh;
    dbcbPlanEd: TDBLookupComboboxEh;
    chbDiscEd: TCheckBox;
    dbcbDiscPlanEd: TDBLookupComboboxEh;
    dsPlanEdDep: TDataSource;
    dsSrok: TDataSource;
    TabSheet4: TTabSheet;
    ToolBar6: TToolBar;
    ToolButton5: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    Panel6: TPanel;
    Splitter1: TSplitter;
    GroupBox4: TGroupBox;
    Panel9: TPanel;
    Label6: TLabel;
    dbcbItemGos: TDBLookupComboboxEh;
    Panel10: TPanel;
    DBMemo1: TDBMemo;
    GroupBox3: TGroupBox;
    Panel11: TPanel;
    DBMemo2: TDBMemo;
    Panel12: TPanel;
    Label5: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    dbcbDiscGos: TDBLookupComboboxEh;
    dbcbCklDisc: TDBLookupComboboxEh;
    dbcbGrpDisc: TDBLookupComboboxEh;
    Panel7: TPanel;
    Label8: TLabel;
    dbcbYearGos: TDBLookupComboboxEh;
    dsItemGos: TDataSource;
    dsDiscGos: TDataSource;
    ImageList2: TImageList;
    ActionList1: TActionList;
    actAddGos: TAction;
    actDelGos: TAction;
    actAddItemGos: TAction;
    ToolButton6: TToolButton;
    actEditItemGos: TAction;
    actDelItemGos: TAction;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    actAddDiscGos: TAction;
    actEditDiscGos: TAction;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    actDelDiscGos: TAction;
    TabSheet5: TTabSheet;
    ToolBar7: TToolBar;
    Panel8: TPanel;
    Label17: TLabel;
    dbgFact: TDBGridEh;
    chbFact: TCheckBox;
    dbcbDisc: TDBLookupComboboxEh;
    dsFactDep: TDataSource;
    ToolButton16: TToolButton;
    actExportFact: TAction;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    dbcbYearFact: TDBLookupComboboxEh;
    Panel16: TPanel;
    Label2: TLabel;
    dbcbVidZan: TDBLookupComboboxEh;
    Panel17: TPanel;
    dbgVidZanyat: TDBGridEh;
    Panel18: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    actSave: TAction;
    actUndo: TAction;
    actAddWarrant: TAction;
    actRemWarrant: TAction;
    actAddSrok: TAction;
    actRemSrok: TAction;
    dbcbSpec: TDBLookupComboboxEh;
    Label18: TLabel;
    actExportPlan: TAction;
    Label9: TLabel;
    chbYearFact: TCheckBox;
    Panel3: TPanel;
    Label14: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Panel14: TPanel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    actExportPlanEd: TAction;
    Label39: TLabel;
    Image1: TImage;
    Image2: TImage;
    Label40: TLabel;
    eCountM: TEdit;
    ToolButton1: TToolButton;
    Panel15: TPanel;
    Splitter2: TSplitter;
    GroupBox1: TGroupBox;
    SG: TStringGrid;
    Panel19: TPanel;
    Label1: TLabel;
    dbcbPlan: TDBLookupComboboxEh;
    dsWarrantFilter: TDataSource;
    dsNameWorkFilter: TDataSource;
    dsMethodWorkFilter: TDataSource;
    dsPrepodFilter: TDataSource;
    Panel13: TPanel;
    Label28: TLabel;
    Label15: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    GroupBox2: TGroupBox;
    dbcbTypeRep: TDBLookupComboboxEh;
    dbdtDate: TDBDateTimeEditEh;
    dbeProtocol: TDBEditEh;
    Label43: TLabel;
    Label44: TLabel;
    Label42: TLabel;
    ToolBar1: TToolBar;
    ToolButton20: TToolButton;
    Panel20: TPanel;
    Label41: TLabel;
    dbcbPlanDep: TDBLookupComboboxEh;
    GroupBox5: TGroupBox;
    dbeDep: TDBGridEh;
    Panel21: TPanel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    procedure dbcbVidZanKeyValueChanged(Sender: TObject);
    procedure dbcbPlanKeyValueChanged(Sender: TObject);
    //procedure dbgPlanDepDrawColumnCell(Sender: TObject; const Rect: TRect;
      //DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure actAddPlanExecute(Sender: TObject);
    procedure actDelPlanUpdate(Sender: TObject);
    procedure actDelPlanExecute(Sender: TObject);
    procedure actLoadCurrentPlanUpdate(Sender: TObject);
    //procedure RGClick(Sender: TObject);
    procedure dbgPlanDepDblClick(Sender: TObject);
    procedure actLoadCurrentPlanExecute(Sender: TObject);
    procedure chbDiscEdClick(Sender: TObject);
    procedure dbcbPlanEdKeyValueChanged(Sender: TObject);
    procedure dbcbDiscPlanEdKeyValueChanged(Sender: TObject);
    procedure actAddMWUpdate(Sender: TObject);
    procedure actAddMWExecute(Sender: TObject);
    procedure dbcbMWKeyValueChanged(Sender: TObject);
    procedure actAddSrokUpdate(Sender: TObject);
    procedure actAddSrokExecute(Sender: TObject);
    procedure dbcbYearGosKeyValueChanged(Sender: TObject);
    procedure dbcbItemGosKeyValueChanged(Sender: TObject);
    procedure dbcbDiscGosKeyValueChanged(Sender: TObject);
    procedure dbcbCklDiscKeyValueChanged(Sender: TObject);
    procedure actAddGosExecute(Sender: TObject);
    procedure actDelGosUpdate(Sender: TObject);
    procedure actDelGosExecute(Sender: TObject);
    procedure actAddItemGosExecute(Sender: TObject);
    procedure actAddItemGosUpdate(Sender: TObject);
    procedure actEditItemGosUpdate(Sender: TObject);
    procedure actEditItemGosExecute(Sender: TObject);
    procedure actDelItemGosExecute(Sender: TObject);
    procedure actAddDiscGosExecute(Sender: TObject);
    procedure actEditDiscGosUpdate(Sender: TObject);
    procedure actEditDiscGosExecute(Sender: TObject);
    procedure actDelDiscGosExecute(Sender: TObject);
    procedure chbFactClick(Sender: TObject);
    procedure dbcbYearFactKeyValueChanged(Sender: TObject);
    procedure actExportFactUpdate(Sender: TObject);
    procedure actExportFactExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actSaveUpdate(Sender: TObject);
    procedure DSWarrantDataChange(Sender: TObject; Field: TField);
    procedure PageControl1Change(Sender: TObject);
    procedure dsSrokDataChange(Sender: TObject; Field: TField);
    procedure actAddWarrantUpdate(Sender: TObject);
    procedure actAddWarrantExecute(Sender: TObject);
    procedure actRemWarrantUpdate(Sender: TObject);
    procedure actRemWarrantExecute(Sender: TObject);
    procedure actUndoExecute(Sender: TObject);
    procedure actRemSrokUpdate(Sender: TObject);
    procedure actRemSrokExecute(Sender: TObject);
    procedure dbcbSpecKeyValueChanged(Sender: TObject);
    procedure actExportPlanUpdate(Sender: TObject);
    procedure chbYearFactClick(Sender: TObject);
    procedure dbcbDiscKeyValueChanged(Sender: TObject);
    procedure actExportPlanExecute(Sender: TObject);
    procedure dbgFactDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure actExportPlanEdUpdate(Sender: TObject);
    procedure actExportPlanEdExecute(Sender: TObject);
    procedure cbFilterDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure cbFilterMeasureItem(Control: TWinControl; Index: Integer;
      var Height: Integer);
    procedure eCountMKeyPress(Sender: TObject; var Key: Char);
    procedure eCountMExit(Sender: TObject);
    procedure dbgPlanDepTitleClick(Column: TColumnEh);
    procedure dbcbPlanDepKeyValueChanged(Sender: TObject);
    procedure DSPrepDataChange(Sender: TObject; Field: TField);
    procedure actAddGosUpdate(Sender: TObject);
    procedure actEditPlanExecute(Sender: TObject);
    procedure SGSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SGDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
  private
    { Private declarations }
    FEditors : array [1..7] of TDBComboboxFilter;
    fIK: integer;
    LastNormOfTime: Integer;
    flagWarrantChange: boolean;
    flagDateRatifyChange: boolean;
    LastKeyValue, LastKeyValueEd, LastKeyValueFact: Integer;
    VolumeForMW: double;
    s: integer; //выделенная строка в StringGrid
    PlanVolumeForMW: TDoubleArray; //запланированный объем на УМР
    procedure ClearRowObjects;
    procedure ChangeLoadPrep;
   // procedure ChangeAutoOrCurrentPlan;
    procedure ChangeLoadPlanEdition;
    procedure ExecuteError(Sender:TObject; E : Exception);
    procedure SetGridWidth(Grid: TStringGrid);
    procedure UpdateStringGrid;
    procedure MyChange(Sender: TObject);
    procedure MyKeyPress(Sender: TObject; var Key: Char);
    procedure MyEditButtons0Click1(Sender: TObject; var Handled: Boolean);
    function GetRowEntry(Row : Integer) : TPlanEntryViewRow;
    function IsEditrosNotNil:Boolean;
    function GetRect(Left, Top, Bottom, Right : Word) : TRect;
    function CreateEditor(const FieldName : string; IsFieldBoolean : Boolean; TypeSign :  TBitwiseType; Items : array of String) : TDBComboboxFilter;
  protected
    procedure DoRefreshFrame;override;
  public
    //procedure CloseFrame; override;
    procedure Read;
    property IK: Integer read fIK write fIK;

  public
    { Public declarations }
  end;

var
  fmMethodWorkDep: TfmMethodWorkDep;

implementation
uses ToolCtrlsEh, uMain, uMethodWorkAddPlanDep, uMethodWorkPlanCurrentMW, uMethodWorkDateFilter,
     uMethodWorkAddGos, uMethodWorkAddContentItemGos, uMethodWorkAddContentDiscOnGos,
     ReportsBase, uWaitingForm, MW_DepPlanRep, MW_DepPlanEditionRep, MW_DepFactRep;
{$R *.dfm}

procedure TfmMethodWorkDep.dbgPlanDepDblClick(Sender: TObject);
begin
 if actLoadCurrentPlan.Enabled then
    actLoadCurrentPlanExecute(actLoadCurrentPlan);
end;

(*procedure TfmMethodWorkDep.dbgPlanDepDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var
    Format: Word;
    CellRect: TRect;
begin
if RG.ItemIndex = 0 then
if (dsPlanDep.DataSet.FieldByName('IDMethodEdition').Value = NULL) then
  with (Sender as TDBGridEh).Canvas do
  begin
   //Brush.Color:= clWhite;
   FillRect(Rect);
   Font.Color:= clRed;
   if Column.Field.DataType = ftString then
     TextOut(Rect.Left+2, Rect.Top+2, Column.Field.Text)
   else TextOut(Rect.Right-TextWidth(Column.Field.Text)-2, Rect.Top+2, Column.Field.Text);
  end
else (Sender as TDBGridEh).DefaultDrawing:= true// dbgPlanDep.DefaultDrawColumnCell(Rect, DataCol, Column, State)

else
if (dsPlanDep.DataSet.FieldByName('IDMethodEditionPlan').Value = NULL) then
  begin
    CellRect := Rect;
    (Sender as TDBGridEh).Canvas.FillRect(Rect);
    (Sender as TDBGridEh).Canvas.Font.Color:= clRed;

    if (Column.Field.DataType = ftString) or (Column.Field.DataType = ftDateTime) then
    begin
      Format := DT_LEFT or DT_WORDBREAK or DT_TOP;
      CellRect.Left:= CellRect.Left+2;
      CellRect.Top:= CellRect.Top+2;
    end
    else
    begin
      Format := DT_RIGHT or DT_WORDBREAK or DT_TOP;
      CellRect.Right:= CellRect.Right-2; //-(Sender as TDBGridEh).Canvas.TextWidth(Column.Field.Text)-2;
      CellRect.Top:= CellRect.Top+2;
    end;

    WinProcs.DrawText(
                    (Sender as TDBGridEh).Canvas.Handle,
                    PAnsiChar(TDBGridEh(Sender).DataSource.DataSet.FieldByName(Column.FieldName).AsString),
                    StrLen(PAnsiChar(TDBGridEh(Sender).DataSource.DataSet.FieldByName(Column.FieldName).AsString)),
                    CellRect,
                    Format);
  end;

  {with dbgPlanDep.Canvas do
  begin
   //Brush.Color:= clWhite; //clGradientActiveCaption;
   FillRect(Rect);
   Font.Color:= clRed;
   if Column.Field.DataType = ftString then
     TextOut(Rect.Left+2, Rect.Top+2, Column.Field.Text)
   else TextOut(Rect.Right-TextWidth(Column.Field.Text)-2, Rect.Top+2, Column.Field.Text);
  end;}
end; *)

procedure TfmMethodWorkDep.dbgPlanDepTitleClick(Column: TColumnEh);
begin
  if Column.Field.DataType = ftDateTime then
  begin
    TADODataSet(Column.Grid.DataSource.DataSet).IndexFieldNames:= Column.Field.FieldName + ' DESC';
    Column.Title.SortMarker:=smDownEh;
  end
  else
  begin
    TADODataSet(Column.Grid.DataSource.DataSet).IndexFieldNames:= Column.Field.FieldName;
    Column.Title.SortMarker:=smUpEh;
  end;
end;

procedure TfmMethodWorkDep.dbgFactDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var
    CellRect: TRect;
    //bmp: graphics.TBitmap;
begin
  if (dsFactDep.DataSet.FieldByName('IDMethodEditionPlan').Value = NULL) then
    if (Column.Field.DataType = ftDateTime) then
    begin
      TDBGridEh(Sender).Canvas.FillRect(Rect);
      CellRect:= Rect;
      {bmp:= Graphics.TBitmap.Create;
      try
        ImageList1.GetBitmap(24, bmp);
        TDBGridEh(Sender).Canvas.Draw(Rect.Left+2, Rect.Top+2, bmp);
        CellRect.Left:= Rect.Left + bmp.Width + 4;
      finally
        bmp.Free;
      end;}
      ImageList1.Draw(TDBGridEh(Sender).Canvas, Rect.Left+2, Rect.Top+2, 14);
      CellRect.Left:= Rect.Left + ImageList1.Width + 4;
      TDBGridEh(Sender).Canvas.TextOut(CellRect.Left+2, CellRect.Top+2, Column.Field.Text);
    end;
  if (dsFactDep.DataSet.FieldByName('CurrentBitEdition').AsBoolean) then
    if (Column.Field.DataType = ftDateTime) then
    begin
      TDBGridEh(Sender).Canvas.FillRect(Rect);
      CellRect:= Rect;
      ImageList1.Draw(TDBGridEh(Sender).Canvas, Rect.Left+2, Rect.Top+2, 24);
      CellRect.Left:= Rect.Left + ImageList1.Width + 4;
      TDBGridEh(Sender).Canvas.TextOut(CellRect.Left+2, CellRect.Top+2, Column.Field.Text);
    end;
end;

procedure TfmMethodWorkDep.DoRefreshFrame;
begin
  inherited;
  Read;
end;

procedure TfmMethodWorkDep.DSPrepDataChange(Sender: TObject; Field: TField);
begin
  if (DSPrep.DataSet.State = dsEdit) or (DSPrep.DataSet.State = dsInsert) then
    flagDateRatifyChange:= dbcbPlanDep.KeyValue <> NULL;
end;

procedure TfmMethodWorkDep.dsSrokDataChange(Sender: TObject; Field: TField);
begin
  {if (dsSrok.DataSet.State = dsEdit) or (dsSrok.DataSet.State = dsInsert) then
    flagSrokChange:= dbcbMW.KeyValue <> NULL; }
end;

procedure TfmMethodWorkDep.DSWarrantDataChange(Sender: TObject; Field: TField);
begin
  if (DSWarrant.DataSet.State = dsEdit) or (DSWarrant.DataSet.State = dsInsert) then
    flagWarrantChange:= dbcbVidZan.KeyValue <> NULL;
end;

procedure TfmMethodWorkDep.eCountMExit(Sender: TObject);
begin
  TMethodWorkController.Instance.GetFilteredFact(TDBNodeMethodWorkDepartmentObject(self.FrameObject).IK, StrToInt(eCountM.Text));
  ChangeLoadPrep;
end;

procedure TfmMethodWorkDep.eCountMKeyPress(Sender: TObject; var Key: Char);
begin
 if not(Key in ['0'..'9']) and (Key <> #8) and (Key <> #46) or (Key = '.') then
 begin
   Key :=#0;
   SysUtils.Beep;
 end;
end;

procedure TfmMethodWorkDep.ExecuteError(Sender: TObject; E: Exception);
begin
  (Sender as TExcelReportBase).Quit;
  raise EApplicationException.Create('Произошла ошибка при экспорте данных в Excel.',E);
end;

function TfmMethodWorkDep.GetRect(Left, Top, Bottom, Right: Word): TRect;
begin
  Result.Left := Left;
  Result.Top := Top;
  Result.Bottom := Bottom;
  Result.Right := Right;
end;

function TfmMethodWorkDep.GetRowEntry(Row: Integer): TPlanEntryViewRow;
begin
  Result := SG.Objects[0, Row] as TPlanEntryViewRow;
end;

function TfmMethodWorkDep.IsEditrosNotNil: Boolean;
var
  I : Integer;
begin
  Result := true;
  for I := Low(FEditors) to High(FEditors) do
     Result := Result and Assigned(FEditors[I]);
end;

procedure TfmMethodWorkDep.MyChange(Sender: TObject);
var
  i: integer;
  FC: MethodWorkComboboxFilter.IFilter;
  Filter : String;
begin
  (Sender as TDBComboBoxEh).Hint:= (Sender as TDBComboBoxEh).Text;
  Filter:= '';

  for I := 0 to SG.ComponentCount - 1 do
    if (SG.Components[i].GetInterface(IID_IFilter, FC)) then
      if (FC.IsFiltered) then
        if Filter = '' then
          Filter := FC.GetQueryText
        else Filter:= Filter + ' AND ' +  FC.GetQueryText;
  //ShowMessage(Filter);
  dsPlanDep.DataSet.Filter:= Filter;
  dsPlanDep.DataSet.Filtered:= Filter <> '';

  UpdateStringGrid;
end;

procedure TfmMethodWorkDep.MyEditButtons0Click1(Sender: TObject;
  var Handled: Boolean);
begin
  frmMethodWorkDateFilter:= TfrmMethodWorkDateFilter.CreateDialog(nil, self.Connection, nil);
  try
    frmMethodWorkDateFilter.IsModified:= true;
    case FEditors[2].TypeSign of
      bwEquals: frmMethodWorkDateFilter.RadioGroup1.ItemIndex:= 0;
      bwGrater:
        begin
          frmMethodWorkDateFilter.RadioGroup1.ItemIndex:= 1;
          frmMethodWorkDateFilter.DateTimePicker1.Date:= StrToDate(FEditors[2].TextField);
        end;
      bwLess:
        begin
          frmMethodWorkDateFilter.RadioGroup1.ItemIndex:= 2;
          frmMethodWorkDateFilter.DateTimePicker2.Date:= StrToDate(FEditors[2].TextField);
        end;
    end;
    if (frmMethodWorkDateFilter.ShowModal() = mrOk) then
    begin
      FEditors[2].TextField:= frmMethodWorkDateFilter.Str;
      case frmMethodWorkDateFilter.IK of
        0: begin
             FEditors[2].TypeSign:= bwEquals;
             FEditors[2].ItemIndex:= 0;
           end;
        1: begin
             FEditors[2].TypeSign:= bwGrater;
             FEditors[2].ItemIndex:= FEditors[2].Items.Add('> ' + frmMethodWorkDateFilter.Str);
           end;
        2: begin
             FEditors[2].TypeSign:= bwLess;
             FEditors[2].ItemIndex:= FEditors[2].Items.Add('< ' + frmMethodWorkDateFilter.Str);
           end;
      end;
    end;
  finally
    frmMethodWorkDateFilter.Free;
  end;
end;

procedure TfmMethodWorkDep.MyKeyPress(Sender: TObject; var Key: Char);
begin
  Key :=#0;
  SysUtils.Beep;
end;

procedure TfmMethodWorkDep.PageControl1Change(Sender: TObject);
begin
  case PageControl1.ActivePageIndex of
  4:begin
      bbUndo.Visible:= true;
      bbSave.Visible:= true;
    end;
  0:begin
      bbUndo.Visible:= true;
      bbSave.Visible:= true;
    end
  else
    begin
      bbUndo.Visible:= false;
      bbSave.Visible:= false;
    end;
  end;
end;

procedure TfmMethodWorkDep.Read;
  procedure InitHeaders;
  begin
    SG.ColCount:= 8;
    SG.RowHeights[0]:= 21;
    SG.Cells[0,1]:= 'План/ Факт';
    SG.Cells[1,1]:= 'Готовность';
    SG.Cells[2,1]:= 'Результат работы';
    SG.Cells[3,1]:= 'Вид работы';
    SG.Cells[4,1]:= 'Наименование работы';
    SG.Cells[5,1]:= 'Издание';
    SG.Cells[6,1]:= 'Автор';
  end;

  procedure InitEditors;
  begin
    FEditors[1] := CreateEditor('Bit_plan_fact', true, bwEquals, [TDBComboboxFilter.FILTER_ALL, 'План', 'Факт']);

    FEditors[2] := CreateEditor('DateTransitionInState', false, bwEquals, []);
    FEditors[2].EditButton.Visible:= False;
    FEditors[2].EditButtons.Add;
    FEditors[2].EditButtons[0].Style:= ebsEllipsisEh;
    FEditors[2].EditButtons[0].OnClick:= MyEditButtons0Click1;

    FEditors[3] := CreateEditor('NameWarrant', false, bwEquals, []);
    FEditors[4] := CreateEditor('NameWork', false, bwEquals, []);
    FEditors[5] := CreateEditor('NameMethodEdition', false, bwEquals, []);
    FEditors[6] := CreateEditor('CurrentBitEdition', true, bwEquals, [TDBComboboxFilter.FILTER_ALL, 'Издаётся', 'Не издаётся']);
    FEditors[7] := CreateEditor('Pr', false, bwEquals, []);
  end;
begin
  PageControl1Change(nil);

  // Контроль выполнения
  //DSPrep.DataSet:=DataSet;
  TGeneralController.Instance.InitializeLockupCB(@dbcbPlanDep, 'ik_year', 'UchYear');

  if dbcbPlanDep.KeyValue <> NULL then
  begin
    dbcbPlanDep.KeyValue:= NULL;
  end;

  dbcbPlanDep.KeyValue:= TMethodWorkController.Instance.GetPlanMWForPlan(@dbcbPlanDep.ListSource.DataSet, TDBNodeMethodWorkDepartmentObject(self.FrameObject).ik, true, true);

  // План УМР кафедры
  LastNormOfTime:= TMethodWorkController.Instance.GetLastNormOfTime(TDBNodeMethodWorkDepartmentObject(self.FrameObject).ik);

  //годовой объем на УМР для кафедры
  VolumeForMW:= TMethodWorkController.Instance.GetVolumeForMWDep(TDBNodeMethodWorkDepartmentObject(self.FrameObject).ik, LastNormOfTime);
  Label27.Caption:= FloatToStrF(VolumeForMW, ffFixed, 10, 2) + ' час.';

  TGeneralController.Instance.InitializeLockupCB(@dbcbPlan, 'ik_year', 'UchYear');
  //TGeneralController.Instance.InitializeLockupCB(@dbcbDiscPlan, 'iK_disc', 'cName_disc');
  TGeneralController.Instance.InitializeLockupCB(@dbcbTypeRep, 'IDTypeReport', 'NameTypeReport');
  TMethodWorkController.Instance.GetTypeReport(@dbcbTypeRep.ListSource.DataSet, false, Null);

  dbdtDate.DataSource:= dbcbPlan.ListSource;
  dbdtDate.DataField:= 'DateRatification';
  dbcbTypeRep.DataSource:= dbcbPlan.ListSource;
  dbcbTypeRep.DataField:= 'IDTypeReport';
  dbeProtocol.DataSource:= dbcbPlan.ListSource;
  dbeProtocol.DataField:= 'NumProtocol';
  dbeProtocol.Alignment:= taLeftJustify;
  {dbdtDate.Text:= dbcbPlan.ListSource.DataSet.FieldByName('DateRatification').AsString;
  dbcbTypeRep.KeyValue:= dbcbPlan.ListSource.DataSet.FieldByName('IDTypeReport').AsInteger;
  dbeProtocol.Text:= dbcbPlan.ListSource.DataSet.FieldByName('NumProtocol').AsString;}

  InitHeaders;

  if not IsEditrosNotNil then
    InitEditors;

  if dbcbPlan.KeyValue <> NULL then
  begin
    dbcbPlan.KeyValue:= NULL;
  end;

  dbcbPlan.KeyValue:= TMethodWorkController.Instance.GetPlanMWForPlan(@dbcbPlan.ListSource.DataSet, TDBNodeMethodWorkDepartmentObject(self.FrameObject).ik, true, true);
  //dbcbDiscPlan.KeyValue:= TMethodWorkController.Instance.GetDiscForPlanDep(@dbcbDiscPlan.ListSource.DataSet, dbcbPlan.ListSource.DataSet.FieldByName('ik_year').AsInteger, TDBNodeMethodWorkDepartmentObject(self.FrameObject).ik, false);

  {if not(chbDisc.Checked) and (dbcbPlan.KeyValue <> NULL) then
    dsPlanDep.DataSet.Filtered:= false
  else
    dbcbDiscPlan.KeyValue:= LastKeyValue; }

  // План издания кафедры
  TGeneralController.Instance.InitializeLockupCB(@dbcbPlanEd, 'ik_year', 'UchYear');
  TGeneralController.Instance.InitializeLockupCB(@dbcbDiscPlanEd, 'iK_disc', 'cName_disc');

  Label36.Caption:= FloatToStrF(VolumeForMW, ffFixed, 10, 2) + ' час.';

  if dbcbPlanEd.KeyValue <> NULL then
  begin
    dbcbPlanEd.KeyValue:= NULL;
  end;

  dbcbPlanEd.KeyValue:= TMethodWorkController.Instance.GetPlanMWForPlan(@dbcbPlanEd.ListSource.DataSet, TDBNodeMethodWorkDepartmentObject(self.FrameObject).ik, false, true);
  dbcbDiscPlanEd.KeyValue:= TMethodWorkController.Instance.GetDiscForPlanDep(@dbcbDiscPlanEd.ListSource.DataSet, dbcbPlanEd.ListSource.DataSet.FieldByName('ik_year').AsInteger, TDBNodeMethodWorkDepartmentObject(self.FrameObject).ik, false);

  if chbDiscEd.Checked then
    dbcbDiscPlanEd.KeyValue:= LastKeyValueEd;

  // Факт УМР кафедры
  //TGeneralController.Instance.InitializeLockupCB(@dbcbYearFact, 'ik_year_uch_pl', 'year_value');
  TGeneralController.Instance.InitializeLockupCB(@dbcbYearFact, 'ik_year', 'UchYear');
  TGeneralController.Instance.InitializeLockupCB(@dbcbDisc, 'iK_disc', 'cName_disc');

  Label22.Caption:= FloatToStrF(VolumeForMW, ffFixed, 10, 2) + ' час.';

  //dbcbYearFact.KeyValue:= TMethodWorkController.Instance.GetAllYearsForGos(@dbcbYearFact.ListSource.DataSet, true, NULL);
  dbcbYearFact.KeyValue:= TMethodWorkController.Instance.GetPlanMWForPlan(@dbcbYearFact.ListSource.DataSet, TDBNodeMethodWorkDepartmentObject(self.FrameObject).ik, false, false);
  dbcbDisc.KeyValue:= TMethodWorkController.Instance.GetDiscForGos(@dbcbDisc.ListSource.DataSet, TDBNodeMethodWorkDepartmentObject(self.FrameObject).ik, false);

  if dbcbYearFact.KeyValue <> NULL then
  begin
    dbcbYearFact.KeyValue:= NULL;
  end;

  TMethodWorkController.Instance.GetFilteredFact(TDBNodeMethodWorkDepartmentObject(self.FrameObject).IK, StrToInt(eCountM.Text));
  ChangeLoadPrep;

  if chbFact.Checked then
    dbcbDisc.KeyValue:= LastKeyValueFact;

  // Обеспечение занятий
  TGeneralController.Instance.InitializeLockupCB(@dbcbVidZan, 'iK_vid_zanyat', 'cName_ZAN');

  if dbcbVidZan.KeyValue <> NULL then
  begin
    dbcbVidZan.KeyValue:= NULL;
  end;

  dbcbVidZan.KeyValue:= TMethodWorkController.Instance.GetVidZan(@dbcbVidZan.ListSource.DataSet, 1, true);

  flagWarrantChange:= false;

  {// Сроки действия обеспечения
  TGeneralController.Instance.InitializeLockupCB(@dbcbMW, 'IDWarrant', 'NameWarrant');
  dbcbMW.KeyValue:= TMethodWorkController.Instance.GetWarrant(@dbcbMW.ListSource.DataSet, true);

  flagSrokChange:= false;}

  // ГОС на направление подготовки
  TGeneralController.Instance.InitializeLockupCB(@dbcbSpec, 'ik_spec', 'Cshort_spec');
  TGeneralController.Instance.InitializeLockupCB(@dbcbYearGos, 'IDGos', 'year_value');
  TGeneralController.Instance.InitializeLockupCB(@dbcbItemGos, 'IDContentItemGos', 'NameItemGos');
  TGeneralController.Instance.InitializeLockupCB(@dbcbCklDisc, 'IK_ckl_disc', 'name_ckl_disc');
  TGeneralController.Instance.InitializeLockupCB(@dbcbGrpDisc, 'IK_grp_disc', 'name_grp_disc');
  TGeneralController.Instance.InitializeLockupCB(@dbcbDiscGos, 'iK_disc', 'cName_disc');

  if dbcbSpec.KeyValue <> NULL then
  begin
    dbcbSpec.KeyValue:= NULL;
  end;

  dbcbSpec.KeyValue:= TMethodWorkController.Instance.GetSpec(@dbcbSpec.ListSource.DataSet, false);
  dbcbSpec.KeyValue:= TMethodWorkController.Instance.GetSpecName(TDBNodeMethodWorkDepartmentObject(self.FrameObject).IK);

  GroupBox4.Height:= (Panel6.Height - Panel7.Height) div 2;

  if dbcbSpec.KeyValue <> NULL then
  begin
    dbcbYearGos.KeyValue:= TMethodWorkController.Instance.GetYearGos(@dbcbYearGos.ListSource.DataSet, dbcbSpec.ListSource.DataSet.FieldByName('ik_spec').AsInteger, true);
    dbcbItemGos.KeyValue:= TMethodWorkController.Instance.GetItemGos(@dbcbItemGos.ListSource.DataSet, dbcbYearGos.ListSource.DataSet.FieldByName('IDGos').AsInteger, true);
    dbcbCklDisc.KeyValue:= TMethodWorkController.Instance.getAllDisciplineCycles(@dbcbCklDisc.ListSource.DataSet, true);
    dbcbGrpDisc.KeyValue:= TMethodWorkController.Instance.getAllDisciplineGroups(@dbcbGrpDisc.ListSource.DataSet, true);
    dbcbDiscGos.KeyValue:= TMethodWorkController.Instance.GetCurrentDiscForGos(@dbcbDiscGos.ListSource.DataSet, dbcbYearGos.ListSource.DataSet.FieldByName('IDGos').AsInteger, dbcbCklDisc.ListSource.DataSet.FieldByName('IK_ckl_disc').AsInteger, dbcbGrpDisc.ListSource.DataSet.FieldByName('IK_grp_disc').AsInteger);
  end;

end;

{procedure TfmMethodWorkDep.RGClick(Sender: TObject);
begin
 if (dbcbPlan.KeyValue <> NULL) then
 begin
   if (RG.ItemIndex = 0) then //and (dbcbDiscPlan.KeyValue <> NULL) then
     dsPlanDep.DataSet:= TMethodWorkController.Instance.LoadAutoPlanDepAllDisc(TDBNodeMethodWorkDepartmentObject(self.FrameObject).ik, dbcbPlan.ListSource.DataSet.FieldByName('ik_year').AsInteger);
   ChangeAutoOrCurrentPlan;
 end;
end;}

procedure TfmMethodWorkDep.SetGridWidth(Grid: TStringGrid);
var
  k: integer;
begin
  {if (GetWindowlong(SG.Handle, GWL_STYLE) and WS_VSCROLL) <> 0 then
    k := (Grid.Width - GetSystemMetrics(SM_CXVSCROLL)) div 30
  else} k := (Grid.ClientWidth div 30);
  Grid.ColWidths[0] := 2 * k;
  Grid.ColWidths[1] := 3 * k;
  Grid.ColWidths[2] := 3 * k;
  Grid.ColWidths[3] := 12 * k;
  {if (GetWindowlong(SG.Handle, GWL_STYLE) and WS_VSCROLL) <> 0 then
    Grid.ColWidths[4] := 5 * k + ((Grid.Width - GetSystemMetrics(SM_CXVSCROLL)) mod 30) - 12
  else} Grid.ColWidths[4] := 5 * k + (Grid.ClientWidth mod 30) - 6;
  Grid.ColWidths[5] := 2 * k;
  Grid.ColWidths[6] := 3 * k;
end;

procedure TfmMethodWorkDep.SGDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
  
  procedure FormatNotSelectedCells(Grid : TStringGrid);
  var
    r : TRect;
    F: Word;
  begin
    if (gdSelected in State) or (gdFixed in State) then Exit;

    with Grid do
    begin
      if (Cells[0, ARow] <> '') and not(Assigned(GetRowEntry(ARow))) and (Cells[0, ARow] <> FACT_MSG) and (Cells[1, ARow] = '') then
      begin
        DefaultDrawing := false;
        if ACol = 0 then
        begin
          r := GetRect(0, Rect.Top, Rect.Bottom, ClientWidth);
          Canvas.Pen.Color := clRed;
          Canvas.Brush.Color := clBtnFace;
          Canvas.Font.Color := clBlue;
          Canvas.FillRect(r);
          Canvas.Rectangle(r);
          Canvas.TextOut(((r.Right - r.Left) div 2) - (Canvas.TextWidth(Cells[0, ARow]) div 2) - 1, r.Top + 1, Cells[0, ARow]);
        end;
      end
      else
      begin
        Canvas.Brush.Color:= clWindow;
        r:= Rect;
        Canvas.FillRect(Rect);
        if (ACol = 5) then
        begin
          r.Left:= r.Left+ 9;
          r.Top:= r.Top+ 9;
          r.Right := r.Right- 9;
          r.Bottom := r.Bottom - 9;

          if (Assigned(GetRowEntry(ARow))) and (GetRowEntry(ARow).IsEdition) then
		        F := DFCS_CHECKED
		      else
            F := DFCS_BUTTONCHECK;

          DrawFrameControl(Canvas.Handle, r, DFC_BUTTON, F);
        end
        else
        begin
          if (Assigned(GetRowEntry(ARow))) and (GetRowEntry(ARow).IsPlan) and (Cells[1, ARow+1] <> '') and (StrToDateTime(Cells[1, ARow]) <= StrToDateTime(Cells[1, ARow+1])) then
            Canvas.Font.Color := clRed
          else
            if (Assigned(GetRowEntry(ARow))) and (GetRowEntry(ARow).IsPlan) and (Cells[1, ARow+1] <> '') and (StrToDateTime(Cells[1, ARow]) > StrToDateTime(Cells[1, ARow+1])) then
              Canvas.Font.Color := clGreen
            else
              Canvas.Font.Color := clWindowText;
          F:= DT_LEFT or DT_WORDBREAK or DT_TOP;
          r.Left:= r.Left+2;
          r.Top:= r.Top+2;
          r.Right := r.Right-2;
          r.Bottom := r.Bottom - 2;

          DrawText(Canvas.Handle,PChar(Cells[ACol,ARow]),length(Cells[ACol,ARow]),r,F);
        end;
      end;
    end;
  end;

  procedure SetEditorBounds(Grid: TStringGrid{; Rect: TRect; ARow, ACol: Integer});
  begin
    if IsEditrosNotNil {and (ARow = 0) and (ACol <> 7)} then
    begin
      FEditors[1].SetBounds(0, 0, Grid.ColWidths[0], 21);
      FEditors[2].SetBounds(1 + Grid.ColWidths[0], 0, Grid.ColWidths[1], 21);
      FEditors[3].SetBounds(2 + Grid.ColWidths[0] + Grid.ColWidths[1], 0, Grid.ColWidths[2], 21);
      FEditors[4].SetBounds(3 + Grid.ColWidths[0] + Grid.ColWidths[1] + Grid.ColWidths[2], 0, Grid.ColWidths[3], 21);
      FEditors[5].SetBounds(4 + Grid.ColWidths[0] + Grid.ColWidths[1] + Grid.ColWidths[2] + Grid.ColWidths[3], 0, Grid.ColWidths[4], 21);
      FEditors[6].SetBounds(5 + Grid.ColWidths[0] + Grid.ColWidths[1] + Grid.ColWidths[2] + Grid.ColWidths[3] + Grid.ColWidths[4], 0, Grid.ColWidths[5], 21);
      FEditors[7].SetBounds(6 + Grid.ColWidths[0] + Grid.ColWidths[1] + Grid.ColWidths[2] + Grid.ColWidths[3] + Grid.ColWidths[4] + Grid.ColWidths[5], 0, Grid.ColWidths[6], 21);
      FEditors[7].Parent:= Grid;
      {FEditors[ACol+1].BoundsRect:= Rect;
      FEditors[ACol+1].Visible:= true;}
    end;
  end;

  procedure FormatFixedCells(ACol: Integer; State: TGridDrawState; Grid: TStringGrid; ARow: Integer; Rect: TRect);
  var
    r: TRect;
    F: Word;
  begin
    if (gdFixed in State) then
    begin
      with Grid do
      begin
        r := Rect;
        Canvas.FillRect(Rect);
        F := DT_CENTER or DT_WORDBREAK or DT_TOP;
        //DT_EXPANDTABS or DT_VCENTER or DT_WORDBREAK;
        r.Left := r.Left + 2;
        r.Top := r.Top + 2;
        r.Right := r.Right - 2;
        r.Bottom := r.Bottom - 2;
        Canvas.Font.Style := Canvas.Font.Style + [fsBold];
        DrawText(Canvas.Handle, PChar(Cells[ACol, ARow]), length(Cells[ACol, ARow]), r, F);
      end;
    end;
  end;

  procedure FormatSelectedCells(Rect: TRect; ARow: Integer; State: TGridDrawState; ACol: Integer; Grid: TStringGrid);
  var
    r: TRect;
    F: Word;
  begin
    if (gdSelected in State) then
      with Grid do
        if (Cells[0, ARow] <> '') and not(Assigned(GetRowEntry(ARow))) and (Cells[0, ARow] <> FACT_MSG) and (Cells[1, ARow] = '') then
        begin
          DefaultDrawing := false;
          if ACol = 0 then
          begin
            r := GetRect(0, Rect.Top, Rect.Bottom, ClientWidth);
            Canvas.Brush.Color := clHighlight;
            Canvas.FillRect(r);
            Canvas.Rectangle(r);
            Canvas.Font.Color := clHighLightText;
            Canvas.TextOut(((r.Right - r.Left) div 2) - (Canvas.TextWidth(Cells[0, ARow]) div 2) - 1, r.Top + 1, Cells[0, ARow]);
          end;
        end
        else
        begin
          Canvas.Brush.Color:= clHighlight;
          r:= Rect;
          Canvas.FillRect(Rect);
          if (ACol = 5) then
          begin
            r.Left:= r.Left+ 9;
            r.Top:= r.Top+ 9;
            r.Right := r.Right- 9;
            r.Bottom := r.Bottom - 9;

            if (Assigned(GetRowEntry(ARow))) and (GetRowEntry(ARow).IsEdition) then
		          F := DFCS_CHECKED
		        else
              F := DFCS_BUTTONCHECK;

            DrawFrameControl(Canvas.Handle, r, DFC_BUTTON, F);
          end
          else
          begin
            Canvas.Font.Color := clHighLightText;
            F:= DT_LEFT or DT_WORDBREAK or DT_TOP;
            r.Left:= r.Left+2;
            r.Top:= r.Top+2;
            r.Right := r.Right-2;
            r.Bottom := r.Bottom - 2;

            DrawText(Canvas.Handle,PChar(Cells[ACol,ARow]),length(Cells[ACol,ARow]),r,F);
          end;
        end;
  end;

var
  r: TRect;
  Grid : TStringGrid;
begin

  Grid :=  (Sender as TStringGrid);
  Grid.DefaultDrawing := true;

  // Установка ширины столбцов
  SetGridWidth(Grid);

  // Установка ширины редакторов
  SetEditorBounds(Grid);

  // Установить форматирование для фиксированных ячеек
  FormatFixedCells(ACol, State, Grid, ARow, Rect);

  // Установить форматирование не выделенных, не фиксированных ячеек
  FormatNotSelectedCells(Grid);

  // Установить форматирование выделенных ячеек
  FormatSelectedCells(Rect, ARow, State, ACol, Grid);

end;

procedure TfmMethodWorkDep.SGSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  inherited;
  (Sender as TStringGrid).Hint:= (Sender as TStringGrid).Cells[ACol,ARow];
  s:= ARow;
end;

procedure TfmMethodWorkDep.UpdateStringGrid;
var
  i,j,f,k: integer;
  str: string;
begin
  ClearRowObjects;

  Assert(Assigned(FEditors[1]));
  for k := 0 to SG.ColCount-1 do
    for f := 2 to SG.RowCount-1 do
      SG.Cells[k,f]:= '';
  if dsPlanDep.DataSet.RecordCount = 0 then
    SG.RowCount:= dsPlanDep.DataSet.RecordCount + 3
  else SG.RowCount:= dsPlanDep.DataSet.RecordCount + 2;
  i:= 2; //строка
  j:= 0; //столбец
  str:= '0';
  for k:= Low(PlanVolumeForMW) to High(PlanVolumeForMW) do
    PlanVolumeForMW[k]:= 0;

  k:= 0;
  f:= 0;
      dsPlanDep.DataSet.First;
      while not dsPlanDep.DataSet.Eof do
      begin
        if (Assigned(GetRowEntry(i-1))) and (GetRowEntry(i-1).IsPlan) and (dsPlanDep.DataSet.FieldByName('Bit_plan_fact').AsBoolean)
           and (FEditors[1].ItemIndex <> 1) then
        begin
          SG.Cells[j,i]:= FACT_MSG;
          SG.RowCount:= SG.RowCount + 1;
        end else
        if (dsPlanDep.DataSet.FieldByName('cName_disc').AsString <> str)and(dsPlanDep.DataSet.FieldByName('cName_disc').AsString <> '') then
        begin
          SG.Cells[j,i]:= dsPlanDep.DataSet.FieldByName('cName_disc').AsString;
          str:= dsPlanDep.DataSet.FieldByName('cName_disc').AsString;
          SG.RowCount:= SG.RowCount + 1;
        end
        else
        begin
          SG.Objects[j, i] := TPlanEntryViewRow.Create(dsPlanDep.DataSet.FieldByName('Bit_plan_fact').AsBoolean, dsPlanDep.DataSet.FieldByName('CurrentBitEdition').AsBoolean);
          if (dsPlanDep.DataSet.FieldByName('PercentCompletion').Value <> NULL) and (dsPlanDep.DataSet.FieldByName('IDMethodEditionPlan').Value = NULL) then
            GetRowEntry(i).Percent := dsPlanDep.DataSet.FieldByName('PercentCompletion').AsInteger;
          SG.Cells[j,i] := GetRowEntry(i).GetFormatedRow;

          if GetRowEntry(i).IsPlan then
            inc(k)
          else inc(f);

          SG.Cells[j+1,i]:= dsPlanDep.DataSet.FieldByName('DateTransitionInState').AsString;
          SG.Cells[j+2,i]:= dsPlanDep.DataSet.FieldByName('NameWarrant').AsString;
          SG.Cells[j+3,i]:= dsPlanDep.DataSet.FieldByName('NameWork').AsString;
          SG.Cells[j+4,i]:= dsPlanDep.DataSet.FieldByName('NameMethodEdition').AsString;
          SG.Cells[j+5,i] := GetRowEntry(i).GetFormatedRowEd;
          SG.Cells[j+6,i]:= dsPlanDep.DataSet.FieldByName('Pr').AsString;
          SG.Cells[j+7,i]:= dsPlanDep.DataSet.FieldByName('IDMethodEdition').AsString;
          str:= dsPlanDep.DataSet.FieldByName('cName_disc').AsString;
          dsPlanDep.DataSet.Next;
        end;
        inc(i);
      end;
  if (Assigned(GetRowEntry(i-1))) and (GetRowEntry(i-1).IsPlan) and (FEditors[1].ItemIndex <> 1) then
  begin
    SG.RowCount:= SG.RowCount + 1;
    SG.Cells[j,i]:= FACT_MSG;
  end;

  PlanVolumeForMW:= TMethodWorkController.Instance.GetPlanVolumeForMW(dsPlanDep.DataSet);
  Label26.Caption:= FloatToStrF(PlanVolumeForMW[0], ffFixed, 10, 2) + ' час.';
  Label30.Caption:= FloatToStrF(PlanVolumeForMW[1], ffFixed, 10, 2) + ' час.';
  Label31.Caption:= FloatToStrF(PlanVolumeForMW[2], ffFixed, 10, 2) + ' час.';
  Label47.Caption:= FloatToStrF(PlanVolumeForMW[3], ffFixed, 10, 2) + ' час.';
  if PlanVolumeForMW[0] > VolumeForMW then
    Label26.Font.Color:= clFuchsia
  else Label26.Font.Color:= clMaroon;
  if PlanVolumeForMW[1] > VolumeForMW then
    Label30.Font.Color:= clFuchsia
  else Label30.Font.Color:= clMaroon;
  Label50.Caption:= IntToStr(k);
  Label51.Caption:= IntToStr(f);
end;

(*procedure TfmMethodWorkDep.ChangeAutoOrCurrentPlan;
var
  PlanVolumeForMW: TDoubleArray;
begin
if RG.ItemIndex = 0 then //Автоматически сформированый
 begin
    {if (dbcbDiscPlan.Enabled = true) and (dbcbDiscPlan.KeyValue <> NULL) then
    begin
      // загрузка плана по конкретной дисциплине
      //dsPlanDep.DataSet:= TMethodWorkController.Instance.LoadAutoPlanDepConcrDisc(TDBNodeMethodWorkDepartmentObject(self.FrameObject).ik, dbcbPlan.ListSource.DataSet.FieldByName('ik_year').AsInteger, LastNormOfTime, dbcbDiscPlan.ListSource.DataSet.FieldByName('iK_disc').AsInteger);
      dsPlanDep.DataSet.Filter:= 'ik_disc = ' + dbcbDiscPlan.ListSource.DataSet.FieldByName('iK_disc').AsString;
      dsPlanDep.DataSet.Filtered:= true;
    end
    else}
    begin
      // загрузка плана по всем дисциплинам
      //dsPlanDep.DataSet:= TMethodWorkController.Instance.LoadAutoPlanDepAllDisc(TDBNodeMethodWorkDepartmentObject(self.FrameObject).ik, dbcbPlan.ListSource.DataSet.FieldByName('ik_year').AsInteger, LastNormOfTime);
      dsPlanDep.DataSet.Filtered:= false;
    end;
  frmMain.StatusBar1.Panels[1].Text:= 'Автоматически сформированный план УМР кафедры';
  //dbgPlanDep.RowHeight:= 0;
  //dbgPlanDep.RowLines:= 0;
  Panel13.Visible:= false;
 end
else //Текущий
 begin
 //TMethodWorkController.Instance.GetPlanCloseFact;
    {if (dbcbDiscPlan.Enabled = true) and (dbcbDiscPlan.KeyValue <> NULL) then
    begin
      // загрузка плана по конкретной дисциплине
      dsPlanDep.DataSet:= TMethodWorkController.Instance.LoadPlanDepForDisc(dbcbDiscPlan.ListSource.DataSet.FieldByName('iK_disc').AsInteger, dbcbPlan.ListSource.DataSet.FieldByName('IDPlanMW').AsInteger);
    end
    else}
    begin
      // загрузка плана по всем дисциплинам
      dsPlanDep.DataSet:= TMethodWorkController.Instance.LoadPlanDep(dbcbPlan.ListSource.DataSet.FieldByName('IDPlanMW').AsInteger);
    end;
  PlanVolumeForMW:= TMethodWorkController.Instance.GetFactVolumeForMW(dsPlanDep.DataSet);
  Label27.Caption:= FloatToStrF(PlanVolumeForMW[0], ffFixed, 10, 2) + ' час.';
  Label31.Caption:= FloatToStrF(PlanVolumeForMW[1], ffFixed, 10, 2) + ' час.';

  frmMain.StatusBar1.Panels[1].Text:= 'Текущий план УМР кафедры';
  //dbgPlanDep.RowHeight:= 5;
  //dbgPlanDep.RowLines:= 2;
  Panel13.Visible:= true;
 end;
end;*)

procedure TfmMethodWorkDep.ChangeLoadPlanEdition;
var
  PlanEdVolumeForMW: TDoubleArray;
begin
   PlanEdVolumeForMW:= TMethodWorkController.Instance.GetFactVolumeForMW(dsPlanEdDep.DataSet);
   Label35.Caption:= FloatToStrF(PlanEdVolumeForMW[0], ffFixed, 10, 2) + ' час.';
   Label38.Caption:= FloatToStrF(PlanEdVolumeForMW[1], ffFixed, 10, 2) + ' час.';
end;

procedure TfmMethodWorkDep.ChangeLoadPrep;
var
  FactVolumeForMW: TDoubleArray;
begin
  if (dbcbDisc.Enabled = true) and (dbcbDisc.KeyValue <> NULL) then
    // загрузка факта по конкретной дисциплине
    dsFactDep.DataSet:= TMethodWorkController.Instance.LoadFactDepPrepAll(dbcbDisc.ListSource.DataSet.FieldByName('iK_disc').AsInteger, '')
  else
    dsFactDep.DataSet:= TMethodWorkController.Instance.LoadFactDepPrepAllDiscAll(TDBNodeMethodWorkDepartmentObject(self.FrameObject).IK, '');

  if (dbcbYearFact.KeyValue <> NULL) then
  begin
    dsFactDep.DataSet.Filter:= 'ik_year = ' + dbcbYearFact.ListSource.DataSet.FieldByName('ik_year').AsString;
    dsFactDep.DataSet.Filtered:= true;
  end
  else dsFactDep.DataSet.Filtered:= false;

  //выполненный объем УМР
   FactVolumeForMW:= TMethodWorkController.Instance.GetFactVolumeForMW(dsFactDep.DataSet);
   Label21.Caption:= FloatToStrF(FactVolumeForMW[0], ffFixed, 10, 2) + ' час.';
   Label24.Caption:= FloatToStrF(FactVolumeForMW[1], ffFixed, 10, 2) + ' час.';

   dbgFact.DataSource.DataSet.First;
end;

procedure TfmMethodWorkDep.actAddDiscGosExecute(Sender: TObject);
begin
  frmMethodWorkAddContentDiscOnGos:= TfrmMethodWorkAddContentDiscOnGos.CreateDialog(nil, self.Connection, nil);
try
  frmMethodWorkAddContentDiscOnGos.IK:= -1;
  frmMethodWorkAddContentDiscOnGos.Read(TDBNodeMethodWorkDepartmentObject(self.FrameObject).ik);
  frmMethodWorkAddContentDiscOnGos.IsModified:= false;
  frmMethodWorkAddContentDiscOnGos.dbcbYear.KeyValue:= dbcbYearGos.KeyValue;
  if (frmMethodWorkAddContentDiscOnGos.ShowModal() = mrOk) or (frmMethodWorkAddContentDiscOnGos.bbApply.Tag = 1) then
  begin
    dbcbYearGos.KeyValue:= frmMethodWorkAddContentDiscOnGos.dbcbYear.KeyValue;
    dbcbCklDisc.KeyValue:= frmMethodWorkAddContentDiscOnGos.dbcbCklDisc.KeyValue;
    dbcbGrpDisc.KeyValue:= frmMethodWorkAddContentDiscOnGos.dbcbGrpDisc.KeyValue;
    dbcbDiscGos.KeyValue:= frmMethodWorkAddContentDiscOnGos.dbcbDiscGos.KeyValue;
  end;
finally
  frmMethodWorkAddContentDiscOnGos.Free;
end;
end;

procedure TfmMethodWorkDep.actAddGosExecute(Sender: TObject);
begin
  frmMethodWorkAddGos:= TfrmMethodWorkAddGos.CreateDialog(nil, self.Connection, nil);
try
  frmMethodWorkAddGos.IK:= TDBNodeMethodWorkDepartmentObject(self.FrameObject).ik;
  frmMethodWorkAddGos.Label4.Caption:= dbcbSpec.Text;
  frmMethodWorkAddGos.Label4.Tag:= dbcbSpec.KeyValue;
  frmMethodWorkAddGos.Read;
  frmMethodWorkAddGos.IsModified:= false;
  if (frmMethodWorkAddGos.ShowModal() = mrOk) or (frmMethodWorkAddGos.bbApply.Tag = 1) then
  begin
    TGeneralController.Instance.CloseLockupCB(@dbcbYearGos);
    dbcbYearGos.KeyValue:= TMethodWorkController.Instance.GetYearGos(@dbcbYearGos.ListSource.DataSet, dbcbSpec.ListSource.DataSet.FieldByName('ik_spec').AsInteger, true);
    dbcbYearGos.KeyValue:= frmMethodWorkAddGos.LastGosIK;
  end;
finally
  frmMethodWorkAddGos.Free;
end;
end;

procedure TfmMethodWorkDep.actAddGosUpdate(Sender: TObject);
begin
  if (dbcbSpec.ListSource.DataSet.Active) then
    (Sender as TAction).Enabled:= dbcbSpec.KeyValue <> NULL
  else (Sender as TAction).Enabled:= false;
end;

procedure TfmMethodWorkDep.actAddItemGosExecute(Sender: TObject);
begin
  frmMethodWorkAddContentItemGos:= TfrmMethodWorkAddContentItemGos.CreateDialog(nil, self.Connection, nil);
try
  frmMethodWorkAddContentItemGos.IK:= -1;
  frmMethodWorkAddContentItemGos.Read(TDBNodeMethodWorkDepartmentObject(self.FrameObject).ik);
  frmMethodWorkAddContentItemGos.IsModified:= false;
  frmMethodWorkAddContentItemGos.dbcbSpec.KeyValue:= dbcbSpec.KeyValue;
  frmMethodWorkAddContentItemGos.dbcbYear.KeyValue:= dbcbYearGos.KeyValue;
  if (frmMethodWorkAddContentItemGos.ShowModal() = mrOk) or (frmMethodWorkAddContentItemGos.bbApply.Tag = 1) then
  begin
    TGeneralController.Instance.CloseLockupCB(@dbcbYearGos);
    dbcbYearGos.KeyValue:= TMethodWorkController.Instance.GetYearGos(@dbcbYearGos.ListSource.DataSet, dbcbSpec.KeyValue, true);
    dbcbYearGos.KeyValue:= frmMethodWorkAddContentItemGos.dbcbYear.KeyValue;
    dbcbItemGos.KeyValue:= frmMethodWorkAddContentItemGos.fLastAddItemGos;
  end;
finally
  frmMethodWorkAddContentItemGos.Free;
end;
end;

procedure TfmMethodWorkDep.actAddItemGosUpdate(Sender: TObject);
begin
  if (dbcbYearGos.ListSource.DataSet.Active) then
    (Sender as TAction).Enabled:= dbcbYearGos.KeyValue <> NULL
  else (Sender as TAction).Enabled:= false;
end;

procedure TfmMethodWorkDep.actAddMWExecute(Sender: TObject);
begin
{  frmMethodWorkAddMWvidZan:= TfrmMethodWorkAddMWvidZan.CreateDialog(nil, self.Connection, nil);
try
  frmMethodWorkAddMWvidZan.IK:= dbcbVidZan.KeyValue;
  //DSMethodWork.DataSet:= nil;
  frmMethodWorkAddMWvidZan.Read;
  if (frmMethodWorkAddMWvidZan.ShowModal() = mrOk) or (frmMethodWorkAddMWvidZan.bbApply.Tag = 1) then
  begin
    dbcbVidZanKeyValueChanged(nil);
    dbcbVidZan.KeyValue:= frmMethodWorkAddMWvidZan.IK;
  end
  else dbcbVidZanKeyValueChanged(nil);
finally
  frmMethodWorkAddMWvidZan.Free;
end; }
end;

procedure TfmMethodWorkDep.actAddMWUpdate(Sender: TObject);
begin
{  if (dbcbVidZan.ListSource.DataSet.Active) then
    (Sender as TAction).Enabled:= dbcbVidZan.KeyValue <> NULL
  else (Sender as TAction).Enabled:= false; }
end;

procedure TfmMethodWorkDep.actAddPlanExecute(Sender: TObject);
begin
  frmMethodWorkAddPlanDep:= TfrmMethodWorkAddPlanDep.CreateDialog(nil, self.Connection, nil);
try
  frmMethodWorkAddPlanDep.IK:= TDBNodeMethodWorkDepartmentObject(self.FrameObject).ik;
  frmMethodWorkAddPlanDep.LastPlanIK:= -1;
  frmMethodWorkAddPlanDep.Read;
  frmMethodWorkAddPlanDep.Caption:= 'Добавление плана УМР кафедры';
  frmMethodWorkAddPlanDep.Label2.Visible:= false;
  frmMethodWorkAddPlanDep.Label5.Visible:= false;
  frmMethodWorkAddPlanDep.Label6.Visible:= false;
  frmMethodWorkAddPlanDep.dbdtDate.Visible:= false;
  frmMethodWorkAddPlanDep.dbeProtocol.Visible:= false;
  frmMethodWorkAddPlanDep.dbcbTypeRep.Visible:= false;
  frmMethodWorkAddPlanDep.Label7.Visible:= false;
  frmMethodWorkAddPlanDep.Label8.Visible:= false;
  frmMethodWorkAddPlanDep.Label9.Visible:= false;

  frmMethodWorkAddPlanDep.IsModified:= false;
  if (frmMethodWorkAddPlanDep.ShowModal() = mrOk) then
  begin
    TGeneralController.Instance.CloseLockupCB(@dbcbPlan);
    dbcbPlan.KeyValue:= TMethodWorkController.Instance.GetPlanMWForPlan(@dbcbPlan.ListSource.DataSet, TDBNodeMethodWorkDepartmentObject(self.FrameObject).ik, false, true);
    dbcbPlan.KeyValue:= frmMethodWorkAddPlanDep.LastPlanIK;
  end;
finally
  frmMethodWorkAddPlanDep.Free;
end;
end;

procedure TfmMethodWorkDep.actAddSrokExecute(Sender: TObject);
begin
{  frmMethodWorkSrokMW:= TfrmMethodWorkSrokMW.CreateDialog(nil, self.Connection, nil);
try
  frmMethodWorkSrokMW.IK:= dbcbMW.KeyValue;
  dsSrok.DataSet:= nil;
  frmMethodWorkSrokMW.Read;
  if (frmMethodWorkSrokMW.ShowModal() = mrOk) or (frmMethodWorkSrokMW.bbApply.Tag = 1) then
  begin
    dbcbMWKeyValueChanged(nil);
    dbcbMW.KeyValue:= frmMethodWorkSrokMW.IK;
  end
  else dbcbMWKeyValueChanged(nil);
finally
  frmMethodWorkSrokMW.Free;
end; }

  //dsSrok.DataSet.First;
  //dsSrok.DataSet.Insert;
end;

procedure TfmMethodWorkDep.actAddSrokUpdate(Sender: TObject);
begin
  {if dsSrok.DataSet <> nil then
    actAddSrok.Enabled:= (dsSrok.DataSet.Active) and (dbcbMW.KeyValue <> NULL)
  else actAddSrok.Enabled:= false;}
end;

procedure TfmMethodWorkDep.actAddWarrantExecute(Sender: TObject);
begin
 dsWarrant.DataSet.First;
 dsWarrant.DataSet.Insert;
 //flagWarrantChange:= true;
end;

procedure TfmMethodWorkDep.actAddWarrantUpdate(Sender: TObject);
begin
  if DSWarrant.DataSet <> nil then
    actAddWarrant.Enabled:= (DSWarrant.DataSet.Active) and (dbcbVidZan.KeyValue <> NULL)
  else actAddWarrant.Enabled:= false;
end;

procedure TfmMethodWorkDep.actDelDiscGosExecute(Sender: TObject);
begin
  if (Application.MessageBox('Вы уверены, что хотите удалить выбранную дисциплину ГОСа?'
   ,'Удаление дисциплины ГОСа', mb_YesNo) = mrYes) then
  begin
    TMethodWorkController.Instance.DeleteDiscGos(dsDiscGos.DataSet.FieldByName('IDContentDiscOnGos').AsInteger);
    TGeneralController.Instance.CloseLockupCB(@dbcbDiscGos);
    dbcbDiscGos.KeyValue:= TMethodWorkController.Instance.GetCurrentDiscForGos(@dbcbDiscGos.ListSource.DataSet, dbcbYearGos.ListSource.DataSet.FieldByName('IDGos').AsInteger, dbcbCklDisc.ListSource.DataSet.FieldByName('IK_ckl_disc').AsInteger, dbcbGrpDisc.ListSource.DataSet.FieldByName('IK_grp_disc').AsInteger);
  end;
end;

procedure TfmMethodWorkDep.actDelGosExecute(Sender: TObject);
begin
  if (Application.MessageBox('Вы уверены, что хотите удалить выбранный ГОС?' + #10#13#10#13 +
   'При этом будет удалено всё содержимое ГОСа за данный год!'
   ,'Удаление ГОС', mb_YesNo) = mrYes) then
  begin
    TMethodWorkController.Instance.DeleteGos(dbcbYearGos.ListSource.DataSet.FieldByName('IDGos').AsInteger);
    TGeneralController.Instance.CloseLockupCB(@dbcbYearGos);
    dbcbYearGos.KeyValue:= TMethodWorkController.Instance.GetYearGos(@dbcbYearGos.ListSource.DataSet, dbcbSpec.KeyValue, true);
    end;
end;

procedure TfmMethodWorkDep.actDelGosUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= (dbcbYearGos.KeyValue <> NULL);
end;

procedure TfmMethodWorkDep.actDelItemGosExecute(Sender: TObject);
begin
  if (Application.MessageBox('Вы уверены, что хотите удалить выбранный пункт ГОСа?'
   ,'Удаление пункта ГОСа', mb_YesNo) = mrYes) then
  begin
    TMethodWorkController.Instance.DeleteItemGos(dbcbItemGos.ListSource.DataSet.FieldByName('IDContentItemGos').AsInteger);
    TGeneralController.Instance.CloseLockupCB(@dbcbYearGos);
    dbcbYearGos.KeyValue:= TMethodWorkController.Instance.GetYearGos(@dbcbYearGos.ListSource.DataSet, dbcbSpec.KeyValue, true);
    end;
end;

procedure TfmMethodWorkDep.actDelPlanExecute(Sender: TObject);
begin
  if (Application.MessageBox('Вы уверены, что хотите удалить выбранный план УМР?' + #10#13#10#13 +
   'При этом будут удалены имеющиеся планы УМР преподавателей за данный учебный год!'
   ,'Удаление плана УМР кафедры', mb_YesNo) = mrYes) then
  begin
    TMethodWorkController.Instance.DeletePlanDep(dbcbPlan.ListSource.DataSet.FieldByName('IDPlanMW').AsInteger);
    TGeneralController.Instance.CloseLockupCB(@dbcbPlan);
    dbcbPlan.KeyValue:= TMethodWorkController.Instance.GetPlanMWForPlan(@dbcbPlan.ListSource.DataSet, TDBNodeMethodWorkDepartmentObject(self.FrameObject).ik, false, true);
    end;
end;

procedure TfmMethodWorkDep.actDelPlanUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= (dbcbPlan.KeyValue <> NULL);
end;

procedure TfmMethodWorkDep.actEditDiscGosExecute(Sender: TObject);
begin
  frmMethodWorkAddContentDiscOnGos:= TfrmMethodWorkAddContentDiscOnGos.CreateDialog(nil, self.Connection, nil);
try
  frmMethodWorkAddContentDiscOnGos.IK:= dsDiscGos.DataSet.FieldByName('IDContentDiscOnGos').AsInteger;
  frmMethodWorkAddContentDiscOnGos.Read(TDBNodeMethodWorkDepartmentObject(self.FrameObject).ik);
  frmMethodWorkAddContentDiscOnGos.dbcbYear.KeyValue:= dbcbYearGos.KeyValue;
  frmMethodWorkAddContentDiscOnGos.dbcbCklDisc.KeyValue:= dsDiscGos.DataSet.FieldByName('IK_ckl_disc').AsInteger;
  if dsDiscGos.DataSet.FieldByName('IK_grp_disc').Value = NULL then frmMethodWorkAddContentDiscOnGos.dbcbGrpDisc.KeyValue:= NULL
  else frmMethodWorkAddContentDiscOnGos.dbcbGrpDisc.KeyValue:= dsDiscGos.DataSet.FieldByName('IK_grp_disc').AsInteger;;
  frmMethodWorkAddContentDiscOnGos.dbcbDiscGos.KeyValue:= TMethodWorkController.Instance.GetDiscForGos(@frmMethodWorkAddContentDiscOnGos.dbcbDiscGos.ListSource.DataSet, 0, true);
  frmMethodWorkAddContentDiscOnGos.dbcbDiscGos.KeyValue:= dbcbDiscGos.KeyValue;
  frmMethodWorkAddContentDiscOnGos.dbeCode.Text:= Label13.Caption;
  frmMethodWorkAddContentDiscOnGos.dbeHour.Text:= Label16.Caption;
  if (frmMethodWorkAddContentDiscOnGos.ShowModal() = mrOk) or (frmMethodWorkAddContentDiscOnGos.bbApply.Tag = 1) then
  begin
    dbcbCklDisc.KeyValue:= frmMethodWorkAddContentDiscOnGos.dbcbCklDisc.KeyValue;
    dbcbGrpDisc.KeyValue:= frmMethodWorkAddContentDiscOnGos.dbcbGrpDisc.KeyValue;
    TGeneralController.Instance.CloseLockupCB(@dbcbDiscGos);
    dbcbDiscGos.KeyValue:= TMethodWorkController.Instance.GetCurrentDiscForGos(@dbcbDiscGos.ListSource.DataSet, dbcbYearGos.ListSource.DataSet.FieldByName('IDGos').AsInteger, dbcbCklDisc.ListSource.DataSet.FieldByName('IK_ckl_disc').AsInteger, dbcbGrpDisc.ListSource.DataSet.FieldByName('IK_grp_disc').AsInteger);
    dbcbDiscGos.KeyValue:= frmMethodWorkAddContentDiscOnGos.dbcbDiscGos.KeyValue;
  end;
finally
  frmMethodWorkAddContentDiscOnGos.Free;
end;
end;

procedure TfmMethodWorkDep.actEditDiscGosUpdate(Sender: TObject);
begin
  if (dbcbDiscGos.ListSource.DataSet.Active) then
    (Sender as TAction).Enabled:= dbcbDiscGos.KeyValue <> NULL
  else (Sender as TAction).Enabled:= false;
end;

procedure TfmMethodWorkDep.actEditItemGosExecute(Sender: TObject);
begin
  frmMethodWorkAddContentItemGos:= TfrmMethodWorkAddContentItemGos.CreateDialog(nil, self.Connection, nil);
try
  frmMethodWorkAddContentItemGos.IK:= dsItemGos.DataSet.FieldByName('IDContentItemGos').AsInteger;
  frmMethodWorkAddContentItemGos.Read(TDBNodeMethodWorkDepartmentObject(self.FrameObject).ik);
  frmMethodWorkAddContentItemGos.dbcbYear.KeyValue:= dbcbYearGos.KeyValue;
  frmMethodWorkAddContentItemGos.dbcbItemGos.KeyValue:= dbcbItemGos.KeyValue;
  if (frmMethodWorkAddContentItemGos.ShowModal() = mrOk) or (frmMethodWorkAddContentItemGos.bbApply.Tag = 1) then
  begin
    TGeneralController.Instance.CloseLockupCB(@dbcbYearGos);
    dbcbYearGos.KeyValue:= TMethodWorkController.Instance.GetYearGos(@dbcbYearGos.ListSource.DataSet, dbcbSpec.KeyValue, true);
    dbcbYearGos.KeyValue:= frmMethodWorkAddContentItemGos.dbcbYear.KeyValue;
    dbcbItemGos.KeyValue:= frmMethodWorkAddContentItemGos.fLastAddItemGos;
  end;
finally
  frmMethodWorkAddContentItemGos.Free;
end;
end;

procedure TfmMethodWorkDep.actEditItemGosUpdate(Sender: TObject);
begin
  if (dbcbItemGos.ListSource.DataSet.Active) then
    (Sender as TAction).Enabled:= dbcbItemGos.KeyValue <> NULL
  else (Sender as TAction).Enabled:= false;
end;

procedure TfmMethodWorkDep.actEditPlanExecute(Sender: TObject);
begin
  frmMethodWorkAddPlanDep:= TfrmMethodWorkAddPlanDep.CreateDialog(nil, self.Connection, nil);
try
  frmMethodWorkAddPlanDep.IK:= TDBNodeMethodWorkDepartmentObject(self.FrameObject).ik;
  frmMethodWorkAddPlanDep.LastPlanIK:= dbcbPlan.ListSource.DataSet.FieldByName('IDPlanMW').AsInteger;
  frmMethodWorkAddPlanDep.Read;
  frmMethodWorkAddPlanDep.Caption:= 'Утверждение плана УМР кафедры';
  frmMethodWorkAddPlanDep.dbcbYear.KeyValue:= dbcbPlan.KeyValue;
  frmMethodWorkAddPlanDep.dbcbYear.Enabled:= false;
  if dbeProtocol.Text <> '' then
  begin
    frmMethodWorkAddPlanDep.dbdtDate.Text:= dbdtDate.Text;
    frmMethodWorkAddPlanDep.dbcbTypeRep.KeyValue:= dbcbTypeRep.KeyValue;
    frmMethodWorkAddPlanDep.dbeProtocol.Text:= dbeProtocol.Text;
  end;
  frmMethodWorkAddPlanDep.IsModified:= false;
  if (frmMethodWorkAddPlanDep.ShowModal() = mrOk) then
  begin
    //dbdtDate.Text:= frmMethodWorkAddPlanDep.dbdtDate.Text;
    //dbcbTypeRep.KeyValue:= frmMethodWorkAddPlanDep.dbcbTypeRep.KeyValue;
    //dbeProtocol.Text:= frmMethodWorkAddPlanDep.dbeProtocol.Text;
    TGeneralController.Instance.CloseLockupCB(@dbcbPlan);
    dbcbPlan.KeyValue:= TMethodWorkController.Instance.GetPlanMWForPlan(@dbcbPlan.ListSource.DataSet, TDBNodeMethodWorkDepartmentObject(self.FrameObject).ik, false, true);
    dbcbPlan.KeyValue:= frmMethodWorkAddPlanDep.LastPlanIK;
  end;
finally
  frmMethodWorkAddPlanDep.Free;
end;
end;

procedure TfmMethodWorkDep.actExportFactExecute(Sender: TObject);
var
  Report: TReportBase;
  frmWaiting: TfrmWaiting;
begin
  Report := TReportBase.CreateReport(TDepFactReport);
  Report.FreeOnComplete := true;
  frmWaiting := TfrmWaiting.Create(self);

  try
    //Report.OnReportProgress := ReportProgress;
    Report.OnExecuteError := ExecuteError;
    Report.ReportTemplate :=  ExtractFilePath(Application.ExeName) + 'reports\MW_CurrentFactDep.xlt';
    //Form2.pbReportStep.Max := Report.TotalSteps;
    TDepPlanReport(Report).KafIK:= TDBNodeMethodWorkDepartmentObject(self.FrameObject).ik;
    TDepPlanReport(Report).YearPlan:= dbcbYearFact.Text;
    TDepPlanReport(Report).YearVolMW:= VolumeForMW;

    frmWaiting.ActionComponentUI1.ActionComponent:=Report;
    frmWaiting.Show;
    Report.BuildReport;
  finally
    frmWaiting.Free;
  end;
end;

procedure TfmMethodWorkDep.actExportFactUpdate(Sender: TObject);
begin
   if (dsFactDep.DataSet <> nil) and (dbcbYearFact.KeyValue <> NULL) then
   begin
    if dsFactDep.DataSet.Active then
      (Sender as TAction).Enabled:= dsFactDep.DataSet.RecordCount > 0
    else (Sender as TAction).Enabled:= false;
   end
   else (Sender as TAction).Enabled:= false;
end;

procedure TfmMethodWorkDep.actExportPlanEdExecute(Sender: TObject);
var
  Report: TReportBase;
  frmWaiting: TfrmWaiting;
begin
  Report := TReportBase.CreateReport(TDepPlanEditionReport);
  Report.FreeOnComplete := true;
  frmWaiting := TfrmWaiting.Create(self);

  try
    //Report.OnReportProgress := ReportProgress;
    Report.OnExecuteError := ExecuteError;
    Report.ReportTemplate :=  ExtractFilePath(Application.ExeName) + 'reports\MW_CurrentPlanEditionDep.xlt';
    //Form2.pbReportStep.Max := Report.TotalSteps;
    TDepPlanReport(Report).KafIK:= TDBNodeMethodWorkDepartmentObject(self.FrameObject).ik;
    TDepPlanReport(Report).YearPlan:= dbcbPlanEd.Text;
    TDepPlanReport(Report).YearVolMW:= VolumeForMW;

    frmWaiting.ActionComponentUI1.ActionComponent:=Report;
    frmWaiting.Show;
    Report.BuildReport;
  finally
    frmWaiting.Free;
  end;
end;

procedure TfmMethodWorkDep.actExportPlanEdUpdate(Sender: TObject);
begin
   if (dsPlanEdDep.DataSet <> nil) then
   begin
    if dsPlanEdDep.DataSet.Active then
      (Sender as TAction).Enabled:= dsPlanEdDep.DataSet.RecordCount > 0
    else (Sender as TAction).Enabled:= false;
   end
   else (Sender as TAction).Enabled:= false;
end;

procedure TfmMethodWorkDep.actExportPlanExecute(Sender: TObject);
var
  Report: TReportBase;
  frmWaiting: TfrmWaiting;
begin
  Report := TReportBase.CreateReport(TDepPlanReport);
  Report.FreeOnComplete := true;
  frmWaiting := TfrmWaiting.Create(self);

  try
    //Report.OnReportProgress := ReportProgress;
    Report.OnExecuteError := ExecuteError;
    Report.ReportTemplate :=  ExtractFilePath(Application.ExeName) + 'reports\MW_CurrentPlanDep.xlt';
    //Form2.pbReportStep.Max := Report.TotalSteps;
    TDepPlanReport(Report).KafIK:= TDBNodeMethodWorkDepartmentObject(self.FrameObject).ik;
    TDepPlanReport(Report).YearPlan:= dbcbPlan.Text;
    TDepPlanReport(Report).YearVolMW:= VolumeForMW;
    
    frmWaiting.ActionComponentUI1.ActionComponent:=Report;
    frmWaiting.Show;
    Report.BuildReport;
  finally
    frmWaiting.Free;
  end;
end;

procedure TfmMethodWorkDep.actExportPlanUpdate(Sender: TObject);
begin
   if (dsPlanDep.DataSet <> nil) {and (RG.ItemIndex = 1)} then
   begin
    if dsPlanDep.DataSet.Active then
      (Sender as TAction).Enabled:= dsPlanDep.DataSet.RecordCount > 0
    else (Sender as TAction).Enabled:= false;
   end
   else (Sender as TAction).Enabled:= false;
end;

procedure TfmMethodWorkDep.actLoadCurrentPlanExecute(Sender: TObject);
begin
  frmMethodWorkPlanCurrentMW:= TfrmMethodWorkPlanCurrentMW.CreateDialog(nil, self.Connection, nil);
try
  frmMethodWorkPlanCurrentMW.Label2.Caption:= dsPlanDep.DataSet.FieldByName('cName_disc').AsString;
  frmMethodWorkPlanCurrentMW.Label2.Tag:= dsPlanDep.DataSet.FieldByName('ik_disc').AsInteger;
  frmMethodWorkPlanCurrentMW.Label3.Caption:= dsPlanDep.DataSet.FieldByName('NameWarrant').AsString;;
  frmMethodWorkPlanCurrentMW.Label3.Tag:= dsPlanDep.DataSet.FieldByName('IDWarrant').AsInteger;;
  frmMethodWorkPlanCurrentMW.IsModified:= false;
  frmMethodWorkPlanCurrentMW.Read(dbcbPlan.ListSource.DataSet.FieldByName('IDPlanMW').AsInteger);
  frmMethodWorkPlanCurrentMW.ShowModal();
finally
  frmMethodWorkPlanCurrentMW.Free;
end;
end;

procedure TfmMethodWorkDep.actLoadCurrentPlanUpdate(Sender: TObject);
begin
   if (dsPlanDep.DataSet <> nil) {and (RG.ItemIndex = 0)} then
   begin
    if dsPlanDep.DataSet.Active then
      (Sender as TAction).Enabled:= dsPlanDep.DataSet.RecordCount > 0
    else (Sender as TAction).Enabled:= false;
   end
   else (Sender as TAction).Enabled:= false;
end;

procedure TfmMethodWorkDep.actRemSrokExecute(Sender: TObject);
begin
  //dsSrok.DataSet.Delete;
end;

procedure TfmMethodWorkDep.actRemSrokUpdate(Sender: TObject);
begin
  {if (dsSrok.DataSet <> nil) then
  begin
    if (dsSrok.DataSet.Active) then
      actRemSrok.Enabled:= dsSrok.DataSet.RecordCount > 0
    else actRemSrok.Enabled:= false;
  end
  else actRemSrok.Enabled:= false;}
end;

procedure TfmMethodWorkDep.actRemWarrantExecute(Sender: TObject);
begin
 dsWarrant.DataSet.Delete;
 flagWarrantChange:= true;
end;

procedure TfmMethodWorkDep.actRemWarrantUpdate(Sender: TObject);
begin
  if (DSWarrant.DataSet <> nil) then
  begin
    if (DSWarrant.DataSet.Active) then
      actRemWarrant.Enabled:= DSWarrant.DataSet.RecordCount > 0
    else actRemWarrant.Enabled:= false;
  end
  else actRemWarrant.Enabled:= false;
end;

procedure TfmMethodWorkDep.actSaveExecute(Sender: TObject);
begin
  if PageControl1.ActivePageIndex = 4 then
    flagWarrantChange:= not TMethodWorkController.Instance.SaveMWvidZan(TDBNodeMethodWorkDepartmentObject(self.FrameObject).ik, dbcbVidZan.KeyValue);
  {else
  begin
    dsSrok.DataSet.First;
    while (not dsSrok.DataSet.Eof) do
    begin
      if (dsSrok.DataSet.FieldByName('NameStatus').Value = NULL) or (dsSrok.DataSet.FieldByName('EffectiveDate').Value = NULL) then
      begin
        Application.MessageBox('Необходимо указать наименование статуса и срок действия для каждой записи!', 'Сохранение сроков действия', MB_ICONWARNING);
        exit;
      end;
      dsSrok.DataSet.Next;
    end;
    flagSrokChange:= not TMethodWorkController.Instance.SaveSrokMW(dbcbMW.KeyValue);
  end; }
end;

procedure TfmMethodWorkDep.actSaveUpdate(Sender: TObject);
begin
  if PageControl1.ActivePageIndex = 4 then
    (Sender as TAction).Enabled:= flagWarrantChange and (dbcbVidZan.KeyValue <> NULL);
  //else
    //(Sender as TAction).Enabled:= flagSrokChange and (dbcbMW.KeyValue <> NULL);
  if PageControl1.ActivePageIndex = 0 then
    (Sender as TAction).Enabled:= flagDateRatifyChange and (dbcbPlanDep.KeyValue <> NULL);
end;

procedure TfmMethodWorkDep.actUndoExecute(Sender: TObject);
begin
  if Application.MessageBox('Вы уверены, что хотите отменить сделанные изменения?', 'Отмена изменений', MB_YESNO) = mrYes then
  begin
    if PageControl1.ActivePageIndex = 4 then
    begin
      DSWarrant.DataSet.Close;
      DSWarrant.DataSet.Open;
      flagWarrantChange:= false;
    end
    else
    begin
      DSPrep.DataSet.Close;
      DSPrep.DataSet.Open;
      flagDateRatifyChange:= false;
    end;
  end;
end;

procedure TfmMethodWorkDep.chbDiscEdClick(Sender: TObject);
begin
 if chbDiscEd.Checked then
  begin
   Label4.Enabled := true;
   dbcbDiscPlanEd.Enabled := true;
  end
 else
  begin
   Label4.Enabled := false;
   dbcbDiscPlanEd.Enabled := false;
   //dbcbDiscPlanEd.KeyValue:= NULL;
   dbcbPlanEdKeyValueChanged(nil);
   //LastKeyValueEd:= 0;
  end;
end;

procedure TfmMethodWorkDep.chbFactClick(Sender: TObject);
begin
if chbFact.Checked then
  begin
   Label17.Enabled := true;
   dbcbDisc.Enabled := true;
  end
 else
  begin
   Label17.Enabled := false;
   dbcbDisc.Enabled := false;
   dbcbDisc.KeyValue:= NULL;
   ChangeLoadPrep();
  end;
end;

procedure TfmMethodWorkDep.chbYearFactClick(Sender: TObject);
begin
 if chbYearFact.Checked then
  begin
   Label9.Enabled := true;
   dbcbYearFact.Enabled := true;
  end
 else
  begin
   Label9.Enabled := false;
   dbcbYearFact.Enabled := false;
   dbcbYearFact.KeyValue:= NULL;
   ChangeLoadPrep();
  end;
end;

procedure TfmMethodWorkDep.ClearRowObjects;
var
  I : Integer;
begin
  for I := 2 to SG.RowCount - 1 do
  begin
    if Assigned(SG.Objects[0, I]) then
    begin
      SG.Objects[0, I].Free;
      SG.Objects[0, I] := nil;
    end;
  end;
end;

function TfmMethodWorkDep.CreateEditor(const FieldName: string;
  IsFieldBoolean: Boolean; TypeSign: TBitwiseType;
  Items: array of String): TDBComboboxFilter;
var
  I : Integer;
begin
  Result := TDBComboboxFilter.Create(SG, FieldName, IsFieldBoolean, TypeSign);
  Result.Parent:= SG;
  {SG.Objects[Col,0]:= Result;
  Result.BringToFront;
  Result.Visible:= false;}
  Result.AutoSize:= false;
  Result.Height:= 21;
  Result.AlwaysShowBorder:= true;
  Result.Items.Clear;
  for I := Low(Items) to High(Items) do
    Result.Items.Add(Items[I]);
  Result.ItemIndex:= 0;
  Result.OnChange:= MyChange;
  Result.OnKeyPress:= MyKeyPress;
end;

procedure TfmMethodWorkDep.cbFilterDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
    CellRect: TRect;
    bmp: graphics.TBitmap;
begin
      {cbFilter.Canvas.FillRect(Rect);
      CellRect:= Rect;
      bmp:= Graphics.TBitmap.Create;
      try
        ImageList1.GetBitmap(24, bmp);
        cbFilter.Canvas.Draw(Rect.Left+2, Rect.Top+2, bmp);
        CellRect.Left:= Rect.Left + bmp.Width + 4;
      finally
        bmp.Free;
      end;
      cbFilter.Canvas.TextOut(CellRect.Left+2, CellRect.Top+2, cbFilter.Items[Index]);
}end;

procedure TfmMethodWorkDep.cbFilterMeasureItem(Control: TWinControl;
  Index: Integer; var Height: Integer);
begin
  //Height:= 20;
end;

procedure TfmMethodWorkDep.dbcbCklDiscKeyValueChanged(Sender: TObject);
begin
if (dbcbYearGos.KeyValue <> NULL) and (dbcbCklDisc.KeyValue <> NULL) and (dbcbGrpDisc.KeyValue <> NULL) then
   begin
    dbcbDiscGos.KeyValue:= TMethodWorkController.Instance.GetCurrentDiscForGos(@dbcbDiscGos.ListSource.DataSet, dbcbYearGos.ListSource.DataSet.FieldByName('IDGos').AsInteger, dbcbCklDisc.ListSource.DataSet.FieldByName('IK_ckl_disc').AsInteger, dbcbGrpDisc.ListSource.DataSet.FieldByName('IK_grp_disc').AsInteger);
   end;
end;

procedure TfmMethodWorkDep.dbcbDiscGosKeyValueChanged(Sender: TObject);
begin
  if (dbcbYearGos.KeyValue <> NULL) and (dbcbDiscGos.KeyValue <> NULL) then
   begin
    dsDiscGos.DataSet:= TMethodWorkController.Instance.LoadDiscGos(dbcbYearGos.ListSource.DataSet.FieldByName('IDGos').AsInteger, dbcbDiscGos.ListSource.DataSet.FieldByName('ik_disc').AsInteger);
    Label13.Caption:= dsDiscGos.DataSet.FieldByName('Code').AsString;
    Label16.Caption:= dsDiscGos.DataSet.FieldByName('TotalHour').AsString;
   end
  else
   begin
    dsDiscGos.DataSet:= nil;
    Label13.Caption:= '';
    Label16.Caption:= '';
   end; 
end;

procedure TfmMethodWorkDep.dbcbDiscKeyValueChanged(Sender: TObject);
begin
 if (dbcbDisc.KeyValue <> NULL) then
  begin
    ChangeLoadPrep();
    LastKeyValueFact:= dbcbDisc.KeyValue;
    frmMain.StatusBar1.Panels[1].Text:= 'УМР кафедры (факт): ' + dbcbDisc.Text;
  end
 else frmMain.StatusBar1.Panels[1].Text:= 'Дисциплина: <не выбрана>';
end;

procedure TfmMethodWorkDep.dbcbDiscPlanEdKeyValueChanged(Sender: TObject);
begin
if (dbcbPlanEd.KeyValue <> NULL) and (dbcbDiscPlanEd.KeyValue <> NULL) then
  begin
   dsPlanEdDep.DataSet:= TMethodWorkController.Instance.LoadPlanEdDepForDisc(dbcbDiscPlanEd.ListSource.DataSet.FieldByName('iK_disc').AsInteger, dbcbPlanEd.ListSource.DataSet.FieldByName('IDPlanMW').AsInteger);

   LastKeyValueEd:= dbcbDiscPlanEd.KeyValue;
   ChangeLoadPlanEdition;
   //frmMain.StatusBar1.Panels[1].Text:= 'План издания УМР кафедры: ' + dbcbDiscPlanEd.Text;
  end
 //else frmMain.StatusBar1.Panels[1].Text:= 'Дисциплина: <не выбрана>';
end;

procedure TfmMethodWorkDep.dbcbItemGosKeyValueChanged(Sender: TObject);
begin
  if (dbcbYearGos.KeyValue <> NULL) and (dbcbItemGos.KeyValue <> NULL) then
   begin
    dsItemGos.DataSet:= TMethodWorkController.Instance.LoadItemGos(dbcbYearGos.ListSource.DataSet.FieldByName('IDGos').AsInteger, dbcbItemGos.ListSource.DataSet.FieldByName('IDItemGos').AsInteger);
   end
  else
    dsItemGos.DataSet:= nil;
end;

procedure TfmMethodWorkDep.dbcbMWKeyValueChanged(Sender: TObject);
begin
  {if (dbcbMW.KeyValue <> NULL) then
    dsSrok.DataSet:= TMethodWorkController.Instance.LoadSrokMethodWork(dbcbMW.ListSource.DataSet.FieldByName('IDWarrant').AsInteger);
  flagSrokChange:= false; }
end;

procedure TfmMethodWorkDep.dbcbPlanDepKeyValueChanged(Sender: TObject);
begin
  if (dbcbPlanDep.KeyValue <> NULL) then
   begin
    DSPrep.DataSet:= TMethodWorkController.Instance.LoadRatifyPlanDep(dbcbPlanDep.ListSource.DataSet.FieldByName('IDPlanMW').AsInteger, TDBNodeMethodWorkDepartmentObject(self.FrameObject).ik);

    frmMain.StatusBar1.Panels[1].Text:= 'План УМР кафедры: ' + dbcbPlanDep.Text;
   end
  else frmMain.StatusBar1.Panels[1].Text:= 'План УМР кафедры: <не выбран>';
end;

procedure TfmMethodWorkDep.dbcbPlanEdKeyValueChanged(Sender: TObject);
begin
if (dbcbPlanEd.KeyValue <> NULL) then
   begin
    dbcbDiscPlanEd.KeyValue:= TMethodWorkController.Instance.GetDiscForPlanDep(@dbcbDiscPlanEd.ListSource.DataSet, dbcbPlanEd.ListSource.DataSet.FieldByName('ik_year').AsInteger, TDBNodeMethodWorkDepartmentObject(self.FrameObject).ik, false);

    dsPlanEdDep.DataSet:= TMethodWorkController.Instance.LoadPlanEdDep(dbcbPlanEd.ListSource.DataSet.FieldByName('IDPlanMW').AsInteger);
    ChangeLoadPlanEdition;

    frmMain.StatusBar1.Panels[1].Text:= 'План издания УМР кафедры: ' + dbcbPlanEd.Text;
   end
  else frmMain.StatusBar1.Panels[1].Text:= 'План издания УМР кафедры: <не выбран>';
end;

procedure TfmMethodWorkDep.dbcbPlanKeyValueChanged(Sender: TObject);
var
  I : Integer;
begin
  if (dbcbPlan.KeyValue <> NULL) then
  begin
    //dbcbDiscPlan.KeyValue:= TMethodWorkController.Instance.GetDiscForPlanDep(@dbcbDiscPlan.ListSource.DataSet, dbcbPlan.ListSource.DataSet.FieldByName('ik_year').AsInteger, TDBNodeMethodWorkDepartmentObject(self.FrameObject).ik, false);
    //RGClick(nil);
    dsPlanDep.DataSet:= TMethodWorkController.Instance.LoadPlanDep(dbcbPlan.ListSource.DataSet.FieldByName('IDPlanMW').AsInteger);

    if IsEditrosNotNil then
    begin
      for I := Low(FEditors) to High(FEditors) do
        if not(FEditors[I].BooleanField) then
        begin
          FEditors[I].Items.Clear;
          FEditors[I].Items.Add(TDBComboboxFilter.FILTER_ALL);
        end;

    dsWarrantFilter.DataSet:= TMethodWorkController.Instance.LoadWarrantForFilter(0, dbcbPlan.ListSource.DataSet.FieldByName('IDPlanMW').AsInteger);
    dsWarrantFilter.DataSet.First;
    while not dsWarrantFilter.DataSet.Eof do
    begin
      FEditors[3].Items.Add(dsWarrantFilter.DataSet.FieldByName('NameWarrant').AsString);
      dsWarrantFilter.DataSet.Next;
    end;
    dsWarrantFilter.DataSet.Close;
    dsWarrantFilter.DataSet.Free;

    dsNameWorkFilter.DataSet:= TMethodWorkController.Instance.LoadMethodEditionForFilter(0, dbcbPlan.ListSource.DataSet.FieldByName('IDPlanMW').AsInteger);
    dsNameWorkFilter.DataSet.First;
    while not dsNameWorkFilter.DataSet.Eof do
    begin
      FEditors[5].Items.Add(dsNameWorkFilter.DataSet.FieldByName('NameMethodEdition').AsString);
      dsNameWorkFilter.DataSet.Next;
    end;
    dsNameWorkFilter.DataSet.Close;
    dsNameWorkFilter.DataSet.Free;

    dsMethodWorkFilter.DataSet:= TMethodWorkController.Instance.LoadMethodWorkForFilter(0, dbcbPlan.ListSource.DataSet.FieldByName('IDPlanMW').AsInteger);
    dsMethodWorkFilter.DataSet.First;
    while not dsMethodWorkFilter.DataSet.Eof do
    begin
      FEditors[4].Items.Add(dsMethodWorkFilter.DataSet.FieldByName('NameWork').AsString);
      dsMethodWorkFilter.DataSet.Next;
    end;
    dsMethodWorkFilter.DataSet.Close;
    dsMethodWorkFilter.DataSet.Free;

    dsPrepodFilter.DataSet:= TMethodWorkController.Instance.LoadPrepodForFilter(dbcbPlan.ListSource.DataSet.FieldByName('IDPlanMW').AsInteger);
    dsPrepodFilter.DataSet.First;
    while not dsPrepodFilter.DataSet.Eof do
    begin
      FEditors[7].Items.Add(dsPrepodFilter.DataSet.FieldByName('Pr').AsString);
      dsPrepodFilter.DataSet.Next;
    end;
    dsPrepodFilter.DataSet.Close;
    dsPrepodFilter.DataSet.Free;

      for I := Low(FEditors) to High(FEditors) do
        FEditors[I].ItemIndex:=0;

      UpdateStringGrid;
    end;

    frmMain.StatusBar1.Panels[1].Text:= 'План УМР кафедры: ' + dbcbPlan.Text;
  end
  else frmMain.StatusBar1.Panels[1].Text:= 'План УМР кафедры: <не выбран>';
end;

procedure TfmMethodWorkDep.dbcbSpecKeyValueChanged(Sender: TObject);
begin
if (dbcbSpec.KeyValue <> NULL) then
   begin
     dbcbYearGos.KeyValue:= TMethodWorkController.Instance.GetYearGos(@dbcbYearGos.ListSource.DataSet, dbcbSpec.ListSource.DataSet.FieldByName('ik_spec').AsInteger, true);
   end;
end;

procedure TfmMethodWorkDep.dbcbVidZanKeyValueChanged(Sender: TObject);
begin
  if (dbcbVidZan.KeyValue <> NULL) then
    DSWarrant.DataSet:= TMethodWorkController.Instance.LoadMethodWorkVidZan(TDBNodeMethodWorkDepartmentObject(self.FrameObject).ik, dbcbVidZan.ListSource.DataSet.FieldByName('iK_vid_zanyat').AsInteger);
  flagWarrantChange:= false;
end;

procedure TfmMethodWorkDep.dbcbYearFactKeyValueChanged(Sender: TObject);
begin
  {if (dbcbYearFact.KeyValue <> NULL) then
  begin
    if (dbcbDisc.KeyValue <> NULL) then
    begin
      // загрузка факта по конкретной дисциплине
      dsFactDep.DataSet:= TMethodWorkController.Instance.LoadFactDepPrepAll(dbcbDisc.ListSource.DataSet.FieldByName('iK_disc').AsInteger, dbcbYearFact.ListSource.DataSet.FieldByName('year_value').AsString);
      LastKeyValueFact:= dbcbDisc.KeyValue;
    end
    else dsFactDep.DataSet:= TMethodWorkController.Instance.LoadFactDepPrepAllDiscAll(TDBNodeMethodWorkDepartmentObject(self.FrameObject).IK, dbcbYearFact.ListSource.DataSet.FieldByName('year_value').AsString);
  end
  //else frmMain.StatusBar1.Panels[1].Text:= 'Год выпуска: <не выбран>';}
  if (dbcbYearFact.KeyValue <> NULL) then
  begin
    ChangeLoadPrep();
    //LastKeyValueFact:= dbcbDisc.KeyValue;
    frmMain.StatusBar1.Panels[1].Text:= 'УМР кафедры (факт): ' + dbcbYearFact.Text;
  end
 //else frmMain.StatusBar1.Panels[1].Text:= 'План: <не выбран>';
end;

procedure TfmMethodWorkDep.dbcbYearGosKeyValueChanged(Sender: TObject);
begin
if (dbcbYearGos.KeyValue <> NULL) then
   begin
    dbcbItemGos.KeyValue:= TMethodWorkController.Instance.GetItemGos(@dbcbItemGos.ListSource.DataSet, dbcbYearGos.ListSource.DataSet.FieldByName('IDGos').AsInteger, true);
    dbcbCklDisc.KeyValue:= TMethodWorkController.Instance.getAllDisciplineCycles(@dbcbCklDisc.ListSource.DataSet, true);
    dbcbGrpDisc.KeyValue:= TMethodWorkController.Instance.getAllDisciplineGroups(@dbcbGrpDisc.ListSource.DataSet, true);
    dbcbDiscGos.KeyValue:= TMethodWorkController.Instance.GetCurrentDiscForGos(@dbcbDiscGos.ListSource.DataSet, dbcbYearGos.ListSource.DataSet.FieldByName('IDGos').AsInteger, dbcbCklDisc.ListSource.DataSet.FieldByName('IK_ckl_disc').AsInteger, dbcbGrpDisc.ListSource.DataSet.FieldByName('IK_grp_disc').AsInteger);
   end;
end;

end.
