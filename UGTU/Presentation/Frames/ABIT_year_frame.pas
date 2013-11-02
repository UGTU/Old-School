unit ABIT_year_frame;
  {#Author tanyav@ist.ugtu.net}
interface        

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseFrame, Buttons, TeEngine, Series, TeeProcs, Chart, ToolWin,
  ComCtrls, StdCtrls, ExtCtrls,DateUtils, DBGridEh, Mask, DBCtrlsEh, DBLookupEh;

type
  TfmAbitYears = class(TfmBase)
    ToolBar1: TToolBar;
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Series3: TLineSeries;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ToolButton1: TToolButton;
    dbcbIDReport: TDBLookupComboboxEh;
    cmbxUspSem: TDBComboBoxEh;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    SpeedButton3: TSpeedButton;
    Chart2: TChart;
    LineSeries1: TLineSeries;
    LineSeries2: TLineSeries;
    LineSeries3: TLineSeries;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure dbcbIDReportChange(Sender: TObject);
    procedure cmbxUspSemChange(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
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

uses DBTVABITYearObj ,ToolCtrlsEh, AbiturientNaborProcs, AbiturientFacade,
  AbiturientBaseProcs, ABIT_add_nabor_dialog, AbiturientAbitProcs,
  AbiturientExamProcs,DBTVRecruitobj,DBTVFacRecobj,DBTVspecRecobj,ABIT_select_stat_ALL,
  ABIT_nabor_frame, ABIT_panel, ABIT_add_rasp_dialog, AbiturientAbitTables, uDMAbiturientOtchety, uMain;
{$R *.dfm}


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

procedure TfmAbitYears.doRefreshFrame;
begin
   if dbcbIDReport.Value=null then
   begin
     DMAbiturientOtchety.adodsAbitReport.Active:=true;
     dbcbIDReport.Value:=idreport;
     cmbxUspSem.ItemIndex:=0;
     Series1.AddXY(date,0);
     if not SpeedButton3.Visible then GrafPaint;
   end;
end;

procedure TfmAbitYears.GrafPaint;
var year,All,O,Z,max,DayA,DayO,DayZ:integer;
   ddate:string;
   day_b,day_e,dd:Tdatetime;
   //count:integer;
begin
   //bit:=0;     //0 - количество поданных и забранных заявлений
               //1 - общий конкурс, контракт, цкп
	 //count:=0;
	 year:=TDBNodeAbitYearObject(FrameObject).ik;
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
