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
    FNumPric:string;
    Fday :string;
    Fmonth:string;
    Fyear :string;
    protected

    public
    property  NamePric : string read  FNamePric    ;
    property  NumPric : string read  FNumPric    ;
    property  day : string read  Fday   ;
    property  month : string read  Fmonth   ;
    property  year : string read  Fyear   ;
    public
    constructor Create (_NumPric,_NamePric,_day,_month,_year:string);

    end;
    implementation
constructor TSpravkaHistory.Create(_NumPric,_NamePric,_day,_month,_year:string);
begin
  //inherited Create(AOwner);
        FNumPric:=_NumPric;
        FNamePric:=_NamePric;
        Fday:=_day;
        Fmonth := _month;
        Fyear:= _year;
end;
end.
