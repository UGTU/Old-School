unit SBS;
  {#Author fmarakasov@ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons;

type

  TCustomCondition = class;
  TConditionButton = class;
  TBitwiseButton   = class;



  TCustomCondition = class(TSpeedButton)
  private
    FCondition:TCustomCondition;
    FConditions:TStrings;
    FPosition:Integer;
  protected
    procedure DoClick(Sender:TObject);
    property Position:Integer read FPosition write FPosition;
    property Conditions:TStrings read FConditions write FConditions;
  published
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;

    property Condition:TCustomCondition read FCondition write FCondition;
  end;

  TBitwiseButton = class (TCustomCondition)
  public
    constructor Create(AOwner:TComponent);override;
  end;

  TConditionButton = class (TCustomCondition)
  public
    constructor Create(AOwner:TComponent);override;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('A2PG', [TConditionButton, TBitwiseButton]);
end;

constructor TCustomCondition.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  Position:=-1;
  FConditions:=TStringList.Create;
  OnClick:=DoClick;
end;

destructor TCustomCondition.Destroy;
begin
  FConditions.Free;
end;

constructor TBitwiseButton.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  Conditions.Add('=');
  Conditions.Add('<>');
  Conditions.Add('>=');
  Conditions.Add('<=');
  Conditions.Add('>');
  Conditions.Add('<');
  Conditions.Add('');
end;

constructor TConditionButton.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  Conditions.Add('È');
  Conditions.Add('ÈËÈ');
  Conditions.Add('');
end;

procedure TCustomCondition.DoClick(Sender:TObject);
begin
  if Position >= Conditions.Count then Position:=0 else Position:=Position+1;
  Caption:=Conditions.Strings[Position];
end;

end.
