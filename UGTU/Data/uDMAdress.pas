unit uDMAdress;
{#Author sergdev@ist.ugtu.net}
interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmAdress = class(TDataModule)
    adodsSignRaion: TADODataSet;
    dsSignRaion: TDataSource;
    adodsStrana: TADODataSet;
    dsStrana: TDataSource;
    dsRegion: TDataSource;
    adodsRegion: TADODataSet;
    adodsStreet: TADODataSet;
    adodsGorod: TADODataSet;
    adodsRaion: TADODataSet;
    dsRaion: TDataSource;
    dsGorod: TDataSource;
    dsStreet: TDataSource;
    adodsSignStrana: TADODataSet;
    dsSignStrana: TDataSource;
    adodsSignRegion: TADODataSet;
    dsSignRegion: TDataSource;
    adodsSignGorod: TADODataSet;
    adodsSignStreet: TADODataSet;
    dsSignGorod: TDataSource;
    dsSignStreet: TDataSource;
    ADODSsChoolStrana: TADODataSet;
    DSsChoolStrana: TDataSource;
    DSsChoolRegion: TDataSource;
    ADODSsChoolRegion: TADODataSet;
    ADODSsChoolGorod: TADODataSet;
    ADODSsChoolRaion: TADODataSet;
    DSsChoolRaion: TDataSource;
    DSsChoolGorod: TDataSource;
    adodsSchool: TADODataSet;
    dsSchool: TDataSource;
    adsAddressType: TADODataSet;
    dsAddressType: TDataSource;
    aspAddAddress: TADOStoredProc;
    aspEditAddress: TADOStoredProc;
    aspDelAddress: TADOStoredProc;
    aspPropToFact: TADOStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmAdress: TdmAdress;

implementation

{$R *.dfm}

end.
