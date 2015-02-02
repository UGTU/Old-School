unit uGroup;

{ #Author tanyav@ist.ugtu.net }
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseFrame, StdCtrls, Buttons, ToolWin, ComCtrls, ExtCtrls, DB,
  ADODB, Grids, DBGridEh, uMain, Mask, DBCtrlsEh, DBLookupEh, DateUtils,
  ImgList, ActnList, GridsEh, ComObj, uUspevGroupController, uDMStudentData,
  Menus, uNaprRegisterDialog, ReportsBase, uWaitingController,
  ApplicationController, D_GrupUspevForStipend, uDMUchPlan, uAverageBalls,
  DBTVSpecObj,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, System.Actions,
  DBAxisGridsEh;

type
  TfmGroup = class(TfmBase)
    DataSource1: TDataSource;
    pcMain: TPageControl;
    tsStudents: TTabSheet;
    dbgStudList: TDBGridEh;
    tsVed: TTabSheet;
    dbgrdVed: TDBGridEh;
    ToolBar1: TToolBar;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbcmbxPrepodVed: TDBLookupComboboxEh;
    dbdteEx: TDBDateTimeEditEh;
    dbeNum: TDBEditEh;
    Label6: TLabel;
    dbcbxClosed: TDBCheckBoxEh;
    dbcbVed: TDBLookupComboboxEh;
    ilMain: TImageList;
    ilDisabled: TImageList;
    ActionList1: TActionList;
    actCreateAllVeds: TAction;
    actPrntBlnk: TAction;
    actPrntNotes: TAction;
    actPrntAllBlnk: TAction;
    actPrntAllNotes: TAction;
    actPrntGroup: TAction;
    ToolBar2: TToolBar;
    SpeedButton6: TSpeedButton;
    actRaports: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    actEdtGroup: TAction;
    actDelGroup: TAction;
    ToolButton7: TToolButton;
    actMkVin: TAction;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    btnCancelVed: TBitBtn;
    btnSaveVed: TBitBtn;
    ToolButton8: TToolButton;
    actRefreshDopusk: TAction;
    tsAttBRS: TTabSheet;
    ToolBar3: TToolBar;
    TBCreateAtt: TToolButton;
    Panel4: TPanel;
    Label9: TLabel;
    Label11: TLabel;
    cmbxSemAtt: TDBComboBoxEh;
    Panel5: TPanel;
    BtnCancelAtt: TBitBtn;
    BtnSaveAtt: TBitBtn;
    Label2: TLabel;
    dbcmbxDisc: TDBLookupComboboxEh;
    TBPrintAtt: TToolButton;
    cmbxNumber: TDBComboBoxEh;
    actCreateAtt: TAction;
    actPrintBlankAtt: TAction;
    actPrintAtt: TAction;
    cmbxSem: TDBComboBoxEh;
    dbcbxCloseAtt: TDBCheckBoxEh;
    tsNapr: TTabSheet;
    Panel6: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dbgrdNapr: TDBGridEh;
    ToolBar4: TToolBar;
    tbtPrintNapr: TToolButton;
    Panel7: TPanel;
    Label7: TLabel;
    Label10: TLabel;
    cmbxSemNapr: TDBComboBoxEh;
    dbcbNapr: TDBLookupComboboxEh;
    tbtCloseNapr: TToolButton;
    actCloseNapr: TAction;
    actPrintNapr: TAction;
    tshUspev: TTabSheet;
    sgUspev: TStringGrid;
    actUspevToExcel: TAction;
    lVinost: TLabel;
    ToolBar6: TToolBar;
    Label8: TLabel;
    cmbxUspSem: TDBComboBoxEh;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    Memo1: TMemo;
    eQuickFilter: TEdit;
    BFilter: TButton;
    actSaveVed: TAction;
    actDelVed: TAction;
    ToolButton9: TToolButton;
    actDelNapr: TAction;
    ToolButton10: TToolButton;
    TBDelAtt: TToolButton;
    actDelAtt: TAction;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    SpeedButton4: TSpeedButton;
    pmVedomost: TPopupMenu;
    N1: TMenuItem;
    actNaprRegister: TAction;
    ToolButton16: TToolButton;
    actPrintEmptyNapr: TAction;
    tsDiplom: TTabSheet;
    ToolBar5: TToolBar;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    dbgDiplom: TDBGridEh;
    actCreateDiploms: TAction;
    Panel8: TPanel;
    btnCancelDiplom: TBitBtn;
    btnSaveDiplom: TBitBtn;
    actPrintDipl: TAction;
    sguspev_dop: TStringGrid;
    actSaveDipl: TAction;
    actCancelDipl: TAction;
    ppmGroupNapr: TPopupMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Panel9: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    ToolButton19: TToolButton;
    actUpdateDiploms: TAction;
    pmUspevOtchet: TPopupMenu;
    Excel1: TMenuItem;
    actUspevforStipend: TAction;
    Excel2: TMenuItem;
    dbgrdBRSAtt: TDBGridEh;
    pnlBRS: TPanel;
    Label16: TLabel;
    dbcbeExaminer: TDBLookupComboboxEh;
    Label17: TLabel;
    dbdteBRSExam: TDBDateTimeEditEh;
    tsAtt: TTabSheet;
    Label18: TLabel;
    dbcbeSemAtt: TDBComboBoxEh;
    Label19: TLabel;
    nAtt: TDBComboBoxEh;
    Label20: TLabel;
    dbcbeDisc: TDBLookupComboboxEh;
    dbgeAtt: TDBGridEh;
    Panel10: TPanel;
    bCancelAtt: TBitBtn;
    bSaveAtt: TBitBtn;
    cbAttClose: TDBCheckBoxEh;
    ToolBar7: TToolBar;
    ToolButton20: TToolButton;
    ToolButton21: TToolButton;
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    tbEditNapr: TToolButton;
    actEditNapr: TAction;
    tbBRSLastPrint: TToolButton;
    actPrintBRSLastAtt: TAction;
    dbdteAttBegin: TDBDateTimeEditEh;
    Label21: TLabel;
    dbdteAttEnd: TDBDateTimeEditEh;
    Label22: TLabel;
    dblcbPrepod: TDBLookupComboboxEh;
    actCreateAttest: TAction;
    tsAverageBalls: TTabSheet;
    fmAverageBallsGroup: TfmAverageBalls;
    pAttTop: TPanel;
    dbgrdBRSExam: TDBGridEh;
    Label15: TLabel;
    actSaveBRS: TAction;
    actPrintBRSRanks: TAction;
    ppmBRSRankReports: TPopupMenu;
    N6: TMenuItem;
    N7: TMenuItem;
    actPrintBRSRankAverage: TAction;
    ToolButton24: TToolButton;
    ToolButton25: TToolButton;
    ToolButton26: TToolButton;
    actRefreshVedStuds: TAction;
    dsVed: TDataSource;
    dsUspev: TDataSource;
    procedure dbgStudListDblClick(Sender: TObject);
    procedure dbgStudListTitleClick(Column: TColumnEh);
    procedure cmbxSemChange(Sender: TObject);
    procedure sbPrntBlnkClick(Sender: TObject);
    procedure dbcmbxPredmVedChange(Sender: TObject);
    procedure sbPrntNotesClick(Sender: TObject);
    procedure btnCancelVedClick(Sender: TObject);

    procedure dbcbVedChange(Sender: TObject);
    procedure dbeNumChange(Sender: TObject);
    procedure pcMainChange(Sender: TObject);
    procedure dbcbxClosedClick(Sender: TObject);
    procedure dbcmbxPrepodVedChange(Sender: TObject);
    procedure dbdteExChange(Sender: TObject);

    procedure dbgrdVedColumns7UpdateData(Sender: TObject; var Text: String;
      var Value: Variant; var UseText, Handled: Boolean);
    procedure dbgrdVedColumns4UpdateData(Sender: TObject; var Text: String;
      var Value: Variant; var UseText, Handled: Boolean);
    procedure sbPrntAllBlnkClick(Sender: TObject);
    procedure sbPrntAllNotesClick(Sender: TObject);
    procedure actCreateAllVedsExecute(Sender: TObject);
    procedure actPrntGroupExecute(Sender: TObject);
    procedure actRaportsExecute(Sender: TObject);
    procedure actEdtGroupExecute(Sender: TObject);
    procedure actDelGroupExecute(Sender: TObject);
    procedure actMkVinExecute(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure actRefreshDopuskExecute(Sender: TObject);
    procedure cmbxSemAttChange(Sender: TObject);
    procedure actCreateAttExecute(Sender: TObject);
    procedure dbcmbxDiscChange(Sender: TObject);
    procedure actPrintBlankAttExecute(Sender: TObject);
    procedure actPrintAttExecute(Sender: TObject);

    procedure BtnCancelAttClick(Sender: TObject);
    procedure cmbxSemNaprChange(Sender: TObject);
    procedure dbcbNaprChange(Sender: TObject);
    procedure actCloseNaprExecute(Sender: TObject);
    procedure actPrintNaprExecute(Sender: TObject);
    procedure cmbxNumberChange(Sender: TObject);
    procedure dbcbxCloseAttClick(Sender: TObject);
    procedure cmbxUspSemChange(Sender: TObject);
    procedure actUspevToExcelUpdate(Sender: TObject);
    procedure actUspevToExcelExecute(Sender: TObject);
    procedure dbgrdVedTitleClick(Column: TColumnEh);
    procedure pcMainChanging(Sender: TObject; var AllowChange: Boolean);
    procedure ToolButton13Click(Sender: TObject);
    procedure actRefreshDopuskUpdate(Sender: TObject);
    procedure actMkVinUpdate(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure eQuickFilterChange(Sender: TObject);
    procedure BFilterClick(Sender: TObject);
    procedure dbgrdVedKeyPress(Sender: TObject; var Key: Char);
    procedure actSaveVedExecute(Sender: TObject);
    procedure actSaveVedUpdate(Sender: TObject);
    procedure actDelVedExecute(Sender: TObject);
    procedure actDelNaprExecute(Sender: TObject);
    procedure actDelNaprUpdate(Sender: TObject);
    procedure actDelVedUpdate(Sender: TObject);
    procedure actCreateAllVedsUpdate(Sender: TObject);
    procedure actRaportsUpdate(Sender: TObject);
    procedure actPrntNotesUpdate(Sender: TObject);
    procedure actPrntAllBlnkUpdate(Sender: TObject);
    procedure dbgrdNaprTitleClick(Column: TColumnEh);
    procedure actDelAttExecute(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure actNaprRegisterExecute(Sender: TObject);
    procedure pmVedomostPopup(Sender: TObject);
    procedure actPrintEmptyNaprExecute(Sender: TObject);
    procedure actCreateDiplomsExecute(Sender: TObject);
    procedure actCreateDiplomsUpdate(Sender: TObject);
    procedure dbgDiplomTitleClick(Column: TColumnEh);
    procedure dbgDiplomMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbgDiplomMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure dbgDiplomMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbgDiplomCellClick(Column: TColumnEh);
    procedure dbgDiplomColumns1UpdateData(Sender: TObject; var Text: string;
      var Value: Variant; var UseText, Handled: Boolean);
    procedure actPrintDiplExecute(Sender: TObject);
    procedure sgUspevDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure dbgDiplomColumns2UpdateData(Sender: TObject; var Text: string;
      var Value: Variant; var UseText, Handled: Boolean);
    procedure dbgDiplomKeyPress(Sender: TObject; var Key: Char);
    procedure actPrintDiplUpdate(Sender: TObject);
    procedure actSaveDiplExecute(Sender: TObject);
    procedure actSaveDiplUpdate(Sender: TObject);
    procedure actCancelDiplExecute(Sender: TObject);
    procedure dbgDiplomColumns5UpdateData(Sender: TObject; var Text: string;
      var Value: Variant; var UseText, Handled: Boolean);
    procedure dbgrdVedDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure actUpdateDiplomsUpdate(Sender: TObject);
    procedure actUpdateDiplomsExecute(Sender: TObject);
    procedure actUspevforStipendExecute(Sender: TObject);
    procedure ExecuteError(Sender: TObject; E: Exception);
    procedure dbgrdBRSAttColumns4UpdateData(Sender: TObject; var Text: string;
      var Value: Variant; var UseText, Handled: Boolean);
    procedure dbgrdBRSAttCellClick(Column: TColumnEh);
    procedure dbcbeSemAttChange(Sender: TObject);
    procedure nAttChange(Sender: TObject);
    procedure actEditNaprExecute(Sender: TObject);
    procedure dbcbeDiscChange(Sender: TObject);
    procedure actPrintBRSLastAttExecute(Sender: TObject);
    procedure actPrintAttUpdate(Sender: TObject);
    procedure dblcbPrepodChange(Sender: TObject);
    procedure dbdteAttBeginChange(Sender: TObject);
    procedure cbAttCloseClick(Sender: TObject);
    procedure actCreateAttestExecute(Sender: TObject);
    procedure actSaveBRSExecute(Sender: TObject);
    procedure actSaveBRSUpdate(Sender: TObject);
    procedure actPrintBRSRanksExecute(Sender: TObject);
    procedure actPrintBRSRanksUpdate(Sender: TObject);
    procedure actPrintBRSRankAverageExecute(Sender: TObject);
    procedure actPrintBRSRankAverageUpdate(Sender: TObject);
    procedure dbgrdBRSExamColumns5UpdateData(Sender: TObject; var Text: string;
      var Value: Variant; var UseText, Handled: Boolean);
    procedure dbgrdBRSExamColumns7UpdateData(Sender: TObject; var Text: string;
      var Value: Variant; var UseText, Handled: Boolean);
    procedure actRefreshVedStudsUpdate(Sender: TObject);
    procedure actRefreshVedStudsExecute(Sender: TObject);
  private
    { Private declarations }
    Fik: Integer;
    FFac_ik: Integer;
    haveAtt: Boolean;
    nSem: Integer;
    ikVed: Integer;
    ikVidZan: Integer;
    ikPredm: Integer;
    discName: string;
    FMaxBall: Integer;
    FIsBRS: Boolean;
    function DoIsModified(flag: Boolean): Boolean;
    function DoIsModifiedDiploms: Boolean;

    procedure LoadVedHeader();
    function CheckOcenka(Value: Integer): string;
    function IsBRS: Boolean;

    procedure RefreshView;
    procedure CheckEnabled;
    // GetCanCreateVeds возвращает, возможно ли создание ведомостей
    // (проверяет, созданы ли все ведомости семестра)
    // function GetCanCreateVeds(AllZachsCreated:boolean):boolean;
    procedure CheckVedsExist;
    procedure CheckAttExist;
    procedure CheckBRSExamExist;
    procedure CheckSimpleAttExist;
    procedure SetVedEnabled;
    procedure LoadDiploms;

    procedure AttestRefresh;
    procedure BRSExamRefresh;
  protected
    procedure DoCancel; override;
    procedure DoCreate; override;
    function DoApply: Boolean; override;
    procedure DoRefreshFrame; override;
  public
    { Public declarations }
    property ik: Integer read Fik write Fik;
    property Fac_ik: Integer read FFac_ik write FFac_ik;
    property MaxBall: Integer read FMaxBall write FMaxBall;

    procedure Read;
    procedure SetColor(canvas: TCanvas; const Rect: TRect; Field: string;
      RowColor, TextColor: TColor);

  end;

var
  fmGroup: TfmGroup;
  CurrentNum: string; // текущий рег. номер
  CurrentVipNum: string; // текущий номер выписки к диплому
  CurrentDplDate: TDatetime; // текущая дата защиты
  CurrentDplVidDate: TDatetime; // текущая дата выдачи
  bdown, editMode, NumColumn: Boolean;
  CurrentBall: Variant;

implementation

uses uDM, DBTVgroupObj, DBTVFacObj, uStudInfo,
  uRaports, uGroupEdtDlg, uVinEkz, uDMGroupActions, uDMUspevaemost,
  uDMUgtuStructure, uNaprClose, uNapr,
  Conditions, CorrectDatatypeChecks, Parser, uDiplomController,
  uDMDiplom, uDiplomStudSelect, ConstantRepository;

{$R *.dfm}
{ TfmGroup }

function ChangeMonthDayPlaces(date: TDatetime): string;
var
  s1: string;
begin
  result := DatetoStr(date);
  s1 := result;
  result[1] := s1[4];
  result[2] := s1[5];
  result[4] := s1[1];
  result[5] := s1[2];
end;

procedure TfmGroup.Read;
var
  ik: Integer;
begin
  dmStudentData.adodsSmallGroup.Active := false;
  dmStudentData.adodsSmallGroup.CommandText := DataSet.CommandText;
  dmStudentData.adodsSmallGroup.Active := true;
  DataSource1.DataSet := dmStudentData.adodsSmallGroup;
  Modified := false;
  ik := (Frameobject as TDBNodeGroupObject).UchPlanIK;
  dmUchPlan.adodsUchPlan.close;
  dmUchPlan.adodsUchPlan.CommandText :=
    'select * from Uch_pl where (ik_uch_plan = ' + inttostr(ik) + ')';
  dmUchPlan.adodsUchPlan.open;
  FIsBRS := (dmUchPlan.adodsUchPlan.FieldByName('IsBRSPlan').Value);
  {if (dmUchPlan.adodsUchPlan.FieldByName('IsBRSPlan').Value <> NULL) then
  FIsBRS := (dmUchPlan.adodsUchPlan.FieldByName('IsBRSPlan').Value)
  else FIsBRS :=false;                                            }

  // Взять ведомости группы
  dsVed.DataSet := TUspevGroupController.Instance.GetVedomSet;

end;

procedure TfmGroup.dbgStudListDblClick(Sender: TObject);
var
  r: Integer;
begin
  try
    r := DataSource1.DataSet.FieldValues['ncode'];
    DataSource1.DataSet := nil;
    SelectInTreeById(r);
    dmStudentData.adodsSmallGroup.Active := false;
    dmStudentData.adodsSmallGroup.CommandText := DataSet.CommandText;
    dmStudentData.adodsSmallGroup.Active := true;
    DataSource1.DataSet := dmStudentData.adodsSmallGroup;
  except
  end;
end;

procedure TfmGroup.dbgStudListTitleClick(Column: TColumnEh);
begin
  dmStudentData.adodsSmallGroup.Sort := '[' + Column.Field.FieldName + ']';
end;

procedure TfmGroup.dblcbPrepodChange(Sender: TObject);
begin
  Modified := true;
end;

procedure TfmGroup.DoRefreshFrame;
var
  ndGroup: TDBNodeGroupObject;
  OldYear: Integer;
begin
  if not(frmMain.DBDekTreeView_TEST1.SelectedObject is TDBNodeGroupObject) then
    Exit;
  pcMain.ActivePageIndex := 0;
  ndGroup := (frmMain.DBDekTreeView_TEST1.SelectedObject as TDBNodeGroupObject);
  Fac_ik := TDBNodeFacultyObject
    (frmMain.DBDekTreeView_TEST1.Selected.Parent.Parent.data).ik;
  DataSet := ndGroup.AdoDataset;
  read;
  dbgStudList.Refresh;
  nSem := 0;

  // проверяем, следует ли отображать вкладку с дипломами
  OldYear := YearOf(Today) - TDBNodeGroupObject
    (frmMain.DBDekTreeView_TEST1.SelectedObject).FoundYear;
  if (OldYear >= TDBNodeSpecObject(frmMain.DBDekTreeView_TEST1.Selected.Parent.
    data).StudyYears) then
    tsDiplom.TabVisible := true
  else
    tsDiplom.TabVisible := false;
  // cmbxSemChange(nil);

  dbgrdBRSAtt.Refresh;

  dmUspevaemost.adospGetAllVeds4Group.close;
  dmUspevaemost.adospPrepodVed.close;
  dmUspevaemost.adospSelVedGroup.close;
end;

procedure TfmGroup.eQuickFilterChange(Sender: TObject);
var
  ValuesList: TStringList;
  i, j: Integer;
  CommonCondition, InnerCondition: TConditionGroup;
  Field, Operation, Value: String;
begin
  inherited;
  if Length(eQuickFilter.Text) = 0 then
    dbgStudList.DataSource.DataSet.Filtered := false
  else
  begin
    // общее условие - для всех введённых значений и всех полей таблицы
    CommonCondition := TConditionGroup.Create('AND', true);
    // список введённых значений
    ValuesList := TStringList.Create;
    ParseString(eQuickFilter.Text, [' '], ValuesList);
    for i := 0 to ValuesList.Count - 1 do
    begin
      // группа условий - хотя бы один столбец соответствует значению
      InnerCondition := TConditionGroup.Create('OR', true);
      for j := 0 to dbgStudList.DataSource.DataSet.Fields.Count - 1 do
        if dbgStudList.DataSource.DataSet.Fields[j].Visible and
          (dbgStudList.DataSource.DataSet.Fields[j].FieldKind <> fkCalculated)
        then
        begin
          Field := '';
          Operation := '';
          Value := '';
          case dbgStudList.DataSource.DataSet.Fields[j].DataType of
            ftString:
              begin
                Field := dbgStudList.DataSource.DataSet.Fields[j].FieldName;
                Operation := 'like';
                Value := QuotedStr('%' + ValuesList.Strings[i] + '%');
              end;
            ftInteger:
              begin
                if IsCorrectInteger(ValuesList.Strings[i]) then
                begin
                  Field := dbgStudList.DataSource.DataSet.Fields[j].FieldName;
                  Operation := '=';
                  Value := ValuesList.Strings[i];
                end;
              end;
            ftFloat:
              begin
                if IsCorrectFloat(ValuesList.Strings[i]) then
                begin
                  Field := dbgStudList.DataSource.DataSet.Fields[j].FieldName;
                  Operation := '=';
                  Value := ValuesList.Strings[i];
                end;
              end;
            ftDate:
              begin
                if IsCorrectDate(ValuesList.Strings[i]) then
                begin
                  Field := dbgStudList.DataSource.DataSet.Fields[j].FieldName;
                  Operation := '=';
                  Value := QuotedStr
                    (DatetoStr(StrToDate(ValuesList.Strings[i])));
                end;
              end;
            ftTime:
              begin
                if IsCorrectTime(ValuesList.Strings[i]) then
                begin
                  Field := dbgStudList.DataSource.DataSet.Fields[j].FieldName;
                  Operation := '=';
                  Value := QuotedStr
                    (TimeToStr(StrToTime(ValuesList.Strings[i])));
                end;
              end;
            ftDateTime:
              begin
                if IsCorrectDateTime(ValuesList.Strings[i]) then
                begin
                  Field := dbgStudList.DataSource.DataSet.Fields[j].FieldName;
                  Operation := '=';
                  Value := QuotedStr
                    (DateTimeToStr(StrToDateTime(ValuesList.Strings[i])));
                end;
              end;
          end;
          if Length(Value) > 0 then
            InnerCondition.AddCondition(TCondition.Create(Field,
              Operation, Value));
        end;
      CommonCondition.AddCondition(InnerCondition);
    end;
    { есть ещё такие типы:
      ftUnknown, ftSmallint, ftWord, ftBoolean, ftCurrency, ftBCD, ftBytes,
      ftVarBytes, ftAutoInc, ftBlob, ftMemo, ftGraphic, ftFmtMemo, ftParadoxOle,
      ftDBaseOle, ftTypedBinary, ftCursor, ftFixedChar, ftWideString, ftLargeint,
      ftADT, ftArray, ftReference, ftDataSet, ftOraBlob, ftOraClob, ftVariant,
      ftInterface, ftIDispatch, ftGuid, ftTimeStamp, ftFMTBcd, ftFixedWideChar,
      ftWideMemo, ftOraTimeStamp, ftOraInterval }
    Memo1.Text := CommonCondition.AsText;
    // dbgStudList.DataSource.DataSet.Filter := CommonCondition.AsText;
    // dbgStudList.DataSource.DataSet.Filtered := true;
    ValuesList.Free;
    CommonCondition.Free;
  end;
end;

procedure TfmGroup.cmbxNumberChange(Sender: TObject);
var
  tmpStr: string;
begin
  // inherited;
  if (cmbxNumber.Text = '') then
    Exit;

  if Modified then
  begin
    tmpStr := 'Данные аттестации для ' + inttostr(nSem) + ' семестра по ' +
      dmUspevaemost.adospGetAllAtt.FieldByName('cName_Disc').Value +
      ' были изменены. Сохранить изменения?';
    if MessageBox(Handle, PWideChar(tmpStr), 'ИС УГТУ', MB_YESNO) = IDYES then
      BtnSaveAtt.Click
    else
      Modified := false;
  end;
  // Выборка дисциплин в этом семестре из учебного плана
  dbcmbxDisc.KeyValue := -1;
  dmUspevaemost.adodsSelAttGroup.Active := false;
  dmUspevaemost.adodsSelAttBRSGroup.Active := false;
  dmUspevaemost.adodsSelBRSExamGroup.Active := false;

  actPrintBlankAtt.Enabled := false;
  actPrintAtt.Enabled := false;
  Modified := false;

  if cmbxNumber.Text = 'Экзамен' then
  begin
    dbcmbxDisc.ListSource := dmUspevaemost.dsGetAllBRSExam;
    CheckBRSExamExist;
  end
  else if cmbxNumber.Text = 'Зачет' then
  begin

  end
  else
  begin
    dbcmbxDisc.ListSource := dmUspevaemost.dsGetAllAtt;
    CheckAttExist;
  end;

  dmUspevaemost.aspPrepodVedFromUchPlan.Active := false;
  dmUspevaemost.adospSelAtt.Active := false;
  dbcbxCloseAtt.Checked := false;
  dbdteBRSExam.Value := Today;

end;

procedure TfmGroup.cmbxSemAttChange(Sender: TObject);
var
  tmpStr: string;
begin
  inherited;
  // поиск ведомостей (ik_grup, nsem, ik_vid_zanyat=33)

  if Modified then
  begin
    tmpStr := 'Данные аттестации для ' + inttostr(nSem) + ' семестра по ' +
      dmUspevaemost.adospGetAllAtt.FieldByName('cName_Disc').Value +
      ' были изменены. Сохранить изменения?';
    if MessageBox(Handle, PWideChar(tmpStr), 'ИС УГТУ', MB_YESNO) = IDYES then
      BtnSaveAtt.Click
    else
      Modified := false;
  end;
  // Выборка дисциплин в этом семестре из учебного плана
  dbcmbxDisc.KeyValue := -1;
  dbcmbxDisc.ListSource.DataSet.Active := false;
  cmbxNumber.ItemIndex := -1;
  dmUspevaemost.adodsSelAttGroup.Active := false;
  actCreateAtt.Enabled := false;
  actPrintBlankAtt.Enabled := false;
  actPrintAtt.Enabled := false;
  Modified := false;
  nSem := cmbxSemAtt.ItemIndex + 1;
  // CheckAttExist;
end;

procedure TfmGroup.cmbxSemChange(Sender: TObject);
begin
  inherited;
  // if cmbxSem.Text='' then cmbxSem.ItemIndex := 0;

  // если номер семестра прежний, просто выходим
  { if nSem=(cmbxSem.ItemIndex+1) then
    exit; }
  // проверяем модификацию открытой ведомости
  // если выбрана отмена перехода, возвращаемся к прежнему семестру
  if not DoIsModified(false) then
  begin
    cmbxSem.ItemIndex := nSem - 1;
    Exit;
  end;
  ikVed := -1;
  TApplicationController.GetInstance.AddLogEntry('Ведомость. Выбор семестра' +
    inttostr(cmbxSem.ItemIndex + 1));
  dbcmbxPrepodVed.KeyValue := -1;
  Modified := false;
  // Выборка дисциплин в этом семестре из учебного плана
  // dmUspevaemost.adospSelVedGroup.Active := false;
  nSem := cmbxSem.ItemIndex + 1;
  CheckVedsExist;
end;

procedure TfmGroup.cmbxSemNaprChange(Sender: TObject);
var
  nSem: Integer;
begin
  inherited;

  dmUspevaemost.adospGetAllVedNaprForDisc.Active := false;

  dbcbNapr.KeyValue := Null;

  nSem := cmbxSemNapr.ItemIndex + 1;

  dmUspevaemost.adospGetAllVedNaprForGrup.Active := false;
  with dmUspevaemost.adospGetAllVedNaprForGrup.Parameters do
  begin
    Clear;
    AddParameter;
    Items[0].Value := ik;
    AddParameter;
    Items[1].Value := nSem;
  end;
  dmUspevaemost.adospGetAllVedNaprForGrup.Active := true;
  dmUspevaemost.adospGetAllVedNaprForGrup.First;

end;

procedure TfmGroup.cmbxUspSemChange(Sender: TObject);
var
  VedsList, Uspev: TADOStoredProc;
  nSem, i, j, ik_upContent: Integer;
begin
  // выводим успеваемость группы на вкладку 4
  nSem := cmbxUspSem.ItemIndex + 1;
  sgUspev.RowCount := 2;
  sgUspev.ColCount := 1;
  sgUspev.Cells[0, 0] := 'ФИО';
  sgUspev.Cells[0, 1] := ' ';
  try
    // выбираем ведомости
    VedsList := TUspevGroupController.Instance.GetAllVedomosts(ik, nSem);
    if VedsList.IsEmpty then
    begin
      MessageBox(Handle, 'В выбранном семестре успеваемость еще не заполнена.',
        'ИС УГТУ', MB_OK);
      Exit;
    end;

    // выбираем успеваемость
    Uspev := TUspevGroupController.Instance.GetAllUspevForGrup(ik, nSem);
    if Uspev.IsEmpty then
    begin
      MessageBox(Handle, 'В выбранном семестре успеваемость еще не заполнена.',
        'ИС УГТУ', MB_OK);
      Exit;
    end;

    // настраиваем таблицу
    sgUspev.RowCount := (Uspev.RecordCount div VedsList.RecordCount) + 1;
    sgUspev.ColCount := VedsList.RecordCount + 1;
    sgUspev.Cells[0, 0] := 'ФИО';
    // дополнительная таблица для отрисовки
    sguspev_dop.RowCount := sgUspev.RowCount;
    sguspev_dop.ColCount := sgUspev.ColCount + 1;
    // заполняем студентов
    Uspev.First;
    ik_upContent := Uspev.FieldByName('ik_upContent').Value;
    i := 1;
    while (not Uspev.Eof) and
      (ik_upContent = Uspev.FieldByName('ik_upContent').Value) do
    begin
      sgUspev.Cells[0, i] := Uspev.FieldByName('StudName').AsString;
      sguspev_dop.Cells[sguspev_dop.ColCount - 1, i] :=
        Uspev.FieldByName('ik_zach').AsString;
      sguspev_dop.Cells[0, i] := '1'; // изначально все зеленые
      Uspev.Next;
      inc(i);
    end;

    // начинаем цикл по ведомостям и заполняем таблицу
    VedsList.First;
    i := 1;
    while not VedsList.Eof do
    begin //
      ik_upContent := VedsList.FieldByName('ik_upContent').Value;
      sgUspev.Cells[i, 0] := VedsList.FieldByName('COLUMN1').AsString;
      // заносим оценки из данной ведомости для всех студентов
      j := 1;
      while j <= sgUspev.RowCount do
      begin
        if Uspev.Locate('ik_upContent;studName;ik_zach',
          VarArrayOf([ik_upContent, sgUspev.Cells[0, j],
          sguspev_dop.Cells[sguspev_dop.ColCount - 1, j]]), [loPartialKey]) then
        begin
          if Uspev.FieldByName('bit_usp').AsBoolean then
            sguspev_dop.Cells[i, j] := '1'
          else
          begin
            sguspev_dop.Cells[i, j] := '0'; // ячейка будет красной
            if sguspev_dop.Cells[0, j] = '1' then
              sguspev_dop.Cells[0, j] := '2'; // студент будет без стипендии
          end;

          if Uspev.FieldByName('osenca').AsString <> '' then
            sgUspev.Cells[i, j] := '             ' +
              Uspev.FieldByName('osenca').AsString
          else
          begin
            sgUspev.Cells[i, j] := '             -';
            sguspev_dop.Cells[0, j] := '0'; // студент будет без стипендии
          end;

          if Uspev.FieldByName('osenca').AsString = '3' then
            if sguspev_dop.Cells[0, j] = '1' then
              sguspev_dop.Cells[0, j] := '3' // студент троишник

        end;
        inc(j);
      end;
      VedsList.Next;
      inc(i);
    end;
  finally
    if VedsList <> nil then
      VedsList.Free;
    if Uspev <> nil then
      Uspev.Free;
  end;

end;

procedure TfmGroup.sbPrntBlnkClick(Sender: TObject);
var
  // tmpStr: String;
  ikFac: Integer;
  ikSpecFac: Integer;
  ikSpec: Integer;
  Report: TReportBase;
begin

  ikSpecFac := TDBNodeSpecObject
    (frmMain.DBDekTreeView_TEST1.Selected.Parent.data).ik;
  ikSpec := TUspevGroupController.Instance.getSpecFromSpecFac(ikSpecFac);
  ikFac := TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.Selected.Parent.
    Parent.data).ik;
  // генерируем бланк текущей ведомости

  // TUspevGroupController.Instance.printBlankVedomost(ik, cmbxSem.ItemIndex+1, ikVed, ikFac, ikSpec, DMUspevaemost.adospGetAllVeds4Group);
  Report := TUspevGroupController.Instance.BuildVedomost2014(ik,
    cmbxSem.ItemIndex + 1, ikVed, ikFac, ikSpec,
    dmUspevaemost.adospGetAllVeds4Group);

  TWaitingController.GetInstance.Process(Report);

  Report.Free;

end;

procedure TfmGroup.AttestRefresh();
begin
  actPrintBlankAtt.Enabled := haveAtt;
  actPrintAtt.Enabled := haveAtt;

  if Modified then
    if MessageBox(Handle,
      'Данные аттестации были изменены. Сохранить изменения?', 'ИС УГТУ',
      MB_YESNO) = IDYES then
      BtnSaveAtt.Click;

  if IsBRS then
    MaxBall := dmUspevaemost.adospGetAllAtt.Fields[5].AsInteger;

  ikVed := dbcmbxDisc.KeyValue;
  ikPredm := dmUspevaemost.adospGetAllAtt.Fields[4].AsInteger;
  // dmUspevaemost.adospGetAllAtt.Fields[1].AsInteger;
  ikVidZan := dmUspevaemost.adospGetAllAtt.Fields[2].AsInteger;
  // чтение заголовка ведомости

  dmUspevaemost.adospSelAtt.Active := false;
  if IsBRS then
    dmUspevaemost.adospSelAtt.ProcedureName := 'SelBRSAtt;1';
  TUspevGroupController.Instance.SelAtt(cmbxSemAtt.ItemIndex + 1, ikPredm,
    ikVidZan, ik, cmbxNumber.Value);

  if dmUspevaemost.adospSelAtt.FieldByName('lClose').Value <> Null then
    dbcbxCloseAtt.Checked := dmUspevaemost.adospSelAtt.FieldByName
      ('lClose').Value;

  with dmUspevaemost.aspPrepodVedFromUchPlan do
  begin
    Active := false;
    Parameters[1].Value := ikVed;
    // Parameters[2].Value := ikVidZan;
    // Parameters[3].Value := cmbxSemAtt.ItemIndex+1;
    Active := true;
  end;

  dbcbeExaminer.KeyValue := dmUspevaemost.adospSelAtt.FieldByName
    ('itab_n').AsString;
  // dbcbeExaminer.KeyValue:=dmUspevaemost.adospSelAtt.FieldByName('itab_n').AsInteger;

  if dmUspevaemost.adospSelAtt.FieldByName('Dd_exam').AsDateTime <> Null then
    dbdteBRSExam.Value := dmUspevaemost.adospSelAtt.FieldByName('Dd_exam')
      .AsDateTime;

end;

procedure TfmGroup.dbcmbxDiscChange(Sender: TObject);
begin
  inherited;

  if (dbcmbxDisc.KeyValue = Null) or (dbcmbxDisc.Text = '') or
    (cmbxNumber.Text = '') then
    Exit; // будет управление преподавателями

  if cmbxNumber.Text = 'Экзамен' then // PrepodBranch update
    BRSExamRefresh
  else
    AttestRefresh;

  RefreshView;
  Modified := false;
end;

procedure TfmGroup.dbcmbxPredmVedChange(Sender: TObject);
begin
  inherited;
  CheckEnabled;
  CheckVedsExist;
end;

function TfmGroup.DoIsModified(flag: Boolean): Boolean;
var
  tmpStr: String;
begin
  result := true;
  if (not dmUspevaemost.adospSelVed.Active) or
    (not dmUspevaemost.adospGetAllVeds4Group.Active) or
    (not dmUspevaemost.adospSelVedGroup.Active) then
    Exit;

  if Modified and (not dmUspevaemost.adospSelVed.FieldByName('lClose').AsBoolean)
  then
  begin
    tmpStr := 'Данные ведомости для ' + inttostr(nSem) + ' семестра по ' +
      discName + ' были изменены. Сохранить изменения?';
    case MessageBox(Handle, PWideChar(tmpStr), 'ИС УГТУ', MB_YESNOCANCEL) of
      IDYES:
        actSaveVedExecute(nil);
      IDNO:
        if flag then
          btnCancelVed.Click;
      IDCANCEL:
        begin
          result := false;
          // Modified:= false;
          Exit;
        end;
    end;
  end;
  Modified := false;
end;

procedure TfmGroup.sbPrntNotesClick(Sender: TObject);
var
  // tmpStr: String;
  ikFac: Integer;
  ikSpecFac: Integer;
  ikSpec: Integer;
begin
  ikSpecFac := TDBNodeSpecObject
    (frmMain.DBDekTreeView_TEST1.Selected.Parent.data).ik;
  ikSpec := TUspevGroupController.Instance.getSpecFromSpecFac(ikSpecFac);

  ikFac := TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.Selected.Parent.
    Parent.data).ik;
  // генерируем ведомость с оценками
  TUspevGroupController.Instance.printVed(ik, cmbxSem.ItemIndex + 1, ikVed,
    ikFac, ikSpec);

end;

procedure TfmGroup.CheckEnabled;
begin
  if (cmbxSem.ItemIndex = -1) or (dbcmbxPrepodVed.KeyValue = -1) or
    (dbcmbxPrepodVed.KeyValue = Null) or (dbdteEx.Text = '  .  .    ') then
    actCreateAllVeds.Enabled := false
  else
    actCreateAllVeds.Enabled := true;
end;

// возвращает, возможно ли создание ведомостей
// (проверяет, созданы ли все ведомости семестра)
{ function TfmGroup.GetCanCreateVeds(AllZachsCreated:boolean):boolean;
  begin
  result:= (((not haveVeds) and (not CloseZachets)) or
  ((not EkzCreated) and AllZachsCreated and CloseZachets))
  end; }

procedure TfmGroup.CheckVedsExist;
var
  nSem: Integer;
  countPredms, countVed: Integer;
begin
  nSem := cmbxSem.ItemIndex + 1;

  // загружаем ведомости, досоздаем недостающие
  // и автоматически обновляем состав студентов открытых ведомостей
  countVed := TUspevGroupController.Instance.GetListOfVeds(nSem, ik, Fac_ik,
    countPredms);

  if (countPredms = 0) then
    MessageBox(Handle, 'В учебном плане нет ни одного экзамена или зачёта!',
      'ИС УГТУ', MB_OK)
  else // и в уч плане есть предметы

    // если ведомости еще не создавались
    if (countVed = 0) and
      (MessageBox(Handle, 'Не создано ни одной ведомости. Создать их сейчас?',
      'ИС УГТУ', MB_YESNO) = IDYES) then
      // если согласились создавать - создаём...
      TUspevGroupController.Instance.CreateVeds(nSem, ik);

  SetVedEnabled;

end;

procedure TfmGroup.RefreshView;
begin
  TApplicationController.GetInstance.AddLogEntry('Обновление кадра');
  // try

  // вкладка ведомости
  if pcMain.ActivePage = tsVed then
  begin
    // загрузка имеющихся оценок
    dsUspev.DataSet := TUspevGroupController.Instance.SelectVed(ikVed);

    dmUspevaemost.adospSelVedGroup.close;
    dmUspevaemost.adospSelVedGroup.open;
    // настраиваем отображение столбцов
    dbgrdVed.Columns[0].Visible := false; // код студента
    dbgrdVed.Columns[1].Visible := true; // имя
    dbgrdVed.Columns[2].Visible := true; // кат зачисления
    dbgrdVed.Columns[3].Visible := true; // номер зачетки
    dbgrdVed.Columns[5].Visible := false; // код зачетки
    dbgrdVed.Columns[7].Visible := (ikVidZan = vid_exam) and (FIsBRS);
    // только, если экзамен БРС
    dbgrdVed.Columns[8].Visible := true; // оценка

    dbgrdVed.Columns[5].Visible := false; // код зачетки
    dbgrdVed.Columns[6].Visible := false; // допуск
    dbgrdVed.Columns[7].Visible := true; // оценка

    // назначаем ширину столбцов
    dbgrdVed.Columns[1].Width := 120;
    dbgrdVed.Columns[2].Width := 20;
    dbgrdVed.Columns[3].Width := 75;
    dbgrdVed.Columns[5].Width := 0;
    dbgrdVed.Columns[7].Width := 75;

    // отображать тему (если ведомость для КП или КР)
    if dsVed.DataSet.FieldByName('HasTema').AsBoolean then
    begin
      dbgrdVed.Columns[6].Visible := true;
      dbgrdVed.Columns[6].Width := 75;
    end
    else
    begin
      dbgrdVed.Columns[6].Visible := false;
      dbgrdVed.Columns[6].Width := 0;
    end;

    // отображать тему (если ведомость для КП или КР)
    if dmUspevaemost.adospSelVed.FieldByName('HasTema').AsBoolean then
    begin
      dbgrdVed.Columns[4].Visible := true;
      dbgrdVed.Columns[4].Width := 400;
    end
    else
    begin
      dbgrdVed.Columns[4].Visible := false;
      dbgrdVed.Columns[4].Width := 0;
    end;

  end;

  if (pcMain.ActivePage = tsAttBRS) or (pcMain.ActivePage = tsAtt) then
  begin

    if (cmbxNumber.Text = 'Экзамен') and (pcMain.ActivePage = tsAttBRS) then
    begin
      dbgrdBRSAtt.Visible := false;
      dbgrdBRSExam.Visible := true;
      TUspevGroupController.Instance.SelectBRSExam(ikVed);
    end
    else
    begin
      dbgrdBRSAtt.Visible := true;
      dbgrdBRSExam.Visible := false;
      TUspevGroupController.Instance.SelectAtt(ikVed, IsBRS);
    end;
    if IsBRS then
    begin
      dbgrdBRSAtt.Refresh;
      dbgrdBRSExam.Refresh;
    end
    else
      dbgeAtt.Refresh;

  end;

  if pcMain.ActivePage = tsNapr then
  begin
    if (dmUspevaemost.adospGetAllVedNaprForGrup.FieldValues['ik_Vid_Zanyat']
      = 8) or (dmUspevaemost.adospGetAllVedNaprForGrup.FieldValues
      ['ik_Vid_Zanyat'] = 9) then
      dbgrdNapr.Columns[9].Visible := true
    else
      dbgrdNapr.Columns[9].Visible := false;
  end;

  // except
  // end;
end;

procedure TfmGroup.btnCancelVedClick(Sender: TObject);
begin
  inherited;
  Modified := false;
  { CheckVedsExist; }
  LoadVedHeader;
  RefreshView;

end;

procedure TfmGroup.BFilterClick(Sender: TObject);
var
  str: String;
begin
  inherited;
  str := Memo1.Text;
  InputQuery('', '', str);
  dbgStudList.DataSource.DataSet.Filter := str;
  dbgStudList.DataSource.DataSet.Filtered := true;
end;

procedure TfmGroup.BRSExamRefresh;
begin
  actPrintBlankAtt.Enabled := haveAtt;
  actPrintAtt.Enabled := haveAtt;

  if Modified then
    if MessageBox(Handle, 'Данные экзамена были изменены. Сохранить изменения?',
      'ИС УГТУ', MB_YESNO) = IDYES then
      BtnSaveAtt.Click;

  MaxBall := dmUspevaemost.adospGetAllBRSExam.Fields[4].AsInteger;

  ikVed := dbcmbxDisc.KeyValue;
  ikPredm := dmUspevaemost.adospGetAllBRSExam.Fields[5].AsInteger;
  // ik_upContent
  ikVidZan := dmUspevaemost.adospGetAllBRSExam.Fields[2].AsInteger;
  // чтение заголовка ведомости

  dmUspevaemost.adospSelBRSExam.Active := false;

  TUspevGroupController.Instance.SelBRSExam(cmbxSemAtt.ItemIndex + 1, ikPredm,
    ikVidZan, ik);

  if dmUspevaemost.adospSelBRSExam.FieldByName('lClose').Value <> Null then
    dbcbxCloseAtt.Checked := dmUspevaemost.adospSelBRSExam.FieldByName
      ('lClose').Value;

  with dmUspevaemost.aspPrepodVedFromUchPlan do
  begin
    Active := false;
    Parameters[1].Value := ikVed;
    // Parameters[2].Value := ikVidZan;
    // Parameters[3].Value := cmbxSemAtt.ItemIndex+1;
    Active := true;
  end;

  // искать в ImportTeachers
  dbcbeExaminer.KeyValue := dmUspevaemost.adospSelBRSExam.FieldByName
    ('itab_n').AsString;
  // dbcbeExaminer.KeyValue:=dmUspevaemost.adospSelBRSExam.FieldByName('itab_n').AsInteger;

  if dmUspevaemost.adospSelBRSExam.FieldByName('Dd_exam').AsDateTime <> Null
  then
    dbdteBRSExam.Value := dmUspevaemost.adospSelBRSExam.FieldByName('Dd_exam')
      .AsDateTime;

end;

procedure TfmGroup.BtnCancelAttClick(Sender: TObject);
begin
  inherited;
  Modified := false;
  CheckAttExist;
  RefreshView;
end;

procedure TfmGroup.cbAttCloseClick(Sender: TObject);
begin
  dbgeAtt.Columns.Items[5].ReadOnly := cbAttClose.Checked;
  dbgeAtt.Columns.Items[6].ReadOnly := cbAttClose.Checked;
  dbgeAtt.Columns.Items[7].ReadOnly := cbAttClose.Checked;

  if (dmUspevaemost.adospSelAtt.FieldByName('lClose').AsBoolean) then
  // check VedAtt lClose
  begin
    if not cbAttClose.Checked then
    begin
      if MessageBox(Handle,
        'Вы действительно хoтите открыть эту дисциплину аттестации?', 'ИС УГТУ',
        MB_YESNO) = IDYES then // dialog
      begin
        if not TUspevGroupController.Instance.OpenVed(ikVed) then // openVedAtt
          MessageBox(Handle, 'При открытии ведомости произошла ошибка.',
            'ИС УГТУ', MB_OK)
      end
      else
        cbAttClose.Checked := true;

      dmUspevaemost.adospSelAtt.close;
      dmUspevaemost.adospSelAtt.open;
      Modified := false;
    end;
  end
  else
    Modified := true;
end;

procedure TfmGroup.dbcbeDiscChange(Sender: TObject);
var
  tmpStr: string;
begin
  inherited;
  if Modified then
  begin
    tmpStr := 'Данные аттестации для ' + inttostr(nSem) + ' семестра по ' +
      dmUspevaemost.adospGetAllAtt.FieldByName('cName_Disc').Value +
      ' были изменены. Сохранить изменения?';
    if MessageBox(Handle, PWideChar(tmpStr), 'ИС УГТУ', MB_YESNO) = IDYES then
      bSaveAtt.Click
    else
      Modified := false;
  end;

  if (dbcbeDisc.KeyValue = Null) or (dbcbeDisc.Text = '') or (nAtt.Text = '')
  then
    Exit;

  actPrintBlankAtt.Enabled := haveAtt;
  actPrintAtt.Enabled := haveAtt;

  if Modified then
    if MessageBox(Handle,
      'Данные аттестации были изменены. Сохранить изменения?', 'ИС УГТУ',
      MB_YESNO) = IDYES then
      bSaveAtt.Click;

  if IsBRS then
    MaxBall := dmUspevaemost.adospGetAllAtt.Fields[4].AsInteger;

  ikVed := dbcbeDisc.KeyValue;
  ikPredm := dmUspevaemost.adospGetAllAtt.Fields[1].AsInteger;
  ikVidZan := dmUspevaemost.adospGetAllAtt.Fields[2].AsInteger;
  // чтение заголовка ведомости

  TUspevGroupController.Instance.SelAtt(dbcbeSemAtt.ItemIndex + 1, ikPredm,
    ikVidZan, ik, nAtt.Value);

  if dmUspevaemost.adospSelAtt.FieldByName('lClose').Value <> Null then
    cbAttClose.Checked := dmUspevaemost.adospSelAtt.FieldByName('lClose').Value;

  with dmUspevaemost.aspPrepodVedFromUchPlan do
  begin
    Active := false;
    Parameters[1].Value := ikVed;
    // Parameters[2].Value := ikVidZan;
    // Parameters[3].Value := cmbxSemAtt.ItemIndex+1;
    Active := true;
  end;

  dblcbPrepod.KeyValue := dmUspevaemost.adospSelAtt.FieldByName('itab_n')
    .AsInteger;

  if dmUspevaemost.adospSelAtt.FieldByName('Dd_exam').AsDateTime <> Null then
    dbdteAttBegin.Value := dmUspevaemost.adospSelAtt.FieldByName('Dd_exam')
      .AsDateTime;

  RefreshView;
  Modified := false;
end;

procedure TfmGroup.dbcbeSemAttChange(Sender: TObject);
var
  tmpStr: string;
begin
  inherited;
  if Modified then
  begin
    tmpStr := 'Данные аттестации для ' + inttostr(nSem) + ' семестра по ' +
      dmUspevaemost.adospGetAllAtt.FieldByName('cName_Disc').Value +
      ' были изменены. Сохранить изменения?';
    if MessageBox(Handle, PWideChar(tmpStr), 'ИС УГТУ', MB_YESNO) = IDYES then
      BtnSaveAtt.Click
    else
      Modified := false;
  end;
  // Выборка дисциплин в этом семестре из учебного плана
  dbcbeDisc.KeyValue := -1;
  dbcbeDisc.ListSource.DataSet.Active := false;
  nAtt.ItemIndex := -1;
  dbdteAttBegin.Clear;
  // dbdteAttEnd.Clear;
  dmUspevaemost.adodsSelAttGroup.Active := false;
  actCreateAttest.Enabled := false;
  actPrintBlankAtt.Enabled := false;
  actPrintAtt.Enabled := false;
  Modified := false;
  nSem := dbcbeSemAtt.ItemIndex + 1;
  // CheckAttExist;
end;

procedure TfmGroup.dbcbNaprChange(Sender: TObject);
begin
  inherited;

  // actCloseNapr.Enabled := false;
  // actPrintNapr.Enabled := false;

  if (dbcbNapr.KeyValue = Null) or (dbcbNapr.Text = '') then
    Exit;

  ikPredm := dmUspevaemost.adospGetAllVedNaprForGrup.FieldValues['ik_disc'];
  ikVidZan := dmUspevaemost.adospGetAllVedNaprForGrup.FieldValues
    ['ik_Vid_Zanyat'];

  // dmUspevaemost.adospGetAllVedNaprForDisc.Fields.Clear;
  dmUspevaemost.adospGetAllVedNaprForDisc.Active := false;
  with dmUspevaemost.adospGetAllVedNaprForDisc.Parameters do
  begin
    Clear;
    // Группа
    AddParameter;
    Items[0].Value := ik;
    // Номер семестра
    AddParameter;
    Items[1].Value := cmbxSemNapr.ItemIndex + 1;
    // Дисциплина
    AddParameter;
    Items[2].Value := ikPredm;
    // Вид занятий
    AddParameter;
    Items[3].Value := ikVidZan;
  end;
  dmUspevaemost.adospGetAllVedNaprForDisc.ExecProc;
  dmUspevaemost.adospGetAllVedNaprForDisc.Active := true;

  dbgrdNapr.Refresh;
  RefreshView;
end;

procedure TfmGroup.LoadVedHeader();
begin
  ikVed := dbcbVed.KeyValue;
  // ikPredm := //dmUspevaemost.adospGetAllVeds4Group.Fields[2].AsInteger;
  // ikVidZan := //dmUspevaemost.adospGetAllVeds4Group.Fields[3].AsInteger;
  // discName := //dmUspevaemost.adospGetAllVeds4Group.FieldByName
  // ('cName_Disc').AsString;

  // читаем заголовoк ведомости
  // TUspevGroupController.Instance.GetVedsHeader(ikVed);

  with dbcbVed.ListSource.DataSet do
  begin
    // записываем считанные данные
    dbcmbxPrepodVed.KeyValue := FieldByName('itab_n').Value;
    if FieldByName('Dd_exam').Value <> Null then
      dbdteEx.Value := FieldByName('Dd_exam').Value;
    if (FieldByName('cNumber_ved').Value <> Null) and
      (FieldByName('cNumber_ved').Value <> '            ') then
      dbeNum.Text := FieldByName('cNumber_ved').Value
    else
      dbeNum.Text := '';

    dbcbxClosed.Checked := FieldByName('lClose').AsBoolean;
  end;

  SetVedEnabled;
end;

procedure TfmGroup.nAttChange(Sender: TObject);
var
  tmpStr: string;
begin
  inherited;
  if (nAtt.Text = '') then
    Exit;

  if Modified then
  begin
    tmpStr := 'Данные аттестации для ' + inttostr(nSem) + ' семестра по ' +
      dmUspevaemost.adospGetAllAtt.FieldByName('cName_Disc').Value +
      ' были изменены. Сохранить изменения?';
    if MessageBox(Handle, PWideChar(tmpStr), 'ИС УГТУ', MB_YESNO) = IDYES then
      bSaveAtt.Click
    else
      Modified := false;
  end;
  // Выборка дисциплин в этом семестре из учебного плана
  dbcbeDisc.KeyValue := -1;
  // cmbxDate.ItemIndex := -1;
  dmUspevaemost.adodsSelAttGroup.Active := false;
  dbdteAttBegin.Clear;
  // dbdteAttEnd.Clear;

  { with dmUspevaemost.adospPrepodVed do
    begin
    Active:=false;
    Parameters[1].Value:=Ik;
    Parameters[2].Value:=Null;
    Parameters[3].Value:=strtoint(cmbxNumber.text);
    Active:=true;
    end; }

  actPrintBlankAtt.Enabled := false;
  actPrintAtt.Enabled := false;
  Modified := false;

  CheckSimpleAttExist;
end;

procedure TfmGroup.SetVedEnabled;
var
  flEnabled, flClosedEnabled: Boolean;
begin

  // признак доступности параметров ведомости
  flEnabled := TUspevGroupController.Instance.GetVedChangeEnabled;
  dbeNum.Enabled := flEnabled;
  dbcmbxPrepodVed.Enabled := flEnabled;
  dbdteEx.Enabled := flEnabled;
  dbgrdVed.ReadOnly := not flEnabled;
  btnSaveVed.Enabled := flEnabled;
  btnCancelVed.Enabled := flEnabled;
  // возможность открыть/закрыть ведомость
  // flClosedEnabled := TUspevGroupController.Instance.GetVedChangeOpenEnabled;
  // dbcbxClosed.Enabled := flClosedEnabled;

end;

procedure TfmGroup.SetColor(canvas: TCanvas; const Rect: TRect; Field: string;
  RowColor, TextColor: TColor);
// var myRect:TRect;
begin
  canvas.Brush.Color := RowColor;
  canvas.FillRect(Rect);
  canvas.Font.Color := TextColor;
  canvas.TextOut(Rect.Left + 2, Rect.Top + 2, Field);
end;

procedure TfmGroup.sgUspevDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  canvas: TCanvas;
begin

  canvas := (Sender as TStringGrid).canvas;

  if (ACol = 0) and (sguspev_dop.Cells[ACol, ARow] = '1') then
  begin
    SetColor(canvas, Rect, sgUspev.Cells[ACol, ARow], $007BDDBD, clInfoText);
    // $00C6C6FF
    Exit;
  end;

  if (ACol = 0) and ((sguspev_dop.Cells[ACol, ARow] = '3') or
    (sguspev_dop.Cells[ACol, ARow] = '2')) then
  begin
    SetColor(canvas, Rect, sgUspev.Cells[ACol, ARow], $0063F5E3, clInfoText);
    // $00C6C6FF
    Exit;
  end;

  if (sguspev_dop.Cells[ACol, ARow] = '0') then
  begin
    SetColor(canvas, Rect, sgUspev.Cells[ACol, ARow], $00C6C6FF, clInfoText);
    // $00C6C6FF
    Exit;
  end;
end;

procedure TfmGroup.dbcbVedChange(Sender: TObject);
begin
  // inherited;
  { if dbcbVed.KeyValue= ikVed then  //перехода не было
    exit; }

  TApplicationController.GetInstance.AddLogEntry('Ведомость. Выбор ведомости ' +
    dbcbVed.Text);

  // проверяем на модификацию вкладки
  // if not dbcbVed.KeyValue= ikVed then  //перехода не было
  if not DoIsModified(false) then // выбрана отмена перехода
    if dmUspevaemost.adospGetAllVeds4Group.Locate('Ik_ved', ikVed, []) then
    begin
      dbcbVed.KeyValue := ikVed;
      Exit;
    end;

  if dbcbVed.Text = '' then
  begin
    // dmUspevaemost.adospGetAllVeds4Group.Close;
    // dmUspevaemost.adospSelVed.close;
    // dmUspevaemost.adospSelVedGroup.close;
    dbcmbxPrepodVed.Value := Null;
    dbdteEx.Value := Null;
    SetVedEnabled;
    Exit;
  end;

  LoadVedHeader;
  RefreshView;
  Modified := false;
end;

procedure TfmGroup.dbeNumChange(Sender: TObject);
begin
  inherited;
  if Length(dbeNum.Text) > 12 then
    dbeNum.Text := copy(dbeNum.Text, 1, 12)
  else
    Modified := true;

  TApplicationController.GetInstance.AddLogEntry('Ввод номера ведомости ' +
    dbeNum.Text);
end;

procedure TfmGroup.LoadDiploms;
begin
  TDiplomController.Instance.GetDiplomList(ik);
  if dbgDiplom.DataSource.DataSet.IsEmpty then
    MessageBox(Handle,
      'Для данной группы еще не были созданы дипломы. Для их создания воспользуйтесь соответствующей кнопкой панели инструментов.',
      'ИС УГТУ', MB_OK)
  else
    actCreateDiplomsExecute(nil);
end;

procedure TfmGroup.pcMainChange(Sender: TObject);
var
  FYear: Integer;
  // tmpStr: String;
  sem_change: Boolean;
begin
  inherited;
  sem_change := true;
  // закладка ведомость
  if pcMain.ActivePage = tsVed then
  begin
    TApplicationController.GetInstance.AddLogEntry('Переход на ведомости');
    if (dmUspevaemost.adospSelVedGroup.Active and (ikVed = dbcbVed.KeyValue)) or
      ((cmbxSem.ItemIndex = nSem - 1) and (nSem <> 0) and
      (not dmUspevaemost.adospSelVedGroup.Active)) then
      Exit;

    lVinost.Visible := false;
    // выбираем преподавателей
    if not TUspevGroupController.Instance.SelPrepodsForVedom(Null, Null, Null)
    then
    begin
      MessageBox(Handle, 'Произошла ошибка при выборе преподавателей.',
        'ИС УГТУ', MB_OK);
    end;

    dmUspevaemost.adospSelVedGroup.Active := false;
    // вывод списка студентов
    dbgrdVed.Columns[0].Visible := false;
    dbgrdVed.Columns[1].Title.Caption := 'Фамилия, инициалы';
    dbgrdVed.Columns[2].Width := 10;

    // вычисление номера семестра по умолчанию
    // Год создания группы
    FYear := TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.Selected.data)
      .FoundYear;
    nSem := TUspevGroupController.Instance.GetNSem(FYear);
    if nSem < 1 then
      nSem := 1;

    // if nSem<0 then nSem:=1;

    Modified := false;
    if cmbxSem.ItemIndex <> nSem - 1 then
      sem_change := false;
    cmbxSem.ItemIndex := nSem - 1;
    Modified := false;
    if sem_change then
      cmbxSemChange(Sender);
    dbcbVed.KeyValue := -1;
    dbcmbxPrepodVed.KeyValue := -1;
    Modified := false;
  end;

  if pcMain.ActivePage = tsAttBRS then // аттестация
  begin
    TApplicationController.GetInstance.AddLogEntry('Переход на аттестацию');
    // вычисление номера семестра по умолчанию
    FYear := TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.Selected.data)
      .FoundYear;
    nSem := TUspevGroupController.Instance.GetNSemBRS(FYear);
    if nSem < 0 then
      nSem := 1;
    Modified := false;
    if cmbxSemAtt.ItemIndex <> nSem - 1 then
      sem_change := false;
    cmbxSemAtt.ItemIndex := nSem - 1;
    Modified := false;
    if sem_change then
      cmbxSemAttChange(Sender);
    Modified := false;
    cmbxNumber.ItemIndex := -1;
    Modified := false;
    dbcmbxDisc.KeyValue := -1;
    Modified := false;
    pnlBRS.Visible := true;
    Panel4.Height := 54;
    dbdteBRSExam.Value := Today;
    // dbgrdAtt.Columns[6].Visible:=false;

  end;

  if pcMain.ActivePage = tsAtt then // аттестация
  begin
    TApplicationController.GetInstance.AddLogEntry('Переход на аттестацию');
    // вычисление номера семестра по умолчанию
    FYear := TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.Selected.data)
      .FoundYear;
    nSem := TUspevGroupController.Instance.GetNSem(FYear);
    if nSem < 0 then
      nSem := 1;
    Modified := false;
    if dbcbeSemAtt.ItemIndex <> nSem - 1 then
      sem_change := false;
    dbcbeSemAtt.ItemIndex := nSem - 1;
    Modified := false;
    if sem_change then
      dbcbeSemAttChange(Sender);
    Modified := false;
    nAtt.ItemIndex := -1;
    Modified := false;
    dbcbeDisc.KeyValue := -1;
    Modified := false;
  end;

  if pcMain.ActivePage = tsNapr then // направления
  begin
    TApplicationController.GetInstance.AddLogEntry
      ('Переход на направления группы');
    // вычисление номера семестра по умолчанию
    FYear := TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.Selected.data)
      .FoundYear;
    nSem := TUspevGroupController.Instance.GetNSem(FYear);
    if cmbxSemNapr.ItemIndex <> nSem - 1 then
      sem_change := false;
    cmbxSemNapr.ItemIndex := nSem - 1;
    if sem_change then
      cmbxSemNaprChange(Sender);
  end;

  if pcMain.ActivePage = tshUspev then // успеваемость
  begin
    TApplicationController.GetInstance.AddLogEntry
      ('Переход на успеваемость группы');
    // вычисление номера семестра по умолчанию
    FYear := TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.Selected.data)
      .FoundYear;
    nSem := TUspevGroupController.Instance.GetNSem(FYear);
    if cmbxUspSem.ItemIndex <> nSem - 1 then
      sem_change := false;
    cmbxUspSem.ItemIndex := nSem - 1;
    if sem_change then
      cmbxUspSemChange(Sender);
  end;

  if pcMain.ActivePage = tsDiplom then
  begin
    TApplicationController.GetInstance.AddLogEntry('Переход на дипломы группы');
    Modified := false;
    if not TDiplomController.Instance.IsCurrentDiplomList(ik) then
      LoadDiploms;
  end;

  if pcMain.ActivePage = tsAverageBalls then
  begin
    frmMain.Comment('Средние баллы студентов',
      'Группа ' + (Frameobject as TDBNodeGroupObject).Name);
    fmAverageBallsGroup.Frameobject := Frameobject;
    fmAverageBallsGroup.FrameType := 4;
    fmAverageBallsGroup.ObjectId := (Frameobject as TDBNodeGroupObject).ik;
    fmAverageBallsGroup.StudyYears :=
      TDBNodeSpecObject((Frameobject as TDBNodeGroupObject).Node.Parent.data)
      .StudyYears;
    fmAverageBallsGroup.ShowStudents := (Frameobject as TDBNodeGroupObject)
      .ShowStudents;
    fmAverageBallsGroup.FillListView;
  end;

end;

function TfmGroup.DoIsModifiedDiploms: Boolean;
begin
  result := true;
  if (not dbgDiplom.DataSource.DataSet.Active) then
    Exit;

  if Modified then
  begin
    case MessageBox(Handle,
      'Данные по дипломам были изменены. Желаете сохранить изменения?',
      'ИС УГТУ', MB_YESNO) of
      IDYES:
        DoApply;
      IDNO:
        btnCancelDiplom.Click;
    end;
  end;
  Modified := false;
end;

procedure TfmGroup.pcMainChanging(Sender: TObject; var AllowChange: Boolean);
begin
  // ведомости
  if pcMain.ActivePage = tsVed then
    DoIsModified(true);
  // дипломы
  if pcMain.ActivePage = tsDiplom then
    DoIsModifiedDiploms;

end;

procedure TfmGroup.pmVedomostPopup(Sender: TObject);
begin

  if ((dmUspevaemost.adospSelVedGroup.FieldByName('Cosenca').AsInteger > 2) or
    (dmUspevaemost.adospSelVedGroup.FieldByName('Cosenca').AsInteger = 1)) then
    actNaprRegister.Enabled := false
  else
    actNaprRegister.Enabled := true;
end;

procedure TfmGroup.dbcbxCloseAttClick(Sender: TObject);
begin
  inherited;
  if ((not dmUspevaemost.adospSelAtt.Active) and (cmbxNumber.Text <> 'Экзамен'))
    or ((not dmUspevaemost.adospSelBRSExam.Active) and
    (cmbxNumber.Text = 'Экзамен')) then
    Exit;

  dbgrdBRSAtt.Columns.Items[5].ReadOnly := dbcbxCloseAtt.Checked;
  dbgrdBRSAtt.Columns.Items[6].ReadOnly := dbcbxCloseAtt.Checked;
  dbgrdBRSAtt.Columns.Items[7].ReadOnly := dbcbxCloseAtt.Checked;

  dbgrdBRSExam.Columns.Items[5].ReadOnly := dbcbxCloseAtt.Checked;
  dbgrdBRSExam.Columns.Items[7].ReadOnly := dbcbxCloseAtt.Checked;

  if cmbxNumber.Text = 'Экзамен' then
  begin
    if (dmUspevaemost.adospSelBRSExam.FieldByName('lClose').AsBoolean) then
    // check VedAtt lClose
    begin
      if not dbcbxCloseAtt.Checked then
      begin
        if MessageBox(Handle,
          'Вы действительно хoтите открыть эту экзаменационную ведомость?',
          'ИС УГТУ', MB_YESNO) = IDYES then // dialog
        begin
          if not TUspevGroupController.Instance.OpenVed(ikVed) then
            // openVedAtt
            MessageBox(Handle, 'При открытии ведомости произошла ошибка.',
              'ИС УГТУ', MB_OK)
        end
        else
          dbcbxCloseAtt.Checked := true;

        dmUspevaemost.adospSelBRSExam.close;
        dmUspevaemost.adospSelBRSExam.open;
        Modified := false;
      end
    end
  end
  else if (dmUspevaemost.adospSelAtt.FieldByName('lClose').AsBoolean) then
  // check VedAtt lClose
  begin
    if not dbcbxCloseAtt.Checked then
    begin
      if MessageBox(Handle,
        'Вы действительно хoтите открыть эту дисциплину аттестации?', 'ИС УГТУ',
        MB_YESNO) = IDYES then // dialog
      begin
        if not TUspevGroupController.Instance.OpenVed(ikVed) then // openVedAtt
          MessageBox(Handle, 'При открытии ведомости произошла ошибка.',
            'ИС УГТУ', MB_OK)
      end
      else
        dbcbxCloseAtt.Checked := true;

      dmUspevaemost.adospSelAtt.close;
      dmUspevaemost.adospSelAtt.open;
      Modified := false;
    end;
  end
  else
    Modified := true;

  // dbgrdAtt.Columns.Items[5].ReadOnly := dbcbxCloseAtt.Checked;
  // dbgrdAtt.Columns.Items[6].ReadOnly := dbcbxCloseAtt.Checked;

end;

procedure TfmGroup.dbcbxClosedClick(Sender: TObject);
begin

  // если ведомость была закрыта, не меняем ничего,
  // а спрашиваем пользователя
  if (not dmUspevaemost.adospSelVed.Active) or
    (not dmUspevaemost.adospGetAllVeds4Group.Active) or
    (not dmUspevaemost.adospSelVedGroup.Active) then
    Exit;

  if (dmUspevaemost.adospSelVed.FieldByName('lClose').AsBoolean) and
    not dbcbxClosed.Checked then
  begin
    if MessageBox(Handle, 'Вы действительно хoтите открыть эту ведомость?',
      'ИС УГТУ', MB_YESNO) = IDYES then
    begin
      // если да, открываем ведомость ...
      TUspevGroupController.Instance.OpenVed(ikVed);
      TUspevGroupController.Instance.GetAllVidZanyats(nSem, ik);
      dmUspevaemost.adospSelVed.close;
      dmUspevaemost.adospSelVed.open;
    end
    else
    begin
      dbcbxClosed.Checked := true;
      Exit;
    end;
    SetVedEnabled;
  end
  else
    Modified := true;
end;

procedure TfmGroup.dbcmbxPrepodVedChange(Sender: TObject);
begin
  TApplicationController.GetInstance.AddLogEntry
    ('Ведомость. Выбор преподавателя ' + dbcmbxPrepodVed.Text);
  Modified := true;
end;

procedure TfmGroup.dbdteAttBeginChange(Sender: TObject);
begin
  dbdteAttEnd.Value := dbdteAttBegin.Value + 5;
  Modified := true;
end;

procedure TfmGroup.dbdteExChange(Sender: TObject);
begin
  TApplicationController.GetInstance.AddLogEntry('Ведомость. Выбор даты ' +
    dbdteEx.EditText);
  Modified := true;
  try
    // Проверка, чтобы дата не была больше сегодняшней
    if (Length(dbdteEx.EditText) < 10) then
      Exit;
    if (TDatetime(dbdteEx.Value) > date) then
    begin
      dbdteEx.Value := date;
      dbdteEx.EditText := DatetoStr(date);
    end;
  except

  end;
end;

function TfmGroup.CheckOcenka(Value: Integer): string;
begin
  if (dsVed.DataSet.FieldByName('lClose').AsBoolean) then
    MessageBox(Handle, 'Нельзя редактировать закрытую ведомость!',
      'ИС УГТУ', MB_OK);

  if (dbgrdVed.Fields[1].Value = Null) or (dbgrdVed.Fields[1].Text = '') or
    (not dsUspev.DataSet.FieldByName('dopusc').AsBoolean) or
    (dsVed.DataSet.FieldByName('lClose').AsBoolean) then
  begin
    result := '';
    Exit;
  end;

  if ((ikVidZan <> 7) and (Value <= 5) and (Value >= 2)) or
    (((ikVidZan = 7) or (ikVidZan = 27)) and (Value <= 5) and (Value >= 0)) then
  begin
    try
      result := inttostr(Value);
    except
    end;
    Modified := true;
  end
  else
    result := '';

end;

procedure TfmGroup.dbgrdVedColumns7UpdateData(Sender: TObject; var Text: String;
  var Value: Variant; var UseText, Handled: Boolean);
begin
  if Text = '' then
  begin
    Value := -1;
    Modified := true;
  end;
  Handled := false;
  try
    // оставляем только первый символ
    Value := String(Value)[1];
    Text := CheckOcenka(Value);
  except
    Value := -1;
    Text := '';
  end;
  TApplicationController.GetInstance.AddLogEntry('Ведомость. Ввод оценки ' +
    dsUspev.DataSet.FieldByName('StudName').AsString + Text);
end;

procedure TfmGroup.dbgrdVedDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
var
  canvas: TCanvas;
  // medalBall:integer;
begin

  if dsUspev.DataSet.FieldByName('ik_zach').AsInteger = Null then
    Exit;
  if (gdSelected in State) and (dbgrdVed.Focused) then
    Exit;
  canvas := (Sender as TDBGridEh).canvas;

  // если студент сдал отчетность, закрашиваем в зеленный цвет
  if (dsUspev.DataSet.FieldByName('IsPassed').AsBoolean) then
  begin
    SetColor(canvas, Rect, Column.Field.DisplayText, $007BDDBD, clInfoText);
    // $00C6C6FF
    Exit;
  end
  // иначе в красный
  else
  begin
    SetColor(canvas, Rect, Column.Field.DisplayText, $00C6C6FF, clInfoText);
    // $0063F5E3
    Exit;
  end;

end;

procedure TfmGroup.dbgrdVedKeyPress(Sender: TObject; var Key: Char);
var
  Text: string;
  mark: set of Char;
begin
  mark := ['0' .. '9'];
  if not(Key in mark) then
    Exit;
  if not(Key in mark) then
    Exit;

  if (not dmUspevaemost.adospSelVed.Active) or
    (not dmUspevaemost.adospSelVedGroup.Active) or
    (dmUspevaemost.adospSelVedGroup.RecNo >=
    dmUspevaemost.adospSelVedGroup.RecordCount) or
    (dbgrdVed.SelectedField.FieldName <> 'Cosenca') then
    Exit;

  // try
  dsUspev.DataSet.Edit;
  try
    Text := CheckOcenka(StrToInt(Key));
  except
    Text := '';
  end;

 // dbgrdVed.Columns[7]. := Text;
 if (dbgrdVed.SelectedField.FieldName='Cosenca') then dbgrdVed.Columns[8].SetValueAsText(Text);
 if (dbgrdVed.SelectedField.FieldName='i_balls') then dbgrdVed.Columns[7].SetValueAsText(Text);
  TApplicationController.GetInstance.AddLogEntry('Ведомость. Ввод оценки ' +
    dsUspev.DataSet.FieldByName('StudName').AsString + Text);
  // if (dmUspevaemost.adospSelVedGroup.RecNo<
  // dmUspevaemost.adospSelVedGroup.RecordCount) then
  // dmUspevaemost.adospSelVedGroup.Post;
  dsUspev.DataSet.Next;
  Key := ' ';
  Modified := true;
  // except
  // end;
end;

procedure TfmGroup.dbgrdVedTitleClick(Column: TColumnEh);
begin
  //dmUspevaemost.adospSelVedGroup.Sort := Column.Field.DisplayName;
  (dsUspev.DataSet as TADODataSet).Sort := Column.Field.DisplayName;
end;

procedure TfmGroup.dbgDiplomCellClick(Column: TColumnEh);
begin
  inherited;

  if (Column.Field.FieldName = 'StudName') or
    (Column.Field.FieldName = 'RegNumber') or
    (Column.Field.FieldName = 'Dd_VidDipl') or
    (Column.Field.FieldName = 'IsExcellent') then
  begin
    dbgDiplom.Options := dbgDiplom.Options + [dgRowSelect] - [dgEditing];
    editMode := false;

  end
  else
  begin
    dbgDiplom.Options := dbgDiplom.Options - [dgRowSelect] + [dgEditing];
    editMode := true;
  end;

end;

procedure TfmGroup.dbgDiplomColumns1UpdateData(Sender: TObject;
  var Text: string; var Value: Variant; var UseText, Handled: Boolean);

const
  MinRegNlen: Integer = 3;
var
  MessageStr: string;
begin
  inherited;
  Modified := true;
  if (Length(Text) < MinRegNlen) and (Length(Text) <> 0) then
  begin
    MessageStr := 'Регистрационный номер диплома должен состоять минимум из ' +
      inttostr(MinRegNlen) + ' цифр!';
    Application.MessageBox(PWideChar(MessageStr), 'Подсистема "Деканат"',
      MB_ICONWARNING);
    { else
      Text:= ''; }
    // Value:= null;
  end;
end;

procedure TfmGroup.dbgDiplomColumns2UpdateData(Sender: TObject;
  var Text: string; var Value: Variant; var UseText, Handled: Boolean);
begin
  inherited;
  Modified := true;
end;

procedure TfmGroup.dbgDiplomColumns5UpdateData(Sender: TObject;
  var Text: string; var Value: Variant; var UseText, Handled: Boolean);
begin
  inherited;

  if Text = '' then
  begin
    Value := Null;
    Modified := true;
  end;
  try
    // оставляем только первый символ
    Value := String(Value)[1];
    if (StrToInt(Value) > 1) and (StrToInt(Value) <= 5) then
      Text := inttostr(Value)
    else
    begin
      Value := Null;
      Text := '';
    end;
  except
    Value := Null;
    Text := '';
  end;
  TApplicationController.GetInstance.AddLogEntry('Диплом. Ввод оценки ' +
    dbgDiplom.DataSource.DataSet.FieldByName('StudName').Value + Text);
  Modified := true;

end;

procedure TfmGroup.dbgDiplomKeyPress(Sender: TObject; var Key: Char);
const
  allow: set of Char = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0',
    Chr(VK_BACK)];
begin
  inherited;
  if (dbgDiplom.SelectedField.FieldName = 'RegNumber') then
    if (not(Key in allow)) then
    begin
      Key := #0;
      Exit;
    end;
end;

procedure TfmGroup.dbgDiplomMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  CurrentNum := '';
  CurrentVipNum := '';
  CurrentDplDate := 0;
  CurrentDplVidDate := 0;
  bdown := true;

  if dbgDiplom.DataSource.DataSet.FieldByName('RegNumber').Value <> Null then
    if dbgDiplom.SelectedField.FieldName = 'RegNumber' then
    begin
      CurrentNum := dbgDiplom.DataSource.DataSet.FieldByName('RegNumber').Value;
    end;

  if dbgDiplom.DataSource.DataSet.FieldByName('VipNumber').Value <> Null then
    if dbgDiplom.SelectedField.FieldName = 'VipNumber' then
    begin
      CurrentVipNum := dbgDiplom.DataSource.DataSet.FieldByName
        ('VipNumber').Value;
    end;

  if dbgDiplom.DataSource.DataSet.FieldByName('Dd_dipl').Value <> Null then
    if dbgDiplom.SelectedField.FieldName = 'Dd_dipl' then
    begin
      CurrentDplDate := dbgDiplom.DataSource.DataSet.FieldByName
        ('Dd_dipl').Value;
    end;

  if dbgDiplom.DataSource.DataSet.FieldByName('Dd_VidDipl').Value <> Null then
    if dbgDiplom.SelectedField.FieldName = 'Dd_VidDipl' then
    begin
      CurrentDplVidDate := dbgDiplom.DataSource.DataSet.FieldByName
        ('Dd_VidDipl').Value;
    end;

end;

procedure TfmGroup.dbgDiplomMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  i, j: Integer;
  str: string;
begin
  if (bdown) and (CurrentNum <> '') and
    ((dbgDiplom.SelectedField.Value = Null) or
    (dbgDiplom.SelectedField.Value = '')) then
    try
      dbgDiplom.DataSource.DataSet.Edit;
      i := 1;
      while (CurrentNum[i] = '0') and (i < Length(CurrentNum)) do
        inc(i);
      CurrentNum := inttostr(StrToInt(CurrentNum) + 1);
      dbgDiplom.SelectedField.Value := '';
      for j := 2 to i do
        dbgDiplom.SelectedField.Value := dbgDiplom.SelectedField.Value + '0';
      dbgDiplom.SelectedField.Value := dbgDiplom.SelectedField.Value +
        CurrentNum;
      CurrentNum := dbgDiplom.SelectedField.Value;
      Modified := true;
    except
      dbgDiplom.SelectedField.Value := (CurrentNum);
    end;

  if (bdown) and (CurrentVipNum <> '') and
    ((dbgDiplom.SelectedField.Value = Null) or
    (dbgDiplom.SelectedField.Value = '')) then
    try
      dbgDiplom.DataSource.DataSet.Edit;
      i := Length(CurrentVipNum);
      while (CurrentVipNum[i] = '9') and (i > 1) do
      begin
        CurrentVipNum[i] := '0';
        dec(i);
      end;
      str := inttostr(StrToInt(CurrentVipNum[i]) + 1);
      delete(CurrentVipNum, i, 1);
      insert(str, CurrentVipNum, i);
      // CurrentVipNum[i]:=(() as char);
      dbgDiplom.SelectedField.Value := CurrentVipNum;
      CurrentVipNum := dbgDiplom.SelectedField.Value;
      Modified := true;
    except
      dbgDiplom.SelectedField.Value := (CurrentVipNum);
    end;

  if (bdown) and (CurrentDplDate <> 0) and (dbgDiplom.SelectedField.Value = Null)
  then
  begin
    dbgDiplom.DataSource.DataSet.Edit;
    dbgDiplom.SelectedField.Value := CurrentDplDate;
    Modified := true;
  end;

  if (bdown) and (CurrentDplVidDate <> 0) and
    (dbgDiplom.SelectedField.Value = Null) then
  begin
    dbgDiplom.DataSource.DataSet.Edit;
    dbgDiplom.SelectedField.Value := CurrentDplVidDate;
    Modified := true;
  end;

end;

procedure TfmGroup.dbgDiplomMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  bdown := false;

end;

procedure TfmGroup.dbgDiplomTitleClick(Column: TColumnEh);
begin
  inherited;
  if (Column.FieldName <> 'PredprName') and (Column.FieldName <> 'TypeTemaName')
  then
    dmDiplom.adospDiplomList.Sort := Column.Field.DisplayName;
end;

{ procedure TfmGroup.dbgrdAttColumns5UpdateData(Sender: TObject; var Text: string;
  var Value: Variant; var UseText, Handled: Boolean);
  begin
  inherited;
  if Text = '' then
  begin
  Value := -1;
  Modified := true;
  end;
  try
  if (dbgrdAtt.Fields[1].Value = Null)or
  (dbgrdAtt.Fields[1].Text = '') then
  Text := '';

  if (Value>1) or (Value<0) then
  Text := ''
  else
  Modified := true;
  except
  end;
  end;

  procedure TfmGroup.dbgrdAttColumns6UpdateData(Sender: TObject; var Text: string;
  var Value: Variant; var UseText, Handled: Boolean);
  begin
  inherited;
  if Text = '' then
  begin
  Value := -1;
  Modified := true;
  end;
  try
  if (dbgrdAtt.Fields[1].Value = Null)or
  (dbgrdAtt.Fields[1].Text = '') then
  Text := '';
  if (Value>1000) or (Value<0) then
  Text := ''
  else
  Modified := true;
  except
  end;
  end; }

{ procedure TfmGroup.dbgrdAttKeyPress(Sender: TObject; var Key: Char);
  var mark: set of char;
  prop: set of char;
  begin
  if (dbgrdAtt.SelectedField.FieldName='PropCount') then exit;
  mark:= ['1','+','д','Д'] ;
  prop:= ['0'..'9'];

  dmUspevaemost.adodsSelAttGroup.Edit;

  if (key in mark) and (dbgrdAtt.SelectedField.FieldName='Cosenca') then

  dmUspevaemost.adodsSelAttGroup.FieldByName('Cosenca').AsString:=
  '1';

  //if (dbgrdAtt.SelectedField.FieldName='PropCount') then

  //   dmUspevaemost.adospSelAttGroup.FieldByName('Cosenca').AsString:=
  ///     '1';
  dmUspevaemost.adodsSelAttGroup.Next;
  //Key:=' ';
  //except
  //end;
  end; }

procedure TfmGroup.dbgrdBRSAttCellClick(Column: TColumnEh);
begin
  if dbgrdBRSAtt.DataSource.DataSet.Active then
    CurrentBall := dbgrdBRSAtt.Fields[5].Value;
end;

procedure TfmGroup.dbgrdBRSAttColumns4UpdateData(Sender: TObject;
  var Text: string; var Value: Variant; var UseText, Handled: Boolean);
var
  Lastballs: Integer;
begin
  if Text = '' then
  begin
    Value := Null;
    Modified := true;
  end;
  if (dbgrdBRSAtt.Fields[1].Value = Null) or (dbgrdBRSAtt.Fields[1].Text = '')
  then
    Text := '';

  if (dbgrdBRSAtt.Fields[3].Text = '') or (dbgrdBRSAtt.Fields[3].Value = Null)
  then
    Lastballs := 0
  else
    Lastballs := dbgrdBRSAtt.Fields[3].Value;

  if (Text <> '') then
    if (Value < Lastballs) then
    begin
      Text := '';
      Value := Null;
      showmessage('Количество баллов не может уменьшиться в ходе испытания!')
    end;

  if (Value > MaxBall) then
  begin
    Text := '';
    Value := Null;
    showmessage('Сумма баллов после этого испытания не может быть больше ' +
      inttostr(MaxBall) + '!')
  end
  else if (Value < 0) then
    Text := ''
  else
    Modified := true;

end;

procedure TfmGroup.dbgrdBRSExamColumns5UpdateData(Sender: TObject;
  var Text: string; var Value: Variant; var UseText, Handled: Boolean);
begin
  if (Text = '') or (dbgrdBRSExam.Fields[3].Text = '') then
  begin
    Value := Null;
    Modified := (Text = '');
    Exit;
  end;
  if (dbgrdBRSExam.Fields[1].Value = Null) or (dbgrdBRSExam.Fields[1].Text = '')
  then
    Text := '';

  if (Value < 0) then
  begin
    Text := '';
    Value := Null;
    showmessage('Количество баллов не может уменьшиться в ходе экзамена!')
  end;

  if (Value + dbgrdBRSExam.Fields[3].Value > MaxBall) then
  begin
    Text := '';
    Value := Null;
    showmessage('Сумма баллов после экзамена не может быть больше ' +
      inttostr(MaxBall) + '!')
  end
  else if (Value < 0) then
    Text := ''
  else
    Modified := true;

end;

procedure TfmGroup.dbgrdBRSExamColumns7UpdateData(Sender: TObject;
  var Text: string; var Value: Variant; var UseText, Handled: Boolean);
begin
  // or(dmUspevaemost.adodsSelBRSExamGroup.FieldByName('i_sumall').Value<60)
  if (Value < 0) or (Value > 5) then
  begin
    Value := Null;
    Text := '';
  end;

end;

procedure TfmGroup.dbgrdNaprTitleClick(Column: TColumnEh);
begin
  dmUspevaemost.adospGetAllVedNaprForDisc.Sort := Column.Field.DisplayName;
end;

procedure TfmGroup.dbgrdVedColumns4UpdateData(Sender: TObject; var Text: String;
  var Value: Variant; var UseText, Handled: Boolean);
begin
  inherited;
  Modified := true;
end;

procedure TfmGroup.sbPrntAllBlnkClick(Sender: TObject);
var
  ikFac: Integer;
  ikSpecFac: Integer;
  ikSpec: Integer;
begin

  ikSpecFac := TDBNodeSpecObject
    (frmMain.DBDekTreeView_TEST1.Selected.Parent.data).ik;
  ikSpec := TUspevGroupController.Instance.getSpecFromSpecFac(ikSpecFac);
  ikFac := TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.Selected.Parent.
    Parent.data).ik;
  TUspevGroupController.Instance.printAllBlankVedomost(ik,
    cmbxSem.ItemIndex + 1, ikFac, ikSpec);
end;

procedure TfmGroup.sbPrntAllNotesClick(Sender: TObject);
var
  ikFac: Integer;
  ikSpecFac: Integer;
  ikSpec: Integer;
begin

  ikSpecFac := TDBNodeSpecObject
    (frmMain.DBDekTreeView_TEST1.Selected.Parent.data).ik;
  ikSpec := TUspevGroupController.Instance.getSpecFromSpecFac(ikSpecFac);

  // проверка на модификацию
  DoIsModified(true);
  ikFac := TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.Selected.Parent.
    Parent.data).ik;
  TUspevGroupController.Instance.printAllVedomost(ik, cmbxSem.ItemIndex + 1,
    ikFac, ikSpec);
end;

procedure TfmGroup.actCancelDiplExecute(Sender: TObject);
begin
  inherited;
  if Modified then
  begin
    TDiplomController.Instance.CancelDiplomUpdates;
    Modified := false;
  end;
end;

procedure TfmGroup.actCloseNaprExecute(Sender: TObject);
var
  ik_ved: Integer;
begin

  try
    ik_ved := dmUspevaemost.adospGetAllVedNaprForDisc.FieldValues['ik_ved'];
  except
    showmessage('Выберите направление!');
    Exit;
  end;

  ftmNaprClose := TftmNaprClose.Create(self);
  ftmNaprClose.CloseNapr := false;
  ftmNaprClose.Tag := dmUspevaemost.adospGetAllVedNaprForDisc.FieldValues
    ['ik_zach'];
  ftmNaprClose.FormShow(Sender);
  ftmNaprClose.dbcbeNapr.KeyValue := ik_ved;
  ftmNaprClose.dbcbeNapr.Enabled := false;
  ftmNaprClose.LoadNapr;
  ftmNaprClose.showmodal;
  ftmNaprClose.Free;

  dmUspevaemost.adospGetAllVedNaprForDisc.Active := false;
  dmUspevaemost.adospGetAllVedNaprForDisc.ExecProc;
  dmUspevaemost.adospGetAllVedNaprForDisc.Active := true;
  dbgrdNapr.Refresh;

end;

procedure TfmGroup.actCreateAllVedsExecute(Sender: TObject);
begin
  inherited;
  // если создаваться будут экзамены, предупреждаем пользователя
  TUspevGroupController.Instance.CreateVeds(nSem, ik);
  // RefreshView;
end;

procedure TfmGroup.actCreateAllVedsUpdate(Sender: TObject);
var
  fl: Boolean;
begin
  // закладка ведомость
  if (cmbxSem.Value > 0) and (pcMain.ActivePage = tsVed) then
  begin
    fl := false;
    if TUspevGroupController.Instance.CanCreateDependVeds then
    begin
      fl := true;
      (Sender as TAction).Hint := 'Создать экзаменационные ведомости';
    end
    else if TUspevGroupController.Instance.CanCreateIndependVeds(nSem, ik) then
    begin
      fl := true;
      (Sender as TAction).Hint := 'Создать зачетные ведомости';
    end
    else
      (Sender as TAction).Hint := 'Создать ведомости';
    (Sender as TAction).Enabled := fl;
  end;
end;

procedure TfmGroup.actPrintAttExecute(Sender: TObject);
var
  ikFac: Integer;
begin
  inherited;
  if Modified then
    DoApply;
  // showmessage(cmbxDate.Value);
  ikFac := TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.Selected.Parent.
    Parent.data).ik;
  if IsBRS then
  begin
    if cmbxNumber.Text = 'Экзамен' then
      TUspevGroupController.Instance.PrintBRSExamVedomost(ik,
        cmbxSemAtt.ItemIndex + 1, cmbxNumber.Value, ikFac, dbdteBRSExam.Text,
        dbcbeExaminer.Text, '')
    else
      TUspevGroupController.Instance.PrintBRSVedomost(ik,
        cmbxSemAtt.ItemIndex + 1, cmbxNumber.Value, ikFac, dbdteBRSExam.Text,
        dbcbeExaminer.Text, '')
  end
  else
    TUspevGroupController.Instance.PrintAttestation(ik, dbcbeSemAtt.ItemIndex +
      1, nAtt.Value, ikFac, '');

end;

procedure TfmGroup.actPrintAttUpdate(Sender: TObject);
begin
  inherited;
  if (IsBRS) then
    if (cmbxNumber.Text = 'Экзамен') then
      actPrintAtt.Enabled := not dmUspevaemost.adodsSelBRSExamGroup.IsEmpty
    else
      actPrintAtt.Enabled := not dmUspevaemost.adodsSelAttBRSGroup.IsEmpty;
end;

procedure TfmGroup.actPrintBlankAttExecute(Sender: TObject);
var
  ikFac: Integer;
begin
  inherited;
  if Modified then
    DoApply;
  // showmessage(cmbxDate.Value);
  ikFac := TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.Selected.Parent.
    Parent.data).ik;
  if IsBRS then
    TUspevGroupController.Instance.PrintBlankAttestation(ik,
      cmbxSemAtt.ItemIndex + 1, cmbxNumber.Value, ikFac, '')
  else
    TUspevGroupController.Instance.PrintBlankAttestation(ik,
      dbcbeSemAtt.ItemIndex + 1, nAtt.Value, ikFac, '');
end;

procedure TfmGroup.actPrintBRSLastAttExecute(Sender: TObject);
var
  ikFac, ikDisc: Integer;
  datezach, dateexam, disc, exam: string;
begin
  if Modified then
    DoApply;
  ikFac := TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.Selected.Parent.
    Parent.data).ik;
  ikDisc := dmUspevaemost.adospGetAllAtt.FieldByName('ik_disc').Value;
  disc := dmUspevaemost.adospGetAllAtt.FieldByName('cName_disc').Value;
  TUspevGroupController.Instance.PrintBRSLastVedomost(ik,
    cmbxSemAtt.ItemIndex + 1, ikFac, ikDisc, datezach, dateexam, exam, disc);
end;

procedure TfmGroup.actPrintBRSRankAverageExecute(Sender: TObject);
begin
  if Modified then
    DoApply;
  TUspevGroupController.Instance.PrintBRSRankAverageReport(ik,
    cmbxSemAtt.ItemIndex + 1, cmbxNumber.Text);
end;

procedure TfmGroup.actPrintBRSRankAverageUpdate(Sender: TObject);
begin
  if (IsBRS) then
    actPrintBRSRankAverage.Enabled := (cmbxNumber.Text <> '') and
      (cmbxSemAtt.Text <> '') and (cmbxNumber.Text <> 'Экзамен');
end;

procedure TfmGroup.actPrintBRSRanksExecute(Sender: TObject);
var
  disc: string;
begin
  if Modified then
    DoApply;
  TUspevGroupController.Instance.PrintBRSRankReport(ik,
    cmbxSemAtt.ItemIndex + 1, cmbxNumber.Text);
end;

procedure TfmGroup.actPrintBRSRanksUpdate(Sender: TObject);
begin

  if (IsBRS) then
    if (cmbxNumber.Text = 'Экзамен') then
      actPrintBRSRanks.Enabled := not dmUspevaemost.adodsSelBRSExamGroup.IsEmpty
    else
      actPrintBRSRanks.Enabled := not dmUspevaemost.adodsSelAttBRSGroup.IsEmpty;
end;

procedure TfmGroup.actPrintDiplExecute(Sender: TObject);
var
  i: Integer;
  cur: TStud;
  AllRight: Boolean;
begin
  inherited;
  TApplicationController.GetInstance.AddLogEntry('Выбор печати дипломов');
  if (dbgDiplom.RowCount < 1) then
    Exit;
  // проверяем на модификацию
  if Modified then
  begin
    Application.MessageBox
      ('Данные в дипломах были изменены. Перед экспортом выписок данные нужно сохранить!',
      'Подсистема "Деканат"', MB_ICONWARNING);
    Exit;
  end;

  frmDiplomSelect := TfrmDiplomSelect.Create(self);
  try
    frmDiplomSelect.showmodal;

    if (frmDiplomSelect.DiplomList.Count < 0) then
      Exit;

    dbgDiplom.DataSource.DataSet.DisableControls;
    // while not dbgDiplom.DataSource.DataSet.Eof do
    AllRight := true;
    for i := 0 to frmDiplomSelect.DiplomList.Count - 1 do
    begin
      cur := frmDiplomSelect.DiplomList[i];
      if (dbgDiplom.DataSource.DataSet.Locate('ik_zach', cur.ikZach,
        [loPartialKey])) then
      begin
        AllRight := TDiplomController.Instance.PrintDiplVip
          (dbgDiplom.DataSource.DataSet.FieldByName('ik_zach').Value, ik,
          dbgDiplom.DataSource.DataSet.FieldByName('StudName').AsString,
          dbgDiplom.DataSource.DataSet.FieldByName('ExcelPatternName').AsString,
          dbgDiplom.DataSource.DataSet.FieldByName('ik_direction').AsInteger,
          dbgDiplom.DataSource.DataSet.FieldByName('Ik_fac').AsInteger,
          dbgDiplom.DataSource.DataSet.FieldByName('DiplVklDatPadez')
          .AsBoolean);
      end;
    end;
    if (not AllRight) then
      Application.MessageBox
        ('В дипломе не указано кол-во недель за итоговую государственную аттестацию. Чтобы все было корректно, занесите эти данные в учебный план группы.',
        'Подсистема "Деканат"', MB_ICONWARNING);
  finally
    dbgDiplom.DataSource.DataSet.EnableControls;
    frmDiplomSelect.Free;
  end;
end;

procedure TfmGroup.actPrintDiplUpdate(Sender: TObject);
begin
  inherited;
  if (pcMain.ActivePage = tsDiplom) and (dbgDiplom.DataSource.DataSet.IsEmpty)
  then
    (Sender as TAction).Enabled := false
  else
  begin
    (Sender as TAction).Enabled := true;

  end;

end;

procedure TfmGroup.actPrintEmptyNaprExecute(Sender: TObject);
var
  ik_ved: Integer;
begin
  inherited;
  try
    ik_ved := dmUspevaemost.adospGetAllVedNaprForDisc.FieldValues['ik_ved'];
  except
    showmessage('Выберите направление!');
    Exit;
  end;

  ftmNapr := TftmNapr.Create(self);
  try
    ftmNapr.PrintNapr(ik_ved, true);
  finally
    ftmNapr.Free;
  end;

end;

procedure TfmGroup.actPrintNaprExecute(Sender: TObject);
var
  ik_ved: Integer;
begin

  try
    ik_ved := dmUspevaemost.adospGetAllVedNaprForDisc.FieldValues['ik_ved'];
  except
    showmessage('Выберите направление!');
    Exit;
  end;

  ftmNapr := TftmNapr.Create(self);
  try
    ftmNapr.PrintNapr(ik_ved, false);
  finally
    ftmNapr.Free;
  end;
end;

procedure TfmGroup.actPrntAllBlnkUpdate(Sender: TObject);
begin
  // закладка ведомость
  if (cmbxSem.Value > 0) and (pcMain.ActivePage = tsVed) and
    (dmUspevaemost.adospGetAllVeds4Group.Active) then
    (Sender as TAction).Enabled :=
      (dmUspevaemost.adospGetAllVeds4Group.RecordCount > 0)
  else
    (Sender as TAction).Enabled := false;
end;

procedure TfmGroup.actPrntGroupExecute(Sender: TObject);
begin
  inherited;
  frmStudInfo := TfrmStudInfo.Create(self);
  frmStudInfo.showmodal;
  frmStudInfo.Free;
end;

procedure TfmGroup.actPrntNotesUpdate(Sender: TObject);
begin
  // закладка ведомость
  if (cmbxSem.Value > 0) and (pcMain.ActivePage = tsVed) {and
    (dmUspevaemost.adospSelVed.Active) and
    (dmUspevaemost.adospSelVedGroup.Active)} then
    (Sender as TAction).Enabled := true
  else
    (Sender as TAction).Enabled := false;

end;

procedure TfmGroup.actRaportsExecute(Sender: TObject);
begin
  TApplicationController.GetInstance.AddLogEntry
    ('Вызов диалога рапорта о недопуске');

  // Выбираем дисциплины, по кот-м есть экзамены
  if not TUspevGroupController.Instance.GetContrlVidZanForRaport(ik,
    cmbxSem.ItemIndex + 1) then
  begin
    MessageBox(Handle,
      'Произошла ошибка при выборке списка возможных экзаменов.',
      'ИС "УГТУ"', MB_OK);
    Exit;
  end;

  if dmUspevaemost.adospGetUpContRap.RecordCount = 0 then
  begin
    MessageBox(Handle, 'Список возможных экзаменов для создания рапортов пуст.',
      'ИС "УГТУ"', MB_OK);
    Exit;
  end;

  // открываем диалог
  frmRaporsDlg := TfrmRaporsDlg.Create(self);
  try
    frmRaporsDlg.nSem := cmbxSem.ItemIndex + 1;
    frmRaporsDlg.ikGroup := ik;
    // frmRaporsDlg.ikVidZan := dm.adospGetAllPredms.Fields[0].Value;
    // frmRaporsDlg.ikDisc := dm.adospGetAllPredms.Fields[1].Value;
    frmRaporsDlg.lblSemestr.Caption := inttostr(cmbxSem.ItemIndex + 1);
    frmRaporsDlg.lblGroup.Caption :=
      TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.Selected.data).Name;
    frmRaporsDlg.showmodal;
  finally
    frmRaporsDlg.Free;
  end;
end;

procedure TfmGroup.actRaportsUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := true;
end;

function TfmGroup.DoApply: Boolean;
var
  ik_grup: Integer;
  numAtt: Integer;
  str: string;
  dateAtt: TDatetime;
begin
  result := false;

  TApplicationController.GetInstance.AddLogEntry('Сохранение изменений');
  // закладка ведомость
  if pcMain.ActivePage = tsVed then
  begin
    // если ведомость закрыта, все изменения отменить
    if not dsVed.DataSet.Active then
      Exit;
    if dsVed.DataSet.FieldByName('lClose').Value = true then
    begin
      MessageBox(Handle,
        'Невозможно сохранить ведомость, так как она уже закрыта.',
        'ИС УГТУ', MB_OK);
      // отменяем все изменения
      btnCancelVedClick(nil);
      Exit;
    end;

    if dbcbVed.Text = '' then
      Exit;

    if dbcmbxPrepodVed.KeyValue = Null then
    begin
      MessageBox(Handle, 'Выберите преподавателя!', 'ИС УГТУ', MB_OK);
      Exit;
    end;

    if (dbdteEx.Text = '  .  .    ') or (dbdteEx.Value = Null) then
    begin
      MessageBox(Handle, 'Укажите дату!', 'ИС УГТУ', MB_OK);
      Exit;
    end;

    //СОХРАНЕНИЕ ВЕДОМОСТИ И ЕЕ УСПЕВАЕМОСТИ
    TApplicationController.GetInstance.AddLogEntry('Сохранение ведомости ' +
      dbcbVed.Text);
    TUspevGroupController.Instance.ApplyVed(dbeNum.Text, 0, dbcbxClosed.Checked, false,
          dbcmbxPrepodVed.KeyValue, StrToDate(dbdteEx.Text));

   // dbcbVedChange(nil);
    // загружаем список всех видов занятий со всей необх инфой
   // TUspevGroupController.Instance.GetAllVidZanyats(nSem, ik);
  end;

  // закладка "рубежные испытания"
  if pcMain.ActivePage = tsAttBRS then
  begin

    Modified := false;
    result := true;
    if dbcmbxDisc.Text = '' then
      Exit;

    dmUspevaemost.adospCheckVedClose.Connection.BeginTrans;
    try
      dbgrdBRSAtt.DataSource.DataSet.DisableControls;
      if cmbxNumber.Text = 'Экзамен' then
        TUspevGroupController.Instance.SaveBRSExam(ikVed, dbgrdBRSExam,
          dbcbeExaminer.KeyValue, dbdteBRSExam.Value)
      else if haveAtt then
        TUspevGroupController.Instance.SaveBRSAtt(ikVed, dbgrdBRSAtt,
          dbcbeExaminer.KeyValue, dbdteBRSExam.Value);

      TUspevGroupController.Instance.CloseAtt(ikVed, dbcbeExaminer.KeyValue,
        dbcbxCloseAtt.Checked);
      dmUspevaemost.adospCheckVedClose.Connection.CommitTrans;
      dbgrdBRSAtt.DataSource.DataSet.EnableControls;
    except
      TApplicationController.GetInstance.AddLogEntry
        ('Ошибка при сохранении ведомости БРС');
      dmUspevaemost.adospCheckVedClose.Connection.RollbackTrans;
      dbgrdBRSAtt.DataSource.DataSet.EnableControls;
      raise;
    end;

    Modified := false;
    dbcmbxDiscChange(nil);
  end;

  // закладка аттестации
  if pcMain.ActivePage = tsAtt then
  begin

    Modified := false;
    result := true;
    if dbcbeDisc.Text = '' then
      Exit;

    if not haveAtt then
      Exit;

    try
      dmUspevaemost.adospCheckVedClose.Connection.BeginTrans;
      dbgeAtt.DataSource.DataSet.DisableControls;
      try
        TUspevGroupController.Instance.SaveAtt(ikVed, @dbgeAtt);
      except
        TApplicationController.GetInstance.AddLogEntry
          ('Ошибка при сохранении аттестаци');

      end;

      dbgeAtt.DataSource.DataSet.EnableControls;

      // сохранение даты
      ik_grup := TDBNodeGroupObject
        (frmMain.DBDekTreeView_TEST1.SelectedObject).ik;
      numAtt := nAtt.Value;
      if dbdteAttBegin.Text <> '  .  .    ' then
        dateAtt := StrToDate(dbdteAttBegin.Text)
      else
        dateAtt := date();
      TUspevGroupController.Instance.SaveDateAllAtt(ik_grup, nSem,
        numAtt, dateAtt);

      // закрытие аттестации
      TUspevGroupController.Instance.CloseAtt(ikVed, dblcbPrepod.KeyValue,
        cbAttClose.Checked);

      Modified := false;
      dmUspevaemost.adospCheckVedClose.Connection.CommitTrans;
    except
      TApplicationController.GetInstance.AddLogEntry
        ('Ошибка при сохранении аттестаци');
      dbgeAtt.DataSource.DataSet.EnableControls;
      dmUspevaemost.adospCheckVedClose.Connection.RollbackTrans;
      raise;
    end;

    // процедура закрытия всех аттестаций
    if cbAttClose.Checked then
      if MessageBox(Handle,
        'Внимание! Будут закрыты все дисциплины в данной аттестаци.',
        'ИС Деканат', MB_YESNO) = IDYES then
      begin
        ik_grup := TDBNodeGroupObject
          (frmMain.DBDekTreeView_TEST1.SelectedObject).ik;
        numAtt := nAtt.Value;
        TUspevGroupController.Instance.CloseAllAtt(ik_grup, nSem, numAtt);
      end;
    dbcbeDiscChange(nil);

  end;

  if (pcMain.ActivePage = tsDiplom) and (Modified) then
  begin
    TDiplomController.Instance.SaveDiploms;
    Modified := false;
    result := true;
  end;

end;

procedure TfmGroup.actEditNaprExecute(Sender: TObject);
var
  ik_ved: Integer;
begin

  try
    ik_ved := dmUspevaemost.adospGetAllVedNaprForDisc.FieldValues['ik_ved'];
  except
    showmessage('Выберите направление!');
    Exit;
  end;


  ftmNaprClose := TftmNaprClose.Create(self);
  ftmNaprClose.StudZachIK := dmUspevaemost.adospGetAllVedNaprForDisc.FieldValues
    ['ik_zach'];
  //ftmNaprClose.CloseNapr := true;
  ftmNaprClose.FormShow(Sender);
  ftmNaprClose.VedIK := ik_ved;
  ftmNaprClose.Showmodal;
  //ftmNaprClose.LoadNapr;
 { if ftmNaprClose.showmodal = mrCancel then
    if not TUspevGroupController.Instance.CloseNapr(ik_ved) then
    begin
      MessageBox(Handle, 'При закрытии ведомости произошла ошибка.',
        'ИС УГТУ', MB_OK);
      Exit;
    end;     }
  ftmNaprClose.Free;

  dmUspevaemost.adospGetAllVedNaprForDisc.Active := false;
  dmUspevaemost.adospGetAllVedNaprForDisc.ExecProc;
  dmUspevaemost.adospGetAllVedNaprForDisc.Active := true;
  dbgrdNapr.Refresh;
end;

procedure TfmGroup.actEdtGroupExecute(Sender: TObject);
var
  r: Integer;
begin
  inherited;
  // dm.adospGetUchPlnGroup.Active := false;

  frmGroupEdt := TfrmGroupEdt.Create(self);
  frmGroupEdt.ik := TDBNodeGroupObject
    (frmMain.DBDekTreeView_TEST1.SelectedObject).ik;
  frmGroupEdt.SpecFacIK := TDBNodeSpecObject
    (frmMain.DBDekTreeView_TEST1.SelectedObject.Parent).ik;
  frmGroupEdt.WithSpec := false;
  frmGroupEdt.Edit := true;

  r := frmGroupEdt.showmodal;
  if ((r = mrOK) or (frmGroupEdt.bbApply.Tag = 1)) then
  begin
    DataSet.Active := false;
    DataSet.Active := true;
    frmMain.DBDekTreeView_TEST1.RefreshNodeExecute
      (frmMain.DBDekTreeView_TEST1.Selected.Parent);
  end;
  frmGroupEdt.Free;
end;

procedure TfmGroup.actCreateAttestExecute(Sender: TObject);
var
  ik_grup: Integer;
  numAtt: Integer;
begin

  ik_grup := TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.SelectedObject).ik;
  nSem := dbcbeSemAtt.ItemIndex + 1;
  numAtt := nAtt.Value;

  haveAtt := TUspevGroupController.Instance.CreateAllAtt(ik_grup, nSem,
    numAtt, IsBRS);
  actCreateAttest.Enabled := false;
  TUspevGroupController.Instance.GetAllAtt(ik_grup, nSem, numAtt, IsBRS);

  RefreshView;
end;

procedure TfmGroup.actCreateAttExecute(Sender: TObject);
var
  ik_grup: Integer;
  // nSem: Integer;
  numAtt: Integer;
begin
  inherited;

  ik_grup := TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.SelectedObject).ik;
  nSem := cmbxSemAtt.ItemIndex + 1;
  numAtt := cmbxNumber.Value;

  haveAtt := TUspevGroupController.Instance.CreateAllAtt(ik_grup, nSem,
    numAtt, IsBRS);

  actCreateAtt.Enabled := false;

  TUspevGroupController.Instance.GetAllAtt(ik_grup, nSem, numAtt, IsBRS);

  RefreshView;
end;

procedure TfmGroup.actCreateDiplomsExecute(Sender: TObject);
begin
  inherited;
  TApplicationController.GetInstance.AddLogEntry('Диплом. Создание для группы '
    + TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.SelectedObject).Name);
  TDiplomController.Instance.CreateDiploms(ik);

  TDiplomController.Instance.GetDiplomList(ik);
end;

procedure TfmGroup.actCreateDiplomsUpdate(Sender: TObject);
begin
  inherited;
  if (pcMain.ActivePage = tsDiplom) and (dbgDiplom.DataSource.DataSet.IsEmpty)
  then
    (Sender as TAction).Enabled := true
  else
    (Sender as TAction).Enabled := false;
end;

procedure TfmGroup.actDelAttExecute(Sender: TObject);
begin
  if MessageBox(Handle, 'Вы уверены, что хотите удалить дисциплину?', 'ИС УГТУ',
    MB_YESNO) = IDYES then
  begin
    // удаление дисциплины
    TUspevGroupController.Instance.DelVed(ikVed);
    // все переоткрываем
    dbcmbxDisc.Value := Null;
    dmUspevaemost.adodsSelAttGroup.close;
    dmUspevaemost.adospGetAllAtt.close;
    dmUspevaemost.adospGetAllAtt.open;
    dmUspevaemost.adospGetAllAtt.First;
    // обновляем список всех видов занятий со всей необх инфой
    TUspevGroupController.Instance.GetAllAtt(ik, nSem, cmbxNumber.Value, IsBRS);
  end;
end;

procedure TfmGroup.actDelGroupExecute(Sender: TObject);
var
  ik: Integer;
  Grp: TDBNodeGroupObject;
begin
  inherited;
  Grp := TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.SelectedObject);
  if MessageBox(Handle, 'Вы уверены, что хотите удалить выбранные группы?',
    'ИС УГТУ', MB_YESNO) = IDYES then
  { if MessageDlg('Вы уверены, что хотите удалить выбранные группы?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then }
  begin
    ik := Grp.ik;
    try
      with dmGroupActions.adospAppendGrup.Parameters do
      begin
        ParamByName('@flag').Value := -1;
        ParamByName('@ik_spec_fac').Value := Null;
        ParamByName('@Cname_grup').Value := Null;
        ParamByName('@Ik_uch_plan').Value := Null;
        ParamByName('@nYear_post').Value := Null;
        ParamByName('@Ik_grup').Value := ik;
      end;
      dmGroupActions.adospAppendGrup.ExecProc;
      DataSet.Active := false;
      DataSet.Active := true;
      frmMain.DBDekTreeView_TEST1.RefreshNodeExecute
        (frmMain.DBDekTreeView_TEST1.Selected.Parent);
    except
      showmessage
        ('Невозможно удалить группу. Существуют данные, связанные с группой: студенты, ведомости и т.д.');
    end;

  end;
end;

procedure TfmGroup.actDelNaprExecute(Sender: TObject);
begin
  if MessageBox(Handle, 'Вы уверены, что хотите удалить направление?',
    'ИС УГТУ', MB_YESNO) = IDYES then
  begin
    // удаление ведомости
    TUspevGroupController.Instance.DelVed
      (dmUspevaemost.adospGetAllVedNaprForDisc.FieldByName('ik_ved').Value);
    // все переоткрываем
    dmUspevaemost.adospGetAllVedNaprForDisc.close;
    dmUspevaemost.adospGetAllVedNaprForDisc.open;
  end;
end;

procedure TfmGroup.actDelNaprUpdate(Sender: TObject);
begin
  if (dmUspevaemost.adospGetAllVedNaprForDisc.Active) then
    (Sender as TAction).Enabled :=
      (dmUspevaemost.adospGetAllVedNaprForDisc.RecordCount > 0)
  else
    (Sender as TAction).Enabled := false;
end;

procedure TfmGroup.actDelVedExecute(Sender: TObject);
begin
  // inherited;
  if MessageBox(Handle, 'Вы уверены, что хотите удалить ведомость?', 'ИС УГТУ',
    MB_YESNO) = IDYES then
  begin
    // удаление ведомости
    TUspevGroupController.Instance.DelVed(ikVed);
    Modified := false;
    // все переоткрываем
    dbcbVed.Value := Null;
    dmUspevaemost.adospSelVedGroup.close;
    dmUspevaemost.adospGetAllVeds4Group.close;
    dmUspevaemost.adospGetAllVeds4Group.open;
    dmUspevaemost.adospGetAllVeds4Group.First;
    // обновляем список всех видов занятий со всей необх инфой
    TUspevGroupController.Instance.GetAllVidZanyats(nSem, ik);
  end;
end;

procedure TfmGroup.actDelVedUpdate(Sender: TObject);
begin
  if (dmUspevaemost.adospSelVed.Active) and
    (dmUspevaemost.adospSelVedGroup.Active) then
    (Sender as TAction).Enabled :=
      (not dmUspevaemost.adospSelVed.FieldByName('lClose').AsBoolean)
  else
    (Sender as TAction).Enabled := false;

end;

procedure TfmGroup.actMkVinExecute(Sender: TObject);
begin
  TApplicationController.GetInstance.AddLogEntry
    ('Вызов диалога создания выносного экзамена');

  if not TUspevGroupController.Instance.SelContrlForVinVed(ik,
    cmbxSem.ItemIndex + 1) then
    Exit;

  if dmUspevaemost.adosp4VinVed.RecordCount = 0 then
  begin
    TApplicationController.GetInstance.AddLogEntry
      ('Список возможных выносных экзаменов пуст');
    MessageBox(Handle, 'Список возможных экзаменов для создания выносных пуст.',
      'ИС "УГТУ"', MB_OK);
    Exit;
  end;

  // открываем диалог
  frmVinEkz := TfrmVinEkz.Create(self);
  try
    frmVinEkz.ikGroup := ik;
    frmVinEkz.nSem := cmbxSem.ItemIndex + 1;
    frmVinEkz.showmodal;
  finally
    frmVinEkz.Free;
  end;
  cmbxSemChange(Sender);
end;

procedure TfmGroup.actMkVinUpdate(Sender: TObject);
begin
  // закладка ведомость
  if (cmbxSem.Value > 0) and (pcMain.ActivePage = tsVed) then
    (Sender as TAction).Enabled :=
      TUspevGroupController.Instance.CanCreateVnostVed
  else
    (Sender as TAction).Enabled := false;

end;

procedure TfmGroup.actNaprRegisterExecute(Sender: TObject);
begin
  frmNaprRegister := TfrmNaprRegister.Create(self);
  try
    frmNaprRegister.ik_sem := nSem;
    frmNaprRegister.Tag := dmUspevaemost.adospSelVedGroup.FieldByName('ik_zach')
      .AsInteger;
    frmNaprRegister.Hint := inttostr(ik);
    frmNaprRegister.ik_up_content := dmUspevaemost.adospGetAllVeds4Group.
      FieldByName('ik_upContent').AsInteger;

    frmNaprRegister.showmodal;
  finally
    frmNaprRegister.Free;
  end;

end;

procedure TfmGroup.DoCancel;
begin
  // result:=false;
end;

procedure TfmGroup.DoCreate;
begin
  // result:=false;
end;

procedure TfmGroup.SpeedButton2Click(Sender: TObject);
begin
  frmMain.actAddStudentFormShow.Execute;
end;

procedure TfmGroup.SpeedButton3Click(Sender: TObject);
begin
  frmMain.actLevelUp.Execute;
end;

procedure TfmGroup.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  frmMain.actViewUchPlan.Execute;
end;

procedure TfmGroup.ToolButton13Click(Sender: TObject);
begin
  cmbxUspSemChange(Sender);
end;

procedure TfmGroup.ToolButton9Click(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  for i := 0 to DataSource1.DataSet.FieldCount do
    showmessage(DataSource1.DataSet.Fields[i].DisplayName);
end;

procedure TfmGroup.actRefreshDopuskExecute(Sender: TObject);
var
  tmpStr: String;
  // ikFac: integer;
begin
  TApplicationController.GetInstance.AddLogEntry('Обновление допусков');

  if Modified then
  begin
    tmpStr := 'Данные ведомости для ' + inttostr(cmbxSem.ItemIndex + 1) +
      ' семестра по ' + dmUspevaemost.adospGetAllVeds4Group.FieldByName
      ('cName_Disc').Value + ' были изменены. Сохранить изменения?';
    if MessageBox(Handle, PWideChar(tmpStr), 'ИС УГТУ', MB_YESNO) = IDYES then
      btnSaveVed.Click
    else
      RefreshView;
  end;

  if not TUspevGroupController.Instance.UpdateDopuskForVed(ikVed) then
  begin
    MessageBox(Handle, 'Произошла ошибка при обновлении допусков.',
      'ИС "УГТУ"', MB_OK);
  end;
  RefreshView;
end;

procedure TfmGroup.actRefreshDopuskUpdate(Sender: TObject);
begin
  if dmUspevaemost.adospSelVed.Active then
    (Sender as TAction).Enabled := dmUspevaemost.adospSelVed.FieldByName
      ('HasDopusk').AsBoolean and
      (not dmUspevaemost.adospSelVed.FieldByName('lClose').AsBoolean)
  else
    (Sender as TAction).Enabled := false;
end;

procedure TfmGroup.actRefreshVedStudsExecute(Sender: TObject);
var
  tempStoredProc: TADOStoredProc;
  studNames: string;
  flAreChanged: Boolean;
begin
  inherited;
  TApplicationController.GetInstance.AddLogEntry
    ('Обновление cписка студентов ведомости ' + inttostr(ikVed));
  tempStoredProc := TADOStoredProc.Create(nil);
  try
    tempStoredProc.ProcedureName := 'UspevUpdateVedomost;1';
    tempStoredProc.Connection := dm.DBConnect;
    tempStoredProc.Parameters.CreateParameter('@Ik_ved', ftInteger, pdInput,
      4, ikVed);
    tempStoredProc.Active := true;
    tempStoredProc.First; // FIO
    studNames := '';
    flAreChanged := false;
    while not tempStoredProc.Eof do
    begin
      if (flAreChanged) then
        studNames := studNames + ', ';
      studNames := studNames + ' ' + tempStoredProc.FieldByName
        ('StudName').Value;
      flAreChanged := true;
      tempStoredProc.Next;
    end;
    if (flAreChanged) then
    begin
      studNames := 'Студенты ' + studNames +
        ' не были удалены из ведомости, потому что у них есть оценка. Если нужно их удалить, предварительно удалите оценки';
      MessageBox(Handle, PWideChar(studNames), 'ИС Деканат', MB_OK);
    end;
  finally
    tempStoredProc.Free;
  end;
  dbcbVedChange(nil);
end;

procedure TfmGroup.actRefreshVedStudsUpdate(Sender: TObject);
begin
  inherited;
  if dmUspevaemost.adospSelVed.Active then
    (Sender as TAction).Enabled :=
      (not dmUspevaemost.adospSelVed.FieldByName('lClose').AsBoolean)
  else
    (Sender as TAction).Enabled := false;
end;

procedure TfmGroup.actSaveBRSExecute(Sender: TObject);
begin
  inherited;
  DoApply;
end;

procedure TfmGroup.actSaveBRSUpdate(Sender: TObject);
begin
  inherited;

  try
    if (cmbxNumber.Text = 'Экзамен') and (dmUspevaemost.adospSelBRSExam.Active)
    then
    begin
      actSaveBRS.Enabled :=
        not(dmUspevaemost.adospSelBRSExam.FieldByName('lClose').AsBoolean);
    end
    else if not dmUspevaemost.adospSelAtt.IsEmpty then
      actSaveBRS.Enabled := (not dmUspevaemost.adospSelAtt.FieldByName('lClose')
        .AsBoolean) and
        (not((dbdteBRSExam.Text = '  .  .    ') or (dbcbeExaminer.Text = '')));

  except
    actSaveBRS.Enabled := false;
  end;

end;

procedure TfmGroup.actSaveDiplExecute(Sender: TObject);
begin
  inherited;
  Apply;
end;

procedure TfmGroup.actSaveDiplUpdate(Sender: TObject);
begin
  inherited;
  if pcMain.ActivePage = tsDiplom then
    (Sender as TAction).Enabled := Modified;

end;

procedure TfmGroup.actSaveVedExecute(Sender: TObject);
begin
  DoApply;

end;

procedure TfmGroup.actSaveVedUpdate(Sender: TObject);
begin
  inherited;
  if (dmUspevaemost.adospSelVed.Active) then
    (Sender as TAction).Enabled := not dmUspevaemost.adospSelVed.FieldByName
      ('lClose').AsBoolean;
end;

procedure TfmGroup.actUpdateDiplomsExecute(Sender: TObject);
begin
  inherited;
  TApplicationController.GetInstance.AddLogEntry('Диплом. Обновление данных');
  LoadDiploms;
end;

procedure TfmGroup.actUpdateDiplomsUpdate(Sender: TObject);
begin
  inherited;
  if (pcMain.ActivePage = tsDiplom) and
    (not dbgDiplom.DataSource.DataSet.IsEmpty) then
    (Sender as TAction).Enabled := true
  else
    (Sender as TAction).Enabled := false;

end;

procedure TfmGroup.actUspevforStipendExecute(Sender: TObject);
var
  Report: TReportBase;
begin
  Report := TReportBase.CreateReport(TGrupUspevForStipend);
  Report.FreeOnComplete := true;
  Report.OnExecuteError := ExecuteError;
  Report.ReportTemplate := ExtractFilePath(Application.ExeName) +
    'reports\UspevForStipend.xlt';
  TGrupUspevForStipend(Report).Connection := Connection;
  TGrupUspevForStipend(Report).ikFac := Fac_ik;
  TGrupUspevForStipend(Report).ikGrup := ik;
  TGrupUspevForStipend(Report).nSem := cmbxUspSem.Value;
  TWaitingController.GetInstance.Process(Report);
end;

procedure TfmGroup.ExecuteError(Sender: TObject; E: Exception);
begin
  showmessage('Произошла ошибка при экспорте успеваемости группы: ' +
    E.Message);
  (Sender as TReportBase).Quit;
end;

function TfmGroup.IsBRS: Boolean;
begin
  { result:=false;

    if Frameobject=nil then exit;

    dmUchPlan.adodsUchPlan.close;
    dmUchPlan.adodsUchPlan.CommandText := 'select * from Uch_pl where (ik_uch_plan = '+inttostr((Frameobject as TDBNodeGroupObject).UchPlanIK)+')';
    dmUchPlan.adodsUchPlan.open;
    if (dmUchPlan.adodsUchPlan.FieldByName('IsBRSPlan').Value <> NULL) then
    result := (dmUchPlan.adodsUchPlan.FieldByName('IsBRSPlan').Value)
    else result :=false; }

  if pcMain.ActivePage = tsAttBRS then
    result := true
  else
    result := false;

end;

procedure TfmGroup.actUspevToExcelExecute(Sender: TObject);
begin
  if (sgUspev.ColCount < 2) then
  begin
    MessageBox(Handle, 'Нет данных для экспорта в Excel.', 'ИС "УГТУ"', MB_OK);
    Exit;
  end;

  // выгрузка успеваемости
  if not TUspevGroupController.Instance.PrintUspevToExcel(sgUspev) then
    MessageBox(Handle, 'Произошла ошибка при выгрузке успеваемости в Excel.',
      'ИС "УГТУ"', MB_OK);

end;

procedure TfmGroup.actUspevToExcelUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (sgUspev.ColCount > 1);
end;

procedure TfmGroup.CheckAttExist;
var
  ik_grup, nSem, nom_ved, nmodule: Integer;
  kolAtt, kol_rec: Integer;
  // dateAtt: TDate;
begin

  if (cmbxNumber.Value = Null) or (cmbxNumber.Text = '') then
    Exit;

  actCreateAtt.Enabled := true;
  nSem := cmbxSemAtt.ItemIndex + 1;
  nom_ved := cmbxNumber.Value;
  ik_grup := TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.SelectedObject).ik;
  haveAtt := false;

  // получаем список предметов для аттестации, которые должны быть GetAttestVidZanyat
  kolAtt := TUspevGroupController.Instance.GetAttVidZan(ik, nSem,
    nom_ved, IsBRS);
  dmUspevaemost.adospGetAttVidZan.First;

  if kolAtt = 0 then
  begin
    MessageBox(Handle, 'В учебном плане нет ни одной аттестации!',
      'ИС УГТУ', MB_OK);
    dmUspevaemost.adospGetAllAtt.Active := false;
    Exit;
  end;

  // выборка всех СУЩЕСТВУЮЩИХ ведомостей (процедура GetAllAttestForBRSGrup/GetAllAttestForGrup)
  kol_rec := TUspevGroupController.Instance.GetAllAtt(ik_grup, nSem,
    nom_ved, IsBRS);

  // проверка, созданы ли все аттестации по учебному плану для этого семестра
  if kolAtt > kol_rec // dmUspevaemost.adospGetAllAtt.RecordCount
  then
  begin
    // если часть аттестаций не создана, но есть созданные
    if dmUspevaemost.adospGetAllAtt.RecordCount <> 0 then
    begin
      // создаём все недостающие аттестации
      haveAtt := TUspevGroupController.Instance.CreateAllAtt(ik_grup, nSem,
        nom_ved, IsBRS);
    end
    else // если не создана ни одна аттестации
    begin
      if MessageBox(Handle,
        'Не создано ни одной аттестации. Создать их сейчас?', 'ИС УГТУ',
        MB_YESNO) = IDYES then
        // если согласились - создаём...
        haveAtt := TUspevGroupController.Instance.CreateAllAtt(ik_grup, nSem,
          nom_ved, IsBRS)
      else
        haveAtt := false; // отмечаем отсутствие аттестаций флагом
    end;
  end
  else
  begin
    haveAtt := true;

  end;

  // if haveAtt then cmbxDate.ItemIndex:=0;
  TUspevGroupController.Instance.GetAllAtt(ik_grup, nSem, nom_ved, IsBRS);

  actCreateAtt.Enabled := not haveAtt;
  actPrintBlankAtt.Enabled := haveAtt;
  actPrintAtt.Enabled := haveAtt;
end;

procedure TfmGroup.CheckBRSExamExist;
var
  ik_grup, nSem: Integer;
  kolExam, kol_rec: Integer;

begin

  if (cmbxNumber.Value = Null) or (cmbxNumber.Text = '') then
    Exit;

  // actCreateAtt.Enabled := true;
  nSem := cmbxSemAtt.ItemIndex + 1;
  ik_grup := TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.SelectedObject).ik;
  haveAtt := false;

  // получаем список предметов для экзаменов БРС, которые должны быть
  kolExam := TUspevGroupController.Instance.GetBRSExamVidZan(ik, nSem);
  dmUspevaemost.adospGetBRSExamVidZan.First;

  if kolExam = 0 then
  begin
    MessageBox(Handle, 'В учебном плане нет ни одного экзамена БРС!',
      'ИС УГТУ', MB_OK);
    dmUspevaemost.adospGetAllBRSExam.Active := false;
    Exit;
  end;
  // выборка всех СУЩЕСТВУЮЩИХ экзаменов

  kol_rec := TUspevGroupController.Instance.GetAllBRSExam(ik_grup, nSem);

  // проверка, созданы ли все экзамены БРС по учебному плану для этого семестра
  if kolExam > kol_rec then
  begin
    // если часть аттестаций не создана, но есть созданные
    if dmUspevaemost.adospGetAllBRSExam.RecordCount <> 0 then
      // создаём все недостающие экзамены
      TUspevGroupController.Instance.CreateAllBRSExam(ik_grup, nSem)

    else // если не создан ни один экзамен
    begin
      if MessageBox(Handle,
        'Не создано ни одного экзамена БРС. Создать их сейчас?', 'ИС УГТУ',
        MB_YESNO) = IDYES then
        // если согласились - создаём...
        TUspevGroupController.Instance.CreateAllBRSExam(ik_grup, nSem);
      // else
      haveAtt := false; // отмечаем отсутствие аттестаций флагом
    end;
  end
  else
    haveAtt := true;

  // if haveAtt then cmbxDate.ItemIndex:=0;
  TUspevGroupController.Instance.GetAllBRSExam(ik_grup, nSem);

  actCreateAtt.Enabled := false;
  actPrintBlankAtt.Enabled := false;
  actPrintAtt.Enabled := false;
end;

procedure TfmGroup.CheckSimpleAttExist;
var
  ik_grup, nSem, nom_ved, nmodule: Integer;
  kolAtt, kol_rec: Integer;
  // dateAtt: TDate;
begin

  if (nAtt.Value = Null) or (nAtt.Text = '') then
    Exit;

  // проверить Action на соответствии обычным аттестациям
  actCreateAttest.Enabled := true;
  nSem := dbcbeSemAtt.ItemIndex + 1;
  nom_ved := nAtt.Value;
  ik_grup := TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.SelectedObject).ik;
  haveAtt := false;

  // получаем список предметов для аттестации, которые должны быть
  kolAtt := TUspevGroupController.Instance.GetAttVidZan(ik, nSem,
    nom_ved, IsBRS);
  dmUspevaemost.adospGetAttVidZan.First;

  if kolAtt = 0 then
  begin
    MessageBox(Handle, 'В учебном плане нет ни одной аттестации!',
      'ИС УГТУ', MB_OK);
    dmUspevaemost.adospGetAllAtt.Active := false;
    Exit;
  end;
  // выборка всех СУЩЕСТВУЮЩИХ аттестаций

  kol_rec := TUspevGroupController.Instance.GetAllAtt(ik_grup, nSem,
    nom_ved, IsBRS);

  // проверка, созданы ли все аттестации по учебному плану для этого семестра
  if kolAtt > kol_rec // dmUspevaemost.adospGetAllAtt.RecordCount
  then
  begin
    // если часть аттестаций не создана, но есть созданные
    if dmUspevaemost.adospGetAllAtt.RecordCount <> 0 then
    begin
      // создаём все недостающие аттестации
      haveAtt := TUspevGroupController.Instance.CreateAllAtt(ik_grup, nSem,
        nom_ved, IsBRS);
    end
    else // если не создана ни одна аттестации
    begin
      if MessageBox(Handle,
        'Не создано ни одной аттестации? Создать их сейчас?', 'ИС УГТУ',
        MB_YESNO) = IDYES then
        // если согласились - создаём...
        TUspevGroupController.Instance.CreateAllAtt(ik_grup, nSem,
          nom_ved, IsBRS)
      else
        haveAtt := false; // отмечаем отсутствие аттестаций флагом
    end;
  end
  else
  begin
    haveAtt := true;

  end;

  // if haveAtt then cmbxDate.ItemIndex:=0;
  TUspevGroupController.Instance.GetAllAtt(ik_grup, nSem, nom_ved, IsBRS);

  actCreateAttest.Enabled := not haveAtt;
  actPrintBlankAtt.Enabled := haveAtt;
  actPrintAtt.Enabled := haveAtt;
end;

end.
