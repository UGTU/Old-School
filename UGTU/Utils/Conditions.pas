unit Conditions;
  {#Author fmarakasov@ugtu.net}
interface
uses
  Contnrs;

type
  TBaseCondition = class
  private
    function GetAsText: AnsiString; virtual; abstract;
  public
    //������������ �������� � ������� ������ � ���� ����� ������
    property AsText: AnsiString read GetAsText;
  end;

  //������� �������. ������ ������ ���� "����1 >= 11"
  TCondition = class(TBaseCondition)
  private
    FField: String;
    FOperation: String;
    FValue: String;
    function GetAsText: AnsiString; override;
  public
    property Field: String read FField write FField;
    property Operation: String read FOperation write FOperation;
    property Value: String read FValue write FValue;
    //��� �������� ���������� ������ ����� ����� ������ ��������
    //����, ��������� � ��������
    constructor Create(AField, AOperation, AValue: String);overload;
  end;

  //������ ������� - ������ ��������� ������� � ����� �������,
  //����������� ����� ���������� ����������
  //����� ����������� ������� ����� ������ ������� �����������,
  //��������: "(�=1 ��� �<5) � �>=10"
  TConditionGroup = class(TBaseCondition)
  private
    FConditionList: TObjectList;
    FGroupingOperator: String;
    function GetItem(Index: Integer): TBaseCondition;
    function GetAsText: AnsiString; override;
    procedure SetItem(Index: Integer; const Value: TBaseCondition);
  public
    property Items[Index: Integer]: TBaseCondition read GetItem write SetItem;
    property GroupingOperator: String read FGroupingOperator write FGroupingOperator;
    procedure AddCondition(ACondition: TBaseCondition);
    procedure Clear;
    //��� �������� ���������� ������ ����� ����� �������, ��� ������ ������
    //����������� ��������� ����� �������������� ��� ��������
    constructor Create(AGroupingOperator: String); overload;
    constructor Create(AGroupingOperator: String; AOwnsObjects: Boolean); overload;
  end;

implementation

{ TBaseCondition }


{ TCondition }

constructor TCondition.Create(AField, AOperation, AValue: String);
begin
  inherited Create;
  FField := AField;
  FOperation := AOperation;
  FValue := AValue;
end;

function TCondition.GetAsText: AnsiString;
begin
  if (Length(Field) > 0) and (Length(Operation) > 0) and (Length(Value) > 0) then
    Result := '(' + Field + ' ' + Operation + ' ' + Value + ')';
end;

{ TConditionGroup }

procedure TConditionGroup.AddCondition(ACondition: TBaseCondition);
begin
  FConditionList.Add(ACondition);
end;

procedure TConditionGroup.Clear;
begin
  FConditionList.Clear;
end;

constructor TConditionGroup.Create(AGroupingOperator: String;
  AOwnsObjects: Boolean);
begin
  inherited Create;
  FConditionList := TObjectList.Create(AOwnsObjects);
  FGroupingOperator := AGroupingOperator;
end;

constructor TConditionGroup.Create(AGroupingOperator: String);
begin
  Create(AGroupingOperator,false);
end;

function TConditionGroup.GetAsText: AnsiString;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to FConditionList.Count - 1 do
    if Length(Items[i].AsText) > 0 then
      Result := Result + ' ' + FGroupingOperator + ' ' + Items[i].AsText;
  if Length(Result) > 0 then
    Result := '(' + Copy(Result,Length(FGroupingOperator) + 2 + 1, Length(Result)) + ')';
end;

function TConditionGroup.GetItem(Index: Integer): TBaseCondition;
begin
  Result := FConditionList.Items[Index] as TBaseCondition;
end;

procedure TConditionGroup.SetItem(Index: Integer; const Value: TBaseCondition);
begin
  FConditionList.Items[Index] := Value;
end;

end.
