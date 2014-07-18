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

unit EhLibJPegImage;

{$I EhLib.Inc}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
{$IFDEF EH_LIB_5} JPeg, {$ENDIF}
  Dialogs, StdCtrls, ExtCtrls, Buttons, Db, ToolCtrlsEh;


type

{ TJPEGGraphicProviderEh }

  TJPEGGraphicProviderEh = class(TGraphicProviderEh)
    class function GetImageClassForStream(Start: Pointer): TGraphicClass; override;
  end;

implementation

{ TJPEGGraphicProviderEh }

class function TJPEGGraphicProviderEh.GetImageClassForStream(Start: Pointer): TGraphicClass;
begin
  if (Start <> nil) and (Word(Start^) = $D8FF)
    then Result := TJPEGImage
    else Result := nil;
end;

initialization
  RegisterGraphicProviderEh(TJPEGGraphicProviderEh);
finalization
end.
