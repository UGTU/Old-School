unit uMagaizneDoc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFrame, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ComCtrls;

type
  TfmDoc = class(TfmBase)
    pcDocuments: TPageControl;
    TabSheet1: TTabSheet;
    tsPF: TTabSheet;
    DBGridEh2: TDBGridEh;
    tsStatement: TTabSheet;
    DBGridEh3: TDBGridEh;
    tsTranscriptOfRecords: TTabSheet;
    DBGridEh4: TDBGridEh;
    tsSprChallenge: TTabSheet;
    DBGridEh5: TDBGridEh;
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
    rbSort: TRadioButton;
    DBGridEh1: TDBGridEh;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
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
  fmDoc: TfmDoc;

implementation

{$R *.dfm}

procedure TfmDoc.rbAllDocClick(Sender: TObject);
begin
  inherited;
//  cbSpec.Style.csDropDownList:=true;
//  cbStud.Style.csDropDownList:=true;
//  cbGroup.Style.csDropDownList:=true;
//  cbStatus.Style.csDropDownList:=true;
end;

procedure TfmDoc.rbSortClick(Sender: TObject);
begin
  inherited;
//  cbSpec.Style.csDropDownList:=false;
//  cbStud.Style.csDropDownList:=false;
//  cbGroup.Style.csDropDownList:=false;
//  cbStatus.Style.csDropDownList:=false;
end;

end.
