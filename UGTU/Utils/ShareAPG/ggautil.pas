unit ggautil;
  {#Author fmarakasov@ugtu.net}
interface
  function ConnectCacheFolder(Machine:String):IDispatch; stdcall;
  function DisConnectCacheFolder(Server:IDispatch):Boolean; stdcall;
  function SendDocument(const FileName,
           Description: String; Server:IDispatch): Boolean;stdcall;

  function DeleteDocument(const FileName:String; Server:IDispatch):Boolean;stdcall;

implementation

  function ConnectCacheFolder(Machine:String):IDispatch;stdcall;external 'ggautil.dll';
  function DisConnectCacheFolder(Server:IDispatch):Boolean;stdcall;external 'ggautil.dll';
  function SendDocument(const FileName,
           Description: String; Server:IDispatch): Boolean;stdcall;external 'ggautil.dll';

  function DeleteDocument(const FileName:String; Server:IDispatch):Boolean;stdcall;external 'ggautil.dll';


end.
