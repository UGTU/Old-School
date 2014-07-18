unit uFgos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseFrame, DBGridEh, Grids, DBGrids, DBCtrls, StdCtrls, DBCtrlsEh,
  Mask, DBLookupEh, Buttons, ExtCtrls, ComCtrls, ToolWin, ImgList, ActnList,
  GeneralController, uFgosController, DBTVSpecobj, DB, uDMFgos, GridsEh,
  UchPlanController, ADODB, Menus,Fgos_Application1Report,Fgos_Application2Report,
   Fgos_Application12Report, uWaitingController, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, System.Actions, DBAxisGridsEh;

type
  TfmFgos = class(TfmBase)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel3: TPanel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel4: TPanel;
    Label14: TLabel;
    dbcbTypeCompetence: TDBLookupComboboxEh;
    ToolBar1: TToolBar;
    dsFgosBySpec: TDataSource;
    imgFgos: TImageList;
    Label5: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label17: TLabel;
    Panel5: TPanel;
    Label19: TLabel;
    dbdtDate: TDBDateTimeEditEh;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label18: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    imgCmptnc: TImageList;
    actListCmptnc: TActionList;
    ToolBar2: TToolBar;
    ToolBar3: TToolBar;
    ToolBar4: TToolBar;
    ToolButton6: TToolButton;
    actAddCmptnc: TAction;
    actEditCmptnc: TAction;
    actDelCmptnc: TAction;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    dsFgosSpecYearNum: TDataSource;
    dsGetCompetence: TDataSource;
    DBGridEh1: TDBGridEh;
    ToolButton1: TToolButton;
    ActionListFgos: TActionList;
    actAddFgos: TAction;
    actEditFgos: TAction;
    actDelFgos: TAction;
    actFgosException: TAction;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    dsAllAboutFgos: TDataSource;
    dsDiscZE: TDataSource;
    ToolBar5: TToolBar;
    actAddStructCmptnc: TAction;
    actAddSformCmptnc: TAction;
    ToolButton9: TToolButton;
    ToolBar6: TToolBar;
    ToolButton10: TToolButton;
    actFgosApp1: TAction;
    ToolButton11: TToolButton;
    PopupMenu1: TPopupMenu;
    actFgosApp11: TMenuItem;
    actFgosApp2: TAction;
    actFgosApp21: TMenuItem;
    dsGetFgosSformyrForCompetence: TDataSource;
    dsGetDiscByCompetence: TDataSource;
    dsGetStructCompetence: TDataSource;
    dsGetDataTitle: TDataSource;
    ToolBar7: TToolBar;
    procedure ActionAddFgosExecute(Sender: TObject);
    procedure ActionAddFgosUpdate(Sender: TObject);
    procedure ActDelFgosExecute(Sender: TObject);
    procedure ActDelFgosUpdate(Sender: TObject);
    procedure actAddExceptionExecute(Sender: TObject);
    procedure actAddCmptncUpdate(Sender: TObject);
    procedure actAddCmptncExecute(Sender: TObject);
    procedure actDelCmptncExecute(Sender: TObject);
    procedure actDelCmptncUpdate(Sender: TObject);
    procedure actFgosExceptionUpdate(Sender: TObject);
    procedure actEditCmptncExecute(Sender: TObject);
    procedure dbcbTypeCompetenceChange(Sender: TObject);
    procedure actAddStructCmptncExecute(Sender: TObject);
    procedure actAddSformCmptncExecute(Sender: TObject);
    procedure actFgosApp1Execute(Sender: TObject);
    procedure actFgosApp2Execute(Sender: TObject);
  private
    fIK: integer;
    fvidGos: integer;
    { Private declarations }
  public
    FgosID: integer;
    property IK: Integer read fIK write fIK;
    property vidGos: Integer read fvidGos write fvidGos;
   // procedure CloseFrame;
   destructor Destroy; override;
    procedure Read;
    { Public declarations }
  end;

var
  fmFgos: TfmFgos;

implementation
uses uFgosAddNew, uMain, uFgosException, uFgosExceptionTable, uFgosAddCompetence,uFgosAddStructCompetence,uFgosSformyrCompetence;
{$R *.dfm}

procedure TfmFgos.Read;
begin

  TGeneralController.Instance.InitializeLockupCB(@dbcbTypeCompetence, 'ik_type_competence', 'name_type_competence');
  dsGetCompetence.DataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  dsGetFgosSformyrForCompetence.DataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  dsGetDiscByCompetence.DataSet:= TGeneralController.Instance.GetNewADODataSet(false);
  dsGetStructCompetence.DataSet:= TGeneralController.Instance.GetNewADODataSet(false);
   Label17.Caption:=TDBNodeSpecObject(frmMain.DBDekTreeView_TEST1.SelectedObject).Name;
  dsFgosBySpec.DataSet:=TFgosController.Instance.getFgosBySpec(IK);
  if (dsFgosBySpec.DataSet.RecordCount<>0) then FgosID:=dsFgosBySpec.DataSet.FieldByName('IDGos').Value;

  if ((dsFgosBySpec.DataSet.RecordCount<>0) and (vidGos=2)) then
  begin

      dbcbTypeCompetence.KeyValue:=TFgosController.Instance.getTypeCompetence(@dbcbTypeCompetence.ListSource.DataSet, true);
      dsGetDataTitle.DataSet:=TFgosController.Instance.GetDataTitle(dsFgosBySpec.DataSet.FieldByName('IDGos').Value);
      dsAllAboutFgos.DataSet:=TFgosController.Instance.GetAllAboutFgos(dsFgosBySpec.DataSet.FieldByName('IDGos').Value);
      dsDiscZE.DataSet:=TUchPlanController.Instance.getDiscZE(FgosID);
      dbdtDate.Value:=dsAllAboutFgos.DataSet.FieldByName('DateFgos').Value;     //дата ФГОС   DateFgos
      Label19.Caption:=IntToStr(dsAllAboutFgos.DataSet.FieldByName('NumFgos').Value);     //номер утверждения ФГОС NumFgos
      Label16.Caption:=IntToStr(dsDiscZE.DataSet.FieldByName('znach_ZE').Value);    //часов в 1 ЗЕ        ik_znach_ZE
      Label5.Caption:= IntToStr(dsAllAboutFgos.DataSet.FieldByName('Hours_in_week_all_lesson').Value);    //общий объем часов   Hours_in_week_all_lesson
      Label15.Caption:= IntToStr(dsAllAboutFgos.DataSet.FieldByName('Hours_in_week_auditor_lesson').Value);    //аудиторные часы    Hours_in_week_auditor_lesson
      Label20.Caption:= IntToStr(dsAllAboutFgos.DataSet.FieldByName('min_holiday_week').Value);    //мин каникул        min_holiday_week
      Label21.Caption:= IntToStr(dsAllAboutFgos.DataSet.FieldByName('max_holiday_week').Value);    //макс каникул       max_holiday_week
      Label10.Caption:= IntToStr(dsAllAboutFgos.DataSet.FieldByName('winter_holiday_week').Value);    //мин зим каникул    winter_holiday_week

  end;
end;

procedure TfmFgos.actAddCmptncExecute(Sender: TObject);
begin
  inherited;
 frmFgosAddCompetence:= TfrmFgosAddCompetence.CreateDialog(Application, Connection, nil);
  try

    frmFgosAddCompetence.IKTypeCompetence := dbcbTypeCompetence.KeyValue;
    frmFgosAddCompetence.Tag:=(sender as TAction).Tag;
    frmFgosAddCompetence.CallFrame:= self;

    if (frmFgosAddCompetence.Read) then
    begin
      if ((frmFgosAddCompetence.ShowModal()= mrOK) or (frmFgosAddCompetence.bbApply.Tag = 1) )then
        begin
          frmFgosAddCompetence.Close();
          dsGetCompetence.DataSet.Close;
          (dsGetCompetence.DataSet as TADODataSet).CommandText := 'SELECT ik_competence,zhach_competence,short_Name '+
       ' FROM Competence C where C.ik_type_competence='+ IntToStr(dbcbTypeCompetence.Value)+
       ' and IDGos='+IntToStr(FgosID);
          dsGetCompetence.DataSet.Open;
        end;
    end;
  finally
  frmFgosAddCompetence.Free;
  end;
end;

procedure TfmFgos.actAddCmptncUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled:= true;
end;


procedure TfmFgos.actAddExceptionExecute(Sender: TObject);
begin
  inherited;
frmFgosExceptionTable:= TfrmFgosExceptionTable.CreateDialog(Application, Connection, nil);
  try
    frmFgosExceptionTable.IK:=0;
    frmFgosExceptionTable.Tag:=(sender as TAction).Tag;
    frmFgosExceptionTable.CallFrame:= self;
    if (frmFgosExceptionTable.Read) then
    begin
      if ((frmFgosExceptionTable.ShowModal()= mrOK) or (frmFgosExceptionTable.bbApply.Tag = 1) )then
        begin
          frmFgosExceptionTable.Close();
        end;
    end;
  finally
  frmFgosExceptionTable.Free;
  end;
end;

procedure TfmFgos.actAddSformCmptncExecute(Sender: TObject);
begin
//  inherited;
if dsGetCompetence.DataSet.RecordCount<>0 then
begin
    frmFgosSformyrCompetence:= TfrmFgosSformyrCompetence.CreateDialog(Application, Connection, nil);
  try
    //frmFgosAddCompetence.IK:=IK;
    frmFgosSformyrCompetence.IKTypeCompetence := dbcbTypeCompetence.KeyValue;
    frmFgosSformyrCompetence.IKCompetence := dsGetCompetence.DataSet.FieldByName('ik_competence').AsInteger;
     frmFgosSformyrCompetence.Caption:= 'Сформированность уровня компетенции '+ dsGetCompetence.DataSet.FieldByName('short_Name').AsString;
    if (frmFgosSformyrCompetence.Read) then
    begin
      if ((frmFgosSformyrCompetence.ShowModal()= mrOK) or (frmFgosSformyrCompetence.bbApply.Tag = 1) )then
        begin
          frmFgosSformyrCompetence.Close();
        end;
    end;
  finally
  frmFgosSformyrCompetence.Free;
  end;
end else
begin
   Application.MessageBox('Добавьте компетенцию для работы с её уровнем сформированности!',
 'Сформированность уровня компетенции',MB_ICONERROR);
 exit;
end;
end;

procedure TfmFgos.actAddStructCmptncExecute(Sender: TObject);
begin
//  inherited;
if dsGetCompetence.DataSet.RecordCount<>0 then
begin
 frmFgosAddStructCompetence:= TfrmFgosAddStructCompetence.CreateDialog(Application, Connection, nil);
  try
    //frmFgosAddCompetence.IK:=IK;
    frmFgosAddStructCompetence.IKTypeCompetence := dbcbTypeCompetence.KeyValue;
    frmFgosAddStructCompetence.IKCompetence := dsGetCompetence.DataSet.FieldByName('ik_competence').AsInteger;
     frmFgosAddStructCompetence.Caption:= 'Структура компетенции '+ dsGetCompetence.DataSet.FieldByName('short_Name').AsString;
    if (frmFgosAddStructCompetence.Read) then
    begin
      if ((frmFgosAddStructCompetence.ShowModal()= mrOK) or (frmFgosAddStructCompetence.bbApply.Tag = 1) )then
        begin
          frmFgosAddStructCompetence.Close();
        end;
    end;
  finally
  frmFgosAddStructCompetence.Free;
  end;

end else
begin
 Application.MessageBox('Добавьте компетенцию для работы с её структурой!',
 'Структура компетенции',MB_ICONERROR);
 exit;
end;
end;

procedure TfmFgos.actDelCmptncExecute(Sender: TObject);
var   IKCompetence: integer;
begin
 //nherited;
if (Application.MessageBox(PChar('Вы уверены, что хотите удалить выбранную компетенцию?'),'Компетенции ФГОС',MB_YESNO) = mrYes) then
  begin
  IKCompetence := dsGetCompetence.DataSet.FieldByName('ik_competence').AsInteger;
  if (TFgosController.Instance.DeleteCompetence(IKCompetence,IK)) then
      begin
        dsGetCompetence.DataSet.Close;
        dsGetCompetence.DataSet.Open;
      end;
  end;
end;

procedure TfmFgos.actDelCmptncUpdate(Sender: TObject);
begin
  //herited;

end;

procedure TfmFgos.ActDelFgosExecute(Sender: TObject);
var year,num:integer;
    a,b,c:word;
begin
  inherited;
  if (Application.MessageBox(PChar('Вы уверены, что хотите удалить выбранный ФГОС?'),'ФГОС',MB_YESNO) = mrYes) then
  begin
    if (TFgosController.Instance.DeleteFgos(FgosID)) then
      begin
//очистить грид
      dbdtDate.Value:= NULL;
      Label19.Caption:=' ';
      Label16.Caption:= ' ';
      Label5.Caption:= ' ';
      Label15.Caption:= ' ';
      Label20.Caption:= ' ';
      Label21.Caption:= ' ';
      Label10.Caption:= ' ';
      FgosID:=0;
      dsGetCompetence.DataSet.Close;
      end;
  end;
end;

procedure TfmFgos.ActDelFgosUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= ( (dbdtDate.Value <> NULL) and (Label19.Caption <> ''));
end;

procedure TfmFgos.actEditCmptncExecute(Sender: TObject);
begin
  frmFgosAddCompetence:= TfrmFgosAddCompetence.CreateDialog(Application, Connection, nil);
  try
    //frmFgosAddCompetence.IK:=IK;
    frmFgosAddCompetence.IKTypeCompetence := dbcbTypeCompetence.KeyValue;
    frmFgosAddCompetence.IKCompetence := dsGetCompetence.DataSet.FieldByName('ik_competence').AsInteger;
    frmFgosAddCompetence.TextComp := dsGetCompetence.DataSet.FieldByName('zhach_competence').AsString;
    frmFgosAddCompetence.ShortName := dsGetCompetence.DataSet.FieldByName('short_Name').AsString;
    frmFgosAddCompetence.Tag := 2;
    frmFgosAddCompetence.CallFrame:= self;

    if (frmFgosAddCompetence.Read) then
    begin
      if ((frmFgosAddCompetence.ShowModal()= mrOK) or (frmFgosAddCompetence.bbApply.Tag = 1) )then
        begin
          frmFgosAddCompetence.Close();
          dsGetCompetence.DataSet.Close;
          dsGetCompetence.DataSet.Open;
        end;
    end;
  finally
  frmFgosAddCompetence.Free;
  end;
end;



procedure TfmFgos.actFgosApp1Execute(Sender: TObject);
var Report: TFgos_Application1Report;
begin
dmFgos.adodsApplication1.Open;
dmFgos.adodsApplication1.DisableControls;
//  inherited;
 Report := TFgos_Application1Report.Create(nil, dmFgos.adodsApplication1,dsGetDataTitle.DataSet);
 Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\FgosApplicationOne.xlt';
 TWaitingController.GetInstance.Process(Report);
  dmFgos.adodsApplication1.EnableControls;
  Report.Show;
  Report.Free;
  dmFgos.adodsApplication1.Close;
 end;

procedure TfmFgos.actFgosApp2Execute(Sender: TObject);
var Report: TFgos_Application2Report;
    short_Name, znach_comp: string;
    ik_comp, ik_type:integer;
begin
ik_type := dbcbTypeCompetence.KeyValue;
ik_comp := dsGetCompetence.DataSet.FieldByName('ik_competence').AsInteger;
short_Name:= dsGetCompetence.DataSet.FieldByName('short_Name').AsString;
znach_comp:= dsGetCompetence.DataSet.FieldByName('zhach_competence').AsString;

dsGetFgosSformyrForCompetence.DataSet.Close;
(dsGetFgosSformyrForCompetence.DataSet as TADODataSet).CommandText := 'Select name_type_level_sformyr,'+
' Value_priznak, Ls.ik_level_competence From Type_level_sformyr Tls inner join Level_sformyr Ls on'+
' Tls.ik_type_level_sformyr=Ls.ik_type_level_sformyr inner join Level_competence Lc on '+
'Ls.ik_level_competence=Lc.ik_level_competence where ik_competence= ' + inttostr(ik_comp)+
' order by name_type_level_sformyr DESC, Ls.ik_level_competence';
dsGetFgosSformyrForCompetence.DataSet.Open;
dsGetFgosSformyrForCompetence.DataSet.DisableControls;

dsGetDiscByCompetence.DataSet.Close;
(dsGetDiscByCompetence.DataSet as TADODataSet).CommandText := 'Select distinct cname_ckl_disc1,cName_disc, Sd.ik_disc_uch_plan From '+
' discpln d inner join sv_disc Sd on D.iK_disc=Sd.ik_disc'+
' inner join Struct_competence_sv_disc Ssd on Sd.ik_disc_uch_plan=Ssd.ik_disc_uch_plan'+
' inner join Structure_competence Sc on Ssd.ik_structure_competence=Sc.ik_structure_competence'+
' where Sc.ik_competence= '+inttostr(ik_comp)+' order by cName_disc';
dsGetDiscByCompetence.DataSet.Open;
dsGetDiscByCompetence.DataSet.DisableControls;

dsGetStructCompetence.DataSet.Close;
(dsGetStructCompetence.DataSet as TADODataSet).CommandText := 'Select distinct name_level_competence,'+
' description_content From Structure_competence Sc inner join Level_competence Lc on'+
' Sc.ik_level_competence=Lc.ik_level_competence where ik_competence= '+ inttostr(ik_comp);
dsGetStructCompetence.DataSet.Open;
dsGetStructCompetence.DataSet.DisableControls;

 Report := TFgos_Application2Report.Create(nil,dsGetFgosSformyrForCompetence.DataSet,dsGetDiscByCompetence.DataSet,
 dsGetStructCompetence.DataSet,dsGetDataTitle.DataSet,ik_type,ik_comp,short_Name,znach_comp);
 Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\FgosApplicationTwo.xlt';
 TWaitingController.GetInstance.Process(Report);
  dsGetFgosSformyrForCompetence.DataSet.EnableControls;
  dsGetDiscByCompetence.DataSet.EnableControls;
  dsGetStructCompetence.DataSet.EnableControls;
  Report.Show;
  Report.Free;
  dsGetFgosSformyrForCompetence.DataSet.Close;
  dsGetDiscByCompetence.DataSet.Close;
  dsGetStructCompetence.DataSet.Close;
end;

procedure TfmFgos.actFgosExceptionUpdate(Sender: TObject);
begin
 // inherited;

end;

procedure TfmFgos.ActionAddFgosExecute(Sender: TObject);
var a,b,c:word;
    num: integer;
begin
  inherited;
  frmFgosAddNew:= TfrmFgosAddNew.CreateDialog(Application, Connection, nil);
try
  frmFgosAddNew.IK:=0 ;
  frmFgosAddNew.Tag:= (sender as TAction).Tag;
  frmFgosAddNew.CallFrame:= self;
  frmFgosAddNew.Label7.Caption:=TDBNodeSpecObject(frmMain.DBDekTreeView_TEST1.SelectedObject).Name;
  frmFgosAddNew.Label7.Tag:=IK;
  frmFgosAddNew.Read();
  if ((frmFgosAddNew.ShowModal() = mrOk) or (frmFgosAddNew.bbApply.Tag = 1)) then
    begin
      TGeneralController.Instance.CloseLockupCB(@dbcbTypeCompetence);
      dbcbTypeCompetence.KeyValue:=TFgosController.Instance.getTypeCompetence(@dbcbTypeCompetence.ListSource.DataSet, true);
     // dbcbTypeCompetence.ListSource.DataSet.Open;
      dbdtDate.Value:= frmFgosAddNew.dbdtDate.Value;
      Label19.Caption:= frmFgosAddNew.eNum.Text;
      Label16.Caption:= frmFgosAddNew.Edit6.Text;
      Label5.Caption:= frmFgosAddNew.Edit1.Text;
      Label15.Caption:= frmFgosAddNew.Edit2.Text;
      Label20.Caption:= frmFgosAddNew.Edit3.Text;
      Label21.Caption:= frmFgosAddNew.Edit4.Text;
      Label10.Caption:= frmFgosAddNew.Edit5.Text;
      DecodeDate(dbdtDate.Value,a,b,c);
      num:= StrToInt(Label19.Caption);
      dsFgosSpecYearNum.DataSet:=TFgosController.Instance.getFgosBySpecYearNum(IK,a,num);
      FgosID:=dsFgosSpecYearNum.DataSet.FieldByName('IDGos').Value;
    end;
finally
  frmFgosAddNew.Free;
end;
end;

procedure TfmFgos.ActionAddFgosUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := ((FgosID = NULL)or(FgosID = 0));
end;

procedure TfmFgos.dbcbTypeCompetenceChange(Sender: TObject);
begin
  if dbcbTypeCompetence.KeyValue<>NULL then
  begin
      dsGetCompetence.DataSet.Close;
    (dsGetCompetence.DataSet as TADODataSet).CommandText := 'SELECT ik_competence,zhach_competence,short_Name '+
       ' FROM Competence C where C.ik_type_competence='+ IntToStr(dbcbTypeCompetence.Value)+
       ' and IDGos='+IntToStr(FgosID);
      dsGetCompetence.DataSet.Open;
  end;
end;

destructor TfmFgos.Destroy;
begin
  if Assigned(dsGetCompetence.DataSet) then
  begin
    dsGetCompetence.DataSet.Close;
    dsGetCompetence.DataSet.Free;
  end;
  inherited;
end;

end.
