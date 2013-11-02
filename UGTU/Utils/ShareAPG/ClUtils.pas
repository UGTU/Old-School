unit ClUtils;
  {#Author fmarakasov@ugtu.net}
interface
uses
  Windows,
  Graphics;

function MakeColor(const Col:TColor; const Val:Byte):TColor;

implementation

function MakeColor(const Col:TColor; const Val:Byte):TColor;
var
  r, g, b : Byte;
  rgbCol:DWORD;
begin
  rgbCol:=ColorToRGB(Col);
  r:=GetRValue(rgbCol);
  g:=GetGValue(rgbCol);
  b:=GetBValue(rgbCol);
  inc(r, Val);
  inc(g, Val);
  inc(b, Val);
  Result:=TColor(RGB(r, g, b));
end;

end.
