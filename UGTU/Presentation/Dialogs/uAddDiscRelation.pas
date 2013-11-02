unit uAddDiscRelation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, DB, GridsEh, DBGridEh, ActnList, StdCtrls, Buttons,
   GeneralController, ExtCtrls, ADODB;

type
  TfrmAddDiscRelation = class(TfrmBaseDialog)
    dbgrDiscRelation: TDBGridEh;
    dsGetDiscRelation: TDataSource;
    procedure dbgrDiscRelationColumns1UpdateData(Sender: TObject;
      var Text: string; var Value: Variant; var UseText, Handled: Boolean);
  private
    fIDGos:integer;
    fikUchPlan: integer;
    fik_disc_main: integer;
    fDiscRelationList: TStringList;
    procedure SetDiscRelationList(const Value: TStringList);
    { Private declarations }
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    destructor Destroy; override;
    procedure Read;
    property IDGos: integer read fIDGos write fIDGos;
    property ikUchPlan: integer read fikUchPlan write fikUchPlan;
    property ik_disc_main: integer read fik_disc_main write fik_disc_main;
    property DiscRelationList: TStringList read fDiscRelationList write SetDiscRelationList;
  end;

var
  frmAddDiscRelation: TfrmAddDiscRelation;

implementation

{$R *.dfm}
 procedure TfrmAddDiscRelation.dbgrDiscRelationColumns1UpdateData(
  Sender: TObject; var Text: string; var Value: Variant; var UseText,
  Handled: Boolean);
begin
 IsModified := true;
end;

destructor TfrmAddDiscRelation.Destroy;
begin
  fDiscRelationList.Free;
  dsGetDiscRelation.DataSet.Close;
  dsGetDiscRelation.DataSet.Free;
  inherited;
end;

function TfrmAddDiscRelation.DoCancel: boolean;
begin
case (Application.MessageBox('Сохранить внесенные изменения?','Изменение перечня дисциплин, на которые опирается расссматриваемая', MB_YESNOCANCEL)) of
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

procedure TfrmAddDiscRelation.Read;
begin
  fDiscRelationList:= TStringList.Create;
  dsGetDiscRelation.DataSet := TGeneralController.Instance.GetNewADODataSet(true);
  (dsGetDiscRelation.DataSet as TADODataSet).CommandText := 'select * from GetRelationDisc('
   +IntToStr(fik_disc_main)+','+IntToStr(fIDGos)+','+IntToStr(ikUchPlan)+') order by cName_disc';
  (dsGetDiscRelation.DataSet as TADODataSet).Open;

  if fDiscRelationList.Count<>0 then
  begin
    dsGetDiscRelation.DataSet.First;
    while not dsGetDiscRelation.DataSet.Eof do
    begin
      dsGetDiscRelation.DataSet.Edit;
      if fDiscRelationList.IndexOf(dsGetDiscRelation.DataSet.FieldByName('base_for_ik').AsString)>=0 then
        dsGetDiscRelation.DataSet.FieldByName('InDiscRel').Value := true;
      dsGetDiscRelation.DataSet.Next;
    end;
  end;
end;

function TfrmAddDiscRelation.DoApply: boolean;
begin
  fDiscRelationList.Clear;
  dsGetDiscRelation.DataSet.First;

  while not dsGetDiscRelation.DataSet.Eof do
  begin
      if dsGetDiscRelation.DataSet.FieldByName('InDiscRel').AsBoolean then
        fDiscRelationList.Add(dsGetDiscRelation.DataSet.FieldByName('base_for_ik').AsString);
      dsGetDiscRelation.DataSet.Next;
  end;
  Result:= true;
  IsModified:= false;
end;

procedure TfrmAddDiscRelation.SetDiscRelationList(const Value: TStringList);
var i: integer;
begin
  fDiscRelationList := TStringList.Create;
  fDiscRelationList.Clear;
  for I := 0 to Value.Count - 1 do
    fDiscRelationList.Add(Value[i]);
end;

end.
