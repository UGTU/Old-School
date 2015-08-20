unit uUchPlanEditAuditorVZ;
 {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, StdCtrls, Buttons, ExtCtrls, ActnList, ADODB, DB,
  Mask, DBCtrlsEh, DBGridEh, DBLookupEh, UchPlanController, GeneralController,
  Grids, GridsEh, ComCtrls, ToolWin, ImgList, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, DBAxisGridsEh, System.Actions;

type
  TfrmEditAuditorVZ = class(TfrmBaseDialog)
    dsAudContent: TDataSource;
    actAdd: TAction;
    actRem: TAction;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    Panel3: TPanel;
    Bevel5: TBevel;
    Bevel3: TBevel;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolBar2: TToolBar;
    ToolButton2: TToolButton;
    ToolBar3: TToolBar;
    ToolButton3: TToolButton;
    actSetDefaultWeekCount: TAction;
    procedure actSpravExecute(Sender: TObject);
    procedure dsAudContentUpdateData(Sender: TObject);
    procedure actRemUpdate(Sender: TObject);
    procedure actAddUpdate(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actRemExecute(Sender: TObject);
    procedure dsAudContentStateChange(Sender: TObject);
    procedure actSetDefaultWeekCountExecute(Sender: TObject);
  private
    fSemNumber, fDefaultKaf: integer;
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    destructor Destroy; override;
    procedure Read(defaultKafIK, DiscInUchPlanIK, semNumber:integer);
  end;

var
  frmEditAuditorVZ: TfrmEditAuditorVZ;

implementation

uses uUchPlanAddDisc;


{$R *.dfm}

function TfrmEditAuditorVZ.DoApply: boolean;
begin
  Result:= TUchPlanController.Instance.SaveAuditorVZ(fSemNumber, fDefaultKaf);
end;

function TfrmEditAuditorVZ.DoCancel: boolean;
begin
    case (Application.MessageBox('Сохранить внесенные изменения?','Изменение параметров дисциплины учебного плана',MB_YESNOCANCEL)) of
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

procedure TfrmEditAuditorVZ.Read(defaultKafIK, DiscInUchPlanIK, semNumber: integer);
begin
  Caption:= Caption + IntToStr(semNumber);
  fSemNumber:= semNumber;
  fDefaultKaf:= defaultKafIK;
  dsAudContent.DataSet:= TUchPlanController.Instance.LoadAuditorVZ(DiscInUchPlanIK, fSemNumber);
  IsModified:= false;
end;

procedure TfrmEditAuditorVZ.actSetDefaultWeekCountExecute(Sender: TObject);
begin
  dsAudContent.DataSet.Edit;
  dsAudContent.DataSet.FieldByName('week_count').AsInteger:= TUchPlanController.Instance.GetDefaultSemesterWeekCount(fSemNumber);
  dsAudContent.DataSet.Post;
end;

procedure TfrmEditAuditorVZ.actSpravExecute(Sender: TObject);
var
  isMod: boolean;
begin
  IsMod:= IsModified;
  inherited;

  IsModified:= isMod;
end;

procedure TfrmEditAuditorVZ.dsAudContentUpdateData(Sender: TObject);
begin
  inherited;
  IsModified:= true;
end;

destructor TfrmEditAuditorVZ.Destroy;
begin
  if dsAudContent.DataSet <> nil then
    if dsAudContent.DataSet.Active then
      dsAudContent.DataSet.Close;
  inherited;
end;

procedure TfrmEditAuditorVZ.actRemUpdate(Sender: TObject);
begin
  if dsAudContent.DataSet <> nil then
  begin
    if (dsAudContent.DataSet.Active) then
      (Sender as TAction).Enabled:= dsAudContent.DataSet.RecordCount > 0
    else (Sender as TAction).Enabled:= false;
  end
  else (Sender as TAction).Enabled:= false;
end;

procedure TfrmEditAuditorVZ.actAddUpdate(Sender: TObject);
begin
  if dsAudContent.DataSet <> nil then
    (Sender as TAction).Enabled:= dsAudContent.DataSet.Active
  else (Sender as TAction).Enabled:= false;
end;

procedure TfrmEditAuditorVZ.actAddExecute(Sender: TObject);
begin
  dsAudContent.DataSet.Insert;
  dsAudContent.DataSet.FieldByName('ik_kaf').Value:= fDefaultKaf;
  dsAudContent.DataSet.FieldByName('week_count').AsInteger:= TUchPlanController.Instance.GetDefaultSemesterWeekCount(fSemNumber);
end;

procedure TfrmEditAuditorVZ.actRemExecute(Sender: TObject);
begin
  dsAudContent.DataSet.Delete;
  IsModified:= true;
end;

procedure TfrmEditAuditorVZ.dsAudContentStateChange(Sender: TObject);
begin
  inherited;
  IsModified:= true;
end;

end.
