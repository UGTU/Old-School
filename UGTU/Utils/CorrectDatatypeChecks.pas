unit CorrectDatatypeChecks;
 {#Author fmarakasov@ugtu.net}
//‘ункции, провер€ющие может ли быть заданна€ строка корректно приведена
//к соответствующему функции типу

interface
function IsCorrectInteger(Str: String): Boolean;
function IsCorrectFloat(Str: String): Boolean;
function IsCorrectDate(Str: String): Boolean;
function IsCorrectTime(Str: String): Boolean;
function IsCorrectDateTime(Str: String): Boolean;

implementation
uses SysUtils;

function IsCorrectInteger(Str: String): Boolean;
begin
  Result := false;
  try
    StrToInt(Str);
    Result := true;
  except
  end;
end;

function IsCorrectFloat(Str: String): Boolean;
begin
  Result := false;
  try
    StrToFloat(Str);
    Result := true;
  except
  end;
end;

function IsCorrectDate(Str: String): Boolean;
begin
  Result := false;
  try
    StrToDate(Str);
    Result := true;
  except
  end;
end;

function IsCorrectTime(Str: String): Boolean;
begin
  Result := false;
  try
    StrToTime(Str);
    Result := true;
  except
  end;
end;

function IsCorrectDateTime(Str: String): Boolean;
begin
  Result := false;
  try
    StrToDateTime(Str);
    Result := true;
  except
  end;
end;

end.
