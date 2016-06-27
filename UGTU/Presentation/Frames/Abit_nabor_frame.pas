unit ABIT_nabor_frame;
   {#Author tanyav@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseFrame, ComCtrls, StdCtrls, Buttons, ExtCtrls, ToolWin,
  Grids, DbUtilsEh, DBGridEh,ADODB, DB, DBCtrls, OleServer, WordXP, ExcelXP,
  ImgList, Mask, DBCtrlsEh, Menus, //TeeProcs, TeEngine, Chart, Series,
  ActnList,ComObj, GridsEh, ApplicationController, ExceptionBase, DBGrids,
  DBLookupEh, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  System.Actions, DBAxisGridsEh;

type
  TfmAbitNabor = class(TfmBase)
    PageControl1: TPageControl;
    naborpage: TTabSheet;
    ToolBar2: TToolBar;
    statpage: TTabSheet;
    ToolBar1: TToolBar;
    DS_nabor: TDataSource;
    nnyear: TDBText;
    nabor: TDBGridEh;
    GRD_stat: TStringGrid;
    nn_abit: TComboBox;
    ImageList1: TImageList;
    s_ik: TComboBox;
    f_ik: TComboBox;
    ToolButton4: TToolButton;
    spec: TDBComboBoxEh;
    fac: TDBComboBoxEh;
    counter: TLabel;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ToolButton7: TToolButton;
    DS_for_spisok: TDataSource;
    DS_datestend: TDataSource;
    ImageList2: TImageList;
    fac_spec: TTabSheet;
    dbgrdMain: TDBGridEh;
    dsMain: TDataSource;
    actList: TActionList;
    actAddNabor: TAction;
    actEditNabor: TAction;
    actDelNabor: TAction;
    ImageList3: TImageList;
    ToolButton6: TToolButton;
    dbgrdStatistika: TDBGridEh;
    actPrintNabor: TAction;
    ToolButton8: TToolButton;
    actPrintItogiAbit: TAction;
    ppmStatToExcel: TPopupMenu;
    actPrintStat: TAction;
    Excel1: TMenuItem;
    N1: TMenuItem;
    ToolButton1: TToolButton;
    actImportNabor: TAction;
    tsNaborStatistik: TTabSheet;
    dbgNaborStatistik: TDBGridEh;
    actPrintDinamica: TAction;
    ToolButton2: TToolButton;
    ToolBar3: TToolBar;
    ToolButton9: TToolButton;
    actStatToExcel: TAction;
    tsNaborDisc: TTabSheet;
    ToolBar5: TToolBar;
    DBNavigator1: TDBNavigator;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton13: TToolButton;
    actSaveMinBalls: TAction;
    actCancelMinBalls: TAction;
    dbgNaborDiscs: TDBGridEh;
    actPrintAbitExams: TAction;
    N2: TMenuItem;
    actPrintExamStatistic: TAction;
    N3: TMenuItem;
    tsExamsErrors: TTabSheet;
    dbgExamsErrors: TDBGridEh;
    ToolButton12: TToolButton;
    ToolButton14: TToolButton;
    IndBalls: TTabSheet;
    dbgIndBalls: TDBGridEh;
    Network: TTabSheet;
    dbgNetwork: TDBGridEh;
    actPrintProtocol: TAction;
    ToolButton15: TToolButton;
    N6: TMenuItem;
    tbPhotosExport4Bank: TToolButton;
    actExportPhotos: TAction;
    constructor CreateFrame(AOwner:TComponent; AObject:TObject; AConn:TADOConnection);override;
    procedure naborKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  {  procedure MoveDown(dir, count, extend: OleVariant);
    procedure MoveLeft(dir, count, extend: OleVariant);
    procedure MoveRight(dir, count, extend: OleVariant);
    procedure MoveUp(dir, count, extend: OleVariant);
    function Replace(oldstr,newstr:OleVariant):boolean;
    procedure ToExcel(Sender:TStringGrid);
    procedure ToExceldb(); 
    procedure GetStat();
    procedure Filter();}
    procedure specChange(Sender: TObject);
    procedure naborTitleClick(Column: TColumnEh);
    procedure facChange(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure actAddNaborExecute(Sender: TObject);
    procedure actEditNaborExecute(Sender: TObject);
    procedure actDelNaborExecute(Sender: TObject);
    procedure dbgrdStatistikaTitleClick(Column: TColumnEh);
    procedure dbgrdMainTitleClick(Column: TColumnEh);
    procedure actPrintNaborExecute(Sender: TObject);
    procedure actPrintStatExecute(Sender: TObject);
    procedure actDelNaborUpdate(Sender: TObject);
    procedure actImportNaborExecute(Sender: TObject);
    procedure actImportNaborUpdate(Sender: TObject);
    procedure dbgNaborStatistikTitleClick(Column: TColumnEh);
    procedure actPrintDinamicaExecute(Sender: TObject);
    procedure actStatToExcelExecute(Sender: TObject);
    procedure dbgNaborDiscsTitleClick(Column: TColumnEh);
    procedure actSaveMinBallsExecute(Sender: TObject);
    procedure dbgNaborDiscsColumns2UpdateData(Sender: TObject; var Text: string;
      var Value: Variant; var UseText, Handled: Boolean);
    procedure actSaveMinBallsUpdate(Sender: TObject);
    procedure actCancelMinBallsExecute(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure actPrintAbitExamsExecute(Sender: TObject);
    procedure actPrintExamStatisticExecute(Sender: TObject);
    procedure dbgNaborDiscsColumns2DropDownBoxDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumnEh;
      State: TGridDrawState);
    procedure actPrintProtocolExecute(Sender: TObject);
    procedure actExportPhotosExecute(Sender: TObject);
  private
    function GetikFac: Integer;
    function GetikSpecfac: Integer;
    function GetYear: integer;
   // procedure actPrintItogiAbitExecute(Sender: TObject);
  protected
     function DoApply: Boolean;override;
     procedure DoCancel; override;
     //���������� ������� � �������� �� ������ �������
     procedure LoadDataFromFunction(Target: TADOQuery);
     procedure LoadDataFromQuery(Target: TADOQuery);

     //��������� ��������� ������
     procedure LoadMainList;
     //��������� ������ �������
     procedure LoadNaborList();
     //��������� ������ ������������
     procedure LoadAbitList();
     //��������� ���������� �� ������ ��� ������� (���a) @objectType:
     //1 - ���� ���, 2 - ���������, 3 - �������������
     //@objectID - ��� ���������������� �������
     procedure LoadNaborStatistik;
     //��������� ������ ������ ���������
     procedure LoadEcxessExamsList();
     //��������� ��� �������������� ���������� � �������
     procedure LoadIndBalls();
     //��������� ������������, �������� ��������� �� ����
     procedure LoadNetworkAbit;

     procedure RefreshDataSet(dataSet:TADODataSet);

  published


     //procedure ExportAbitToZhurnal(E:Variant;var  i:integer);
    // procedure PrintObColvo(E:Variant;var i:integer);

  public
    { Public declarations }

    procedure Load();
    procedure DoRefreshFrame; override;
    procedure WidthSet(sender:TStringGrid;size:real);
    // �������� ��� ������
    property year:Integer read GetYear;
    // �������� ��� ����������
    property fc:Integer read GetikFac;
    // �������� ��� ������������� ����������
    property sp:Integer read GetikSpecfac;
  end;

var
  fmAbitNabor: TfmAbitNabor;
implementation

uses   //ToolCtrlsEh,
AbiturientNaborProcs, AbiturientFacade,
  AbiturientBaseProcs, ABIT_add_nabor_dialog, AbiturientAbitProcs,
  AbiturientExamProcs,DBTVRecruitobj,DBTVFacRecobj,DBTVspecRecobj, uDM,
  uMain, uDMUgtuStructure, uAbitNaborController,uAbitOtchetsController,
  uDMAbiturientNabor, ReportsBase, AbitDinamica, uWaitingController,
  DateUtils, ReportDataSet, AbitVstupExams, AbitVstupExamStatistic;

{$R *.dfm}

constructor TfmAbitNabor.CreateFrame(AOwner:TComponent; AObject:TObject; AConn:TADOConnection);
begin
  inherited;
  //������� DataSet
  DS_nabor.DataSet:= TADODataSet.Create(nil);
end;


procedure TfmAbitNabor.DoRefreshFrame;
begin
// TAbiturientFacade.Instance:=TAbiturientFacade.Create(self);
 DMAbiturientNabor.adoqNaborList.Close;
 DMAbiturientNabor.adospAbitGetPostupStatistika.Close;
 DMAbiturientNabor.adospAbitNaborStatistik.Close;
 DMAbiturientNabor.adoqNaborDiscs.Close;
 DMAbiturientNabor.adoqExamsErrors.Close;
 DMAbiturientNabor.adoNetworkAbit.Close;
 DMAbiturientNabor.adoIndBall.Close;
 //PageControl1.ActivePageIndex := 0;
 Load;

end;

//��������� ��������� ������
procedure TfmAbitNabor.LoadMainList;
begin
  dsMain.DataSet := nil;
  fac_spec.TabVisible:= false;

  if FrameObject is TDBNodeRecruitObject then //������ ���� �����
  begin
    PageControl1.ActivePage := naborpage;
    fac_spec.Caption := '����������';
    //PageControl1.Pages[0].Caption := '����������';
    dsMain.DataSet := (FrameObject as TDBNodeRecruitObject).DataSet;
    dbgrdMain.Columns[0].Visible := false;
    dbgrdMain.Columns[1].Title.Caption := '��������';
    dbgrdMain.Columns[2].Title.Caption := '�������� ��������';
    dbgrdMain.Columns[3].Visible := false;
    dbgrdMain.Columns[4].Visible := false;
    dbgrdMain.Columns[5].Visible := false;
    frmMain.StatusBar1.Panels[1].Text:='���������� �����������: ' + IntToStr(dsMain.DataSet.RecordCount);
    naborpage.TabVisible:=true;
  end;
  //������ ���������
  if FrameObject is TDBNodeFacRecObject then
  begin
    PageControl1.ActivePage := naborpage;
    fac_spec.Caption := '�������������';
    //PageControl1.Pages[0].Caption := '�������������';
    dsMain.DataSet := (FrameObject as TDBNodeFacRecObject).AdoDataset;
    dbgrdMain.Columns[0].Visible := false;
    dbgrdMain.Columns[1].Visible := false;
    dbgrdMain.Columns[2].Visible := false;
    dbgrdMain.Columns[3].Visible := false;
    dbgrdMain.Columns[4].Title.Caption := '�����';
  //  dbgrdMain.Columns[4].Width := 30;
    dbgrdMain.Columns[5].Title.Caption := '��������';
    dbgrdMain.Columns[6].Title.Caption := '�������� ��������';
   // dbgrdMain.Columns[6].Width := 57;
    dbgrdMain.Columns[6].Alignment := taCenter;
    dbgrdMain.Columns[7].Visible := false;
    dbgrdMain.Columns[8].Visible := false;
    dbgrdMain.Columns[9].Visible := false;
    dbgrdMain.Columns[10].Title.Caption := '����������� ��������';
    dbgrdMain.Columns[11].Visible := false;
    dbgrdMain.Columns[12].Title.Caption := '����� ��������';
    dbgrdMain.Columns[13].Visible := false;
    dbgrdMain.Columns[14].Visible := false;
    dbgrdMain.Columns[15].Visible := false;
    frmMain.StatusBar1.Panels[0].Text:='���������: ' + TDBNodeFacRecObject(FrameObject).Name;
    frmMain.StatusBar1.Panels[1].Text:='���������� ��������������: ' + IntToStr(dsMain.DataSet.RecordCount);
    naborpage.TabVisible:=true;
  end;

  //�������������
  if FrameObject is TDBNodeSpecRecObject then
  begin
    PageControl1.ActivePage := tsNaborDisc;
    {PageControl1.Pages[0].Caption := '�����������';
    dsMain.DataSet := (FrameObject as TDBNodeSpecRecObject).AdoDataset;

    // TODO: ����, ����������

    With dbgrdMain do begin

    for i := 0 to Columns.Count-1 do
    Columns[i].Visible := false;

    FieldColumns['NameStud'].Visible := true;
    FieldColumns['dd_pod_zayav'].Visible := true;
    FieldColumns['cmedal'].Visible := true;
    FieldColumns['cname_zach'].Visible := true;

    FieldColumns['NameStud'].Title.Caption := '���';
    FieldColumns['dd_pod_zayav'].Title.Caption:= '���� ������';
    FieldColumns['cmedal'].Title.Caption := '������';
    FieldColumns['cname_zach'].Title.Caption := '��������� ����������';
    end;

    frmMain.StatusBar1.Panels[0].Text:='�������������: ' + TDBNodeFacRecObject(FrameObject).Name;

    //��������� ���-�� ������������, ������� �� ���������
    i:=0;
    dsMain.DataSet.DisableControls;
    dsMain.DataSet.First;
    while not dsMain.DataSet.Eof do
    begin
      if (dsMain.DataSet.FieldValues['ik_type_zach']=1)or(dsMain.DataSet.FieldValues['ik_type_zach']=2) then
        inc(i);
      dsMain.DataSet.Next;
    end;
    dsMain.DataSet.EnableControls;
    frmMain.StatusBar1.Panels[1].Text:='������������: ' + IntToStr(i); }
    //�������� ������� ����� ������ ������
    naborpage.TabVisible:=false;
    fac_spec.TabVisible:=false;
    //PageControl1.ActivePage := statpage;


  end;
  PageControl1Change(nil);
end;

//���������� ������� � �������� �� ������ ������� �����������,
//��� ��� ��� ������� ��� ��������� ���������� �� ������ ������
procedure TfmAbitNabor.LoadDataFromFunction(Target: TADOQuery);
var sqlFilter: string;
begin
  //��������� ����������
  with Target do
  begin
    Close;

    SQL[1]:= '('+IntToStr(year)+')';

    //������ �� �������� ������� ������������� ������ �� ������ �������
    sqlFilter:= '';

    //���������
    if FrameObject is TDBNodeFacRecObject then
      sqlFilter:='(ik_fac =' + inttostr(fc)+')';

    //�������������
    if FrameObject is TDBNodeSpecRecObject then
      sqlFilter:='(ik_spec_fac =' + inttostr(sp)+')';

    if (sqlFilter<>'') then
      sqlFilter:= 'where '+sqlFilter;
    SQL[2]:= sqlFilter;
    Open;
  end;
end;

//���������� ������� � �������� �� ������ ������� �����������,
//��� ��� ��� ������� ��� ��������� ���������� �� ������ ������
procedure TfmAbitNabor.LoadDataFromQuery(Target: TADOQuery);
var sqlFilter: string;
begin
  //��������� ����������
  with Target do
  begin
    Close;

    SQL[1]:='where '+ '(NNyear='+IntToStr(year)+')';

    //������ �� �������� ������� ������������� ������ �� ������ �������
    sqlFilter:= '';

    //���������
    if FrameObject is TDBNodeFacRecObject then
      sqlFilter:='and (ik_fac =' + inttostr(fc)+')';

    //�������������
    if FrameObject is TDBNodeSpecRecObject then
      sqlFilter:='and (ik_spec_fac =' + inttostr(sp)+')';

    //if (sqlFilter<>'') then
      sqlFilter:= sqlFilter;
    SQL[2]:= sqlFilter;
    Open;
  end;
end;

procedure TfmAbitNabor.LoadEcxessExamsList;
begin
  TApplicationController.GetInstance.AddLogEntry('������. �������� ������ ������ ���������.');

  LoadDataFromFunction(DMAbiturientNabor.adoqExamsErrors);


  //��������� ������������ ��������
  if FrameObject is TDBNodeFacRecObject then
  begin
    dbgExamsErrors.Columns[1].Visible := false;
  end;

  if FrameObject is TDBNodeSpecRecObject then
  begin
    dbgExamsErrors.Columns[2].Visible := false;
    dbgExamsErrors.Columns[1].Visible := false;
  end;

end;

procedure TfmAbitNabor.LoadIndBalls;
begin
  TApplicationController.GetInstance.AddLogEntry('������. �������� �������������� ����������.');
  LoadDataFromFunction(DMAbiturientNabor.adoIndBall);

  //��������� ������������ ��������
  if FrameObject is TDBNodeFacRecObject then
  begin
    dbgIndBalls.Columns[1].Visible := false;
  end;

  if FrameObject is TDBNodeSpecRecObject then
  begin
    dbgIndBalls.Columns[3].Visible := false;
    dbgIndBalls.Columns[1].Visible := false;
  end;
end;

//��������� ������ �������
procedure TfmAbitNabor.LoadNaborList();
begin
  TApplicationController.GetInstance.AddLogEntry('������. �������� ������ �������.');
  LoadDataFromFunction(DMAbiturientNabor.adoqNaborList);
end;



//��������� ���������� �� �������
procedure TfmAbitNabor.LoadAbitList();
begin
  TApplicationController.GetInstance.AddLogEntry('������. �������� ������ ������������.');

  LoadDataFromFunction(DMAbiturientNabor.adospAbitGetPostupStatistika);

  //��������� ����������
  with DMAbiturientNabor.adospAbitGetPostupStatistika do
  begin
    //������� �������������� ��������� ��� �������������
    if FrameObject is TDBNodeSpecRecObject then
    begin
      Filter:='(realy_postup=1) and (ik_type_zach <> 3)';
      Filtered:=true;

      frmMain.StatusBar1.Panels[1].Text:=frmMain.StatusBar1.Panels[1].Text+
          '  �������������� ���������: ' +IntToStr(RecordCount);

      Filtered:=false;
      Filter:='';
    end;
  end;


  //��������� ������������ ��������
  if FrameObject is TDBNodeFacRecObject then
  begin
    dbgrdStatistika.Columns[3].Visible := false;
  end;

  if FrameObject is TDBNodeSpecRecObject then
  begin
    dbgrdStatistika.Columns[3].Visible := false;
    dbgrdStatistika.Columns[4].Visible := false;
  end;
end;

//��������� ���������� �� ������ ��� ������� (���a) @objectType:
//1 - ���� ���, 2 - ���������, 3 - �������������
//@objectID - ��� ���������������� �������
procedure TfmAbitNabor.LoadNaborStatistik;
var objectType, objectID: integer;
begin
    //������ ���� ����� (���)
  if FrameObject is TDBNodeRecruitObject then
  begin
    objectType:= 1;
    objectID:= year;
  end;

  //���������
  if FrameObject is TDBNodeFacRecObject then
  begin
    objectType:= 2;
    objectID:= fc;
  end;

  //�������������
  if FrameObject is TDBNodeSpecRecObject then
  begin
    objectType:= 3;
    objectID:= (FrameObject as TDBNodeSpecRecObject).NNRecord;
  end;

  //��������� ������
  TAbitNaborController.Instance.GetNaborStatistik(objectType, objectID, year);
end;


procedure TfmAbitNabor.LoadNetworkAbit;
begin
  TApplicationController.GetInstance.AddLogEntry('������. �������� ��������-������������.');
  LoadDataFromFunction(DMAbiturientNabor.adoNetworkAbit);

  //��������� ������������ ��������
  if FrameObject is TDBNodeFacRecObject then
  begin
    dbgNetwork.Columns[1].Visible := false;
  end;

  if FrameObject is TDBNodeSpecRecObject then
  begin
    dbgNetwork.Columns[3].Visible := false;
    dbgNetwork.Columns[1].Visible := false;
  end;
end;

procedure TfmAbitNabor.Load();
begin
  try
    //�������� ������ ������ ��� ����������� ����
    fac_spec.Show;

    LoadMainList; //������ �������� ������
  except
    on E:Exception do
    raise EApplicationException.Create('��������� ������ ��� �������� ������', E) ;
  end;

end;

//��������� ������
procedure TfmAbitNabor.WidthSet(sender:TStringGrid;size:real);
var i,j:integer;
    s:integer;
begin
 if size=8 then size:=7.4;
 if size=12 then size:=10;
 for i:=0 to sender.ColCount-1 do
  begin
   s:=0;
   for j:=0 to sender.RowCount-1 do
    if length(sender.Cells[i,j])>s then s:=length(sender.Cells[i,j]);
   sender.ColWidths[i]:=s*round(size);
  end;
end;

function TfmAbitNabor.DoApply():boolean;
begin
  if Modified then
  begin
  try
    DMAbiturientNabor.adoqNaborDiscs.UpdateBatch();
    Modified:= false;
  except

  end;
  end;
end;




procedure TfmAbitNabor.DoCancel;
begin
  if Modified then
  begin
    DMAbiturientNabor.adoqNaborDiscs.Close;
    DMAbiturientNabor.adoqNaborDiscs.Open;
    Modified:= false;
  end;
end;

procedure TfmAbitNabor.naborKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=VK_DELETE then
   actDelNaborExecute(Sender);
end;

procedure TfmAbitNabor.specChange(Sender: TObject);
begin
  inherited;
 //Filter();
end;

procedure TfmAbitNabor.ToolButton10Click(Sender: TObject);
begin
  inherited;
  if (MessageBox(Handle, '           ������� ������?','�� "����"',
          MB_YESNO) = IDYES) then
  begin
      //DMAbiturientNabor.adoqNaborDiscs.Edit;
      DMAbiturientNabor.adoqNaborDiscs.Delete;
      modified:=true;
  end;

end;

procedure TfmAbitNabor.naborTitleClick(Column: TColumnEh);
begin
  inherited;
  if (nabor.DataSource<>nil) and (nabor.DataSource.DataSet<>nil) then
    TADODataSet(nabor.DataSource.DataSet).Sort:=Column.Field.DisplayName;
end;

procedure TfmAbitNabor.facChange(Sender: TObject);
begin
  inherited;
 //Filter();
end;



procedure TfmAbitNabor.PageControl1Change(Sender: TObject);
begin
  inherited;
  //�������� ������ � ����������� � ������� ���������
  pnlSave.Visible:=false;

  if (PageControl1.ActivePage = naborpage) and
        (not DMAbiturientNabor.adoqNaborList.Active) then
  begin
    TApplicationController.GetInstance.AddLogEntry('������. ������� �� ������� ����� �������� � ������.');
    try
      LoadNaborList;  //������ ������ �������
    except
    on E:Exception do
      raise EApplicationException.Create('��������� ������ ��� �������� ������ ������',E);
    end;
  end;

  //��������� ����� ������ ������������
  if (PageControl1.ActivePage = statpage) and
        (not DMAbiturientNabor.adospAbitGetPostupStatistika.Active) then
  begin
    TApplicationController.GetInstance.AddLogEntry('����������. ������� �� ������� ����� ������ ������������');
    try
      LoadAbitList;  //������ ���������� �������
    except
    on E:Exception do
      raise EApplicationException.Create('��������� ������ ��� �������� ���������� ������',E);
    end;
  end;

  //��������� ���������� �� ����
  if (PageControl1.ActivePage = tsNaborStatistik) and
        (not DMAbiturientNabor.adospAbitNaborStatistik.Active) then
  begin
    TApplicationController.GetInstance.AddLogEntry('����������. ������� �� ������� ����������� �� ������');
    try
      LoadNaborStatistik;  //������ ������ �������
    except
    on E:Exception do
      raise EApplicationException.Create('��������� ������ ��� �������� ���������� �� ������',E);
    end;
  end;

  if (PageControl1.ActivePage = tsNaborDisc) then
  begin
    TApplicationController.GetInstance.AddLogEntry('����������. ������� �� ������� ������������� ��������');
    try
      LoadDataFromQuery(DMAbiturientNabor.adoqNaborDiscs);  //������ ������ �������
      //���������� ������ � ����������� � ������� ���������

      //��������� ������������ ��������
    if FrameObject is TDBNodeRecruitObject then
    begin
      dbgNaborDiscs.Options:=dbgNaborDiscs.Options - [DBGridEh.dgEditing];
      dbgNaborDiscs.Options:=dbgNaborDiscs.Options + [DBGridEh.dgRowSelect];
      DBNavigator1.VisibleButtons:= DBNavigator1.VisibleButtons-[nbInsert];
      pnlSave.Visible:=false;
      ToolButton10.Visible:=false;
    end;
    if FrameObject is TDBNodeFacRecObject then
    begin
      dbgNaborDiscs.Columns[0].Visible := false;
      dbgNaborDiscs.Options:=dbgNaborDiscs.Options - [DBGridEh.dgEditing];
      dbgNaborDiscs.Options:=dbgNaborDiscs.Options + [DBGridEh.dgRowSelect];
      DBNavigator1.VisibleButtons:= DBNavigator1.VisibleButtons-[nbInsert];
      pnlSave.Visible:=false;
    end;

    if FrameObject is TDBNodeSpecRecObject then
    begin
      dbgNaborDiscs.Columns[0].Visible := false;
      dbgNaborDiscs.Columns[1].Visible := false;
      dbgNaborDiscs.Options:=dbgNaborDiscs.Options - [DBGridEh.dgRowSelect];
      dbgNaborDiscs.Options:=dbgNaborDiscs.Options + [DBGridEh.dgEditing];
      pnlSave.Visible:=true;
    end;
    ToolButton10.Visible:=pnlSave.Visible;
    except
    on E:Exception do
      raise EApplicationException.Create('��������� ������ ��� �������� ������������� ���������',E);
    end;
  end;

  //��������� ������ ��������
  if (PageControl1.ActivePage = tsExamsErrors) and
        (not DMAbiturientNabor.adoqExamsErrors.Active) then
  begin
    TApplicationController.GetInstance.AddLogEntry('����������. ������� �� ������� ������ ��������');
    try
      LoadEcxessExamsList;  //������ ������ �������
    except
    on E:Exception do
      raise EApplicationException.Create('��������� ������ ��� �������� ������ ������ ���������',E);
    end;
  end;

  //��������� �������������� ����������
  if (PageControl1.ActivePage = IndBalls) {and
        (not DMAbiturientNabor.adoIndBall.Active)} then
  begin
    TApplicationController.GetInstance.AddLogEntry('����������. ������� �� ������� �������������� ����������');
    try
      LoadIndBalls;
    except
      on E:Exception do
      raise EApplicationException.Create('��������� ������ ��� �������� �������������� ����������',E);
    end;
  end;

  //��������� ��������-������������
  if (PageControl1.ActivePage = Network) {and
        (not DMAbiturientNabor.adoIndBall.Active)} then
  begin
    TApplicationController.GetInstance.AddLogEntry('����������. ������� �� ������� ��������-�����������');
    try
      LoadNetworkAbit;
    except
      on E:Exception do
      raise EApplicationException.Create('��������� ������ ��� �������� ������������, �������� ��������� �� ����',E);
    end;
  end;

end;

procedure TfmAbitNabor.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  if (PageControl1.ActivePage = tsNaborDisc) and Modified then
  Begin
    if (MessageBox(Handle, '��������� ��������� �� ������� ������������� ��������?','�� "����"',
          MB_YESNO) = IDYES) then
      actSaveMinBallsExecute(Sender)
    else
      actCancelMinBallsExecute(Sender);
  End;

end;

procedure TfmAbitNabor.RefreshDataSet(dataSet: TADODataSet);
var sort: string;
begin
  sort:= dataSet.Sort;
  dataSet.Close;
  dataSet.Open;
  dataSet.Sort:= sort;
end;

//������ (��������) ��� ������
function TfmAbitNabor.GetikFac: Integer;
begin
  result:= 0;

  //������ ���������
  if FrameObject is TDBNodeFacRecObject then
    result:= TDBNodeFacRecObject(FrameObject).ik;

  //�������������
  if FrameObject is TDBNodeSpecRecObject then
    result:= TDBNodeFacRecObject(TDBNodeSpecRecObject(FrameObject).Node.Parent.Data).ik;

end;

function TfmAbitNabor.GetikSpecfac: Integer;
begin
  result:= 0;

  //�������������
  if FrameObject is TDBNodeSpecRecObject then
    result:=TDBNodeSpecRecObject(FrameObject).ik;

end;

function TfmAbitNabor.GetYear: integer;
begin
  result:= -1;
  //������ ���� �����
  if FrameObject is TDBNodeRecruitObject then
    result:= TDBNodeRecruitObject(FrameObject).ik;

  //������ ���������
  if FrameObject is TDBNodeFacRecObject then
    result:= TDBNodeRecruitObject(TDBNodeFacRecObject(FrameObject).Node.Parent.Data).ik;

  //�������������
  if FrameObject is TDBNodeSpecRecObject then
    result:= TDBNodeRecruitObject(TDBNodeSpecRecObject(FrameObject).Node.Parent.Parent.Data).ik;

end;

procedure TfmAbitNabor.actAddNaborExecute(Sender: TObject);
begin
  TApplicationController.GetInstance.AddLogEntry('������. ���������� ������.');

  frmNewNabor:=TfrmNewNabor.Create(self);
  try
    Abit_add_nabor_dialog.type_dialog:=1;
    frmNewNabor.year:= year;

    //���� ����� ���������, �� ��� �� ����� ��������
    if fc<>0 then
			frmNewNabor.Setikfac(fc)
    else frmNewNabor.dbcmbxFac.Enabled:=true;

    frmNewNabor.ShowModal;

    {if DMAbiturientNabor.adoqNaborList.Active then
    begin
      DMAbiturientNabor.adoqNaborList.Close;
      DMAbiturientNabor.adoqNaborList.Open;
    end; }
    RefreshDataSet(TADODataSet(DMAbiturientNabor.adoqNaborList));

  finally
    frmNewNabor.Free;
  end;
end;

procedure TfmAbitNabor.actEditNaborExecute(Sender: TObject);
begin
  inherited;
  TApplicationController.GetInstance.AddLogEntry('������. �������������� ������ '+nabor.Fields[0].AsString + ', '+ nabor.Fields[1].AsString);

  frmNewNabor:=TfrmNewNabor.Create(self);
  try
	  Abit_add_nabor_dialog.type_dialog:=2;
	  frmNewNabor.NNrecord:= nabor.DataSource.DataSet.FieldByName('NNrecord').AsInteger;
	  frmNewNabor.year:= nabor.DataSource.DataSet.FieldByName('nnyear').AsInteger;
	  frmNewNabor.mestCKP.Value:= nabor.DataSource.DataSet.FieldByName('MestCKP').AsInteger;
	  frmNewNabor.mestbudjet.Value:= nabor.DataSource.DataSet.FieldByName('MestBudjet').AsInteger;
	  frmNewNabor.MestLgot.Value:= nabor.DataSource.DataSet.FieldByName('MestLgot').AsInteger;
	  frmNewNabor.dbcmbxFac.Enabled:=false;
	  frmNewNabor.Spec_Fac.Enabled:=false;
    frmNewNabor.dbcmbxPrifile.Enabled:=false;
    frmNewNabor.ikfac:= nabor.DataSource.DataSet.FieldByName('ik_fac').AsInteger;
	  frmNewNabor.ikSpecfac:= DMAbiturientNabor.adoqNaborList.FieldByName('ik_spec_fac').AsInteger;
    frmNewNabor.ikProfile:= DMAbiturientNabor.adoqNaborList.FieldByName('ik_profile').AsInteger;

    //frmNewNabor.sets;

    frmNewNabor.dbcmbxFac.KeyValue:= nabor.DataSource.DataSet.FieldByName('ik_fac').AsInteger;
	  frmNewNabor.Spec_Fac.KeyValue:= DMAbiturientNabor.adoqNaborList.FieldByName('ik_spec_fac').AsInteger;
    frmNewNabor.dbcmbxPrifile.KeyValue:= DMAbiturientNabor.adoqNaborList.FieldByName('ik_profile').AsInteger;
	  frmNewNabor.cbRussian.Checked:= nabor.DataSource.DataSet.FieldByName('lRussian').AsBoolean;
    frmNewNabor.IsModified:= false;
	  frmNewNabor.ShowModal;

    {if DMAbiturientNabor.adoqNaborList.Active then
    begin
      DMAbiturientNabor.adoqNaborList.Close;
      DMAbiturientNabor.adoqNaborList.Open;
    end;    }
    RefreshDataSet(TADODataSet(DMAbiturientNabor.adoqNaborList));
  finally
    frmNewNabor.Free;
  end;
end;

pprocedure TfmAbitNabor.actExportPhotosExecute(Sender: TObject);
begin
  inherited;

end;

rocedure TfmAbitNabor.actImportNaborExecute(Sender: TObject);
begin
  inherited;
    //�������������� �������� ������ ��� ������ ������ �����
  if not (FrameObject is TDBNodeRecruitObject)  then
    exit;

  if (MessageBox(Handle, '��� ������� �������� ������� �� ���������� "��������" ����� ������� ��� ������, ������� �������� ������� �����. ��� ��� ����� ������� �������� ������ �� �������� � ������. ���������� ���������� �������?','�� "����"',
          MB_YESNO) = IDYES) then
  begin
    TAbitNaborController.Instance.ImportNabor(year);

    if DMAbiturientNabor.adoqNaborList.Active then
    begin
      DMAbiturientNabor.adoqNaborList.Close;
      DMAbiturientNabor.adoqNaborList.Open;
    end;
  end;

end;

procedure TfmAbitNabor.actImportNaborUpdate(Sender: TObject);
begin
  inherited;
  //�������������� �������� ������ ��� ������ �����
  actImportNabor.Enabled:= (FrameObject is TDBNodeRecruitObject) and
    (nabor.DataSource.DataSet.RecordCount<1);

end;

procedure TfmAbitNabor.actCancelMinBallsExecute(Sender: TObject);
begin
  inherited;
  DoCancel;
end;

procedure TfmAbitNabor.actDelNaborExecute(Sender: TObject);
begin
  if (MessageBox(Handle, '           ������� �����?','�� "����"',
          MB_YESNO) = IDYES) then
  begin
    TApplicationController.GetInstance.AddLogEntry('������. �������� ������ '+nabor.Fields[0].AsString + ', '+ nabor.Fields[1].AsString);

    TAbitNaborController.Instance.DelNabor(nabor.DataSource.DataSet.FieldByName('NNrecord').AsInteger);

    RefreshDataSet(TADODataSet(DMAbiturientNabor.adoqNaborList));
  end;


end;

procedure TfmAbitNabor.actDelNaborUpdate(Sender: TObject);
begin
  //������� ����� �����, ������ ���� � ���� ��� ������������� ������������
  if (nabor.DataSource.DataSet.Active) and (nabor.RowCount>1) then
    actDelNabor.Enabled:= (nabor.DataSource.DataSet.FieldByName('factBudjet').AsInteger=0) and
        (nabor.DataSource.DataSet.FieldByName('factCKP').AsInteger=0) and
        (nabor.DataSource.DataSet.FieldByName('factKontrakt').AsInteger=0)
  else
    actDelNabor.Enabled:= false;

end;

procedure TfmAbitNabor.dbgrdStatistikaTitleClick(Column: TColumnEh);
begin
  inherited;
  if (dbgrdStatistika.DataSource<>nil) and (dbgrdStatistika.DataSource.DataSet<>nil) then
    TADODataSet(dbgrdStatistika.DataSource.DataSet).Sort:=Column.Field.DisplayName;

  //DMAbiturientNabor.adospAbitGetPostupStatistika.Sort:='['+Column.Field.FieldName+']';
end;

procedure TfmAbitNabor.dbgNaborDiscsColumns2DropDownBoxDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
  Modified:= true;
  DMAbiturientNabor.adoqNaborDiscs.Edit;
  DMAbiturientNabor.adoqNaborDiscsNNrecord.Value:=(FrameObject as TDBNodeSpecRecObject).NNRecord;
end;

procedure TfmAbitNabor.dbgNaborDiscsColumns2UpdateData(Sender: TObject;
  var Text: string; var Value: Variant; var UseText, Handled: Boolean);
begin
  inherited;
 { if (Value>100 or Value<0) then
    try
      //��������� ������ ������ ������
      Text:= CheckOcenka(Value);
      Value:= String(Value)[1]+;
    except
      Value:= -1;
      Text:= '';
    end;  }

  Modified:= true;
end;

procedure TfmAbitNabor.dbgNaborDiscsTitleClick(Column: TColumnEh);
begin
  inherited;
  if (Column.Field.FieldName<>'DiscName') then
    TADODataSet(dbgNaborDiscs.DataSource.DataSet).Sort:=Column.Field.FieldName;

end;

procedure TfmAbitNabor.dbgNaborStatistikTitleClick(Column: TColumnEh);
begin
  inherited;
  if (dbgNaborStatistik.DataSource<>nil) and (dbgNaborStatistik.DataSource.DataSet<>nil) then
    TADODataSet(dbgNaborStatistik.DataSource.DataSet).Sort:=Column.Field.DisplayName;

end;

procedure TfmAbitNabor.dbgrdMainTitleClick(Column: TColumnEh);
begin
  inherited;
  if FrameObject is TDBNodeSpecRecObject then
    (FrameObject as TDBNodeSpecRecObject).AdoDataset.Sort:='['+Column.Field.FieldName+']';
end;


procedure TfmAbitNabor.actPrintAbitExamsExecute(Sender: TObject);
var
  Report:TReportBase;
begin
  inherited;
  TApplicationController.GetInstance.AddLogEntry('������� � Excel ������ �� ������������� ���������.');
  TApplicationController.GetInstance.AddLogEntry('�������� ������.');
  LoadDataFromQuery(DMAbiturientNabor.adoqAbitExams);
    Report := TReportBase.CreateReport(TAbitExamsReport);
    Report.FreeOnComplete := true;
    //Report.OnExecuteError := ExecuteError;

    Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\AbitExams.XLT';
    TWaitingController.GetInstance.Process(Report);
end;

procedure TfmAbitNabor.actPrintDinamicaExecute(Sender: TObject);
var
  Report:TReportBase;
begin
    Report := TReportBase.CreateReport(TAbitDinamicaReport);
    Report.FreeOnComplete := true;
    TAbitDinamicaReport(Report).NNyear:= year;
    TAbitDinamicaReport(Report).ikFac:= fc;
    TAbitDinamicaReport(Report).ikSpecFac:= sp;
    TAbitDinamicaReport(Report).Date:= Today;
    //Report.OnExecuteError := ExecuteError;
    Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\AbitDinamica.XLT';
    TWaitingController.GetInstance.Process(Report);
end;

procedure TfmAbitNabor.actPrintExamStatisticExecute(Sender: TObject);
begin
  inherited;
  TApplicationController.GetInstance.AddLogEntry('������ ������ ���������� �� ������������� ���������.');
  TAbitOtchetsController.Instance.ExamsStatToExcel(year,fc,sp,false);
end;

procedure TfmAbitNabor.actPrintNaborExecute(Sender: TObject);
begin
  if (nabor.DataSource<>nil) and (nabor.DataSource.DataSet<>nil) then
    TAbitOtchetsController.Instance.ExportNaborWord(nabor.DataSource.DataSet);
end;


procedure TfmAbitNabor.actPrintProtocolExecute(Sender: TObject);
begin
  inherited;

  TAbitOtchetsController.Instance.ExportProtokolToExcel(GetYear);
end;

procedure TfmAbitNabor.actPrintStatExecute(Sender: TObject);
begin
  TAbitOtchetsController.Instance.StatToExcel;
end;

procedure TfmAbitNabor.actSaveMinBallsExecute(Sender: TObject);
begin
  inherited;
  DoApply;
end;

procedure TfmAbitNabor.actSaveMinBallsUpdate(Sender: TObject);
begin
  inherited;
  if FrameObject is TDBNodeSpecRecObject then
    (Sender as TAction).Enabled:= Modified
  else
    (Sender as TAction).Enabled:= false;
end;

procedure TfmAbitNabor.actStatToExcelExecute(Sender: TObject);
var
  Report:TExcelReportDBGrid;
begin
    Report := TReportBase.CreateReport(TExcelReportDBGrid) as TExcelReportDBGrid;
    Report.FreeOnComplete := true;
    //Report.OnExecuteError := ExecuteError;
    Report.DataSet:= DMAbiturientNabor.adospAbitNaborStatistik;
    Report.DBGrid:= dbgNaborStatistik;
    //Report.FirstRowNum:=5;
    //Report.FirstColNum:=5;
    //Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\AbitDinamica.XLT';
    TWaitingController.GetInstance.Process(Report);

end;

procedure TfmAbitNabor.actExportPhotosExecute(Sender: TObject);
begin
  TPhotosExportController.Instance.Export4Bank(nabor.DataSource.DataSet);
end;

end.
