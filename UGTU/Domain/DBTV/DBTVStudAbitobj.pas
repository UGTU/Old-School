(*
  Модуль    : DBTVStudObj
  Категория : ..
  Версия: 1.0
  Автор : Куделин С. Г.

  Назначение: Объект Абитуриент в дереве
*)
unit DBTVStudAbitobj;
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
  Classes,
  DBTVStudObj;


  type
    TDBNodeAbitStudObject = class (TDBNodeStudObject)
    private
      FNNAbit:integer;
      FReaDoNLY:boolean;
      FRegNum:integer;
      FRecruitState:integer;
      FIsPrior:boolean;
    public
    constructor Create(Node:TTreeNode; TreeView:TTreeView); override;
    procedure LoadData;
    property NNAbit:integer read FNNAbit write FNNAbit;
    property RegNum:integer read FRegNum write FRegNum;
    property OnlyReading:boolean read FReaDoNLY write FReaDoNLY;
    property RecruitState:integer read FRecruitState write FRecruitState;
    property IsPrior:boolean read FIsPrior write FIsPrior;
    end;

implementation
 constructor TDBNodeAbitStudObject.Create(Node:TTreeNode; TreeView:TTreeView);
  begin
  inherited Create(Node,TreeView);
  Actiongroup:='catAbitActs';
  end;

 procedure TDBNodeAbitStudObject.LoadData;
  var adr:TAdress;
  begin
  if adodataset=nil then exit;
   AdoDataset.First;
   while not ((AdoDataset.FieldValues['NN_abit']=NNAbit)or(adoDataset.Eof)) do
   AdoDataset.Next;

node.Text:=adoDataSet.FieldValues['Namestud'];
if (adoDataSet.FieldValues['cEmail']<>NULL)and(adoDataSet.FieldValues['cEmail']<>'') then
Email:=AdoDataSet.FieldValues['cEmail'];

if adoDataSet.FieldValues['dd_Birth']<>NULL then
BirthDate:=AdoDataSet.FieldValues['dd_Birth'];

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
MiddleName:=AdoDataSet.FieldValues['Cotch'];
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
if AdoDataSet.FieldValues['Cosnovan']<>NULL then
ExCause:=AdoDataSet.FieldValues['Cosnovan'];
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

if (adoDataSet.FieldByName('Photo').AsBytes <> NULL)and(adoDataSet.FieldByName('Photo').AsString <> '') then
begin
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

if AdoDataSet.FieldValues['ik_streetf']<>NULL then
ikStreetf:=AdoDataSet.FieldValues['ik_streetf'];
if AdoDataSet.FieldValues['ik_street']<>NULL then
ikStreets:=AdoDataSet.FieldValues['ik_street'];

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

if (AdoDataSet.FieldValues['ik_pred']<>NULL) then
EnterpriseID:=AdoDataSet.FieldValues['ik_pred'];
if (AdoDataSet.FieldValues['cDolgnost']<>NULL)and(AdoDataSet.FieldValues['cDolgnost']<>'') then
Duty:=AdoDataSet.FieldValues['cDolgnost'];
if AdoDataSet.FieldValues['StazYear']<>NULL then
Xpyears:=AdoDataSet.FieldValues['StazYear'];
if AdoDataSet.FieldValues['StazMonth']<>NULL then
Xpmonths:=AdoDataSet.FieldValues['StazMonth'];

if AdoDataSet.FieldValues['clgot']<>NULL then
Benefits:=AdoDataSet.FieldValues['clgot'];
if AdoDataSet.FieldValues['ik_voen_zvanie']<>NULL then
MilitaryStateKey:=AdoDataSet.FieldValues['ik_voen_zvanie'];
if AdoDataSet.FieldValues['cvoen_zvanie']<>NULL then
MilitaryState:=AdoDataSet.FieldValues['cvoen_zvanie'];

if (AdoDataSet.FieldValues['ik_zach']<>NULL) then
RecruitState := AdoDataSet.FieldValues['ik_zach'];

if (AdoDataSet.FieldValues['ik_zach']<>NULL) then
if (AdoDataSet.FieldValues['ik_zach']=3)or(AdoDataSet.FieldValues['ik_zach']=2) then
onlyReading:=true else
onlyReading:=false;

SignAdress:=adr;

  end;

end.
