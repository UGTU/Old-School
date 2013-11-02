unit uNagruzkaDistributedDuty;
  {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, GridsEh, DBGridEh,
  DB, ImgList, ComCtrls, ToolWin, Mask, DBCtrlsEh, DBLookupEh;

type
  TfrmNagruzkaDistributedDuty = class(TfrmBaseDialog)
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    Image1: TImage;
    Panel3: TPanel;
    Bevel3: TBevel;
    dsDistributedLoad: TDataSource;
    actDelNagr: TAction;
    actSecureNagr: TAction;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ImageList1: TImageList;
    ToolBar2: TToolBar;
    ToolButton2: TToolButton;
    Bevel4: TBevel;
    Panel5: TPanel;
    Label10: TLabel;
    Label9: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    ToolBar3: TToolBar;
    ToolButton3: TToolButton;
    actEditNagr: TAction;
    Image9: TImage;
    Label3: TLabel;
    procedure actDelNagrExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actSecureNagrExecute(Sender: TObject);
    procedure actEditNagrExecute(Sender: TObject);
    procedure actDelNagrUpdate(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure Label3MouseEnter(Sender: TObject);
    procedure Label3MouseLeave(Sender: TObject);
    procedure Label3Click(Sender: TObject);
  private
    fPlanIK, fYearIK, fSemIK, fDiscIK, fPotokSemIK, fKafIK: integer;
    fAllHour, fDistrHour: double;
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    procedure CalcHour;
    procedure Read(PlanIK, YearIK, SemIK, DiscIK, PotokSemIK, KafIK: integer; APlanHour: double);
    property AllHour: double read fAllHour write fAllHour;
    property DistrHour: double read fDistrHour write fDistrHour;
  end;

var
  frmNagruzkaDistributedDuty: TfrmNagruzkaDistributedDuty;

implementation

uses NagruzkaController, GeneralController, uNagruzkaDiscToTeacher,
  uNagruzkaSelectTeacher, Math;

{$R *.dfm}

{ TfrmNagruzkaDistributedDuty }

procedure TfrmNagruzkaDistributedDuty.actDelNagrExecute(Sender: TObject);
begin
  TNagruzkaController.PlanNagruzka.DeleteVidZanyatFromTeacherPlanNagr(dsDistributedLoad.DataSet.FieldByName('ik_id_prepod').AsInteger, fPlanIK, fDiscIK, fPotokSemIK, dsDistributedLoad.DataSet.FieldByName('ik_vid_zanyat').AsInteger, dsDistributedLoad.DataSet.FieldByName('ik_vid_nagruzki').AsInteger);
  if dsDistributedLoad.DataSet.Active then dsDistributedLoad.DataSet.Close;
  dsDistributedLoad.DataSet:= TNagruzkaController.PlanNagruzka.GetDistributedNagr(fPlanIK, fDiscIK, fPotokSemIK);
  CalcHour;
  Tag:= 4;
end;

procedure TfrmNagruzkaDistributedDuty.actDelNagrUpdate(Sender: TObject);
begin
  if dsDistributedLoad.DataSet <> nil then
  begin
    if dsDistributedLoad.DataSet.Active then
      (Sender as TAction).Enabled:= dsDistributedLoad.DataSet.RecordCount > 0
    else (Sender as TAction).Enabled:= false;
  end
  else (Sender as TAction).Enabled:= false;
end;

procedure TfrmNagruzkaDistributedDuty.actEditNagrExecute(Sender: TObject);
var
  temp: TfrmNagruzkaDiscToTeacher;
begin
  temp:= TfrmNagruzkaDiscToTeacher.CreateDialog(nil, Connection, nil);
  temp.IK:= dsDistributedLoad.DataSet.FieldByName('ik_id_prepod').AsInteger;
  temp.Read(fPlanIK, fYearIK, fSemIK);
  temp.SpeedButton5.Visible:= false;
  temp.dbcbDisc.KeyValue:= fDiscIK;
  temp.dbcbPotok.KeyValue:= fPotokSemIK;
  if (temp.ShowModal() = mrOk) or (temp.bbApply.Tag = 1) then
  begin
    if dsDistributedLoad.DataSet.Active then dsDistributedLoad.DataSet.Close;
    dsDistributedLoad.DataSet:= TNagruzkaController.PlanNagruzka.GetDistributedNagr(fPlanIK, fDiscIK, fPotokSemIK);
    CalcHour;
    Tag:= 4;
  end;
  temp.Free;
end;

procedure TfrmNagruzkaDistributedDuty.actSecureNagrExecute(Sender: TObject);
var
  tempST: TfrmNagruzkaSelectTeacher;
  tempDT: TfrmNagruzkaDiscToTeacher;
begin
  tempST:= TfrmNagruzkaSelectTeacher.CreateDialog(nil, Connection, nil);
  try
    tempST.Read(fKafIK, fYearIK, fSemIK);
    if (tempST.ShowModal = mrOk) then
    begin
      tempDT:= TfrmNagruzkaDiscToTeacher.CreateDialog(nil, Connection, nil);
      try
        tempDT.IK:= tempST.dbcbWorkType.KeyValue;
        tempDT.Read(fPlanIK, fYearIK, fSemIK);
        tempDT.dbcbDisc.KeyValue:= fDiscIK;
        tempDT.dbcbPotok.KeyValue:= fPotokSemIK;
        if (tempDT.ShowModal() = mrOk) or (tempDT.bbApply.Tag = 1) then
        begin
          if dsDistributedLoad.DataSet.Active then dsDistributedLoad.DataSet.Close;
          dsDistributedLoad.DataSet:= TNagruzkaController.PlanNagruzka.GetDistributedNagr(fPlanIK, fDiscIK, fPotokSemIK);
          CalcHour;
          Tag:= 4;
        end;
      finally
        if Assigned(tempDT) then tempDT.Free;
      end;
    end;
  finally
    if Assigned(tempST) then tempST.Free;
  end;
end;

procedure TfrmNagruzkaDistributedDuty.CalcHour;
begin
  dsDistributedLoad.DataSet.DisableControls;
  dsDistributedLoad.DataSet.First;
  DistrHour:= 0;
  while not dsDistributedLoad.DataSet.Eof do
  begin
    if (DBGridEh1.Canvas.TextWidth(dsDistributedLoad.DataSet.FieldByName('cList_calc_unit').AsString) > DBGridEh1.Columns.Items[2].Width) then
      DBGridEh1.RowHeight:= (DBGridEh1.Canvas.TextHeight('H') + 2)*ceil(DBGridEh1.Canvas.TextWidth(dsDistributedLoad.DataSet.FieldByName('cList_calc_unit').AsString)/DBGridEh1.Columns.Items[2].Width);
    DistrHour:= DistrHour + dsDistributedLoad.DataSet.FieldByName('all_distr_hour').AsFloat;
    dsDistributedLoad.DataSet.Next;
  end;
  Label2.Caption:= FloatToStrF(DistrHour, ffFixed, 10, 2) + ' час.';
  dsDistributedLoad.DataSet.EnableControls;
  actSecureNagr.Enabled:= RoundFloat(DistrHour, 5) < RoundFloat(AllHour, 5);
end;

procedure TfrmNagruzkaDistributedDuty.DBGridEh1DblClick(Sender: TObject);
begin
  if (actEditNagr.Enabled) and (Tag <> 2) then
    actEditNagrExecute(actEditNagr);
end;

procedure TfrmNagruzkaDistributedDuty.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if DBGridEh1.RowHeight > (DBGridEh1.Canvas.TextHeight('H') + 2)*ceil(DBGridEh1.Canvas.TextWidth(dsDistributedLoad.DataSet.FieldByName(Column.FieldName).AsString)/Column.Width) then
  begin
    DBGridEh1.Canvas.FillRect(Rect);
    DBGridEh1.Canvas.TextOut(Rect.Left + round((Column.Width - DBGridEh1.Canvas.TextWidth(dsDistributedLoad.DataSet.FieldByName(Column.FieldName).AsString))/2), Rect.Top + round((DBGridEh1.RowHeight - DBGridEh1.Canvas.TextHeight('B')*ceil(DBGridEh1.Canvas.TextWidth(dsDistributedLoad.DataSet.FieldByName(Column.FieldName).AsString)/Column.Width))/2), dsDistributedLoad.DataSet.FieldByName(Column.FieldName).AsString);
  end;
end;

procedure TfrmNagruzkaDistributedDuty.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    DBGridEh1DblClick(DBGridEh1);
end;

function TfrmNagruzkaDistributedDuty.DoApply: boolean;
begin
  Result:= true;
end;

function TfrmNagruzkaDistributedDuty.DoCancel: boolean;
begin
  Result:= true;
end;

procedure TfrmNagruzkaDistributedDuty.FormCreate(Sender: TObject);
begin
  inherited;
  fAllHour:= 0;
  fDistrHour:= 0;
end;


procedure TfrmNagruzkaDistributedDuty.Label3Click(Sender: TObject);
var
  key: word;
begin
  key:= 112;
  FormKeyUp(Self, key, []);
end;

procedure TfrmNagruzkaDistributedDuty.Label3MouseEnter(Sender: TObject);
begin
  Label3.Font.Style:= Label3.Font.Style + [fsUnderline];
end;

procedure TfrmNagruzkaDistributedDuty.Label3MouseLeave(Sender: TObject);
begin
  Label3.Font.Style:= Label3.Font.Style - [fsUnderline];
end;

procedure TfrmNagruzkaDistributedDuty.Read(PlanIK, YearIK, SemIK, DiscIK, PotokSemIK, KafIK: integer; APlanHour: double);
begin
  Label8.Caption:= TNagruzkaController.Directory.GetDiscName(DiscIK);
  Label11.Caption:= TNagruzkaController.Preparation.GetPotokName(PotokSemIK);
  Label10.Caption:= FloatToStrF(APlanHour, ffFixed, 10, 2) + ' час.';
  AllHour:= APlanHour;
  dsDistributedLoad.DataSet:= TNagruzkaController.PlanNagruzka.GetDistributedNagr(PlanIK, DiscIK, PotokSemIK);
  fPlanIK:= PlanIK;
  fDiscIK:= DiscIK;
  fPotokSemIK:= PotokSemIK;
  fKafIK:= KafIK;
  fYearIK:= YearIK;
  fSemIK:= SemIK;
  if Tag <> 1 then
  begin
    Caption:= Caption + ' - [Режим ограниченной функциональности]';
    ToolBar1.Visible:= false;
    ToolBar3.Visible:= false;
    ToolBar2.Top:= 0;
  end;
  CalcHour;
end;

end.
