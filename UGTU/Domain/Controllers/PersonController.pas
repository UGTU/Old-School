unit PersonController;

interface

uses DocumentClass, System.Generics.Collections;

type
  TPersonController = class(TObject)
  protected
    constructor CreateInstance;
    // AccessInstance предоставляет доступ к экземпляру контроллера
    class function AccessInstance(Request: Integer): TPersonController;

  public
    constructor Create;
    // Instance - возвращает экзепляр данного контроллера
    class function Instance: TPersonController;
    // ReleaseInstance - уничтожает контроллер
    class procedure ReleaseInstance;

    // --------------------------работа с документами----------------------------
    procedure AddDocument(aNCode: Integer; aDoc: TDocRecord);
    procedure AddDocuments(aNCode: Integer; aDocList: TObjectList<TDocRecord>);
    procedure UpdateDocument(aNewDoc: TDocRecord);
    procedure DeleteDocument(aDocIK: Integer);
  end;

implementation

uses ExceptionBase, CommandController;

var
  FTPersonControllerInstance: TPersonController = nil;

  { TPersonController }

class function TPersonController.AccessInstance(Request: Integer)
  : TPersonController;
begin
  case Request of
    0:
      ;
    1:
      if not Assigned(FTPersonControllerInstance) then
        FTPersonControllerInstance := CreateInstance;
    2:
      if FTPersonControllerInstance <> nil then
      begin
        FTPersonControllerInstance.Free;
        FTPersonControllerInstance := nil;
      end;
  else
    raise EApplicationException.CreateFmt
      ('Неизвестное значение параметра %d в методе AccessInstance контроллера TAbitOtchetsController',
      [Request]);
  end;
  Result := FTPersonControllerInstance;
end;

procedure TPersonController.AddDocument(aNCode: Integer; aDoc: TDocRecord);
var
  FAddDocument: TAddDocument;
  FAddFile: TAddDocFiles;
  iDoc: integer;
  i: integer;
begin
  FAddDocument := TAddDocument.Create(aNCode);

  with aDoc do
    iDoc := FAddDocument.Add(ikDocVid, balls, seria, number, kem_vidan, addinfo, isreal,
      get_date, ikDisc);

  if aDoc.docs.Count > 0 then
  begin
    FAddFile := TAddDocFiles.Create(iDoc);
    for I := 0 to aDoc.docs.Count - 1 do
      FAddFile.Add(aDoc.docs[i]);
    FAddFile.Free;
  end;

  FAddDocument.Free;
end;

procedure TPersonController.AddDocuments(aNCode: Integer;
  aDocList: TObjectList<TDocRecord>);
var
  i: Integer;
begin
  for i := 0 to aDocList.Count - 1 do
    AddDocument(aNCode, aDocList.Items[i]);
end;

constructor TPersonController.Create;
begin
  inherited Create;
  raise EApplicationException.CreateFmt
    ('Доступ к классу %s можно получить только через поле Instance!',
    [ClassName]);
end;

constructor TPersonController.CreateInstance;
begin
  inherited Create;
end;

procedure TPersonController.DeleteDocument(aDocIK: Integer);
var FDeleteDocument: TDeleteDocument;
begin
  FDeleteDocument := TDeleteDocument.Create(aDocIK);
  FDeleteDocument.Delete;
  FDeleteDocument.Free;
end;

class function TPersonController.Instance: TPersonController;
begin
  Result := AccessInstance(1);
end;

class procedure TPersonController.ReleaseInstance;
begin
  AccessInstance(2);
end;

procedure TPersonController.UpdateDocument(aNewDoc: TDocRecord);
var
  FUpdateDocument: TUpdateDocument;
  FAddFile: TAddDocFiles;
  i: integer;
begin
  FUpdateDocument := TUpdateDocument.Create(aNewDoc.ikDoc);
  FAddFile := TAddDocFiles.Create(aNewDoc.ikDoc);
  with aNewDoc do
    FUpdateDocument.Update(ikDocVid, balls, seria, number, kem_vidan, addinfo,
      isreal, get_date, ikDisc);

  FAddFile.Delete;  //чистим все файлы
  if aNewDoc.docs.Count > 0 then    //если файлы подгружены
    for i := 0 to aNewDoc.docs.Count - 1 do
       FAddFile.Add(aNewDoc.docs[i]);

  FAddFile.Free;
  FUpdateDocument.Free;
end;

end.
