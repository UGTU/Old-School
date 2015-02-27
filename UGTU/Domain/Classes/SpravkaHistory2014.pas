unit SpravkaHistory2014;

interface

uses
  Classes, dialogs, SysUtils, ExcelXP, Barcode, Contnrs,
  XIntf, CommonIntf, ReportsBase, db, adodb, ExtCtrls,
  udmUspevaemost, ComCtrls, uAverageBalls,
  System.Generics.Collections;

type
  TSpravkaHistory = class
  private

    FNamePric: string;
    FNumPric: string;
    Fday: string;
    Fmonth: string;
    Fyear: string;
    FikTypePric:integer;
    Fdatevih: string;
    Fdatevh: string;
  protected

  public
    property NamePric: string read FNamePric;
    property NumPric: string read FNumPric;
    property day: string read Fday;
    property month: string read Fmonth;
    property year: string read Fyear;
    property ikTypePric: integer read FikTypePric;
    property datevih: string read Fdatevih;
    property datevh: string read Fdatevh;
  public
    constructor Create(_NumPric, _NamePric, _day, _month, _year: string;_ikTypePric:integer;
    _datevih, _datevh: string);

  end;

implementation

constructor TSpravkaHistory.Create(_NumPric, _NamePric, _day, _month,
  _year: string;_ikTypePric:integer;_datevih, _datevh: string);
begin
  // inherited Create(AOwner);
  FNumPric := _NumPric;
  FNamePric := _NamePric;
  Fday := _day;
  Fmonth := _month;
  Fyear := _year;
  FikTypePric:=_ikTypePric ;
  Fdatevih := _datevih;
  Fdatevh := _datevh;
end;

end.
