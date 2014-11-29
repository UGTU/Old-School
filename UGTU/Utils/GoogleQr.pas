unit GoogleQr;

interface
uses Vcl.Imaging.pngimage, Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics,
  IdComponent, IdHTTP,   Vcl.ExtCtrls, Vcl.StdCtrls;
type
  TGoogleQr = class
  public
    class function GetQr(Info:String; width:Integer=150; height:Integer=150):TGraphic;
  end;
implementation

{ TGoogleQr }

//как использовать:
//Image1.Picture.Assign(TGoogleQr.GetQr(Edit1.Text));
class function TGoogleQr.GetQr(Info: String; width, height: Integer): TGraphic;
var
  http:TIdHTTP;
  httpResult:string;
  Graphics:TBitmap;
  stream : TMemoryStream;
  img : TPngImage;
  url:string;
begin
  http:=TIdHTTP.Create(nil);
  stream:=nil;
  try
    http.Request.UserAgent := 'User-Agent: NULL';
    stream := TMemoryStream.Create;
    url := Format('http://chart.googleapis.com/chart?chs=%dx%d&cht=qr&chl=%s', [width, height, Info]);
    http.Get(url, stream);
    img:=TPngImage.Create;
    stream.Seek(0, soFromBeginning);
    img.LoadFromStream(stream);
    Result := img;
  finally
    http.Free;
    stream.Free;
  end;
end;

end.
