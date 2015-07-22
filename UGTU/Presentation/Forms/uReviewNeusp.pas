unit uReviewNeusp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uReviewDoc, System.Actions,
  Vcl.ActnList, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh,
  DBAxisGridsEh, DBGridEh, uDMDocuments;

type
  TfrmReviewNeusp = class(TfrmReviewDoc)
    DBGridEh1: TDBGridEh;
    DateTimePicker1: TDateTimePicker;
    Label6: TLabel;
    mNamePric: TMemo;
    Label7: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DrawGridCheckBox(Canvas: TCanvas; Rect: TRect; Checked: boolean);
    procedure DBGridEh1ColEnter(Sender: TObject);
  private
    { Private declarations }
    fCompetenceList: TStringList;

    procedure SetCompetenceList(const Value: TStringList);

  public
    Procedure AfterConstruction; Override;
    property CompetenceList: TStringList read fCompetenceList
      write SetCompetenceList;

    { Public declarations }
  end;

var
  frmReviewNeusp: TfrmReviewNeusp;

implementation

{$R *.dfm}

uses uStudent;

procedure TfrmReviewNeusp.AfterConstruction;
begin
  inherited;
  uDMDocuments.dmDocs.adodsNeusp.Active := false;
  dmDocs.adodsNeusp.Filter := 'ik_StudGrup =' + ik_stud.ToString();
  dmDocs.adodsNeusp.Filtered := true;

  uDMDocuments.dmDocs.adodsNeusp.Active := true; // подключам базу

end;

procedure TfrmReviewNeusp.DBGridEh1ColEnter(Sender: TObject);
begin
  inherited;
  // with  DBGridEh1 do
  // if UpperCase(SelectedField.FieldName) = 'fl' then // Модифицируйте под себя
  // Options := Options - [dgEditing]
  // else
  // Options := Options + [dgEditing]
end;

procedure TfrmReviewNeusp.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
// begin
// if UpperCase(Column.FieldName) = 'fl' then // Модифицируйте под себя
// if Column.Field.AsInteger = 1 then
// DrawGridCheckBox((DBGridEh1).Canvas, Rect, true)
// else
// DrawGridCheckBox((DBGridEh1).Canvas, Rect, false)
Var
  Style: Integer;
Begin
  // IF Column.FieldName = 'flag'
  // Then
  // begin
  // IF Column.Field.AsBoolean
  // Then Style := DFCS_CHECKED
  // Else Style := DFCS_BUTTONCHECK;
  // DrawFrameControl(TDBGridEh(Sender).Canvas.Handle, Rect, DFC_BUTTON, Style);
  // end;
End;

procedure TfrmReviewNeusp.DrawGridCheckBox(Canvas: TCanvas; Rect: TRect;
  Checked: boolean);
var
  DrawFlags: Integer;
begin
  // Canvas.TextRect(Rect, Rect.Left + 1, Rect.Top + 1, ' ');
  // DrawFrameControl(Canvas.Handle, Rect, DFC_BUTTON, DFCS_BUTTONPUSH or DFCS_ADJUSTRECT);
  // DrawFlags := DFCS_BUTTONCHECK or DFCS_ADJUSTRECT;// DFCS_BUTTONCHECK
  // if Checked then
  // DrawFlags := DrawFlags or DFCS_CHECKED;
  // DrawFrameControl(Canvas.Handle, Rect, DFC_BUTTON, DrawFlags);

end;

procedure TfrmReviewNeusp.FormActivate(Sender: TObject);
begin
  inherited;
  mNamePric.Text :=
    'Согласно разделу 3 (п. 3.1) Положения о порядке зачисления студентов, утвержденного ректором 01.09.2014, студент подлежит отчислению'
end;

procedure TfrmReviewNeusp.SetCompetenceList(const Value: TStringList);
var
  i: Integer;
begin
  fCompetenceList := TStringList.Create;
  fCompetenceList.Clear;
  for i := 0 to Value.Count - 1 do
    fCompetenceList.Add(Value[i]);
end;

end.
