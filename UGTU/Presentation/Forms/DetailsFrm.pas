unit DetailsFrm;
   {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, ValEdit, ComCtrls, VersionController;

type
  TDetailsForm = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    ListView1: TListView;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DetailsForm: TDetailsForm;

implementation

{$R *.dfm}

const
   NOT_DEF = 'Не определено';


procedure TDetailsForm.FormCreate(Sender: TObject);
var
  vc : TVersionController;
  curver : IVersion;
  servVer : IVersion;
begin
  vc := TVersionController.GetInstance;
  curver := vc.CurrentVersion;
  servVer := vc.ServerVersion;
  if curver = nil then curver := TAppVersion.GetInstance;
  if servVer = nil then servver := TServerVersion.GetInstance;
  ListView1.Items[0].SubItems.Add(Format('%d.%d.%d.%d', [curver.MajorVersion, curver.MinorVersion, curver.Release, curver.Build]));
  ListView1.Items[1].SubItems.Add(Format('%d.%d.%d.%d', [servVer.MajorVersion, servVer.MinorVersion, servVer.Release, servVer.Build]));
  ListView1.Items[2].SubItems.Add(DateTimeToStr(servVer.BuildTimeInfo));
  ListView1.Items[3].SubItems.Add(IntToStr(servver.BuildSize));
  ListView1.Items[4].SubItems.Add(servver.BuildInfo);
end;

end.
