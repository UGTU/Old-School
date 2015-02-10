unit uPerevStud;

{ #Author sergdev@ist.ugtu.net }
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, DBGridEh,
  DBCtrlsEh, Mask, DBLookupEh, DBTVStudobj, System.Actions;

type
  TfrmPerevStud = class(TfrmBaseDialog)
    Label2: TLabel;
    Label57: TLabel;
    dbcbeNumPrik: TDBLookupComboboxEh;
    Label1: TLabel;
    Label5: TLabel;
    dbcbeCauseFrom: TDBLookupComboboxEh;
    Label4: TLabel;
    dbcbeSpec: TDBLookupComboboxEh;
    Label12: TLabel;
    Label13: TLabel;
    dbcbeGroup: TDBLookupComboboxEh;
    Label14: TLabel;
    Label15: TLabel;
    dbcbeFac: TDBLookupComboboxEh;
    Label16: TLabel;
    Label17: TLabel;
    Label3: TLabel;
    dbcbeCauseto: TDBLookupComboboxEh;
    Label6: TLabel;
    Label7: TLabel;
    eOtchObosn: TMemo;
    eZachObosn: TMemo;
    Label8: TLabel;
    SpeedButton2: TSpeedButton;
    procedure dbcbeFacChange(Sender: TObject);
    procedure dbcbeSpecChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbcbeCauseFromChange(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure dbcbeGroupChange(Sender: TObject);
    procedure eOtchObosnEnter(Sender: TObject);
    procedure eZachObosnEnter(Sender: TObject);
    procedure eOtchObosnExit(Sender: TObject);
    procedure eZachObosnExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    student: TDBNodeStudObject;
    { Public declarations }
  end;

var
  frmPerevStud: TfrmPerevStud;

implementation

uses uDm, uOtchislStud, uDMStudentActions, uDMCauses, uDMUgtuStructure,
  uDMPrikaz, uMain;

{$R *.dfm}

function CheckFields: boolean;
begin
  result := true;
  with frmPerevStud do
  begin
    if (dbcbeNumPrik.Text = '') or (dbcbeCauseFrom.Text = '') or
      (dbcbeCauseto.Text = '') or (dbcbeFac.Text = '') or (dbcbeSpec.Text = '')
      or (dbcbeGroup.Text = '') then
      result := false
  end;
end;

procedure TfrmPerevStud.dbcbeFacChange(Sender: TObject);
begin
  dmUgtuStructure.adodsSpec.Active := false;
  dmUgtuStructure.adodsGroups.Active := false;
  if dbcbeFac.KeyValue <> NULL then
  begin
    dmUgtuStructure.adodsSpec.CommandText :=
      'select * from Tree_specialties where Ik_fac=''' +
      string(dbcbeFac.KeyValue) + '''';
    dmUgtuStructure.adodsSpec.Active := true;
    dmUgtuStructure.adodsSpec.Sort := 'CName_spec';
  end;
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

procedure TfrmPerevStud.dbcbeSpecChange(Sender: TObject);
begin
  dmUgtuStructure.adodsGroups.Active := false;
  if dbcbeSpec.KeyValue <> NULL then
  begin
    dmUgtuStructure.adodsGroups.CommandText :=
      'select * from Tree_groups where Ik_spec_fac=''' +
      string(dbcbeSpec.KeyValue) + '''';
    dmUgtuStructure.adodsGroups.Active := true;
    dmUgtuStructure.adodsGroups.Sort := 'CName_grup';
  end;
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

procedure TfrmPerevStud.FormShow(Sender: TObject);
begin
  dmCauses.adodsMoveFromCause.Active := true;
  dmCauses.adodsMoveToCause.Active := true;
  dmUgtuStructure.adodsFaculty.Active := true;
  dmUgtuStructure.adodsFaculty.Sort := 'CName_fac';
  dmPrikaz.adodsPrikaz.Active := false;
  dmPrikaz.adodsPrikaz.Active := true;
end;

procedure TfrmPerevStud.SpeedButton2Click(Sender: TObject);
begin
  frmMain.actAddPrikaz.Execute;
end;

procedure TfrmPerevStud.dbcbeCauseFromChange(Sender: TObject);
begin
  dbcbeCauseto.KeyValue := dbcbeCauseFrom.KeyValue - 1;
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

procedure TfrmPerevStud.actApplyExecute(Sender: TObject);
begin
  dmStudentActions.aspAppendStudGroup.Active := false;
  with dmStudentActions.aspAppendStudGroup.Parameters do
  begin
    items[1].Value := 2;
    items[2].Value := dbcbeGroup.KeyValue;
    items[3].Value := student.RecordbookKey;
    items[4].Value := student.CategoryID;
    items[5].Value := dbcbeNumPrik.KeyValue;
    items[6].Value := dbcbeCauseto.KeyValue;
    items[7].Value := dbcbeNumPrik.KeyValue;
    items[8].Value := dbcbeCauseFrom.KeyValue;
    items[9].Value := eZachObosn.Text;
    items[10].Value := eOtchObosn.Text;
  end;

  dmStudentActions.aspAppendStudGroup.ExecProc;
end;

procedure TfrmPerevStud.actOKExecute(Sender: TObject);
begin
  actApplyExecute(Sender);
  close;
end;

procedure TfrmPerevStud.dbcbeGroupChange(Sender: TObject);
begin
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

procedure TfrmPerevStud.eOtchObosnEnter(Sender: TObject);
begin
  eOtchObosn.BevelKind := bksoft;

end;

procedure TfrmPerevStud.eZachObosnEnter(Sender: TObject);
begin
  eZachObosn.BevelKind := bksoft;
end;

procedure TfrmPerevStud.eOtchObosnExit(Sender: TObject);
begin
  eOtchObosn.BevelKind := bknone;
end;

procedure TfrmPerevStud.eZachObosnExit(Sender: TObject);
begin

  eZachObosn.BevelKind := bknone;
end;

end.
