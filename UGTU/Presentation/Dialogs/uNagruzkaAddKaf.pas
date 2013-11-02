unit uNagruzkaAddKaf;
   {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, StdCtrls, Mask, DBCtrlsEh, ActnList, Buttons, DB,
  ExtCtrls, ADODB;

type
  TfrmNagruzkaAddKaf = class(TfrmBaseDialog)
    Label1: TLabel;
    Label2: TLabel;
    dbeName: TDBEditEh;
    dbeNameShort: TDBEditEh;
    Label3: TLabel;
    Label4: TLabel;
    procedure dbeNameChange(Sender: TObject);
    procedure dbeNameMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    procedure Read;
  end;

var
  frmNagruzkaAddKaf: TfrmNagruzkaAddKaf;

implementation

{$R *.dfm}

{ TfrmNagruzkaAddKaf }

function TfrmNagruzkaAddKaf.DoApply: boolean;
var
  tempStoredProc: TADOStoredProc;
begin
  tempStoredProc:= TADOStoredProc.Create(nil);
  tempStoredProc.Connection:= Connection;
  tempStoredProc.ProcedureName:= 'UpdateKafedraInFac';
  if (Tag >= 0) then
  begin
    tempStoredProc.Parameters.CreateParameter('@i_type', ftInteger, pdInput, 0, 2);
    tempStoredProc.Parameters.CreateParameter('@ik_kaf', ftInteger, pdInput, 0, Tag);
    tempStoredProc.Parameters.CreateParameter('@ik_fac', ftInteger, pdInput, 0, self.IK);
    tempStoredProc.Parameters.CreateParameter('@Cname', ftString, pdInput, 100, dbeName.Text);
    tempStoredProc.Parameters.CreateParameter('@Cname_short', ftString, pdInput, 10, dbeNameShort.Text);
  end
  else
  begin
    tempStoredProc.Parameters.CreateParameter('@i_type', ftInteger, pdInput, 0, 1);
    tempStoredProc.Parameters.CreateParameter('@ik_kaf', ftInteger, pdInput, 0, 0);
    tempStoredProc.Parameters.CreateParameter('@ik_fac', ftInteger, pdInput, 0, self.IK);
    tempStoredProc.Parameters.CreateParameter('@Cname', ftString, pdInput, 100, dbeName.Text);
    tempStoredProc.Parameters.CreateParameter('@Cname_short', ftString, pdInput, 10, dbeNameShort.Text);
  end;
  try
    tempStoredProc.Connection.BeginTrans;
    tempStoredProc.ExecProc;
    tempStoredProc.Connection.CommitTrans;
    tempStoredProc.Free;
    Result:= true;
  except
    tempStoredProc.Connection.RollbackTrans;
    tempStoredProc.Free;
    raise;
  end;
end;

function TfrmNagruzkaAddKaf.DoCancel: boolean;
begin
  case (Application.MessageBox('Сохранить внесенные изменения?','Измение информации о кафедре', MB_YESNOCANCEL)) of
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

procedure TfrmNagruzkaAddKaf.Read;
begin
  if (Tag >= 0) then
  begin
    DataSet:= TADODataSet.Create(nil);
    DataSet.Connection:= Self.Connection;
    (DataSet as TADODataSet).CommandText:= 'Select * From Kafedra Where ik_kaf = ' + IntToStr(Tag);
    DataSet.Open;
    dbeName.Text:= DataSet.FieldByName('cname_kaf').AsString;
    dbeNameShort.Text:= DataSet.FieldByName('cshort_name_kaf').AsString;
    DataSet.Close;
    DataSet:= nil;
  end;
  IsModified:= false;
end;

procedure TfrmNagruzkaAddKaf.dbeNameChange(Sender: TObject);
begin
  inherited;
  IsModified:= (dbeName.Text <> '') and (dbeNameShort.Text <> '') and (Length(dbeName.Text) < 100) and (Length(dbeNameShort.Text) < 10);
end;

procedure TfrmNagruzkaAddKaf.dbeNameMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  dbeName.Hint:= dbeName.Text;
  dbeName.ShowHint:= true;
end;

end.
