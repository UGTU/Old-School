unit ABIT_add_nabor_dialog;
 {#Author tanyav@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, DBCtrlsEh, StdCtrls, Mask, ActnList, Buttons,
  ExtCtrls, Menus, DBCtrls, DB, DBGridEh, DBLookupEh, System.Actions;

type
  TfrmNewNabor = class(TfrmBaseDialog)
    Label2: TLabel;
    Label1: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label15: TLabel;
    Label10: TLabel;
    Label110: TLabel;
    Label17: TLabel;
    dbcmbxFac: TDBLookupComboboxEh;
    Spec_Fac: TDBLookupComboboxEh;
    nnyear: TDBLookupComboboxEh;
    cbRussian: TCheckBox;
    Label5: TLabel;
    mestBudjet: TDBNumberEditEh;
    mestCKP: TDBNumberEditEh;
    Label3: TLabel;
    MestLgot: TDBNumberEditEh;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    dbcmbxPrifile: TDBLookupComboboxEh;
    function AddData():boolean;
    function EditData():boolean;
    procedure NullData();
    procedure nnyearChange(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure actApplyUpdate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure dbcmbxFacChange(Sender: TObject);
    procedure dbcmbxPrifileChange(Sender: TObject);
    procedure Spec_FacChange(Sender: TObject);
  private
    FYear: integer;
    FikSpecfac: integer;
    FikFac: integer;
    FikProfile: variant;
    procedure SetYear(const Value: Integer);
    procedure SetComboBoxEnable;
    { Private declarations }
  protected
    function CheckData:boolean;
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    nnrecord:integer;
    // Текущий год набора
    property year:Integer read FYear write SetYear;
    // Текущий код специальности набора
    property ikSpecfac:Integer read FikSpecfac write FikSpecfac;
    // Текущий код профиля набора
    property ikProfile: variant read FikProfile write FikProfile;
    // Текущий код факультета набора
    property ikfac:Integer read FikFac write FikFac;

    procedure Setikfac(const Value: Integer);
    procedure sets();
    { Public declarations }
  end;

var
    frmNewNabor: TfrmNewNabor;
    type_dialog:integer;
    NNrecord:integer;
implementation

uses AbiturientBaseProcs, AbiturientNaborProcs, AbiturientFacade,
  AbiturientAbitProcs, uBaseFrame, uDM,
  uDMUgtuStructure, uAbitNaborController, uDMAbiturientNabor;

{$R *.dfm}

procedure TfrmNewNabor.sets();
begin
  //создание набора
  if type_dialog=1 then
  begin
    NullData;
    DMAbiturientNabor.adoqSpecfac.SQL.Strings[1]:='('+inttostr(year)+ ', 0)';
    DMAbiturientNabor.adoqProfile.SQL.Strings[1]:='('+inttostr(year)+ ', 0, 0)';
    Caption:='Добавить набор';
  end
    //редактирование набора
  else
  begin
    DMAbiturientNabor.adoqSpecfac.SQL.Strings[1]:='('+inttostr(year)+', '+ inttostr(ikSpecfac)+')';
    DMAbiturientNabor.adoqProfile.SQL.Strings[1]:='('+inttostr(year)+', '+ inttostr(ikSpecfac)+', '+inttostr(ikProfile)+')';
    Caption:='Редактировать набор';
  end;


  DMAbiturientNabor.adoqSpecfac.Open;
  DMAbiturientNabor.adoqProfile.Open;
  if not DMAbiturientNabor.adoqFac.Active then
    DMAbiturientNabor.adoqFac.Open;
  isModified:=false;
end;


procedure TfrmNewNabor.SetYear(const Value: Integer);
begin
  FYear := Value;
  frmNewNabor.nnyear.KeyValue:=(FYear);
end;

procedure TfrmNewNabor.Spec_FacChange(Sender: TObject);
begin
  inherited;
  //if (ikSpecfac <> Spec_Fac.KeyValue) then
  begin
    ikSpecfac:= Spec_Fac.KeyValue;

    dbcmbxPrifile.KeyValue:=null;
    if (ikSpecfac>-1) then
    begin
      DMAbiturientNabor.adoqProfile.Filtered:=false;
      DMAbiturientNabor.adoqProfile.Filter:='id_parent='+IntToStr(DMAbiturientNabor.adoqSpecFac.FieldByName('ik_spec').Value);
      DMAbiturientNabor.adoqProfile.Filtered:=true;
    end;
  end;
  SetComboBoxEnable;
end;

procedure TfrmNewNabor.NullData();
begin
  mestCKP.Text:='0';
  mestbudjet.Text:='0';
  MestLgot.Text:='0';
  dbcmbxFac.KeyValue:= FikFac;
  Spec_Fac.KeyValue := -1;
  dbcmbxPrifile.KeyValue:= -1;
  ikSpecfac:= -1;
  ikProfile:= -1;
  frmNewNabor.cbRussian.Checked:= true;
  self.nnrecord:= 0;
end;

procedure TfrmNewNabor.SetComboBoxEnable;
begin
  Spec_Fac.Enabled:=dbcmbxFac.KeyValue > 0;
  dbcmbxPrifile.Enabled:=Spec_Fac.KeyValue > 0;

  isModified:= (nnyear.KeyValue>-1) and (spec_fac.KeyValue>-1)
      {and (MestBudjet.Text<>'') and (MestBudjet.Text<>' ')};
end;

procedure TfrmNewNabor.Setikfac(const Value: Integer);
begin
  FikFac := Value;

  if (ikfac <> dbcmbxFac.KeyValue) then
  begin
    Spec_Fac.KeyValue:=null;

    if (ikfac>-1) then
    begin
      DMAbiturientNabor.adoqSpecFac.Filter:='ik_fac='+IntToStr(ikfac);
      DMAbiturientNabor.adoqSpecFac.Filtered:=true;
    end;

    dbcmbxFac.KeyValue:= ikfac;
  end;
  dbcmbxFac.Enabled:=false;
  SetComboBoxEnable;
end;

procedure TfrmNewNabor.actApplyExecute(Sender: TObject);
begin
  if not CheckData then
    exit;

  inherited;
  Sets;
end;

procedure TfrmNewNabor.actApplyUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= (mestBudjet.Text <> '')  // (nnrecord<=0)and
    and (mestCKP.Text <> '') and (MestLgot.Text <> '')
          and (IsModified);

end;

procedure TfrmNewNabor.actOKExecute(Sender: TObject);
begin
  if not CheckData then
    exit;
  inherited;

end;

function TfrmNewNabor.AddData():boolean;
begin
  nnrecord:=TAbitNaborController.Instance.AddNabor
	 (
	  Spec_Fac.KeyValue,
	  nnyear.KeyValue,
    StrToInt(mestbudjet.Text),
	  StrToInt(mestCKP.Text),
	  StrToInt(MestLgot.Text),
    dbcmbxPrifile.KeyValue,
    cbRussian.Checked
	  );
  result:=(nnrecord>0);

end;

function TfrmNewNabor.EditData():boolean;
begin
	  TAbitNaborController.Instance.EditNabor
	  (
	  Spec_Fac.KeyValue,
	  nnyear.KeyValue,
	  StrToInt(mestbudjet.Text),
	  StrToInt(mestCKP.Text),
	  StrToInt(MestLgot.Text),
    dbcmbxPrifile.KeyValue,
	  NNrecord,
    cbRussian.Checked
	  ) ;
    result:=true;
end;



procedure TfrmNewNabor.nnyearChange(Sender: TObject);
begin
  //inherited;
  if (dbcmbxFac.KeyValue>-1) then
  begin
    DMAbiturientNabor.adoqSpecFac.Filter:='ik_fac='+IntToStr(dbcmbxFac.KeyValue);
    DMAbiturientNabor.adoqSpecFac.Filtered:=true;
  end;

  SetComboBoxEnable;
end;

procedure TfrmNewNabor.bbCancelClick(Sender: TObject);
begin
 Cancel;
end;


function TfrmNewNabor.CheckData: boolean;
begin

  result:= true;
end;

function TfrmNewNabor.DoApply: boolean;
begin
    //создание набора
  if type_dialog=1 then Result:= AddData()
  //редактирование
  else Result:= EditData();
  
end;

function TfrmNewNabor.DoCancel: boolean;
begin
  Result:= true;
end;      

procedure TfrmNewNabor.FormCreate(Sender: TObject);
begin
  inherited;
  dm.adoqYears.Open;
  //DMAbiturientNabor.adoqSpecfac.Open;
  DMAbiturientNabor.adoqFac.Open;
end;

procedure TfrmNewNabor.dbcmbxFacChange(Sender: TObject);
begin
  inherited;
  //if (ikfac <> dbcmbxFac.KeyValue) then
  begin
    ikfac:= dbcmbxFac.KeyValue;
    Spec_Fac.KeyValue:=null;

    if (ikfac>-1) then
    begin
      DMAbiturientNabor.adoqSpecFac.Filter:='ik_fac='+IntToStr(ikfac);
      DMAbiturientNabor.adoqSpecFac.Filtered:=true;
    end;

  end;
  SetComboBoxEnable;
end;

procedure TfrmNewNabor.dbcmbxPrifileChange(Sender: TObject);
begin
  inherited;
  //if (ikProfile <> dbcmbxPrifile.KeyValue) then
  begin
    ikProfile:= dbcmbxPrifile.KeyValue;
  end;
  SetComboBoxEnable;
end;

end.

