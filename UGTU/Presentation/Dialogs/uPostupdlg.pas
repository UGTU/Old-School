unit uPostupdlg;
    {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, Grids, DBGridEh, StdCtrls, ActnList, Buttons,
  ExtCtrls, adodb, db, DBCtrlsEh, DBLookupEh, Mask, uAbitDialog, uStudDlg, uMain, uAbitOtchetsController, comObj, uCertificateDialog,
  System.Actions;

  type TAbitList = class
  public
  Num,RecruitNum,CatNum,NNAbit:integer;
  Date:TDateTime;
  Recruit,Cat:string;
  new,delete,closed,real, IsMain:boolean;
  lAdditionalSpec:Tlist;
  ldelAdditionalSpec:Tlist;
  AvgBall:real;

  function NewSpecNum:integer;
 // constructor Create;
  Procedure AutoNumDecrement(deleted:integer);
  end;

  type TAdditionalSpec = class
  public
  ID, num, ik_recruit:integer;
  name_recruit:string;
  new,delete:boolean;
  end;

  type TExam = class
  public
  ID,NNAbit,IkDisc,IkVidSdachi,ik_rasp_kab,Mark:integer;
  VidSdachi,Disc, NVed:string;
  new,delete:boolean;
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
  private
    { Private declarations }
  public
  HostForm:TfrmAbitCardDialog;
  IDStudent, IDpostup, IkRecruit, Num, IdCat:integer;
  commited, onlyreading, IsAdditional, IsOnline, HasAddSpec:boolean;
  AbitList:TAbitList;
  ExamList:TList;
  DeleteExamList:Tlist;
  CurrentExam:TList;
  fn,ln,pn,ps,pnum:string;
  procedure Sync;
  procedure ExamSync;
  procedure AdditionalSpecSync;
  procedure ButtonsCheck;
  function FillAbitList(Dataset:TAdoDataset):TabitList;
  function AddExam(Dataset: TAdoDataset):TExam;

  end;

var
  frmPostupDlg: TfrmPostupDlg;


implementation

uses uAddExam, Math, uDM, jpeg, VarfileUtils, uDMStudentSelectionProcs, uDMStudentData,
  uDMStudentActions, uDMAbiturientAction, uAddSpecAbit, ExceptionBase, uDMAdress, uXMLEGEReader,
  GeneralController, ConstantRepository, CommonIntf, CommonIntfImpl;
{$R *.dfm}

function CheckFields:boolean;
begin
result:=true;
with frmPostupDlg do
begin
if (dbcbeRecruit.Text='')
or(dbcbeCategory.Text='')
or(dbdteList.Text='  .  .    ')
or(AbitList=nil) then result:=false;

end;
end;


procedure TfrmPostupDlg.AdditionalSpecSync;
var i:integer;
Spec:TAdditionalSpec;
begin
sgAdditionalSpec.Rowcount:=2;

sgAdditionalSpec.cells[0,1]:=' ';
sgAdditionalSpec.Cells[1,1]:=' ';

if AbitList.lAdditionalSpec=nil then exit;
for i:=0 to (AbitList.lAdditionalSpec.Count-1) do
begin
Spec:=AbitList.lAdditionalSpec[i];

sgAdditionalSpec.Cells[0,sgAdditionalSpec.Rowcount-1]:=inttostr(Spec.num);
sgAdditionalSpec.Cells[1,sgAdditionalSpec.Rowcount-1]:=Spec.name_recruit;
sgAdditionalSpec.Rowcount:=sgAdditionalSpec.Rowcount+1;
end;

sgAdditionalSpec.Cells[0,sgAdditionalSpec.Rowcount-1]:=' ';
sgAdditionalSpec.Cells[1,sgAdditionalSpec.Rowcount-1]:=' ';
end;


procedure TfrmPostupDlg.ExamSync;
var i:integer;
exam:TExam;
begin
sgExams.Rowcount:=2;
sgExams.Cells[0,1]:=' ';
sgExams.Cells[1,1]:=' ';
sgExams.Cells[2,1]:=' ';
sgExams.Cells[3,1]:=' ';

if ExamList=nil then exit;
for i:=0 to (ExamList.Count-1) do
begin
exam:=ExamList[i];
if exam.delete then begin
sgExams.Cells[0,sgExams.Rowcount-1]:='Удален';
sgExams.Cells[1,sgExams.Rowcount-1]:='';
sgExams.Cells[2,sgExams.Rowcount-1]:='';
sgExams.Cells[3,sgExams.Rowcount-1]:='';
end else begin
sgExams.Cells[0,sgExams.Rowcount-1]:=Exam.Disc;
sgExams.Cells[1,sgExams.Rowcount-1]:=Exam.VidSdachi;
if (Exam.Mark=-1) then sgExams.Cells[2,sgExams.Rowcount-1]:='нет' else
sgExams.Cells[2,sgExams.Rowcount-1]:=inttostr(Exam.Mark);
sgExams.Cells[3,sgExams.Rowcount-1]:=Exam.NVed;
end;
sgExams.Rowcount:=sgExams.Rowcount+1;
end;


sgExams.Cells[0,sgExams.Rowcount-1]:=' ';
sgExams.Cells[1,sgExams.Rowcount-1]:=' ';
sgExams.Cells[2,sgExams.Rowcount-1]:=' ';
sgExams.Cells[3,sgExams.Rowcount-1]:=' ';

end;


procedure TfrmPostupDlg.Sync;
//var i:integer;
//rec:TAbitList;
//exam:TExam;
begin
if (AbitList=nil) then exit;

if (dbcbeCategory.keyvalue<=0) then dbcbeCategory.keyvalue:=AbitList.CatNum;
if (dbdteList.Value<=0) then dbdteList.Value:=AbitList.Date;
if (dbcbeRecruit.keyvalue<=0) then dbcbeRecruit.KeyValue:=AbitList.RecruitNum;
if (eAvgBall.value<=0) then eAvgBall.value:=AbitList.AvgBall;

cbReal.checked:=AbitList.real;
cbIsMain.Checked:=AbitList.IsMain;

ExamSync;
AdditionalSpecSync;
ButtonsCheck;
sgExamsClick(self);
sgAdditionalSpecClick(self);
end;

procedure TfrmPostupDlg.FormShow(Sender: TObject);
var j:integer;
begin
commited:=false;
if AbitList=nil then
  AbitList:=TAbitlist.Create;
AbitList.lAdditionalSpec:=TList.Create;
AbitList.ldelAdditionalSpec:=TList.Create;
AbitList.new:=true;
ExamList:=Tlist.Create;
deleteexamlist:=Tlist.Create;
Text:= 'Заявление на поступление';

//if HostForm=nil then
//begin
//   tempDS := TGeneralController.Instance.GetNewADODataSet(true);
//   tempDS.CommandText := 'select * from Person ' + IntToStr(IDpostup);
  //bGetCertData.Visible:=false;
//end;


if HasAddSpec then GroupBox3.Visible:=true
  else GroupBox3.Visible:=false;

sgExams.Cells[0,0]:='Дисциплина';
sgExams.Cells[1,0]:='Вид сдачи';
sgExams.Cells[2,0]:='Оценка';
sgExams.Cells[3,0]:='Номер ведомости';

sgAdditionalSpec.Cells[0,0]:='Номер';
sgAdditionalSpec.Cells[1,0]:='Специальность';

dm.adodsPostupView.Active:=false;
dm.adodsPostupView.CommandType:=cmdText;
dm.adodsPostupView.CommandText:='select * from Abit_Postup_View where ncode='''+inttostr(IDStudent)+'''';
dm.adodsPostupView.Active:=true;



//если вызываем окно редактирования
if (dm.adodsPostupView.RecordCount>0)and(not(IsAdditional)) then
begin
  dm.adodsPostupView.First;

  //для проверки ЕГЭ
  ln:=dm.adodsPostupView.FieldByName('Clastname').Value;
  fn:=dm.adodsPostupView.FieldByName('Cfirstname').Value;
  if (dm.adodsPostupView.FieldByName('Cotch').Value <> NULL) then
    pn:=dm.adodsPostupView.FieldByName('Cotch').Value;

  if (dm.adodsPostupView.RecordCount>1) then //and(IkRecruit>0)
    while (dm.adodsPostupView.FieldByName('NN_Abit').Value<>IDpostup)and(not dm.adodsPostupView.Eof) do
      dm.adodsPostupView.Next;

  abitList:=FillAbitList(dm.adodsPostupView);

dm.adodsAbitExamView.Active:=false;
dm.adodsAbitExamView.CommandType:=cmdText;
dm.adodsAbitExamView.CommandText:='select * from Abit_Exam_View where (ncode='''+inttostr(IDStudent)+''')and(NN_abit='''+inttostr(abitList.NNAbit)+''')';
dm.adodsAbitExamView.Active:=true;
dm.adodsAbitExamView.First;
for j:=0 to (dm.adodsAbitExamView.RecordCount-1) do
begin
AddExam(dm.adodsAbitExamView);
dm.adodsAbitExamView.next;
end;
end
else
dbdteList.Value:=Date;
sync;

{dmStudentData.adodsKatZach.Active:=false;
dmStudentData.adodsKatZach.Active:=true;}

dmStudentData.aspGetAbitCat.Active:=false;
dmStudentData.aspGetAbitCat.Parameters[1].Value:=strtoint(Hint);
dmStudentData.aspGetAbitCat.Active:=true;

 dm.adodsNabor.Active:=false;
 dm.adodsNabor.CommandType:=cmdText;
 dm.adodsNabor.CommandText:='select * from Tree_abit_Specialties where NNYear='''+Hint+''' Order By Cshort_name_fac, Cname_spec';
 dm.adodsNabor.Active:=true;

if Tag>0 then begin
//frmAddPostupDlg:=TfrmAddPostupDlg.Create(self);
AbitList.RecruitNum:=tag;
AbitList.CatNum:=1;
AbitList.Date:=Date;
Sync;
ButtonsCheck;
end;

if AbitList.closed then begin
dbcbeCategory.Enabled:=false;
dbdteList.Enabled:=false;
dbcbeRecruit.Enabled:=false;
sbAddExam.Visible:=false;
sbDelExam.Visible:=false;
sbAddSpec.Visible:=false;
sbDelSpec.Visible:=false;
bbOK.Enabled:=false;
cbReal.Enabled:=false;
cbIsMain.Enabled:=false;
end else
begin
dbcbeCategory.Enabled:=true;
dbdteList.Enabled:=true;
dbcbeRecruit.Enabled:=true;
sbAddExam.Visible:=true;
sbDelExam.Visible:=true;
sbAddSpec.Visible:=true;
sbDelSpec.Visible:=true;
bbOK.Enabled:=true;
cbReal.Enabled:=true;
cbIsMain.Enabled:=true;
end;


if IsAdditional then
begin
  AbitList.Num := Num;
  AbitList.CatNum:= IdCat;
  dbcbeCategory.KeyValue := IdCat;
  dm.adodsAbitAllExam.Active:=false;
  dm.adodsAbitAllExam.CommandType:=cmdText;
  dm.adodsAbitAllExam.CommandText:='select * from ABit_AllExamView where (NN_abit='''+inttostr(IDPostup)+''')';
  dm.adodsAbitAllExam.Active:=true;
  dm.adodsAbitAllExam.First;
  for j:=0 to (dm.adodsAbitAllExam.RecordCount-1) do
  begin
    AddExam(dm.adodsAbitAllExam).new:=true;
    dm.adodsAbitAllExam.next;
  end;
  Sync;
end;
if (AbitList.Num>0) then

  Text:= 'Заявление на поступление №'+IntToStr(AbitList.Num);
end;

procedure TfrmPostupDlg.sbAddExamClick(Sender: TObject);
begin
frmAddExamDialog:=TfrmAddExamDialog.Create(self);
frmAddExamDialog.Hint:=Hint;
frmAddExamDialog.ShowModal;
frmAddExamDialog.Free;
Sync;
end;

procedure TfrmPostupDlg.sbAddSpecClick(Sender: TObject);
begin
frmAdditionalSpec:=TfrmAdditionalSpec.Create(self);
frmAdditionalSpec.ShowModal;
frmAdditionalSpec.Free;
Sync;
end;

procedure TfrmPostupDlg.sgAdditionalSpecClick(Sender: TObject);
var s:string;
begin
 s:=sgAdditionalSpec.Cells[0,sgAdditionalSpec.Row];
  if ((s<>'')and(s<>' '))and(sgAdditionalSpec.Row<>0)
  then begin
    sbDelSpec.Enabled:=true
  end
  else begin
    sbDelSpec.Enabled:=false
  end;
end;

procedure TfrmPostupDlg.sgExamsClick(Sender: TObject);
var s:string;
begin

   s:=sgExams.Cells[0,sgExams.Row];
  if ((s<>'')and(s<>' '))and(sgExams.Row<>0)
  then begin
    sbDelExam.Enabled:=true
  end
  else begin
    sbDelExam.Enabled:=false
  end;
end;

procedure TfrmPostupDlg.sgExamsDblClick(Sender: TObject);
var s:string;
ex:TExam;
begin
   s:=sgExams.Cells[0,sgExams.Row];
  if ((s<>'')and(s<>' '))and(sgExams.Row<>0)
  then begin
  frmAddExamDialog:=TfrmAddExamDialog.Create(self);
  frmAddExamDialog.Hint:=Hint;

  ex:=examlist[sgExams.Row-1];
  frmAddExamDialog.dbcbeDisc.KeyValue:=ex.IkDisc;
  frmAddExamDialog.dbcbeVid.KeyValue:=ex.IkVidSdachi;
  frmAddExamDialog.eVedNum.Value:=ex.NVed;
  if ex.Mark>0 then
  frmAddExamDialog.eMark.Value:=ex.Mark;
  frmAddExamDialog.EditMode:=true;

  frmAddExamDialog.ShowModal;
  frmAddExamDialog.Free;
  Sync;
  end;
end;

procedure TfrmPostupDlg.sbDelExamClick(Sender: TObject);
var ex:Texam;
begin
sgExamsClick(sender);
ex:=examlist[sgExams.Row-1];
ex.delete:=true;
if not (ex.new) then
DeleteExamList.Add(ex);
examlist.Remove(ex);
Sync;
end;

procedure TfrmPostupDlg.SbDelSpecClick(Sender: TObject);
var spec:TAdditionalspec;
begin

sgExamsClick(sender);
spec:=AbitList.lAdditionalSpec[sgAdditionalSpec.Row-1];
spec.delete:=true;
if not (spec.new) then
AbitList.ldelAdditionalSpec.Add(spec);
AbitList.lAdditionalSpec.Remove(spec);
AbitList.AutoNumDecrement(spec.num);
Sync;
end;

procedure TfrmPostupDlg.bbOkPrintClick(Sender: TObject);
begin
actOKExecute(Sender);
TAbitOtchetsController.Instance.ExportZayavl(ABITList.NNAbit);
end;

procedure TfrmPostupDlg.bGetCertDataClick(Sender: TObject);
var CertD:TfrmEGECertificateCheck;
//fn,ln,pn,ps,pnum:string;
var i:integer;
    edesc:TExamDescription;
    e:TExam;
    docDS: TADODataSet;
begin

{ if HostForm=nil then
 begin
 showmessage('Невозможно проверить сертификат для этого абитуриента, воспользуйтесь другим доступным способом');
 exit;
 end; }

 //если добавляем абитуриента
 if HostForm <> nil then
   with HostForm do
   begin
     ln:=eFam.Text;
     fn:=eName.Text;
     pn:=eMid.Text;

     ps:='';
     pnum:='';
    // ищем паспорт
    for i:=0 to sgDocKeys.RowCount-2 do
      if sgDockeys.Cells[1,i]='4' then  //id Типа
      begin
        ps:=sgDocs.Cells[1,i+1]; //серия
        pnum:=sgDocs.Cells[2,i+1]//номер
      end;
   end else
   //если редактируем
   with dmStudentSelectionProcs.aspSelDocuments do
   begin
      First;
      for i:=0 to RecordCount-1 do
      if FieldByName('Ik_vid_doc').AsInteger=PassportRF then  //id Типа паспорт РФ
      begin
        ps:=FieldByName('Cd_seria').AsString; //серия
        pnum:=FieldByName('Np_number').AsString;//номер
        break;
      end else Next;
   end;

 if (ps='')or(pnum='') then
 begin
   showmessage('Для того, чтобы проверить сертификат, необходимы паспортные данные абитуриента! Вы можете ввести их на вкладке "Документы" в форме добавления абитуриента');
   exit;
 end;

 CertD:=TfrmEGECertificateCheck.Create(self,ps,pnum,ln,fn,pn);
 CertD.ShowModal;
 for i := 0 to CertD.ExportedExams.Count - 1 do
 begin
   edesc:=CertD.ExportedExams[i];
   e:=TExam.Create;
   e.IkVidSdachi:=5;
   e.VidSdachi:='ЕГЭ';
   e.IkDisc:=-1;
   e.Disc:=edesc.Subject;
   try
     //пытаемся перевести в новый формат оценок ЕГЭ
     e.Mark:=  StrToInt(copy(edesc.Mark,1,Pos(',',edesc.Mark)-1));//Round(StrToFloat(edesc.Mark));
   except
     //старый формат оценок ЕГЭ
     e.Mark := Round(StrToFloat(edesc.Mark));
   end;
   e.new:=true;
   e.NVed:=edesc.CertNumber;
   ExamList.Add(e);
 end;
 Sync;
end;

procedure TfrmPostupDlg.ButtonsCheck;
begin
  if checkfields then
  begin
    bbOK.Enabled:=true;
    bbApply.Enabled:=true;
    bbOKPrint.Enabled:=true;
  end else
      begin
        bbOK.Enabled:=false;
        bbApply.Enabled:=false;
        bbOKPrint.Enabled:=false;
      end;
end;

procedure TfrmPostupDlg.cbIsMainClick(Sender: TObject);
begin
if not cbIsMain.Checked then
begin
cbReal.checked := false;
AbitList.IsMain := false;
AbitList.Real := false;
end
else AbitList.IsMain := true;
end;

procedure TfrmPostupDlg.cbRealClick(Sender: TObject);
begin
if cbReal.Checked then
begin
cbIsMain.checked := true;
AbitList.IsMain := true;
AbitList.Real := true;
end
else AbitList.Real := false;
end;

procedure TfrmPostupDlg.dbcbeRecruitChange(Sender: TObject);
begin
if IsAdditional then exit;

try
if (not (dbcbeRecruit.Text=''))and(not (Tag=0)) then
begin
{dmAbiturientAction.aspGetNewNum.Active:=false;
dmAbiturientAction.aspGetNewNum.Parameters[1].Value:=dbcbeRecruit.KeyValue;
dmAbiturientAction.aspGetNewNum.execproc;   }
end;
except
on E:EOleException do
 begin
   dm.DBConnect.RollbackTrans;
   raise EApplicationException.Create('Невозможно автоматически сгенерировать номер заявления! Возможно, диапазон задан неверно.',EOleException.Create(E.Message, E.ErrorCode,'','',0));
 end;
end;

ButtonsCheck;
end;

function ChangeMonthDayPlaces(date:TDateTime):string;
var s1:string;
begin
result:=DatetoStr(date);
s1:=result;
result[1]:=s1[4];
result[2]:=s1[5];
result[4]:=s1[1];
result[5]:=s1[2];
end;

procedure TfrmPostupDlg.actApplyExecute(Sender: TObject);
var i,j:integer;
    ex:TExam;
    spec:TAdditionalSpec;
    AddExProc:TADOStoredProc;
    stream: TMemoryStream;
    Log : ILogger;
begin
  TNullLogger.GetInstance;   //Log := TMemoLogger.GetInstance; //

  AbitList.RecruitNum:=dbcbeRecruit.KeyValue;
  AbitList.Date:=dbdteList.Value;
  AbitList.CatNum:=dbcbeCategory.KeyValue;
  AbitList.AvgBall:=eAvgBall.Value;

  try
    dm.DBConnect.BeginTrans;
    if (HostForm<>nil) then
    begin
      with HostForm do
      begin
        dmAbiturientAction.aspAppendAbit.Parameters.clear;
        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@RETURN_VALUE',ftInteger,pdReturnValue,0,1);
        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@flag',ftInteger,pdInput,0,1);
        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@clastn',ftString,pdInput,40,eFam.Text);
        Log.LogMessage('clastn=' + eFam.Text);
        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@firstn',ftString,pdInput,40,eName.Text);
        Log.LogMessage('firstn=' + eName.Text);
        if not (eMid.Text='') then
          dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@otch',ftString,pdInput,40,eMid.Text)
        else
          dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@otch',ftString,pdInput,40,null);
        Log.LogMessage('otch=' + eMid.Text);
        if not (DateToStr(dbdteBirthDate.Value)='  .  .    ') then
          dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@birth',ftDateTime,pdInput,0,dbdteBirthDate.Value)
        else
          dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@birth',ftDateTime,pdInput,0,null);
        Log.LogMessage('birth=' + dbdteBirthDate.Text);
        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@placebirth',ftString,pdInput,300,eBirthPlace.Text);
        Log.LogMessage('placebirth=' + eBirthPlace.Text);
        if  cbInvalid.Checked then
          dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@inval',ftBoolean,pdInput,0,1)
          else dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@inval',ftBoolean,pdInput,0,0);
        Log.LogMessage('inval=' + IntToStr(dmAbiturientAction.aspAppendAbit.Parameters.ParamByName('@inval').Value));
        if  cbChildren.Checked then
          dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@deti',ftBoolean,pdInput,0,1)
          else dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@deti',ftBoolean,pdInput,0,0);
        Log.LogMessage('deti=' + IntToStr(dmAbiturientAction.aspAppendAbit.Parameters.ParamByName('@deti').Value));
    if  cbJob.Checked then
      dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@rab',ftBoolean,pdInput,0,1) else
      dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@rab',ftBoolean,pdInput,0,0);
    Log.LogMessage('rab=' + IntToStr(dmAbiturientAction.aspAppendAbit.Parameters.ParamByName('@rab').Value));
    //if  dbcbeSex.text='Мужской' then
      dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@sex',ftBoolean,pdInput,0,rgSex.ItemIndex); //else
      Log.LogMessage('sex=' + IntToStr(dmAbiturientAction.aspAppendAbit.Parameters.ParamByName('@sex').Value));
     // dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@sex',ftBoolean,pdInput,0,0);
    if  cbAppNeed.Checked then
      dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@obchegit',ftBoolean,pdInput,0,1)else
      dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@obchegit',ftBoolean,pdInput,0,0);
    Log.LogMessage('obchegit=' + IntToStr(dmAbiturientAction.aspAppendAbit.Parameters.ParamByName('@obchegit').Value));

    dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@ik_medal',ftInteger,pdInput,0,dbcbeMedal.KeyValue);
    Log.LogMessage('ik_medal=' +  IntToStr(dmAbiturientAction.aspAppendAbit.Parameters.ParamByName('@ik_medal').Value));
    dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@ik_voen_zvanie',ftInteger,pdInput,0,dbcbeMilitaryState.KeyValue);
    Log.LogMessage('ik_voen_zvanie=' + IntToStr(dmAbiturientAction.aspAppendAbit.Parameters.ParamByName('@ik_voen_zvanie').Value));
    dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@Sottel',ftString,pdInput,50,eCellphone.Text);
    Log.LogMessage('Sottel=' + dmAbiturientAction.aspAppendAbit.Parameters.ParamByName('@Sottel').Value);
    dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@telefon',ftString,pdInput,20,ePhone.text);
    Log.LogMessage('telefon=' + dmAbiturientAction.aspAppendAbit.Parameters.ParamByName('@telefon').Value);
    dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@Email',ftString,pdInput,50,eEmail.Text);
    Log.LogMessage('Email=' + dmAbiturientAction.aspAppendAbit.Parameters.ParamByName('@Email').Value);

    //сохранение фото
    if (iphoto.Picture.Graphic<>nil) then
    begin
      if (odPhoto.FileName<>'') then
        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@Photo',ftVarBytes,pdInput,2147483647,CreateVariantByFile(odPhoto.FileName))
      else
      begin
        stream:=TMemoryStream.Create;
        iPhoto.Picture.Graphic.SaveToStream(stream);
        dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@Photo',ftVarBytes,pdInput,2147483647,CreateVariantByStream(stream))
      end;
    end
    else dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@Photo',ftVarBytes,pdInput,2147483647,NULL);


  dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@Pens',ftInteger,pdInput,0,Null);
  dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@grazd',ftInteger,pdInput,0,dbcbeCitizenship.KeyValue);
  Log.LogMessage('grazd=' + IntToStr(dmAbiturientAction.aspAppendAbit.Parameters.ParamByName('@grazd').Value));
  dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@podg',ftInteger,pdInput,0,dbcbePreparation.KeyValue);
  Log.LogMessage('podg=' + IntToStr(dmAbiturientAction.aspAppendAbit.Parameters.ParamByName('@podg').Value));

  dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@nac',ftInteger,pdInput,0,Null);
  dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@ob_rab',ftInteger,pdInput,0,dbcbeSocWork.KeyValue);
  Log.LogMessage('ob_rab=' + IntToStr(dmAbiturientAction.aspAppendAbit.Parameters.ParamByName('@ob_rab').Value));
  dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@sempol',ftInteger,pdInput,0,dbcbeFamState.KeyValue);
  Log.LogMessage('sempol=' + IntToStr(dmAbiturientAction.aspAppendAbit.Parameters.ParamByName('@sempol').Value));
  dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@spec_uch',ftInteger,pdInput,0,dbcbeSpecCount.KeyValue);

  Log.LogMessage('spec_uch=' + IntToStr(dmAbiturientAction.aspAppendAbit.Parameters.ParamByName('@spec_uch').Value));
  dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@zaved',ftInteger,pdInput,0,dbcbeSchool.KeyValue);
  Log.LogMessage('zaved=' + IntToStr(dmAbiturientAction.aspAppendAbit.Parameters.ParamByName('@zaved').Value));
  dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@godokon',ftInteger,pdInput,0,eYearFinished.Value);
  Log.LogMessage('godokon=' + IntToStr(dmAbiturientAction.aspAppendAbit.Parameters.ParamByName('@godokon').Value));
  dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@ind_f',ftString,pdInput,10,'');

  dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@street_f',ftInteger,pdInput,0,null);

  dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@Build_f',ftString,pdInput,10,'');

  dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@Stroen_f',ftString,pdInput,10,Null);

  dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@Kvart_f',ftString,pdInput,10,'');

  dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@ind_pr',ftString,pdInput,10,'');

  dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@street_pr',ftInteger,pdInput,0,null);

  dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@Build_pr',ftString,pdInput,10,'');

  dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@Stroen_pr',ftString,pdInput,10,Null);

  dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@Kvart_pr',ftString,pdInput,10,'');

  dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@dopsved',ftString,pdInput,2000,eAddInfo.text);
  Log.LogMessage('dopsved=' + dmAbiturientAction.aspAppendAbit.Parameters.ParamByName('@dopsved').Value);
  dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@code',ftInteger,pdInput,0,Null);
  dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@StazYear',ftInteger,pdInput,0,eXPYear.Value);
  Log.LogMessage('StazYear=' + IntToStr(dmAbiturientAction.aspAppendAbit.Parameters.ParamByName('@StazYear').Value));
  dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@StazMonth',ftInteger,pdInput,0,eXPMonth.Value);
  Log.LogMessage('StazMonth=' + IntToStr(dmAbiturientAction.aspAppendAbit.Parameters.ParamByName('@StazMonth').Value));
  dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@cDolgnost',ftString,pdInput,150,eDuty.Text);
  Log.LogMessage('cDolgnost=' + dmAbiturientAction.aspAppendAbit.Parameters.ParamByName('@cDolgnost').Value);
  if not(dbcbeEnterprise.KeyValue=-1) then
    dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@ik_pred',ftInteger,pdInput,0,dbcbeEnterprise.KeyValue) else
    dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@ik_pred',ftInteger,pdInput,0,NULL);
  Log.LogMessage('ik_pred=' + IntToStr(dmAbiturientAction.aspAppendAbit.Parameters.ParamByName('@ik_pred').Value));
  dmAbiturientAction.aspAppendAbit.Parameters.CreateParameter('@CLgot',ftString,pdInput,500,eBenefits.text);
  Log.LogMessage('CLgot=' + dmAbiturientAction.aspAppendAbit.Parameters.ParamByName('@CLgot').Value);

  dmAbiturientAction.aspAppendAbit.ExecProc;

  IDStudent:=dmAbiturientAction.aspAppendAbit.Parameters.ParamByName('@Return_Value').value;

  for i:=0 to sgLangKeys.RowCount-2 do
  begin

   with dmStudentActions.aspAddLang.Parameters do
   begin
    clear;
    AddParameter;
    Items[0].Value:=strtoint(sgLangkeys.Cells[2,i]);
    AddParameter;
    Items[1].Value:=IDStudent;
    AddParameter;
    Items[2].Value:=1;
    AddParameter;
    Items[3].Value:=strtoint(sgLangkeys.Cells[1,i]);
   end;
   dmStudentActions.aspAddLang.ExecProc;
  end;

  for i:=0 to sgRelKeys.RowCount-2 do
  begin

    with dmStudentActions.aspAddRelative.Parameters do
    begin
      ParamByName('@flag').Value := 1;
      ParamByName('@code').Value := IDStudent;
      ParamByName('@memb').Value := strtoint(sgRelkeys.Cells[1,i]);
      ParamByName('@post').Value := sgRelatives.Cells[4,i+1];
      if sgRelkeys.Cells[2,i]<>'' then
        ParamByName('@pred').Value := strtoint(sgRelkeys.Cells[2,i]) else ParamByName('@pred').Value := Null;
      ParamByName('@fio').Value := sgRelatives.Cells[0,i+1];
      ParamByName('@adres').Value := sgRelatives.Cells[6,i+1];
      ParamByName('@tel').Value := sgRelatives.Cells[5,i+1];
      if sgRelatives.Cells[2,i+1]='' then ParamByName('@birth').Value := Null else
        ParamByName('@birth').Value := ChangeMonthDayPlaces(StrtoDate(sgRelatives.Cells[2,i+1]));
      ParamByName('@rabTel').Value := sgRelatives.Cells[7,i+1];
    end;
    dmStudentActions.aspAddRelative.ExecProc;
  end;

for i:=0 to sgDocKeys.RowCount-2 do
begin
with dmStudentActions.aspAddDoc.Parameters do
begin
clear;
AddParameter;
Items[0].Value:=IDStudent;
AddParameter;
Items[1].Value:=strtoint(sgDockeys.Cells[1,i]);
AddParameter;
 Items[2].Value:=sgDocs.Cells[1,i+1];
AddParameter;
 Items[3].Value:=sgDocs.Cells[2,i+1];
AddParameter;
  if sgDocs.Cells[3,i+1]='' then
    Items[4].Value:=Null
  else
    Items[4].Value:=(StrtoDate(sgDocs.Cells[3,i+1]));
 AddParameter;
 Items[5].Value:=sgDocs.Cells[4,i+1];;
end;
dmStudentActions.aspAddDoc.ExecProc;
end;

if Assigned(AddressRecordList) then
  for i:=0 to AddressRecordList.Count-1 do
  begin
    with dmAdress.aspAddAddress.Parameters do
    begin

      Items[1].Value:=IDStudent;
      Items[2].Value:=TAddressRecord(AddressRecordList[i]).ikAddressType;
      Items[3].Value:=TAddressRecord(AddressRecordList[i]).Ik_street;
      Items[4].Value:=TAddressRecord(AddressRecordList[i]).Building;
      Items[5].Value:=TAddressRecord(AddressRecordList[i]).Struct;
      Items[6].Value:=TAddressRecord(AddressRecordList[i]).Flat;
      Items[7].Value:=TAddressRecord(AddressRecordList[i]).Index;

      if TAddressRecord(AddressRecordList[i]).DateBegin<>'  .  .    ' then
        Items[8].Value:=StrToDate(TAddressRecord(AddressRecordList[i]).DateBegin)
      else Items[8].Value:=null;
      if TAddressRecord(AddressRecordList[i]).DateEnd<>'  .  .    ' then
        Items[9].Value:=StrToDate(TAddressRecord(AddressRecordList[i]).DateEnd)
      else Items[9].Value:=null;
    end;
    dmAdress.aspAddAddress.ExecProc;
  end;


end;
end;


  for j:=0 to (DeleteExamList.Count-1) do
  begin
    ex:=DeleteExamList.items[j];
    dmAbiturientAction.aspAbitDelExam.Active:=false;
    dmAbiturientAction.aspAbitDelExam.Parameters.items[1].Value:=ex.ID;
    if ex.delete then
    dmAbiturientAction.aspAbitDelExam.ExecProc;
  end;

  if AbitList.ldelAdditionalSpec<>nil then
  begin
   for j:=0 to (AbitList.ldelAdditionalSpec.Count-1) do
  begin
    spec:=AbitList.ldelAdditionalSpec.items[j];
    dmAbiturientAction.aspdelSpec.Active:=false;
    dmAbiturientAction.aspdelSpec.Parameters.items[1].Value:=spec.ID;
    if spec.delete then
    dmAbiturientAction.aspdelSpec.ExecProc;
  end;
  end;

  if ABITList.delete then begin

    for j:=0 to (ExamList.Count-1) do
    begin
     ex:=ExamList.items[j];
     dmAbiturientAction.aspAbitDelExam.Active:=false;
     dmAbiturientAction.aspAbitDelExam.Parameters.items[1].Value:=ex.ID;
      dmAbiturientAction.aspAbitDelExam.ExecProc;
    end;

     for j:=0 to (AbitList.lAdditionalSpec.Count-1) do
  begin
    spec:=AbitList.ldelAdditionalSpec.items[j];
    dmAbiturientAction.aspdelSpec.Active:=false;
    dmAbiturientAction.aspdelSpec.Parameters.items[1].Value:=spec.ID;
    if spec.delete then
    dmAbiturientAction.aspdelSpec.ExecProc;
  end;

    dmAbiturientAction.aspAbitDelPostup.Active:=false;
    dmAbiturientAction.aspAbitDelPostup.Parameters.items[1].Value:=ABITList.NNAbit;


  end else
  begin
    dmAbiturientAction.aspAddPostup.Active:=false;

    if ABITList.new then
    begin
      with dmAbiturientAction.aspAddPostup.Parameters do
      begin

        items[1].Value:=ABITList.Num;

        items[2].Value:=IDStudent;

        items[3].Value:=ABITList.RecruitNum;

        items[4].Value:=ABITList.CatNum;

        items[5].Value:=ABITList.Date;

        items[6].Value:=ABITList.Real;

        items[7].Value:=ABITList.IsMain;

        items[8].Value:=ABITList.AvgBall;
      end;

      dmAbiturientAction.aspAddPostup.ExecProc;
      if not (dmAbiturientAction.aspAddPostup.Parameters.ParamByName('@Return_Value').value=Null) then
      ABITList.NNAbit:=dmAbiturientAction.aspAddPostup.Parameters.ParamByName('@Return_Value').value;

    end else
    begin
      with dmAbiturientAction.aspEditPostup.Parameters do begin

        items[1].Value:=ABITList.Num;

        items[2].Value:=IDStudent;

        items[3].Value:=ABITList.RecruitNum;

        items[4].Value:=ABITList.CatNum;

        items[5].Value:=ABITList.Date;

        items[6].Value:=ABITList.NNAbit;

        items[7].Value:=cbReal.Checked;

        items[8].Value:=cbIsMain.Checked;

        items[9].Value:=ABITList.AvgBall;

      end;
      dmAbiturientAction.aspEditPostup.ExecProc;

      if IsOnline then
      begin
        dmAbiturientAction.aspAbitConfirmOnline.Parameters.Items[1].Value := ABITList.NNAbit;
        dmAbiturientAction.aspAbitConfirmOnline.ExecProc;
      end;
    end;

    for j:=0 to (examlist.Count-1) do
    begin
      ex:=examlist.items[j];

      if ex.IkDisc=-1 then AddExProc:=dmAbiturientAction.aspAddExamByName else AddExProc:=dmAbiturientAction.aspAddExam;

      AddExProc.Active:=false;


      with AddExProc.Parameters do
      begin

        if (ex.Mark=-1) then
          items[1].Value:=Null else
          items[1].Value:=ex.Mark;

        items[2].Value:=ABITList.NNAbit;

        if ex.IkDisc=-1 then items[3].Value:=ex.Disc else
        items[3].Value:=ex.IkDisc;

        items[4].Value:=ex.IkVidSdachi;

        items[5].Value:=ex.NVed;
      end;
      if ex.new then
      begin
       AddExProc.ExecProc;
     end;
   end;

    for j:=0 to (AbitList.lAdditionalSpec.Count-1) do
    begin
      spec:=AbitList.lAdditionalSpec.items[j];
      dmAbiturientAction.aspAddSpec.Active:=false;
      with dmAbiturientAction.aspAddSpec.Parameters do
      begin
        items[1].Value:=spec.ik_recruit;
        items[2].Value:=ABITList.NNAbit;
        items[3].Value:=spec.num;
      end;
      if spec.new then
      begin
       dmAbiturientAction.aspAddSpec.ExecProc;
     end;
   end;
  end;

  dm.DBConnect.CommitTrans;

  for j:=0 to (examlist.Count-1) do
  begin
  ex:=examlist.items[j];
  ex.new:=false;
  end;

  for j:=0 to (AbitList.lAdditionalSpec.Count-1) do
  begin
  spec:=AbitList.lAdditionalSpec.items[j];
  spec.new:=false;
  end;

  ABITList.new:=false;
  if not (hostForm=nil) then
  HostForm.Close;
  close;

except
  on E:exception do
  begin
  //Showmessage('Введены некорректные данные! Абитуриент не добавлен! ОШИБКА: '+e.Message);
  dm.DBConnect.RollbackTrans;
  raise EApplicationException.Create('Введены некорректные данные! Абитуриент не добавлен!', E);
  end;
end;
end;

function TfrmPostupDlg.FillAbitList(Dataset: TAdoDataset):TAbitList;
var addSpec:TAdditionalSpec;
begin
IDStudent:=Dataset.FieldValues['ncode'];
AbitList:=TAbitList.Create;
AbitList.new:=false;
AbitList.NNAbit:=Dataset.FieldValues['NN_abit'];
if Dataset.FieldValues['RegNomer']<>Null then
AbitList.Num:=Dataset.FieldValues['RegNomer'];
if Dataset.FieldValues['NNRecord']<>Null then
AbitList.RecruitNum:=Dataset.FieldValues['NNRecord'];
if Dataset.FieldValues['ik_kat_zach']<>Null then
AbitList.CatNum:=Dataset.FieldValues['ik_kat_zach'];
if Dataset.FieldValues['dd_pod_zayav']<>Null then
AbitList.Date:=Dataset.FieldValues['dd_pod_zayav'];
if Dataset.FieldValues['Cname_kat_zach']<>Null then
AbitList.Cat:=Dataset.FieldValues['Cname_kat_zach'];
if Dataset.FieldValues['NaborName']<>Null then
AbitList.Recruit:=Dataset.FieldValues['NaborName'];
if Dataset.FieldValues['Realy_postup']<>Null then
AbitList.Real:=Dataset.FieldValues['Realy_postup'];
if Dataset.FieldValues['SchoolAverMark']<>Null then
AbitList.AvgBall:=Dataset.FieldValues['SchoolAverMark'];
if Dataset.FieldValues['IsMain']<>Null then
AbitList.IsMain:=Dataset.FieldValues['IsMain'];
AbitList.closed:=onlyreading;

AbitList.lAdditionalSpec:=TList.create;
AbitList.lDelAdditionalSpec:=TList.create;


with dmAbiturientAction.aspGetAdditionalspec do
begin
 Active:=false;
 Parameters.Clear;
 Parameters.AddParameter;
 Parameters[0].Value:=AbitList.NNAbit;
 open;
 First;
end;

while not dmAbiturientAction.aspGetAdditionalspec.eof do
begin
  addSpec:=TAdditionalSpec.Create;
  addSpec.ID:= dmAbiturientAction.aspGetAdditionalspec.FieldValues['ik_specAbit'];
  addSpec.num:= dmAbiturientAction.aspGetAdditionalspec.FieldValues['SpecNumber'];
  addSpec.ik_recruit:= dmAbiturientAction.aspGetAdditionalspec.FieldValues['NNrecord'];
  addSpec.name_recruit:= dmAbiturientAction.aspGetAdditionalspec.FieldValues['Cname_spec'];
  AbitList.lAdditionalSpec.Add(addSpec);
  dmAbiturientAction.aspGetAdditionalspec.Next;
end;


if OnlyReading then
begin
AbitList.closed:=true;
Self.Caption:=Self.Caption+' (только просмотр)'
end;
result:=AbitList;
end;

function TfrmPostupDlg.AddExam(Dataset: TAdoDataset):TExam;
var new:TExam;
begin
new:=TExam.Create;
if Dataset.FieldValues['id']<>Null then
new.ID:=Dataset.FieldValues['id'];
if Dataset.FieldValues['NN_abit']<>Null then
new.NNAbit:=Dataset.FieldValues['NN_abit'];
if Dataset.FieldValues['ik_disc']<>Null then
new.IkDisc:=Dataset.FieldValues['ik_disc'];
if Dataset.FieldValues['ik_sdach']<>Null then
new.IkVidSdachi:=Dataset.FieldValues['ik_sdach'];
if Dataset.FieldValues['id_rasp_kab']<>Null then
new.ik_rasp_kab:=Dataset.FieldValues['id_rasp_kab'];
if Dataset.FieldValues['cosenka']<>Null then
new.Mark:=Dataset.FieldValues['cosenka'] else
new.Mark:=-1;
if Dataset.FieldValues['NNVedom']<>Null then
new.NVed:=Dataset.FieldValues['NNVedom'];
if Dataset.FieldValues['сName_disc']<>Null then
new.Disc:=Dataset.FieldValues['сName_disc'];
if Dataset.FieldValues['cName_sdach']<>Null then
new.VidSdachi:=Dataset.FieldValues['cName_sdach'];
frmPostupDlg.ExamList.Add(new);
result:=new;
end;

procedure TfrmPostupDlg.actOKExecute(Sender: TObject);
begin
  actApplyExecute(sender);
end;

procedure TfrmPostupDlg.eNumChange(Sender: TObject);
begin
ButtonsCheck;
end;



{ TAbitList }

procedure TAbitList.AutoNumDecrement(deleted: integer);
var i:integer;
spec:TAdditionalSpec;
begin
for i:=0 to lAdditionalSpec.Count-1 do
begin
spec:=lAdditionalSpec[i];
if spec.num>deleted then spec.num:=spec.num-1;
end;
end;

function TAbitList.NewSpecNum: integer;
var i:integer;
spec:TAdditionalSpec;
begin
result:=1;
for i:=0 to lAdditionalSpec.Count-1 do
begin
spec:=lAdditionalSpec[i];
if spec.num>result then result:=spec.num;
end;
inc(result);
end;

end.
