unit Vedomost2014;

interface
uses
Classes, dialogs ,SysUtils, ExcelXP, Barcode, Contnrs,
XIntf, CommonIntf, ReportsBase, db, adodb, ExtCtrls,
 udmUspevaemost, ComCtrls, uAverageBalls,VedomostItem2014;
type
     TVedomost = class
    private
    FInstitute,Fgrup, Fspec, Fdisc, Fprepod, Fekz_prep, Fdir_inst: string;
    Fnum_s,Fik_vid_zan, Fn_ved,Fyear_post:integer;
    Fdate: TDateTime;
    FStudent:TList;
    FIs_brs:boolean;
    public
    procedure SetStud(_FStud:TList);//_FStud:TVedomostItem);

    property Institute:string read  FInstitute;
    property grup:string read  Fgrup;
    property spec:string read  Fspec;
    property disc:string read  Fdisc;
    property prepod:string read  Fprepod;
    property ekz_prep:string read  Fekz_prep;
    property dir_inst:string read  Fdir_inst;
    property num_s:integer read  Fnum_s;
    property ik_vid_zan:integer read  Fik_vid_zan;
    property n_ved:integer read  Fn_ved;
    property year_post:integer read  Fyear_post;
    property date: TDateTime read  Fdate;
    property Is_brs: boolean read  FIs_brs;

    property Student:TList read FStudent  write SetStud;

    protected
    public
constructor Create(_Institute,_grup, _spec, _disc: string;_num_s:integer;_dir_inst: string;_date: TDateTime;
_n_ved,_ik_vid_zan,_year_post :integer;_Is_brs:boolean);
    end;
    implementation
constructor TVedomost.Create(_Institute,_grup, _spec, _disc: string;_num_s:integer;_dir_inst: string;_date: TDateTime;
_n_ved,_ik_vid_zan,_year_post :integer;_Is_brs:boolean);
begin

        FInstitute := _Institute;
        Fgrup:=_grup;
        Fspec:=_spec;
        Fdisc:=_disc;

        Fdir_inst:=_dir_inst;
        Fnum_s:=_num_s;
        Fik_vid_zan:=_ik_vid_zan;
        Fn_ved:=_n_ved;
        Fdate:=_date;
        Fyear_post:=_year_post;
        FIs_brs:=_Is_brs;
        FStudent:=TList.Create;
end;

procedure TVedomost.SetStud(_FStud:TList);//_FStud:TVedomostItem);

begin
//Student.Add(_FStud);
Student:=   _FStud;
end;

end.
