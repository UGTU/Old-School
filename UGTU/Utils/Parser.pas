unit Parser;
 {#Author fmarakasov@ugtu.net}
interface
uses
  Classes;

//проверяет присутствует ли строка в массиве
function IsInArray(Str: String; A: Array of String): Boolean;
//парсит строку AString, разделённую разделителями Delimiters, помещает результаты в AParsedList
procedure ParseString(AString: AnsiString; Delimiters: Array of String; var AParsedList: TStringList);


implementation

function IsInArray(Str: String; A: Array of String): Boolean;
var
  i: Integer;
begin
  Result := false;
  for i := 0 to Length(A) - 1 do
    if A[i] = Str then
    begin
      Result := true;
      Exit;
    end;
end;

procedure ParseString(AString: AnsiString; Delimiters: Array of String; var AParsedList: TStringList);
var
  i: Integer;
  item: String;
begin
  item := '';
  AParsedList.Clear;
  i := 1;

  while i <= Length(AString) do
  begin
    while not(IsInArray(Copy(AString,i,1), Delimiters)) and (i <= Length(AString)) do
    begin
      item := item + Copy(AString,i,1);
      i := i + 1;
    end;
    if Length(item) > 0 then AParsedList.Add(item);
    item := '';
    i := i + 1;
  end;
end;


end.
