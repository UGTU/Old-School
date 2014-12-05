unit uLocalLogController;
   {#Author sergdev@ist.ugtu.net}
interface
uses  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ApplicationController, CommonIntf, DateUtils;

  type TLogController = class (TInterfacedObject,  ILogger)
    private
    FFilename : string;
    LogStream : TFileStream;
    FText : TStringList;
    constructor Create;
    procedure AddEntryToFile(str:string);
  protected
      procedure LogMessage(const Value : String);
  public

    class function GetInstance: TLogController;

    procedure AddEntry(str:string);
    procedure AddEntryNoDate(str:string);
    procedure AddEntries(strlist:TStringlist);
    function SaveForSend : string;


    property Text:TStringList read FText;
    property Filename :string read FFilename;
  end;
implementation

var
  instance : TLogController = nil;

{ TLogController }

procedure TLogController.AddEntry(str: string);
var   Hour, Min, Sec, MSec: Word;
begin
   DecodeTime( Time, Hour, Min, Sec, MSec);

  if TApplicationController.GetInstance.ExportLogToFile  then
    AddEntryToFile(Timetostr(Time)+' '+str+#13#10);
    AddEntryToFile(inttostr(Hour)+':'+inttostr(Min)+':'+inttostr(Sec)+'.'+inttostr(MSec)+' '+str+#13#10);

  if FText<>nil then
  FText.add(Timetostr(Time)+' '+str);
  FText.add(inttostr(Hour)+':'+inttostr(Min)+':'+inttostr(Sec)+'.'+inttostr(MSec)+' '+str);

end;

procedure TLogController.AddEntryNoDate(str: string);
begin
  if TApplicationController.GetInstance.ExportLogToFile then AddEntryToFile(str+#13#10);
  if FText<>nil then FText.add(str);
end;

procedure TLogController.AddEntryToFile(str: string);
begin
  if LogStream<>nil then
  LogStream.WriteBuffer(Pointer(Str)^, Length(Str));
end;


function TLogController.SaveForSend : string;
var i:integer;
year, month, day:integer;
begin
  year:=YearOf(Date);
  month:=YearOf(Date);
  day:=YearOf(Date);
 i:=1;
 result:=TApplicationController.GetInstance.IniDir+'logsend_'+inttostr(day)+'.'+inttostr(month)+'.'+inttostr(year)+'_'+inttostr(i)+'.txt';
 while FileExists(result) do
 begin
  inc(i);
  result:=TApplicationController.GetInstance.IniDir+'logsend_'+inttostr(day)+'.'+inttostr(month)+'.'+inttostr(year)+'_'+inttostr(i)+'.txt'
 end;
  FText.SaveToFile(result);

end;

procedure TLogController.AddEntries(strlist:TStringlist);
var
  I: Integer;
begin
 for I := 0 to (strlist.Count - 1) do
   AddEntry(strlist.Strings[i]);
end;

constructor TLogController.Create;
var i:integer;
year, month, day:integer;
begin
 FText:=TStringList.Create;
 if TApplicationController.GetInstance.ExportLogToFile then
 begin
  i:=1;
  year:=YearOf(Date);
  month:=YearOf(Date);
  day:=YearOf(Date);
  FFilename:=TApplicationController.GetInstance.IniDir+'log_'+inttostr(day)+'.'+inttostr(month)+'.'+inttostr(year)+'_'+inttostr(i)+'.txt';
  while FileExists(FFilename) do
  begin
    inc(i);
    FFilename:=TApplicationController.GetInstance.IniDir+'log_'+inttostr(day)+'.'+inttostr(month)+'.'+inttostr(year)+'_'+inttostr(i)+'.txt'
  end;
  LogStream := TFileStream.Create(FFilename, fmCreate or fmShareDenyWrite);

 end;
end;

class function TLogController.GetInstance: TLogController;

begin
  if instance = nil then instance := TLogController.Create;
  Result := instance;
  Result._AddRef;
end;


procedure TLogController.LogMessage(const Value: String);
begin
  AddEntry(Value);
end;

end.
