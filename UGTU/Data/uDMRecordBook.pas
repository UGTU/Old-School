unit uDMRecordBook;
{#Author sergdev@ist.ugtu.net}
interface

uses
  SysUtils, Classes, ADODB, DB;

type
  TdmRecordBook = class(TDataModule)
    aspCreateBook: TADOStoredProc;
    adodsZach: TADODataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmRecordBook: TdmRecordBook;

implementation

{$R *.dfm}

end.
