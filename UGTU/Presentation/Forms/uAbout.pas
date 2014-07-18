unit uAbout;
  {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Registry, ShellAPI, DB;

type
  TfrmAbout = class(TForm)
    bbOK: TBitBtn;
    Label1: TLabel;
    lOS: TLabel;
    Label3: TLabel;
    lUser: TLabel;
    lOrganization: TLabel;
    Bevel1: TBevel;
    Label4: TLabel;
    lMem: TLabel;
    Image1: TImage;
    Label5: TLabel;
    lMail: TLabel;
    lDeveloper: TLabel;
    lBuild: TLabel;
    lVer: TLabel;
    lSite: TLabel;
    Label9: TLabel;
    dsAbout: TDataSource;
    Label6: TLabel;
    lPhone: TLabel;
    Label7: TLabel;
    lAdress: TLabel;
    procedure lMailMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lMailMouseLeave(Sender: TObject);
    procedure lSiteMouseLeave(Sender: TObject);
    procedure lSiteMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lMailClick(Sender: TObject);
    procedure lSiteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  frmAbout: TfrmAbout;

implementation

uses uDM, VersionController, ApplicationController;

{$R *.dfm}

procedure TfrmAbout.FormCreate(Sender: TObject);
var
  r:TRegistry;
  MS: TMemoryStatus;
begin
  lMail.Caption:=TApplicationController.GetInstance.SupportMail;
  lDeveloper.Caption:=TApplicationController.GetInstance.Developer;
  lPhone.Caption:=TApplicationController.GetInstance.SupportPhone;
  lSite.Caption:=TApplicationController.GetInstance.SupportSite;
  lAdress.Caption:=TApplicationController.GetInstance.Adress;
  self.lVer.Caption:= TVersionController.GetInstance.CurrentVersion.VersionString;


   r:= TRegistry.Create(KEY_READ);
   try
    r.RootKey:= HKEY_LOCAL_MACHINE;
    case Win32Platform of
    VER_PLATFORM_WIN32_WINDOWS:
      r.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion',false);
    VER_PLATFORM_WIN32_NT:
      r.OpenKey('SOFTWARE\Microsoft\Windows NT\CurrentVersion',false);
    end;
    lOS.Caption:= r.ReadString('ProductName') + ' (âåðñèÿ ' + r.ReadString('CurrentVersion') + ')';
    lBuild.Caption:= 'Ñáîðêà ' + r.ReadString('BuildLab') + ' : ' + r.ReadString('CSDVersion');
    lUser.Caption:= r.ReadString('RegisteredOwner');
    lOrganization.Caption:= r.ReadString('RegisteredOrganization');
   finally
    r.Free;
   end;
  MS.dwLength := SizeOf(TMemoryStatus);
  GlobalMemoryStatus(MS);
  lMem.Caption := FormatFloat('#,###" KB"', MS.dwTotalPhys div 1024);
end;

procedure TfrmAbout.lMailMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  lMail.Font.Style:= lMail.Font.Style + [fsUnderline];
end;

procedure TfrmAbout.lMailMouseLeave(Sender: TObject);
begin
  lMail.Font.Style:= lMail.Font.Style - [fsUnderline];
end;

procedure TfrmAbout.lSiteMouseLeave(Sender: TObject);
begin
 lSite.Font.Style:= lSite.Font.Style - [fsUnderline];
end;

procedure TfrmAbout.lSiteMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 lSite.Font.Style:= lSite.Font.Style + [fsUnderline];
end;

procedure TfrmAbout.lMailClick(Sender: TObject);
var
  s: String;
begin
  s := 'mailto:'+lMail.Caption+'?Subject=ÈÑ ÓÃÒÓ';
  ShellExecute(Handle, nil, PChar(s), nil, nil, SW_RESTORE);
end;

procedure TfrmAbout.lSiteClick(Sender: TObject);
begin
  ShellExecute(Handle, nil, PWideChar(TApplicationController.GetInstance.SupportSite), nil, nil, SW_RESTORE);
end;

end.
