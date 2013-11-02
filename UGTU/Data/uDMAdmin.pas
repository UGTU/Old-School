unit uDMAdmin;
{#Author tanyav@ist.ugtu.net}
interface

uses
  SysUtils, Classes, DB, ADODB, uDM;

type
  TDMAdmin = class(TDataModule)
    adoqAuditObject: TADOQuery;
    adoqAuditOperationType: TADOQuery;
    adoqUsers: TADOQuery;
    dsAuditObject: TDataSource;
    dsAuditOperationType: TDataSource;
    dsUsers: TDataSource;
    adotEvent: TADOTable;
    adotEventObjectName: TStringField;
    adotEventOperationName: TStringField;
    adotEventUserName: TStringField;
    adotEventAuditDateTime: TDateTimeField;
    adotEventDescription: TStringField;
    dsEvent: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMAdmin: TDMAdmin;

implementation

{$R *.dfm}

end.
