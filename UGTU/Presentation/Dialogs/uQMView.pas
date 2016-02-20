unit uQMView;
   {#Author sofo@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, GridsEh, DBGridEh, ActnList, StdCtrls, Buttons, ExtCtrls,
  uQMController, ComObj, ADODB, DB, uQueryMaster, DBCtrls, Mask, DBCtrlsEh,
  ComCtrls, Menus, uMain, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, DBAxisGridsEh, System.Actions;

type
  TfrmQMView = class(TfrmBaseDialog)
    dbgEhResultQuery: TDBGridEh;
    Panel2: TPanel;
    dsResultDataSours: TDataSource;
    DBNavigator1: TDBNavigator;
    Panel3: TPanel;
    Label1: TLabel;
    eCountRecords: TDBEditEh;
    PanelProgressBar: TPanel;
    ProgressBar1: TProgressBar;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    SpeedButton1: TSpeedButton;
    procedure actOKExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbCloseClick(Sender: TObject);
    procedure dbgEhResultQueryTitleClick(Column: TColumnEh);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmQMView: TfrmQMView;

implementation

{$R *.dfm}

procedure TfrmQMView.actOKExecute(Sender: TObject);
var E:Variant;
    CountRow, CountCol : integer;
    i,j:integer;  
begin
  //inherited;
  try
  PanelProgressBar.Left:=round((frmQMView.Width-300)/2);
  PanelProgressBar.Visible:=true;
  E := CreateOleObject('Excel.Application');
  E.WorkBooks.Add();
  E.ActiveSheet.name:='Запрос';

  dbgEhResultQuery.DataSource.DataSet.DisableControls;
  
  CountRow:=dsResultDataSours.DataSet.RecordCount;
  CountCol:=dsResultDataSours.DataSet.FieldCount;

  ProgressBar1.Max:=CountRow;
                                            
  {for i:=1 to CountRow do
  begin
    E.Sheets[1].rows[i+1].RowHeight:=14;
  end; }

  E.ActiveSheet.rows[1].Font.Bold:=true;

  for i:=1 to CountCol do
  begin
    E.ActiveSheet.Columns[i].ColumnWidth:=16.43;
    E.ActiveSheet.cells[1,i]:=dsResultDataSours.DataSet.Fields[i-1].FieldName;
    E.ActiveSheet.Columns[i].NumberFormat:='@';
  end;

  dsResultDataSours.DataSet.First;
  for i:=1 to countrow do
  begin
    for j:=1 to countcol do
    begin
      E.ActiveSheet.cells[(i+1),j]:=dsResultDataSours.DataSet.Fields[j-1].AsString;
    end;
  dsResultDataSours.DataSet.Next;
  ProgressBar1.Position:=i;
  end;

  dsResultDataSours.DataSet.First;
  dbgEhResultQuery.DataSource.DataSet.EnableControls;

  finally
  E.Visible := true;
  PanelProgressBar.Visible:=false;
  end;
end;

procedure TfrmQMView.bbCloseClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmQMView.dbgEhResultQueryTitleClick(Column: TColumnEh);
begin
  (dsResultDataSours.DataSet as TCustomADODataSet).Sort:='['+Column.Field.FullName+']';
end;

procedure TfrmQMView.FormShow(Sender: TObject);
begin
  inherited;

  dsResultDataSours.DataSet:=frmQueryMaster.QueryController.ResultDataset;
  if dsResultDataSours.DataSet.FieldCount>6 then
    dbgEhResultQuery.AutoFitColWidths:=false;

  eCountRecords.Text:=IntToStr(dsResultDataSours.DataSet.RecordCount);
end;

end.
