{-----------------------------------------------------------
  Модуль uUspevGroupController:
      uUspevGroupController - контроллер подсистемы
      "Денканат" - успеваемость группы
  Дата создания: 09.02.2008
  Дата последнего изменения:
  Разработчик: Вокуева Т.А.
-----------------------------------------------------------}
unit uUspevGroupController;
 {#Author tanyav@ist.ugtu.net}
interface
uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, ADODB, DB, uDM,
  Forms, Dialogs, DBLookupEh, Variants, StdCtrls, GeneralController, Grids,
  ExcelXP, ComObj, DBGrids, uDMUspevaemost, ComCtrls, DateUtils,
  udmUgtuStructure, DBGridEh, ApplicationController, ExceptionBase, ReportsBase, D_VedomostBRS,
  D_VedomostBRSLast, D_BRSAllModules, D_BRSExamVedomost, D_BRSRankReport, D_BRSRankAverageReport,
  Vedomost2014,Assemly_Report2014,Spravka,SpravkaReport2014,Spravka2014,
  CommandController;

type
  PDBGrid = ^TDBGridEh;
  TVedType = (exam,zach,KP,KR);
  TUspevGroupController = class (TObject)
  private
    FVedomostController: TVedomostController;
    FNapravController: TNapravController;
    function GetVedomostController: TVedomostController;
  protected
    constructor CreateInstance;
 //AccessInstance предоставляет доступ к экземпляру контроллера
    class function AccessInstance(Request: Integer):
       TUspevGroupController;
    constructor Create;
    destructor Destroy; override;

  public

  //Instance - возвращает экзепляр данного контроллера
    class function Instance: TUspevGroupController;
  //ReleaseInstance - уничтожает контроллер
    class procedure ReleaseInstance;

//*********НЕПОСРЕДСТВЕННО УСПЕВАЕМОСТЬ*********************




//**********************АТТЕСТАЦИЯ**************************
//процедура выбирает все данные для одного из предметов аттестации
  procedure SelectAtt(ikVed: integer; IsBRS:boolean);

  //процедура выбирает все данные для одного из предметов с экзаменом БРС
  procedure SelectBRSExam(ikVed: integer);


//функция выбирает все созданные предметы аттестации и возвращает их количество
  function GetAllAtt(ik_grup, nsem, nomer_att:integer; IsBRS:boolean):integer;

  //функция выбирает все созданные предметы экзаменов БРС и возвращает их количество
  function  GetAllBRSExam(ik_grup, nsem:integer):integer;

//функция выбирает все предметы аттестации из учебного плана и возвращает их количество
  function GetAttVidZan(ik_grup,nsem, nmodule:integer; IsBRS:boolean):integer;
  function GetBRSExamVidZan(ik_grup, nSem:integer):integer;

//функция проверяет наличие созданной ведомости для аттестации
  function CheckAttsExist(ikGroup, nSem, nVed{, ikVidZan}, ikPredm: Integer; IsBrs:boolean): boolean;

   //функция проверяет наличие созданной ведомости для аттестации
  function CheckBRSExamExist(ik_grup, nSem, ikVidZan, ikPredm: Integer):boolean;

//функция создает все ведомости аттестации
  function CreateAllAtt(ik, nSem, numAtt:integer; IsBrs:boolean):boolean;

  //функция создает все ведомости экзаменов БРС
  function CreateAllBRSExam(ik_grup, nSem:integer):boolean;

//функция выбора списка для одного из предметов аттестации
  function SelAtt(nSem, ikPredm, ikVidZan, ik_grup, nom_ved: Integer):boolean;

  //функция выбора списка для одного из предметов БРС экзамена
  function SelBRSExam(nSem, ikPredm, ikVidZan, ik_grup: Integer):boolean;

//сохраняет результаты аттестации и пропуски
  function SaveAtt(ikVed: integer; dbgrdAtt: PDBGrid):boolean;

  function SaveBRSAtt(ikVed:integer; dbgrdBRSAtt: TDBGridEh; i_tab:string; date:TDateTime):boolean;

  function SaveBRSExam(ikVed: integer; dbgrdBRSExam: TDBGridEh; i_tab:string; date:TDateTime): boolean;

//закрывает все предметы выбранной аттестации
  function CloseAllAtt(ik_grup, nSem, numAtt:integer):boolean;

//сохраняет одну дату для аттестаций
  function SaveDateAllAtt(ik_grup, nSem, numAtt:integer; dateAtt: TDateTime):boolean;

//закрытие аттестации
  function CloseAtt(ikVed: integer; itab_n: string; lclose : boolean):boolean;

  function GetVedomSet: TADODataSet;





//***************ВКЛАДКА ВЕДОМОСТИ**************************
  //SelPrepodsForVedom выбирает прподавателей для ведомости
  function  SelPrepodsForVedom(Ik_grup, iK_vid_zanyat, n_sem: variant): boolean;

  //GetNSem вычисляет № текущего семестра (по году создания группы)
  function  GetNSem(FoundYear: integer): integer;

  function  GetNSemBRS(FoundYear: integer): integer;

    //CheckVedClose проверяет, закрыты ли все ведомости зачетной недели
  function CheckVedClose(nSem, ik_group: integer; var allZachs: boolean): boolean;

  //GetAllPredms возвращает все дисциплины учебного плана (зачетной или
  //экзаменационой недели определяется пар-м bitExam)
  function GetAllPredms(nSem, ik_group: integer; bitExam:boolean): TADOStoredProc;

  //GetAllVeds Возвращает все созданные ведомости согласно уч. плана
  procedure GetAllVeds(nSem, ik_group: integer);

  //GetVedChangeEnabled проверяет возможность редактирования ведомости
  //(то есть закрыта она или нет)
  function GetVedChangeEnabled():boolean;

  //GetVedChangeOpenEnabled проверяет возможность открытия/закрытия ведомости
  function GetVedChangeOpenEnabled:boolean;

 //DoCheckVedExist Поверяет, существует ли ведомость
  function DoCheckVedExist(ik_upContent: Integer): Boolean;


  //UpdateVedsContent Обновляет список студентов во всех открытых ведомостях
  //группы в указанном семестре
  procedure UpdateVedsContent(nSem, ik_group: integer);

  //CreateIndependVeds Создает все недостающие по уч. плану ведомости
  //для всего семестра
  procedure CreateIndependVeds(nSem, ik_group: integer); overload;

  //CreateDependVeds Создает все недостающие по уч. плану ведомости
  //для конкретного вида занятий
  procedure CreateDependVeds(nSem, ik_group, ik_vid_zanyat: integer); overload;

  //CreateVeds Создает все ведомости
  //(при этом определяет зачетной или экзаменационной недели)
  procedure CreateVeds(nSem, ik_group: integer);

  //CanCreateVnostVed проверяет можно ли создать
  //выносные ведомости на экзамен
  function CanCreateVnostVed: boolean;

  //CanCreateDependVeds проверяет можно ли создать
  //ведомости по зависимым видам занятий
  function CanCreateDependVeds(): boolean;

  //CanCreateIndependVeds проверяет можно ли создать
  //независимые ведомости
  function CanCreateIndependVeds(nSem, ik_group: integer): boolean;

  //возвращает в виде строки виды занятий, которые можно создать
  //и которые зависят от переданного вида зянятий
  function GetEnableVidZanyats(nSem, ik_group, ikVidZan: integer): string;

  //CanCreateVeds проверяет, можно ли создать ведомости
  function CanCreateVeds(nSem, ik_group: integer): boolean;

  //ArePredmsInUchPlan проверяет есть ли предметы вообще в учебном плане
  function ArePredmsInUchPlan(nSem, ik_group: integer): boolean;

  //CanUpdateVedsList проверяет можно ли обновить ведомости
  function CanUpdateVedsList(nSem, ik_group: integer): boolean;

  //UpdateVedsList Создает все недостающие по уч. плану ведомости
  //для всего семестра
  procedure UpdateVedsList(nSem, ik_group: integer);

  //GetAllVidZanyats загружает все вида занятий, для которых нужно создавать
  //ведомости с необходимой для этого информацией
  procedure GetAllVidZanyats(nSem, ik_group: integer);

  //GetDependVidZanyats загружает список видов занятий ,которые уже можно создать
  //(но еще не созданы) и которые зависят от переданного вида занятий
  procedure GetDependVidZanyats(nSem, ik_group, IkVidZan: integer);

  //SetFilterForVidZanyats фильтрует виды занятий
  procedure SetFilterForVidZanyats(CreateEnable, IsCreated, IsDependent: boolean);

  //GetListOfVeds Загружает список уже созданных ведомостей при смене семестра,
  //создает недостающие по уч. плану
  //возвращает количество созданных ведомостей
  function GetListOfVeds(nSem, ik_group, fac_ik: integer; var countPredms: integer): integer;

  //GetVedsHeader читает заголовок ведомости
  procedure GetVedsHeader(ikVed: integer);


  //GetVedsHeader читает данные (оценки) ведомости
  function SelectVed(ikVed: integer): TADODataSet;

  //ApplyUspev Сохраняет данные ведомости (оценки)
  procedure ApplyUspev(ikVed, ikVidZan: integer; dbgrdVed: PDBGrid);


  //ApplyVed Сохраняет данные ведомости (шапку)
  procedure ApplyVed(VedNum:string; ikVidExam: integer; bitClose, bitNapr:
                     boolean; ikPrepod: Variant; DateExam: TDateTime);

  //OpenVed Открывает ведомость
  function OpenVed(ikVed: integer):boolean;

  //CloseVed закрывает ведомость
  procedure CloseNapr(ik_ved, cosenca: integer; ntab, KPTema: string; date_exam: TDateTime);      //ik_ved, cosenca: integer; ntab, KPTema: string; date_exam: TDateTime

  //UpdateDopuskForVed Обновляет допуски в ведомости (шапку)
  function UpdateDopuskForVed(ikVed : integer):boolean;

  //SelContrlForVinVed выбирает список возможных экзаменов
  //для создания выносных экзаменов
  //(выбирает только те, для кот-х не созданы ведомости)
  function SelContrlForVinVed(ik_group, nSem: integer):boolean;

  //GetContrlVidZanForRaport Выбирает все дисциплины, по которым можно создать рапорт
  //Зависимые виды отчетности
  function GetContrlVidZanForRaport(ik_group, nSem: integer):boolean;

  //GetDopusksList возвращает допуски к экзамену
  function GetDopusksList(SourceDataSet: PDataSet; ik_group, ik_upContent, dopusk: integer):boolean;

  //AppendRaports работает с рапортами о недопусках к экзамену
  //(создает, редактирует, закрывает)
  procedure AppendRaports(flag, ik_zach, ik_upContent: integer; bitClose: boolean);

  //DoRaports создает, закрывает, открывает рапорты
  //согласно переданных списков
  function DoRaports(lv1, lv2, lvDop, lvNDop:TListView;
    ik_group,ik_upContent: integer):boolean;
  //Удаление ведомости
  procedure DelVed(ik_ved: variant);

  ///////////Экспорт в Excel аттестации///////////
  procedure PrintAttestation(ikGrup, nSem, nAtt, ikFac: integer; date: string);

  ///////////Экспорт в Excel ведомости испытания БРС///////////
  procedure PrintBRSVedomost(ikGrup, nSem, nAtt, ikFac: integer; date,examiner,num: string);

  ///////////Экспорт в Excel ведомости экзамена БРС///////////
  procedure PrintBRSExamVedomost(ikGrup, nSem, nAtt, ikFac: integer; date,examiner,num: string);

  ///////////Экспорт в Excel отчета по БРС///////////
  procedure PrintBRSRankReport(ikGrup, nSem:integer; num: string);

  ///////////Экспорт в Excel отчета по БРС со средними баллами///////////
  procedure PrintBRSRankAverageReport(ikGrup, nSem:integer; num: string);

  ///////////Экспорт в Excel бланка аттестации///////////
  procedure PrintBlankAttestation(ikGrup, nSem, nAtt, ikFac: integer; date: string);

       ///////////Экспорт в Excel итоговой ведомости БРС///////////
  procedure PrintBRSLastVedomost(ikGrup, nSem, ikFac, ikDisc: integer; datezach, dateexam, examiner, disc: string);

  //***********НАПРАВЛЕНИЯ*********************************************************************************************
  //взять DataSet с ведомостями, по которым можно дать направления для текущего студента
  function GetContentDS(StudIK, ZachIK: integer): TADODataSet;

  //взять DataSet с направлениями студента
  function GetNapravDS: TADODataSet;

  //установить фильтр направлений по ведомостям
  procedure SetContentNaprav(ContentIK: integer);

  //установить семестр для выдачи направлений
  procedure SetNapravSemester(nsem: integer);

  function AddNapr(VidExID: integer; dateIn, dateOut: TDateTime; NaprNum, VidName: string): integer;

  procedure AnnulNapr(VedIK: integer);

  procedure SelectOpenedNapr(StudGrupIk, ZachIK: integer);

  //**********ЭКСПОРТ В EXCEL ВЕДОМОСТЕЙ************
  //Возвращает следующее слово из строки,
  //при этом укорачивая строку на это слово и разделитель
  function GetNextSubStr(var str:string):string;

  //Генерирует название страницы
  function GetPagename(VidZanShortName: string; prevName: string): string;

  //GetAllVedomosts Выборка списка всех созданных в семестре ведомостей
  function GetAllVedomosts(ikGrup, nSem: integer):TADOStoredProc;

  //GetVedomsShapca Выбирает заголовок ведомости
  function GetVedomsShapca(ik_ved: integer):boolean;

  //GetVedomsBottom Выбирает результаты ведомости (кол-ва 3,4,5)
  procedure GetVedomsBottom(ik_ved, iK_vid_zanyat: integer);


  //Выбирает cодержимое ведомости с допусками
  function GetVedomsOsenciWithDopusk(ik_ved: integer):TADOStoredProc;

  //Выбирает cодержимое ведомости без допусков (зачет, КП, КР)
  function GetVedomsOsenciWithoutDopusk(ik_ved: integer):TADOStoredProc;

  //Выбирает cодержимое ведомости
  function GetVedomsOsenci(ik_ved: integer;hasDopusk:boolean):TADOStoredProc;

  //настройка следующего листа (для КП - двух следующих)
  procedure AddPageVedomost(var mainSheet, next:integer; firstStr:integer; E:Variant; HasTema:boolean; VidZanShortName: string);

  //Выводит шапку ведомости в Excel
  procedure ExportVedsShapka(mainSheet, next, ikGrup, nSem, ikVed, ikFac, ikSpec, ikVidZan, Count, firstStr, firstStrKP: integer; E:Variant; HasTema, withOsenca:boolean; VedName, VidZanShortName: string);

  //Переносит итоги ведомости
  procedure ExportVedsEnd(mainSheet,next,firstStr:integer; ikVed, ikVidZan, Count: integer; E:Variant; withOsenca:boolean);

  //Настраивает ведомость в конце экспорта
  procedure NastrVedsEnd(next, firstStr:integer; ikGrup, nSem, ikVed, ikFac, ikSpec, ikVidZan, Count: integer; E:Variant; HasTema, HasDopusk:boolean; VedType:TVedType);

  //printVedomost генерирует все отчёты ведомости
  procedure printVed(ikGrup, nSem, ikVed, ikFac, ikSpec: integer);



  //printAllVedomost генерирует все ведомости семестра (с оценками)
  procedure printAllVedomost(ikGrup, nSem, ikFac, ikSpec: integer);


  //************ЭКСПОРТ В EXCEL БЛАНКОВ ВЕДОМОСТЕЙ******************
  //организует печать любой ведомости
  procedure printVedomost(VedList:TADOStoredProc;ikGrup, nSem, ikFac, ikSpec: integer; withOsenca:boolean);

  //непосредственно Экспорт экзаменационного бланка ведомости
  procedure DoPrintVedomost(E:Variant;ikGrup, nSem, ikVed, ikFac, ikSpec: integer; withOsenca:boolean);


 { //printBlankVedomostZach генерирует бланк ведомости для зачета
  procedure printBlankVedomostZach(ikGrup, nSem, ikVed, ikFac, ikSpec: integer; E:Variant; HasDopusk:boolean);

  //printBlankVedomostKP генерация бланка ведомости для КП
  procedure printBlankVedomostKP(ikGrup, nSem, ikVed, ikFac, ikSpec: integer; E:Variant; HasDopusk:boolean);
  }
  //printBlankVedomost генерирует бланк ведомости (без оценок)
  procedure printBlankVedomost(ikGrup, nSem, ikVed, ikFac, ikSpec: integer;
   tempStoredProc: TADOStoredProc);

  function BuildVedomost2014(ikGrup, nSem, ikVed, ikFac, ikSpec: integer): TReportBase;
  //printAllBlankVedomost генерирует все бланки ведомостей семестра (без оценок)
  procedure printAllBlankVedomost(ikGrup, nSem, ikFac, ikSpec: integer);

//***************ВКЛАДКА УСПЕВАЕМОСТЬ**************************
  //GetAllUspevForGrup Выборка списка всех созданных в семестре ведомостей
  function GetAllUspevForGrup(ikGrup, nSem: integer):TADOStoredProc;

  //PrintUspevToExcel Экспорт в Excel успеваемости группы (журнала)
  function PrintUspevToExcel(sgUspev: TStringGrid):boolean;




//***************Дополнительные**************************
  //getSpecFromSpecFac возвращает IK специальности
  function getSpecFromSpecFac(SpecFacIK: integer): Integer;
  //экспорт справок
  function BuildSpravka2014(_ikStudGrup, _type_spr: integer):TReportBase;

  //******************Контроллеры (Kim Spark)*****************************************
  property VedomostController: TVedomostController read GetVedomostController;
                             
end;

implementation
uses CommonIntf, CommonIntfImpl, BRSVedom2014, ConstantRepository;

 var
//FAbitZachislenieControllerInstance - экземпляр контроллера
  FUspevGroupControllerInstance: TUspevGroupController = nil;
  havePredms: boolean = false;
  CanCreateIndependVeds: boolean = false;
  CanCreateDependVeds: boolean = false;
constructor TUspevGroupController.CreateInstance;
begin
  inherited Create;
  FVedomostController := TVedomostController.Create;
  FNapravController := TNapravController.Create;
end;

constructor TUspevGroupController.Create;
begin
  inherited Create;

  raise Exception.CreateFmt('Доступ к классу %s можно получить только через поле Instance!', [ClassName]);
end;


class function TUspevGroupController.AccessInstance(
  Request: Integer): TUspevGroupController;
begin
  case Request of
    0 : ;
    1 : if not Assigned(FUspevGroupControllerInstance) then
    begin
      FUspevGroupControllerInstance:= CreateInstance;

    end;
    2 : if FUspevGroupControllerInstance <> nil then
          begin

            FreeAndNil(FUspevGroupControllerInstance);
          //  FUspevGroupControllerInstance.Free;
          //  FUspevGroupControllerInstance:= nil;
          end;
    else raise EApplicationException.Create('Ошибка в программе!',Exception.CreateFmt('Произошла ошибка в контроллере Успеваемости', [Request]));
  end;  Result := FUspevGroupControllerInstance;
end;

class function TUspevGroupController.Instance: TUspevGroupController;
begin
  Result := AccessInstance(1);
end;

class procedure TUspevGroupController.ReleaseInstance;
begin

   AccessInstance(2);
end;












//*********НЕПОСРЕДСТВЕННО УСПЕВАЕМОСТЬ*********************




//***********************АТТЕСТАЦИЯ*************************
//процедура выбирает все данные для одного из предметов аттестации
procedure TUspevGroupController.SelectAtt(ikVed: integer; IsBRS:boolean);
begin
    if not IsBRS then
    begin
      dmUspevaemost.adodsSelAttGroup.Active := false;
      dmUspevaemost.adodsSelAttGroup.CommandText := 'select * from GetSmallAttForGrup('+IntToStr(ikVed)+')';
      dmUspevaemost.adodsSelAttGroup.Active := true;
    end else
    begin
      dmUspevaemost.adodsSelAttBRSGroup.Active := false;
      dmUspevaemost.adodsSelAttBRSGroup.CommandText := 'select * from GetSmallBRSAttForGrup('+IntToStr(ikVed)+')';
      dmUspevaemost.adodsSelAttBRSGroup.Active := true;
    end;
end;

procedure TUspevGroupController.SelectBRSExam(ikVed: integer);
begin
      dmUspevaemost.adodsSelBRSExamGroup.Active := false;
      dmUspevaemost.adodsSelBRSExamGroup.CommandText := 'select * from GetSmallBRSExamForGrup('+IntToStr(ikVed)+')';
      dmUspevaemost.adodsSelBRSExamGroup.Active := true;
end;

procedure TUspevGroupController.SelectOpenedNapr(StudGrupIk, ZachIK: integer);
begin
  FNapravController.Reload(StudGrupIk, ZachIK);
  FNapravController.LoadOpenedNapr;
end;

//функция выбирает все созданные предметы аттестации и возвращает их количество
function TUspevGroupController.GetAllAtt(ik_grup, nsem, nomer_att:integer; IsBRS:boolean):integer;
begin
  result:=0;
  dmUspevaemost.adospGetAllAtt.Active := false;

  if IsBRS then dmUspevaemost.adospGetAllAtt.ProcedureName := 'GetAllAttestForBRSGrup'
  else dmUspevaemost.adospGetAllAtt.ProcedureName := 'GetAllAttestForGrup';

  with dmUspevaemost.adospGetAllAtt.Parameters do
  begin
    Clear;
    AddParameter;
    Items[0].Value := ik_grup;
    AddParameter;
    Items[1].Value := nsem;
    AddParameter;
    Items[2].Value := nomer_att;
  end;
  dmUspevaemost.adospGetAllAtt.ExecProc;
  dmUspevaemost.adospGetAllAtt.Active := true;
  result:=dmUspevaemost.adospGetAllAtt.RecordCount;
end;

function TUspevGroupController.GetAllBRSExam(ik_grup, nsem: integer): integer;
begin
 result:=0;
  dmUspevaemost.adospGetAllBRSExam.Active := false;

  with dmUspevaemost.adospGetAllBRSExam.Parameters do
  begin
    Clear;
    AddParameter;
    Items[0].Value := ik_grup;
    AddParameter;
    Items[1].Value := nsem;
  end;
  dmUspevaemost.adospGetAllBRSExam.ExecProc;
  dmUspevaemost.adospGetAllBRSExam.Active := true;
  result:=dmUspevaemost.adospGetAllBRSExam.RecordCount;
end;

//функция выбирает все предметы аттестации из учебного плана и возвращает их количество
  function TUspevGroupController.GetAttVidZan(ik_grup,nsem, nmodule:integer; IsBRS:boolean):integer;
begin
  try
  dmUspevaemost.adospGetAttVidZan.Active := false;
    with dmUspevaemost.adospGetAttVidZan.Parameters do
    begin
      Clear;
      AddParameter;
      Items[0].Value := ik_grup;
      AddParameter;
      Items[1].Value := nsem;
      if IsBRS then
      begin
      AddParameter;
      Items[2].Value := nmodule;
      end;

    end;
    dmUspevaemost.adospGetAttVidZan.ExecProc;
    dmUspevaemost.adospGetAttVidZan.Active := true;
    result:=dmUspevaemost.adospGetAttVidZan.RecordCount;
  except
    result:=0;
    Raise;
  end;
end;


function TUspevGroupController.GetBRSExamVidZan(ik_grup, nSem: integer): integer;
begin
  try
  dmUspevaemost.adospGetBRSExamVidZan.Active := false;
    with dmUspevaemost.adospGetBRSExamVidZan.Parameters do
    begin
      Clear;
      AddParameter;
      Items[0].Value := ik_grup;
      AddParameter;
      Items[1].Value := nsem;
    end;
    dmUspevaemost.adospGetBRSExamVidZan.Active := true;
    result:=dmUspevaemost.adospGetBRSExamVidZan.RecordCount;
  except
    result:=0;
    Raise;
  end;
end;

//функция проверяет наличие созданной ведомости для аттестации
function TUspevGroupController.CheckAttsExist(ikGroup, nSem, nVed{, ikVidZan}, ikPredm: Integer; IsBrs:boolean): boolean;
begin

  dmUspevaemost.adospSelAtt.Active := false;

  if IsBRS then dmUspevaemost.adospSelAtt.ProcedureName:='SelBRSAtt;1'
  else dmUspevaemost.adospSelAtt.ProcedureName:='SelAtt;1';


  with dmUspevaemost.adospSelAtt.Parameters do
  begin
    Clear;
    AddParameter;
    // Номер семестра
    Items[0].Value := nSem;
    AddParameter;
    // Дисциплина
    Items[1].Value := ikPredm;   //сюда передаем ik_upContent
    AddParameter;
    // Вид занятий
    //Items[2].Value := ikVidZan;
    //AddParameter;
    // Группа
    Items[2].Value := ikGroup;
    AddParameter;
    // номер аттестации
    Items[3].Value := nved;
  end;
  //dmUspevaemost.adospSelAtt.ExecProc;
  dmUspevaemost.adospSelAtt.Active := true;
  if dmUspevaemost.adospSelAtt.FieldByName('ik_Ved').Value = null then
    Result := false
  else
    Result := true;
end;


function TUspevGroupController.CheckBRSExamExist(ik_grup, nSem, ikVidZan,
  ikPredm: Integer): boolean;
begin
 dmUspevaemost.adospSelBRSExam.Active := false;

  with dmUspevaemost.adospSelBRSExam.Parameters do
  begin
    Clear;
    AddParameter;
    // Номер семестра
    Items[0].Value := nSem;
    AddParameter;
    // Дисциплина
    Items[1].Value := ikPredm;
    AddParameter;
    // Вид занятий
    //Items[2].Value := ikVidZan;
    //AddParameter;
    // Группа
    Items[2].Value := ik_grup;
  end;
  //dmUspevaemost.adospSelAtt.ExecProc;
  dmUspevaemost.adospSelBRSExam.Active := true;
  if dmUspevaemost.adospSelBRSExam.FieldByName('ik_Ved').Value = null then
    Result := false
  else
    Result := true;
end;

//функция создает все ведомости аттестации
function TUspevGroupController.CreateAllAtt(ik, nSem, numAtt:integer; IsBrs:boolean):boolean;
begin
  result := false;

  // получаем список дисциплин аттестации которые должны быть (процедура: GetAttestVidZanyat)
  TUspevGroupController.Instance.GetAttVidZan(ik, nSem, NumAtt, IsBRS);

  dmUspevaemost.adospGetAttVidZan.First;
  while not dmUspevaemost.adospGetAttVidZan.Eof do
  begin
    // пропускаем уже созданные дисциплины аттестации (SelBRSAtt/SelAtt)
    if TUspevGroupController.Instance.CheckAttsExist(ik, nSem, numAtt,
                       dmUspevaemost.adospGetAttVidZan.Fields[3].Value,
                      { dmUspevaemost.adospGetAttVidZan.Fields[1].Value,} IsBrs)
    then
    begin
      dmUspevaemost.adospGetAttVidZan.Next;
      Continue;
    end;
    //процедура AppendVedomost
    with dmUspevaemost.adospAppVed.Parameters do
    begin
      Items[1].Value := 1;                                                // создание аттестации
      Items[2].Value := '';                                               // номер аттестации
      Items[3].Value := ik;                                               // код группы
      items[4].Value := dmUspevaemost.adospGetAttVidZan.Fields[0].Value;  // вид занятий
      items[5].Value := nSem;                                             // номер семестра
      items[6].Value := dmUspevaemost.adospGetAttVidZan.Fields[1].Value;  // предмет
      items[7].Value := Null;                                             // преподаватель
      items[8].Value := numAtt;                                         // номер аттестации в поле вид экзамена
      items[9].Value := Date;                                // дата выдачи
      items[10].Value := Date;                               // дата экзамена
      items[11].Value := 0;                                  // открытая аттестации
      items[12].Value := 0;                                  // не направление
      items[13].Value := null;                               // ik неизвестен
      items[14].Value := 0;                                  // не выносной экз
      items[15].Value := dmUspevaemost.adospGetAttVidZan.Fields[3].Value; // код записи учебного плана
    end;
    try
    dmUspevaemost.adospAppVed.ExecProc;
    except
    end;
    dmUspevaemost.adospGetAttVidZan.Next;
  end;
  result := true;

end;


function TUspevGroupController.CreateAllBRSExam(ik_grup,
  nSem: integer): boolean;
begin
  result := false;
    // получаем список дисциплин БРС по которым должен быть экзамен
    TUspevGroupController.Instance.GetBRSExamVidZan(ik_grup, nSem);

    dmUspevaemost.adospGetBRSExamVidZan.First;

  while not dmUspevaemost.adospGetBRSExamVidZan.Eof do
  begin
    // пропускаем уже созданные дисциплины аттестации

    if TUspevGroupController.Instance.CheckBRSExamExist(ik_grup, nSem,
                       dmUspevaemost.adospGetBRSExamVidZan.Fields[0].Value,
                       dmUspevaemost.adospGetBRSExamVidZan.Fields[3].Value)

    then
    begin
      dmUspevaemost.adospGetBRSExamVidZan.Next;
      Continue;
    end;
    with dmUspevaemost.adospAppVed.Parameters do
    begin
      Items[1].Value := 1;                                   // создание ведомости
      Items[2].Value := '';                                  // номер ведомости
      Items[3].Value := ik_grup;                             // код группы
      items[4].Value := dmUspevaemost.adospGetBRSExamVidZan.Fields[0].Value;// вид занятий
      items[5].Value := nSem;                                // номер семестра
      items[6].Value := dmUspevaemost.adospGetBRSExamVidZan.Fields[1].Value;// предмет
      items[7].Value := Null;                                // препод
      items[8].Value := 0;                                   // номер аттестации в поле вид экзамена
      items[9].Value := Date;                                // дата выдачи
      items[10].Value := Date;                               // дата экзамена
      items[11].Value := 0;                                  // открытая аттестации
      items[12].Value := 0;                                  // не направление
      items[13].Value := null;                               // ik неизвестен
      items[14].Value := 0;                                  // не выносной экз
      items[15].Value := dmUspevaemost.adospGetBRSExamVidZan.Fields[3].Value; // код записи учебного плана
    end;
    dmUspevaemost.adospAppVed.ExecProc;
    dmUspevaemost.adospGetBRSExamVidZan.Next;
  end;
  result := true;

end;

//функция выбора списка для одного из предметов аттестации
function TUspevGroupController.SelAtt(nSem, ikPredm, ikVidZan, ik_grup, nom_ved: Integer):boolean;
begin
 try
  dmUspevaemost.adospSelAtt.Fields.Clear;
  dmUspevaemost.adospSelAtt.Active := false;
  with dmUspevaemost.adospSelAtt.Parameters do
  begin
    Clear;
    // Номер семестра
    AddParameter;
    Items[0].Value := nSem;
    // Дисциплина
    AddParameter;
    Items[1].Value := ikPredm;   //ik_upContent
    // Вид занятий
   // AddParameter;
   // Items[2].Value := ikVidZan;
    // Группа
    AddParameter;
    Items[2].Value := ik_grup;
    //номер аттестации
    AddParameter;
    Items[3].Value := nom_ved;
  end;
  dmUspevaemost.adospSelAtt.Open;
  //dmUspevaemost.adospSelAtt.Active := true;

  result :=true;
 except
   result := false;
 end;
end;

function TUspevGroupController.SelBRSExam(nSem, ikPredm, ikVidZan, ik_grup: Integer): boolean;
begin
  try
  dmUspevaemost.adospSelBRSExam.Fields.Clear;
  dmUspevaemost.adospSelBRSExam.Active := false;
  with dmUspevaemost.adospSelBRSExam.Parameters do
  begin
    Clear;
    // Номер семестра
    AddParameter;
    Items[0].Value := nSem;
    // Дисциплина
    AddParameter;
    Items[1].Value := ikPredm;     //@ik_upContent
    // Вид занятий
 //   AddParameter;
  //  Items[2].Value := ikVidZan;
    // Группа
    AddParameter;
    Items[2].Value := ik_grup;
  end;
  dmUspevaemost.adospSelBRSExam.ExecProc;
  dmUspevaemost.adospSelBRSExam.Active := true;

  result :=true;
 except
   result := false;
 end;
end;

//сохраняет результаты аттестации и пропуски
function TUspevGroupController.SaveAtt(ikVed: integer; dbgrdAtt: PDBGrid):boolean;
begin

result:=false;

  dmUspevaemost.adodsSelAttGroup.First;
    while not dmUspevaemost.adodsSelAttGroup.Eof do
    begin
      if (dbgrdAtt.Fields[1].Value <> Null)and
         (dbgrdAtt.Fields[1].Text <> '') then
      begin
        dmUspevaemost.adospAppendRezAtt.Parameters[1].Value := 0;
        dmUspevaemost.adospAppendRezAtt.Parameters[2].Value := ikVed;
        dmUspevaemost.adospAppendRezAtt.Parameters[3].Value := dbgrdAtt.Fields[4].Value;

         //оценка
        if (dbgrdAtt.Fields[5].Value <> Null) then
          dmUspevaemost.adospAppendRezAtt.Parameters[4].Value := dbgrdAtt.Fields[5].Value
        else
          dmUspevaemost.adospAppendRezAtt.Parameters[4].Value := -1;
        //пропуски без уважительной причины
        dmUspevaemost.adospAppendRezAtt.Parameters[5].Value := dbgrdAtt.Fields[7].Value;
        //пропуски по уважительной причине
        dmUspevaemost.adospAppendRezAtt.Parameters[6].Value := dbgrdAtt.Fields[6].Value;

        dmUspevaemost.adospAppendRezAtt.ExecProc;
      end;
      dmUspevaemost.adodsSelAttGroup.Next;
    end;
    dmUspevaemost.adodsSelAttGroup.First;

result:=true;

end;



function TUspevGroupController.SaveBRSAtt(ikVed: integer;
  dbgrdBRSAtt: TDBGridEh; i_tab:string; date:TDateTime): boolean;
begin

  result:=false;

  with dmUspevaemost.aspSetAttributesVedomost do begin
        Parameters.Clear;
        Parameters.AddParameter;
        Parameters[0].Value := ikVed;
        Parameters.AddParameter;
        Parameters[1].Value := date;
        Parameters.AddParameter;
        Parameters[2].Value := i_tab;
        ExecProc;
  end;

  dmUspevaemost.adodsSelAttBRSGroup.First;
    while not dmUspevaemost.adodsSelAttBRSGroup.Eof do
    begin
      if (dbgrdBRSAtt.Fields[1].Value <> Null)and
         (dbgrdBRSAtt.Fields[1].Text <> '') then
      begin
      with dmUspevaemost.adospAppendRezBRSAtt do begin
        Parameters[1].Value := 0;
        Parameters[2].Value := ikVed;
        Parameters[3].Value := dbgrdBRSAtt.Fields[4].Value;
         //баллы
         //if dmUspevaemost.adospAppendRezBRSAtt.Parameters[4].Value <> NULL then
        Parameters[4].Value := dbgrdBRSAtt.Fields[5].Value;
        //else  dmUspevaemost.adospAppendRezBRSAtt.Parameters[4].Value := -1;
        //пропуски
        Parameters[5].Value := dbgrdBRSAtt.Fields[6].Value;
        Parameters[6].Value := dbgrdBRSAtt.Fields[7].Value;
        ExecProc;
      end;
      end;
      dmUspevaemost.adodsSelAttBRSGroup.Next;
    end;
    dmUspevaemost.adodsSelAttBRSGroup.First;

result:=true;

end;

function TUspevGroupController.SaveBRSExam(ikVed: integer;
  dbgrdBRSExam: TDBGridEh; i_tab:string; date:TDateTime): boolean;
begin

  result:=false;

  with dmUspevaemost.aspSetAttributesVedomost do begin
        Parameters.Clear;
        Parameters.AddParameter;
        Parameters[0].Value := ikVed;
        Parameters.AddParameter;
        Parameters[1].Value := date;
        Parameters.AddParameter;
        Parameters[2].Value := i_tab;
        ExecProc;
  end;

  dmUspevaemost.adodsSelBRSExamGroup.First;
    while not dmUspevaemost.adodsSelBRSExamGroup.Eof do
    begin
      if (dbgrdBRSExam.Fields[1].Value <> Null)and
         (dbgrdBRSExam.Fields[1].Text <> '') then
      begin
      with dmUspevaemost.adospAppendRezAttWithGrade do begin
        Parameters[1].Value := 0;
        Parameters[2].Value := ikVed;
        // зачетка
        Parameters[3].Value := dbgrdBRSExam.Fields[4].Value;
         //баллы
        Parameters[4].Value := dbgrdBRSExam.Fields[5].Value;
        //оценка по пятибалльной шкале
        Parameters[5].Value := dbgrdBRSExam.Fields[7].Value;
        ExecProc;
      end;
      end;
      dmUspevaemost.adodsSelBRSExamGroup.Next;
    end;
    dmUspevaemost.adodsSelBRSExamGroup.First;

result:=true;

end;

function TUspevGroupController.SaveDateAllAtt(ik_grup, nSem,
  numAtt: integer; dateAtt: TDateTime): boolean;
begin
result:=true;
try

  dmUspevaemost.adospSaveDateAllAtt.Active := false;
  with dmUspevaemost.adospSaveDateAllAtt.Parameters do
  begin
    Clear ;
    AddParameter;
    Items[0].Value := ik_grup;
    AddParameter;
    Items[1].Value := nSem;
    AddParameter;
    Items[2].Value := numAtt;
    AddParameter;
    Items[3].Value := dateAtt;
  end;
  dmUspevaemost.adospSaveDateAllAtt.ExecProc;

except
  result:=false;
end;
end;

//закрывает все предметы выбранной аттестации
function TUspevGroupController.CloseAllAtt(ik_grup, nSem, numAtt:integer):boolean;
begin
result:=true;
try

  dmUspevaemost.adoCloseAllAtt.Active := false;
  with dmUspevaemost.adoCloseAllAtt.Parameters do
  begin
    Clear ;
    AddParameter;
    Items[0].Value := ik_grup;
    AddParameter;
    Items[1].Value := nSem;
    AddParameter;
    Items[2].Value := numAtt;
  end;
  dmUspevaemost.adoCloseAllAtt.ExecProc;

except
  result:=false;
end;

end;

function TUspevGroupController.CloseAtt(ikVed: integer; itab_n: string; lclose: boolean): boolean;
var tempStoredProc: TADOStoredProc;
begin
result:=true;
try

  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.ProcedureName:= 'Dek_CloseAtt;1';
  tempStoredProc.Connection:= dm.DBConnect;
  tempStoredProc.Parameters.CreateParameter('@Ik_ved', ftInteger, pdInput, 0, ikVed);
  tempStoredProc.Parameters.CreateParameter('@Itab_n', ftString, pdInput, 50, itab_n);
  tempStoredProc.Parameters.CreateParameter('@lclose', ftBoolean, pdInput, 0, lclose);

  tempStoredProc.ExecProc;

except
  result:=false;
end;
end;

procedure TUspevGroupController.CloseNapr(ik_ved, cosenca: integer; ntab, KPTema: string; date_exam: TDateTime);   //ik_ved, cosenca: integer; ntab, KPTema: string; date_exam: TDateTime
begin
  TApplicationController.GetInstance.AddLogEntry('Закрытие направления');
  case FNapravController.CloseNapr(ik_ved, cosenca, ntab, KPTema, date_exam) of
    StatusError: ShowMessage('Нельзя закрыть направление с данным статусом');
  end;
end;

//***************ВКЛАДКА ВЕДОМОСТИ**************************
//выбирает преподавателей для ведомости
function  TUspevGroupController.SelPrepodsForVedom(Ik_grup, iK_vid_zanyat, n_sem: variant): boolean;
begin
  try
    dmUspevaemost.adospPrepodVed.Close;
    with dmUspevaemost.adospPrepodVed.Parameters do
    begin
      Clear;
      CreateParameter('@Ik_grup', ftInteger, pdInput, 0, Ik_grup);
      CreateParameter('@iK_vid_zanyat', ftInteger, pdInput, 0, iK_vid_zanyat);
      CreateParameter('@n_sem', ftInteger, pdInput, 0, n_sem);
    end;
    dmUspevaemost.adospPrepodVed.Open;
    result:=true;
  except
    result:=false;
  end;
end;

//вычисляет № текущего семестра (по году создания группы)
function  TUspevGroupController.GetNSem(FoundYear: integer): integer;
var nSem:integer;
begin
  //if (FoundYear>CurrentYear) or (FoundYear<1990) then
  //  result:= -1;
    nSem:=1;
    if MonthOf(Date)>8 then
      nSem:=1+(CurrentYear-FoundYear)*2
    else
      if MonthOf(Date)<4 then
        nSem:=(CurrentYear-FoundYear)*2-1
      else
        if (MonthOf(Date)<=8)and(MonthOf(Date)>=4) then
          nSem:=(CurrentYear-FoundYear)*2;
    if nSem>12 then
      nSem := 1;
  result:= nSem;
end;

function  TUspevGroupController.GetNSemBRS(FoundYear: integer): integer;
var nSem:integer;
begin
  //if (FoundYear>CurrentYear) or (FoundYear<1990) then
  //  result:= -1;
    nSem:=1;
    if MonthOf(Date)>8 then
      nSem:=1+(CurrentYear-FoundYear)*2
    else
    if MonthOf(Date)<2 then
        nSem:=(CurrentYear-FoundYear)*2-1
        else
          nSem:=(CurrentYear-FoundYear)*2;
    if nSem>12 then
      nSem := 1;
  result:= nSem;
end;

// проверяем, закрыты ли все ведомости зачетной недели
function TUspevGroupController.CheckVedClose(nSem, ik_group: integer; var allZachs: boolean): boolean;
begin
  allZachs:=false;

    dmUspevaemost.adospCheckVedClose.Close;
    with dmUspevaemost.adospCheckVedClose.Parameters do
    begin
      Clear;
      CreateParameter('@n_sem', ftInteger, pdInput, 0, nSem);
      CreateParameter('@ik_grup', ftInteger, pdInput, 0, ik_group);
    end;
    dmUspevaemost.adospCheckVedClose.Active:= true;
    dmUspevaemost.adospCheckVedClose.First;

    allZachs:= dmUspevaemost.adospCheckVedClose.FieldByName('allZachVed').AsBoolean;
    result:= dmUspevaemost.adospCheckVedClose.FieldByName('checkved').AsBoolean;

end;

//Возвращает все дисциплины учебного плана (зачетной или
//экзаменационой недели определяется пар-м bitExam)
function TUspevGroupController.GetAllPredms(nSem, ik_group: integer; bitExam:boolean): TADOStoredProc;
begin                   //
  try
    dmUspevaemost.adospGetAllPredms.Close;
    with dmUspevaemost.adospGetAllPredms.Parameters do
    begin
      Clear;
      CreateParameter('@ik_group', ftInteger, pdInput, 0, ik_group);
      CreateParameter('@n_sem', ftInteger, pdInput, 0, nSem);
      CreateParameter('@bitExam', ftBoolean, pdInput, 0, bitExam);
    end;
    dmUspevaemost.adospGetAllPredms.Active:= true;
    result:= dmUspevaemost.adospGetAllPredms;
  except
    result:= nil;
    exit;
    raise;
  end;
end;

//Возвращает все созданные ведомости согласно уч. плана
procedure TUspevGroupController.GetAllVeds(nSem, ik_group: integer);
begin                   //
  TApplicationController.GetInstance.AddLogEntry('Выборка списка всех ведомостей');
  dmUspevaemost.adospGetAllVeds4Group.Close;
    with dmUspevaemost.adospGetAllVeds4Group.Parameters do
    begin
      Clear;
      CreateParameter('@ik_group', ftInteger, pdInput, 0, ik_group);
      CreateParameter('@n_sem', ftInteger, pdInput, 0, nSem);
    end;
    dmUspevaemost.adospGetAllVeds4Group.Filter:='n_module=NULL';
    dmUspevaemost.adospGetAllVeds4Group.Filtered:=true;
    dmUspevaemost.adospGetAllVeds4Group.Active:= true;

end;

//проверяет возможность редактирования ведомости
//(то есть закрыта она или нет)
function TUspevGroupController.GetVedChangeEnabled():boolean;
begin
  Result := FVedomostController.IsOpened;

  {result:= false;
  if dmUspevaemost.adospSelVed.Active then
    result:= not dmUspevaemost.adospSelVed.FieldByName('lClose').AsBoolean; }
end;


//проверяет возможность открытия/закрытия ведомости
//(нельзя, если ведомость закрыта и уже созданы зависимые ведомости)
function TUspevGroupController.GetVedChangeOpenEnabled:boolean;
begin
  result:= false;
  if dmUspevaemost.adospSelVed.Active then
    result:=true;
end;

//Поверяет, существует ли ведомость
function TUspevGroupController.DoCheckVedExist(ik_upContent: Integer): Boolean;
begin
  dmUspevaemost.adospGetAllVeds4Group.Close;
  dmUspevaemost.adospGetAllVeds4Group.Open;
  result:= dmUspevaemost.adospGetAllVeds4Group.Locate('ik_upContent',ik_upContent,[]);

  {dmUspevaemost.adospSelVed.Active := false;
  with dmUspevaemost.adospSelVed.Parameters do
  begin
    Clear;
    AddParameter;
    // Номер семестра
    Items[0].Value := nSem;
    AddParameter;
    // Дисциплина
    Items[1].Value := ikPredm;
    AddParameter;
    // Вид занятий
    Items[2].Value := ikVidZan;
    AddParameter;
    // Группа
    Items[3].Value := ikGroup;
  end;
  dmUspevaemost.adospSelVed.ExecProc;
  dmUspevaemost.adospSelVed.Active := true;
  if dmUspevaemost.adospSelVed.FieldByName('ik_Ved').Value = null then
    Result := false
  else
    Result := true;  }
end;

//загружает все виды занятий, для которых нужно создавать
  //ведомости с необходимой для этого информацией
procedure TUspevGroupController.GetAllVidZanyats(nSem, ik_group: integer);
begin
  //try
  TApplicationController.GetInstance.AddLogEntry('Загрузка всех видов занятий');
  dmUspevaemost.adospGetAllVidZanyat.Close;
    dmUspevaemost.adospGetAllVidZanyat.SQL[1]:='('+IntToStr(nSem)+
            ', '+ IntToStr(ik_group)+')';
    dmUspevaemost.adospGetAllVidZanyat.Open;
  //except

  //end;
end;

//загружает список видов занятий ,которые уже можно создать
//(но еще не созданы) и которые зависят от переданного вида занятий
procedure TUspevGroupController.GetDependVidZanyats(nSem, ik_group, IkVidZan: integer);
begin
    dmUspevaemost.adospUspevDependVidZanyat.Close;
    with dmUspevaemost.adospUspevDependVidZanyat.Parameters do
    begin
      Clear;
      CreateParameter('@n_sem', ftInteger, pdInput, 0, nSem);
      CreateParameter('@Ik_grup', ftInteger, pdInput, 0, ik_group);
      CreateParameter('@ik_Vid_zanyat', ftInteger, pdInput, 0, IkVidZan);
    end;
    dmUspevaemost.adospUspevDependVidZanyat.Open;
end;

// фильтрует виды занятий
procedure TUspevGroupController.SetContentNaprav(ContentIK: integer);
begin
  FNapravController.ContentIK := ContentIK;
end;

procedure TUspevGroupController.SetFilterForVidZanyats(CreateEnable, IsCreated, IsDependent: boolean);
begin
  dmUspevaemost.adospGetAllVidZanyat.Close;
  dmUspevaemost.adospGetAllVidZanyat.Filter:= '((CreateEnable='+BoolToStr(CreateEnable)+') and (IsCreated='+BoolToStr(IsCreated)+
      ') and (IsDependent='+BoolToStr(IsDependent)+'))';
  dmUspevaemost.adospGetAllVidZanyat.Filtered:=true;
  dmUspevaemost.adospGetAllVidZanyat.Open;
end;


procedure TUspevGroupController.SetNapravSemester(nsem: integer);
begin
  FNapravController.Semester := nsem;
end;

//Обновляет список студентов во всех открытых ведомостях
//группы в указанном семестре
procedure TUspevGroupController.UpdateVedsContent(nSem, ik_group: integer);
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TADOStoredProc.Create(nil);
  try
    tempStoredProc.ProcedureName:= 'UspevUpdateAllVedomosts;1';
    tempStoredProc.Connection:= dm.DBConnect;
    with tempStoredProc.Parameters do
    begin
      Clear;
      CreateParameter('@ik_grup', ftInteger, pdInput, 0, ik_group);
      CreateParameter('@nSem', ftInteger, pdInput, 0, nSem);
    end;
    tempStoredProc.ExecProc;
  finally
    tempStoredProc.Free;
  end;
end;

//Создает все недостающие по уч. плану ведомости
//для всего семестра
procedure TUspevGroupController.CreateIndependVeds(nSem, ik_group: integer);
var
  tempStoredProc: TADOStoredProc;
begin
  TApplicationController.GetInstance.AddLogEntry('Создание независимых (перичных) ведомостей');
  tempStoredProc:= TADOStoredProc.Create(nil);
	  try
			tempStoredProc.ProcedureName:= 'UspevCreateAllVedsForSemestr;1';
			tempStoredProc.Connection:= dm.DBConnect;
			with tempStoredProc.Parameters do
			begin
			  Clear;
			  CreateParameter('@nSem', ftInteger, pdInput, 0, nSem);
			  CreateParameter('@ik_grup', ftInteger, pdInput, 0, ik_group);
			end;
			tempStoredProc.ExecProc;
	  finally
		  tempStoredProc.Free;
	  end;
end;

//Создает все недостающие по уч. плану ведомости
//для конкретного вида занятий
procedure TUspevGroupController.CreateDependVeds(nSem, ik_group, ik_vid_zanyat: integer);
var
  tempStoredProc: TADOStoredProc;
begin
  TApplicationController.GetInstance.AddLogEntry('Создание зависимых (вторичных) ведомостей');
	  tempStoredProc:= TADOStoredProc.Create(nil);
	  try
			tempStoredProc.ProcedureName:= 'UspevCreateAllVedsForVid_zanyat;1';
			tempStoredProc.Connection:= dm.DBConnect;
			with tempStoredProc.Parameters do
			begin
			  Clear;
			  CreateParameter('@nSem', ftInteger, pdInput, 0, nSem);
			  CreateParameter('@ik_grup', ftInteger, pdInput, 0, ik_group);
        CreateParameter('@ik_vid_zanyat', ftInteger, pdInput, 0, ik_vid_zanyat);
			end;
			tempStoredProc.ExecProc;
	  finally
		  tempStoredProc.Free;
	  end;
end;

//Создает все ведомости
procedure TUspevGroupController.CreateVeds(nSem, ik_group: integer);
begin
  TApplicationController.GetInstance.AddLogEntry('Создание ведомостей');

  FVedomostController.Reload(ik_group,nSem);
  try
    FVedomostController.CreateAllVed;
  except
    on E:Exception do
      raise EApplicationException.Create('Произошла ошибка при создании ведомостей!', E);
  end;

end;

function TUspevGroupController.CanCreateVnostVed: boolean;
begin
  result:= true;
{  if (dmUspevaemost.adospGetAllVidZanyat.Active) then
  begin
    dmUspevaemost.adospGetAllVidZanyat.First;
    while (not dmUspevaemost.adospGetAllVidZanyat.Eof) do
    begin
      //если есть хотя бы 1 вид занятий, по которому
      //еще не созданы ведомости, и это нельзя сделать,
      //и этот вид занятий зависит от других
      if (not dmUspevaemost.adospGetAllVidZanyat.FieldByName('IsCreated').AsBoolean) and
         (not dmUspevaemost.adospGetAllVidZanyat.FieldByName('CreateEnable').AsBoolean) and
         (dmUspevaemost.adospGetAllVidZanyat.FieldByName('IsDependent').AsBoolean)  then
      begin
          result:= true;
          break;
      end;
      dmUspevaemost.adospGetAllVidZanyat.Next;
    end;
  end;     }

end;


function TUspevGroupController.CanCreateDependVeds: boolean;
begin
  result:= false;
  if (dmUspevaemost.adospGetAllVidZanyat.Active) then
  begin
    dmUspevaemost.adospGetAllVidZanyat.First;
    while (not dmUspevaemost.adospGetAllVidZanyat.Eof) do
    begin
      //если есть хотя бы 1 вид занятий, по которому
      //еще не созданы ведомости, но это можно сделать,
      //и этот вид занятий зависит от других
      if (not dmUspevaemost.adospGetAllVidZanyat.FieldByName('IsCreated').AsBoolean) and
         (dmUspevaemost.adospGetAllVidZanyat.FieldByName('CreateEnable').AsBoolean) and
         (dmUspevaemost.adospGetAllVidZanyat.FieldByName('IsDependent').AsBoolean)  then
      begin
          result:= true;
          break;
      end;
      dmUspevaemost.adospGetAllVidZanyat.Next;
    end;
  end;
end;

function TUspevGroupController.CanCreateIndependVeds(nSem, ik_group: integer): boolean;
begin

  if (dmUspevaemost.adospGetAllVidZanyat.Active) then
    result:= not CanUpdateVedsList(nSem, ik_group)
  else
    result:= false;
end;

function TUspevGroupController.CanCreateVeds(nSem, ik_group: integer): boolean;
begin
  result:= CanCreateDependVeds or
        CanCreateIndependVeds(nSem, ik_group);
end;

function TUspevGroupController.GetEnableVidZanyats(nSem, ik_group, ikVidZan: integer): string;
begin
  result:='';
  //загружаем список зависимых видов занятий
  GetDependVidZanyats(nSem, ik_group, IkVidZan);
  dmUspevaemost.adospUspevDependVidZanyat.First;
  while not dmUspevaemost.adospUspevDependVidZanyat.Eof do
  begin
    if result='' then
      result:='"'+dmUspevaemost.adospUspevDependVidZanyat.FieldByName('cName_vid_zanyat').AsString+'"'
    else
      result:=', "'+dmUspevaemost.adospUspevDependVidZanyat.FieldByName('cName_vid_zanyat').AsString+'"';
    dmUspevaemost.adospUspevDependVidZanyat.Next;
  end;
  dmUspevaemost.adospUspevDependVidZanyat.Close;
  if result<>'' then
  begin   //можно создавать экзаменационные
    if dmUspevaemost.adospGetAllVidZanyat.Active then
      if dmUspevaemost.adospGetAllVidZanyat.Locate('ik_vid_zanyat', ikVidZan, []) then
      begin
        result:='Закрыты все ведомости "'+
              dmUspevaemost.adospGetAllVidZanyat.FieldByName('cName_vid_zanyat').AsString+
              '". Теперь можно создать ведомости '+result;
      end;
  end;
end;

//проверяет есть ли предметы вообще в учебном плане
function TUspevGroupController.ArePredmsInUchPlan(nSem, ik_group: integer): boolean;
begin

//если есть виды занятий
  if (dmUspevaemost.adospGetAllVidZanyat.Active) and
     (dmUspevaemost.adospGetAllVidZanyat.RecordCount>0) then
    result:=true
  else
    result:=false;
end;
 function TUspevGroupController.BuildSpravka2014(_ikStudGrup, _type_spr: integer):TReportBase;
   var report:TSpravka_Report;
   result_report:TSpravka;
  FindRange: Variant;
 begin
   report:= TSpravka_Report.Create(_ikStudGrup, _type_spr);
   result_report:=report.AddReport();
   Result := SpravkaReport.Create(result_report);

      if (_type_spr=1) then
          begin
          Result.ReportTemplate:=ExtractFilePath(Application.ExeName)+'reports\SprvPens.xlt';
          end
      else
          begin
          Result.ReportTemplate:=ExtractFilePath(Application.ExeName)+'reports\Sprv.xlt';
          end;

  report.Free;
 end;

function TUspevGroupController.BuildVedomost2014(ikGrup, nSem, ikVed, ikFac,
  ikSpec: integer): TReportBase;
  var report:TAssemly_Report;
   result_report:TVedomost;
  FindRange: Variant;
begin

   report:= TAssemly_Report.Create(ikVed);
   result_report:=report.AddReport();
   Result := TBRS2014VedomostReport.Create(result_report);
   if (result_report.ik_vid_zan<>GOS_EXAM)  then
      begin
      if (result_report.Is_brs) then
          begin
          Result.ReportTemplate:=ExtractFilePath(Application.ExeName)+'reports\Vedomost_with_BRS.xlt';
          end
      else
          begin
          Result.ReportTemplate:=ExtractFilePath(Application.ExeName)+'reports\Vedomost_No_BRS.xlt';
          end;
      end
    else
      begin
      Result.ReportTemplate:=ExtractFilePath(Application.ExeName)+'reports\GOS_ekz.xlt';
      end;
  report.Free;

end;

//проверяет, можно ли обновить список созданных ведомости
function TUspevGroupController.CanUpdateVedsList(nSem, ik_group: integer): boolean;
begin
  result:= false;
  if (dmUspevaemost.adospGetAllVidZanyat.Active) then
  begin
    dmUspevaemost.adospGetAllVidZanyat.First;
    while (not dmUspevaemost.adospGetAllVidZanyat.Eof) do
    begin
      //если создана хотя бы 1 ведомость (хотя бы по 1 виду занятий),
      //то можем создавать ведомости
      if (dmUspevaemost.adospGetAllVidZanyat.FieldByName('IsCreated').AsBoolean) then
      begin
          result:= true;
          break;
      end;
      dmUspevaemost.adospGetAllVidZanyat.Next;
    end;
  end;
end;


//Создает все недостающие по уч. плану ведомости
//для всего семестра
procedure TUspevGroupController.UpdateVedsList(nSem, ik_group: integer);
var
  tempStoredProc: TADOStoredProc;
begin
  //если можем обновить ведомости
  if CanUpdateVedsList(nSem, ik_group) then
  begin
	  tempStoredProc:= TADOStoredProc.Create(nil);
	  try
			tempStoredProc.ProcedureName:= 'UspevCreateAllVedsForSemestr;1';
			tempStoredProc.Connection:= dm.DBConnect;
			with tempStoredProc.Parameters do
			begin
			  Clear;
			  CreateParameter('@nSem', ftInteger, pdInput, 0, nSem);
			  CreateParameter('@ik_grup', ftInteger, pdInput, 0, ik_group);
			end;
			tempStoredProc.ExecProc;
	  finally
		  tempStoredProc.Free;
	  end;
  end;
end;


//Загружает список уже созданных ведомостей при смене семестра,
//создает недостающие по уч. плану
//возвращает истина, если в уч. плане есть дисциплины
function TUspevGroupController.GetListOfVeds(nSem, ik_group, fac_ik: integer; var countPredms: integer): integer;
begin

    with FVedomostController do
    begin
      Reload(ik_group, nSem);           //загружаем данные по данному семестру и группе
      countPredms := ContentCount;      //считаем, сколько вообще есть видов сдачи
      Result := VedomCount;             //сколько по ним создано ведомостей


      if (Result>0)and(countPredms > Result) then   //если ведомости созданы, но не все
      begin
        CreateAllVed;         //создаем оставшиеся ведомости
        Result := VedomCount; //чисто теоретически теперь Result = countPredms
      end;
    end;


    //загружаем список всех видов занятий со всей необх инфой
   { GetAllVidZanyats(nSem, ik_group);
    //проверяем, есть ли вообще какие-то предметы в уч плане
    HavePredms:= ArePredmsInUchPlan(nSem, ik_group);
    // выборка всех СУЩЕСТВУЮЩИХ ведомостей
    GetAllVeds(nSem, ik_group);
    if HavePredms then
    begin
      //если хотя бы одна ведомость была создана, обновляем их
      if (dmUspevaemost.adospGetAllVeds4Group.RecordCount>0) then
      begin
        //сразу обновляем списки студентов в ведомостях
        //UpdateVedsContent(nSem, ik_group);
        //создаем все недостающие ведомости
        UpdateVedsList(nSem, ik_group);
        // выборка всех СУЩЕСТВУЮЩИХ ведомостей
	      GetAllVeds(nSem, ik_group);
        //снова загружаем список всех видов занятий со всей необх инфой
        GetAllVidZanyats(nSem, ik_group);
      end;
    end;    }
    //GetAllVeds(nSem, ik_group);
    //GetAllVidZanyats(nSem, ik_group);
end;

// читает заголовка ведомости
procedure TUspevGroupController.GetVedsHeader(ikVed: integer);
begin
    dmUspevaemost.adospSelVed.Close;
	  dmUspevaemost.adospSelVed.Fields.Clear;
	  with dmUspevaemost.adospSelVed.Parameters do
	  begin
		  Clear;
		//Код ведомости
		  AddParameter;
		  Items[0].Value := ikVed;
	  end;
	  dmUspevaemost.adospSelVed.Active := true;
end;

// читает данные (оценки) ведомости
function TUspevGroupController.SelectVed(ikVed: integer): TADODataSet;
begin
  try
    //Result:= TGeneralController.Instance.getDataSetValues(@dmUspevaemost.adospSelVedGroup, 'select * from GetSmallVedForGrup('+IntToStr(ikVed)+')', 'ik_zach', false, NULL);
    FVedomostController.Vedomost := ikVed;
    Result := FVedomostController.UspevDataSet;
  except
    on E:Exception do
    begin
      raise EApplicationException.Create('Произошла ошибка при загрузке ведомости.',E);
      Result := nil;
      exit;
    end;
  end;
end;

//Сохраняет данные ведомости (оценки)
procedure TUspevGroupController.ApplyUspev(ikVed, ikVidZan: integer; dbgrdVed: PDBGrid);
var
  FindRange: Variant;
begin
  //TApplicationController.GetInstance.AddLogEntry('Сохранение оценок и тем курсовых.');
  //FVedomostController.Save;
  {dmUspevaemost.adospSelVedGroup.DisableControls;
  try
    dmUspevaemost.adospSelVedGroup.First;
		while not dmUspevaemost.adospSelVedGroup.Eof do
		begin
      if (dbgrdVed.Fields[1].Value <> Null)and
				 (dbgrdVed.Fields[1].Text <> '') and
 //		   если это экзамен, то обязателен допуск
		      ((ikVidZan<>6) or ((ikVidZan=6) and
		      (dmUspevaemost.adospSelVedGroup.FieldByName('dopusc').Value=true))) then
       begin
			    with dmUspevaemost.adospAppendUspev.Parameters do
			    begin
            Clear;
            CreateParameter('@flag', ftInteger, pdInput, 0, 0);
            CreateParameter('@Ik_ved', ftInteger, pdInput, 0, ikVed);
            CreateParameter('@Ik_zach', ftInteger, pdInput, 0, dbgrdVed.Fields[5].Value);
            if (dbgrdVed.Fields[8].Value <> Null) then
              CreateParameter('@Cosenca', ftInteger, pdInput, 0, dbgrdVed.Fields[8].Value)
            else
              CreateParameter('@Cosenca', ftInteger, pdInput, 0, -1);
            CreateParameter('@cTema', ftString, pdInput, 2000, '');
            CreateParameter('@i_balls', ftInteger, pdInput, 0, dbgrdVed.Fields[7].Value)
          end;
          dmUspevaemost.adospAppendUspev.ExecProc;

          //if (dbgrdVed.Fields[4].AsString>'') then
					//begin
						with dmUspevaemost.adospAppendUspevKPTheme.Parameters do
						begin
							Clear;
							CreateParameter('@flag', ftInteger, pdInput, 0, 1);
							CreateParameter('@Ik_zach', ftInteger, pdInput, 0, dbgrdVed.Fields[5].Value);
							CreateParameter('@Ik_ved', ftInteger, pdInput, 0, ikVed);
							CreateParameter('@KPTheme', ftString, pdInput, 2000, dbgrdVed.Fields[4].AsString);
						end;
						dmUspevaemost.adospAppendUspevKPTheme.ExecProc;
					//end;

		  end;
		  dmUspevaemost.adospSelVedGroup.Next;
		end;
  finally
    dmUspevaemost.adospSelVedGroup.EnableControls;
  end;}
end;

//Сохраняет данные ведомости (шапку)
procedure TUspevGroupController.ApplyVed(VedNum:string; ikVidExam: integer;
  bitClose, bitNapr: boolean; ikPrepod: Variant; DateExam: TDateTime);
begin
  TApplicationController.GetInstance.AddLogEntry('Сохрание данных ведомости');

  FVedomostController.Save(ikVidExam,VedNum,ikPrepod,DateExam,bitClose,bitNapr);

	{  with dmUspevaemost.adospAppVed.Parameters do
	  begin
      Clear;
      CreateParameter('@flag', ftInteger, pdInput, 0, flag);
      CreateParameter('@cNumber_ved', ftString, pdInput, 12, VedNum);
      CreateParameter('@Ik_grup', ftInteger, pdInput, 0, ik_group);
      CreateParameter('@ik_vid_zanyat', ftInteger, pdInput, 0, ikVidZan);
      CreateParameter('@n_sem', ftInteger, pdInput, 0, nSem);
      CreateParameter('@ik_disc', ftInteger, pdInput, 0, ikPredm);
      CreateParameter('@Itab_n', ftString, pdInput, 50, ikPrepod);
      CreateParameter('@Ik_vid_exam', ftInteger, pdInput, 0, ikVidExam);
      CreateParameter('@Dd_exam', ftDateTime, pdInput, 0, DateExam);
      CreateParameter('@dD_vydano', ftDateTime, pdInput, 0, Date);
      CreateParameter('@lClose', ftBoolean, pdInput, 0, bitClose);
      CreateParameter('@lPriznak_napr', ftBoolean, pdInput, 0, bitNapr);
      CreateParameter('@Ik_ved', ftInteger, pdInput, 0, ikVed);
      CreateParameter('@lVnosn', ftBoolean, pdInput, 0, bitVnost);    // выносной экз
      CreateParameter('@ik_upContent', ftInteger, pdInput, 0, ik_upContent);
	  end;
	  dmUspevaemost.adospAppVed.ExecProc;             }
end;

//Открывает ведомость
function TUspevGroupController.OpenVed(ikVed: integer):boolean;
var
  tempStoredProc: TADOStoredProc;
begin
  Result:= false;
  TApplicationController.GetInstance.AddLogEntry('Открытие закрытой уже ведомости');
  try
    tempStoredProc:= TADOStoredProc.Create(nil);
    tempStoredProc.ProcedureName:= 'OpenVedomost;1';
    tempStoredProc.Connection:= dm.DBConnect;
    tempStoredProc.Parameters.CreateParameter('@Ik_ved', ftInteger, pdInput, 0, ikVed);
    tempStoredProc.ExecProc;
    Result:= true;
  finally
    tempStoredProc.Free;
  end;
end;

//Обновляет допуски в ведомости (шапку)
function TUspevGroupController.UpdateDopuskForVed(ikVed : integer):boolean;
begin
  try
    dmUspevaemost.adospUpdateDopusk.Active := false;
	  with dmUspevaemost.adospUpdateDopusk.Parameters do
    begin
      Clear;
      CreateParameter('@ik_ved', ftInteger, pdInput, 0, ikVed);
    end;

	  dmUspevaemost.adospUpdateDopusk.ExecProc;
    Result:= true;
  except
    Result:= false;
    exit;
  end;
end;

//SelContrlForVinVed выбирает список возможных ВИДОВ КОНТРОЛЯ
  //для создания выносных экзаменов
  //(выбирает только те, для кот-х не созданы ведомости)
function TUspevGroupController.SelContrlForVinVed(ik_group, nSem: integer):boolean;
begin
  try
	  dmUspevaemost.adosp4VinVed.Active := false;
	  with dmUspevaemost.adosp4VinVed.Parameters do
	  begin
		  Clear;
		  AddParameter;
		  Items[0].Value := ik_group;
		  AddParameter;
		  Items[1].Value := nSem;
	  end;
	  dmUspevaemost.adosp4VinVed.Active := true;
    Result:= true;
  except
    Result:= false;
    raise;
  end;
end;

//Выбирает все дисциплины, кот-е есть в уч. плане (для вида занятий)
function TUspevGroupController.GetContentDS(StudIK, ZachIK: integer): TADODataSet;
begin
  FNapravController.Reload(StudIK, ZachIK);
  Result := FNapravController.ContentDS;
end;

function TUspevGroupController.GetContrlVidZanForRaport(ik_group, nSem: integer):boolean;
begin
  try
	  dmUspevaemost.adospGetUpContRap.Close;
	  with dmUspevaemost.adospGetUpContRap.Parameters do
	  begin
      Clear;
      CreateParameter('@ik_group', ftInteger, pdInput, 0, ik_group);
      CreateParameter('@n_sem', ftInteger, pdInput, 0, nSem);
	  end;
	  dmUspevaemost.adospGetUpContRap.Open;
    Result:= true;
  except
    Result:= false;
    exit;
  end;
end;

//возвращает допуски к экзамену
function TUspevGroupController.GetDopusksList(SourceDataSet: PDataSet; ik_group, ik_upContent, dopusk: integer):boolean;
begin
  try
    TGeneralController.Instance.getDataSetValues(SourceDataSet, 'select * from GetDopuscForVedom('+IntToStr(ik_group)+', '+IntToStr(ik_upContent)+ ') where dopusc = '+IntToStr(dopusk)+ ' order by FIO', 'ik_zach', false, NULL);
    Result:= true;
  except
  on E:Exception do
  begin
    raise EApplicationException.Create('Произошла ошибка при загрузке списка допущенных студентов!',E);
    Result:= false;
    exit;
  end;
  end;
end;

//работает с рапортами о недопусках к экзамену
//(создает, редактирует, закрывает)
procedure TUspevGroupController.AppendRaports(flag, ik_zach, ik_upContent: integer; bitClose: boolean);
begin
    with dmUspevaemost.adospAppendRap.Parameters do
    begin
      Clear;
      CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 0, NULL);
      CreateParameter('@flag', ftInteger, pdInput, 0, flag);
      CreateParameter('@ik_zach', ftInteger, pdInput, 0, ik_zach);
      CreateParameter('@ik_upContent', ftInteger, pdInput, 0, ik_upContent);
      CreateParameter('@bitClose', ftBoolean, pdInput, 0, bitClose);
    end;
    dmUspevaemost.adospAppendRap.ExecProc;
    if (dmUspevaemost.adospAppendRap.Parameters.ParamByName('@RETURN_VALUE').Value<0) then
      raise EApplicationException.Create('Произошла ошибка при работе с рапортом.');
    

end;

//создает, закрывает, открывает рапорты
//согласно переданных списков и уже созданных рапортов
function TUspevGroupController.DoRaports(lv1, lv2, lvDop, lvNDop:TListView;
    ik_group, ik_upContent: integer):boolean;
var
  i: Integer;
  li: TListItem;
  SourceDataSet: TADODataSet;
begin
  TApplicationController.GetInstance.AddLogEntry('Создание рапорта о недопуске');
  try
    //загружаем список допущенных/недопущенных
    SourceDataSet:= TADODataSet.Create(nil);
    TGeneralController.Instance.getDataSetValues(@SourceDataSet, 'select * from GetDopuscForVedom('+IntToStr(ik_group)+', '+IntToStr(ik_upContent)+ ') order by FIO', 'ik_zach', false, NULL);
  except
    Result:= false;
    exit;
  end;
  try
    //выполняем все в одной транзакции
    dmUspevaemost.adospAppendRap.Connection.BeginTrans;
	  // создание нужных рапортов: проходим по списку недопущенных
	  for i := 0 to lvNDop.Items.Count-1 do
	  begin
		  li := lvNDop.Items[i];
      if SourceDataSet.Locate('ik_zach',StrToInt(li.SubItems[1]),[]) then
		  begin
        //создаем рапорт, если его еще нет   
        if not SourceDataSet.FieldByName('bitRaport').AsBoolean then
          AppendRaports(1, StrToInt(li.SubItems[1]), ik_upContent,false)
        //если рапорт уже создан, но закрыт, снова открываем его
        else
          if (SourceDataSet.FieldByName('dopusc').AsBoolean) then
            AppendRaports(0, StrToInt(li.SubItems[1]), ik_upContent,false);
	    end;
    end;
	  // закрытие рапортов: проходим по списку допущенных
	  for i := 0 to lvDop.Items.Count-1 do
	  begin
		  li := lvDop.Items[i];
		  if SourceDataSet.Locate('ik_zach',StrToInt(li.SubItems[1]),[]) then
      //если есть открытый рапорт, закрываем
        if (SourceDataSet.FieldByName('bitRaport').AsBoolean) and
           (not SourceDataSet.FieldByName('dopusc').AsBoolean)  then
          AppendRaports(0, StrToInt(li.SubItems[1]), ik_upContent,true);
	  end;
    dmUspevaemost.adospAppendRap.Connection.CommitTrans;
    Result:= true;
  except
    dmUspevaemost.adospAppendRap.Connection.RollbackTrans;
    Result:= false;
    exit;
  end;
end;





//Удаление ведомости
procedure TUspevGroupController.DelVed(ik_ved: variant);
var
  tempStoredProc: TADOStoredProc;
begin
  TApplicationController.GetInstance.AddLogEntry('Удаление ведомости');

  tempStoredProc:= TADOStoredProc.Create(nil);
  try
    tempStoredProc.ProcedureName:= 'DelVed;1';
    tempStoredProc.Connection:= dm.DBConnect;
    with tempStoredProc.Parameters do
    begin
      Clear;
      CreateParameter('@ik_ved', ftInteger, pdInput, 0, ik_ved);
    end;
    tempStoredProc.ExecProc;
  finally
    tempStoredProc.Free;
  end;
end;

destructor TUspevGroupController.Destroy;
begin
  FreeAndNil(FVedomostController);
  FreeAndNil(FNapravController);

  inherited;
end;

procedure IncExcelCell(var CellNumber: string);
var c: char;
begin
  c:= CellNumber[length(CellNumber)];
  if (c='Z') then
    CellNumber:= Copy(CellNumber, 1, length(CellNumber)-1)+'AA'
  else
  begin
    inc(c);
    CellNumber:= Copy(CellNumber, 1, length(CellNumber)-1)+ c;
  end;
  
end;


///////////Экспорт в Excel аттестаций///////////

 procedure TUspevGroupController.printAttestation(ikGrup, nSem, nAtt, ikFac: integer; date: string);
var E:Variant;
  str,prop,uvag:string;
  nved:integer;
  count:integer;
  //stroka,
  stolb:string;
  //fl:boolean;
  i: Integer;
begin

 try
  E := CreateOleObject('Excel.Application');
  str := ExtractFilePath(Application.ExeName)+'reports\Attest.XLT';
  E.WorkBooks.Add(str);
  //E.Visible := true;


  E.Sheets[1].Select;
  E.sheets.Add(after:=E.sheets.item[1]);
  E.Sheets[2].PageSetup.Orientation:=2;
  E.Sheets[2].name:='Аттестация';
          
  E.Sheets[1].Range['A1:A2'].Copy;
  E.Sheets[2].Range['A1:A2'].Insert;

  dmUgtuStructure.adoqSpecFac.Open;
  dmUgtuStructure.adoqSpecFac.Filter:='';
  if dmUgtuStructure.adoqSpecFac.Locate('ik_fac',ikfac,[loCaseInsensitive]) then
  begin
     str:=dmUgtuStructure.adoqSpecFacCname_fac.AsString;
     E.Sheets[2].Range['A1'].Value:=str+'.  Аттестация  '+ date;
  end;

  dmUgtuStructure.adoqSelAllGroups.Open;
  dmUgtuStructure.adoqSelAllGroups.Filter:='';
  if dmUgtuStructure.adoqSelAllGroups.Locate('ik_grup',ikgrup,[loCaseInsensitive]) then
  begin
     str:=dmUgtuStructure.adoqSelAllGroups.FieldByName('cname_grup').AsString;
     E.Sheets[2].Range['A2'].Value:='Группа  '+str;
  end;


  dmUspevaemost.adospGetAllAtt.Active := false;
    with dmUspevaemost.adospGetAllAtt.Parameters do
    begin
      Clear;
      AddParameter;
      Items[0].Value := ikGrup;
      AddParameter;
      Items[1].Value := nSem;
      AddParameter;
      Items[2].Value := nAtt;
    end;
  dmUspevaemost.adospGetAllAtt.ExecProc;
  dmUspevaemost.adospGetAllAtt.Active := true;

  E.Sheets[1].Range['A3:B7'].Copy;
  E.Sheets[2].Range['A3:B7'].Insert;

  stolb:='C';

  dmUspevaemost.adospGetAllAtt.first;

  nved:= dmUspevaemost.adospGetAllAtt.FieldByName('ik_ved').asinteger;

  dmUspevaemost.adodsSelAttGroup.Active := false;
  dmUspevaemost.adodsSelAttGroup.CommandText := 'select * from GetSmallAttForGrup('+IntToStr(nVed)+')';
  dmUspevaemost.adodsSelAttGroup.Active := true;

  count:=dmUspevaemost.adodsSelAttGroup.RecordCount;

  str:=stolb;
  While not dmUspevaemost.adospGetAllAtt.Eof do
  begin
    E.Sheets[1].Range['C3:D7'].Copy;

    str:=stolb;
    IncExcelCell(stolb);
    E.Sheets[2].Range[str+'3'].Insert;
    E.Sheets[2].Range[str+'4']:= dmUspevaemost.adospGetAllAtt.FieldByName('cname_disc').AsString;
    str:=stolb;
    IncExcelCell(stolb);
    dmUspevaemost.adospGetAllAtt.Next;
  end;

  E.Sheets[2].Range['C3:'+str+'3'].MergeCells:=true;
  E.Sheets[2].Range['C3:'+str+'3'].Value:='Дисциплины';

  str:=stolb;
  IncExcelCell(stolb);

  E.Sheets[1].Range['E3:F6'].Copy;
  E.Sheets[2].Range[str+'3'].Insert;

  for i := 1 to Count-1 do
  begin
    E.Sheets[2].Range['A6:'+(stolb)+'6'].Copy;
    E.Sheets[2].Range['A'+inttostr(i+6)].Insert;
  end;

  //E.Sheets[1].Range['A7:D7'].Copy;
  //E.Sheets[2].Range['A'+inttostr(count+6)+':D'+inttostr(count+6)].Insert;

  dmUspevaemost.adodsSelAttGroup.first;
  i:=1;
  While not dmUspevaemost.adodsSelAttGroup.Eof do
  begin
    E.Sheets[2].Range['A'+inttostr(5+i)].Value:=inttostr(i);
    E.Sheets[2].Range['B'+inttostr(5+i)].Value:= dmUspevaemost.adodsSelAttGroup.FieldByName('StudName').AsString +
          '   '+dmUspevaemost.adodsSelAttGroup.FieldByName('KatZach').AsString;

    inc(i);
    dmUspevaemost.adodsSelAttGroup.next;
  end;


  dmUspevaemost.adospGetAllAtt.first;
  stolb:='C';

  While not dmUspevaemost.adospGetAllAtt.Eof do
  begin
  i:=1;
  str:=stolb;
  IncExcelCell(stolb);
  nved:= dmUspevaemost.adospGetAllAtt.FieldByName('ik_ved').asinteger;

  dmUspevaemost.adodsSelAttGroup.Active := false;
  dmUspevaemost.adodsSelAttGroup.CommandText := 'select * from GetSmallAttForGrup('+IntToStr(nVed)+')';
  dmUspevaemost.adodsSelAttGroup.Active := true;

  count:=dmUspevaemost.adodsSelAttGroup.RecordCount;

  While not dmUspevaemost.adodsSelAttGroup.Eof do
    begin
      if dmUspevaemost.adodsSelAttGroup.FieldByName('cosenca').value=1 then
        E.Sheets[2].Range[str+inttostr(5+i)].Value:='Да'
      else
        E.Sheets[2].Range[str+inttostr(5+i)].Value:='Нет';

      if dmUspevaemost.adodsSelAttGroup.FieldByName('propcount').value = NULL  then
        prop:= '-'
      else
        prop:= dmUspevaemost.adodsSelAttGroup.FieldByName('propcount').AsString;

      if dmUspevaemost.adodsSelAttGroup.FieldByName('uvag_propcount').value = NULL  then
        uvag:= '-'
      else
        uvag:= dmUspevaemost.adodsSelAttGroup.FieldByName('uvag_propcount').AsString;

      E.Sheets[2].Range[(stolb)+inttostr(5+i)].Value:=uvag+'/'+prop;

      if uvag<> '-' then
        E.Sheets[1].Range['a'+inttostr(55+i)].Value:=E.Sheets[1].Range['a'+inttostr(55+i)].Value+strtoint(uvag);

      if prop<> '-' then
        E.Sheets[1].Range['b'+inttostr(55+i)].Value:=E.Sheets[1].Range['b'+inttostr(55+i)].Value+strtoint(prop);

      inc(i);
      dmUspevaemost.adodsSelAttGroup.next;
    end;

    IncExcelCell(stolb);
    dmUspevaemost.adospGetAllAtt.Next;
  end;

  i:=1;

  dmUspevaemost.adodsSelAttGroup.First;
  While not dmUspevaemost.adodsSelAttGroup.Eof do
    begin
    E.Sheets[2].Range[(stolb)+inttostr(5+i)].Value:=
      inttostr(E.Sheets[1].Range['a'+inttostr(55+i)].Value)+'/'+inttostr(E.Sheets[1].Range['b'+inttostr(55+i)].Value);

    inc(i);
    dmUspevaemost.adodsSelAttGroup.next;
    end;

  E.Sheets[1].Range['A8:A12'].Copy;
  E.Sheets[2].Range['A'+inttostr(count+7)+':A'+inttostr(count+7)].Insert;

  E.Sheets[2].Range['A4'].RowHeight:=24;
  E.Sheets[2].Range['A'+inttostr(count+6)].RowHeight:=19.5;


  E.Sheets[2].Range['A1'].ColumnWidth:=2.43;
  E.Sheets[2].Range['B1'].ColumnWidth:=17.86;

  str:=stolb;
  stolb:='C';
  while str>stolb do
  begin
    E.Sheets[2].Range[(stolb)+'1'].ColumnWidth:=6.43;
    IncExcelCell(stolb);
  end;

  E.Sheets[2].Range[(stolb)+'1'].ColumnWidth:=13.57;
  IncExcelCell(stolb);
  E.Sheets[2].Range[(stolb)+'1'].ColumnWidth:=10;

  E.Sheets[2].PageSetup.LeftMargin:=29;
  E.Sheets[2].PageSetup.RightMargin:=29;
  E.Sheets[2].PageSetup.TopMargin:=34;
  E.Sheets[2].PageSetup.BottomMargin:=29;
  E.Sheets[2].PageSetup.Order:=2;

  E.DisplayAlerts:=false;
  E.Sheets[1].Delete;
  E.DisplayAlerts:=true;

  //E.Sheets[1].PageSetup.LeftFooter:='&5' + TApplicationController.GetInstance.DocumentFooter;
  E.Visible := true;

 except
 on Ex:Exception do
 begin
    E.Quit;
    E:= UnAssigned;
    raise EApplicationException.Create('Произошла ошибка при экспорте ведомости.',Ex);
    exit;
 end;
  end;

end;


///////////Экспорт в Excel бланка аттестации///////////

procedure TUspevGroupController.PrintBlankAttestation(ikGrup, nSem, nAtt, ikFac: integer; date: string);
var E:Variant;
  str:string;
  nved:integer;
  count:integer;
  //stroka,
  stolb:string;
  //fl:boolean;
  i: Integer;
begin

 try
  E := CreateOleObject('Excel.Application');
  str := ExtractFilePath(Application.ExeName)+'reports\Attest.XLT';
  E.WorkBooks.Add(str);
  //E.Visible := true;


  E.Sheets[1].Select;
  E.sheets.Add(after:=E.sheets.item[1]);
  E.Sheets[2].PageSetup.Orientation:=2;
  E.Sheets[2].name:='Аттестация';

  E.Sheets[1].Range['A1:A2'].Copy;
  E.Sheets[2].Range['A1:A2'].Insert;

  dmUgtuStructure.adoqSpecFac.Open;
  dmUgtuStructure.adoqSpecFac.Filter:='';
  if dmUgtuStructure.adoqSpecFac.Locate('ik_fac',ikfac,[loCaseInsensitive]) then
  begin
     str:=dmUgtuStructure.adoqSpecFacCname_fac.AsString;
     E.Sheets[2].Range['A1'].Value:=str+'.  Аттестация  '+ date;
  end;

  dmUgtuStructure.adoqSelAllGroups.Open;
  dmUgtuStructure.adoqSelAllGroups.Filter:='';
  if dmUgtuStructure.adoqSelAllGroups.Locate('ik_grup',ikgrup,[loCaseInsensitive]) then
  begin
     str:=dmUgtuStructure.adoqSelAllGroups.FieldByName('cname_grup').AsString;
     E.Sheets[2].Range['A2'].Value:='Группа  '+str;

  end;


  dmUspevaemost.adospGetAllAtt.Active := false;
    with dmUspevaemost.adospGetAllAtt.Parameters do
    begin
      Clear;
      AddParameter;
      Items[0].Value := ikGrup;
      AddParameter;
      Items[1].Value := nSem;
      AddParameter;
      Items[2].Value := nAtt;
    end;
  dmUspevaemost.adospGetAllAtt.ExecProc;
  dmUspevaemost.adospGetAllAtt.Active := true;
  
  E.Sheets[1].Range['A3:B7'].Copy;
  E.Sheets[2].Range['A3:B7'].Insert;

  stolb:='C';

  dmUspevaemost.adospGetAllAtt.first;

  nved:= dmUspevaemost.adospGetAllAtt.FieldByName('ik_ved').asinteger;

  dmUspevaemost.adodsSelAttGroup.Active := false;
  dmUspevaemost.adodsSelAttGroup.CommandText := 'select * from GetSmallAttForGrup('+IntToStr(nVed)+')';
  dmUspevaemost.adodsSelAttGroup.Active := true;

  count:=dmUspevaemost.adodsSelAttGroup.RecordCount;

  While not dmUspevaemost.adospGetAllAtt.Eof do
  begin
    E.Sheets[1].Range['C3:D7'].Copy;

    str:=stolb;
    IncExcelCell(stolb);
    E.Sheets[2].Range[str+'3:'+stolb+'7'].Insert;
    E.Sheets[2].Range[str+'4']:= dmUspevaemost.adospGetAllAtt.FieldByName('cname_disc').AsString;
    str:=stolb;
    IncExcelCell(stolb);
    dmUspevaemost.adospGetAllAtt.Next;
  end;

  E.Sheets[2].Range['C3:'+str+'3'].MergeCells:=true;
  E.Sheets[2].Range['C3:'+str+'3'].Value:='Дисциплины';

  str:=stolb;
  IncExcelCell(stolb);

  E.Sheets[1].Range['E3:F6'].Copy;
  E.Sheets[2].Range[str+'3:'+stolb+'6'].Insert;

  for i := 1 to Count-1 do
  begin
    E.Sheets[2].Range['A6:'+stolb+'6'].Copy;
    E.Sheets[2].Range['A'+inttostr(i+6)+':'+stolb+inttostr(i+6)].Insert;
  end;

  //E.Sheets[1].Range['A7:D7'].Copy;
  //E.Sheets[2].Range['A'+inttostr(count+6)+':D'+inttostr(count+6)].Insert;

  dmUspevaemost.adodsSelAttGroup.first;
  i:=1;
  While not dmUspevaemost.adodsSelAttGroup.Eof do
  begin
    E.Sheets[2].Range['A'+inttostr(5+i)].Value:=inttostr(i);
    E.Sheets[2].Range['B'+inttostr(5+i)].Value:= dmUspevaemost.adodsSelAttGroup.FieldByName('StudName').AsString +
          '   '+dmUspevaemost.adodsSelAttGroup.FieldByName('KatZach').AsString;

    inc(i);
    dmUspevaemost.adodsSelAttGroup.next;
  end;

  E.Sheets[1].Range['A8:A12'].Copy;
  E.Sheets[2].Range['A'+inttostr(count+7)+':A'+inttostr(count+7)].Insert;

  E.Sheets[2].Range['A4'].RowHeight:=24;
  E.Sheets[2].Range['A'+inttostr(count+6)].RowHeight:=19.5;


  E.Sheets[2].Range['A1'].ColumnWidth:=2.43;
  E.Sheets[2].Range['B1'].ColumnWidth:=17.86;

  stolb:='C';
  while str>stolb do
  begin
    E.Sheets[2].Range[stolb+'1'].ColumnWidth:=6.43;
    IncExcelCell(stolb);
  end;

  E.Sheets[2].Range[stolb+'1'].ColumnWidth:=13.57;
  IncExcelCell(stolb);
  E.Sheets[2].Range[stolb+'1'].ColumnWidth:=10;

  E.Sheets[2].PageSetup.LeftMargin:=29;
  E.Sheets[2].PageSetup.RightMargin:=29;
  E.Sheets[2].PageSetup.TopMargin:=34;
  E.Sheets[2].PageSetup.BottomMargin:=29;
  E.Sheets[2].PageSetup.Order:=2;

  E.DisplayAlerts:=false;
  E.Sheets[1].Delete;
  E.DisplayAlerts:=true;

  //E.Sheets[1].PageSetup.LeftFooter:='&5' + TApplicationController.GetInstance.DocumentFooter;
  E.Visible := true;

 except
 on Ex:Exception do
 begin
    E.Quit;
    E:= UnAssigned;
    raise EApplicationException.Create('Произошла ошибка при экспорте бланка аттестации.',Ex);
    exit;
 end;
 end;

end;





//**********ЭКСПОРТ В EXCEL ВЕДОМОСТЕЙ************
// генерирует отчёт ведомости (с оценками)
procedure TUspevGroupController.printVed(ikGrup, nSem, ikVed, ikFac, ikSpec: integer);
var VedList:TADOStoredProc;
begin
  TApplicationController.GetInstance.AddLogEntry('Ведомость. Экспорт в Excel ведомости');

  VedList:= GetAllVedomosts(ikGrup, nSem);

  //применяем фильтр, чтобы выводить только 1 ведомость
  VedList.Filter:= 'Ik_ved='+IntToStr(ikVed);
  VedList.Filtered:= true;
  PrintVedomost(VedList,ikGrup,nSem,ikFac, ikSpec, true);
end;

//генерирует все бланки ведомостей (без оценок)
procedure TUspevGroupController.printAllVedomost(ikGrup, nSem, ikFac, ikSpec: integer);
var
  VedList: TADOStoredProc;
begin

  TApplicationController.GetInstance.AddLogEntry('Ведомость. Экспорт в Excel всех ведомостей');

  VedList:= GetAllVedomosts(ikGrup, nSem);

  PrintVedomost(VedList,ikGrup,nSem,ikFac, ikSpec, true);

end;



//************ЭКСПОРТ В EXCEL ВЕДОМОСТЕЙ******************
//Выборка списка всех созданных в семестре ведомостей
function TUspevGroupController.GetAllVedomosts(ikGrup, nSem: integer):TADOStoredProc;
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TADOStoredProc.Create(nil);
  try
    tempStoredProc.ProcedureName:= 'GetAllVedomostsForGrupWithBRS;1';
    tempStoredProc.Connection:= dm.DBConnect;
    tempStoredProc.Parameters.CreateParameter('@ik_group', ftInteger, pdInput, 0, ikGrup);
    tempStoredProc.Parameters.CreateParameter('@n_sem', ftInteger, pdInput, 0, nSem);
    tempStoredProc.Open;
    Result:= tempStoredProc;
  except
  on E:Exception do
  begin
    tempStoredProc.Free;
    raise EApplicationException.Create('Произошла ошибка при загрузке списка созданных ведомостей.',E);
  end;
  end;
end;


//Выборка заголовка ведомости
function TUspevGroupController.GetVedomsShapca(ik_ved: integer):boolean;
begin
  try
	  dmUspevaemost.adospVedTop.Close;
	  with dmUspevaemost.adospVedTop.Parameters do
	  begin
      Clear;
      CreateParameter('@ik_ved', ftInteger, pdInput, 0, ik_ved);
	  end;
	  dmUspevaemost.adospVedTop.Open;
    Result:= true;
  except
    Result:= false;
    exit;
  end;
end;

//Выборка результаты ведомости (кол-ва 3,4,5)


function TUspevGroupController.GetVedomostController: TVedomostController;
begin

end;

procedure TUspevGroupController.GetVedomsBottom(ik_ved, iK_vid_zanyat: integer);
begin
	  dmUspevaemost.adospSelVedBottom.Close;
	  with dmUspevaemost.adospSelVedBottom.Parameters do
	  begin
      Clear;
      CreateParameter('@iK_vid_zanyat', ftInteger, pdInput, 0, iK_vid_zanyat);
      CreateParameter('@ik_ved', ftInteger, pdInput, 0, ik_ved);
	  end;
	  dmUspevaemost.adospSelVedBottom.Open;
end;

function TUspevGroupController.GetVedomSet: TADODataSet;
begin
  Result := FVedomostController.DataSet;
end;

//Выбирает cодержимое ведомости с допусками
function TUspevGroupController.GetVedomsOsenciWithDopusk(ik_ved: integer):TADOStoredProc;
begin
  Result := TADOStoredProc.Create(nil);
  Result.Connection := dm.DBConnect;
  Result.ProcedureName := 'UspevSelVedWithDopusk;1';
  Result.Parameters.CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 4, NULL);
  Result.Parameters.CreateParameter('@ik_ved', ftInteger, pdInput, 4, ik_ved);
  Result.Open;
end;

//Выбирает cодержимое ведомости без допусков (зачет, КП, КР)
function TUspevGroupController.GetVedomsOsenciWithoutDopusk(ik_ved: integer):TADOStoredProc;
begin
  Result := TADOStoredProc.Create(nil);
  Result.Connection := dm.DBConnect;
  Result.ProcedureName := 'UspevSelVedWithoutDopusk;1';
  Result.Parameters.CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 4, NULL);
  Result.Parameters.CreateParameter('@ik_ved', ftInteger, pdInput, 4, ik_ved);
  Result.Open;
end;

//Выбирает cодержимое ведомости
function TUspevGroupController.GetVedomsOsenci(ik_ved: integer;hasDopusk:boolean):TADOStoredProc;
begin
  if hasDopusk then   //с допуском
    Result := GetVedomsOsenciWithDopusk(ik_ved)
  else                //без допуска
    Result := GetVedomsOsenciWithoutDopusk(ik_ved);
end;

//Выводит шапку ведомости в Excel
procedure TUspevGroupController.ExportVedsShapka(mainSheet, next, ikGrup, nSem, ikVed, ikFac, ikSpec, ikVidZan, Count, firstStr, firstStrKP: integer; E:Variant; HasTema, withOsenca:boolean; VedName, VidZanShortName: string);
const mag=18; //магистратура
var
  str:string;
  FindRange:Variant;
  //stroka:char;
  //fl:boolean;
  i: Integer;
  spec:string;
begin

    //нaстраиваем первую страницу
  E.Sheets[next].Select;

  FindRange := E.Cells.Replace(What := '#VedName#',Replacement:=VedName);

  spec:= 'Специальность ';

  if ikFac=mag then
    spec:= 'Направление ';

	  dmUgtuStructure.adoqSpecFac.Open;
	  dmUgtuStructure.adoqSpecFac.Filter:='';
	  if dmUgtuStructure.adoqSpecFac.Locate('ik_fac',ikfac,[loCaseInsensitive]) then
	  begin
		 str:=dmUgtuStructure.adoqSpecFacCname_fac.AsString;
     FindRange := E.Cells.Replace(What := '#facName#',Replacement:=str);
	  end;

    dmUgtuStructure.adoqSpec.Open;
	  dmUgtuStructure.adoqSpec.Filter:='';
	  if dmUgtuStructure.adoqSpec.Locate('ik_Spec',ikSpec,[loCaseInsensitive]) then
	  begin
		 str:=spec + dmUgtuStructure.adoqSpec.FieldByName('Cshort_spec').AsString
     + ' ' + dmUgtuStructure.adoqSpec.FieldByName('sh_spec').AsString;
     FindRange := E.Cells.Replace(What := '#specName#',Replacement:=str);
	  end;

	  dmUgtuStructure.adoqSelAllGroups.Open;
	  dmUgtuStructure.adoqSelAllGroups.Filter:='';
	  if dmUgtuStructure.adoqSelAllGroups.Locate('ik_grup',ikgrup,[loCaseInsensitive]) then
	  begin
		 str:='Группа: '+dmUgtuStructure.adoqSelAllGroups.FieldByName('cname_grup').AsString;
		 FindRange := E.Cells.Replace(What := '#groupName#',Replacement:=str);
	  end;

	  //вывод семестра
    str:= 'Семестр: '+inttostr(nsem);
    FindRange := E.Cells.Replace(What := '#nSem#',Replacement:=str);

	  //вывод дисциплины
	  //dmUspevaemost.adospVedTop
	  str:='Дисциплина          '+
      dmUspevaemost.adospVedTop.FieldByName('cName_disc').AsString;
	  FindRange := E.Cells.Replace(What := '#Discpl#',Replacement:=str);

    str:='Общее количество часов       '+
      dmUspevaemost.adospVedTop.FieldByName('iHour_gos').AsString;
	  FindRange := E.Cells.Replace(What := '#HourCount#',Replacement:=str);

	  //вывод экзаменатора adospVedTop
	  str:='Экзаменатор      '+
      dmUspevaemost.adospVedTop.FieldByName('NamePrepod').AsString;
	  FindRange := E.Cells.Replace(What := '#PrepName#',Replacement:=str);

	  //вывод даты, если выводить оценки
    if withOsenca then
	    str:='Дата  '+dmUspevaemost.adospVedTop.FieldByName('Dd_exam').AsString
    else
	    str:='Дата                        ';
    FindRange := E.Cells.Replace(What := '#DateExam#',Replacement:=str);

    //копируем строчки в ведомость - нужное кол-во
    for i := 1 to Count do
	  begin
		  E.Sheets[mainSheet].Range['A'+IntToStr(firstStr+1)+':H'+IntToStr(firstStr+1)].Copy;
		  E.Sheets[next].Range['A'+inttostr(i+firstStr)+':H'+inttostr(i+firstStr)].Insert;
	  end;


  //настраиваем вторую страницу (для КП и КР)
  if HasTema then
  begin
    E.Sheets[next+1].Select;

    str:='Приложение к ведомости на '+VidZanShortName+' №' + dmUspevaemost.adospVedTop.FieldByName('cNumber_Ved').AsString;
    FindRange := E.Cells.Replace(What := '#PrilName#',Replacement:=str);


    str:='Группа: '+dmUgtuStructure.adoqSelAllGroups.FieldByName('cname_grup').AsString;
    FindRange := E.Cells.Replace(What := '#groupName#',Replacement:=str);

    str:='Дисциплина         '+
      dmUspevaemost.adospVedTop.FieldByName('cName_disc').AsString;
	  FindRange := E.Cells.Replace(What := '#Discpl#',Replacement:=str);

    str:='Общее количество часов       '+
      dmUspevaemost.adospVedTop.FieldByName('iHour_gos').AsString;
	  FindRange := E.Cells.Replace(What := '#HourCount#',Replacement:=str);
    //копируем строчки в приложение - нужное кол-во
    for i := 1 to Count do
	  begin
		  E.Sheets[mainSheet].Range['A'+IntToStr(27)+':H'+IntToStr(27)].Copy;
		  E.Sheets[next+1].Range['A'+inttostr(i+firstStrKP)+':H'+inttostr(i+firstStrKP)].Insert;
	  end;
    E.Sheets[next+1].Range['A'+inttostr(firstStrKP)+':H'+inttostr(Count+firstStrKP)].RowHeight:=30;
  end;


end;

function TUspevGroupController.GetNapravDS: TADODataSet;
begin

  result := FNapravController.DataSet;
end;

function TUspevGroupController.GetNextSubStr(var str:string):string;
const
  divider:set of char = [' ',',','.',';',':','/','\','&','<','<','*','-'];    //множество разделителей
  StartStrPosition: integer = 1;    //номер буквы, с которого начинаем обход строки
var strCurPosition: integer;        //текущий номер буквы в строке
begin
  strCurPosition:= StartStrPosition;
  while (strCurPosition <= length(str)) and (not (str[strCurPosition] in divider)) do
  begin
    inc(strCurPosition);
  end;

  result:= copy(str, StartStrPosition, strCurPosition-1);

  if (strCurPosition > length(str)) then
    strCurPosition:= length(str);

  delete(str, StartStrPosition, strCurPosition);
end;

//возвращает название страницы Excel
function TUspevGroupController.GetPagename(VidZanShortName: string; prevName: string): string;
var pageName: string;
  delCount: integer;
  discName: string;
begin
  discName:= dmUspevaemost.adospVedTop.FieldByName('cName_disc').AsString;
  pageName:= VidZanShortName + GetNextSubStr(discName);
  while (discName<>'') and (prevName<>'') and (pos(pageName,prevName)>0) do
  begin
    pageName:=pageName + GetNextSubStr(discName);
  end;
  if (length(pageName)>31) then
    delete(pageName,32,length(pageName));

  //чтобы минимизировать вероятность совпадения названий почти до 0
  //удалим сгенерированное кол-во букв
  if (prevName=pageName) then
  begin
    randomize();
    delCount:= random(5);
    delete(pageName, length(pageName)-delCount, delCount);
  end;

  result:= pageName;
end;

//настройка следующего листа (для КП - двух следующих)
function TUspevGroupController.AddNapr(VidExID: integer; dateIn,
  dateOut: TDateTime; NaprNum, VidName: string): integer;
var vedIK: integer;
begin
  TApplicationController.GetInstance.AddLogEntry('Добавление направления');
  case FNapravController.AddNapr(VidExID, dateIn, dateOut, NaprNum, vedIK) of
    1:
    begin
      ShowMessage('Вид направления "'+VidName+'" на студента уже выдавался');
      Result :=0;
    end;
    else Result := vedIK;
  end;

end;

procedure TUspevGroupController.AddPageVedomost(var mainSheet, next:integer;firstStr:integer; E:Variant; HasTema:boolean; VidZanShortName: string);
var
  prevSheetName: string;    //название предыдущей страницы Excel
  currentSheetName: string;    //название текущей (создаваемой) страницы Excel
begin
  next:= 3;    //номер слeдующей страницы (текущей добавляемой)
  //если это КП или КР, то копируем 2-ю страницу
  if HasTema then
    mainSheet:= 2
  else     //иначе - первую
    mainSheet:= 1;

  E.sheets.Add(after:=E.sheets.item[next-1]);

  E.Sheets[mainSheet].Range['B1:H'+IntToStr(firstStr)].Copy;
  E.Sheets[next].Range['B1'].Insert;



  if (E.Sheets.Count>next) then
    prevSheetName:= E.Sheets[next+1].name
  else
    prevSheetName:= '';

  currentSheetName:= GetPagename(VidZanShortName,prevSheetName);
  E.Sheets[next].name:= currentSheetName;

  if HasTema then
  begin
    //вставляем лист для приложений
	  E.sheets.Add(after:=E.sheets.item[next]);
	  //E.Sheets[mainNum].PageSetup.Orientation:=1;
	  E.Sheets[mainSheet].Range['B21:E26'].Copy;
	  E.Sheets[next+1].Range['B1'].Insert;
    E.Sheets[next+1].name:='Приложение'+currentSheetName;
  end;
end;

procedure TUspevGroupController.AnnulNapr(VedIK: integer);
begin
  TApplicationController.GetInstance.AddLogEntry('Аннулирование направления');
  case FNapravController.Annul(VedIK) of
    StatusError: ShowMessage('Невозможно аннулировать закрытое направление');
  end;
end;

//Настраивает ведомость в конце экспорта
procedure TUspevGroupController.NastrVedsEnd(next, firstStr:integer; ikGrup, nSem, ikVed, ikFac, ikSpec, ikVidZan, Count: integer; E:Variant; HasTema, HasDopusk:boolean; VedType:TVedType);
begin

  E.Sheets[next].Select;
  //E.Sheets[next].Range['A'+inttostr(firstStr)].RowHeight:=20,25;
  E.Range['A'+inttostr(firstStr)].RowHeight:=40;

  E.Range['A1'].ColumnWidth:=3;
  E.Range['B1'].ColumnWidth:=30;     //фио
  E.Range['E1'].ColumnWidth:=0;      //


  case VedType of
   exam:       //экзамен
   begin
     if HasDopusk then
     begin
      E.Range['C1'].ColumnWidth:=20;
		  E.Range['D1'].ColumnWidth:=15;
		  E.Range['F1'].ColumnWidth:=15;
		  E.Range['G1'].ColumnWidth:=13;
     end
     else
     begin
      E.Range['C1'].ColumnWidth:=25;
	    E.Range['D1'].ColumnWidth:=0;
	    E.Range['F1'].ColumnWidth:=17;
	    E.Range['G1'].ColumnWidth:=20;
     end;
     E.Range['E1'].ColumnWidth:=0;
   end;
   zach:       //зачет
   begin
     if HasDopusk then
     begin
        E.Range['C1'].ColumnWidth:=20;
		    E.Range['D1'].ColumnWidth:=15;
		    E.Range['G1'].ColumnWidth:=15;
		    E.Range['H1'].ColumnWidth:=13;
     end
     else
     begin
        E.Range['C1'].ColumnWidth:=25;
	      E.Range['D1'].ColumnWidth:=0;
	      E.Range['E1'].ColumnWidth:=17;
	      E.Range['G1'].ColumnWidth:=20;
     end;
     E.Range['F1'].ColumnWidth:=0;
    end;
    else
    begin
     if HasDopusk then
     begin
      E.Range['F1'].ColumnWidth:=0;
      E.Range['C1'].ColumnWidth:=15;
	    E.Range['D1'].ColumnWidth:=10;
      E.Range['E1'].ColumnWidth:=23;
	    E.Range['F1'].ColumnWidth:=13.57;
     end
     else
     begin
      E.Range['F1'].ColumnWidth:=0;
      E.Range['C1'].ColumnWidth:=24;
	    E.Range['D1'].ColumnWidth:=0;
      E.Range['E1'].ColumnWidth:=24;
	    E.Range['F1'].ColumnWidth:=13.57;
     end;
     E.Range['G1'].ColumnWidth:=0;
   end;
  end;

	  E.Sheets[next].PageSetup.LeftMargin:=60;
	  E.Sheets[next].PageSetup.RightMargin:=20;
	  E.Sheets[next].PageSetup.TopMargin:=29;
	  E.Sheets[next].PageSetup.BottomMargin:=29;
	  E.Sheets[next].PageSetup.Order:=2;
  if HasTema then
  begin
    E.Sheets[next+1].Select;
	  E.Range['A1'].RowHeight:=20;
	  E.Range['A6'].RowHeight:=30;

	  E.Range['A1'].ColumnWidth:=3;
	  E.Range['B1'].ColumnWidth:=25;
	  E.Range['C1'].ColumnWidth:=50;
    E.Range['D1'].ColumnWidth:=10;
	  E.Range['E1'].ColumnWidth:=10;

    E.Sheets[next+1].PageSetup.LeftMargin:=60;
	  E.Sheets[next+1].PageSetup.RightMargin:=20;
	  E.Sheets[next+1].PageSetup.TopMargin:=29;
	  E.Sheets[next+1].PageSetup.BottomMargin:=29;
	  E.Sheets[next+1].PageSetup.Order:=2;
  end;
end;

//Переносит итоги ведомости
procedure TUspevGroupController.ExportVedsEnd(mainSheet,next,firstStr:integer; ikVed, ikVidZan, Count: integer; E:Variant; withOsenca:boolean);
const AllCount: integer=36;
var strNum:integer;
    IsZach:boolean;
    FindRange: Variant;
    str: string;
begin

  if count<AllCount then strNum:=47
  else strNum:=firstStr+1+count;

  if withOsenca then
  begin
  //загружает итоги
    GetVedomsBottom(ikVed, ikVidZan);
    if not dmUspevaemost.adospSelVedBottom.Active then
      raise EApplicationException.Create('Произошла ошибка при загрузке итогов ведомости.');
    IsZach:= (dmUspevaemost.adospSelVedBottom.FieldByName('zachCount').AsInteger>0)
            or (ikVidZan=7);
  end
  else
    IsZach:= (ikVidZan=7);


    //для зачетов указывает аттестован, не аттестован
  if IsZach then
  begin
	  E.Sheets[mainSheet].Range['B21:E24'].Copy;
  end
  else
    E.Sheets[mainSheet].Range['B13:E19'].Copy;
  E.Sheets[next].Range['B'+inttostr(strNum)].Insert;



  if withOsenca then
  begin

    strNum:= strNum+2;
	  if (not IsZach) then
	  begin
		 E.Sheets[next].Range['C'+inttostr(strNum)].Value:=
			dmUspevaemost.adospSelVedBottom.FieldByName('otlCount').AsString;
		 inc(strNum);
		 E.Sheets[next].Range['C'+inttostr(strNum)].Value:=
			dmUspevaemost.adospSelVedBottom.FieldByName('horCount').AsString;
		 inc(strNum);
		 E.Sheets[next].Range['C'+inttostr(strNum)].Value:=
			dmUspevaemost.adospSelVedBottom.FieldByName('udovlCount').AsString;
		 inc(strNum);
		 E.Sheets[next].Range['C'+inttostr(strNum)].Value:=
			dmUspevaemost.adospSelVedBottom.FieldByName('neudCount').AsString;
		 inc(strNum);
		 E.Sheets[next].Range['C'+inttostr(strNum)].Value:=
			dmUspevaemost.adospSelVedBottom.FieldByName('nedopCount').AsString;
	  end
	  else
	  begin
		 E.Sheets[next].Range['C'+inttostr(strNum)].Value:=
			dmUspevaemost.adospSelVedBottom.FieldByName('zachCount').AsString;
		 inc(strNum);
		 E.Sheets[next].Range['C'+inttostr(strNum)].Value:=
			dmUspevaemost.adospSelVedBottom.FieldByName('nedopCount').AsString;
	  end;
  end;
  str := dmUspevaemost.adospSelVed.FieldByName('ManagerPostName').AsString;
  FindRange := E.Sheets[next].Cells.Replace(What := '#ManName#',Replacement:=str);

end;



procedure TUspevGroupController.printVedomost(VedList:TADOStoredProc;ikGrup,
nSem, ikFac, ikSpec: integer; withOsenca:boolean);
var E:Variant;
  str:string;
  begin



//  if VedList=nil then
//  begin
//    raise EApplicationException.Create('Произошла ошибка при загрузке списка созданных ведомостей.');
//    exit;
//  end;
//
//  try
//	  if VedList.Active then
//	  begin
//		  E := CreateOleObject('Excel.Application');
//		  try
//		    try
//			    str := ExtractFilePath(Application.ExeName)+'reports\UspevVedomost.XLT';
//			    E.WorkBooks.Add(str);
//			    E.Visible := false;
//			    E.DisplayAlerts:=false;
//			    VedList.First;
//			    while not VedList.Eof do
//			    begin      //печать и настройка текущей ведомости
			//     DoPrintVedomost(E, ikGrup,nSem,VedList.FieldByName('Ik_ved').AsInteger, ikFac,
//				        ikSpec, withOsenca);
//            VedList.Next;
//			    end;
//			    E.Sheets[1].Delete;
//			    E.Sheets[1].Delete;
//			    E.DisplayAlerts:=true;
//			    E.Visible := true;
//		    except
//			    E.Quit;
//			    raise ;
//		    end;
//
//		  finally
//		    E:= UnAssigned;
//		  end;
//    end;
//  finally
//    VedList.Free;
//  end;

  if VedList=nil then
  begin
    raise EApplicationException.Create('Произошла ошибка при загрузке списка созданных ведомостей.');
    exit;
  end;

  try
	  if VedList.Active then
	  begin
		  E := CreateOleObject('Excel.Application');
		  try
		    try
			    str := ExtractFilePath(Application.ExeName)+'reports\UspevVedomost.XLT';
			    E.WorkBooks.Add(str);
			    E.Visible := false;
			    E.DisplayAlerts:=false;
			    VedList.First;
			    while not VedList.Eof do
			    begin      //печать и настройка текущей ведомости
		        DoPrintVedomost(E, ikGrup,nSem,VedList.FieldByName('Ik_ved').AsInteger, ikFac,
				        ikSpec, withOsenca);
            VedList.Next;
			    end;
			    E.Sheets[1].Delete;
			    E.Sheets[1].Delete;
			    E.DisplayAlerts:=true;
			    E.Visible := true;
		    except
			    E.Quit;
			    raise ;
		    end;

		  finally
		    E:= UnAssigned;
		  end;
    end;
  finally
    VedList.Free;
  end;
// Release-1.0.4.441
end;



//Экспорт ведомости
procedure TUspevGroupController.DoPrintVedomost(E:Variant;ikGrup, nSem, ikVed, ikFac, ikSpec: integer; withOsenca:boolean);
const
firstStr:integer=10; //первая строчка в шаблоне ведомости, содержащая шапку таблицы
      firstStrKP:integer=6; //первая строчка в шаблоне ведомости, содержащая шапку таблицы тем КП
var count:integer;
  tempDS: TADODataSet;
  mainSheet:integer;  //номер копируемого листа
  next:integer;  //номер текущего листа
  i: Integer;
  VedContent:TADOStoredProc;
  VedType: TVedType;
  VedName: string;   //название ведомости
  VidZanShortName: string;    //краткое название вида занятий
begin

  //читаем заголовoк ведомости
  GetVedsHeader(ikVed);
  if not dmUspevaemost.adospSelVed.Active then
    raise EApplicationException.Create('Произошла ошибка при загрузке общих данных ведомости.');

    //читаем шапку ведомости
  GetVedomsShapca(ikVed);
  if not dmUspevaemost.adospVedTop.Active then
    raise EApplicationException.Create('Произошла ошибка при загрузке заголовка ведомости.');


  //определяем вид ведомости пока в зависимости от кода вида занятия
  //TVedType = (exam,zach,KP,KR);
//  case dmUspevaemost.adospSelVed.FieldByName('ik_Vid_zanyat').AsInteger of
//    6:   //экзамен
//    begin
//     VedType:= exam;
//     VedName:= 'Экзаменациoнная ведомость №';
//     VidZanShortName:= 'Экз';
//    end;
//    56:  // гос экзамен
//    begin
//     VedType:= exam;
//     VedName:= 'Ведомость на государственный экзамен №';
//     VidZanShortName:= 'ГосЭкз';
//    end;
//    7:  //зачет
//    begin
//     VedType:= zach;
//     VedName:= 'Зачетная ведомость №';
//     VidZanShortName:= 'Зач';
//    end;
//    8:  //
//    begin
//     VedType:= KP;
//     VedName:= 'Ведомость на курсовой проект №';
//     VidZanShortName:= 'КП';
//    end;
//    9:  //
//    begin
//     VedType:= KR;
//     VedName:=  'Ведомость на курсовую работу №';
//     VidZanShortName:= 'КР';
//    end;
//    27:  //практика
//    begin
//     VedType:= zach;
//     VedName:= 'Ведомость на практику №';
//     VidZanShortName:= 'Прак';
//    end;
 // end;


   VedName:=VedName + ' '+IntToStr(ikVed);

  TApplicationController.GetInstance.AddLogEntry('Ведомость. Экспорт в Excel ведомости '+
          dmUspevaemost.adospVedTop.FieldByName('cName_disc').AsString+ ' '+VidZanShortName);

  //выборка оценок
  VedContent:=GetVedomsOsenci(ikVed, dmUspevaemost.adospSelVed.FieldByName('HasDopusk').AsBoolean);
  if not VedContent.Active then
    raise EApplicationException.Create('Произошла ошибка при загрузке оценок ведомости.');

  //dmUspevaemost.adospSelVed.FieldByName('ik_Vid_zanyat').AsBoolean
  count:=VedContent.RecordCount;

  AddPageVedomost(mainSheet, next, firstStr, E, dmUspevaemost.adospSelVed.FieldByName('HasTema').AsBoolean, VidZanShortName);   //добавляем страницы

  ExportVedsShapka(mainSheet, next, ikGrup, nSem, ikVed, ikFac, ikSpec, dmUspevaemost.adospSelVed.FieldByName('ik_Vid_zanyat').AsInteger,
      count, firstStr, firstStrKP, E,
      dmUspevaemost.adospSelVed.FieldByName('HasTema').AsBoolean, withOsenca, VedName, VidZanShortName);  //шапка


  E.Sheets[next].Select;

  i:=1;
  VedContent.first;
  While not VedContent.Eof do
  begin
    E.Range['A'+inttostr(firstStr+i)].Value:=inttostr(i);
    E.Range['B'+inttostr(firstStr+i)].Value:= VedContent.FieldByName('StudName').AsString +
			  '   '+VedContent.FieldByName('KatZach').AsString;

    E.Range['C'+inttostr(firstStr+i)].Value:= VedContent.FieldByName('NN_zach').AsString;
    if dmUspevaemost.adospSelVed.FieldByName('HasDopusk').AsBoolean then
		    E.Range['D'+inttostr(firstStr+i)].Value:= VedContent.FieldByName('dopusc').AsString;
    if withOsenca then //выводить оценку
    begin
      case VedType of
        exam:   //экзамен
          E.Range['F'+inttostr(firstStr+i)].Value:= VedContent.FieldByName('nameOsenca').AsString;
        else     //зачет
          E.Range['E'+inttostr(firstStr+i)].Value:= VedContent.FieldByName('nameOsenca').AsString;
         {8:     //КП
          E.Range['E'+inttostr(firstStr+i)].Value:= VedContent.FieldByName('nameOsenca').AsString;
         9:     //КР
          E.Range['E'+inttostr(firstStr+i)].Value:= VedContent.FieldByName('nameOsenca').AsString;
        }
      end;
    end;
    inc(i);
    VedContent.next;
  end;
  //E.Sheets[next].PageSetup.LeftFooter:='&5' + TApplicationController.GetInstance.DocumentFooter;


    //вывод темы для КП и КР
    if dmUspevaemost.adospSelVed.FieldByName('HasTema').AsBoolean then
    begin
      E.Sheets[next+1].Select;
	    i:=1;
	    VedContent.first;
      while not VedContent.Eof do
      begin
		    E.Range['A'+inttostr(firstStrKP+i)].Value:=inttostr(i);
		    E.Range['B'+inttostr(firstStrKP+i)].Value:= VedContent.FieldByName('StudName').AsString +
			    '   '+VedContent.FieldByName('KatZach').AsString;

        if withOsenca then //выводить тему
          E.Range['C'+inttostr(firstStrKP+i)].Value:=VedContent.FieldByName('cTema').AsString;

		    inc(i);
		    VedContent.next;
      end;
      //E.Sheets[next+1].PageSetup.LeftFooter:='&5' + TApplicationController.GetInstance.DocumentFooter;
    end;

	  E.Sheets[2].PageSetup.LeftMargin:=44;
	  E.Sheets[2].PageSetup.RightMargin:=20;
	  E.Sheets[2].PageSetup.TopMargin:=29;
	  E.Sheets[2].PageSetup.BottomMargin:=29;
	  E.Sheets[2].PageSetup.Order:=2;

    ExportVedsEnd(mainSheet,next,firstStr,ikVed,
      dmUspevaemost.adospSelVed.FieldByName('ik_Vid_zanyat').AsInteger, Count, E, withOsenca);

    NastrVedsEnd(next, firstStr, ikGrup, nSem, ikVed, ikFac, ikSpec,
      dmUspevaemost.adospSelVed.FieldByName('ik_Vid_zanyat').AsInteger, Count, E,
      dmUspevaemost.adospSelVed.FieldByName('HasTema').AsBoolean,
      dmUspevaemost.adospSelVed.FieldByName('HasDopusk').AsBoolean, VedType);
end;

//генерирует бланк ведомости (без оценок)
procedure TUspevGroupController.printBlankVedomost(ikGrup, nSem, ikVed, ikFac, ikSpec: integer; tempStoredProc: TADOStoredProc);
var
  VedList: TADOStoredProc;
begin
  TApplicationController.GetInstance.AddLogEntry('Ведомость. Экспорт в Excel бланка ведомости');
  VedList:= GetAllVedomosts(ikGrup, nSem);

  //применяем фильтр, чтобы выводить только 1 ведомость
  VedList.Filter:= 'Ik_ved='+IntToStr(ikVed);
  VedList.Filtered:= true;
  PrintVedomost(VedList,ikGrup,nSem,ikFac, ikSpec, false);
end;

// procedure TUspevGroupController.printBlankVedomost(ikGrup, nSem, ikVed, ikFac, ikSpec: integer; tempStoredProc: TADOStoredProc);
//var
//  VedList: TADOStoredProc;
//begin
//  TApplicationController.GetInstance.AddLogEntry('Ведомость. Экспорт в Excel бланка ведомости');
//  VedList:= GetAllVedomosts(ikGrup, nSem);
//
//  //применяем фильтр, чтобы выводить только 1 ведомость
//  VedList.Filter:= 'Ik_ved='+IntToStr(ikVed);
//  VedList.Filtered:= true;
//  PrintVedomost(VedList,ikGrup,nSem,ikFac, ikSpec, false);
//end;

//генерирует все бланки ведомостей (без оценок)
procedure TUspevGroupController.printAllBlankVedomost(ikGrup, nSem, ikFac, ikSpec: integer);
var
  VedList: TADOStoredProc;
begin
  TApplicationController.GetInstance.AddLogEntry('Ведомость. Экспорт в Excel всех бланков ведомостей');

  VedList:= GetAllVedomosts(ikGrup, nSem);

  PrintVedomost(VedList,ikGrup,nSem,ikFac, ikSpec, false);
end;




//*******************************************************
//*******************************************************
//*******************************************************
//***************ВКЛАДКА УСПЕВАЕМОСТЬ**************************
//Выборка списка всех созданных в семестре ведомостей
function TUspevGroupController.GetAllUspevForGrup(ikGrup, nSem: integer):TADOStoredProc;
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TADOStoredProc.Create(nil);
  try
    tempStoredProc.ProcedureName:= 'GetAllUspevForGrup_withDate;1';
    tempStoredProc.Connection:= dm.DBConnect;
    tempStoredProc.Parameters.CreateParameter('@ik_group', ftInteger, pdInput, 0, ikGrup);
    tempStoredProc.Parameters.CreateParameter('@n_sem', ftInteger, pdInput, 0, nSem);
    tempStoredProc.Open;
    Result:= tempStoredProc;
  except
  on E:Exception do
  begin
    tempStoredProc.Free;
    Result:= nil;
    raise EApplicationException.Create('Произошла ошибка при загрузке успеваемости.',E);
  end;
  end;
end;

//Экспорт в Excel успеваемости группы (журнала)
procedure TUspevGroupController.PrintBRSExamVedomost(ikGrup, nSem, nAtt,
  ikFac: integer; date, examiner, num: string);
var   fac, group, disc:string;
  Report:TBRSExamVedomost;
  ikdisc:integer;
begin
 dmUgtuStructure.adoqSpecFac.Open;
  dmUgtuStructure.adoqSpecFac.Filter:='';
  if dmUgtuStructure.adoqSpecFac.Locate('ik_fac',ikfac,[loCaseInsensitive]) then
     fac:=dmUgtuStructure.adoqSpecFacCname_fac.AsString;

  dmUgtuStructure.adoqSelAllGroups.Open;
  dmUgtuStructure.adoqSelAllGroups.Filter:='';
  if dmUgtuStructure.adoqSelAllGroups.Locate('ik_grup',ikgrup,[loCaseInsensitive]) then
     group:=dmUgtuStructure.adoqSelAllGroups.FieldByName('cname_grup').AsString;

  ikdisc:=dmUspevaemost.adospGetAllBRSExam.FieldByName('ik_disc').Value;
  disc:=dmUspevaemost.adospGetAllBRSExam.FieldByName('cname_disc').AsString;
  Report := TBRSExamVedomost.Create(nil, dmUspevaemost.adodsSelBRSExamGroup, fac, group, disc, examiner, num, date, nSem, ikDisc, ikGrup);
  Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\BRSExamVedomost.xlt';

  {Report := TBRSReport.CreateFull(nil, dmUspevaemost.adodsSelAttBRSGroup, fac, group, disc, examiner, num, date, nSem);
  //Report.FreeOnComplete := true;
  Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\VedomostBRS.xlt';}
  // Начать построение отчёта
  Report.BuildReport;
  Report.Show;
  Report.Free;
end;

procedure TUspevGroupController.PrintBRSLastVedomost(ikGrup, nSem,
  ikFac, ikDisc: integer; datezach, dateexam, examiner, disc: string);
var
  fac, group:string;
  Report:TBRSReportLast;
  year,grade:integer;
begin
  dmUgtuStructure.adoqSpecFac.Open;
  dmUgtuStructure.adoqSpecFac.Filter:='';
  if dmUgtuStructure.adoqSpecFac.Locate('ik_fac',ikfac,[loCaseInsensitive]) then
     fac:=dmUgtuStructure.adoqSpecFacCname_fac.AsString;

  dmUgtuStructure.adoqSelAllGroups.Open;
  dmUgtuStructure.adoqSelAllGroups.Filter:='';
  if dmUgtuStructure.adoqSelAllGroups.Locate('ik_grup',ikgrup,[loCaseInsensitive]) then
     group:=dmUgtuStructure.adoqSelAllGroups.FieldByName('cname_grup').AsString;

  year:=YearOf(Today);
  Grade:=(nSem+1) div 2;

  dmUspevaemost.adsGetBRSVedomost.Active:=false;
  dmUspevaemost.adsGetBRSVedomost.CommandText:='select * from dbo.GetBRSVedomost('+inttostr(ikDisc)+','+inttostr(ikGrup)+','+inttostr(nSem)+')';
    dmUspevaemost.adsGetBRSVedomost.Active:=true;

  Report := TBRSReportLast.CreateFull(nil, dmUspevaemost.adsGetBRSVedomost, fac, group, disc, examiner, dateexam, datezach, nSem, Year, grade);
  Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\VedomostBRSLast.xlt';
  // Начать построение отчёта
  Report.BuildReport;
  Report.Show;
  Report.Free;

end;

procedure TUspevGroupController.PrintBRSRankAverageReport(ikGrup, nSem: integer;
  num: string);
  var
  group, disc:string;
  Report:TBRSRankAverageReport;
  ikdisc:integer;
  ds:TAdoDataset;
begin
  dmUgtuStructure.adoqSelAllGroups.Open;
  dmUgtuStructure.adoqSelAllGroups.Filter:='';
  if dmUgtuStructure.adoqSelAllGroups.Locate('ik_grup',ikgrup,[loCaseInsensitive]) then
     group:=dmUgtuStructure.adoqSelAllGroups.FieldByName('cname_grup').AsString;

     // выбрать средние баллы студентов
     if num = 'Экзамен' then exit;

   dmUspevaemost.adodsGetAverageBalls.Active := false;
   dmUspevaemost.adodsGetAverageBalls.CommandText := 'select * from dbo.GetBRSAverageBallsForModule('+inttostr(ikGrup)+','+ inttostr(nSem)+','+ num+')';
   dmUspevaemost.adodsGetAverageBalls.Active := true;

  Report := TBRSRankAverageReport.Create(nil, dmUspevaemost.adodsGetAverageBalls, group, num, nSem, ikGrup);
  Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\BRSRankAverageReport.xlt';
  Report.BuildReport;
  Report.Show;
  Report.Free;
end;

procedure TUspevGroupController.PrintBRSRankReport(ikGrup, nSem:integer; num: string);
  var
  group, disc:string;
  Report:TBRSRankReport;
  ikdisc:integer;
  ds:TAdoDataset;
begin
  dmUgtuStructure.adoqSelAllGroups.Open;
  dmUgtuStructure.adoqSelAllGroups.Filter:='';
  if dmUgtuStructure.adoqSelAllGroups.Locate('ik_grup',ikgrup,[loCaseInsensitive]) then
     group:=dmUgtuStructure.adoqSelAllGroups.FieldByName('cname_grup').AsString;


  if dmUspevaemost.adodsSelAttBRSGroup.Active then
    dmUspevaemost.adodsSelAttBRSGroup.Sort := '[i_balls] DESC';

  ikdisc:=dmUspevaemost.adospGetAllAtt.FieldByName('ik_disc').Value;
  disc:=dmUspevaemost.adospGetAllAtt.FieldByName('cname_disc').AsString;

  Report := TBRSRankReport.Create(nil, dmUspevaemost.adodsSelAttBRSGroup, group, num, disc, nSem, ikDisc, ikGrup);
  Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\BRSRankReport.xlt';
  Report.BuildReport;
  Report.Show;
  Report.Free;
end;

procedure TUspevGroupController.PrintBRSVedomost(ikGrup, nSem, nAtt,
  ikFac: integer; date,examiner,num: string);
var
  fac, group, disc:string;
  Report:TBRSAllModulesReport;
  ikdisc, ikcontent:integer;
  Log : ILogger;
begin
  Log := TNullLogger.GetInstance;   //TMemoLogger.GetInstance; //

  Assert(dmUgtuStructure <> nil);
  Assert(dmUgtuStructure.adoqSpecFac <> nil);
  dmUgtuStructure.adoqSpecFac.Open;
  dmUgtuStructure.adoqSpecFac.Filter:='';
  if dmUgtuStructure.adoqSpecFac.Locate('ik_fac',ikfac,[loCaseInsensitive]) then
     fac:=dmUgtuStructure.adoqSpecFacCshort_name_fac.AsString;

    Log.LogMessage('dmUgtuStructure.adoqSpecFac opened and filtered');
    Assert(dmUgtuStructure.adoqSelAllGroups <> nil);
  dmUgtuStructure.adoqSelAllGroups.Open;
  dmUgtuStructure.adoqSelAllGroups.Filter:='';
  if dmUgtuStructure.adoqSelAllGroups.Locate('ik_grup',ikgrup,[loCaseInsensitive]) then
     group:=dmUgtuStructure.adoqSelAllGroups.FieldByName('cname_grup').AsString;

  Log.LogMessage('dmUgtuStructure.adoqSelAllGroups opened and filtered');
  ikdisc:=dmUspevaemost.adospGetAllAtt.FieldByName('ik_disc').Value;
  ikcontent :=dmUspevaemost.adospGetAllAtt.FieldByName('ik_upContent').Value;
  disc:=dmUspevaemost.adospGetAllAtt.FieldByName('cname_disc').AsString;

  Report := TBRSAllModulesReport.CreateFull(nil, dmUspevaemost.adsGetBRSVedomost, fac, group, disc, examiner, num, date, nSem, ikDisc, ikGrup, ikcontent);
  Report.Logger := Log;
  Log.LogMessage('Report created');
  { str := ExtractFilePath(Application.ExeName)+'reports\BRSAllModules.xlt';
			    Report.WorkBooks.Add(str);}

  Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\BRSAllModules.xlt';

  {Report := TBRSReport.CreateFull(nil, dmUspevaemost.adodsSelAttBRSGroup, fac, group, disc, examiner, num, date, nSem);
  //Report.FreeOnComplete := true;
  Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\VedomostBRS.xlt';}
  // Начать построение отчёта
  Report.BuildReport;
  Log.LogMessage('Report builded');
  Report.Show;
  Report.Free;
end;

function TUspevGroupController.PrintUspevToExcel(sgUspev: TStringGrid):boolean;
var i,j:integer;
      E:Variant;
begin
  TApplicationController.GetInstance.AddLogEntry('Экспорт в MS Excel журнала успеваемости');

  try
    E := CreateOleObject('Excel.Application');
    E.WorkBooks.Add;
    E.DisplayAlerts:= false;
    E.Visible := false;
    E.Sheets[1].Select;
    E.Range['A3:A6'].ColumnWidth:=18;
    // вывод шапки
    for i:=0 to sgUspev.RowCount-1 do
    begin
      for j:=0 to sgUspev.ColCount-1 do
      begin
        E.Cells[i+1,j+1]:= sgUspev.Cells[j,i];
      end;
    end;
    E.Range['A1:'+chr(ord('A')+j-1)+intToStr(i)].Borders.Weight:=2;
    E.Visible := true;
    E.DisplayAlerts:= true;
    result:= true;
  except
    result:= false;
    E.Quit;
    E:= UnAssigned;
  end;

end;




//***************Дополнительные**************************

//getSpecFromSpecFac возвращает IK специальности
function TUspevGroupController.getSpecFromSpecFac(SpecFacIK: integer): Integer;
var
  DataSet: TADODataSet;
begin
  DataSet:= TADODataSet.Create(nil);
  DataSet.Connection:= dm.DBConnect;
  DataSet.CommandText:= 'Select * From Relation_spec_fac Where ik_spec_fac = ' + IntToStr(SpecFacIK);
  DataSet.Open;
  Result:= DataSet.FieldByName('ik_spec').AsInteger;
  DataSet.Close;
  DataSet.Free;
end;

end.

