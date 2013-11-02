{-----------------------------------------------------------
  Модуль HOST_ReportController:
      THOST_ReportController - контроллер подсистемы
      "Общежитие" контроллер отчетов
  Дата создания: 19.04.2010
  Дата последнего изменения:
  Разработчик: Лодыгина Л.В.
-----------------------------------------------------------}
unit HOST_ReportController;
  {#Author tanyav@ist.ugtu.net}
interface
uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, ADODB, DB, uDM,
  Forms, Dialogs, DBLookupEh, Variants, StdCtrls, GeneralController, Grids,
  ExcelXP, ComObj, DBGrids, uDMAbiturientRasp, uDMAbiturientNabor,
  DBGridEh, ApplicationController, ExceptionBase,DateUtils,
  uHOST, HOST_Order, ReportsBase, uWaitingController,HOST_ZayavNaZas,HOST_Kartochka;

type
  PDBGrid = ^TDBGridEh;
  THOST_ReportController = class (TObject)
  protected
    constructor CreateInstance;
 //AccessInstance предоставляет доступ к экземпляру контроллера
    class function AccessInstance(Request: Integer):
       THOST_ReportController;

  public
    constructor Create;
  //Instance - возвращает экзепляр данного контроллера
    class function Instance: THOST_ReportController;
  //ReleaseInstance - уничтожает контроллер
    class procedure ReleaseInstance;

    procedure GetZayavl;

    procedure ExecuteError(Sender: TObject; E: Exception);


    procedure PrintOrder(IDZayavlenie:integer);
    procedure PrintZayavNaZas(nCode:integer);
    procedure PrintKartochka(nCode:integer);
    procedure PrintDogovor(nCode:integer);
    function FindAndInsert(W:Variant; FindText, ReplacementText:string):boolean;

end;

implementation
var
  FHOST_ReportControllerInstance: THOST_ReportController = nil;

constructor THOST_ReportController.CreateInstance;
begin
  inherited Create;
end;


procedure THOST_ReportController.GetZayavl;
begin
  dmHOST.vVkSpisokZayav.Close;
  dmHOST.vVkSpisokZayav.Open;
end;

constructor THOST_ReportController.Create;
begin
  inherited Create;
  raise EApplicationException.Create('Доступ к классу %s можно получить только через поле Instance!');
end;


class function THOST_ReportController.AccessInstance(
  Request: Integer): THOST_ReportController;
begin
  case Request of
    0 : ;
    1 : if not Assigned(FHOST_ReportControllerInstance) then
      FHOST_ReportControllerInstance:= CreateInstance;
    2 : if FHOST_ReportControllerInstance <> nil then
          begin
            FHOST_ReportControllerInstance.Free;
            FHOST_ReportControllerInstance:= nil;
          end;
    else raise EApplicationException.Create('Ошибка в программе!',Exception.CreateFmt('Ошибка в программе!', [Request]));
  end;  Result := FHOST_ReportControllerInstance;
end;


class function THOST_ReportController.Instance: THOST_ReportController;
begin
  Result := AccessInstance(1);
end;

procedure THOST_ReportController.ExecuteError(Sender: TObject; E: Exception);
begin
  (Sender as TReportBase).Quit;
    raise Exception.Create(E.Message); //EApplicationException.Create('Произошла ошибка при формировании отчета.',E)
end;



function THOST_ReportController.FindAndInsert(W: Variant; FindText,
  ReplacementText: string): boolean;
begin
  W.Selection.Find.Text:=FindText;
  W.Selection.Find.Replacement.Text:=ReplacementText;
  result:=W.Selection.Find.Execute(Replace:=2);
end;

procedure THOST_ReportController.PrintDogovor(nCode: integer);
var W, MyRange, table:variant;
    str:string;
    i:integer;
begin
  TApplicationController.GetInstance.AddLogEntry('Экспорт в Word договора.');
	  W:=CreateOleObject('Word.Application');
	  str := ExtractFilePath(Application.ExeName)+'reports\HOST_Dogovor.dot';
	  W.Documents.add(str);
     // W.Visible:=true;
    dmHOST.ProcVivodDogovoraPoCode.ProcedureName:= 'HOST_VivodDogovoraPoCode;1';
    dmHOST.ProcVivodDogovoraPoCode.Close;

    with dmHOST.ProcVivodDogovoraPoCode.Parameters do
    begin
      Clear;
      CreateParameter('@nCode', ftInteger, pdInput, 4, nCode);
    end;
    dmHOST.ProcVivodDogovoraPoCode.Open;
    dmHOST.ProcVivodDogovoraPoCode.First;

    //with  dmHOST.ProcVivodDogovoraPoCode do
    //begin
	  FindAndInsert(W,'#год#', IntToStr(YearOf(Date)));
    dmHOST.ProcVivodDogovoraPoCode.Locate('ik_AddressType',1,[]);
    FindAndInsert(W,'#общ#', dmHOST.ProcVivodDogovoraPoCode.FieldByName('NumHostel').AsString);
    FindAndInsert(W,'#комн#', dmHOST.ProcVivodDogovoraPoCode.FieldByName('FlatNumber').AsString);
    FindAndInsert(W,'#ФИО#', dmHOST.ProcVivodDogovoraPoCode.FieldByName('fio').AsString);
    FindAndInsert(W,'#Фам#', dmHOST.ProcVivodDogovoraPoCode.FieldByName('Clastname').AsString);
    FindAndInsert(W,'#Имя#', dmHOST.ProcVivodDogovoraPoCode.FieldByName('Cfirstname').AsString);
    FindAndInsert(W,'#Отч#', dmHOST.ProcVivodDogovoraPoCode.FieldByName('Cotch').AsString);
    dmHOST.ProcVivodDogovoraPoCode.Locate('ik_AddressType',2,[]);
    if (dmHOST.ProcVivodDogovoraPoCode.FieldByName('Adress').AsString<>'') then
      FindAndInsert(W,'#Адрес#', dmHOST.ProcVivodDogovoraPoCode.FieldByName('Adress').AsString)
    else
      FindAndInsert(W,'#Адрес#', '  ');
    dmHOST.ProcVivodDogovoraPoCode.Locate('Ik_vid_doc',4,[]);
    if (dmHOST.ProcVivodDogovoraPoCode.FieldByName('Ik_vid_doc').AsString<>'') then
      begin
        FindAndInsert(W,'#Сер#', dmHOST.ProcVivodDogovoraPoCode.FieldByName('Cd_seria').AsString);
        FindAndInsert(W,'#Ном#', dmHOST.ProcVivodDogovoraPoCode.FieldByName('Np_number').AsString);
        FindAndInsert(W,'#Кем#', dmHOST.ProcVivodDogovoraPoCode.FieldByName('Cd_kem_vidan').AsString);
        FindAndInsert(W,'#Когда#', dmHOST.ProcVivodDogovoraPoCode.FieldByName('Dd_vidan').AsString);
      end
    else
    begin
    FindAndInsert(W,'#Сер#',  '  ');
    FindAndInsert(W,'#Ном#',  '  ');
    FindAndInsert(W,'#Кем#',  '  ');
    FindAndInsert(W,'#Когда#',  '  ');
    end;
    W.Visible:=true;
    //end;
end;

procedure THOST_ReportController.PrintKartochka(nCode: integer);
var
  Report:TReportBase;
begin
  TApplicationController.GetInstance.AddLogEntry('Вывод личной карточки в Excel.');
    Report := TReportBase.CreateReport(THOST_Kartochka);
    Report.FreeOnComplete := true;
    Report.OnExecuteError := ExecuteError;
    THOST_Kartochka(Report).nCode:= nCode;
    Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\HOST_LichnKartochka.XLT';
    TWaitingController.GetInstance.Process(Report);
end;

procedure THOST_ReportController.PrintOrder(IDZayavlenie: integer);
  var
  Report:TReportBase;
begin
  TApplicationController.GetInstance.AddLogEntry('Вывод ордера в Excel.');
    Report := TReportBase.CreateReport(THOST_OrderReport);
    Report.FreeOnComplete := true;
    Report.OnExecuteError := ExecuteError;
    THOST_OrderReport(Report).IDZayavlenie:= IDZayavlenie;
    Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\Order.XLT';
    TWaitingController.GetInstance.Process(Report);
end;

procedure THOST_ReportController.PrintZayavNaZas(nCode: integer);
  var
  Report:TReportBase;
begin
  TApplicationController.GetInstance.AddLogEntry('Вывод заявления на заселение в Excel.');
    Report := TReportBase.CreateReport(THOST_ZayavNaZas);
    Report.FreeOnComplete := true;
    Report.OnExecuteError := ExecuteError;
    THOST_ZayavNaZas(Report).nCode:= nCode;
    Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\ZayavNaZas.XLT';
    TWaitingController.GetInstance.Process(Report);
end;

class procedure THOST_ReportController.ReleaseInstance;
begin
   AccessInstance(2);
end;
end.
