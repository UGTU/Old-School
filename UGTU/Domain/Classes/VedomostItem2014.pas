unit VedomostItem2014;

interface
uses
Classes, dialogs ,SysUtils, ExcelXP, Barcode, Contnrs,
XIntf, CommonIntf, ReportsBase, db, adodb, ExtCtrls,
 udmUspevaemost, ComCtrls, uAverageBalls;
type
    TVedomostItem = class
    private
    FFirstName, FLastName,FOtch: string;
    Fzach,Fballs:integer;
    protected

    public
    property  FirstName : string read  FFirstName    ;
    property  LastName : string read  FLastName    ;
    property  Otch : string read  FOtch    ;
    property  zach : integer read  Fzach    ;
    property  balls : integer read  Fballs    ;
    public
    constructor Create (_zach:integer;_FirstName, _LastName,_Otch:string;_balls:integer);

    end;
    implementation
constructor TVedomostItem.Create(_zach:integer;_FirstName, _LastName,_Otch:string; _balls:integer);
begin
  //inherited Create(AOwner);
        FFirstName:=_FirstName;
        FLastName:=_LastName;
        FOtch:=_Otch;
        Fzach:=_zach;
        Fballs:=_balls;
end;
end.
