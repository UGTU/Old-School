unit uNaprClose;

{ #Author sergdev@ist.ugtu.net }
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, DBGridEh, DBCtrlsEh, StdCtrls, Mask, DBLookupEh,
  ActnList, Buttons, ExtCtrls, ApplicationController, comObj, ExceptionBase,
  ADODB,
  System.Actions, Data.DB;

type
  TftmNaprclose = class(TfrmBaseDialog)
    Label1: TLabel;
    dbcbeNapr: TDBLookupComboboxEh;
    dbcbeMark: TDBLookupComboboxEh;
    Label2: TLabel;
    Label3: TLabel;
    dbdteExam: TDBDateTimeEditEh;
    dbcbeEx: TDBLookupComboboxEh;
    Label4: TLabel;
    Label13: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    eTema: TDBEditEh;
    dsNapr: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure dbcbeNaprChange(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
  private
    FVedIK: integer;
    FStudGrupIK: integer;
    FIsClosed: boolean;
    FMark: integer;
    FKPTema: string;
    FTeacher: string;
    procedure SetStudGrupIK(const Value: integer);
    procedure SetVed(const Value: integer);
  public
    property StudGrupIK: integer write SetStudGrupIK;
    property VedIK: integer write SetVed;
    property IsClosed: boolean write FIsClosed;
    property Mark: integer write FMark;
    property Teacher: string write FTeacher;
    property KPTema: string write FKPTema;
  end;

var
  ftmNaprclose: TftmNaprclose;

implementation

uses uDm, uDMUspevaemost, uUspevGroupController,ConstantRepository;
{$R *.dfm}

function ChangeMonthDayPlaces(date: TDateTime): string;
var
  s1: string;
begin
  result := DatetoStr(date);
  s1 := result;
  result[1] := s1[4];
  result[2] := s1[5];
  result[4] := s1[1];
  result[5] := s1[2];
end;

function CheckFields: boolean;
begin
  result := true;
  with ftmNaprclose do
  begin
    if (dbcbeNapr.Text = '') or (dbcbeMark.Text = '') or (dbcbeEx.Text = '') or
      (dbdteExam.Text = '') then
      result := false
  end;
end;

procedure TftmNaprclose.FormShow(Sender: TObject);
begin
  dsNapr.DataSet := TUspevGroupController.Instance.GetNapravDS;
  if FVedIK<>0 then dbcbeNapr.KeyValue := FVedIK;  //если во фрейм было передано конкретное направление

  try
    dmUspevaemost.adodsmark.Active := true;
    dbdteExam.Value := date;
    dbcbeMark.KeyValue := FMark;

  except
    on E: EOleException do
    begin
      raise EApplicationException.Create
        ('Невозможно загрузить список оценок.',
        EOleException.Create(E.Message, E.ErrorCode, '', '', 0));
    end;
  end;
  try
    dmUspevaemost.adospPrepodVed.Active := false;
    dmUspevaemost.adospPrepodVed.Active := true;
    if FTeacher<>'' then dbcbeEx.KeyValue := FTeacher;  //если уже был установлен преподаватель
  except
    on E: EOleException do
    begin
      raise EApplicationException.Create
        ('Невозможно загрузить список преподавателей.',
        EOleException.Create(E.Message, E.ErrorCode, '', '', 0));
    end;
  end;
  eTema.Text := FKPTema;
end;

procedure TftmNaprclose.SetStudGrupIK(const Value: integer);
begin
  TUspevGroupController.Instance.SelectOpenedNapr(Value);
end;

procedure TftmNaprclose.SetVed(const Value: integer);
begin
  FVedIK := Value;
  dbcbeNapr.KeyValue := FVedIK;
  dbcbeNapr.Enabled := false;
end;

procedure TftmNaprclose.dbcbeNaprChange(Sender: TObject);
begin
  FVedIK := IfNull(dbcbeNapr.KeyValue,0);
  if CheckFields then
  begin
    bbOk.Enabled := true;
    bbApply.Enabled := true;
  end
  else
  begin
    bbOk.Enabled := false;
    bbApply.Enabled := false;
  end;

end;

procedure TftmNaprclose.actApplyExecute(Sender: TObject);
begin

  if FIsClosed then
    if not TUspevGroupController.Instance.OpenVed(FVedIK) then
    begin
      MessageBox(Handle, 'При открытии ведомости произошла ошибка.',
        'ИС УГТУ', MB_OK);
      Exit;
  end;

  TUspevGroupController.Instance.CloseNapr(FVedIK, dbcbeMark.KeyValue,
  dbcbeEx.KeyValue, eTema.Text, dbdteExam.Value);

end;

procedure TftmNaprclose.actOKExecute(Sender: TObject);
begin
  actApplyExecute(Sender);
  close;
end;

End.
