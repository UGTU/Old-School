(*
  Модуль    : DBTVStudObj
  Категория : ..
  Версия: 1.0
  Автор : Куделин С. Г.

  Назначение: Объект Абитуриент в дереве
*)
unit DBTVStudAbitobj;

{ #Author sergdev@ist.ugtu.net }
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
  TDBNodeAbitStudObject = class(TDBNodeStudObject)
  private
    FNNAbit: integer;
    FReaDoNLY: boolean;
    FRegNum: integer;
    FRecruitState: integer;
    FIsPrior: boolean;
  public
    constructor Create(Node: TTreeNode; TreeView: TTreeView); override;
    procedure LoadData;
    property NNAbit: integer read FNNAbit write FNNAbit;
    property RegNum: integer read FRegNum write FRegNum;
    property OnlyReading: boolean read FReaDoNLY write FReaDoNLY;
    property RecruitState: integer read FRecruitState write FRecruitState;
    property IsPrior: boolean read FIsPrior write FIsPrior;
  end;

implementation

constructor TDBNodeAbitStudObject.Create(Node: TTreeNode; TreeView: TTreeView);
begin
  inherited Create(Node, TreeView);
  Actiongroup := 'catAbitActs';
end;

procedure TDBNodeAbitStudObject.LoadData;
var
  adr: TAdress;
begin
  if adodataset = nil then
    exit;
  adodataset.First;
  while not((adodataset.FieldValues['NN_abit'] = NNAbit) or (adodataset.Eof)) do
    adodataset.Next;

  Node.Text := adodataset.FieldValues['Namestud'];
  if (adodataset.FieldValues['cEmail'] <> NULL) and
    (adodataset.FieldValues['cEmail'] <> '') then
    Email := adodataset.FieldValues['cEmail'];

  if adodataset.FieldValues['dd_Birth'] <> NULL then
    BirthDate := adodataset.FieldValues['dd_Birth'];

  if adodataset.FieldValues['CSotTel'] <> NULL then
    Cellphone := adodataset.FieldValues['CSotTel'];
  if adodataset.FieldValues['Ctelefon'] <> NULL then
    Phone := adodataset.FieldValues['Ctelefon'];
  if adodataset.FieldValues['Ngodokon'] <> NULL then
    YearFinished := adodataset.FieldValues['Ngodokon'];
  if adodataset.FieldValues['Cdopsved'] <> NULL then
    AddInform := adodataset.FieldValues['Cdopsved'];
  if adodataset.FieldValues['Cfirstname'] <> NULL then
    FirstName := adodataset.FieldValues['Cfirstname'];
  if adodataset.FieldValues['Clastname'] <> NULL then
    LastName := adodataset.FieldValues['Clastname'];
  if adodataset.FieldValues['Cotch'] <> NULL then
    MiddleName := adodataset.FieldValues['Cotch'];
  if adodataset.FieldValues['Cplacebirth'] <> NULL then
    BirthPlace := adodataset.FieldValues['Cplacebirth'];
  if adodataset.FieldValues['Ldeti'] <> NULL then
    Children := adodataset.FieldValues['Ldeti'];
  if adodataset.FieldValues['Linval'] <> NULL then
    Invalid := adodataset.FieldValues['Linval'];
  if adodataset.FieldValues['Cmedal'] <> NULL then
    Medal := adodataset.FieldValues['Cmedal'];
  if adodataset.FieldValues['Lrab'] <> NULL then
    Job := adodataset.FieldValues['Lrab'];
  if adodataset.FieldValues['Lobchegit'] <> NULL then
    AppartmentNeed := adodataset.FieldValues['Lobchegit'];
  if adodataset.FieldValues['Cosnovan'] <> NULL then
    ExCause := adodataset.FieldValues['Cosnovan'];
  if adodataset.FieldValues['Lsex'] <> NULL then
    Sex := adodataset.FieldValues['Lsex'];
  if adodataset.FieldValues['csem_pol'] <> NULL then
    FamState := adodataset.FieldValues['csem_pol'];
  if adodataset.FieldValues['cName_zaved'] <> NULL then
    Finished := adodataset.FieldValues['cName_zaved'];
  if adodataset.FieldValues['c_grazd'] <> NULL then
    Citizenship := adodataset.FieldValues['c_grazd'];
  if adodataset.FieldValues['cname_ob_rab'] <> NULL then
    SocJob := adodataset.FieldValues['cname_ob_rab'];
  if adodataset.FieldValues['cname_podg'] <> NULL then
    Preparation := adodataset.FieldValues['cname_podg'];
  if adodataset.FieldValues['cspecial_uchet'] <> NULL then
    SpecCount := adodataset.FieldValues['cspecial_uchet'];
  if adodataset.FieldValues['cdopsved'] <> NULL then
    AddInform := adodataset.FieldValues['cdopsved'];

  if (adodataset.FieldByName('Photo').AsBytes <> NULL) and
    (adodataset.FieldByName('Photo').AsString <> '') then
  begin
    Photo := TMemoryStream.Create;
    (adodataset.FieldByName('Photo') as TBlobField).SaveToStream(Photo);
  end
  else
    Photo := nil;

  if (adodataset.FieldValues['Build_fact'] <> NULL) and
    (adodataset.FieldValues['Build_fact'] <> '') then
    adr.House := adodataset.FieldValues['Build_fact'];
  if (adodataset.FieldValues['Kvart_fact'] <> NULL) and
    (adodataset.FieldValues['Kvart_fact'] <> '') then
    adr.flat := adodataset.FieldValues['Kvart_fact'];
  if adodataset.FieldValues['cstranaf'] <> NULL then
    adr.Country := adodataset.FieldValues['cstranaf'];
  if adodataset.FieldValues['cregionf'] <> NULL then
    adr.Region := adodataset.FieldValues['cregionf'];
  if adodataset.FieldValues['craionf'] <> NULL then
    adr.Area := adodataset.FieldValues['craionf'];
  if adodataset.FieldValues['cgorodf'] <> NULL then
    adr.Point := adodataset.FieldValues['cgorodf'];
  if adodataset.FieldValues['cstreetf'] <> NULL then
    adr.Street := adodataset.FieldValues['cstreetf'];
  if (adodataset.FieldValues['cindexf'] <> NULL) and
    (adodataset.FieldValues['cindexf'] <> '') then
    adr.MailIndex := adodataset.FieldValues['cindexf'];

  if adodataset.FieldValues['ik_streetf'] <> NULL then
    ikStreetf := adodataset.FieldValues['ik_streetf'];
  if adodataset.FieldValues['ik_street'] <> NULL then
    ikStreets := adodataset.FieldValues['ik_street'];

  FactAdress := adr;

  if (adodataset.FieldValues['Build_prop'] <> NULL) and
    (adodataset.FieldValues['Build_prop'] <> '') then
    adr.House := adodataset.FieldValues['Build_prop'];
  if (adodataset.FieldValues['Kvart_prop'] <> NULL) and
    (adodataset.FieldValues['Kvart_prop'] <> '') then
    adr.flat := adodataset.FieldValues['Kvart_prop'];
  if adodataset.FieldValues['cstrana'] <> NULL then
    adr.Country := adodataset.FieldValues['cstrana'];
  if adodataset.FieldValues['cregion'] <> NULL then
    adr.Region := adodataset.FieldValues['cregion'];
  if adodataset.FieldValues['craion'] <> NULL then
    adr.Area := adodataset.FieldValues['craion'];
  if adodataset.FieldValues['cgorod'] <> NULL then
    adr.Point := adodataset.FieldValues['cgorod'];
  if adodataset.FieldValues['cstreet'] <> NULL then
    adr.Street := adodataset.FieldValues['cstreet'];
  if (adodataset.FieldValues['cindex'] <> NULL) and
    (adodataset.FieldValues['cindex'] <> '') then
    adr.MailIndex := adodataset.FieldValues['cindex'];

  if (adodataset.FieldValues['ik_pred'] <> NULL) then
    EnterpriseID := adodataset.FieldValues['ik_pred'];
  if (adodataset.FieldValues['cDolgnost'] <> NULL) and
    (adodataset.FieldValues['cDolgnost'] <> '') then
    Duty := adodataset.FieldValues['cDolgnost'];
  if adodataset.FieldValues['StazYear'] <> NULL then
    Xpyears := adodataset.FieldValues['StazYear'];
  if adodataset.FieldValues['StazMonth'] <> NULL then
    Xpmonths := adodataset.FieldValues['StazMonth'];

  if adodataset.FieldValues['clgot'] <> NULL then
    Benefits := adodataset.FieldValues['clgot'];
  if adodataset.FieldValues['ik_voen_zvanie'] <> NULL then
    MilitaryStateKey := adodataset.FieldValues['ik_voen_zvanie'];
  if adodataset.FieldValues['cvoen_zvanie'] <> NULL then
    MilitaryState := adodataset.FieldValues['cvoen_zvanie'];

  if (adodataset.FieldValues['ik_zach'] <> NULL) then
    RecruitState := adodataset.FieldValues['ik_zach'];

  if (adodataset.FieldValues['ik_zach'] <> NULL) then
    if (adodataset.FieldValues['ik_zach'] = 3) or
      (adodataset.FieldValues['ik_zach'] = 2) then
      OnlyReading := true
    else
      OnlyReading := false;

  SignAdress := adr;

end;

end.
