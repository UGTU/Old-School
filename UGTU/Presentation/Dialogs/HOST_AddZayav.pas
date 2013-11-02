unit HOST_AddZayav;
  {#Author llodigina@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, DBGridEh, Mask,
  DBCtrlsEh, DBLookupEh,DBTVInviteHostObj;

type
  TAddZayav = class(TfrmBaseDialog)
    GroupBox1: TGroupBox;
    RBtStudent: TRadioButton;
    RBtSotrudn: TRadioButton;
    Panel2: TPanel;
    Label1: TLabel;
    ComBFac: TDBLookupComboboxEh;
    Label2: TLabel;
    ComBSpec: TDBLookupComboboxEh;
    Label3: TLabel;
    ComBGrup: TDBLookupComboboxEh;
    Label4: TLabel;
    ComBFIO: TDBLookupComboboxEh;
    procedure ComBFacChange(Sender: TObject);
    procedure ComBSpecChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComBGrupChange(Sender: TObject);
    procedure RBtStudentClick(Sender: TObject);
    procedure RBtSotrudnClick(Sender: TObject);
  private
    Fik:TDBNodeInviteHostObject;
    FNumHost:integer;
    function DoApply:boolean; override;
    { Private declarations }
  public
    { Public declarations }
    property NumHost:integer read FNumHost write FNumHost;
    property ik:TDBNodeInviteHostObject read Fik write Fik;


  end;

var
  AddZayav: TAddZayav;

implementation

uses uDMUgtuStructure,HOST_ZayavlenieController,uHOST,HOST_ProjivayushieController,
DateUtils,DBTVObj,HOST_ReportController;

{$R *.dfm}


procedure TAddZayav.ComBFacChange(Sender: TObject);
begin
  inherited;
 dmUgtuStructure.adodsSpec.Active:=false;
 dmUgtuStructure.adodsGroups.Active:=false;
 dmHOST.ProcVivodPersonFormGroup.Active:=false;
 if ComBFac.KeyValue<>NULL then begin
 dmUgtuStructure.adodsSpec.CommandText:='select * from Tree_specialties where Ik_fac='''+string(ComBFac.KeyValue)+'''';
 dmUgtuStructure.adodsSpec.Active:=true;
end;
end;

procedure TAddZayav.ComBGrupChange(Sender: TObject);
var IkGrup:integer;
begin
  inherited;
  dmHOST.ProcVivodPersonFormGroup.Active:=false;
    if ComBGrup.KeyValue<>NULL then
    begin
      IkGrup:=ComBGrup.KeyValue;
      THOST_ProjivayushieController.Instance.VivodPerson(IkGrup);
      dmHOST.ProcVivodPersonFormGroup.Active:=true;
    end;
    IsModified:= true;
end;

procedure TAddZayav.ComBSpecChange(Sender: TObject);
begin
  inherited;
  dmUgtuStructure.adodsGroups.Active:=false;
  dmHOST.ProcVivodPersonFormGroup.Active:=false;
  if ComBSpec.KeyValue<>NULL then
  begin
    dmUgtuStructure.adodsGroups.CommandText:='select * from Tree_groups where Ik_spec_fac='''+string(ComBSpec.KeyValue)+'''';
    dmUgtuStructure.adodsGroups.Active:=true;
 end;
end;

function TAddZayav.DoApply: boolean;
var Data:TDateTime;
    nCode:integer;
begin
    Data:= Today;
    nCode:=ComBFIO.KeyValue;
       try
          THOST_ZayavlenieController.Instance.AddZayavNaZas(Data,nCode,NumHost);
          THOST_ReportController.Instance.PrintZayavNaZas(nCode);
       finally
          dmHOST.vVkSpisokZayav.Active:=false;
          dmHOST.vVkSpisokZayav.Active:=true;
       end;

end;

procedure TAddZayav.FormShow(Sender: TObject);
begin
  inherited;
  ComBFac.Clear;
  ComBSpec.Clear;
  ComBGrup.Clear;
  ComBFIO.Clear;
  dmUgtuStructure.adodsFaculty.Active:=false;
end;

procedure TAddZayav.RBtSotrudnClick(Sender: TObject);
begin
  inherited;
  dmUgtuStructure.adodsFaculty.Active:=false;
  dmUgtuStructure.adodsSpec.Active:=false;
  dmUgtuStructure.adodsGroups.Active:=false;
  dmHOST.ProcVivodPersonFormGroup.Active:=false;
end;

procedure TAddZayav.RBtStudentClick(Sender: TObject);
begin
  inherited;
  dmUgtuStructure.adodsFaculty.Active:=true;
end;

end.
