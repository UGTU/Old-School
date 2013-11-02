unit uNagruzkaAddEventLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, GeneralController,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, Grids, SheduleController;

type
  TfrmNagruzkaAddEventLog = class(TfrmBaseDialog)
    Image1: TImage;
    Label1: TLabel;
    dgConflicts: TDrawGrid;
    StaticText2: TStaticText;
    procedure FormCreate(Sender: TObject);
    procedure dgConflictsDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure actOKExecute(Sender: TObject);
  private
    fDrawConflictList: TList;
    function GetDrawConflictList(index: integer): TConflictItem;
    procedure SetDrawConflictList(index: integer; const Value: TConflictItem);
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    procedure PushConflictsInList(conflictList: PList);
    property DrawConflictList[index: integer]: TConflictItem read GetDrawConflictList write SetDrawConflictList;
  end;

var
  frmNagruzkaAddEventLog: TfrmNagruzkaAddEventLog;

implementation

{$R *.dfm}

{ TfrmNagruzkaAddEventLog }

procedure TfrmNagruzkaAddEventLog.actOKExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmNagruzkaAddEventLog.dgConflictsDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  tempStr: string;
begin

  {if dgConflicts.RowCount > 0 then
  begin
    case DrawConflictList[ARow].ConflictType of
    citCaption:
      begin
        dgConflicts.Canvas.Brush.Color:= RGB(240, 232, 174);
        dgConflicts.Canvas.Font.Color:= clBlack;
        dgConflicts.Canvas.Font.Style:= dgConflicts.Canvas.Font.Style + [fsBold];
        dgConflicts.Canvas.FillRect(Rect);
        dgConflicts.Canvas.TextOut(Rect.Left + 2, Rect.Top + 4, DrawConflictList[ARow].CalcUnitName);
      end;
    citTeacher:
      begin      // round((Rect.Right - Rect.Left - dgConflicts.Canvas.TextWidth(tempStr))/2) }
         dgConflicts.ColWidths[0]:= dgConflicts.ClientWidth;
        dgConflicts.Canvas.Font.Style:= dgConflicts.Canvas.Font.Style + [fsBold];
        tempStr:= 'На ' + FormatDateTime('dd.mm.yyyy', DrawConflictList[ARow].PartDate) + ' уже назначена ' + IntToStr(DrawConflictList[ARow].PartNumber) + '-я пара...';
        dgConflicts.Canvas.TextOut(Rect.Left + dgConflicts.Canvas.TextWidth('1. ') + 2, Rect.Top + 4, tempStr);
        dgConflicts.Canvas.Font.Style:= dgConflicts.Canvas.Font.Style - [fsBold];
        tempStr:= 'Преподаватель: ' + DrawConflictList[ARow].TeacherName + ', дисциплина: ' + AnsiLowerCase(DrawConflictList[ARow].DiscName + ' (' + DrawConflictList[ARow].VidZanyatName + ')');
        dgConflicts.Canvas.TextOut(Rect.Left + dgConflicts.Canvas.TextWidth('1. ')*2 + 2, Rect.Top + 8 + dgConflicts.Canvas.TextHeight(tempStr), tempStr);
        tempStr:= 'Расч. единица: ' + DrawConflictList[ARow].CalcUnitName + ', аудитория: ' + DrawConflictList[ARow].AudName;
        dgConflicts.Canvas.TextOut(Rect.Left + dgConflicts.Canvas.TextWidth('1. ')*2 + 2, Rect.Top + 12 + dgConflicts.Canvas.TextHeight(tempStr)*2, tempStr);
 {     end;
    citRoom:
      begin
        dgConflicts.Canvas.Font.Style:= dgConflicts.Canvas.Font.Style + [fsBold];
        tempStr:= 'Аудитория ' + DrawConflictList[ARow].AudName + ' занята на ' + IntToStr(DrawConflictList[ARow].PartNumber) + '-й паре ' + FormatDateTime('dd.mm.yyyy', DrawConflictList[ARow].PartDate) + '...';
        dgConflicts.Canvas.TextOut(Rect.Left + dgConflicts.Canvas.TextWidth('1. ') + 2, Rect.Top + 4, tempStr);
        dgConflicts.Canvas.Font.Style:= dgConflicts.Canvas.Font.Style - [fsBold];
        tempStr:= 'Дисциплина: ' + AnsiLowerCase(DrawConflictList[ARow].DiscName + ' (' + DrawConflictList[ARow].VidZanyatName + ')');
        dgConflicts.Canvas.TextOut(Rect.Left + dgConflicts.Canvas.TextWidth('1. ')*2 + 2, Rect.Top + 8 + dgConflicts.Canvas.TextHeight(tempStr), tempStr);
        tempStr:= 'Расч. единица: ' + DrawConflictList[ARow].CalcUnitName + ', преподаватель: ' + DrawConflictList[ARow].TeacherName;
        dgConflicts.Canvas.TextOut(Rect.Left + dgConflicts.Canvas.TextWidth('1. ')*2 + 2, Rect.Top + 12 + dgConflicts.Canvas.TextHeight(tempStr)*2, tempStr);
      end;
    citCalcUnit:
      begin
        dgConflicts.Canvas.Font.Style:= dgConflicts.Canvas.Font.Style + [fsBold];
        tempStr:= 'У расчетной единицы ' + DrawConflictList[ARow].CalcUnitName + ' уже есть ' + IntToStr(DrawConflictList[ARow].PartNumber) + '-й паре ' + FormatDateTime('dd.mm.yyyy', DrawConflictList[ARow].PartDate) + '...';
        dgConflicts.Canvas.TextOut(Rect.Left + dgConflicts.Canvas.TextWidth('1. ') + 2, Rect.Top + 4, tempStr);
        dgConflicts.Canvas.Font.Style:= dgConflicts.Canvas.Font.Style - [fsBold];
        tempStr:= 'Дисциплина: ' + AnsiLowerCase(DrawConflictList[ARow].DiscName + ' (' + DrawConflictList[ARow].VidZanyatName + ')');
        dgConflicts.Canvas.TextOut(Rect.Left + dgConflicts.Canvas.TextWidth('1. ')*2 + 2, Rect.Top + 8 + dgConflicts.Canvas.TextHeight(tempStr), tempStr);
        tempStr:= 'Преподаватель: ' + DrawConflictList[ARow].TeacherName + ', аудитория: ' + DrawConflictList[ARow].AudName;
        dgConflicts.Canvas.TextOut(Rect.Left + dgConflicts.Canvas.TextWidth('1. ')*2 + 2, Rect.Top + 12 + dgConflicts.Canvas.TextHeight(tempStr)*2, tempStr);
      end;
    end;
  end;    }
end;

function TfrmNagruzkaAddEventLog.DoApply: boolean;
begin
  Result:= true;
end;

function TfrmNagruzkaAddEventLog.DoCancel: boolean;
begin
  Result:= true;
end;

procedure TfrmNagruzkaAddEventLog.FormCreate(Sender: TObject);
begin
  inherited;
  fdrawConflictList:= TList.Create;
  IsModified:= false;
end;

function TfrmNagruzkaAddEventLog.GetDrawConflictList(
  index: integer): TConflictItem;
begin
  if index < fDrawConflictList.Count then
    Result:= fDrawConflictList[index];
end;

procedure TfrmNagruzkaAddEventLog.PushConflictsInList(conflictList: PList);
var
  i: integer;
begin
//  dgConflicts.RowHeights[0]:= 23;
//  fdrawConflictList.Add(TConflictItem.Create(0, Now, 0,0,0, '', '1. Конфликты по занятости преподавателя', '', '', '', citCaption));
  for I := 0 to conflictList^.Count - 1 do
  begin
    fdrawConflictList.Add(conflictList^[i]);
    if i <> 0 then
      dgConflicts.RowCount:= dgConflicts.RowCount + 1;
  end;
end;

procedure TfrmNagruzkaAddEventLog.SetDrawConflictList(index: integer;
  const Value: TConflictItem);
begin
  if index < fDrawConflictList.Count then
    fDrawConflictList[index]:= Value;
end;

end.

