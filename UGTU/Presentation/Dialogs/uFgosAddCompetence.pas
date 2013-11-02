unit uFgosAddCompetence;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, StdCtrls, ActnList, Buttons, ExtCtrls, uFgosController,
  GeneralController, ComCtrls, DBGridEh, Mask, DBCtrlsEh, DBLookupEh, GridsEh,
  ToolWin, ImgList, DB, ADODB;

const
    UnassignedId = -1;
type

  TfrmFgosAddCompetence = class(TfrmBaseDialog)
    Label1: TLabel;
    edShort: TEdit;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    RichEdit1: TRichEdit;
    actListStructCmptnc: TActionList;
    actLvlSformyr: TActionList;
    imgCmptnc: TImageList;
    actAddContentDescription: TAction;
    actDelContentDescription: TAction;
    actEditContentDescription: TAction;
    dsGetContentStrCmptnc: TDataSource;
    dsLvlSformyr: TDataSource;
    actAddSformyr: TAction;
    actEditSformyr: TAction;
    actDellSformyr: TAction;
    procedure RichEdit1Change(Sender: TObject);
    procedure edShortChange(Sender: TObject);

 private
    IDFgos: integer;
    isAlreadyLoad: boolean;
    fIKCompetence: integer;
    fIKTypeCompetence: integer;
    fTextComp: string;
    fShortName: string;
    fIKStr_Cmptnc: integer;
    fIKLevelSformyr: integer;
    FID : Integer;
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;

    { Private declarations }
  public
    constructor Create(AOwner : TComponent);override;
    property Id : Integer read FID write FID;
    function Read: boolean;
    property IKCompetence: integer read  fIKCompetence write fIKCompetence;
    property IKTypeCompetence: integer read fIKTypeCompetence write fIKTypeCompetence;
    property TextComp: string read fTextComp write fTextComp;
    property ShortName: string read  fShortName write fShortName;
    property IKStr_Cmptnc: integer read fIKStr_Cmptnc write fIKStr_Cmptnc;
    property IKLevelSformyr: integer read fIKLevelSformyr write fIKLevelSformyr;
    { Public declarations }
  end;

var
  frmFgosAddCompetence: TfrmFgosAddCompetence;

implementation

{$R *.dfm}
uses uDM, uFgosEditCompetence, uFgos;

function TfrmFgosAddCompetence.DoCancel:boolean;
begin
  case (Application.MessageBox('Сохранить внесенные изменения?','Компетенции ФГОС', MB_YESNOCANCEL)) of
      mrYes:
        begin
          OK;
          Result:= false;
        end;
      mrNo: Result:= true;
      mrCancel: Result:= false;
      else Result:= false;
   end;
end;



procedure TfrmFgosAddCompetence.edShortChange(Sender: TObject);
begin
  IsModified := (RichEdit1.Text<>'')
end;

constructor TfrmFgosAddCompetence.Create(AOwner: TComponent);
begin
  inherited;
  FID := UnassignedId;
end;

function TfrmFgosAddCompetence.DoApply:boolean;
var text_comp: string;
i:integer;
begin
    if (self.Tag = 1) then
    begin
      fIKCompetence:=0;
    end;
      text_comp:= RichEdit1.Text;
        try
          if not TFgosController.Instance.SaveCompetence(self.Tag, text_comp,edShort.Text, fIKTypeCompetence,
                  IDFgos, fIKCompetence)
          then
          begin
            Result:= false;
            exit;
          end else
            Result:= true;
        except
        end;
end;


function  TfrmFgosAddCompetence.Read: boolean;
var FgosIK, year: integer;
    a,b,c:word;
    s:string;
begin
  IDFgos:=(CallFrame as TfmFgos).FgosID;
  if (IDFgos = 0) then
      begin
        Application.MessageBox('Для работы с компетенциями необходимо создать ФГОС!',
        'Компетенции по ФГОС',MB_ICONERROR);
        Result:=false;
        exit;
      end;
  if (self.Tag = 2) then
  begin
      RichEdit1.Text:=fTextComp;
      edShort.Text := fShortName;
      self.Caption:= 'Изменение компетенции ФГОС';
      {загрузить данные по структуре компетенции и по уровню сформированности}
  end
  else
  begin
    if fIKTypeCompetence = 1 then
    edShort.Text := 'ОК' else edShort.Text := 'ПК';
    self.Caption:= 'Добавление компетенции ФГОС';
    RichEdit1.Text:='';
  end;
  Result:=true;
  isAlreadyLoad:= false;
  IsModified:= false;
end;

procedure TfrmFgosAddCompetence.RichEdit1Change(Sender: TObject);
begin
  IsModified := (edShort.Text<>'')and(RichEdit1.Text<>'');
end;

end.
