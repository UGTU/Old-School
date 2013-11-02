unit uAbitDinamica;
    {#Author tanyav@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseFrame, ComCtrls, StdCtrls, Buttons, ExtCtrls, ToolWin,
  Grids, DbUtilsEh, DBGridEh,ADODB, DB, DBCtrls, OleServer, WordXP, ExcelXP,
  ImgList, Mask, DBCtrlsEh, Menus, TeEngine, Series, TeeProcs, Chart,
  DBLookupEh;
type
  TfmABITDinamica = class(TfmBase)
    Panel8: TPanel;
    Chart1: TChart;
    Series2: TBarSeries;
    Series3: TBarSeries;
    Series4: TBarSeries;
    Series5: TBarSeries;
    Chart2: TChart;
    Series6: TBarSeries;
    Series7: TBarSeries;
    Chart3: TChart;
    Series8: TLineSeries;
    Chart4: TChart;
    Series9: TBarSeries;
    Series10: TBarSeries;
    Chart5: TChart;
    Series11: TLineSeries;
    Chart6: TChart;
    Series12: TLineSeries;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    Grafic: TDBComboBoxEh;
    SpeedButton1: TSpeedButton;
    Series13: TBarSeries;
    ToolButton1: TToolButton;
    Series14: TBarSeries;
    Series1: TBarSeries;
    Last: TDBComboBoxEh;
    ToolButton3: TToolButton;
    Series15: TBarSeries;
    procedure FrameResize(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure LastChange(Sender: TObject);
    procedure GraficChange(Sender: TObject);
  private
    { Private declarations }
  public
    p1,p2,p3,p4,p5,p6:integer;
    { Public declarations }
    constructor Create();
    procedure DoRefreshFrame; override;
    procedure ExecProcs();
  end;

var
  fmABITDinamica: TfmABITDinamica;
  nomer_graf:integer;

implementation

uses ABIT_add_nabor_dialog, AbiturientFacade,AbiturientNaborProcs,
  ABIT_select_stat_year;

{$R *.dfm}

{ TfmBase1 }

constructor TfmABITDinamica.Create;
begin

end;

procedure TfmABITDinamica.ExecProcs();
begin
 series1.Clear;series2.Clear;series3.Clear;series4.Clear;series5.Clear;series6.Clear;
 series7.Clear;series8.Clear;series9.Clear;series10.Clear;series11.Clear;series12.Clear;
 series13.Clear;  series14.Clear; series15.Clear;
  //получаем данные для рисования динамики
 (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamicaProc]).Open;
 (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamicaProc]).First;
 while not (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamicaProc]).Eof do
  begin
    Series15.AddXY((TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamicaProc]).Fields[0].AsInteger,(TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamicaProc]).Fields[7].asinteger);
    Series14.AddXY((TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamicaProc]).Fields[0].AsInteger,(TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamicaProc]).Fields[1].asinteger);
    Series1.AddXY((TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamicaProc]).Fields[0].AsInteger,(TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamicaProc]).Fields[2].asinteger);
    Series2.AddXY((TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamicaProc]).Fields[0].AsInteger,(TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamicaProc]).Fields[3].asinteger);
    Series3.AddXY((TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamicaProc]).Fields[0].AsInteger,(TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamicaProc]).Fields[5].asinteger);
    Series4.AddXY((TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamicaProc]).Fields[0].AsInteger,(TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamicaProc]).Fields[4].asinteger);
    Series5.AddXY((TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamicaProc]).Fields[0].AsInteger,(TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamicaProc]).Fields[6].asinteger);
    (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamicaProc]).Next;
  end;
 //пол
 (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_OnSexProc]).Open;
 (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_OnSexProc]).First;
 while not (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_OnSexProc]).Eof do
  begin
      Series6.AddXY((TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_OnSexProc]).Fields[0].AsInteger,(TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_OnSexProc]).Fields[1].asinteger);
      Series7.AddXY((TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_OnSexProc]).Fields[0].AsInteger,(TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_OnSexProc]).Fields[2].asinteger);
    (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_OnSexProc]).Next;
  end;
 //ФДП
 {(TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_OnFDPProc]).Open;
 (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_OnFDPProc]).First;
 while not (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_OnFDPProc]).Eof do
  begin
      Series8.AddXY((TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_OnFDPProc]).Fields[0].AsInteger,(TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_OnFDPProc]).Fields[1].asinteger);
     (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_OnFDPProc]).Next;
  end;   }
 //медаль
 (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_onMedalProc]).Open;
 (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_onMedalProc]).First;
 while not (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_onMedalProc]).Eof do
  begin
      Series9.AddXY((TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_onMedalProc]).Fields[0].AsInteger,(TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_onMedalProc]).Fields[1].asinteger);
      Series10.AddXY((TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_onMedalProc]).Fields[0].AsInteger,(TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_onMedalProc]).Fields[2].asinteger);
      Series13.AddXY((TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_onMedalProc]).Fields[0].AsInteger,(TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_onMedalProc]).Fields[3].asinteger);

     (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_onMedalProc]).Next;
  end;
 //заявление
 {(TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_onZayavlProc]).Open;
 (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_onZayavlProc]).First;
 while not (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_onZayavlProc]).Eof do
  begin
      Series11.AddXY((TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_onZayavlProc]).Fields[0].AsInteger,(TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_onZayavlProc]).Fields[1].asinteger);
     (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_onZayavlProc]).Next;
  end;  }
 //Общежитие
 {(TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamicaOnLobProc]).Open;
 (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamicaOnLobProc]).First;
 while not (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamicaOnLobProc]).Eof do
  begin
      Series12.AddXY((TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamicaOnLobProc]).Fields[0].AsInteger,(TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamicaOnLobProc]).Fields[1].asinteger);
     (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamicaOnLobProc]).Next;
  end;  }
end;

procedure TfmABITDinamica.DoRefreshFrame;
begin
  last.ItemIndex:=4;
  Grafic.ItemIndex:=0;
  pnlSave.Visible:=false;
  Chart1.Visible:=true;
  nomer_graf:=1;
//  TAbiturientFacade.Instance:=TAbiturientFacade.Create(self);

// (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamicaProc] as TAbitDinamicaProc).getdata();

 //(TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_OnSexProc] as TAbitDinamica_OnSexProc).getdata();

 //(TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_OnFDPProc] as TAbitDinamica_OnFDPProc).getdata();

 //(TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_OnMedalProc] as TAbitDinamica_onMedalProc).getdata();

 //(TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_onZayavlProc] as TAbitDinamica_onZayavlProc).getdata();

 //(TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamicaOnLobProc] as TAbitDinamicaOnLobProc).getdata();

 ExecProcs();
end;

procedure TfmABITDinamica.FrameResize(Sender: TObject);
begin
  inherited;
  Chart1.Left := 0;
  Chart1.Top := 0;
  Chart1.Width := round(panel1.Width/3);
  Chart1.Height := round((panel1.Height)/2);

  Chart2.Top := 0;
  Chart2.Width := Chart1.Width;
  Chart2.Height := Chart1.Height;
  Chart2.Left := Chart1.Left + Chart1.Width;

  Chart4.Top := 0;
  Chart3.Width := Chart1.Width;
  Chart3.Height := Chart1.Height;
  Chart4.Left := Chart2.Left + Chart1.Width;

  Chart3.Left := 0;
  Chart4.Width := Chart1.Width;
  Chart4.Height := Chart1.Height;
  Chart3.Top := Chart1.Height;

  Chart5.Width := Chart1.Width;
  Chart5.Height := Chart1.Height;
  Chart5.Top := Chart1.Height;
  Chart5.Left := Chart3.Left + Chart1.Width;

  Chart6.Width := Chart1.Width;
  Chart6.Height := Chart1.Height;
  Chart6.Top := Chart1.Height;
  Chart6.Left := Chart5.Left + Chart1.Width;
end;

procedure TfmABITDinamica.GraficChange(Sender: TObject);
begin
  Chart1.Visible:=false;
  Chart2.Visible:=false;
  Chart3.Visible:=false;
  Chart4.Visible:=false;
  Chart5.Visible:=false;
  Chart6.Visible:=false;

  case Grafic.ItemIndex of
  0: Chart1.Visible:=true;
  1: Chart2.Visible:=true;
  2: Chart4.Visible:=true;
  end;


end;

procedure TfmABITDinamica.ToolButton1Click(Sender: TObject);
begin
  Chart1.Visible:=false;
  Chart2.Visible:=false;
  Chart3.Visible:=false;
  Chart4.Visible:=false;
  Chart5.Visible:=false;
  Chart6.Visible:=false;
  if nomer_graf=3 then nomer_graf:=1
    else nomer_graf:=nomer_graf+1;

  case nomer_graf of
  1: Chart1.Visible:=true;
  2: Chart2.Visible:=true;
  3: Chart4.Visible:=true;
  end;
end;

procedure TfmABITDinamica.LastChange(Sender: TObject);
var Year,n:integer;
begin
 n:=3;
 if last.ItemIndex<6 then
 begin
  if last.ItemIndex=0 then n:=19;
  if last.ItemIndex=1 then n:=14;
  if last.ItemIndex=2 then n:=9;
  if last.ItemIndex=3 then n:=4;
  if last.ItemIndex=4 then n:=2;
  if last.ItemIndex=5 then n:=99;

  Year:=strtoint(copy(datetimetostr(NOW()),7,4));
  Year:=Year-n;

 (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamicaProc]).Filtered:=false;
 (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamicaProc]).Filter:='nnyear>='+quotedstr(inttostr(Year))+' and nnyear<='+quotedstr(inttostr(Year+n));
 (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamicaProc]).Filtered:=true;

 (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_OnSexProc]).Filtered:=false;
 (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_OnSexProc]).Filter:='nnyear>='+quotedstr(inttostr(Year))+' and nnyear<='+quotedstr(inttostr(Year+n));
 (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_OnSexProc]).Filtered:=true;

 (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_OnFDPProc]).Filtered:=false;
 (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_OnFDPProc]).Filter:='nnyear>='+quotedstr(inttostr(Year))+' and nnyear<='+quotedstr(inttostr(Year+n));
 (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_OnFDPProc]).Filtered:=true;

 (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_OnMedalProc]).Filtered:=false;
 (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_OnMedalProc]).Filter:='nnyear>='+quotedstr(inttostr(Year))+' and nnyear<='+quotedstr(inttostr(Year+n));
 (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_OnMedalProc]).Filtered:=true;

 (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_onZayavlProc]).Filtered:=false;
 (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_onZayavlProc]).Filter:='nnyear>='+quotedstr(inttostr(Year))+' and nnyear<='+quotedstr(inttostr(Year+n));
 (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamica_onZayavlProc]).Filtered:=true;

 (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamicaOnLobProc]).Filtered:=false;
 (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamicaOnLobProc]).Filter:='nnyear>='+quotedstr(inttostr(Year))+' and nnyear<='+quotedstr(inttostr(Year+n));
 (TAbiturientFacade.Instance.ProcList.DataSetByClassType[TAbitDinamicaOnLobProc]).Filtered:=true;
 ExecProcs();
 end;
end;

procedure TfmABITDinamica.SpeedButton1Click(Sender: TObject);
begin
 viborstat:=TviborStat.Create(self);
 viborstat.bbApply.visible:=false;
 viborstat.bbsprav.Visible:=false;
 viborstat.bbok.Enabled:=false;
 ABIT_select_stat_year.viborstat.ShowModal;

 if p1=1 then Chart1.Print;
 if p2=1 then Chart2.Print;
 if p3=1 then Chart3.Print;
 if p4=1 then Chart4.Print;
 if p5=1 then Chart5.Print;
 if p6=1 then Chart6.Print;
end;

end.
