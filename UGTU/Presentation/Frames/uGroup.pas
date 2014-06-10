unit uGroup;
   {#Author tanyav@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseFrame, StdCtrls, Buttons, ToolWin, ComCtrls, ExtCtrls, DB,
  ADODB, Grids, DBGridEh, uMain, Mask, DBCtrlsEh, DBLookupEh, DateUtils,
  ImgList, ActnList, GridsEh, ComObj, uUspevGroupController, uDMStudentData,
  Menus, uNaprRegisterDialog, ReportsBase, uWaitingController,
  ApplicationController, D_GrupUspevForStipend, uDMUchPlan, uAverageBalls, DBTVSpecObj;

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
    procedure dbgDiplomMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
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
    nSem: integer;
    ikVed: Integer;
    ikVidZan: Integer;
    ikPredm: Integer;
    discName:string;
    FMaxBall:integer;
    function DoIsModified(flag: boolean):boolean;
    function DoIsModifiedDiploms:boolean;

    procedure LoadVedHeader();
    function CheckOcenka(Value: integer): string;
    function IsBRS:boolean;

    procedure RefreshView;
    procedure CheckEnabled;
    //GetCanCreateVeds ����������, �������� �� �������� ����������
    //(���������, ������� �� ��� ��������� ��������)
    //function GetCanCreateVeds(AllZachsCreated:boolean):boolean;
    procedure CheckVedsExist;
    procedure CheckAttExist;
    procedure CheckBRSExamExist;
    procedure CheckSimpleAttExist;
    procedure SetVedEnabled;
    procedure LoadDiploms;

    procedure AttestRefresh;
    procedure BRSExamRefresh;
  protected
     procedure DoCancel;override;
     procedure DoCreate;override;
     function DoApply: Boolean;override;
     procedure DoRefreshFrame; override;
  public
    { Public declarations }
    property ik: Integer read Fik write Fik;
    property Fac_ik: Integer read FFac_ik write FFac_ik;
    property MaxBall: Integer read FMaxBall write FMaxBall;

    procedure Read;
    procedure SetColor(canvas:TCanvas; const Rect: TRect; Field: string; RowColor,TextColor:TColor);

  end;

var
  fmGroup: TfmGroup;
  CurrentNum:string;        //������� ���. �����
  CurrentVipNum:string;        //������� ����� ������� � �������
  CurrentDplDate:TDatetime;    //������� ���� ������
  CurrentDplVidDate:TDatetime;    //������� ���� ������
  bdown, editMode, NumColumn:boolean;
  CurrentBall:variant;

implementation

uses uDM, uBlankRep, DBTVgroupObj, DBTVFacObj, uStudInfo,
  uRaports, uGroupEdtDlg, uVinEkz, uDMGroupActions, uDMUspevaemost,
  uDMUgtuStructure, uNaprClose, uNapr,
  Conditions, CorrectDatatypeChecks, Parser, uDiplomController,
  uDMDiplom, uDiplomStudSelect;

{$R *.dfm}

{ TfmGroup }

function ChangeMonthDayPlaces(date:TDateTime):string;
var
  s1:string;
begin
  result:=DatetoStr(date);
  s1:=result;
  result[1]:=s1[4];
  result[2]:=s1[5];
  result[4]:=s1[1];
  result[5]:=s1[2];
end;

procedure TfmGroup.Read;
var ik:integer;
begin
  dmStudentData.adodsSmallGroup.Active:=false;
  dmStudentData.adodsSmallGroup.CommandText:=DataSet.CommandText;
  dmStudentData.adodsSmallGroup.Active:=true;
  DataSource1.DataSet := dmStudentData.adodsSmallGroup;
  Modified := false;
  ik:= (Frameobject as TDBNodeGroupObject).UchPlanIK;
  dmUchPlan.adodsUchPlan.close;
  dmUchPlan.adodsUchPlan.CommandText := 'select * from Uch_pl where (ik_uch_plan = '+inttostr(ik)+')';
  dmUchPlan.adodsUchPlan.open;
  {if (dmUchPlan.adodsUchPlan.FieldByName('IsBRSPlan').Value <> NULL) then
  FIsBRS := (dmUchPlan.adodsUchPlan.FieldByName('IsBRSPlan').Value)
  else FIsBRS :=false;

  if FIsBRS then
    tsAtt.Caption := '�������� ��������'
    else tsAtt.Caption := '����������';
  }
end;

procedure TfmGroup.dbgStudListDblClick(Sender: TObject);
var r:integer;
begin
try
  r:=DataSource1.DataSet.FieldValues['ncode'];
  DataSource1.DataSet:=nil;
  SelectInTreeById(r);
  dmStudentData.adodsSmallGroup.Active:=false;
dmStudentData.adodsSmallGroup.CommandText:=DataSet.CommandText;
dmStudentData.adodsSmallGroup.Active:=true;
  DataSource1.DataSet := dmStudentData.adodsSmallGroup;
except
end;
end;

procedure TfmGroup.dbgStudListTitleClick(Column: TColumnEh);
begin
 dmStudentData.adodsSmallGroup.Sort:='['+Column.Field.FieldName+']';
end;

procedure TfmGroup.dblcbPrepodChange(Sender: TObject);
begin
  Modified := true;
end;

procedure TfmGroup.DoRefreshFrame;
var ndGroup:TDBNodeGroupObject;
    OldYear: integer;
begin
  if not (frmMain.DBDekTreeView_TEST1.SelectedObject is TDBNodeGroupObject) then
    Exit;
  pcMain.ActivePageIndex := 0;
  ndGroup := (frmMain.DBDekTreeView_TEST1.SelectedObject as TDBNodeGroupObject);
  fac_ik:= TDBNodeFacultyObject(frmMain.DBDekTreeView_TEST1.Selected.Parent.Parent.data).ik  ;
  DataSet := ndGroup.AdoDataset;
  read;
  dbgStudList.Refresh;
  nSem:=0;

  //���������, ������� �� ���������� ������� � ���������
  OldYear:= YearOf(Today)
      -TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.SelectedObject).FoundYear;
  if (OldYear>=TDBNodeSpecObject(frmMain.DBDekTreeView_TEST1.Selected.Parent.data).StudyYears) then
    tsDiplom.TabVisible:= true
  else
    tsDiplom.TabVisible:= false;
  //cmbxSemChange(nil);

  dbgrdBRSAtt.Refresh;

  dmUspevaemost.adospGetAllVeds4Group.Close;
  dmUspevaemost.adospPrepodVed.Close;
  dmUspevaemost.adospSelVedGroup.Close;
end;

procedure TfmGroup.eQuickFilterChange(Sender: TObject);
var
  ValuesList: TStringList;
  i,j: Integer;
  CommonCondition,InnerCondition: TConditionGroup;
  Field,Operation,Value: String;
begin
  inherited;
  if Length(eQuickFilter.Text) = 0 then
    dbgStudList.DataSource.DataSet.Filtered := false
  else
  begin
    //����� ������� - ��� ���� �������� �������� � ���� ����� �������
    CommonCondition := TConditionGroup.Create('AND', true);
    //������ �������� ��������
    ValuesList := TStringList.Create;
    ParseString(eQuickFilter.Text,[' '],ValuesList);
    for i := 0 to ValuesList.Count - 1 do
    begin
      //������ ������� - ���� �� ���� ������� ������������� ��������
      InnerCondition := TConditionGroup.Create('OR', true);
      for j := 0 to dbgStudList.DataSource.DataSet.Fields.Count - 1 do
        if dbgStudList.DataSource.DataSet.Fields[j].Visible and
          (dbgStudList.DataSource.DataSet.Fields[j].FieldKind <> fkCalculated) then
          begin
            Field := '';
            Operation := '';
            Value := '';
            case dbgStudList.DataSource.DataSet.Fields[j].DataType of
            ftString:
            begin
              Field := dbgStudList.DataSource.DataSet.Fields[j].FieldName;
              Operation := 'like';
              Value := QuotedStr('%' + ValuesList.Strings[i]+'%');
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
                Value := QuotedStr(DateToStr(StrToDate(ValuesList.Strings[i])));
              end;
            end;
            ftTime:
            begin
              if IsCorrectTime(ValuesList.Strings[i]) then
              begin
                Field := dbgStudList.DataSource.DataSet.Fields[j].FieldName;
                Operation := '=';
                Value := QuotedStr(TimeToStr(StrToTime(ValuesList.Strings[i])));
              end;
            end;
            ftDateTime:
            begin
              if IsCorrectDateTime(ValuesList.Strings[i]) then
              begin
                Field := dbgStudList.DataSource.DataSet.Fields[j].FieldName;
                Operation := '=';
                Value := QuotedStr(DateTimeToStr(StrToDateTime(ValuesList.Strings[i])));
              end;
            end;
            end;
            if Length(Value) > 0 then
              InnerCondition.AddCondition(TCondition.Create(Field, Operation, Value));
          end;
      CommonCondition.AddCondition(InnerCondition);
    end;
  {���� ��� ����� ����:
  ftUnknown, ftSmallint, ftWord, ftBoolean, ftCurrency, ftBCD, ftBytes,
   ftVarBytes, ftAutoInc, ftBlob, ftMemo, ftGraphic, ftFmtMemo, ftParadoxOle,
   ftDBaseOle, ftTypedBinary, ftCursor, ftFixedChar, ftWideString, ftLargeint,
   ftADT, ftArray, ftReference, ftDataSet, ftOraBlob, ftOraClob, ftVariant,
   ftInterface, ftIDispatch, ftGuid, ftTimeStamp, ftFMTBcd, ftFixedWideChar,
   ftWideMemo, ftOraTimeStamp, ftOraInterval}
    Memo1.Text := CommonCondition.AsText;
    //dbgStudList.DataSource.DataSet.Filter := CommonCondition.AsText;
    //dbgStudList.DataSource.DataSet.Filtered := true;
    ValuesList.Free;
    CommonCondition.Free;
  end;
end;

procedure TfmGroup.cmbxNumberChange(Sender: TObject);
var tmpStr: string;
begin
 // inherited;
  if (cmbxNumber.Text = '') then
    Exit;

  if Modified then
  begin
    tmpStr := '������ ���������� ��� '+IntToStr(nSem)+
                ' �������� �� '+
                dmUspevaemost.adospGetAllAtt.FieldByName('cName_Disc').Value+
                ' ���� ��������. ��������� ���������?';
    if MessageBox(Handle, PAnsiChar(tmpStr), '�� ����', MB_YESNO)=IDYES
    then
      btnSaveAtt.Click
    else
      Modified := false;
  end;
  // ������� ��������� � ���� �������� �� �������� �����
  dbcmbxDisc.KeyValue := -1;
  //cmbxDate.ItemIndex := -1;
  dmUspevaemost.adodsSelAttGroup.Active := false;
  dmUspevaemost.adodsSelAttBRSGroup.Active := false;
  dmUspevaemost.adodsSelBRSExamGroup.Active := false;

  {with dmUspevaemost.adospPrepodVed do
  begin
  Active:=false;
  Parameters[1].Value:=Ik;
  Parameters[2].Value:=Null;
  Parameters[3].Value:=strtoint(cmbxNumber.text);
  Active:=true;
  end;}

  actPrintBlankAtt.Enabled := false;
  actPrintAtt.Enabled := false;
  Modified := false;

  if cmbxNumber.Text='�������' then
  begin
  dbcmbxDisc.ListSource := dmUspevaemost.dsGetAllBRSExam;
  CheckBRSExamExist;
  end
  else
  if cmbxNumber.Text='�����' then
  begin

  end else
  begin
  dbcmbxDisc.ListSource := dmUspevaemost.dsGetAllAtt;
  CheckAttExist;
  end;

  dmUspevaemost.aspPrepodVedFromUchPlan.Active:=false;
  dmUspevaemost.adospSelAtt.Active:=false;
  dbcbxCloseAtt.Checked:=false;
  dbdteBRSExam.Value := Today;

end;

procedure TfmGroup.cmbxSemAttChange(Sender: TObject);
var tmpStr: string;
begin
  inherited;
  //����� ���������� (ik_grup, nsem, ik_vid_zanyat=33)

  if Modified then
  begin
    tmpStr := '������ ���������� ��� '+IntToStr(nSem)+
                ' �������� �� '+
                dmUspevaemost.adospGetAllAtt.FieldByName('cName_Disc').Value+
                ' ���� ��������. ��������� ���������?';
    if MessageBox(Handle, PAnsiChar(tmpStr), '�� ����', MB_YESNO)=IDYES
    then
      btnSaveAtt.Click
    else
      Modified := false;
  end;
  // ������� ��������� � ���� �������� �� �������� �����
  dbcmbxDisc.KeyValue := -1;
  dbcmbxDisc.ListSource.DataSet.Active:=false;
  cmbxNumber.ItemIndex := -1;
  dmUspevaemost.adodsSelAttGroup.Active := false;
  actCreateAtt.Enabled := false;
  actPrintBlankAtt.Enabled := false;
  actPrintAtt.Enabled := false;
  Modified := false;
  nSem:=cmbxSemAtt.ItemIndex+1;
  //CheckAttExist;
end;

procedure TfmGroup.cmbxSemChange(Sender: TObject);
begin
  inherited;
//  if cmbxSem.Text='' then cmbxSem.ItemIndex := 0;
  
  //���� ����� �������� �������, ������ �������
  {if nSem=(cmbxSem.ItemIndex+1) then
     exit; }
  //��������� ����������� �������� ���������
  //���� ������� ������ ��������, ������������ � �������� ��������
  if not DoIsModified(false) then
  begin
    cmbxSem.ItemIndex:= nSem-1;
    exit;
  end;
  ikVed:= -1;
  TApplicationController.GetInstance.AddLogEntry('���������. ����� ��������'+inttostr(cmbxSem.ItemIndex+1));
  dbcmbxPrepodVed.KeyValue := -1;
  Modified := false;
  // ������� ��������� � ���� �������� �� �������� �����
  dmUspevaemost.adospSelVedGroup.Active := false;
  nSem:= cmbxSem.ItemIndex+1;
  CheckVedsExist;
end;

procedure TfmGroup.cmbxSemNaprChange(Sender: TObject);
var  nSem: Integer;
begin
  inherited;

  dmUspevaemost.adospGetAllVedNaprForDisc.Active := false;

  dbcbNapr.KeyValue := Null;

  nSem := cmbxSemNapr.ItemIndex+1;

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
var VedsList, Uspev: TADOStoredProc;
    nSem, i, j, ik_upContent: integer;
begin
     //������� ������������ ������ �� ������� 4
  nSem := cmbxUspSem.ItemIndex+1;
  sgUspev.RowCount:= 2;
  sgUspev.ColCount:= 1;
  sgUspev.Cells[0,0]:= '���';
  sgUspev.Cells[0,1]:= ' ';
  try
  //�������� ���������
    VedsList:= TUspevGroupController.Instance.GetAllVedomosts(ik, nSem);
    if VedsList.IsEmpty then
    begin
      MessageBox(Handle, '� ��������� �������� ������������ ��� �� ���������.', '�� ����', MB_OK);
      exit;
    end;

    //�������� ������������
    Uspev:= TUspevGroupController.Instance.GetAllUspevForGrup(ik, nSem);
    if Uspev.IsEmpty then
    begin
      MessageBox(Handle, '� ��������� �������� ������������ ��� �� ���������.', '�� ����', MB_OK);
      exit;
    end;

  //����������� �������
    sgUspev.RowCount:= (Uspev.RecordCount div VedsList.RecordCount)+1;
    sgUspev.ColCount:= VedsList.RecordCount+1;
    sgUspev.Cells[0,0]:= '���';
  //�������������� ������� ��� ���������
    sguspev_dop.RowCount:=sgUspev.RowCount;
    sguspev_dop.ColCount:=sgUspev.ColCount+1;
  //��������� ���������
    Uspev.First;
    ik_upContent:=Uspev.FieldByName('ik_upContent').Value;
    i:= 1;
    while  (not Uspev.Eof) and
      (ik_upContent=Uspev.FieldByName('ik_upContent').Value) do
    begin
      sgUspev.Cells[0,i]:= Uspev.FieldByName('StudName').AsString;
      sgUspev_dop.Cells[sgUspev_dop.ColCount-1,i]:=Uspev.FieldByName('ik_zach').AsString;
      sgUspev_dop.Cells[0,i]:='1';       //���������� ��� �������
      Uspev.Next;
      inc(i);
    end;
  
  //�������� ���� �� ���������� � ��������� �������
    VedsList.First;
    i:= 1;                        
    while not VedsList.Eof do
    begin        //
      ik_upContent:=VedsList.FieldByName('ik_upContent').Value;
      sgUspev.Cells[i,0]:=VedsList.FieldByName('COLUMN1').AsString;
    //������� ������ �� ������ ��������� ��� ���� ���������
      j:=1;
      while j<=sgUspev.RowCount do
      begin
        if Uspev.Locate('ik_upContent;studName;ik_zach', VarArrayOf([ik_upContent, sgUspev.Cells[0,j], sgUspev_dop.Cells[sgUspev_dop.ColCount-1,j]]), [loPartialKey])
        then
          begin
            if uspev.FieldByName('bit_usp').AsBoolean then
              sgUspev_dop.Cells[i,j]:='1'
            else
              begin
              sgUspev_dop.Cells[i,j]:='0';     //������ ����� �������
              if sgUspev_dop.Cells[0,j]='1' then
                sgUspev_dop.Cells[0,j]:='2';     //������� ����� ��� ���������
              end;

            if Uspev.FieldByName('osenca').AsString<>'' then
              sgUspev.Cells[i,j]:= '             '+Uspev.FieldByName('osenca').AsString
            else
              begin
              sgUspev.Cells[i,j]:= '             -';
              sgUspev_dop.Cells[0,j]:='0';      //������� ����� ��� ���������
              end;

            if Uspev.FieldByName('osenca').AsString='3' then
              if sgUspev_dop.Cells[0,j]='1' then
                sgUspev_dop.Cells[0,j]:='3'     //������� ��������

          end;
        inc(j);
      end;
      VedsList.Next;
      inc(i);
    end;
  finally
    if VedsList<>nil then
      VedsList.Free;
    if Uspev<>nil then
      Uspev.Free;
  end;
  
end;

procedure TfmGroup.sbPrntBlnkClick(Sender: TObject);
var
  //tmpStr: String;
  ikFac: integer;
  ikSpecFac: integer;
  ikSpec: integer;
begin

  ikSpecFac:=TDBNodeSpecObject(frmMain.DBDekTreeView_TEST1.Selected.Parent.Data).ik;
  ikSpec:= TUspevGroupController.Instance.getSpecFromSpecFac(ikSpecFac);
  ikFac:=TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.Selected.Parent.Parent.Data).ik;
  //���������� ����� ������� ���������
  TUspevGroupController.Instance.printBlankVedomost(ik, cmbxSem.ItemIndex+1, ikVed, ikFac, ikSpec, DMUspevaemost.adospGetAllVeds4Group);
end;

procedure TfmGroup.AttestRefresh();
begin
  actPrintBlankAtt.Enabled := haveAtt;
  actPrintAtt.Enabled := haveAtt;

  if Modified then
    if MessageBox(Handle, '������ ���������� ���� ��������. ��������� ���������?',
                 '�� ����', MB_YESNO)=IDYES
    then
      btnSaveAtt.Click;

  if IsBRS then
  MaxBall:=dmUspevaemost.adospGetAllAtt.Fields[4].AsInteger;

  ikVed := dbcmbxDisc.KeyValue;
  ikPredm := dmUspevaemost.adospGetAllAtt.Fields[1].AsInteger;
  ikVidZan := dmUspevaemost.adospGetAllAtt.Fields[2].AsInteger;
  // ������ ��������� ���������

  dmUspevaemost.adospSelAtt.Active:=false;
  if IsBRS then dmUspevaemost.adospSelAtt.ProcedureName:='SelBRSAtt;1';
  TUspevGroupController.Instance.SelAtt(cmbxSemAtt.ItemIndex+1, ikPredm, ikVidZan,
                              ik, cmbxNumber.Value);

  if dmUspevaemost.adospSelAtt.FieldByName('lClose').Value <> null then
    dbcbxCloseAtt.Checked := dmUspevaemost.adospSelAtt.FieldByName('lClose').Value;

  with dmUspevaemost.aspPrepodVedFromUchPlan do
  begin
    Active:=false;
    Parameters[1].Value := ikVed;
    //Parameters[2].Value := ikVidZan;
    //Parameters[3].Value := cmbxSemAtt.ItemIndex+1;
    Active:=true;
  end;

   dbcbeExaminer.KeyValue:=dmUspevaemost.adospSelAtt.FieldByName('itab_n').AsInteger;

  if dmUspevaemost.adospSelAtt.FieldByName('Dd_exam').AsDateTime<>null then
    dbdteBRSExam.Value:=dmUspevaemost.adospSelAtt.FieldByName('Dd_exam').AsDateTime;

end;

procedure TfmGroup.dbcmbxDiscChange(Sender: TObject);
begin
  inherited;

  if (dbcmbxDisc.KeyValue = Null) or (dbcmbxDisc.Text = '')
  or (cmbxNumber.Text ='')
  then
    Exit;

    if cmbxNumber.Text='�������' then
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

function TfmGroup.DoIsModified(flag: boolean):boolean;
var
  tmpStr: String;
begin
  result:= true;
  if (not dmUspevaemost.adospSelVed.Active) or
      (not dmUspevaemost.adospGetAllVeds4Group.Active) or
      (not dmUspevaemost.adospSelVedGroup.Active) then
    exit;

  if Modified and (not dmUspevaemost.adospSelVed.FieldByName('lClose').AsBoolean)
  then
  begin
    tmpStr := '������ ��������� ��� '+IntToStr(nSem)+
                ' �������� �� '+
                discName+
                ' ���� ��������. ��������� ���������?';
    case MessageBox(Handle, PAnsiChar(tmpStr), '�� ����', MB_YESNOCANCEL) of
      IDYES:
         actSaveVedExecute(nil);
      IDNO:
        if flag then
          btnCancelVed.Click;
      IDCANCEL:
      begin
        result:= false;
        //Modified:= false;
        exit;
      end;
    end;
  end;
  Modified:= false;
end;


procedure TfmGroup.sbPrntNotesClick(Sender: TObject);
var
  //tmpStr: String;
  ikFac:integer;
  ikSpecFac: integer;
  ikSpec: integer;
begin
  ikSpecFac:=TDBNodeSpecObject(frmMain.DBDekTreeView_TEST1.Selected.Parent.Data).ik;
  ikSpec:= TUspevGroupController.Instance.getSpecFromSpecFac(ikSpecFac);

  ikFac:=TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.Selected.Parent.Parent.Data).ik;
  //���������� ��������� � ��������
  TUspevGroupController.Instance.printVed(ik, cmbxSem.ItemIndex+1, ikVed, ikFac, ikSpec);

end;

procedure TfmGroup.CheckEnabled;
begin
  if (cmbxSem.ItemIndex = -1) or
     (dbcmbxPrepodVed.KeyValue = -1)or
     (dbcmbxPrepodVed.KeyValue = NULL)or
     (dbdteEx.Text = '  .  .    ')
  then
    actCreateAllVeds.Enabled := false
  else
    actCreateAllVeds.Enabled := true;
end;

//����������, �������� �� �������� ����������
//(���������, ������� �� ��� ��������� ��������)
{function TfmGroup.GetCanCreateVeds(AllZachsCreated:boolean):boolean;
begin
  result:= (((not haveVeds) and (not CloseZachets)) or
    ((not EkzCreated) and AllZachsCreated and CloseZachets))
end; }


procedure TfmGroup.CheckVedsExist;
var
  nSem: Integer;
  havePredms: boolean;
begin
  nSem := cmbxSem.ItemIndex+1;
  //��������� ���������, ��������� �����������
  //� ������������� ��������� ������ ��������� �������� ����������
  TUspevGroupController.Instance.GetListOfVeds(nSem, ik, fac_ik, havePredms);
  if not havePredms then
  begin
     MessageBox(Handle, '� ������� ����� ��� �� ������ �������� ��� ������!', '�� ����', MB_OK);
  end;

  //���� ��������� ��� �� �����������
  //� � �� ����� ���� ��������
  if havePredms and
    (TUspevGroupController.Instance.CanCreateIndependVeds(nSem, ik)) then
  begin
		if MessageBox(Handle, '�� ������� �� ����� ���������. ������� �� ������?',
					  '�� ����', MB_YESNO)=IDYES then
			// ���� ����������� - ������...
    begin
			TUspevGroupController.Instance.CreateVeds(nSem, ik);
    end;
  end;

  SetVedEnabled;

  {//���� �� ��� ��������� �������� ������ �������
  //�� ��� ������� ���������������, ���������� ������������
  //(�� ���� ���� ����� �������� ���. ���������� �������� ��. ����)
  if (not AllZachsCreated) and EkzCreated then
  begin
		if MessageBox(Handle, '��� ������������� ��������������� ���������, �� ��� �� ��� ��������� �������� ������ ������� (�������� �������� �����). ������������ ����������� ��������� ������?',
					  '�� ����', MB_YESNO)=IDYES then
			// ���� ����������� - ������...
			TUspevGroupController.Instance.DoCreateVeds(nSem, ik, false)
    else
      actCreateAllVeds.Enabled :=true;
  end;  }

end;

procedure TfmGroup.RefreshView;
begin
  TApplicationController.GetInstance.AddLogEntry('���������� �����');
  //try

  //������� ���������
  if pcMain.ActivePage = tsVed then
  begin
    // ����� ��������� ������
    TUspevGroupController.Instance.SelectVed(ikVed);

    dmUspevaemost.adospSelVedGroup.Close;
    dmUspevaemost.adospSelVedGroup.Open;
    //����������� ����������� ��������
    dbgrdVed.Columns[0].Visible := false;  //��� ��������
    dbgrdVed.Columns[1].Visible := true;   //���
    dbgrdVed.Columns[2].Visible := true;  //��� ����������
    dbgrdVed.Columns[3].Visible := true;  //����� �������
    dbgrdVed.Columns[5].Visible := false; //��� �������
    dbgrdVed.Columns[7].Visible := true;  //������

    //��������� ������ ��������
    dbgrdVed.Columns[1].Width := 120;
    dbgrdVed.Columns[2].Width := 20;
    dbgrdVed.Columns[3].Width := 75;
    //dbgrdVed.Columns[4].Width := 400;
    dbgrdVed.Columns[5].Width := 0;
    //dbgrdVed.Columns[6].Width := 0;
    dbgrdVed.Columns[7].Width := 75;

    //���������� ������� (���� ��������� ���������)
    if dmUspevaemost.adospSelVed.FieldByName('HasDopusk').AsBoolean then
    begin
      dbgrdVed.Columns[6].Visible := true;
      dbgrdVed.Columns[6].Width := 75;
    end
    else
    begin
      dbgrdVed.Columns[6].Visible := false;
      dbgrdVed.Columns[6].Width := 0;
    end;

    //���������� ���� (���� ��������� ��� �� ��� ��)
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

  if (pcMain.ActivePage = tsAttBRS)or(pcMain.ActivePage = tsAtt) then
  begin

    if (cmbxNumber.text = '�������')and(pcMain.ActivePage = tsAttBRS) then
    begin
      dbgrdBRSAtt.visible:=false;
      dbgrdBRSExam.visible:=true;
      TUspevGroupController.Instance.SelectBRSExam(ikVed);
    end
    else
    begin
      dbgrdBRSAtt.visible:=true;
      dbgrdBRSExam.visible:=false;
      TUspevGroupController.Instance.SelectAtt(ikVed, IsBRS);
    end;
    if IsBRS then begin
      dbgrdBRSAtt.Refresh;
      dbgrdBRSExam.Refresh;
    end
    else
      dbgeAtt.Refresh;

  end;


  if pcMain.ActivePage = tsNapr then
  begin
    if (dmUspevaemost.adospGetAllVedNaprForGrup.FieldValues['ik_Vid_Zanyat'] = 8) or
    (dmUspevaemost.adospGetAllVedNaprForGrup.FieldValues['ik_Vid_Zanyat'] = 9) then
      dbgrdNapr.Columns[9].Visible := true
    else dbgrdNapr.Columns[9].Visible := false;
  end;

  //except
  //end;
end;

procedure TfmGroup.btnCancelVedClick(Sender: TObject);
begin
  inherited;
  Modified := false;
  {CheckVedsExist;}
  LoadVedHeader;
  RefreshView;

end;

procedure TfmGroup.BFilterClick(Sender: TObject);
var str: String;
begin
  inherited;
  str := Memo1.Text;
  InputQuery('','',str);
  dbgStudList.DataSource.DataSet.Filter := str;
  dbgStudList.DataSource.DataSet.Filtered := true;
end;

procedure TfmGroup.BRSExamRefresh;
begin
  actPrintBlankAtt.Enabled := haveAtt;
  actPrintAtt.Enabled := haveAtt;

  if Modified then
    if MessageBox(Handle, '������ �������� ���� ��������. ��������� ���������?',
                 '�� ����', MB_YESNO)=IDYES
    then
      btnSaveAtt.Click;


  MaxBall:=dmUspevaemost.adospGetAllBRSExam.Fields[4].AsInteger;

  ikVed := dbcmbxDisc.KeyValue;
  ikPredm := dmUspevaemost.adospGetAllBRSExam.Fields[1].AsInteger;
  ikVidZan := dmUspevaemost.adospGetAllBRSExam.Fields[2].AsInteger;
  // ������ ��������� ���������

  dmUspevaemost.adospSelBRSExam.Active:=false;

  TUspevGroupController.Instance.SelBRSExam(cmbxSemAtt.ItemIndex+1, ikPredm, ikVidZan,
                              ik);

  if dmUspevaemost.adospSelBRSExam.FieldByName('lClose').Value <> null then
    dbcbxCloseAtt.Checked := dmUspevaemost.adospSelBRSExam.FieldByName('lClose').Value;

  with dmUspevaemost.aspPrepodVedFromUchPlan do
  begin
    Active:=false;
    Parameters[1].Value := ikVed;
    //Parameters[2].Value := ikVidZan;
    //Parameters[3].Value := cmbxSemAtt.ItemIndex+1;
    Active:=true;
  end;

   dbcbeExaminer.KeyValue:=dmUspevaemost.adospSelBRSExam.FieldByName('itab_n').AsInteger;

  if dmUspevaemost.adospSelBRSExam.FieldByName('Dd_exam').AsDateTime<>null then
    dbdteBRSExam.Value:=dmUspevaemost.adospSelBRSExam.FieldByName('Dd_exam').AsDateTime;

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

  if (dmUspevaemost.adospSelAtt.FieldByName('lClose').AsBoolean) then  //check VedAtt lClose
  begin
  if not cbAttClose.Checked then
    begin
      if MessageBox(Handle, '�� ������������� �o���� ������� ��� ���������� ����������?', '�� ����', MB_YESNO)=IDYES then //dialog
      begin
        if not TUspevGroupController.Instance.OpenVed(ikVed) then  //openVedAtt
          MessageBox(Handle, '��� �������� ��������� ��������� ������.', '�� ����', MB_OK)
      end
      else
        cbAttClose.Checked:=true;
        
      dmUspevaemost.adospSelAtt.Close;
      dmUspevaemost.adospSelAtt.Open;
      Modified:=false;
    end;
  end
  else
    Modified:=true;
end;

procedure TfmGroup.dbcbeDiscChange(Sender: TObject);
var tmpStr : string;
begin
  inherited;
  if Modified then
  begin
    tmpStr := '������ ���������� ��� '+IntToStr(nSem)+
                ' �������� �� '+
                dmUspevaemost.adospGetAllAtt.FieldByName('cName_Disc').Value+
                ' ���� ��������. ��������� ���������?';
    if MessageBox(Handle, PAnsiChar(tmpStr), '�� ����', MB_YESNO)=IDYES
    then
      bSaveAtt.Click
    else
      Modified := false;
  end;
  
  if (dbcbeDisc.KeyValue = Null) or (dbcbeDisc.Text = '')
  or (nAtt.Text ='')
  then
    Exit;

  actPrintBlankAtt.Enabled := haveAtt;
  actPrintAtt.Enabled := haveAtt;

  if Modified then
    if MessageBox(Handle, '������ ���������� ���� ��������. ��������� ���������?',
                 '�� ����', MB_YESNO)=IDYES
    then
      bSaveAtt.Click;

  if IsBRS then
  MaxBall:=dmUspevaemost.adospGetAllAtt.Fields[4].AsInteger;

  ikVed := dbcbeDisc.KeyValue;
  ikPredm := dmUspevaemost.adospGetAllAtt.Fields[1].AsInteger;
  ikVidZan := dmUspevaemost.adospGetAllAtt.Fields[2].AsInteger;
  // ������ ��������� ���������

  TUspevGroupController.Instance.SelAtt(dbcbeSemAtt.ItemIndex+1, ikPredm, ikVidZan,
                              ik, nAtt.Value);

  if dmUspevaemost.adospSelAtt.FieldByName('lClose').Value <> null then
    cbAttClose.Checked := dmUspevaemost.adospSelAtt.FieldByName('lClose').Value;


  with dmUspevaemost.aspPrepodVedFromUchPlan do
  begin
    Active:=false;
    Parameters[1].Value := ikVed;
    //Parameters[2].Value := ikVidZan;
    //Parameters[3].Value := cmbxSemAtt.ItemIndex+1;
    Active:=true;
  end; 

  dblcbPrepod.KeyValue:=dmUspevaemost.adospSelAtt.FieldByName('itab_n').AsInteger;

  if dmUspevaemost.adospSelAtt.FieldByName('Dd_exam').AsDateTime<>null then
    dbdteAttBegin.Value:=dmUspevaemost.adospSelAtt.FieldByName('Dd_exam').AsDateTime;

  RefreshView;
  Modified := false;
end;

procedure TfmGroup.dbcbeSemAttChange(Sender: TObject);
var tmpStr:string;
begin
  inherited;
 if Modified then
  begin
    tmpStr := '������ ���������� ��� '+IntToStr(nSem)+
                ' �������� �� '+
                dmUspevaemost.adospGetAllAtt.FieldByName('cName_Disc').Value+
                ' ���� ��������. ��������� ���������?';
    if MessageBox(Handle, PAnsiChar(tmpStr), '�� ����', MB_YESNO)=IDYES
    then
      btnSaveAtt.Click
    else
      Modified := false;
  end;
  // ������� ��������� � ���� �������� �� �������� �����
  dbcbeDisc.KeyValue := -1;
  dbcbeDisc.ListSource.DataSet.Active:=false;
  nAtt.ItemIndex := -1;
  dbdteAttBegin.Clear;
  //dbdteAttEnd.Clear;
  dmUspevaemost.adodsSelAttGroup.Active := false;
  actCreateAttest.Enabled := false;
  actPrintBlankAtt.Enabled := false;
  actPrintAtt.Enabled := false;
  Modified := false;
  nSem:=dbcbeSemAtt.ItemIndex+1;
  //CheckAttExist;
end;

procedure TfmGroup.dbcbNaprChange(Sender: TObject);
begin
  inherited;

  //actCloseNapr.Enabled := false;
  //actPrintNapr.Enabled := false;

  if (dbcbNapr.KeyValue = Null) or (dbcbNapr.Text = '') then
    Exit;


  ikPredm := dmUspevaemost.adospGetAllVedNaprForGrup.FieldValues['ik_disc'];
  ikVidZan := dmUspevaemost.adospGetAllVedNaprForGrup.FieldValues['ik_Vid_Zanyat'];

  //dmUspevaemost.adospGetAllVedNaprForDisc.Fields.Clear;
  dmUspevaemost.adospGetAllVedNaprForDisc.Active := false;
  with dmUspevaemost.adospGetAllVedNaprForDisc.Parameters do
  begin
    Clear;
    // ������
    AddParameter;
    Items[0].Value := ik;
    // ����� ��������
    AddParameter;
    Items[1].Value := cmbxSemNapr.ItemIndex+1;
    // ����������
    AddParameter;
    Items[2].Value :=ikPredm;
    // ��� �������
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
  ikPredm := dmUspevaemost.adospGetAllVeds4Group.Fields[2].AsInteger;
  ikVidZan := dmUspevaemost.adospGetAllVeds4Group.Fields[3].AsInteger;
  discName:= dmUspevaemost.adospGetAllVeds4Group.FieldByName('cName_Disc').AsString;
  // ������ �������o� ���������
  TUspevGroupController.Instance.GetVedsHeader(ikVed);

  //���������� ��������� ������
  dbcmbxPrepodVed.KeyValue := dmUspevaemost.adospSelVed.FieldByName('itab_n').Value;
  if dmUspevaemost.adospSelVed.FieldByName('Dd_exam').Value <> null then
    dbdteEx.Value := dmUspevaemost.adospSelVed.FieldByName('Dd_exam').Value;
  if (dmUspevaemost.adospSelVed.FieldByName('cNumber_ved').Value <> null) and
    (dmUspevaemost.adospSelVed.FieldByName('cNumber_ved').Value <> '            ') then
    dbeNum.Text := dmUspevaemost.adospSelVed.FieldByName('cNumber_ved').Value
  else              //lVnosn
    dbeNum.Text := '';
  dbcbxClosed.Checked := dmUspevaemost.adospSelVed.FieldByName('lClose').AsBoolean;
  //������ ������� ��������� �������� �������
  if  dmUspevaemost.adospSelVed.FieldByName('lVnosn').AsBoolean then
      lVinost.Visible:= true
  else
    lVinost.Visible:= false;
  SetVedEnabled;
end;

procedure TfmGroup.nAttChange(Sender: TObject);
var tmpStr : string;
begin
  inherited;
 if (nAtt.Text = '') then
    Exit;

  if Modified then
  begin
    tmpStr := '������ ���������� ��� '+IntToStr(nSem)+
                ' �������� �� '+
                dmUspevaemost.adospGetAllAtt.FieldByName('cName_Disc').Value+
                ' ���� ��������. ��������� ���������?';
    if MessageBox(Handle, PAnsiChar(tmpStr), '�� ����', MB_YESNO)=IDYES
    then
      bSaveAtt.Click
    else
      Modified := false;
  end;
  // ������� ��������� � ���� �������� �� �������� �����
  dbcbeDisc.KeyValue := -1;
  //cmbxDate.ItemIndex := -1;
  dmUspevaemost.adodsSelAttGroup.Active := false;
  dbdteAttBegin.Clear;
  //dbdteAttEnd.Clear;

  {with dmUspevaemost.adospPrepodVed do
  begin
  Active:=false;
  Parameters[1].Value:=Ik;
  Parameters[2].Value:=Null;
  Parameters[3].Value:=strtoint(cmbxNumber.text);
  Active:=true;
  end;}

  actPrintBlankAtt.Enabled := false;
  actPrintAtt.Enabled := false;
  Modified := false;

  CheckSimpleAttExist;
end;

procedure TfmGroup.SetVedEnabled;
var flEnabled, flClosedEnabled:boolean;
begin
 //������� ����������� ���������� ���������
  flEnabled:= TUspevGroupController.Instance.GetVedChangeEnabled;
  dbeNum.Enabled:= flEnabled;
  dbcmbxPrepodVed.Enabled:= flEnabled;
  dbdteEx.Enabled:= flEnabled;
  dbgrdVed.ReadOnly:= not flEnabled;
  btnSaveVed.Enabled:= flEnabled;
  btnCancelVed.Enabled:= flEnabled;
 //����������� �������/������� ���������
  flClosedEnabled:= TUspevGroupController.Instance.GetVedChangeOpenEnabled;
  dbcbxClosed.Enabled:= flClosedEnabled;

end;

procedure TfmGroup.SetColor(canvas:TCanvas; const Rect: TRect; Field: string; RowColor,TextColor:TColor);
//var myRect:TRect;
begin
  canvas.Brush.Color:=RowColor;
  canvas.FillRect(Rect);
  canvas.Font.Color:=TextColor;
  canvas.TextOut(Rect.Left+2, Rect.Top+2, Field);
end;

procedure TfmGroup.sgUspevDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  canvas:TCanvas;
begin

  canvas:=(sender as TStringGrid).Canvas;

  if (acol=0) and (sgUspev_dop.Cells[acol,arow]='1') then
  begin
    SetColor(canvas,Rect,sgUspev.Cells[acol,arow],$007BDDBD,clInfoText);   //$00C6C6FF
    exit;
  end;

  if (acol=0) and ((sgUspev_dop.Cells[acol,arow]='3') or (sgUspev_dop.Cells[acol,arow]='2')) then
  begin
    SetColor(canvas,Rect,sgUspev.Cells[acol,arow],$0063F5E3,clInfoText);   //$00C6C6FF
    exit;
  end;

  if  (sgUspev_dop.Cells[acol,arow]='0') then
  begin
    SetColor(canvas,Rect,sgUspev.Cells[acol,arow],$00C6C6FF,clInfoText);   //$00C6C6FF
    exit;
  end;
end;

procedure TfmGroup.dbcbVedChange(Sender: TObject);
begin
  inherited;
  {if dbcbVed.KeyValue= ikVed then  //�������� �� ����
    exit; }
   TApplicationController.GetInstance.AddLogEntry('���������. ����� ��������� '+dbcbVed.Text);


  //��������� �� ����������� �������
  //if not dbcbVed.KeyValue= ikVed then  //�������� �� ����
    if not DoIsModified(false) then  //������� ������ ��������
      if dmUspevaemost.adospGetAllVeds4Group.Locate('Ik_ved',ikVed,[]) then
      begin
        dbcbVed.KeyValue:= ikVed;
        exit;
      end;

  if dbcbVed.Text = '' then
  begin
    //dmUspevaemost.adospGetAllVeds4Group.Close;
    dmUspevaemost.adospSelVed.Close;
    dmUspevaemost.adospSelVedGroup.Close;
    dbcmbxPrepodVed.Value:=null;
    dbdteEx.Value:= null;
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
  if Length(dbeNum.Text)>12 then
    dbeNum.Text := copy(dbeNum.Text, 1, 12)
  else
    Modified := true;

  TApplicationController.GetInstance.AddLogEntry('���� ������ ��������� '+dbeNum.Text);
end;

procedure TfmGroup.LoadDiploms;
begin
  TDiplomController.Instance.GetDiplomList(ik);
  if dbgDiplom.DataSource.DataSet.IsEmpty then
    MessageBox(Handle, '��� ������ ������ ��� �� ���� ������� �������. ��� �� �������� �������������� ��������������� ������� ������ ������������.', '�� ����', MB_OK)
  else
    actCreateDiplomsExecute(nil);
end;

procedure TfmGroup.pcMainChange(Sender: TObject);
var
  FYear: Integer;
  //tmpStr: String;
  sem_change: boolean;
begin
  inherited;
  sem_change:=true;
  //�������� ���������
  if pcMain.ActivePage = tsVed then
  begin
    TApplicationController.GetInstance.AddLogEntry('������� �� ���������');
    if (dmUspevaemost.adospSelVedGroup.Active and
          (ikVed = dbcbVed.KeyValue)) or
        ( (cmbxSem.ItemIndex= nSem-1) and (nsem<>0) and
        (not dmUspevaemost.adospSelVedGroup.Active))
    then
      exit;

    lVinost.Visible:= false;
    //�������� ��������������
    if not TUspevGroupController.Instance.SelPrepodsForVedom(null,null,null) then
    begin
      MessageBox(Handle, '��������� ������ ��� ������ ��������������.', '�� ����', MB_OK);
    end;

    dmUspevaemost.adospSelVedGroup.Active := false;
    // ����� ������ ���������
    dbgrdVed.Columns[0].Visible := false;
    dbgrdVed.Columns[1].Title.Caption := '�������, ��������';
    dbgrdVed.Columns[2].Width := 10;

    // ���������� ������ �������� �� ���������
    //��� �������� ������
    FYear:=TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.Selected.data).FoundYear;
    nSem:= TUspevGroupController.Instance.GetNSem(FYear);
    if nsem<1 then nsem:=1;

    //if nSem<0 then nSem:=1;

    Modified := false;
    if cmbxSem.ItemIndex<>nSem-1
      then sem_change:=false;
    cmbxSem.ItemIndex := nSem-1;
    Modified := false;
    if sem_change
      then cmbxSemChange(Sender);
    dbcbVed.KeyValue := -1;
    dbcmbxPrepodVed.KeyValue := -1;
    Modified := false;
  end;

  if pcMain.ActivePage = tsAttBRS then  //����������
  begin
    TApplicationController.GetInstance.AddLogEntry('������� �� ����������');
    // ���������� ������ �������� �� ���������
    FYear:=TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.Selected.data).FoundYear;
    nSem:= TUspevGroupController.Instance.GetNSemBRS(FYear);
    if nSem<0 then nSem:=1;
    Modified := false;
    if cmbxSemAtt.ItemIndex<>nSem-1
      then sem_change:=false;
    cmbxSemAtt.ItemIndex := nSem-1;
    Modified := false;
    if sem_change
      then cmbxSemAttChange(Sender);
    Modified := false;
    cmbxNumber.ItemIndex := -1;
    Modified := false;
    dbcmbxDisc.KeyValue := -1;
    Modified := false;
    pnlBRS.Visible:=true;
    panel4.Height:=54;
    dbdteBRSExam.Value:=Today;
    //dbgrdAtt.Columns[6].Visible:=false;


  end;

   if pcMain.ActivePage = tsAtt then  //����������
  begin
    TApplicationController.GetInstance.AddLogEntry('������� �� ����������');
    // ���������� ������ �������� �� ���������
    FYear:=TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.Selected.data).FoundYear;
    nSem:= TUspevGroupController.Instance.GetNSem(FYear);
    if nSem<0 then nSem:=1;
    Modified := false;
    if dbcbeSemAtt.ItemIndex<>nSem-1
      then sem_change:=false;
    dbcbeSemAtt.ItemIndex := nSem-1;
    Modified := false;
    if sem_change
      then dbcbeSemAttChange(Sender);
    Modified := false;
    nAtt.ItemIndex := -1;
    Modified := false;
    dbcbeDisc.KeyValue := -1;
    Modified := false;
  end;

  if pcMain.ActivePage = tsNapr then  //�����������
  begin
    TApplicationController.GetInstance.AddLogEntry('������� �� ����������� ������');
    // ���������� ������ �������� �� ���������
    FYear:=TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.Selected.data).FoundYear;
    nSem:= TUspevGroupController.Instance.GetNSem(FYear);
    if cmbxSemNapr.ItemIndex<>nSem-1
      then sem_change:=false;
    cmbxSemNapr.ItemIndex := nSem-1;
    if sem_change
      then cmbxSemNaprChange(Sender);
  end;

  if pcMain.ActivePage = tshUspev then  //������������
  begin
    TApplicationController.GetInstance.AddLogEntry('������� �� ������������ ������');
    // ���������� ������ �������� �� ���������
    FYear:=TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.Selected.data).FoundYear;
    nSem:= TUspevGroupController.Instance.GetNSem(FYear);
    if cmbxUspSem.ItemIndex<>nSem-1
      then sem_change:=false;
    cmbxUspSem.ItemIndex := nSem-1;
    if sem_change
      then cmbxUspSemChange(Sender);
  end;

  if pcMain.ActivePage=tsDiplom then
  begin
    TApplicationController.GetInstance.AddLogEntry('������� �� ������� ������');
    Modified:= false;
    if not TDiplomController.Instance.IsCurrentDiplomList(ik) then
      LoadDiploms;
  end;

  if pcMain.ActivePage=tsAverageBalls then
  begin
    frmMain.Comment('������� ����� ���������', '������ '+(FrameObject as TDBNodeGroupObject).Name);
    fmAverageBallsGroup.FrameObject := FrameObject;
    fmAverageBallsGroup.FrameType:=4;
    fmAverageBallsGroup.ObjectId:= (FrameObject as TDBNodeGroupObject).ik;
    fmAverageBallsGroup.StudyYears:= TDBNodeSpecObject((FrameObject as TDBNodeGroupObject).Node.Parent.Data).StudyYears;
    fmAverageBallsGroup.ShowStudents := (FrameObject as TDBNodeGroupObject).ShowStudents;
    fmAverageBallsGroup.FillListView;
  end;

end;

function TfmGroup.DoIsModifiedDiploms:boolean;
begin
  result:= true;
  if (not dbgDiplom.DataSource.DataSet.Active) then
    exit;

  if Modified  then
  begin
    case MessageBox(Handle, '������ �� �������� ���� ��������. ������� ��������� ���������?', '�� ����', MB_YESNO) of
      IDYES:
         DoApply;
      IDNO:
        btnCancelDiplom.Click;
    end;
  end;
  Modified:= false;
end;

procedure TfmGroup.pcMainChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  //���������
  if pcMain.ActivePage = tsVed then
    DoIsModified(true);
  //�������
  if pcMain.ActivePage = tsDiplom then
    DoIsModifiedDiploms;

end;

procedure TfmGroup.pmVedomostPopup(Sender: TObject);
begin

if ((dmUspevaemost.adospSelVedGroup.FieldByName('Cosenca').AsInteger>2) or
(dmUspevaemost.adospSelVedGroup.FieldByName('Cosenca').AsInteger=1)) then
actNaprRegister.Enabled:=false else
actNaprRegister.Enabled:=true;
end;

procedure TfmGroup.dbcbxCloseAttClick(Sender: TObject);
begin
  inherited;
  if ((not dmUspevaemost.adospSelAtt.Active)and(cmbxNumber.Text<>'�������'))or
  ((not dmUspevaemost.adospSelBRSExam.Active)and(cmbxNumber.Text='�������')) then exit;

  dbgrdBRSAtt.Columns.Items[5].ReadOnly := dbcbxCloseAtt.Checked;
  dbgrdBRSAtt.Columns.Items[6].ReadOnly := dbcbxCloseAtt.Checked;
  dbgrdBRSAtt.Columns.Items[7].ReadOnly := dbcbxCloseAtt.Checked;

  dbgrdBRSExam.Columns.Items[5].ReadOnly := dbcbxCloseAtt.Checked;
  dbgrdBRSExam.Columns.Items[7].ReadOnly := dbcbxCloseAtt.Checked;

  if cmbxNumber.Text='�������' then
  begin
   if (dmUspevaemost.adospSelBRSExam.FieldByName('lClose').AsBoolean) then  //check VedAtt lClose
  begin
  if not dbcbxCloseAtt.Checked then
    begin
      if MessageBox(Handle, '�� ������������� �o���� ������� ��� ��������������� ���������?', '�� ����', MB_YESNO)=IDYES then //dialog
      begin
        if not TUspevGroupController.Instance.OpenVed(ikVed) then  //openVedAtt
          MessageBox(Handle, '��� �������� ��������� ��������� ������.', '�� ����', MB_OK)
      end
      else
        dbcbxCloseAtt.Checked:=true;

      dmUspevaemost.adospSelBRSExam.Close;
      dmUspevaemost.adospSelBRSExam.Open;
      Modified:=false;
    end
  end
  end
  else
  if (dmUspevaemost.adospSelAtt.FieldByName('lClose').AsBoolean) then  //check VedAtt lClose
  begin
  if not dbcbxCloseAtt.Checked then
    begin
      if MessageBox(Handle, '�� ������������� �o���� ������� ��� ���������� ����������?', '�� ����', MB_YESNO)=IDYES then //dialog
      begin
        if not TUspevGroupController.Instance.OpenVed(ikVed) then  //openVedAtt
          MessageBox(Handle, '��� �������� ��������� ��������� ������.', '�� ����', MB_OK)
      end
      else
        dbcbxCloseAtt.Checked:=true;

      dmUspevaemost.adospSelAtt.Close;
      dmUspevaemost.adospSelAtt.Open;
      Modified:=false;
    end;
  end
  else
    Modified:=true;

  //dbgrdAtt.Columns.Items[5].ReadOnly := dbcbxCloseAtt.Checked;
  //dbgrdAtt.Columns.Items[6].ReadOnly := dbcbxCloseAtt.Checked;

end;

procedure TfmGroup.dbcbxClosedClick(Sender: TObject);
begin

  //���� ��������� ���� �������, �� ������ ������,
  //� ���������� ������������
  if (not dmUspevaemost.adospSelVed.Active) or
      (not dmUspevaemost.adospGetAllVeds4Group.Active) or
      (not dmUspevaemost.adospSelVedGroup.Active) then
    exit;

  if (dmUspevaemost.adospSelVed.FieldByName('lClose').AsBoolean)
      and not dbcbxClosed.Checked then
  begin
    if MessageBox(Handle, '�� ������������� �o���� ������� ��� ���������?', '�� ����', MB_YESNO)=IDYES then
    begin
      //���� ��, ��������� ��������� ...
      TUspevGroupController.Instance.OpenVed(ikVed);
      TUspevGroupController.Instance.GetAllVidZanyats(nSem, ik);
      dmUspevaemost.adospSelVed.Close;
      dmUspevaemost.adospSelVed.Open;
    end
    else
    begin
      dbcbxClosed.Checked:= true;
      exit;
     end;
     SetVedEnabled;
  end
  else
    Modified := TRUE;
end;

procedure TfmGroup.dbcmbxPrepodVedChange(Sender: TObject);
begin
  TApplicationController.GetInstance.AddLogEntry('���������. ����� ������������� '+dbcmbxPrepodVed.Text);
  Modified := true;
end;

procedure TfmGroup.dbdteAttBeginChange(Sender: TObject);
begin
  dbdteAttEnd.Value:=dbdteAttBegin.Value+5;
  Modified := true;
end;

procedure TfmGroup.dbdteExChange(Sender: TObject);
begin
  TApplicationController.GetInstance.AddLogEntry('���������. ����� ���� '+dbdteEx.EditText);
  Modified := true;
  try
  //��������, ����� ���� �� ���� ������ �����������
	  if (length(dbdteEx.EditText)<10) then
		  exit;
	  if (TDateTime(dbdteEx.Value)>Date) then
    begin
		  dbdteEx.Value:=Date;
      dbdteEx.EditText:=DateToStr(Date);
    end;
  except

  end;
end;

function TfmGroup.CheckOcenka(Value: integer): string;
begin
  if (dmUspevaemost.adospSelVed.FieldByName('lClose').AsBoolean )then
     MessageBox(Handle, '������ ������������� �������� ���������!',
					  '�� ����', MB_OK);

    if (dbgrdVed.Fields[1].Value = Null)or
       (dbgrdVed.Fields[1].Text = '') or
       (not dmUspevaemost.adospSelVedGroup.FieldByName('dopusc').AsBoolean) or
       (dmUspevaemost.adospSelVed.FieldByName('lClose').AsBoolean )then
    begin
      Result := '';
      exit;
    end;

    if ((ikVidZan<>7) and(Value<=5) and (Value>=2))or
       (((ikVidZan=7) or (ikVidZan=27)) and (Value<=5) and (Value>=0)) then
    begin
      try
        Result := IntToStr(Value);
      except
      end;
      Modified := true;
    end
    else
      Result := '';

end;

procedure TfmGroup.dbgrdVedColumns7UpdateData(Sender: TObject;
  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
begin
  if Text = '' then
  begin
    Value := -1;
    Modified := true;
  end;
  try
    //��������� ������ ������ ������
    Value:= String(Value)[1];
    Text:= CheckOcenka(Value);
  except
    Value:= -1;
    Text:= '';
  end;
    TApplicationController.GetInstance.AddLogEntry('���������. ���� ������ '+dmUspevaemost.adospSelVedGroup.FieldByName('StudName').AsString+Text);
end;



procedure TfmGroup.dbgrdVedDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
var
  canvas:TCanvas;
  //medalBall:integer;
begin

   if dbgrdVed.DataSource.DataSet.FieldByName('ik_zach').AsInteger=null then
      exit;
   if (gdSelected in State)and(dbgrdVed.Focused) then
      exit;
   canvas:=(sender as TDBGridEh).Canvas;

  //���� ������� ���� ����������, ����������� � �������� ����
  if (dmUspevaemost.adospSelVedGroup.FieldByName('IsPassed').AsBoolean) then
  begin
    SetColor(canvas,Rect,Column.Field.DisplayText,$007BDDBD,clInfoText);   //$00C6C6FF
    exit;
  end
  //����� � �������
  else
  begin
    SetColor(canvas,Rect,Column.Field.DisplayText,$00C6C6FF,clInfoText);  //$0063F5E3
    exit;
  end;

end;

procedure TfmGroup.dbgrdVedKeyPress(Sender: TObject; var Key: Char);
var Text:string;
    mark: set of char;
begin
  mark:= ['0'..'9'] ;
  if not(Key in mark) then
     exit;
  if (not dmUspevaemost.adospSelVed.Active) or
    (not dmUspevaemost.adospSelVedGroup.Active) or
    (dmUspevaemost.adospSelVedGroup.RecNo>=
        dmUspevaemost.adospSelVedGroup.RecordCount) or
        (dbgrdVed.SelectedField.FieldName<>'Cosenca')
          then
      exit;

  //try
    dmUspevaemost.adospSelVedGroup.Edit;
    try
      Text:= CheckOcenka(StrToInt(Key));
    except
      Text:='';
    end;

  dmUspevaemost.adospSelVedGroup.FieldByName('Cosenca').AsString:=
        Text;
  TApplicationController.GetInstance.AddLogEntry('���������. ���� ������ '+dmUspevaemost.adospSelVedGroup.FieldByName('StudName').AsString+Text);
    //if (dmUspevaemost.adospSelVedGroup.RecNo<
        //dmUspevaemost.adospSelVedGroup.RecordCount) then
  dmUspevaemost.adospSelVedGroup.Next;
  Key:=' ';
  //except
  //end;
end;

procedure TfmGroup.dbgrdVedTitleClick(Column: TColumnEh);
begin
   dmUspevaemost.adospSelVedGroup.Sort:=
   Column.Field.DisplayName;
end;

procedure TfmGroup.dbgDiplomCellClick(Column: TColumnEh);
begin
  inherited;

  if (Column.Field.FieldName='StudName') or (Column.Field.FieldName='RegNumber')
    or (Column.Field.FieldName='Dd_VidDipl') or (Column.Field.FieldName='IsExcellent') then
  begin
   dbgDiplom.Options:=dbgDiplom.Options+[dgRowSelect]-[dgEditing];
   editMode:=false;

  end else
  begin
   dbgDiplom.Options:= dbgDiplom.Options-[dgRowSelect]+[dgEditing];
   editMode:=true;
  end;

end;

procedure TfmGroup.dbgDiplomColumns1UpdateData(Sender: TObject;
  var Text: string; var Value: Variant; var UseText, Handled: Boolean);

const MinRegNlen: integer = 3;
var MessageStr: string;
begin
  inherited;
  Modified:= true;
  if (length(Text)<MinRegNlen) and  (length(Text)<>0) then
  begin
    MessageStr:= '��������������� ����� ������� ������ �������� ������� �� '+IntToStr(MinRegNlen)+' ����!';
    Application.MessageBox(PAnsiChar(MessageStr), '���������� "�������"', MB_ICONWARNING);
    {else
      Text:= ''; }
    //Value:= null;
  end;
end;

procedure TfmGroup.dbgDiplomColumns2UpdateData(Sender: TObject;
  var Text: string; var Value: Variant; var UseText, Handled: Boolean);
begin
  inherited;
  Modified:= true;
end;

procedure TfmGroup.dbgDiplomColumns5UpdateData(Sender: TObject;
  var Text: string; var Value: Variant; var UseText, Handled: Boolean);
begin
  inherited;

  if Text = '' then
  begin
    Value := null;
    Modified := true;
  end;
  try
    //��������� ������ ������ ������
    Value:= String(Value)[1];
    if (StrToInt(Value)>1) and (StrToInt(Value)<=5) then
      Text:= IntToStr(Value)
    else
    begin
      Value:= null;
      Text:= '';
    end;
  except
    Value:= null;
    Text:= '';
  end;
  TApplicationController.GetInstance.AddLogEntry('������. ���� ������ '+dbgDiplom.DataSource.DataSet.FieldByName('StudName').Value+Text);
  Modified := true;

end;

procedure TfmGroup.dbgDiplomKeyPress(Sender: TObject; var Key: Char);
const
  allow:set of char = ['1','2','3','4','5','6','7','8','9','0', Chr(VK_BACK)];
begin
  inherited;
  if (dbgDiplom.SelectedField.FieldName='RegNumber') then
    if (not (Key in allow)) then
    begin
      key:= #0;
      exit;
    end;
end;

procedure TfmGroup.dbgDiplomMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  CurrentNum:='';
  CurrentVipNum:= '';
  CurrentDplDate:=0;
  CurrentDplVidDate:= 0;
  bdown:=true;

  if dbgDiplom.DataSource.DataSet.FieldByName('RegNumber').Value<>Null then
    if dbgDiplom.SelectedField.FieldName='RegNumber' then
    begin
      CurrentNum:=dbgDiplom.DataSource.DataSet.FieldByName('RegNumber').Value;
    end;

  if dbgDiplom.DataSource.DataSet.FieldByName('VipNumber').Value<>Null then
    if dbgDiplom.SelectedField.FieldName='VipNumber' then
    begin
      CurrentVipNum:=dbgDiplom.DataSource.DataSet.FieldByName('VipNumber').Value;
    end;

  if dbgDiplom.DataSource.DataSet.FieldByName('Dd_dipl').Value<>Null then
    if dbgDiplom.SelectedField.FieldName='Dd_dipl' then
    begin
      CurrentDplDate:=dbgDiplom.DataSource.DataSet.FieldByName('Dd_dipl').Value;
    end;

  if dbgDiplom.DataSource.DataSet.FieldByName('Dd_VidDipl').Value<>Null then
    if dbgDiplom.SelectedField.FieldName='Dd_VidDipl' then
    begin
      CurrentDplVidDate:=dbgDiplom.DataSource.DataSet.FieldByName('Dd_VidDipl').Value;
    end;

end;

procedure TfmGroup.dbgDiplomMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var i,j:integer;
    str: string;
begin
  if (bdown)and(CurrentNum<>'')and
    ((dbgDiplom.SelectedField.Value=Null)or(dbgDiplom.SelectedField.Value='')) then
    try
      dbgDiplom.DataSource.dataset.Edit;
      i:=1;
      while (Currentnum[i]='0')and(i<Length(Currentnum)) do
        inc(i);
      Currentnum:=inttostr(strtoint(Currentnum)+1);
      dbgDiplom.SelectedField.Value:='';
      for j := 2 to i do
        dbgDiplom.SelectedField.Value:=dbgDiplom.SelectedField.Value+'0';
      dbgDiplom.SelectedField.Value:=dbgDiplom.SelectedField.Value+Currentnum;
      Currentnum:=dbgDiplom.SelectedField.Value;
      Modified:= true;
    except
      dbgDiplom.SelectedField.Value:=(Currentnum);
    end;

  if (bdown)and(CurrentVipNum<>'')and
    ((dbgDiplom.SelectedField.Value=Null)or(dbgDiplom.SelectedField.Value='')) then
    try
      dbgDiplom.DataSource.dataset.Edit;
      i:=Length(CurrentVipNum);
      while (CurrentVipNum[i]='9')and(i>1) do
      begin
        CurrentVipNum[i]:='0';
        dec(i);
      end;
      str:= inttostr(strtoint(CurrentVipNum[i])+1);
      delete(CurrentVipNum,i,1);
      insert(str,CurrentVipNum,i);
      //CurrentVipNum[i]:=(() as char);
      dbgDiplom.SelectedField.Value:=CurrentVipNum;
      CurrentVipNum:=dbgDiplom.SelectedField.Value;
      Modified:= true;
    except
      dbgDiplom.SelectedField.Value:=(CurrentVipNum);
    end;

    if (bdown)and(CurrentDplDate<>0)and(dbgDiplom.SelectedField.Value=Null) then
    begin
      dbgDiplom.DataSource.dataset.Edit;
      dbgDiplom.SelectedField.Value:=CurrentDplDate;
      Modified:= true;
    end;

    if (bdown)and(CurrentDplVidDate<>0)and(dbgDiplom.SelectedField.Value=Null) then
    begin
      dbgDiplom.DataSource.dataset.Edit;
      dbgDiplom.SelectedField.Value:=CurrentDplVidDate;
      Modified:= true;
    end;

end;

procedure TfmGroup.dbgDiplomMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  bdown:=false;

end;

procedure TfmGroup.dbgDiplomTitleClick(Column: TColumnEh);
begin
  inherited;
  if (Column.FieldName<>'PredprName') and
     (Column.FieldName<>'TypeTemaName') then
    dmDiplom.adospDiplomList.Sort:=
      Column.Field.DisplayName;
end;

{procedure TfmGroup.dbgrdAttColumns5UpdateData(Sender: TObject; var Text: string;
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
end;}

{procedure TfmGroup.dbgrdAttKeyPress(Sender: TObject; var Key: Char);
var mark: set of char;
    prop: set of char;
begin
  if (dbgrdAtt.SelectedField.FieldName='PropCount') then exit;
  mark:= ['1','+','�','�'] ;
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
end;}


procedure TfmGroup.dbgrdBRSAttCellClick(Column: TColumnEh);
begin
if dbgrdBRSAtt.DataSource.DataSet.Active then
CurrentBall := dbgrdBRSAtt.Fields[5].Value;
end;

procedure TfmGroup.dbgrdBRSAttColumns4UpdateData(Sender: TObject;
  var Text: string; var Value: Variant; var UseText, Handled: Boolean);
  var Lastballs:integer;
begin
  if Text = '' then
  begin
    Value := NULL;
    Modified := true;
  end;
    if (dbgrdBRSAtt.Fields[1].Value = Null)or
       (dbgrdBRSAtt.Fields[1].Text = '') then
      Text := '';

            if (dbgrdBRSAtt.Fields[3].Text ='')or(dbgrdBRSAtt.Fields[3].value=null)
      then Lastballs:=0
      else Lastballs:=dbgrdBRSAtt.Fields[3].value;

      if (Text<>'') then
      if (Value<LastBalls) then
      begin
        Text := '';
        Value:=null;
        showmessage('���������� ������ �� ����� ����������� � ���� ���������!')
      end;

      if (Value>MaxBall) then
      begin
        Text := '';
        Value:=null;
        showmessage('����� ������ ����� ����� ��������� �� ����� ���� ������ ' +IntToStr(MaxBall)+'!')
      end
      else if (Value<0) then
        Text := ''
      else
        Modified := true;

end;

procedure TfmGroup.dbgrdBRSExamColumns5UpdateData(Sender: TObject;
  var Text: string; var Value: Variant; var UseText, Handled: Boolean);
begin
  if (Text = '')or(dbgrdBRSExam.Fields[3].Text='') then
  begin
    Value := NULL;
    Modified := (Text = '');
    exit;
  end;
    if (dbgrdBRSExam.Fields[1].Value = Null)or
       (dbgrdBRSExam.Fields[1].Text = '') then
      Text := '';


      if (Value<0) then
      begin
        Text := '';
        Value:=null;
        showmessage('���������� ������ �� ����� ����������� � ���� ��������!')
      end;

      if (Value+dbgrdBRSExam.Fields[3].Value>MaxBall) then
      begin
        Text := '';
        Value:=null;
        showmessage('����� ������ ����� �������� �� ����� ���� ������ ' +IntToStr(MaxBall)+'!')
      end
      else if (Value<0) then
        Text := ''
      else
        Modified := true;

end;

procedure TfmGroup.dbgrdBRSExamColumns7UpdateData(Sender: TObject;
  var Text: string; var Value: Variant; var UseText, Handled: Boolean);
begin
  //or(dmUspevaemost.adodsSelBRSExamGroup.FieldByName('i_sumall').Value<60)
  if (Value<0)or(Value>5) then
  begin
  Value:=null;
  Text:='';
  end;

end;

procedure TfmGroup.dbgrdNaprTitleClick(Column: TColumnEh);
begin
   dmUspevaemost.adospGetAllVedNaprForDisc.Sort:=
    Column.Field.DisplayName;
end;

procedure TfmGroup.dbgrdVedColumns4UpdateData(Sender: TObject;
  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
begin
  inherited;
  Modified := true;
end;

procedure TfmGroup.sbPrntAllBlnkClick(Sender: TObject);
var
  ikFac: Integer;
  ikSpecFac: integer;
  ikSpec: integer;
begin

  ikSpecFac:=TDBNodeSpecObject(frmMain.DBDekTreeView_TEST1.Selected.Parent.Data).ik;
  ikSpec:= TUspevGroupController.Instance.getSpecFromSpecFac(ikSpecFac);
  ikFac:=TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.Selected.Parent.Parent.Data).ik;
  TUspevGroupController.Instance.printAllBlankVedomost(ik, cmbxSem.ItemIndex+1, ikFac, ikSpec);
end;

procedure TfmGroup.sbPrntAllNotesClick(Sender: TObject);
var
  ikFac: Integer;
  ikSpecFac: integer;
  ikSpec: integer;
begin

  ikSpecFac:=TDBNodeSpecObject(frmMain.DBDekTreeView_TEST1.Selected.Parent.Data).ik;
  ikSpec:= TUspevGroupController.Instance.getSpecFromSpecFac(ikSpecFac);

  //�������� �� �����������
  DoIsModified(true);
  ikFac:=TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.Selected.Parent.Parent.Data).ik;
  TUspevGroupController.Instance.printAllVedomost(ik, cmbxSem.ItemIndex+1, ikFac, ikSpec);
end;

procedure TfmGroup.actCancelDiplExecute(Sender: TObject);
begin
  inherited;
  if Modified then
  begin
    TDiplomController.Instance.CancelDiplomUpdates;
    Modified:= false;
  end;
end;

procedure TfmGroup.actCloseNaprExecute(Sender: TObject);
var ik_ved: integer;
begin

  try
    ik_ved:=dmUspevaemost.adospGetAllVedNaprForDisc.FieldValues['ik_ved'];
  except
    ShowMessage('�������� �����������!');
    exit;
  end;

  ftmNaprClose:=TftmNaprClose.Create(self);
  ftmNaprClose.CloseNapr:=false;
  ftmNaprClose.Tag:=dmUspevaemost.adospGetAllVedNaprForDisc.FieldValues['ik_zach'];
  ftmNaprclose.FormShow(Sender);
  ftmNaprclose.dbcbeNapr.KeyValue:=ik_ved;
  ftmNaprclose.dbcbeNapr.Enabled:=false;
  ftmNaprclose.LoadNapr;
  ftmNaprclose.showmodal;
  ftmNaprclose.Free;

  dmUspevaemost.adospGetAllVedNaprForDisc.Active := false;
  dmUspevaemost.adospGetAllVedNaprForDisc.ExecProc;
  dmUspevaemost.adospGetAllVedNaprForDisc.Active := true;
  dbgrdNapr.Refresh;

end;

procedure TfmGroup.actCreateAllVedsExecute(Sender: TObject);
begin
  inherited;
  //���� ����������� ����� ��������, ������������� ������������
  TUspevGroupController.Instance.CreateVeds(nSem, ik);
  //RefreshView;
end;

procedure TfmGroup.actCreateAllVedsUpdate(Sender: TObject);
var fl:boolean;
begin
  //�������� ���������
  if (cmbxSem.Value>0) and
    (pcMain.ActivePage = tsVed) then
  begin
    fl:=false;
    if TUspevGroupController.Instance.CanCreateDependVeds then
    begin
      fl:=true;
      (Sender as TAction).Hint:= '������� ��������������� ���������';
    end
    else
      if TUspevGroupController.Instance.CanCreateIndependVeds(nSem, ik) then
      begin
        fl:=true;
        (Sender as TAction).Hint:= '������� �������� ���������';
      end
      else
        (Sender as TAction).Hint:= '������� ���������';
    (Sender as TAction).Enabled:= fl;
  end;
end;

procedure TfmGroup.actPrintAttExecute(Sender: TObject);
 var ikFac: integer;
begin
  inherited;
  if Modified then DoApply;
  //showmessage(cmbxDate.Value);
  ikFac:=TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.Selected.Parent.Parent.Data).ik;
  if IsBRS then
  begin
  if cmbxNumber.Text='�������' then
  TUspevGroupController.Instance.PrintBRSExamVedomost(ik, cmbxSemAtt.ItemIndex+1, cmbxNumber.Value, ikFac, dbdteBRSExam.Text, dbcbeExaminer.Text, '')
  else
  TUspevGroupController.Instance.PrintBRSVedomost(ik, cmbxSemAtt.ItemIndex+1, cmbxNumber.Value, ikFac, dbdteBRSExam.Text, dbcbeExaminer.Text, '')
  end
  else
  TUspevGroupController.Instance.PrintAttestation(ik, dbcbeSemAtt.ItemIndex+1, nAtt.Value, ikFac, '');

end;

procedure TfmGroup.actPrintAttUpdate(Sender: TObject);
begin
  inherited;
  if (IsBRS) then
  if (cmbxNumber.Text = '�������') then
actPrintAtt.Enabled := not dmUspevaemost.adodsSelBRSExamGroup.IsEmpty
else
actPrintAtt.Enabled := not dmUspevaemost.adodsSelAttBRSGroup.IsEmpty;
end;

procedure TfmGroup.actPrintBlankAttExecute(Sender: TObject);
var ikFac: integer;
begin
  inherited;
  if Modified then DoApply;
  //showmessage(cmbxDate.Value);
  ikFac:=TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.Selected.Parent.Parent.Data).ik;
  if IsBRS then
    TUspevGroupController.Instance.PrintBlankAttestation(ik, cmbxSemAtt.ItemIndex+1, cmbxNumber.Value, ikFac, '')
  else
    TUspevGroupController.Instance.PrintBlankAttestation(ik, dbcbeSemAtt.ItemIndex+1, nAtt.Value, ikFac, '');
end;


procedure TfmGroup.actPrintBRSLastAttExecute(Sender: TObject);
var ikFac, ikDisc: integer;
datezach, dateexam, disc, exam:string;
begin
   if Modified then DoApply;
   ikFac:=TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.Selected.Parent.Parent.Data).ik;
   ikDisc:=dmUspevaemost.adospGetAllAtt.FieldByName('ik_disc').Value;
   Disc:=dmUspevaemost.adospGetAllAtt.FieldByName('cName_disc').Value;
   TUspevGroupController.Instance.PrintBRSLastVedomost(ik, cmbxSemAtt.ItemIndex+1, ikFac, ikDisc, datezach, dateexam, exam, disc);
end;

procedure TfmGroup.actPrintBRSRankAverageExecute(Sender: TObject);
begin
if Modified then DoApply;
   TUspevGroupController.Instance.PrintBRSRankAverageReport(ik, cmbxSemAtt.ItemIndex+1, cmbxNumber.Text);
end;

procedure TfmGroup.actPrintBRSRankAverageUpdate(Sender: TObject);
begin
 if (IsBRS) then
  actPrintBRSRankAverage.Enabled:=(cmbxNumber.Text <> '')and(cmbxSemAtt.Text<>'');
end;

procedure TfmGroup.actPrintBRSRanksExecute(Sender: TObject);
var  disc:string;
begin
if Modified then DoApply;
   TUspevGroupController.Instance.PrintBRSRankReport(ik, cmbxSemAtt.ItemIndex+1, cmbxNumber.Text);
end;

procedure TfmGroup.actPrintBRSRanksUpdate(Sender: TObject);
begin

  if (IsBRS) then
  if (cmbxNumber.Text = '�������') then
actPrintBRSRanks.Enabled := not dmUspevaemost.adodsSelBRSExamGroup.IsEmpty
else
actPrintBRSRanks.Enabled := not dmUspevaemost.adodsSelAttBRSGroup.IsEmpty;
end;

procedure TfmGroup.actPrintDiplExecute(Sender: TObject);
var i:integer;
  cur:TStud;
begin
  inherited;
  TApplicationController.GetInstance.AddLogEntry('����� ������ ��������');
  if (dbgDiplom.RowCount<1) then
    exit;
  //��������� �� �����������
  if modified then
  begin
    Application.MessageBox('������ � �������� ���� ��������. ����� ��������� ������� ������ ����� ���������!', '���������� "�������"', MB_ICONWARNING);
    exit;
  end;

  frmDiplomSelect:=TfrmDiplomSelect.Create(self);
  try
    frmDiplomSelect.showmodal;

    if (frmDiplomSelect.DiplomList.Count < 0) then
      exit;

    dbgDiplom.DataSource.DataSet.DisableControls;
    //while not dbgDiplom.DataSource.DataSet.Eof do
    for i := 0 to frmDiplomSelect.DiplomList.Count - 1 do
    begin
      cur:= frmDiplomSelect.DiplomList[i];
      if (dbgDiplom.DataSource.DataSet.Locate('ik_zach',cur.ikZach,[loPartialKey])) then
      begin
        TDiplomController.Instance.PrintDiplVip(
            dbgDiplom.DataSource.DataSet.FieldByName('ik_zach').Value, ik,
            dbgDiplom.DataSource.DataSet.FieldByName('StudName').AsString,
            dbgDiplom.DataSource.DataSet.FieldByName('ExcelPatternName').AsString,
            dbgDiplom.DataSource.DataSet.FieldByName('ik_direction').AsInteger,
            dbgDiplom.DataSource.DataSet.FieldByName('Ik_fac').AsInteger,
            dbgDiplom.DataSource.DataSet.FieldByName('DiplVklDatPadez').AsBoolean);
      end;
    end;
  finally
    dbgDiplom.DataSource.DataSet.EnableControls;
    frmDiplomSelect.Free;
  end;
end;

procedure TfmGroup.actPrintDiplUpdate(Sender: TObject);
begin
  inherited;
  if (pcMain.ActivePage=tsDiplom) and
     (dbgDiplom.DataSource.DataSet.IsEmpty) then
    (Sender as TAction).Enabled:= false
  else
  begin
    (Sender as TAction).Enabled:= true;
    
  end;

end;

procedure TfmGroup.actPrintEmptyNaprExecute(Sender: TObject);
var ik_ved: integer;
begin
  inherited;
  try
    ik_ved:=dmUspevaemost.adospGetAllVedNaprForDisc.FieldValues['ik_ved'];
  except
    ShowMessage('�������� �����������!');
    exit;
  end;

  ftmNapr:=TftmNapr.Create(self);
  try
    ftmNapr.PrintNapr(ik_ved, true);
  finally
    ftmNapr.Free;
  end;

end;

procedure TfmGroup.actPrintNaprExecute(Sender: TObject);
var ik_ved: integer;
begin

  try
    ik_ved:=dmUspevaemost.adospGetAllVedNaprForDisc.FieldValues['ik_ved'];
  except
    ShowMessage('�������� �����������!');
    exit;
  end;

  ftmNapr:=TftmNapr.Create(self);
  try
    ftmNapr.PrintNapr(ik_ved, false);
  finally
    ftmNapr.Free;
  end;
end;

procedure TfmGroup.actPrntAllBlnkUpdate(Sender: TObject);
begin
  //�������� ���������
  if (cmbxSem.Value>0) and
    (pcMain.ActivePage = tsVed) and
    (dmUspevaemost.adospGetAllVeds4Group.Active) then
    (Sender as TAction).Enabled:= (dmUspevaemost.adospGetAllVeds4Group.RecordCount>0)
  else
    (Sender as TAction).Enabled:= false;
end;

procedure TfmGroup.actPrntGroupExecute(Sender: TObject);
begin
  inherited;
  frmStudInfo:=TfrmStudInfo.Create(self);
  frmStudInfo.ShowModal;
  frmStudInfo.Free;       
end;

procedure TfmGroup.actPrntNotesUpdate(Sender: TObject);
begin
  //�������� ���������
  if (cmbxSem.Value>0) and
    (pcMain.ActivePage = tsVed) and
    (dmUspevaemost.adospSelVed.Active) and
    (dmUspevaemost.adospSelVedGroup.Active) then
    (Sender as TAction).Enabled:= true
  else
    (Sender as TAction).Enabled:= false;

end;

procedure TfmGroup.actRaportsExecute(Sender: TObject);
begin
  TApplicationController.GetInstance.AddLogEntry('����� ������� ������� � ���������');

  //�������� ����������, �� ���-� ���� ��������
  if not TUspevGroupController.Instance.GetContrlVidZanForRaport(ik,cmbxSem.ItemIndex+1) then
  begin
    MessageBox(Handle, '��������� ������ ��� ������� ������ ��������� ���������.','�� "����"',
          MB_OK) ;
    exit;
  end;

  if dmUspevaemost.adospGetUpContRap.RecordCount=0 then
  begin
    MessageBox(Handle, '������ ��������� ��������� ��� �������� �������� ����.','�� "����"',
          MB_OK) ;
    exit;
  end;

  //��������� ������
  frmRaporsDlg:=TfrmRaporsDlg.Create(self);
  try
    frmRaporsDlg.nSem := cmbxSem.ItemIndex+1;
    frmRaporsDlg.ikGroup := ik;
//  frmRaporsDlg.ikVidZan := dm.adospGetAllPredms.Fields[0].Value;
//  frmRaporsDlg.ikDisc := dm.adospGetAllPredms.Fields[1].Value;
    frmRaporsDlg.lblSemestr.Caption := IntToStr(cmbxSem.ItemIndex+1);
    frmRaporsDlg.lblGroup.Caption := TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.Selected.data).Name;
    frmRaporsDlg.ShowModal;
  finally
    frmRaporsDlg.Free;
  end;
end;

procedure TfmGroup.actRaportsUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= true;
end;

function TfmGroup.DoApply: Boolean;
var ik_grup:integer;
    numAtt: integer;
    str: string;
    dateAtt: TDateTime;
begin
  Result := false;

  TApplicationController.GetInstance.AddLogEntry('���������� ���������');
  //�������� ���������
  if pcMain.ActivePage=tsVed then
  begin
  //���� ��������� �������, ��� ��������� ��������
    if not dmUspevaemost.adospSelVed.Active then exit;
    if dmUspevaemost.adospSelVed.FieldByName('lClose').Value = true then
    begin
      MessageBox(Handle, '���������� ��������� ���������, ��� ��� ��� ��� �������.', '�� ����', MB_OK);
      //�������� ��� ���������
      btnCancelVedClick(nil);
      exit;
    end;

	  if dbcbVed.Text = '' then
		  Exit;

	  if dbcmbxPrepodVed.KeyValue = Null then
	  begin
      MessageBox(Handle, '�������� �������������!', '�� ����', MB_OK);
		  Exit;
	  end;

	  if (dbdteEx.Text = '  .  .    ') or
       (dbdteEx.Value = null) then
	  begin
      MessageBox(Handle, '������� ����!', '�� ����', MB_OK);
		  Exit;
	  end;

    TApplicationController.GetInstance.AddLogEntry('���������� ��������� '+dbcbVed.Text);
    //�������� ���������� - ���������� ������ � ��������� ���������
    dmUspevaemost.adospCheckVedClose.Connection.BeginTrans;
    try
      try
        Modified := false;
      //��������� ������ ���������
        TUspevGroupController.Instance.ApplyUspev(ikVed, ikVidZan, @dbgrdVed);
			//��������� ��������� ���������
			  TUspevGroupController.Instance.ApplyVed(dbeNum.Text,0, TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.SelectedObject).ik,
				  ikVidZan, nSem, ikPredm, 0,
				  dbcbxClosed.Checked, false, false, dbcmbxPrepodVed.KeyValue, ikVed,
          dmUspevaemost.adospGetAllVeds4Group.FieldByName('ik_upContent').Value, StrToDate(dbdteEx.Text));
      //��������� ����������, ���� ��� ���������
        dmUspevaemost.adospCheckVedClose.Connection.CommitTrans;
      except
        TApplicationController.GetInstance.AddLogEntry('������ ��� ���������� ���������');
        dmUspevaemost.adospCheckVedClose.Connection.RollbackTrans;
        raise;
      end;
    finally
        //��������� ��������� � ����� ������
	      dbcbVedChange(nil);
        //��������� ������ ���� ����� ������� �� ���� ����� �����
        TUspevGroupController.Instance.GetAllVidZanyats(nSem, ik);

    end;

    //����  ��������� �������, ���������, ����� ����� �������
    //��������� ��� ��������� ����� �������
    if dmUspevaemost.adospSelVed.FieldByName('lClose').AsBoolean then
    begin
      str:=TUspevGroupController.Instance.GetEnableVidZanyats(nSem, ik, ikVidZan);
      if str<>'' then
      begin   //����� ��������� ���������������
        MessageBox(Handle, PAnsiChar(str), '�� ����', MB_OK);
      end;
      end;
  end;

  // �������� "�������� ���������"
  if pcMain.ActivePage=tsAttBRS then begin

  Modified := false;
  Result := true;
  if dbcmbxDisc.Text = '' then
    Exit;

    dmUspevaemost.adospCheckVedClose.Connection.BeginTrans;
    try
    dbgrdBRSAtt.DataSource.DataSet.DisableControls;
    if cmbxNumber.Text='�������' then
       TUspevGroupController.Instance.SaveBRSExam(ikVed, dbgrdBRSExam, dbcbeExaminer.KeyValue, dbdteBRSExam.Value)
    else
      if  haveAtt then
      TUspevGroupController.Instance.SaveBRSAtt(ikVed, dbgrdBRSAtt, dbcbeExaminer.KeyValue, dbdteBRSExam.Value);

    TUspevGroupController.Instance.CloseAtt(ikVed, dbcbeExaminer.KeyValue, dbcbxCloseAtt.Checked);
    dmUspevaemost.adospCheckVedClose.Connection.CommitTrans;
    dbgrdBRSAtt.DataSource.DataSet.EnableControls;
    except
      TApplicationController.GetInstance.AddLogEntry('������ ��� ���������� ��������� ���');
      dmUspevaemost.adospCheckVedClose.Connection.RollbackTrans;
      dbgrdBRSAtt.DataSource.DataSet.EnableControls;
      raise;
    end;

  Modified := false;
  dbcmbxDiscChange(nil);
  end;

     //�������� ����������
    if pcMain.ActivePage=tsAtt then begin

  Modified := false;
  Result := true;
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
      TApplicationController.GetInstance.AddLogEntry('������ ��� ���������� ���������');

    end;

  dbgeAtt.DataSource.DataSet.EnableControls;

    //���������� ����
    ik_grup:=TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.SelectedObject).ik;
    numAtt:=nAtt.Value;
    if dbdteAttBegin.Text<>'  .  .    '  then
      dateAtt:=StrToDate(dbdteAttBegin.Text)
    else
      dateAtt:=date();
    TUspevGroupController.Instance.SaveDateAllAtt(ik_grup, nSem, numAtt, dateAtt);

    //�������� ����������
    TUspevGroupController.Instance.CloseAtt(ikVed, dblcbPrepod.KeyValue, cbAttClose.Checked);

    Modified := false;
    dmUspevaemost.adospCheckVedClose.Connection.CommitTrans;
    except
      TApplicationController.GetInstance.AddLogEntry('������ ��� ���������� ���������');
      dbgeAtt.DataSource.DataSet.EnableControls;
      dmUspevaemost.adospCheckVedClose.Connection.RollbackTrans;
      raise;
    end;

        //��������� �������� ���� ����������
     if cbAttClose.Checked then
    if MessageBox(Handle, '��������! ����� ������� ��� ���������� � ������ ���������.', '�� �������', MB_YESNO)=IDYES
      then
      begin
         ik_grup:=TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.SelectedObject).ik;
         numAtt:=nAtt.Value;
         TUspevGroupController.Instance.CloseAllAtt(ik_grup, nSem, numAtt);
      end;
    dbcbeDiscChange(nil);

  end;

  if (pcMain.ActivePage=tsDiplom) and (Modified) then
  begin
    TDiplomController.Instance.SaveDiploms;
    Modified:= false;
    Result:= true;
  end;

end;

procedure TfmGroup.actEditNaprExecute(Sender: TObject);
var ik_ved: integer;
begin

  try
    ik_ved:=dmUspevaemost.adospGetAllVedNaprForDisc.FieldValues['ik_ved'];
  except
    ShowMessage('�������� �����������!');
    exit;
  end;

  if not TUspevGroupController.Instance.OpenVed(ik_Ved) then
    begin
    MessageBox(Handle, '��� �������� ��������� ��������� ������.', '�� ����', MB_OK);
    exit;
    end;

  ftmNaprClose:=TftmNaprClose.Create(self);
  ftmNaprClose.Tag:=dmUspevaemost.adospGetAllVedNaprForDisc.FieldValues['ik_zach'];
  ftmNaprClose.CloseNapr:=true;
  ftmNaprclose.FormShow(Sender);
  ftmNaprclose.dbcbeNapr.KeyValue:=ik_ved;
  ftmNaprclose.dbcbeNapr.Enabled:=false;
  ftmNaprclose.LoadNapr;
  if ftmNaprclose.showmodal = mrCancel then
    if not TUspevGroupController.Instance.CloseNapr(ik_Ved) then
    begin
    MessageBox(Handle, '��� �������� ��������� ��������� ������.', '�� ����', MB_OK);
    exit;
    end;
  ftmNaprclose.Free;

  dmUspevaemost.adospGetAllVedNaprForDisc.Active := false;
  dmUspevaemost.adospGetAllVedNaprForDisc.ExecProc;
  dmUspevaemost.adospGetAllVedNaprForDisc.Active := true;
  dbgrdNapr.Refresh;
end;

procedure TfmGroup.actEdtGroupExecute(Sender: TObject);
var
  r:integer;
begin
  inherited;
 // dm.adospGetUchPlnGroup.Active := false;

  frmGroupEdt:=TfrmGroupEdt.Create(self);
  frmGroupEdt.ik := TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.SelectedObject).ik;
  frmGroupEdt.SpecFacIK := TDBNodeSpecObject(frmMain.DBDekTreeView_TEST1.SelectedObject.Parent).ik;
  frmGroupEdt.WithSpec := false;
  frmGroupEdt.Edit := true;

  r:= frmGroupEdt.ShowModal;
  if ((r = mrOK) or (frmGroupEdt.bbApply.Tag = 1)) then
  begin
    DataSet.Active:=false;
    DataSet.Active:=true;
    frmMain.DBDekTreeView_TEST1.RefreshNodeExecute(frmMain.DBDekTreeView_TEST1.Selected.Parent);
  end;
  frmGroupEdt.Free;
end;

procedure TfmGroup.actCreateAttestExecute(Sender: TObject);
var ik_grup:integer;
    numAtt: integer;
begin

  ik_grup:=TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.SelectedObject).ik;
  nSem := dbcbeSemAtt.ItemIndex+1;
  numAtt:= nAtt.Value;

  haveAtt:= TUspevGroupController.Instance.CreateAllAtt(ik_grup, nSem, numAtt, IsBrs);
  actCreateAttest.Enabled := false;
  TUspevGroupController.Instance.GetAllAtt(ik_grup, nSem, numAtt, IsBRS);

  RefreshView;
end;

procedure TfmGroup.actCreateAttExecute(Sender: TObject);
var ik_grup:integer;
    //nSem: Integer;
    numAtt: integer;
begin
  inherited;

  ik_grup:=TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.SelectedObject).ik;
  nSem := cmbxSemAtt.ItemIndex+1;
  numAtt:= cmbxNumber.Value;

  haveAtt:= TUspevGroupController.Instance.CreateAllAtt(ik_grup, nSem, numAtt, IsBrs);

  actCreateAtt.Enabled := false;

  TUspevGroupController.Instance.GetAllAtt(ik_grup, nSem, numAtt, IsBRS);

  RefreshView;
end;

procedure TfmGroup.actCreateDiplomsExecute(Sender: TObject);
begin
  inherited;
  TApplicationController.GetInstance.AddLogEntry('������. �������� ��� ������ '+TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.SelectedObject).Name);
  TDiplomController.Instance.CreateDiploms(ik);

  TDiplomController.Instance.GetDiplomList(ik);
end;

procedure TfmGroup.actCreateDiplomsUpdate(Sender: TObject);
begin
  inherited;
  if (pcMain.ActivePage=tsDiplom) and
     (dbgDiplom.DataSource.DataSet.IsEmpty) then
    (Sender as TAction).Enabled:= true
  else
    (Sender as TAction).Enabled:= false;
end;

procedure TfmGroup.actDelAttExecute(Sender: TObject);
begin
  if MessageBox(Handle, '�� �������, ��� ������ ������� ����������?',
					  '�� ����', MB_YESNO)=IDYES then
  begin
  //�������� ����������
    TUspevGroupController.Instance.DelVed(ikVed);
  //��� �������������
    dbcmbxDisc.Value:= null;
    dmUspevaemost.adodsSelAttGroup.Close;
    dmUspevaemost.adospGetAllAtt.Close;
    dmUspevaemost.adospGetAllAtt.Open;
    dmUspevaemost.adospGetAllAtt.First;
    //��������� ������ ���� ����� ������� �� ���� ����� �����
    TUspevGroupController.Instance.GetAllAtt(ik, nsem, cmbxNumber.Value, IsBRS);
  end;
end;

procedure TfmGroup.actDelGroupExecute(Sender: TObject);
var
  ik: Integer;
  Grp: TDBNodeGroupObject;
begin
  inherited;
  Grp := TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.SelectedObject);
  if MessageBox(Handle, '�� �������, ��� ������ ������� ��������� ������?', '�� ����', MB_YESNO)=IDYES
    then
 { if MessageDlg('�� �������, ��� ������ ������� ��������� ������?', mtConfirmation,
               [mbYes, mbNo], 0) = mrYes then}
  begin
    ik := Grp.ik;
    try
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
      DataSet.Active:=false;
      DataSet.Active:=true;
      frmMain.DBDekTreeView_TEST1.RefreshNodeExecute(frmMain.DBDekTreeView_TEST1.Selected.Parent);
    except
      ShowMessage('���������� ������� ������. ���������� ������, ��������� � �������: ��������, ��������� � �.�.');
    end;

  end;
end;

procedure TfmGroup.actDelNaprExecute(Sender: TObject);
begin
  if MessageBox(Handle, '�� �������, ��� ������ ������� �����������?',
					  '�� ����', MB_YESNO)=IDYES then
  begin
  //�������� ���������
    TUspevGroupController.Instance.DelVed(dmUspevaemost.adospGetAllVedNaprForDisc.FieldByName('ik_ved').Value);
  //��� �������������
    dmUspevaemost.adospGetAllVedNaprForDisc.Close;
    dmUspevaemost.adospGetAllVedNaprForDisc.Open;
  end;
end;

procedure TfmGroup.actDelNaprUpdate(Sender: TObject);
begin
  if (dmUspevaemost.adospGetAllVedNaprForDisc.Active) then
     (Sender as TAction).Enabled:=
        (dmUspevaemost.adospGetAllVedNaprForDisc.RecordCount>0)
  else  (Sender as TAction).Enabled:=false;
end;

procedure TfmGroup.actDelVedExecute(Sender: TObject);
begin
  //inherited;
  if MessageBox(Handle, '�� �������, ��� ������ ������� ���������?',
					  '�� ����', MB_YESNO)=IDYES then
  begin
  //�������� ���������
    TUspevGroupController.Instance.DelVed(ikVed);
    Modified:= false;
  //��� �������������
    dbcbVed.Value:= null;
    dmUspevaemost.adospSelVedGroup.Close;
    dmUspevaemost.adospGetAllVeds4Group.Close;
    dmUspevaemost.adospGetAllVeds4Group.Open;
    dmUspevaemost.adospGetAllVeds4Group.First;
    //��������� ������ ���� ����� ������� �� ���� ����� �����
    TUspevGroupController.Instance.GetAllVidZanyats(nSem, ik);
  end;
end;

procedure TfmGroup.actDelVedUpdate(Sender: TObject);
begin
  if (dmUspevaemost.adospSelVed.Active) and
    (dmUspevaemost.adospSelVedGroup.Active) then
    (Sender as TAction).Enabled:=
      (not dmUspevaemost.adospSelVed.FieldByName('lClose').AsBoolean)
   else (Sender as TAction).Enabled:=false;

end;

procedure TfmGroup.actMkVinExecute(Sender: TObject);
begin
  TApplicationController.GetInstance.AddLogEntry('����� ������� �������� ��������� ��������');

  if not TUspevGroupController.Instance.SelContrlForVinVed(ik, cmbxSem.ItemIndex+1) then
    exit;

  if dmUspevaemost.adosp4VinVed.RecordCount=0 then
  begin
    TApplicationController.GetInstance.AddLogEntry('������ ��������� �������� ��������� ����');
    MessageBox(Handle, '������ ��������� ��������� ��� �������� �������� ����.','�� "����"',
          MB_OK) ;
    exit;
  end;

  //��������� ������
  frmVinEkz:=TfrmVinEkz.Create(self);
  try
    frmVinEkz.ikGroup := ik;
    frmVinEkz.nSem := cmbxSem.ItemIndex+1;
    frmVinEkz.ShowModal;
  finally
    frmVinEkz.Free;
  end;
  cmbxSemChange(sender);
end;

procedure TfmGroup.actMkVinUpdate(Sender: TObject);
begin
  //�������� ���������
  if (cmbxSem.Value>0) and
    (pcMain.ActivePage = tsVed) then
    (Sender as TAction).Enabled:= TUspevGroupController.Instance.CanCreateVnostVed
  else
    (Sender as TAction).Enabled:= false;

end;

procedure TfmGroup.actNaprRegisterExecute(Sender: TObject);
begin
frmNaprRegister:=TfrmNaprRegister.Create(self);
try
frmNaprRegister.ik_sem:=nSem;
frmNaprRegister.Tag:=dmUspevaemost.adospSelVedGroup.FieldByName('ik_zach').AsInteger;
frmNaprRegister.Hint:=inttostr(ik);
frmNaprRegister.ik_up_content := dmUspevaemost.adospGetAllVeds4Group.FieldByName('ik_upContent').AsInteger;

frmNaprRegister.showmodal;
finally
  frmNaprRegister.Free;
end;

end;

procedure TfmGroup.DoCancel;
begin
  //result:=false;
end;

procedure TfmGroup.DoCreate;
begin
  //result:=false;
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
var i:integer;
begin
  inherited;
  for i:=0 to dataSource1.DataSet.FieldCount do
    ShowMessage(dataSource1.DataSet.Fields[i].DisplayName);
end;

procedure TfmGroup.actRefreshDopuskExecute(Sender: TObject);
var
  tmpStr: String;
  //ikFac: integer;
begin
  TApplicationController.GetInstance.AddLogEntry('���������� ��������');

  if Modified then
  begin
    tmpStr := '������ ��������� ��� '+IntToStr(cmbxSem.ItemIndex+1)+
                ' �������� �� '+
                dmUspevaemost.adospGetAllVeds4Group.FieldByName('cName_Disc').Value+
                ' ���� ��������. ��������� ���������?';
    if MessageBox(Handle, PAnsiChar(tmpStr), '�� ����', MB_YESNO)=IDYES
    then
      btnSaveVed.Click
    else
      RefreshView;
  end;

  if not TUspevGroupController.Instance.UpdateDopuskForVed(ikVed) then
  begin
    MessageBox(Handle, '��������� ������ ��� ���������� ��������.','�� "����"',
          MB_OK) ;
  end;
  RefreshView;
end;

procedure TfmGroup.actRefreshDopuskUpdate(Sender: TObject);
begin
  if dmUspevaemost.adospSelVed.Active then
    (Sender as TAction).Enabled:=
      dmUspevaemost.adospSelVed.FieldByName('HasDopusk').AsBoolean and
      (not dmUspevaemost.adospSelVed.FieldByName('lClose').AsBoolean)
  else
    (Sender as TAction).Enabled:= false;
end;

procedure TfmGroup.actRefreshVedStudsExecute(Sender: TObject);
var tempStoredProc: TADOStoredProc;
  studNames: string;
  flAreChanged:boolean;
begin
  inherited;
  TApplicationController.GetInstance.AddLogEntry('���������� c����� ��������� ��������� '+IntToStr(ikVed));
  tempStoredProc:= TADOStoredProc.Create(nil);
    try
    tempStoredProc.ProcedureName:= 'UspevUpdateVedomost;1';
    tempStoredProc.Connection:= dm.DBConnect;
    tempStoredProc.Parameters.CreateParameter('@Ik_ved', ftInteger, pdInput, 4,ikVed);
    tempStoredProc.Active:= true;
    tempStoredProc.First;  //FIO
    studNames:= '';
    flAreChanged:= false;
    while not tempStoredProc.Eof do
    begin
      if (flAreChanged) then
        studNames:=studNames+', ';
      studNames:=studNames+' '+tempStoredProc.FieldByName('StudName').Value;
      flAreChanged:= true;
      tempStoredProc.Next;
    end;
    if (flAreChanged) then
    begin
      studNames:= '�������� '+studNames+' �� ���� ������� �� ���������, ������ ��� � ��� ���� ������. ���� ����� �� �������, �������������� ������� ������';
      MessageBox(Handle, PAnsiChar(studNames),'�� �������',MB_OK);
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
    (Sender as TAction).Enabled:=
      (not dmUspevaemost.adospSelVed.FieldByName('lClose').AsBoolean)
  else
    (Sender as TAction).Enabled:= false;
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
  if (cmbxNumber.Text='�������')and(dmUspevaemost.adospSelBRSExam.Active) then
  begin
  actSaveBRS.Enabled := not (dmUspevaemost.adospSelBRSExam.FieldByName('lClose').AsBoolean);
  end
  else
  if not dmUspevaemost.adospSelAtt.IsEmpty then
  actSaveBRS.Enabled := (not dmUspevaemost.adospSelAtt.FieldByName('lClose').AsBoolean)and(not((dbdteBRSExam.Text='  .  .    ')or(dbcbeExaminer.Text='')));

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
  if pcMain.ActivePage=tsDiplom then
    (Sender as TAction).Enabled:= Modified;

end;

procedure TfmGroup.actSaveVedExecute(Sender: TObject);
begin
  DoApply;

end;

procedure TfmGroup.actSaveVedUpdate(Sender: TObject);
begin
  inherited;
   if (dmUspevaemost.adospSelVed.Active) then
      (Sender as TAction).Enabled:=
        not dmUspevaemost.adospSelVed.FieldByName('lClose').AsBoolean;
end;

procedure TfmGroup.actUpdateDiplomsExecute(Sender: TObject);
begin
  inherited;
  TApplicationController.GetInstance.AddLogEntry('������. ���������� ������');
  LoadDiploms;
end;

procedure TfmGroup.actUpdateDiplomsUpdate(Sender: TObject);
begin
  inherited;
  if (pcMain.ActivePage=tsDiplom) and
     (not dbgDiplom.DataSource.DataSet.IsEmpty) then
    (Sender as TAction).Enabled:= true
  else
    (Sender as TAction).Enabled:= false;

end;

procedure TfmGroup.actUspevforStipendExecute(Sender: TObject);
var
  Report:TReportBase;
begin
    Report := TReportBase.CreateReport(TGrupUspevForStipend);
    Report.FreeOnComplete := true;
    Report.OnExecuteError := ExecuteError;
    Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\UspevForStipend.xlt';
    TGrupUspevForStipend(Report).Connection:=Connection;
    TGrupUspevForStipend(Report).ikFac:= Fac_ik;
    TGrupUspevForStipend(Report).ikGrup:= ik;
    TGrupUspevForStipend(Report).nSem:= cmbxUspSem.Value;
    TWaitingController.GetInstance.Process(Report);
end;

procedure TfmGroup.ExecuteError(Sender: TObject; E: Exception);
begin
  ShowMessage('��������� ������ ��� �������� ������������ ������: ' + E.Message);
  (Sender as TReportBase).Quit;
end;

function TfmGroup.IsBRS: boolean;
begin
{result:=false;

if Frameobject=nil then exit;

dmUchPlan.adodsUchPlan.close;
  dmUchPlan.adodsUchPlan.CommandText := 'select * from Uch_pl where (ik_uch_plan = '+inttostr((Frameobject as TDBNodeGroupObject).UchPlanIK)+')';
  dmUchPlan.adodsUchPlan.open;
  if (dmUchPlan.adodsUchPlan.FieldByName('IsBRSPlan').Value <> NULL) then
  result := (dmUchPlan.adodsUchPlan.FieldByName('IsBRSPlan').Value)
  else result :=false;}

  if pcMain.ActivePage = tsAttBRS then result:=true
  else result:=false;

end;

procedure TfmGroup.actUspevToExcelExecute(Sender: TObject);
begin
  if (sgUspev.ColCount<2) then
  begin
    MessageBox(Handle, '��� ������ ��� �������� � Excel.','�� "����"',
          MB_OK) ;
    exit;
  end;
  
  //�������� ������������
  if not TUspevGroupController.Instance.PrintUspevToExcel(sgUspev) then
    MessageBox(Handle, '��������� ������ ��� �������� ������������ � Excel.','�� "����"',
          MB_OK) ;

end;

procedure TfmGroup.actUspevToExcelUpdate(Sender: TObject);
begin
    (Sender as TAction).Enabled:= (sgUspev.ColCount>1) ;
end;


procedure TfmGroup.CheckAttExist;
var
  ik_grup, nSem, nom_ved, nmodule: Integer;
  kolAtt, kol_rec: Integer;
  //dateAtt: TDate;
begin

  if (cmbxNumber.Value = Null) or (cmbxNumber.Text = '')then
    Exit;

  actCreateAtt.Enabled := true;
  nSem := cmbxSemAtt.ItemIndex+1;
  nom_ved:=cmbxNumber.Value;
  ik_grup:=TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.SelectedObject).ik;
  haveAtt := false;

    // �������� ������ ��������� ��� ����������, ������� ������ ����
    kolAtt:=TUspevGroupController.Instance.GetAttVidZan(ik, nSem, nom_ved, IsBRS);
    dmUspevaemost.adospGetAttVidZan.First;

  if kolAtt = 0 then
  begin
    MessageBox(Handle, '� ������� ����� ��� �� ����� ����������!', '�� ����', MB_OK);
    dmUspevaemost.adospGetAllAtt.Active := false;
    Exit;
  end;
  // ������� ���� ������������ ����������

  kol_rec:=TUspevGroupController.Instance.GetAllAtt(ik_grup, nsem, nom_ved, IsBRS);

  // ��������, ������� �� ��� ���������� �� �������� ����� ��� ����� ��������
  if kolAtt > kol_rec//dmUspevaemost.adospGetAllAtt.RecordCount
  then
  begin
    // ���� ����� ���������� �� �������, �� ���� ���������
    if dmUspevaemost.adospGetAllAtt.RecordCount<>0 then
    begin
      // ������ ��� ����������� ����������
      haveAtt:= TUspevGroupController.Instance.CreateAllAtt(ik_grup, nSem, nom_ved, IsBrs);
    end
    else // ���� �� ������� �� ���� ����������
    begin
      if MessageBox(Handle, '�� ������� �� ����� ����������. ������� �� ������?',
                  '�� ����', MB_YESNO)=IDYES then
        // ���� ����������� - ������...
        TUspevGroupController.Instance.CreateAllAtt(ik_grup, nSem, nom_ved, IsBRS)
      else
        haveAtt := false; // �������� ���������� ���������� ������
    end;
  end
  else
  begin
    haveAtt := true;

  end;

  //if haveAtt then cmbxDate.ItemIndex:=0;
  TUspevGroupController.Instance.GetAllAtt(ik_grup, nsem, nom_ved, IsBRS);

  actCreateAtt.Enabled := not haveAtt;
  actPrintBlankAtt.Enabled := haveAtt;
  actPrintAtt.Enabled := haveAtt;
end;

procedure TfmGroup.CheckBRSExamExist;
var
  ik_grup, nSem: Integer;
  kolExam, kol_rec: Integer;

begin

  if (cmbxNumber.Value = Null) or (cmbxNumber.Text = '')then
    Exit;

  //actCreateAtt.Enabled := true;
  nSem := cmbxSemAtt.ItemIndex+1;
  ik_grup:=TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.SelectedObject).ik;
  haveAtt := false;

    // �������� ������ ��������� ��� ��������� ���, ������� ������ ����
    kolExam:=TUspevGroupController.Instance.GetBRSExamVidZan(ik, nSem);
    dmUspevaemost.adospGetBRSExamVidZan.First;

  if kolExam = 0 then
  begin
    MessageBox(Handle, '� ������� ����� ��� �� ������ �������� ���!', '�� ����', MB_OK);
    dmUspevaemost.adospGetAllBRSExam.Active := false;
    Exit;
  end;
  // ������� ���� ������������ ���������

  kol_rec:=TUspevGroupController.Instance.GetAllBRSExam(ik_grup, nsem);

  // ��������, ������� �� ��� �������� ��� �� �������� ����� ��� ����� ��������
  if kolExam > kol_rec
  then
  begin
    // ���� ����� ���������� �� �������, �� ���� ���������
    if dmUspevaemost.adospGetAllBRSExam.RecordCount<>0 then
      // ������ ��� ����������� ��������
     TUspevGroupController.Instance.CreateAllBRSExam(ik_grup, nSem)

    else // ���� �� ������ �� ���� �������
    begin
      if MessageBox(Handle, '�� ������� �� ������ �������� ���. ������� �� ������?',
                  '�� ����', MB_YESNO)=IDYES then
        // ���� ����������� - ������...
        TUspevGroupController.Instance.CreateAllBRSExam(ik_grup, nSem);
      //else
        haveAtt := false; // �������� ���������� ���������� ������
    end;
  end
  else
    haveAtt := true;


  //if haveAtt then cmbxDate.ItemIndex:=0;
  TUspevGroupController.Instance.GetAllBRSExam(ik_grup, nsem);

  actCreateAtt.Enabled := false;
  actPrintBlankAtt.Enabled := false;
  actPrintAtt.Enabled := false;
end;

procedure TfmGroup.CheckSimpleAttExist;
var
  ik_grup, nSem, nom_ved, nmodule: Integer;
  kolAtt, kol_rec: Integer;
  //dateAtt: TDate;
begin

  if (nAtt.Value = Null) or (nAtt.Text = '')then
    Exit;

    // ��������� Action �� ������������ ������� �����������
  actCreateAttest.Enabled := true;
  nSem := dbcbeSemAtt.ItemIndex+1;
  nom_ved:=nAtt.Value;
  ik_grup:=TDBNodeGroupObject(frmMain.DBDekTreeView_TEST1.SelectedObject).ik;
  haveAtt := false;

    // �������� ������ ��������� ��� ����������, ������� ������ ����
    kolAtt:=TUspevGroupController.Instance.GetAttVidZan(ik, nSem, nom_ved, IsBRS);
    dmUspevaemost.adospGetAttVidZan.First;

  if kolAtt = 0 then
  begin
    MessageBox(Handle, '� ������� ����� ��� �� ����� ����������!', '�� ����', MB_OK);
    dmUspevaemost.adospGetAllAtt.Active := false;
    Exit;
  end;
  // ������� ���� ������������ ����������

  kol_rec:=TUspevGroupController.Instance.GetAllAtt(ik_grup, nsem, nom_ved, IsBRS);

  // ��������, ������� �� ��� ���������� �� �������� ����� ��� ����� ��������
  if kolAtt > kol_rec//dmUspevaemost.adospGetAllAtt.RecordCount
  then
  begin
    // ���� ����� ���������� �� �������, �� ���� ���������
    if dmUspevaemost.adospGetAllAtt.RecordCount<>0 then
    begin
      // ������ ��� ����������� ����������
      haveAtt:= TUspevGroupController.Instance.CreateAllAtt(ik_grup, nSem, nom_ved, IsBrs);
    end
    else // ���� �� ������� �� ���� ����������
    begin
      if MessageBox(Handle, '�� ������� �� ����� ����������? ������� �� ������?',
                  '�� ����', MB_YESNO)=IDYES then
        // ���� ����������� - ������...
        TUspevGroupController.Instance.CreateAllAtt(ik_grup, nSem, nom_ved, IsBRS)
      else
        haveAtt := false; // �������� ���������� ���������� ������
    end;
  end
  else
  begin
    haveAtt := true;

  end;

  //if haveAtt then cmbxDate.ItemIndex:=0;
  TUspevGroupController.Instance.GetAllAtt(ik_grup, nsem, nom_ved, IsBRS);

  actCreateAttest.Enabled := not haveAtt;
  actPrintBlankAtt.Enabled := haveAtt;
  actPrintAtt.Enabled := haveAtt;
end;



end.


