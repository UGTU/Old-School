{*******************************************************}
{                                                       }
{                        EhLib v6.2                     }
{                                                       }
{        Classes for detection Images stream format     }
{                      Build 6.2.01                     }
{                                                       }
{   Copyright (c) 2011-2012 by Dmitry V. Bolshakov      }
{                                                       }
{*******************************************************}

unit EhLibGIFImage;

{$I EhLib.Inc}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
{$IFDEF EH_LIB_11} GIFImg, {$ENDIF} { Borland Developer Studio 2007 }
  Dialogs, StdCtrls, ExtCtrls, Buttons, Db, ToolCtrlsEh;


{$IFDEF EH_LIB_11}
type

  TGIFGraphicProviderEh = class(TGraphicProviderEh)
    class function GetImageClassForStream(Start: Pointer): TGraphicClass; override;
  end;
{$ENDIF}

implementation

{$IFDEF EH_LIB_11}
{ TGIFGraphicProviderEh }

class function TGIFGraphicProviderEh.GetImageClassForStream(Start: Pointer): TGraphicClass;
begin
  if (Start <> nil) and (LongWord(Start^) = $38464947)
    then Result := TGIFImage
    else Result := nil;
end;
{$ENDIF}
initialization

{$IFDEF EH_LIB_11}
  RegisterGraphicProviderEh(TGIFGraphicProviderEh);
{$ENDIF}
finalization
end.
