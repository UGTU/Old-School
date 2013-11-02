unit QParser;
 {#Author fmarakasov@ugtu.net}
interface
uses
  Classes, SysUtils;

const
  Cond = 'Condition';
  QD = '#'; // QueryDelimiter


function ParseCommand(PrefixSQL:String; Command:TStrings):String;
function ExtractFieldName(const S:String):String;
function ExtractBitwise(const S:String):Integer;
function ExtractCondition(const S:String):Integer;
function ExtractQueryValue(const S:String):String;



implementation

// Condition#<Bitwise>
// <FieldName>#<Condition>#<QueryValue>

const
  QBitwise:array[1..2] of String = (' AND ', ' OR ');
  QConditions:array[1..7] of String = (' = ', ' LIKE ', ' <> ', ' > ', ' < ', ' >= ', ' <= ');


function ExtractFieldName(const S:String):String;
var
  n:Integer;
begin
  Result:='';
  if Pos(Cond, S) = 0 then
  begin
    n:=Pos(QD, S);
    if n > 0 then
    begin
      Result:=Copy(S, 1, n-1);
    end;
  end;
end;

function ExtractBitwise(const S:String):Integer;
var
  n:Integer;
  tmp:String;
begin
  Result:=-1;
  if Pos(Cond, S) > 0 then
  begin
    n:=Pos(QD, S);
    if n > 0 then
    begin
      inc(n);
      tmp:=Copy(S, n, 1);
      Result:=StrToInt(tmp);
    end;
  end;
end;


function ExtractCondition(const S:String):Integer;
var
  n:Integer;
  tmp:String;
begin
  Result:=-1;
  if Pos(Cond, S) = 0 then
  begin
    n:=Pos(QD, S);
    if n > 0 then
    begin
      inc(n, 1);
      tmp:=Copy(S, n, 1);
      Result:=StrToInt(tmp);
    end;
  end;
end;

function ExtractQueryValue(const S:String):String;
var
  n:Integer;
begin
  Result:='';
  if Pos(Cond, S) = 0 then
  begin
    n:=Pos(QD, S);
    if n > 0 then
    begin
      Result:=Result+' ( '+Copy(S, 1, n-1);;
      inc(n, 3);
      Result:=Copy(S, n, Length(S)-n+1);
    end;
  end;
end;


function ParseCommand(PrefixSQL:String; Command:TStrings):String;

function GetBitwise(const S:String):String;
var
  n:Integer;
  tmp:String;
begin
  Result:='';
  if Pos(Cond, S) > 0 then
  begin
    n:=Pos(QD, S);
    if n > 0 then
    begin
      inc(n);
      tmp:=Copy(S, n, 1);
      Result:=QBitwise[StrToInt(tmp)];
    end;
  end;
end;

function GetCondition(const S:String):String;
var
  n:Integer;
  tmp:String;
  Percent:String;
begin
  Result:='';
  Percent:='';
  if Pos(Cond, S) = 0 then
  begin
    n:=Pos(QD, S);
    if n > 0 then
    begin
      Result:=Result+' ( '+Copy(S, 1, n-1);;
      inc(n, 1);
      tmp:=Copy(S, n, 1);
      Result:=Result+QConditions[StrToInt(tmp)];
      if Pos(QConditions[2], Result) > 0 then Percent:='%' else Percent:='';
      inc(n, 2);
      Result:=Result+'''' + Percent + Copy(S, n, Length(S)-n+1) + Percent + '''';
      Result:=Result+' ) ';
    end;
  end;
end;


var
  i:Integer;
  S:String;
  BWS:String; //Bitwise string
  CS:String;  // Condition string
begin
  Result:=PrefixSQL;
  for i:=0 to Command.Count - 1 do
  begin
    S:=Command.Strings[i];
    BWS:=GetBitwise(S);
    CS:=GetCondition(S);

    if not (( i  = 0 ) and (ExtractBitwise(S) <> -1)) then
       Result:=Result+BWS+CS;

  end;
end;

end.
