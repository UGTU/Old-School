unit uFgosSformyrCompetence;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, DBGridEh, Grids, DBGrids, DBCtrls, StdCtrls, DBCtrlsEh,
  Mask, DBLookupEh, Buttons, ExtCtrls, ComCtrls, ToolWin, ImgList, ActnList,
  GeneralController, uFgosController, DBTVSpecobj, DB, uDMFgos, GridsEh,
  UchPlanController, ADODB;

type
  TfrmFgosSformyrCompetence = class(TfrmBaseDialog)
    Panel2: TPanel;
    dbcbLevelComp2: TDBLookupComboboxEh;
    dbcbTypeLevelSformyr: TDBLookupComboboxEh;
    Label3: TLabel;
    Label4: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    DBGridEh2: TDBGridEh;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolBar5: TToolBar;
    ToolButton2: TToolButton;
    ToolBar6: TToolBar;
    ToolButton3: TToolButton;
    actLvlSformyr: TActionList;
    actAddSformyr: TAction;
    actEditSformyr: TAction;
    actDellSformyr: TAction;
    dsLvlSformyr: TDataSource;
    imgCmptnc: TImageList;
    procedure actAddSformyrExecute(Sender: TObject);
    procedure actDellSformyrExecute(Sender: TObject);
    procedure actEditSformyrExecute(Sender: TObject);
    procedure dsLvlSformyrUpdateData(Sender: TObject);
    procedure dbcbTypeLevelSformyrChange(Sender: TObject);
    procedure dbcbLevelComp2Change(Sender: TObject);
 private
    IDFgos: integer;
    isAlreadyLoad: boolean;
    fIKCompetence: integer;
    fIKTypeCompetence: integer;
    fIKLevelSformyr: integer;
    FID : Integer;
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;

    { Private declarations }
  public
    property Id : Integer read FID write FID;
    function Read: boolean;
    property IKCompetence: integer read  fIKCompetence write fIKCompetence;
    property IKTypeCompetence: integer read fIKTypeCompetence write fIKTypeCompetence;
    property IKLevelSformyr: integer read fIKLevelSformyr write fIKLevelSformyr;
    { Public declarations }
  end;

var
  frmFgosSformyrCompetence: TfrmFgosSformyrCompetence;

implementation

{$R *.dfm}
 uses uDM, uFgosEditCompetence, uFgos;


function  TfrmFgosSformyrCompetence.Read: boolean;
var FgosIK, year: integer;
    a,b,c:word;
    s:string;
begin
dsLvlSformyr.DataSet:= TGeneralController.Instance.GetNewADODataSet(false);
TGeneralController.Instance.InitializeLockupCB(@dbcbLevelComp2, 'ik_level_competence', 'name_level_competence');
TGeneralController.Instance.InitializeLockupCB(@dbcbTypeLevelSformyr, 'ik_type_level_sformyr', 'name_type_level_sformyr');
dbcbLevelComp2.KeyValue:=TFgosController.Instance.getLevel_competence(@dbcbLevelComp2.ListSource.DataSet, true);
dbcbTypeLevelSformyr.KeyValue:= TFgosController.Instance.getType_level_sformyr(@dbcbTypeLevelSformyr.ListSource.DataSet, true);
//  IDFgos:=(CallFrame as TfmFgos).FgosID;
  Result:=true;
  isAlreadyLoad:= false;
  IsModified:= true;
end;

function  TfrmFgosSformyrCompetence.DoApply: boolean;
begin
Result:= true;
end;

procedure TfrmFgosSformyrCompetence.actAddSformyrExecute(Sender: TObject);
begin
frmFgosEditCompetence:= TfrmFgosEditCompetence.CreateDialog(Application, Connection, nil);
  try
    frmFgosEditCompetence.Tag:=(sender as TAction).Tag;
    frmFgosEditCompetence.IKLevelCompetence:= dbcbLevelComp2.KeyValue;
    frmFgosEditCompetence.IKCompetence:=fIKCompetence;
    frmFgosEditCompetence.IKTypeLevelSformyr:=dbcbTypeLevelSformyr.KeyValue;
    frmFgosEditCompetence.ID:=2;
   // frmFgosEditCompetence.CallFrame:=self;
    if (frmFgosEditCompetence.Read) then
    begin
      if ((frmFgosEditCompetence.ShowModal()= mrOK) or (frmFgosEditCompetence.bbApply.Tag = 1) )then
        begin
          frmFgosEditCompetence.Close();
         dsLvlSformyr.DataSet.Close;
           (dsLvlSformyr.DataSet as TADODataSet).CommandText := 'SELECT ik_level_sformyr, Value_priznak'+
       ' FROM Level_sformyr L where L.ik_type_level_sformyr= '+
       IntToStr(dbcbTypeLevelSformyr.Value)+' and L.ik_competence='+ IntToStr(fIKCompetence)+
       ' and L.ik_level_competence='+IntToStr(dbcbLevelComp2.Value);
          dsLvlSformyr.DataSet.Open;
        end;
    end;
  finally
  frmFgosEditCompetence.Free;
  end;
end;

procedure TfrmFgosSformyrCompetence.actDellSformyrExecute(Sender: TObject);
begin
 // inherited;
  if (Application.MessageBox(PChar('Вы уверены, что хотите удалить выбранный признак уровня сформированности?'),'Сформированность компетенции',MB_YESNO) = mrYes) then
  begin
  fIKLevelSformyr := dsLvlSformyr.DataSet.FieldByName('ik_level_sformyr').AsInteger;
  if (TFgosController.Instance.DeleteLevelSformyr(fIKLevelSformyr)) then
      begin
        dsLvlSformyr.DataSet.Close;
        dsLvlSformyr.DataSet.Open;
      end;
  end;
end;

procedure TfrmFgosSformyrCompetence.actEditSformyrExecute(Sender: TObject);
begin
  //inherited;
    frmFgosEditCompetence:= TfrmFgosEditCompetence.CreateDialog(Application, Connection, nil);
  try
    frmFgosEditCompetence.Tag:=(sender as TAction).Tag;
    frmFgosEditCompetence.IKLevelCompetence:= dbcbLevelComp2.KeyValue;
    frmFgosEditCompetence.IKCompetence:=fIKCompetence;
    frmFgosEditCompetence.IKTypeLevelSformyr:=dbcbTypeLevelSformyr.KeyValue;
    frmFgosEditCompetence.IKLevelSformyr := dsLvlSformyr.DataSet.FieldByName('ik_level_sformyr').AsInteger;
    frmFgosEditCompetence.Value_priznak := dsLvlSformyr.DataSet.FieldByName('Value_priznak').AsString;
    frmFgosEditCompetence.Tag := 2;
    frmFgosEditCompetence.ID:=2;
    if (frmFgosEditCompetence.Read) then
    begin
      if ((frmFgosEditCompetence.ShowModal()= mrOK) or (frmFgosEditCompetence.bbApply.Tag = 1) )then
        begin
          frmFgosEditCompetence.Close();
          dsLvlSformyr.DataSet.Close;
          dsLvlSformyr.DataSet.Open;
          IsModified:= true;
        end;
    end;
  finally
  frmFgosEditCompetence.Free;
  end;
end;

procedure TfrmFgosSformyrCompetence.dbcbLevelComp2Change(Sender: TObject);
begin
  if dbcbTypeLevelSformyr.KeyValue<>NULL then
  begin
      dsLvlSformyr.DataSet.Close;
    (dsLvlSformyr.DataSet as TADODataSet).CommandText := 'SELECT ik_level_sformyr, Value_priznak'+
       ' FROM Level_sformyr L where L.ik_type_level_sformyr= '+
       IntToStr(dbcbTypeLevelSformyr.Value)+' and L.ik_competence='+ IntToStr(fIKCompetence)+
       ' and L.ik_level_competence='+IntToStr(dbcbLevelComp2.Value);
      dsLvlSformyr.DataSet.Open;
  end;
end;

procedure TfrmFgosSformyrCompetence.dbcbTypeLevelSformyrChange(Sender: TObject);
begin
  if dbcbTypeLevelSformyr.KeyValue<>NULL then
  begin
    dsLvlSformyr.DataSet.Close;
    (dsLvlSformyr.DataSet as TADODataSet).CommandText := 'SELECT ik_level_sformyr, Value_priznak'+
    ' FROM Level_sformyr L where L.ik_type_level_sformyr= '+
    IntToStr(dbcbTypeLevelSformyr.Value)+' and L.ik_competence='+ IntToStr(fIKCompetence)+
    ' and L.ik_level_competence='+IntToStr(dbcbLevelComp2.Value);
    dsLvlSformyr.DataSet.Open;
  end;
end;

function TfrmFgosSformyrCompetence.DoCancel:boolean;
begin
  case (Application.MessageBox('Сохранить внесенные изменения?','Компетенции ФГОС', MB_YESNOCANCEL)) of
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

procedure TfrmFgosSformyrCompetence.dsLvlSformyrUpdateData(Sender: TObject);
begin
  inherited;
  IsModified:=true;
end;

end.
