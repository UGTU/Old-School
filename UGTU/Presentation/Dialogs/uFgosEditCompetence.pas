unit uFgosEditCompetence;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, StdCtrls, ComCtrls, ActnList, Buttons, ExtCtrls,
  uFgos, uFgosController, GeneralController,  DBGridEh, Mask,
  DBCtrlsEh, DBLookupEh, GridsEh, ToolWin;

type
  TfrmFgosEditCompetence = class(TfrmBaseDialog)
    RichEdit1: TRichEdit;
    procedure RichEdit1Change(Sender: TObject);
  private
    { Private declarations }
  isAlreadyLoad: boolean;
  fCont_descr: string;
  fIKStr_Cmptnc: integer;
  fIKLevelCompetence: integer;
  fIKLevelSformyr: integer;
  fIKCompetence: integer;
  fIKTypeLevelSformyr: integer;
  fValue_priznak: string;
  fID:integer;
  fStrComp: TStringList;
  protected
  function DoApply:boolean; override;
  function DoCancel:boolean; override;
  procedure SetStrComp(const Value: TStringList);
  public
    { Public declarations }
  function Read: boolean;
  property Cont_descr: string read fCont_descr write fCont_descr;
  property Value_priznak: string write fValue_priznak;
  property IKStr_Cmptnc: integer write fIKStr_Cmptnc;
  property IKLevelCompetence: integer write fIKLevelCompetence;
  property IKLevelSformyr: integer write fIKLevelSformyr;
  property IKCompetence: integer write fIKCompetence;
  property IKTypeLevelSformyr: integer write fIKTypeLevelSformyr;
  property ID: integer read fID write fID;
  property StrComp: TStringList read fStrComp write SetStrComp;
  end;

var
  frmFgosEditCompetence: TfrmFgosEditCompetence;

implementation

{$R *.dfm}

uses uDM, uFgosAddCompetence;

function  TfrmFgosEditCompetence.Read: boolean;
var FgosIK, year: integer;
    a,b,c:word;
begin
  case (ID) of
  1:
  begin
    if (self.Tag = 2) then
    begin
      RichEdit1.Text:=fCont_descr;
      self.Caption:= 'Изменение содержания составляющей компетенции ФГОС';
    end
    else
    begin
      self.Caption:= 'Добавление содержания составляющей компетенции ФГОС';
      RichEdit1.Text:='';
    end;
    Result:=true;
    isAlreadyLoad:= false;
    IsModified:= false;
  end;
  2:
  begin
    if (self.Tag = 2) then
    begin
      RichEdit1.Text:=fValue_priznak;
      self.Caption:= 'Изменение признака уровня сформированности компетенции';
    end
    else
    begin
      self.Caption:= 'Добавление признака уровня сформированности компетенции';
      RichEdit1.Text:='';
    end;
    Result:=true;
    isAlreadyLoad:= false;
    IsModified:= false;
  end;
  end;
end;

procedure TfrmFgosEditCompetence.SetStrComp(const Value: TStringList);
var i: integer;
begin
  fStrComp.Clear;
  for I := 0 to Value.Count - 1 do
    fStrComp.Add(Value[i]);
end;

function TfrmFgosEditCompetence.DoApply:boolean;
begin
    case (ID) of
    1:
    begin
    fCont_descr:= RichEdit1.Text;
     if (self.Tag = 1) then
      begin
        fIKLevelSformyr:=0;
      end;
        fCont_descr:= RichEdit1.Text;
        try
          if not TFgosController.Instance.SaveStructureCompetence(self.Tag, fCont_descr,
          fIKStr_Cmptnc, fIKCompetence, fIKLevelCompetence)
          then
          begin
            Result:= false;
            exit;
          end else
            Result:= true;
            IsModified:=true;
        except
        end;
    end;
    2:
    begin
    fValue_priznak:= RichEdit1.Text;
       if (self.Tag = 1) then
        begin
          fIKStr_Cmptnc:=0;
        end;
          fValue_priznak:= RichEdit1.Text;
          try
            if not TFgosController.Instance.SaveLevelSformyr(self.Tag, fValue_priznak,
            fIKLevelSformyr, fIKCompetence, fIKTypeLevelSformyr,fIKLevelCompetence)
            then
            begin
              Result:= false;
              exit;
            end else
              Result:= true;
              IsModified:=true;
        except
        end;
    end;
    end;

end;

function TfrmFgosEditCompetence.DoCancel:boolean;
begin
  case (Application.MessageBox('Сохранить внесенные изменения?','Содержание составляющей компетенции ФГОС', MB_YESNOCANCEL)) of
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

procedure TfrmFgosEditCompetence.RichEdit1Change(Sender: TObject);
begin
  IsModified := (RichEdit1.Text<>'')
end;

end.
