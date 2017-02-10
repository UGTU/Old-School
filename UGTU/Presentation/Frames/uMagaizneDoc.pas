unit uMagaizneDoc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFrame, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ComCtrls, uDMUgtuStructure,
  Vcl.DBLookup, uDM,
  Vcl.Mask, DBCtrlsEh, DBLookupEh, uDMStudentData, uDMDocuments, EhLibADO,
  uReviewDoc,
  Vcl.Menus, Data.DB, Bde.DBTables, Vcl.ImgList, adodb, Vcl.ToolWin,
  uReviewCallSpr, uReviewApplication, uReviewAkadem,
  uReviewNotify, Document, Destination, uUspevGroupController,
  System.Generics.Collections, IniFiles, Registry, DBTVSprObj, uDocController,
  ReportsBase, ApplicationController, uWaitingController;

type
  TfmDoc = class(TfmBase)
    dbgehMagazineDocs: TDBGridEh;
    Panel2: TPanel;
    Label1: TLabel;
    gridColumnSelectMenu: TPopupMenu;
    Label2: TLabel;
    ilMain: TImageList;
    ToolBar7: TToolBar;
    tbUtv: TToolButton;
    tbGot: TToolButton;
    tbPrint: TToolButton;
    bbReset: TBitBtn;
    dtpStart: TDateTimePicker;
    dtpEnd: TDateTimePicker;
    ppmPrint: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure gridColumnSelectMenuPopup(Sender: TObject);
    procedure bResetClick(Sender: TObject);
    procedure dtpStartCloseUp(Sender: TObject);
    procedure dtpEndCloseUp(Sender: TObject);
    procedure dbgehMagazineDocsDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumnEh;
      State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure tbUtvClick(Sender: TObject);
    procedure tbGotClick(Sender: TObject);
    procedure tbResetClick(Sender: TObject);
    procedure bbResetClick(Sender: TObject);
    procedure tbPrintClick(Sender: TObject);
    procedure dbgehMagazineDocsExit(Sender: TObject);
    procedure N2Click(Sender: TObject);
    // procedure NewIni(const NomeIni: string);
    // procedure SaveIni(const FN: string);
    // procedure LoadIni(const FN: string);

  private
    FDocumentStateChanged: TNotifyEvent;
    procedure OnMyMenuItemClick(Sender: TObject);
    procedure LoadMagazine;
    // numColumn:integer;checked:boolean);
    { Private declarations }
  protected
    procedure DocumentChanged; virtual;
  public
    Procedure AfterConstruction; Override;

  published
    property OnDocumentStateChanged: TNotifyEvent read FDocumentStateChanged
      write FDocumentStateChanged;
    { Public declarations }
  end;

var
  fmDoc: TfmDoc;

  // pm : TPopupMenu;
implementation

uses uMain;
{$R *.dfm}

Procedure TfmDoc.AfterConstruction;
var
  fld: TField;
Begin
  Inherited;
  // ilMain.GetBitmap(16, bbOk.Glyph);
  dbgehMagazineDocs.SelectedRows.CurrentRowSelected := true;

  // dtpStart.Date := StrToDate('10.03.2015');
  dtpStart.Date := Date - 31; // "конкретная дата"
  dtpEnd.Date := Date; // текущая дата
  dtpEnd.Time := StrToTime('23:59:59');
  dtpStart.Time := StrToTime('00:00:00');
  dtpStart.MaxDate := dtpEnd.Date - 1;
  dtpEnd.MinDate := dtpStart.Date + 1;


  // dbgehMagazineDocs.Options   := dbgehMagazineDocs.Options  + [dgAlwaysShowSelection];
  // dbgehMagazineDocs.OptionsEh:= dbgehMagazineDocs.OptionsEh + [dghRowHighlight];

  // dmDocs.adodsDocs.CommandText:=('select * from MagazineDocs where cName_direction='''+'Бакалавриат''');// + DateTimeToStr(dtpStart.Date)+'''';//+ 'and DateCreate <''' + DateTimeToStr(dtpEnd.Date)+''')or DateCreate=NULL';

  LoadMagazine;
  // фильтрация
  uDMDocuments.dmDocs.adodsDocs.Active := true; // подключам базу
  uDMDocuments.dmDocs.adodsDocs.Filtered := true; // фильтр
  DBGridEhCenter.FilterEditCloseUpApplyFilter := true;
  // сотрировка
  {self.dbgehMagazineDocs.OptionsEh := dbgehMagazineDocs.OptionsEh +
    [dghAutoSortMarking];

  dbgehMagazineDocs.SortLocal := true;  }
  dbgehMagazineDocs.RestoreGridLayoutIni(ExtractFilePath(ParamStr(0)) +
    'ConfigGRID.ini', 'dbgehMagazineDocs', [grpColIndexEh, grpColWidthsEh]);
End;

procedure TfmDoc.bbOkClick(Sender: TObject);
var
  i, LastNum: Integer;
  datebegin: string;
  AYear, AMonth, ADay: word;
  sp_num: TADODataSet;
begin
  inherited;
  with dbgehMagazineDocs.DataSource.DataSet do
  begin

    First;
    DisableControls;
    try
      while not EOF do
      begin
        if (dbgehMagazineDocs.SelectedRows.CurrentRowSelected = true) then
        begin
          if (uDMDocuments.dmDocs.adodsDocs.FieldByName('NumberDoc')
            .AsString = '') then
          begin
            dm.DBConnect.BeginTrans;
            sp_num := TADODataSet.Create(nil);
            // надо сделать проверку на уникальность
            try
              dbgehMagazineDocs.DataSource.DataSet.Edit;
              uDMDocuments.dmDocs.dsDocs.DataSet.FieldValues['DateCreate']
                := Date();
              dbgehMagazineDocs.DataSource.DataSet.Post;
              DecodeDate(Now, AYear, AMonth, ADay);

              if Date() > StrToDateTime('01.09.' + AYear.ToString()) then
                datebegin := '01.09.' + AYear.ToString()
              else
                datebegin := '01.09.' + (StrToInt(AYear.ToString()) - 1)
                  .ToString();
              sp_num.CommandText := 'select * from MaxNumDocument(''' +
                datebegin + '''' + ',' + '''' + DateTimeToStr(Date()) + ''')';
              sp_num.Connection := dm.DBConnect;
              sp_num.Open;
              sp_num.First;
              LastNum := sp_num.FieldByName('MaxNum').AsInteger + 1;
              dm.DBConnect.CommitTrans;
            except
              dm.DBConnect.RollbackTrans;
              sp_num.Free;
            end;
            dbgehMagazineDocs.DataSource.DataSet.Edit;
            uDMDocuments.dmDocs.dsDocs.DataSet.FieldValues['NumberDoc']
              := LastNum;
            dbgehMagazineDocs.DataSource.DataSet.Post;
          end;
        end;

        Next;
      end;
    finally
      EnableControls;

    end;
  end;

end;

procedure TfmDoc.bbResetClick(Sender: TObject);
begin
  inherited;
  self.dbgehMagazineDocs.ClearFilter;
  self.dbgehMagazineDocs.DefaultApplyFilter;
end;





// сброс фильтра
procedure TfmDoc.bResetClick(Sender: TObject);
begin
  inherited;
  self.dbgehMagazineDocs.ClearFilter;
  self.dbgehMagazineDocs.DefaultApplyFilter;
end;

procedure TfmDoc.Button1Click(Sender: TObject);
var
  i: Integer;
begin
  // for i:=0 to dbgehMagazineDocs.SelCount-1 do begin;
  // dbgehMagazineDocs.DataSource.DataSet.Bookmark:=dbgehMagazineDocs.SelectedRows[i];
  // end;

  inherited;
  with dbgehMagazineDocs.DataSource.DataSet do
  begin

    First;
    DisableControls;
    try
      while not EOF do
      begin
        if (dbgehMagazineDocs.SelectedRows.CurrentRowSelected = true) then
        begin
          if (uDMDocuments.dmDocs.adodsDocs.FieldByName('DateReady')
            .Value = Null) then
          begin
            dbgehMagazineDocs.DataSource.DataSet.Edit;
            uDMDocuments.dmDocs.dsDocs.DataSet.FieldValues['DateReady']
              := Date();
            dbgehMagazineDocs.DataSource.DataSet.Post;
          end;
        end;
        Next;
      end;
    finally
      EnableControls;
    end;
  end;
end;



procedure TfmDoc.dbgehMagazineDocsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
  if (dbgehMagazineDocs.DataSource.DataSet.FieldByName('DateCreate')
    .AsString = '') then
    self.dbgehMagazineDocs.Canvas.Font.Style := [fsBold];
  dbgehMagazineDocs.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TfmDoc.dbgehMagazineDocsExit(Sender: TObject);
begin
  inherited;
  dbgehMagazineDocs.SaveGridLayoutIni(ExtractFilePath(ParamStr(0)) +
    'ConfigGRID.ini', 'dbgehMagazineDocs', true);

end;

procedure TfmDoc.DocumentChanged;
begin
  if Assigned(FDocumentStateChanged) then
    FDocumentStateChanged(self);
end;

procedure TfmDoc.dtpEndCloseUp(Sender: TObject);
begin
  inherited;
  dtpStart.MaxDate := dtpEnd.Date - 1;
  LoadMagazine;
end;



procedure TfmDoc.dtpStartCloseUp(Sender: TObject);
begin
  inherited;
  dtpEnd.MinDate := dtpStart.Date + 1;
  LoadMagazine;
end;

procedure TfmDoc.gridColumnSelectMenuPopup(Sender: TObject);
var
  mi: TMenuItem;
  pm: TPopupMenu;
  col: TColumnEh;
  i: Integer;
begin
  inherited; // надо сделать освобождение памяти
  // if pm<>nil then
  // pm.CloseMenu;
  pm := Sender as TPopupMenu;
  pm.Items.Clear;
  for i := 0 to self.dbgehMagazineDocs.Columns.Count - 4 do
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

procedure TfmDoc.LoadMagazine;
begin
  dmDocs.adodsDocs.Active := false;
  dmDocs.adodsDocs.CommandText :=
    ('select * from MagazineDocs where (DateCreate>=''' +
    DateTimeToStr(dtpStart.Date) + '''and DateCreate <=''' +
    DateTimeToStr(dtpEnd.Date) + ''')or DateCreate IS NULL');
  dmDocs.adodsDocs.Active := true;
end;

procedure TfmDoc.N2Click(Sender: TObject);
var
  BYear, BMonth, BDay: word;
  EYear, EMonth, EDay: word;
  a,b,c,d:string;
  Report: TReportBase;
begin
  inherited;
  a:='';b:='';c:='';d:='';
  DecodeDate(dtpStart.Date, BYear, BMonth, BDay);
  DecodeDate(dtpEnd.Date, EYear, EMonth, EDay);
  if BMonth.ToString.Length=1 then
  a:='0';
    if BDay.ToString.Length=1 then
  b:='0';
    if EMonth.ToString.Length=1 then
  c:='0';
    if EDay.ToString.Length=1 then
  d:='0';
  Report := TDocController.Instance.BuildSpr(a+BDay.ToString  + '.' + b+BMonth.ToString + '.' + BYear.ToString,
    c+EDay.ToString + '.' + d+EMonth.ToString + '.' +  EYear.ToString);
  TWaitingController.GetInstance.Process(Report);
end;


procedure TfmDoc.OnMyMenuItemClick(Sender: TObject);
begin
  if Sender is TMenuItem Then
    with Sender as TMenuItem do
    // здесь Sender - пункт меню на который кликнули
    begin
      if Checked then
        self.dbgehMagazineDocs.Columns.Items[Tag].Visible := false
      else
      begin
        self.dbgehMagazineDocs.Columns.Items[Tag].Visible := true;
        self.dbgehMagazineDocs.Columns.Items[Tag].Width := 130;
      end;
    end;
end;

procedure TfmDoc.tbGotClick(Sender: TObject);
var
  i: Integer;
  sp_numdoc: TADODataSet;
begin
  // for i:=0 to dbgehMagazineDocs.SelCount-1 do begin;
  // dbgehMagazineDocs.DataSource.DataSet.Bookmark:=dbgehMagazineDocs.SelectedRows[i];
  // end;

  inherited;
  with dbgehMagazineDocs.DataSource.DataSet do
  begin

    First;
    DisableControls;
    try
//      while not EOF do
//      begin
//        if (dbgehMagazineDocs.SelectedRows.CurrentRowSelected = true) then
//        begin
//          if (uDMDocuments.dmDocs.adodsDocs.FieldByName('DateReady')
//            .Value = Null) and
//            (uDMDocuments.dmDocs.adodsDocs.FieldByName('DateCreate').Value <>
//            Null) then
//          begin
//            dbgehMagazineDocs.DataSource.DataSet.Edit;
//            uDMDocuments.dmDocs.dsDocs.DataSet.FieldValues['DateReady']
//              := Date();
//            dbgehMagazineDocs.DataSource.DataSet.Post;
//          end;
//        end;
//
//        Next;
//      end;
//      DocumentChanged;
      For i := 0 to dbgehMagazineDocs.SelectedRows.Count - 1 do
      begin
       dbgehMagazineDocs.Datasource.Dataset.Bookmark:= dbgehMagazineDocs.SelectedRows.Items[i];
                 if (uDMDocuments.dmDocs.adodsDocs.FieldByName('DateReady')
            .Value = Null) and
            (uDMDocuments.dmDocs.adodsDocs.FieldByName('DateCreate').Value <>
            Null) then
          begin
            dbgehMagazineDocs.DataSource.DataSet.Edit;
            uDMDocuments.dmDocs.dsDocs.DataSet.FieldValues['DateReady']
              := Date();
            dbgehMagazineDocs.DataSource.DataSet.Post;
          end;
      end;
      DocumentChanged;
      { sp_numdoc := TADODataSet.Create(nil);
        sp_numdoc.CommandText := 'select * from NumberOfDocuments(''' + TDocController.Instance.CalculationBeginYearLern() + ''',''' + DateTimeToStr(date()) + ''')';
        sp_numdoc.Connection := dm.DBConnect;
        sp_numdoc.Open;
        sp_numdoc.First;
      }
    finally
      EnableControls;
    end;

  end;
end;

procedure TfmDoc.tbPrintClick(Sender: TObject);
const
  n = 100;
var
  dsDoc: TADODataSet;
  idDest: Integer;
  j: Integer;

  sp_pers: TADOStoredProc;
  sp_doc: TADOStoredProc;
  i,k, ind: Integer;
  mass_doc: array [1 .. n] of Integer;
  ListDist: TObjectList<TDest>;
  dest: TDest;
  doc: TDopDoc;
begin
  inherited;
  sp_doc := TADOStoredProc.Create(nil);
  sp_pers := TADOStoredProc.Create(nil);
  dsDoc := TADODataSet.Create(nil);
  ListDist := TObjectList<TDest>.Create;
  i := 0;
  ind := -1;
  // pt := dbgehMagazineDocsStud.ScreenToClient(Mouse.CursorPos);
  try
    // // if self.dbgehMagazineDocsStud.MouseCoord(pt.X, pt.Y).X <> -1 then
    // // begin
    with dbgehMagazineDocs.DataSource.DataSet do
    begin
//      First;
//      // DisableControls;
//      while not EOF do
//      begin
//        if (dbgehMagazineDocs.SelectedRows.CurrentRowSelected = true) then
      For k := 0 to dbgehMagazineDocs.SelectedRows.Count - 1 do
      begin
       dbgehMagazineDocs.Datasource.Dataset.Bookmark:= dbgehMagazineDocs.SelectedRows.Items[k];
          if uDMDocuments.dmDocs.adodsDocs.FieldByName('DateCreate')
            .AsString.Length <> 0 then
          begin
            i := i + 1;
            ListDist := TDocController.Instance.AddListDest(ListDist,
              uDMDocuments.dmDocs.adodsDocs.FieldByName('ik_destination')
              .AsInteger, dmDocs.adodsDocs.FieldByName('Ik_Document')
              .AsInteger);

          end;
//        Next;
      end;
    end;

    // TUspevGroupController.Instance.BuildTemplate(ListDoc, i);
    TDocController.Instance.PrintAllDoc(ListDist);

  finally
    dsDoc.Free;
    sp_doc.Free;
    sp_pers.Free;
  end;
end;

procedure TfmDoc.tbUtvClick(Sender: TObject);
var
  i,k, LastNum: Integer;
  datebegin: string;
  AYear, AMonth, ADay: word;
  sp_num: TADODataSet;
  sp_numdoc: TADODataSet;
begin
  inherited;
  with dbgehMagazineDocs.DataSource.DataSet do
  begin
    First;
    DisableControls;
    try
//      while not EOF do
//      begin
//        if (dbgehMagazineDocs.SelectedRows.CurrentRowSelected = true) then
//        begin
      For k := 0 to dbgehMagazineDocs.SelectedRows.Count - 1 do
      begin
       dbgehMagazineDocs.Datasource.Dataset.Bookmark:= dbgehMagazineDocs.SelectedRows.Items[k];
          if (uDMDocuments.dmDocs.adodsDocs.FieldByName('NumberDoc')
            .AsString = '') then
          begin
            dm.DBConnect.BeginTrans;
            sp_num := TADODataSet.Create(nil);
            // надо сделать проверку на уникальность
            try
              dbgehMagazineDocs.DataSource.DataSet.Edit;
              uDMDocuments.dmDocs.dsDocs.DataSet.FieldValues['DateCreate']
                := Date();
              dbgehMagazineDocs.DataSource.DataSet.Post;
              DecodeDate(Now, AYear, AMonth, ADay);

              if Date() > StrToDateTime('01.09.' + AYear.ToString()) then
                datebegin := '01.09.' + AYear.ToString()
              else
                datebegin := '01.09.' + (StrToInt(AYear.ToString()) - 1)
                  .ToString();
              sp_num.CommandText := 'select * from MaxNumDocument(''' +
                datebegin + '''' + ',' + '''' + DateTimeToStr(Date()) + '''' +
                ',' + '''' + uDMDocuments.dmDocs.adodsDocs.FieldByName
                ('Ik_Document').AsString + ''',''' +
                uDMDocuments.dmDocs.adodsDocs.FieldByName('Ik_destination')
                .AsString + ''')';
              sp_num.Connection := dm.DBConnect;
              sp_num.Open;
              sp_num.First;
              LastNum := sp_num.FieldByName('MaxNum').AsInteger + 1;
              dm.DBConnect.CommitTrans;
            except
              dm.DBConnect.RollbackTrans;
              sp_num.Free;
            end;
            dbgehMagazineDocs.DataSource.DataSet.Edit;
            uDMDocuments.dmDocs.dsDocs.DataSet.FieldValues['DateCreate']
              := Date();
            uDMDocuments.dmDocs.dsDocs.DataSet.FieldValues['NumberDoc']
              := LastNum;
            dbgehMagazineDocs.DataSource.DataSet.Post;
          end;
        end;
//        Next;
//      end;

      DocumentChanged;

    finally
      EnableControls;
      sp_num.Free;;
    end;
  end;

  // for i:=0 to dbgehMagazineDocs.SelectedRows.Count-1 do
  // begin
  // if (uDMDocuments.dmDocs.adodsDocs.FieldByName('DateCreate')<>nil) then
  // uDMDocuments.dmDocs.adodsDocs.FieldByName('DateCreate').AsDateTime;
  // dbgehMagazineDocs.DataSource.DataSet.Bookmark:=dbgehMagazineDocs.SelectedRows[i];
end;

procedure TfmDoc.tbResetClick(Sender: TObject);
begin
  inherited;
  self.dbgehMagazineDocs.ClearFilter;
  // dmDocs.dsDocs.DataSet.Filter := 'DateCreate > ''' + DateTimeToStr(dtpStart.Date)+''''+ 'and DateCreate <''' + DateTimeToStr(dtpEnd.Date)+'''';
  // dmDocs.dsDocs.DataSet.Filtered:=true;
  self.dbgehMagazineDocs.DefaultApplyFilter;
end;

end.
