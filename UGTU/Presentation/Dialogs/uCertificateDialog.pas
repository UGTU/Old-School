unit uCertificateDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, EgeCheckService,uXMLEGEReader,
  Mask, DBCtrlsEh, Grids, System.Actions;

type
  TfrmEGECertificateCheck = class(TfrmBaseDialog)
    Label6: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    sgExams: TStringGrid;
    Label5: TLabel;
    eCertNumber: TDBEditEh;
    eFio: TDBEditEh;
    eTypoNumber: TDBEditEh;
    eYear: TDBEditEh;
    eStatus: TDBEditEh;
    Memo1: TMemo;
    lCurrentCert: TLabel;
    bNextCert: TBitBtn;
    bPrevCert: TBitBtn;
    GroupBox1: TGroupBox;
    procedure FormShow(Sender: TObject);
    procedure bPrevCertClick(Sender: TObject);
    procedure bNextCertClick(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure actOKExecute(Sender: TObject);

  private
  FDescriptions:TList;
  FCurrentDescriptionNumber:integer;

  FExams:TList;

  FPassNum: string;
  FPassSerie: string;
  FLastName:string;
  FFirstName:string;
  FPatronName:string;
  FOnlySelected: boolean;

  function GetAnalogicExam(edesc:TExamDescription; Marks:TList):TExamDescription;

  procedure ExamSync;
  procedure DescrSync;
    { Private declarations }
  public
  constructor Create(owner:TControl;passserie:string; passnum:string; lname, fname, pname:string);
  property Certificates: TList read FDescriptions;
  property ExportedExams: TList read FExams;
  property OnlySelected: boolean read FOnlySelected;
    { Public declarations }
  end;

var
  frmEGECertificateCheck: TfrmEGECertificateCheck;

implementation



{$R *.dfm}


procedure TfrmEGECertificateCheck.DescrSync;
var Desc:TCertificateDescription;
begin
Desc:=FDescriptions[FCurrentDescriptionNumber];

lCurrentCert.caption:=IntToStr(FCurrentDescriptionNumber+1)+'/'+IntToStr(FDescriptions.Count);
bPrevCert.Enabled:=(FCurrentDescriptionNumber>0);
bNextCert.Enabled:=(FCurrentDescriptionNumber<FDescriptions.Count-1);

eFIO.Text:=Desc.LastName+' '+Desc.FirstName+' '+Desc.PatronName;
eCertNumber.text:=Desc.CertificateNumber;
eTypoNumber.text:=Desc.TypographicNumber;
eYear.Text:=IntToStr(Desc.Year);
eStatus.Text:=Desc.status;
end;

procedure TfrmEGECertificateCheck.ExamSync;
var i,j:integer;
edesc:TExamDescription;
adesc:TExamDescription;
desc:TCertificateDescription;
begin
sgExams.Rowcount:=2;
sgExams.Cells[0,0]:='Предмет';
sgExams.Cells[1,0]:='Оценка';
sgExams.Cells[2,0]:='Сертификат';
sgExams.Cells[3,0]:='Подана аппеляция';

if (FDescriptions.Count=0) then exit;

if FExams=nil then
FExams:=TList.Create;

FExams.Clear;

for i:=0 to (FDescriptions.Count-1) do
begin
  desc:= FDescriptions[i];
  for j:=0 to (desc.Marks.Count-1) do
  begin
    edesc:=desc.Marks[j];
    edesc.CertNumber:=desc.CertificateNumber;
    adesc:=GetAnalogicExam(edesc,FExams);
    if adesc=nil then FExams.Add(edesc) else
    if adesc.Mark<edesc.Mark then
    begin
      FExams.Remove(adesc);
      FExams.Add(edesc);
    end;
  end;
end;

for i:=0 to (FExams.Count-1) do
begin
edesc:=FExams[i];

sgExams.Cells[0,sgExams.Rowcount-1]:=edesc.Subject;
sgExams.Cells[1,sgExams.Rowcount-1]:=edesc.Mark;//floattostr(edesc.Mark)
sgExams.Cells[2,sgExams.Rowcount-1]:=edesc.CertNumber;

if edesc.IsAppealed then
sgExams.Cells[3,sgExams.Rowcount-1]:='Да'
else
sgExams.Cells[3,sgExams.Rowcount-1]:='Нет';

sgExams.Rowcount:=sgExams.Rowcount+1;
end;

end;

procedure TfrmEGECertificateCheck.actOKExecute(Sender: TObject);
begin
  inherited;
  FOnlySelected := false;
  Close;
end;

procedure TfrmEGECertificateCheck.bbCancelClick(Sender: TObject);
begin
FExams.Clear;
Close;
end;

procedure TfrmEGECertificateCheck.bNextCertClick(Sender: TObject);
begin
inc(FCurrentDescriptionNumber);
DescrSync;
end;

procedure TfrmEGECertificateCheck.bPrevCertClick(Sender: TObject);
begin
dec(FCurrentDescriptionNumber);
DescrSync;
end;

constructor TfrmEGECertificateCheck.Create(owner:TControl;passserie, passnum, lname, fname,
  pname: string);
begin
inherited Create(owner);

  FPassNum:= passnum;
  FPassSerie:= passserie;
  FLastName:=lname;
  FFirstName:=fname;
  FPatronName:=pname;
    {
  eFam.Text:= lname;
  eName.Text:= fname;
  ePatronName.Text:= pname;
  eSerie.Text:=passserie;
  eNum.Text:=passnum;
     }
  FExams:=TList.Create;
end;



procedure TfrmEGECertificateCheck.FormShow(Sender: TObject);
var srv:IEgeCheckService;
    res:WideString;
    reader:TXMLEGEReader;
begin
  srv:=GetIEgeCheckService(True,'',nil);

  res:=srv.SingleCheck(FLastName,FFirstName,FPatronName,FPassSerie,FPassNum,'','');

  reader:= TXMLEGEReader.Create(res);

  Memo1.Text:=res;

  FDescriptions:=reader.GetCertificateDescriptions;
  FCurrentDescriptionNumber:=0;

  if FDescriptions.Count=0 then
    ShowMessage('По данному абитуриенту отсутствуют данные в ФИС ЕГЭ')
  else
  begin
    DescrSync;
    ExamSync;
  end;

  Cursor:=crDefault;
end;

function TfrmEGECertificateCheck.GetAnalogicExam(edesc: TExamDescription;
  Marks: TList): TExamDescription;
  var i:integer;
  adesc:TExamDescription;
begin
Result:=nil;

for i := 0 to Marks.Count - 1 do
begin
  adesc:=Marks[i];
  if adesc.Subject=edesc.Subject then result:=adesc;
end;

end;

end.
