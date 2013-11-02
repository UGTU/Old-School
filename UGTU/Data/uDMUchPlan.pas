unit uDMUchPlan;
 {#Author sergdev@ist.ugtu.net}
interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmUchPlan = class(TDataModule)
    dsUchPlan: TDataSource;
    adodsUchPlan: TADODataSet;
    qCanRemoveBRS: TADOQuery;
    aspSetBRS: TADOStoredProc;
    adsGetHours: TADODataSet;
    ADOQContentForDiscVC: TADODataSet;
    ADOQContentForDiscAZ: TADODataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmUchPlan: TdmUchPlan;

implementation

{$R *.dfm}

end.
