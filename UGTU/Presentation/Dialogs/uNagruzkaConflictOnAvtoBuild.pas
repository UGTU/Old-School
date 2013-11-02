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
  sgConflict.DefaultRowHeight:= sgConflict.Canvas.TextHeight('�')*4 + 20;
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
    cabiAvtoBuild: sgConflict.Canvas.TextOut(Rect.Left + 8, Rect.Top + 4, '���������� ����������� ����� ������� ������:');
    cabiNoCUContingent: sgConflict.Canvas.TextOut(Rect.Left + 8, Rect.Top + 4, '�� �������� ��������� ���������� ��������� ������:');
    cabiNoGroupContingent: sgConflict.Canvas.TextOut(Rect.Left + 8, Rect.Top + 4, '�� �������� ��������� ���������� ��������������, �������� � �����:');
    end;
    sgConflict.Canvas.Font.Style:= sgConflict.Canvas.Font.Style - [fsBold];
    sgConflict.Canvas.Font.Color:= clMaroon;
    sgConflict.Canvas.TextOut(Rect.Left + 16, Rect.Top + sgConflict.Canvas.TextHeight('�') + 8, '�����: ');
    sgConflict.Canvas.TextOut(Rect.Left + 16, Rect.Top + sgConflict.Canvas.TextHeight('�')*2 + 12, '������: ');
    sgConflict.Canvas.TextOut(Rect.Left + 16, Rect.Top + sgConflict.Canvas.TextHeight('�')*3 + 16, '������ ����������: ');
    sgConflict.Canvas.Font.Color:= clWindowText;
    sgConflict.Canvas.TextOut(Rect.Left + 16 + Canvas.TextWidth('�����: '), Rect.Top + sgConflict.Canvas.TextHeight('�') + 8, ConflictItems[ARow].PotokName);
    case ConflictItems[ARow].ItemType of
    cabiAvtoBuild:
      begin
        sgConflict.Canvas.TextOut(Rect.Left + 16 + Canvas.TextWidth('������: '), Rect.Top + sgConflict.Canvas.TextHeight('�')*2 + 12, '�� ������� ����� ������� ������ � ����� ������� "' + ConflictItems[ARow].ShemaTypeName + '".');
        sgConflict.Canvas.TextOut(Rect.Left + 16 + Canvas.TextWidth('������ ����������: '), Rect.Top + sgConflict.Canvas.TextHeight('�')*3 + 16, '�������� ������ ����� ������� ��� ���������� ������.');
      end;
    cabiNoCUContingent:
      begin
        sgConflict.Canvas.TextOut(Rect.Left + 16 + Canvas.TextWidth('������: '), Rect.Top + sgConflict.Canvas.TextHeight('�')*2 + 12, '�� �������� ��������� ���������� ��������� ������ ����� ������� "' + ConflictItems[ARow].ShemaTypeName + '".');
        sgConflict.Canvas.TextOut(Rect.Left + 16 + Canvas.TextWidth('������ ����������: '), Rect.Top + sgConflict.Canvas.TextHeight('�')*3 + 16, '��������� ��������� ���������� ��������� ������ ��� ��������� ����� �������.');
      end;
    cabiNoGroupContingent:
      begin
        sgConflict.Canvas.TextOut(Rect.Left + 16 + Canvas.TextWidth('������: '), Rect.Top + sgConflict.Canvas.TextHeight('�')*2 + 12, '�� �������� ��������� ���������� ��������������, �������� � ��������� �����.');
        sgConflict.Canvas.TextOut(Rect.Left + 16 + Canvas.TextWidth('������ ����������: '), Rect.Top + sgConflict.Canvas.TextHeight('�')*3 + 16, '��������� ��������� ���������� ��������������, �������� � ��������� �����.');
      end;
    end;
  end;
end;

end.
