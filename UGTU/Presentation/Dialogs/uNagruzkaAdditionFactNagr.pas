unit uNagruzkaAdditionFactNagr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, uNagruzkaDep,
  GeneralController, NagruzkaController, UchPlanController, DBGridEh, Mask,
  DBCtrlsEh, DBLookupEh, NagruzkaClasses, ImgList, ComCtrls, ToolWin, GridsEh,
  DB, PlanNagruzkaController, uDM;

type
  TfrmAdditionFactNagr = class(TfrmBaseDialog)
    Panel2: TPanel;
    Label1: TLabel;
    lblPrepod: TLabel;
    Label2: TLabel;
    dbcbDisc: TDBLookupComboboxEh;
    lblError: TLabel;
    Panel4: TPanel;
    Panel5: TPanel;
    Bevel3: TBevel;
    dbgVidZanyatPlan: TDBGridEh;
    Panel6: TPanel;
    Label10: TLabel;
    Label12: TLabel;
    Panel9: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolBar2: TToolBar;
    ToolBar3: TToolBar;
    ToolButton3: TToolButton;
    ImageList1: TImageList;
    actAddString: TAction;
    actDelString: TAction;
    dsPlanNagr: TDataSource;
    procedure actAddStringUpdate(Sender: TObject);
    procedure actDelStringUpdate(Sender: TObject);
    procedure actDelStringExecute(Sender: TObject);
    procedure actAddStringExecute(Sender: TObject);
    procedure dbcbDiscKeyValueChanged(Sender: TObject);
    procedure dsPlanNagrDataChange(Sender: TObject; Field: TField);
    procedure dsPlanNagrUpdateData(Sender: TObject);
  private
    { Private declarations }
    FTeacherIK: integer;
    FPlanIK: integer;
    fLastVZIK: integer;
    FAddition: TAdditionFactItem;
    procedure UpdatePickListForVN;
    procedure UpdateModifiedState;
    procedure CalcHour;
    procedure SetDisc(aDiscIK: integer);
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    property TeacherIK: integer read FTeacherIK write FTeacherIK;
    property PlanIK: integer read FPlanIK write FPlanIK;
    property DiscIK: integer write SetDisc;
    { Public declarations }
    procedure Read;
  end;

var
  frmAdditionFactNagr: TfrmAdditionFactNagr;

implementation

{$R *.dfm}

{ TfrmAdditionFactNagr }


procedure TfrmAdditionFactNagr.actAddStringExecute(Sender: TObject);
begin
  dsPlanNagr.DataSet.First;
  dsPlanNagr.DataSet.Insert;
  IsModified:= true;
end;

procedure TfrmAdditionFactNagr.actAddStringUpdate(Sender: TObject);
begin
  if dsPlanNagr.DataSet <> nil then
    (Sender as TAction).Enabled:= dsPlanNagr.DataSet.Active
  else
    (Sender as TAction).Enabled:= false;
end;

procedure TfrmAdditionFactNagr.actDelStringExecute(Sender: TObject);
begin
  dsPlanNagr.DataSet.Delete;
  IsModified:= true;
end;

procedure TfrmAdditionFactNagr.actDelStringUpdate(Sender: TObject);
begin
  if (dsPlanNagr.DataSet <> nil) then
  begin
    if (dsPlanNagr.DataSet.Active) then
      (Sender as TAction).Enabled:= dsPlanNagr.DataSet.RecordCount > 0
    else (Sender as TAction).Enabled:= false;
  end
  else (Sender as TAction).Enabled:= false;

end;



procedure TfrmAdditionFactNagr.CalcHour;
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
      allHour:= allHour + dsPlanNagr.DataSet.FieldByName('f_all_fact_hour').AsFloat;
      dsPlanNagr.DataSet.Next;
    end;
    dsPlanNagr.DataSet.GotoBookmark(book);
    Label10.Caption:= FloatToStrF(allHour, ffFixed, 10, 2) + ' час.';
  finally
    dsPlanNagr.DataSet.EnableControls;
  end;

end;

procedure TfrmAdditionFactNagr.dbcbDiscKeyValueChanged(Sender: TObject);
var allHour: double;
begin
  if (dbcbDisc.KeyValue <> NULL) then
  begin
    dsPlanNagr.DataSet :=  TNagruzkaController.FactNagruzka.LoadAdditionTeacherFact(FPlanIK, FTeacherIK, dbcbDisc.KeyValue,  allHour);
    Label10.Caption := FloatToStr(allHour);
  end;
end;

function TfrmAdditionFactNagr.DoApply: boolean;
begin
  Result:= TNagruzkaController.FactNagruzka.SaveAdditionFact(FTeacherIK, FPlanIK, dbcbDisc.KeyValue);
end;

function TfrmAdditionFactNagr.DoCancel: boolean;
begin
  Result:= false;
  case (Application.MessageBox('Сохранить внесенные изменения?',PChar(Caption), MB_YESNOCANCEL)) of
    mrYes: OK;
    mrNo: Result:= true;
  end;
end;

procedure TfrmAdditionFactNagr.dsPlanNagrDataChange(Sender: TObject;
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

procedure TfrmAdditionFactNagr.dsPlanNagrUpdateData(Sender: TObject);
begin
  IsModified:= true;
  CalcHour;
end;

procedure TfrmAdditionFactNagr.Read;
begin
  fLastVZIK:= -1;
  TGeneralController.Instance.InitializeLockupCB(@dbcbDisc, 'ik_disc', 'name_disc');

  TUchPlanController.Instance.getAllDisciplines(@dbcbDisc.ListSource.DataSet, false);
  if IK<>0 then
  begin
     FAddition := TAdditionFactItem.Create(IK);
     dbcbDisc.KeyValue := FAddition.DiscIK;
  end
       else
       begin
         FAddition := TAdditionFactItem.Create(FPlanIK,FTeacherIK);
       end;
end;

procedure TfrmAdditionFactNagr.SetDisc(aDiscIK: integer);
begin
  dbcbDisc.KeyValue := aDiscIK;
end;

procedure TfrmAdditionFactNagr.UpdateModifiedState;
var errCode, colGr: integer;
begin
   errCode := 0;
    IsModified := false;
    if dbcbDisc.KeyValue = NULL then  errCode := 1;
   case errCode of
   1: lblError.Caption := '*Выберите дисциплину';
   else begin lblError.Caption := ''; IsModified := true; end;
   end;

end;

procedure TfrmAdditionFactNagr.UpdatePickListForVN;
var
  i: integer;
begin
  if dbcbDisc.KeyValue <> NULL then

    for i := 0 to dbgVidZanyatPlan.Columns.Count - 1 do
      if dbgVidZanyatPlan.Columns.Items[i].FieldName = 'name_vid_nagruzki' then
      begin
        TNagruzkaController.PlanNagruzka.FullPickListForVidNagruzki(dbcbDisc.KeyValue, dbcbDisc.ListSource.DataSet.FieldByName('ik_type_disc').AsInteger, dbgVidZanyatPlan.DataSource.DataSet.FieldByName('ik_vid_zanyat').AsInteger, dbgVidZanyatPlan.Columns.Items[i].PickList);
        break;
      end;
end;

end.
