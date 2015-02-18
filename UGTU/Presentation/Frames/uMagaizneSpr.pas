unit uMagaizneSpr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseFrame, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSpr: TfmSpr;

implementation

{$R *.dfm}

end.
