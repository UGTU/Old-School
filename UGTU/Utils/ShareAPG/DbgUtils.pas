unit DbgUtils;
  {#Author fmarakasov@ugtu.net}
interface
uses
  SysUtils;

// The test, aperiodic exception
procedure RiseOOPS;

implementation

procedure RiseOOPS;
begin
{$IFDEF DEBUG}
  if (Random(100) > 50) then
    raise Exception.Create('OOPS');
{$ENDIF}
end;


initialization
   Randomize;
end.
