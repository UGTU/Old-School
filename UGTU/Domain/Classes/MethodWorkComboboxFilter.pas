unit MethodWorkComboboxFilter;
   {#Author nnikolenko@ist.ugtu.net}
interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, ADODB, DB, ComCtrls,
  Forms, Dialogs, DBLookupEh, Variants, StdCtrls, Grids, ComObj,
  DateUtils, DBCtrlsEh;

type
  IFilter = interface
    ['{FF82FCEB-F9F4-4F6F-A0A5-D5F9934DC29C}']
    function IsFiltered : Boolean;
    function GetQueryText : String;
  end;

  TBitwiseType = (bwLess, bwLessOrEqual, bwEquals, bwGrater, bwGraterOrEqual, bwNotEqual);

  TDBComboboxFilter = class(TDBComboboxEh, IFilter)
  private
    FNotFilteredIndex : Integer;
    FBooleanField : boolean;
    FNameField, FTextField: string;
    FTypeSign : TBitwiseType;
    //constructor Create(AOwner: TComponent; NameField: string; BooleanField: boolean; TypeSign: TBitwiseType);
    { Private declarations }
  protected
    function IsFiltered : Boolean;
    function GetQueryText : String;
    { Protected declarations }
  public
    const
      FILTER_ALL = '<все>';
    constructor Create(AOwner: TComponent; NameField: string; BooleanField: boolean; TypeSign: TBitwiseType);
    { Public declarations }
  published
    property NotFilteredIndex : Integer read FNotFilteredIndex write FNotFilteredIndex;
    property TypeSign : TBitwiseType read FTypeSign write FTypeSign;
    property TextField : string read FTextField write FTextField;
    property BooleanField : boolean read FBooleanField write FBooleanField;
    { Published declarations }
  end;

implementation

{ TDBComboboxFilter }

constructor TDBComboboxFilter.Create(AOwner: TComponent; NameField: string; BooleanField: boolean;
  TypeSign: TBitwiseType);
begin
  inherited Create(AOwner);
  FNameField:= NameField;
  FBooleanField:= BooleanField;
  FTypeSign:= TypeSign;
end;

function TDBComboboxFilter.GetQueryText: String;
const
  TextCondition : array[0..5] of string = ('<', '<=', '=', '>', '>=', '<>');
begin
  if FBooleanField then
  begin
    case ItemIndex of
    1: Result:= FNameField + ' = 1';
    2: Result:= FNameField + ' = 0';
    end;
  end
  else
  if FTextField = '' then
    Result := //Format('(%s %s %s)', [FNameField, TextCondition[Ord(FTypeSign)], Text]);
              FNameField + TextCondition[Ord(FTypeSign)] + '''' + (Text) + ''''
  else Result:= FNameField + TextCondition[Ord(FTypeSign)] + '''' + (FTextField) + '''';
end;

function TDBComboboxFilter.IsFiltered: Boolean;
begin
  //Result := ItemIndex <> FNotFilteredIndex;
  Result := (Text <> TDBComboboxFilter.FILTER_ALL) and (Text <> '');
end;
//------------------------------------------------------------------------------

end.
