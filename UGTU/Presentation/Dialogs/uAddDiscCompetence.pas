unit uAddDiscCompetence;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, GridsEh, DBGridEh,
  DB, GeneralController, ADODB, ImgList, ComCtrls, ToolWin, uAddDiscStrCompetence;

type
  TfrmAddDiscCompetence = class(TfrmBaseDialog)
    dbgrCompetence: TDBGridEh;
    dsGetCompetence: TDataSource;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    actStrCmptnc: TActionList;
    imgCmptnc: TImageList;
    actEditStrCmptnc: TAction;
    procedure dbgrCompetenceColumns1EditButtonClick(Sender: TObject;
      var Handled: Boolean);
    procedure dbgrCompetenceColumns1UpdateData(Sender: TObject;
      var Text: string; var Value: Variant; var UseText, Handled: Boolean);
  private
    { Private declarations }
    fIDGos: integer;
    fCompetenceList: TStringList;
    fStructCompList: TStringList;
    fShortNames: string;
    fNameDisc: string;
    procedure SetCompetenceList(const Value: TStringList);
    procedure SetStructCompList(const Value: TStringList);
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    { Public declarations }
    destructor Destroy; override;
    procedure Read;
    property IDGos: integer read fIDGos write fIDGos;
    property CompetenceList: TStringList read fCompetenceList write SetCompetenceList;
    property StructCompList: TStringList read fStructCompList write SetStructCompList;
    property ShortNames: string read fShortNames;
    property NameDisc: string read fNameDisc write fNameDisc;
  end;

var
  frmAddDiscCompetence: TfrmAddDiscCompetence;

implementation

{$R *.dfm}


procedure TfrmAddDiscCompetence.dbgrCompetenceColumns1EditButtonClick(
  Sender: TObject; var Handled: Boolean);
begin
  IsModified := true;
end;

procedure TfrmAddDiscCompetence.dbgrCompetenceColumns1UpdateData(
  Sender: TObject; var Text: string; var Value: Variant; var UseText,
  Handled: Boolean);
begin
  IsModified := true;
end;

destructor TfrmAddDiscCompetence.Destroy;
begin
  dsGetCompetence.DataSet.Close;
  dsGetCompetence.DataSet.Free;
  fCompetenceList.Clear;
  fCompetenceList.Free;
  fStructCompList.Clear;
  fStructCompList.Free;
  inherited;
end;

function TfrmAddDiscCompetence.DoApply: boolean;
var sh_cmp1, sh_cmp2: integer;
begin
  fCompetenceList.Clear;
  fStructCompList.Clear;
  fShortNames := '';
  dsGetCompetence.DataSet.First;
  sh_cmp1:=0;
  sh_cmp2:=dsGetCompetence.DataSet.FieldByName('ik_competence').Value;
  while not dsGetCompetence.DataSet.Eof do
  begin
      if dsGetCompetence.DataSet.FieldByName('InDiscStr').AsBoolean then
      begin
         if sh_cmp1<>sh_cmp2 then
         begin
            fCompetenceList.Add(dsGetCompetence.DataSet.FieldByName('ik_competence').AsString);
            if fShortNames<>'' then fShortNames := fShortNames + ',';
            fShortNames := fShortNames + dsGetCompetence.DataSet.FieldByName('short_Name').AsString;
            sh_cmp1:=dsGetCompetence.DataSet.FieldByName('ik_competence').Value;
         end;
         fStructCompList.Add(dsGetCompetence.DataSet.FieldByName('ik_structure_competence').AsString);
      end;
    dsGetCompetence.DataSet.Next;
    sh_cmp2:= dsGetCompetence.DataSet.FieldByName('ik_competence').Value;
  end;
  Result:= true;
  IsModified:= false;
end;

function TfrmAddDiscCompetence.DoCancel: boolean;
begin
case (Application.MessageBox('Сохранить внесенные изменения?','Изменение состава компетенций для дисциплины', MB_YESNOCANCEL)) of
    mrYes:
      begin
        OK;
        Result:= false;
      end;
    mrNo: Result:= true;
    mrCancel: Result:= false;
    else Result:= true;
  end;
end;

procedure TfrmAddDiscCompetence.Read;
begin
  fCompetenceList := TStringList.Create;
  fStructCompList:= TStringList.Create;
  dsGetCompetence.DataSet := TGeneralController.Instance.GetNewADODataSet(true);
  (dsGetCompetence.DataSet as TADODataSet).CommandText := 'select * from GetFgosCompetencesForDisc2('
   +IntToStr(IK)+','+IntToStr(fIDGos)+') order by short_Name, name_level_competence';
  (dsGetCompetence.DataSet as TADODataSet).Open;

  if fStructCompList.Count<>0 then
  begin
    dsGetCompetence.DataSet.First;
    while not dsGetCompetence.DataSet.Eof do
    begin
      dsGetCompetence.DataSet.Edit;
      if fStructCompList.IndexOf(dsGetCompetence.DataSet.FieldByName('ik_structure_competence').AsString)>=0 then
        dsGetCompetence.DataSet.FieldByName('InDiscStr').Value := true;
      dsGetCompetence.DataSet.Next;
    end;
  end;
end;

procedure TfrmAddDiscCompetence.SetCompetenceList(const Value: TStringList);
var i: integer;
begin
  fCompetenceList := TStringList.Create;
  fCompetenceList.Clear;
  for I := 0 to Value.Count - 1 do
    fCompetenceList.Add(Value[i]);
end;

procedure TfrmAddDiscCompetence.SetStructCompList(const Value: TStringList);
var i: integer;
begin
  fStructCompList := TStringList.Create;
  fStructCompList.Clear;
  for I := 0 to Value.Count - 1 do
    fStructCompList.Add(Value[i]);
end;
end.
