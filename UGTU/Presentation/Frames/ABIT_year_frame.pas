unit ABIT_year_frame;
  {#Author tanyav@ist.ugtu.net}
interface        

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseFrame, Buttons, ToolWin,
  ComCtrls, StdCtrls, ExtCtrls,DateUtils, DBGridEh, Mask, DBCtrlsEh, DBLookupEh,
  VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs,
  VCLTee.Chart, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  Data.DB, Data.Win.ADODB, GridsEh, DBAxisGridsEh, UDM, System.Actions,
  Vcl.ActnList;

type
  TfmAbitYears = class(TfmBase)
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Chart2: TChart;
    LineSeries1: TLineSeries;
    LineSeries2: TLineSeries;
    LineSeries3: TLineSeries;
    PageControl1: TPageControl;
    statPage: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton2: TToolButton;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    ToolButton1: TToolButton;
    dbcbIDReport: TDBLookupComboboxEh;
    cmbxUspSem: TDBComboBoxEh;
    SpeedButton3: TSpeedButton;
    KatDocPage: TTabSheet;
    dbgrKatZach: TDBGridEh;
    adoKatZach: TADOQuery;
    dsKatZach: TDataSource;
    adoKatZachCname_kat_zach: TStringField;
    Label1: TLabel;
    dbgrDocs: TDBGridEh;
    adoKatZachCType_kat: TStringField;
    dsDocuments: TDataSource;
    adoKatZachIk_kat_zach: TAutoIncField;
    adoDocuments: TADODataSet;
    adoDocumentsik_vid_doc: TIntegerField;
    adoDocumentscvid_doc: TStringField;
    adoDocumentsIk_kat_zach: TIntegerField;
    adoDocumentsik_kat_doc: TIntegerField;
    adoDocumentsisIncluded: TBooleanField;
    ActionList1: TActionList;
    actApply: TAction;
    actUndo: TAction;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure dbcbIDReportChange(Sender: TObject);
    procedure cmbxUspSemChange(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure dbgrKatZachCellClick(Column: TColumnEh);
    procedure dbgrDocsColumns4UpdateData(Sender: TObject; var Text: string;
      var Value: Variant; var UseText, Handled: Boolean);
    procedure actApplyExecute(Sender: TObject);
    procedure actUndoExecute(Sender: TObject);
  private
    { Private declarations }
    Year: integer;
    procedure SetDocFilter;
  protected
    function DoApply: Boolean; override;
    function DoCancel: Boolean;
  public
    procedure DoRefreshFrame; override;
    procedure GrafPaint;
    { Public declarations }
  end;

var
  fmAbitYears: TfmAbitYears;
  idreport:integer=6;
  bit:integer=0; //параметр отображения графика

implementation

uses DBTVABITYearObj, AbiturientNaborProcs, AbiturientFacade,
  AbiturientBaseProcs, ABIT_add_nabor_dialog, AbiturientAbitProcs,
  AbiturientExamProcs,DBTVRecruitobj,DBTVFacRecobj,DBTVspecRecobj,ABIT_select_stat_ALL,
  ABIT_nabor_frame, ABIT_panel, ABIT_add_rasp_dialog, AbiturientAbitTables,
  uDMAbiturientOtchety, uMain, CommandController;
{$R *.dfm}

procedure TfmAbitYears.actApplyExecute(Sender: TObject);
begin
  inherited;
  DoApply;
end;

procedure TfmAbitYears.actUndoExecute(Sender: TObject);
begin
  inherited;
  DoCancel;
end;

procedure TfmAbitYears.cmbxUspSemChange(Sender: TObject);
begin
  if cmbxUspSem.Value<>bit then
  begin
    if cmbxUspSem.Text<>'' then
    begin
      bit:= cmbxUspSem.Value;
      if not SpeedButton3.Visible then GrafPaint;
    end;
  end;              
end;

procedure TfmAbitYears.dbcbIDReportChange(Sender: TObject);
begin
  if dbcbIDReport.Value<>idreport then
  begin
    if dbcbIDReport.Text<>'' then
    begin
      idreport:= dbcbIDReport.KeyValue;
      if not SpeedButton3.Visible then GrafPaint;
    end;
  end;
end;

procedure TfmAbitYears.dbgrKatZachCellClick(Column: TColumnEh);
begin
  SetDocFilter;
end;


procedure TfmAbitYears.dbgrDocsColumns4UpdateData(Sender: TObject;
  var Text: string; var Value: Variant; var UseText, Handled: Boolean);
begin
  Modified := true;
  bbSave.enabled := true;
  bbUndo.enabled := true;
end;

function TfmAbitYears.DoApply: Boolean;
var
  I: Integer;
  FKatZachCommand: TManageKatZachDocs;
begin
  dbgrDocs.DataSource := nil;
  adoDocuments.Filtered := false;
  adoDocuments.First;
  FKatZachCommand := TManageKatZachDocs.Create(year);
  for I := 0 to adoDocuments.RecordCount - 1 do
  with adoDocuments do
  begin
    if (FieldByName('ik_kat_doc').Value = NULL)
      and (FieldByName('isIncluded').Value) then
         FKatZachCommand.AddDoc(FieldByName('Ik_kat_zach').Value, FieldByName('ik_vid_doc').Value);
    if (FieldByName('ik_kat_doc').Value <> NULL)
      and (not FieldByName('isIncluded').Value) then
         FKatZachCommand.DeleteDoc(FieldByName('Ik_kat_zach').Value, FieldByName('ik_vid_doc').Value);
    Next;
  end;
  FKatZachCommand.Free;
  adoDocuments.Filtered := true;
  dbgrDocs.DataSource := dsDocuments;

  modified := false;
  bbSave.enabled := false;
  bbUndo.enabled := false;
end;

function TfmAbitYears.DoCancel: Boolean;
begin
  DoRefreshFrame;
  result := true;
end;

procedure TfmAbitYears.doRefreshFrame;
begin
  year:=TDBNodeAbitYearObject(FrameObject).ik;
  if dbcbIDReport.Value=null then
  begin
    DMAbiturientOtchety.adodsAbitReport.Active:=true;
    dbcbIDReport.Value:=idreport;
    cmbxUspSem.ItemIndex:=0;
    Series1.AddXY(date,0);
    if not SpeedButton3.Visible then GrafPaint;
  end;
  adoKatZach.Close;
  adoDocuments.Close;
  adoKatZach.SQL[3] := 'or year(OutDate)>=' + IntTosTR(year);
  adoDocuments.Parameters.ParamByName('@year').Value := year;

  adoKatZach.Open;
  adoDocuments.Open;

  if (adoKatZach.RecordCount > 0)and(dbgrDocs.SelectedRows.Count = 0)
    then adoKatZach.First;
  SetDocFilter;

  modified := false;
  bbSave.enabled := false;
  bbUndo.enabled := false;

end;

procedure TfmAbitYears.GrafPaint;
var All,O,Z,max,DayA,DayO,DayZ:integer;
   ddate:string;
   day_b,day_e,dd:Tdatetime;
   //count:integer;
begin
   //bit:=0;     //0 - количество поданных и забранных заявлений
               //1 - общий конкурс, контракт, цкп
	 //count:=0;

	 Series1.Clear;
	 Series2.Clear;
	 Series3.Clear;

   lineSeries1.Clear;
	 lineSeries2.Clear;
	 lineSeries3.Clear;

	 Z:=0;All:=0;O:=0;max:=3;
   //если год текущий, то выполняем до текущего месяца
	 //иначе - до августа
	 if YearOf(Date)=year then
      begin
      day_b:= strtodatetime('01.03.'+inttostr(year));
      day_e:= date;
      if day_e>strtodatetime('31.08.'+inttostr(year)) then
         day_e:=strtodatetime('31.08.'+inttostr(year))
      end
   else
      begin
      day_b:= strtodatetime('01.03.'+inttostr(year));
      day_e:= strtodatetime('31.08.'+inttostr(year));
      end;

   //до начала приема абитуриентов (вывод даты: только 1 мая каждого года)
   if YearOf(Date)<year then
      begin
      day_b:= strtodatetime('01.03.'+inttostr(year));
      day_e:=day_b-1;
      //if day_e>strtodatetime('31.08.'+inttostr(year)) then
      //   day_e:=strtodatetime('31.08.'+inttostr(year))
      end;

   (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitYearDataProcVF]
          as TAbitYearDataProcVF).GetData(day_b,day_e,idreport,bit,year);
   if bit=0 then
   begin
   (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitYearDataProcVF]).Open;
   (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitYearDataProcVF]).First;
   while not  (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitYearDataProcVF]).Eof do
    begin
     DayA:=(TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitYearDataProcVF]).Fields.FieldByName('abit').AsInteger;
     DayO:=(TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitYearDataProcVF]).Fields.FieldByName('3').AsInteger;
     DayZ:=(TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitYearDataProcVF]).Fields.FieldByName('abit_zd').AsInteger;
     dd:=(TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitYearDataProcVF]).Fields.FieldByName('day').AsDateTime;

     All:=All+DayA;
		 Z:=Z+DayZ;
     O:=O+DayO;

     ddate:=copy(datetimetostr(dd),1,10);

     series1.AddXY(strtodatetime(ddate),O);   //цкп
	   series2.AddXY(strtodatetime(ddate),Z);   //контракт
	   series3.AddXY(strtodatetime(ddate),All); //общий конкурс

     lineseries1.AddXY(strtodatetime(ddate),DayO);
     lineseries2.AddXY(strtodatetime(ddate),DayZ);
     lineseries3.AddXY(strtodatetime(ddate),DayA);

     (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitYearDataProcVF]).Next;

     if all>max-3 then
        max:=all+3;
     if z>max-3 then
        max:=z+3;
     if o>max-3 then
        max:=o+3;

     lineseries1.Title:='ЦКП';
     lineseries2.Title:='Контракт';
     lineseries3.Title:='Общий конкурс';

    end;
   end
   else
   begin
   (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitYearDataProcVF]).Open;
   (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitYearDataProcVF]).First;
   while not  (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitYearDataProcVF]).Eof do
    begin
     DayA:=(TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitYearDataProcVF]).Fields.FieldByName('abit').AsInteger;
     DayZ:=(TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitYearDataProcVF]).Fields.FieldByName('abit_zd').AsInteger;
     DayO:=DayA-DayZ;
     dd:=(TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitYearDataProcVF]).Fields.FieldByName('day').AsDateTime;

     All:=All+DayA;
		 Z:=Z+DayZ;
     O:=O+DayO;

     ddate:=copy(datetimetostr(dd),1,10);

     series1.AddXY(strtodatetime(ddate),ALL);   //всего заявлений
	   series2.AddXY(strtodatetime(ddate),Z);     //забрали
	   series3.AddXY(strtodatetime(ddate),O);     //действительные

     //lineseries1.AddXY(strtodatetime(ddate),DayO);
     lineseries2.AddXY(strtodatetime(ddate),DayZ);
     lineseries3.AddXY(strtodatetime(ddate),DayA);

     (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitYearDataProcVF]).Next;

     if all>max-3 then
        max:=all+3;

     lineseries1.Title:='Подано заявлений';
     lineseries2.Title:='Забрали документы';
     lineseries3.Title:='Действительных заявлений';

    end;
   end;
   if max<25 then max:=25;
   Chart1.LeftAxis.Maximum:=max;//All+1;
end;



procedure TfmAbitYears.SetDocFilter;
begin
  if (adoKatZach.RecordCount > 0) then
  begin
    adoDocuments.Filtered := false;
    adoDocuments.Filter := 'Ik_kat_zach = ' + adoKatZach.FieldByName('Ik_kat_zach').AsString;
    adoDocuments.Filtered := true;
  end;
end;

procedure TfmAbitYears.SpeedButton1Click(Sender: TObject);
begin
 ABIT_select_stat_ALL.frmBaseDialog1.createframe();
 frmBaseDialog1.ShowModal;
 frmBaseDialog1.Free;
end;

procedure TfmAbitYears.SpeedButton2Click(Sender: TObject);
begin

  frmpanel:=TFrmPanel.Create(self);
  frmpanel.year:=TDBNodeAbitYearObject(FrameObject).ik;
  frmpanel.StendGet(7);
  frmpanel.Showmodal;
  FrmPanel.Free;   

end;

procedure TfmAbitYears.SpeedButton3Click(Sender: TObject);
begin
  GrafPaint;
  Chart2.Legend.Visible:=true;
  SpeedButton3.Visible:=false;
end;

end.
