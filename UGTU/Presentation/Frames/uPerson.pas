unit uPerson;
  {#Author tanyav@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseFrame, StdCtrls, Buttons, ExtCtrls, DBGridEh, DBCtrls,
  DBCtrlsEh, DBLookupEh, GridsEh, Mask, ComCtrls, ToolWin,DBTVHabitatsPersonObj,
  ImgList,DBTVHostelRequestObj,DBTVHostelRootPersonobj, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, DBAxisGridsEh;

type
  TfmPerson = class(TfmBase)
    PageControl1: TPageControl;
    TabLichnDan: TTabSheet;
    PageLichDannie: TPageControl;
    TabObjie: TTabSheet;
    Panel4: TPanel;
    Panel7: TPanel;
    Bevel2: TBevel;
    Label44: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label18: TLabel;
    Label33: TLabel;
    Label46: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    iPhoto: TImage;
    dbcbeSex: TDBComboBoxEh;
    dbdteBirthDate: TDBDateTimeEditEh;
    eFam: TDBEditEh;
    eName: TDBEditEh;
    eMid: TDBEditEh;
    eEmail: TDBEditEh;
    eCellphone: TDBEditEh;
    Panel6: TPanel;
    Label1: TLabel;
    Label58: TLabel;
    Label28: TLabel;
    Label27: TLabel;
    dbcbeCitizenship: TDBLookupComboboxEh;
    dbcbeNationality: TDBLookupComboboxEh;
    eBirthPlace: TDBEditEh;
    Panel2: TPanel;
    Label43: TLabel;
    Label54: TLabel;
    Label51: TLabel;
    cbChildren: TCheckBox;
    cbJob: TCheckBox;
    cbInvalid: TCheckBox;
    cbAppNeed: TCheckBox;
    eDuty: TDBEditEh;
    dbcbeEnterprise: TDBLookupComboboxEh;
    dbcbeMilitaryState: TDBLookupComboboxEh;
    TabAdress: TTabSheet;
    Panel3: TPanel;
    ToolBar1: TToolBar;
    TabSheet5: TTabSheet;
    Splitter1: TSplitter;
    Panel9: TPanel;
    Label38: TLabel;
    dbcbeFamState: TDBLookupComboboxEh;
    dbgeFam: TDBGridEh;
    dbgeChangeFam: TDBGridEh;
    DBNavigator2: TDBNavigator;
    Panel5: TPanel;
    Label2: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    DBEditEh1: TDBEditEh;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    dbgeAddress: TDBGridEh;
    TabDoc: TTabSheet;
    dbgeDocuments: TDBGridEh;
    DBNavigator3: TDBNavigator;
    ilPages: TImageList;
    BTAddAdr: TToolButton;
    BTEditAdr: TToolButton;
    BTDelAdr: TToolButton;
    DBGridAdress: TDBGridEh;
    procedure PageLichDannieChange(Sender: TObject);
    procedure BTAddAdrClick(Sender: TObject);
    procedure BTEditAdrClick(Sender: TObject);
    procedure BTDelAdrClick(Sender: TObject);
    //procedure Pagedsf(Sender: TObject);
   // procedure PageLichnDannie(Sender: TObject);

  private
  Fobj:TDBNodeHostelRootPersonObject;
  Fik:integer;
    { Private declarations }
    procedure DoRefreshFrame;override;
  public
    //nCode:integer;
    property ik: Integer read Fik write Fik;
    property obj:TDBNodeHostelRootPersonObject read Fobj write Fobj;
    procedure LoadData;

    { Public declarations }
  end;

var
  fmPerson: TfmPerson;

implementation

{$R *.dfm}
uses  uDMStudentData, uDMAdress,uDMCauses,uDMStudentSelectionProcs,
HOST_ProjivayushieController,uHOST,uAddress,ApplicationController;

procedure TfmPerson.BTAddAdrClick(Sender: TObject);
begin
  inherited;
  frmAddress := TfrmAddress.Create(Self);
  frmAddress.EditMode := false;
  frmAddress.IdStudent := obj.ncode;
  frmAddress.ShowModal;
  dmStudentSelectionProcs.aspGetPersonAddress.Active:=false;
  dmStudentSelectionProcs.aspGetPersonAddress.Active:=true;
end;

procedure TfmPerson.BTDelAdrClick(Sender: TObject);
begin
  inherited;
 if MessageBox(Handle, PWideChar('Вы действительно хотите удалить адрес?'), 'ИС УГТУ', MB_YESNO)=IDYES then
  begin
  dmAdress.aspDelAddress.Parameters[1].value := dmStudentSelectionProcs.aspGetPersonAddress.FieldByName('ik_personAddress').Value;
  dmAdress.aspDelAddress.ExecProc;
  dmStudentSelectionProcs.aspGetPersonAddress.Active:=false;
  dmStudentSelectionProcs.aspGetPersonAddress.Active:=true;
  end;
end;

procedure TfmPerson.BTEditAdrClick(Sender: TObject);
begin
  inherited;

  frmAddress := TfrmAddress.Create(Self);
  with dmStudentSelectionProcs.aspGetPersonAddress do begin
  frmAddress.EditMode := true;

  frmAddress.AddressKey :=FieldByName('Ik_personAddress').Value;
  frmAddress.dbcbeAddressType.KeyValue := FieldByName('Ik_AddressType').Value;
  frmAddress.dbcbeCountry.KeyValue := FieldByName('Ik_strana').Value;
  frmAddress.dbcbeReg.KeyValue := FieldByName('Ik_region').Value;
  frmAddress.dbcbeDist.KeyValue := FieldByName('Ik_raion').Value;
  frmAddress.dbcbePoint.KeyValue := FieldByName('Ik_gorod').Value;
  frmAddress.dbcbeStreet.KeyValue := FieldByName('Ik_Street').Value;

  frmAddress.eFlat.Text:=FieldByName('FlatNumber').AsString;
  frmAddress.eHouse.Text:=FieldByName('BuildingNumber').AsString;
  frmAddress.eBuilding.Text:=FieldByName('StructNumber').AsString;
  frmAddress.eIndex.Text:=FieldByName('fIndex').AsString;
  frmAddress.dbdteBegin.value:=FieldByName('DateBegin').Value;
  frmAddress.dbdteEnd.value:=FieldByName('DateEnd').Value;

  frmAddress.ShowModal;
  frmAddress.Free;
  end;
  dmStudentSelectionProcs.aspGetPersonAddress.Active:=false;
  dmStudentSelectionProcs.aspGetPersonAddress.Active:=true;

end;

procedure TfmPerson.DoRefreshFrame;
begin
//inherited;
  LoadData;
end;

procedure TfmPerson.LoadData;
begin
if not (FrameObject is TDBNodeHostelRootPersonObject)  then
exit;

     obj:=FrameObject as TDBNodeHostelRootPersonObject;
     ik:=obj.ncode;

     PageControl1.ActivePageIndex := 0;
   with dmStudentData do begin
    adodsDocType.Active:=true;
    adodsMedal.Active:=true;
    adodsMilSt.Active:=true;

     adodsNat.Active:=false;
     adodsCitizen.Active:=false;
     adodsJob.Active:=false;
     dmCauses.adodsExile.Active:=false;
     adodsSempol.Active:=false;
     adodsNat.Active:=true;
     adodsCitizen.Active:=true;
     adodsJob.Active:=true;
     dmCauses.adodsExile.Active:=true;
     adodsSempol.Active:=true;

     Modified:=false;
     bbSave.Enabled:=false;
     bbUndo.Enabled:=false;

   PageLichDannie.TabIndex:=0;
   adodsEnterprise.Active:=false;
   adodsRelative.Active:=false;

   adodsEnterprise.Active:=true;
   adodsRelative.Active:=true;
     end;
   with dmAdress do begin
   adodsStrana.Active:=true;
   adodsSignStrana.Active:=true;
   end;

     if not Assigned(obj) then exit;

     eName.Text:=obj.FirstName;
     eFam.Text:=obj.LastName;
     eMid.Text:=obj.MiddleName;
     dbdteBirthDate.Value:=obj.BirthDate;

     if obj.Sex then  dbcbeSex.Text:='Мужской' else
  dbcbeSex.Text:='Женский';

     eCellPhone.Text:=obj.Cellphone;
     eEmail.Text:=obj.Email;

     dbcbeCitizenship.Text:=obj.Citizenship;
     dbcbeNationality.Text:=obj.Nationality;
     eBirthPlace.Text:=obj.BirthPlace;

     dbcbeMilitaryState.KeyValue:=obj.MilitaryStateKey;
     dbcbeEnterprise.Value:=obj.EnterpriseID;
     eDuty.text:=obj.Duty;

    { if obj.Photo<>nil then begin
    obj.photo.Position:=0;
    iPhoto.Picture.Graphic:=TJPEGImage.Create;
    try
      iPhoto.Picture.Graphic.LoadFromStream(obj.photo);
    except
    end;
    end;  }

  cbJob.Checked:=obj.Job;
  cbChildren.Checked:=obj.Children;
  cbInvalid.Checked:=obj.Invalid;
  cbAppNeed.Checked:=obj.AppartmentNeed;

  Modified:=false;
  bbSave.Enabled:=false;
 bbUndo.Enabled:=false;

end;

procedure TfmPerson.PageLichDannieChange(Sender: TObject);
begin
  inherited;
  if PageLichDannie.ActivePage = TabAdress then
  begin
    TApplicationController.GetInstance.AddLogEntry('Переход на вкладку Адрес.');
    try
      THOST_ProjivayushieController.Instance.VivodAdressPerson(ik)
    except
          MessageBox(Handle, 'Ошибка формирования адреса персоны.',
					  'ИС УГТУ', MB_OK);
    end;
  end;
    if PageLichDannie.ActivePage = TabDoc then
  begin
    TApplicationController.GetInstance.AddLogEntry('Переход на вкладку Документы.');
    try
      THOST_ProjivayushieController.Instance.VivodDocPerson(ik);
    except
          MessageBox(Handle, 'Ошибка формирования документов персоны.',
					  'ИС УГТУ', MB_OK);
    end;
  end;
end;

end.
