{ -----------------------------------------------------------
  ������ AbitZachislenieController:
  TAbitZachislenieController - ���������� ����������
  "����������" ���������� ������������
  ���� ��������: 20.10.2007
  ���� ���������� ���������: 30.10.2007
  �����������: ������� �.�.
  ----------------------------------------------------------- }
unit uAbitZachislenieController;

{ #Author tanyav@ist.ugtu.net }
interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, ADODB, DB, uDM,
  Forms, Dialogs, DBLookupEh, Variants, StdCtrls, GeneralController, Grids,
  ExcelXP, ComObj, DBGrids, uJoinGroup, uAbitZach, ABIT_zachislenie_frame,
  DBGridEh, ApplicationController, ExceptionBase, DateUtils, ConstantRepository;

type
  PDBGrid = ^TDBGridEh;

  TAbitZachislenieController = class(TObject)
  protected
    constructor CreateInstance;
    // AccessInstance ������������� ������ � ���������� �����������
    class function AccessInstance(Request: Integer): TAbitZachislenieController;
    // AccessDataSetInstance ������������� ������ � DataSet
    function AccessDataSetInstance(nnyear: Integer = 0): TDataSet;

    constructor Create;

  public

    // Instance - ���������� �������� ������� �����������
    class function Instance: TAbitZachislenieController;
    // ReleaseInstance - ���������� ����������
    class procedure ReleaseInstance;

    // DataSetInstance ���������� DataSet
    function DataSetInstance(nnyear, ik_fac, ik_spec_fac: Integer): TDataSet;
    // ReleaseDataSetInstance - ���������� DataSet
    class procedure ReleaseDataSetInstance;

    // RefreshAbitList ��������� ������ ������������
    // (������ ��������� �� ����)
    procedure RefreshAbitList();

    // GetAbitSpisLoadAbitListok ��������� ������ ������������
    function LoadAbitList(nnyear: Integer): Variant;
    // SetAbitSpisokFilter ��������� ������ ������������ �� ���� ��������� ����������
    // �, ���� �����, �� ���� ��������� �����������
    procedure SetAbitSpisokFilter(ik_typeSostZach: Integer;
      ik_typeKatZach: Variant);

    // GetTypeKatZach ��������� ������ ����� ��������� ����������
    function GetTypeKatZach(SourceDataSet: PDataSet): Variant;

    // GetProhBalls ��������� ��������� ����� � DataSet
    function GetProhBalls(SourceDataSet: PDataSet;
      nnyear, ik_fac, ik_spec_fac: Integer): Variant;
    // IsAbit_HaveAllExam ���������, ���� �� � ����������� ������ ��������
    function IsAbit_HaveAllExam(): boolean;
    // IsAbit_HaveAllDocs ���������, ���� �� � ����������� ��� ���������
    function IsAbit_HaveAllDocs(): boolean;
    // IsAbit_HaveZachN ���������, ���� �� � ����������� ����� �������� ������
    function IsAbit_HaveZachN(): boolean;
    // IsAbit_CanBeZachisl ���������, ����� �� ��������� ����������� � ������ "��������"
    function IsAbit_CanBeZachisl(): boolean;
    // Abit_Get_Ball ���������� ��������� ���� ��� ��������� ����������� ������
    function Abit_Get_Ball(NNrecord, Category: Integer): Integer;
    // IsAbit_ProhodBall ���������, ������ �� ���������� ��������� ����
    function IsAbit_ProhodBall(): boolean;
    // Abit_StateChange ������ ��������� ���������� �����������
    function Abit_StateChange(nnAbit, state, aIKPrik: Integer): boolean;
    // Abit_Join ��������� ����������� (������ ��� ��������� �� �����������,
    // �� �� ��������� ��� � ������)
    procedure Abit_Join(nnAbit, aIKPrik: Integer; aNumPrik: TDate);
    // Abit_Current ���������� ����������� �� ������ �����������
    // � ��������������� ������ �� �����������
    function Abit_Current(nnAbit: Integer): boolean;
    // Abit_Reserve �������� ����������� � ������
    procedure Abit_Reserve(nnAbit: Integer);
    // Abit_Exile ����������� ����������� ������ �� ��������
    procedure Abit_Exile(nnAbit: Integer);
    // Abit_DelZachGrup ������� ������� � ����� ������� � �������
    // �������
    procedure Abit_DelZachGrup(ik_zach: Integer);

    // GetJoinCauses ��������� ������� ����������� � DataSet
    function GetJoinCauses(SourceDataSet: PDataSet): Variant;

    // GetPrikazList ��������� c����� �������� � DataSet
    function GetPrikazList(SourceDataSet: PDataSet): Variant;

    // GetGrupList ��������� ������ ��������� ����� � DataSet
    function GetGrupList(SourceDataSet: PDataSet;
      ik_spec_fac, nnyear: Integer): Variant;

    // Abit_AppendRecordBook �������/p���������� ������� (����� �������)
    // � ���������� ����� �����
    function Abit_AppendRecordBook(flag, code, zach: Integer;
      nzach: string): Integer;
    // Abit_CreateRecordBook ������� ������� (����� �������)
    // � ���������� ����� �����
    function Abit_CreateRecordBook(code: Integer): Integer;
    // Abit_ChangeRecordBook p���������� ������� (����� �������)
    function Abit_ChangeRecordBook(code, zach: Integer; nzach: string): boolean;

    // Abit_AppendStudGrup �������/p���������� �����
    // �������� � ������
    function Abit_AppendStudGrup(flag, grup, zach, KatZach, priczach: Integer;
      cObosnZach: string): Integer;

    // Abit_CreateStudGrup ������� �����
    // �������� � ������
    function Abit_CreateStudGrup(code, grup, zach, KatZach, priczach: Integer;
      cNameGrup, cObosnZach: string): boolean;

    // Abit_ChangeStudGrup p���������� ������� �����
    // �������� � ������
    function Abit_ChangeStudGrup(code, newgrup, zach: Integer;
      cNameGrup: string): boolean;

    // Abit_JoAbit_IsOldZach ��������� ���� �� ��� ��������
    // ����� ������� � ���� (���� ����, ���������� true)
    function Abit_IsOldZach(nzach: string): boolean;

    // GetNewNZach ���������� ����� ����� ������� ��� ��������� ����
    // (�� 1 ������ ������������� �� ������������)
    function GetNewNZach(year: Integer): string;

    // Abit_JoinGroup ��������� �������� � ������
    // (������ ����� ������� � ����� � �������)
    function Abit_JoinGroup(grid: PDBGrid): boolean;

    // Abit_ZachPrikaz ��������� �������� � ��������
    function Abit_ZachWithPrikaz(grid: PDBGrid): boolean;

    // ��������� ������� ��� ����������� ������������
    function Abit_AppointPrikaz(grid: PDBGrid): boolean;

    //������� ������������ �� ������
     function Abit_DeleteFromGroup(grid: PDBGrid): boolean;

    // Abit_JoinGroup ������ ������ � (���) ����� ������� �������� � �������
    function Abit_ChangeGroup(grid: PDBGrid): boolean;

    // ����� ��������������� ������� � Excel
    // SetColor ����������� ������� � ������ ����
    procedure SetColor(i: Integer; Color: TColor; Worksheet: Variant);

    // AbitsToExcel ������� � Excel ���������������
    // ������ ������������ �� ����������
    procedure AbitsToExcel(flColor: boolean);

    // AbitsWithPolozhOcenkiToExcel ������� � Excel ���������������
    // ������ ������������ ��� � ������ � �������. ��������
    function AbitsWithPolozhOcenkiToExcel(grid: PDBGrid): boolean;

    // SpecPrikazToWord ������������ � Word ������ �� ����������
    // ��������������� �� ��������������
    procedure SpecPrikazToWord(grid: PDBGrid);

    // GroupPrikazToWord ������������ � Word ������ �� ����������
    // ��������������� �� �������
    procedure GroupPrikazToWord(grid: PDBGrid);

    // ExportProtokolToExcel ������� ��������� � ���������� � Excel
    procedure ExportProtokolToExcel;

    // AddAllProhBalls ��������� ��� ��������� ����� ��� ������ ���
    // ��� ���� ������� �������� ����
    procedure AddAllProhBalls(nnyear, ik_fac, ik_spec_fac: Variant);

  end;

implementation

var
  // FAbitZachislenieControllerInstance - ��������� �����������
  FAbitZachislenieControllerInstance: TAbitZachislenieController = nil;
  // FAbitListDataSetInstance - ��������� DataSet �� ������� ������������
  FAbitListDataSetInstance: TDataSet = nil;
  // ��� ����������� ������������
  Fnnyear: Integer = -1;
  Fik_fac: Integer = -1; // ��� ����������
  Fik_spec_fac: Integer = -1; // ��� �������������
  FLoaded: boolean = false;

constructor TAbitZachislenieController.CreateInstance;
begin
  inherited Create;
end;

constructor TAbitZachislenieController.Create;
begin
  inherited Create;
  raise Exception.CreateFmt
    ('������ � ������ %s ����� �������� ������ ����� ���� Instance!',
    [ClassName]);
end;

class function TAbitZachislenieController.AccessInstance(Request: Integer)
  : TAbitZachislenieController;
begin
  case Request of
    0:
      ;
    1:
      if not Assigned(FAbitZachislenieControllerInstance) then
        FAbitZachislenieControllerInstance := CreateInstance;
    2:
      if FAbitZachislenieControllerInstance <> nil then
      begin
        FAbitZachislenieControllerInstance.Free;
        FAbitZachislenieControllerInstance := nil;
      end;
  else
    raise EApplicationException.Create('������ � ���������!',
      Exception.CreateFmt
      ('����������� �������� ��������� %d � ������ AccessInstance ����������� AbitZachislenieController',
      [Request]));
  end;
  Result := FAbitZachislenieControllerInstance;
end;

class procedure TAbitZachislenieController.ReleaseInstance;
begin
  ReleaseDataSetInstance;
  AccessInstance(2);
end;

class procedure TAbitZachislenieController.ReleaseDataSetInstance;
begin
  if FAbitListDataSetInstance <> nil then
  begin
    FAbitListDataSetInstance.Free;
    FAbitListDataSetInstance := nil;
  end;

end;

class function TAbitZachislenieController.Instance: TAbitZachislenieController;
begin
  Result := AccessInstance(1);
end;

function TAbitZachislenieController.AccessDataSetInstance(nnyear: Integer = 0)
  : TDataSet;
begin
  if not Assigned(FAbitListDataSetInstance) then
  begin
    FAbitListDataSetInstance := TADODataSet.Create(nil);
    LoadAbitList(nnyear);
    FAbitListDataSetInstance.FieldByName('SummBall').Alignment := taLeftJustify;
    Fnnyear := nnyear;
  end
  else
  {
    ���������, ����� ��� ����������� �������������� ������
    �������� � ����� ����������� ������������ ������ ������������
    �����, ������ ��������� ������ ��� ��������� ���� }
  begin
    if (nnyear <> Fnnyear) or (not FAbitListDataSetInstance.Active) then
    begin
      LoadAbitList(nnyear);
      Fnnyear := nnyear;
    end;
  end;
  Result := FAbitListDataSetInstance;
end;

function TAbitZachislenieController.DataSetInstance(nnyear, ik_fac,
  ik_spec_fac: Integer): TDataSet;
begin
  // ������� DataSet � ��������� ������ � ����
  Result := AccessDataSetInstance(nnyear);
  Fik_spec_fac := ik_spec_fac;
  Fik_fac := ik_fac;
end;

// ��������� ������ ������������
function TAbitZachislenieController.LoadAbitList(nnyear: Integer): Variant;
begin
  TADODataSet(FAbitListDataSetInstance).LockType := ltBatchOptimistic;
  Result := TGeneralController.Instance.getDataSetValues
    (@FAbitListDataSetInstance, 'exec ABIT_GetAbitListForZachisl ' +
    IntToStr(nnyear), 'nn_abit', false, NULL);
end;

procedure TAbitZachislenieController.RefreshAbitList();
begin
  TApplicationController.GetInstance.AddLogEntry
    ('���������� ������ ������������.');
  FAbitListDataSetInstance.Close;
  FAbitListDataSetInstance.Open;
end;

procedure TAbitZachislenieController.SetAbitSpisokFilter(ik_typeSostZach
  : Integer; ik_typeKatZach: Variant);
var
  filter: string;
begin
  filter := '';
  if Fik_fac > 0 then
    filter := filter + '(ik_fac=' + IntToStr(Fik_fac) + ')';
  if (Fik_spec_fac > 0) then
  begin
    if filter <> '' then
      filter := filter + ' and ';
    filter := filter + '(ik_spec_fac=' + IntToStr(Fik_spec_fac) + ')';
  end;
  if filter <> '' then
    filter := filter + ' and ';
  filter := filter + '(ik_type_zach=' + IntToStr(ik_typeSostZach) + ')';
  if ik_typeKatZach <> NULL then
    filter := filter + ' and (ik_type_kat=' + IntToStr(ik_typeKatZach) + ')';
  FAbitListDataSetInstance.filter := filter;
  FAbitListDataSetInstance.Filtered := true;

end;

// ��������� ������ ����� ��������� ����������
function TAbitZachislenieController.GetTypeKatZach(SourceDataSet
  : PDataSet): Variant;
begin
  Result := TGeneralController.Instance.getDataSetValues(SourceDataSet,
    'select * from TypeKatZach', 'ik_type_kat', false, NULL);
end;

function TAbitZachislenieController.GetProhBalls(SourceDataSet: PDataSet;
  nnyear, ik_fac, ik_spec_fac: Integer): Variant;
var
  filter: string;
begin
  if nnyear > 0 then
    filter := '(nnyear=' + IntToStr(nnyear) + ')';
  if ik_fac > 0 then
    filter := filter + ' and (ik_fac=' + IntToStr(ik_fac) + ')';
  if ik_spec_fac > 0 then
    filter := filter + ' and (ik_spec_fac=' + IntToStr(ik_spec_fac) + ')';
  if filter <> '' then
    Result := TGeneralController.Instance.getDataSetValues(SourceDataSet,
      'select * from ABIT_MinBalls WHERE ' + filter, 'ik_disc_nabor',
      false, NULL)
  else
    Result := TGeneralController.Instance.getDataSetValues(SourceDataSet,
      'select * from ABIT_MinBalls', 'ik_disc_nabor', false, NULL);
end;

function TAbitZachislenieController.IsAbit_CanBeZachisl: boolean;
begin
  Result := (IsAbit_HaveAllExam) and (IsAbit_HaveAllDocs);
end;

function TAbitZachislenieController.IsAbit_HaveAllDocs: boolean;
begin
  Result := not((FAbitListDataSetInstance.FieldByName('ik_doc_edu')
    .Value = NULL) or (FAbitListDataSetInstance.FieldByName('ik_doc_ident')
    .Value = NULL));
end;

function TAbitZachislenieController.IsAbit_HaveAllExam(): boolean;
begin
  Result := FAbitListDataSetInstance.FieldByName('notExam').Value = NULL;
end;

function TAbitZachislenieController.IsAbit_HaveZachN: boolean;
begin
  Result := not(FAbitListDataSetInstance.FieldByName('Nn_zach').Value = NULL);
end;

function TAbitZachislenieController.Abit_Get_Ball(NNrecord,
  Category: Integer): Integer;
begin
  Result := 100;
  exit;

  { if not (adodsBalls.Active) then
    adodsBalls.Active:=true;

    adodsBalls.Filter:='((NnRecord='''+inttostr(NNrecord)+''') and (ik_kat_zach='+inttostr(Category)+'))';
    adodsBalls.Filtered:=true;
    if adodsBalls.RecordCount=0 then
    result:=0
    else
    result:=adodsBalls.FieldValues['Ball']; }
end;

function TAbitZachislenieController.IsAbit_ProhodBall(): boolean;
begin
  // Result:=true;     //���� ���������� ������ true
  // exit;

  if FAbitListDataSetInstance.FieldByName('SummBall').Value = NULL then
    Result := false
  else
    Result := (FAbitListDataSetInstance.FieldByName('SummBall').Value >=
      Abit_Get_Ball(FAbitListDataSetInstance.FieldByName('NNRecord').Value,
      FAbitListDataSetInstance.FieldByName('ik_kat_zach').Value));
end;

function TAbitZachislenieController.Abit_StateChange(nnAbit, state,
  aIKPrik: Integer): boolean;
var
  tempStoredProc: TADOStoredProc;
begin
  Result := false;
  tempStoredProc := TADOStoredProc.Create(nil);
  try
    tempStoredProc.ProcedureName := 'ABIT_Zachisl;1';
    tempStoredProc.Connection := dm.DBConnect;
    tempStoredProc.Parameters.CreateParameter('@nn_abit', ftInteger, pdInput,
      0, nnAbit);
    tempStoredProc.Parameters.CreateParameter('@ik_zach', ftInteger, pdInput,
      0, state);
    tempStoredProc.Parameters.CreateParameter('@ik_prikaz_zach', ftInteger,
      pdInput, 0, aIKPrik);
    tempStoredProc.ExecProc;
    Result := true;
  finally
    tempStoredProc.Free;
  end;
end;

function TAbitZachislenieController.Abit_ZachWithPrikaz(grid: PDBGrid): boolean;
var
  i, ikPrik: Integer;
  DatePrik: TDate;
begin
  TApplicationController.GetInstance.AddLogEntry
    ('���������� ������������ � ��������.');
  // ������� ������ � �������� ��� ��� � �������������
  frmAbitZachDialog := TfrmAbitZachDialog.Create(nil);
  try
    frmAbitZachDialog.ShowModal;
    if frmAbitZachDialog.mrOk then
    begin
      ikPrik := frmAbitZachDialog.dbcbeOrder.KeyValue;
      DatePrik := frmAbitZachDialog.dPrikaz;
      for i := 0 to (grid.SelectedRows.Count - 1) do
      begin
        grid.DataSource.DataSet.GotoBookmark(Pointer(grid.SelectedRows[i]));
        if TAbitZachislenieController.Instance.IsAbit_CanBeZachisl then
        begin
          TAbitZachislenieController.Instance.Abit_Join
            (grid.DataSource.DataSet.FieldValues['NN_abit'], ikPrik, DatePrik);
        end;
      end;
    end;
  except

  end;
end;

procedure TAbitZachislenieController.Abit_Join(nnAbit, aIKPrik: Integer;
  aNumPrik: TDate);
begin

  TApplicationController.GetInstance.AddLogEntry('���������� ����������� ' +
    FAbitListDataSetInstance.FieldByName('fio').AsString);

  if Abit_StateChange(nnAbit, 6, aIKPrik) then
  begin
    FAbitListDataSetInstance.Edit;
    FAbitListDataSetInstance.FieldByName('cname_zach').Value := '��������';
    FAbitListDataSetInstance.FieldByName('ik_zach').Value := 6;
    FAbitListDataSetInstance.FieldByName('ik_type_zach').Value := 2;
    FAbitListDataSetInstance.FieldByName('Dd_prikaz').Value := aNumPrik;
    FAbitListDataSetInstance.Next;
  end;

end;

procedure TAbitZachislenieController.Abit_Reserve(nnAbit: Integer);
begin
  TApplicationController.GetInstance.AddLogEntry('�������� ����������� � ������'
    + FAbitListDataSetInstance.FieldByName('fio').AsString);

  if Abit_StateChange(nnAbit, 4, 0) then
  begin
    FAbitListDataSetInstance.Edit;
    FAbitListDataSetInstance.FieldByName('cname_zach').Value := '� �������';
    FAbitListDataSetInstance.FieldByName('ik_zach').Value := 4;
    FAbitListDataSetInstance.FieldByName('ik_type_zach').Value := 1;
    FAbitListDataSetInstance.Next;
  end;
end;

function TAbitZachislenieController.Abit_DeleteFromGroup(
  grid: PDBGrid): boolean;
var i: integer;
begin
  TApplicationController.GetInstance.AddLogEntry
    ('�������� ������������ �� ����������� � ������.');
  try
    for i := 0 to (grid.SelectedRows.Count - 1) do
    begin
      grid.DataSource.DataSet.GotoBookmark(Pointer(grid.SelectedRows[i]));
      Abit_DelZachGrup(grid.DataSource.DataSet.FieldValues['BookKey']);
      FAbitListDataSetInstance.Edit;
      FAbitListDataSetInstance.FieldByName('Cname_grup').Value := '';
      FAbitListDataSetInstance.FieldByName('Ik_grup').Value := NULL;
      FAbitListDataSetInstance.FieldByName('Ik_prikazzach').Value := NULL;
      FAbitListDataSetInstance.FieldByName('Ik_priczach').Value := NULL;
    end;
  except

  end;
end;

procedure TAbitZachislenieController.Abit_DelZachGrup(ik_zach: Integer);
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc := TADOStoredProc.Create(nil);
  try
    // ������� ������� ��� ������
    tempStoredProc.Connection := dm.DBConnect;
    tempStoredProc.ProcedureName := 'DelStudGrup;1';
    tempStoredProc.Parameters.Clear;
    tempStoredProc.Parameters.CreateParameter('@RETURN_VALUE', ftInteger,
      pdReturnValue, 4, NULL);
    tempStoredProc.Parameters.CreateParameter('@Ik_zach', ftInteger, pdInput,
      4, ik_zach);
    tempStoredProc.ExecProc;

    // ������� �������
   { tempStoredProc.Connection := dm.DBConnect;
    tempStoredProc.ProcedureName := 'DelZach;1';
    tempStoredProc.Parameters.Clear;
    tempStoredProc.Parameters.CreateParameter('@RETURN_VALUE', ftInteger,
      pdReturnValue, 4, NULL);
    tempStoredProc.Parameters.CreateParameter('@Ik_zach', ftInteger, pdInput,
      4, ik_zach);
    tempStoredProc.ExecProc;     }
  finally
    tempStoredProc.Free;
  end;
end;

function TAbitZachislenieController.Abit_Current(nnAbit: Integer): boolean;
begin
  TApplicationController.GetInstance.AddLogEntry
    ('������ ���������� ����������� ' + FAbitListDataSetInstance.FieldByName
    ('fio').AsString);

  dm.DBConnect.BeginTrans;
  try
    if (FAbitListDataSetInstance.FieldByName('BookKey').Value <> NULL) then
    begin
      // ������� �������
      Abit_DelZachGrup(FAbitListDataSetInstance.FieldByName('BookKey').Value);
      FAbitListDataSetInstance.Edit;
      FAbitListDataSetInstance.FieldByName('Nn_zach').Value := '';
      FAbitListDataSetInstance.FieldByName('Cname_grup').Value := '';
      FAbitListDataSetInstance.FieldByName('Ik_grup').Value := NULL;
      FAbitListDataSetInstance.FieldByName('Ik_prikazzach').Value := NULL;
      FAbitListDataSetInstance.FieldByName('Ik_priczach').Value := NULL;
    end;
  except
    on E: Exception do
    begin
      dm.DBConnect.RollbackTrans;
      raise EApplicationException.Create('���������� ����������! ���������� ' +
        FAbitListDataSetInstance.FieldByName('fio').AsString +
        ' ��� �������� ���������!', E);
    end;
  end;

  try
    // �������� ��������� ����������
    Abit_StateChange(nnAbit, 1, 0);
    FAbitListDataSetInstance.Edit;
    FAbitListDataSetInstance.FieldByName('cname_zach').Value := '�������';
    FAbitListDataSetInstance.FieldByName('ik_type_zach').Value := 1;
    FAbitListDataSetInstance.FieldByName('ik_zach').Value := 1;
    FAbitListDataSetInstance.FieldByName('nn_zach').Value := NULL;
    dm.DBConnect.CommitTrans;
  except
    on E: Exception do
    begin
      dm.DBConnect.RollbackTrans;
      raise EApplicationException.Create
        ('��������� ������ ��� ��������� ������� �����������!', E);
    end;
  end;

  FAbitListDataSetInstance.Next;
  Result := true;
end;

procedure TAbitZachislenieController.Abit_Exile(nnAbit: Integer);
begin
  TApplicationController.GetInstance.AddLogEntry
    ('����� � ���������� ����������� ' + FAbitListDataSetInstance.FieldByName
    ('fio').AsString);

  if Abit_StateChange(nnAbit, 7, 0) then
  begin
    FAbitListDataSetInstance.Edit;
    FAbitListDataSetInstance.FieldByName('cname_zach').Value := '�� ��������';
    FAbitListDataSetInstance.FieldByName('ik_type_zach').Value := 3;
    FAbitListDataSetInstance.FieldByName('ik_zach').Value := 7;
    FAbitListDataSetInstance.Next;
  end;

end;

function TAbitZachislenieController.GetJoinCauses(SourceDataSet
  : PDataSet): Variant;
begin
  Result := TGeneralController.Instance.getDataSetValues(SourceDataSet,
    'select * from Pricina where  ikTypePric=1', 'Ik_pric', false, NULL)
end;

function TAbitZachislenieController.GetPrikazList(SourceDataSet
  : PDataSet): Variant;
begin
  Result := TGeneralController.Instance.getDataSetValues(SourceDataSet,
    'select Ik_prikaz, RTRIM(Nn_prikaz)+'' �� ''+CONVERT(VARCHAR(10),Dd_prikaz,104) as NN_Date,Dd_prikaz from dbo.Prikaz order by Dd_prikaz desc',
    'Ik_prikaz', false, NULL)
end;

function TAbitZachislenieController.GetGrupList(SourceDataSet: PDataSet;
  ik_spec_fac, nnyear: Integer): Variant;
begin
  Result := TGeneralController.Instance.getDataSetValues(SourceDataSet,
    'select * from Tree_groups where (ik_spec_fac=''' + IntToStr(ik_spec_fac) +
    ''')and (nYear_post=''' + IntToStr(nnyear) + ''')', 'Ik_grup', false, NULL)
end;

function TAbitZachislenieController.Abit_AppendRecordBook(flag, code,
  zach: Integer; nzach: string): Integer;
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc := TADOStoredProc.Create(nil);
  tempStoredProc.Connection := dm.DBConnect;
  tempStoredProc.ProcedureName := 'AppendZach;1';
  tempStoredProc.Parameters.CreateParameter('@RETURN_VALUE', ftInteger,
    pdReturnValue, 4, NULL);
  tempStoredProc.Parameters.CreateParameter('@flag', ftInteger,
    pdInput, 4, flag);
  tempStoredProc.Parameters.CreateParameter('@nzach', ftString, pdInput,
    6, nzach);
  tempStoredProc.Parameters.CreateParameter('@code', ftInteger,
    pdInput, 4, code);
  tempStoredProc.Parameters.CreateParameter('@zach', ftInteger, pdInput,
    4, nzach);
  try
    tempStoredProc.ExecProc;
    Result := tempStoredProc.Parameters.ParamByName('@RETURN_VALUE').Value;;
  finally
    tempStoredProc.Free;
  end;
end;

function TAbitZachislenieController.Abit_CreateRecordBook
  (code: Integer): Integer;
var
  newBookKey: Integer;
begin
  newBookKey := Abit_AppendRecordBook(1, code, -1, '');
  if newBookKey > 0 then
  begin
    FAbitListDataSetInstance.Locate('nCode', code, []);
    FAbitListDataSetInstance.Edit;
    FAbitListDataSetInstance.FieldByName('ik_zach').Value := newBookKey;
    // BookKey
    // FAbitListDataSetInstance.FieldByName('Nn_zach').Value:= nzach;
  end;
  Result := newBookKey;
end;

function TAbitZachislenieController.Abit_ChangeRecordBook(code, zach: Integer;
  nzach: string): boolean;
begin
  if Abit_AppendRecordBook(0, code, zach, nzach) = -3 then
    Result := false
  else
  begin
    FAbitListDataSetInstance.Locate('nCode', code, []);
    FAbitListDataSetInstance.Edit;
    FAbitListDataSetInstance.FieldByName('Nn_zach').Value := nzach;

    Result := true;
  end;
end;

function TAbitZachislenieController.Abit_AppendStudGrup(flag, grup, zach,
  KatZach, priczach: Integer; cObosnZach: string): Integer;
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc := TADOStoredProc.Create(nil);
  tempStoredProc.Connection := dm.DBConnect;
  tempStoredProc.ProcedureName := 'AppendStudGrup;1';
  tempStoredProc.Parameters.CreateParameter('@RETURN_VALUE', ftInteger,
    pdReturnValue, 4, NULL);
  tempStoredProc.Parameters.CreateParameter('@flag', ftInteger,
    pdInput, 4, flag);
  tempStoredProc.Parameters.CreateParameter('@grup', ftInteger,
    pdInput, 4, grup);
  tempStoredProc.Parameters.CreateParameter('@zach', ftInteger,
    pdInput, 4, zach);
  tempStoredProc.Parameters.CreateParameter('@KatZach', ftInteger, pdInput,
    4, KatZach);
  tempStoredProc.Parameters.CreateParameter('@prikzach', ftInteger,
    pdInput, 4, NULL);
  tempStoredProc.Parameters.CreateParameter('@priczach', ftInteger, pdInput, 4,
    priczach);
  tempStoredProc.Parameters.CreateParameter('@prikOtch', ftInteger,
    pdInput, 4, NULL);
  tempStoredProc.Parameters.CreateParameter('@pricOtch', ftInteger,
    pdInput, 4, NULL);
  tempStoredProc.Parameters.CreateParameter('@cObosnZach', ftString, pdInput,
    500, cObosnZach);
  try
    tempStoredProc.ExecProc;
    Result := 1;
    tempStoredProc.Free;
  except
    tempStoredProc.Free;
    // result:=-3;
    raise;
  end;
end;

function TAbitZachislenieController.Abit_AppointPrikaz(grid: PDBGrid): boolean;
var
  i, ikPrik: Integer;
  DatePrik: TDate;
begin
  TApplicationController.GetInstance.AddLogEntry
    ('���������� ������������ � ��������.');
  // ������� ������ � �������� ��� ��� � �������������
  frmAbitZachDialog := TfrmAbitZachDialog.Create(nil);
  try
    frmAbitZachDialog.ShowModal;
    if frmAbitZachDialog.mrOk then
    begin
      ikPrik := frmAbitZachDialog.dbcbeOrder.KeyValue;
      DatePrik := frmAbitZachDialog.dPrikaz;
      for i := 0 to (grid.SelectedRows.Count - 1) do
      begin
        grid.DataSource.DataSet.GotoBookmark(Pointer(grid.SelectedRows[i]));
        TAbitZachislenieController.Instance.Abit_Join
          (grid.DataSource.DataSet.FieldValues['NN_abit'], ikPrik, DatePrik);
      end;
    end;
  except

  end;
end;

function TAbitZachislenieController.Abit_CreateStudGrup(code, grup, zach,
  KatZach, priczach: Integer; cNameGrup, cObosnZach: string): boolean;
begin
  Result := false;
  if Abit_AppendStudGrup(1, grup, zach, KatZach, priczach, cObosnZach) <> -3
  then
  begin
    FAbitListDataSetInstance.Locate('nCode', code, []);
    FAbitListDataSetInstance.Edit;
    FAbitListDataSetInstance.FieldByName('Cname_grup').AsString := cNameGrup;
    FAbitListDataSetInstance.FieldByName('Ik_grup').Value := grup;
    // FAbitListDataSetInstance.FieldByName('Ik_prikazzach').Value:= prikzach;
    FAbitListDataSetInstance.FieldByName('Ik_priczach').Value := priczach;
    Result := true;
    FAbitListDataSetInstance.Next;
  end;
end;

function TAbitZachislenieController.Abit_ChangeStudGrup(code, newgrup,
  zach: Integer; cNameGrup: string): boolean;
var
  tempStoredProc: TADOStoredProc;
begin
  // result:=false;
  tempStoredProc := TADOStoredProc.Create(nil);
  tempStoredProc.Connection := dm.DBConnect;
  tempStoredProc.ProcedureName := 'ChangeGrup;1';
  tempStoredProc.Parameters.CreateParameter('@RETURN_VALUE', ftInteger,
    pdReturnValue, 4, NULL);
  tempStoredProc.Parameters.CreateParameter('@Ik_grupNew', ftInteger, pdInput,
    4, newgrup);
  tempStoredProc.Parameters.CreateParameter('@Ik_zach', ftInteger,
    pdInput, 4, zach);
  try
    tempStoredProc.ExecProc;
    tempStoredProc.Free;
    FAbitListDataSetInstance.Locate('nCode', code, []);
    FAbitListDataSetInstance.Edit;
    FAbitListDataSetInstance.FieldByName('Cname_grup').Value := cNameGrup;
    FAbitListDataSetInstance.FieldByName('ik_grup').Value := newgrup;
    Result := true;
    FAbitListDataSetInstance.Next;
  except
    tempStoredProc.Free;
    raise;
  end;
end;

function TAbitZachislenieController.Abit_IsOldZach(nzach: string): boolean;
var
  DataSet: TADODataSet;
begin
  // ���������, ����� ���������� ������ ������� ��� �� ����
  Result := false;
  DataSet := TADODataSet.Create(nil);
  try
    TGeneralController.Instance.getDataSetValues(@DataSet,
      'select * from Zach Where (Nn_zach=''' + nzach + ''')', 'ik_zach',
      false, NULL);
    if not DataSet.IsEmpty then
      Result := true;
  finally
    DataSet.Free;
  end;
end;

function TAbitZachislenieController.GetNewNZach(year: Integer): string;
var
  DataSet: TADODataSet;
  FirstRecord, LastRecord, nzach: string;
begin
  FirstRecord := IntToStr(year mod 100);
  if length(FirstRecord) = 1 then
    FirstRecord := '0' + FirstRecord;
  LastRecord := FirstRecord + '9999';
  FirstRecord := FirstRecord + '0000';
  // ����������� ����� ������� ������������ ����� �������
  // ��������� ���� � ���������� ���������
  DataSet := TADODataSet.Create(nil);
  try
    TGeneralController.Instance.getDataSetValues(@DataSet,
      'select (Max(nn_zach)+1) as maxnzach from Zach  Where (Nn_zach BETWEEN '''
      + FirstRecord + ''' AND ''' + LastRecord + ''')', 'maxnzach',
      false, NULL);
    nzach := DataSet.FieldByName('maxnzach').AsString;
    // ���������� �� 6 ������ � ������
    while length(nzach) < 6 do
      nzach := '0' + nzach;
    Result := nzach;
  finally
    DataSet.Free;
  end;
end;

function TAbitZachislenieController.Abit_JoinGroup(grid: PDBGrid): boolean;
var
  i, spec, group, ik_zach: Integer;
  sort, groupName: string;
begin

  Result := false;
  if grid.SelectedRows.Count = 0 then
    exit;
  spec := FAbitListDataSetInstance.FieldByName('ik_spec_fac').Value;
  // ��������, ����� ��� ���������� �������� ��� ��
  // ���� ��������� � ���� � ����� �������������
  for i := 0 to grid.SelectedRows.Count - 1 do
  begin
    FAbitListDataSetInstance.GotoBookmark(Pointer(grid.SelectedRows[i]));
    // if (FAbitListDataSetInstance.FieldByName('nn_zach').Value<>NULL) then
    // begin
    // raise EApplicationException.Create('�� ������� �����������, ������� ��� ��� ��������!');
    // end;
    if i = 0 then
      spec := FAbitListDataSetInstance.FieldByName('ik_spec_fac').Value
    else
    begin
      if spec <> FAbitListDataSetInstance.FieldByName('ik_spec_fac').Value then
      begin
        raise EApplicationException.Create
          ('�� ������� ������������ ������ ��������������! ���������� �� � ���� ������ ����������!');
      end;
    end;
    if (FAbitListDataSetInstance.FieldByName('Dd_prikaz').Value = NULL) then
    begin
      ShowMessage('�� ���� ��������� ������������ �������� ������ ����������');
      exit;
    end;

    if (FAbitListDataSetInstance.FieldByName('BookKey').Value = NULL) then
    begin
      ShowMessage
        ('�� ���� ��������� ������������ �������� ����� �������� ������');
      exit;
    end;

  end;

  TApplicationController.GetInstance.AddLogEntry
    ('���������� ������������ � ������.');
  // ������� ������ � �������� ��� ��� � �������������
  frmJoinGroup := TfrmJoinGroup.Create(nil);
  try
    FAbitListDataSetInstance.GotoBookmark(Pointer(grid.SelectedRows[0]));
    frmJoinGroup.domspec := FAbitListDataSetInstance.FieldByName
      ('ik_spec_fac').Value;
    frmJoinGroup.year := FAbitListDataSetInstance.FieldByName('NNyear').Value;
    frmJoinGroup.EditMode := false;
    frmJoinGroup.AbitCount := grid.SelectedRows.Count;

    if FAbitListDataSetInstance.FieldByName('nn_zach').Value <> NULL then
      frmJoinGroup.HasZachMode := true;

    frmJoinGroup.ShowModal;

    if frmJoinGroup.mrOk then
    begin
      sort := TADODataSet(FAbitListDataSetInstance).sort;
      if grid.SelectedRows.Count > 1 then
        // ��������� �� ���
        TADODataSet(FAbitListDataSetInstance).sort := 'fio';

      group := frmJoinGroup.DbcbeGroup.KeyValue;
      // order:= frmJoinGroup.dbcbeOrder.KeyValue;
      groupName := frmJoinGroup.DbcbeGroup.Text;
      try
        // �������� ����������
        dm.DBConnect.BeginTrans;
        // ��������� � ������ ������
        for i := 0 to grid.SelectedRows.Count - 1 do
        begin
          FAbitListDataSetInstance.GotoBookmark(Pointer(grid.SelectedRows[i]));

          TApplicationController.GetInstance.AddLogEntry
            ('���������� ����������� � ������: ' +
            FAbitListDataSetInstance.FieldByName('fio').AsString + ', ' +
            groupName);

          ik_zach := FAbitListDataSetInstance.FieldByName('BookKey').Value;

          // ��������� �������� � ������
          Abit_CreateStudGrup(FAbitListDataSetInstance.FieldByName('nCode')
            .Value, group, ik_zach, FAbitListDataSetInstance.FieldByName
            ('ik_kat_zach').Value, frmJoinGroup.dbcbeCause.KeyValue,
            groupName, '');
        end;
        // ��������� ���������
        dm.DBConnect.CommitTrans;
      except
        on E: Exception do
        begin
          dm.DBConnect.RollbackTrans;
          raise EApplicationException.Create('�������� ������!', E);
        end;
      end;
      // ���������� ������� ����������
      TADODataSet(FAbitListDataSetInstance).sort := sort;
    end;
  finally
    frmJoinGroup.Free;
    FAbitListDataSetInstance.Next;
  end;
end;

function TAbitZachislenieController.Abit_ChangeGroup(grid: PDBGrid): boolean;
var
  i, spec, group: Integer;
  nzach, groupName: string;
begin
  Result := false;
  if grid.SelectedRows.Count = 0 then
    exit;

  spec := FAbitListDataSetInstance.FieldByName('ik_spec_fac').Value;
  // ��������, ����� ��� ���������� �������� ��� ��
  // ���� ��������� � ���� � ����� �������������
  for i := 0 to grid.SelectedRows.Count - 1 do
  begin
    FAbitListDataSetInstance.GotoBookmark(Pointer(grid.SelectedRows[i]));
    if (FAbitListDataSetInstance.FieldByName('nn_zach').Value = NULL) then
    begin
      raise EApplicationException.Create
        ('�� ������� �����������, ������� ��� �� ��� ��������!');
      exit;
    end;
    if i = 0 then
      spec := FAbitListDataSetInstance.FieldByName('ik_spec_fac').Value
    else
    begin
      if spec <> FAbitListDataSetInstance.FieldByName('ik_spec_fac').Value then
      begin
        raise EApplicationException.Create
          ('�� ������� ������������ ������ ��������������! ���������� �� � ���� ������ ����������!');
        exit;
      end;
    end;
  end;

  TApplicationController.GetInstance.AddLogEntry
    ('��������� ������, ������ ������� ������������.');

  // ������� ������ � �������� ��� ��� � �������������
  frmJoinGroup := TfrmJoinGroup.Create(nil);
  FAbitListDataSetInstance.GotoBookmark(Pointer(grid.SelectedRows[0]));
  frmJoinGroup.domspec := FAbitListDataSetInstance.FieldByName
    ('ik_spec_fac').Value;
  frmJoinGroup.year := FAbitListDataSetInstance.FieldByName('NNyear').Value;

  FAbitListDataSetInstance.GotoBookmark(Pointer(grid.SelectedRows[0]));
  frmJoinGroup.DbcbeGroup.KeyValue := FAbitListDataSetInstance.FieldByName
    ('Ik_grup').Value;
  // frmJoinGroup.dbcbeOrder.KeyValue:= FAbitListDataSetInstance.FieldByName('Ik_prikazzach').Value;
  frmJoinGroup.dbcbeCause.KeyValue := FAbitListDataSetInstance.FieldByName
    ('Ik_priczach').Value;
  // frmJoinGroup.eNum.Text:= FAbitListDataSetInstance.FieldByName('Nn_zach').Value;
  frmJoinGroup.EditMode := true;
  frmJoinGroup.isModified := false;

  frmJoinGroup.AbitCount := grid.SelectedRows.Count;
  frmJoinGroup.ShowModal;
  if frmJoinGroup.mrOk then
  begin
    // ���� ��� ������ 1 �������, �� ����������� ������� � ������
    group := frmJoinGroup.DbcbeGroup.KeyValue;
    groupName := frmJoinGroup.DbcbeGroup.Text;
    if grid.SelectedRows.Count = 1 then
    begin

      TApplicationController.GetInstance.AddLogEntry
        ('���������� ����������� � ������: ' +
        FAbitListDataSetInstance.FieldByName('fio').AsString + ', ' + groupName
        + ', ' + nzach);

      FAbitListDataSetInstance.GotoBookmark(Pointer(grid.SelectedRows[0]));
      try
        dm.DBConnect.BeginTrans;
        // nzach:= frmJoinGroup.eNum.Text;
        if Abit_ChangeRecordBook(FAbitListDataSetInstance.FieldByName('nCode')
          .Value, FAbitListDataSetInstance.FieldByName('BookKey').Value, nzach)
        then
        begin
          if Abit_ChangeStudGrup(FAbitListDataSetInstance.FieldByName('nCode')
            .Value, group, FAbitListDataSetInstance.FieldByName('BookKey')
            .Value, groupName) then
            dm.DBConnect.CommitTrans
          else
            raise EApplicationException.Create
              ('��������� ������ ��� ����� ������ �������� ' +
              FAbitListDataSetInstance.FieldByName('fio').AsString);
        end
        else
          raise EApplicationException.Create
            ('��������� ������ ��� ����� ������ ������� �������� ' +
            FAbitListDataSetInstance.FieldByName('fio').AsString);

      except
        on E: Exception do
        begin
          dm.DBConnect.RollbackTrans;
          raise EApplicationException.Create('�������� ������!', E);
        end;
      end;

    end
    // ����� ������ ������
    else
    begin
      try
        // �������� ����������
        dm.DBConnect.BeginTrans;
        // ��������� � ������ ������
        for i := 0 to grid.SelectedRows.Count - 1 do
        begin
          FAbitListDataSetInstance.GotoBookmark(Pointer(grid.SelectedRows[i]));
          // �������� ������ �� �����
          if not Abit_ChangeStudGrup(FAbitListDataSetInstance.FieldByName
            ('nCode').Value, group, FAbitListDataSetInstance.FieldByName
            ('BookKey').Value, groupName) then
          begin
            raise EApplicationException.Create
              ('��������� ������ ��� ����� ������ �������� ' +
              FAbitListDataSetInstance.FieldByName('fio').AsString);
          end;
        end;
        // ��������� ���������
        dm.DBConnect.CommitTrans;
      except
        on E: Exception do
        begin
          dm.DBConnect.RollbackTrans;
          raise EApplicationException.Create('�������� ������!', E);
        end;
      end;
    end;
  end;
  frmJoinGroup.Free;
  FAbitListDataSetInstance.Next;
  if dm.DBConnect.InTransaction then
  begin
    dm.DBConnect.RollbackTrans;
    raise EApplicationException.Create('�������� ������!');
  end;
end;

procedure TAbitZachislenieController.SpecPrikazToWord(grid: PDBGrid);
var
  W, MyRange, table: Variant;
  str, sort: string;
  SmInPoint: real;
  // i,j,k:integer;
  AbitCount: Integer;
  fac, spec: Integer;
begin
  TApplicationController.GetInstance.AddLogEntry
    ('������� � Word ������� �� ���������� �� ��������������.');

  FAbitListDataSetInstance.DisableControls;
  // �������������
  sort := TADODataSet(FAbitListDataSetInstance).sort;
  TADODataSet(FAbitListDataSetInstance).sort := 'Cname_fac, cname_spec';
  try
    SmInPoint := 0.035;
    W := CreateOleObject('Word.Application');
    str := ExtractFilePath(Application.ExeName) + 'reports\Prikaz.dot';
    W.Documents.add(str);
    W.Visible := false;
    str := DateToStr(Date);
    str := copy(str, 1, length(str) - 4);
    str := str + IntToStr(year);
    TGeneralController.Instance.FindAndInsert(W, '#����#', str);
    str := IntToStr(year);
    TGeneralController.Instance.FindAndInsert(W, '#���#', str);

    // �������� ���� �� ��������� �����������
    FAbitListDataSetInstance.First;
    // i:=1; //
    fac := 0;
    spec := 0;
    while not FAbitListDataSetInstance.Eof do
    begin
      if fac <> (FAbitListDataSetInstance).FieldByName('ik_fac').AsInteger then
      begin
        MyRange := W.ActiveDocument.Range(W.ActiveDocument.Range.End - 1,
          W.ActiveDocument.Range.End - 1);
        W.ActiveDocument.Range.InsertAfter('  ');
        W.ActiveDocument.Range.InsertAfter(#10#13);
        W.ActiveDocument.Range.InsertAfter
          (FAbitListDataSetInstance.FieldByName('Cname_fac').AsString);
        MyRange := W.ActiveDocument.Range(W.ActiveDocument.Range.End - 3 -
          length(FAbitListDataSetInstance.FieldByName('Cname_fac').AsString),
          W.ActiveDocument.Range.End - 1);
        MyRange.Font.Bold := true;
        MyRange.Font.Size := 15;
        MyRange.ParagraphFormat.Alignment := 1;
        fac := FAbitListDataSetInstance.FieldByName('ik_fac').AsInteger;
      end;

      if spec <> FAbitListDataSetInstance.FieldByName('ik_spec_fac').AsInteger
      then
      begin
        if spec > 0 then
          table.Rows.Item(table.Rows.Count).Delete;
        MyRange := W.ActiveDocument.Range(W.ActiveDocument.Range.End - 1,
          W.ActiveDocument.Range.End - 1);
        W.ActiveDocument.Range.InsertAfter('  ');
        W.ActiveDocument.Range.InsertAfter(#10#13);
        str := '������������� ' + FAbitListDataSetInstance.FieldByName
          ('Cshort_spec').AsString + ' (' + FAbitListDataSetInstance.FieldByName
          ('Sh_spec').AsString + ')';
        W.ActiveDocument.Range.InsertAfter(str);
        MyRange := W.ActiveDocument.Range(W.ActiveDocument.Range.End - 2 -
          length(str), W.ActiveDocument.Range.End - 1);
        MyRange.Font.Bold := true;
        MyRange.Font.Italic := true;
        MyRange.ParagraphFormat.Alignment := 1;
        W.ActiveDocument.Range.InsertAfter(#10#13);
        spec := FAbitListDataSetInstance.FieldByName('ik_spec_fac').AsInteger;

        // ��������� �������
        MyRange := W.ActiveDocument.Range(W.ActiveDocument.Range.End - 1,
          W.ActiveDocument.Range.End - 1);
        W.ActiveDocument.Tables.add(Range := MyRange, NumRows := 1,
          NumColumns := 4);
        table := W.ActiveDocument.Tables.Item(W.ActiveDocument.Tables.Count);
        table.Columns.Item(1).Width := 1.2 / SmInPoint;
        table.Columns.Item(2).Width := 8.5 / SmInPoint;
        table.Columns.Item(3).Width := 5.25 / SmInPoint;
        table.Columns.Item(4).Width := 1.75 / SmInPoint;
        AbitCount := 0;
      end;

      inc(AbitCount);
      table.Rows.add;
      table.cell(AbitCount, 1).Range.Text := IntToStr(AbitCount);
      table.cell(AbitCount, 2).Range.Text :=
        FAbitListDataSetInstance.FieldByName('fio').AsString;
      table.cell(AbitCount, 3).Range.Text :=
        FAbitListDataSetInstance.FieldByName('cname_kat_zach').AsString;
      table.cell(AbitCount, 4).Range.Text :=
        FAbitListDataSetInstance.FieldByName('SummBall').AsString;
      FAbitListDataSetInstance.Next;
    end;
    if spec > 0 then
      table.Rows.Item(table.Rows.Count).Delete;
    W.Visible := true;

  finally
    // �������� ����������
    TADODataSet(FAbitListDataSetInstance).sort := sort;
    FAbitListDataSetInstance.EnableControls;
  end;

end;

// ������� ������� �� ���������� �� ������� � Word
procedure TAbitZachislenieController.GroupPrikazToWord(grid: PDBGrid);
var
  W, MyRange, table: Variant;
  str, sort: string;
  SmInPoint: real;
  AbitCount: Integer;
  fac, spec, grup: Integer;
begin
  TApplicationController.GetInstance.AddLogEntry
    ('������� � Word ������� �� ���������� �� �������');

  FAbitListDataSetInstance.DisableControls;
  // �������������
  sort := TADODataSet(FAbitListDataSetInstance).sort;
  TADODataSet(FAbitListDataSetInstance).sort :=
    'Cname_fac, cname_spec,Cname_grup';
  try
    SmInPoint := 0.035;
    W := CreateOleObject('Word.Application');
    str := ExtractFilePath(Application.ExeName) + 'reports\Prikaz.dot';
    W.Documents.add(str);
    W.Visible := false;
    str := DateToStr(Date);
    str := copy(str, 1, length(str) - 4);
    str := str + IntToStr(year);
    TGeneralController.Instance.FindAndInsert(W, '#����#', str);
    str := IntToStr(year);
    TGeneralController.Instance.FindAndInsert(W, '#���#', str);

    // �������� ���� �� ��������� ����������� � ������
    FAbitListDataSetInstance.First;
    // i:=1; //
    fac := 0;
    spec := 0;
    grup := 0;
    while not FAbitListDataSetInstance.Eof do
    begin
      if (FAbitListDataSetInstance.FieldByName('Ik_grup').AsString = '') then
      begin
        FAbitListDataSetInstance.Next;
        continue;
      end;

      if (fac <> FAbitListDataSetInstance.FieldByName('ik_fac').AsInteger) and
        (FAbitListDataSetInstance.FieldByName('Ik_grup').AsString <> '') then
      begin
        MyRange := W.ActiveDocument.Range(W.ActiveDocument.Range.End - 1,
          W.ActiveDocument.Range.End - 1);
        W.ActiveDocument.Range.InsertAfter('  ');
        W.ActiveDocument.Range.InsertAfter(#10#13);
        W.ActiveDocument.Range.InsertAfter
          (FAbitListDataSetInstance.FieldByName('Cname_fac').AsString);
        MyRange := W.ActiveDocument.Range(W.ActiveDocument.Range.End - 3 -
          length(FAbitListDataSetInstance.FieldByName('Cname_fac').AsString),
          W.ActiveDocument.Range.End - 1);
        MyRange.Font.Bold := true;
        MyRange.Font.Size := 15;
        MyRange.ParagraphFormat.Alignment := 1;
        fac := FAbitListDataSetInstance.FieldByName('ik_fac').AsInteger;
      end;

      if (spec <> FAbitListDataSetInstance.FieldByName('ik_spec_fac').AsInteger)
        and (FAbitListDataSetInstance.FieldByName('Ik_grup').AsString <> '')
      then
      begin
        MyRange := W.ActiveDocument.Range(W.ActiveDocument.Range.End - 1,
          W.ActiveDocument.Range.End - 1);
        W.ActiveDocument.Range.InsertAfter('  ');
        W.ActiveDocument.Range.InsertAfter(#10#13);
        str := FAbitListDataSetInstance.FieldByName('Cshort_spec').AsString +
          ' (' + FAbitListDataSetInstance.FieldByName('Sh_spec').AsString + ')';
        W.ActiveDocument.Range.InsertAfter(str);
        MyRange.Font.Bold := true;
        MyRange.Font.Size := 13;
        MyRange.Font.Italic := true;
        MyRange.ParagraphFormat.Alignment := 1;
        spec := FAbitListDataSetInstance.FieldByName('ik_spec_fac').AsInteger;
      end;

      if (grup <> FAbitListDataSetInstance.FieldByName('Ik_grup').AsInteger) and
        (FAbitListDataSetInstance.FieldByName('Ik_grup').AsString <> '') then
      begin
        if grup > 0 then
          table.Rows.Item(table.Rows.Count).Delete;
        MyRange := W.ActiveDocument.Range(W.ActiveDocument.Range.End - 1,
          W.ActiveDocument.Range.End - 1);
        W.ActiveDocument.Range.InsertAfter('  ');
        W.ActiveDocument.Range.InsertAfter(#10#13);
        str := FAbitListDataSetInstance.FieldByName('Cname_grup').AsString;
        W.ActiveDocument.Range.InsertAfter(str);
        MyRange := W.ActiveDocument.Range(W.ActiveDocument.Range.End - 2 -
          length(str), W.ActiveDocument.Range.End - 1);
        MyRange.Font.Bold := true;
        MyRange.Font.Italic := true;
        MyRange.ParagraphFormat.Alignment := 1;
        grup := FAbitListDataSetInstance.FieldByName('ik_grup').AsInteger;

        // ��������� �������
        MyRange := W.ActiveDocument.Range(W.ActiveDocument.Range.End - 1,
          W.ActiveDocument.Range.End - 1);
        W.ActiveDocument.Tables.add(Range := MyRange, NumRows := 1,
          NumColumns := 3);
        table := W.ActiveDocument.Tables.Item(W.ActiveDocument.Tables.Count);
        table.Columns.Item(1).Width := 1.2 / SmInPoint;
        table.Columns.Item(2).Width := 10 / SmInPoint;
        table.Columns.Item(3).Width := 5.25 / SmInPoint;
        AbitCount := 0;
      end;

      inc(AbitCount);
      table.Rows.add;
      table.cell(AbitCount, 1).Range.Text := IntToStr(AbitCount);
      table.cell(AbitCount, 2).Range.Text :=
        FAbitListDataSetInstance.FieldByName('fio').AsString;
      table.cell(AbitCount, 3).Range.Text :=
        FAbitListDataSetInstance.FieldByName('cname_kat_zach').AsString;
      FAbitListDataSetInstance.Next;
    end;
    if spec > 0 then
      table.Rows.Item(table.Rows.Count).Delete;
    W.Visible := true;
  finally
    TADODataSet(FAbitListDataSetInstance).sort := sort;
    FAbitListDataSetInstance.EnableControls;
  end;

end;

procedure TAbitZachislenieController.SetColor(i: Integer; Color: TColor;
  Worksheet: Variant);
begin
  { Worksheet.Range['A'+IntToStr(i)+':G:'+IntToStr(i)].Interior.ColorIndex:=TColor;
    Worksheet.Range['A'+IntToStr(i)+':G:'+IntToStr(i)].Interior.Pattern:=Color;
    Worksheet.Range['A'+IntToStr(i)+':G:'+IntToStr(i)].Interior.PatternColorIndex:=xlAutomatic;
  }
end;

procedure TAbitZachislenieController.AbitsToExcel(flColor: boolean);
var
  E: Variant;
  i, ii: Integer;
  // cell,fac_spec:string;
  // XLApp: TExcelApplication;
begin
  TApplicationController.GetInstance.AddLogEntry
    ('������� � Excel ������ ������������.');

  E := CreateOleObject('Excel.Application');
  try
    E.Visible := false;
    E.WorkBooks.add;
    E.Sheets[1].Select;
    E.DisplayAlerts := false;
    FAbitListDataSetInstance.DisableControls;
    // R :=FAbitListDataSetInstance.RecordCount+1;
    // C :=7;
    i := 3;
    E.Cells[i, 1] := '�';
    E.Cells[i, 2] := '���';
    E.Cells[i, 3] := '���������';
    E.Cells[i, 4] := '�������������';
    E.Cells[i, 5] := '��������� �����������';
    E.Cells[i, 6] := '��������� ����������';
    E.Cells[i, 7] := '��. ����';
    E.Cells[i, 8] := '����� ������';

    E.Range['A1:H1'].Merge(true);
    E.Range['A1:H1'].Font.Size := 16;
    E.Range['A1:H1'].HorizontalAlignment := -4108;

    FAbitListDataSetInstance.First;
    ii := i;
    E.Cells[1, 1] := '��������� ' + FAbitListDataSetInstance.FieldByName
      ('cshort_name_fac').AsString + ', ������������� ' +
      FAbitListDataSetInstance.FieldByName('Cname_spec').AsString;
    while not FAbitListDataSetInstance.Eof do
    begin
      inc(ii);
      E.Cells[ii, 1] := IntToStr(ii - 3);
      E.Cells[ii, 2] := FAbitListDataSetInstance.FieldByName('fio').AsString;
      E.Cells[ii, 3] := FAbitListDataSetInstance.FieldByName
        ('cshort_name_fac').AsString;
      E.Cells[ii, 4] := FAbitListDataSetInstance.FieldByName
        ('Cshort_spec').AsString;
      E.Cells[ii, 5] := FAbitListDataSetInstance.FieldByName
        ('cname_zach').AsString;
      E.Cells[ii, 6] := FAbitListDataSetInstance.FieldByName
        ('cname_kat_zach').AsString;
      E.Cells[ii, 7] := FAbitListDataSetInstance.FieldByName
        ('Cname_lang').AsString;
      E.Cells[ii, 8] := FAbitListDataSetInstance.FieldByName
        ('SummBall').AsString;
      // �������� ������ "������������"
      // �������� ���� ����������
      if flColor then
      begin
        if (not IsAbit_HaveAllExam) then
          E.Range['A' + IntToStr(ii) + ':H' + IntToStr(ii)].Interior.Color :=
            $00C6C6FA // $00C6C6FF
        else
        begin
          if TAbitZachislenieController.Instance.IsAbit_ProhodBall then
            E.Range['A' + IntToStr(ii) + ':H' + IntToStr(ii)].Interior.Color :=
              $5300CD3F // $007BDDBD
            // �������� ���� ������������
          else
            E.Range['A' + IntToStr(ii) + ':H' + IntToStr(ii)].Interior.Color :=
              $7763F5E3; // $00C6C6FF
        end;
      end;

      FAbitListDataSetInstance.Next;
    end;
    E.Range['A' + IntToStr(i) + ':H' + IntToStr(ii)].Borders.Weight := 2;
    E.Columns.AutoFit;
    E.Visible := true; // ���������� Excel
    FAbitListDataSetInstance.EnableControls;
    { if ii=0 then
      exit; }

    E.DisplayAlerts := true;
  except
    on Ex: Exception do
    begin
      E.Quit;
      E := UnAssigned;
      FAbitListDataSetInstance.EnableControls;
      raise EApplicationException.Create
        ('��������� ������ ��� �������� c����� � Excel!', Ex);
    end;
  end;
end;

function TAbitZachislenieController.AbitsWithPolozhOcenkiToExcel
  (grid: PDBGrid): boolean;
var
  WorkBk: _WorkBook; // ���������� WorkBook
  Worksheet: _WorkSheet; // ���������� WorkSheet
  i, R, C, ii: Integer;
  TabGrid: Variant;
  cell, fac_spec: string;
  XLApp: TExcelApplication;
begin
  TApplicationController.GetInstance.AddLogEntry
    ('������� � Excel ������ ������������ ��������� ����������� ������ � ���.');

  R := FAbitListDataSetInstance.RecordCount + 1;

  C := 7;
  cell := 'a3';
  try
    TabGrid := VarArrayCreate([0, (R - 1), 0, (C - 1)], VarOleStr);

    TabGrid[0, 0] := '�';
    TabGrid[0, 1] := '���';
    TabGrid[0, 2] := '���������';
    TabGrid[0, 3] := '�������������';
    TabGrid[0, 4] := '��������� �����������';
    TabGrid[0, 5] := '��������� ����������';
    TabGrid[0, 6] := '����� ������';
    FAbitListDataSetInstance.DisableControls;
    FAbitListDataSetInstance.First;
    ii := 0;
    fac_spec := '��������� ' + FAbitListDataSetInstance.FieldByName
      ('cshort_name_fac').AsString + ', ������������� ' +
      FAbitListDataSetInstance.FieldByName('Cname_spec').AsString;
    for i := 1 to R - 1 do
    begin
      if (FAbitListDataSetInstance.FieldByName('ik_type_kat').Value <> 3) and
        (IsAbit_HaveAllExam) then
      begin
        ii := ii + 1;
        TabGrid[ii, 0] := IntToStr(ii);
        TabGrid[ii, 1] := FAbitListDataSetInstance.FieldByName('fio').AsString;
        TabGrid[ii, 2] := FAbitListDataSetInstance.FieldByName
          ('cshort_name_fac').AsString;
        TabGrid[ii, 3] := FAbitListDataSetInstance.FieldByName
          ('Cshort_spec').AsString;
        TabGrid[ii, 4] := FAbitListDataSetInstance.FieldByName
          ('cname_zach').AsString;
        TabGrid[ii, 5] := FAbitListDataSetInstance.FieldByName
          ('cname_kat_zach').AsString;
        TabGrid[ii, 6] := FAbitListDataSetInstance.FieldByName
          ('SummBall').AsString;
      end;
      FAbitListDataSetInstance.Next;
    end;

    if ii = 0 then
    begin
      Result := false;
      exit;
    end;

    ii := ii + 3;

    XLApp := TExcelApplication.Create(nil);
    XLApp.Connect; // ����������� � �������� TExcelApplication
    XLApp.WorkBooks.add(xlWBatWorkSheet, 0);
    // ��������� WorkBooks � ExcelApplication
    WorkBk := XLApp.WorkBooks.Item[XLApp.WorkBooks.Count];
    // �������� ��������� (�����������) WorkBook
    Worksheet := WorkBk.WorkSheets.Get_Item(1) as _WorkSheet;
    // ���������� ������ WorkSheet

    Worksheet.Range[cell, Worksheet.Cells.Item[ii, C]].Formula := TabGrid;
    // ������������ Delphi ������-������� � �������� � WorkSheet

    Worksheet.Name := '�����'; // ��������� �������� WorkSheet
    Worksheet.Columns.AutoFit;

    // Worksheet.Range['a2',Worksheet.cells.item[1,2]].font.size:=16;
    Worksheet.Cells.Item[1, 2].Font.Size := 16;
    Worksheet.Cells.Item[1, 2] := fac_spec;

    // ������� ������ ������� ������ � �������
    Worksheet.Range[cell, Worksheet.Cells.Item[3, C]].Interior.ColorIndex := 15;
    Worksheet.Range[cell, Worksheet.Cells.Item[3, C]].Interior.Pattern
      := xlSolid;
    Worksheet.Range[cell, Worksheet.Cells.Item[3, C]].Interior.PatternColorIndex
      := xlAutomatic;

    Worksheet.Range[cell, Worksheet.Cells.Item[ii, 1]]
      .Interior.ColorIndex := 15;
    Worksheet.Range[cell, Worksheet.Cells.Item[ii, 1]].Interior.Pattern
      := xlSolid;
    Worksheet.Range[cell, Worksheet.Cells.Item[ii, 1]]
      .Interior.PatternColorIndex := xlAutomatic;

    // ���������� ���������� � ������� ������� ���������
    Worksheet.Range[cell, Worksheet.Cells.Item[ii, 1]].Borders[xlDiagonalDown]
      .LineStyle := xlNone;
    Worksheet.Range[cell, Worksheet.Cells.Item[ii, 1]].Borders[xlDiagonalUp]
      .LineStyle := xlNone;

    Worksheet.Range[cell, Worksheet.Cells.Item[ii, C]].Borders[xlEdgeLeft]
      .LineStyle := xlContinuous;
    Worksheet.Range[cell, Worksheet.Cells.Item[ii, C]].Borders[xlEdgeLeft]
      .Weight := xlThin;
    Worksheet.Range[cell, Worksheet.Cells.Item[ii, C]].Borders[xlEdgeLeft]
      .ColorIndex := xlAutomatic;

    Worksheet.Range[cell, Worksheet.Cells.Item[ii, C]].Borders[xlEdgeTop]
      .LineStyle := xlContinuous;
    Worksheet.Range[cell, Worksheet.Cells.Item[ii, C]].Borders[xlEdgeTop].Weight
      := xlThin;
    Worksheet.Range[cell, Worksheet.Cells.Item[ii, C]].Borders[xlEdgeTop]
      .ColorIndex := xlAutomatic;

    Worksheet.Range[cell, Worksheet.Cells.Item[ii, C]].Borders[xlEdgeBottom]
      .LineStyle := xlContinuous;
    Worksheet.Range[cell, Worksheet.Cells.Item[ii, C]].Borders[xlEdgeBottom]
      .Weight := xlThin;
    Worksheet.Range[cell, Worksheet.Cells.Item[ii, C]].Borders[xlEdgeBottom]
      .ColorIndex := xlAutomatic;

    Worksheet.Range[cell, Worksheet.Cells.Item[ii, C]].Borders[xlEdgeRight]
      .LineStyle := xlContinuous;
    Worksheet.Range[cell, Worksheet.Cells.Item[ii, C]].Borders[xlEdgeRight]
      .Weight := xlThin;
    Worksheet.Range[cell, Worksheet.Cells.Item[ii, C]].Borders[xlEdgeRight]
      .ColorIndex := xlAutomatic;

    Worksheet.Range[cell, Worksheet.Cells.Item[ii, C]].Borders[xlInsideVertical]
      .LineStyle := xlContinuous;
    Worksheet.Range[cell, Worksheet.Cells.Item[ii, C]].Borders[xlInsideVertical]
      .Weight := xlThin;
    Worksheet.Range[cell, Worksheet.Cells.Item[ii, C]].Borders[xlInsideVertical]
      .ColorIndex := xlAutomatic;

    Worksheet.Range[cell, Worksheet.Cells.Item[ii, C]].Borders
      [xlInsideHorizontal].LineStyle := xlContinuous;
    Worksheet.Range[cell, Worksheet.Cells.Item[ii, C]].Borders
      [xlInsideHorizontal].Weight := xlThin;
    Worksheet.Range[cell, Worksheet.Cells.Item[ii, C]].Borders
      [xlInsideHorizontal].ColorIndex := xlAutomatic;
    FAbitListDataSetInstance.EnableControls;
    // Worksheet.PageSetup.LeftFooter:='&5' + TApplicationController.GetInstance.DocumentFooter;
    XLApp.Visible[0] := true; // ���������� Excel
    TabGrid := UnAssigned; // Unassign the Delphi Variant Matrix
    Result := true;
  except
    FAbitListDataSetInstance.EnableControls;
    Result := false;
    { if grid.SelectedRows.Count>0 then
      FAbitListDataSetInstance.GotoBookmark(Pointer(grid.SelectedRows[0]))
      else
      FAbitListDataSetInstance.First; }
    // XLApp.Free;
  end;
end;

// ������� ��������� � ���������� � Excel
procedure TAbitZachislenieController.ExportProtokolToExcel;
const
  l = 12; // ���-�� ����� ���������
  m = 1000; // ���-�� ������������ �� 1 ��������
  exEnd = 'E';
  RowHeigh = 33;
var
  E: Variant;
  pagecount, spec: Integer;
  path, sort: string;
  i, j, AbitCount: Integer;
  FindRange: Variant;
begin
  TApplicationController.GetInstance.AddLogEntry
    ('������� ��������� ���������� � Excel');

  try
    E := CreateOleObject('Excel.Application');
    try
      path := ExtractFilePath(Application.ExeName) + 'reports\AbitProtocol.XLT';
      E.WorkBooks.add(path);
      E.DisplayAlerts := false;
      FAbitListDataSetInstance.DisableControls;
      // �������������
      sort := TADODataSet(FAbitListDataSetInstance).sort;
      TADODataSet(FAbitListDataSetInstance).sort := 'Cname_fac, cname_spec, ik_spec_fac';
      spec := -1;
      AbitCount := 1;
      i := l + 1;
      // FAbitListDataSetInstance.FieldByName('').AsString
      try
        FAbitListDataSetInstance.First;
        try
          pagecount := 2;
          while true do
          begin
            if (spec <> FAbitListDataSetInstance.FieldByName('ik_spec_fac')
              .Value) or (FAbitListDataSetInstance.Eof) then
            begin
              // ��������������� ������ �������������
              if spec > -1 then
              begin
                dec(i);
                j := ((AbitCount - 1) mod m);
                if j > 0 then
                begin
                  E.Range['A' + IntToStr(i - j) + ':' + exEnd + IntToStr(i)
                    ].Borders.Weight := 2;
                  E.Range['A' + IntToStr(i - j) + ':' + exEnd + IntToStr(i)
                    ].RowHeight := RowHeigh;
                end;

                inc(i);
                E.Cells[i, 1] :='������������� ���������';
                E.Range['A'+IntToStr(i)+':B'+IntToStr(i)].HorizontalAlignment:= 2 ;
                E.Range['A'+IntToStr(i)+':B'+IntToStr(i)].Merge(true);

                inc(i);
                E.Cells[i, 1] :='�������� ��������';
                E.Cells[i, 5] :='�. �. �����������';
                E.Range['D'+IntToStr(i)+':E'+IntToStr(i)].Merge(true);
                E.Range['A'+IntToStr(i)+':B'+IntToStr(i)].Merge(true);
                E.Range['A'+IntToStr(i)+':B'+IntToStr(i)].HorizontalAlignment:= 2 ;
                E.Range['D'+IntToStr(i)+':E'+IntToStr(i)].HorizontalAlignment:= 4 ;


	              FindRange := E.Cells.Replace(What := '#D#',Replacement:=DayOf(Date));
	              FindRange := E.Cells.Replace(What := '#Mn#',Replacement:=GetMonthR(MonthOf(Date)));
	              FindRange := E.Cells.Replace(What := '#Y#',Replacement:=YearOf(Date));
              end;
              if FAbitListDataSetInstance.Eof then
                break;

              // ��������� �������� � �����������
              E.Sheets.add(after := E.Sheets.Item[pagecount - 1]);
              E.Sheets[1].Range['A1:' + exEnd + IntToStr(50)
                ].EntireColumn.copy(EmptyParam); // �������� � ��
              E.Sheets[pagecount].Paste(E.Sheets.Item[pagecount].Range
                ['A1:' + exEnd + IntToStr(50), EmptyParam], EmptyParam);
              E.Sheets[1].Range['A1:' + exEnd + IntToStr(50)
                ].EntireRow.copy(EmptyParam); // �������� � ��
              E.Sheets[pagecount].Paste(E.Sheets.Item[pagecount].Range
                ['A1:' + exEnd + IntToStr(50), EmptyParam], EmptyParam);
              E.Sheets[pagecount].PageSetup.LeftMargin :=
                E.Sheets[1].PageSetup.LeftMargin;
              E.Sheets[pagecount].PageSetup.RightMargin :=
                E.Sheets[1].PageSetup.RightMargin;
              E.Sheets[pagecount].PageSetup.TopMargin :=
                E.Sheets[1].PageSetup.TopMargin;
              E.Sheets[pagecount].PageSetup.BottomMargin :=
                E.Sheets[1].PageSetup.BottomMargin;
              E.Sheets[pagecount].PageSetup.Orientation :=
                E.Sheets[1].PageSetup.Orientation;

              E.Sheets[pagecount].Name := FAbitListDataSetInstance.FieldByName
                  ('Cshort_name_fac').AsString + ' ' +
                  FAbitListDataSetInstance.FieldByName('Cshort_spec').AsString +
                  FAbitListDataSetInstance.FieldByName('ik_spec_fac').AsString;

              E.Sheets[pagecount].Select;
              spec := FAbitListDataSetInstance.FieldByName('ik_spec_fac').Value;
              i := l + 1;
              inc(pagecount);
              AbitCount := 1;
            end;
            // ��������� ���������
            if (AbitCount > 1) and (((AbitCount - 1) mod m) = 0) then
            begin // +exEnd+inttoStr(l)
              E.Sheets[1].Range['A1:' + exEnd + IntToStr(l)
                ].EntireRow.copy(EmptyParam); // �������� � ��
              E.Sheets[pagecount - 1]
                .Paste(E.Sheets[pagecount - 1].Range['A' + IntToStr(i) + ':' +
                exEnd + IntToStr(i + l - 1), EmptyParam], EmptyParam);
              dec(i);
              E.Range['A' + IntToStr(i - m) + ':' + exEnd + IntToStr(i)
                ].Borders.Weight := 2;
              E.Range['A' + IntToStr(i - m) + ':' + exEnd + IntToStr(i)
                ].RowHeight := RowHeigh;
              i := i + l + 1;
            end;

            j := 1;
            E.Cells[i, j] := AbitCount;
            inc(j);
            E.Cells[i, j] := FAbitListDataSetInstance.FieldByName('fio')
              .AsString;
            inc(j);
            E.Cells[i, j] := FAbitListDataSetInstance.FieldByName('cname_kat_zach')
              .AsString;
            inc(j);
            E.Cells[i, j] := FAbitListDataSetInstance.FieldByName('cName_zaved')
              .AsString;
            inc(j);
            E.Cells[i, j] := '    ���������';
            inc(j);
            FAbitListDataSetInstance.Next;
            inc(i);
            inc(AbitCount);
          end;

        except
          on Ex: Exception do
          begin
            E.Quit;
            raise EApplicationException.Create
              ('������ ��� �������� � Excel', Ex);
          end;
        end;

        if AbitCount > 1 then
        begin
          E.Sheets[1].Delete;
          E.Sheets[1].Select;
          // E.Sheets[1].PageSetup.LeftFooter:='&5' + TApplicationController.GetInstance.DocumentFooter;
          E.Visible := true;
        end
        else
        begin
          E.Quit;
          raise EApplicationException.Create('��� ����������� ������������');
        end;
      finally
        E := UnAssigned;
      end;
    except
    end;
  finally
    FAbitListDataSetInstance.EnableControls;
  end;
end;

procedure TAbitZachislenieController.AddAllProhBalls(nnyear, ik_fac,
  ik_spec_fac: Variant);
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc := TADOStoredProc.Create(nil);
  try
    tempStoredProc.ProcedureName := 'ABIT_Add_AllProhBalls;1';
    tempStoredProc.Connection := dm.DBConnect;
    tempStoredProc.Parameters.CreateParameter('@newNNyear', ftInteger, pdInput,
      0, nnyear);
    tempStoredProc.Parameters.CreateParameter('@ik_fac', ftInteger, pdInput,
      0, ik_fac);
    tempStoredProc.Parameters.CreateParameter('@ik_spec_fac', ftInteger,
      pdInput, 0, ik_spec_fac);
    tempStoredProc.ExecProc;
  finally
    tempStoredProc.Free;
  end;

end;


{procedure TAbitZachislenieController.AbitsToExcel();
var
  E: Variant;
  i, ii: Integer;
  // cell,fac_spec:string;
  // XLApp: TExcelApplication;
begin
end; }

end.
