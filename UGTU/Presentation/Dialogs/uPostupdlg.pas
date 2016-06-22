unit uPostupdlg;

{ #Author sergdev@ist.ugtu.net }
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, Grids, DBGridEh, StdCtrls, ActnList, Buttons,
  ExtCtrls, adodb, db, DBCtrlsEh, DBLookupEh, Mask, uAbitDialog, uStudDlg,
  uMain, uAbitOtchetsController, comObj, uCertificateDialog,
  System.Actions, System.Generics.Collections, DocumentClass, DateUtils;

type
  TAbitList = class
  public
    Num, RecruitNum, CatNum, NNAbit: integer;
    Date: TDateTime;
    Recruit, Cat: string;
    new, delete, closed, real, IsMain: boolean;
    lAdditionalSpec: Tlist;
    ldelAdditionalSpec: Tlist;
    AvgBall: real;
    DateOriginal: TDateTime;

    function NewSpecNum: integer;
    // constructor Create;
    Procedure AutoNumDecrement(deleted: integer);
  end;

type
  TAdditionalSpec = class
  public
    ID, Num, ik_recruit: integer;
    name_recruit: string;
    new, delete: boolean;
  end;

type
  TExam = class
  public
    ID, NNAbit, IkDisc, IkVidSdachi, ik_rasp_kab, Mark: integer;
    VidSdachi, Disc, NVed: string;
    new, delete: boolean;
  end;

type
  TfrmPostupDlg = class(TfrmBaseDialog)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    sbAddExam: TSpeedButton;
    sbDelExam: TSpeedButton;
    sgExams: TStringGrid;
    dbcbeRecruit: TDBLookupComboboxEh;
    Label2: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    dbcbeCategory: TDBLookupComboboxEh;
    Label4: TLabel;
    Label7: TLabel;
    dbdteList: TDBDateTimeEditEh;
    cbReal: TCheckBox;
    GroupBox3: TGroupBox;
    sbAddSpec: TSpeedButton;
    SbDelSpec: TSpeedButton;
    sgAdditionalSpec: TStringGrid;
    cbIsMain: TCheckBox;
    bbOkPrint: TBitBtn;
    eAvgBall: TDBNumberEditEh;
    Label8: TLabel;
    bGetCertData: TButton;
    Label1: TLabel;
    Label9: TLabel;
    dtpDateOriginal: TDBDateTimeEditEh;
    dbcbeTargetOrganization: TDBLookupComboboxEh;
    lOrganiz: TLabel;
    lOrganiz0: TLabel;
    procedure FormShow(Sender: TObject);
    procedure sbAddExamClick(Sender: TObject);
    procedure sgExamsClick(Sender: TObject);
    procedure sbDelExamClick(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure eNumChange(Sender: TObject);
    procedure dbcbeRecruitChange(Sender: TObject);
    procedure sbAddSpecClick(Sender: TObject);
    procedure sgAdditionalSpecClick(Sender: TObject);
    procedure SbDelSpecClick(Sender: TObject);
    procedure sgExamsDblClick(Sender: TObject);
    procedure cbRealClick(Sender: TObject);
    procedure cbIsMainClick(Sender: TObject);
    procedure bbOkPrintClick(Sender: TObject);
    procedure bGetCertDataClick(Sender: TObject);
    procedure bbOKClick(Sender: TObject);
  private
    { Private declarations }
    FDocKatFilter: string;
    procedure LoadDocs;
    procedure GetAdmissionByDoc;
    procedure GetKatZach(NNRecord: integer);
    procedure LoadTargetOrganizations;
    procedure SetTargetOrganizationsVisible(isVisible: boolean);
  public
    HostForm: TfrmAbitCardDialog;
    DocRecordList: TObjectList<TDocRecord>;
    IDStudent, IDpostup, IkRecruit, Num, IdCat: integer;
    commited, onlyreading, IsAdditional, IsOnline, HasAddSpec: boolean;
    AbitList: TAbitList;
    ExamList: Tlist;
    DeleteExamList: Tlist;
    CurrentExam: Tlist;
    fn, ln, pn, ps, pnum: string;
    Year: integer;
    NNRecord: integer;
    procedure Sync;
    procedure ExamSync;
    procedure AdditionalSpecSync;
    procedure ButtonsCheck;
    function FillAbitList(Dataset: TAdoDataset): TAbitList;
    function AddExam(Dataset: TAdoDataset): TExam;

  end;

var
  frmPostupDlg: TfrmPostupDlg;

implementation

uses uAddExam, Math, uDM, jpeg, VarfileUtils, uDMStudentSelectionProcs,
  uDMStudentData,
  uDMStudentActions, uDMAbiturientAction, uAddSpecAbit, ExceptionBase,
  uDMAdress, uXMLEGEReader,
  GeneralController, ConstantRepository, CommonIntf, CommonIntfImpl,
  CommandController,
  PersonController;
{$R *.dfm}

function CheckFields: boolean;
begin
  result := true;
  with frmPostupDlg do
  begin
    if (dbcbeRecruit.Text = '') or (dbcbeCategory.Text = '') or
      (dbdteList.Text = '  .  .    ') or (AbitList = nil) then
      result := false;

  end;
end;

procedure TfrmPostupDlg.AdditionalSpecSync;
var
  i: integer;
  Spec: TAdditionalSpec;
begin
  sgAdditionalSpec.Rowcount := 2;

  sgAdditionalSpec.cells[0, 1] := ' ';
  sgAdditionalSpec.cells[1, 1] := ' ';

  if AbitList.lAdditionalSpec = nil then
    exit;
  for i := 0 to (AbitList.lAdditionalSpec.Count - 1) do
  begin
    Spec := AbitList.lAdditionalSpec[i];

    sgAdditionalSpec.cells[0, sgAdditionalSpec.Rowcount - 1] :=
      inttostr(Spec.Num);
    sgAdditionalSpec.cells[1, sgAdditionalSpec.Rowcount - 1] :=
      Spec.name_recruit;
    sgAdditionalSpec.Rowcount := sgAdditionalSpec.Rowcount + 1;
  end;

  sgAdditionalSpec.cells[0, sgAdditionalSpec.Rowcount - 1] := ' ';
  sgAdditionalSpec.cells[1, sgAdditionalSpec.Rowcount - 1] := ' ';
end;

procedure TfrmPostupDlg.ExamSync;
var
  i: integer;
  exam: TExam;
begin
  sgExams.Rowcount := 2;
  sgExams.cells[0, 1] := ' ';
  sgExams.cells[1, 1] := ' ';
  sgExams.cells[2, 1] := ' ';
  sgExams.cells[3, 1] := ' ';

  if ExamList = nil then
    exit;
  for i := 0 to (ExamList.Count - 1) do
  begin
    exam := ExamList[i];
    if exam.delete then
    begin
      sgExams.cells[0, sgExams.Rowcount - 1] := 'Удален';
      sgExams.cells[1, sgExams.Rowcount - 1] := '';
      sgExams.cells[2, sgExams.Rowcount - 1] := '';
      sgExams.cells[3, sgExams.Rowcount - 1] := '';
    end
    else
    begin
      sgExams.cells[0, sgExams.Rowcount - 1] := exam.Disc;
      sgExams.cells[1, sgExams.Rowcount - 1] := exam.VidSdachi;
      if (exam.Mark = -1) then
        sgExams.cells[2, sgExams.Rowcount - 1] := 'нет'
      else
        sgExams.cells[2, sgExams.Rowcount - 1] := inttostr(exam.Mark);
      sgExams.cells[3, sgExams.Rowcount - 1] := exam.NVed;
    end;
    sgExams.Rowcount := sgExams.Rowcount + 1;
  end;

  sgExams.cells[0, sgExams.Rowcount - 1] := ' ';
  sgExams.cells[1, sgExams.Rowcount - 1] := ' ';
  sgExams.cells[2, sgExams.Rowcount - 1] := ' ';
  sgExams.cells[3, sgExams.Rowcount - 1] := ' ';

end;

procedure TfrmPostupDlg.Sync;
// var i:integer;
// rec:TAbitList;
// exam:TExam;
begin
  if (AbitList = nil) then
    exit;

  if (dbcbeCategory.keyvalue <= 0) then
    dbcbeCategory.keyvalue := AbitList.CatNum;

 { if (dbcbeCategory.Text <> AbitList.Cat) then      //Если абитуриент потерял возможность поступления на категорию
     dbcbeCategory.keyvalue := null;}

  if (dbdteList.Value <= 0) then
    dbdteList.Value := AbitList.Date;
  if (dbcbeRecruit.keyvalue <= 0) then
  begin
    dbcbeRecruit.keyvalue := NNRecord;//AbitList.RecruitNum;
    GetKatZach(dbcbeRecruit.KeyValue); //настройка категорий зачисления
  end;
  if (eAvgBall.Value <= 0) then
    eAvgBall.Value := AbitList.AvgBall;

  cbReal.checked := AbitList.real;
  dtpDateOriginal.Enabled := AbitList.real;
  cbIsMain.checked := AbitList.IsMain;

  ExamSync;
  AdditionalSpecSync;
  ButtonsCheck;
  sgExamsClick(self);
  sgAdditionalSpecClick(self);
end;

procedure TfrmPostupDlg.FormShow(Sender: TObject);
var
  j: integer;
  I: Integer;
  docFilter: string;
begin
  commited := false;
  if AbitList = nil then
    AbitList := TAbitList.Create;
  AbitList.lAdditionalSpec := Tlist.Create;
  AbitList.ldelAdditionalSpec := Tlist.Create;
  AbitList.new := true;
  ExamList := Tlist.Create;
  DeleteExamList := Tlist.Create;
  Text := 'Заявление на поступление';

  // if HostForm=nil then
  // begin
  // tempDS := TGeneralController.Instance.GetNewADODataSet(true);
  // tempDS.CommandText := 'select * from Person ' + IntToStr(IDpostup);
  // bGetCertData.Visible:=false;
  // end;

  if HasAddSpec then
    GroupBox3.Visible := true
  else
    GroupBox3.Visible := false;

  sgExams.cells[0, 0] := 'Дисциплина';
  sgExams.cells[1, 0] := 'Вид сдачи';
  sgExams.cells[2, 0] := 'Оценка';
  sgExams.cells[3, 0] := 'Номер ведомости';

  sgAdditionalSpec.cells[0, 0] := 'Номер';
  sgAdditionalSpec.cells[1, 0] := 'Специальность';

  dm.adodsPostupView.Active := false;
  dm.adodsPostupView.CommandType := cmdText;
  dm.adodsPostupView.CommandText :=
    'select * from Abit_Postup_View where ncode=''' +
    inttostr(IDStudent) + '''';
  dm.adodsPostupView.Active := true;

  if  (dm.adodsPostupView.RecordCount > 0) then LoadDocs;


  // если вызываем окно редактирования
  if (dm.adodsPostupView.RecordCount > 0) and (not(IsAdditional)) then
  begin

    dm.adodsPostupView.First;
    // для проверки ЕГЭ
    ln := dm.adodsPostupView.FieldByName('Clastname').Value;
    fn := dm.adodsPostupView.FieldByName('Cfirstname').Value;
    if (dm.adodsPostupView.FieldByName('Cotch').Value <> NULL) then
      pn := dm.adodsPostupView.FieldByName('Cotch').Value;

    if (dm.adodsPostupView.RecordCount > 1) then // and(IkRecruit>0)
      while (dm.adodsPostupView.FieldByName('NN_Abit').Value <> IDpostup) and
        (not dm.adodsPostupView.Eof) do
        dm.adodsPostupView.Next;

    AbitList := FillAbitList(dm.adodsPostupView);

    dm.adodsAbitExamView.Active := false;
    dm.adodsAbitExamView.CommandType := cmdText;
    dm.adodsAbitExamView.CommandText :=
      'select * from Abit_Exam_View where (ncode=''' + inttostr(IDStudent) +
      ''')and(NN_abit=''' + inttostr(AbitList.NNAbit) + ''')';
    dm.adodsAbitExamView.Active := true;
    dm.adodsAbitExamView.First;
    for j := 0 to (dm.adodsAbitExamView.RecordCount - 1) do
    begin
      AddExam(dm.adodsAbitExamView);
      dm.adodsAbitExamView.Next;
    end;
  end
  else
    dbdteList.Value := Date;
  Sync;

  { dmStudentData.adodsKatZach.Active:=false;
    dmStudentData.adodsKatZach.Active:=true; }

  //GetKatZach(IkRecruit); //настройка категорий поступления

  dm.adodsNabor.Active := false;
  dm.adodsNabor.CommandType := cmdText;
  dm.adodsNabor.CommandText :=
    'select * from Tree_abit_Specialties where NNYear=''' + inttostr(Year) +
    ''' Order By Cshort_name_fac, Cname_spec';
  dm.adodsNabor.Active := true;
  dm.adodsNabor.Open;

  if NNRecord > 0 then
  begin
    // frmAddPostupDlg:=TfrmAddPostupDlg.Create(self);
    AbitList.RecruitNum := NNRecord;
    AbitList.CatNum := 1;
    AbitList.Date := Date;
    Sync;
    ButtonsCheck;
  end;

  if AbitList.closed then
  begin
    dbcbeCategory.Enabled := false;
    dbdteList.Enabled := false;
    dbcbeRecruit.Enabled := false;
    sbAddExam.Visible := false;
    sbDelExam.Visible := false;
    sbAddSpec.Visible := false;
    SbDelSpec.Visible := false;
    bbOK.Enabled := false;
    cbReal.Enabled := false;
    cbIsMain.Enabled := false;
  end
  else
  begin
    dbcbeCategory.Enabled := true;
    dbdteList.Enabled := true;
    dbcbeRecruit.Enabled := true;
    sbAddExam.Visible := true;
    sbDelExam.Visible := true;
    sbAddSpec.Visible := true;
    SbDelSpec.Visible := true;
    bbOK.Enabled := true;
    cbReal.Enabled := true;
    cbIsMain.Enabled := true;
  end;

  if IsAdditional then
  begin
    AbitList.Num := Num;
    AbitList.CatNum := IdCat;
    dbcbeCategory.keyvalue := IdCat;
    dm.adodsAbitAllExam.Active := false;
    dm.adodsAbitAllExam.CommandType := cmdText;
    dm.adodsAbitAllExam.CommandText :=
      'select * from ABit_AllExamView where (NN_abit=''' +
      inttostr(IDpostup) + ''')';
    dm.adodsAbitAllExam.Active := true;
    dm.adodsAbitAllExam.First;
    for j := 0 to (dm.adodsAbitAllExam.RecordCount - 1) do
    begin
      AddExam(dm.adodsAbitAllExam).new := true;
      dm.adodsAbitAllExam.Next;
    end;
    Sync;
  end;
  if (AbitList.Num > 0) then

    Text := 'Заявление на поступление №' + inttostr(AbitList.Num);
end;

procedure TfrmPostupDlg.GetAdmissionByDoc;
var tempDS: TADODataSet;
  i,j: Integer;
  inDocs: boolean;
  k: Integer;
begin
  tempDS := TGeneralController.Instance.GetNewADODataSet(true);
  tempDS.CommandText := 'select * from Kat_zach_doc where NNyear = ' + IntTosTr(Year);
  tempDS.Open;
  FDocKatFilter := '';
  dmStudentData.aspGetAbitCat.Filtered := false;
  dmStudentData.aspGetAbitCat.First;
  for k := 0 to dmStudentData.aspGetAbitCat.RecordCount - 1 do
  begin
    inDocs := false;
    tempDS.Filtered := false;
    tempDS.Filter := 'ik_kat_zach = ' + dmStudentData.aspGetAbitCat.FieldByName('ik_kat_zach').AsString;
    tempDS.Filtered := true;
    tempDS.First;

    for i := 0 to tempDS.RecordCount - 1 do
    begin
      for j := 0 to DocRecordList.Count - 1 do
        if DocRecordList[j].ikDocVid = tempDS.FieldByName('ik_vid_doc').AsInteger then
        begin
          inDocs := true;
          Break;
        end;
      if inDocs then break;
      tempDS.Next;
    end;
    if (not inDocs)and(tempDS.RecordCount > 0) then
      begin
        if FDocKatFilter <> '' then  FDocKatFilter := FDocKatFilter + ' and ';
        FDocKatFilter := FDocKatFilter + '(ik_kat_zach <> ' +
          dmStudentData.aspGetAbitCat.FieldByName('ik_kat_zach').AsString + ')';
      end;
    dmStudentData.aspGetAbitCat.Next;
  end;
  tempDS.Free;
end;

procedure TfrmPostupDlg.GetKatZach(NNRecord: integer);
begin
  with dmStudentData.aspGetAbitCat do
  begin
    Active := false;
    Parameters[1].Value := NNRecord;
    Active := true;
    GetAdmissionByDoc;
    Filter := FDocKatFilter;
    Filtered := true;
  end;
end;

procedure TfrmPostupDlg.LoadDocs;
var DocDS: TADODataSet;
    I: Integer;
begin
  DocRecordList := TObjectList<TDocRecord>.Create;
  DocDS := TGeneralController.Instance.GetNewADODataSet(true);
  DocDS.CommandText := 'select * from SelStudDocuments('+IntToStr(IDStudent)+')';
  DocDS.Open;
  DocDS.First;
  for I := 0 to DocDS.RecordCount - 1 do
  begin
    DocRecordList.Add(TDocRecord.Create(DocDS.FieldByName('ik_vid_doc').AsInteger));
    DocDS.Next;
  end;
  DocDS.Free;
end;

procedure TfrmPostupDlg.LoadTargetOrganizations;
begin
  if (dbcbeCategory.KeyValue = 8) then
  begin
    dmStudentData.adoqTargetOrganization.Close;
    dmStudentData.adoqTargetOrganization.Open;
    SetTargetOrganizationsVisible(true);
  end
  else
    SetTargetOrganizationsVisible(false);
end;

procedure TfrmPostupDlg.sbAddExamClick(Sender: TObject);
begin
  frmAddExamDialog := TfrmAddExamDialog.Create(self);
  frmAddExamDialog.Year := Year;
  frmAddExamDialog.KatZachIK := dbcbeCategory.KeyValue;
  frmAddExamDialog.ShowModal;
  frmAddExamDialog.Free;
  Sync;
end;

procedure TfrmPostupDlg.sbAddSpecClick(Sender: TObject);
begin
  frmAdditionalSpec := TfrmAdditionalSpec.Create(self);
  frmAdditionalSpec.ShowModal;
  frmAdditionalSpec.Free;
  Sync;
end;

procedure TfrmPostupDlg.sgAdditionalSpecClick(Sender: TObject);
var
  s: string;
begin
  s := sgAdditionalSpec.cells[0, sgAdditionalSpec.Row];
  if ((s <> '') and (s <> ' ')) and (sgAdditionalSpec.Row <> 0) then
  begin
    SbDelSpec.Enabled := true
  end
  else
  begin
    SbDelSpec.Enabled := false
  end;
end;

procedure TfrmPostupDlg.sgExamsClick(Sender: TObject);
var
  s: string;
begin

  s := sgExams.cells[0, sgExams.Row];
  if ((s <> '') and (s <> ' ')) and (sgExams.Row <> 0) then
  begin
    sbDelExam.Enabled := true
  end
  else
  begin
    sbDelExam.Enabled := false
  end;
end;

procedure TfrmPostupDlg.sgExamsDblClick(Sender: TObject);
var
  s: string;
  ex: TExam;
begin
  s := sgExams.cells[0, sgExams.Row];
  if ((s <> '') and (s <> ' ')) and (sgExams.Row <> 0) then
  begin
    frmAddExamDialog := TfrmAddExamDialog.Create(self);
    frmAddExamDialog.Year := Year;

    ex := ExamList[sgExams.Row - 1];
    frmAddExamDialog.dbcbeDisc.keyvalue := ex.IkDisc;
    frmAddExamDialog.dbcbeVid.keyvalue := ex.IkVidSdachi;
    frmAddExamDialog.eVedNum.Value := ex.NVed;
    frmAddExamDialog.KatZachIK := dbcbeCategory.KeyValue;
    if ex.Mark > 0 then
      frmAddExamDialog.eMark.Value := ex.Mark;
    frmAddExamDialog.EditMode := true;

    frmAddExamDialog.ShowModal;
    frmAddExamDialog.Free;
    Sync;
  end;
end;

procedure TfrmPostupDlg.sbDelExamClick(Sender: TObject);
var
  ex: TExam;
begin
  sgExamsClick(Sender);
  ex := ExamList[sgExams.Row - 1];
  ex.delete := true;
  if not(ex.new) then
    DeleteExamList.Add(ex);
  ExamList.Remove(ex);
  Sync;
end;

procedure TfrmPostupDlg.SbDelSpecClick(Sender: TObject);
var
  Spec: TAdditionalSpec;
begin

  sgExamsClick(Sender);
  Spec := AbitList.lAdditionalSpec[sgAdditionalSpec.Row - 1];
  Spec.delete := true;
  if not(Spec.new) then
    AbitList.ldelAdditionalSpec.Add(Spec);
  AbitList.lAdditionalSpec.Remove(Spec);
  AbitList.AutoNumDecrement(Spec.Num);
  Sync;
end;

procedure TfrmPostupDlg.SetTargetOrganizationsVisible(isVisible: boolean);
begin
  dbcbeTargetOrganization.Visible:= isVisible;
  lOrganiz.Visible:= isVisible;
  lOrganiz0.Visible:= isVisible;
end;

procedure TfrmPostupDlg.bbOKClick(Sender: TObject);
begin
  actOKExecute(Sender);
end;

procedure TfrmPostupDlg.bbOkPrintClick(Sender: TObject);
begin
  actOKExecute(Sender);
  TAbitOtchetsController.Instance.ExportZayavl(AbitList.NNAbit);
  if (cbReal.checked) then
    TAbitOtchetsController.Instance.ExportEnrollAgreement(AbitList.NNAbit);
end;

procedure TfrmPostupDlg.bGetCertDataClick(Sender: TObject);
var
  CertD: TfrmEGECertificateCheck;
  // fn,ln,pn,ps,pnum:string;
var
  i: integer;
  edesc: TExamDescription;
  e: TExam;
  docDS: TAdoDataset;
begin

  { if HostForm=nil then
    begin
    showmessage('Невозможно проверить сертификат для этого абитуриента, воспользуйтесь другим доступным способом');
    exit;
    end; }

  // если добавляем абитуриента
  if HostForm <> nil then
    with HostForm do
    begin
      ln := eFam.Text;
      fn := eName.Text;
      pn := eMid.Text;

      ps := '';
      pnum := '';
      // ищем паспорт
      for i := 0 to sgDocKeys.Rowcount - 2 do
        if sgDocKeys.cells[1, i] = '4' then // id Типа
        begin
          ps := sgDocs.cells[1, i + 1]; // серия
          pnum := sgDocs.cells[2, i + 1] // номер
        end;
    end
  else
    // если редактируем
    with dmStudentSelectionProcs.adoSelDocuments do
    begin
      First;
      for i := 0 to RecordCount - 1 do
        if FieldByName('Ik_vid_doc').AsInteger = PassportRF then
        // id Типа паспорт РФ
        begin
          ps := FieldByName('Cd_seria').AsString; // серия
          pnum := FieldByName('Np_number').AsString; // номер
          break;
        end
        else
          Next;
    end;

  if (ps = '') or (pnum = '') then
  begin
    showmessage
      ('Для того, чтобы проверить сертификат, необходимы паспортные данные абитуриента! Вы можете ввести их на вкладке "Документы" в форме добавления абитуриента');
    exit;
  end;

  CertD := TfrmEGECertificateCheck.Create(self, ps, pnum, ln, fn, pn);
  CertD.ShowModal;
  for i := 0 to CertD.ExportedExams.Count - 1 do
  begin
    edesc := CertD.ExportedExams[i];
    e := TExam.Create;
    e.IkVidSdachi := 5;
    e.VidSdachi := 'ЕГЭ';
    e.IkDisc := -1;
    e.Disc := edesc.Subject;
    try
      // пытаемся перевести в новый формат оценок ЕГЭ
      e.Mark := strtoint(copy(edesc.Mark, 1, Pos(',', edesc.Mark) - 1));
      // Round(StrToFloat(edesc.Mark));
    except
      // старый формат оценок ЕГЭ
      e.Mark := Round(StrToFloat(edesc.Mark));
    end;
    e.new := true;
    e.NVed := edesc.CertNumber;
    ExamList.Add(e);
  end;
  Sync;
end;



procedure TfrmPostupDlg.ButtonsCheck;
begin
  if dbcbeCategory.Text='' then dbcbeCategory.Color := clCream
    else dbcbeCategory.Color := clWindow;


  LoadTargetOrganizations;


  if CheckFields then
  begin
    bbOK.Enabled := true;
    bbApply.Enabled := true;
    bbOkPrint.Enabled := true;
  end
  else
  begin
    bbOK.Enabled := false;
    bbApply.Enabled := false;
    bbOkPrint.Enabled := false;
  end;
end;

procedure TfrmPostupDlg.cbIsMainClick(Sender: TObject);
begin
  AbitList.IsMain :=  cbIsMain.checked;

  if not cbIsMain.checked then
  begin
    cbReal.checked := false;
    AbitList.real := false;
  end;
end;

procedure TfrmPostupDlg.cbRealClick(Sender: TObject);
begin
  AbitList.real := cbReal.checked;
  dtpDateOriginal.Enabled := cbReal.checked;
  if cbReal.checked then
  begin
    cbIsMain.checked := true;
    AbitList.IsMain := true;
    if (dtpDateOriginal.Value = null) and (Year = YearOf(Date())) then
      dtpDateOriginal.Value := Date();
  end
  else
    dtpDateOriginal.Value := null;
end;

procedure TfrmPostupDlg.dbcbeRecruitChange(Sender: TObject);
begin
  if IsAdditional then
    exit;

  GetKatZach(dbcbeRecruit.KeyValue); //настройка категорий зачисления

  try
    if (not(dbcbeRecruit.Text = '')) and (not(NNRecord = 0)) then
    begin
      
      { dmAbiturientAction.aspGetNewNum.Active:=false;
        dmAbiturientAction.aspGetNewNum.Parameters[1].Value:=dbcbeRecruit.KeyValue;
        dmAbiturientAction.aspGetNewNum.execproc; }
    end;
  except
    on e: EOleException do
    begin
      dm.DBConnect.RollbackTrans;
      raise EApplicationException.Create
        ('Невозможно автоматически сгенерировать номер заявления! Возможно, диапазон задан неверно.',
        EOleException.Create(e.Message, e.ErrorCode, '', '', 0));
    end;
  end;

  ButtonsCheck;
end;

function ChangeMonthDayPlaces(Date: TDateTime): string;
var
  s1: string;
begin
  result := DatetoStr(Date);
  s1 := result;
  result[1] := s1[4];
  result[2] := s1[5];
  result[4] := s1[1];
  result[5] := s1[2];
end;

procedure TfrmPostupDlg.actApplyExecute(Sender: TObject);
var
  i, j: integer;
  ex: TExam;
  Spec: TAdditionalSpec;
  AddExProc: TADOStoredProc;
  stream: TMemoryStream;
  Log: ILogger;

begin
  Log := TNullLogger.GetInstance; // TMemoLogger.GetInstance; //

  AbitList.RecruitNum := dbcbeRecruit.keyvalue;
  AbitList.Date := dbdteList.Value;
  AbitList.CatNum := dbcbeCategory.keyvalue;
  AbitList.AvgBall := eAvgBall.Value;

  try
    dm.DBConnect.BeginTrans;
    if (HostForm <> nil) then
    begin
      with HostForm do
      begin
        dmAbiturientAction.aspAppendAbit.Parameters.clear;
        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter
          ('@RETURN_VALUE', ftInteger, pdReturnValue, 0, 1);
        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@flag',
          ftInteger, pdInput, 0, 1);
        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@clastn',
          ftString, pdInput, 40, eFam.Text);
        Log.LogMessage('clastn=' + eFam.Text);
        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@firstn',
          ftString, pdInput, 40, eName.Text);
        Log.LogMessage('firstn=' + eName.Text);
        if not(eMid.Text = '') then
          dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@otch',
            ftString, pdInput, 40, eMid.Text)
        else
          dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@otch',
            ftString, pdInput, 40, NULL);
        Log.LogMessage('otch=' + eMid.Text);
        if not(DatetoStr(dbdteBirthDate.Value) = '  .  .    ') then
          dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@birth',
            ftDateTime, pdInput, 0, dbdteBirthDate.Value)
        else
          dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@birth',
            ftDateTime, pdInput, 0, NULL);
        Log.LogMessage('birth=' + dbdteBirthDate.Text);
        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter
          ('@placebirth', ftString, pdInput, 300, eBirthPlace.Text);
        Log.LogMessage('placebirth=' + eBirthPlace.Text);
        if cbInvalid.checked then
          dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@inval',
            ftBoolean, pdInput, 0, 1)
        else
          dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@inval',
            ftBoolean, pdInput, 0, 0);
        Log.LogMessage('inval=' +
          inttostr(dmAbiturientAction.aspAppendAbit.Parameters.ParamByName
          ('@inval').Value));
        if cbChildren.checked then
          dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@deti',
            ftBoolean, pdInput, 0, 1)
        else
          dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@deti',
            ftBoolean, pdInput, 0, 0);
        Log.LogMessage('deti=' +
          inttostr(dmAbiturientAction.aspAppendAbit.Parameters.ParamByName
          ('@deti').Value));
        if cbJob.checked then
          dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@rab',
            ftBoolean, pdInput, 0, 1)
        else
          dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@rab',
            ftBoolean, pdInput, 0, 0);
        Log.LogMessage
          ('rab=' + inttostr(dmAbiturientAction.aspAppendAbit.Parameters.
          ParamByName('@rab').Value));
        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@sex',
          ftBoolean, pdInput, 0, rgSex.ItemIndex);
        Log.LogMessage
          ('sex=' + inttostr(dmAbiturientAction.aspAppendAbit.Parameters.
          ParamByName('@sex').Value));
        if cbAppNeed.checked then
          dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter
            ('@obchegit', ftBoolean, pdInput, 0, 1)
        else
          dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter
            ('@obchegit', ftBoolean, pdInput, 0, 0);
        Log.LogMessage('obchegit=' +
          inttostr(dmAbiturientAction.aspAppendAbit.Parameters.ParamByName
          ('@obchegit').Value));

        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@ik_medal',
          ftInteger, pdInput, 0, dbcbeMedal.keyvalue);
        Log.LogMessage('ik_medal=' +
          inttostr(dmAbiturientAction.aspAppendAbit.Parameters.ParamByName
          ('@ik_medal').Value));
        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter
          ('@ik_voen_zvanie', ftInteger, pdInput, 0,
          dbcbeMilitaryState.keyvalue);
        Log.LogMessage('ik_voen_zvanie=' +
          inttostr(dmAbiturientAction.aspAppendAbit.Parameters.ParamByName
          ('@ik_voen_zvanie').Value));
        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@Sottel',
          ftString, pdInput, 50, eCellphone.Text);
        Log.LogMessage('Sottel=' + dmAbiturientAction.aspAppendAbit.Parameters.
          ParamByName('@Sottel').Value);
        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@telefon',
          ftString, pdInput, 20, ePhone.Text);
        Log.LogMessage('telefon=' + dmAbiturientAction.aspAppendAbit.Parameters.
          ParamByName('@telefon').Value);
        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@Email',
          ftString, pdInput, 50, eEmail.Text);
        Log.LogMessage('Email=' + dmAbiturientAction.aspAppendAbit.Parameters.
          ParamByName('@Email').Value);

        // сохранение фото
        if (iphoto.Picture.Graphic <> nil) then
        begin
          if (odPhoto.FileName <> '') then
            dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter
              ('@Photo', ftVarBytes, pdInput, 2147483647,
              CreateVariantByFile(odPhoto.FileName))
          else
          begin
            stream := TMemoryStream.Create;
            iphoto.Picture.Graphic.SaveToStream(stream);
            dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter
              ('@Photo', ftVarBytes, pdInput, 2147483647,
              CreateVariantByStream(stream))
          end;
        end
        else
          dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@Photo',
            ftVarBytes, pdInput, 2147483647, NULL);

        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@Pens',
          ftInteger, pdInput, 0, NULL);
        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@grazd',
          ftInteger, pdInput, 0, dbcbeCitizenship.keyvalue);
        Log.LogMessage('grazd=' +
          inttostr(dmAbiturientAction.aspAppendAbit.Parameters.ParamByName
          ('@grazd').Value));
        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@podg',
          ftInteger, pdInput, 0, dbcbePreparation.keyvalue);
        Log.LogMessage('podg=' +
          inttostr(dmAbiturientAction.aspAppendAbit.Parameters.ParamByName
          ('@podg').Value));

        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@nac',
          ftInteger, pdInput, 0, NULL);
        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@ob_rab',
          ftInteger, pdInput, 0, dbcbeSocWork.keyvalue);
        Log.LogMessage('ob_rab=' +
          inttostr(dmAbiturientAction.aspAppendAbit.Parameters.ParamByName
          ('@ob_rab').Value));
        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@sempol',
          ftInteger, pdInput, 0, dbcbeFamState.keyvalue);
        Log.LogMessage('sempol=' +
          inttostr(dmAbiturientAction.aspAppendAbit.Parameters.ParamByName
          ('@sempol').Value));
        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@spec_uch',
          ftInteger, pdInput, 0, dbcbeSpecCount.keyvalue);

        Log.LogMessage('spec_uch=' +
          inttostr(dmAbiturientAction.aspAppendAbit.Parameters.ParamByName
          ('@spec_uch').Value));
        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@zaved',
          ftInteger, pdInput, 0, dbcbeSchool.keyvalue);
        Log.LogMessage('zaved=' +
          inttostr(dmAbiturientAction.aspAppendAbit.Parameters.ParamByName
          ('@zaved').Value));
        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@godokon',
          ftInteger, pdInput, 0, eYearFinished.Value);
        Log.LogMessage('godokon=' +
          inttostr(dmAbiturientAction.aspAppendAbit.Parameters.ParamByName
          ('@godokon').Value));
        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@ind_f',
          ftString, pdInput, 10, '');

        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@street_f',
          ftInteger, pdInput, 0, NULL);

        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@Build_f',
          ftString, pdInput, 10, '');

        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@Stroen_f',
          ftString, pdInput, 10, NULL);

        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@Kvart_f',
          ftString, pdInput, 10, '');

        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@ind_pr',
          ftString, pdInput, 10, '');

        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter
          ('@street_pr', ftInteger, pdInput, 0, NULL);

        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@Build_pr',
          ftString, pdInput, 10, '');

        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter
          ('@Stroen_pr', ftString, pdInput, 10, NULL);

        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@Kvart_pr',
          ftString, pdInput, 10, '');

        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@dopsved',
          ftString, pdInput, 2000, eAddInfo.Text);
        Log.LogMessage('dopsved=' + dmAbiturientAction.aspAppendAbit.Parameters.
          ParamByName('@dopsved').Value);
        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@code',
          ftInteger, pdInput, 0, NULL);
        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@StazYear',
          ftInteger, pdInput, 0, eXPYear.Value);

        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter
          ('@StazMonth', ftInteger, pdInput, 0, eXPMonth.Value);

        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter
          ('@cDolgnost', ftString, pdInput, 150, eDuty.Text);
        Log.LogMessage('cDolgnost=' + dmAbiturientAction.aspAppendAbit.
          Parameters.ParamByName('@cDolgnost').Value);
        if not(dbcbeEnterprise.keyvalue = -1) then
          dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter
            ('@ik_pred', ftInteger, pdInput, 0, dbcbeEnterprise.keyvalue)
        else
          dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter
            ('@ik_pred', ftInteger, pdInput, 0, NULL);

        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@CLgot',
          ftString, pdInput, 500, eBenefits.Text);
        Log.LogMessage('CLgot=' + dmAbiturientAction.aspAppendAbit.Parameters.
          ParamByName('@CLgot').Value);

        dmAbiturientAction.aspAppendAbit.ExecProc;

        IDStudent := dmAbiturientAction.aspAppendAbit.Parameters.ParamByName
          ('@Return_Value').Value;

        for i := 0 to sgLangKeys.Rowcount - 2 do
        begin

          with dmStudentActions.aspAddLang.Parameters do
          begin
            clear;
            AddParameter;
            Items[0].Value := strtoint(sgLangKeys.cells[2, i]);
            AddParameter;
            Items[1].Value := IDStudent;
            AddParameter;
            Items[2].Value := 1;
            AddParameter;
            Items[3].Value := strtoint(sgLangKeys.cells[1, i]);
          end;
          dmStudentActions.aspAddLang.ExecProc;
        end;

        for i := 0 to sgRelKeys.Rowcount - 2 do
        begin

          with dmStudentActions.aspAddRelative.Parameters do
          begin
            ParamByName('@flag').Value := 1;
            ParamByName('@code').Value := IDStudent;
            ParamByName('@memb').Value := strtoint(sgRelKeys.cells[1, i]);
            ParamByName('@post').Value := sgRelatives.cells[4, i + 1];
            if sgRelKeys.cells[2, i] <> '' then
              ParamByName('@pred').Value := strtoint(sgRelKeys.cells[2, i])
            else
              ParamByName('@pred').Value := NULL;
            ParamByName('@fio').Value := sgRelatives.cells[0, i + 1];
            ParamByName('@adres').Value := sgRelatives.cells[6, i + 1];
            ParamByName('@tel').Value := sgRelatives.cells[5, i + 1];
            if sgRelatives.cells[2, i + 1] = '' then
              ParamByName('@birth').Value := NULL
            else
              ParamByName('@birth').Value :=
                ChangeMonthDayPlaces(StrtoDate(sgRelatives.cells[2, i + 1]));
            ParamByName('@rabTel').Value := sgRelatives.cells[7, i + 1];
          end;
          dmStudentActions.aspAddRelative.ExecProc;
        end;

        TPersonController.Instance.AddDocuments(IDStudent, DocRecordList);

        { FAddDocument := TAddDocument.Create(IDStudent);
          for i := 0 to DocRecordList.Count - 1 do
          with DocRecordList do
          begin
          FAddDocument.Add(Items[i].ikDocVid,Items[i].balls, Items[i].seria, Items[i].number,
          Items[i].kem_vidan, Items[i].addinfo, Items[i].isreal, Items[i].get_date, Items[i].ikDisc); }
        { with dmStudentActions.aspAddDoc.Parameters do
          begin
          Clear;
          CreateParameter('@ncode',ftInteger,pdInput,0,IDStudent);
          CreateParameter('@ik_vid_doc',ftInteger,pdInput,0,DocRecordList.Items[i].ikDocVid);
          CreateParameter('@sd_seria',ftString,pdInput,10,DocRecordList.Items[i].seria);
          CreateParameter('@np_number',ftString,pdInput,15,DocRecordList.Items[i].number);
          CreateParameter('@dd_vidan',ftDateTime,pdInput,0,DocRecordList.Items[i].get_date);
          CreateParameter('@cd_kem_vidan',ftString,pdInput,500,DocRecordList.Items[i].kem_vidan);
          CreateParameter('@isreal',ftBoolean,pdInput,0,DocRecordList.Items[i].isreal);
          CreateParameter('@addinfo',ftString,pdInput,500,DocRecordList.Items[i].addinfo);
          CreateParameter('@balls',ftInteger,pdInput,0,DocRecordList.Items[i].balls);
          CreateParameter('@ikDisc',ftInteger,pdInput,0,DocRecordList.Items[i].ikDisc);
          end;
          dmStudentActions.aspAddDoc.ExecProc;
          end; }

        if Assigned(AddressRecordList) then
          for i := 0 to AddressRecordList.Count - 1 do
          begin
            with dmAdress.aspAddAddress.Parameters do
            begin

              Items[1].Value := IDStudent;
              Items[2].Value := TAddressRecord(AddressRecordList[i])
                .ikAddressType;
              Items[3].Value := TAddressRecord(AddressRecordList[i]).Ik_street;
              Items[4].Value := TAddressRecord(AddressRecordList[i]).Building;
              Items[5].Value := TAddressRecord(AddressRecordList[i]).Struct;
              Items[6].Value := TAddressRecord(AddressRecordList[i]).Flat;
              Items[7].Value := TAddressRecord(AddressRecordList[i]).Index;

              if TAddressRecord(AddressRecordList[i]).DateBegin <> '  .  .    '
              then
                Items[8].Value := StrtoDate(TAddressRecord(AddressRecordList[i])
                  .DateBegin)
              else
                Items[8].Value := NULL;
              if TAddressRecord(AddressRecordList[i]).DateEnd <> '  .  .    '
              then
                Items[9].Value :=
                  StrtoDate(TAddressRecord(AddressRecordList[i]).DateEnd)
              else
                Items[9].Value := NULL;
            end;
            dmAdress.aspAddAddress.ExecProc;
          end;

      end;
    end;

    for j := 0 to (DeleteExamList.Count - 1) do
    begin
      ex := DeleteExamList.Items[j];
      dmAbiturientAction.aspAbitDelExam.Active := false;
      dmAbiturientAction.aspAbitDelExam.Parameters.Items[1].Value := ex.ID;
      if ex.delete then
        dmAbiturientAction.aspAbitDelExam.ExecProc;
    end;

    if AbitList.ldelAdditionalSpec <> nil then
    begin
      for j := 0 to (AbitList.ldelAdditionalSpec.Count - 1) do
      begin
        Spec := AbitList.ldelAdditionalSpec.Items[j];
        dmAbiturientAction.aspdelSpec.Active := false;
        dmAbiturientAction.aspdelSpec.Parameters.Items[1].Value := Spec.ID;
        if Spec.delete then
          dmAbiturientAction.aspdelSpec.ExecProc;
      end;
    end;

    if AbitList.delete then
    begin

      for j := 0 to (ExamList.Count - 1) do
      begin
        ex := ExamList.Items[j];
        dmAbiturientAction.aspAbitDelExam.Active := false;
        dmAbiturientAction.aspAbitDelExam.Parameters.Items[1].Value := ex.ID;
        dmAbiturientAction.aspAbitDelExam.ExecProc;
      end;

      for j := 0 to (AbitList.lAdditionalSpec.Count - 1) do
      begin
        Spec := AbitList.ldelAdditionalSpec.Items[j];
        dmAbiturientAction.aspdelSpec.Active := false;
        dmAbiturientAction.aspdelSpec.Parameters.Items[1].Value := Spec.ID;
        if Spec.delete then
          dmAbiturientAction.aspdelSpec.ExecProc;
      end;

      dmAbiturientAction.aspAbitDelPostup.Active := false;
      dmAbiturientAction.aspAbitDelPostup.Parameters.Items[1].Value :=
        AbitList.NNAbit;

    end
    else
    begin
      dmAbiturientAction.aspAddPostup.Active := false;

      if AbitList.new then
      begin
        with dmAbiturientAction.aspAddPostup.Parameters do
        begin

          Items[1].Value := AbitList.Num;

          Items[2].Value := IDStudent;

          Items[3].Value := AbitList.RecruitNum;

          Items[4].Value := AbitList.CatNum;

          Items[5].Value := AbitList.Date;

          Items[6].Value := AbitList.real;

          Items[7].Value := AbitList.IsMain;

          Items[8].Value := AbitList.AvgBall;
        end;

        dmAbiturientAction.aspAddPostup.ExecProc;
        if not(dmAbiturientAction.aspAddPostup.Parameters.ParamByName
          ('@Return_Value').Value = NULL) then
          AbitList.NNAbit := dmAbiturientAction.aspAddPostup.Parameters.
            ParamByName('@Return_Value').Value;

      end
      else
      begin
        with dmAbiturientAction.aspEditPostup.Parameters do
        begin

          Items[1].Value := AbitList.Num;

          Items[2].Value := IDStudent;

          Items[3].Value := AbitList.RecruitNum;

          Items[4].Value := AbitList.CatNum;

          Items[5].Value := AbitList.Date;

          Items[6].Value := AbitList.NNAbit;

          Items[7].Value := cbReal.checked;

          Items[8].Value := cbIsMain.checked;

          Items[9].Value := AbitList.AvgBall;

        end;
        dmAbiturientAction.aspEditPostup.ExecProc;

        if IsOnline then
        begin
          dmAbiturientAction.aspAbitConfirmOnline.Parameters.Items[1].Value :=
            AbitList.NNAbit;
          dmAbiturientAction.aspAbitConfirmOnline.ExecProc;
        end;
      end;

      for j := 0 to (ExamList.Count - 1) do
      begin
        ex := ExamList.Items[j];

        if ex.IkDisc = -1 then
          AddExProc := dmAbiturientAction.aspAddExamByName
        else
          AddExProc := dmAbiturientAction.aspAddExam;

        AddExProc.Active := false;

        with AddExProc.Parameters do
        begin

          if (ex.Mark = -1) then
            Items[1].Value := NULL
          else
            Items[1].Value := ex.Mark;

          Items[2].Value := AbitList.NNAbit;

          if ex.IkDisc = -1 then
            Items[3].Value := ex.Disc
          else
            Items[3].Value := ex.IkDisc;

          Items[4].Value := ex.IkVidSdachi;

          Items[5].Value := ex.NVed;
        end;
        if ex.new then
        begin
          AddExProc.ExecProc;
        end;
      end;

      for j := 0 to (AbitList.lAdditionalSpec.Count - 1) do
      begin
        Spec := AbitList.lAdditionalSpec.Items[j];
        dmAbiturientAction.aspAddSpec.Active := false;
        with dmAbiturientAction.aspAddSpec.Parameters do
        begin
          Items[1].Value := Spec.ik_recruit;
          Items[2].Value := AbitList.NNAbit;
          Items[3].Value := Spec.Num;
        end;
        if Spec.new then
        begin
          dmAbiturientAction.aspAddSpec.ExecProc;
        end;
      end;
    end;

    dm.DBConnect.CommitTrans;

    for j := 0 to (ExamList.Count - 1) do
    begin
      ex := ExamList.Items[j];
      ex.new := false;
    end;

    for j := 0 to (AbitList.lAdditionalSpec.Count - 1) do
    begin
      Spec := AbitList.lAdditionalSpec.Items[j];
      Spec.new := false;
    end;

    AbitList.new := false;
    if not(HostForm = nil) then
      HostForm.Close;
    Close;

  except
    on e: exception do
    begin
      // Showmessage('Введены некорректные данные! Абитуриент не добавлен! ОШИБКА: '+e.Message);
      dm.DBConnect.RollbackTrans;
      raise EApplicationException.Create
        ('Введены некорректные данные! Абитуриент не добавлен!', e);
    end;
  end;
end;

function TfrmPostupDlg.FillAbitList(Dataset: TAdoDataset): TAbitList;
var
  addSpec: TAdditionalSpec;
begin
  IDStudent := Dataset.FieldValues['ncode'];
  AbitList := TAbitList.Create;
  AbitList.new := false;
  AbitList.NNAbit := Dataset.FieldValues['NN_abit'];
  if Dataset.FieldValues['RegNomer'] <> NULL then
    AbitList.Num := Dataset.FieldValues['RegNomer'];
  if Dataset.FieldValues['NNRecord'] <> NULL then
    AbitList.RecruitNum := Dataset.FieldValues['NNRecord'];
  if Dataset.FieldValues['ik_kat_zach'] <> NULL then
    AbitList.CatNum := Dataset.FieldValues['ik_kat_zach'];
  if Dataset.FieldValues['dd_pod_zayav'] <> NULL then
    AbitList.Date := Dataset.FieldValues['dd_pod_zayav'];
  if Dataset.FieldValues['Cname_kat_zach'] <> NULL then
    AbitList.Cat := Dataset.FieldValues['Cname_kat_zach'];
  if Dataset.FieldValues['NaborName'] <> NULL then
    AbitList.Recruit := Dataset.FieldValues['NaborName'];
  if Dataset.FieldValues['Realy_postup'] <> NULL then
    AbitList.real := Dataset.FieldValues['Realy_postup'];
  if Dataset.FieldValues['SchoolAverMark'] <> NULL then
    AbitList.AvgBall := Dataset.FieldValues['SchoolAverMark'];
  if Dataset.FieldValues['IsMain'] <> NULL then
    AbitList.IsMain := Dataset.FieldValues['IsMain'];
  if Dataset.FieldValues['dateOriginal'] <> NULL then
    AbitList.DateOriginal := Dataset.FieldValues['dateOriginal'];
  AbitList.closed := onlyreading;

  AbitList.lAdditionalSpec := Tlist.Create;
  AbitList.ldelAdditionalSpec := Tlist.Create;

  with dmAbiturientAction.aspGetAdditionalspec do
  begin
    Active := false;
    Parameters.clear;
    Parameters.AddParameter;
    Parameters[0].Value := AbitList.NNAbit;
    open;
    First;
  end;

  while not dmAbiturientAction.aspGetAdditionalspec.Eof do
  begin
    addSpec := TAdditionalSpec.Create;
    addSpec.ID := dmAbiturientAction.aspGetAdditionalspec.FieldValues
      ['ik_specAbit'];
    addSpec.Num := dmAbiturientAction.aspGetAdditionalspec.FieldValues
      ['SpecNumber'];
    addSpec.ik_recruit := dmAbiturientAction.aspGetAdditionalspec.FieldValues
      ['NNrecord'];
    addSpec.name_recruit := dmAbiturientAction.aspGetAdditionalspec.FieldValues
      ['Cname_spec'];
    AbitList.lAdditionalSpec.Add(addSpec);
    dmAbiturientAction.aspGetAdditionalspec.Next;
  end;

  if onlyreading then
  begin
    AbitList.closed := true;
    self.Caption := self.Caption + ' (только просмотр)'
  end;
  result := AbitList;
end;

function TfrmPostupDlg.AddExam(Dataset: TAdoDataset): TExam;
var
  new: TExam;
begin
  new := TExam.Create;
  if Dataset.FieldValues['id'] <> NULL then
    new.ID := Dataset.FieldValues['id'];
  if Dataset.FieldValues['NN_abit'] <> NULL then
    new.NNAbit := Dataset.FieldValues['NN_abit'];
  if Dataset.FieldValues['ik_disc'] <> NULL then
    new.IkDisc := Dataset.FieldValues['ik_disc'];
  if Dataset.FieldValues['ik_sdach'] <> NULL then
    new.IkVidSdachi := Dataset.FieldValues['ik_sdach'];
  if Dataset.FieldValues['id_rasp_kab'] <> NULL then
    new.ik_rasp_kab := Dataset.FieldValues['id_rasp_kab'];
  if Dataset.FieldValues['cosenka'] <> NULL then
    new.Mark := Dataset.FieldValues['cosenka']
  else
    new.Mark := -1;
  if Dataset.FieldValues['NNVedom'] <> NULL then
    new.NVed := Dataset.FieldValues['NNVedom'];
  if Dataset.FieldValues['сName_disc'] <> NULL then
    new.Disc := Dataset.FieldValues['сName_disc'];
  if Dataset.FieldValues['cName_sdach'] <> NULL then
    new.VidSdachi := Dataset.FieldValues['cName_sdach'];
  frmPostupDlg.ExamList.Add(new);
  result := new;
end;

procedure TfrmPostupDlg.actOKExecute(Sender: TObject);
begin
  actApplyExecute(Sender);
end;

procedure TfrmPostupDlg.eNumChange(Sender: TObject);
begin
  ButtonsCheck;
end;

{ TAbitList }

procedure TAbitList.AutoNumDecrement(deleted: integer);
var
  i: integer;
  Spec: TAdditionalSpec;
begin
  for i := 0 to lAdditionalSpec.Count - 1 do
  begin
    Spec := lAdditionalSpec[i];
    if Spec.Num > deleted then
      Spec.Num := Spec.Num - 1;
  end;
end;

function TAbitList.NewSpecNum: integer;
var
  i: integer;
  Spec: TAdditionalSpec;
begin
  result := 1;
  for i := 0 to lAdditionalSpec.Count - 1 do
  begin
    Spec := lAdditionalSpec[i];
    if Spec.Num > result then
      result := Spec.Num;
  end;
  inc(result);
end;

end.
