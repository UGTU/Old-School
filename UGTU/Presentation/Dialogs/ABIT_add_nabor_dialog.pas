unit ABIT_add_nabor_dialog;
 {#Author tanyav@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, DBCtrlsEh, StdCtrls, Mask, ActnList, Buttons,
  ExtCtrls, Menus, DBCtrls, DB, DBGridEh, DBLookupEh;

type
  TfrmNewNabor = class(TfrmBaseDialog)
    Bevel2: TBevel;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    Label15: TLabel;
    Label10: TLabel;
    Label110: TLabel;
    Label17: TLabel;
    dbcmbxFac: TDBLookupComboboxEh;
    Spec_Fac: TDBLookupComboboxEh;
    nnyear: TDBLookupComboboxEh;
    cbRussian: TCheckBox;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Label5: TLabel;
    begind: TDBNumberEditEh;
    endd: TDBNumberEditEh;
    mestBudjet: TDBNumberEditEh;
    mestCKP: TDBNumberEditEh;
    function AddData():boolean;
    function EditData():boolean;
    procedure NullData();
    procedure nnyearChange(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure sets();
    procedure FormShow(Sender: TObject);
    procedure dbcmbxFacChange(Sender: TObject);
    procedure actApplyUpdate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
  private
    FYear: integer;
    FikSpecfac: integer;
    FikFac: integer;
    procedure SetYear(const Value: Integer);
    procedure SetikSpecfac(const Value: Integer);
    procedure Setikfac(const Value: Integer);
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
    property ikSpecfac:Integer read FikSpecfac write SetikSpecfac;
    // Текущий код факультета набора
    property ikfac:Integer read FikFac write Setikfac;

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
  DMAbiturientNabor.adoqSpecfac.Close;
  //создание набора
  if type_dialog=1 then
  begin
    DMAbiturientNabor.adoqSpecfac.SQL.Strings[1]:='('+inttostr(year)+ ', 0)';
    NullData;
    Caption:='Добавить набор';
  end
    //редактирование набора
  else
  begin
    DMAbiturientNabor.adoqSpecfac.SQL.Strings[1]:='('+inttostr(year)+','+ inttostr(ikSpecfac)+')';
    Caption:='Редактировать набор';
  end;

  DMAbiturientNabor.adoqSpecfac.Open;
  if not DMAbiturientNabor.adoqFac.Active then
    DMAbiturientNabor.adoqFac.Open;
  isModified:=false;
end;


procedure TfrmNewNabor.SetYear(const Value: Integer);
begin
  FYear := Value;
  frmNewNabor.nnyear.KeyValue:=(FYear);
end;

procedure TfrmNewNabor.NullData();
begin
  begind.Text:='0';
  endd.Text:='0';
  mestCKP.Text:='0';
  mestbudjet.Text:='0';
  //mestkontrakt.Text:='0';
  dbcmbxFac.KeyValue:= FikFac;
  ikSpecfac:= -1;
  frmNewNabor.cbRussian.Checked:= true;
  self.nnrecord:= 0;
end;

procedure TfrmNewNabor.Setikfac(const Value: Integer);
begin
  FikFac := Value;
  dbcmbxFac.KeyValue:= FikFac;
end;

procedure TfrmNewNabor.SetikSpecfac(const Value: Integer);
begin
  FikSpecfac := Value;
  Spec_Fac.KeyValue:= FikSpecfac;
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
  (Sender as TAction).Enabled:= (nnrecord<=0)
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
	  StrToInt(begind.Text),
	  StrToInt(endd.Text),
	  nnyear.KeyValue,
	  StrToInt(mestCKP.Text),
	  StrToInt(mestbudjet.Text),
	  (0),
    cbRussian.Checked
	  );
  result:=(nnrecord>0);

end;

function TfrmNewNabor.EditData():boolean;
begin
	  TAbitNaborController.Instance.EditNabor
	  (
	  Spec_Fac.KeyValue,
	  StrToInt(begind.Text),
	  StrToInt(endd.Text),
	  nnyear.KeyValue,
	  StrToInt(mestCKP.Text),
	  StrToInt(mestbudjet.Text),
	  (0),
	  NNrecord,
    cbRussian.Checked
	  ) ;
    result:=true;
end;

procedure TfrmNewNabor.nnyearChange(Sender: TObject);
begin
  //inherited;
  IF (dbcmbxFac.KeyValue<0) then
    Spec_Fac.Enabled:=false
  else
    Spec_Fac.Enabled:=true;

  if (dbcmbxFac.KeyValue>-1) then
  begin
    DMAbiturientNabor.adoqSpecFac.Filter:='ik_fac='+IntToStr(dbcmbxFac.KeyValue);
    DMAbiturientNabor.adoqSpecFac.Filtered:=true;
  end;
  isModified:= (nnyear.KeyValue>-1) and (spec_fac.KeyValue>-1)
      {and (MestBudjet.Text<>'') and (MestBudjet.Text<>' ')};
end;

procedure TfrmNewNabor.bbCancelClick(Sender: TObject);
begin
 Cancel;
end;


function TfrmNewNabor.CheckData: boolean;
begin
  result:= false;
  if (endd.Value<begind.Value) then
  begin
    MessageBox(Handle, 'Введены некорректные данные. Проверьте начало и конец диапазона выделенных номеров!','ИС "УГТУ"',
          MB_OK) ;
    exit;
  end;

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
  DMAbiturientNabor.adoqSpecfac.Open;
  DMAbiturientNabor.adoqFac.Open;
end;

procedure TfrmNewNabor.FormShow(Sender: TObject);
begin
  inherited;
  Sets;
end;

procedure TfrmNewNabor.dbcmbxFacChange(Sender: TObject);
begin
  ikfac:= dbcmbxFac.KeyValue;
  Spec_Fac.KeyValue:=null;
  Spec_Fac.Enabled:=true;

  if (dbcmbxFac.KeyValue>-1) then
  begin
    DMAbiturientNabor.adoqSpecFac.Filter:='ik_fac='+IntToStr(ikfac);
    DMAbiturientNabor.adoqSpecFac.Filtered:=true;
  end;
end;

end.

