
(*
  Категория : ..
  Версия: 0.5
  Автор : Куделин С. Г.

  Назначение: Объект "Персона" ветки "Проживающие" в дереве
*)
unit DBTVHostelRootPersonobj;
  {#Author sergdev@ist.ugtu.net}
interface
uses  Dialogs,
  DBTVObj,
  DBTV,
  SysUtils,
  comctrls,
  db,
  graphics,
  ADODB,
  Variants,
  DateUtils;


  type TAdress = record

  end;
  type
  TDBNodeHostelRootPersonObject = class (TDBNodeObject)
  private
  FName:string;
  FFirstName:string;
  FLastName,FMiddleName,FDuty,FMilitaryState:string;
  FBirthDate:TDateTime;
  FSex:Boolean;
  FEmail:string;
  FCellphone:string;
  FNationality, FCitizenship,FBirthPlace:string;
  FEnterpriseID,FMilitaryStateIk,FRecordBookKey :integer;
 // FPhoto:Tmemorystream;
  FChildren,FInvalid,FAppartmentNeed,FJob:boolean;
  //FDataSet: TADODataSet;


  protected
    function DoAddChildNodes: Boolean; override;
  public
    ncode:integer;
    procedure LoadData;
    //procedure Refresh;
    function SetADODataset(Connection:TAdoConnection):TAdodataset;
    procedure AddChild(Caption:string;IK:integer;HasAddSpec:boolean);
    property Name: string read FName write FName;
    property FirstName: string read FFirstName write FFirstName;
    property LastName: string read FLastName write FLastName;
    property MiddleName: string read FMiddleName write FMiddleName;
    property BirthDate: TDateTime read FBirthDate write FBirthDate;
    property Email:string  read FEmail write FEmail;
    property CellPhone: string read FCellPhone write FCellPhone;
    property Sex: boolean read FSex write FSex;
    property BirthPlace: string read FBirthPlace write FBirthPlace;
    property Nationality: string read FNationality write FNationality;
    property Citizenship: string read FCitizenship write FCitizenship;
    property MilitaryStateKey: integer read FMilitaryStateIk write FMilitaryStateIk;
    property EnterpriseID: integer read FEnterpriseID write FEnterpriseID;
    property Duty: string read FDuty write FDuty;
   // property Photo:Tmemorystream read FPhoto write FPhoto;
    property Children: boolean read FChildren write FChildren;
    property Invalid: boolean read FInvalid write FInvalid;
    property AppartmentNeed: boolean read FAppartmentNeed write FAppartmentNeed;
    property Job: boolean read FJob write FJob;
    property RecordbookKey: integer read FRecordbookKey write FRecordbookKey;


  end;

implementation



function TDBNodeHostelRootPersonObject.SetADODataset(Connection:TAdoConnection):TAdodataset;
begin
 //no implementation required
end;


procedure TDBNodeHostelRootPersonObject.AddChild;
begin
 //no implementation required
 //result:= false;
end;

function TDBNodeHostelRootPersonObject.DoAddChildNodes: Boolean;
begin

//no implementation required
  result:= false;
end;

 procedure TDBNodeHostelRootPersonObject.LoadData;
  var adr:TAdress;
  begin
   Dataset.Locate('ncode', ncode, [loPartialKey]);


id:=DataSet.FieldValues['ncode'];

if (DataSet.FieldValues['cEmail']<>NULL)and(DataSet.FieldValues['cEmail']<>'') then
Email:=DataSet.FieldValues['cEmail'];
if DataSet.FieldValues['dd_Birth']<>NULL then
BirthDate:=DataSet.FieldValues['dd_Birth'];
if DataSet.FieldValues['CSotTel']<>NULL then
Cellphone:=DataSet.FieldValues['CSotTel'];
if DataSet.FieldValues['Cfirstname']<>NULL then
FirstName:=DataSet.FieldValues['Cfirstname'];
if DataSet.FieldValues['Clastname']<>NULL then
LastName:=DataSet.FieldValues['Clastname'];
if DataSet.FieldValues['Cotch']<>NULL then
MiddleName:=DataSet.FieldValues['Cotch'];
if DataSet.FieldValues['Cplacebirth']<>NULL then
BirthPlace:=DataSet.FieldValues['Cplacebirth'];
if DataSet.FieldValues['Ldeti']<>NULL then
Children:=DataSet.FieldValues['Ldeti'];
if DataSet.FieldValues['Linval']<>NULL then
Invalid:=DataSet.FieldValues['Linval'];
if DataSet.FieldValues['Lrab']<>NULL then
Job:=DataSet.FieldValues['Lrab'];
if DataSet.FieldValues['Lobchegit']<>NULL then
AppartmentNeed:=DataSet.FieldValues['Lobchegit'];
if DataSet.FieldValues['Lsex']<>NULL then
Sex:=DataSet.FieldValues['Lsex'];

if DataSet.FieldValues['c_grazd']<>NULL then
Citizenship:=DataSet.FieldValues['c_grazd'];
if DataSet.FieldValues['cname_nac']<>NULL then
Nationality:=DataSet.FieldValues['cname_nac'];


{if (adoDataSet.FieldValues['Photo']<>NULL)and(adoDataSet.FieldValues['Photo']<>'') then begin
  Photo:=TMemoryStream.Create;
  (AdoDataSet.FieldbyName('Photo')as TBlobField).SaveToStream(Photo);
end else
Photo:=nil; }

if (DataSet.FieldValues['cDolgnost']<>NULL)and(DataSet.FieldValues['cDolgnost']<>'') then
Duty:=DataSet.FieldValues['cDolgnost'];
if DataSet.FieldValues['ik_voen_zvanie']<>NULL then
MilitaryStateKey:=DataSet.FieldValues['ik_voen_zvanie'];


  end;

end.



