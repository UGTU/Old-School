unit Spravka2014;
interface

uses
  Classes, dialogs, SysUtils, ExcelXP, Barcode, Contnrs,
  XIntf, CommonIntf, ReportsBase, db, adodb, ExtCtrls,
  udmUspevaemost, ComCtrls, uAverageBalls,
  System.Generics.Collections,SpravkaHistory2014;

type
  TSpravka = class
  private
    FFIO, Fpodgot, Fspec, Fdir_inst,Ff_obuch,Finstut,Fphone,Fspecshort,
    FNow_day,FNow_month,FNow_year,Fbirth,Fdep_ind,Fyear_otch,Fyear_post, FManagerPostName: string;
    Fkurs,Ftype_spr,FNumSpr: integer;

    FHistory: TObjectList<TSpravkaHistory>;

  public
    property FIO: string read FFIO;
    property podgot: string read Fpodgot;
    property spec: string read Fspec;
    property specshort: string read Fspecshort;
    property dir_inst: string read Fdir_inst;
    property f_obuch: string read Ff_obuch;
    property instut: string read Finstut;
    property phone: string read Fphone;
    property birth: string read Fbirth;
    property year_post: string read Fyear_post;
    property kurs: integer read Fkurs;
    property year_otch: string read Fyear_otch;
    property Now_day: string read FNow_day;
    property Now_month: string read FNow_month;
    property Now_year: string read FNow_year;
    property dep_ind: string read Fdep_ind;
    property type_spr: integer read Ftype_spr;
    property NumSpr: integer read FNumSpr;
    property managerPostName: string read FManagerPostName;


  protected
  public
    constructor Create(_FIO, _podgot, _spec,_specshort, _dir_inst,_f_obuch,_instut, _phone: string;
  _year_post:string;_kurs,_type_spr:integer;_year_otch,_Now_day,_Now_month,_Now_year,_birth,_dep_ind, _managerPostName: string;
  _NumSpr:integer);

    destructor Destroy;override;
    property Historyes: TObjectList<TSpravkaHistory> read FHistory;
  end;
implementation

constructor TSpravka.Create(_FIO, _podgot, _spec,_specshort, _dir_inst,_f_obuch,_instut, _phone: string;
  _year_post:string;_kurs,_type_spr:integer;_year_otch,_Now_day,_Now_month,_Now_year,_birth,_dep_ind, _managerPostName: string;
  _NumSpr:integer);
begin

  FFIO := _FIO;
  Fpodgot := _podgot;
  Fspec := _spec;
  Fspecshort:=_specshort;
  Fdir_inst := _dir_inst;

  Ff_obuch := _f_obuch;
  Finstut := _instut;
  Fphone := _phone;
  Fyear_post := _year_post;
  Fkurs := _kurs;
  Fyear_otch:=_year_otch;
  FNow_day := _Now_day;
  FNow_month := _Now_month;
  FNow_year:=_Now_year;
  Ftype_spr:=_type_spr ;
  Fbirth:=_birth;
  Fdep_ind:=_dep_ind;
  FNumSpr:=_NumSpr;
  FManagerPostName:= _managerPostName;
  FHistory := TObjectList<TSpravkaHistory>.Create;

end;

destructor TSpravka.Destroy;
begin
  Historyes.Free;
  inherited;
end;
end.
