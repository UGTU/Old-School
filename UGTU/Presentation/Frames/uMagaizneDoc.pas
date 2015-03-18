unit uMagaizneDoc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFrame, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ComCtrls,uDMUgtuStructure, Vcl.DBLookup,
  Vcl.Mask, DBCtrlsEh, DBLookupEh,uDMStudentData,uDMDocuments,EhLibADO,
  Vcl.Menus, Data.DB, Bde.DBTables;

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
    Query1: TQuery;
    procedure dbcmbSpecChange(Sender: TObject);
    procedure dbcmbGroupChange(Sender: TObject);
    procedure bPrintClick(Sender: TObject);
    procedure gridColumnSelectMenuPopup(Sender: TObject);
    procedure bResetClick(Sender: TObject);
    procedure dtpStartCloseUp(Sender: TObject);
    procedure dtpEndCloseUp(Sender: TObject);

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
   dtpStart.Date:=  Date -31; //"���������� ����"
   dtpEnd.Date := Date; //������� ����
   dtpStart.MaxDate:= dtpEnd.Date-1;
   dtpEnd.MinDate:= dtpStart.Date+1;


  // dmDocs.adodsDocs.CommandText:=('select * from MagazineDocs where cName_direction='''+'�����������''');// + DateTimeToStr(dtpStart.Date)+'''';//+ 'and DateCreate <''' + DateTimeToStr(dtpEnd.Date)+''')or DateCreate=NULL';
    dmDocs.adodsDocs.CommandText:=('select * from MagazineDocs where (DateCreate>'''+DateTimeToStr(dtpStart.Date)+ '''and DateCreate <''' + DateTimeToStr(dtpEnd.Date)+''')or DateCreate IS NULL');

   //����������
   uDMDocuments.dmDocs.adodsDocs.Active:=true;   //��������� ����
   uDMDocuments.dmDocs.adodsDocs.Filtered:=True;  //������
   DBGridEhCenter.FilterEditCloseUpApplyFilter:=True;
   //����������
   self.dbgehMagazineDocs.OptionsEh := dbgehMagazineDocs.OptionsEh + [dghAutoSortMarking];


 //�������������� ����������
 //  dbgehMagazineDocs.Columns[1].Title.SortMarker = smDownEh;   //�� ��������
 //  dbgehMagazineDocs.OptionsEh := dbgehMagazineDocs.OptionsEh + [dghMultiSortMarking]; //���������� �� ���������� ��������
   dbgehMagazineDocs.SortLocal:= True;
   //dmDocs.dsDocs.DataSet.Filter := 'DateCreate > ''' + DateTimeToStr(dtpStart.Date)+''''+ 'and DateCreate <''' + DateTimeToStr(dtpEnd.Date)+'''';


   //dmDocs.dsDocs.DataSet.Filter := 'DateCreate > ''' + DateTimeToStr(dtpStart.Date)+''''+ 'and DateCreate <''' + DateTimeToStr(dtpEnd.Date)+'''';
   //dmDocs.dsDocs.DataSet.Filtered:=true;


End;

procedure TfmDoc.bPrintClick(Sender: TObject);
begin
  inherited;




end;
//����� �������
procedure TfmDoc.bResetClick(Sender: TObject);
begin
  inherited;
self.dbgehMagazineDocs.ClearFilter;
//dmDocs.dsDocs.DataSet.Filter := 'DateCreate > ''' + DateTimeToStr(dtpStart.Date)+''''+ 'and DateCreate <''' + DateTimeToStr(dtpEnd.Date)+'''';
//dmDocs.dsDocs.DataSet.Filtered:=true;
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

procedure TfmDoc.dtpEndCloseUp(Sender: TObject);
begin
  inherited;
  dtpStart.MaxDate:= dtpEnd.Date-1;
  dmDocs.adodsDocs.Active:=False;
  dmDocs.adodsDocs.CommandText:=('select * from MagazineDocs where (DateCreate>'''+DateTimeToStr(dtpStart.Date)+ '''and DateCreate <''' + DateTimeToStr(dtpEnd.Date)+''')or DateCreate IS NULL');
   dmDocs.adodsDocs.Active:=True;
end;

procedure TfmDoc.dtpStartCloseUp(Sender: TObject);
begin
  inherited;
  dtpEnd.MinDate:= dtpStart.Date+1;
  dmDocs.adodsDocs.Active:=False;
  dmDocs.adodsDocs.CommandText:=('select * from MagazineDocs where (DateCreate>'''+DateTimeToStr(dtpStart.Date)+ '''and DateCreate <''' + DateTimeToStr(dtpEnd.Date)+''')or DateCreate IS NULL');
   dmDocs.adodsDocs.Active:=True;
end;

procedure TfmDoc.gridColumnSelectMenuPopup(Sender: TObject);
var
 mi :TMenuItem;
 pm : TPopupMenu;
 col: TColumnEh;
 i : Integer;
begin
  inherited;   //���� ������� ������������ ������
  //if pm<>nil then
 // pm.CloseMenu;
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
with Sender as TMenuItem do // ����� Sender - ����� ���� �� ������� ��������
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
