unit uXMLErrorReader;
  {#Author sergdev@ist.ugtu.net}
interface
uses
  Windows, Forms, ComObj, SysUtils, Classes, Dialogs, Registry, XMLDoc, XMLIntf, Variants;

  type
  TErrorDescription = class(TObject)
  private
    FErrorClass:string;
    FErrorCode:HRESULT;
    FAction:string;
    FSeverity:string;
    FURI:string;
    FHelpTopic:string;
    FSummary:string;
    FCaused:string;
    FSolution:string;
  public
    constructor Create(XMLNode:IXMLNode); 

    property ErrorClass: string read FErrorClass;
    property ErrorCode: HRESULT read FErrorCode;
    property Action: string read FAction;
    property Severity: string read FSeverity;
    property HelpTopic: string read FHelpTopic;
    property Summary: string read FSummary;
    property Caused: string read FCaused;
    property Solution: string read FSolution;
    property URI: string read FURI;

  end;


  TXMLErrorReader = class(TObject)
    private
    FXML:TXmlDocument;
    public
    constructor Create(XML:TXmlDocument); overload;
    constructor Create(filename:string); overload;
    constructor Create(rstr:TResourceStream); overload;
    function GetErrorDescriptionFromXML(E:Exception):TErrorDescription;
    function GetXML:TXMLDocument;
  end;

implementation

function FindBestMatch(XMLNode:IXMLNode; E:Exception):IXMLNode;
var i:integer;
   Node:IXMLNode;
   fullmatch:boolean;
   ECurrentClass:TClass;
begin
  fullmatch:=false;
  result:=nil;
  ECurrentClass:=E.ClassType;
  while (result=nil)and(ECurrentClass<>nil) do
  begin
   for i := 0 to XMLNode.ChildNodes.Count - 1 do
   begin
     if fullmatch then break;
     Node := XMLNode.ChildNodes[i];
     // проверка ошибок с кодом
     if E is EOleException then
     begin
       if (Node.Attributes['ExceptionClass']=ECurrentClass.ClassName) then
       begin
         if Node.Attributes['ErrorCode'] = null then
         result:=Node
         else
         if (Node.Attributes['ErrorCode']=(E as EOleException).ErrorCode) then
         begin
         fullmatch:=true;
         result:=Node;
         end;
       end;
     end
     else
     // проверка ошибок без кода
     begin
       if (Node.Attributes['ExceptionClass']=ECurrentClass.ClassName) then
       result:=Node;
     end;
   end;
     ECurrentClass:=ECurrentClass.ClassParent;
  end;


end;

{ TErrorDescription }


constructor TErrorDescription.Create(XMLNode: IXMLNode);
var i:integer;
begin
  if XMLNode.Attributes['ExceptionClass']<>null then
    FErrorClass:=XMLNode.Attributes['ExceptionClass'];
  if XMLNode.Attributes['Action']<>null then
    FAction:=XMLNode.Attributes['Action'];
  if XMLNode.Attributes['ErrorCode']<>null then
    FErrorCode:=XMLNode.Attributes['ErrorCode'];
  if XMLNode.Attributes['Severity']<>null then
    FSeverity:=XMLNode.Attributes['Severity'];
  if XMLNode.Attributes['HelpTopic']<>null then
    FHelpTopic:=XMLNode.Attributes['HelpTopic'];
  if XMLNode.Attributes['URI']<>null then
    FURI:=XMLNode.Attributes['URI'];

  for i := 0 to (XMLNode.ChildNodes.count - 1) do
  begin
  if XMLNode.ChildNodes[i].LocalName='Summary' then
  FSummary:=trim(XMLNode.ChildNodes[i].Text);
  if XMLNode.ChildNodes[i].LocalName='Caused' then
  FCaused:=trim(XMLNode.ChildNodes[i].Text);
  if XMLNode.ChildNodes[i].LocalName='Solution' then
  FSolution:=trim(XMLNode.ChildNodes[i].Text);
  end;
end;

{ TXMLErrorReader }

constructor TXMLErrorReader.Create(XML: TXmlDocument); 
begin
FXML:=XML;
end;

constructor TXMLErrorReader.Create(filename:string);
begin
  try
  FXML := TXMLDocument.Create(nil);
  (FXML as IXMLDocument)._AddRef;
   FXML.LoadFromFile(filename);
  except
   self.FXML:=nil;
  end;
end;

constructor TXMLErrorReader.Create(rstr:TResourceStream);
begin
  try
  FXML := TXMLDocument.Create(nil);
  (FXML as IXMLDocument)._AddRef;
   FXML.LoadFromStream(rstr);
  except
   self.FXML:=nil;
  end;
end;


function TXMLErrorReader.GetErrorDescriptionFromXML(E: Exception): TErrorDescription;
var XMLNode:IXMLNode;
begin
   XMLNode := FindBestMatch(FXML.ChildNodes[1],E);
   if (XMLNode=nil) then result:=nil else
   result:=TErrorDescription.Create(XMLNode);
end;

function TXMLErrorReader.GetXML: TXMLDocument;
begin
result:= FXML;
end;

end.
