unit ABIT_zachislenie_frame;
   {#Author tanyav@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseFrame, StdCtrls, Grids, DBCtrlsEh, Mask, DBGridEh,
  ComCtrls, Buttons, ToolWin, DBCtrls, ExtCtrls, ImgList, DB, ActnList,
  ADODB,ComObj, DBLookupEh, Menus, OleServer, ExcelXP, GridsEh, ApplicationController,
  ExceptionBase, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  System.Actions, DBAxisGridsEh;

type
  TfmZach = class(TfmBase)
    ImageList1: TImageList;
    ImageList2: TImageList;
    PageControl1: TPageControl;
    spisokAll: TTabSheet;
    prikazpage: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    s_ik: TComboBox;
    f_ik: TComboBox;
    predvpage: TTabSheet;
    ToolBar2: TToolBar;
    Label1: TLabel;
    ToolButton2: TToolButton;
    prikaz: TDBGridEh;
    sost: TComboBox;
    Realy: TComboBox;
    nn_abit: TComboBox;
    Spisok: TDBComboBoxEh;
    nnrecord: TDBText;
    dbgrdMain: TDBGridEh;
    ToolButton5: TToolButton;
    dbgAbitsForZachisl: TDBGridEh;
    actList: TActionList;
    actZachislAbit: TAction;
    actExpPrikSpec: TAction;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    actCancelZachisl: TAction;
    ToolButton8: TToolButton;
    adoqTypeKatZach: TADOQuery;
    cbKatZachisl: TDBLookupComboboxEh;
    actExpPrikGrup: TAction;
    ToolButton10: TToolButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    dsList: TDataSource;
    PopupMenu2: TPopupMenu;
    actRezervAbit: TAction;
    actExileAbit: TAction;
    N4: TMenuItem;
    actRezervAbit1: TMenuItem;
    actExileAbit1: TMenuItem;
    tsBalls: TTabSheet;
    dbgBalls: TDBGridEh;
    bbProceed: TBitBtn;
    actPredvSpiskiPologOcenki: TAction;
    actAbitReturnExecute: TAction;
    actAbitSpisokToExcel: TAction;
    actRefreshAbitList: TAction;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ppmPredvOtchet: TPopupMenu;
    ToolButton16: TToolButton;
    N5: TMenuItem;
    Excel1: TMenuItem;
    ToolButton17: TToolButton;
    ppmPrikazOtchet: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    ToolButton1: TToolButton;
    actProtokolToExcel: TAction;
    ToolButton4: TToolButton;
    ppmPrikazExcelOtchet: TPopupMenu;
    MenuItem5: TMenuItem;
    Excel2: TMenuItem;
    actAddAllProhBalls: TAction;
    ToolButton13: TToolButton;
    actAutomaticZachisl: TAction;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    actPredvSpisokZachisl: TAction;
    ToolButton20: TToolButton;
    actAvtomZachisl: TAction;
    N6: TMenuItem;
    ToolBar5: TToolBar;
    DBNavigator1: TDBNavigator;
    ToolButton9: TToolButton;
    ToolButton21: TToolButton;
    ToolButton22: TToolButton;
    actSaveMinBalls: TAction;
    actCancelMinBalls: TAction;
    actPrintExamStatistic: TAction;
    N7: TMenuItem;
    Panel2: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    Panel5: TPanel;
    Label4: TLabel;
    Panel6: TPanel;
    Label5: TLabel;
    ToolBar3: TToolBar;
    btnGivezachNumber: TToolButton;
    actGiveZachNumber: TAction;
    Panel9: TPanel;
    Label28: TLabel;
    ProgressBar1: TProgressBar;
    ToolButton23: TToolButton;
    actPrikazAppoint: TAction;
    //загружает списки абитуриентов
    procedure GetSpisokOfAbits();
    procedure prikazTitleClick(Column: TColumnEh);
    procedure PageControl1Change(Sender: TObject);
    procedure dbgAbitsForZachislTitleClick(Column: TColumnEh);


    procedure actZachislAbitExecute(Sender: TObject);
    procedure actExpPrikSpecUpdate(Sender: TObject);
//actExpPrikSpecExecute - Экспорт в Word общего приказа на зачисление
    procedure actExpPrikSpecExecute(Sender: TObject);
    procedure actCancelZachislExecute(Sender: TObject);
    procedure cbKatZachislChange(Sender: TObject);
//actExpPrikGrupExecute - Экспорт в Word общего приказа на зачисление по группам
    procedure actExpPrikGrupExecute(Sender: TObject);
    procedure prikazDblClick(Sender: TObject);
    procedure actRezervAbitExecute(Sender: TObject);
    procedure actExileAbitExecute(Sender: TObject);
    procedure actZachislAbitUpdate(Sender: TObject);
    procedure dbgAbitsForZachislDblClick(Sender: TObject);
    procedure actPredvSpiskiPologOcenkiExecute(Sender: TObject);
    procedure dbgBallsTitleClick(Column: TColumnEh);
    procedure actAbitReturnExecuteExecute(Sender: TObject);
    procedure actCancelZachislUpdate(Sender: TObject);
    procedure actRezervAbitUpdate(Sender: TObject);
    procedure actExileAbitUpdate(Sender: TObject);
    procedure actPredvSpiskiPologOcenkiUpdate(Sender: TObject);
    procedure dbgAbitsForZachislDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumnEh;
      State: TGridDrawState);
    procedure actAbitSpisokToExcelExecute(Sender: TObject);
    procedure actAbitSpisokToExcelUpdate(Sender: TObject);
    procedure actRefreshAbitListExecute(Sender: TObject);
    procedure actAbitReturnExecuteUpdate(Sender: TObject);
    procedure actProtokolToExcelExecute(Sender: TObject);
    procedure actAddAllProhBallsExecute(Sender: TObject);
    procedure actAddAllProhBallsUpdate(Sender: TObject);
    procedure actAutomaticZachislExecute(Sender: TObject);
    procedure dbgBallsColumns3UpdateData(Sender: TObject; var Text: string;
      var Value: Variant; var UseText, Handled: Boolean);
    procedure actPredvSpisokZachislExecute(Sender: TObject);
    procedure ExecuteError(Sender: TObject; E: Exception);
    procedure PageControl1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure actSaveMinBallsExecute(Sender: TObject);
    procedure actCancelMinBallsExecute(Sender: TObject);
    procedure actSaveMinBallsUpdate(Sender: TObject);
    procedure actPrintExamStatisticExecute(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure actGiveZachNumberExecute(Sender: TObject);
    procedure actPrikazAppointExecute(Sender: TObject);

    protected
     procedure DoRefreshFrame();override;
     function DoApply: Boolean;override;
     procedure DoCancel;override;

  private
    { Private declarations }
    //bCalculated:Boolean;
    function GetikFac: Integer;
    function GetikSpecfac: Integer;
    function GetYear: integer;

    procedure SetColor(canvas:TCanvas; const Rect: TRect; Field: TField; RowColor,TextColor:TColor);
  public
    { Public declarations }

    // Получает год набора
    property year:Integer read GetYear;
    // Получает код факультета
    property idFac:Integer read GetikFac;
    // Получает код специальности факультета
    property idSpecfac:Integer read GetikSpecfac;

  end;
 // procedure WMVScroll(var Msg: TWMVScroll); message WM_VSCROLL;

var
  fmZach: TfmZach;
  List:TList;
  Ar:integer=1;
  Ac:Integer=0;
  FromLeft:integer=0;
  ZCPBall, BacalavrBall, BugetBall: integer;  //проходные баллы ЦКП, бакалавры, бюджет
  Postup:boolean;
  year:integer;
implementation
uses
 AbiturientRaspisanieProcs, AbiturientBaseProcs, AbiturientFacade,
  ABIT_add_rasp_dialog, ABIT_add_raspkab_dialog, AbiturientExamProcs,
  AbiturientListsBeforeExamProcs, AbiturientBeforeZachislenieListProcs,
  AbiturientOrderProcs,DBTVZachobj,DBTVFacZachobj,DBTVSpecZachobj, uDM,
  uJoinGroup, uDMPrikaz, uDMAbiturientZachisl,uMain,
  uAbitZachislenieController, GeneralController, uAbitOtchetsController,
  AbitPredvSpisokZachisl, ReportsBase, uWaitingController, CommonIntf, CommonIntfImpl;

{$R *.dfm}

//задает (получает) код факультета
function TfmZach.GetikFac: Integer;
begin
  result:= 0;

  //ВЫБРАН факультет
  if FrameObject is TDBNodeFacZachObject then
    result:= TDBNodeFacZachObject(FrameObject).ik;

  //специальность
  if FrameObject is TDBNodeSpecZachObject then
    result:= TDBNodeFacZachObject(TDBNodeSpecZachObject(FrameObject).Node.Parent.Data).ik;

end;

//задает (получает) код специальности
function TfmZach.GetikSpecfac: Integer;
begin
  result:= 0;

  //специальность
  if FrameObject is TDBNodeSpecZachObject then
    result:= TDBNodeSpecZachObject(FrameObject).ik;

end;

//задает (получает) год поступления
function TfmZach.GetYear: integer;
begin
  result:= -1;
  //ВЫБРАН весь год (узел Зачисление)
  if FrameObject is TDBNodeZachObject then
    result:= TDBNodeZachObject(FrameObject).ik;

  //ВЫБРАН факультет
  if FrameObject is TDBNodeFacZachObject then
    result:= TDBNodeZachObject(TDBNodeFacZachObject(FrameObject).Node.Parent.Data).ik;

  //специальность
  if FrameObject is TDBNodeSpecZachObject then
    result:= TDBNodeZachObject(TDBNodeSpecZachObject(FrameObject).Node.Parent.Parent.Data).ik;

end;

procedure TfmZach.DoRefreshFrame;
var Log: ILogger;
begin
  try
     Log := TNullLogger.GetInstance;   //TMemoLogger.GetInstance;  //

		 Modified:=false;

		 //загружаем типы категорий поступления
		 //в фильтр предварительных списков
		 TGeneralController.Instance.InitializeLockupCB(@cbKatZachisl, 'ik_type_kat', 'CType_kat');
		 TAbitZachislenieController.Instance.GetTypeKatZach(@cbKatZachisl.ListSource.DataSet);

     Log.LogMessage('GetTypeKatZach');

		 dbgAbitsForZachisl.DataSource:=nil;
		 self.DataSet := nil;

     Log.LogMessage('nil');

		 if FrameObject is TDBNodeZachObject then
		 begin
			PageControl1.Pages[0].Caption := 'Факультеты';
			dbgrdMain.DataSource:= TDataSource.Create(nil);
			DataSet := (FrameObject as TDBNodeZachObject).Dataset;
			dbgrdMain.DataSource.DataSet:=dataset;
			DataSet.Fields[0].Visible := false;
			DataSet.Fields[1].DisplayLabel:= 'Название';
      DataSet.Fields[1].DisplayWidth := 400;
			DataSet.Fields[2].DisplayLabel := 'Короткое название';
			DataSet.Fields[3].Visible := false;
      DataSet.Fields[4].DisplayLabel := 'Зач. книжки (Начало)';
      DataSet.Fields[5].DisplayLabel := 'Зач. книжки (Конец)';
      DataSet.Fields[4].ReadOnly := false;
      DataSet.Fields[5].ReadOnly := false;

     // dbgrdMain.Columns[0].Width := 400;
      dbgrdMain.Columns[1].Width := 100;
      dbgrdMain.Columns[2].Width := 70;
      dbgrdMain.Columns[3].Width := 70;

      Log.LogMessage('DataSet.Fields');

      dbgAbitsForZachisl.FieldColumns['cshort_name_fac'].Visible:= true;
      dbgAbitsForZachisl.FieldColumns['cshort_name_fac'].Visible:= true;
      Log.LogMessage('dbgAbitsForZachisl');
		 end;

		 //если факультет
		 if FrameObject is TDBNodeFacZachObject then
		 begin
			PageControl1.Pages[0].Caption := 'Специальности';
			dbgrdMain.DataSource:= TDataSource.Create(nil);
			DataSet := (FrameObject as TDBNodeFacZachObject).AdoDataset;
			dbgrdMain.DataSource.DataSet:=dataset;
  {dbo.ABIT_Diapazon_spec_fac.ik_spec_fac, dbo.Relation_spec_fac.ik_fac, dbo.ABIT_Diapazon_spec_fac.NNyear,
  dbo.Relation_spec_fac.YearObuch, dbo.Relation_spec_fac.ik_spec, dbo.Spec_stud.Cname_spec, dbo.Spec_stud.Cshort_spec,
  dbo.ABIT_Diapazon_spec_fac.NNrecord, dbo.Fac.Cshort_name_fac, dbo.Spec_stud.Cname_spec + ' (' + dbo.Fac.Cshort_name_fac + ')' AS Name,
  dbo.Direction.cName_direction, Sh_spec   }

      with dbgrdMain.DataSource.DataSet do
      begin
        FieldByName('ik_spec_fac').Visible:= false;
        FieldByName('ik_fac').Visible:= false;
        FieldByName('NNyear').Visible:= false;
        FieldByName('YearObuch').Visible:= false;
        FieldByName('ik_spec').Visible:= false;
        FieldByName('NNrecord').Visible:= false;
        FieldByName('Cshort_name_fac').Visible:= false;
        FieldByName('Name').Visible:= false;
        dbgrdMain.FieldColumns['Cname_spec'].Visible:= true;
        dbgrdMain.FieldColumns['Cname_spec'].Title.Caption:='Название';
        dbgrdMain.FieldColumns['Cshort_spec'].Visible:= true;
        dbgrdMain.FieldColumns['Cshort_spec'].Title.Caption:='Короткое название';
        dbgrdMain.FieldColumns['cName_direction'].Visible:= true;
        dbgrdMain.FieldColumns['cName_direction'].Title.Caption:='Направление обучения';
        dbgrdMain.FieldColumns['Sh_spec'].Visible:= true;
        dbgrdMain.FieldColumns['Sh_spec'].Title.Caption:='Номер';
        dbgrdMain.FieldColumns['Ik_form_ed'].Visible:= false;
        dbgrdMain.FieldColumns['CName_form_ed'].Visible:= true;
        dbgrdMain.FieldColumns['CName_form_ed'].Title.Caption:='Форма обучения';
      end;
			{dbgrdMain.Columns[0].Visible := false;
			dbgrdMain.Columns[1].Visible := false;
			dbgrdMain.Columns[2].Visible := false;
			dbgrdMain.Columns[3].Visible := false;
			dbgrdMain.Columns[4].Title.Caption := 'Номер';
			dbgrdMain.Columns[5].Title.Caption := 'Название';
			dbgrdMain.Columns[6].Title.Caption := 'Короткое название';
			dbgrdMain.Columns[7].Visible := false;
			dbgrdMain.Columns[8].Visible := false;
			dbgrdMain.Columns[9].Visible := false;
      dbgrdMain.Columns[10].Title.Caption := 'Направление обучения'; }

      dbgAbitsForZachisl.FieldColumns['cshort_name_fac'].Visible:= false;
      dbgAbitsForZachisl.FieldColumns['Cshort_spec'].Visible:= true;
		 end;

     Log.LogMessage('Closer to Spec');
		 //если специальность
		 if FrameObject is TDBNodeSpecZachObject then
		 begin
		  spisokAll.TabVisible:=false;
		  pnlSave.Visible:=true;
		  predvpage.Show;
      Log.LogMessage('predvpage.Show');
		  PageControl1Change(nil);
      Log.LogMessage('PageControl1Change');

      dbgAbitsForZachisl.FieldColumns['cshort_name_fac'].Visible:= false;
      dbgAbitsForZachisl.FieldColumns['Cshort_spec'].Visible:= false;
     Log.LogMessage('dbgAbitsForZachisl');
		 end
		 else
		   spisokall.Show;
		 cbKatZachisl.Value:=null;

      Log.LogMessage('Ready To Prikaz');
     prikaz.FieldColumns['cshort_name_fac'].Visible:=
        dbgAbitsForZachisl.FieldColumns['cshort_name_fac'].Visible;
     prikaz.FieldColumns['Cshort_spec'].Visible:=
        dbgAbitsForZachisl.FieldColumns['Cshort_spec'].Visible;

     Log.LogMessage('Ready To dbgBalls');
     dbgBalls.FieldColumns['Cshort_name_fac'].Visible:=
        dbgAbitsForZachisl.FieldColumns['cshort_name_fac'].Visible;
     dbgBalls.FieldColumns['Cname_spec'].Visible:=
        dbgAbitsForZachisl.FieldColumns['Cshort_spec'].Visible;

  except
    MessageBox(Handle, 'Произошла ошибка при загрузке данных.','ИС "УГТУ"',
          MB_OK) ;
  end;
end;

 //загружает списки абитуриентов
procedure TfmZach.GetSpisokOfAbits();
begin
   if (dbgAbitsForZachisl.DataSource<>nil) and
      (Prikaz.DataSource<>nil) then
      exit;

//создаем DataSource и DataSet (общие для предварительного
//списка и для списка на приказ)
   dbgAbitsForZachisl.DataSource:= TDataSource.Create(nil);
   prikaz.DataSource:= dbgAbitsForZachisl.DataSource;

   TApplicationController.GetInstance.AddLogEntry('Загрузка данных в список абитуриентов на зачисление.');

   //загружаем данные в DataSet
      //узел набор
   prikaz.DataSource.DataSet:=
         TAbitZachislenieController.Instance.DataSetInstance(year, idFac, idSpecFac);
end;



procedure TfmZach.prikazTitleClick(Column: TColumnEh);
begin
   TADODataSet(prikaz.DataSource.DataSet).Sort:=
      Column.Field.DisplayName;
end;

procedure TfmZach.PageControl1Change(Sender: TObject);
//var filter: string;
var Log: ILogger;
begin

 Log := TNullLogger.GetInstance;   //TMemoLogger.GetInstance;  //
 pnlSave.Visible:=false;
 //bbUndo.Visible:=false;
 //bbProceed.Visible:=false;

 Log.LogMessage('spisokAll.Visible');
 if spisokAll.Visible=true then
 begin
   TApplicationController.GetInstance.AddLogEntry('Переход на вкладку Список факультетов-специальностей.');
 end;


 //вкладка проходные баллы
 if tsBalls.Visible=true then
 begin
    Log.LogMessage('tsBalls.Visible=true');
    TApplicationController.GetInstance.AddLogEntry('Переход на вкладку Проходные баллы');

    Modified:=false;

 //если DataSource еще не создан, создаем
   if dbgBalls.DataSource=nil then
   begin
      Log.LogMessage('dbgBalls.DataSource=nil');
      dbgBalls.DataSource:= TDataSource.Create(nil);
      dbgBalls.DataSource.DataSet:= TADODataSet.Create(nil);
      TADODataSet(dbgBalls.DataSource.DataSet).LockType:=ltBatchOptimistic;
      //и загружаем данные в DataSet

      Log.LogMessage('Ready to GetProhBalls');
      TAbitZachislenieController.Instance.GetProhBalls(@dbgBalls.DataSource.DataSet,
         year, idFac, idSpecFac);
     Log.LogMessage('Did GetProhBalls');
      DBNavigator1.DataSource:= dbgBalls.DataSource;
      
   end;
   //обновляем данные в DataSource
   Log.LogMessage('обновляем данные');
   dbgBalls.DataSource.DataSet.Close;
   dbgBalls.DataSource.DataSet.Open;
   Log.LogMessage('Open');
   dbgBalls.DataSource.DataSet.FieldByName('MinBall').Alignment:= taLeftJustify;

   Log.LogMessage('ready to Sort');
   TADODataSet(dbgBalls.DataSource.DataSet).Sort:=
      'Cshort_name_fac, Cname_spec, Cname_kat_zach, сname_disc';

   bbSave.Visible:=false;
   bbUndo.Visible:=true;
   bbProceed.Visible:=true;
   pnlSave.Visible:=true;
end;

   Log.LogMessage('not balls');
//на вкладке предварительные списки
   if predvpage.Visible=true then
   begin //если еще не загружен, загружаем список абитуриентов
      TApplicationController.GetInstance.AddLogEntry('Переход на вкладку Предварительные списки на зачисление.');
         GetSpisokOfAbits;

//фильтруем список, чтобы отражались только незачисленные абитуриенты
      TAbitZachislenieController.Instance.SetAbitSpisokFilter(1,cbKatZachisl.Value);

      pnlSave.Visible:=true;
      bbSave.Visible:=true;
      bbUndo.Visible:=false;
      bbProceed.Visible:=false;

   end;

   //на вкладке приказ
   if prikazpage.Visible=true then
   begin //если еще не загружен, загружаем список абитуриентов
      TApplicationController.GetInstance.AddLogEntry('Переход на вкладку Приказ на зачисление');

      GetSpisokOfAbits;
//фильтруем спиcок, чтобы отражались только зачисленные абитуриенты
      TAbitZachislenieController.Instance.SetAbitSpisokFilter(2,NULL);

      //prikaz.Columns.Items[0].Width:=250;
      prikazpage.Show;
   end;



end;

procedure TfmZach.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;

  if (PageControl1.ActivePage = tsBalls) and Modified then
  Begin
    if (MessageBox(Handle, 'Сохранить изменения во вкладке Минимальные баллы?','ИС "УГТУ"',
          MB_YESNO) = IDYES) then
      actSaveMinBallsExecute(Sender)
    else
      actCancelMinBallsExecute(Sender);
  End;
end;

procedure TfmZach.dbgAbitsForZachislTitleClick(Column: TColumnEh);
begin
   TADODataSet(dbgAbitsForZachisl.DataSource.DataSet).Sort:=
   Column.Field.DisplayName;
end;

procedure TfmZach.SetColor(canvas:TCanvas; const Rect: TRect; Field: TField; RowColor,TextColor:TColor);
//var myRect:TRect;
begin
  canvas.Brush.Color:=RowColor;
  canvas.FillRect(Rect);
  canvas.Font.Color:=TextColor;
  canvas.TextOut(Rect.Left, Rect.Top, Field.DisplayText);
end;







procedure TfmZach.ToolButton7Click(Sender: TObject);
begin
  inherited;

end;

//отмечаем всех абитуриентов: красные - те, кто не набрал минимума баллов,
//желтые - есть минимум, но нет проходного балла
//зеленые - есть проходной балл и все минимальные
procedure TfmZach.dbgAbitsForZachislDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var
  canvas:TCanvas;
  //medalBall:integer;
begin

   if dbgAbitsForZachisl.DataSource.DataSet.FieldByName('nn_abit').Value=null then
      exit;
   if (gdSelected in State)and(dbgAbitsForZachisl.Focused) then
      exit;
   canvas:=(sender as TDBGridEh).Canvas;

  //если у абитуриента не хватает документов, красим его в синий
  if (not TAbitZachislenieController.Instance.IsAbit_HaveAllDocs) then
  begin
    SetColor(canvas,Rect,Column.Field,$00F0CAA6,clInfoText);   //$00C6C6FF
    exit;
  end;

  //если абитуриент не набрал минимума баллов по дисциплине, закрашиваем его
  //в красный цвет

  if (not TAbitZachislenieController.Instance.IsAbit_HaveAllExam) then
  begin
    SetColor(canvas,Rect,Column.Field,$00C6C6FF,clInfoText);   //$00C6C6FF
    exit;
  end
  else
  begin
    //отмечаем всех проходящих
  //  if  TAbitZachislenieController.Instance.IsAbit_ProhodBall then
  //  begin
      SetColor(canvas,Rect,Column.Field,$007BDDBD,clInfoText); //$007BDD
      exit;
  //  end
    //отмечаем всех непроходящих
  //  else
  //  begin
  //    SetColor(canvas,Rect,Column.Field,$0063F5E3,clInfoText);  //$0063F5E3
  //    exit;
  //  end
  end;


end;



//процедура зачисляет всех студентов, отмеченных галочками
procedure TfmZach.actZachislAbitExecute(Sender: TObject);
var i:integer;
begin
  Modified:=false;

  TApplicationController.GetInstance.AddLogEntry('Начало зачисления абитуриентов.');
  TAbitZachislenieController.Instance.Abit_ZachWithPrikaz(@dbgAbitsForZachisl);
  dbgAbitsForZachisl.DataSource.DataSet.Next;
end;
                                               
procedure TfmZach.actAbitReturnExecuteExecute(Sender: TObject);
var i:integer;
begin
  if (MessageBox(Handle, '   Вернуть абитуриента(ов)?','ИС "УГТУ"',
          MB_YESNO) = IDNO) then
    exit;

  for i := 0 to dbgAbitsForZachisl.SelectedRows.Count-1 do
  begin
    prikaz.DataSource.DataSet.GotoBookmark(Pointer(prikaz.SelectedRows[i]));
    TAbitZachislenieController.Instance.Abit_Current(prikaz.DataSource.DataSet.FieldValues['NN_abit']);
  end;
end;


procedure TfmZach.actAbitReturnExecuteUpdate(Sender: TObject);
begin
  actAbitReturnExecute.Enabled:=(prikaz.RowCount>0);
end;

procedure TfmZach.actAbitSpisokToExcelExecute(Sender: TObject);
begin
  if predvpage.Visible=true then
  begin
    TAbitZachislenieController.Instance.AbitsToExcel(true);
  end;

  if prikazpage.Visible=true then
    TAbitZachislenieController.Instance.AbitsToExcel(false);


end;

procedure TfmZach.actAbitSpisokToExcelUpdate(Sender: TObject);
begin
  actAbitSpisokToExcel.Enabled:= (dbgAbitsForZachisl.RowCount>0);

end;




procedure TfmZach.actAddAllProhBallsExecute(Sender: TObject);
begin
  if FrameObject is TDBNodeZachObject then
  begin
     TAbitZachislenieController.Instance.AddAllProhBalls(
        TDBNodeZachObject(FrameObject).ik,null,null);
  end;

  //узел факультет
  if FrameObject is TDBNodeFacZachObject then
  begin
     TAbitZachislenieController.Instance.AddAllProhBalls(
     TDBNodeZachObject(TDBNodeFacZachObject(FrameObject).Node.Parent.Data).ik,TDBNodeFacZachObject(FrameObject).ik,null);
  end;

//узел специальность
  if FrameObject is TDBNodeSpecZachObject then
  begin
     TAbitZachislenieController.Instance.AddAllProhBalls(
     TDBNodeZachObject(TDBNodeSpecZachObject(FrameObject).Node.Parent.Parent.Data).ik, null, TDBNodeSpecZachObject(FrameObject).ik);
  end;
  //обновляем данные в DataSource
   dbgBalls.DataSource.DataSet.Close;
   dbgBalls.DataSource.DataSet.Open;
   dbgBalls.DataSource.DataSet.FieldByName('Ball').Alignment:= taLeftJustify;
end;

procedure TfmZach.actAddAllProhBallsUpdate(Sender: TObject);
begin
  actAddAllProhBalls.Enabled:= (dbgBalls.DataSource.DataSet.RecordCount<1);
end;

procedure TfmZach.actAutomaticZachislExecute(Sender: TObject);
begin
  inherited;
  if (MessageBox(Handle, 'Выполнить автоматическое зачисление абитуриентов?','ИС "УГТУ"',
          MB_YESNO) = IDNO) then
    exit;
end;

procedure TfmZach.actExpPrikSpecUpdate(Sender: TObject);
begin
  actExpPrikSpec.Enabled:= (Prikaz.RowCount>0);
  actExpPrikGrup.Enabled:= (Prikaz.RowCount>0);
  actCancelZachisl.Enabled:= (Prikaz.RowCount>0);
end;


procedure TfmZach.actGiveZachNumberExecute(Sender: TObject);
var proc: TADOStoredProc;
  tempDS: TADODataSet;
  I: Integer;
begin
  //выдать всем зачисленным абитуриентам номера зачетных книжек
  proc := TADOStoredProc.Create(nil);
  try
    //проверяем, всем ли выданы зачетные книжки
    tempDS := TGeneralController.Instance.GetNewADODataSet(false);
    tempDS.CommandText := 'select NN_abit, nCode, NNrecord from GetAbitsWihoutZach('+IntTostr(year)+')';
    tempDS.Open;
    tempDS.First;
    ProgressBar1.Visible := true;
    ProgressBar1.Max := tempDS.RecordCount;
    ProgressBar1.Position := 0;
    proc.ProcedureName:= 'ABIT_Set_Zach;1';
    proc.Connection:= dm.DBConnect;
    proc.Parameters.CreateParameter('@NNrecord', ftInteger, pdInput, 10, 0);
    proc.Parameters.CreateParameter('@nCode', ftInteger, pdInput, 10, 0);

    for I := 0 to tempDS.RecordCount - 1 do
    with proc.Parameters do
    begin
      ParamByName('@NNrecord').Value := tempDS.FieldByName('NNrecord').Value;
      ParamByName('@nCode').Value := tempDS.FieldByName('nCode').Value;
      proc.ExecProc;
      ProgressBar1.Position := ProgressBar1.Position + 1;
      tempDS.Next;
    end;
    ProgressBar1.Visible := false;
    tempDS.Close;
    tempDS.Open;
    if tempDS.RecordCount > 0 then
      MessageBox(Handle, PChar(IntToStr(tempDS.RecordCount)+ ' абитуриентов не получили номера зачетных книжек. Проверьте диапазоны'),'Не удалось распределить зачетные книжки всем абитуриентам',MB_OK);
  except

  end;
  proc.Free;
  tempDS.Close;
  tempDS.Free;
end;

procedure TfmZach.actPrikazAppointExecute(Sender: TObject);
begin
  inherited;
  TApplicationController.GetInstance.AddLogEntry('Назначаем приказы зчисленным абитуриентам.');
  TAbitZachislenieController.Instance.Abit_AppointPrikaz(@prikaz);
  prikaz.DataSource.DataSet.Next;
end;

procedure TfmZach.actPrintExamStatisticExecute(Sender: TObject);
begin
  inherited;
  TApplicationController.GetInstance.AddLogEntry('Печать отчета статистики по вступительным экзаменам для зачисленных.');
  TAbitOtchetsController.Instance.ExamsStatToExcel(year,idFac,idSpecfac,true);
end;

//Экспорт в Word общего приказа на зачисление
procedure TfmZach.actExpPrikSpecExecute(Sender: TObject);
begin
  TAbitZachislenieController.Instance.SpecPrikazToWord(@Prikaz);
end;


//возвращает абитуриента из списка зачисленных
//в предварительный список на зачисление
procedure TfmZach.actCancelMinBallsExecute(Sender: TObject);
begin
  inherited;
   Cancel;

end;

procedure TfmZach.actCancelZachislExecute(Sender: TObject);
var i:integer;
begin

  if (MessageBox(Handle, 'Вернуть абитуриента в предварительный список на зачисление?','ИС "УГТУ"',
          MB_YESNO) = IDNO) then
    exit;
    //возвращаем абитуриенту состояние зачисления 1 (текущее)

  for i := 0 to (prikaz.SelectedRows.Count-1) do
  begin
      Prikaz.DataSource.DataSet.GotoBookmark(Pointer(prikaz.SelectedRows[i]));
         TAbitZachislenieController.Instance.Abit_Current(Prikaz.DataSource.DataSet.FieldValues['NN_abit']);
  end;
end;

procedure TfmZach.actCancelZachislUpdate(Sender: TObject);
begin
   (Sender as TAction).Enabled:= (Prikaz.RowCount>0);
end;

//меняем фильтр по категории поступления на
//вкладке Предварительного списка
procedure TfmZach.cbKatZachislChange(Sender: TObject);
begin
  TApplicationController.GetInstance.AddLogEntry('Применение фильтра по категории зачисления '+cbKatZachisl.Text);

  TAbitZachislenieController.Instance.SetAbitSpisokFilter(1,cbKatZachisl.Value);
end;

//Экспорт приказа на зачисление по группам в Word
procedure TfmZach.actExpPrikGrupExecute(Sender: TObject);
begin
  TAbitZachislenieController.Instance.GroupPrikazToWord(@Prikaz);
end;




procedure TfmZach.prikazDblClick(Sender: TObject);
begin
if frmmain.actGroupChange.enabled then frmmain.actGroupChange.execute else
if frmmain.actJoinGroup.enabled then frmmain.actJoinGroup.execute;

end;


// Зачисление - функция adospAbitZachisl
//adospAbitSpisokForZachisl -массив всех кто в предварительном списке
//adospAbitSpisokForZachisl.FieldByName('bit_NotMinim').Value=1 - нет мин. бита



procedure TfmZach.actRefreshAbitListExecute(Sender: TObject);
begin


  TAbitZachislenieController.Instance.RefreshAbitList;
end;

procedure TfmZach.actRezervAbitExecute(Sender: TObject);
var i:integer;
begin
Modified:=false;

  if (MessageBox(Handle, 'Перевести абитуриента(ов) в резерв?','ИС "УГТУ"',
          MB_YESNO) = IDNO) then
    exit;


  for i := 0 to dbgAbitsForZachisl.SelectedRows.Count-1 do
  begin
      dbgAbitsForZachisl.DataSource.DataSet.GotoBookmark(Pointer(dbgAbitsForZachisl.SelectedRows[i]));
      TAbitZachislenieController.Instance.Abit_Reserve(dbgAbitsForZachisl.DataSource.DataSet.FieldValues['NN_abit']);

  end;

end;

procedure TfmZach.actRezervAbitUpdate(Sender: TObject);
var fl: boolean;
begin
   fl:= false;
   if predvpage.Visible then
      if (dbgAbitsForZachisl.RowCount>0) then
         fl:=
          (dbgAbitsForZachisl.DataSource.DataSet.FieldByName('ik_zach').Value<>4);
   actRezervAbit.Enabled :=fl;
end;

procedure TfmZach.actSaveMinBallsExecute(Sender: TObject);
begin
  inherited;
   Apply;
end;

procedure TfmZach.actSaveMinBallsUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled:= modified;
end;

procedure TfmZach.actExileAbitExecute(Sender: TObject);
var i:integer;
begin
  Modified:=false;

  if (MessageBox(Handle, 'Отказать абитуриенту(ам) в зачислении?','ИС "УГТУ"',
          MB_YESNO) = IDNO) then
    exit;

  for i := 0 to dbgAbitsForZachisl.SelectedRows.Count-1 do
  begin
      dbgAbitsForZachisl.DataSource.DataSet.GotoBookmark(Pointer(dbgAbitsForZachisl.SelectedRows[i]));
      TAbitZachislenieController.Instance.Abit_Exile(dbgAbitsForZachisl.DataSource.DataSet.FieldValues['NN_abit']);
  end;
end;

procedure TfmZach.actExileAbitUpdate(Sender: TObject);
begin
  actExileAbit.Enabled:=(dbgAbitsForZachisl.RowCount>0);
end;

procedure TfmZach.actZachislAbitUpdate(Sender: TObject);
begin
  actZachislAbit.Enabled:=(dbgAbitsForZachisl.RowCount>0);
end;

function TfmZach.DoApply: Boolean;
begin
//сохраняем изменения в проходных баллах
   TADODataSet(dbgBalls.DataSource.DataSet).UpdateBatch;
   Modified:= false;
//обновляем DataSet
   TADODataSet(dbgBalls.DataSource.DataSet).requery;
   result:=false;
end;

procedure TfmZach.DoCancel;
begin
//обновляем DataSet и затираем изменения
   TADODataSet(dbgBalls.DataSource.DataSet).requery;
   Modified:= false;
end;
                                           
procedure TfmZach.dbgBallsColumns3UpdateData(Sender: TObject; var Text: string;
  var Value: Variant; var UseText, Handled: Boolean);
begin
  inherited;
  
  Modified:= true;
  bbProceed.enabled:=true;
  bbUndo.enabled:=true;
end;

procedure TfmZach.dbgBallsTitleClick(Column: TColumnEh);
begin
   TADODataSet(dbgBalls.DataSource.DataSet).Sort:=
      Column.Field.DisplayName;
end;

procedure TfmZach.dbgAbitsForZachislDblClick(Sender: TObject);
begin
   ActZachislAbit.Execute;
end;

procedure TfmZach.actPredvSpiskiPologOcenkiExecute(Sender: TObject);
begin
  if not TAbitZachislenieController.Instance.AbitsWithPolozhOcenkiToExcel(@dbgAbitsForZachisl) then
     MessageBox(Handle, 'Произошла ошибка при экспорте данных в Excel.','ИС "УГТУ"',
          MB_OK)
end;

procedure TfmZach.actPredvSpiskiPologOcenkiUpdate(Sender: TObject);
begin
  actPredvSpiskiPologOcenki.Enabled:=(dbgAbitsForZachisl.RowCount>0);
end;

procedure TfmZach.ExecuteError(Sender: TObject; E: Exception);
begin
  (Sender as TReportBase).Quit;
  raise Exception.Create(E.Message); //EApplicationException.Create('Произошла ошибка при формировании отчета.',E)
end;

procedure TfmZach.actPredvSpisokZachislExecute(Sender: TObject);
var
  Report:TReportBase;
begin
    Report := TReportBase.CreateReport(TAbitPredvSpisokZachislReport);
    Report.FreeOnComplete := true;
    Report.OnExecuteError := ExecuteError;
    TAbitPredvSpisokZachislReport(Report).NNyear:= year;
    TAbitPredvSpisokZachislReport(Report).ikFac:= idFac;
    TAbitPredvSpisokZachislReport(Report).ikSpecFac:= idSpecFac;
    Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\PredvZachisl.XLT';
    TWaitingController.GetInstance.Process(Report);
end;

procedure TfmZach.actProtokolToExcelExecute(Sender: TObject);
begin
  TAbitZachislenieController.Instance.ExportProtokolToExcel;
end;

end.
