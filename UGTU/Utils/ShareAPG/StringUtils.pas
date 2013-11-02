unit StringUtils;
   {#Author fmarakasov@ugtu.net}
interface
uses
  Windows,
  Sysutils,
  StrUtils;

function GetLastErrorMessage:String;

function FormatedWin32Error(const ObjName:String):String;

function CreateTempFileName(const Prefix:String):String;

// Проверяет наличие в строке не поддерживаемых файловой системой символов
function IsProperlyPath(const Path:string):Boolean;

function TrunkStringIfLonger(var S:string; MaxLength:Integer):string;

// Проверяет последний символ в строке и добавляет, если он не C
function AddLastCharIfNotExists(var S:string; C:Char):String;overload;
function AddLastCharIfNotExists(var S:WideString; C:WideChar):WideString;overload;

function ReplaceLatChar(const C:Char):Char;
function ReplaceLatSymbols(const S:string):string;
function IsLat(const S:string):Boolean;
function IsCyr(const S:string):Boolean;

// Принимает строку символов. Если в строке содержаться только
// латинские либо только кириллица, то возвращается исходная строка
// Если есть и кириллица и латиница, то возвращается  строка с заменнёнными
// на кириллицу латинские буквы похожего начертания.
function MakeLanguageProperlyString(const S:String):String;


function FormatNumber(const Value:Double):string;

function SubStrCount(const SrcString:string; const substr:string):integer;

implementation

function GetLastErrorMessage:String;
var
 Msg:array[0..255] of char;
 Num:DWORD;
begin
 Result:='';
 Num:=FormatMessage(FORMAT_MESSAGE_FROM_SYSTEM, nil, GetLastError(), LANG_NEUTRAL,
                    Msg, 255, nil);

 if Num > 0 then
 begin
   SetLength(Result, Num);
   StrCopy(PChar(Result), Msg);
 end;
end;

function CreateTempFileName(const Prefix:String):String;
var
  sPath:array[0..MAX_PATH] of char;
  sBuff:array[0..MAX_PATH] of char;
  iLen :Integer;
begin
  Result:='';
  iLen:=GetTempPath(MAX_PATH, sPath);
  if iLen > 0 then
  begin
    GetTempFileName(sPath, PChar(Prefix), 0, sBuff);
    Setlength(Result, StrLen(sBuff));
    StrCopy(PChar(Result), sBuff);
  end;
end;

const
  Reserved = '<>:"/\|*?';

function IsProperlyPath(const Path:string):Boolean;
var
  i :Integer;
begin
  Result:=False;
  if Length(Path) > 0 then
     if Length(Path) <= MAX_PATH then
        begin
          Result:=True;
          for i:=0 to Length(Reserved) do
              Result:=Result and (Pos(Reserved[i], Path) = 0);
        end;
end;


type
  TCyrSet = 'А'..'я';
  TLatSet = 'A'..'z';

function IsLat(const S:string):Boolean;
var
  i:Integer;
begin
  Result:=True;
  for i:=1 to Length(S) do
  begin
    Result:=Result and ((S[i] < Low(TCyrSet)) or (S[i] > High(TCyrSet))) ;
    if not Result then Exit;
  end;
end;

function IsCyr(const S:string):Boolean;
var
  i:Integer;
begin
  Result:=True;
  for i:=1 to Length(S) do
  begin
    Result:=Result and ((S[i] < Low(TLatSet)) or (S[i] > High(TLatSet))) ;
    if not Result then Exit;
  end;
end;



const
  SourceCyr:array[0..15] of char =  ('а', 'А', 'с', 'С', 'м',
                                     'М', 'Т', 'о', 'О', 'р',
                                     'Р', 'В', 'у', 'К', 'Е',
                                     'Н');

  AccordLat:array[0..15] of char =  ('a', 'A', 'c', 'C', 'm',
                                     'M', 'T', 'o', 'O', 'p',
                                     'P', 'B', 'y', 'K', 'E',
                                     'H');

function ReplaceLatChar(const C:Char):Char;
var
  i:Integer;
begin
  Result:=C;
  for i:=Low(AccordLat) to High(AccordLat) do
     if C = AccordLat[i] then
     begin
       Result:=SourceCyr[i];
       Exit;
     end;
end;

function ReplaceLatSymbols(const S:string):string;
var
  i:Integer;
begin
  SetLength(Result, Length(S));
  for i:=1 to Length(S) do
     Result[i]:=ReplaceLatChar(S[i]);
end;

function MakeLanguageProperlyString(const S:String):String;
begin
  if (IsLat(S)) then Result:=S //Строка не содержит русских символов.
  else
     if (IsCyr(S)) then Result:=S // Строка не содержит латинских символов.
     else
        // Строка содержит и русские и латинские символы.
        // Будем заменять. Латинские на русские.
        Result:= ReplaceLatSymbols(S);
end;


function TrunkStringIfLonger(var S:string; MaxLength:Integer):string;
begin
  if Length(S) > MaxLength then SetLength(S, MaxLength);
  Result:=S;
end;


function FormatNumber(const Value:Double):string;
begin
  Result:=Format('%n', [Value]);
end;


function FormatedWin32Error(const ObjName:String):String;
begin
  Result:=Format('Ошибка исполнения: %s Объект: %s', [GetLastErrorMessage, ObjName]);
end;

function AddLastCharIfNotExists(var S:string; C:Char):String;
begin
  if Length(S) > 0 then
    if S[Length(S)-1] <> C then S:=S+C;
  Result:=S;
end;

function AddLastCharIfNotExists(var S:WideString; C:WideChar):WideString;
begin
  if Length(S) > 0 then
    if S[Length(S)-1] <> C then S:=S+C;
  Result:=S;
end;


function SubStrCount(const SrcString:string; const substr:string):integer;
var
  ip:Integer; // Позиция
begin
  Result:=0;
  ip:=1;
  if SrcString <> '' then
  begin
    repeat
      ip:=PosEx(substr, SrcString, ip);
      if ip > 0 then begin  inc(Result); inc(ip); end;
    until (ip = 0);
  end;
end;


end.
