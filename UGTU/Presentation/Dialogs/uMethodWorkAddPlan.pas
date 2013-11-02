unit uMethodWorkAddPlan;
  {#Author nnikolenko@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, DBGridEh, GridsEh, Buttons, ComCtrls, ToolWin, StdCtrls,
  Mask, DBCtrlsEh, DBLookupEh, ActnList, ExtCtrls, MethodWorkController, GeneralController,
  DB, DateUtils, ImgList, DBTables, ShellAPI, WordXP, ComObj;

type
  TfrmMethodWorkAddPlan = class(TfrmBaseDialog)
    Panel2: TPanel;
    Label7: TLabel;
    Label1: TLabel;
    actAddCoautor: TAction;
    actRemCoautor: TAction;
    dsDiscEd: TDataSource;
    actAddDisc: TAction;
    actRemDisc: TAction;
    dsCoautor: TDataSource;
    dsState: TDataSource;
    actAddState: TAction;
    actRemState: TAction;
    dbcbNameDisc: TDBLookupComboboxEh;
    dbcbMW: TDBLookupComboboxEh;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    actEditDisc: TAction;
    ImageList1: TImageList;
    ToolBar2: TToolBar;
    ToolButton2: TToolButton;
    actEditMW: TAction;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    dbcbWarrant: TDBLookupComboboxEh;
    actAddFile: TAction;
    actRemFile: TAction;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    dbeNameEd: TDBEditEh;
    Label3: TLabel;
    Label4: TLabel;
    Label16: TLabel;
    dbeVolume: TDBEditEh;
    Label10: TLabel;
    Label9: TLabel;
    Panel9: TPanel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    Panel10: TPanel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    dbgState: TDBGridEh;
    Label12: TLabel;
    Label14: TLabel;
    TabSheet3: TTabSheet;
    Panel6: TPanel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    dbgFile: TDBGridEh;
    Panel7: TPanel;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    Panel3: TPanel;
    Label2: TLabel;
    Label6: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label15: TLabel;
    dbeCode: TDBEditEh;
    dbeCharact: TDBEditEh;
    dbeDraw: TDBEditEh;
    dbePos: TDBEditEh;
    Panel11: TPanel;
    Bevel8: TBevel;
    Bevel9: TBevel;
    Panel12: TPanel;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    dbgCoautor: TDBGridEh;
    Panel13: TPanel;
    Bevel10: TBevel;
    Bevel11: TBevel;
    dbgDisc: TDBGridEh;
    Panel14: TPanel;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    dbeMark: TDBEditEh;
    OpenDialog1: TOpenDialog;
    SpeedButton1: TSpeedButton;
    actAddHyper: TAction;
    dsFile: TDataSource;
    SaveDialog1: TSaveDialog;
    dbcCurrentEd: TDBCheckBoxEh;
    Label21: TLabel;
    Label22: TLabel;
    dbcEd: TDBCheckBoxEh;
    Label23: TLabel;
    Panel4: TPanel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Panel5: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton11: TSpeedButton;
    dbgUchPlan: TDBGridEh;
    Label24: TLabel;
    Label25: TLabel;
    dsUchPlan: TDataSource;
    actAddUchPlan: TAction;
    actRemUchPlan: TAction;
    dbeCountFact: TDBEditEh;
    Label26: TLabel;
    Label27: TLabel;
    dbcbPlan: TDBLookupComboboxEh;
    Label28: TLabel;
    Label29: TLabel;
    procedure dbeNameEdChange(Sender: TObject);
    procedure actAddCoautorExecute(Sender: TObject);
    procedure actAddDiscExecute(Sender: TObject);
    procedure actAddCoautorUpdate(Sender: TObject);
    procedure actAddDiscUpdate(Sender: TObject);
    procedure actRemCoautorExecute(Sender: TObject);
    procedure actRemDiscExecute(Sender: TObject);
    procedure actRemCoautorUpdate(Sender: TObject);
    procedure actRemDiscUpdate(Sender: TObject);
    procedure actAddStateExecute(Sender: TObject);
    procedure actRemStateExecute(Sender: TObject);
    procedure actAddStateUpdate(Sender: TObject);
    procedure actRemStateUpdate(Sender: TObject);
    procedure actEditDiscExecute(Sender: TObject);
    procedure actEditMWExecute(Sender: TObject);
    procedure dbcbMWKeyValueChanged(Sender: TObject);
    procedure dbcbMWEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure dbcbWarrantKeyValueChanged(Sender: TObject);
    procedure actAddFileExecute(Sender: TObject);
    procedure dbgFileDblClick(Sender: TObject);
    procedure actAddHyperExecute(Sender: TObject);
    procedure dbgFileDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure actRemFileUpdate(Sender: TObject);
    procedure actRemFileExecute(Sender: TObject);
    procedure dbeCountFactKeyPress(Sender: TObject; var Key: Char);
    procedure actAddUchPlanUpdate(Sender: TObject);
    procedure actRemUchPlanUpdate(Sender: TObject);
    procedure actAddUchPlanExecute(Sender: TObject);
    procedure actRemUchPlanExecute(Sender: TObject);
    procedure dbcbNameDiscKeyValueChanged(Sender: TObject);
  private
    { Private declarations }
    fPrepIK: integer;
    //fPlanIK: integer;
    //fYearValue: integer;
    fNormIK: integer;
    fNotSave: boolean;
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    { Public declarations }
    procedure Read(KafIK: integer; BitPlan, BitFact: Boolean);
    property PrepIK: integer read fPrepIK write fPrepIK;
    //property PlanIK: integer read fPlanIK write fPlanIK;
    //property YearValue: integer read fYearValue write fYearValue;
    property NormIK: integer read fNormIK write fNormIK;
    property NotSave: boolean read fNotSave write fNotSave;
  end;

var
  frmMethodWorkAddPlan: TfrmMethodWorkAddPlan;

implementation
uses uMethodWorkAddWorkInNorm, DBTVMethodWorkInNormobj, uMethodWorkHyperLink;

Const
  link = clBlue; //цвет ссылки
  alink = clRed; //цвет ссылки в момент нажатия
  vlink = clPurple; // цвет посещеной ссылки
{$R *.dfm}

procedure TfrmMethodWorkAddPlan.actAddCoautorExecute(Sender: TObject);
begin
 dbgCoautor.DataSource.DataSet.First;
 dbgCoautor.DataSource.DataSet.Insert;
 IsModified:= (dbcbNameDisc.KeyValue <> NULL) and (dbcbMW.KeyValue <> NULL) and (dbeNameEd.Text <> '') and (dbeVolume.Text <> '');
end;

procedure TfrmMethodWorkAddPlan.actAddCoautorUpdate(Sender: TObject);
begin
  if (dbgCoautor.DataSource.DataSet <> nil) and (dbeNameEd.Text <> '')and (dbeVolume.Text <> '') then
    actAddCoautor.Enabled:= dbgCoautor.DataSource.DataSet.Active
  else actAddCoautor.Enabled:= false;
  dbgCoautor.Enabled:= actAddCoautor.Enabled;
end;

procedure TfrmMethodWorkAddPlan.actAddDiscExecute(Sender: TObject);
begin
 dbgDisc.DataSource.DataSet.First;
 dbgDisc.DataSource.DataSet.Insert;
 IsModified:= (dbcbNameDisc.KeyValue <> NULL) and (dbcbMW.KeyValue <> NULL) and (dbeNameEd.Text <> '') and (dbeVolume.Text <> '');
end;

procedure TfrmMethodWorkAddPlan.actAddDiscUpdate(Sender: TObject);
begin
  if (dbgDisc.DataSource.DataSet <> nil) and (dbeNameEd.Text <> '')and (dbeVolume.Text <> '') then
    actAddDisc.Enabled:= dbgDisc.DataSource.DataSet.Active
  else actAddDisc.Enabled:= false;
  dbgDisc.Enabled:= actAddDisc.Enabled;
end;

procedure TfrmMethodWorkAddPlan.actAddFileExecute(Sender: TObject);
var
  blob: TStream;
  fs: TFileStream;
begin
  if OpenDialog1.Execute then
  begin
    dbgFile.DataSource.DataSet.First;
    dbgFile.DataSource.DataSet.Insert;
    dbgFile.DataSource.DataSet.FieldByName('NameFile').AsString:= Copy(ExtractFileName(OpenDialog1.FileName), 1, Length(ExtractFileName(OpenDialog1.FileName))-Length(ExtractFileExt(OpenDialog1.FileName)));
    dbgFile.DataSource.DataSet.FieldByName('TypeFile').AsString:= Copy(ExtractFileExt(OpenDialog1.FileName), 2, Length(ExtractFileExt(OpenDialog1.FileName)));
    dbgFile.DataSource.DataSet.FieldByName('BitFile').AsBoolean:= true;

    blob:= dbgFile.DataSource.DataSet.CreateBlobStream(dbgFile.DataSource.DataSet.FieldByName('File'), bmWrite);
    try
      blob.Seek(0, soFromBeginning);
      fs:=TFileStream.Create(OpenDialog1.FileName,fmOpenRead);
      blob.CopyFrom(fs,fs.Size);
    finally
      fs.Free;
      blob.Free;
    end;
    //dbgFile.DataSource.DataSet.Post;
    IsModified:= (dbcbNameDisc.KeyValue <> NULL) and (dbcbMW.KeyValue <> NULL) and (dbeNameEd.Text <> '') and (dbeVolume.Text <> '');
  end;
end;

procedure TfrmMethodWorkAddPlan.actAddHyperExecute(Sender: TObject);
//var
  //fs: TMemoryStream;
  //Buffer: PChar;
begin
  frmMethodWorkHyperLink:= TfrmMethodWorkHyperLink.CreateDialog(nil, self.Connection, nil);
  try
    if (frmMethodWorkHyperLink.ShowModal() = mrOk) or (frmMethodWorkHyperLink.bbApply.Tag = 1) then
    begin
      dbgFile.DataSource.DataSet.First;
      dbgFile.DataSource.DataSet.Insert;
      dbgFile.DataSource.DataSet.FieldByName('NameFile').AsString:= frmMethodWorkHyperLink.dbeName.Text;
      dbgFile.DataSource.DataSet.FieldByName('BitFile').AsBoolean:= false;
      try
        {fs:=TMemoryStream.Create;
        fs.Position:= 0;
        fs.Clear;
        StrPCopy(Buffer, frmMethodWorkHyperLink.dbeAdress.Text);
        fs.Write(Buffer[0], StrLen(Buffer)); }

        (dbgFile.DataSource.DataSet.FieldByName('File') as TBlobField).Value:= frmMethodWorkHyperLink.dbeAdress.Text;
        //(dbgFile.DataSource.DataSet.FieldByName('File') as TBlobField).LoadFromStream(fs);

      finally
        //fs.Free;
      end;
      //dbgFile.DataSource.DataSet.Post;
      IsModified:= (dbcbNameDisc.KeyValue <> NULL) and (dbcbMW.KeyValue <> NULL) and (dbeNameEd.Text <> '') and (dbeVolume.Text <> '');
    end
  finally
    frmMethodWorkHyperLink.Free;
  end;
end;

procedure TfrmMethodWorkAddPlan.actAddStateExecute(Sender: TObject);
begin
 dbgState.DataSource.DataSet.First;
 dbgState.DataSource.DataSet.Insert;
 dbgState.DataSource.DataSet.FieldByName('DateTransitionInState').AsDateTime:= IncMonth(Today, dbcbMW.ListSource.DataSet.FieldByName('CountYear').AsInteger);
 dbgState.DataSource.DataSet.Next;
 IsModified:= (dbcbNameDisc.KeyValue <> NULL) and (dbcbMW.KeyValue <> NULL) and (dbeNameEd.Text <> '') and (dbeVolume.Text <> '');
end;

procedure TfrmMethodWorkAddPlan.actAddStateUpdate(Sender: TObject);
begin
  if (dbgState.DataSource.DataSet <> nil) and (dbeNameEd.Text <> '')and (dbeVolume.Text <> '') then
    actAddState.Enabled:= (dbgState.DataSource.DataSet.Active) and (dsState.DataSet.RecordCount <> dsState.DataSet.FieldByName('NameStatus').LookupDataSet.RecordCount)
  else actAddState.Enabled:= false;
  //dbgState.Enabled:= actAddState.Enabled;
end;

procedure TfrmMethodWorkAddPlan.actAddUchPlanExecute(Sender: TObject);
begin
 dbgUchPlan.DataSource.DataSet.First;
 dbgUchPlan.DataSource.DataSet.Insert;
 IsModified:= (dbcbNameDisc.KeyValue <> NULL) and (dbcbMW.KeyValue <> NULL) and (dbeNameEd.Text <> '') and (dbeVolume.Text <> '');
end;

procedure TfrmMethodWorkAddPlan.actAddUchPlanUpdate(Sender: TObject);
begin
  if (dbgUchPlan.DataSource.DataSet <> nil) and (dbcbWarrant.KeyValue <> NULL) then
    actAddUchPlan.Enabled:= dbgUchPlan.DataSource.DataSet.Active
  else actAddUchPlan.Enabled:= false;
  dbgUchPlan.Enabled:= actAddUchPlan.Enabled;
end;

procedure TfrmMethodWorkAddPlan.actEditDiscExecute(Sender: TObject);
begin
  dbcbNameDisc.Enabled:= true;
end;

procedure TfrmMethodWorkAddPlan.actEditMWExecute(Sender: TObject);
begin
  dbcbWarrant.Enabled:= true;
end;

procedure TfrmMethodWorkAddPlan.actRemCoautorExecute(Sender: TObject);
begin
 dbgCoautor.DataSource.DataSet.Delete;
end;

procedure TfrmMethodWorkAddPlan.actRemCoautorUpdate(Sender: TObject);
begin
  if (dbgCoautor.DataSource.DataSet <> nil) then
  begin
    if (dbgCoautor.DataSource.DataSet.Active) then
      actRemCoautor.Enabled:= not(dbgCoautor.DataSource.DataSet.IsEmpty) //RecordCount > 0
    else actRemCoautor.Enabled:= false;
  end
  else actRemCoautor.Enabled:= false;
end;

procedure TfrmMethodWorkAddPlan.actRemDiscExecute(Sender: TObject);
begin
 dbgDisc.DataSource.DataSet.Delete;
end;

procedure TfrmMethodWorkAddPlan.actRemDiscUpdate(Sender: TObject);
begin
  if (dbgDisc.DataSource.DataSet <> nil) then
  begin
    if (dbgDisc.DataSource.DataSet.Active) then
      actRemDisc.Enabled:= not(dbgDisc.DataSource.DataSet.IsEmpty) //RecordCount > 0
    else actRemDisc.Enabled:= false;
  end
  else actRemDisc.Enabled:= false;
end;

procedure TfrmMethodWorkAddPlan.actRemFileExecute(Sender: TObject);
begin
  dbgFile.DataSource.DataSet.Delete;
end;

procedure TfrmMethodWorkAddPlan.actRemFileUpdate(Sender: TObject);
begin
  if (dbgFile.DataSource.DataSet <> nil) then
  begin
    if (dbgFile.DataSource.DataSet.Active) then
      actRemFile.Enabled:= not(dbgFile.DataSource.DataSet.IsEmpty) //RecordCount > 0
    else actRemFile.Enabled:= false;
  end
  else actRemFile.Enabled:= false;
end;

procedure TfrmMethodWorkAddPlan.actRemStateExecute(Sender: TObject);
begin
 dbgState.DataSource.DataSet.Delete;
end;

procedure TfrmMethodWorkAddPlan.actRemStateUpdate(Sender: TObject);
begin
  if (dbgState.DataSource.DataSet <> nil) then
  begin
    if (dbgState.DataSource.DataSet.Active) then
      actRemState.Enabled:= dbgState.DataSource.DataSet.RecordCount > 0
    else actRemState.Enabled:= false;
  end
  else actRemState.Enabled:= false;
end;

procedure TfrmMethodWorkAddPlan.actRemUchPlanExecute(Sender: TObject);
begin
  dbgUchPlan.DataSource.DataSet.Delete;
end;

procedure TfrmMethodWorkAddPlan.actRemUchPlanUpdate(Sender: TObject);
begin
  if (dbgUchPlan.DataSource.DataSet <> nil) then
  begin
    if (dbgUchPlan.DataSource.DataSet.Active) then
      actRemUchPlan.Enabled:= not(dbgUchPlan.DataSource.DataSet.IsEmpty) //RecordCount > 0
    else actRemUchPlan.Enabled:= false;
  end
  else actRemUchPlan.Enabled:= false;
end;

procedure TfrmMethodWorkAddPlan.dbcbMWEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
if dbcbWarrant.KeyValue <> NULL then
begin
  frmMethodWorkAddWorkInNorm:= TfrmMethodWorkAddWorkInNorm.CreateDialog(nil, self.Connection, nil);
  try
    TDBNodeMethodsWorkNodeObject.FilteredDataSet(dbcbWarrant.KeyValue, NormIK);
    frmMethodWorkAddWorkInNorm.Read(dbcbMW.ListSource.DataSet.FieldByName('IDMethodWork').AsInteger);

  if (frmMethodWorkAddWorkInNorm.ShowModal() = mrOk) then
  begin
    dbcbMW.KeyValue:= frmMethodWorkAddWorkInNorm.IK;
  end;

  finally
    frmMethodWorkAddWorkInNorm.Free;
    TDBNodeMethodsWorkNodeObject.FilteredDataSetFalse;
  end;
end;
end;

procedure TfrmMethodWorkAddPlan.dbcbMWKeyValueChanged(Sender: TObject);
begin
  if (dbcbMW.KeyValue <> NULL) then
  begin
    Label16.Caption:= '(количество ' + dbcbMW.ListSource.DataSet.FieldByName('ShortNameUnit').AsString + ')';
    dbcEd.Checked:= dbcbMW.ListSource.DataSet.FieldByName('BitEdition').AsBoolean;
    {if (self.IK < 0) then
    begin
      dsState.DataSet.First;
      while (not dsState.DataSet.Eof) do
      begin
        dbgState.DataSource.DataSet.Edit;
        dbgState.DataSource.DataSet.FieldByName('DateTransitionInState').AsDateTime:= IncMonth(Today, dbcbMW.ListSource.DataSet.FieldByName('CountYear').AsInteger);
        dbgState.DataSource.DataSet.Next;
      end;
    end;}
  end;
  IsModified:= (dbcbNameDisc.KeyValue <> NULL) and (dbcbMW.KeyValue <> NULL) and (dbeNameEd.Text <> '') and (dbeVolume.Text <> '');
end;

procedure TfrmMethodWorkAddPlan.dbcbNameDiscKeyValueChanged(Sender: TObject);
begin
  if (dbcbNameDisc.KeyValue <> NULL) and (dbcbWarrant.KeyValue <> NULL) and (Self.IK < 0) then//(dbeNameEd.Text = '') then
      dbeNameEd.Text:= dbcbWarrant.Text + ': ' + dbcbNameDisc.Text;
  IsModified:= (dbcbNameDisc.KeyValue <> NULL) and (dbcbMW.KeyValue <> NULL) and (dbeNameEd.Text <> '') and (dbeVolume.Text <> '');
end;

procedure TfrmMethodWorkAddPlan.dbcbWarrantKeyValueChanged(Sender: TObject);
begin
  if (dbcbWarrant.KeyValue <> NULL) then
  begin
    dbcbMW.Enabled:= true;
    dbcbMW.KeyValue:= TMethodWorkController.Instance.GetMethodWork(@dbcbMW.ListSource.DataSet, NormIK, dbcbWarrant.KeyValue, false);
    if (dbcbNameDisc.KeyValue <> NULL) and (Self.IK < 0) then//(dbeNameEd.Text = '') then
      dbeNameEd.Text:= dbcbWarrant.Text + ': ' + dbcbNameDisc.Text;
    if dbcbWarrant.ListSource.DataSet.FieldByName('BitUchpPl').AsBoolean then
    begin
      Label24.Visible:= true;
      Label25.Visible:= true;
      Panel4.Visible:= true;
    end
    else
    begin
      Label24.Visible:= false;
      Label25.Visible:= false;
      Panel4.Visible:= false;
    end;
  end
  else
  begin
    dbcbMW.Enabled:= false;
    dbcbMW.KeyValue:= NULL;
  end;
end;

procedure TfrmMethodWorkAddPlan.dbeCountFactKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not(Key in ['0'..'9']) and (Key <> #8) and (Key <> #46) then
 begin
   Key :=#0;
   Beep;
 end;
end;

procedure TfrmMethodWorkAddPlan.dbeNameEdChange(Sender: TObject);
begin
  IsModified:= (dbcbNameDisc.KeyValue <> NULL) and (dbcbMW.KeyValue <> NULL) and (dbeNameEd.Text <> '') and (dbeVolume.Text <> '');
end;

procedure TfrmMethodWorkAddPlan.dbgFileDblClick(Sender: TObject);
var
  blob: TStream;
  //Application: variant;
begin
  if dbgFile.DataSource.DataSet.FieldByName('BitFile').AsBoolean then
  begin
    SaveDialog1.FileName:= dbgFile.DataSource.DataSet.FieldByName('NameFile').AsString;
    SaveDialog1.DefaultExt:= dbgFile.DataSource.DataSet.FieldByName('TypeFile').AsString;
    //SaveDialog1.FilterIndex:= dbgFile.DataSource.DataSet.FieldByName('FilterIndex').AsInteger;
    SaveDialog1.Filter:= 'Файл|*.' + dbgFile.DataSource.DataSet.FieldByName('TypeFile').AsString;

    if SaveDialog1.Execute then
    begin
      blob := TBlobStream(dbgFile.DataSource.DataSet.CreateBlobStream(dbgFile.DataSource.DataSet.FieldByName('File'), bmRead));
    try
      blob.Seek(0, soFromBeginning);
      with TFileStream.Create(SaveDialog1.FileName, fmCreate) do
      try
        CopyFrom(blob, blob.Size);
      finally
        Free
      end;

      { // для открытия документа Word
      if dbgFile.DataSource.DataSet.FieldByName('IDTypeFile').AsInteger = 1 then
        Application:= CreateOleObject('Word.Application');
      Application.Documents.Open(SaveDialog1.FileName);
      Application.Visible:= true;
      Application.DisplayAlerts:= true;}

      if ShellExecute(0, 'Open', PChar(SaveDialog1.FileName), nil, nil, SW_SHOWNORMAL) < 32 then
      begin
        Application.MessageBox('Указанный файл не найден.','ИС Учебно-методическая работа',MB_OK);
      end;
    finally
      blob.Free;
    end;
    end;
  end

  else //открытие гиперссылки
  begin
      if ShellExecute(handle,'open',PChar((dbgFile.DataSource.DataSet.FieldByName('File') as TBlobField).Value),nil,nil,SW_SHOW) < 32 then
      begin
        Application.MessageBox('Указанный путь не найден.','ИС Учебно-методическая работа',MB_OK);
      end;
  end;

end;

procedure TfrmMethodWorkAddPlan.dbgFileDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if not dbgFile.DataSource.DataSet.FieldByName('BitFile').AsBoolean then
  begin
	with  dbgFile.Canvas do
	begin
    if gdSelected IN State then Font.Color:= vlink
    else Font.Color:= link;
    Font.Style:= [fsUnderline];
		FillRect(Rect);
		TextOut(Rect.Left+2,Rect.Top+2,Column.Field.Text);
	end;
    //dbgFile.Cursor:= crHandPoint;
	end;
  {else
  begin
    dbgFile.Cursor:= crDefault;
    dbgFile.Hint:= '';
  end;}
end;

function TfrmMethodWorkAddPlan.DoApply: boolean;
var
  BitFact, BitFactReal: Boolean;
  fLastMethodWork: integer;
begin
  if dbcbPlan.KeyValue = NULL then
  begin
     Result:= false;
     Application.MessageBox('Необходимо указать учебный год!', 'Сохранение УМР', MB_ICONWARNING);
     exit;
  end;
  if dbeNameEd.Text = '' then
  begin
     Result:= false;
     Application.MessageBox('Необходимо указать наименование УМР!', 'Сохранение УМР', MB_ICONWARNING);
     exit;
  end;
  if dbeVolume.Text = '' then
  begin
     Result:= false;
     Application.MessageBox('Необходимо указать объем УМР!', 'Сохранение УМР', MB_ICONWARNING);
     exit;
  end;

  if (self.Caption = 'Фиксирование факта выполнения УМР') then
    BitFact:= true
  else BitFact:= false;
  if (self.Caption = 'Добавление факта выполнения УМР') or (self.Caption = 'Редактирование УМР факта') then
    BitFactReal:= true
  else BitFactReal:= false;

  if not BitFact and not BitFactReal and (dbcbPlan.ListSource.DataSet.FieldByName('DateRatification').Value <> NULL) then
  begin
     Result:= false;
     Application.MessageBox('План УМР утвержден, сохранение УМР невозможно!', 'Сохранение УМР', MB_ICONWARNING);
     exit;
  end;

  dsState.DataSet.First;
  while (not dsState.DataSet.Eof) do
  begin
   if (dsState.DataSet.FieldByName('NameStatus').Value = NULL) then
    begin
      Result:= false;
      Application.MessageBox('Необходимо указать статус УМР!', 'Сохранение УМР', MB_ICONWARNING);
      exit;
    end;
    if (dsState.DataSet.FieldByName('DateTransitionInState').Value = NULL) then
    begin
      Result:= false;
      Application.MessageBox('Необходимо указать дату!', 'Сохранение УМР', MB_ICONWARNING);
      exit;
    end;
   // проверка на дату (должна укладываться в рамки от 01.09.год текущего плана до 31.08.год следующего года)
   //if (not BitFactReal) and ((YearOf(dsState.DataSet.FieldByName('DateTransitionInState').AsDateTime) <  YearValue)
     //or (YearOf(dsState.DataSet.FieldByName('DateTransitionInState').AsDateTime) > YearValue+1)) then
   if (not BitFactReal) and ((dsState.DataSet.FieldByName('DateTransitionInState').AsDateTime < EncodeDate(dbcbPlan.ListSource.DataSet.FieldByName('year_value').AsInteger, 09, 01))
     or (dsState.DataSet.FieldByName('DateTransitionInState').AsDateTime > EncodeDate(dbcbPlan.ListSource.DataSet.FieldByName('year_value').AsInteger+1, 08, 31))) then
    begin
      Result:= false;
      Application.MessageBox(PChar('Дата должна быть актуальной: от 01.09.' + IntToStr(dbcbPlan.ListSource.DataSet.FieldByName('year_value').AsInteger) + ' до 31.08.' + IntToStr(dbcbPlan.ListSource.DataSet.FieldByName('year_value').AsInteger+1) + '.'), 'Сохранение УМР', MB_ICONWARNING);
      exit;
    end;
  dsState.DataSet.Next;
  end;

  dsDiscEd.DataSet.First;
  while (not dsDiscEd.DataSet.Eof) do
  begin
   if (dsDiscEd.DataSet.FieldByName('cName_disc').Value = NULL) then
    begin
      Result:= false;
      Application.MessageBox('Необходимо выбрать дисциплину, либо удалить пустую запись!', 'Сохранение УМР', MB_ICONWARNING);
      exit;
    end;
  dsDiscEd.DataSet.Next;
  end;

  dsCoautor.DataSet.First;
  while (not dsCoautor.DataSet.Eof) do
  begin
   if (dsCoautor.DataSet.FieldByName('FIO').Value = NULL) then
    begin
      Result:= false;
      Application.MessageBox('Необходимо выбрать соавтора, либо удалить пустую запись!', 'Сохранение УМР', MB_ICONWARNING);
      exit;
    end;
  dsCoautor.DataSet.Next;
  end;

  dsUchPlan.DataSet.Prior;
  if (Panel4.Visible) and (dsUchPlan.DataSet.RecordCount = 0) then
  begin
    Result:= false;
    Application.MessageBox('Необходимо выбрать учебный план!', 'Сохранение УМР', MB_ICONWARNING);
    exit;
  end;
  dsUchPlan.DataSet.First;
  while (not dsUchPlan.DataSet.Eof) do
  begin
   if (dsUchPlan.DataSet.FieldByName('full_name').Value = NULL) then
    begin
      Result:= false;
      Application.MessageBox('Необходимо выбрать учебный план!', 'Сохранение УМР', MB_ICONWARNING);
      exit;
    end;
  dsUchPlan.DataSet.Next;
  end;

  dsFile.DataSet.First;
  while (not dsFile.DataSet.Eof) do
  begin
    if (dsFile.DataSet.FieldByName('NameFile').AsString = '') then
    begin
     Result:= false;
     Application.MessageBox('Необходимо указать наименование файла!', 'Сохранение УМР', MB_ICONWARNING);
     exit;
    end;
  dsFile.DataSet.Next;
  end;

  // !!! вставить проверку на присутствие обязательных полей для плана
  {if (not BitFact) and (not BitFactReal) and (tempStat = 0) then
   begin
      Result:= false;
      Application.MessageBox('Необходимо указать планируемый выпуск УМР!', 'Сохранение планируемой УМР', MB_ICONWARNING);
      exit;
    end; }

  // !!! вставить проверку на последовательность статусов (чтобы возрастание по датам совпадало с возрастанием порядкового номера)
  {
   отсортировать по дате и курсором пробежаться и проверить,
   что предыдущий номер не больше следующего
   select * From MW_Status  
   where OrdinalNumber > (Select OrdinalNumber From MW_State
                       inner join dbo.MW_Status
                       ON MW_State.IDStatus = MW_Status.IDStatus
                       where MW_State.IDMethodEdition = 5
                  and DateTransitionInState = (Select max(DateTransitionInState) From MW_State where MW_State.IDMethodEdition = 5))
    order by NameStatus
   }
if not(NotSave) then
begin
  fLastMethodWork:= IK;
  TMethodWorkController.Instance.SavePlan(BitFact, BitFactReal, fLastMethodWork,
   dbeNameEd.Text, strToInt(dbeVolume.Text), dbeCode.Text, dbeCharact.Text,
   dbeDraw.Text, dbePos.Text, dbeMark.Text,
   dbcbMW.ListSource.DataSet.FieldByName('IDContentNorm').AsInteger, dbcbPlan.ListSource.DataSet.FieldByName('IDPlanMW').AsInteger,
   PrepIK, dbcbNameDisc.ListSource.DataSet.FieldByName('iK_disc').AsInteger,
   dbcCurrentEd.Checked, dbeCountFact.Text);
  IK:= fLastMethodWork;
end;

  Result:= true;
end;

function TfrmMethodWorkAddPlan.DoCancel: boolean;
begin
  if Self.IK < 0 then
  case (Application.MessageBox('Сохранить внесенные изменения?','Изменение информации о запланированных УМР', MB_YESNOCANCEL)) of
      mrYes:
        begin
          OK;
          Result:= false;
        end;
      mrNo: Result:= true;
      mrCancel: Result:= false;
      else Result:= false;
  end
  else Result:= true;
end;

procedure TfrmMethodWorkAddPlan.Read(KafIK: integer; BitPlan, BitFact: Boolean);
begin
  TGeneralController.Instance.InitializeLockupCB(@dbcbPlan, 'ik_year', 'UchYear');
  TGeneralController.Instance.InitializeLockupCB(@dbcbNameDisc, 'iK_disc', 'cName_disc');
  TGeneralController.Instance.InitializeLockupCB(@dbcbWarrant, 'IDWarrant', 'NameWarrant');
  TGeneralController.Instance.InitializeLockupCB(@dbcbMW, 'IDContentNorm', 'NameW');

  dbcbPlan.KeyValue:= TMethodWorkController.Instance.GetPlanMWForPlan(@dbcbPlan.ListSource.DataSet, KafIK, false, true);
  dbcbNameDisc.KeyValue:= TMethodWorkController.Instance.GetDiscForDialogPlan(@dbcbNameDisc.ListSource.DataSet, false);
  dbcbWarrant.KeyValue:= TMethodWorkController.Instance.GetWarrant(@dbcbWarrant.ListSource.DataSet, false);

  dbgFile.DataSource.DataSet:= TMethodWorkController.Instance.LoadFile(self.IK);

  if BitPlan then //Начало добавления плана
  begin
  //self.Height:= self.Height - 71;
  Label29.Visible:= true;

  if (self.IK < 0) then
  begin
    Caption:= 'Добавление УМР в текущий план';
    dbcbPlan.ListSource.DataSet.Filter:= 'DateRatification = null';
    dbcbPlan.ListSource.DataSet.Filtered:= True;

    dbgState.DataSource.DataSet:= TMethodWorkController.Instance.LoadState(1, 0);
    dsState.DataSet.FieldByName('NameStatus').LookupDataSet.First;
    while (not dsState.DataSet.FieldByName('NameStatus').LookupDataSet.Eof) do
    begin
      if dsState.DataSet.FieldByName('NameStatus').LookupDataSet.FieldByName('Bit_obligation').AsBoolean then
      begin
        dbgState.DataSource.DataSet.Insert;
        dbgState.DataSource.DataSet.FieldByName('IDStatus').Value:= dsState.DataSet.FieldByName('NameStatus').LookupDataSet.FieldByName('IDStatus').Value;
        //dbgState.DataSource.DataSet.FieldByName('DateTransitionInState').AsDateTime:= IncMonth(Today, dbcbMW.ListSource.DataSet.FieldByName('CountYear').AsInteger);
        dbgState.DataSource.DataSet.Next;
      end;
      dsState.DataSet.FieldByName('NameStatus').LookupDataSet.Next;
    end;

    dbgCoautor.DataSource.DataSet:= TMethodWorkController.Instance.LoadCoautor(KafIK, 0);
    dbgDisc.DataSource.DataSet:= TMethodWorkController.Instance.LoadDiscInDBGrid(KafIK, 0);
    dbgUchPlan.DataSource.DataSet:= TMethodWorkController.Instance.LoadUchPlan(KafIK, 0);
  end
  else
  begin
    Caption:= 'Редактирование УМР текущего плана';
    dbgState.DataSource.DataSet:= TMethodWorkController.Instance.LoadState(1, self.IK);
    dbgCoautor.DataSource.DataSet:= TMethodWorkController.Instance.LoadCoautor(KafIK, self.IK);
    dbgDisc.DataSource.DataSet:= TMethodWorkController.Instance.LoadDiscInDBGrid(KafIK, self.IK);
    dbgUchPlan.DataSource.DataSet:= TMethodWorkController.Instance.LoadUchPlan(KafIK, self.IK);
  end;
  end //Конец добавления плана

  else //Начало добавления факта
  begin
  Label15.Visible:= true;
  Label26.Visible:= true;
  dbeMark.Visible:= true;
  dbcbPlan.Enabled:= false;
  dbcbNameDisc.Enabled:= false;

  if (not BitFact) then
  begin
    Caption:= 'Фиксирование факта выполнения УМР';
    dbgState.DataSource.DataSet:= TMethodWorkController.Instance.LoadState(0, 0);
    dbgCoautor.DataSource.DataSet:= TMethodWorkController.Instance.LoadCoautor(KafIK, self.IK);
    dbgDisc.DataSource.DataSet:= TMethodWorkController.Instance.LoadDiscInDBGrid(KafIK, self.IK);
    dbgUchPlan.DataSource.DataSet:= TMethodWorkController.Instance.LoadUchPlan(KafIK, self.IK);
    dbeMark.Text:= 'Выполнено';
  end

  else
  if (self.IK < 0) then
  begin
    Caption:= 'Добавление факта выполнения УМР';
    dbcbNameDisc.Enabled:= true;
    dbcbWarrant.Enabled:= true;
    dbcbMW.Enabled:= false;
    ToolButton1.Visible:= false;
    ToolButton2.Visible:= false;
    dbgState.DataSource.DataSet:= TMethodWorkController.Instance.LoadState(0, 0);
    dbgCoautor.DataSource.DataSet:= TMethodWorkController.Instance.LoadCoautor(KafIK, 0);
    dbgDisc.DataSource.DataSet:= TMethodWorkController.Instance.LoadDiscInDBGrid(KafIK, 0);
    dbgUchPlan.DataSource.DataSet:= TMethodWorkController.Instance.LoadUchPlan(KafIK, 0);
  end
  else
  begin
    Caption:= 'Редактирование УМР факта';
    dbgState.DataSource.DataSet:= TMethodWorkController.Instance.LoadState(0, self.IK);
    dbgCoautor.DataSource.DataSet:= TMethodWorkController.Instance.LoadCoautor(KafIK, self.IK);
    dbgDisc.DataSource.DataSet:= TMethodWorkController.Instance.LoadDiscInDBGrid(KafIK, self.IK);
    dbgUchPlan.DataSource.DataSet:= TMethodWorkController.Instance.LoadUchPlan(KafIK, self.IK);
  end;

  if (not BitFact) or (self.IK < 0) then
  begin
    dsState.DataSet.FieldByName('NameStatus').LookupDataSet.First;
    while (not dsState.DataSet.FieldByName('NameStatus').LookupDataSet.Eof) do
    begin
      if dsState.DataSet.FieldByName('NameStatus').LookupDataSet.FieldByName('Bit_obligation').AsBoolean then
      begin
        dbgState.DataSource.DataSet.Insert;
        dbgState.DataSource.DataSet.FieldByName('IDStatus').Value:= dsState.DataSet.FieldByName('NameStatus').LookupDataSet.FieldByName('IDStatus').Value;
        dbgState.DataSource.DataSet.FieldByName('DateTransitionInState').AsDateTime:= Today;
        dbgState.DataSource.DataSet.Next;
      end;
      dsState.DataSet.FieldByName('NameStatus').LookupDataSet.Next;
    end;
  end;

  end; //Конец добавления факта
end;

end.
