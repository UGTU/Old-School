unit uMethodWorkFac;
  {# Author nnikolenko@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBTVFacMethodWorkObj, uBaseFrame, StdCtrls, Buttons, ExtCtrls,
  DBGridEh, DB, Mask, DBCtrlsEh, DBLookupEh, GridsEh, ComCtrls, ToolWin,
  ActnList, ImgList, MethodWorkController, GeneralController;


type
  TfmMethodWorkFac = class(TfmBase)
    PageControl1: TPageControl;
    tsDepartments: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    dbgeDep: TDBGridEh;
    DSDep: TDataSource;
    ImageList1: TImageList;
    actList: TActionList;
    actAddKaf: TAction;
    actEditKaf: TAction;
    actDelKaf: TAction;
    actAddNorm: TAction;
    actEditNorm: TAction;
    actDelNorm: TAction;
  private
    { Private declarations }
    fIK: integer;
    //fLastNormID: integer;
  protected
    procedure DoRefreshFrame;override;

  public
    { Public declarations }
    property IK: Integer read fIK write fIK;
  end;

var
  fmMethodWorkFac: TfmMethodWorkFac;

implementation
uses uMain, uMethodWorkAddNorm;
{$R *.dfm}

procedure TfmMethodWorkFac.DoRefreshFrame;
begin
  inherited;
  bbUndo.Visible:=false;
  bbSave.Visible:= false;
  //DSDep.DataSet:=TDBNodeMetodWorkFacultyObject(FrameObject).AdoDataset;
  DSDep.DataSet:=DataSet;
end;

end.
