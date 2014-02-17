unit DateFormat;

interface

uses SysUtils, Classes;

type TDateFormat = class
private
public
    class function DecodeDate(const Value: string): TDateTime; static;
end;

var
  vDateFormat: TDateFormat;

implementation

{ TDateFormat }

class function TDateFormat.DecodeDate(const Value: string): TDateTime;
begin
  if Pos('-', Value)>=0 then
    Result := StrToDate(copy(Value,9,2) + '.' + copy(Value,6,2) + '.' +  copy(Value,1,4))
  else   Result := StrToDate(Value);
end;

end.
