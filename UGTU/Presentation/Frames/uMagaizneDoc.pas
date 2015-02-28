unit uMagaizneDoc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFrame, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ComCtrls,uDMUgtuStructure, Vcl.DBLookup,
  Vcl.Mask, DBCtrlsEh, DBLookupEh;

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
    bbPrint: TBitBtn;
    rbSort: TRadioButton;
    DBGridEh1: TDBGridEh;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    DBGridEh6: TDBGridEh;
    DBGridEh7: TDBGridEh;
    dbcmbSpec: TDBLookupComboboxEh;
    dbcmbStud: TDBLookupComboboxEh;
    dbcmbGroup: TDBLookupComboboxEh;
    dbcmbStatus: TDBLookupComboboxEh;
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
  dbcmbSpec.Enabled:=False;
  dbcmbStud.Enabled:=False;
  dbcmbGroup.Enabled:=False;
  dbcmbStatus.Enabled:=False;
end;

procedure TfmDoc.rbSortClick(Sender: TObject);
begin
  inherited;
  DMUgtuStructure.adodsSpec.Active := true;
  dbcmbSpec.Enabled:=true;
  dbcmbStud.Enabled:=true;
  dbcmbGroup.Enabled:=true;
  dbcmbStatus.Enabled:=true;
end;

end.