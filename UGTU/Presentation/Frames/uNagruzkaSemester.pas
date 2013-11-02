unit uNagruzkaSemester;
   {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseFrame, StdCtrls, Buttons, ExtCtrls, GridsEh, DBGridEh, ComCtrls,
  DB, ImgList;

type
  TfmNagruzkaSemester = class(TfmBase)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGridEh1: TDBGridEh;
    dsFaculties: TDataSource;
    ImageList1: TImageList;
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    fYearIK: integer;
    fSemIK: integer;
  protected
    procedure DoRefreshFrame;override;
  public
    procedure Read;
    property YearIK: Integer read fYearIK write fYearIK;
    property SemIK: Integer read fSemIK write fSemIK;
  end;

var
  fmNagruzkaSemester: TfmNagruzkaSemester;

implementation

uses uMain, DBTVFacobj;

{$R *.dfm}

{ TfmNagruzkaSemester }

procedure TfmNagruzkaSemester.DBGridEh1DblClick(Sender: TObject);
var
  i, facIK: integer;
begin
  if (DBGridEh1.DataSource.DataSet <> nil) then
  if  DBGridEh1.DataSource.DataSet.Active then
  begin
    DBGridEh1.DataSource.DataSet.DisableControls;
    try
      facIK:= DBGridEh1.DataSource.DataSet.FieldByName('ik_fac').AsInteger;
      frmMain.DBDekTreeView_TEST1.Selected.Expand(false);
      for i:=0 to (frmMain.DBDekTreeView_TEST1.Selected.Count-1) do
        if TDBNodeFacultyObject(frmMain.DBDekTreeView_TEST1.Selected.Item[i].Data).ik = facIK then
        begin
          frmMain.DBDekTreeView_TEST1.Selected.Item[i].Selected:=true;
          break;
        end;
    finally
      DBGridEh1.DataSource.DataSet.EnableControls;
    end;
  end;
end;

procedure TfmNagruzkaSemester.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    DBGridEh1DblClick(DBGridEh1);
end;

procedure TfmNagruzkaSemester.DoRefreshFrame;
begin
  inherited;
  Read;
end;

procedure TfmNagruzkaSemester.Read;
begin
  dsFaculties.DataSet:= DataSet;
end;

end.
