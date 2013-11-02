// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://fdsrv.ugtu.net/EgeCheckService.svc?wsdl
//  >Import : http://fdsrv.ugtu.net/EgeCheckService.svc?wsdl:0
//  >Import : http://fdsrv.ugtu.net/EgeCheckService.svc?xsd=xsd0
//  >Import : http://fdsrv.ugtu.net/EgeCheckService.svc?xsd=xsd1
// Encoding : utf-8
// Codegen  : [wfUseSerializerClassForAttrs-]
// Version  : 1.0
// (24.06.2013 13:46:29 - * $Rev: 5154 $)
// ************************************************************************ //

unit EgeCheckService;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_UNBD = $0002;
  IS_NLBL = $0004;
  IS_UNQL = $0008;
  IS_ATTR = $0010;
  IS_TEXT = $0020;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"



  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // soapAction: http://tempuri.org/IEgeCheckService/%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // binding   : BasicHttpBinding_IEgeCheckService
  // service   : EgeCheckService
  // port      : BasicHttpBinding_IEgeCheckService
  // URL       : http://fdsrv.ugtu.net/EgeCheckService.svc
  // ************************************************************************ //
  IEgeCheckService = interface(IInvokable)
  ['{478BF952-02CA-06A3-6BAD-F1A2C1E62692}']
    function  GetSingleCheckQuerySample: WideString; stdcall;
    function  GetBatchCheckQuerySample: WideString; stdcall;
    function  SingleCheck(const lastname: WideString; const firstname: WideString; const patronymicname: WideString; const passportseria: WideString; const passportnumber: WideString; const certificatenumber: WideString; 
                          const typographicnumber: WideString): WideString; stdcall;
    function  SingleCheckTest(const lastname: WideString; const firstname: WideString; const patronymicname: WideString; const passportseria: WideString; const passportnumber: WideString; const certificatenumber: WideString; 
                              const typographicnumber: WideString): WideString; stdcall;
  end;

function GetIEgeCheckService(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): IEgeCheckService;


implementation
  uses SysUtils;

function GetIEgeCheckService(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): IEgeCheckService;
const
  defWSDL = 'http://fdsrv.ugtu.net/EgeCheckService.svc?wsdl';
  defURL  = 'http://fdsrv.ugtu.net/EgeCheckService.svc';
  defSvc  = 'EgeCheckService';
  defPrt  = 'BasicHttpBinding_IEgeCheckService';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as IEgeCheckService);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  InvRegistry.RegisterInterface(TypeInfo(IEgeCheckService), 'http://tempuri.org/', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(IEgeCheckService), 'http://tempuri.org/IEgeCheckService/%operationName%');
  InvRegistry.RegisterInvokeOptions(TypeInfo(IEgeCheckService), ioDocument);

end.