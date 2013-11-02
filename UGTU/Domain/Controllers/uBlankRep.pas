unit uBlankRep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs{, RpCon, RpConDS, RpRave, RpDefine, RpRender, RpRenderCanvas,
  RpRenderPreview, RpBase, RpSystem, RpRenderHTML};

type
  TfrmRepPreview = class(TForm)
    {ScrollBox1: TScrollBox;
    rvdsMain: TRvDataSetConnection;
    RvProject1: TRvProject;
    rvdsTop: TRvDataSetConnection;
    RvProject2: TRvProject;
    rvNaprDSConn: TRvDataSetConnection;
    rvdsMainKP: TRvDataSetConnection;
    rvdsBottom: TRvDataSetConnection;
    rvdsDiplTop: TRvDataSetConnection;
    dscSelUspevForVipisca: TRvDataSetConnection;
    rvdsSelKPForVipisca: TRvDataSetConnection;
    rvdsSelKRForVipisca: TRvDataSetConnection;}
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRepPreview: TfrmRepPreview;

implementation

uses uDM;

{$R *.dfm}

procedure TfrmRepPreview.FormCreate(Sender: TObject);
begin
 { RvProject1.ProjectFile := ExtractFilePath(Application.ExeName)+
                                                 'Reports\Main.rav';
  RvProject2.ProjectFile := ExtractFilePath(Application.ExeName)+
                                                 'Reports\Napr.rav';   }
end;

end.
