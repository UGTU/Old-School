unit uBRSBallCounter;

interface

uses
  Classes, dialogs ,SysUtils, ExcelXP, Barcode, Contnrs, XIntf, CommonIntf, db, adodb, Variants;

type TBRSBallCounter = class
  public
  class function GetTraditionalMark(Balls:integer):integer;
  class function GetTraditionalBinaryMark(Balls:integer):integer;
end;

implementation

{ TBRSBallCounter }

class function TBRSBallCounter.GetTraditionalBinaryMark(
  Balls: integer): integer;
begin
if Balls>=60 then result:= 1 else
result:= 0;
end;

class function TBRSBallCounter.GetTraditionalMark(Balls: integer): integer;
begin
if Balls>=88 then result:= 5 else
if (Balls>=74)and(Balls<=87) then result:= 4 else
if (Balls>=61)and(Balls<=73) then result:= 3 else
if (Balls<=60) then result:= 2;
end;

end.
