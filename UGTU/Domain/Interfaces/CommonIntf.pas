unit CommonIntf;
 {#Author fmarakasov@ist.ugtu.net}
interface

uses SysUtils;

type

  ILogger = interface
    procedure LogMessage(const Message : String);
  end;

  IApplicationController = interface
    procedure FinalizeApplication;
    procedure Terminate;

    function ApplicationName:string;
    function GetLogger : ILogger;

  end;
 { IExceptionParser = interface
    function Parse(E:Exception; var IsHandled:boolean):Exception;
  end;}

   // Интерфейс описания промежутка времени
  ITimeSpan = interface (IInterface)
  ['{F3895D71-7D2A-4587-9FF8-A622E79ACF1A}']
    function GetTotalHours : Double;
    function GetTotalDays : Double;
    function GetWholeDays : Integer;
    function GetWholeYears : Integer;
    function GetWholeMonthes : Integer;
    function GetWholeWeeks : Integer;

    property TotalHours : Double read GetTotalHours;
    property TotalDays : Double read GetTotalDays;
    property WholeDays : Integer read GetWholeDays;
    property WholeYears : Integer read GetWholeYears;
    property WholeMonthes : Integer read GetWholeMonthes;
    property WholeWeeks : Integer read GetWholeWeeks;
  end;
    // Интерфейс даты и времени
  IDateTime = interface (IInterface)
  ['{C1B846A1-549E-4f71-B336-A75B5960B0C2}']
    function GetValue : TDateTime;
    function GetYear : Word;
    function GetMonth : Word;
    function GetDay : Word;
    function GetDayOfWeek : Word;
    function GetHour : Word;
    function GetMinute : Word;
    function GetSecond : Word;
    function GetMillisecond : Word;
    function GetYearLength : Word;
    function GetMonthLength : Word;

    function AddDays(Days : Double) : IDateTime;
    function AddMonthes(Monthes : Integer) : IDateTime;
    function AddWeeks(Weeks : Integer) : IDateTime;
    function AddYears (Years : Integer) : IDateTime;
    function Parse(const DateTimeString : string) : IDateTime;
    function EncodeDate(Year, Month, Day : Word) : IDateTime;
    function EncodeDateTime(Year, Month, Day, Hour, Minute, Second, MSecond : Word) : IDateTime;
    function Substract(const firstDateTime : IDateTime; const secondDateTime : IDateTime) : ITimeSpan;
    function Now : IDateTime;
    function Today : IDateTime;
    function IsLeapYear : Boolean;
    function GetLongDateString : String;
    function GetShortDateString : String;
    function GetLongTimeString : String;
    function GetFormatedDateTimeString ( const FormatString : String ) : String;
    function Between(DateTime1, DateTime2 : IDateTime): Boolean;
    function StrictBetween(DateTime1, DateTime2 : IDateTime): Boolean;


    property Year : Word read GetYear;
    property Month : Word read GetMonth;
    property Day : Word read GetDay;
    property DayOfWeek : Word read GetDayOfWeek;
    property Hour : Word read GetHour;
    property Minute : Word read GetMinute;
    property Second : Word read GetSecond;
    property Millisecond : Word read GetMillisecond;
    property Value : TDateTime read GetValue;
    property YearLength : Word read GetYearLength;
    property MonthLength : Word read GetMonthLength;
  end;


implementation

end.
