unit uQueryMaster;
{#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, GR32_Image, GR32,
  GR32_Layers, GR32_Polygons,uQMController,uVisualDBObjectsForQM, uQMDatamodule, DBGridEh, DB,
  Mask, DBCtrlsEh, DBLookupEh, Menus, Spin, GridsEh, ComCtrls, ImgList;

 type TSmallNodeObject = class
  public
  DBId:integer;
  DBParentId:integer;
  DBType:string;
 end;


 type
  TfrmQueryMaster = class(TfrmBaseDialog)
    Panel2: TPanel;
    Panel3: TPanel;
    dbcbeQMTables: TDBLookupComboboxEh;
    dsQMTables: TDataSource;
    Memo1: TMemo;
    Button3: TButton;
    pnlFieldFilter: TPanel;
    eValue1: TDBEditEh;
    eCommand: TDBComboBoxEh;
    Label1: TLabel;
    eValue2: TDBEditEh;
    Label2: TLabel;
    Label3: TLabel;
    FilterMemo: TMemo;
    SpeedButton1: TSpeedButton;
    ActAddEntity: TAction;
    actDeleteEntity: TAction;
    actBuildQuery: TAction;
    actAddFilter: TAction;
    actDeleteLastFilter: TAction;
    SpeedButton2: TSpeedButton;
    QMPopup: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    rbAll: TRadioButton;
    rbAverage: TRadioButton;
    cbOrder: TCheckBox;
    actSort: TAction;
    N3: TMenuItem;
    N4: TMenuItem;
    OK1: TMenuItem;
    ScrollBox1: TScrollBox;
    imQuery: TImage32;
    pnlFilters: TPanel;
    Label4: TLabel;
    lbFilters: TListBox;
    actDelFilter: TAction;
    SpeedButton5: TSpeedButton;
    dsEntities: TDataSource;
    dsFields: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    dbgeFields: TDBGridEh;
    TabSheet2: TTabSheet;
    dbgeEntities: TDBGridEh;
    tvFields: TTreeView;
    ilTV: TImageList;
    ppmFilters: TPopupMenu;
    N5: TMenuItem;
    rbMin: TRadioButton;
    rbMax: TRadioButton;
    ppmTV: TPopupMenu;
    Cd1: TMenuItem;
    N6: TMenuItem;
    Label5: TLabel;
    bSaveQuery: TBitBtn;
    sdSaveQuery: TSaveDialog;
    bLoadQuery: TBitBtn;
    odLoadQuery: TOpenDialog;
    cbGroupBy: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure dbcbeQMTablesChange(Sender: TObject);
   
    procedure imQueryMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure actDeleteEntityExecute(Sender: TObject);
    procedure actBuildQueryExecute(Sender: TObject);
    procedure actAddFilterExecute(Sender: TObject);
    procedure eCommandChange(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbOrderClick(Sender: TObject);
    procedure actSortExecute(Sender: TObject);
    procedure actDeleteFilterExecute(Sender: TObject);
    procedure QMPopupPopup(Sender: TObject);
    procedure ScrollBox1Resize(Sender: TObject);
    procedure pnlFiltersMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lbFiltersClick(Sender: TObject);
    procedure actDelFilterExecute(Sender: TObject);
    procedure ActAddEntityExecute(Sender: TObject);
    procedure tvFieldsDblClick(Sender: TObject);
    procedure actDelFilterUpdate(Sender: TObject);
    procedure actDeleteLastFilterUpdate(Sender: TObject);
    procedure rbAllClick(Sender: TObject);
    procedure Cd1Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure actOKUpdate(Sender: TObject);
    procedure bSaveQueryClick(Sender: TObject);
    procedure bLoadQueryClick(Sender: TObject);
  private
   procedure FillTVFields;
    { Private declarations }
  public
    { Public declarations }
    QueryController: TQMQueryController;

    function ActiveEntity: TVDBEntity;
    function ActiveField: TVDBItem;
    function TranslateCommand(ruscommand:string):string;
    procedure RefreshFilterMemo;
    procedure RefreshFilter;
    procedure RefreshFiltersListBox;

    constructor Create(AOwner: TComponent); override;
  end;

var
  frmQueryMaster: TfrmQueryMaster;



implementation

{$R *.dfm}

uses uMain, uQMView, uQMAddEntity;
{ TBlock }


{ TfrmQueryMaster }

procedure TfrmQueryMaster.ActAddEntityExecute(Sender: TObject);
var
  SearchOptions: TLocateOptions;
  ik:integer;
begin
if tvFields.Selected=nil then exit;

  SearchOptions := [loPartialKey];
  if TSmallNodeObject(tvFields.Selected.Data).DBType='Table' then
ik:=TSmallNodeObject(tvFields.Selected.Data).DBId else
//if TSmallNodeObject(tvFields.Selected.Data).DBType='Field' then
ik:=TSmallNodeObject(tvFields.Selected.Data).DBParentId;
QMDataModule.adodsQMTables.Locate('ik_table', ik, SearchOptions);


if QueryController<>nil then begin
QueryController.DirectFieldsDataset;
QueryController.CreateEntity(true);
end;
if TSmallNodeObject(tvFields.Selected.Data).DBType='Field' then
QueryController.FieldByIK(TSmallNodeObject(tvFields.Selected.Data).DBId).Check;
imQuery.Repaint;
end;

procedure TfrmQueryMaster.actAddFilterExecute(Sender: TObject);
var filter:TDBFilter;
begin
Filter:=TDBFilter.Create;
filter.commandRus:=eCommand.Text;
filter.command:=TranslateCommand(eCommand.Text);
filter.param1:=eValue1.Text;
filter.param2:=eValue2.Text;
if filter.checkParams then
QueryController.AddFilter(QueryController.FieldByVisual(ActiveField),filter)
else showmessage('¬ значении параметра нельз€ использовать служебные символы!');
RefreshFilter;
end;

procedure TfrmQueryMaster.actBuildQueryExecute(Sender: TObject);
begin
 QueryController.BuildQuery;
 Memo1.Lines:=QueryController.Command;
end;



procedure TfrmQueryMaster.actDeleteEntityExecute(Sender: TObject);
begin
if ActiveEntity<>nil then
QueryController.DestroyEntity(QueryController.EntityByVisual(ActiveEntity));
end;

procedure TfrmQueryMaster.actDeleteFilterExecute(Sender: TObject);
begin
  inherited;
 if ActiveField<>nil then
QueryController.FieldByVisual(ActiveField).DeleteLastFilter;
RefreshFilterMemo;
end;

procedure TfrmQueryMaster.actDeleteLastFilterUpdate(Sender: TObject);
begin
actDeleteLastFilter.Enabled:=not (FilterMemo.Text='')
end;

procedure TfrmQueryMaster.actDelFilterExecute(Sender: TObject);
begin
QueryController.DeleteFilter(TDBFilter(lbFilters.Items.Objects[lbFilters.ItemIndex]));
RefreshFiltersListBox;

end;

procedure TfrmQueryMaster.actDelFilterUpdate(Sender: TObject);
begin
if lbFilters.ItemIndex<0 then
actDelFilter.Enabled:=false else
actDelFilter.Enabled:=true;
end;

function TfrmQueryMaster.ActiveEntity: TVDBEntity;
var i:integer;
begin
result:=nil;
for i := 0 to imQuery.Layers.Count - 1 do

if (imQuery.Layers.Items[i]) is TVDBEntity then
if TVDBEntity(imQuery.Layers.Items[i]).Active then
begin
result:=TVDBEntity(imQuery.Layers.Items[i]);
exit;
end;
end;

function TfrmQueryMaster.ActiveField: TVDBItem;
var i:integer;
begin
result:=nil;
for i := 0 to imQuery.Layers.Count - 1 do

if (imQuery.Layers.Items[i]) is TVDBItem then
if TVDBItem(imQuery.Layers.Items[i]).Active then
begin
result:=TVDBItem(imQuery.Layers.Items[i]);
exit;
end;
end;

procedure TfrmQueryMaster.actOKExecute(Sender: TObject);
begin
  //inherited;

QueryController.Mode:='All';
QueryController.GroupBy := cbGroupBy.Checked;
  QueryController.BuildQuery;
  Memo1.Text := QueryController.Command.Text;
 QueryController.ExecuteQuery;
  frmQMView:=TfrmQMView.create(nil);
  frmQMView.ShowModal;
end;

procedure TfrmQueryMaster.actOKUpdate(Sender: TObject);
begin
if QueryController.CountCheckedFields>0 then actOK.Enabled:=true
else actOK.Enabled:=false;

end;

procedure TfrmQueryMaster.actSortExecute(Sender: TObject);
begin
 if (not cbOrder.Checked) then
  begin
  QueryController.AddSortField(QueryController.FieldByVisual(ActiveField));
  ActiveField.Checked:=true;
  imQuery.Repaint;
  cbOrder.Checked:=true;
  end
  else begin
   QueryController.RemoveSortField(QueryController.FieldByVisual(ActiveField));
    cbOrder.Checked:=false;
  end;
end;


procedure TfrmQueryMaster.bbCancelClick(Sender: TObject);
begin
  inherited;
Close;
end;

procedure TfrmQueryMaster.bLoadQueryClick(Sender: TObject);
begin
  if odLoadQuery.execute then
  QueryController.ReadFromFile(odLoadQuery.FileName);
end;

procedure TfrmQueryMaster.bSaveQueryClick(Sender: TObject);
begin
if sdSaveQuery.execute then
  QueryController.SaveToFile(sdSaveQuery.FileName);

end;

procedure TfrmQueryMaster.cbOrderClick(Sender: TObject);
begin
  if cbOrder.Checked then
  begin
  QueryController.AddSortField(QueryController.FieldByVisual(ActiveField));
  ActiveField.Checked:=true;
  imQuery.Repaint;
  end
  else
   QueryController.RemoveSortField(QueryController.FieldByVisual(ActiveField))

end;

procedure TfrmQueryMaster.Cd1Click(Sender: TObject);
var i:integer;
begin
for I := 0 to (tvFields.Items.Count) - 1 do
tvFields.Items[i].Collapse(true);

end;

constructor TfrmQueryMaster.Create(AOwner: TComponent);
begin
  inherited;

end;

procedure TfrmQueryMaster.dbcbeQMTablesChange(Sender: TObject);
begin
  inherited;
  if QueryController<>nil then
  QueryController.DirectFieldsDataset;
end;

procedure TfrmQueryMaster.eCommandChange(Sender: TObject);
begin
if (eCommand.Text='между')or(eCommand.Text='не между') then
begin
eValue1.Width:=60;
eValue2.Visible:=true;
Label3.Visible:=true;
end
else
begin
eValue1.Width:=140;
eValue2.Visible:=false;
Label3.Visible:=false;
end;
if (eCommand.Text='отсутствует') then
begin
eValue2.Enabled:=False;
eValue1.Enabled:=False;
end
else
begin
eValue1.Enabled:=True;
eValue2.Enabled:=true;
end;
end;


procedure TfrmQueryMaster.FillTVFields;
var
  //I: Integer;
  curT,curF:TTreeNode;
begin
QMDataModule.adodsQMTables.First;

while not QMDataModule.adodsQMTables.eof do
begin
curT:=TVFields.Items.AddChild(nil,QMDataModule.adodsQMTables.FieldValues['ctable_caption']);
curT.ImageIndex:=1;
curT.Data:=TSmallNodeObject.Create;
TSmallNodeObject(curT.Data).DBType:='Table';
TSmallNodeObject(curT.Data).DBId:=QMDataModule.adodsQMTables.FieldValues['ik_table'];
QueryController.DirectFieldsDataset;
QMDataModule.adodsQMFields.First;
while not QMDataModule.adodsQMFields.eof do
begin
if QMDataModule.adodsQMFields.FieldValues['lvisible']=true then begin
curF:=TVFields.Items.AddChild(curT,QMDataModule.adodsQMFields.FieldValues['cfield_caption']);
curF.ImageIndex:=2;
curF.Data:=TSmallNodeObject.Create;
TSmallNodeObject(curF.Data).DBType:='Field';
TSmallNodeObject(curF.Data).DBId:=QMDataModule.adodsQMFields.FieldValues['ik_field'];
TSmallNodeObject(curF.Data).DBParentId:=QMDataModule.adodsQMFields.FieldValues['ik_table'];
end;

QMDataModule.adodsQMFields.next;
end;
curT.Expand(true);
QMDataModule.adodsQMTables.next;
end;

TVFields.SortType:=stText;  
end;


procedure TfrmQueryMaster.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
QueryController.Free;
end;

procedure TfrmQueryMaster.FormShow(Sender: TObject);
begin
  try
  with QMDataModule do begin
QMDataModule.adodsQMTables.Active:=true;
QMDataModule.adodsQMAllFields.Active:=true;
QueryController:=TQMQueryController.create(adodsQMTables,adodsQMFields,adodsQMRelations, imQuery);
  end;
  FillTVFields;
  except

  end;
end;


procedure TfrmQueryMaster.imQueryMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
  var i:integer;
  begin
  inherited;
   actAddFilter.Visible:=false;
   actDeleteLastFilter.Visible:=false;
   actSort.Visible:=false;
   ActAddEntity.Visible:=true;
   actDeleteEntity.Visible:=true;
  for I := 0 to imQuery.Layers.Count - 1 do
  if imQuery.Layers[i].HitTest(X,Y) then begin
  TVBlock(imQuery.Layers[i]).Activate;
   if imQuery.Layers[i] is TVDBItem then
   begin

   actAddFilter.Visible:=true;
   actDeleteLastFilter.Visible:=true;
   actSort.Visible:=true;
   //ActAddEntity.Visible:=false;
   //actDeleteEntity.Visible:=false;

   end;
  end else TVBlock(imQuery.Layers[i]).Deactivate;
  imQuery.Repaint;
  RefreshFilter;
end;



procedure TfrmQueryMaster.lbFiltersClick(Sender: TObject);
begin
if lbFilters.ItemIndex>=0 then
actDelFilter.Enabled:=true
else
actDelFilter.Enabled:=false;

end;

procedure TfrmQueryMaster.N6Click(Sender: TObject);
var i:integer;
begin
for I := 0 to (tvFields.Items.Count) - 1 do
tvFields.Items[i].Expand(true);
end;

procedure TfrmQueryMaster.pnlFiltersMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
if pnlFilters.Height<34 then begin
pnlFilters.Height:=153;
try
RefreshFiltersListBox;
except

end;
end;

end;

procedure TfrmQueryMaster.QMPopupPopup(Sender: TObject);
begin

if cbOrder.Checked then actSort.Caption:='Ќе сортировать по полю' else
actSort.Caption:='Cортировать по полю';
end;

procedure TfrmQueryMaster.rbAllClick(Sender: TObject);
begin
if rbAll.Checked then QueryController.FieldByVisual(ActiveField).Mode:='Normal' else
if rbAverage.Checked then QueryController.FieldByVisual(ActiveField).Mode:='Avg' else
if rbMin.Checked then QueryController.FieldByVisual(ActiveField).Mode:='Min' else
if rbMax.Checked then QueryController.FieldByVisual(ActiveField).Mode:='Max';

end;

procedure TfrmQueryMaster.RefreshFilter;
begin
if ActiveField<>nil then
begin
RefreshFilterMemo;
pnlFieldFilter.Visible:=true;
pnlFilters.Visible:=false;
cbOrder.Checked:=QueryController.IsInSortList(QueryController.FieldByVisual(ActiveField));
rbAll.Checked:=true;
rbAverage.Checked:=QueryController.FieldByVisual(ActiveField).Mode='Avg';
rbMin.Checked:=QueryController.FieldByVisual(ActiveField).Mode='Min';
rbMax.Checked:=QueryController.FieldByVisual(ActiveField).Mode='Max';
end else
begin
pnlFieldFilter.Visible:=false;
pnlFilters.Visible:=true;
pnlFilters.Height:=33;
actDelFilter.Enabled:=false;
end;

end;

procedure TfrmQueryMaster.RefreshFilterMemo;
begin
FilterMemo.Lines.Clear;
if ActiveField<>nil then
FilterMemo.Lines.AddStrings(QueryController.FieldByVisual(ActiveField).BuildRusFilter);
end;


procedure TfrmQueryMaster.RefreshFiltersListBox;
begin
QueryController.GetRusFilters(lbFilters);
end;

procedure TfrmQueryMaster.ScrollBox1Resize(Sender: TObject);
begin
  if (imQuery.Width+2)<ScrollBox1.Width then
  imQuery.Width:=ScrollBox1.Width-2;
  if (imQuery.Height+2)<ScrollBox1.Height then
  imQuery.Height:=ScrollBox1.Height-2;
end;

function TfrmQueryMaster.TranslateCommand(ruscommand: string): string;
begin
result:='unknown';
if eCommand.Text='равно' then
Result:='=';
if eCommand.Text='не равно' then
Result:='!=';
if eCommand.Text='меньше' then
Result:='<';
if eCommand.Text='больше' then
Result:='>';
if eCommand.Text='между' then
Result:='BETWEEN';
if eCommand.Text='не между' then
Result:='NOT BETWEEN';
if eCommand.Text='включает' then
Result:='LIKE';
if eCommand.Text='отсутствует' then
Result:='IS NULL';
if eCommand.Text='присутствует' then
Result:='IS NOT NULL';
end;

procedure TfrmQueryMaster.tvFieldsDblClick(Sender: TObject);
begin
ActAddEntity.Execute;
tvFields.Selected.Expand(true);
end;

end.
