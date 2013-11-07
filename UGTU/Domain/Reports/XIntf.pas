unit XIntf;

interface
uses
  Classes, SysUtils;
type
  // Тип события изменения шага
  TNotifyReportProgress = procedure(Sender : TObject; Progress : Integer; ProgressNote : string) of object;

  // Тип события обработчика ошибок
  TNotifyExecuteError = procedure(Sender : TObject; E : Exception) of object;

  IActionEvents = interface
    function GetBeforeExecuteHandler : TNotifyEvent;
    function GetAfterExecuteHandler : TNotifyEvent;
    function GetProgressHandler : TNotifyReportProgress;
    function GetErrorHandler : TNotifyExecuteError;

    procedure SetBeforeExecuteHandler(const Value : TNotifyEvent);
    procedure SetAfterExecuteHandler(const Value : TNotifyEvent);
    procedure SetProgressHandler(const Value : TNotifyReportProgress);
    procedure SetErrorHandler(const Value : TNotifyExecuteError);

    property OnBeforeExecute : TNotifyEvent read GetBeforeExecuteHandler write SetBeforeExecuteHandler;
    property OnAfterExecute : TNotifyEvent read GetAfterExecuteHandler write SetAfterExecuteHandler;
    property OnReportProgress : TNotifyReportProgress read GetProgressHandler write SetProgressHandler;
    property OnExecuteError : TNotifyExecuteError  read GetErrorHandler write SetErrorHandler;
  end;

  IAsyncResult = interface
    function GetCancelPending : Boolean;
    function GetIsCompleted : Boolean;

    procedure Cancel;
    procedure Wait(Milliseconds:Integer = -1);

    property IsCancelPending : Boolean read GetCancelPending;
    property IsCompleted : Boolean read GetIsCompleted;
  end;

  IAction = interface
    procedure ProceedAction;
    //function BeginProceedAction : IAsyncResult;
  end;

  IActionComponent = interface (IAction)
    function GetActionEvents:IActionEvents;
    function GetTotalSteps : Integer;
    procedure Show;
    procedure Quit;
    property ActionEvents : IActionEvents read GetActionEvents;
    property TotalSteps : Integer read GetTotalSteps;
  end;

  ILog = interface
    procedure LogMessage(MID : TGUID; Message : String);
  end;

  IReportControl = interface
  ['{76A1E615-FF2E-4d42-8121-7C263AA60625}']
    procedure Init;
    procedure Reset(Count : Integer);
    procedure NextStep(CurrentStep : Integer; Note : string);
    procedure Complete;
    procedure SetError(E:Exception);
  end;

implementation

end.
