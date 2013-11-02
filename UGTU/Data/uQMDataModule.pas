unit uQMDataModule;
{#Author sergdev@ist.ugtu.net}
interface

uses
  SysUtils, Classes, uDm, db, adodb;

type
  TQMDataModule = class(TDataModule)
    adodsQMTables: TADODataSet;
    adodsQMFields: TADODataSet;
    adodsQMRelations: TADODataSet;
    adodsQMTablesik_table: TBCDField;
    adodsQMTablesctable_name: TStringField;
    adodsQMTablesctable_caption: TStringField;
    adodsQMAllFields: TADODataSet;
    adodsQMAdminTables: TADODataSet;
    BCDField1: TBCDField;
    StringField1: TStringField;
    StringField2: TStringField;
    adodsQMAdminFields: TADODataSet;
    StringField3: TStringField;
    StringField4: TStringField;
    BooleanField1: TBooleanField;
    adodsQMAllFieldsik_field: TBCDField;
    adodsQMAllFieldsik_table: TBCDField;
    adodsQMAllFieldscfield_name: TStringField;
    adodsQMAllFieldscfield_caption: TStringField;
    adodsQMAllFieldslvisible: TBooleanField;
    adodsQMAdminFieldsctable_name: TStringField;
    adodsQMAdminFieldsctable_caption: TStringField;
    adodsQMADMINRelations: TADODataSet;
    adodsQMADMINRelationsik_relation: TBCDField;
    adodsQMADMINRelationsik_field2: TBCDField;
    adodsQMADMINRelationscfield_name2: TStringField;
    adodsQMADMINRelationsik_field1: TBCDField;
    adodsQMADMINRelationscfield_name1: TStringField;
    adodsQMADMINRelationsctable_name1: TStringField;
    adodsQMADMINRelationsctable_name2: TStringField;
    adodsQMADMINRelationscfield_caption: TStringField;
    adodsQMADMINRelationsExpr1: TStringField;
    adodsQMADMINRelationsctable_caption: TStringField;
    adodsQMADMINRelationsExpr2: TStringField;
    adospQMAddTable: TADOStoredProc;
    adospQMEditTable: TADOStoredProc;
    adospQMDeleteTable: TADOStoredProc;
    adospQMAddField: TADOStoredProc;
    AdospQMEditField: TADOStoredProc;
    adospQMDeleteField: TADOStoredProc;
    adodsQMAdminFieldsik_table: TBCDField;
    adodsQMAdminFieldsik_field: TBCDField;
    adospQMAddRelation: TADOStoredProc;
    adospQMDeleteRelation: TADOStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QMDataModule: TQMDataModule;

implementation

{$R *.dfm}

end.
