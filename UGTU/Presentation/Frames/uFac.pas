unit uFac;
  {#Author tanyav@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseFrame, StdCtrls, Buttons, ToolWin, ComCtrls, ExtCtrls, DB,
  ADODB, Grids, DBGridEh, ComObj, DateUtils, Mask, DBCtrlsEh, 
  Spin, GridsEh, DBLookupEh, ActnList, ImgList, D_FacItogiRep,
  ReportsBase, ReportUI, uWaitingform, Menus, ApplicationController, ExceptionBase, uWaitingController, udmStudentData, D_AcademReport,
  uAcademFrame, uAverageBalls, DBTVGroupObj, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, System.Actions, DBAxisGridsEh;

type
  TfmFacultet = class(TfmBase)
    tsSessia: TPageControl;
    tsKontingent: TTabSheet;
    tsItogi: TTabSheet;
    tsDaily: TTabSheet;
    Label1: TLabel;
    TabSheet1: TTabSheet;
    DBGridEh1: TDBGridEh;
    DataSource1: TDataSource;
    dtpBeg: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    dtpEnd: TDateTimePicker;
    btnGetRepKont: TButton;
    DBGridEh2: TDBGridEh;
    ToolBar2: TToolBar;
    KontExcel: TSpeedButton;
    ToolBar1: TToolBar;
    dbgrItogi: TDBGridEh;
    DBGridEh3: TDBGridEh;
    ToolBar4: TToolBar;
    SpeedButton3: TSpeedButton;
    SpeedButton2: TSpeedButton;
    dbdteEx: TDBDateTimeEditEh;
    ToolButton1: TToolButton;
    dbdtExam: TDBDateTimeEditEh;
    Panel2: TPanel;
    Label4: TLabel;
    ProgressBar1: TProgressBar;
    cbSemestr: TComboBox;
    spYear: TSpinEdit;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    tsNapr: TTabSheet;
    ToolBar3: TToolBar;
    tbtPrintNapr: TToolButton;
    tbtCloseNapr: TToolButton;
    ToolButton10: TToolButton;
    dbgrdNapr: TDBGridEh;
    Panel7: TPanel;
    Label5: TLabel;
    dbdtDateBegin: TDBDateTimeEditEh;
    Label6: TLabel;
    dbdtDateEnd: TDBDateTimeEditEh;
    ilMain: TImageList;
    ActionList1: TActionList;
    actPrntGroup: TAction;
    actCloseNapr: TAction;
    actPrintNapr: TAction;
    actDelNapr: TAction;
    actRefreshNaprList: TAction;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    actPrintEmptyNapr: TAction;
    ToolButton7: TToolButton;
    ppmFacNapr: TPopupMenu;
    actPrintEmptyNapr1: TMenuItem;
    actPrintNapr1: TMenuItem;
    actCloseNapr1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    actItogiFacToExc: TAction;
    actItogiToExc: TAction;
    ToolButton8: TToolButton;
    pmItogi: TPopupMenu;
    MSExcel1: TMenuItem;
    MSExcel2: TMenuItem;
    tsAcadem: TTabSheet;
    actAcademToExcel: TAction;
    fmAcadem: TfmAcadem;
    tsAvgBalls: TTabSheet;
    fmAverageBallsFac: TfmAverageBalls;
    actEditNapr: TAction;
    ToolButton9: TToolButton;
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure tsSessiaChange(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure KontExcelClick(Sender: TObject);
    procedure ItogiToExcel(ikFac:integer);

    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure dbdtExamChange(Sender: TObject);
    procedure actCloseNaprExecute(Sender: TObject);
    procedure actPrintNaprExecute(Sender: TObject);
    procedure actDelNaprExecute(Sender: TObject);
    procedure dbdtDateBeginChange(Sender: TObject);
    procedure dbdtDateEndChange(Sender: TObject);
    procedure actCloseNaprUpdate(Sender: TObject);
    procedure actPrintNaprUpdate(Sender: TObject);
    procedure actDelNaprUpdate(Sender: TObject);
    procedure actRefreshNaprListExecute(Sender: TObject);
    procedure dbgrdNaprTitleClick(Column: TColumnEh);
    procedure actPrintEmptyNaprExecute(Sender: TObject);
    procedure actItogiFacToExcExecute(Sender: TObject);
    procedure actItogiToExcExecute(Sender: TObject);
    procedure spYearChange(Sender: TObject);
    procedure DBGridEh4TitleClick(Column: TColumnEh);
    procedure actAcademToExcelExecute(Sender: TObject);
    procedure actEditNaprExecute(Sender: TObject);
  private
    Fik: Integer;
    procedure OpenNaprList;
    procedure ExecuteError(Sender: TObject; E: Exception);
  public
    procedure DoRefreshFrame;override;
    property ik: Integer read Fik write Fik;
    procedure Read;
  end;

var
  fmFacultet: TfmFacultet;

implementation

uses uDM, DBTVFacobj, uMain, strUtils, uDMFacultetStatistic,
      uUspevGroupController, uNapr, uNaprClose, udmUspevaemost, CommonIntfImpl;

{$R *.dfm}

{ TfmFacultet }

procedure TfmFacultet.Read;
begin
  DataSource1.DataSet := DataSet;
end;

procedure TfmFacultet.DBGridEh1DblClick(Sender: TObject);
begin

  if frmMain.DBDekTreeView_TEST1.Selected.HasChildren then
  SelectInTree(DBGridEh1.row);
end;

procedure TfmFacultet.DBGridEh4TitleClick(Column: TColumnEh);
begin
dmStudentData.adodsAcadem.Sort:='['+Column.Field.FieldName+']';
end;

procedure TfmFacultet.tsSessiaChange(Sender: TObject);
begin
  inherited;
  if tsSessia.ActivePage = tsKontingent then
  begin
    dmFacultetStatistic.adospSmallKont.Active := false;
    dmFacultetStatistic.adospSmallKont.Parameters.Clear;
    dmFacultetStatistic.adospSmallKont.Parameters.AddParameter;
    dmFacultetStatistic.adospSmallKont.Parameters[0].Value := TDBNodeFacultyObject(frmMain.DBDekTreeView_TEST1.SelectedObject).ik;
    try
      dmFacultetStatistic.adospSmallKont.Active := true;
    except
      ShowMessage('Ошибка формирования отчёта по контингенту. Проверьте данные о студентах.');
    end;
  end;

  if tsSessia.ActivePage = tsDaily then
  begin
    dmFacultetStatistic.adospSelDaysItogi.Active := false;
    dmFacultetStatistic.adospSelDaysItogi.CommandText:='SELECT * from SelDaysItogiForfac('+inttostr(TDBNodeFacultyObject(frmMain.DBDekTreeView_TEST1.SelectedObject).ik)+',null)';
    dmFacultetStatistic.adospSelDaysItogi.Active := true;
    dbdtExam.Value:=dmFacultetStatistic.adospSelDaysItogi.Fields[0].Value;
  end;

  if tsSessia.ActivePage = tsItogi then
  begin
     cbSemestr.ItemIndex:=0;
     spYear.MaxValue:=YearOf(Date());
     if (MonthOf(date())<6) then
     begin
        spYear.Value:=YearOf(Date())-1;
        cbSemestr.ItemIndex:=1;
     end
     else
     begin
        spYear.Value:=YearOf(Date());
        cbSemestr.ItemIndex:=0;
     end

  end;

  if tsSessia.ActivePage = tsNapr then
  begin
    //устанавливаем дату, если не открыт dataSet
    if not dmUspevaemost.adospGetAllNaprForFac.Active then
    begin
      dbdtDateBegin.Value:=Date()-3;
      dbdtDateEnd.Value:=Date();
    end;
  end;

  if tsSessia.ActivePage = tsAcadem then
  begin
    dmStudentData.adodsAcadem.Active:=false;
    dmStudentData.adodsAcadem.CommandText := 'select * from AcademStud where [Ik_Fac]='+inttostr(FIk);
    dmStudentData.adodsAcademStringField11.Visible:=false;
    dmStudentData.adodsAcadem.Active:=true;
    frmMain.Comment(TDBNodeFacultyObject(FrameObject).Name, 'Академических отпусков: '+inttostr(dmStudentData.adodsAcadem.RecordCount));
    fmAcadem.FrameLevel := 2;
    fmAcadem.FrameObject := FrameObject;
  end;

  if tsSessia.ActivePage = tsAvgBalls then
  begin
    frmMain.Comment('Средние баллы студентов', 'Специальность '+(FrameObject as TDBNodeFacultyObject).Name);
    fmAverageBallsFac.FrameObject := FrameObject;
    fmAverageBallsFac.FrameType := 2;
    fmAverageBallsFac.ObjectID := (FrameObject as TDBNodeFacultyObject).ik ;
    fmAverageBallsFac.StudyYears:= 6;
    fmAverageBallsFac.ShowStudents := ssShowActualOnly;
    fmAverageBallsFac.ShowActualGroup := true;

    fmAverageBallsFac.FillListView;
  end;

  end;

procedure TfmFacultet.actAcademToExcelExecute(Sender: TObject);
var Report:TAcademReport;
begin
dmStudentData.adodsAcadem.DisableControls;
Report := TAcademReport.CreateFull(nil, dmStudentData.adodsAcadem, TDBNodeFacultyObject(FrameObject).Name, DateToStr(Date));
  //Report.FreeOnComplete := true;
  Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\AcademReportFac.xlt';
  // Начать построение отчёта

  TWaitingController.GetInstance.Process(Report);
  dmStudentData.adodsAcadem.EnableControls;
  Report.Show;
  Report.Free;
end;

procedure TfmFacultet.actCloseNaprExecute(Sender: TObject);
var ik_ved: integer;
begin
  try
    ik_ved:=dmUspevaemost.adospGetAllNaprForFac.FieldValues['ik_ved'];
  except
    ShowMessage('Выберите направление!');
    exit;
  end;

  ftmNaprClose:=TftmNaprClose.Create(self);
  ftmNaprClose.Tag:=dmUspevaemost.adospGetAllNaprForFac.FieldValues['ik_zach'];
  ftmNaprclose.FormShow(Sender);
  ftmNaprclose.dbcbeNapr.KeyValue:=ik_ved;
  ftmNaprclose.dbcbeNapr.Enabled:=false;
  ftmNaprclose.showmodal;
  ftmNaprclose.Free;

  OpenNaprList;
end;

procedure TfmFacultet.actCloseNaprUpdate(Sender: TObject);
begin
  if (dmUspevaemost.adospGetAllNaprForFac.Active) then
     (Sender as TAction).Enabled:=
        (dmUspevaemost.adospGetAllNaprForFac.RecordCount>0) and
        (not dmUspevaemost.adospGetAllNaprForFac.FieldByName('lClose').AsBoolean)
  else  (Sender as TAction).Enabled:=false;
end;

procedure TfmFacultet.actDelNaprExecute(Sender: TObject);
begin
  if MessageBox(Handle, 'Вы уверены, что хотите удалить направление?',
					  'ИС УГТУ', MB_YESNO)=IDYES then
  begin
  //удаление ведомости
    TUspevGroupController.Instance.DelVed(dmUspevaemost.adospGetAllNaprForFac.FieldByName('ik_ved').Value);
  //все переоткрываем
    OpenNaprList;
  end;
end;

procedure TfmFacultet.actDelNaprUpdate(Sender: TObject);
begin
  if (dmUspevaemost.adospGetAllNaprForFac.Active) then
     (Sender as TAction).Enabled:=
        (dmUspevaemost.adospGetAllNaprForFac.RecordCount>0) 
  else  (Sender as TAction).Enabled:=false;
end;

procedure TfmFacultet.actEditNaprExecute(Sender: TObject);
var ik_ved: integer;
begin

  try
    ik_ved:=dmUspevaemost.adospGetAllNaprForFac.FieldValues['ik_ved'];
  except
    ShowMessage('Выберите направление!');
    exit;
  end;

  {if not TUspevGroupController.Instance.OpenVed(ik_Ved) then
    begin
    MessageBox(Handle, 'При открытии ведомости произошла ошибка.', 'ИС УГТУ', MB_OK);
    exit;
    end;   }
   if not TUspevGroupController.Instance.OpenVed(ik_Ved) then
    begin
    MessageBox(Handle, 'При открытии ведомости произошла ошибка.', 'ИС УГТУ', MB_OK);
    exit;
    end;

  ftmNaprClose:=TftmNaprClose.Create(self);
  ftmNaprClose.Tag:=dmUspevaemost.adospGetAllNaprForFac.FieldValues['ik_zach'];
  ftmNaprClose.CloseNapr:=true;
  ftmNaprclose.FormShow(Sender);
  ftmNaprclose.dbcbeNapr.KeyValue:=ik_ved;
  ftmNaprclose.dbcbeNapr.Enabled:=false;
  ftmNaprclose.LoadNapr;
  if ftmNaprclose.showmodal = mrCancel then
   // if not TUspevGroupController.Instance.CloseNapr(ik_Ved) then
    begin
    MessageBox(Handle, 'При редактировании направления произошла ошибка.', 'ИС УГТУ', MB_OK);
    exit;
    end;
  ftmNaprclose.Free;

  OpenNaprList;
end;

procedure TfmFacultet.actItogiFacToExcExecute(Sender: TObject);
begin
    ItogiToExcel(TDBNodeFacultyObject(frmMain.DBDekTreeView_TEST1.SelectedObject).ik);

end;

procedure TfmFacultet.actItogiToExcExecute(Sender: TObject);
begin
  ItogiToExcel(0);
  SpeedButton2Click(Sender);

end;

procedure TfmFacultet.actPrintEmptyNaprExecute(Sender: TObject);
var ik_ved: integer;
begin
  inherited;
  try
    ik_ved:= dmUspevaemost.adospGetAllNaprForFac.FieldValues['ik_ved']
  except
    ShowMessage('Выберите направление!');
    exit;
  end;

  ftmNapr:=TftmNapr.Create(self);
  try
    ftmNapr.PrintNapr(ik_ved, true);
  finally
    ftmNapr.Free;
  end;

end;

procedure TfmFacultet.actPrintNaprExecute(Sender: TObject);
var ik_ved: integer;
begin
  try
    ik_ved:=dmUspevaemost.adospGetAllNaprForFac.FieldValues['ik_ved'];
  except
    ShowMessage('Выберите направление!');
    exit;
  end;

  ftmNapr:=TftmNapr.Create(self);
  try
    ftmNapr.PrintNapr(ik_ved, false);
  finally
    ftmNapr.Free;
  end;

  //OpenNaprList;
end;

procedure TfmFacultet.actPrintNaprUpdate(Sender: TObject);
begin
  if (dmUspevaemost.adospGetAllNaprForFac.Active) then
     (Sender as TAction).Enabled:=
        (dmUspevaemost.adospGetAllNaprForFac.RecordCount>0) 
  else  (Sender as TAction).Enabled:=false;
end;

procedure TfmFacultet.actRefreshNaprListExecute(Sender: TObject);
begin
  OpenNaprList;  

end;

procedure TfmFacultet.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if (DataSource1.DataSet <> nil) then
    if (DataSource1.DataSet.Active) then
      frmMain.StatusBar1.Panels[2].Text:= 'Выбранная специальность: ' + DataSource1.DataSet.FieldByName('Cname_spec').AsString;
end;

procedure TfmFacultet.KontExcelClick(Sender: TObject);
var wb:variant;
    i,j,k,max,n,maxstr:integer;
    sp:integer;
    year:integer;
    c:char;
   // fname:string;
    ExAppl:variant;
begin
  //Вызов процедур (получение данных)
  try
     dmFacultetStatistic.adospSelKont.Close;
     dmFacultetStatistic.adospSelKont.Parameters[1].Value:=TDBNodeFacultyObject(frmMain.DBDekTreeView_TEST1.SelectedObject).ik;
     dmFacultetStatistic.adospSelKont.Open;
     dmFacultetStatistic.adospSelKont.First;
  except
    MessageBox(Handle, 'Произошла ошибка при получении данных.','ИС Деканат',MB_OK);
    exit;
  end;

  //сам экспорт
  ExAppl:=CreateOleObject('Excel.Application');
  try
     ExAppl.DisplayAlerts:= false;
     ExAppl.WorkBooks.Add;
     wb:=ExAppl.WorkBooks.item[ExAppl.WorkBooks.count];
 
     //ВЫВОД ПО ГРУППАМ (ПО КУРСАМ)
     i:=2; j:=1; k:=i+1; max:=5; maxstr:=i;
     sp:=dmFacultetStatistic.adospSelKont.FieldByName('ik_spec').AsInteger;
     year:=dmFacultetStatistic.adospSelKont.FieldByName('Kurs').AsInteger;
     while dmFacultetStatistic.adospSelKont.FieldByName('ik_spec').AsInteger<=1000000 do
     begin
        if (sp=dmFacultetStatistic.adospSelKont.FieldByName('ik_spec').AsInteger) then
        begin
           if (year<>dmFacultetStatistic.adospSelKont.FieldByName('Kurs').AsInteger) then
           begin
              inc(j);
              i:=k;
              year:=dmFacultetStatistic.adospSelKont.FieldByName('Kurs').AsInteger;
           end
           else
           begin
              inc(i);
              if (maxstr<i) then maxstr:=i;
           end
        end
        else
        begin
           inc(maxstr);
           i:=maxstr;
           k:=i;
           if (max<j) then max:=j;
           j:=1;
           sp:=dmFacultetStatistic.adospSelKont.FieldByName('ik_spec').AsInteger;
           year:=dmFacultetStatistic.adospSelKont.FieldByName('Kurs').AsInteger;
        end;
        wb.sheets[1].cells[i,j]:=dmFacultetStatistic.adospSelKont.FieldByName('kont').AsString;
        dmFacultetStatistic.adospSelKont.Next;
     end;
     wb.sheets[1].range['A'+inttostr(i)+':F'+inttostr(i)].Font.Bold:=true;
     if (max=5) then c:='E'
     else c:='F';
     wb.sheets[1].Range['A3:'+c+intToStr(i)].ColumnWidth:=16;
     wb.sheets[1].Range['A3:'+c+intToStr(i)].Borders.Weight:=2;
     wb.sheets[1].range['A1:'+c+'1'].Merge(true);
     wb.sheets[1].range['A2:'+c+'2'].Merge(true);
     wb.sheets[1].range['A1:'+c+'2'].Font.Bold:=true;
     wb.sheets[1].range['A1:'+c+'2'].Font.Size:=12;
     wb.sheets[1].range['A2:'+c+'2'].Font.Size:=12;
     wb.sheets[1].range['A1:'+c+'2'].HorizontalAlignment:=-4108;

 {  //ВЫВОД ФБО
   if (fac=6) then
   begin
       n:=i;
       wb.sheets[1].cells[1,1]:='Контингент студентов факультета безотрывного обучения '+fname;
       wb.sheets[1].cells[2,1]:=' на '+dateToStr(Date());

     //ВЫВОД ПО СПЕЦИАЛЬНОСТЯМ (ПО КУРСАМ)
     wb.sheets[2].range['A1:F1'].Merge(true);
     wb.sheets[2].range['A2:F2'].Merge(true);
     wb.sheets[2].range['A1:F2'].Font.Bold:=true;
     wb.sheets[2].range['A1:F2'].Font.Size:=12;
     wb.sheets[2].range['A2:F2'].Font.Size:=12;
     wb.sheets[2].range['A1:F2'].HorizontalAlignment:=-4108;
     wb.sheets[2].cells[1,1]:='Контингент студентов факультета безотрывного обучения '+fname;
     wb.sheets[2].cells[2,1]:=' на '+dateToStr(Date());
     i:=3;
     sh:=wb.sheets[2];
     wb.sheets[2].range['A1:A10'].ColumnWidth:=18;
     wb.sheets[2].range['B1:B10'].ColumnWidth:=6;
     wb.sheets[2].range['C1:C10'].ColumnWidth:=16;
     wb.sheets[2].range['D1:D10'].ColumnWidth:=18;
     wb.sheets[2].range['E1:E10'].ColumnWidth:=6;
     wb.sheets[2].range['F1:F10'].ColumnWidth:=16;
     sh.cells[i,1]:='Cпециальность';
     sh.cells[i,2]:='Курс';
     sh.cells[i,3]:='Количество';
     sh.cells[i,4]:='Cпециальность';
     sh.cells[i,5]:='Курс';
     sh.cells[i,6]:='Количество';
     k:=i;   max:=0; j:=0;
     while dm.adospSelKont.FieldByName('ik_spec').AsInteger<3000000 do//not dm.adospSelKont.Eof do
     begin
        inc(i);
        if (sp=dm.adospSelKont.FieldByName('ik_spec').AsInteger) then
        begin
           if (dm.adospSelKont.FieldByName('Kurs').AsInteger>0) then
              wb.sheets[2].cells[i,j*3+2]:=dm.adospSelKont.FieldByName('Kurs').AsInteger
           else
           begin
              wb.sheets[2].cells[i,j*3+1]:='ИТОГО';
              if (j=0) then wb.sheets[2].range['A'+inttostr(i)+':C'+inttostr(i)].Font.Bold:=true
              else  wb.sheets[2].range['D'+inttostr(i)+':F'+inttostr(i)].Font.Bold:=true
           end;
        end
        else
        begin
           if (max=8) then
           begin
              j:=1;
              max:=i;
              i:=4;
           end;
           if (max<9) then inc(max);
           wb.sheets[2].cells[i,j*3+2]:=dm.adospSelKont.FieldByName('Kurs').AsInteger;
           sp:=dm.adospSelKont.FieldByName('ik_spec').AsInteger;
           wb.sheets[2].cells[i,j*3+1]:=dm.adospSelKont.FieldByName('Spec').AsString+'-'+inttostr(sp-1000000);
        end;
        wb.sheets[2].cells[i,j*3+3]:=dm.adospSelKont.FieldByName('kont').AsString;
        dm.adospSelKont.Next;
     end;
     wb.sheets[2].Range['A'+intToStr(k)+':F'+intToStr(i)].HorizontalAlignment:=-4108;
     if(i>max) then max:=i;
     wb.sheets[2].Range['A'+intToStr(k)+':F'+intToStr(max)].Borders.Weight:=2;
     inc(max);
     wb.sheets[2].range['A'+inttostr(max)+':F'+inttostr(max+2)].Font.Bold:=true;
     wb.sheets[2].range['A'+inttostr(max)+':F'+inttostr(max+2)].Font.Size:=11;
     wb.sheets[2].range['A'+inttostr(max)+':F'+inttostr(max+2)].Merge(true);
     wb.sheets[2].cells[max,1]:='      ВСЕГО по ФБО: '+ dm.adospSelKont.FieldByName('kont').AsString;
     wb.sheets[1].range['A'+inttostr(n+1)+':F'+inttostr(n+1)].Font.Bold:=true;
     wb.sheets[1].range['A'+inttostr(n+1)+':F'+inttostr(n+1)].Font.Size:=11;
     wb.sheets[1].range['A'+inttostr(n+1)+':F'+inttostr(n+1)].Merge(true);
     wb.sheets[1].cells[n+1,1]:='      ВСЕГО по ФБО: '+ dm.adospSelKont.FieldByName('kont').AsString;
   end

   //ВЫВОД ДРУГИХ ФАКУЛЬТЕТОВ
   else  }
   begin
     wb.sheets[1].cells[2,1]:=' на '+dateToStr(Date());

     //ВЫВОД ПО СПЕЦИАЛЬНОСТЯМ (ПО КУРСАМ)
     i:=i+3;
     wb.sheets[1].cells[i,2]:='Cпециальность';
     wb.sheets[1].cells[i,3]:='Курс';
     wb.sheets[1].cells[i,4]:='Количество';
     k:=i;
     while dmFacultetStatistic.adospSelKont.FieldByName('ik_spec').AsInteger<=3000000 do
     begin
        inc(i);
        if (sp=dmFacultetStatistic.adospSelKont.FieldByName('ik_spec').AsInteger) then
        begin
           if (dmFacultetStatistic.adospSelKont.FieldByName('Kurs').AsInteger<20) then
              wb.sheets[1].cells[i,3]:=dmFacultetStatistic.adospSelKont.FieldByName('Kurs').AsInteger
           else
           begin
              wb.sheets[1].cells[i,2]:='ИТОГО';
              wb.sheets[1].range['A'+inttostr(i)+':F'+inttostr(i)].Font.Bold:=true;
           end;
        end
        else
        begin
           wb.sheets[1].cells[i,3]:=dmFacultetStatistic.adospSelKont.FieldByName('Kurs').AsInteger;
           sp:=dmFacultetStatistic.adospSelKont.FieldByName('ik_spec').AsInteger;
           wb.sheets[1].cells[i,2]:=dmFacultetStatistic.adospSelKont.FieldByName('spec').AsString;
        end;
        wb.sheets[1].cells[i,4]:=dmFacultetStatistic.adospSelKont.FieldByName('kont').AsString;
        dmFacultetStatistic.adospSelKont.Next;
     end;
     wb.sheets[1].cells[i,3]:='';
     wb.sheets[1].Range['B'+intToStr(k)+':D'+intToStr(i)].Borders.Weight:=2;
     wb.sheets[1].Range['B'+intToStr(k)+':D'+intToStr(i)].HorizontalAlignment:=-4108;
     inc(i);
     wb.sheets[1].range['A'+inttostr(i-1)+':F'+inttostr(i)].Font.Bold:=true;
     wb.sheets[1].range['A'+inttostr(i)+':B'+inttostr(i)].Font.Size:=11;
     wb.sheets[1].range['A'+inttostr(i)+':'+c+inttostr(i)].Merge(true);
     dmFacultetStatistic.adospSelKont.Prior;
     wb.sheets[1].cells[1,1]:='Контингент студентов по группам очной формы обучения '+dmFacultetStatistic.adospSelKont.FieldByName('spec').AsString;

     wb.sheets[1].cells[i-1,2]:='Итого по '+dmFacultetStatistic.adospSelKont.FieldByName('spec').AsString;
     wb.sheets[1].cells[i,1]:='      ИТОГО по '+dmFacultetStatistic.adospSelKont.FieldByName('spec').AsString+' '+ dmFacultetStatistic.adospSelKont.FieldByName('kont').AsString;

     //ВЫВОД КОЛ-ВА СТУДЕНТОВ ЦКП НА ФАКУЛЬТЕТЕ
     dmFacultetStatistic.adospSelKont.Next;
     sp:=dmFacultetStatistic.adospSelKont.FieldByName('ik_spec').AsInteger;
     year:=dmFacultetStatistic.adospSelKont.FieldByName('Kurs').AsInteger;
     j:=1;
     i:=i+5; k:=i+1; n:=k;
     while dmFacultetStatistic.adospSelKont.FieldByName('Kurs').AsInteger>0 do
     begin
        if (sp=dmFacultetStatistic.adospSelKont.FieldByName('ik_spec').AsInteger) then
        begin
           if (year<>dmFacultetStatistic.adospSelKont.FieldByName('Kurs').AsInteger) then
           begin
              inc(j);
              i:=k;
              year:=dmFacultetStatistic.adospSelKont.FieldByName('Kurs').AsInteger;
           end
           else
           begin
              inc(i);
              if (maxstr<i) then maxstr:=i;
           end;
        end
        else
        begin
           inc(maxstr);
           i:=maxstr;
           k:=i;
           if (max<j) then max:=j;
           j:=1;
           sp:=dmFacultetStatistic.adospSelKont.FieldByName('ik_spec').AsInteger;
           year:=dmFacultetStatistic.adospSelKont.FieldByName('Kurs').AsInteger;
        end;
        wb.sheets[1].cells[i,j]:=dmFacultetStatistic.adospSelKont.FieldByName('kont').AsString;
        dmFacultetStatistic.adospSelKont.Next;
     end;
     if (max=5) then c:='E'
     else c:='F';
     wb.sheets[1].Range['A'+inttostr(n)+':'+c+intToStr(i)].Borders.Weight:=2;
     wb.sheets[1].range['A'+inttostr(n-3)+':B'+inttostr(n-1)].Font.Bold:=true;
     wb.sheets[1].range['A'+inttostr(n-2)+':'+c+inttostr(n-2)].Merge(true);
     wb.sheets[1].range['A'+inttostr(n-1)+':'+c+inttostr(n-1)].Merge(true);
     wb.sheets[1].cells[n-2,1]:='Контингент студентов по группам очной формы обучения '+dmFacultetStatistic.adospSelKont.FieldByName('spec').AsString+' (ЦКП)';
     wb.sheets[1].cells[n-1 ,1]:=' на '+dateToStr(Date());
     wb.sheets[1].range['A'+inttostr(n-2)+':'+c+inttostr(n-1)].HorizontalAlignment:=-4108;
     inc(i);
     wb.sheets[1].range['A'+inttostr(i-1)+':F'+inttostr(i)].Font.Bold:=true;
     wb.sheets[1].range['A'+inttostr(i)+':B'+inttostr(i)].Font.Size:=11;
     wb.sheets[1].cells[i,1]:='     ИТОГО по '+dmFacultetStatistic.adospSelKont.FieldByName('spec').AsString+' '+ dmFacultetStatistic.adospSelKont.FieldByName('kont').AsString;
   end;
   ExAppl.DisplayAlerts:= true;
   ExAppl.Visible:=true;
 except
    MessageBox(Handle, 'Произошла ошибка при экспорте данных в Excel.','ИС Деканат',MB_OK);
    ExAppl.Quit;
    ExAppl:= UnAssigned;
  end;
end;

procedure TfmFacultet.ExecuteError(Sender: TObject; E: Exception);
begin
  (Sender as TReportBase).Quit;
  raise EApplicationException.Create('Произошла ошибка при формировании отчета.',E)
end;


procedure TfmFacultet.ItogiToExcel(ikFac:integer);
var
  Report:TReportBase;
begin
    Report := TReportBase.CreateReport(TFacItogiExcelReport);
    Report.FreeOnComplete := true;
    Report.OnExecuteError := ExecuteError;
    Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\Itogi.XLT';
    TFacItogiExcelReport(Report).ikFac:= ikFac;
    TFacItogiExcelReport(Report).Year:= spYear.Value;
    TFacItogiExcelReport(Report).nSem:= cbSemestr.itemIndex;
    TWaitingController.GetInstance.Process(Report);
end;


procedure TfmFacultet.DoRefreshFrame;
begin
  inherited;
  tsSessiaChange(self);
  Read;
  dmFacultetStatistic.adospSelKursItogiCol.Close;
  
end;

//Вывод в Excel ежедневных итогов сессии
procedure TfmFacultet.SpeedButton3Click(Sender: TObject);
var wb:variant;
    sh:variant;
    i,year,s:integer;
    f1:string;
    ExAppl:variant;
begin
  //Получение данных - вызов процедур
  try
    dmFacultetStatistic.adospSelDaysItogi.Open;
    dmFacultetStatistic.adospSelDaysItogi.First;
  except
    MessageBox(Handle, 'Произошла ошибка при получении данных.','ИС Деканат',MB_OK);
    exit;
  end;

  //экспорт в Excel
  try
   if (MonthOf(Date())>8) or (MonthOf(Date())<5) then s:=0  //зимняя
   else s:=1;       //летняя
   ExAppl:=CreateOleObject('Excel.Application');
   ExAppl.DisplayAlerts:= false;
   ExAppl.WorkBooks.Add;
   wb:=ExAppl.WorkBooks.item[ExAppl.WorkBooks.count];

   if (s=0) then f1:='зимней'
   else f1:='летней';

   if (MonthOf(Date())>8) then year:=YearOf(Date())
     else year:=YearOf(Date())-1;

   //настройки листа
   sh:=wb.sheets[1];
   sh.range['A1:K1'].Merge(true);
   sh.range['A2:K2'].Merge(true);
   sh.range['A1:K2'].Font.Bold := true;
    sh.range['A1:K2'].Font.Size := 12;

   sh.cells[1,1]:='Ежедневные итоги '+f1+' экзаменационной сессии '+inttostr(year)+'/'
             +inttostr(year+1)+' уч.г. по ';
   i:=3;
   sh.cells[i,1]:='Дата';
   sh.cells[i,2]:='Группа';
   sh.cells[i,3]:='Дисциплина';
   sh.cells[i,4]:='Всего';
   sh.cells[i,5]:='Не допу-';
   sh.cells[i,6]:='Не явив-';
   sh.cells[i,11]:='Преподаватель';
   sh.range['G'+inttostr(i)+':J'+inttostr(i)].Merge(true);
   //левая граница - 1, 2 - правая, 3 - верхняя, 4 - нижняя
   sh.range['A'+inttostr(i)+':K'+inttostr(i+1)].Borders.item[1].Weight:=2;
   sh.range['A'+inttostr(i)+':K'+inttostr(i+1)].Borders.item[2].Weight:=2;
   sh.range['A'+inttostr(i)+':K'+inttostr(i)].Borders.item[3].Weight:=2;
   sh.range['G'+inttostr(i)+':J'+inttostr(i+1)].Borders.item[4].Weight:=2;
   sh.cells[i,7]:='Оценка';

   i:=i+1;
   sh.cells[i,1]:='экзамена';
   sh.cells[i,4]:='студентов';
   sh.cells[i,5]:='щенных';
   sh.cells[i,6]:='шихся';
   sh.cells[i,10]:='2';
   sh.cells[i,9]:='3';
   sh.cells[i,8]:='4';
   sh.cells[i,7]:='5';

   i:=i+1;
   sh.cells[2,1]:=dmFacultetStatistic.adospSelDaysItogi.FieldByName('Fac').AsString;
   dmFacultetStatistic.adospSelDaysItogi.DisableControls;
   dmFacultetStatistic.adospSelDaysItogi.First;
   while not dmFacultetStatistic.adospSelDaysItogi.Eof do
   begin
      sh.cells[i,1]:=dmFacultetStatistic.adospSelDaysItogi.FieldByName('Dd_exam').AsString;
      sh.cells[i,2]:=dmFacultetStatistic.adospSelDaysItogi.FieldByName('Cname_grup').AsString;
      sh.cells[i,3]:=dmFacultetStatistic.adospSelDaysItogi.FieldByName('cName_disc').AsString;
      sh.cells[i,4]:=dmFacultetStatistic.adospSelDaysItogi.FieldByName('studCount').AsInteger;
      sh.cells[i,5]:=dmFacultetStatistic.adospSelDaysItogi.FieldByName('studCount').AsInteger-
                     dmFacultetStatistic.adospSelDaysItogi.FieldByName('dopCount').AsInteger;
      sh.cells[i,7]:=dmFacultetStatistic.adospSelDaysItogi.FieldByName('otlCount').AsInteger;
      sh.cells[i,8]:=dmFacultetStatistic.adospSelDaysItogi.FieldByName('horCount').AsInteger;
      sh.cells[i,9]:=dmFacultetStatistic.adospSelDaysItogi.FieldByName('udCount').AsInteger;
      sh.cells[i,10]:=dmFacultetStatistic.adospSelDaysItogi.FieldByName('neudCount').AsInteger;
      sh.cells[i,11]:=dmFacultetStatistic.adospSelDaysItogi.FieldByName('prepName').AsString;

      dmFacultetStatistic.adospSelDaysItogi.Next;
      inc(i);
   end;
   dec(i);
   sh.Range['F5:F'+intToStr(i)].formula:='=D5-E5-G5-H5-I5-J5';
   sh.Range['A3:A6'].ColumnWidth:=10;
   sh.Range['B3:F4'].ColumnWidth:=9;
   sh.Range['G3:J4'].ColumnWidth:=4;
   sh.Range['C3:C7'].ColumnWidth:=20;
   sh.Range['K3:K7'].ColumnWidth:=16;
   sh.Range['A5:K'+intToStr(i)].Borders.Weight:=2;
   sh.range['A1:K4'].HorizontalAlignment:=-4108;
   sh.range['D1:J'+inttostr(i)].HorizontalAlignment:=-4108;
   dmFacultetStatistic.adospSelDaysItogi.EnableControls;
   ExAppl.DisplayAlerts:= true;
   ExAppl.Visible:=true;
  except
    MessageBox(Handle, 'Произошла ошибка при экспорте данных в Excel.','ИС Деканат',MB_OK);
    dmFacultetStatistic.adospSelDaysItogi.EnableControls;
    ExAppl.Quit;
    ExAppl:= UnAssigned;
  end;
end;

procedure TfmFacultet.spYearChange(Sender: TObject);
begin
  inherited;
  if (spYear.Value > YearOf(Today)) then
    spYear.Value:= YearOf(Today);
  
end;

procedure TfmFacultet.SpeedButton2Click(Sender: TObject);
begin

  dmFacultetStatistic.adospSelKursItogiCol.Active := false;
  dmFacultetStatistic.adospSelKursItogiCol.Parameters.Clear;
  dmFacultetStatistic.adospSelKursItogiCol.Parameters.AddParameter;
  dmFacultetStatistic.adospSelKursItogiCol.Parameters[0].Value := TDBNodeFacultyObject(frmMain.DBDekTreeView_TEST1.SelectedObject).ik;
  dmFacultetStatistic.adospSelKursItogiCol.Parameters.AddParameter;
  dmFacultetStatistic.adospSelKursItogiCol.Parameters[1].Value := cbSemestr.ItemIndex;
  dmFacultetStatistic.adospSelKursItogiCol.Parameters.AddParameter;
  dmFacultetStatistic.adospSelKursItogiCol.Parameters[2].Value := spYear.Value;

  dmFacultetStatistic.adospSelKursItogiCol.Active := true;

end;

function OurDateToStr(date:TDateTime):string;
var s1:string;
begin
result:=DatetoStr(date);
s1:=result;
result[1]:=s1[4];
result[2]:=s1[5];
result[4]:=s1[1];
result[5]:=s1[2];

end;

function ChangeMonthDayPlaces(date:TDateTime):string;
var s1:string;
begin
result:=DatetoStr(date);
s1:=result;
result[1]:=s1[4];
result[2]:=s1[5];
result[4]:=s1[1];
result[5]:=s1[2];
end;


procedure TfmFacultet.OpenNaprList;
begin
  dmUspevaemost.adospGetAllNaprForFac.Close;
  with dmUspevaemost.adospGetAllNaprForFac.Parameters do
  begin
      Clear;
      CreateParameter('@Ik_fac', ftInteger, pdInput, 0,
          TDBNodeFacultyObject(frmMain.DBDekTreeView_TEST1.SelectedObject).ik);
      CreateParameter('@dD_vydano1', ftDateTime, pdInput, 0, (dbdtDateBegin.Value));
      CreateParameter('@dD_vydano2', ftDateTime, pdInput, 0, (dbdtDateEnd.Value));
  end;
  dmUspevaemost.adospGetAllNaprForFac.Open;
  
end;


procedure TfmFacultet.dbdtDateBeginChange(Sender: TObject);
begin
  if (dbdtDateBegin.Value>dbdtDateEnd.Value) then
  begin
     dbdtDateEnd.Value:=dbdtDateBegin.Value;
  end;
  OpenNaprList;
end;

procedure TfmFacultet.dbdtDateEndChange(Sender: TObject);
begin
  if (dbdtDateBegin.Value>dbdtDateEnd.Value) then
  begin
     dbdtDateBegin.Value:=dbdtDateEnd.Value;
  end;
  OpenNaprList;
end;

procedure TfmFacultet.dbdtExamChange(Sender: TObject);
begin
  inherited;
  try
  if (dbdtExam.Value<>dmFacultetStatistic.adospSelDaysItogi.Fields[0].Value) then
  begin
    dmFacultetStatistic.adospSelDaysItogi.Active := false;
    dmFacultetStatistic.adospSelDaysItogi.CommandText:='SELECT * from SelDaysItogiForfac('+inttostr(TDBNodeFacultyObject(frmMain.DBDekTreeView_TEST1.SelectedObject).ik)+', '''+DateToStr(dbdtExam.Value)+''')';
    try
      dmFacultetStatistic.adospSelDaysItogi.Active := true;
    except
      ShowMessage('Ошибка формирования отчёта по ежедневным итогам сессии. Проверьте данные о студентах.');
    end;
  end;
  except

  //dbdtExam.Value:=dmFacultetStatistic.adospSelDaysItogi.Fields[0].Value

  end;
end;

procedure TfmFacultet.dbgrdNaprTitleClick(Column: TColumnEh);
begin
  dmUspevaemost.adospGetAllNaprForFac.Sort:=
    Column.Field.DisplayName;
end;

end.
