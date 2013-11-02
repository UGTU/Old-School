unit uFgosAddStructCompetence;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, DBGridEh, Grids, DBGrids, DBCtrls, StdCtrls, DBCtrlsEh,
  Mask, DBLookupEh, Buttons, ExtCtrls, ComCtrls, ToolWin, ImgList, ActnList,
  GeneralController, uFgosController, DBTVSpecobj, DB, uDMFgos, GridsEh,
  UchPlanController, ADODB;

type
  TfrmFgosAddStructCompetence = class(TfrmBaseDialog)
    Label2: TLabel;
    dbcbLevelComp: TDBLookupComboboxEh;
    Panel3: TPanel;
    DBGridEh1: TDBGridEh;
    Panel4: TPanel;
    ToolBar2: TToolBar;
    ToolButton6: TToolButton;
    ToolBar3: TToolBar;
    ToolButton7: TToolButton;
    ToolBar4: TToolBar;
    ToolButton8: TToolButton;
    Panel2: TPanel;
    dsGetContentStrCmptnc: TDataSource;
    actListStructCmptnc: TActionList;
    actAddContentDescription: TAction;
    actDelContentDescription: TAction;
    actEditContentDescription: TAction;
    imgCmptnc: TImageList;
    Panel5: TPanel;
    procedure actAddContentDescriptionExecute(Sender: TObject);
    procedure actDelContentDescriptionExecute(Sender: TObject);
    procedure actEditContentDescriptionExecute(Sender: TObject);
    procedure dbcbLevelCompChange(Sender: TObject);
    procedure dsGetContentStrCmptncUpdateData(Sender: TObject);
private
    IDFgos: integer;
    fIKCompetence: integer;
    fIKTypeCompetence: integer;
    fTextComp: string;
    fShortName: string;
    fIKStr_Cmptnc: integer;
    FID : Integer;
    isAlreadyLoad: boolean;
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;

    { Private declarations }
  public
//    constructor Create(AOwner : TComponent);override;
    property Id : Integer read FID write FID;
    function Read: boolean;
    property IKCompetence: integer read  fIKCompetence write fIKCompetence;
    property IKTypeCompetence: integer read fIKTypeCompetence write fIKTypeCompetence;
    property TextComp: string read fTextComp write fTextComp;
    property ShortName: string read  fShortName write fShortName;
    property IKStr_Cmptnc: integer read fIKStr_Cmptnc write fIKStr_Cmptnc;
  end;

var
  frmFgosAddStructCompetence: TfrmFgosAddStructCompetence;

implementation

{$R *.dfm}
uses uDM, uFgosEditCompetence, uFgos;

function  TfrmFgosAddStructCompetence.Read: boolean;
var FgosIK, year: integer;
    a,b,c:word;
    s:string;
begin
dsGetContentStrCmptnc.DataSet:= TGeneralController.Instance.GetNewADODataSet(false);
TGeneralController.Instance.InitializeLockupCB(@dbcbLevelComp, 'ik_level_competence', 'name_level_competence');
dbcbLevelComp.KeyValue:=TFgosController.Instance.getLevel_competence(@dbcbLevelComp.ListSource.DataSet, true);
//  IDFgos:=(CallFrame as TfmFgos).FgosID;
  Result:=true;
  isAlreadyLoad:= false;
  IsModified:= false;
end;

function  TfrmFgosAddStructCompetence.DoApply: boolean;
begin
Result:= true;
end;

procedure TfrmFgosAddStructCompetence.actAddContentDescriptionExecute(Sender: TObject);
begin
 inherited;

frmFgosEditCompetence:= TfrmFgosEditCompetence.CreateDialog(Application, Connection, nil);
  try
    frmFgosEditCompetence.Tag:=(sender as TAction).Tag;
    frmFgosEditCompetence.IKLevelCompetence:= dbcbLevelComp.KeyValue;
    frmFgosEditCompetence.IKCompetence:=fIKCompetence;
    frmFgosEditCompetence.ID:=1;
   // frmFgosEditCompetence.CallFrame:=self;
    if (frmFgosEditCompetence.Read) then
    begin
      if ((frmFgosEditCompetence.ShowModal()= mrOK) or (frmFgosEditCompetence.bbApply.Tag = 1) )then
        begin
          frmFgosEditCompetence.Close();
          dsGetContentStrCmptnc.DataSet.Close;

          (dsGetContentStrCmptnc.DataSet as TADODataSet).CommandText := 'SELECT ik_structure_competence, description_content'+
       ' FROM Structure_competence S where S.ik_level_competence= '+
       IntToStr(dbcbLevelComp.Value)+' and S.ik_competence='+ IntToStr(fIKCompetence);
         dsGetContentStrCmptnc.DataSet.Open;
        end;
    end;
  finally
  frmFgosEditCompetence.Free;
  end;
 end;


procedure TfrmFgosAddStructCompetence.actDelContentDescriptionExecute(Sender: TObject);
begin
 if (Application.MessageBox(PChar('Вы уверены, что хотите удалить выбранное содержание составляющей?'),'Составляющие компетенции',MB_YESNO) = mrYes) then
  begin
  fIKStr_Cmptnc := dsGetContentStrCmptnc.DataSet.FieldByName('ik_structure_competence').AsInteger;
  if (TFgosController.Instance.DeleteStructureCompetence(fIKStr_Cmptnc)) then
      begin
        dsGetContentStrCmptnc.DataSet.Close;
        dsGetContentStrCmptnc.DataSet.Open;
      end;
  end;
end;

procedure TfrmFgosAddStructCompetence.actEditContentDescriptionExecute(Sender: TObject);
begin
//  inherited;
 inherited;
   frmFgosEditCompetence:= TfrmFgosEditCompetence.CreateDialog(Application, Connection, nil);
  try
    //frmFgosAddCompetence.IK:=IK;
    //dsGetContentStrCmptnc
    frmFgosEditCompetence.IKLevelCompetence:= dbcbLevelComp.KeyValue;
    frmFgosEditCompetence.IKCompetence:=fIKCompetence;
    frmFgosEditCompetence.IKStr_Cmptnc := dsGetContentStrCmptnc.DataSet.FieldByName('ik_structure_competence').AsInteger;
    frmFgosEditCompetence.Cont_descr := dsGetContentStrCmptnc.DataSet.FieldByName('description_content').AsString;
    frmFgosEditCompetence.Tag := 2;
    frmFgosEditCompetence.ID:=1;

    if (frmFgosEditCompetence.Read) then
    begin
      if ((frmFgosEditCompetence.ShowModal()= mrOK) or (frmFgosEditCompetence.bbApply.Tag = 1) )then
        begin
          frmFgosEditCompetence.Close();
          dsGetContentStrCmptnc.DataSet.Close;
          dsGetContentStrCmptnc.DataSet.Open;
          IsModified:= true;
        end;
    end;
  finally
  frmFgosEditCompetence.Free;
  end;
end;

procedure TfrmFgosAddStructCompetence.dbcbLevelCompChange(Sender: TObject);
begin
  inherited;
  if dbcbLevelComp.KeyValue<> NULL then
  begin
    dsGetContentStrCmptnc.DataSet.Close;
    (dsGetContentStrCmptnc.DataSet as TADODataSet).CommandText := 'SELECT ik_structure_competence, description_content'+
    ' FROM Structure_competence S where S.ik_level_competence= '+
    IntToStr(dbcbLevelComp.Value)+' and S.ik_competence='+ IntToStr(fIKCompetence);
    dsGetContentStrCmptnc.DataSet.Open;
  end;
end;

function TfrmFgosAddStructCompetence.DoCancel:boolean;
begin
  case (Application.MessageBox('Сохранить внесенные изменения?','Структура компетенции', MB_YESNOCANCEL)) of
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

procedure TfrmFgosAddStructCompetence.dsGetContentStrCmptncUpdateData(
  Sender: TObject);
begin
IsModified:=true;
end;

end.
