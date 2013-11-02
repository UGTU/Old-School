unit AppConst;
  {#Author fmarakasov@ugtu.net}
interface
uses
  Windows, Graphics;



resourcestring
  AppRegKeyClient = 'SOFTWARE\A&2 Programmers Group\GGA\GGAClient';
  AppRegKeyServer = 'SOFTWARE\A&2 Programmers Group\GGA\GGAServer';

  ServerKey = 'Server';
  ServerNameKey = 'ServerName';
  AppServerNameKey = 'AppServerName';

  ColorsKey = 'Colors';
  FolderKey = 'Folders';
  ArchiveFolderKey = 'ArchiveFolder';
  CacheFolderKey = 'CacheFolder';
  ReportFolderKey = 'ReportFolder';
  ReportTemplateKey = 'ReportTemplate';
  HideArch = 'HideArchived';


  GeneralKey = 'General';
  DispDayKey = 'DispDays';

  SchemesKey = 'Schemes';

  // Exception messages
  ShmNotInitialized = 'Критическая ошибка. Менеджер ресурсов не инициализирован. Программа будет завершена';


  SockEventConnectErrMsg =  'Ошибка при подключении к серверу рассылки сообщений. '+ #13#10#13#10+
                            'Для обновления экрана используйте кнопку <Обновить>. '+ #13#10+
                            'Возможно служба GGAEventServer не запущена. Обратитесь к администратору для решения проблемы.';



  ServerConnectKey = 'ConnectString';
  {OLEDB Provider} ServerDefConnectString  = 'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Data Source=%s;Database=GGA';
  {ODBC Provider } // ServerDefConnectString = 'Provider=MSDASQL.1;Persist Security Info=False;Data Source=GGA;Initial Catalog=GGA';


  DlgDeleteLasFileMsg = 'Будет удалён файл каротажа со всей информацией о кривых, содержащихся в нём. Сопроводительные документы, связанные с файлом, так же будут удалены.'+#13#10+
  'Вы действительно хотите удалить документ?';


  // AGNENT PROPERTIES

  Agent = 'merlin';
  AgentPath = 'c:\winnt\msagent\chars\merlin.acs';

  // Reports
  DefReportTemplate = 'e:\Felix\Documents\Microsoft Excel\GGA\Отчёт архива GGA.xlt';



  // FIELD MESSAGES
  FIELD_ALIAS_ALREADY_EXISTS = 'Месторождение ''%s'' уже существует в таблице альтернативных имён.';
  FIELD_ALREADY_EXISTS = 'Месторождение ''%s'' уже существует.';

  // WELL MESSAGES
  WELL_ALREADY_EXISTS = 'Скважина ''%s'' уже существует.';

  // CAROTAGE MESSAGES
  CAROTAGE_INVALID_DATE = 'Дата начала должна быть меньше или равна дате окончания.';
  CAROTAGE_DATES_OVERLAPPES = 'Диапазоны каротажа перекрываются с  существующим в архиве';
  CAROTAGE_ALREADY_EXISTS = 'Каротаж ''%s'' уже существует в таблице.';

  // CURVE MESSAGES
  CURVE_EXISTS = 'Кривая с такими параметрами уже существует. '+
    'Кривая: ''%s'', метод: ''%s'', старт: ''%f'', стоп: ''%f'', шаг: ''%f'', ед. изм.: ''%s''';


  LAS_AUTO_ADDED = 'Автоматическое добавление';
  LAS_AUTO_ADDED_ERROR = 'Неопознанная ошибка при автоматическом добавлении документа.';


  SECUR_INVALID_ROLE = 'Выполнение этой функции требует роли: ''%s''';

const
  // Path properties
  MaxNameLength = 50;
  MaxPathLength = MAX_PATH;
  DispDayDefault = 3;

//  clBaseScheme:TColor = clMoneyGreen;

var
  clBaseScheme:TColor;


function GetServerName:String;

implementation
uses
  SysUtils, RegUtils;

function GetServerName:String;
var
  Buff :array[0..MAX_COMPUTERNAME_LENGTH+1] of char;
  dwLen:DWORD;
begin
  Result:='';
  if GetComputerName(Buff, dwLen) then
  begin
    SetLength(Result, dwLen);
    StrCopy(PChar(Result), Buff);
  end;
end;

initialization
  clBaseScheme:=RGB(100, 120, 140)
end.



