(*
    Базовая функциональность отчётов с использованием OLE-серверов (MS Office)

    Версия: 1.0.0.3
    Создано: 07.06.2008
    Последняя правка: 06.05.2009 17:00
    Автор: Ф.В. Маракасов

    TODO:
        1) Необходимо определить и реализовать TWordReportBase
        2) Определить недостающие методы (helper-methods) в TExcelReportBase.
        3) Провести тестирование в различных сценариях.

    Новое для Версии 1.0.0.1:
        Поддержка barcode для отчётов Excel
    TODO:
        1) Добавить поддержку barcode  для отчётов Word
        2) Изменить метод TExcelReportBase.Duplicate для поддержки копирования
           OLE-объектов

    Новое для Версии 1.0.0.2:
        1) Дублирование страниц (TExcelReportBase.Duplicate) с поддержкой штрих-кода

    Новое для Версии 1.0.0.3:
        1) Добавлена поддержка журнала событий
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

  ПОДДЕРЖКА BARCODE (Версия 1.0.0.1)
  Для доступа к штрих-коду на листе (Worksheet) можно использовать свойства:
    1) property BarcodeApplet[lcid:Integer]:IBarcodeApplet.
       Доступ к элементу управления штрих-кода на заданной индексом странице
    2) property ActiveBarcodeApplet:IBarcodeApplet
       Доступ к элементу управления штрих-кода на активной странице
  Пример:

    procedure TMyExcelReport.Execute;
    var
      barcode : IBarcodeHeader;
    begin
      inherited;

      // Создание объекта, управляющего значением штрих-кода.
      // Используем стандартную реализацию интерфейса  IBarcodeHeader
      // классом TBarcodeReportHeader.
      barcode := TBarcodeReportHeader.Create;

      // Значение штрих-кода
      barcode.MajorVersion := 1;
      barcode.MinorVersion := 0;
      barcode.ObjectType := 5;
      barcode.OID := 1024;

      // Задать имя элемента управления на активной странице
      ActiveBarcodeApplet.AppletName := 'PDF417Ctrl1';

      // Задать значение штрих-кода для текущего листа Excel
      ActiveBarcodeApplet.BarcodeHeader := barcode;

      // Запись значение штрих-кода в элемент управления на листе Excel
      ActiveBarcodeApplet.WriteToApplet;
    end;
  end;

  ПОДДЕРЖКА ЖУРНАЛА СОБЫТИЙ (Версия 1.0.0.3)
  
   Класс TReportBase поддерживает журналирование сообщений через назначенный ему интерфейс ILogger через свойство Logger. 
   Если Logger:ILogger не назначен, то классом используется реализация TNullLogger. Перенаправить сообщения можно, назначив 
   Logger нужную реализацию интерфейса:
  
  var
     Report : TReportBase;
  begin
     Report := TReportBase.CreateReport(TMyReport);
     Report.Logger := TMemoLogger.GetInstance;
     ....
     Report.BuildReport; 
     ...
  end;

*)

unit ReportsBase;

{#Author fmarakasov@ugtu.net}

interface
uses
  Classes, SysUtils, Excel2010, Barcode, Contnrs, XIntf, CommonIntf, Graphics;
type
  // Исключение при установке шага в построении отчёта
  EProgress = class(Exception);

  // Класс отчётов
  TReportBaseClass = class of TReportBase;



  // Базовый класс отчётов
  TReportBase = class (TComponent, IAction, IActionEvents, IActionComponent)
  private
    FOpen : Boolean;
    FStep : Integer;
    FFreeOnComplete:Boolean;
    FReportTemplate : string;
    FApplication : OleVariant;
    FOnInit : TNotifyEvent;
    FOnBeforeExecute : TNotifyEvent;
    FOnAfterExecute : TNotifyEvent;
    FOnProgress : TNotifyReportProgress;
    FOnExecuteError : TNotifyExecuteError;
    FLogger : ILogger;

    function CreateObject(const ClassName:string):OleVariant;
    function GetApplication:OleVariant;

    procedure SetStep(Value:Integer);
    procedure CheckStep(const Value:Integer);
    procedure RaiseBeforeExecute;
    procedure RaiseOnInit;
    procedure RaiseAfterExecute;
    procedure RaiseProgress(const ProgressNote:string='');
    procedure SetReportTemplate(const Value:string);

    function GetBeforeExecuteHandler : TNotifyEvent;
    function GetAfterExecuteHandler : TNotifyEvent;
    function GetProgressHandler : TNotifyReportProgress;
    function GetErrorHandler : TNotifyExecuteError;
    function GetLogger : ILogger;

    procedure SetBeforeExecuteHandler(const Value : TNotifyEvent);
    procedure SetAfterExecuteHandler(const Value : TNotifyEvent);
    procedure SetProgressHandler(const Value : TNotifyReportProgress);
    procedure SetErrorHandler(const Value : TNotifyExecuteError);
    procedure SetLogger(Value : ILogger);
  protected
    // Перегрузите этот метод если необходимо для инициализации отчёта
    procedure Init;virtual;

    // Переопределите этот метод для заполнения шаблона отчёта нужными значениями
    procedure Execute;virtual;abstract;

    procedure ProceedAction;
    // Переопределите этот метод для создания экземпляра класса приложения
    function  DoGetApplication:OleVariant;virtual;abstract;
    // Переопределите этот метод для открытия шаблона отчёта
    procedure DoOpen;virtual;abstract;

    procedure Open;
    //Переопределите этот метод для расчёта полного числа шагов в построении отчёта
    function GetTotalSteps:Integer;virtual;

    //Переопределите этот метод для задания полного числа шагов в построении отчёта
    procedure SetTotalSteps(Value : Integer);virtual;

    //Сдвинуть прогресс на заданный шаг. Значение Increment может быть отрицательным
    procedure NextStep(Increment:Integer = 1; const ProgressNote:string='');
    //Обнулить прогресс
    procedure ClearProgress;

    // Получить или установить текущий шаг
    property  CurrentStep:Integer read FStep write SetStep;
    // Ссылка на интерфейс Application
    property Application:OleVariant read GetApplication;

    // IActionComponent implementation
    function GetActionEvents:IActionEvents;

    property ActionEvents : IActionEvents read GetActionEvents;

  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy;override;

    //Создаёт новый экземпляр, заданного параметром класса отчёта
    class function CreateReport(ReportClass:TReportBaseClass; AOwner : TComponent = nil):TReportBase;

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
    property TotalSteps:Integer read GetTotalSteps write SetTotalSteps;
    // Получает или устанавливает шаблон для отчёта
    property ReportTemplate:string read FReportTemplate write SetReportTemplate;

    // Событие вызникает перед вызовом метода Execute
    property OnBeforeExecute : TNotifyEvent read GetBeforeExecuteHandler write SetBeforeExecuteHandler;
    // Событие возникает после успешного завершения работы метода Execute
    property OnAfterExecute : TNotifyEvent read GetAfterExecuteHandler write SetAfterExecuteHandler;
    // Событие возникает при изменении шага прогресса
    property OnReportProgress : TNotifyReportProgress read GetProgressHandler write SetProgressHandler;
    // Событие возникает при возбуждении необработанного исключения в методе Execute
    property OnExecuteError : TNotifyExecuteError  read GetErrorHandler write SetErrorHandler;

    property IsOpen:Boolean read FOpen;

    // Доступ к журналу событий
    property Logger : ILogger read GetLogger write SetLogger;


  end;

  // Базовый класс для отчётов на Excel
  TExcelReportBase = class(TReportBase, _Application)
  private
    FCurrentWorkbook: _Workbook;
    FBarcodes:TInterfaceList;

    function GetExcelApplication : ExcelApplication;
    function GetActiveWorksheet : _Worksheet;
    function GetCells : ExcelRange;
    function GetItems(ARow:Integer;ACol:Integer) : OleVariant;
    procedure SetItems(ARow:Integer;ACol:Integer; const Value:OleVariant);
    function GetRange(Cell1:OleVariant; Cell2:OleVariant) : ExcelRange;
    function GetRangeByAddr(Address:string) : Excel2010.ExcelRange;
    function GetWorksheet(lcid:Integer):Excel2010._Worksheet;
    function GetBarcodeApplet(Index:Integer):IBarcodeApplet;
    function GetActiveBarcodeApplet:IBarcodeApplet;
    function GetWorksheetBarcode(Sheet:Excel2010._Worksheet):IBarcodeApplet;
    function GetSelection:OleVariant;
    procedure DuplicateBarcode(sourceSheet: _Worksheet; BarcodeAppletName: string; targetSheet: _Worksheet);
    function GetName: string;
    function GetPageName: string;
    procedure SetPageName(const Value: string);
    function GetDisplayAlerts: boolean;
    procedure SetDisplayAlerts(const Value: boolean);
  protected
    function DoGetApplication:OleVariant;override;
    procedure DoOpen;override;
    // Проверят имеет ли указанная страница заданный OLE-объект
    function HasOleObject(Sheet:Excel2010._Worksheet; ObjName:string) : Boolean;
    // Получает объект ExcelApplication
    property ExcelApplication : Excel2010.ExcelApplication read GetExcelApplication implements _Application;
    // Получает текущую книгу
    property CurrentWorkbook : Excel2010._Workbook read FCurrentWorkbook;
    // Получает активный лист текущей книги
    property ActiveSheet : Excel2010._Worksheet read GetActiveWorksheet;
    // Получает ячейки текущего листа
    property Cells : Excel2010.ExcelRange read GetCells;
    // Получает или устанавливает значение ячейки на текущем листе
    property Items[ARow:Integer; ACol:Integer]:OleVariant read GetItems write SetItems;default;
    // Получает объект ExcelRange на текущем листе
    property Range[Start:OleVariant; Stop:OleVariant]:Excel2010.ExcelRange read GetRange;
    // Получает объект ExcelRange на текущем листе
    property RangeByAddr[Address:string]:Excel2010.ExcelRange read GetRangeByAddr;
    // Получает объект Worksheet
    property Worksheet[lcid:Integer]:Excel2010._Worksheet read GetWorksheet;
    //Получает объект штрих-кода на заданном листе.
    property BarcodeApplet[lcid:Integer]:IBarcodeApplet read GetBarcodeApplet;
    // Получает объект штрих-кода на текущем листе
    property ActiveBarcodeApplet:IBarcodeApplet read GetActiveBarcodeApplet;
    // Получает объект Selection
    property Selection:OleVariant read GetSelection;
    // Получает Имя книги
    property Name:string read GetName;

    // Получает или устанавливает название текущего листа
    property PageName:string read GetPageName write SetPageName;
    // Получает или устанавливает название текущего листа
    property DisplayAlerts:boolean read GetDisplayAlerts write SetDisplayAlerts;
  public
    constructor Create(AOwner : TComponent);override;
    destructor Destroy;override;

    // Копирует содержимое одного листа на другой. Индексы листов (Worksheet) заданы параметрами.
    // Параметры:
    //    source  - индекс копируемого листа
    //    target -  индекс листа куда будет произведено копирование
    procedure Duplicate(source:Integer; target:Integer; BarcodeAppletName : string = '');overload;

    // Копирует содержимое активного листа на другой.
    // Параметры:
    //    target - индекс листа куда будет произведено копирование
    procedure Duplicate(target:Integer; BarcodeAppletName : string = '');overload;

    procedure Duplicate(target : Integer; BarcodeApplet : IBarcodeApplet);overload;
    procedure Duplicate(source : Integer; target : Integer; BarcodeApplet : IBarcodeApplet);overload;
    // Копирует содержимое текущего листа на заданный вместе с объектом IBarcodeApplet
    procedure DuplicateActiveSheetWithBarcode(target : Integer);


    //копирует лист
    procedure DuplicatePage(source : Integer; After: byte);overload;
    procedure DuplicatePage(After: byte);overload;

    //удаляет лист
    procedure DeletePage(deletedPageNumber : Integer);overload;
    procedure DeletePage;overload;


    // Делает активным заданный лист
    procedure ActivateWorksheet(index:Integer);
    //Производит поиск строк во всём диапазоне ячеек текущего листа
    // построчно, без учёта регистра, без учёта форматирования
    function Find(textToFind: string):OleVariant;
    // Производит поиск и замену строк во всём диапазоне ячеек текущего листа
    // построчно, без учёта регистра, без учёта форматирования
    procedure Replace(textToReplace:string; replaceWith:string);

    procedure InsertGraphics(Graphics: TGraphic; fileExtenstion:string; Row, Col, Width, Height : Integer);


    procedure Quit;override;
  end;

  TExcelBarcodeObject = class (TBarcodeApplet, ISite)
  private
    FWorksheet : Excel2010._Worksheet;
    function GetApplet:IBarcodeApplet;
    function GetSite : IDispatch;
  public
    constructor Create(Worksheet : Excel2010._Worksheet);
  protected
    procedure AssignBarcodeValue(barcode:string);override;
    property Site:IDispatch read GetSite;
    property Applet:IBarcodeApplet read GetApplet;
  end;


implementation
uses
  Windows, ComObj, Variants, CommonIntfImpl, System.IOUtils;
{ TReportBase }

procedure TReportBase.BuildReport;
begin
  Logger.LogMessage('Открытие отчёта ' +  Self.ClassName);
  Open;
  try
    RaiseOnInit;
    Logger.LogMessage('Инициализация отчёта ' +  Self.ClassName);
    Init;
    RaiseBeforeExecute;
    Logger.LogMessage('Начало построения отчёта ' +  Self.ClassName);
    Execute;
    Logger.LogMessage('Завершение построения отчёта ' +  Self.ClassName);
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

constructor TReportBase.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
end;

function TReportBase.CreateObject(const ClassName: string): OleVariant;
begin
  Result := CreateOleObject(ClassName);
end;


class function TReportBase.CreateReport(ReportClass: TReportBaseClass; AOwner : TComponent): TReportBase;
begin
  Result := ReportClass.Create(AOwner);
end;

destructor TReportBase.Destroy;
begin
  inherited;
end;


function TReportBase.GetActionEvents: IActionEvents;
begin
  Result := Self;
end;

function TReportBase.GetAfterExecuteHandler: TNotifyEvent;
begin
  Result := Self.FOnAfterExecute;
end;

function TReportBase.GetApplication: OleVariant;
begin
  if Variants.VarIsClear(FApplication) then
    FApplication := DoGetApplication;
  Result:=FApplication;
  Logger.LogMessage('GetApplication Result = ' + VarToStr(Result));
end;



function TReportBase.GetBeforeExecuteHandler: TNotifyEvent;
begin
  Result := Self.FOnBeforeExecute;
end;

function TReportBase.GetErrorHandler: TNotifyExecuteError;
begin
  Result := Self.FOnExecuteError;
end;

function TReportBase.GetLogger: ILogger;
begin
  if FLogger = nil then
    SetLogger(TNullLogger.GetInstance);
  Result := FLogger;
end;

function TReportBase.GetProgressHandler: TNotifyReportProgress;
begin
  Result := Self.FOnProgress;
end;

function TReportBase.GetTotalSteps: Integer;
begin
  Result := 0;
end;

procedure TReportBase.Hide;
begin
  Application.Visible := false;
end;


procedure TReportBase.Init;
begin
  if Assigned(FOnInit) then
    FOnInit(Self);
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

procedure TReportBase.ProceedAction;
begin
  BuildReport;
end;

procedure TReportBase.Quit;
begin
  Application.Quit;
  Self.FApplication := Unassigned;
  FOpen := false;
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

procedure TReportBase.RaiseOnInit;
begin

end;

procedure TReportBase.RaiseProgress(const ProgressNote:string);
begin
  Logger.LogMessage('Вызывается "'+ProgressNote+'"');
  if Assigned(FOnProgress) then FOnProgress(Self, FStep, ProgressNote);
  Logger.LogMessage('Вызвано "'+ProgressNote+'"');
end;

procedure TReportBase.SetAfterExecuteHandler(const Value: TNotifyEvent);
begin
  FOnAfterExecute := Value;
end;

procedure TReportBase.SetBeforeExecuteHandler(const Value: TNotifyEvent);
begin
  FOnBeforeExecute := Value;
end;

procedure TReportBase.SetErrorHandler(const Value: TNotifyExecuteError);
begin
  FOnExecuteError := Value;
end;

procedure TReportBase.SetLogger(Value: ILogger);
begin
  Assert(Assigned(Value), 'Value : ILogger can not be null!');
  FLogger := nil;
  FLogger := Value;
end;

procedure TReportBase.SetProgressHandler(const Value: TNotifyReportProgress);
begin
  FOnProgress := Value;
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

procedure TReportBase.SetTotalSteps(Value: Integer);
begin

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

constructor TExcelReportBase.Create ( AOwner : Tcomponent);
begin
  inherited Create(AOwner);
  FBarcodes := TInterfaceList.Create;
end;

procedure TExcelReportBase.DeletePage(deletedPageNumber: Integer);
const
  lcid = LOCALE_USER_DEFAULT;
var
  deletedSheet:_Worksheet;
begin
  if deletedPageNumber = -1 then
     deletedSheet := ActiveSheet
  else
     deletedSheet := Worksheet[deletedPageNumber];


  deletedSheet.Delete(lcid);
end;


procedure TExcelReportBase.DeletePage;
begin
  DeletePage(-1);
end;

destructor TExcelReportBase.Destroy;
begin
  FBarcodes.Free;
  inherited;
end;

function TExcelReportBase.DoGetApplication: OleVariant;
begin
  Result := CreateObject('Excel.Application');
end;

function TExcelReportBase.GetActiveBarcodeApplet: IBarcodeApplet;
begin
  Result := GetWorksheetBarcode(ActiveSheet);
end;

function TExcelReportBase.GetActiveWorksheet: Excel2010._Worksheet;
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

function TExcelReportBase.GetBarcodeApplet(Index:Integer): IBarcodeApplet;
begin
  Result := GetWorksheetBarcode(Self.Worksheet[Index]);
end;

function TExcelReportBase.GetCells: Excel2010.ExcelRange;
begin
  Result := ActiveSheet.Cells;
end;

function TExcelReportBase.GetDisplayAlerts: boolean;
const
  lcid = LOCALE_USER_DEFAULT;
begin
  result:= ExcelApplication.DisplayAlerts[lcid];
end;

function TExcelReportBase.GetExcelApplication: Excel2010.ExcelApplication;
var
  pDispatch:IDispatch;
  hRes : HRESULT;
begin
  Logger.LogMessage('Try get IID__Application Excel interface...');
//  if Application = nil then
  //   Application := CreateOleObject('Excel.Application');
  pDispatch :=IDispatch(TVarData(Application).VDispatch);
  Logger.LogMessage(Format('pDispatch=%p', [Pointer(pDispatch)]));
  Assert(pDispatch <> nil);
  hRes := pDispatch.QueryInterface(IID__Application, Result);
  Logger.LogMessage(Format('Query of IID_Application result is %x', [Longint(hRes)]));
  OleCheck(hRes);
end;

function TExcelReportBase.GetName: string;
begin
  //ExcelApplication.Name;
  result:= ExcelApplication.ActiveWorkbook.Name;
end;

function TExcelReportBase.GetPageName: string;
begin
  result:= ActiveSheet.Name;
end;

function TExcelReportBase.GetItems(ARow, ACol: Integer): OleVariant;
begin
  Result := Cells.Item[ARow,ACol];
end;

function TExcelReportBase.GetRange(Cell1, Cell2: OleVariant): Excel2010.ExcelRange;
begin
  Result := ActiveSheet.Range[Cell1, Cell2];
end;

function TExcelReportBase.GetRangeByAddr(Address:string) : Excel2010.ExcelRange;
var position: integer;
    Cell1, Cell2: OleVariant;
begin
  position:= Pos(':',Address);
  Cell1:= copy(Address,1,position-1);
  Cell2:= copy(Address,position+1,length(Address));
  Result := ActiveSheet.Range[Cell1, Cell2];
end;

function TExcelReportBase.GetSelection: OleVariant;
begin
  //
  result:= ExcelApplication.Selection[0];
  //self.Selection;
end;

function TExcelReportBase.GetWorksheet(lcid: Integer): Excel2010._Worksheet;
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

function TExcelReportBase.GetWorksheetBarcode(
  Sheet: Excel2010._Worksheet): IBarcodeApplet;
var
  i: Integer;
  item : ISite;
  newSite : ISite;
begin
  for i := 0 to FBarcodes.Count - 1 do
  begin
    item := ISite(FBarcodes[i]);
    if (item.Site = Sheet )then
    begin
      Result := item.Applet;
      break;
    end;
  end;

  if (Result = nil) then
  begin
    newSite := ISite(TExcelBarcodeObject.Create(Sheet));
    FBarcodes.Add(newSite);
    Result := newSite.Applet;
  end;
end;


procedure TExcelReportBase.Quit;
begin
  if Assigned(CurrentWorkbook) then
    CurrentWorkbook.Close(false, false, Unassigned, 0);
  inherited;
end;

procedure TExcelReportBase.Duplicate(target: Integer;
  BarcodeApplet: IBarcodeApplet);
begin
  Duplicate(-1, target, BarcodeApplet);
end;

procedure TExcelReportBase.Duplicate(source, target: Integer;
  BarcodeApplet: IBarcodeApplet);
begin
  Assert(Assigned(BarcodeApplet), 'Параметр BarcodeApplet должен быть задан.');
  Duplicate(source, target, BarcodeApplet.AppletName);
end;

procedure TExcelReportBase.DuplicateActiveSheetWithBarcode(target: Integer);
begin
  Assert(GetActiveBarcodeApplet <> nil, 'Текущий лист должен связан с объектом IBarcodeApplet.');
  Duplicate(-1, target, GetActiveBarcodeApplet.AppletName);
end;

procedure TExcelReportBase.DuplicateBarcode(sourceSheet: _Worksheet; BarcodeAppletName: string; targetSheet: _Worksheet);
const
  lcid = LOCALE_USER_DEFAULT;
var
  Range: OleVariant;
  pOleObjectDisp: OleVariant;
begin
  if (BarcodeAppletName <> '') then
    if HasOleObject(sourceSheet, BarcodeAppletName) then
    begin
      sourceSheet.Activate(0);
      pOleObjectDisp := sourceSheet.OLEObjects(BarcodeAppletName, 0);
      pOleObjectDisp.Object.Select;
      Range := pOleObjectDisp.TopLeftCell;
      OleVariant(GetExcelApplication.Selection[lcid]).Copy;
      targetSheet.Paste(Range, false, lcid);
    end;
end;

procedure TExcelReportBase.DuplicatePage(source: Integer; After: byte);
const
  lcid = LOCALE_USER_DEFAULT;
var
  sourceSheet:_Worksheet;
  afterSheet:_Worksheet;
begin
  if source = -1 then
     sourceSheet := ActiveSheet
  else
     sourceSheet := Worksheet[source];

  afterSheet := Worksheet[After];

  sourceSheet.Copy(null, afterSheet, lcid);

end;

procedure TExcelReportBase.DuplicatePage(After: byte);
begin
  DuplicatePage(-1, After);
end;

function TExcelReportBase.Find(textToFind: string):OleVariant;
var
  vCells:OleVariant;
begin
  //Cells.Replace(textToFind, replaceString, xlWhole, xlByRows, false, false, Null, Null);
  vCells := Cells;
  result:= vCells.Find(textToFind);
end;

procedure TExcelReportBase.Replace(textToReplace, replaceWith: string);
var
  vCells:OleVariant;
begin
  //Cells.Replace(textToFind, replaceString, xlWhole, xlByRows, false, false, Null, Null);
  vCells := Cells;
  vCells.Replace(textToReplace, replaceWith);
end;

procedure TExcelReportBase.SetDisplayAlerts(const Value: boolean);
const
  lcid = LOCALE_USER_DEFAULT;
begin
  ExcelApplication.DisplayAlerts[lcid]:= Value;
end;

procedure TExcelReportBase.SetItems(ARow, ACol: Integer;
  const Value: OleVariant);
begin
  Cells.Item[ARow,ACol] := Value;
end;

procedure TExcelReportBase.SetPageName(const Value: string);
begin
  ActiveSheet.Name:= Value;
end;

function TExcelReportBase.HasOleObject(Sheet: Excel2010._Worksheet; ObjName:string): boolean;
var
  v:OleVariant;
begin
  Assert(Assigned(Sheet), 'Объект Sheet должен быть задан.');
  Result:=true;
  try
    v:=Sheet.OLEObjects(ObjName,0);
  except
    Result:=false;
  end;
end;

procedure TExcelReportBase.InsertGraphics(Graphics: TGraphic; fileExtenstion:string; Row, Col, Width, Height : Integer);
var
  ImagePath:string;
  tmpFileName:string;
  sheet : OleVariant;
  Pic : OleVariant;
begin
  tmpFileName := TPath.GetTempFileName + fileExtenstion;
  Graphics.SaveToFile(tmpFileName);
  try
    sheet := ActiveSheet;
    pic := sheet.Pictures.Insert(tmpFileName);
    pic.Left := Items[Row,Col].Left;
    pic.Top := Items[Row,Col].Top;
    pic.Width := Width;
    pic.Height := Height;
  finally
    TFile.Delete(tmpFileName);
  end;
end;

procedure TExcelReportBase.DoOpen;
var
  rptTpl : OleVariant;
begin
  rptTpl := Null;
  if Length(Trim(ReportTemplate)) <> 0 then
    rptTpl := ReportTemplate;
  FCurrentWorkbook := ExcelApplication.Workbooks.Add(rptTpl, 0)
end;

procedure TExcelReportBase.Duplicate(target: Integer; BarcodeAppletName : string);
begin
  Duplicate(-1, target, BarcodeAppletName);
end;

procedure TExcelReportBase.Duplicate(source, target: Integer; BarcodeAppletName : string);
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

  // Дублирование штрих-кода
  DuplicateBarcode(sourceSheet, BarcodeAppletName, targetSheet);
end;



{ TExcelBarcodeObject }

procedure TExcelBarcodeObject.AssignBarcodeValue(barcode: string);
var
  //pOleObjectDisp : IDispatch;
  pOleObjectDisp : OleVariant;
  //pOleDisp       : IDispatch;
  //OleObject      : Excel2010._OLEObject;
  //pBarcodeObject : IPDF417Ctrl;
begin
  inherited;
  pOleObjectDisp := FWorksheet.OLEObjects(AppletName, 0);
  pOleObjectDisp.Object.DataToEncode := barcode;
  {Assert(Assigned(pOleObjectDisp), 'Объект с заданным именем не найден в коллекции OLEObjects.');
  Assert(Succeeded(pOleObjectDisp.QueryInterface(IID__IOLEObject, OleObject)), 'Заданный интерфейс IID__IOLEObject не найден.');
  Assert(Succeeded(OleObject.Get_Object_(pOleDisp)), 'Не удалось связаться с объектом IID_IPDF417Ctrl через метод Get_Object.');
  Assert(Succeeded(pOleDisp.QueryInterface(IID_IPDF417Ctrl, pBarcodeObject)), 'Заданный интерфейс IID_IPDF417Ctrl не найден.');
  pBarcodeObject.DataToEncode := barcode;
  }
end;

constructor TExcelBarcodeObject.Create(Worksheet: Excel2010._Worksheet);
begin
  inherited Create;
  Assert(Assigned(Worksheet), 'Не задана ссылка на интерфейс IWorksheet.');
  FWorksheet := Worksheet;
end;

function TExcelBarcodeObject.GetApplet: IBarcodeApplet;
begin
  Result := IBarcodeApplet(Self);
end;

function TExcelBarcodeObject.GetSite: IDispatch;
begin
  Result := IDispatch(FWorksheet);
end;


end.
