unit AbiturientAbitProcs;
{#Author tanyav@ist.ugtu.net}
interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, AbiturientBaseProcs, AbiturientFacade,ADODB, db, ExceptionBase, ApplicationController;

type
  EAbitDeleteException = class(EApplicationException)
  public
    constructor Create;
  end;
  EAbitGetDataByNcodeException = class(EApplicationException)
  public
    constructor Create;
  end;
  EAbitAddDataException = class(EApplicationException)
  public
    constructor Create;
  end;
  EAbitEditDataException = class(EApplicationException)
  public
    constructor Create;
  end;
  EAbitGetDataException = class(EApplicationException)
  public
    constructor Create;
  end;
  //получение данных абитуриентов
  //список по фамили€м
  TAbitSpisokGetProc = class (TGetProc)
  public
    constructor Create(AOwner: TComponent); override;
  end;
  //нетабличные данные абитуриента
  TAbitNotTableGetProc = class (TGetProc)
  public
    procedure   GetData(NCode: integer);
    constructor Create(AOwner: TComponent); override;
  end;
  //документы абитуриента
  TAbitDocsGetProc = class (TGetProc)
  public
    procedure   GetData(NCode: integer);
    constructor Create(AOwner: TComponent); override;
  end;
  //учебное заведение абитуриента
  TAbitZavedGetProc = class (TGetProc)
  public
    procedure   GetData(NCode: integer);
    constructor Create(AOwner: TComponent); override;
  end;
  //работа абитуриента
  TAbitRabGetProc = class (TGetProc)
  public
    procedure   GetData(NCode: integer);
    constructor Create(AOwner: TComponent); override;
  end;
  //родственники абитуриента
  TAbitFamilyGetProc = class (TGetProc)
  public
    procedure   GetData(NCode: integer);
    constructor Create(AOwner: TComponent); override;
  end;
  //дополнительные сведени€ абитуриента
  TAbitDopGetProc = class (TGetProc)
  public
    procedure   GetData(NCode: integer);
    constructor Create(AOwner: TComponent); override;
  end;
  //€зыковые сведени€ абитуриента
  TAbitLangGetProc = class (TGetProc)
  public
    procedure   GetData(NCode: integer);
    constructor Create(AOwner: TComponent); override;
  end;
  //подготовка абитуриента
  TAbitPodgGetProc = class (TGetProc)
  public
    procedure   GetData(NCode: integer);
    constructor Create(AOwner: TComponent); override;
  end;
  //общежитие абитуриента
  TAbitLobGetProc = class (TGetProc)
  public
    procedure   GetData(NCode: integer);
    constructor Create(AOwner: TComponent); override;
  end;
  //поступление абитуриента
  TAbitPostupGetProc = class (TGetProc)
  public
    procedure   GetData(NCode: integer);
    constructor Create(AOwner: TComponent); override;
  end;
  //экзамены абитуриента
  TAbitExamGetProc = class (TGetProc)
  public
    procedure   GetData(NN_abit: integer);
    constructor Create(AOwner: TComponent); override;
  end;

  //получение списков дл€ формы добавлени€ данных
  //национальность
  TAbitNacGetProc = class(TGetProc)
  public
    constructor Create(AOwner: TComponent); override;
  end;
  //гражданство
  TAbitGrazdGetProc = class(TGetProc)
  public
    constructor Create(AOwner: TComponent); override;
  end;
  //место жительства/рождени€
  TAbitPlaceGetProc = class(TGetProc)
  public
    constructor Create(AOwner: TComponent); override;
  end;
  //учебное заведение
  TAbitcmbxZavedGetProc = class(TGetProc)
  public
    constructor Create(AOwner: TComponent); override;
  end;
  //медали
  TAbitMedalsGetProc = class(TGetProc)
  public
    constructor Create(AOwner: TComponent); override;
  end;
  //семейное положение
  TAbitSem_polGetProc = class(TGetProc)
  public
    constructor Create(AOwner: TComponent); override;
  end;
  //члены семьи
  TAbitcmbxFamilyGetProc = class(TGetProc)
  public
    constructor Create(AOwner: TComponent); override;
  end;
  //€зыки
  TAbitcmbxLangGetProc = class(TGetProc)
  public
    constructor Create(AOwner: TComponent); override;
  end;
  //подготовка
  TAbitPodgotovkaGetProc = class(TGetProc)
  public
    constructor Create(AOwner: TComponent); override;
  end;
  //—пециальность-факультет
  TAbitSpec_facGetProc = class(TGetProc)
  public
    constructor Create(AOwner: TComponent); override;
  end;
  TAbitFilialsGetProc = class(TGetProc)
  public
    constructor Create(AOwner: TComponent); override;
  end;
  //категори€ зачислени€
  TAbitKat_zachGetProc = class(TGetProc)
  public
    constructor Create(AOwner: TComponent); override;
  end;
  //состо€ние зачислени€
  TAbitSost_zachGetProc = class(TGetProc)
  public
    constructor Create(AOwner: TComponent); override;
  end;
  //дисциплина
  TAbitDiscGetProc = class(TGetProc)
  public
    constructor Create(AOwner: TComponent); override;
  end;
  //вид сдачи
  TAbitVidsdGetProc = class(TGetProc)
  public
    constructor Create(AOwner: TComponent); override;
  end;
  //кем выдан документ абитуриента
  TAbitKemVydanGetProc = class(TGetProc)
  public
    constructor Create(AOwner: TComponent); override;
  end;

  //редактирование данных в таблице abit
   TAbitMainEditProc = class (TEditProc)
  public
    procedure   EditData(id:integer;clastname,cfirstname,cotch,cplace_birth:string;dd_birth:Tdatetime;csex:string;ik_nac,ik_grazd,ik_live:OleVariant;cadres_live,ctelefon:string;ik_sem_pol:OleVariant;ideti,ipens:integer;lrab:boolean;cgodokon:string;ik_zaved,ik_medal:OleVariant;ik_godn_voen_sl:boolean;lobchegit:boolean;ncode:integer);
    constructor Create(AOwner: TComponent); override;
  end;
  //редактирование в др таблицах
   TAbitOtherTabsEditProc = class (TEditProc)
  public
    procedure   EditData(ncode:integer;cdopsved:string;ik_podg:Olevariant;id_ds,id_podg:integer);
    constructor Create(AOwner: TComponent); override;
  end;
  //редактирование экзаменов
  TAbitExamsEditProc = class (TEditProc)
  public
    procedure   EditData(NNabit,ik_disc: integer;cosenka:string;ik_sdach:OleVariant;id:integer);
    constructor Create(AOwner: TComponent); override;
  end;
  //редактирование €зыков
  TAbitLangsAbitEditProc = class (TEditProc)
  public
    procedure   EditData(ncode,ik_lang: integer;id:integer);
    constructor Create(AOwner: TComponent); override;
  end;
  //редактирование родственников абитуриента
  TAbitRoditAbitEditProc = class (TEditProc)
  public
    procedure   EditData(Ncode,ik_memb_fam: integer; cfio_rods,cpost,cphone:string;id:integer);
    constructor Create(AOwner: TComponent); override;
  end;

  //”даление данных абитуриента
  TAbitDeleteProc = class (TDeleteProc)
  public
    procedure   DeleteAbit(NCode, NNAbit: integer);
    constructor Create(AOwner: TComponent); override;
  end;
  //”даление данных экзаменов
  TAbitExamDeleteProc = class (TDeleteProc)
  public
    procedure   DeleteAbit(id: integer);
    constructor Create(AOwner: TComponent); override;
  end;
  //”даление данных €зыков
  TAbitLangsDeleteProc = class (TDeleteProc)
  public
    procedure   DeleteAbit(id: integer);
    constructor Create(AOwner: TComponent); override;
  end;
  //”даление данных родителей
  TAbitRoditAbitDeleteProc = class (TDeleteProc)
  public
    procedure   DeleteAbit(id: integer);
    constructor Create(AOwner: TComponent); override;
  end;

  //добавление данных
  //добавление в основную таблицу
   TAbitMainAddProc = class (TAddProc)
  public
    procedure   AddData(id:integer;clastname,cfirstname,cotch,cplace_birth:string;dd_birth:Tdatetime;csex:string;ik_nac,ik_grazd,ik_live:OleVariant;cadres_live,ctelefon:string;ik_sem_pol:OleVariant;ideti,ipens:integer;lrab:boolean;cgodokon:string;ik_zaved,ik_medal:OleVariant;ik_godn_voen_sl:boolean;lobchegit:boolean);
    constructor Create(AOwner: TComponent); override;
  end;
  //получение ncode
   TAbitNcodeGetProc = class (TGetProc)
  public
    function GetData():integer;
    constructor Create(AOwner: TComponent); override;
  end;
  //добавление в др таблицы
   TAbitOtherTabsAddProc = class (TAddProc)
  public
    procedure   AddData(ncode:integer;cdopsved:string;ik_podg:Olevariant);
    constructor Create(AOwner: TComponent); override;
  end;
  //получение nn_abit
   TAbitNNabitGetProc = class (TGetProc)
  public
    function GetData():integer;
    constructor Create(AOwner: TComponent); override;
  end;
  //добавление экзаменов
  TAbitExamsAddProc = class (TAddProc)
  public
    procedure   AddData(NNabit,ik_disc: integer;cosenka:string;ik_sdach:OleVariant);
    constructor Create(AOwner: TComponent); override;
  end;
  //добавление €зыков
  TAbitLangsAbitAddProc = class (TAddProc)
  public
    procedure   AddData(ncode,ik_lang: integer);
    constructor Create(AOwner: TComponent); override;
  end;
  //добавление родственников абитуриента
  TAbitRoditAbitAddProc = class (TAddProc)
  public
    procedure   AddData(Ncode,ik_memb_fam: integer; cfio_rods,cpost,cphone:string);
    constructor Create(AOwner: TComponent); override;
  end;
  //добавление переведенных абитуриентов


  //получение даных статистики
  TAbitStatisticGet = class (TGetProc)
  public
    constructor Create(AOwner: TComponent); override;
  end;
  TAbitDateForStatisticGet = class (TGetProc)
  public
    constructor Create(AOwner: TComponent); override;
  end;
  TAbitStatisticDataNotExamGet = class (TGetProc)
  public
    procedure GetData(nnyear:integer);
    constructor Create(AOwner: TComponent); override;
  end;
  TAbitStatisticDataExamGet = class (TGetProc)
  public
    procedure GetData(nn_abit,ik_disc:integer);
    constructor Create(AOwner: TComponent); override;
  end;
  TAbitOtchetStatisticAdd = class (TAddProc)
  public
    procedure AddData(date_form:Tdatetime;typ_doc:string);
    constructor Create(AOwner: TComponent); override;
  end;
implementation


{
********************************* TAbitSpisokGetProc *********************************
}
constructor TAbitSpisokGetProc.Create(AOwner: TComponent);
begin
  inherited;
  ProcedureName:='ABIT_Get_abit_spisok;1';
end;
{
********************************* TAbitNotTableGetProc *********************************
}
constructor TAbitNotTableGetProc.Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_Get_AllInfoNotTables;1';
end;
{
********************************* TAbitDocsGetProc *********************************
}
constructor TAbitDocsGetProc.Create(AOwner: TComponent);
begin

 inherited;
 ProcedureName:='ABIT_Get_docabit;1';
end;
{
********************************* TAbitZavedGetProc *********************************
}
constructor TAbitZavedGetProc.Create(AOwner: TComponent);
begin

 inherited;
 ProcedureName:='ABIT_Get_zavedabit_byncode;1';
end;
{
********************************* TAbitRabGetProc *********************************
}
constructor TAbitRabGetProc.Create(AOwner: TComponent);
begin

 inherited;
 ProcedureName:='ABIT_Get_abit_IrabRadio;1';
end;
{
********************************* TAbitFamilyGetProc *********************************
}
constructor TAbitFamilyGetProc.Create(AOwner: TComponent);
begin

 inherited;
 ProcedureName:='ABIT_Get_roditabit_byncode;1';
end;
{
********************************* TAbitDopGetProc *********************************
}
constructor TAbitDopGetProc.Create(AOwner: TComponent);
begin

 inherited;
 ProcedureName:='ABIT_Get_dopsvedabit_byncode;1';
end;
{
********************************* TAbitLangGetProc *********************************
}
constructor TAbitLangGetProc.Create(AOwner: TComponent);
begin

 inherited;
 ProcedureName:='ABIT_Get_langabit_byncode;1';
end;
{
********************************* TAbitPodgGetProc *********************************
}
constructor TAbitPodgGetProc.Create(AOwner: TComponent);
begin

 inherited;
 ProcedureName:='ABIT_Get_podgabit_byncode;1';
end;
{
********************************* TAbitLobGetProc *********************************
}
constructor TAbitLobGetProc.Create(AOwner: TComponent);
begin

 inherited;
 ProcedureName:='ABIT_Get_abit_IlobRadio;1';
end;
{
********************************* TAbitPostupGetProc *********************************
}
constructor TAbitPostupGetProc.Create(AOwner: TComponent);
begin

 inherited;
 ProcedureName:='ABIT_Get_postupabit_byncode;1';
end;
{
********************************* TAbitExamGetProc *********************************
}
constructor TAbitExamGetProc.Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_Get_vstup_ekz;1';
end;

{
******************************* TAbitDeleteProc ********************************
}
constructor TAbitDeleteProc.Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_Del_anytable;1';
end;


{
********************************* TAbitMainAddProc *********************************
}
constructor TAbitMainAddProc.Create(AOwner: TComponent);
begin

 inherited;
 ProcedureName:='ABIT_Add_abit;1';
end;

procedure TAbitMainAddProc.AddData(id:integer;clastname,cfirstname,cotch,cplace_birth:string;dd_birth:Tdatetime;csex:string;ik_nac,ik_grazd,ik_live:OleVariant;cadres_live,ctelefon:string;ik_sem_pol:OleVariant;ideti,ipens:integer;lrab:boolean;cgodokon:string;ik_zaved,ik_medal:OleVariant;ik_godn_voen_sl:boolean;lobchegit:boolean);
begin
  try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@id',ftBCD,pdInput,0,id);
    Parameters.CreateParameter('@clastname',ftstring,pdInput,30,clastname);
    Parameters.CreateParameter('@cfirstname',ftstring,pdInput,30,cfirstname);
    Parameters.CreateParameter('@cotch',ftstring,pdInput,30,cotch);
    Parameters.CreateParameter('@cplace_birth',ftstring,pdInput,50,cplace_birth);
    Parameters.CreateParameter('@dd_birth',ftdatetime,pdInput,0,dd_birth);
    Parameters.CreateParameter('@csex',ftstring,pdInput,10,csex);
    Parameters.CreateParameter('@ik_nac',ftBCD,pdInput,0,ik_nac);
    Parameters.CreateParameter('@ik_grazd',ftBCD,pdInput,0,ik_grazd);
    Parameters.CreateParameter('@ik_live',ftBCD,pdInput,0,ik_live);
    Parameters.CreateParameter('@cadres_live',ftstring,pdInput,100,cadres_live);
    Parameters.CreateParameter('@ctelefon',ftstring,pdInput,20,ctelefon);
    Parameters.CreateParameter('@ik_sem_pol',ftBCD,pdInput,0,ik_sem_pol);
    Parameters.CreateParameter('@ideti',ftBCD,pdInput,0,ideti);
    Parameters.CreateParameter('@ipens',ftBCD,pdInput,0,0);
    if lrab=true then Parameters.CreateParameter('@lrab',ftBCD,pdInput,0,1)
    else Parameters.CreateParameter('@lrab',ftBCD,pdInput,0,0);
    Parameters.CreateParameter('@cgodokon',ftstring,pdInput,20,cgodokon);
    Parameters.CreateParameter('@ik_zaved',ftBCD,pdInput,0,ik_zaved);
    Parameters.CreateParameter('@ik_medal',ftBCD,pdInput,0,ik_medal);
    if ik_godn_voen_sl=true then Parameters.CreateParameter('@ik_godn_voen_sl',ftstring,pdInput,10,'√оден')
    else Parameters.CreateParameter('@ik_godn_voen_sl',ftstring,pdInput,10,'Ќе годен');
    if lobchegit=true then Parameters.CreateParameter('@lobchegit',ftBCD,pdInput,0,1)
    else Parameters.CreateParameter('@lobchegit',ftBCD,pdInput,0,0);
    ExecProc;
  except
    raise EAbitAddDataException.Create;
  end;
end;
{
********************************* TAbitNcodeProc  *********************************
}
constructor TAbitNcodeGetProc.Create(AOwner: TComponent);
begin

 inherited;
 ProcedureName:='ABIT_get_abit_lastncode;1';
end;

function TAbitNcodeGetProc.GetData():integer;
begin
 Active:=false;
 ExecProc;
 Active:=true;
 result:=0;
  while not Eof do
  begin
   result:= StrToInt(FieldValues['ncode']);
   Next;
  end;
end;
{
********************************* TAbitOtherTabsAddProc   *********************************
}
constructor TAbitOtherTabsAddProc.Create(AOwner: TComponent);
begin

 inherited;
 ProcedureName:='ABIT_Add_OtherTables;1';
end;

procedure TAbitOtherTabsAddProc.AddData(ncode:integer;cdopsved:string;ik_podg:Olevariant);
begin
  try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@ncode',ftBCD,pdInput,0,ncode);
    Parameters.CreateParameter('@cdopsved',ftstring,pdInput,100,cdopsved);
    Parameters.CreateParameter('@ik_podg',ftBCD,pdInput,0,ik_podg);
    ExecProc;
  except
    raise EAbitAddDataException.Create;
  end;
end;

{
********************************* TAbitLangsAbitAddProc   *********************************
}
constructor TAbitLangsAbitAddProc.Create(AOwner: TComponent);
begin

 inherited;
 ProcedureName:='ABIT_Add_lang_abit;1';
end;

procedure TAbitLangsAbitAddProc.AddData(ncode,ik_lang: integer);
begin
  try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@ncode',ftBCD,pdInput,0,ncode);
    Parameters.CreateParameter('@ik_lang',ftBCD,pdInput,0,ik_lang);
    ExecProc;
  except
    raise EAbitAddDataException.Create;
  end;
end;

{
********************************* TAbitRoditAbitAddProc   *********************************
}
constructor TAbitRoditAbitAddProc.Create(AOwner: TComponent);
begin

 inherited;
 ProcedureName:='ABIT_Add_rodit_abit;1';
end;

procedure TAbitRoditAbitAddProc.AddData(Ncode,ik_memb_fam: integer; cfio_rods,cpost,cphone:string);
begin
  try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@Ncode',ftBCD,pdInput,0,Ncode);
    Parameters.CreateParameter('@ik_memb_fam',ftBCD,pdInput,0,ik_memb_fam);
    Parameters.CreateParameter('@cfio_rods',ftstring,pdInput,100,cfio_rods);
    Parameters.CreateParameter('@cpost',ftstring,pdInput,100,cpost);
    Parameters.CreateParameter('@cphone',ftstring,pdInput,20,cphone);
    ExecProc;
  except
    raise EAbitAddDataException.Create;
  end;
end;

{
********************************* TAbitNNabitProc    *********************************
}
constructor TAbitNNabitGetProc.Create(AOwner: TComponent);
begin

 inherited;
 ProcedureName:='ABIT_Get_postupabit_lastnnabit;1';
end;

function TAbitNNabitGetProc.GetData():integer;
begin
 Active:=false;
 ExecProc;
 Active:=true;
 result:=0;
  while not Eof do
  begin
   result:= StrToInt(FieldValues['nn_abit']);
   Next;
  end;
end;
{
********************************* TAbitExamsAddProc     *********************************
}
constructor TAbitExamsAddProc.Create(AOwner: TComponent);
begin

 inherited;
 ProcedureName:='ABIT_Add_vstup_ekz;1';
end;

procedure TAbitExamsAddProc.AddData(NNabit,ik_disc: integer;cosenka:string;ik_sdach:OleVariant);
begin
  try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@NNabit',ftBCD,pdInput,0,NNabit);
    Parameters.CreateParameter('@ik_disc',ftBCD,pdInput,0,ik_disc);
    Parameters.CreateParameter('@cosenka',ftstring,pdInput,15,cosenka);
    Parameters.CreateParameter('@ik_sdach',ftBCD,pdInput,0,ik_sdach);
    ExecProc;
  except
    raise EAbitAddDataException.Create;
  end;
end;
{
****************************** TAbitStatisticGet *******************************
}
constructor TAbitStatisticGet.Create(AOwner: TComponent);
begin
 inherited;
 ProcedureName:='ABIT_AbitStatisticGet;1';
end;

constructor TAbitKemVydanGetProc.Create(AOwner: TComponent);
begin
  inherited;
  ProcedureName := 'ABIT_Get_kem_vidan_abit';
end;

constructor TAbitNacGetProc.Create(AOwner: TComponent);
begin
  inherited;
  ProcedureName := 'ABIT_Get_Nacion';
end;

constructor TAbitGrazdGetProc.Create(AOwner: TComponent);
begin
  inherited;
  ProcedureName := 'ABIT_Get_Grazd';
end;

constructor TAbitPlaceGetProc.Create(AOwner: TComponent);
begin
  inherited;
  ProcedureName := 'ABIT_Get_Live_Abit';
end;

constructor TAbitcmbxZavedGetProc.Create(AOwner: TComponent);
begin
  inherited;
  ProcedureName := 'ABIT_Get_Zaved_abit';
end;

constructor TAbitMedalsGetProc.Create(AOwner: TComponent);
begin
  inherited;
  ProcedureName := 'ABIT_Get_Medal_abit';
end;

constructor TAbitSem_polGetProc.Create(AOwner: TComponent);
begin
  inherited;
  ProcedureName := 'ABIT_Get_sem_pol';
end;

constructor TAbitcmbxFamilyGetProc.Create(AOwner: TComponent);
begin
  inherited;
  ProcedureName := 'ABIT_Get_memb_fam';
end;

constructor TAbitcmbxLangGetProc.Create(AOwner: TComponent);
begin
  inherited;
  ProcedureName := 'ABIT_Get_Lang';
end;

constructor TAbitPodgotovkaGetProc.Create(AOwner: TComponent);
begin
  inherited;
  ProcedureName := 'ABIT_Get_Abit_podg';
end;

constructor TAbitSpec_facGetProc.Create(AOwner: TComponent);
begin
  inherited;
  ProcedureName := 'ABIT_Get_Relation_spec_fac';
end;

constructor TAbitKat_zachGetProc.Create(AOwner: TComponent);
begin
  inherited;
  ProcedureName := 'ABIT_Get_Kat_zach';
end;

constructor TAbitSost_zachGetProc.Create(AOwner: TComponent);
begin
  inherited;
  ProcedureName := 'ABIT_Get_Zach_abit';
end;

constructor TAbitDiscGetProc.Create(AOwner: TComponent);
begin
  inherited;
  ProcedureName := 'ABIT_Get_disc_abit';
end;

constructor TAbitVidsdGetProc.Create(AOwner: TComponent);
begin
  inherited;
  ProcedureName := 'ABIT_Get_sdacha_abit';
end;

procedure TAbitDeleteProc.DeleteAbit(NCode, NNAbit: integer);
begin
  try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@ncode',ftBCD,pdInput,0,NCode);
    Parameters.CreateParameter('@nn_abit',ftBCD,pdInput,0,NNAbit);
    ExecProc;
  except
    raise EAbitDeleteException.Create;
  end;
end;

procedure TAbitNotTableGetProc.GetData(NCode: integer);
begin
  try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@ncode',ftBCD,pdInput,0,NCode);
    ExecProc;
    Active:=true;
  except
    raise EAbitGetDataByNcodeException.Create;
  end;
end;

procedure TAbitDocsGetProc.GetData(NCode: integer);
begin
  try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@ncode',ftBCD,pdInput,0,NCode);
    ExecProc;
    Active:=true;
  except
    raise EAbitGetDataByNcodeException.Create;
  end;
end;

procedure TAbitZavedGetProc.GetData(NCode: integer);
begin
  try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@ncode',ftBCD,pdInput,0,NCode);
    ExecProc;
    Active:=true;
  except
    raise EAbitGetDataByNcodeException.Create;
  end;
end;

procedure TAbitRabGetProc.GetData(NCode: integer);
begin
  try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@ncode',ftBCD,pdInput,0,NCode);
    ExecProc;
    Active:=true;
  except
    raise EAbitGetDataByNcodeException.Create;
  end;
end;

procedure TAbitFamilyGetProc.GetData(NCode: integer);
begin
  try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@ncode',ftBCD,pdInput,0,NCode);
    ExecProc;
    Active:=true;
  except
    raise EAbitGetDataByNcodeException.Create;
  end;
end;

procedure TAbitDopGetProc.GetData(NCode: integer);
begin
  try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@ncode',ftBCD,pdInput,0,NCode);
    ExecProc;
    Active:=true;
  except
    raise EAbitGetDataByNcodeException.Create;
  end;
end;

procedure TAbitLangGetProc.GetData(NCode: integer);
begin
  try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@ncode',ftBCD,pdInput,0,NCode);
    ExecProc;
    Active:=true;
  except
    raise EAbitGetDataByNcodeException.Create;
  end;
end;

procedure TAbitPodgGetProc.GetData(NCode: integer);
begin
  try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@ncode',ftBCD,pdInput,0,NCode);
    ExecProc;
    Active:=true;
  except
    raise EAbitGetDataByNcodeException.Create;
  end;
end;

procedure TAbitPostupGetProc.GetData(NCode: integer);
begin
  try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@ncode',ftBCD,pdInput,0,NCode);
    ExecProc;
    Active:=true;
  except
    raise EAbitGetDataByNcodeException.Create;
  end;
end;

procedure TAbitLobGetProc.GetData(NCode: integer);
begin
  try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@ncode',ftBCD,pdInput,0,NCode);
    ExecProc;
    Active:=true;
  except
    raise EAbitGetDataByNcodeException.Create;
  end;
end;

procedure TAbitExamGetProc.GetData(NN_abit: integer);
begin
  try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@nnabit',ftBCD,pdInput,0,NN_abit);
    ExecProc;
    Active:=true;
  except
    raise EAbitGetDataByNcodeException.Create;
  end;
end;

{ EAbitDeleteException }

constructor EAbitDeleteException.Create;
begin
  inherited Create('Ќе удалось удалить абитуриента');
end;

{ EAbitGetDataByNcodeException }

constructor EAbitGetDataByNcodeException.Create;
begin
  inherited Create('Ќе удалось найти абитуриента');
end;

{ EAbitAddDataException }

constructor EAbitAddDataException.Create;
begin
  inherited Create('Ќе удалось добавить данные абитуриента');
end;

{ EAbitEditDataException }

constructor EAbitEditDataException.Create;
begin
  inherited Create('Ќе удалось отредактировать данные абитуриента');
end;

{ EAbitGetDataException }

constructor EAbitGetDataException.Create;
begin
  inherited Create('Ќе удалось извлечь данные');
end;
{
****************************** TAbitMainEditProc *******************************
}
constructor TAbitMainEditProc.Create(AOwner: TComponent);
begin
  inherited;
  ProcedureName := 'ABIT_Edit_abit';
end;

procedure TAbitMainEditProc.EditData(id:integer;clastname,cfirstname,cotch,cplace_birth:string;dd_birth:Tdatetime;csex:string;ik_nac,ik_grazd,ik_live:OleVariant;cadres_live,ctelefon:string;ik_sem_pol:OleVariant;ideti,ipens:integer;lrab:boolean;cgodokon:string;ik_zaved,ik_medal:OleVariant;ik_godn_voen_sl:boolean;lobchegit:boolean;ncode:integer);
begin
  try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@id',ftBCD,pdInput,0,id);
    Parameters.CreateParameter('@clastname',ftstring,pdInput,30,clastname);
    Parameters.CreateParameter('@cfirstname',ftstring,pdInput,30,cfirstname);
    Parameters.CreateParameter('@cotch',ftstring,pdInput,30,cotch);
    Parameters.CreateParameter('@cplace_birth',ftstring,pdInput,50,cplace_birth);
    Parameters.CreateParameter('@dd_birth',ftdatetime,pdInput,0,dd_birth);
    Parameters.CreateParameter('@csex',ftstring,pdInput,10,csex);
    Parameters.CreateParameter('@ik_nac',ftBCD,pdInput,0,ik_nac);
    Parameters.CreateParameter('@ik_grazd',ftBCD,pdInput,0,ik_grazd);
    Parameters.CreateParameter('@ik_live',ftBCD,pdInput,0,ik_live);
    Parameters.CreateParameter('@cadres_live',ftstring,pdInput,100,cadres_live);
    Parameters.CreateParameter('@ctelefon',ftstring,pdInput,20,ctelefon);
    Parameters.CreateParameter('@ik_sem_pol',ftBCD,pdInput,0,ik_sem_pol);
    Parameters.CreateParameter('@ideti',ftBCD,pdInput,0,ideti);
    Parameters.CreateParameter('@ipens',ftBCD,pdInput,0,0);
    if lrab=true then Parameters.CreateParameter('@lrab',ftBCD,pdInput,0,1)
    else Parameters.CreateParameter('@lrab',ftBCD,pdInput,0,0);
    Parameters.CreateParameter('@cgodokon',ftstring,pdInput,20,cgodokon);
    Parameters.CreateParameter('@ik_zaved',ftBCD,pdInput,0,ik_zaved);
    Parameters.CreateParameter('@ik_medal',ftBCD,pdInput,0,ik_medal);
    if ik_godn_voen_sl=true then Parameters.CreateParameter('@ik_godn_voen_sl',ftstring,pdInput,10,'√оден')
    else Parameters.CreateParameter('@ik_godn_voen_sl',ftstring,pdInput,10,'Ќе годен');
    if lobchegit=true then Parameters.CreateParameter('@lobchegit',ftBCD,pdInput,0,1)
    else Parameters.CreateParameter('@lobchegit',ftBCD,pdInput,0,0);
    Parameters.CreateParameter('@ncode',ftBCD,pdInput,0,ncode);
    ExecProc;
  except
    raise EAbitEditDataException.Create;
  end;
end;
{
****************************** TAbitOtherTabsEditProc *******************************
}
constructor TAbitOtherTabsEditProc.Create(AOwner: TComponent);
begin
  inherited;
  ProcedureName := 'ABIT_Edit_OtherTables';
end;

procedure TAbitOtherTabsEditProc.EditData(ncode:integer;cdopsved:string;ik_podg:Olevariant;id_ds,id_podg:integer);
begin
  try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@ncode',ftBCD,pdInput,0,ncode);
    Parameters.CreateParameter('@cdopsved',ftstring,pdInput,100,cdopsved);
    Parameters.CreateParameter('@ik_podg',ftBCD,pdInput,0,ik_podg);
    Parameters.CreateParameter('@id_ds',ftBCD,pdInput,0,id_ds);
    Parameters.CreateParameter('@id_podg',ftBCD,pdInput,0,id_podg);
    ExecProc;
  except
    raise EAbitEditDataException.Create;
  end;
end;
{
****************************** TAbitExamsEditProc *******************************
}
constructor TAbitExamsEditProc.Create(AOwner: TComponent);
begin
  inherited;
  ProcedureName := 'ABIT_Edit_vstup_ekz';
end;

procedure TAbitExamsEditProc.EditData(NNabit,ik_disc: integer;cosenka:string;ik_sdach:OleVariant;id:integer);
begin
  try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@NNabit',ftBCD,pdInput,0,NNabit);
    Parameters.CreateParameter('@ik_disc',ftBCD,pdInput,0,ik_disc);
    Parameters.CreateParameter('@cosenka',ftstring,pdInput,15,cosenka);
    Parameters.CreateParameter('@ik_sdach',ftBCD,pdInput,0,ik_sdach);
    Parameters.CreateParameter('@id',ftBCD,pdInput,0,id);
    ExecProc;
  except
    raise EAbitEditDataException.Create;
  end;
end;
{
****************************** TAbitLangsAbitEditProc *******************************
}
constructor TAbitLangsAbitEditProc.Create(AOwner: TComponent);
begin
  inherited;
  ProcedureName := 'ABIT_Edit_lang_abit';
end;

procedure TAbitLangsAbitEditProc.EditData(ncode,ik_lang: integer;id:integer);
begin
  try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@ncode',ftBCD,pdInput,0,ncode);
    Parameters.CreateParameter('@ik_lang',ftBCD,pdInput,0,ik_lang);
    Parameters.CreateParameter('@id',ftBCD,pdInput,0,id);
    ExecProc;
  except
    raise EAbitEditDataException.Create;
  end;
end;
{
****************************** TAbitRoditAbitEditProc *******************************
}
constructor TAbitRoditAbitEditProc.Create(AOwner: TComponent);
begin
  inherited;
  ProcedureName := 'ABIT_Edit_rodit_abit';
end;

procedure TAbitRoditAbitEditProc.EditData(Ncode,ik_memb_fam: integer; cfio_rods,cpost,cphone:string;id:integer);
begin
  try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@Ncode',ftBCD,pdInput,0,Ncode);
    Parameters.CreateParameter('@ik_memb_fam',ftBCD,pdInput,0,ik_memb_fam);
    Parameters.CreateParameter('@cfio_rods',ftstring,pdInput,100,cfio_rods);
    Parameters.CreateParameter('@cpost',ftstring,pdInput,100,cpost);
    Parameters.CreateParameter('@cphone',ftstring,pdInput,20,cphone);
    Parameters.CreateParameter('@id',ftBCD,pdInput,0,id);
    ExecProc;
  except
    raise EAbitAddDataException.Create;
  end;
end;

{
****************************** TAbitExamDeleteProc *******************************
}
constructor TAbitExamDeleteProc .Create(AOwner: TComponent);
begin
  inherited;
  ProcedureName := 'ABIT_Del_vstup_exam';
end;

procedure TAbitExamDeleteProc.DeleteAbit(id:integer);
begin
  try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@id',ftBCD,pdInput,0,id);
    ExecProc;
  except
    raise EAbitDeleteException.Create;
  end;
end;
{
****************************** TAbitLangsDeleteProc *******************************
}
constructor TAbitLangsDeleteProc .Create(AOwner: TComponent);
begin
  inherited;
  ProcedureName := 'ABIT_Del_lang_abit';
end;

procedure TAbitLangsDeleteProc.DeleteAbit(id:integer);
begin
  try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@id',ftBCD,pdInput,0,id);
    ExecProc;
  except
    raise EAbitDeleteException.Create;
  end;
end;
{
****************************** TAbitRoditAbitDeleteProc *******************************
}
constructor TAbitRoditAbitDeleteProc .Create(AOwner: TComponent);
begin
  inherited;
  ProcedureName := 'ABIT_Del_rodit_abit';
end;

procedure TAbitRoditAbitDeleteProc.DeleteAbit(id:integer);
begin
  try
    Active:=false;
    Parameters.Clear;
    Parameters.CreateParameter('@id',ftBCD,pdInput,0,id);
    ExecProc;
  except
    raise EAbitDeleteException.Create;
  end;
end;

{
****************************** TAbitDateForStatisticGet *******************************
}
constructor TAbitDateForStatisticGet.Create(AOwner: TComponent);
begin
  inherited;
  ProcedureName := 'ABIT_Get_postup_abit_dd_pod_zayav';
end;

{
****************************** TAbitStatisticDataNotExamGet *******************************
}
constructor TAbitStatisticDataNotExamGet.Create(AOwner: TComponent);
begin
  inherited;
  ProcedureName := 'ABIT_Get_postup_abit_statistic';
end;

procedure TAbitStatisticDataNotExamGet.GetData(nnyear:integer);
begin
 try
 Active:=false;
 Parameters.Clear;
 Parameters.CreateParameter('@nnyear',ftBCD,pdInput,0,nnyear);
 ExecProc;
 Active:=true;
 except
    raise EAbitGetDataException.Create;
  end;
end;

{
****************************** TAbitStatisticDataExamGet *******************************
}
constructor TAbitStatisticDataExamGet.Create(AOwner: TComponent);
begin
  inherited;
  ProcedureName := 'ABIT_Get_postup_abit_statistic_cosenka';
end;

procedure TAbitStatisticDataExamGet.GetData(nn_abit,ik_disc:integer);
begin
 try
 Active:=false;
 Parameters.Clear;
 Parameters.CreateParameter('@nn_abit',ftBCD,pdInput,0,nn_abit);
 Parameters.CreateParameter('@ik_disc',ftBCD,pdInput,0,ik_disc);
 ExecProc;
 Active:=true;
 except
    raise EAbitGetDataException.Create;
  end;
end;

{
****************************** TAbitOtchetStatisticAdd *******************************
}
constructor TAbitOtchetStatisticAdd.Create(AOwner: TComponent);
begin
  inherited;
  ProcedureName := 'ABIT_Add_Otchet';
end;

procedure TAbitOtchetStatisticAdd.AddData(date_form:Tdatetime;typ_doc:string);
begin
 try
 Active:=false;
 Parameters.Clear;
 Parameters.CreateParameter('@date_form',ftdatetime,pdInput,0,date_form);
 Parameters.CreateParameter('@typ_doc',ftstring,pdInput,100,typ_doc);
 ExecProc;
 except
    raise EAbitAddDataException.Create;
  end;
end;
{ TAbitFilialsGetProc }

constructor TAbitFilialsGetProc.Create(AOwner: TComponent);
begin
  inherited;
  ProcedureName := 'ABIT_get_Abit_Filials';
end;

end.
