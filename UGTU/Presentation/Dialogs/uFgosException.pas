unit uFgosException;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, DBGridEh, Mask,
  DBCtrlsEh, DBLookupEh, GeneralController, uFgosController, DB, uDM,
  uFgosExceptionTable;

type
  TfrmFgosException = class(TfrmBaseDialog)
    Label1: TLabel;
    Label2: TLabel;
    eDiscZE: TEdit;
    dbcbdiscpl: TDBLookupComboboxEh;
    dsGetException: TDataSource;
    procedure eDiscZEChange(Sender: TObject);
    procedure dbcbdiscplChange(Sender: TObject);
  private
    { Private declarations }
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    { Public declarations }
    function  Read:boolean;
    procedure Close();
  end;

var
  frmFgosException: TfrmFgosException;

implementation

{$R *.dfm}
uses uFgos;

function TfrmFgosException.DoCancel:boolean;
begin
  case (Application.MessageBox('Сохранить внесенные изменения?','Добавление исключения', MB_YESNOCANCEL)) of
      mrYes:
        begin
          OK;
          Result:= false;
        end;
      mrNo: Result:= true;
      mrCancel: Result:= false;
      else Result:= false;
   end;
   Close();
end;

procedure TfrmFgosException.eDiscZEChange(Sender: TObject);
begin
  IsModified := (eDiscZE.Text<>'')and(dbcbdiscpl.KeyValue<>NULL)

end;

procedure TfrmFgosException.dbcbdiscplChange(Sender: TObject);
begin
  IsModified := (eDiscZE.Text<>'')and(dbcbdiscpl.KeyValue<>NULL)
end;

function TfrmFgosException.DoApply:boolean;
var  FgosIK, znach_ze, ExcIK: integer;
begin
    if ((dbcbdiscpl.Value = NULL) OR (eDiscZE.Text='')) then
      begin
        Application.MessageBox('Необходимо заполнить все поля...','Исключение по зачетным единицам',MB_ICONERROR);
        Result:= false;
        exit;
      end;
    try
      FgosIK:=Tag;
      znach_ze:= StrToInt(eDiscZE.Text);
      dm.DBConnect.BeginTrans;
      if not TFgosController.Instance.SaveFgosException(1, FgosIK,znach_ze,
      dbcbdiscpl.Value,0) then
      begin
        Result:= false;
        exit;
      end;
      {else (CallFrame as TfrmFgosExceptionTable).ExcFgosIK:=ExcIK; }
    Result:= true;
    dm.DBConnect.CommitTrans;
    except
    dm.DBConnect.RollbackTrans;
    raise;
    end;
Result:= true;
end;



function  TfrmFgosException.Read:boolean;
begin
TGeneralController.Instance.InitializeLockupCB(@dbcbdiscpl, 'iK_disc', 'cName_disc');
dbcbdiscpl.KeyValue:= TFgosController.Instance.getDisciplines(@dbcbdiscpl.ListSource.DataSet, true);
self.Caption:= 'Исключения по ФГОС';
Result:=true;
 // isAlreadyLoad:= false;
  IsModified:= false;

end;

procedure  TfrmFgosException.Close;
begin
TGeneralController.Instance.CloseLockupCB(@dbcbdiscpl);
end;

end.
