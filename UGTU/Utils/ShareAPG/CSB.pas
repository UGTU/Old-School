unit CSB;
   {#Author fmarakasov@ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, contnrs, comctrls, stdctrls, db, EditsEx;

type
  TDateTimeQuery = class (TDateTimePicker)
  private
    FCondition:TSpeedButton;
    FBitwise:TSpeedButton;
  protected

  published
    property Condition:TSpeedButton read FCondition write FCondition;
    property Bitwise:TSpeedButton read FBitwise write FBitwise;
  end;

  TEditQuery = class(TAutoFillComboBox)
  private
    FCondition:TSpeedButton;
    FBitwise:TSpeedButton;
  protected
  
  published
    property Condition:TSpeedButton read FCondition write FCondition;
    property Bitwise:TSpeedButton read FBitwise write FBitwise;
  end;

  procedure Register;

  implementation

  procedure Register;
  begin
    RegisterComponents('A2PG', [TDateTimeQuery, TEditQuery]);
  end;



end.
