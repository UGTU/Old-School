unit uNagruzkaAddDiscToPlan;
   {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, DBGridEh,
  Mask, DBCtrlsEh, DBLookupEh, Grids, DB, ADODB, NagruzkaController, GeneralController,
  ImgList, Menus, ComCtrls, ToolWin, GridsEh, uNagruzkaDep;

type
  TfrmNagruzkaAddDiscToPlan = class(TfrmBaseDialog)
    dsPlanNagr: TDataSource;
    actAddString: TAction;
    actDelString: TAction;
    Panel9: TPanel;
    Panel2: TPanel;
    Label9: TLabel;
    Label8: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    dbcbDiscPlan: TDBLookupComboboxEh;
    dbcbPotokPlan: TDBLookupComboboxEh;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label4: TLabel;
    Label11: TLabel;
    Label6: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Panel3: TPanel;
    dbgVidZanyatPlan: TDBGridEh;
    Bevel3: TBevel;
    SpeedButton1: TSpeedButton;
    actLoadAutomatic: TAction;
    Panel4: TPanel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    actSetNormException: TAction;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolBar2: TToolBar;
    ToolButton2: TToolButton;
    ToolBar3: TToolBar;
    ToolButton3: TToolButton;
    Bevel2: TBevel;
    actShowCalculationScheme: TAction;
    ToolBar4: TToolBar;
    ToolButton4: TToolButton;
    Bevel4: TBevel;
    Image9: TImage;
    Label17: TLabel;
    ImageList2: TImageList;
    ToolBar5: TToolBar;
    ToolButton5: TToolButton;
    actEditPotokSemestrShema: TAction;
    procedure dbcbPotokPlanKeyValueChanged(Sender: TObject);
    procedure dbcbDiscPlanKeyValueChanged(Sender: TObject);
    procedure actAddStringExecute(Sender: TObject);
    procedure actAddStringUpdate(Sender: TObject);
    procedure actDelStringExecute(Sender: TObject);
    procedure actDelStringUpdate(Sender: TObject);
    procedure dsPlanNagrStateChange(Sender: TObject);
    procedure actLoadAutomaticExecute(Sender: TObject);
    procedure dsPlanNagrDataChange(Sender: TObject; Field: TField);
    procedure actSetNormExceptionUpdate(Sender: TObject);
    procedure actSetNormExceptionExecute(Sender: TObject);
    procedure dbgVidZanyatPlanDblClick(Sender: TObject);
    procedure dbgVidZanyatPlanKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actShowCalculationSchemeExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Label17MouseEnter(Sender: TObject);
    procedure Label17MouseLeave(Sender: TObject);
    procedure Label17Click(Sender: TObject);
    procedure actShowCalculationSchemeUpdate(Sender: TObject);
    procedure actEditPotokSemestrShemaExecute(Sender: TObject);
  private
    fCallFrame: TfmNagruzkaDep;
    fLastVZIK: integer;
    fIsDiscHaveBeen: boolean;
    fDoIHavePermsOnNormException: boolean;
    fIsLoad: boolean;
    procedure CalcHour;
    procedure UpdatePickListForVN;
    procedure ReLoadDiscContent;
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    destructor Destroy; override;
    procedure Read(ACallFrame: TfmNagruzkaDep);
  end;

var
  frmNagruzkaAddDiscToPlan: TfrmNagruzkaAddDiscToPlan;

implementation

uses uNagruzkaConflictOnAvtoBuild, Contnrs, uNagruzkaSetNormException,
  uNagruzkaShowCalculationScheme,uNagruzkaEditPotokSemesterShemes;

{$R *.dfm}

destructor TfrmNagruzkaAddDiscToPlan.Destroy;
begin
  TGeneralController.Instance.ReleaseLockupCB(@dbcbDiscPlan);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbPotokPlan);
  inherited;
end;

function TfrmNagruzkaAddDiscToPlan.DoApply: boolean;
var
  conflicList: TObjectList;
  temp: TfrmNagruzkaConflictOnAvtoBuild;
begin
  conflicList:= TObjectList.Create;
try
  Result:= TNagruzkaController.PlanNagruzka.SavePlanContent(self.IK, dbcbDiscPlan.KeyValue, dbcbPotokPlan.KeyValue, dbcbDiscPlan.Text, dbcbPotokPlan.Text, dbcbDiscPlan.ListSource.DataSet.FieldByName('bit_calc_as_practice').AsBoolean, conflicList);
  if dsPlanNagr.DataSet.RecordCount <> 0 then
  begin
    if (Tag = 0) and (not fIsDiscHaveBeen) then
    begin
      fCallFrame.dsDiscInPlan.DataSet.Insert;
      fCallFrame.dsDiscInPlan.DataSet.FieldByName('ik_potok_semestr').Value:= dbcbPotokPlan.KeyValue;
      fCallFrame.dsDiscInPlan.DataSet.FieldByName('cName_potok').Value:= dbcbPotokPlan.Text;
      fCallFrame.dsDiscInPlan.DataSet.FieldByName('ik_disc').Value:= dbcbDiscPlan.KeyValue;
      fCallFrame.dsDiscInPlan.DataSet.FieldByName('cName_disc').Value:= dbcbDiscPlan.Text;
      fCallFrame.dsDiscInPlan.DataSet.Post;
    end;
  end
  else
  begin
    if (Tag <> 0) or (fIsDiscHaveBeen) then
      if fCallFrame.dsDiscInPlan.DataSet.Locate('ik_disc; ik_potok_semestr', VarArrayOf([dbcbDiscPlan.KeyValue, dbcbPotokPlan.KeyValue]), [loPartialKey]) then
        fCallFrame.dsDiscInPlan.DataSet.Delete;
    Application.MessageBox(PChar(' оличество часов по данной дисциплине равн€етс€ нулю. ' + #10#13 + 'ƒисциплина не будет включена в план учебной нагрузки!'), PChar(Caption), MB_ICONWARNING);
  end;

  if conflicList.Count > 0 then
  begin
    temp:= TfrmNagruzkaConflictOnAvtoBuild.CreateDialog(nil, self.Connection, nil);
    temp.Read(conflicList);
    temp.ShowModal;
    temp.Free;
  end;
finally
  conflicList.Clear;
  conflicList.Free;
end;  
end;

function TfrmNagruzkaAddDiscToPlan.DoCancel: boolean;
begin
  case (Application.MessageBox('—охранить внесенные изменени€?', PChar(Caption), MB_YESNOCANCEL)) of
      mrYes:
        begin
          OK;
          Result:= false;
        end;
      mrNo: Result:= true;
      mrCancel: Result:= false;
      else Result:= false;
  end;
end;

procedure TfrmNagruzkaAddDiscToPlan.Read(ACallFrame: TfmNagruzkaDep);
begin
  fLastVZIK:= -1;
  fIsDiscHaveBeen:= false;
  fCallFrame:= ACallFrame;
  fDoIHavePermsOnNormException:= TNagruzkaController.PlanNagruzka.DoIHavePermsOnNormException;
  TGeneralController.Instance.InitializeLockupCB(@dbcbPotokPlan, 'ik_potok_semestr', 'cName_potok');
  TGeneralController.Instance.InitializeLockupCB(@dbcbDiscPlan, 'ik_disc', 'Cname_disc');
  TNagruzkaController.PlanNagruzka.GetPotoksForPlan(@dbcbPotokPlan.ListSource.DataSet, self.IK, true);
  if Width > round(Screen.Width*0.9)then
    Width:= round(Screen.Width*0.9);
  if Height > round(Screen.Height*0.9) then
    Height:= round(Screen.Height*0.9);
end;

procedure TfrmNagruzkaAddDiscToPlan.ReLoadDiscContent;
var
  allHour, rasp: double;
begin
  TNagruzkaController.PlanNagruzka.CloseContentPlanNagr;
  if (dbcbDiscPlan.KeyValue <> NULL) then
    dsPlanNagr.DataSet:= TNagruzkaController.PlanNagruzka.LoadContentPlanNagr(true, self.IK, dbcbPotokPlan.KeyValue,
            dbcbDiscPlan.KeyValue, dbcbDiscPlan.ListSource.DataSet.FieldByName('ik_type_disc').AsInteger,
            {dbcbDiscPlan.ListSource.DataSet.FieldByName('n_sem').AsInteger, }
            dbcbDiscPlan.ListSource.DataSet.FieldByName('bit_calc_as_practice').AsBoolean, allHour, rasp, false);
  if dsPlanNagr.DataSet <> nil then
    if dsPlanNagr.DataSet.Active then
      fIsDiscHaveBeen:= (Tag = 0) and (dsPlanNagr.DataSet.RecordCount > 0);
  CalcHour;
  if Self.Showing then dbgVidZanyatPlan.SetFocus;
end;

procedure TfrmNagruzkaAddDiscToPlan.UpdatePickListForVN;
var
  i: integer;
begin
  for i := 0 to dbgVidZanyatPlan.Columns.Count - 1 do
    if dbgVidZanyatPlan.Columns.Items[i].FieldName = 'name_vid_nagruzki' then
    begin
      TNagruzkaController.PlanNagruzka.GetPickListForVidNagruzki(dbcbPotokPlan.KeyValue, dbcbDiscPlan.KeyValue, dbcbDiscPlan.ListSource.DataSet.FieldByName('ik_type_disc').AsInteger, dbgVidZanyatPlan.DataSource.DataSet.FieldByName('ik_vid_zanyat').AsInteger, dbgVidZanyatPlan.Columns.Items[i].PickList);
      break;
    end;
end;

procedure TfrmNagruzkaAddDiscToPlan.dbcbPotokPlanKeyValueChanged(
  Sender: TObject);
var
  StudentCount, Course, groupCount, subgroupCount: string;
begin
  Label4.Caption:= '-';
  Label7.Caption:= '-';
  Label15.Caption:= '-';
  Label16.Caption:= '-';
  TGeneralController.Instance.CloseLockupCB(@dbcbDiscPlan);
  if (dbcbPotokPlan.KeyValue <> NULL) then
  begin
    TNagruzkaController.PlanNagruzka.GetPotokInfo(self.IK, dbcbPotokPlan.KeyValue, StudentCount, Course, groupCount, subgroupCount);
    if StudentCount = '0' then
    begin
      Application.MessageBox(PChar('Ќе удалось определить ожидаемый контингент потока!' + #10#13 + '¬озможно ожидаемый контингент потока на выбранный год не распределен между расчетными единицами потока.'), PChar(Caption), MB_ICONWARNING);
      exit;
    end;
    Label4.Caption:= StudentCount + ' чел.';
    Label7.Caption:= Course + '-й';
    Label15.Caption:= groupCount;
    Label16.Caption:= subgroupCount;

  {  if not TNagruzkaController.Instance.CheckForSpecContingentExists(dbcbPotokPlan.KeyValue, IK, Course) then
    begin
      Label4.Caption:= '0 чел.';
      Label7.Caption:= '-';
      Label15.Caption:= '0';
      Label16.Caption:= '0';
      tempStr:= 'Ќе заполнен ожидаемый контингент специальностей, вход€щих в поток "' + dbcbPotokPlan.Text + '".' + #10#13 + 'ƒальнейший расчет учебной нагрузки дл€ данного потока невозможен!';
      Application.MessageBox(PChar(tempStr), PChar(Caption), MB_ICONWARNING);
      exit;
    end;   }
    TNagruzkaController.PlanNagruzka.GetDisciplinesFromPotok(@dbcbDiscPlan.ListSource.DataSet, dbcbPotokPlan.KeyValue, self.IK);

    if Assigned(dbcbDiscPlan.ListSource.DataSet) then
      if dbcbDiscPlan.ListSource.DataSet.Active then
        if dbcbDiscPlan.ListSource.DataSet.RecordCount = 1 then
          dbcbDiscPlan.KeyValue:= dbcbDiscPlan.ListSource.DataSet.FieldByName('ik_disc').AsInteger;
  end;
end;

procedure TfrmNagruzkaAddDiscToPlan.dbgVidZanyatPlanDblClick(Sender: TObject);
begin
  if actShowCalculationScheme.Enabled then
    actShowCalculationSchemeExecute(actShowCalculationScheme);
end;

procedure TfrmNagruzkaAddDiscToPlan.dbgVidZanyatPlanKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (not (ssAlt in Shift)) then
    if actShowCalculationScheme.Enabled then
      actShowCalculationSchemeExecute(actShowCalculationScheme);
  if (Key = VK_RETURN) and (ssAlt in Shift) then
    if actSetNormException.Enabled then
      actSetNormExceptionExecute(actSetNormException);
end;

procedure TfrmNagruzkaAddDiscToPlan.dbcbDiscPlanKeyValueChanged(
  Sender: TObject);
begin
  ReLoadDiscContent;
end;

procedure TfrmNagruzkaAddDiscToPlan.actAddStringExecute(Sender: TObject);
begin    
  dsPlanNagr.DataSet.First;
  dsPlanNagr.DataSet.Insert;
  IsModified:= true;
end;

procedure TfrmNagruzkaAddDiscToPlan.actAddStringUpdate(Sender: TObject);
begin
  if dsPlanNagr.DataSet <> nil then
    (Sender as TAction).Enabled:= dsPlanNagr.DataSet.Active
  else
    (Sender as TAction).Enabled:= false;
end;

procedure TfrmNagruzkaAddDiscToPlan.actDelStringExecute(Sender: TObject);
begin
  dsPlanNagr.DataSet.Delete;
  IsModified:= true;
  CalcHour;
end;

procedure TfrmNagruzkaAddDiscToPlan.actDelStringUpdate(Sender: TObject);
begin
  if (dsPlanNagr.DataSet <> nil) then
  begin
    if (dsPlanNagr.DataSet.Active) then
      (Sender as TAction).Enabled:= dsPlanNagr.DataSet.RecordCount > 0
    else (Sender as TAction).Enabled:= false;
  end
  else (Sender as TAction).Enabled:= false;
end;

procedure TfrmNagruzkaAddDiscToPlan.actEditPotokSemestrShemaExecute(
  Sender: TObject);
var temp: TfrmNagruzkaEditPotokSemShemes;
begin
   temp := TfrmNagruzkaEditPotokSemShemes.CreateDialog(Application, Connection, nil);
   temp.ShemaIK := dsPlanNagr.DataSet.FieldByName('ik_shema').AsInteger;
   if (temp.ShowModal() = mrOk) or (temp.bbApply.Tag = 1) then
   begin
     ReLoadDiscContent;
   end;
end;

procedure TfrmNagruzkaAddDiscToPlan.actLoadAutomaticExecute(Sender: TObject);
var
  conflictDT: TObjectList;
  temp: TfrmNagruzkaConflictOnAvtoBuild;
begin
  conflictDT:= TObjectList.Create;
  try
    TNagruzkaController.PlanNagruzka.LoadPlanNagrByDiscAvto(ik, dbcbDiscPlan.KeyValue, dbcbPotokPlan.KeyValue, dbcbDiscPlan.Text, dbcbPotokPlan.Text, conflictDT);
    if conflictDT.Count > 0 then
    begin
      temp:= TfrmNagruzkaConflictOnAvtoBuild.CreateDialog(nil, self.Connection, nil);
      temp.Read(conflictDT);
      temp.ShowModal;
      temp.Free;
    end;
  finally
    conflictDT.Clear;
    conflictDT.Free;
  end;
end;

procedure TfrmNagruzkaAddDiscToPlan.actSetNormExceptionExecute(Sender: TObject);
var
  tempForm: TfrmNagruzkaSetNormException;
begin
  tempForm:= TfrmNagruzkaSetNormException.CreateDialog(nil, Connection, nil);
  tempForm.Read(dsPlanNagr.DataSet.FieldByName('ik_vid_zanyat').AsInteger, dsPlanNagr.DataSet.FieldByName('ik_vid_nagruzki').AsInteger, dbcbDiscPlan.ListSource.DataSet.FieldByName('bit_calc_as_practice').AsBoolean);
  tempForm.ShowModal;
  tempForm.Free;
end;

procedure TfrmNagruzkaAddDiscToPlan.actSetNormExceptionUpdate(Sender: TObject);
begin
  if not fDoIHavePermsOnNormException then
    (Sender as TAction).Enabled:= false
  else
  begin
    if (dsPlanNagr.DataSet <> nil) then
    begin
      if (dsPlanNagr.DataSet.Active) then
      begin
        if (dsPlanNagr.DataSet.FieldByName('ik_vid_zanyat').Value <> NULL) then
         (Sender as TAction).Enabled:= (dsPlanNagr.DataSet.FieldByName('ik_vid_nagruzki').Value <> NULL) and (dsPlanNagr.DataSet.FieldByName('ik_vid_zanyat').AsInteger <> 32)
        else (Sender as TAction).Enabled:= false;
      end
      else (Sender as TAction).Enabled:= false;
    end
    else (Sender as TAction).Enabled:= false;
  end;
end;

procedure TfrmNagruzkaAddDiscToPlan.actShowCalculationSchemeExecute(
  Sender: TObject);
var
  temp: TfrmNagruzkaShowCalculationScheme;
begin
  temp:= TfrmNagruzkaShowCalculationScheme.CreateDialog(Application, Connection, nil);
  temp.Read(IK, dsPlanNagr.DataSet.FieldByName('ik_shema').AsInteger, dsPlanNagr.DataSet.FieldByName('ik_vid_zanyat').AsInteger, dsPlanNagr.DataSet.FieldByName('ik_vid_nagruzki').AsInteger, dsPlanNagr.DataSet.FieldByName('i_commission_count').AsInteger, dbcbDiscPlan.ListSource.DataSet.FieldByName('bit_calc_as_practice').AsBoolean);
  TGeneralController.Instance.SetCaptionDots(@temp.Label5, dbcbPotokPlan.Text, 175);
  TGeneralController.Instance.SetCaptionDots(@temp.Label6, dbcbDiscPlan.Text, 265);
  TGeneralController.Instance.SetCaptionDots(@temp.Label8, dsPlanNagr.DataSet.FieldByName('name_vid_zanyat').AsString, 170);
  TGeneralController.Instance.SetCaptionDots(@temp.Label10, dsPlanNagr.DataSet.FieldByName('name_vid_nagruzki').AsString, 265);
  temp.ShowModal;
  temp.Free;
end;

procedure TfrmNagruzkaAddDiscToPlan.actShowCalculationSchemeUpdate(
  Sender: TObject);
begin
  if dsPlanNagr.DataSet <> nil then
  begin
    if dsPlanNagr.DataSet.Active then
      (Sender as TAction).Enabled:= dsPlanNagr.DataSet.RecordCount > 0
    else (Sender as TAction).Enabled:= false;
  end
  else (Sender as TAction).Enabled:= false;
end;

procedure TfrmNagruzkaAddDiscToPlan.CalcHour;
var
  allHour: double;
  book: Pointer;
begin
  Label10.Caption:= '0';
  if dsPlanNagr.DataSet <> nil then
  begin
    if not dsPlanNagr.DataSet.Active then exit;
  end
  else exit;
  allHour:= 0;
  dsPlanNagr.DataSet.DisableControls;
  try
    book:= dsPlanNagr.DataSet.GetBookmark;
    dsPlanNagr.DataSet.First;
    while not dsPlanNagr.DataSet.Eof do
    begin
      allHour:= allHour + dsPlanNagr.DataSet.FieldByName('f_all_hour').AsFloat;
      dsPlanNagr.DataSet.Next;
    end;
    dsPlanNagr.DataSet.GotoBookmark(book);
    Label10.Caption:= FloatToStrF(allHour, ffFixed, 10, 2) + ' час.';
  finally
    dsPlanNagr.DataSet.EnableControls;
  end;                                
end;

procedure TfrmNagruzkaAddDiscToPlan.dsPlanNagrDataChange(Sender: TObject;
  Field: TField);
begin
  if dsPlanNagr.DataSet.Active then
    if dsPlanNagr.DataSet.FieldByName('ik_vid_zanyat').Value <> NULL then
      if dsPlanNagr.DataSet.FieldByName('ik_vid_zanyat').AsInteger <> fLastVZIK then
      begin
        fLastVZIK:= dsPlanNagr.DataSet.FieldByName('ik_vid_zanyat').AsInteger;
        UpdatePickListForVN;
      end;
end;

procedure TfrmNagruzkaAddDiscToPlan.dsPlanNagrStateChange(Sender: TObject);
begin
  IsModified:= true;
  CalcHour;
end;

procedure TfrmNagruzkaAddDiscToPlan.FormShow(Sender: TObject);
begin
  if (dbcbDiscPlan.KeyValue <> NULL) then
    dbgVidZanyatPlan.SetFocus;
end;

procedure TfrmNagruzkaAddDiscToPlan.Label17Click(Sender: TObject);
var
  key: word;
begin
  key:= 112;
  FormKeyUp(Self, key, []);
end;

procedure TfrmNagruzkaAddDiscToPlan.Label17MouseEnter(Sender: TObject);
begin
  Label17.Font.Style:= Label17.Font.Style + [fsUnderline];
end;

procedure TfrmNagruzkaAddDiscToPlan.Label17MouseLeave(Sender: TObject);
begin
  Label17.Font.Style:= Label17.Font.Style - [fsUnderline];
end;

end.
