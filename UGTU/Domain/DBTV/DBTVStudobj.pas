(*
  Модуль    : DBTVStudObj
  Категория : ..
  Версия: 1.0
  Автор : Куделин С. Г.

  Назначение: Объект студент в дереве
*)
unit DBTVStudobj;
{#Author sergdev@ist.ugtu.net}
interface
uses
Dialogs,
  DBTVObj,
  SysUtils,
  comctrls,
  db,
  ADODB,
  graphics,
  Variants,
  Classes;

  type TAdress = record
  Country,Region,Area,Point,MailIndex,Street,House:string;
  Flat:string;
  end;
   type TStudentState=(ssExiled,ssActual,ssAcadem,ssGhost);


  type
    TDBNodeStudObject = class (TDBNodeObject)
    private
     FikStreetf:integer;
      FikStreets:integer;
      FName:string;
      FEnterpriseID,FRecordBookKey,FStudGrupKey, FOrderEnterID,FOrderExileID, FCategoryID,FCauseExileID,FCauseEnterID,FMilitaryStateIk :integer;
      FFirstName,FLastName,FMiddleName,FDuty,FMilitaryState:string;
      FBirthDate:TDateTime;
      FSex:Boolean;
      FFinished:string;
      FYearFinished,FXPyears,FXPMonths:integer;
      FCategory:string;
      FEmail,FRecordBookNum:string;
      FFactAdress:TAdress;
      FSignAdress:TAdress;
      FMedal,FPhone,FCellphone:string;
      FCitizenship,FBirthPlace:string;
      FPreparation, FSocJob,FSpecCount,FExCause,FAddInform,fFamState:string;
      FChildren,FInvalid,FAppartmentNeed,FJob:boolean;
      FState:TStudentState;
      FPhoto:Tmemorystream;
      FIK:integer;
      FDataSet: TADODataSet;
      FBenefits:string;
    public
    constructor Create(Node:TTreeNode; TreeView:TTreeView); override;
    procedure LoadData;
    function DoAddChildNodes: Boolean; override;

    property Sex: boolean read FSex write FSex;
    property Finished: string read FFinished write FFinished;
    property YearFinished: integer read FYearFinished write FYearFinished;
    property Category: string read FCategory write FCategory;
    property FactAdress: TAdress read FFactAdress write FFactAdress;
    property SignAdress: TAdress read FSignAdress write FSignAdress;
    property Citizenship: string read FCitizenship write FCitizenship;
    property BirthPlace: string read FBirthPlace write FBirthPlace;
    property Preparation: string read FPreparation write FPreparation;
    property SocJob: string read FSocJob write FSocJob;
    property SpecCount: string read FSpecCount write FSpecCount;
    property ExCause: string read FExCause write FExCause;
    property AddInform: string read FAddInform write FAddInform;
    property Medal: string read FMedal write FMedal;
    property Children: boolean read FChildren write FChildren;
    property Invalid: boolean read FInvalid write FInvalid;
    property AppartmentNeed: boolean read FAppartmentNeed write FAppartmentNeed;
    property Job: boolean read FJob write FJob;
    property Phone: string read FPhone write FPhone;
    property CellPhone: string read FCellPhone write FCellPhone;
    property State: TStudentState read FState write FState;
    procedure Refresh;
    property Name: string read FName write FName;
    property FirstName: string read FFirstName write FFirstName;
    property LastName: string read FLastName write FLastName;
    property FamState: string read fFamState write fFamState;
    property MiddleName: string read FMiddleName write FMiddleName;
    property BirthDate: TDateTime read FBirthDate write FBirthDate;
    property Email:string  read FEmail write FEmail;
    property OrderEnterId:integer  read FOrderEnterId write FOrderEnterId ;
    property ik: integer read Fik write Fik;
    property RecordbookNum: string read FRecordbookNum write FRecordbookNum;
    property StudGrupKey: integer read FStudGrupKey write FStudGrupKey;
    property RecordbookKey: integer read FRecordbookKey write FRecordbookKey;
    property AdoDataset: TAdoDataSet read FDataSet write FDataSet;
    property MilitaryStateKey: integer read FMilitaryStateIk write FMilitaryStateIk;
    property MilitaryState: string read FMilitaryState write FMilitaryState;
    property Duty: string read FDuty write FDuty;
    property Photo:Tmemorystream read FPhoto write FPhoto;
    property OrderExileID: integer read FOrderExileID write FOrderExileID;
    property CategoryID: integer read FCategoryID write FCategoryID;
    property CauseExileID: integer read FCauseExileID write FCauseExileID;
    property CauseEnterID: integer read FCauseEnterID write FCauseEnterID;
    property EnterpriseID: integer read FEnterpriseID write FEnterpriseID;
    property Xpyears: integer read FXpyears write FXpyears;
    property xpMonths: integer read FxpMonths write FxpMonths;
    property Benefits: string read FBenefits write FBenefits;
    property ikStreets:integer read FikStreets write FikStreets;
    property ikStreetf:integer read FikStreetf write FikStreetf;
    end;

implementation
  constructor TDBNodeStudObject.Create(Node:TTreeNode; TreeView:TTreeView);
  begin
  inherited Create(Node,TreeView,true);
  Actiongroup:='catStudActs';
  end;

  procedure TDBNodeStudObject.Refresh;
  begin
  LoadData;
ik:=AdoDataset.FieldValues['ik_zach'];
id:=ik;
name:=Fname;
BaseImageIndex:=9;
Node.Text:=name;
Node.ImageIndex:=BaseImageIndex;

if (AdoDataSet.FieldValues['Ik_prikazOtch']<>NULL) then
begin
State:=ssGhost;
BaseImageIndex:=25;
node.ImageIndex:=BaseImageIndex;
end;

//если причина отчисления - отчисление
if (AdoDataSet.FieldValues['ikTypePricOtch']='2')and(AdoDataSet.FieldValues['Ik_prikazOtch']<>NULL) then
begin
State:=ssExiled;
BaseImageIndex:=12;
node.ImageIndex:=BaseImageIndex;
end;

if (AdoDataSet.FieldValues['Ik_prikazOtch']=NULL) then
State:=ssActual;

if (AdoDataSet.FieldValues['ik_pricZach']='13')and((AdoDataSet.FieldValues['Ik_prikazZach']=NULL)) then
begin
State:=ssAcadem;
BaseImageIndex:=11;
node.ImageIndex:=BaseImageIndex;
end;

id:=AdoDataSet.FieldValues['ncode'];

  end;

 function TDBNodeStudObject.DoAddChildNodes: Boolean;
  begin
  result:=false;
  end;


  procedure TDBNodeStudObject.LoadData;
  var adr:TAdress;
  begin
   AdoDataset.First;
   while not ((AdoDataset.FieldValues['ik_zach']=ik)or(adoDataset.Eof)) do
   AdoDataset.Next;

id:=AdoDataSet.FieldValues['ncode'];

if (adoDataSet.FieldValues['ik_studgrup']<>NULL) then
StudGrupKey:=AdoDataSet.FieldValues['ik_studgrup'];
if (adoDataSet.FieldValues['ik_prikazZach']<>NULL) then
OrderEnterID:=AdoDataSet.FieldValues['ik_prikazZach'];
if (adoDataSet.FieldValues['ik_prikazOtch']<>NULL) then
OrderExileID:=AdoDataSet.FieldValues['ik_prikazOtch'];
if (adoDataSet.FieldValues['ik_pricZach']<>NULL) then
CauseEnterID:=AdoDataSet.FieldValues['ik_pricZach'];
if (adoDataSet.FieldValues['ik_pricOtch']<>NULL) then
CauseExileID:=AdoDataSet.FieldValues['ik_pricOtch'];
if (adoDataSet.FieldValues['ik_kat_Zach']<>NULL) then
CategoryID:=AdoDataSet.FieldValues['ik_kat_Zach'];

if (adoDataSet.FieldValues['cEmail']<>NULL)and(adoDataSet.FieldValues['cEmail']<>'') then
Email:=AdoDataSet.FieldValues['cEmail'];
if adoDataSet.FieldValues['nn_zach']<>NULL then
RecordbookNum:=AdoDataSet.FieldValues['nn_zach'];
if adoDataSet.FieldValues['ik_zach']<>NULL then
RecordbookKey:=AdoDataSet.FieldValues['ik_zach'];
if adoDataSet.FieldValues['dd_Birth']<>NULL then
BirthDate:=AdoDataSet.FieldValues['dd_Birth'];
if AdoDataSet.FieldValues['Cname_kat_zach']<>NULL then
Category:=AdoDataSet.FieldValues['Cname_kat_zach'];
if AdoDataSet.FieldValues['CSotTel']<>NULL then
Cellphone:=AdoDataSet.FieldValues['CSotTel'];
if AdoDataSet.FieldValues['Ctelefon']<>NULL then
Phone:=AdoDataSet.FieldValues['Ctelefon'];
if AdoDataSet.FieldValues['Ngodokon']<>NULL then
YearFinished:=AdoDataSet.FieldValues['Ngodokon'];
if AdoDataSet.FieldValues['Cdopsved']<>NULL then
AddInform:=AdoDataSet.FieldValues['Cdopsved'];
if AdoDataSet.FieldValues['Cfirstname']<>NULL then
FirstName:=AdoDataSet.FieldValues['Cfirstname'];
if AdoDataSet.FieldValues['Clastname']<>NULL then
LastName:=AdoDataSet.FieldValues['Clastname'];
if AdoDataSet.FieldValues['Cotch']<>NULL then
MiddleName:=AdoDataSet.FieldValues['Cotch']
else MiddleName:='';
if AdoDataSet.FieldValues['Cplacebirth']<>NULL then
BirthPlace:=AdoDataSet.FieldValues['Cplacebirth'];
if AdoDataSet.FieldValues['Ldeti']<>NULL then
Children:=AdoDataSet.FieldValues['Ldeti'];
if AdoDataSet.FieldValues['Linval']<>NULL then
Invalid:=AdoDataSet.FieldValues['Linval'];
if AdoDataSet.FieldValues['Cmedal']<>NULL then
Medal:=AdoDataSet.FieldValues['Cmedal'];
if AdoDataSet.FieldValues['Lrab']<>NULL then
Job:=AdoDataSet.FieldValues['Lrab'];
if AdoDataSet.FieldValues['Lobchegit']<>NULL then
AppartmentNeed:=AdoDataSet.FieldValues['Lobchegit'];
if AdoDataSet.FieldValues['Lsex']<>NULL then
Sex:=AdoDataSet.FieldValues['Lsex'];
if adoDataSet.FieldValues['csem_pol']<>NULL then
FamState:=AdoDataSet.FieldValues['csem_pol'];
if adoDataSet.FieldValues['cName_zaved']<>NULL then
Finished:=AdoDataSet.FieldValues['cName_zaved'];
if adoDataSet.FieldValues['c_grazd']<>NULL then
Citizenship:=AdoDataSet.FieldValues['c_grazd'];
if adoDataSet.FieldValues['cname_ob_rab']<>NULL then
SocJob:=AdoDataSet.FieldValues['cname_ob_rab'];
if adoDataSet.FieldValues['cname_podg']<>NULL then
Preparation:=AdoDataSet.FieldValues['cname_podg'];
if adoDataSet.FieldValues['cspecial_uchet']<>NULL then
SpecCount:=AdoDataSet.FieldValues['cspecial_uchet'];
if adoDataSet.FieldValues['cdopsved']<>NULL then
AddInform:=AdoDataSet.FieldValues['cdopsved'];

if (adoDataSet.FieldValues['Photo']<>NULL)and(adoDataSet.FieldValues['Photo']<>'') then begin
  Photo:=TMemoryStream.Create;
  (AdoDataSet.FieldbyName('Photo')as TBlobField).SaveToStream(Photo);
end else
Photo:=nil;

if (AdoDataSet.FieldValues['Build_fact']<>NULL)and(AdoDataSet.FieldValues['Build_fact']<>'') then
adr.House:=AdoDataSet.FieldValues['Build_fact'];
if (AdoDataSet.FieldValues['Kvart_fact']<>NULL)and(AdoDataSet.FieldValues['Kvart_fact']<>'') then
adr.flat:=AdoDataSet.FieldValues['Kvart_fact'];
if AdoDataSet.FieldValues['cstranaf']<>NULL then
adr.Country:=AdoDataSet.FieldValues['cstranaf'];
if AdoDataSet.FieldValues['cregionf']<>NULL then
adr.Region:=AdoDataSet.FieldValues['cregionf'];
if AdoDataSet.FieldValues['craionf']<>NULL then
adr.Area:=AdoDataSet.FieldValues['craionf'];
if AdoDataSet.FieldValues['cgorodf']<>NULL then
adr.Point:=AdoDataSet.FieldValues['cgorodf'];
if AdoDataSet.FieldValues['cstreetf']<>NULL then
adr.Street:=AdoDataSet.FieldValues['cstreetf'];
if (AdoDataSet.FieldValues['cindexf']<>NULL)and(AdoDataSet.FieldValues['cindexf']<>'') then
adr.MailIndex:=AdoDataSet.FieldValues['cindexf'];

FactAdress:=adr;

if (AdoDataSet.FieldValues['Build_prop']<>NULL)and(AdoDataSet.FieldValues['Build_prop']<>'') then
adr.House:=AdoDataSet.FieldValues['Build_prop'];
if (AdoDataSet.FieldValues['Kvart_prop']<>NULL)and(AdoDataSet.FieldValues['Kvart_prop']<>'') then
adr.flat:=AdoDataSet.FieldValues['Kvart_prop'];
if AdoDataSet.FieldValues['cstrana']<>NULL then
adr.Country:=AdoDataSet.FieldValues['cstrana'];
if AdoDataSet.FieldValues['cregion']<>NULL then
adr.Region:=AdoDataSet.FieldValues['cregion'];
if AdoDataSet.FieldValues['craion']<>NULL then
adr.Area:=AdoDataSet.FieldValues['craion'];
if AdoDataSet.FieldValues['cgorod']<>NULL then
adr.Point:=AdoDataSet.FieldValues['cgorod'];
if AdoDataSet.FieldValues['cstreet']<>NULL then
adr.Street:=AdoDataSet.FieldValues['cstreet'];
if (AdoDataSet.FieldValues['cindex']<>NULL)and(AdoDataSet.FieldValues['cindex']<>'') then
adr.MailIndex:=AdoDataSet.FieldValues['cindex'];
SignAdress:=adr;

if (AdoDataSet.FieldValues['ik_pred']<>NULL) then
EnterpriseID:=AdoDataSet.FieldValues['ik_pred'];
if (AdoDataSet.FieldValues['cDolgnost']<>NULL)and(AdoDataSet.FieldValues['cDolgnost']<>'') then
Duty:=AdoDataSet.FieldValues['cDolgnost'];
if AdoDataSet.FieldValues['StazYear']<>NULL then
Xpyears:=AdoDataSet.FieldValues['StazYear'];
if AdoDataSet.FieldValues['StazMonth']<>NULL then
Xpmonths:=AdoDataSet.FieldValues['StazMonth'];
if AdoDataSet.FieldValues['ik_voen_zvanie']<>NULL then
MilitaryStateKey:=AdoDataSet.FieldValues['ik_voen_zvanie'];
if AdoDataSet.FieldValues['cvoen_zvanie']<>NULL then
MilitaryState:=AdoDataSet.FieldValues['cvoen_zvanie'];

if AdoDataSet.FieldValues['clgot']<>NULL then
Benefits:=AdoDataSet.FieldValues['clgot'];

end;

end.
