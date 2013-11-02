unit uHOST;

 {#Author llodigina@ist.ugtu.net}

interface

uses
  SysUtils, Classes, DB, ADODB, uDM;

type
  TdmHOST = class(TDataModule)
    tHostel: TADOTable;
    dsHostel: TDataSource;
    Query1: TADOQuery;
    vInfoRoom: TADOTable;
    dsInfoRoom: TDataSource;
    vVkSpisokZayav: TADOTable;
    dsVkSpisokZayav: TDataSource;
    ProcVivodOrdera: TADOStoredProc;
    ProcRoomForZas: TADOStoredProc;
    DSProcRoomForZas: TDataSource;
    ProcProjInRoom: TADOStoredProc;
    dsProcProjInRoom: TDataSource;
    vHOST_PredvSpisok: TADOTable;
    dsHOST_PredvSpisok: TDataSource;
    vPrikazNaZas: TADOTable;
    dsPrikazNaZas: TDataSource;
    vVklSpisRoom: TADOTable;
    dsVklSpisRoom: TDataSource;
    vSpisProj: TADOTable;
    dsSpisProj: TDataSource;
    ProcVivodEtazhPoObj: TADOStoredProc;
    dsProcVivodEtazhPoObj: TDataSource;
    vVivodPrichVis: TADOTable;
    dsPrikaz: TDataSource;
    dsVivodPrichVis: TDataSource;
    tPrikaz: TADOTable;
    ProcVivodPersonFormGroup: TADOStoredProc;
    dsVivodPersonFormGroup: TDataSource;
    ProcVivodZayavPoCode: TADOStoredProc;
    ProcGetPersonAddress: TADOStoredProc;
    dsGetPersonAddress: TDataSource;
    dsProcVivodInvent: TDataSource;
    ProcVivodInvent: TADOStoredProc;
    ProcRegistrPers: TADOStoredProc;
    dsProcRegistrPers: TDataSource;
    VidNarush: TADOQuery;
    ProcVivodInventnCode: TBCDField;
    ProcVivodInventIDTipInven: TIntegerField;
    ProcVivodInventKolvo: TIntegerField;
    ProcVivodInventDataVidachi: TDateTimeField;
    ProcVivodInventDataVozvrata: TDateTimeField;
    VidInvent: TADOQuery;
    ProcVivodInventNameTipInvent: TStringField;
    ProcVivodKartochk: TADOStoredProc;
    tVidNurush: TADOTable;
    dsVidNurush: TDataSource;
    dsVivodRoomPoEtazh: TDataSource;
    ProcVivodRoomPoEtazh: TADOStoredProc;
    ProcVivodNurushPoOb: TADOStoredProc;
    ProcProjInRoomnCode: TBCDField;
    ProcProjInRoomik_AddressType: TIntegerField;
    ProcProjInRoomik_address: TIntegerField;
    ProcProjInRoomFIO: TStringField;
    ProcProjInRoompol: TStringField;
    ProcProjInRoomstatusquo: TStringField;
    dsVivodNurushPoOb: TDataSource;
    dsPersonPoNarush: TDataSource;
    ProcPersonPoNarush: TADOStoredProc;
    dsNarushPersony: TDataSource;
    vNarushPersony: TADOTable;
    ProcVivodDogovoraPoCode: TADOStoredProc;
    dsvHostel: TDataSource;
    vHostel: TADOTable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmHOST: TdmHOST;

implementation

{$R *.dfm}


end.
