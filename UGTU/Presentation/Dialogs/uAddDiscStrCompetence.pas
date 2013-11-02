unit uAddDiscStrCompetence;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, DB, GridsEh, DBGridEh, ActnList, StdCtrls, Buttons,
  ExtCtrls,uFgosController,GeneralController, ADODB;

type
  TfrmAddDiscStrCompetence = class(TfrmBaseDialog)
    dbgrCompetence: TDBGridEh;
    dsGetStrCompetence: TDataSource;
    procedure dbgrCompetenceColumns1UpdateData(Sender: TObject;
      var Text: string; var Value: Variant; var UseText, Handled: Boolean);
    procedure dbgrCompetenceColumns1EditButtonClick(Sender: TObject;
      var Handled: Boolean);
  private
  fIKCompetence: integer;
  fStructList: TStringList;
  fCompetenceList: TStringList;
  fDescrContent: string;
  frread: boolean;
  procedure LoadStrCompetence();
  procedure SetStructList(const Value: TStringList);
  procedure SetCompetenceList(const Value: TStringList);
    { Private declarations}
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    { Public declarations }
    destructor Destroy; override;
    function Read: boolean;
    property IKCompetence: integer  write fIKCompetence;
    property CompetenceList: TStringList read fCompetenceList write SetCompetenceList;
    property StructList: TStringList read fStructList write SetStructList;
    property DescrContent: string read fDescrContent;
    property rread: boolean read frread;
  end;

var
  frmAddDiscStrCompetence: TfrmAddDiscStrCompetence;

implementation

{$R *.dfm}
procedure TfrmAddDiscStrCompetence.LoadStrCompetence;
var tempDS: TADODataSet;
begin
  fStructList.Clear;
  tempDS := TGeneralController.Instance.GetNewADODataSet(false);
   tempDS.CommandText := 'select S.ik_structure_competence,L.name_level_competence, description_content from '+
  'Structure_competence S, Struct_competence_sv_disc Scsd, Level_competence L'+
  ' where S.ik_level_competence=L.ik_level_competence and S.ik_structure_competence = Scsd.ik_structure_competence '+
                        ' and ik_disc_uch_plan = ' +  IntToStr(IK);
  tempDS.Open;
  tempDS.First;
  while not tempDS.Eof do
   begin
     fStructList.Add(tempDS.FieldByName('ik_structure_competence').AsString);
     tempDS.Next;
   end;
end;


function  TfrmAddDiscStrCompetence.Read: boolean;
begin
fStructList:= TStringList.Create;
LoadStrCompetence();
dsGetStrCompetence.DataSet:= TGeneralController.Instance.GetNewADODataSet(true);
(dsGetStrCompetence.DataSet as TADODataSet).CommandText := 'select * from GetFgosStrCompetencesForDisc('
   +IntToStr(IK)+','+IntToStr(fIKCompetence)+') order by name_level_competence';
dsGetStrCompetence.DataSet.Open;
  if StructList.Count<>0 then
  begin
    dsGetStrCompetence.DataSet.First;
    while not dsGetStrCompetence.DataSet.Eof do
    begin
      dsGetStrCompetence.DataSet.Edit;
      if fStructList.IndexOf(dsGetStrCompetence.DataSet.FieldByName('ik_structure_competence').AsString)>=0 then
        dsGetStrCompetence.DataSet.FieldByName('InDiscStr').Value := true;
      dsGetStrCompetence.DataSet.Next;
    end;
  end;

end;

procedure TfrmAddDiscStrCompetence.SetStructList(const Value: TStringList);
var i: integer;
begin
  fStructList := TStringList.Create;
  fStructList.Clear;
  for I := 0 to Value.Count - 1 do
    fStructList.Add(Value[i]);
end;


procedure TfrmAddDiscStrCompetence.SetCompetenceList(const Value: TStringList);
var i: integer;
begin
  fCompetenceList := TStringList.Create;
  fCompetenceList.Clear;
  for I := 0 to Value.Count - 1 do
    fCompetenceList.Add(Value[i]);
end;

function TfrmAddDiscStrCompetence.DoApply: boolean;
var
tempDS: TADODataSet;
I: integer;
begin
  tempDS:= TGeneralController.Instance.GetNewADODataSet(true);
  fStructList.Clear;
  dsGetStrCompetence.DataSet.Open;
  dsGetStrCompetence.DataSet.First;
  while not dsGetStrCompetence.DataSet.Eof do
  begin
    if dsGetStrCompetence.DataSet.FieldByName('InDiscStr').AsBoolean then
       fStructList.Add(dsGetStrCompetence.DataSet.FieldByName('ik_structure_competence').AsString);
    dsGetStrCompetence.DataSet.Next;
  end;
  Result:= true;
  IsModified:= false;
  StructList.Count;
end;

function TfrmAddDiscStrCompetence.DoCancel: boolean;
begin
case (Application.MessageBox('Сохранить внесенные изменения?','Изменение состава структуры компетенции для дисциплины', MB_YESNOCANCEL)) of
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

procedure TfrmAddDiscStrCompetence.dbgrCompetenceColumns1EditButtonClick(
  Sender: TObject; var Handled: Boolean);
begin
  IsModified := true;
end;

procedure TfrmAddDiscStrCompetence.dbgrCompetenceColumns1UpdateData(
  Sender: TObject; var Text: string; var Value: Variant; var UseText,
  Handled: Boolean);
begin
  IsModified := true;
end;

destructor TfrmAddDiscStrCompetence.Destroy;
begin
  dsGetStrCompetence.DataSet.Close;
  dsGetStrCompetence.DataSet.Free;
  fStructList.Clear;
  fStructList.Free;
end;

end.
