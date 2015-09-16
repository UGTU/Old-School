unit uMagaizneSpr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseFrame, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, GridsEh, DBAxisGridsEh, DBGridEh , uBaseFrame;

type
  TfmSpr = class(TfmBase)
    Panel2: TPanel;
    lSpec: TLabel;
    lGroup: TLabel;
    lStud: TLabel;
    lStatus: TLabel;
    rbAllDoc: TRadioButton;
    cbSpec: TComboBox;
    cbGroup: TComboBox;
    cbStud: TComboBox;
    cbStatus: TComboBox;
    bbPrint: TBitBtn;
    pcDocuments: TPageControl;
    TabSheet1: TTabSheet;
    tsPF: TTabSheet;
    tsStatement: TTabSheet;
    tsTranscriptOfRecords: TTabSheet;
    tsSprChallenge: TTabSheet;
    TabSheet6: TTabSheet;
    rbSort: TRadioButton;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    DBGridEh3: TDBGridEh;
    DBGridEh4: TDBGridEh;
    DBGridEh5: TDBGridEh;
    DBGridEh6: TDBGridEh;
    DBGridEh7: TDBGridEh;
    procedure rbAllDocClick(Sender: TObject);
    procedure rbSortClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSpr: TfmSpr;

implementation

{$R *.dfm}

procedure TfmSpr.rbAllDocClick(Sender: TObject);
begin
  inherited;
//  cbSpec.Style.csDropDownList:=true;
//  cbStud.Style.csDropDownList:=true;
//  cbGroup.Style.csDropDownList:=true;
//  cbStatus.Style.csDropDownList:=true;
end;

procedure TfmSpr.rbSortClick(Sender: TObject);
begin
  inherited;
//  cbSpec.Style.csDropDownList:=false;
//  cbStud.Style.csDropDownList:=false;
//  cbGroup.Style.csDropDownList:=false;
//  cbStatus.Style.csDropDownList:=false;
end;

end.
