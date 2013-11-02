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
  ShmNotInitialized = '����������� ������. �������� �������� �� ���������������. ��������� ����� ���������';


  SockEventConnectErrMsg =  '������ ��� ����������� � ������� �������� ���������. '+ #13#10#13#10+
                            '��� ���������� ������ ����������� ������ <��������>. '+ #13#10+
                            '�������� ������ GGAEventServer �� ��������. ���������� � �������������� ��� ������� ��������.';



  ServerConnectKey = 'ConnectString';
  {OLEDB Provider} ServerDefConnectString  = 'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Data Source=%s;Database=GGA';
  {ODBC Provider } // ServerDefConnectString = 'Provider=MSDASQL.1;Persist Security Info=False;Data Source=GGA;Initial Catalog=GGA';


  DlgDeleteLasFileMsg = '����� ����� ���� �������� �� ���� ����������� � ������, ������������ � ��. ���������������� ���������, ��������� � ������, ��� �� ����� �������.'+#13#10+
  '�� ������������� ������ ������� ��������?';


  // AGNENT PROPERTIES

  Agent = 'merlin';
  AgentPath = 'c:\winnt\msagent\chars\merlin.acs';

  // Reports
  DefReportTemplate = 'e:\Felix\Documents\Microsoft Excel\GGA\����� ������ GGA.xlt';



  // FIELD MESSAGES
  FIELD_ALIAS_ALREADY_EXISTS = '������������� ''%s'' ��� ���������� � ������� �������������� ���.';
  FIELD_ALREADY_EXISTS = '������������� ''%s'' ��� ����������.';

  // WELL MESSAGES
  WELL_ALREADY_EXISTS = '�������� ''%s'' ��� ����������.';

  // CAROTAGE MESSAGES
  CAROTAGE_INVALID_DATE = '���� ������ ������ ���� ������ ��� ����� ���� ���������.';
  CAROTAGE_DATES_OVERLAPPES = '��������� �������� ������������� �  ������������ � ������';
  CAROTAGE_ALREADY_EXISTS = '������� ''%s'' ��� ���������� � �������.';

  // CURVE MESSAGES
  CURVE_EXISTS = '������ � ������ ����������� ��� ����������. '+
    '������: ''%s'', �����: ''%s'', �����: ''%f'', ����: ''%f'', ���: ''%f'', ��. ���.: ''%s''';


  LAS_AUTO_ADDED = '�������������� ����������';
  LAS_AUTO_ADDED_ERROR = '������������ ������ ��� �������������� ���������� ���������.';


  SECUR_INVALID_ROLE = '���������� ���� ������� ������� ����: ''%s''';

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



