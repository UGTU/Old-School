{
  ОПИСАНИЕ
    Классы-обёртки для ActiveX компонента RegExp 5.0
  АВТОР
     Ф.В. Маракасов
  ВЕРСИЯ
     1.0
  ПРИМЕР
    Производит разбор строки, представляющей собою предполагаемый заголовок
    штрих-кода документа в ИС УГТУ. Выводит на экран всю тестовую строку
    (т.е. 1.0#1024#100) и
     а) Старший номер версии (т.е. 1)
     б) Младший номер версии (т.е. 0)
     в) Идентификатор типа документа (т.е. 1024)
     г) Идентификатор документа (т.е. 100)


  procedure ParseBarcodeHeader;
  const
    pattern = '^(\d+).(\d+)#(\d+)#(\d+)';
  var
    Matches:TMatchCollection;
    I, J: Integer;
  begin
    Matches := TRegularExpression.Execute(pattern, '1.0#1024#100');
    try
      for I := 0 to Matches.Count - 1 do
      begin
        ShowMessage(Matches[i].Value);
        for J := 0 to Matches[I].SubMatches.Count - 1 do
        begin
          ShowMessage(Matches[I].SubMatches[J]);
        end;
      end;
    finally
      Matches.Free;
    end;
  end;
}

unit RegularEx;
{#Author fmarakasov@ugtu.net}
interface
uses
  VBScript_RegExp_55_TLB, Contnrs;
type

  // Определяет одно найденное совпадение шаблона
  TMatch = class;

  { Коллекция подсовпадений. Каждое подсовпадение в шаблоне задаётся в "()"
    Пример
      Pattern := '^(\d+).(\s+#end)';
      Text := '101.Hello#end';
      Matches := TRegularExpression.Match(Pattern, Text);
      будет найдено два подсовпадения:
         1) 101
         2) Hello#end
  }
  TSubmatchesCollection = class (TInterfacedObject, ISubmatches)
  private
    FSubmatchesDisp:ISubmatches;
    constructor Create(pSubmatches:IDispatch);
    function GetItem(i:Integer): WideString;
    function GetCount:Integer;
  public
    // Ссылка на интерфейс ISubmatches
    property Submatches:ISubmatches read FSubmatchesDisp implements ISubmatches;
    // Доступ к подсовпадению по индексу
    property Items[Index:Integer]:WideString read GetItem; default;
    // Количество подсовпадений
    property Count:Integer read GetCount;
  end;

  // Определяет одно совпадение шаблона
  TMatch = class (TInterfacedObject, IMatch2)
  private
    FMatch:IMatch2;
    FSubmatchesCollection:TSubmatchesCollection;
    constructor Create(pMatch:IMatch2);
    function GetValue:WideString;
    function GetFirstIndex:Integer;
    function GetLength:INteger;
    function GetSubmatches:TSubmatchesCollection;

  public
    // Ссылка на интерфейс IMatch2
    property Match : IMatch2 read FMatch implements IMatch2;
    // Значение
    property Value : WideString read GetValue;
    // Индекс начала совпадения в строке
    property FirstIndex : Integer read GetFirstIndex;
    // Длина совпадения
    property Length : Integer read GetLength;
    // Коллекция подсовпадений
    property SubMatches:TSubmatchesCollection read GetSubmatches;
  end;

  // Коллекция совпадений шаблона
  TMatchCollection = class(TInterfacedObject, IMatchCollection2)
  private
    FMatchCollectionDisp:IMatchCollection2;
    FMatchCollection:TObjectList;
    function GetItem(Index:Integer):TMatch;
    constructor Create(pCollection:IDispatch);

    function GetCount: Integer;
    procedure InitList;
  public
    destructor Destroy;override;

    // Доступ к совпадению по интедексу
    property Items[Index:Integer]:TMatch read GetItem; default;
    // Число совпадений
    property Count:Integer read GetCount;
    // Ссылка на интерфейс  IMatchCollection2
    property MatchCollection:IMatchCollection2 read FMatchCollectionDisp implements IMatchCollection2;
  end;

  // Обёртка для класса Regexp
  TRegularExpression = class
  private
    class function CreateRegExp(Pattern:WideString; Global:Boolean; IgnoreCase:Boolean; Multiline:Boolean):IRegExp2;
  public
    // Находит заданные совпадения в тексте (Text) по шаблону (Pattern)
    // После использования результат функции (объект TMatchCollection) должен быть разрушен через деструктор (Matches.Free, см. ПРИМЕР)
    class function Execute (Pattern:WideString; Text:WideString; Global : Boolean = true; Multiline:Boolean = false; IgnoreCase:Boolean = false):TMatchCollection;
    // Проверяет соответствует ли текст (Text) шаблону (Pattern)
    class function Test(Pattern:WideString; Text:WideString; Global : Boolean = true; Multiline:Boolean = false; IgnoreCase:Boolean = false):Boolean;
  end;

implementation
uses
  ComObj, ActiveX;
{ TMatchCollection }

constructor TMatchCollection.Create(pCollection: IDispatch);
begin
  Assert(Assigned(pCollection), 'Не задан указатель на коллекцию');
  Assert(Succeeded(pCollection.QueryInterface(IID_IMatchCollection2, FMatchCollectionDisp)), 'Интерфейс IMatchCollection2 не найден');
  InitList;
end;

destructor TMatchCollection.Destroy;
begin
  FMatchCollection.Free;
  inherited;
end;

function TMatchCollection.GetCount: Integer;
begin
  Result := FMatchCollection.Count;
end;

function TMatchCollection.GetItem(Index: Integer): TMatch;
begin
  Result := FMatchCollection.Items[Index] as TMatch;
end;

procedure TMatchCollection.InitList;
var
  pMatchDisp:IDispatch;
  pMatch:IMatch2;
  newMatch:TMatch;
  I: Integer;
begin
  FMatchCollection := TObjectList.Create;
  for I := 0 to FMatchCollectionDisp.Count - 1 do
  begin
    pMatchDisp := FMatchCollectionDisp.Item[I];
    Assert(pMatchDisp <> nil, 'Элемент коллекции IMatchCollection2 не найден.');
    Assert(Succeeded(pMatchDisp.QueryInterface(IID_IMatch2, pMatch)), 'Не удалось получить интерфейс IID_IMatch2.');
    newMatch := TMatch.Create(pMatch);
    FMatchCollection.Add(newMatch);
  end;
end;

{ TRegularExpression }
class function TRegularExpression.CreateRegExp(Pattern:WideString; Global:Boolean; IgnoreCase:Boolean; Multiline:Boolean):IRegExp2;
begin
  Result := CoRegExp.Create;
  Result.Pattern := Pattern;
  Result.Global := Global;
  Result.IgnoreCase := IgnoreCase;
  Result.Multiline := Multiline;
end;

class function TRegularExpression.Execute(Pattern,
  Text: WideString; Global : Boolean; Multiline : Boolean; IgnoreCase:Boolean): TMatchCollection;
var
  exp : IRegExp2;
  pmatchcollection : IDispatch;
begin
  exp := CreateRegExp(Pattern, Global, IgnoreCase, Multiline);
  pmatchcollection := exp.Execute(Text);
  Result := TMatchCollection.Create(pmatchcollection);
end;

class function TRegularExpression.Test(Pattern, Text: WideString; Global : Boolean; Multiline : Boolean; IgnoreCase:Boolean): Boolean;
var
  exp : IRegExp2;
begin
  exp := CreateRegExp(Pattern, Global, IgnoreCase, Multiline);
  Result := exp.Test(Text);
end;

{ TMatch }

constructor TMatch.Create(pMatch: IMatch2);
begin
  Self.FMatch := pMatch;
  Assert(FMatch <> nil, 'Не задана ссылка на объект pMatch.');
end;

function TMatch.GetFirstIndex: Integer;
begin
  Result := FMatch.FirstIndex;
end;

function TMatch.GetLength: INteger;
begin
  Result := FMatch.Length;
end;

function TMatch.GetSubmatches: TSubmatchesCollection;
begin
  if (not (Assigned(FSubmatchesCollection))) then
    FSubmatchesCollection := TSubmatchesCollection.Create(Self.FMatch.SubMatches);
  Result := FSubmatchesCollection;
end;

function TMatch.GetValue: WideString;
begin
  Result := FMatch.Value;
end;

{ TSubmatchesCollection }

constructor TSubmatchesCollection.Create(pSubmatches: IDispatch);
begin
  Assert(Assigned(pSubmatches), 'Не задан указатель на коллекцию Submatches.');
  Assert(Succeeded(pSubmatches.QueryInterface(IID_ISubmatches, FSubmatchesDisp)), 'Интерфейс IID_ISubmatches не найден.');
end;

function TSubmatchesCollection.GetCount: Integer;
begin
  Result := FSubmatchesDisp.Count;
end;

function TSubmatchesCollection.GetItem(i: Integer): WideString;
begin
  Result := WideString(FSubmatchesDisp.Item[i]);
end;

end.
