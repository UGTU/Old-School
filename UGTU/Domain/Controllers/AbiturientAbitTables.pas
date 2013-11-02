unit AbiturientAbitTables;
 {#Author tanyav@ist.ugtu.net}
interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, AbiturientBaseTables, AbiturientFacade,ADODB, db,DBGrids, ApplicationController, ExceptionBase;
type
 EAbitGetDocException = class(EApplicationException)
  public
    constructor Create;
  end;

 EAbitGetLangException = class(EApplicationException)
  public
    constructor Create;
  end;

 EAbitGetPostupException = class(EApplicationException)
  public
    constructor Create;
  end;

 EAbitGetExamException = class(EApplicationException)
  public
    constructor Create;
  end;

 EAbitGetRoditException = class(EApplicationException)
  public
    constructor Create;
  end;
//формирование таблицы документов
 TAbitTableDocGetTable = class (TGetTable)
  public
    procedure MakeTable();
    constructor Create(AOwner: TComponent); override;
  end;
//формирование таблицы €зыков
 TAbitTableLangGetTable = class (TGetTable)
  public
    procedure MakeTable();
    constructor Create(AOwner: TComponent); override;
  end;
//формирование таблицы поступлени€
 TAbitTablePostupGetTable = class (TGetTable)
  public
    procedure MakeTable();
    constructor Create(AOwner: TComponent); override;
  end;
//формирование таблицы вступительных экзаменов
 TAbitTableExamGetTable = class (TGetTable)
  public
    procedure MakeTable();
    constructor Create(AOwner: TComponent); override;
  end;
//формирование таблицы родителей
 TAbitTableRoditGetTable = class (TGetTable)
  public
    procedure MakeTable();
    constructor Create(AOwner: TComponent); override;
  end;
 //таблица видов документов
  TAbitTableDocumentsGetTable = class (TGetTable)
  public
    constructor Create(AOwner: TComponent); override;
  end;
 //таблица " ем выдан документ"
  TAbitTableKemVidanGetTable = class (TGetTable)
  public
    constructor Create(AOwner: TComponent); override;
  end;
implementation
{
****************************** TAbitTableDocGetTable *******************************
}
constructor TAbitTableDocGetTable.Create(AOwner: TComponent);
begin
  inherited;
  Tablename:='doc_abit';
end;

procedure TAbitTableDocGetTable.MakeTable();
var F1:TField;
begin
try
  F1:=TField.Create(Self);
  Fields.Clear;
  F1.FieldKind:=(fkData);
  F1.FieldName:='ik_vid_doc';
  fields.Add(F1);

  fields.Add(F1);
  ShowMessage(IntToSTr(Fields.count-1));
  fields[Fields.count-1].FieldName:='cvid_doc';
  fields[Fields.count-1].FieldKind:=fkLookup;
  fields[Fields.count-1].KeyFields:='ik_vid_doc';
  fields[Fields.count-1].LookupDataSet:=TAbiturientFacade.Instance.TableList.DataSetByClassType[TAbitTableDocumentsGetTable];
  fields[Fields.count-1].LookupKeyFields:='ik_vid_doc';
  fields[Fields.count-1].LookupResultField:='cvid_doc';

  {
  F1.FieldName:='cd_kem_vidan';
  F1.FieldKind:=fkLookup;
  F1.KeyFields:='ik_kem_vidan';
  F1.LookupDataSet:=TAbiturientFacade.Instance.TableList.DataSetByClassType[TAbitTableKemVidanGetTable];
  F1.LookupKeyFields:='ik_kem_vidan';
  F1.LookupResultField:='cd_kem_vidan';
  //F1.Size:=200;
  fields.Add(F1);   }
  Active:=true;
  except
    raise EAbitGetDocException.Create;
  end;
end;

{
****************************** TAbitTableLangGetTable *******************************
}
constructor TAbitTableLangGetTable.Create(AOwner: TComponent);
begin
  inherited;
  Tablename:='lang_abit';
end;

procedure TAbitTableLangGetTable.MakeTable();
begin
try

  except
    raise EAbitGetLangException.Create;
  end;
end;


{
****************************** TAbitTablePostupGetTable *******************************
}
constructor TAbitTablePostupGetTable.Create(AOwner: TComponent);
begin
  inherited;
  Tablename:='postup_abit';
end;

procedure TAbitTablePostupGetTable.MakeTable();
begin
try

  except
    raise EAbitGetPostupException.Create;
  end;
end;


{
****************************** TAbitTableExamGetTable *******************************
}
constructor TAbitTableExamGetTable.Create(AOwner: TComponent);
begin
  inherited;
  Tablename:='vstup_ekz';
end;

procedure TAbitTableExamGetTable.MakeTable();
begin
try

  except
    raise EAbitGetExamException.Create;
  end;
end;


{
****************************** TAbitTableRoditGetTable *******************************
}
constructor TAbitTableRoditGetTable.Create(AOwner: TComponent);
begin
  inherited;
  Tablename:='rodit_abit';
end;

procedure TAbitTableRoditGetTable.MakeTable();
begin
try

  except
    raise EAbitGetRoditException.Create;
  end;
end;

{
****************************** TAbitTableDocumentsGetTable  *******************************
}
constructor TAbitTableDocumentsGetTable .Create(AOwner: TComponent);
begin
  inherited;
  Tablename:='documents';
  Active:=true;
end;

{
****************************** TAbitTableKemVidanGetTable  *******************************
}
constructor TAbitTableKemVidanGetTable.Create(AOwner: TComponent);
begin
  inherited;
  Tablename:='kem_vidan_abit';
  Active:=true;
end;


{ EAbitGetDocException }

constructor EAbitGetDocException.Create;
begin
  inherited Create('Ќе удалось получить данные документов абитуриента');
end;

{ EAbitGetLangException }

constructor EAbitGetLangException.Create;
begin
  inherited Create('Ќе удалось получить данные знани€ €зыков абитуриента');
end;

{ EAbitGetPostupException }

constructor EAbitGetPostupException.Create;
begin
  inherited Create('Ќе удалось получить данные поступлени€ абитуриента');
end;

{ EAbitGetExamException }

constructor EAbitGetExamException.Create;
begin
  inherited Create('Ќе удалось получить данные вступительных экзаменов абитуриента');
end;

{ EAbitGetRoditException }

constructor EAbitGetRoditException.Create;
begin
  inherited Create('Ќе удалось получить данные родителу (семьи) абитуриента');
end;

end.
 