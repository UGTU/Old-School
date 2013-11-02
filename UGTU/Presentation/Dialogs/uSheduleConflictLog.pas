unit uSheduleConflictLog;
   {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, GeneralController, SheduleClasses,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, Grids, SheduleController,
  Menus;

type
  TfrmConflictEventLog = class(TfrmBaseDialog)
    Image1: TImage;
    Label1: TLabel;
    dgConflicts: TDrawGrid;
    StaticText2: TStaticText;
    PopupMenu1: TPopupMenu;
    actEditObject: TAction;
    actShowDates: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure dgConflictsDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure actOKExecute(Sender: TObject);
  private
    fDrawConflictList: TSheduleItemList;
    procedure setDrawConflictList(const Value: TSheduleItemList);
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    property DrawConflictList: TSheduleItemList read fDrawConflictList write setDrawConflictList;
  end;

var
  frmConflictEventLog: TfrmConflictEventLog;

implementation

{$R *.dfm}

{ TfrmNagruzkaAddEventLog }

procedure TfrmConflictEventLog.actOKExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmConflictEventLog.dgConflictsDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  tempStr: string;
begin
  if State <> [gdFixed] then
  begin
    dgConflicts.Canvas.Font.Color := clWindowText;
    dgConflicts.Canvas.Brush.Color := clWindow;
    dgConflicts.Canvas.FillRect(Rect);
  end;
  dgConflicts.ColWidths[0]:= dgConflicts.ClientWidth;
  dgConflicts.Canvas.Font.Style:= dgConflicts.Canvas.Font.Style + [fsBold];
  tempStr:= DrawConflictList[ARow].TeacherName + ', ' + DrawConflictList[ARow].DiscName + ' (' + DrawConflictList[ARow].VidZanyatName + ')';
  dgConflicts.Canvas.TextOut(Rect.Left + dgConflicts.Canvas.TextWidth('1.'), Rect.Top + 5, tempStr);
  dgConflicts.Canvas.Font.Style:= dgConflicts.Canvas.Font.Style - [fsBold];
  tempStr:= '��� ��������: ' + DrawConflictList[ARow].VidNagruzkiName + ', ��������� �������: ' + DrawConflictList[ARow].CalcUnitName + ', ���������: ' + DrawConflictList[ARow].FullRoomName;
  dgConflicts.Canvas.TextOut(Rect.Left + dgConflicts.Canvas.TextWidth('1. ')*2, Rect.Top + 9 + dgConflicts.Canvas.TextHeight(tempStr), tempStr);
  if DrawConflictList[ARow] is TSheduleEvent then
  begin
    tempStr:= '������ ����������: ';
    case (DrawConflictList[ARow] as TSheduleEvent).RepeatPattern.RepeatType of
    1: tempStr:= tempStr + '��������� � ' + FormatDateTime('hh:mm', (DrawConflictList[ARow] as TSheduleEvent).Start) + ' - ' + FormatDateTime('hh:mm', (DrawConflictList[ARow] as TSheduleEvent).Stop) + ' ������� � ' + FormatDateTime('dd.mm.yyyy', (DrawConflictList[ARow] as TSheduleEvent).BeginDate) + ' ������ ' + IntToStr((DrawConflictList[ARow] as TSheduleEvent).RepeatPattern.RepeatFrequency) + '-� ����';
    2:
      begin
        case (DrawConflictList[ARow] as TSheduleEvent).RepeatPattern.RepeatLimitType of
        1: tempStr:= tempStr + '��������� � ' + FormatDateTime('hh:mm', (DrawConflictList[ARow] as TSheduleEvent).Start) + ' - ' + FormatDateTime('hh:mm', (DrawConflictList[ARow] as TSheduleEvent).Stop) + ' ������� � ' + FormatDateTime('dd.mm.yyyy', (DrawConflictList[ARow] as TSheduleEvent).BeginDate) + ' ������ ' + IntToStr((DrawConflictList[ARow] as TSheduleEvent).RepeatPattern.RepeatFrequency) + '-� ������ � ��������� ���: ';
        2: tempStr:= tempStr + '��������� ' + IntToStr((DrawConflictList[ARow] as TSheduleEvent).RepeatPattern.RepeatCount) + ' ���(�) � ' + FormatDateTime('hh:mm', (DrawConflictList[ARow] as TSheduleEvent).Start) + ' - ' + FormatDateTime('hh:mm', (DrawConflictList[ARow] as TSheduleEvent).Stop) + ' ������� � ' + FormatDateTime('dd.mm.yyyy', (DrawConflictList[ARow] as TSheduleEvent).BeginDate) + ' ������ ' + IntToStr((DrawConflictList[ARow] as TSheduleEvent).RepeatPattern.RepeatFrequency) + '-� ������ � ��������� ���: ';
        3: tempStr:= tempStr + '��������� � ' + FormatDateTime('hh:mm', (DrawConflictList[ARow] as TSheduleEvent).Start) + ' - ' + FormatDateTime('hh:mm', (DrawConflictList[ARow] as TSheduleEvent).Stop) + ' � ' + FormatDateTime('dd.mm.yyyy', (DrawConflictList[ARow] as TSheduleEvent).BeginDate) + ' �� ' + FormatDateTime('dd.mm.yyyy', (DrawConflictList[ARow] as TSheduleEvent).RepeatPattern.EndDateOfRepeat) + ' ������ ' + IntToStr((DrawConflictList[ARow] as TSheduleEvent).RepeatPattern.RepeatFrequency) + '-� ������ � ��������� ���: ';
        end;
        if (DrawConflictList[ARow] as TSheduleEvent).RepeatPattern.RepeatMask[1] = '2' then tempStr:= tempStr + '���., ';
        if (DrawConflictList[ARow] as TSheduleEvent).RepeatPattern.RepeatMask[2] = '3' then tempStr:= tempStr + '��., ';
        if (DrawConflictList[ARow] as TSheduleEvent).RepeatPattern.RepeatMask[3] = '4' then tempStr:= tempStr + '��., ';
        if (DrawConflictList[ARow] as TSheduleEvent).RepeatPattern.RepeatMask[4] = '5' then tempStr:= tempStr + '����., ';
        if (DrawConflictList[ARow] as TSheduleEvent).RepeatPattern.RepeatMask[5] = '6' then tempStr:= tempStr + '���., ';
        if (DrawConflictList[ARow] as TSheduleEvent).RepeatPattern.RepeatMask[6] = '7' then tempStr:= tempStr + '���., ';
        Delete(tempStr, Length(tempStr)-1, 2);
      end;
    3: tempStr:= '<�� ���������>';
    end;
  end
  else tempStr:= '���� ����������: ' + FormatDateTime('dd.mm.yyyy �.', (DrawConflictList[ARow] as TSheduleExamination).ExamDate) + ', ����� ����������: ' + FormatDateTime('hh:nn', DrawConflictList[ARow].Start) + ' - ' + FormatDateTime('hh:nn', DrawConflictList[ARow].Stop);
  dgConflicts.Canvas.TextOut(Rect.Left + dgConflicts.Canvas.TextWidth('1. ')*2, Rect.Top + 13 + dgConflicts.Canvas.TextHeight(tempStr)*2, tempStr);
end;

function TfrmConflictEventLog.DoApply: boolean;
begin
  Result:= true;
end;

function TfrmConflictEventLog.DoCancel: boolean;
begin
  Result:= true;
end;

procedure TfrmConflictEventLog.FormCreate(Sender: TObject);
begin
  inherited;
  IsModified:= false;
end;

procedure TfrmConflictEventLog.setDrawConflictList(
  const Value: TSheduleItemList);
begin
  fDrawConflictList := Value;
  if fDrawConflictList.Count > 0 then
    dgConflicts.RowCount:= fDrawConflictList.Count
  else dgConflicts.RowCount:= 1;
end;

end.

