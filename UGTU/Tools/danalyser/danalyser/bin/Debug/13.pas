(*
    Базовая функциональность отчётов с использованием OLE-серверов (MS Office)

    Версия: 1.0.0.0
    Создано: 07.06.2008
    Последняя правка: 29.06.2008 20:57
    Автор: Ф.В. Маракасов

    TODO:
        1) Необходимо определить и реализовать TWordReportBase
        2) Определить недостающие методы (helper-methods) в TExcelReportBase.
        3) Провести тестирование в различных сценариях.
*)



(*
  Example:

  1. Определите свой класс для создания отчёта как производный
     от одного из базовых классов отчёта, перегрузив метод
     Execute. Другие виртуальные методы базового класса TBaseReport
     перегрузите при необходимости.
     Добавьте необходимые свойства и методы.

  type
    TMyExcelReport = class(TExcelReportBase)
    private
       FOID:Integer;
    protected
       procedure Execute;override;
       function GetTotalSteps:Integer;override;
    public
       // Новое свойство: ID объекта для которого создаётся отчёт
       property OID:Integer read FOID write FOID;
    end;
  ...

  procedure TMyExcelReport.Execute;
  var
    i : Integer;
  begin
    inherited;
    // Выводим OID объекта в ячейку [1,2]
    // В реальном случае идентификатор скорее всего будет использован для
    // выполнения запроса над источником данных для извлечения данных
    // для отчёта
    Items[1,2] := OID;
    // Выводит в первом столбце в активном листе Excel числа от 1 до 100
    for i := 1 to TotalSteps do
    begin
      Items[i,1] := i;
      //Информировать, что шаг выполнен
      NextStep(1, 'Progress '+ IntToStr(i));
    end;
  end;

  //Определим общее число шагов в создании рапорта
  //Реальное число шагов скорее всего будет равно количеству
  //записей, возвращённых запросом для отчёта
  //Example: Result := MyDataSet.Recordscount;
  function TMyExcelReport.GetTotalSteps: Integer;
  begin
    Result := 100;
  end;

  2. Cоздайте экземпляр отчёта и подпишитесь на события (если необходимо)
  var
    Report:TReportBase;
  begin
    Report := TReportBase.CreateReport(TMyExcelReport);
    try
      Report.OnBeforeExecute := BeforeExecute;
      Report.OnAfterExecute := AfterExecute;
      Report.OnReportProgress := ReportProgress;
      Report.OnExecuteError := ExecuteError;
      // Этот параметр можно пропустить, если шаблона не существует
      Report.ReportTemplate := 'd:\projects\reportmind\ReportSample.xlt';
      // Начать построение отчёта
      Report.BuildReport;
    finally
      Report.Free;
    end;

    Remark: если установлено свойство Report.FreeOnComplete := true
    то нет необходимости в вызове метода Free:
    var
      Report:TReportBase;
    begin
      Report := TReportBase.CreateReport(TMyExcelReport);
      Report.FreeOnComplete := true;
      Report.OnBeforeExecute := BeforeExecute;
      Report.OnAfterExecute := AfterExecute;
      Report.OnReportProgress := ReportProgress;
      Report.OnExecuteError := ExecuteError;
      // Этот параметр можно пропустить, если шаблона не существует
      Report.ReportTemplate := 'd:\projects\reportmind\ReportSample.xlt';
      // Начать построение отчёта
      Report.BuildReport;
    end;


  3. Реализуйте обработчики события
  procedure TForm1.AfterExecute(Sender: TObject);
  begin
    // В случае успешного окончания отчёт показывается на экране
    ShowMessage('OnAfterExecute. Событие возникает после окончания построения отчёта.');
    (Sender as TReportBase).Show;
  end;

  procedure TForm1.BeforeExecute(Sender: TObject);
  begin
    // Предупреждаем пользователя, что начинается построение отчёта
    ShowMessage('OnBeforeExecute. Событие возникает до начала построения отчёта.');
  end;

  procedure TForm1.ExecuteError(Sender: TObject; E: Exception);
  begin
    // В случае ошибки печатаем сообщение и "тихо" закрываем OLE-сервер
    ShowMessage('Произошла ошибка при создании отчёта: ' + E.Message);
    (Sender as TReportBase).Quit;
  end;

  procedure TForm1.ReportProgress(Sender: TObject; CurrentStep: Integer; ProgressNote:string);
  begin
    // При выполнении очередного шага сдвигаем позицию в ProgressBar и печатаем описание
    // шага в Edit1
    ProgressBar1.Position := CurrentStep;
    Edit1.Text := ProgressNote;
    ProgressBar1.Update;
    Edit1.Update;
  end;

*)

{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN SYMBOL_EXPERIMENTAL ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN UNIT_EXPERIMENTAL ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
{$WARN OPTION_TRUNCATED ON}
{$WARN WIDECHAR_REDUCED ON}
{$WARN DUPLICATES_IGNORED ON}
{$WARN UNIT_INIT_SEQ ON}
{$WARN LOCAL_PINVOKE ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN TYPEINFO_IMPLICITLY_ADDED ON}
{$WARN XML_WHITESPACE_NOT_ALLOWED ON}
{$WARN XML_UNKNOWN_ENTITY ON}
{$WARN XML_INVALID_NAME_START ON}
{$WARN XML_INVALID_NAME ON}
{$WARN XML_EXPECTED_CHARACTER ON}
{$WARN XML_CREF_NO_RESOLVE ON}
{$WARN XML_NO_PARM ON}
{$WARN XML_NO_MATCHING_PARM ON}
unit ReportsBase;
{#Author tanyav@ist.ugtu.net}

interface
uses
  Classes, SysUtils, ExcelXP;
type
  // Исключение при установке шага в построении отчёта
  EProgress = class(Exception)
  end;
  // Тип события изменения шага
  TNotifyReportProgress = procedure(Sender : TObject; Progress : Integer; ProgressNote : string) of object;

  // Тип события обработчика ошибок
  TNotifyExecuteError = procedure(Sender : TObject; E : Exception) of object;

  // Класс отчётов
  TReportBaseClass = class of TReportBase;

  // Базовый класс отчётов
  TReportBase = class
  private
    FOpen : Boolean;
    FStep : Integer;
    FFreeOnComplete:Boolean;
    FReportTemplate : string;
    FApplication : OleVariant;
    FOnBeforeExecute : TNotifyEvent;
    FOnAfterExecute : TNotifyEvent;
    FOnProgress : TNotifyReportProgress;
    FOnExecuteError : TNotifyExecuteError;
    function CreateObject(const ClassName:string):OleVariant;
    function GetApplication:OleVariant;

    procedure SetStep(Value:Integer);
    procedure CheckStep(const Value:Integer);
    procedure RaiseBeforeExecute;
    procedure RaiseAfterExecute;
    procedure RaiseProgress(const ProgressNote:string='');
    procedure SetReportTemplate(const Value:string);
  protected
    constructor Create;virtual;

    // Переопределите этот метод для заполнения шаблона отчёта нужными значениями
    procedure Execute;virtual;abstract;
    // Переопределите этот метод для создания экземпляра класса приложения
    function  DoGetApplication:OleVariant;virtual;abstract;
    // Переопределите этот метод для открытия шаблона отчёта
    procedure DoOpen;virtual;abstract;

    procedure Open;
    //Переопределите этот метод для расчёта полного числа шагов в построении отчёта
    function GetTotalSteps:Integer;virtual;
    //Сдвинуть прогресс на заданный шаг. Значение Increment может быть отрицательным
    procedure NextStep(Increment:Integer = 1; const ProgressNote:string='');overload;
    //Обнулить прогресс
    procedure ClearProgress;
    // Получить или установить текущий шаг
    property  CurrentStep:Integer read FStep write SetStep;
    // Ссылка на интерфейс Application
    property Application:OleVariant read GetApplication;

  public
    destructor Destroy;override;
    //Создаёт новый экземпляр, заданного параметром класса отчёта
    class function CreateReport(ReportClass:TReportBaseClass):TReportBase;

    // Строит отчёт, вызывая Execute
    procedure BuildReport;

    // Показывает отчёт на экране, вызывая Application.Visible := true;
    // Переопределите этот метод, если сервер не
    // поддерживат данную сигнатуру.
    procedure Show;virtual;

    // Скрывает отчёт, вызывая Application.Visible := false;
    // Переопределите этот метод, если сервер не
    // поддерживат данную сигнатуру.
    procedure Hide;virtual;

    // Закрывает отчёт, вызывая Application.Quit;
    // Переопределите этот метод, если сервер не
    // поддерживат данную сигнатуру.
    procedure Quit;virtual;

    //Получает или устанавливает флаг, заставляющий объект отчёта гарантированно
    //саморазрушиться при окончании (успешном или при ошибке) построения
    //отчёта.
    property FreeOnComplete:Boolean read FFreeOnComplete write FFreeOnComplete;
    // Получает число шагов в отчёте
    property TotalSteps:Integer read GetTotalSteps;
    // Получает или устанавливает шаблон для отчёта
    property ReportTemplate:string read FReportTemplate write SetReportTemplate;
    // Событие вызникает перед вызовом метода Execute
    property OnBeforeExecute:TNotifyEvent read FOnBeforeExecute write FOnBeforeExecute;
    // Событие возникает после успешного завершения работы метода Execute
    property OnAfterExecute:TNotifyEvent read FOnAfterExecute write FOnAfterExecute;
    // Событие возникает при изменении шага прогресса
    property OnReportProgress:TNotifyReportProgress read FOnProgress write FOnProgress;
    // Событие возникает при возбуждении необработанного исключения в методе Execute
    property OnExecuteError:TNotifyExecuteError read FOnExecuteError write FOnExecuteError;
  end;

  // Базовый класс для отчётов на Excel
  TExcelReportBase = class(TReportBase, _Application)
  private
    FCurrentWorkbook: ExcelXP._Workbook;
    function GetExcelApplication : ExcelApplication;
    function GetActiveWorksheet : _Worksheet;
    function GetCells : ExcelRange;
    function GetItems(ARow:Integer;ACol:Integer) : OleVariant;
    procedure SetItems(ARow:Integer;ACol:Integer; const Value:OleVariant);
    function GetRange(Cell1:OleVariant; Cell2:OleVariant) : ExcelRange;
    function GetWorksheet(lcid:Integer):_Worksheet;
  protected
    constructor Create;override;
    function DoGetApplication:OleVariant;override;
    procedure DoOpen;override;
    // Копирует содержимое одного листа на другой. Индексы листов (Worksheet) заданы параметрами.
    // Параметры:
    //    source  - индекс копируемого листа
    //    target -  индекс листа куда будет произведено копирование
    procedure Duplicate(source:Integer; target:Integer);overload;
    // Копирует содержимое активного листа на другой.
    // Параметры:
    //    target - индекс листа куда будет произведено копирование
    procedure Duplicate(target:Integer);overload;
    // Делает активным заданный лист
    procedure ActivateWorksheet(index:Integer);
    // Производит поиск и замену строк во всём диапазоне ячеек текущего листа
    // построчно, без учёта регистра, без учёта форматирования
    procedure Replace(textToReplace:string; replaceWith:string);
    // Получает объект ExcelApplication
    property ExcelApplication : ExcelXP.ExcelApplication read GetExcelApplication implements _Application;
    // Получает текущую книгу
    property CurrentWorkbook : ExcelXP._Workbook read FCurrentWorkbook;
    // Получает активный лист текущей книги
    property ActiveSheet : ExcelXP._Worksheet read GetActiveWorksheet;
    // Получает ячейки текущего листа
    property Cells : ExcelXP.ExcelRange read GetCells;
    // Получает или устанавливает значение ячейки на текущем листе
    property Items[ARow:Integer; ACol:Integer]:OleVariant read GetItems write SetItems;default;
    // Получает объект ExcelRange на текущем листе
    property Range[Start:OleVariant; Stop:OleVariant]:ExcelXP.ExcelRange read GetRange;
    // Получает объект Worksheet
    property Worksheet[lcid:Integer]:ExcelXP._Worksheet read GetWorksheet;

  public
    destructor Destroy;override;
    procedure Quit;override;
  end;

implementation
uses
  Windows, ComObj, Variants;
{ TReportBase }

procedure TReportBase.BuildReport;
begin
  Open;
  try
    RaiseBeforeExecute;
    Execute;
    RaiseAfterExecute;
  except
    on E:Exception do
      // Если назначен обработчик ошибок нужно его вызвать
      // гарантируя, что при установленном флаге
      // FreeOnTerminate произойдёт разрушение объекта
      if Assigned(FOnExecuteError) then
      begin
        try
          FOnExecuteError(Self, E);
        finally
          if FreeOnComplete then Free;
        end;
      end
      else raise;
  end;
end;

procedure TReportBase.CheckStep(const Value: Integer);
begin
  if (Value > TotalSteps) or (Value < 0) then
     raise EProgress.Create('Значение шага должно находится в диапазоне от 0 до ' + IntToStr(TotalSteps));
end;

procedure TReportBase.ClearProgress;
begin
  FStep := 0;
  RaiseProgress;
end;

constructor TReportBase.Create;
begin

end;

function TReportBase.CreateObject(const ClassName: string): OleVariant;
begin
  Result := CreateOleObject(ClassName);
end;


class function TReportBase.CreateReport(ReportClass: TReportBaseClass): TReportBase;
begin
  Result := ReportClass.Create;
end;

destructor TReportBase.Destroy;
begin
  inherited;
end;

function TReportBase.GetApplication: OleVariant;
begin
  if Variants.VarIsClear(FApplication) then
    FApplication := DoGetApplication;
  Result:=FApplication;
end;

function TReportBase.GetTotalSteps: Integer;
begin
  Result := 0;
end;

procedure TReportBase.Hide;
begin
  Application.Visible := false;
end;


procedure TReportBase.NextStep(Increment: Integer; const ProgressNote:string);
begin
  CheckStep(FStep+Increment);
  Inc(FStep, Increment);
  RaiseProgress(ProgressNote);
end;

procedure TReportBase.Open;
begin
  if not FOpen then DoOpen;
  FOpen := true;
end;

procedure TReportBase.Quit;
begin
  Application.Quit;
end;

procedure TReportBase.RaiseAfterExecute;
begin
  try
    if Assigned(FOnAfterExecute) then
      FOnAfterExecute(Self);
  finally
    if FreeOnComplete then
      Free;
  end;
end;

procedure TReportBase.RaiseBeforeExecute;
begin
  if Assigned(FOnBeforeExecute) then
    FOnBeforeExecute(Self);
end;

procedure TReportBase.RaiseProgress(const ProgressNote:string);
begin
  if Assigned(FOnProgress) then FOnProgress(Self, FStep, ProgressNote);
end;

procedure TReportBase.SetReportTemplate(const Value: string);
begin
  if FOpen then raise SysUtils.EAssertionFailed.Create('Установка свойства возможна только при закрытом отчёте.');
  FReportTemplate := Value;
end;

procedure TReportBase.SetStep(Value: Integer);
begin
  CheckStep(Value);
  FStep := Value;
  RaiseProgress;
end;

procedure TReportBase.Show;
begin
  Application.Visible := true;
end;

{ TExcelReportBase }


procedure TExcelReportBase.ActivateWorksheet(index: Integer);
begin
  Worksheet[index].Activate(0);
end;

constructor TExcelReportBase.Create;
begin
  inherited;
end;

destructor TExcelReportBase.Destroy;
begin
  inherited;
end;

function TExcelReportBase.DoGetApplication: OleVariant;
begin
  Result := CreateObject('Excel.Application');
end;

function TExcelReportBase.GetActiveWorksheet: _Worksheet;
var
  pSheet:IDispatch;
begin
  Result := nil;
  if Assigned(CurrentWorkbook) then
  begin
    pSheet := CurrentWorkbook.ActiveSheet;
    if Assigned(pSheet) then
    begin
      pSheet.QueryInterface(IID__Worksheet, Result);
    end;
  end;
end;

function TExcelReportBase.GetCells: ExcelRange;
begin
  Result := ActiveSheet.Cells;
end;

function TExcelReportBase.GetExcelApplication: ExcelApplication;
var
  pDispatch:IDispatch;
begin
  pDispatch :=IDispatch(TVarData(Application).VDispatch);
  pDispatch.QueryInterface(IID__Application, Result);
end;

function TExcelReportBase.GetItems(ARow, ACol: Integer): OleVariant;
begin
  Result := Cells.Item[ARow,ACol];
end;

function TExcelReportBase.GetRange(Cell1, Cell2: OleVariant): ExcelRange;
begin
  Result := ActiveSheet.Range[Cell1, Cell2];
end;

function TExcelReportBase.GetWorksheet(lcid: Integer): _Worksheet;
var
  pWorksheet:IDispatch;
begin
  Result:=nil;
  if (CurrentWorkbook.Worksheets.Count < lcid) or (lcid < 1) then
     raise SysUtils.EAssertionFailed.Create('Индекс страницы выходит за пределы допустимого диапазона.');

  // Хитрость в том, что свойство Item интерфейса Sheets возвращает не
  // _Worksheet (как предполагается), а указатель на диспетчерский интерфейс
  // IDispatch, через который можно запросить нужный нам _Worksheet.
  pWorksheet := CurrentWorkbook.Worksheets.Item[lcid];

  if Assigned(pWorksheet) then
     pWorkSheet.QueryInterface(IID__Worksheet, Result);
end;

procedure TExcelReportBase.Quit;
begin
  if Assigned(CurrentWorkbook) then
    CurrentWorkbook.Close(false, false, Unassigned, 0);
  inherited;
end;

procedure TExcelReportBase.Replace(textToReplace, replaceWith: string);
var
  vCells:OleVariant;
begin
  //Cells.Replace(textToFind, replaceString, xlWhole, xlByRows, false, false, Null, Null);
  vCells := Cells;
  vCells.Replace(textToReplace, replaceWith);
end;

procedure TExcelReportBase.SetItems(ARow, ACol: Integer;
  const Value: OleVariant);
begin
  Cells.Item[ARow,ACol] := Value;
end;

procedure TExcelReportBase.DoOpen;
begin
  FCurrentWorkbook := ExcelApplication.Workbooks.Add(ReportTemplate, 0)
end;

procedure TExcelReportBase.Duplicate(target: Integer);
begin
  Duplicate(-1, target);
end;

procedure TExcelReportBase.Duplicate(source, target: Integer);
var
  sourceSheet:_Worksheet;
  targetSheet:_Worksheet;
begin
  if source = -1 then
     sourceSheet := ActiveSheet
  else
     sourceSheet := Worksheet[source];

  targetSheet := Worksheet[target];
  sourceSheet.Cells.Copy(targetSheet.Cells);
end;

end.
