unit CommandController;

interface

uses Db, Data.Win.ADODB, SysUtils, System.Variants;

type

  TBaseADOCommand = class
  protected
    FStor: TADOStoredProc;
  public
    constructor Create(ProcName: string);
    destructor Destroy; virtual;
  end;

  TBaseSelectController = class
  protected
    FDataSet: TADODataSet;
    procedure SetFilter(aFilter: string);
  public
    function Refresh: boolean;
    procedure Save; virtual;
    procedure Reload(new_source: string); virtual;
    // function
    constructor Create(source: string);
    // source - источник данных в БД (можно с инструкцией where)
    destructor Destroy; virtual;
  end;


  // -----------------наследники---------------------------------------------------------------------------------

  // команды (процедуры)
  TVedCommand = class(TBaseADOCommand)
  public
    constructor Create(FVedom: integer); overload;

    procedure Update(ikVidExam: integer; VedNum, ikPrepod: string;
      DateExam: TDateTime; bitClose, bitNapr: boolean);
    procedure Delete;
  end;

  TAppendUspevCommand = class(TBaseADOCommand) // редактирование успеваемости
  public
    constructor Create(FVedom: integer);
    procedure DoIt(Ik_zach, Cosenca: integer);
  end;

  TAppendUspevKPThemeCommand = class(TBaseADOCommand) // редактирование темы КП/КР
  public
    constructor Create(FVedom: integer); overload;
    procedure DoIt(Ik_zach: integer; KPTheme: string);
  end;

  // селекторы
  TUspevController = class(TBaseSelectController)
  private
    FVedomost: integer;
    procedure SetVedomost(const Value: integer);
  public
    constructor Create;
    procedure Save;

    property Vedomost: integer write SetVedomost;
    property DataSet: TADODataSet read FDataSet;

  end;

  TUchPlanController = class(TBaseSelectController)
  private
    FYear: integer;
    FGroup: integer;
    procedure SetGroup(const Value: integer);
    procedure SetYear(const Value: integer);
    function GetUchPlan: integer;
  public
    constructor Create;
    property Group: integer write SetGroup;
    property Year: integer write SetYear;
    property UchPlan: integer read GetUchPlan;
  end;

  TGroupController = class(TBaseSelectController)
  private
    FikGroup: integer;
    FUchPlans: TUchPlanController;
    procedure SetGroup(const Value: integer);
  public
    function GetCurrentUchPlan: integer; // текущий план
    function UchPlanByYear(_year: integer): integer; // план на конкретный год
    property Group: integer write SetGroup;
    property UchPlan: integer read GetCurrentUchPlan;

    constructor Create;
    destructor Destroy; override;
  end;

  TVedomostController = class(TBaseSelectController)
  private
    FIK_Grup: integer;
    FN_sem: integer;
    FUspevController: TUspevController;
    function GetContentCount: integer;
    function IsAllVedDone: boolean;
    function GetVedomCount: integer;
    procedure SetVedomost(const Value: integer);
    function GetUspevDataSet: TADODataSet;
    function GetIsOpened: boolean;
  public
    constructor Create; overload;
    destructor Destroy; override;
    procedure Reload(ik_grup, n_sem: integer); overload;
    procedure CreateAllVed;
    procedure Save(ikVidExam: integer; VedNum, ikPrepod: string;
      DateExam: TDateTime; bitClose, bitNapr: boolean);

    property ContentCount: integer read GetContentCount;
    property VedomCount: integer read GetVedomCount;
    property AllVedDone: boolean read IsAllVedDone;
    property Vedomost: integer write SetVedomost;
    property IsOpened: boolean read GetIsOpened;

    property DataSet: TADODataSet read FDataSet;
    property UspevDataSet: TADODataSet read GetUspevDataSet;
  end;

  TBRSVedomostController = class(TBaseSelectController)
  public
  end;

implementation

uses {uDMUspevaemost,} GeneralController, DateUtils, uDM, ExceptionBase;

{ TBaseSelectController }

constructor TBaseSelectController.Create(source: string);
begin
  FDataSet := TGeneralController.Instance.GetNewADODataSet(true);
  Reload(source);
end;

destructor TBaseSelectController.Destroy;
begin
  FDataSet.Close;
  FDataSet.Free;
end;

function TBaseSelectController.Refresh: boolean;
begin
  FDataSet.Close;
  FDataSet.Open;
end;

procedure TBaseSelectController.Reload(new_source: string);
begin
  FDataSet.Close;
  FDataSet.CommandText := 'select * from ' + new_source;
  FDataSet.Open;
end;

procedure TBaseSelectController.Save;
begin

end;

procedure TBaseSelectController.SetFilter(aFilter: string);
begin
  FDataSet.Filtered := false;
  FDataSet.Filter := aFilter;
  FDataSet.Filtered := true;
end;

{ TGroupController }

constructor TGroupController.Create;
begin
  inherited Create('Grup');
  FUchPlans := TUchPlanController.Create;
end;

destructor TGroupController.Destroy;
begin
  FUchPlans.Free;
  inherited;
end;

function TGroupController.GetCurrentUchPlan: integer;
begin
  Result := UchPlanByYear(YearOf(Now)); // берем текущий год
end;

procedure TGroupController.SetGroup(const Value: integer);
begin
  SetFilter('ik_grup=' + IntToStr(Value));
  FikGroup := Value;
  FUchPlans.Group := Value;
end;

function TGroupController.UchPlanByYear(_year: integer): integer;
begin
  FUchPlans.Year := _year;
  Result := FUchPlans.UchPlan;
  if Result = NULL then
    Result := 0;
end;

{ TVedomostController }

constructor TVedomostController.Create;
begin
  inherited Create('UspevGetVidZanyatForVedomost(' + IntToStr(0) + ',' +
    IntToStr(0) + ')');
  FUspevController := TUspevController.Create;
end;

procedure TVedomostController.CreateAllVed;
var
  FStoredProc: TADOStoredProc;
  i: integer;
begin

  FStoredProc := TGeneralController.Instance.GetNewADOStoredProc
    ('UspevInsertVedomost', false);
  FStoredProc.Connection := dm.DBConnect;
  with FStoredProc.Parameters do
  begin
    Clear;
    CreateParameter('@cNumber_ved', ftString, pdInput, 12, '');
    CreateParameter('@Ik_grup', ftInteger, pdInput, 0, FIK_Grup);
    CreateParameter('@ik_upContent', ftInteger, pdInput, 0, 0);
    try
      FDataSet.First;
      for i := 0 to FDataSet.RecordCount - 1 do
      begin
        if FDataSet.FieldByName('ik_ved').Value = NULL then
        begin
          ParamByName('@ik_upContent').Value :=
            FDataSet.FieldByName('ik_upContent').AsInteger;
          FStoredProc.ExecProc;
        end;
        FDataSet.Next;
      end;
    finally
      FStoredProc.Free;
    end;
  end;
  Refresh;
end;

destructor TVedomostController.Destroy;
begin
  FUspevController.Free;
  inherited;
end;

function TVedomostController.GetContentCount: integer;
begin
  Result := FDataSet.RecordCount;
end;

function TVedomostController.GetIsOpened: boolean;
begin
  Result := not FDataSet.FieldByName('lClose').AsBoolean;
end;

function TVedomostController.GetUspevDataSet: TADODataSet;
begin
  Result := FUspevController.DataSet;
end;

function TVedomostController.GetVedomCount: integer;
var
  i: integer;
begin
  Result := 0;
  if FDataSet.RecordCount > 0 then
  begin
    FDataSet.First;
    for i := 0 to FDataSet.RecordCount - 1 do
    begin
      if FDataSet.FieldByName('ik_ved').Value <> NULL then
        Result := Result + 1;
      FDataSet.Next;
    end;
  end;

end;

function TVedomostController.IsAllVedDone: boolean;
var
  i: integer;
begin
  Result := true;
  for i := 0 to FDataSet.RecordCount - 1 do
  begin
    if FDataSet.FieldByName('ik_ved').Value = NULL then
    begin
      Result := false;
      break;
    end;
    FDataSet.Next;
  end;
end;

procedure TVedomostController.Reload(ik_grup, n_sem: integer);
begin
  inherited Reload('UspevGetVidZanyatForVedomost(' + IntToStr(n_sem) + ',' +
    IntToStr(ik_grup) + ')');
  FIK_Grup := ik_grup;
  FN_sem := n_sem;
end;

procedure TVedomostController.Save(ikVidExam: integer; VedNum, ikPrepod: string;
  DateExam: TDateTime; bitClose, bitNapr: boolean);
var
  FVedCommand: TVedCommand;
begin

  //TBaseADOCommand.Create('AppendUspev');

  FDataSet.Connection.BeginTrans;
  try
    FUspevController.Save;

    FVedCommand := TVedCommand.Create(FDataSet.FieldByName('ik_ved').AsInteger);
    FVedCommand.Update(ikVidExam, VedNum, ikPrepod, DateExam, bitClose,
      bitNapr);
    FDataSet.Connection.CommitTrans;

  except
    on E: Exception do
    begin
      FDataSet.Connection.RollbackTrans;
      raise EApplicationException.Create
        ('Произошла ошибка при сохранении успеваемости.', E);
      exit;
    end;
  end;

  FVedCommand.Free;
  Refresh;
end;

procedure TVedomostController.SetVedomost(const Value: integer);
begin
  FUspevController.Vedomost := Value;
  FDataSet.Locate('ik_ved', Value, []);
end;

{ TUchPlanController }

constructor TUchPlanController.Create;
begin
  inherited Create('UchPlanGrup');
end;

function TUchPlanController.GetUchPlan: integer;
begin
  Result := FDataSet.FieldByName('Ik_uch_plan').AsInteger;
end;

procedure TUchPlanController.SetGroup(const Value: integer);
begin
  FGroup := Value;
  SetFilter('ik_grup=' + IntToStr(Value));
end;

procedure TUchPlanController.SetYear(const Value: integer);
var
  str: string;
begin
  str := 'year_value = ' + IntToStr(Value);
  if FGroup <> 0 then
    str := 'ik_grup = ' + IntToStr(FGroup) + ' and ' + str;
  SetFilter(str);
end;

{ TUspevController }

constructor TUspevController.Create;
begin
  inherited Create('GetSmallVedForGrup(' + IntToStr(0) + ')');
end;

procedure TUspevController.Save;
var
  FAppendUspev: TAppendUspevCommand;
  FAppendUspevKPThemeCommand: TAppendUspevKPThemeCommand;
  i, cos: integer;
begin
  // вносим успеваемость
  FAppendUspev := TAppendUspevCommand.Create(FVedomost);
  try
    FDataSet.First;
    for i := 0 to FDataSet.RecordCount - 1 do
    begin
      if (FDataSet.FieldByName('Cosenca').Value <> NULL) then
        cos := FDataSet.FieldByName('Cosenca').AsInteger
      else
        cos := -1;
      FAppendUspev.DoIt(FDataSet.FieldByName('Ik_zach').AsInteger, cos);
      FDataSet.Next;
    end;
  finally
    FAppendUspev.Free;
  end;

  // вносим наименования тем
  FAppendUspevKPThemeCommand := TAppendUspevKPThemeCommand.Create(FVedomost);
  try
    FDataSet.First;
    for i := 0 to FDataSet.RecordCount - 1 do
    begin
      FAppendUspevKPThemeCommand.DoIt(FDataSet.FieldByName('Ik_zach').AsInteger,
        FDataSet.FieldByName('cTema').AsString);
      FDataSet.Next;
    end;
  finally
    FAppendUspevKPThemeCommand.Free;
  end;

  Refresh;
end;

procedure TUspevController.SetVedomost(const Value: integer);
begin
  inherited Reload('GetSmallVedForGrup(' + IntToStr(Value) + ')');
  FVedomost := Value;
end;

{ TBaseADOCommand }

constructor TBaseADOCommand.Create(ProcName: string);
begin
  FStor := TGeneralController.Instance.GetNewADOStoredProc(ProcName, false);
end;

destructor TBaseADOCommand.Destroy;
begin
  FStor.Free;
end;

{ TAppendUspevCommand }

procedure TAppendUspevCommand.DoIt(Ik_zach, Cosenca: integer);
begin
  with FStor.Parameters do
  begin
    ParamByName('@Ik_zach').Value := Ik_zach;
    ParamByName('@Cosenca').Value := Cosenca;
  end;
  FStor.ExecProc;
end;

constructor TAppendUspevCommand.Create(FVedom: integer);
begin
  inherited Create('AppendUspev');
  with FStor.Parameters do
  begin
    Clear;
    CreateParameter('@flag', ftInteger, pdInput, 0, 0);
    CreateParameter('@Ik_ved', ftInteger, pdInput, 0, FVedom);
    CreateParameter('@Ik_zach', ftInteger, pdInput, 0, 0);
    CreateParameter('@Cosenca', ftInteger, pdInput, 0, 0);
    CreateParameter('@cTema', ftString, pdInput, 2000, '');
  end;
end;

{ TAppendUspevKPThemeCommand }

constructor TAppendUspevKPThemeCommand.Create(FVedom: integer);
begin
  inherited Create('AppendUspevKPTheme');
  with FStor.Parameters do
  begin
    Clear;
    CreateParameter('@flag', ftInteger, pdInput, 0, 1);
    CreateParameter('@Ik_zach', ftInteger, pdInput, 0, 0);
    CreateParameter('@Ik_ved', ftInteger, pdInput, 0, FVedom);
    CreateParameter('@KPTheme', ftString, pdInput, 2000, '');
  end;
end;

procedure TAppendUspevKPThemeCommand.DoIt(Ik_zach: integer; KPTheme: string);
begin
  with FStor.Parameters do
  begin
    ParamByName('@Ik_zach').Value := Ik_zach;
    ParamByName('@KPTheme').Value := KPTheme;
    FStor.ExecProc;
  end;
end;

{ TVedCommand }

constructor TVedCommand.Create(FVedom: integer);
begin
  inherited Create('AppendVedomost');
  with FStor.Parameters do
  begin
    Clear;
    CreateParameter('@flag', ftInteger, pdInput, 0, 0);
    CreateParameter('@Ik_ved', ftInteger, pdInput, 0, FVedom);
    CreateParameter('@cNumber_ved', ftString, pdInput, 12, '');
    CreateParameter('@Itab_n', ftString, pdInput, 50, '');
    CreateParameter('@Ik_vid_exam', ftInteger, pdInput, 0, 0);
    CreateParameter('@Dd_exam', ftDateTime, pdInput, 0, Date);
    CreateParameter('@lClose', ftBoolean, pdInput, 0, 0);
    CreateParameter('@lPriznak_napr', ftBoolean, pdInput, 0, 0);
  end;
end;

procedure TVedCommand.Delete;
begin
  with FStor.Parameters do
  begin
    ParamByName('@flag').Value := -1; // удаление
    FStor.ExecProc;
  end;
end;

procedure TVedCommand.Update(ikVidExam: integer; VedNum, ikPrepod: string;
  DateExam: TDateTime; bitClose, bitNapr: boolean);
begin
  with FStor.Parameters do
  begin
    ParamByName('@flag').Value := 0; // редактирование
    ParamByName('@cNumber_ved').Value := VedNum;
    ParamByName('@Itab_n').Value := ikPrepod;
    ParamByName('@Ik_vid_exam').Value := ikVidExam;
    ParamByName('@Dd_exam').Value := DateExam;
    ParamByName('@lClose').Value := bitClose;
    ParamByName('@lPriznak_napr').Value := bitNapr;
    FStor.ExecProc;
  end;
end;

end.
