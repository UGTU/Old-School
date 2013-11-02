unit uRestoreConn;
  {#Author villain@ist.ugtu.net}
interface
uses
  SysUtils, Dialogs, Registry, IniFiles, XMLDoc, XMLIntf, Variants,
  uXMLErrorReader, Forms, Classes, ApplicationController, ExceptionBase, CommonIntf, CommonIntfImpl;

type
  ExceptionHandler = class
  public
    class procedure ExceptionHandler(sender:TObject; E:Exception);
  end;

implementation

uses Windows, ComObj, uError;

{ ExceptionHandler }

procedure RaiseIntegrityErrorAndTerminate;
begin
    MessageBox(0, 'Структура файлов системы нарушена! Попробуйте переустановить систему. Если ошибка появится снова - обратитесь в службу поддержки',
    PANSIChar(Application.Title),MB_ICONSTOP);
    TApplicationController.GetInstance.FinalizeApplication;
    Application.Terminate;
end;

class procedure ExceptionHandler.ExceptionHandler(sender: TObject;
  E: Exception);
var
  OSVersionInfo: TOSVersionInfo;
  SI: TSystemInfo;
  MS: TMemoryStatus;
  DC: HDC;
  r: TRegistry;
  cname: pchar;
  cnsiz: cardinal;
  ini: TIniFile;
  codeError: integer;
  ErrorXML: TXmlDocument;
  i:integer;
  ErrorDescription:TErrorDescription;
  XMLReader: TXMLErrorReader;
  xmlres: HRSRC;
  xmlstream:TResourceStream;
  Mail:TStringList;
  fsend:string;
  logger:ILogger;
begin
try
  logger:=TNullLogger.GetInstance;

  E:=TApplicationController.GetInstance.ParseException(E);

  logger.LogMessage('Exception parsed');

  frmError := TfrmError.Create(nil);
  frmError.Caption:= TApplicationController.GetInstance.ProgramName + ' - Ошибка';
  xmlStream:=TResourceStream.Create(hInstance,'XML_Errors',RT_RCDATA);
  XMLReader:=TXMLErrorReader.Create(xmlStream);

  if (XMLReader.GetXML=nil) then
  RaiseIntegrityErrorAndTerminate;
  ErrorDescription:=XMLReader.GetErrorDescriptionFromXML(E);

  logger.LogMessage('XML Description received');

    if (ErrorDescription=nil) then
  RaiseIntegrityErrorAndTerminate;

  if (ErrorDescription.Action='Restart') then
   frmError.bbRestart.Visible:=true;
  if (ErrorDescription.Action='Reconnect') then
   frmError.bbRestart.Visible:=true;
   //frmError.bbReconnect.Visible:=true;

  frmError.ErrorType:=ErrorDescription.ErrorClass;
  frmError.stSummary.Caption:=ErrorDescription.Summary;
  if (E is EApplicationException) then
  if (E is EApplicationFatalException) then
  frmError.stSummary.Caption:=frmError.stSummary.Caption + ': '+ (E as EApplicationFatalException).FatalMessage else
  frmError.stSummary.Caption:=frmError.stSummary.Caption + ': '+ E.Message;
  frmError.ErrorMemo.Lines.Add('Причина возникновения ошибки: '+ErrorDescription.Caused);
  frmError.ErrorMemo.Lines.Add('');
  frmError.ErrorMemo.Lines.Add('Рекомендации: '+ErrorDescription.Solution);
  if ErrorDescription.URI<>'' then
  begin
  frmError.lURL.Hint:=ErrorDescription.URI;
  frmError.lURL.Visible:=true;
  end
  else frmError.lURL.Visible:=false;
  if ErrorDescription.HelpTopic<>'' then frmError.HelpTopic:=ErrorDescription.HelpTopic;

  frmError.ErrorString.Add('Версия системы: ' + TApplicationController.GetInstance.ProgramName);
  frmError.ErrorString.Add('Пользователь: ' + TApplicationController.GetInstance.LoginName);
  if not (E is EApplicationLoginFail) then
  begin
    frmError.ErrorString.Add('Сервер: ' + TApplicationController.GetInstance.ServerName);
    frmError.ErrorString.Add('База данных: ' + TApplicationController.GetInstance.DBName);
  end;

  frmError.ErrorString.Add('');
  frmError.ErrorString.Add('Время ошибки: ' + FormatDateTime('dd.mm.yyyy - hh:nn', Now));
  logger.LogMessage(E.ClassName);
  frmError.ErrorString.Add('Класс ошибки: ' + E.ClassName + '.');
  if (E is EOleException) then
    frmError.ErrorString.Add('Код ошибки: ' + IntToStr((E as EOleException).ErrorCode) + '.');
      if (E is EApplicationException) then
    frmError.ErrorString.Add('Код ошибки: ' + IntToStr((E as EApplicationException).ErrorCode) + '.');
  frmError.ErrorString.Add('Текст ошибки: ' + E.Message);

  if (E is EApplicationException) then
  if ((E as EApplicationException).InnerException <> nil) then
  begin
      logger.LogMessage('1');
  frmError.ErrorString.Add('Содержит внутреннюю ошибку:');
      logger.LogMessage('2');
  frmError.ErrorString.Add('Класс внутренней ошибки: ' + (E as EApplicationException).InnerException.ClassName + '.');
      logger.LogMessage('3');
  if ((E as EApplicationException).InnerException is EOleException) then
    frmError.ErrorString.Add('Код внутренней ошибки: ' + IntToStr(((E as EApplicationException).InnerException as EOleException).ErrorCode) + '.');
      logger.LogMessage('4');
  frmError.ErrorString.Add('Текст внутренней ошибки: ' + (E as EApplicationException).InnerException.Message);
        logger.LogMessage('5');
  frmError.ErrorString.Add('');

  end;

  if Assigned(TApplicationController.GetInstance.ActiveFrame) then
    frmError.ErrorString.Add('Активный фрейм главного окна: ' + TApplicationController.GetInstance.ActiveFrame.ClassType.ClassName)
  else
    frmError.ErrorString.Add('Активный фрейм главного окна: <фрейм не создан>');

  cname:= StrAlloc(255);
  cnsiz:= 254;
  GetWindowText(Application.ActiveFormHandle, cname, cnsiz);
  frmError.ErrorString.Add('Активное окно: ' + string(cname));
  StrDispose(cname);
  frmError.ErrorString.Add('');

  frmError.ErrorString.Add('Информация о системе: ');
  frmError.ErrorString.Add('');

  MS.dwLength := SizeOf(MS);
  GlobalMemoryStatus(MS);
  OSVersionInfo.dwOSVersionInfoSize := sizeof(OSVersionInfo);
  GetVersionEx(OSVersionInfo);
  GetSystemInfo(SI);
  DC := GetDC(0);

  cname:= StrAlloc(MAX_COMPUTERNAME_LENGTH + 1);
  cnsiz:= MAX_COMPUTERNAME_LENGTH + 1;
  GetComputerName(cname, cnsiz);
  if (cnsiz > 0) then
    frmError.ErrorString.Add('Имя компьютера: ' + string(cname))
  else
    frmError.ErrorString.Add('Имя компьютера: <не определено>');
  StrDispose(cname);

  cname:= StrAlloc(255);
  cnsiz:= 254;
  GetUserName(cname, cnsiz);
  if (cnsiz > 0) then
    frmError.ErrorString.Add('Имя пользователя: ' + string(cname))
  else
    frmError.ErrorString.Add('Имя пользователя: <не определено>');
  StrDispose(cname);

   r:= TRegistry.Create(KEY_READ);
   try
    r.RootKey:= HKEY_LOCAL_MACHINE;
    case Win32Platform of
    VER_PLATFORM_WIN32_WINDOWS:
      r.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion',false);
    VER_PLATFORM_WIN32_NT:
      r.OpenKey('SOFTWARE\Microsoft\Windows NT\CurrentVersion',false);
    end;
    frmError.ErrorString.Add('Операционная система: ' + r.ReadString('ProductName') + ' (версия ' + r.ReadString('CurrentVersion') + ', ' + 'сборка ' + r.ReadString('BuildLab') + ':' + r.ReadString('CSDVersion') + ')');
  finally
    r.Free;
  end;

  frmError.ErrorString.Add('Объем ОЗУ: ' + FormatFloat('#,###" KB"', MS.dwTotalPhys div 1024));
  frmError.ErrorString.Add('Объем доступной ОЗУ на момент ошибки: ' + FormatFloat('#,###" KB"', MS.dwAvailPhys div 1024));
  frmError.ErrorString.Add('Объем виртуальной памяти: ' + FormatFloat('#,###" KB"', MS.dwTotalVirtual div 1024));
  frmError.ErrorString.Add('Размер файла подкачки: ' + FormatFloat('#,###" KB"', MS.dwTotalPageFile div 1024));
  frmError.ErrorString.Add('Разрешение экрана: ' + Format('%dx%d', [GetDeviceCaps(DC, HORZRES), GetDeviceCaps(DC, VERTRES)]));
  frmError.ErrorString.Add('Частота обновления экрана: ' + IntToStr(GetDeviceCaps(DC, VREFRESH)));
  frmError.ErrorString.Add('Глубина цвета: ' + IntToStr(GetDeviceCaps(DC, BITSPIXEL)));
  case GetDeviceCaps(DC, LOGPIXELSX) of
  96: frmError.ErrorString.Add('Размер шрифта: нормальный');
  120: frmError.ErrorString.Add('Размер шрифта: большой');
  else frmError.ErrorString.Add('Размер шрифта: <не определено>');
  end;
  frmError.Height:=120+(frmError.ErrorMemo.Lines.Count+1)*(frmError.Font.Size+5);

  logger.LogMessage('Error description form filled');

  Mail:=TStringList.Create;
  Mail.AddStrings(frmError.ErrorString);

  try
  TApplicationController.GetInstance.AddLogEntry('');
  TApplicationController.GetInstance.AddLogEntry('****Ошибка!****');
  TApplicationController.GetInstance.AddLogEntries(frmError.ErrorString);
  TApplicationController.GetInstance.AddLogEntry('****Конец ошибки****');
  TApplicationController.GetInstance.AddLogEntry('');
  except

  end;

    frmError.ShowModal;

    logger.LogMessage('Log entries set');

  if (TApplicationController.GetInstance.SendExceptionReport=ssSend) then
  begin
   fsend:=TApplicationController.GetInstance.GetLogForSend;
   if TApplicationController.GetInstance.SendSupportMail('UGTU Exception: '+ErrorDescription.ErrorClass, Mail, fsend) then
   DeleteFile(PANSIChar(fsend));
  end;

    logger.LogMessage('Mail dealt with');

  if (E is EApplicationException) then
  (E as EApplicationException).AfterAction;
  XMLReader.Free;
  ErrorDescription.Free;
  frmError.Free;

except
  XMLReader.Free;
  ErrorDescription.Free;
  frmError.Free;
  ShowMessage('При формировании отчета об ошибке произошла исключительная ситуация.' + #10#13 + 'Ошибка не может быть обработана.');
end;
end;



end.
