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
    property DataSet: TADODataSet read FDataSet;
  end;


  // -----------------наследники---------------------------------------------------------------------------------

  // команды (процедуры) работы с ведомостями
  TUpdateVedCommand = class(TBaseADOCommand)
    // редактирует или удаляет ведомость
  public
    constructor Create(FVedom: integer); overload;
    procedure Update(ikVidExam: integer; VedNum, ikPrepod: string;
      DateExam: TDateTime; bitClose, bitNapr: boolean);
    procedure Delete;
  end;

  TAddVedUspevCommand = class(TBaseADOCommand)
    // добавляет ведомость вместе с успеваемостью
  public
    constructor Create(aGrupIK: integer);
    procedure DoIt(ContentIK: integer);
  end;

  TAppendUspevCommand = class(TBaseADOCommand) // редактирование успеваемости
  public
    constructor Create(FVedom: integer);
    procedure DoIt(StudGrupIK, ZachIK, Cosenca, Balls: integer);
  end;

  TAppendBRSUspevCommand = class(TBaseADOCommand)
    // редактирование БРС-успеваемости
  public
    constructor Create(FVedom: integer);
    procedure Update(StudGrupIK, iBall, PropCount, PropUvajCount: integer);
  end;

  TAppendUspevKPThemeCommand = class(TBaseADOCommand)
    // редактирование темы КП/КР
  public
    constructor Create(FVedom: integer); overload;
    procedure DoIt(StudGrupIK, ZachIK: integer; KPTheme: string);
  end;

  TNaprCommand = class(TBaseADOCommand)
  public
    constructor Create(FVedom: integer); overload;
    function Add(ik_contentUP, ik_studGrup, VidEx: integer;
      StartDate, EndDate: TDateTime; cNumber_napr: string): integer;
    procedure Close(Cosenca: integer; ntab, KPTema: string;
      date_exam: TDateTime);
    procedure Annul;
  end;

  // ------------------------------------ СЕЛЕКТОРЫ-----------------------------
  TStudentController = class(TBaseSelectController)

  end;

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

  TBRSUspevController = class(TBaseSelectController)
  private
    FBRSVedomost: integer;
    procedure SetBRSVedomost(const Value: integer);
  public
    constructor Create;
    procedure Save;
    property BRSVedomost: integer write SetBRSVedomost;
    property DataSet: TADODataSet read FDataSet;
  end;

  { управление планами }
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

  { управление группами: получить уч. план (текущий или за конкретный год) }
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

  { управление ведомостями: загрузка, создание всех ведомостей группы
    сохранение свойств }
  TVedomostController = class(TBaseSelectController)
  private
    FIK_Grup: integer;
    FN_sem: integer;
    FUspevController: TUspevController; // успеваемость из ведомости

    function GetContentCount: integer;
    function IsAllVedDone: boolean;
    function GetVedomCount: integer;
    procedure SetVedomost(const Value: integer);
    function GetUspevDataSet: TADODataSet;
    function GetIsOpened: boolean;
    function GetVedDataSet: TADODataSet;
  public
    constructor Create; overload;
    destructor Destroy; override;
    procedure Reload(ik_grup, n_sem: integer); overload;
    // загрузить виды отчетности, которые должны быть
    procedure CreateAllVed;
    // создать все ведомости, которые еще не созданы для текущей группы в семестре
    procedure DelVed(ik_ved: integer);
    procedure Save(ikVidExam: integer; VedNum, ikPrepod: string;
      // сохранить текущую ведомость
      DateExam: TDateTime; bitClose, bitNapr: boolean);

    property ContentCount: integer read GetContentCount;
    // сколько видов отчетности должно быть
    property VedomCount: integer read GetVedomCount;
    // сколько создано ведомостей
    property AllVedDone: boolean read IsAllVedDone;
    // признак: все ли ведомости созданы
    property Vedomost: integer write SetVedomost;
    // установить текущую ведомость
    property IsOpened: boolean read GetIsOpened;
    // признак: открыта ли ведомость
    property VedDataSet: TADODataSet read GetVedDataSet;
    // взять DataSet с ведомостями
    property UspevDataSet: TADODataSet read GetUspevDataSet;
    // DataSet с успеваемостью для текущей ведомости
  end;

  TBRSVedomostController = class(TBaseSelectController)
  private
    FIK_Grup: integer;
    FN_sem: integer;
    FN_mod: integer;
    FBRSUspevController: TBRSUspevController; // успеваемость из ведомости

    function GetBRSCount: integer;
    function GetCreatedCount: integer;
    procedure SetBRSVedomost(const Value: integer);
    function GetBallsDataSet: TADODataSet;
    function GetVedDataSet: TADODataSet;
  public
    constructor Create; overload;
    destructor Destroy; override;
    procedure Reload(ik_grup, n_sem, n_module: integer); overload;
    procedure CreateAllBRS;
    procedure DelVed(ik_ved: integer);
    procedure Save(ikPrepod: string; // сохранить текущую ведомость
      DateExam: TDateTime);

    property BRSVedomost: integer write SetBRSVedomost;
    property Count: integer read GetBRSCount;
    property CreatedCount: integer read GetCreatedCount;
    property VedsDataSet: TADODataSet read GetVedDataSet;
    property BallsDataSet: TADODataSet read GetBallsDataSet;
  end;

  { управление дисциплинами, по которым требуются направления
    ведомость закрыта или вообще не создавалась }
  TContentNapravController = class(TBaseSelectController)
  private
    FContentIK: integer;
    procedure setContent(const Value: integer);
  public
    constructor Create; overload;
    procedure Reload(ik_studGrup: integer); overload;

    property ContentIK: integer read FContentIK write setContent;
  end;

  { управление направлениями студента }
  TNapravController = class(TBaseSelectController)
  private
    FStudGrupIK: integer; // ik_StudGrup
    FGrup: integer;
    FSemester: integer;

    FContentNapr: TContentNapravController;
    // набор предметов для создания направлений
    procedure setContent(const Value: integer);
    function GetContentDS: TADODataSet;
    procedure SetSemester(const Value: integer);
  public
    constructor Create;
    procedure Reload(ik_studGrup: integer); overload;
    procedure LoadOpenedNapr;
    function CloseNapr(VedIK, Cosenca: integer; ntab, KPTema: string;
      date_exam: TDateTime): integer;
    function AddNapr(VidExID: integer; dateIn, dateOut: TDateTime;
      NaprNum: string; var VedIK: integer): integer;
    function Annul(VedIK: integer): integer;

    property ContentIK: integer write setContent;
    property ContentDS: TADODataSet read GetContentDS;
    property Semester: integer write SetSemester;
  end;

implementation

uses GeneralController, DateUtils, uDM, ExceptionBase,
  ConstantRepository;

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
  FAddVedUspevCommand: TAddVedUspevCommand;
  i: integer;
begin
  FDataSet.Filtered := false;
  FAddVedUspevCommand := TAddVedUspevCommand.Create(FIK_Grup);
  try
    FDataSet.First;
    for i := 0 to FDataSet.RecordCount - 1 do
    begin
      if FDataSet.FieldByName('ik_ved').Value = NULL then
        FAddVedUspevCommand.DoIt(FDataSet.FieldByName('ik_upContent')
          .AsInteger);
      FDataSet.Next;
    end;
  finally
    FAddVedUspevCommand.Free;
  end;
  FDataSet.Filtered := true;
  Refresh;
end;

procedure TVedomostController.DelVed(ik_ved: integer);
var
  FVedCommand: TUpdateVedCommand;
begin
  try
    FVedCommand := TUpdateVedCommand.Create(ik_ved);
    FVedCommand.Delete;
  except
    on E: Exception do
    begin
      raise EApplicationException.Create
        ('Произошла ошибка при удалении ведомости.', E);
      exit;
    end;
  end;
  FVedCommand.Free;
  Refresh;
end;

destructor TVedomostController.Destroy;
begin
  FUspevController.Free;
  inherited;
end;

function TVedomostController.GetContentCount: integer;
begin
  FDataSet.Filtered := false;
  Result := FDataSet.RecordCount;
  FDataSet.Filtered := true;
end;

function TVedomostController.GetIsOpened: boolean;
begin
  Result := not FDataSet.FieldByName('lClose').AsBoolean;
end;

function TVedomostController.GetUspevDataSet: TADODataSet;
begin
  Result := FUspevController.DataSet;
end;

function TVedomostController.GetVedDataSet: TADODataSet;
begin
  SetFilter('ik_ved<>NULL');
  Result := DataSet;
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
  FVedCommand: TUpdateVedCommand;
begin

  FDataSet.Connection.BeginTrans;
  try
    FUspevController.Save;

    FVedCommand := TUpdateVedCommand.Create(FDataSet.FieldByName('ik_ved')
      .AsInteger);
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
  i, cos, bal: integer;
begin
  // вносим успеваемость
  FAppendUspev := TAppendUspevCommand.Create(FVedomost);
  try
    FDataSet.First;
    for i := 0 to FDataSet.RecordCount - 1 do
    begin
      cos := IfNull(FDataSet.FieldByName('Cosenca').Value,-1);
      bal := IfNull(FDataSet.FieldByName('i_balls').Value,0);
      FAppendUspev.DoIt(0, FDataSet.FieldByName('Ik_zach').AsInteger,  cos, bal);

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
      FAppendUspevKPThemeCommand.DoIt(0,FDataSet.FieldByName('Ik_zach').AsInteger,
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

procedure TAppendUspevCommand.DoIt(StudGrupIK, ZachIK, Cosenca, Balls: integer);
begin
  with FStor.Parameters do
  begin
    ParamByName('@Ik_studGrup').Value := StudGrupIK;
    ParamByName('@Ik_zach').Value := ZachIK;
    ParamByName('@Cosenca').Value := Cosenca;
    if Cosenca>0 then
      ParamByName('@i_balls').Value := Balls
      else ParamByName('@i_balls').Value := NULL;
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
    CreateParameter('@Ik_studGrup', ftInteger, pdInput, 0, 0);
    CreateParameter('@Cosenca', ftInteger, pdInput, 0, 0);
    CreateParameter('@cTema', ftString, pdInput, 2000, '');
    CreateParameter('@Ik_zach', ftInteger, pdInput, 0, 0);
    CreateParameter('@i_balls', ftInteger, pdInput, 0, 0);
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
    CreateParameter('@Ik_studGrup', ftInteger, pdInput, 0, 0);
    CreateParameter('@Ik_zach', ftInteger, pdInput, 0, 0);
    CreateParameter('@Ik_ved', ftInteger, pdInput, 0, FVedom);
    CreateParameter('@KPTheme', ftString, pdInput, 2000, '');
  end;
end;

procedure TAppendUspevKPThemeCommand.DoIt(StudGrupIK, ZachIK: integer; KPTheme: string);
begin
  with FStor.Parameters do
  begin
    ParamByName('@Ik_studGrup').Value := StudGrupIK;
    ParamByName('@Ik_zach').Value := ZachIK;
    ParamByName('@KPTheme').Value := KPTheme;
    FStor.ExecProc;
  end;
end;

{ TVedCommand }

constructor TUpdateVedCommand.Create(FVedom: integer);
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
    CreateParameter('@Dd_vyd', ftDateTime, pdInput, 0, Date);
    CreateParameter('@lClose', ftBoolean, pdInput, 0, 0);
    CreateParameter('@lPriznak_napr', ftBoolean, pdInput, 0, 0);
  end;
end;

procedure TUpdateVedCommand.Delete;
begin
  with FStor.Parameters do
  begin
    ParamByName('@flag').Value := -1; // удаление
    FStor.ExecProc;
  end;
end;

procedure TUpdateVedCommand.Update(ikVidExam: integer; VedNum, ikPrepod: string;
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

{ TNapravController }

function TNapravController.AddNapr(VidExID: integer; dateIn, dateOut: TDateTime;
  NaprNum: string; var VedIK: integer): integer;
var
  NaprCommand: TNaprCommand;
begin
  try
    NaprCommand := TNaprCommand.Create(0);
    VedIK := NaprCommand.Add(FContentNapr.ContentIK, FStudGrupIK, VidExID,
      dateIn, dateOut, NaprNum);
    Result := NoError;
  except
    Result := FailError;
  end;
  NaprCommand.Free;
  Refresh;
  DataSet.Locate('Ik_ved', VedIK, []);
end;

function TNapravController.Annul(VedIK: integer): integer;
var
  NaprCommand: TNaprCommand;
begin
  try
    NaprCommand := TNaprCommand.Create(VedIK);
    NaprCommand.Annul;
    Refresh;
    Result := NoError;
  except
    Result := FailError;
  end;
  NaprCommand.Free;
end;

function TNapravController.CloseNapr(VedIK, Cosenca: integer;
  ntab, KPTema: string; date_exam: TDateTime): integer;
var
  FVedCommand: TUpdateVedCommand;
  FAppendUspevCommand: TAppendUspevCommand;
  FAppendUspevKPThemeCommand: TAppendUspevKPThemeCommand;
begin
  DataSet.Locate('Ik_ved', VedIK, []);
  if (DataSet.FieldByName('lClose').Value = NULL) then
  // если направление уже аннулировано
  begin
    Result := StatusError;
    exit;
  end;

  with DataSet do
    try
      Connection.BeginTrans;
      FVedCommand := TUpdateVedCommand.Create(VedIK);
      FAppendUspevCommand := TAppendUspevCommand.Create(VedIK);
      FAppendUspevKPThemeCommand := TAppendUspevKPThemeCommand.Create(VedIK);

      FAppendUspevCommand.DoIt(FStudGrupIK, 0, Cosenca, 0); // сохраняем оценку
      if KPTema <> '' then
        FAppendUspevKPThemeCommand.DoIt(FStudGrupIK,0, KPTema); // сохраняем тему
      FVedCommand.Update(FieldByName('ik_vid_exam').Value,
        FieldByName('cNumber_ved').Value, // закрываем направление
        ntab, date_exam, true, true);

      Connection.CommitTrans;

      Result := NoError;
    except
      on E: Exception do
      begin
        Connection.RollbackTrans;
        Result := FailError;
        raise EApplicationException.Create
          ('Произошла ошибка при закрыти направления.', E);
        exit;
      end;
    end;

  FVedCommand.Free;
  FAppendUspevCommand.Free;
  FAppendUspevKPThemeCommand.Free;
  Refresh;
end;

constructor TNapravController.Create;
begin
  inherited Create('GetStudNaprav(' + IntToStr(0) + ')');
  FContentNapr := TContentNapravController.Create;
end;

function TNapravController.GetContentDS: TADODataSet;
begin
  Result := FContentNapr.DataSet;
end;

procedure TNapravController.LoadOpenedNapr;
begin
  SetFilter('lClose = 0');
end;

procedure TNapravController.Reload(ik_studGrup: integer);
begin
  inherited Reload('GetStudNaprav(' + IntToStr(ik_studGrup) +
    ') order by n_sem');
  FStudGrupIK := ik_studGrup;
  FContentNapr.Reload(ik_studGrup);
end;

procedure TNapravController.setContent(const Value: integer);
begin
  SetFilter('ik_upContent=' + IntToStr(Value));
  FDataSet.Active := (Value > 0);

  FContentNapr.ContentIK := Value;
end;

procedure TNapravController.SetSemester(const Value: integer);
var
  Filter: string;
begin
  FContentNapr.SetFilter('n_sem=' + IntToStr(Value));
  FSemester := Value;
end;

{ TContentNapravController }

constructor TContentNapravController.Create;
begin
  inherited Create('GetNapravlInfo(' + IntToStr(0) + ')');
end;

procedure TContentNapravController.Reload(ik_studGrup: integer);
begin
  inherited Reload('GetNapravlInfo(' + IntToStr(ik_studGrup) + ')');
end;

procedure TContentNapravController.setContent(const Value: integer);
begin
  FContentIK := Value;
  FDataSet.Locate('ik_upContent', Value, []);
end;

{ TNaprCommand }

function TNaprCommand.Add(ik_contentUP, ik_studGrup, VidEx: integer;
  StartDate, EndDate: TDateTime; cNumber_napr: string): integer;
begin
  with FStor.Parameters do
  begin
    ParamByName('@flag').Value := 0; // добавить направление
    ParamByName('@ik_upContent').Value := ik_contentUP;
    ParamByName('@ik_studGrup').Value := ik_studGrup;
    ParamByName('@Ik_vid_exam').Value := VidEx;
    ParamByName('@StartDate').Value := StartDate;
    ParamByName('@EndDate').Value := EndDate;
    ParamByName('@cNumber_napr').Value := cNumber_napr;
    FStor.ExecProc;
    Result := ParamByName('@RETURN_VALUE').Value;
  end;
end;

procedure TNaprCommand.Annul;
begin
  with FStor.Parameters do
  begin
    ParamByName('@flag').Value := -1; // аннулировать направление
    FStor.ExecProc;
  end;
end;

procedure TNaprCommand.Close(Cosenca: integer; ntab, KPTema: string;
  date_exam: TDateTime);
begin
  with FStor.Parameters do
  begin
    ParamByName('@flag').Value := 1; // закрыть направление
    ParamByName('@Itab_n').Value := ntab;
    ParamByName('@KPTema').Value := KPTema;
    ParamByName('@EndDate').Value := date_exam;
    FStor.ExecProc;
  end;
end;

constructor TNaprCommand.Create(FVedom: integer);
begin
  inherited Create('AppendNapravl;1');
  with FStor.Parameters do
  begin
    Clear;
    CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 0, 1);
    CreateParameter('@flag', ftInteger, pdInput, 0, 0);
    CreateParameter('@ik_upContent', ftInteger, pdInput, 0, 0);
    CreateParameter('@ik_studGrup', ftInteger, pdInput, 0, 0);
    CreateParameter('@StartDate', ftDateTime, pdInput, 0, Date);
    CreateParameter('@EndDate', ftDateTime, pdInput, 0, Date);
    CreateParameter('@Ik_vid_exam', ftInteger, pdInput, 0, 0);
    CreateParameter('@cNumber_napr', ftString, pdInput, 12, '');
    CreateParameter('@ik_ved', ftInteger, pdInput, 0, FVedom);
    CreateParameter('@cosenca', ftInteger, pdInput, 0, 0);
    CreateParameter('@Itab_n', ftString, pdInput, 50, '');
    CreateParameter('@KPTema', ftString, pdInput, 2000, '');
  end;

end;

{ TAddVedUspevCommand }

constructor TAddVedUspevCommand.Create(aGrupIK: integer);
begin
  inherited Create('UspevInsertVedomost');
  with FStor.Parameters do
  begin
    Clear;
    CreateParameter('@cNumber_ved', ftString, pdInput, 12, '');
    CreateParameter('@Ik_grup', ftInteger, pdInput, 0, aGrupIK);
    CreateParameter('@ik_upContent', ftInteger, pdInput, 0, 0);
    CreateParameter('@dD_vydano', ftDateTime, pdInput, 0, Now);
  end;
end;

procedure TAddVedUspevCommand.DoIt(ContentIK: integer);
begin
  with FStor.Parameters do
  begin
    ParamByName('@ik_upContent').Value := ContentIK;
    FStor.ExecProc;
  end;
end;

{ TBRSVedomostController }

constructor TBRSVedomostController.Create;
begin
  inherited Create('GetBRSVidZanyat(' + IntToStr(0) + ',' + IntToStr(0) + ',' +
    IntToStr(0) + ')');
  FBRSUspevController := TBRSUspevController.Create;
end;

procedure TBRSVedomostController.CreateAllBRS;
var
  FAddVedUspevCommand: TAddVedUspevCommand;
  i: integer;

begin
  FDataSet.Filtered := false;
  FAddVedUspevCommand := TAddVedUspevCommand.Create(FIK_Grup);
  try
    FDataSet.First;
    for i := 0 to FDataSet.RecordCount - 1 do
    begin
      if FDataSet.FieldByName('ik_ved').Value = NULL then
        FAddVedUspevCommand.DoIt(FDataSet.FieldByName('ik_upContent')
          .AsInteger);
      FDataSet.Next;
    end;
  finally
    FAddVedUspevCommand.Free;
  end;
  FDataSet.Filtered := true;
  Refresh;
end;

procedure TBRSVedomostController.DelVed(ik_ved: integer);
var
  FVedCommand: TUpdateVedCommand;
begin
  try
    FVedCommand := TUpdateVedCommand.Create(ik_ved);
    FVedCommand.Delete;
  except
    on E: Exception do
    begin
      raise EApplicationException.Create
        ('Произошла ошибка при удалении ведомости.', E);
      exit;
    end;
  end;
  FVedCommand.Free;
  Refresh;
end;

destructor TBRSVedomostController.Destroy;
begin
  FBRSUspevController.Free;
  inherited;
end;

function TBRSVedomostController.GetBallsDataSet: TADODataSet;
begin
  Result := FBRSUspevController.DataSet;
end;

function TBRSVedomostController.GetBRSCount: integer;
begin
  DataSet.Filtered := false;
  Result := FDataSet.RecordCount;
  DataSet.Filtered := true;
end;

function TBRSVedomostController.GetCreatedCount: integer;
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

function TBRSVedomostController.GetVedDataSet: TADODataSet;
begin
  SetFilter('ik_ved<>NULL');
  Result := DataSet;
end;

procedure TBRSVedomostController.Reload(ik_grup, n_sem, n_module: integer);
begin
  inherited Reload('GetBRSVidZanyat(' + IntToStr(ik_grup) + ',' +
    IntToStr(n_sem) + ',' + IntToStr(n_module) + ')');
  FIK_Grup := ik_grup;
  FN_sem := n_sem;
  FN_mod := n_module;
end;

procedure TBRSVedomostController.Save(ikPrepod: string; DateExam: TDateTime);
var
  FVedCommand: TUpdateVedCommand;
begin
  FDataSet.Connection.BeginTrans;
  try
    FBRSUspevController.Save;

    FVedCommand := TUpdateVedCommand.Create(FDataSet.FieldByName('ik_ved')
      .AsInteger);
    FVedCommand.Update(0, '', ikPrepod, DateExam, false, false);
    FDataSet.Connection.CommitTrans;

  except
    on E: Exception do
    begin
      FDataSet.Connection.RollbackTrans;
      raise EApplicationException.Create
        ('Произошла ошибка при сохранении ведомости БРС.', E);
      exit;
    end;
  end;

  FVedCommand.Free;
  Refresh;
end;

procedure TBRSVedomostController.SetBRSVedomost(const Value: integer);
begin
  FBRSUspevController.BRSVedomost := Value;
  FDataSet.Locate('ik_ved', Value, []);
end;

{ TBRSUspevController }

constructor TBRSUspevController.Create;
begin
  inherited Create('GetSmallBRSAttForGrup(' + IntToStr(0) + ')');
end;

procedure TBRSUspevController.Save;
var
  FAppendBRSUspev: TAppendBRSUspevCommand;
  i: integer;
begin
  // вносим успеваемость
  FAppendBRSUspev := TAppendBRSUspevCommand.Create(FBRSVedomost);

  FDataSet.First;
  for i := 0 to FDataSet.RecordCount - 1 do
  with FDataSet do
  begin
    FAppendBRSUspev.Update(FieldByName('ik_zach').AsInteger,
    FieldByName('i_balls').AsInteger, FieldByName('PropCount').AsInteger,
    FieldByName('Uvag_propCount').AsInteger);
    Next;
  end;

  FAppendBRSUspev.Free;
  Refresh;
end;

procedure TBRSUspevController.SetBRSVedomost(const Value: integer);
begin
  inherited Reload('GetSmallBRSAttForGrup(' + IntToStr(Value) + ')');
  FBRSVedomost := Value;
end;

{ TAppendBRSUspevCommand }

constructor TAppendBRSUspevCommand.Create(FVedom: integer);
begin
  inherited Create('AppendRezBRSAtt');
  with FStor.Parameters do
  begin
    Clear;
    CreateParameter('@flag', ftInteger, pdInput, 0, 0);
    CreateParameter('@Ik_ved', ftInteger, pdInput, 0, FVedom);
    CreateParameter('@Ik_zach', ftInteger, pdInput, 0, 0);
    CreateParameter('@i_balls', ftInteger, pdInput, 0, 0);
    CreateParameter('@PropCount', ftInteger, pdInput, 0, 0);
    CreateParameter('@PropUvajCount', ftInteger, pdInput, 0, 0);
  end;
end;

procedure TAppendBRSUspevCommand.Update(StudGrupIK, iBall, PropCount,
  PropUvajCount: integer);
begin
  with FStor.Parameters do
  begin
    ParamByName('@flag').Value := 0; // редактирование
    ParamByName('@Ik_zach').Value := StudGrupIK;
    ParamByName('@i_balls').Value := iBall;
    ParamByName('@PropCount').Value := PropCount;
    ParamByName('@PropUvajCount').Value := PropUvajCount;
  end;
  FStor.ExecProc;
end;

end.
