unit uReviewNotify;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uReviewDoc, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, GridsEh, DBAxisGridsEh,
  DBGridEh, System.Actions, Vcl.ActnList, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, GeneralController, ADODB, ImgList, Vcl.Menus;

type
  TfrmReviewNeusp = class(TfrmReviewDoc)
    Label6: TLabel;
    Label7: TLabel;
    dtOtch: TDateTimePicker;
    DBGridEh1: TDBGridEh;
    dsNeusp: TDataSource;
    MainMenu1: TMainMenu;
    mPric: TMemo;
    procedure BitBtn1Click(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
  private
    fDebtList: TStringList;

    procedure SetDebtList(const Value: TStringList);
    // { Private declarations }
  public
//     destructor Destroy; override;
    procedure Read;
    procedure DoApply;
    Procedure AfterConstruction; Override;
    property DebtList: TStringList read fDebtList write SetDebtList;
    { Public declarations }
  end;

var
  frmReviewNeusp: TfrmReviewNeusp;

implementation

{$R *.dfm}

uses uStudent;
//
// destructor TfrmReviewNeusp.Destroy;
// begin
// dsNeusp.DataSet.Close;
// dsNeusp.DataSet.Free;
// fDebtList.Clear;
// fDebtList.Free;
// end;

procedure TfrmReviewNeusp.Read;
begin
  dsNeusp.DataSet := TGeneralController.Instance.GetNewADODataSet(true);
  (dsNeusp.DataSet as TADODataSet).CommandText := 'select * from GetStudDebt(' +
    ik_stud.ToString() + ')';
  (dsNeusp.DataSet as TADODataSet).Open;

  dsNeusp.DataSet.First;
  while not dsNeusp.DataSet.Eof do
  begin
    dsNeusp.DataSet.Edit;
    dsNeusp.DataSet.FieldByName('flag').Value := false;
    dsNeusp.DataSet.Next;
  end;

end;

procedure TfrmReviewNeusp.SetDebtList(const Value: TStringList);
var
  i: integer;
begin
  fDebtList := TStringList.Create;
  fDebtList.Clear;
  for i := 0 to Value.Count - 1 do
    fDebtList.Add(Value[i]);
end;

 procedure TfrmReviewNeusp.actOKExecute(Sender: TObject);
begin
  inherited;
 DoApply;
end;

procedure TfrmReviewNeusp.AfterConstruction;
 begin
// inherited;

 dtOtch.Date := Date+14; // "конкретна€ дата"
 dtOtch.MinDate := Date+1;
 mPric.Text:='¬ соответствии с частью 6 подпункта 6.15 пункта 6  ѕоложени€ о пор€дке и основании перевода, отчислени€ и восстановлени€ студентов,'+
 ' утвержденного ректором 01.09.2014, студент подлежит отчислению'
 end;


procedure TfrmReviewNeusp.BitBtn1Click(Sender: TObject);
begin
  inherited;
DoApply;

end;

procedure TfrmReviewNeusp.DoApply;
begin
  fDebtList := TStringList.Create;
  fDebtList.Clear;
 dsNeusp.DataSet.First;
 while not dsNeusp.DataSet.Eof do
 begin
 if dsNeusp.DataSet.FieldByName('flag').Value then
 fDebtList.Add(dsNeusp.DataSet.FieldByName('ik_upContent').AsString);
 dsNeusp.DataSet.Next;
 end;
end;

end.
