unit uReviewNeusp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uReviewDoc, System.Actions,
  Vcl.ActnList, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh,
  DBAxisGridsEh, DBGridEh,uDMDocuments;

type
  TfrmReviewNeusp = class(TfrmReviewDoc)
    DBGridEh1: TDBGridEh;
    DateTimePicker1: TDateTimePicker;
    Label6: TLabel;
    mNamePric: TMemo;
    Label7: TLabel;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
  Procedure AfterConstruction; Override;
    { Public declarations }
  end;

var
  frmReviewNeusp: TfrmReviewNeusp;

implementation

{$R *.dfm}
uses uStudent;

procedure TfrmReviewNeusp.AfterConstruction;
begin
  inherited;
  uDMDocuments.dmDocs.adodsNeusp.Active := false;
  dmDocs.adodsNeusp.Filter:= 'ik_StudGrup =' +ik_stud.ToString();
  dmDocs.adodsNeusp.Filtered:=true;

  uDMDocuments.dmDocs.adodsNeusp.Active := true; // подключам базу

end;

procedure TfrmReviewNeusp.FormActivate(Sender: TObject);
begin
  inherited;
mNamePric.Text:='Согласно разделу 3 (п. 3.1) Положения о порядке зачисления студентов, утвержденного ректором 01.09.2014, студент подлежит отчислению'
end;

end.
