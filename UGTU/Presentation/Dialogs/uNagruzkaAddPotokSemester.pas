unit uNagruzkaAddPotokSemester;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, DBGridEh, Mask,
  DBCtrlsEh, DBLookupEh, NagruzkaController, GeneralController, ADODB;

type

  TPotokNode = class
  private
    fPotokIK: integer;
    fPotokSemester: integer;
    fPotokName: string;
  public
    constructor Create(APotokIK, APotokSemester: integer; APotokName: string);
    property PotokIK: integer read fPotokIK write fPotokIK;
    property PotokSemester: integer read fPotokSemester write fPotokSemester;
    property PotokName: string read fPotokName write fPotokName;
  end;

  TfrmAddPotokSemester = class(TfrmBaseDialog)
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    dbcbSemester: TDBLookupComboboxEh;
    ListBox1: TListBox;
    ListBox2: TListBox;
    sbAddManySpec: TSpeedButton;
    sbAddOneSpec: TSpeedButton;
    sbDelOneSpec: TSpeedButton;
    sbDelManySpec: TSpeedButton;
    Label2: TLabel;
    dbcbYear: TDBLookupComboboxEh;
    procedure dbcbYearKeyValueChanged(Sender: TObject);
    procedure dbcbSemesterKeyValueChanged(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure sbDelOneSpecClick(Sender: TObject);
    procedure sbAddOneSpecClick(Sender: TObject);
    procedure sbAddManySpecClick(Sender: TObject);
    procedure sbDelManySpecClick(Sender: TObject);
  private
    { Private declarations }
    fYearIK: integer;
    fSemIK: integer;
    fFormStartClosing: boolean;
    procedure LoadPotokForSemester(aSemIK, aYearIK: integer; albx: TListBox);
    procedure FilterOrderPotok;
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    { Public declarations }
    property YearIK: integer read fYearIK write fYearIK;
    property SemIK: integer read fSemIK write fSemIK;
    destructor Destroy; override;
    procedure Read;
  end;

var
  frmAddPotokSemester: TfrmAddPotokSemester;

implementation

{$R *.dfm}

{ TfrmAdPotokSemester }

procedure TfrmAddPotokSemester.dbcbSemesterKeyValueChanged(Sender: TObject);
begin
  inherited;
  ListBox1.Clear;
  if (Sender as TDBLookupComboboxEh).KeyValue<>null then
  begin
    LoadPotokForSemester((Sender as TDBLookupComboboxEh).KeyValue, dbcbYear.KeyValue,ListBox1);
  end;
  FilterOrderPotok;
end;

procedure TfrmAddPotokSemester.dbcbYearKeyValueChanged(Sender: TObject);
begin
  inherited;
  ListBox1.Clear;
  dbcbSemester.KeyValue := null;
end;

destructor TfrmAddPotokSemester.Destroy;
var i: integer;
begin
  fFormStartClosing:= true;
  if ListBox1.Items.Count > 0 then
    for I := 0 to ListBox1.Items.Count - 1 do
      if Assigned(ListBox1.Items.Objects[i]) then
        ListBox1.Items.Objects[i].Free;
  if ListBox2.Items.Count > 0 then
    for I := 0 to ListBox2.Items.Count - 1 do
      if Assigned(ListBox2.Items.Objects[i]) then
        ListBox2.Items.Objects[i].Free;
  TGeneralController.Instance.ReleaseLockupCB(@dbcbSemester);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbYear);
  inherited;
end;

function TfrmAddPotokSemester.DoApply: boolean;
var i: integer;
  PotokIK: TStringList;
begin
  PotokIK:= TStringList.Create;
  try
    for I := 0 to ListBox2.Count - 1 do
       PotokIK.Add(IntToStr(TPotokNode(ListBox2.Items.Objects[i]).PotokIK));
    Result:= TNagruzkaController.Preparation.LoadPotoksToSemester(IK, fYearIK, fSemIK, PotokIK);
  finally
    PotokIK.Free;
  end;
end;

function TfrmAddPotokSemester.DoCancel: boolean;
begin
case (Application.MessageBox('—охранить внесенные изменени€?','»змение информации о событии', MB_YESNOCANCEL)) of
      mrYes: OK;
      mrNo: Result:= true;
      mrCancel: Result:= false;
      else Result:= false;
  end;
end;

procedure TfrmAddPotokSemester.FilterOrderPotok;
var i,j: integer;
begin
  for I := 0 to ListBox2.Count - 1 do
  begin
    j:=0;
    while j < ListBox1.Count do
      if TPotokNode(ListBox2.Items.Objects[i]).fPotokIK=TPotokNode(ListBox1.Items.Objects[j]).fPotokIK then
        ListBox1.Items.Delete(j) else inc(j);
  end;
end;

procedure TfrmAddPotokSemester.ListBox1Click(Sender: TObject);
begin
  inherited;
  sbAddManySpec.Enabled:= ListBox1.SelCount > 1;
  sbAddOneSpec.Enabled:= ListBox1.SelCount = 1;
  sbDelOneSpec.Enabled:= false;
  sbDelManySpec.Enabled:= false;
end;

procedure TfrmAddPotokSemester.ListBox2Click(Sender: TObject);
begin
  inherited;
  sbAddManySpec.Enabled:= false;
  sbAddOneSpec.Enabled:= false;
  sbDelOneSpec.Enabled:= ListBox2.SelCount = 1;
  sbDelManySpec.Enabled:= ListBox2.SelCount > 1;
end;

procedure TfrmAddPotokSemester.LoadPotokForSemester(aSemIK, aYearIK: integer; albx: TListBox);
begin
  albx.Clear;
  DataSet.Close;
  //загрузить все потоки выбранного семестра
  (DataSet as TADODataSet).CommandText:='select p.ik_potok,ps.ik_potok_semestr,Cname_potok from dbo.Relation_potok_kaf rpk inner join dbo.Potok p'
                                        +' on rpk.ik_potok=p.ik_potok inner join dbo.Potok_semestr ps'
                                        +' on p.ik_potok=ps.id_potok where id_year = '+IntToStr(aYearIK)
                                        +' and id_sem_type = '+IntToStr(aSemIK)+' and ik_kaf='+IntToStr(IK);
  DataSet.Open;
  DataSet.First;
  while (not DataSet.Eof) do
  begin
    albx.AddItem(DataSet.FieldByName('Cname_potok').AsString, TPotokNode.Create(DataSet.FieldByName('ik_potok').AsInteger,
                                     DataSet.FieldByName('ik_potok_semestr').AsInteger, DataSet.FieldByName('Cname_potok').AsString));
    DataSet.Next;
  end;

end;

procedure TfrmAddPotokSemester.Read;
begin
  fFormStartClosing:= false;
  DataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  TGeneralController.Instance.InitializeLockupCB(@dbcbYear, 'ik_year_uch_pl', 'big_year_value');
  TGeneralController.Instance.InitializeLockupCB(@dbcbSemester, 'ik_sem_type', 'Cname_sem_type');
  TNagruzkaController.Directory.GetAllYears(@dbcbYear.ListSource.DataSet, false, NULL);
  TNagruzkaController.Directory.GetAllSemesters(@dbcbSemester.ListSource.DataSet);

  //установить предыдущий сместр по умолчанию
  dbcbYear.KeyValue := fYearIK;
  dbcbSemester.KeyValue := fSemIK;
  DataSet:= TGeneralController.Instance.GetNewADODataSet(false);

  //загрузить потоки за текущий период
  LoadPotokForSemester(fSemIK, fYearIK, ListBox2);
  FilterOrderPotok;




end;

procedure TfrmAddPotokSemester.sbAddManySpecClick(Sender: TObject);
var
  i: integer;
begin
  for i:=0 to ListBox1.Items.Count-1 do
    if ListBox1.Selected[i] then ListBox2.AddItem(ListBox1.Items[i], ListBox1.Items.Objects[i]);
  FilterOrderPotok;
  ListBox2.Sorted := true;
  IsModified:=true;
end;

procedure TfrmAddPotokSemester.sbAddOneSpecClick(Sender: TObject);
begin
  inherited;
  ListBox2.AddItem(ListBox1.Items[ListBox1.ItemIndex], ListBox1.Items.Objects[ListBox1.ItemIndex]);
  ListBox1.Items.Delete(ListBox1.ItemIndex);
  IsModified:=true;
end;

procedure TfrmAddPotokSemester.sbDelManySpecClick(Sender: TObject);
var i: integer;
begin
  i:=0;
  while i<ListBox2.Items.Count do
    if ListBox2.Selected[i] then ListBox2.Items.Delete(i)
      else inc(i);
  LoadPotokForSemester(dbcbSemester.KeyValue, dbcbYear.KeyValue, ListBox1);
  FilterOrderPotok;
  ListBox1.Sorted := true;
  IsModified:=true;
end;

procedure TfrmAddPotokSemester.sbDelOneSpecClick(Sender: TObject);
begin
  inherited;
  ListBox2.Items.Delete(ListBox2.ItemIndex);
  LoadPotokForSemester(dbcbSemester.KeyValue, dbcbYear.KeyValue, ListBox1);
  FilterOrderPotok;
  IsModified:=true;
end;

{ TPotokNode }

constructor TPotokNode.Create(APotokIK, APotokSemester: integer; APotokName: string);
begin
  fPotokIK:= APotokIK;
  fPotokSemester := APotokSemester;
  fPotokName:= APotokName;
end;

end.
