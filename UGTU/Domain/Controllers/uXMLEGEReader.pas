unit uXMLEGEReader;

interface
uses
  Windows, Forms, ComObj, SysUtils, Classes, Dialogs, Registry, XMLDoc, XMLIntf, Variants;

  type

  TExamDescription = class
  private
    FSubject:string;
    FMark:real;
    FIsAppealed:boolean;
    FCertNumber:string;
  public
    constructor Create(XMLNode:IXMLNode);

    property     Subject:string read FSubject;
    property     Mark:real read FMark;
    property     IsAppealed:boolean  read FIsAppealed;
    property     CertNumber:string read FCertNumber write FCertNumber;
  end;

  TCertificateDescription = class
  private
    FLastName:string;
    FFirstName:string;
    FPatronName:string;

    FPassportSeria:string;
    FpassportNumber:string;
    FCertificateNumber:string;
    FTypographicNumber:string;
    FYear:integer;
    Fstatus:string;
    FUniqueIHEaFCheck:integer;
    FIsDenied:boolean;
    FCertificateNewNumber:string;
    FCertificateDenyComment:string;

    FMarks:TList;
  public
    constructor Create(XMLNode:IXMLNode);

    procedure AddExamDescription(ed:TExamDescription);

    property     LastName:string read FLastName;
    property     FirstName:string read FFirstName;
    property     PatronName:string read FPatronName;

    property     CertificateNumber:string read FCertificateNumber;
    property     TypographicNumber:string read FTypographicNumber;
    property     Year:integer  read FYear;
    property     status:string read Fstatus;
    property     UniqueIHEaFCheck:integer read FUniqueIHEaFCheck;
    property     IsDenied:boolean read FIsDenied;
    property     CertificateNewNumber:string read FCertificateNewNumber;
    property     CertificateDenyComment:string read FCertificateDenyComment;
    property     Marks : TList read FMarks;
  end;

   TXMLEGEReader = class
    private
    FXML:TXmlDocument;
    public
    constructor Create(XML:TXmlDocument); overload;
    constructor Create(filename:string); overload;
    constructor Create(XMLstring: WideString); overload;
    //function GetErrorDescriptionFromXML(E:Exception):TErrorDescription;
    function GetXML:TXMLDocument;
    function GetCertificateDescriptions:TList;
  end;

implementation

constructor TXMLEGEReader.Create(XML: TXmlDocument);
begin
FXML:=XML;
end;

constructor TXMLEGEReader.Create(filename:string);
begin
  try
  FXML := TXMLDocument.Create(nil);
  (FXML as IXMLDocument)._AddRef;
   FXML.LoadFromFile(filename);
  except
   self.FXML:=nil;
  end;
end;

constructor TXMLEGEReader.Create(XMLstring: WideString);
var stream:TMemoryStream;
US1,US2:string;
begin
  try
  FXML := TXMLDocument.Create(nil);
  (FXML as IXMLDocument)._AddRef;


  US1 := AnsiToUtf8(XMLstring);

  stream := TMemoryStream.Create;
  stream.Write(PUTF8String(US1)^, Length(US1));
  SetLength(US2, stream.Size);
  stream.Position := 0;
  stream.Read(PUTF8String(US2)^, stream.Size);
  stream.Position := 0;

  FXML.LoadFromStream(stream);
  except
   FXML:=nil;
  end;
end;

function TXMLEGEReader.GetCertificateDescriptions: TList;
var XMLNode,CertNode:IXMLNode;
i:integer;
begin
  Result:=TList.Create;

  XMLNode:=FXML.ChildNodes[1];

  for i:= 0 to XMLNode.ChildNodes.Count - 1 do
  Result.Add(TCertificateDescription.Create(XMLNode.ChildNodes[i]));

end;

function TXMLEGEReader.GetXML: TXMLDocument;
begin
result:= FXML;
end;

{ TExamDescription }

constructor TExamDescription.Create(XMLNode: IXMLNode);
begin
if XMLNode.ChildValues['subjectName']<>null then
    FSubject:=XMLNode.ChildValues['subjectName'];

  if XMLNode.ChildValues['subjectMark']<>null then
    FMark:=XMLNode.ChildValues['subjectMark'];

  if XMLNode.ChildValues['subjectAppeal']<>null then
    FIsAppealed:=(XMLNode.ChildValues['subjectAppeal']=1);
end;

{ TCertificateDescription }

procedure TCertificateDescription.AddExamDescription(ed: TExamDescription);
begin
FMarks.Add(ed);
end;

constructor TCertificateDescription.Create(XMLNode: IXMLNode);
var i,j,exlen:integer;
begin
  if XMLNode.ChildValues['lastName']<>null then
    FLastName:=XMLNode.ChildValues['lastName'];

  if XMLNode.ChildValues['firstName']<>null then
    FFirstName:=XMLNode.ChildValues['firstName'];

  if XMLNode.ChildValues['patronymicName']<>null then
    FPatronName:=XMLNode.ChildValues['patronymicName'];

  if XMLNode.ChildValues['passportSeria']<>null then
    FpassportSeria:=XMLNode.ChildValues['passportSeria'];

  if XMLNode.ChildValues['passportNumber']<>null then
    FpassportNumber:=XMLNode.ChildValues['passportNumber'];

  if XMLNode.ChildValues['certificateNumber']<>null then
    FCertificateNumber:=XMLNode.ChildValues['certificateNumber'];

      if XMLNode.ChildValues['typographicNumber']<>null then
    FTypographicNumber:=XMLNode.ChildValues['typographicNumber'];

      if XMLNode.ChildValues['status']<>null then
    Fstatus:=XMLNode.ChildValues['status'];

  if XMLNode.ChildValues['year']<>null then
    FYear:=XMLNode.ChildValues['year'];

  if XMLNode.ChildValues['uniqueIHEaFCheck']<>null then
    FuniqueIHEaFCheck:=XMLNode.ChildValues['uniqueIHEaFCheck'];

  if XMLNode.ChildValues['passportNumber']<>null then
    FpassportNumber:=XMLNode.ChildValues['passportNumber'];

  if XMLNode.ChildValues['certificateDeny']<>null then
    FIsDenied:=(XMLNode.ChildValues['certificateDeny']=1);

  if XMLNode.ChildValues['certificateNewNumber']<>null then
    FcertificateNewNumber:=XMLNode.ChildValues['certificateNewNumber'];

  if XMLNode.ChildValues['certificateDenyComment']<>null then
    FcertificateDenyComment:=XMLNode.ChildValues['certificateDenyComment'];

  FMarks:=TList.Create;

  for i := 0 to XMLNode.ChildNodes.Count - 1 do
    if (XMLNode.ChildNodes[i].NodeName='marks') then
    begin
      exlen:=XMLNode.ChildNodes[i].ChildNodes.Count;

      for j := 0 to exlen - 1 do
        AddExamDescription(TExamDescription.Create(XMLNode.ChildNodes[i].ChildNodes[j]));
    end;

end;

end.
