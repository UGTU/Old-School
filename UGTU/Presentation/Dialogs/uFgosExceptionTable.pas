unit uFgosExceptionTable;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, ImgList, ToolWin,
  ComCtrls, GridsEh, DBGridEh, GeneralController, uFgos, uFgosController, DB, ADODB;

type
  TfrmFgosExceptionTable = class(TfrmBaseDialog)
    Panel2: TPanel;
    dbExceptionFgos: TDBGridEh;
    ToolBar1: TToolBar;
    ActionList1: TActionList;
    actAddException: TAction;
    ImageList1: TImageList;
    actDelException: TAction;
    ToolButton1: TToolButton;
    dsGetExceptionByFgos: TDataSource;
    ToolBar2: TToolBar;
    ToolButton2: TToolButton;
    procedure actAddExceptionExecute(Sender: TObject);
    procedure actAddExceptionUpdate(Sender: TObject);
    procedure actDelExceptionExecute(Sender: TObject);
    procedure actDelExceptionUpdate(Sender: TObject);
    private
  IDFgos:integer;

    { Private declarations }
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    { Public declarations }
    ExcFgosIK: integer;
    function  Read:boolean;
  end;

var
  frmFgosExceptionTable: TfrmFgosExceptionTable;

implementation

uses uFgosException;

{$R *.dfm}

procedure TfrmFgosExceptionTable.actAddExceptionExecute(Sender: TObject);
begin
//  inherited;
  frmFgosException:= TfrmFgosException.CreateDialog(Application, Connection, nil);
  try
    if (frmFgosException.Read) then
    begin
    frmFgosException.Tag:=IDFgos;
      if ((frmFgosException.ShowModal()= mrOK) or (frmFgosException.bbApply.Tag = 1) )then
        begin
          dsGetExceptionByFgos.DataSet.Close;
          dsGetExceptionByFgos.DataSet.Open;

         // TFgosController.Instance.GetExceptionByFgos(IDFgos);
          frmFgosException.Close();
          IsModified := true;
        end;
    end;
  finally
  frmFgosException.Free;
  end;
end;

procedure TfrmFgosExceptionTable.actAddExceptionUpdate(Sender: TObject);
begin
//  inherited;

end;

procedure TfrmFgosExceptionTable.actDelExceptionExecute(Sender: TObject);
var excIK: integer;
    tempDS : TADODataSet;
begin
//  inherited;
//  excIK:=dbExceptionFgos.DataSource.DataSet.Fields[0].AsInteger;
//  excIK:=dbExceptionFgos.SelectedRows.DataSet.FieldByName('ik_exception_fgos').AsInteger;
  if (Application.MessageBox(PChar('Вы уверены, что хотите удалить выбранное исключение?'),'Удаление исключения по ФГОС',MB_YESNO) = mrYes)
  then
  begin
     excIK := dsGetExceptionByFgos.DataSet.FieldByName('ik_exception_fgos').AsInteger;
     if TFgosController.Instance.DeleteFgosException(excIK) then
     begin
       dsGetExceptionByFgos.DataSet.Close;
       dsGetExceptionByFgos.DataSet.Open;
       IsModified := true;
     end;

  end;

end;

procedure TfrmFgosExceptionTable.actDelExceptionUpdate(Sender: TObject);
begin
//  inherited;

end;

function TfrmFgosExceptionTable.DoCancel:boolean;
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

function TfrmFgosExceptionTable.DoApply:boolean;
var IKExcep: integer;
begin
      IKExcep:= ExcFgosIK;
      Result := true;
end;

function  TfrmFgosExceptionTable.Read:boolean;
var fgos: integer;
begin
IDFgos:=(CallFrame as TfmFgos).FgosID;
if (IDFgos = 0) then
      begin
        Application.MessageBox('Невозможно добавить исключение! Необходимо создать ФГОС!',
        'Исключение по ФГОС',MB_ICONERROR);
        Result:=false;
        exit;
      end;
dsGetExceptionByFgos.DataSet:=TFgosController.Instance.GetExceptionByFgos(IDFgos);
Result:=true;
 // isAlreadyLoad:= false;
  IsModified:= true;
end;


end.
