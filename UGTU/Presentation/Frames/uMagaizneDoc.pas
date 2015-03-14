unit uMagaizneDoc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFrame, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ComCtrls,uDMUgtuStructure, Vcl.DBLookup,
  Vcl.Mask, DBCtrlsEh, DBLookupEh,uDMStudentData,uDMDocuments,EhLibADO,
  Vcl.Menus;

type
  TfmDoc = class(TfmBase)
    dbgehMagazineDocs: TDBGridEh;
    bPrint: TButton;
    Panel2: TPanel;
    dtpEnd: TDateTimePicker;
    dtpStart: TDateTimePicker;
    Label1: TLabel;
    bReset: TButton;
    gridColumnSelectMenu: TPopupMenu;
    Label2: TLabel;
    procedure dbcmbSpecChange(Sender: TObject);
    procedure dbcmbGroupChange(Sender: TObject);
    procedure bPrintClick(Sender: TObject);
    procedure gridColumnSelectMenuPopup(Sender: TObject);
    procedure bResetClick(Sender: TObject);
    procedure dtpStartExit(Sender: TObject);
    procedure dtpStartChange(Sender: TObject);
    procedure dtpEndChange(Sender: TObject);

  private
  procedure OnMyMenuItemClick (Sender: TObject);//numColumn:integer;checked:boolean);
    { Private declarations }
  public
  Procedure AfterConstruction; Override;
    { Public declarations }
  end;

var
  fmDoc: TfmDoc;
  //pm : TPopupMenu;
implementation


{$R *.dfm}
Procedure TfmDoc.AfterConstruction;
Begin
 Inherited;

 //dtpStart.Date := StrToDate('10.03.2015');
   dtpStart.Date:=  Date -31; //"конкретная дата"
   dtpEnd.Date := Date; //текущая дата
   dtpStart.MaxDate:= dtpEnd.Date;
   dtpEnd.MinDate:= dtpStart.Date;


   //фильтрация
   uDMDocuments.dmDocs.adodsDocs.Active:=true;   //подключам базу
   uDMDocuments.dmDocs.adodsDocs.Filtered:=True;  //фильтр
   DBGridEhCenter.FilterEditCloseUpApplyFilter:=True;
   //сотрировка
   self.dbgehMagazineDocs.OptionsEh := dbgehMagazineDocs.OptionsEh + [dghAutoSortMarking];


 //автоматическая сортировка
 //  dbgehMagazineDocs.Columns[1].Title.SortMarker = smDownEh;   //по убыванию
 //  dbgehMagazineDocs.OptionsEh := dbgehMagazineDocs.OptionsEh + [dghMultiSortMarking]; //сортировка по нескольким столбцам
   dbgehMagazineDocs.SortLocal:= True;



End;

procedure TfmDoc.bPrintClick(Sender: TObject);
begin
  inherited;




end;
//сброс фильтра
procedure TfmDoc.bResetClick(Sender: TObject);
begin
  inherited;
self.dbgehMagazineDocs.ClearFilter;
self.dbgehMagazineDocs.DefaultApplyFilter;
end;

procedure TfmDoc.dbcmbGroupChange(Sender: TObject);
var group:string;
begin
  inherited;

end;

procedure TfmDoc.dbcmbSpecChange(Sender: TObject);
var spec:string;
begin
  inherited;
end;

procedure TfmDoc.dtpEndChange(Sender: TObject);
begin
  inherited;
  dtpStart.MaxDate:= dtpEnd.Date;
end;

procedure TfmDoc.dtpStartChange(Sender: TObject);
begin
  inherited;
//  dmDocs.dsDocs.DataSet.Filter := 'DateCreate > ' + DateTimeToStr(dtpStart.Date);//+ 'and DateCreate <' + DateTimeToStr(dtpEnd.Date);
//  dmDocs.dsDocs.DataSet.Filtered:=true;

  dtpEnd.MinDate:= dtpStart.Date;
end;

procedure TfmDoc.dtpStartExit(Sender: TObject);
begin
  inherited;
//  dmDocs.dsDocs.DataSet.Filter := 'DateCreate > ' + DateTimeToStr(dtpStart.Date)+ 'and DateCreate <' + DateTimeToStr(dtpEnd.Date);
//  dmDocs.dsDocs.DataSet.Filtered:=true;
end;

procedure TfmDoc.gridColumnSelectMenuPopup(Sender: TObject);
var
 mi :TMenuItem;
 pm : TPopupMenu;
 col: TColumnEh;
 i : Integer;
begin
  inherited;   //надо сделать освобождение памяти
 // if pm<>nil then
 // pm.Free;
  pm := Sender as TPopupMenu;
  pm.Items.Clear;
  for i := 0 to self.dbgehMagazineDocs.Columns.Count - 1 do
  begin
    mi := TMenuItem.Create(pm);
    col := dbgehMagazineDocs.Columns.Items[i];
    mi.Caption := col.Title.Caption;
    mi.Tag := i;
    mi.OnClick := OnMyMenuItemClick;
    mi.Checked := col.Visible;
    pm.Items.Add(mi);
  end;


end;

procedure TfmDoc.OnMyMenuItemClick(Sender: TObject);
begin
if Sender is TMenuItem Then
with Sender as TMenuItem do // здесь Sender - пункт меню на который кликнули
begin
  if Checked then
    self.dbgehMagazineDocs.Columns.Items[Tag].Visible:=False
    else
    begin
      self.dbgehMagazineDocs.Columns.Items[Tag].Visible:=True;
      self.dbgehMagazineDocs.Columns.Items[Tag].Width:=130;
    end;
end;
end;
end.
