unit uDMGroupActions;
{#Author sergdev@ist.ugtu.net}
interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmGroupActions = class(TDataModule)
    dsAppendGrup: TDataSource;
    adospAppendGrup: TADOStoredProc;
    aspGroupChange: TADOStoredProc;
    aspGroupChange_withupdate: TADOStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmGroupActions: TdmGroupActions;

implementation

{$R *.dfm}

end.
