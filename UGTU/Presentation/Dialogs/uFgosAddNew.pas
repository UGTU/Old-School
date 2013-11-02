unit uFgosAddNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, DBGridEh,
  DBLookupEh, Mask, DBCtrlsEh,GeneralController, uFgosController, DateUtils, DB;

type
  TfrmFgosAddNew = class(TfrmBaseDialog)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    dbdtDate: TDBDateTimeEditEh;
    eNum: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Panel2: TPanel;
    Label3: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label18: TLabel;
    procedure dbdtDateChange(Sender: TObject);
    procedure eNumChange(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
  private
    IDFgos: integer;
    isAlreadyLoad: boolean;
    procedure CheckModified;
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
    { Private declarations }
  public
    procedure Read();

    { Public declarations }
  end;

var
  frmFgosAddNew: TfrmFgosAddNew;

implementation

{$R *.dfm}
uses uFgos, uDM;

function TfrmFgosAddNew.DoCancel:boolean;
begin
  case (Application.MessageBox('Сохранить внесенные изменения?','Измение ФГОС', MB_YESNOCANCEL)) of
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

procedure TfrmFgosAddNew.Edit1Change(Sender: TObject);
begin
  CheckModified;
end;

procedure TfrmFgosAddNew.Edit2Change(Sender: TObject);
begin
  CheckModified;

end;

procedure TfrmFgosAddNew.Edit3Change(Sender: TObject);
begin
  CheckModified;

end;

procedure TfrmFgosAddNew.Edit4Change(Sender: TObject);
begin
  CheckModified;
end;

procedure TfrmFgosAddNew.Edit5Change(Sender: TObject);
begin
  CheckModified;
end;

procedure TfrmFgosAddNew.Edit6Change(Sender: TObject);
begin
  CheckModified;
end;

procedure TfrmFgosAddNew.eNumChange(Sender: TObject);
begin
  CheckModified;
end;

procedure TfrmFgosAddNew.CheckModified;
var isDate: TDateTime;
    Numb: integer;
    correct: boolean;
begin

  try
    Numb := StrToInt(eNum.Text);
    Numb := StrToInt(Edit6.Text);
    if Numb>0 then correct := true else correct := false;
  except
    correct := false;
  end;

 //здесь нужно проверять дату на корректность
  IsModified := correct;
end;

procedure TfrmFgosAddNew.dbdtDateChange(Sender: TObject);
begin
  CheckModified;
end;

function TfrmFgosAddNew.DoApply:boolean;
var FgosIK, year, spec, num, all_h, all_aud, min_hol, max_hol, min_win, ZE: integer;
    a,b,c:word;
begin
    if ((dbdtDate.Value = NULL) OR (eNum.Text='')) then
      begin
        Application.MessageBox('Необходимо заполнить все поля...','ФГОС',MB_ICONERROR);
        Result:= false;
        exit;
      end;
    DecodeDate(dbdtDate.Value,a,b,c);
    year:=a;
    if (self.Tag = 1) then
    begin
      FgosIK:=self.IK
    end
    else
    if (self.Tag = 2) then
    begin
      FgosIK:=IDFgos;
    end;
    if ((Edit1.Text)<>'')then all_h:=StrToInt(Edit1.Text) else all_h:=0;
    if ((Edit2.Text)<>'')then all_aud:=StrToInt(Edit2.Text)else all_aud:=0;
    if ((Edit3.Text)<>'')then min_hol:=StrToInt(Edit3.Text)else min_hol:=0;
    if ((Edit4.Text)<>'')then max_hol:=StrToInt(Edit4.Text)else max_hol:=0;
    if ((Edit5.Text)<>'')then min_win:=StrToInt(Edit5.Text)else min_win:=0;
    if ((Edit6.Text)<>'')then ZE:=StrToInt(Edit6.Text)else ZE:=0;
    spec:=Label7.Tag;
    num:=StrToInt(eNum.Text);
    try
      dm.DBConnect.BeginTrans;
      if not TFgosController.Instance.SaveFgos(self.Tag, FgosIK, spec,
      year,num, ZE, all_h, all_aud, min_hol, max_hol, min_win,dbdtDate.Value ) then
      begin
        Result:= false;
        exit;
      end
      else (CallFrame as TfmFgos).FgosID:=IDFgos;
    Result:= true;
    dm.DBConnect.CommitTrans;
    except
    dm.DBConnect.RollbackTrans;
    raise;
    end;
end;

procedure  TfrmFgosAddNew.Read;
var FgosIK, year: integer;
    a,b,c:word;
begin
  if (self.Tag = 2) then
  begin
      dbdtDate.Value:= (CallFrame as TfmFgos).dbdtDate.Value;
      eNum.Text:= (CallFrame as TfmFgos).Label19.Caption;
      self.Caption:= 'Изменение ФГОС';
      IDFgos:=(CallFrame as TfmFgos).FgosID;
      Edit1.Text:=(CallFrame as TfmFgos).Label5.Caption;
      Edit2.Text:=(CallFrame as TfmFgos).Label15.Caption;
      Edit3.Text:=(CallFrame as TfmFgos).Label20.Caption;
      Edit4.Text:=(CallFrame as TfmFgos).Label21.Caption;
      Edit5.Text:=(CallFrame as TfmFgos).Label10.Caption;
      Edit6.Text:=(CallFrame as TfmFgos).Label16.Caption;
  end
  else
  begin
    self.Caption:= 'Добавление ФГОС';
  end;
  isAlreadyLoad:= false;
  IsModified:= false;
end;


end.
