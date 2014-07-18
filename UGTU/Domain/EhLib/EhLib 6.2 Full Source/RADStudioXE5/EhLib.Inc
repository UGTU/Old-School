{*******************************************************}
{                                                       }
{                       EhLib v6.2                      }
{     Conditional defines that affect compilation       }
{                                                       }
{   Copyright (c) 1998-2013 by Dmitry V. Bolshakov      }
{                                                       }
{*******************************************************}

{$BOOLEVAL OFF}

{$DEFINE EH_LIB_VCL}

{$DEFINE DESIGNTIME}

//{$define eval}

{$IFDEF VER130}         { Borland Delphi 5.0 or CPP Builder 5.0 }
  {$DEFINE EH_LIB_5}
{$ENDIF}

{$IFDEF VER140}         { Borland Delphi 6.0 or CPP Builder 6.0}
  {$DEFINE EH_LIB_5}
  {$DEFINE EH_LIB_6}
{$ENDIF}

{$IFDEF VER150}         { Borland Delphi 7.0 }
  {$DEFINE EH_LIB_5}
  {$DEFINE EH_LIB_6}
  {$DEFINE EH_LIB_7}
{$ENDIF}

{$IFDEF CIL}            { Borland Delphi 8.0 }
  {$DEFINE EH_LIB_5}
  {$DEFINE EH_LIB_6}
  {$DEFINE EH_LIB_7}
  {$DEFINE EH_LIB_8}
{$ENDIF}

{$IFDEF VER170}         { Borland Delphi 2005 }
  {$DEFINE EH_LIB_5}
  {$DEFINE EH_LIB_6}
  {$DEFINE EH_LIB_7}
  {$DEFINE EH_LIB_8}
  {$DEFINE EH_LIB_9}
{$ENDIF}

{$IFDEF VER180}         { Borland Developer Studio 2006 }
  {$DEFINE EH_LIB_5}
  {$DEFINE EH_LIB_6}
  {$DEFINE EH_LIB_7}
  {$DEFINE EH_LIB_8}
  {$DEFINE EH_LIB_9}
  {$DEFINE EH_LIB_10}

  {$WARN SYMBOL_DEPRECATED OFF}
{$ENDIF}

{$IFDEF VER190}         { Borland Developer Studio 2007 }
  {$DEFINE EH_LIB_5}
  {$DEFINE EH_LIB_6}
  {$DEFINE EH_LIB_7}
  {$DEFINE EH_LIB_8}
  {$DEFINE EH_LIB_9}
  {$DEFINE EH_LIB_10}
  {$DEFINE EH_LIB_11}

  {$WARN SYMBOL_DEPRECATED OFF}
{$ENDIF}

{$IFDEF VER200}         { CodeGear RAD Studio 2009 }
  {$DEFINE EH_LIB_5}
  {$DEFINE EH_LIB_6}
  {$DEFINE EH_LIB_7}
  {$DEFINE EH_LIB_8}
  {$DEFINE EH_LIB_9}
  {$DEFINE EH_LIB_10}
  {$DEFINE EH_LIB_11}
  {$DEFINE EH_LIB_12}

  {$WARN SYMBOL_DEPRECATED OFF}
{$ENDIF}

{$IFDEF VER210}         { CodeGear RAD Studio 2010, CodeGear RAD Studio Weaver }
  {$DEFINE EH_LIB_5}
  {$DEFINE EH_LIB_6}
  {$DEFINE EH_LIB_7}
  {$DEFINE EH_LIB_8}
  {$DEFINE EH_LIB_9}
  {$DEFINE EH_LIB_10}
  {$DEFINE EH_LIB_11}
  {$DEFINE EH_LIB_12}
  {$DEFINE EH_LIB_13}

  {$WARN SYMBOL_DEPRECATED OFF}
{$ENDIF}

{$IFDEF VER220}         { CodeGear RAD Studio 2011 XE}
  {$DEFINE EH_LIB_5}
  {$DEFINE EH_LIB_6}
  {$DEFINE EH_LIB_7}
  {$DEFINE EH_LIB_8}
  {$DEFINE EH_LIB_9}
  {$DEFINE EH_LIB_10}
  {$DEFINE EH_LIB_11}
  {$DEFINE EH_LIB_12}
  {$DEFINE EH_LIB_13}
  {$DEFINE EH_LIB_14}

  {$WARN SYMBOL_DEPRECATED OFF}
{$ENDIF}

{$IFDEF VER230}         { Delphi XE2 / C++Builder XE2 (Win32/Win64) }
  {$DEFINE EH_LIB_5}
  {$DEFINE EH_LIB_6}
  {$DEFINE EH_LIB_7}
  {$DEFINE EH_LIB_8}
  {$DEFINE EH_LIB_9}
  {$DEFINE EH_LIB_10}
  {$DEFINE EH_LIB_11}
  {$DEFINE EH_LIB_12}
  {$DEFINE EH_LIB_13}
  {$DEFINE EH_LIB_14}
  {$DEFINE EH_LIB_16}

  {$WARN SYMBOL_DEPRECATED OFF}
{$ENDIF}

{$IFDEF VER240}         { Delphi XE3 / C++Builder XE3 (Win32/Win64) }
  {$DEFINE EH_LIB_5}
  {$DEFINE EH_LIB_6}
  {$DEFINE EH_LIB_7}
  {$DEFINE EH_LIB_8}
  {$DEFINE EH_LIB_9}
  {$DEFINE EH_LIB_10}
  {$DEFINE EH_LIB_11}
  {$DEFINE EH_LIB_12}
  {$DEFINE EH_LIB_13}
  {$DEFINE EH_LIB_14}
  {$DEFINE EH_LIB_16}
  {$DEFINE EH_LIB_17}

  {$WARN SYMBOL_DEPRECATED OFF}
{$ENDIF}

{$IFDEF VER250}         { Delphi XE4 / C++Builder XE4 (Win32/Win64) }
  {$DEFINE EH_LIB_5}
  {$DEFINE EH_LIB_6}
  {$DEFINE EH_LIB_7}
  {$DEFINE EH_LIB_8}
  {$DEFINE EH_LIB_9}
  {$DEFINE EH_LIB_10}
  {$DEFINE EH_LIB_11}
  {$DEFINE EH_LIB_12}
  {$DEFINE EH_LIB_13}
  {$DEFINE EH_LIB_14}
  {$DEFINE EH_LIB_16}
  {$DEFINE EH_LIB_17}
  {$DEFINE EH_LIB_18}

  {$WARN SYMBOL_DEPRECATED OFF}
{$ENDIF}

{$IFDEF VER260}         { Delphi XE5 / C++Builder XE5 (Win32/Win64) }
  {$DEFINE EH_LIB_5}
  {$DEFINE EH_LIB_6}
  {$DEFINE EH_LIB_7}
  {$DEFINE EH_LIB_8}
  {$DEFINE EH_LIB_9}
  {$DEFINE EH_LIB_10}
  {$DEFINE EH_LIB_11}
  {$DEFINE EH_LIB_12}
  {$DEFINE EH_LIB_13}
  {$DEFINE EH_LIB_14}
  {$DEFINE EH_LIB_16}
  {$DEFINE EH_LIB_17}
  {$DEFINE EH_LIB_18}
  {$DEFINE EH_LIB_19}

  {$WARN SYMBOL_DEPRECATED OFF}
{$ENDIF}