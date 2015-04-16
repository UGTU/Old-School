unit uUchPlanAddDisc;
   {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, StdCtrls, Buttons, ExtCtrls, ADODB, DB, UchPlanController,
  Grids,uUchPlan, DBGrids, ActnList, AppEvnts, Mask, DBCtrlsEh, DBGridEh,
  DBLookupEh, GeneralController, ImgList, ComCtrls, ToolWin, System.Actions;

type
  PEdit = ^TEdit;

  TfrmUchPlanAddDisc = class(TfrmBaseDialog)
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    pnlDiscProp: TPanel;
    Panel4: TPanel;
    sgDisc: TStringGrid;
    ScrollBox1: TScrollBox;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Edit6: TDBEditEh;
    dbcbCklDisc: TDBLookupComboboxEh;
    dbcbGrpDisc: TDBLookupComboboxEh;
    dbcbDisc: TDBLookupComboboxEh;
    dbcbKaf: TDBLookupComboboxEh;
    Panel5: TPanel;
    Timer1: TTimer;
    Label13: TLabel;
    lGroupVibor: TLabel;
    dbeGroupVibor: TDBEditEh;
    cbOtherUchPl: TCheckBox;
    imgCmptnc: TImageList;
    actListCmptnc: TActionList;
    actCmptnc: TAction;
    Label14: TLabel;
    dbcbPdgrpDisc: TDBLookupComboboxEh;
    actAddDiscRelation: TAction;
    Label17: TLabel;
    dsSpclz: TDataSource;
    pnlProfile: TPanel;
    dbcbSpclz: TDBLookupComboboxEh;
    lblSpclz: TLabel;
    pnlMain: TPanel;
    allCompetence: TLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    edtHoursGos: TDBEditEh;
    Edit7: TDBEditEh;
    Label11: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label7: TLabel;
    lblCompetence: TLabel;
    lblNotice: TLabel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    Button1: TButton;
    procedure sgDiscDblClick(Sender: TObject);
    procedure sgDiscSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure edtHoursGosExit(Sender: TObject);
    procedure edtHoursGosKeyPress(Sender: TObject; var Key: Char);
    procedure sgDiscKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgDiscMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sgDiscGetEditMask(Sender: TObject; ACol, ARow: Integer;
      var Value: String);
    procedure sgDiscDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Edit6Exit(Sender: TObject);
    procedure Edit6Enter(Sender: TObject);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure actSpravExecute(Sender: TObject);
    procedure dbcbGrpDiscKeyValueChanged(Sender: TObject);
    procedure Edit7Exit(Sender: TObject);
    procedure edtHoursGosEnter(Sender: TObject);
    procedure Edit7Enter(Sender: TObject);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure Edit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure sgDiscGetEditText(Sender: TObject; ACol, ARow: Integer;
      var Value: String);
    procedure sgDiscExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbcbDiscKeyValueChanged(Sender: TObject);
    procedure actSpravUpdate(Sender: TObject);
    procedure actCmptncExecute(Sender: TObject);
    procedure actAddDiscRelationExecute(Sender: TObject);
    procedure dbcbSpclzMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    isCellTextChange: boolean;
    curRow, curCol: integer;
    fixRow: TStringList;
    fCurrentDiscType: integer;
    fSemesterStr: string;
    fHour: integer;
    fIndividHour: integer;
    isHourGosMod: boolean;
    isIndividMod: boolean;
    fCompetenceList: TStringList;
    fStrCmptncList: TStringList;
    fDiscRelationList: TStringList;
    namedisc: string;
    isMerge: bool;
    fEdIzm: integer;
    procedure FillColumnValues;
    procedure SetDiscType(discType: integer);
    procedure CalcSRS;
   // procedure SetHourGos(const Value: integer);
    procedure SetIndividHour(const Value: integer);
    procedure LoadCompetence;
    procedure LoadRelation;
    procedure SetCompetenceList(const Value: TStringList);
    procedure SetStrCmptncList (const Value: TStringList);
    procedure SetDiscRelationList (const Value: TStringList);
    procedure CheckSimilarDiscipline;
    function GetTimeByEdIzm(aHours: string; aEdIzm: integer): integer;

    property CompetenceList: TStringList read fCompetenceList write SetCompetenceList;
    property StrCmptncList: TStringList read fStrCmptncList write SetStrCmptncList;
    property DiscRelationList: TStringList read fDiscRelationList write SetDiscRelationList;
  //  procedure SetDiplomProject(isDiplom: boolean);
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    iUchPlan:integer;
    VidGos: integer;
    SpecIK: integer;
    SpclzIK: integer;
    GrupIK: integer;
    TypePlan: integer;
    nameSpclz: string;  //именование Профиль/Программа/Специализация
   // property iHour_gos: integer read fHourGos write SetHourGos;
    property iIndivid: integer read fIndividHour write SetIndividHour;

    procedure Read(SemesterStr: string);
    destructor Destroy; override;
  end;

var
  frmUchPlanAddDisc: TfrmUchPlanAddDisc;

implementation

{$R *.dfm}

uses uUchPlanEditControlVZ, uUchPlanEditAuditorVZ, uBaseFrame, uAddDiscCompetence, uAddDiscRelation,
     ConstantRepository, uDM;

{ TfrmUchPlanAddDisc }

procedure TfrmUchPlanAddDisc.Read(SemesterStr: string);
var
  i:integer;
  tempStr: string;

begin
  //fHour:= 0;
  iIndivid:= 0;
  curRow:= -1;
  curCol:= -1;
  tempStr:= '';
  fCurrentDiscType:= -1;
  fSemesterStr:= SemesterStr;
  sgDisc.Cells[0,0]:= 'Вид занятий';
  sgDisc.Cells[1,0]:= 'Значение';
  sgDisc.Cells[2,0]:= 'Кафедра';


  isCellTextChange:= false;
  if fixRow <> nil then fixRow.Clear
    else fixRow:= TStringList.Create;

  fCompetenceList := TStringList.Create;
  fStrCmptncList:=  TStringList.Create;
  fDiscRelationList:= TStringList.Create;
  TGeneralController.Instance.InitializeLockupCB(@dbcbCklDisc, 'IK_ckl_disc', 'name_ckl_disc');
  TUchPlanController.Instance.getAllDisciplineCyclesWithoutAll(@dbcbCklDisc.ListSource.DataSet, VidGos, false);
  TGeneralController.Instance.InitializeLockupCB(@dbcbGrpDisc, 'IK_grp_disc', 'name_grp_disc');
  TUchPlanController.Instance.getAllDisciplineGroupsWithoutAll(@dbcbGrpDisc.ListSource.DataSet, VidGos, false);
  TGeneralController.Instance.InitializeLockupCB(@dbcbDisc, 'iK_disc', 'name_disc');
  TUchPlanController.Instance.getAllDisciplines(@dbcbDisc.ListSource.DataSet, false);
  TGeneralController.Instance.InitializeLockupCB(@dbcbPdgrpDisc,'iK_pdgrp_disc', 'name_pdgrp_disc');
  TUchPlanController.Instance.getAllPodGroups(@dbcbPdgrpDisc.ListSource.DataSet, false);
  TGeneralController.Instance.InitializeLockupCB(@dbcbKaf, 'ik_kaf', 'name_kaf');
  TUchPlanController.Instance.getAllDepartments(@dbcbKaf.ListSource.DataSet, false);

  //Профиль дисциплин будет только для ФГОС3------------------------------------
  pnlProfile.Visible := VidGos=FGOS3;
  if VidGos=FGOS3 then
  begin
    lblSpclz.Caption := nameSpclz + ' дисциплины:';
    TGeneralController.Instance.InitializeLockupCB(@dbcbSpclz, 'ik_spclz', 'cName_spclz_short');
    if (GrupIK = 0) then
       TUchPlanController.Instance.getCurrentSpecializations(@dbcbSpclz.ListSource.DataSet, SpecIK, false)
       else TUchPlanController.Instance.getSpecializationsForGrup(@dbcbSpclz.ListSource.DataSet, GrupIK);
    dbcbSpclz.KeyValue := SpclzIK;
    //dbcbSpclz.Enabled := (GrupIK = 0)or(IK = -1);   //если дисциплина группы, то не давать менять профиль
  end;
  //----------------------------------------------------------------------------

  if self.IK >= 0 then
  begin
    namedisc:= TUchPlanController.Instance.getDiscName(self.IK);
    Caption:= 'Изменение дисциплины "'+namedisc+ '" в учебном плане';
    LoadCompetence;
    LoadRelation;
  end
  else
  begin
    frmUchPlanAddDisc.Caption:= 'Добавление дисциплины в учебный план';
    if dbcbCklDisc.Tag <> 11 then
      dbcbCklDisc.KeyValue:= dbcbCklDisc.Tag else dbcbCklDisc.KeyValue:=15;
    if dbcbGrpDisc.Tag <> 9 then
      dbcbGrpDisc.KeyValue:= dbcbGrpDisc.Tag else dbcbGrpDisc.KeyValue:= 14;
    if dbcbPdgrpDisc.Tag <> 3 then
      dbcbPdgrpDisc.KeyValue:=dbcbPdgrpDisc.Tag else dbcbPdgrpDisc.KeyValue:=2;
    dbcbKaf.KeyValue:= 1;
  end;
  TUchPlanController.Instance.LoadUchPlanContent(self.IK);

  //видны ли компетенции
  lblCompetence.Visible := (VidGos = FGOS3);
  ToolBar1.Visible := (VidGos = FGOS3);
  IsModified:= false;
end;

destructor TfrmUchPlanAddDisc.Destroy;
begin
  TGeneralController.Instance.ReleaseLockupCB(@dbcbKaf);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbDisc);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbGrpDisc);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbCklDisc);
  TGeneralController.Instance.ReleaseLockupCB(@dbcbPdgrpDisc);
  fCompetenceList.Clear;
  fCompetenceList.Free;
  fDiscRelationList.Clear;
  fStrCmptncList.Clear;
  fDiscRelationList.Free;
  fStrCmptncList.Free;
  inherited;
end;

function TfrmUchPlanAddDisc.DoApply: boolean;
var
  DiscInUchPlanIK: integer;
  tempProc: TADOStoredProc;
begin
  if ((Label22.Tag < 0) or (fixRow.Count > 0)) then
  begin
    Application.MessageBox('Поля, выделенные красным цветом, заполнены некорректно!','Изменение дисциплины в учебном плане',MB_ICONWARNING);
    Result:= false;
    exit;
  end;
  fHour := GetTimeByEdIzm(edtHoursGos.Text, fEdIzm);
  iIndivid:= StrToInt(Edit7.Text);
  DiscInUchPlanIK:= self.IK;

  if (dbcbGrpDisc.KeyValue <> NULL) and
    (not dbcbGrpDisc.ListSource.DataSet.FieldByName('lVibor').AsBoolean) then
  begin
    dbeGroupVibor.Value:='0';
  end;

  //if dbcbSpclz.KeyValue = Null then SpclzIK := 0 else SpclzIK := dbcbSpclz.KeyValue;
  
  if not TUchPlanController.Instance.SaveDiscInUchPlan(iUchPlan, DiscInUchPlanIK, dbcbCklDisc.KeyValue, dbcbGrpDisc.KeyValue,
  dbcbPdgrpDisc.KeyValue, dbcbDisc.KeyValue, dbcbKaf.KeyValue, SpclzIK, fHour, iIndivid,
  StrToInt(dbeGroupVibor.Value), Edit6.Text,fStrCmptncList,fDiscRelationList) then //передаю не компетенции, а структуру
  begin
    Result:= false;
    exit;
  end
  else                 //если сохранение прошло
    if TypePlan=key_ModelPlan {cbOtherUchPl.Checked} then  //если это общий план-модель
    begin       //аналогичное изменение дисциплины в планах-потомках
      //dbcbSpclz.KeyValue;
      TUchPlanController.Instance.ChangeDiscInUchPlan(iUchPlan, DiscInUchPlanIK, dbcbCklDisc.KeyValue,
      dbcbGrpDisc.KeyValue, dbcbPdgrpDisc.KeyValue, dbcbDisc.KeyValue, dbcbKaf.KeyValue, fHour, iIndivid,
      StrToInt(dbeGroupVibor.Value), dbcbSpclz.KeyValue, Edit6.Text, fStrCmptncList);   //передаю не компетенции, а структуру
    end;

  //автоматическая вставка БРС
  tempProc:= TADOStoredProc.Create(nil);
  try
    tempProc.ProcedureName:= 'BRS_forDisc;1';
    tempProc.Connection:= dm.DBConnect;
    tempProc.Parameters.CreateParameter('@ik_disc_uch_plan', ftInteger, pdInput, 4, DiscInUchPlanIK);
    tempProc.ExecProc;
  finally
    tempProc.Free;
  end;

  if Self.IK < 0 then
  begin
    iIndivid:= 0;
    fHour := 0;
  end;
  TUchPlanController.Instance.LoadUchPlanContent(self.IK);
  FillColumnValues;
  Result:= true;
  IsModified:= false;
end;

function TfrmUchPlanAddDisc.DoCancel: boolean;
begin
  case (Application.MessageBox('Сохранить внесенные изменения?','Изменение учебного плана', MB_YESNOCANCEL)) of
    mrYes:
      begin
        OK;
        Result:= false;
      end;
    mrNo: Result:= true;
    mrCancel: Result:= false;
    else Result:= true;
  end;  
end;

procedure TfrmUchPlanAddDisc.FillColumnValues;
var
  i, lect, lab, pract:integer;
  slColumnKafedra, slColumnValues:TStringList;
begin
  slColumnKafedra:= TStringList.Create;
  slColumnValues:= TStringList.Create;
  try
  TUchPlanController.Instance.getColumnsValues(0, lect, lab, pract, slColumnValues, @slColumnKafedra, true);
  if fCurrentDiscType = 1 then
  begin
    Label23.Caption:= IntToStr(lect);
    Label23.Tag:= lect;
    Label24.Caption:= IntToStr(lab);
    Label24.Tag:= lab;
    Label25.Caption:= IntToStr(pract);
    Label25.Tag:= pract;
    Label27.Caption:= IntToStr(pract + lab + lect);
    Label27.Tag:= pract + lab + lect;
  end
  else
  begin
    Label23.Caption:= '-';
    Label23.Tag:= 0;
    Label24.Caption:= '-';
    Label24.Tag:= 0;
    Label25.Caption:= '-';
    Label25.Tag:= 0;
    Label27.Caption:= '-';
    Label27.Tag:= 0;
  end;
  CalcSRS;

  for i:= 0 to slColumnValues.Count-1 do
  begin
    if (fixRow.IndexOf(IntToStr(i+1)) >= 0) then continue;
    sgDisc.Cells[1, i+1]:= slColumnValues[i];
    sgDisc.Cells[2, i+1]:= slColumnKafedra[i];
  end;
  finally
    slColumnKafedra.Free;
    slColumnValues.Free;
  end;
end;




procedure TfrmUchPlanAddDisc.sgDiscDblClick(Sender: TObject);
var
  SelectDialog:TfrmBaseDialog;
begin
try
  if dbcbDisc.KeyValue = NULL then exit;
  if (sgDisc.Row = 0) then exit;
  if (fixRow.IndexOf(IntToStr(sgDisc.Row)) > -1) then
    begin
      Application.MessageBox('В данное поле введены некорректные данные!' + #10 + #13 + 'Вызов окна редактирования невозможен...','Изменение дисциплины в учебном плане',MB_ICONWARNING);
      exit;
    end;
  case TUchPlanController.Instance.getColumnType(sgDisc.Row-1) of
    3:
    begin
      SelectDialog:= TfrmEditControlVZ.CreateDialog(self, Connection, nil);
      (SelectDialog as TfrmEditControlVZ).Read(dbcbKaf.KeyValue, self.IK, TUchPlanController.Instance.getColumnParamKey(sgDisc.Row-1), sgDisc.Cells[0, sgDisc.Row]);
      if ((SelectDialog.ShowModal = mrOk) or (SelectDialog.bbApply.Tag = 1)) then
      begin
        FillColumnValues;
        dbcbGrpDiscKeyValueChanged(nil);
      end;
    end;
    11:
    begin
      SelectDialog:= TfrmEditAuditorVZ.CreateDialog(self, Connection, nil);
      (SelectDialog as TfrmEditAuditorVZ).Read(dbcbKaf.KeyValue, self.ik, TUchPlanController.Instance.getColumnParamKey(sgDisc.Row-1));
      if ((SelectDialog.ShowModal = mrOk) or (SelectDialog.bbApply.Tag = 1)) then
      begin
        FillColumnValues;
        dbcbGrpDiscKeyValueChanged(nil);
      end;
    end;
  end;
except
   on EC: EConvertError do
   begin
       Application.MessageBox('Введено неверное числовое значение','Учебный план',MB_ICONERROR);
       exit;
   end;
end;
end;

procedure TfrmUchPlanAddDisc.sgDiscSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  tempStr: String;
begin
  if (dbcbCklDisc.KeyValue = NULL) or (dbcbGrpDisc.KeyValue = NULL) or (dbcbDisc.KeyValue = NULL) or (dbcbKaf.KeyValue = NULL) then
  begin
    sgDisc.Options:= sgDisc.Options - [goEditing];
    exit;
  end;
  if (ACol <> 1) then
    sgDisc.Options:= sgDisc.Options - [goEditing]
  else
  begin
    if Pos('??', sgDisc.Cells[ACol, ARow]) <> 0 then
      sgDisc.Options:= sgDisc.Options - [goEditing]
    else  sgDisc.Options:= sgDisc.Options + [goEditing];
  end;

  if (curRow > -1) and (curCol > -1) then
    if isCellTextChange then
    begin
      tempStr:= '';
      if (curCol = 1) then
      begin
        if TUchPlanController.Instance.CheckColumn(curRow-1, sgDisc.Cells[curCol, curRow], dbcbKaf.KeyValue) then
        begin
          if curRow > NoAudRowCount then
            sgDisc.OnGetEditMask(sgDisc, curCol, curRow, tempStr);
          if (fixRow.IndexOf(IntToStr(curRow)) > -1) then fixRow.Delete(fixRow.IndexOf(IntToStr(curRow)));
          dbcbGrpDiscKeyValueChanged(nil);
          FillColumnValues;
        end
        else if (fixRow.IndexOf(IntToStr(curRow)) = -1) then fixRow.Add(IntToStr(curRow));
      end;
      isCellTextChange:= false;
      curRow:= -1;
      curCol:= -1;
    end;
end;

procedure TfrmUchPlanAddDisc.edtHoursGosExit(Sender: TObject);
begin
  if (isHourGosMod) then
  begin
    if (Length(edtHoursGos.Text) = 0) then edtHoursGos.Text:= '0';
   // fHour:= GetTimeByEdIzm(edtHoursGos.Text, fEdIzm);
  end;
  (Sender as TDBEditEh).Color:= clWindow;
  CalcSRS;
end;

procedure TfrmUchPlanAddDisc.edtHoursGosKeyPress(Sender: TObject; var Key: Char);
const
  allow:set of char = ['1','2','3','4','5','6','7','8','9','0', ' ', '/', ',' , '.', Chr(VK_BACK)];
begin
  if (not (Key in allow)) then
  begin
    key:= #0;
    exit;
  end
  else isHourGosMod:= true;
  dbcbGrpDiscKeyValueChanged(nil);
end;

procedure TfrmUchPlanAddDisc.sgDiscKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  b: boolean;
begin
  if dbcbDisc.KeyValue = NULL then exit;
  if (sgDisc.Col = 0) then
    if (Key = VK_RETURN) then sgDiscDblClick(nil);
  if (sgDisc.Col = 1) and (Key = VK_DELETE) and (not isCellTextChange) then
  begin
    if (sgDisc.Row > NoAudRowCount) then
      sgDisc.Cells[sgDisc.Col, sgDisc.Row]:= '00\00\00'
    else sgDisc.Cells[sgDisc.Col, sgDisc.Row]:= '';
    isCellTextChange:= true;
    curRow:= sgDisc.Row;
    curCol:= sgDisc.Col;
    sgDisc.OnSelectCell(sgDisc, curCol, curRow, b);
  end;
end;

procedure TfrmUchPlanAddDisc.sgDiscMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  ACol, ARow:Integer;
begin
  sgDisc.Hint:= '';
  sgDisc.MouseToCell(X, Y, ACol, ARow);
  if ((ACol = 2) and (ARow > 0)) then
    sgDisc.Hint:= sgDisc.Cells[ACol, ARow];
end;

procedure TfrmUchPlanAddDisc.sgDiscGetEditMask(Sender: TObject; ACol,
  ARow: Integer; var Value: String);
begin
  if ((ACol = 1) and (ARow > NoAudRowCount) and (not isCellTextChange)) then
    Value:= '00\\00\\00'//'99\\99\\99;1;0';
end;

procedure TfrmUchPlanAddDisc.sgDiscDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  inherited;
  if (ACol = 1) then
    if (fixRow.IndexOf(IntToStr(ARow)) > -1) then
      begin
        sgDisc.Canvas.Font.Color:= clRed;
        sgDisc.Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, sgDisc.Cells[ACol, ARow]);
      end;
end;

procedure TfrmUchPlanAddDisc.Edit6Exit(Sender: TObject);
begin
  (Sender as TDBEditEh).Color:= clWindow;
end;

procedure TfrmUchPlanAddDisc.Edit6Enter(Sender: TObject);
begin
  (Sender as TDBEditEh).Color:= clAqua;
end;

procedure TfrmUchPlanAddDisc.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
  dbcbGrpDiscKeyValueChanged(nil);
end;

procedure TfrmUchPlanAddDisc.actAddDiscRelationExecute(Sender: TObject);
var tempDS: TADODataSet;
begin
  tempDS := TGeneralController.Instance.GetNewADODataSet(false);
  frmAddDiscRelation := TfrmAddDiscRelation.CreateDialog(Application, Connection, nil);
  frmAddDiscRelation.ikUchPlan := iUchPlan;
  frmAddDiscRelation.ik_disc_main:= IK;
  frmAddDiscRelation.DiscRelationList:=fDiscRelationList;
  if namedisc ='' then  namedisc:= TUchPlanController.Instance.getDiscName(IK);
  frmAddDiscRelation.Caption:= 'Выбрать дисциплины, на которые будет опираться "'+namedisc+ '" ';
  tempDS.CommandText := 'select IDGos from MW_Gos, Uch_pl where MW_Gos.ik_spec = Uch_pl.ik_spec and ik_uch_plan =' + IntToStr(iUchPlan);
  try
     tempDS.Open;
     frmAddDiscRelation.IDGos := tempDS.FieldByName('IDGos').AsInteger;
     frmAddDiscRelation.read;
     if ((frmAddDiscRelation.ShowModal() = mrOk) or (frmAddDiscRelation.bbApply.Tag = 1)) then
     begin
        DiscRelationList:= frmAddDiscRelation.DiscRelationList;
        DiscRelationList.count;
       IsModified := true;
     end;
  finally
    tempDS.Close;
    tempDS.Free;
  end;  //inherited;

end;

procedure TfrmUchPlanAddDisc.actCmptncExecute(Sender: TObject);
var tempDS: TADODataSet;
begin
  tempDS := TGeneralController.Instance.GetNewADODataSet(false);
  frmAddDiscCompetence := TfrmAddDiscCompetence.CreateDialog(Application, Connection, nil);
  frmAddDiscCompetence.IK := IK;
  frmAddDiscCompetence.CompetenceList := fCompetenceList;
  if namedisc ='' then  namedisc:= TUchPlanController.Instance.getDiscName(IK);
  frmAddDiscCompetence.Caption:= 'Выбрать компетенции для дисциплины "'+namedisc+ '" ';
  frmAddDiscCompetence.NameDisc:= namedisc;
  tempDS.CommandText := 'select IDGos from MW_Gos, Uch_pl where MW_Gos.ik_spec = Uch_pl.ik_spec and ik_uch_plan =' + IntToStr(iUchPlan);
  try
     tempDS.Open;
     frmAddDiscCompetence.IDGos := tempDS.FieldByName('IDGos').AsInteger;
     frmAddDiscCompetence.read;
     if ((frmAddDiscCompetence.ShowModal() = mrOk) or (frmAddDiscCompetence.bbApply.Tag = 1)) then
     begin
       CompetenceList := frmAddDiscCompetence.CompetenceList;
       StrCmptncList:= frmAddDiscCompetence.StructCompList;
       allCompetence.Caption := frmAddDiscCompetence.ShortNames;
       IsModified := true;
     end;
  finally
    tempDS.Close;
    tempDS.Free;
  end;

end;

procedure TfrmUchPlanAddDisc.actSpravExecute(Sender: TObject);
var
  isMod: boolean;
begin
  IsMod:= IsModified;
  inherited;
  TGeneralController.Instance.RefreshLockupCB(@dbcbCklDisc);
  TGeneralController.Instance.RefreshLockupCB(@dbcbGrpDisc);
  TGeneralController.Instance.RefreshLockupCB(@dbcbDisc);
  TGeneralController.Instance.RefreshLockupCB(@dbcbKaf);
  TGeneralController.Instance.RefreshLockupCB(@dbcbPdgrpDisc);
  IsModified:= isMod;
end;

procedure TfrmUchPlanAddDisc.actSpravUpdate(Sender: TObject);
begin
  edtHoursGos.Enabled:= (dbcbCklDisc.KeyValue <> NULL) and (dbcbGrpDisc.KeyValue <> NULL) and (dbcbDisc.KeyValue <> NULL);
  Edit7.Enabled:= edtHoursGos.Enabled and Label20.Enabled;
end;

procedure TfrmUchPlanAddDisc.CalcSRS;
begin
  if fCurrentDiscType = typeTypicalDisc then
  begin
    Label22.Tag:= StrToInt(edtHoursGos.Text) - (Label23.Tag + Label24.Tag + Label25.Tag) - iIndivid;
    Label22.Caption:= IntToStr(Label22.Tag);
    if Label22.Tag < 0 then Label22.Font.Color:= clRed
    else Label22.Font.Color:= clBlack;
  end
  else
  begin
    Label22.Caption:= '-';
    Label22.Tag:= 0;
    Label22.Font.Color:= clBlack;
  end;
end;

procedure TfrmUchPlanAddDisc.CheckSimilarDiscipline;
var ds: TADODataSet;
    msStr: string;
    i, pgr: integer;
begin
  if dbcbPdgrpDisc.KeyValue = NULL then pgr := 0 else pgr := dbcbPdgrpDisc.KeyValue;
  
  ds := TGeneralController.Instance.GetNewADODataSet(true);
  ds.CommandText := 'select * from GetSimilarDisc('+ IntToStr(IK) +
                    ','+IntToStr(iUchPlan)+','+IntToStr(dbcbDisc.KeyValue)+','+
                    IntToStr(dbcbCklDisc.KeyValue)+','+IntToStr(dbcbGrpDisc.KeyValue)+
                    ','+IntToStr(pgr)+') where ik_spclz<>' + IntToStr(SpclzIK);
  ds.Open;
  if ds.RecordCount<>0 then //уже есть такая дисциплина
  begin
    //с таким же профилем
    ds.Filter := 'ik_spclz='+IntToStr(dbcbSpclz.KeyValue);
    ds.Filtered := true;
    if ds.RecordCount<>0 then
    begin
      // pnlNotice.Caption :=
       lblNotice.Caption := nameSpclz + ' ' + ds.FieldByName('cName_spclz_short').AsString +
       ' уже имеет такую дисциплину в текущем учебном плане';
       lblNotice.Width := 145;
       IsModified:= false;
    end else
      //если назначен общий профиль
      if (dbcbSpclz.KeyValue=key_CommonProfile) then
      begin
        ds.Filtered :=false;
        msStr := 'В текущем учебном плане уже есть данная дисциплина.' + #13 + nameSpclz + ': ';
        for i := 0 to ds.RecordCount - 1 do
          msStr := msStr + ds.FieldByName('cName_spclz').AsString + #13;
        msStr := msStr + #13 + 'Вы хотите их объединить в одну дисциплину?';
        isMerge := MessageBox(Handle, PWideChar(msStr), 'Объединение дисциплин',
               MB_YESNO) = IDYES;
      end;

  end;
end;

procedure TfrmUchPlanAddDisc.dbcbDiscKeyValueChanged(Sender: TObject);
var
  i: integer;
  tempStr: TStringList;
begin
  if dbcbDisc.KeyValue <> NULL then
  begin
    fEdIzm := dbcbDisc.ListSource.DataSet.FieldByName('ik_ed_izm').AsInteger;
    if (dbcbDisc.ListSource.DataSet.FieldByName('ik_type_disc').AsInteger <> fCurrentDiscType) then
    begin
      try
        fCurrentDiscType:= dbcbDisc.ListSource.DataSet.FieldByName('ik_type_disc').AsInteger;
        if fCurrentDiscType = typeTypicalDisc then CalcSRS;
        tempStr:= TUchPlanController.Instance.getColumnsNames(fSemesterStr, fCurrentDiscType);
        sgDisc.RowCount:= tempStr.Count + 1;
        for i:= 0 to tempStr.Count - 1 do
          sgDisc.Cells[0, i + 1]:= tempStr[i];
        SetDiscType(fCurrentDiscType);
        FillColumnValues;
      finally
        if Assigned(tempStr) then tempStr.Free;        
      end;
    end;
  end;
  dbcbGrpDiscKeyValueChanged(nil);
end;

procedure TfrmUchPlanAddDisc.dbcbGrpDiscKeyValueChanged(Sender: TObject);
begin
  IsModified:= (dbcbCklDisc.KeyValue <> NULL) and (dbcbGrpDisc.KeyValue <> NULL) and (dbcbDisc.KeyValue <> NULL) and (dbcbKaf.KeyValue <> NULL);

  if VidGos>FGOS2 then SpclzIK := dbcbSpclz.KeyValue;
  
  isMerge := False;
  lblNotice.Caption := '';
  if (IsModified)and(VidGos=FGOS3) then CheckSimilarDiscipline;

  if (dbcbCklDisc.KeyValue <> NULL) and (dbcbGrpDisc.KeyValue <> NULL) and (Edit6.Text = '') then
    if (dbcbCklDisc.ListSource.DataSet.FieldByName('Ccode_ckl_disc').Value <> NULL) and (dbcbGrpDisc.ListSource.DataSet.FieldByName('Ccode_grp_disc').Value <> NULL) then
      Edit6.Text:= dbcbCklDisc.ListSource.DataSet.FieldByName('Ccode_ckl_disc').AsString + '.' + dbcbGrpDisc.ListSource.DataSet.FieldByName('Ccode_grp_disc').AsString + '.';

  //если выбрана группа дисциплин по выбору, отображаем номера групп
  if (dbcbGrpDisc.KeyValue <> NULL) and
    (dbcbGrpDisc.ListSource.DataSet.FieldByName('lVibor').AsBoolean) then
  begin
    dbeGroupVibor.Visible:= true;
    lGroupVibor.Visible:= true;
    if (dbeGroupVibor.Value='0') or (dbeGroupVibor.Value='') then
      dbeGroupVibor.Value:='1';
  end
  else
  begin
    dbeGroupVibor.Visible:= false;
    lGroupVibor.Visible:= false;
  end
end;

procedure TfrmUchPlanAddDisc.dbcbSpclzMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if dbcbSpclz.KeyValue>=0 then
     dbcbSpclz.Hint := dbcbSpclz.ListSource.DataSet.FieldByName('cName_spclz').AsString;

end;

procedure TfrmUchPlanAddDisc.Edit7Exit(Sender: TObject);
begin
  Panel5.Visible:= false;
  Timer1.Enabled:= false;
  if (isIndividMod) then
  begin
    if (Length(Edit7.Text) = 0) then Edit7.Text:= '0';
    iIndivid:= StrToInt(Edit7.Text);
    CalcSRS;
  end;
  (Sender as TDBEditEh).Color:= clWindow;
end;

procedure TfrmUchPlanAddDisc.edtHoursGosEnter(Sender: TObject);
begin
  inherited;
  (Sender as TDBEditEh).Color:= clAqua;
  isHourGosMod:= false;
end;

procedure TfrmUchPlanAddDisc.Edit7Enter(Sender: TObject);
begin
  inherited;
  (Sender as TDBEditEh).Color:= clAqua;
  isIndividMod:= false;
  Panel5.Visible:= true;
  Timer1.Enabled:= true;
end;

procedure TfrmUchPlanAddDisc.Edit7KeyPress(Sender: TObject; var Key: Char);
const
  allow:set of char = ['1','2','3','4','5','6','7','8','9','0', Chr(VK_BACK)];
begin
  inherited;
  if (not (Key in allow)) then
  begin
    key:= #0;
    exit;
  end
  else isIndividMod:= true;
  dbcbGrpDiscKeyValueChanged(nil);
end;

procedure TfrmUchPlanAddDisc.Edit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  individ : integer;
begin
  inherited;
  if ((ssCtrl in Shift) and (Key = VK_SPACE)) then
  begin
    individ := round(StrToInt(Label27.Caption) * TUchPlanController.Instance.GetConsultationPercent);
    if (iIndivid = individ) then exit;
    iIndivid:= individ;
    isIndividMod:= true;
    dbcbGrpDiscKeyValueChanged(nil);
  end;
end;

procedure TfrmUchPlanAddDisc.Timer1Timer(Sender: TObject);
begin
  inherited;
  Panel5.Visible:= false;
  Timer1.Enabled:= false;
end;

procedure TfrmUchPlanAddDisc.sgDiscGetEditText(Sender: TObject; ACol,
  ARow: Integer; var Value: String);
begin
  isCellTextChange:= true;
  curRow:= ARow;
  curCol:= ACol;
  if ((ACol = 1) and (ARow > NoAudRowCount) and (not isCellTextChange)) then
    Value:= TUchPlanController.Instance.GetSemesterHourityString(TUchPlanController.Instance.getColumnParamKey(ARow-1));
end;

procedure TfrmUchPlanAddDisc.sgDiscExit(Sender: TObject);
var
  b: boolean;
begin
  sgDiscSelectCell(sgDisc, 0,0, b);
end;

procedure TfrmUchPlanAddDisc.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited FormCloseQuery(Sender, CanClose);
  if CanClose then TUchPlanController.Instance.CloseUchPlanContent;
end;



function TfrmUchPlanAddDisc.GetTimeByEdIzm(aHours: string;
  aEdIzm: integer): integer;
var vPosSpace, vPosComma, vPosDot, vPosLine: integer;   //обрабатывает только пробелы, точки и запятые
    vTime, vPos: integer;
    str: string;
begin
  vPosSpace := Pos(' ',aHours);
  vPosComma := Pos(',', aHours);
  vPosDot := Pos('.', aHours);
  vPosLine := Pos('/', aHours);

  case aEdIzm of
    Hours: Result := round(StrToFloat(aHours));
    Days: //в днях
    begin
      if (vPosComma=0) and (vPosDot=0) and (vPosLine = 0) then
         Result := StrToInt(aHours)*KolDaysInWeek
      else
      begin
        vPos :=0;
        if vPosComma<>0 then vPos := vPosComma;
        if vPosDot<>0 then vPos := vPosDot;
        if vPosSpace<>0 then vPos := vPosSpace;

        if vPos<>0 then
          vTime := StrToInt(copy(aHours,1,vPos-1))*KolDaysInWeek //целая часть
          else vTime:= 0;

        if vPosLine=0 then  //если в десятичных
          vTime := vTime + round(StrToFloat('0.'+copy(aHours,vPos+1,length(aHours)-vPos))*KolDaysInWeek)
          else //если в дробях
            vTime := vTime + round(StrToInt(copy(aHours,vPos+1,1))*(KolDaysInWeek/StrToInt(copy(aHours,vPosLine+1,1))));

        Result := vTime;
      end;
    end;
  end;
end;

procedure TfrmUchPlanAddDisc.LoadCompetence;
var tempDS: TADODataSet;
begin
  allCompetence.Caption := '';
  fCompetenceList.Clear;
  tempDS := TGeneralController.Instance.GetNewADODataSet(false);
//  tempDS.CommandText := 'select C.ik_competence, short_Name from Competence C, Competence_sv_disc Csd where C.ik_competence = Csd.ik_competence'+
//                        ' and ik_disc_uch_plan = ' +  IntToStr(IK);
 tempDS.CommandText := 'select distinct S.ik_competence, short_Name from'+
' Structure_competence S inner join Struct_competence_sv_disc Scd'+
' on S.ik_structure_competence=Scd.ik_structure_competence'+
' inner join Competence C on S.ik_competence=C.ik_competence'+
' where Scd.ik_disc_uch_plan =' +  IntToStr(IK);

  tempDS.Open;
  tempDS.First;
  while not tempDS.Eof do
   begin
     if allCompetence.Caption<>'' then
       allCompetence.Caption := allCompetence.Caption + ', ';
     allCompetence.Caption := allCompetence.Caption + tempDS.FieldByName('short_Name').AsString;
     fCompetenceList.Add(tempDS.FieldByName('ik_competence').AsString);
     tempDS.Next;
   end;
end;


procedure TfrmUchPlanAddDisc.LoadRelation;
var tempDS: TADODataSet;
begin
  fDiscRelationList.Clear;
  tempDS := TGeneralController.Instance.GetNewADODataSet(false);
  tempDS.CommandText := 'select base_for_ik '+
  'from sv_disc_relation where depends_on_ik =' +  IntToStr(IK);
  tempDS.Open;
  tempDS.First;
  while not tempDS.Eof do
   begin
     fDiscRelationList.Add(tempDS.FieldByName('base_for_ik').AsString);
     tempDS.Next;
   end;
end;

procedure TfrmUchPlanAddDisc.SetCompetenceList(const Value: TStringList);
var i: integer;
begin
  fCompetenceList.Clear;
  for I := 0 to Value.Count - 1 do
    fCompetenceList.Add(Value[i]);
end;

procedure TfrmUchPlanAddDisc.SetStrCmptncList(const Value: TStringList);
var i: integer;
begin
  fStrCmptncList.Clear;
  for I := 0 to Value.Count - 1 do
    fStrCmptncList.Add(Value[i]);
end;

 procedure TfrmUchPlanAddDisc.SetDiscRelationList(const Value: TStringList);
var i: integer;
begin
  fDiscRelationList.Clear;
  for I := 0 to Value.Count - 1 do
    fDiscRelationList.Add(Value[i]);
end;

procedure TfrmUchPlanAddDisc.SetDiscType(discType: integer);
begin
 { if (discType = typeGosExam) or (discType = typeDiplom)or(discType = typeNIR)or(discType = typeGosExam) then
  begin
    Label7.Caption:= 'Количество недель:';
    //Label7.Left:= Edit5.Left - 108;
  end
  else
  begin
    Label7.Caption:= 'Общее количество часов:';
    //Label7.Left:= Edit5.Left - 140;
  end;       }
  Label7.Caption:= dbcbDisc.ListSource.DataSet.FieldByName('ShowToUser').AsString;

  Edit7.Enabled:= discType = typeTypicalDisc;
  Label19.Enabled:= discType = typeTypicalDisc;
  Label20.Enabled:= discType = typeTypicalDisc;
  Label22.Enabled:= discType = typeTypicalDisc;
  Label11.Enabled:= discType = typeTypicalDisc;
  Label15.Enabled:= discType = typeTypicalDisc;
  Label18.Enabled:= discType = typeTypicalDisc;
  Label23.Enabled:= discType = typeTypicalDisc;
  Label24.Enabled:= discType = typeTypicalDisc;
  Label25.Enabled:= discType = typeTypicalDisc;
  Label26.Enabled:= discType = typeTypicalDisc;
  Label27.Enabled:= discType = typeTypicalDisc;
end;

{procedure TfrmUchPlanAddDisc.SetHourGos(const Value: integer);
begin
  fHourGos := Value;
  Edit5.Text:= IntToStr(Value);

end;         }

procedure TfrmUchPlanAddDisc.SetIndividHour(const Value: integer);
begin
  fIndividHour := Value;
  Edit7.Text:= IntToStr(Value);
  CalcSRS;
end;



end.
