unit uDMFacultetStatistic;
{#Author tanyav@ist.ugtu.net}
interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmFacultetStatistic = class(TDataModule)
    adospSmallKont: TADOStoredProc;
    adospSmallKontik_spec: TIntegerField;
    adospSmallKontDSDesigner: TStringField;
    adospSmallKontDSDesigner2: TIntegerField;
    adospSmallKontDSDesigner3: TIntegerField;
    adospSmallKontDSDesigner4: TIntegerField;
    adospSmallKontDSDesigner5: TIntegerField;
    adospSmallKontDSDesigner6: TIntegerField;
    dsSmallKont: TDataSource;
    dsSelKont: TDataSource;
    adospSelKont: TADOStoredProc;
    adospSelKursItogi: TADOStoredProc;
    dsSelKursItogi: TDataSource;
    adospSelItogiFac: TADOStoredProc;
    dsSelItogiFac: TDataSource;
    adospSelKursItogiCol: TADOStoredProc;
    adospSelKursItogiColik_grup: TIntegerField;
    adospSelKursItogiColKurs: TIntegerField;
    adospSelKursItogiColCname_grup: TStringField;
    adospSelKursItogiColobcol: TIntegerField;
    adospSelKursItogiColacademcol: TIntegerField;
    adospSelKursItogiColdopcol: TIntegerField;
    adospSelKursItogiColotlcol: TIntegerField;
    adospSelKursItogiColhorcol: TIntegerField;
    adospSelKursItogiColudcol: TIntegerField;
    adospSelKursItogiColneudcol: TIntegerField;
    dsSelKursItogiCol: TDataSource;
    dsSelDaysItogi: TDataSource;
    adospSelDaysItogi: TADODataSet;
    adospSelDaysItogiDd_exam: TDateTimeField;
    adospSelDaysItogiik_grup: TIntegerField;
    adospSelDaysItogiCname_grup: TStringField;
    adospSelDaysItogicName_disc: TStringField;
    adospSelDaysItogiprepName: TStringField;
    adospSelDaysItogistudCount: TIntegerField;
    adospSelDaysItogidopCount: TIntegerField;
    adospSelDaysItogiotlCount: TIntegerField;
    adospSelDaysItogihorCount: TIntegerField;
    adospSelDaysItogiudCount: TIntegerField;
    adospSelDaysItogineudCount: TIntegerField;
    adospSelDaysItogiFac: TStringField;

  procedure adospSelKursItogiColCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmFacultetStatistic: TdmFacultetStatistic;

implementation

uses uDM;

{$R *.dfm}

procedure TdmFacultetStatistic.adospSelKursItogiColCalcFields(DataSet: TDataSet);
begin
  adospSelKursItogiCol.FieldByName('udcol').AsInteger:=adospSelKursItogiCol.FieldByName('dopcol').AsInteger-
    adospSelKursItogiCol.FieldByName('otlcol').AsInteger-adospSelKursItogiCol.FieldByName('horcol').AsInteger
    -adospSelKursItogiCol.FieldByName('neudcol').AsInteger;
end;

end.
