unit csdbg;
   {#Author fmarakasov@ugtu.net}
interface
uses
  Windows,Sysutils, SyncObjs, Classes;
const
  sInit:String = 'Init critical section';
  sRelease:String = 'Release critical section';
  sTryEnter:String = ' Try Enter critical section';
  sEnter:String = '  Enter critical section';
  sLeave:String = '  Leave critical section';
  sNewLine:String = #10#13;
type
  TDBGCriticalSection = class (TCriticalSection)
  protected
     FStream:TFileStream;
     FEnterCount:Integer;
     FLeaveCount:Integer;
  public
     constructor Create;
     destructor  Destroy;override;
     procedure Acquire; override;
     procedure Release;override;
  end;

implementation



constructor TDBGCriticalSection.Create;
begin
  inherited Create;
  FEnterCount:=0;
  FLeaveCount:=0;
  FStream:=TFileStream.Create('cs.log', fmCreate or  fmShareDenyNone);
  if Assigned(FStream) then
  begin
    FStream.Write(PChar(sInit)^, length(sInit));
    FStream.Write(PChar(sNewLine)^, length(sNewLine));
  end;
end;

destructor  TDBGCriticalSection.Destroy;
begin
  if Assigned(FStream) then
  begin
    FStream.Write(PChar(sRelease)^, length(sRelease));
    FStream.Write(PChar(sNewLine)^, length(sNewLine));
    FStream.Free;
  end;
  inherited;
end;

procedure TDBGCriticalSection.Acquire;
var
 sCount:String;
begin
  if Assigned(FStream) then
  begin
    FStream.Write(PChar(sTryEnter)^, length(sTryEnter));
    FStream.Write(PChar(sNewLine)^, length(sNewLine));
  end;
  inherited;
  InterlockedIncrement(FEnterCount);
  sCount:=' Enter Count: '+IntToStr(FEnterCount);

  if Assigned(FStream) then
  begin
    FStream.Write(PChar(sEnter)^, length(sEnter));
    FStream.Write(PChar(sCount)^, length(sCount));
    FStream.Write(PChar(sNewLine)^, length(sNewLine));
  end;
end;

procedure TDBGCriticalSection.Release;
var
 sCount:String;
begin
  inherited;
  InterlockedIncrement(FLeaveCount);
  sCount:=' Leave Count: '+IntToStr(FLeaveCount);
  FStream.Write(PChar(sLeave)^, length(sLeave));
  FStream.Write(PChar(sCount)^, length(sCount));
  FStream.Write(PChar(sNewLine)^, length(sNewLine));
end;


end.
