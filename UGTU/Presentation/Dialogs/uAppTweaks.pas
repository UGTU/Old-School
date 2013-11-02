unit uAppTweaks;
   {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ComCtrls, ActnList, StdCtrls, Buttons, ExtCtrls, Mask,
  DBCtrlsEh, ApplicationController;

type
  TfrmAppTweaks = class(TfrmBaseDialog)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet3: TTabSheet;
    lServ: TLabel;
    eServ: TDBEditEh;
    Label2: TLabel;
    eDatabase: TDBEditEh;
    cbAutoMail: TCheckBox;
    Label1: TLabel;
    eMail: TLabel;
    cbLogToFile: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAppTweaks: TfrmAppTweaks;

implementation

{$R *.dfm}

procedure TfrmAppTweaks.actOKExecute(Sender: TObject);
begin
  with TApplicationController.GetInstance do
  begin
   if SendExceptionReport=ssUndefined then
   begin
   if cbAutoMail.checked then WriteSendExceptionReportToIni(true);
   end
   else
     WriteSendExceptionReportToIni(cbAutoMail.checked);

   ServerName:=eServ.Text;
   DbName:=eDatabase.Text;
   ExportLogToFile:=cbLogToFile.checked;
   WriteAllParamToIni;
  end;
  
  Self.Close;
end;

procedure TfrmAppTweaks.FormCreate(Sender: TObject);
begin
  inherited;
With TApplicationController.GetInstance do
begin
  eMail.Caption:=SupportMail;
  eServ.Text:=ServerName;
  eDatabase.text:=DBName;
  cbAutoMail.Checked:=(SendExceptionReport=ssSend);
  cbLogToFile.Checked:=ExportLogToFile;
end;
PageControl1.ActivePageIndex:=0;
end;



end.
