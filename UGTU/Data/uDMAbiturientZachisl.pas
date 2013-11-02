unit uDMAbiturientZachisl;
{#Author tanyav@ist.ugtu.net}
interface

uses
    SysUtils, Classes, DB, ADODB, DBClient, Provider, StdCtrls, Variants, DBLookupEh, uDMUgtuStructure;


type
  TDMAbiturientZachisl = class(TDataModule)
    adospAbitSpisokForZachisl: TADOStoredProc;
    adospAbitSpisokForZachislnn_abit: TAutoIncField;
    adospAbitSpisokForZachislfio: TStringField;
    adospAbitSpisokForZachislcshort_name_fac: TStringField;
    adospAbitSpisokForZachislcname_spec: TStringField;
    adospAbitSpisokForZachislcname_zach: TStringField;
    adospAbitSpisokForZachislcname_kat_zach: TStringField;
    adospAbitSpisokForZachislSumBall: TIntegerField;
    adospAbitSpisokForZachislik_zach: TAutoIncField;
    adospAbitSpisokForZachislNNrecord: TAutoIncField;
    adospAbitSpisokForZachislik_spec: TAutoIncField;
    adospAbitSpisokForZachislik_fac: TAutoIncField;
    adospAbitSpisokForZachislik_spec_fac: TAutoIncField;
    adospAbitSpisokForZachislik_type_kat: TIntegerField;
    adospAbitSpisokForZachislbit_Lgota: TBooleanField;
    adospAbitSpisokForZachislbit_NotMinim: TIntegerField;
    adospAbitSpisokForZachislik_kat_zach: TAutoIncField;
    dsAbitSpisokForZachisl: TDataSource;
    adospAbitZachisl: TADOStoredProc;
    dsAbitSpisokForPrikaz: TDataSource;
    adoqAbitMinBalls: TADOQuery;
    dsAbitMinBalls: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  DMAbiturientZachisl: TDMAbiturientZachisl;

implementation

uses uDM;

{$R *.dfm}
end.
