unit ABIT_panel;
   {#Author sofo@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, Grids, StdCtrls, Mask, DBCtrlsEh, ComCtrls,
  Buttons, ToolWin, ActnList, ExtCtrls, OleServer, ExcelXP, ImgList, DateUtils;

type
  TFrmPanel = class(TfrmBaseDialog)
    ToolBar3: TToolBar;
    SpeedButton1: TSpeedButton;
    ToolButton8: TToolButton;
    Label3: TLabel;
    ToolButton9: TToolButton;
    days: TDBComboBoxEh;
    XLApp: TExcelApplication;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    stendO: TStringGrid;
    stendFBO: TStringGrid;
    ImageList1: TImageList;
    ToolButton1: TToolButton;
    Splitter1: TSplitter;
    procedure daysChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure WidthSet(sender:TStringGrid;size:real);
    procedure DelCols(n:integer);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ToExcel(Sender,Sender2:TStringGrid);
    procedure ToolButton1Click(Sender: TObject);
  private
    { Private declarations }
    Fyear: integer;
  public
   procedure StendGet(nday:integer);
   procedure stendCells();
   property year:integer read Fyear write Fyear;
    { Public declarations }
  end;

var
  FrmPanel: TFrmPanel;
  //year : integer;
implementation

uses AbiturientBaseProcs, AbiturientFacade, AbiturientNaborProcs,
  AbiturientAbitProcs, uDMAbiturientOtchety;

{$R *.dfm}

procedure TFrmPanel.stendCells();
var i:integer;
begin
 for i:=1 to stendO.rowCount-1 do
  begin
   //stendO.RowHeights[i]:=stendO.ColWidths[2];

  end;
 for i:=1 to stendFBO.rowCount-1 do
  begin
   //stendFBO.RowHeights[i]:=stendFBO.ColWidths[2];
  end;
end;

procedure TFrmPanel.WidthSet(sender:TStringGrid;size:real);
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

procedure TFrmPanel.StendGet(nday:integer);
var i,j,O,Z,n,dd,mm,nnrecord:integer;
    month:string;
    today,date_b:TDateTime;
begin    
 //получаем данные для стенда по году
  stendO.ColCount:=1;
  stendO.RowCount:=1;
  stendO.Cells[0,0]:='Специальность';
 //stendO.Cells[1,0]:='';stendO.Cells[1,1]:='';stendO.Cells[0,1]:='';

  stendFBO.ColCount:=1;
  stendFBO.RowCount:=1;
  stendFBO.Cells[0,0]:='Специальность';
 //stendFBO.Cells[1,0]:='';stendFBO.Cells[1,1]:='';stendFBO.Cells[0,1]:='';
                  
  
  if YearOf(Date)=year then
    today:=date
  else
    today:=StrToDate('01.09.'+IntToStr(year));
    
  date_b:=today-nday;

  dmAbiturientOtchety.adospSelStat.Active := false;
  dmAbiturientOtchety.adospSelStat.CommandText := 'select * from Abit_StatisticNew('
    + IntToStr(year)+','+IntToStr(6)+','''
    + IntToStr(YearOf(date_b)) +'-'+ IntToStr(dayOf(date_b))
    +'-'+ IntToStr(MonthOf(date_b)) +''','+IntToStr(nday)+')';
  ShowMessage(dmAbiturientOtchety.adospSelStat.CommandText);
  dmAbiturientOtchety.adospSelStat.Active := true;

  //левая часть
  //вывод специальностей
  dmAbiturientOtchety.adospSelStat.First;
  nnrecord:=dmAbiturientOtchety.adospSelStat.Fields.FieldByName('nnrecord').AsInteger;
  n:=1;
  dmAbiturientOtchety.adospSelStat.Next;     

  while (dmAbiturientOtchety.adospSelStat.Fields.FieldByName('nnrecord').AsInteger<>nnrecord) do
  begin
    dmAbiturientOtchety.adospSelStat.Next;
    n:=n+1;
  end;

  dmAbiturientOtchety.adospSelStat.First;   
  for i:=1 to n do
  begin
    if dmAbiturientOtchety.adospSelStat.Fields.FieldByName('CShort_name_fac').AsString<>'ФБО' then
     //заполняем очников
    begin
      stendO.rowCount:=stendO.rowCount+1;
      stendO.Cells[0,stendO.rowCount-1]:=dmAbiturientOtchety.adospSelStat.Fields.FieldByName('CShort_spec').AsString;
    end
    else
     //заполняем заочников
    begin
      stendFBO.rowCount:=stendFBO.rowCount+1;
      stendFBO.Cells[0,stendFBO.rowCount-1]:=dmAbiturientOtchety.adospSelStat.Fields.FieldByName('CShort_spec').AsString;
    end;
  dmAbiturientOtchety.adospSelStat.Next;
  end;

  //правая часть таблицы
  //расчет по месяцам

  dmAbiturientOtchety.adospSelStat.First;
  while not dmAbiturientOtchety.adospSelStat.Eof do
  begin
    for i := 1 to nday do
    begin 
    stendO.colCount:=stendO.colCount+1;
    stendFBO.colCount:=stendFBO.colCount+1;
    O:=1;Z:=1;        

    mm:=MonthOf(date_b);
    dd:=DayOf(date_b);
    
    case mm of
      1:  month:='января';
      2:  month:='февраля';
      3:  month:='марта';
      4:  month:='апреля';
      5:  month:='мая';
      6:  month:='июня';
      7:  month:='июля';
      8:  month:='августа';     
    end;
 
    date_b:=date_b+1;
    
      for j := 1 to n do             
      begin         
        if dmAbiturientOtchety.adospSelStat.Fields.FieldByName('CShort_name_fac').AsString<>'ФБО' then
      //заполняем очников
        begin
          stendO.Cells[stendO.colCount-1,0]:=inttostr(dd)+' '+month;
          stendO.Cells[stendO.colCount-1,O]:=
          inttostr(dmAbiturientOtchety.adospSelStat.Fields.FieldByName('1').AsInteger)+'('+
          inttostr(dmAbiturientOtchety.adospSelStat.Fields.FieldByName('2').AsInteger)+')';
          O:=O+1;
        end     
        else
      //заполняем заочников
        begin
          stendFBO.Cells[stendFBO.colCount-1,0]:=inttostr(dd)+' '+month;
          stendFBO.Cells[stendFBO.colCount-1,Z]:=
          inttostr(dmAbiturientOtchety.adospSelStat.Fields.FieldByName('1').AsInteger);
          Z:=Z+1;
        end;
      dmAbiturientOtchety.adospSelStat.Next;
      
      end;
    end;
      
  end;   
 
 WidthSet(StendO,StendO.Font.Size);
 WidthSet(StendFBO,StendFBO.Font.Size);
end;
procedure TFrmPanel.daysChange(Sender: TObject);
begin
 if days.ItemIndex=0 then  StendGet(30);
 if days.ItemIndex=1 then  StendGet(15);
 if days.ItemIndex=2 then  StendGet(7);
 if days.ItemIndex=3 then  StendGet(123);
end;

procedure TFrmPanel.FormResize(Sender: TObject);
begin
  GroupBox1.Height:=round((FrmPanel.Height-60)/2);
  GroupBox2.Height:=GroupBox1.Height;
end;

procedure TFrmPanel.DelCols(n:integer);
begin
 //надо как-то пролистать
end;

procedure TFrmPanel.ToExcel(Sender,Sender2:TStringGrid);
var
WorkBk : _WorkBook; //  определяем WorkBook
WorkSheet : _WorkSheet; //  определяем WorkSheet
I, J, R, C , R2, C2 : Integer;
TabGrid : Variant;
TabGrid2 : Variant;
begin
    R :=Sender.RowCount;
    C :=Sender.ColCount;
    TabGrid := VarArrayCreate([0,(R - 1),0,(C - 1)],VarOleStr);

    for i:=0 to r-1 do
     for j:=0 to c-1 do
      TabGrid[i,j]:=Sender.Cells[j,i];

    R2 :=Sender2.RowCount;
    C2 :=Sender2.ColCount;
    TabGrid2 := VarArrayCreate([0,(R2 - 1),0,(C2 - 1)],VarOleStr);

    for i:=0 to r2-1 do
     for j:=0 to c2-1 do
      TabGrid2[i,j]:=Sender2.Cells[j,i];


    XLApp.Connect; // Соединяемся с сервером TExcelApplication
    XLApp.WorkBooks.Add(xlWBatWorkSheet,0);  // Добавляем WorkBooks в ExcelApplication

    WorkBk := XLApp.WorkBooks.Item[1];  // Выбираем первую WorkBook
    WorkSheet := WorkBk.WorkSheets.Get_Item(1) as _WorkSheet; // Определяем первый WorkSheet

    Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Formula := TabGrid; // Сопоставляем Delphi массив-матрицу с матрицей в WorkSheet

    WorkSheet.Name := 'Динамика численности'; // Заполняем свойства WorkSheet
    WorkSheet.Columns.AutoFit;

    //заливка цветом нулевой строки и столбца
    Worksheet.Range['A1',Worksheet.Cells.Item[1,C]].Interior.ColorIndex:=15;
    Worksheet.Range['A1',Worksheet.Cells.Item[1,C]].Interior.Pattern:=xlSolid;
    Worksheet.Range['A1',Worksheet.Cells.Item[1,C]].Interior.PatternColorIndex:=xlAutomatic;

    Worksheet.Range['A1',Worksheet.Cells.Item[R,1]].Interior.ColorIndex:=15;
    Worksheet.Range['A1',Worksheet.Cells.Item[R,1]].Interior.Pattern:=xlSolid;
    Worksheet.Range['A1',Worksheet.Cells.Item[R,1]].Interior.PatternColorIndex:=xlAutomatic;

    //установить внутренние и внешние границы диапозона
    Worksheet.Range['A1',Worksheet.Cells.Item[R,1]].Borders[xlDiagonalDown].LineStyle:=xlNone;
    Worksheet.Range['A1',Worksheet.Cells.Item[R,1]].Borders[xlDiagonalUp].LineStyle:=xlNone;

    Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlEdgeLeft].LineStyle:=xlContinuous;
    Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlEdgeLeft].Weight:=xlThin;
    Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlEdgeLeft].ColorIndex:=xlAutomatic;

    Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlEdgeTop].LineStyle:=xlContinuous;
    Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlEdgeTop].Weight:=xlThin;
    Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlEdgeTop].ColorIndex:=xlAutomatic;

    Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlEdgeBottom].LineStyle:=xlContinuous;
    Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlEdgeBottom].Weight:=xlThin;
    Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlEdgeBottom].ColorIndex:=xlAutomatic;

    Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlEdgeRight].LineStyle:=xlContinuous;
    Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlEdgeRight].Weight:=xlThin;
    Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlEdgeRight].ColorIndex:=xlAutomatic;

    Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlInsideVertical].LineStyle:=xlContinuous;
    Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlInsideVertical].Weight:=xlThin;
    Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlInsideVertical].ColorIndex:=xlAutomatic;

    Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlInsideHorizontal].LineStyle:=xlContinuous;
    Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlInsideHorizontal].Weight:=xlThin;
    Worksheet.Range['A1',Worksheet.Cells.Item[R,C]].Borders[xlInsideHorizontal].ColorIndex:=xlAutomatic;
    //вторая книга

    XLApp.WorkBooks.Add(xlWBatWorkSheet,0);  // Добавляем WorkBooks в ExcelApplication

    WorkBk := XLApp.WorkBooks.Item[2];  // Выбираем первую WorkBook
    WorkSheet := WorkBk.WorkSheets.Get_Item(1) as _WorkSheet; // Определяем первый WorkSheet

    Worksheet.Range['A1',Worksheet.Cells.Item[R2,C2]].Formula := TabGrid2; // Сопоставляем Delphi массив-матрицу с матрицей в WorkSheet

    WorkSheet.Name := 'Динамика численности (ФБО)'; // Заполняем свойства WorkSheet
    WorkSheet.Columns.AutoFit;

    //заливка цветом нулевой строки и столбца
    Worksheet.Range['A1',Worksheet.Cells.Item[1,C2]].Interior.ColorIndex:=15;
    Worksheet.Range['A1',Worksheet.Cells.Item[1,C2]].Interior.Pattern:=xlSolid;
    Worksheet.Range['A1',Worksheet.Cells.Item[1,C2]].Interior.PatternColorIndex:=xlAutomatic;

    Worksheet.Range['A1',Worksheet.Cells.Item[R2,1]].Interior.ColorIndex:=15;
    Worksheet.Range['A1',Worksheet.Cells.Item[R2,1]].Interior.Pattern:=xlSolid;
    Worksheet.Range['A1',Worksheet.Cells.Item[R2,1]].Interior.PatternColorIndex:=xlAutomatic;

    //установить внутренние и внешние границы диапозона
    Worksheet.Range['A1',Worksheet.Cells.Item[R2,1]].Borders[xlDiagonalDown].LineStyle:=xlNone;
    Worksheet.Range['A1',Worksheet.Cells.Item[R2,1]].Borders[xlDiagonalUp].LineStyle:=xlNone;

    Worksheet.Range['A1',Worksheet.Cells.Item[R2,C2]].Borders[xlEdgeLeft].LineStyle:=xlContinuous;
    Worksheet.Range['A1',Worksheet.Cells.Item[R2,C2]].Borders[xlEdgeLeft].Weight:=xlThin;
    Worksheet.Range['A1',Worksheet.Cells.Item[R2,C2]].Borders[xlEdgeLeft].ColorIndex:=xlAutomatic;

    Worksheet.Range['A1',Worksheet.Cells.Item[R2,C2]].Borders[xlEdgeTop].LineStyle:=xlContinuous;
    Worksheet.Range['A1',Worksheet.Cells.Item[R2,C2]].Borders[xlEdgeTop].Weight:=xlThin;
    Worksheet.Range['A1',Worksheet.Cells.Item[R2,C2]].Borders[xlEdgeTop].ColorIndex:=xlAutomatic;

    Worksheet.Range['A1',Worksheet.Cells.Item[R2,C2]].Borders[xlEdgeBottom].LineStyle:=xlContinuous;
    Worksheet.Range['A1',Worksheet.Cells.Item[R2,C2]].Borders[xlEdgeBottom].Weight:=xlThin;
    Worksheet.Range['A1',Worksheet.Cells.Item[R2,C2]].Borders[xlEdgeBottom].ColorIndex:=xlAutomatic;

    Worksheet.Range['A1',Worksheet.Cells.Item[R2,C2]].Borders[xlEdgeRight].LineStyle:=xlContinuous;
    Worksheet.Range['A1',Worksheet.Cells.Item[R2,C2]].Borders[xlEdgeRight].Weight:=xlThin;
    Worksheet.Range['A1',Worksheet.Cells.Item[R2,C2]].Borders[xlEdgeRight].ColorIndex:=xlAutomatic;

    Worksheet.Range['A1',Worksheet.Cells.Item[R2,C2]].Borders[xlInsideVertical].LineStyle:=xlContinuous;
    Worksheet.Range['A1',Worksheet.Cells.Item[R2,C2]].Borders[xlInsideVertical].Weight:=xlThin;
    Worksheet.Range['A1',Worksheet.Cells.Item[R2,C2]].Borders[xlInsideVertical].ColorIndex:=xlAutomatic;

    Worksheet.Range['A1',Worksheet.Cells.Item[R2,C2]].Borders[xlInsideHorizontal].LineStyle:=xlContinuous;
    Worksheet.Range['A1',Worksheet.Cells.Item[R2,C2]].Borders[xlInsideHorizontal].Weight:=xlThin;
    Worksheet.Range['A1',Worksheet.Cells.Item[R2,C2]].Borders[xlInsideHorizontal].ColorIndex:=xlAutomatic;

    XLApp.Visible[0] := True; // Показываем Excel
    XLApp.Disconnect; // Разрываем связь с сервером
    TabGrid := Unassigned; // Unassign the Delphi Variant Matrix
end;
procedure TFrmPanel.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  ToExcel(stendO,stendFBO);
end;

procedure TFrmPanel.ToolButton1Click(Sender: TObject);
begin
  inherited;
  ToExcel(stendO,stendFBO);
end;

end.
