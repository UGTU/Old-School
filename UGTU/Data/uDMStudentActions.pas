unit uDMStudentActions;
 {#Author sergdev@ist.ugtu.net}
interface

uses
  SysUtils, Classes, DB, ADODB, uDM;

type
  TdmStudentActions = class(TDataModule)
    aspAddRelative: TADOStoredProc;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    BCDField2: TBCDField;
    StringField3: TStringField;
    StringField4: TStringField;
    aspAddLang: TADOStoredProc;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    BCDField1: TBCDField;
    StringField1: TStringField;
    StringField2: TStringField;
    aspDelStud: TADOStoredProc;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    BCDField3: TBCDField;
    StringField5: TStringField;
    StringField6: TStringField;
    aspAppendStudent: TADOStoredProc;
    aspAcademreturn: TADOStoredProc;
    aspChangeLastName: TADOStoredProc;
    aspChangePassport: TADOStoredProc;
    aspAppendStudGroup: TADOStoredProc;
    aspLevelUp: TADOStoredProc;
    aspJoinGrup: TADOStoredProc;
    aspAddDoc: TADOStoredProc;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    BCDField4: TBCDField;
    StringField7: TStringField;
    StringField8: TStringField;
    aspExtendSession: TADOStoredProc;
    aspAppendStudGroupAcadem: TADOStoredProc;
    IntegerField9: TIntegerField;
    IntegerField10: TIntegerField;
    BCDField5: TBCDField;
    StringField9: TStringField;
    StringField10: TStringField;
    aspChangeKatZach: TADOStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmStudentActions: TdmStudentActions;

implementation

{$R *.dfm}

end.
