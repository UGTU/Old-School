unit uDMCauses;
{#Author sergdev@ist.ugtu.net}
interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmCauses = class(TDataModule)
    dsJoinCause: TDataSource;
    adodsJoinCause: TADODataSet;
    adodsJoinCauseIk_pric: TAutoIncField;
    adodsJoinCauseCname_pric: TStringField;
    adodsJoinCauseikTypePric: TIntegerField;
    adodsExCause: TADODataSet;
    AutoIncField1: TAutoIncField;
    StringField13: TStringField;
    IntegerField12: TIntegerField;
    dsExCause: TDataSource;
    adodsExile: TADODataSet;
    dsExile: TDataSource;
    dsCauseChangePass: TDataSource;
    adodsCauseChangePass: TADODataSet;
    AutoIncField7: TAutoIncField;
    StringField19: TStringField;
    IntegerField18: TIntegerField;
    dsAcademCause: TDataSource;
    adodsAcademCause: TADODataSet;
    AutoIncField5: TAutoIncField;
    StringField17: TStringField;
    IntegerField16: TIntegerField;
    adodsCauseLastName: TADODataSet;
    AutoIncField6: TAutoIncField;
    StringField18: TStringField;
    IntegerField17: TIntegerField;
    dsCauseLastName: TDataSource;
    adodsRestoreCause: TADODataSet;
    AutoIncField2: TAutoIncField;
    StringField14: TStringField;
    IntegerField13: TIntegerField;
    dsRestoreCause: TDataSource;
    dsMoveFromCause: TDataSource;
    adodsMoveFromCause: TADODataSet;
    AutoIncField3: TAutoIncField;
    StringField15: TStringField;
    IntegerField14: TIntegerField;
    dsMoveToCause: TDataSource;
    adodsMoveToCause: TADODataSet;
    AutoIncField4: TAutoIncField;
    StringField16: TStringField;
    IntegerField15: TIntegerField;
    dsSessionExtendCauses: TDataSource;
    adodsSessionExtendCauses: TADODataSet;
    AutoIncField8: TAutoIncField;
    StringField1: TStringField;
    IntegerField1: TIntegerField;
    dsKatZachCause: TDataSource;
    adodsKatZachCause: TADODataSet;
    AutoIncField9: TAutoIncField;
    StringField2: TStringField;
    IntegerField2: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCauses: TdmCauses;

implementation

{$R *.dfm}

end.
