unit uDMPrikaz;
{#Author sergdev@ist.ugtu.net}
interface

uses
  SysUtils, Classes, ADODB, DB;

type
  TdmPrikaz = class(TDataModule)
    dsPrikazold: TDataSource;
    adodsPrikazold: TADODataSet;
    adodsPrikazoldIk_prikaz: TIntegerField;
    adodsPrikazoldNn_prikaz: TStringField;
    adodsPrikazoldNamePrikaz: TStringField;
    adodsPrikazoldDd_prikaz: TDateTimeField;
    adodsPrikazoldDd_prikazVst: TDateTimeField;
    adodsPrikazoldik_typePrikaz: TIntegerField;
    adodsPrikazoldName_type: TStringField;
    adodsPrikazoldNN_Date: TStringField;
    dsPrikType: TDataSource;
    adodsPrikType: TADODataSet;
    aspPrikaz: TADOStoredProc;
    dsPrikaz: TDataSource;
    adodsPrikaz: TADOStoredProc;
    adodsPrikazIk_prikaz: TAutoIncField;
    adodsPrikazNn_prikaz: TStringField;
    adodsPrikazik_typePrikaz: TIntegerField;
    adodsPrikazDd_prikaz: TDateTimeField;
    adodsPrikazDd_prikazVst: TDateTimeField;
    adodsPrikazNamePrikaz: TStringField;
    adodsPrikazcTypePrikaz: TStringField;
    adodsPrikazNN_Date: TStringField;

    procedure adodsPrikazCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPrikaz: TdmPrikaz;//TdmPrikaz;

implementation

uses uDM;

{$R *.dfm}

procedure TdmPrikaz.adodsPrikazCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('NN_Date').Value:=  DataSet.FieldByName('Nn_prikaz').Value+' от '+
          Datetostr(DataSet.FieldByName('Dd_prikaz').Value);
end;


end.
