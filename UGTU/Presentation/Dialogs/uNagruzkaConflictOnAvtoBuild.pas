unit uNagruzkaConflictOnAvtoBuild;
   {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, GeneralController, Contnrs,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, Grids, NagruzkaController, NagruzkaClasses;

type
  PStringList = ^TStringList;

  TfrmNagruzkaConflictOnAvtoBuild = class(TfrmBaseDialog)
    StaticText1: TStaticText;
    Label1: TLabel;
    Image1: TImage;
    sgConflict: TStringGrid;
    procedure sgConflictDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
  private
    fConflictList: TObjectList;
    function getConflictItem(index: integer): TConflictOnAutoBuildItem;
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    Procedure Read(conflictList: TObjectList);
    property ConflictItems[index: integer]: TConflictOnAutoBuildItem read getConflictItem;
  end;

var
  frmNagruzkaConflictOnAvtoBuild: TfrmNagruzkaConflictOnAvtoBuild;

implementation

{$R *.dfm}

{ TfrmNagruzkaConflictOnAvtoBuild }

function TfrmNagruzkaConflictOnAvtoBuild.DoApply: boolean;
begin
  Result:= true;
end;

function TfrmNagruzkaConflictOnAvtoBuild.DoCancel: boolean;
begin
  Result:= true;
end;

procedure TfrmNagruzkaConflictOnAvtoBuild.FormShow(Sender: TObject);
begin
  inherited;
  bbCancel.SetFocus;
  sgConflict.DefaultRowHeight:= sgConflict.Canvas.TextHeight('И')*4 + 20;
end;

function TfrmNagruzkaConflictOnAvtoBuild.getConflictItem(
  index: integer): TConflictOnAutoBuildItem;
begin
  Result:= fConflictList[index] as TConflictOnAutoBuildItem;
end;

procedure TfrmNagruzkaConflictOnAvtoBuild.Read(conflictList: TObjectList);
begin
  fConflictList:= conflictList;
  sgConflict.RowCount:= fConflictList.Count;
end;

procedure TfrmNagruzkaConflictOnAvtoBuild.sgConflictDrawCell(Sender: TObject;
  ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  tempStr, secTempStr: string;
begin
  if State <> [gdFixed] then
  begin
    sgConflict.Canvas.Font.Color := clWindowText;
    sgConflict.Canvas.Brush.Color := clWindow;
    sgConflict.Canvas.FillRect(Rect);
  end;
  sgConflict.ColWidths[0]:= sgConflict.ClientWidth;
  if fConflictList.Count > 0 then
  begin
    sgConflict.Canvas.Font.Style:= sgConflict.Canvas.Font.Style + [fsBold];
    case ConflictItems[ARow].ItemType of
    cabiAvtoBuild: sgConflict.Canvas.TextOut(Rect.Left + 8, Rect.Top + 4, 'Отсутсвует необходимая схема деления потока:');
    cabiNoCUContingent: sgConflict.Canvas.TextOut(Rect.Left + 8, Rect.Top + 4, 'Не заполнен ожидаемый контингент расчетных единиц:');
    cabiNoGroupContingent: sgConflict.Canvas.TextOut(Rect.Left + 8, Rect.Top + 4, 'Не заполнен ожидаемый контингент специальностей, входящих в поток:');
    end;
    sgConflict.Canvas.Font.Style:= sgConflict.Canvas.Font.Style - [fsBold];
    sgConflict.Canvas.Font.Color:= clMaroon;
    sgConflict.Canvas.TextOut(Rect.Left + 16, Rect.Top + sgConflict.Canvas.TextHeight('И') + 8, 'Поток: ');
    sgConflict.Canvas.TextOut(Rect.Left + 16, Rect.Top + sgConflict.Canvas.TextHeight('И')*2 + 12, 'Ошибка: ');
    sgConflict.Canvas.TextOut(Rect.Left + 16, Rect.Top + sgConflict.Canvas.TextHeight('И')*3 + 16, 'Способ разрешения: ');
    sgConflict.Canvas.Font.Color:= clWindowText;
    sgConflict.Canvas.TextOut(Rect.Left + 16 + Canvas.TextWidth('Поток: '), Rect.Top + sgConflict.Canvas.TextHeight('И') + 8, ConflictItems[ARow].PotokName);
    case ConflictItems[ARow].ItemType of
    cabiAvtoBuild:
      begin
        sgConflict.Canvas.TextOut(Rect.Left + 16 + Canvas.TextWidth('Ошибка: '), Rect.Top + sgConflict.Canvas.TextHeight('И')*2 + 12, 'не создана схема деления потока с типом деления "' + ConflictItems[ARow].ShemaTypeName + '".');
        sgConflict.Canvas.TextOut(Rect.Left + 16 + Canvas.TextWidth('Способ разрешения: '), Rect.Top + sgConflict.Canvas.TextHeight('И')*3 + 16, 'создайте данную схему деления для указанного потока.');
      end;
    cabiNoCUContingent:
      begin
        sgConflict.Canvas.TextOut(Rect.Left + 16 + Canvas.TextWidth('Ошибка: '), Rect.Top + sgConflict.Canvas.TextHeight('И')*2 + 12, 'не заполнен ожидаемый контингент расчетных единиц схемы деления "' + ConflictItems[ARow].ShemaTypeName + '".');
        sgConflict.Canvas.TextOut(Rect.Left + 16 + Canvas.TextWidth('Способ разрешения: '), Rect.Top + sgConflict.Canvas.TextHeight('И')*3 + 16, 'заполните ожидаемый контингент расчетных единиц для указанной схемы деления.');
      end;
    cabiNoGroupContingent:
      begin
        sgConflict.Canvas.TextOut(Rect.Left + 16 + Canvas.TextWidth('Ошибка: '), Rect.Top + sgConflict.Canvas.TextHeight('И')*2 + 12, 'не заполнен ожидаемый контингент специальностей, входящих в указанный поток.');
        sgConflict.Canvas.TextOut(Rect.Left + 16 + Canvas.TextWidth('Способ разрешения: '), Rect.Top + sgConflict.Canvas.TextHeight('И')*3 + 16, 'заполните ожидаемый контингент специальностей, входящих в указанный поток.');
      end;
    end;
  end;
end;

end.
