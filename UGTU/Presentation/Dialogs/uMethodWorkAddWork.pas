unit uMethodWorkAddWork;
  {#Author nnikolenko@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrlsEh,
  GeneralController, MethodWorkController, DBGridEh, DBLookupEh, Spin;

type
  TfrmMethodWorkAddWork = class(TfrmBaseDialog)
    Panel2: TPanel;
    CBox: TCheckBox;
    CBoxEdition: TCheckBox;
    dbcbWarrant: TDBLookupComboboxEh;
    dbeNameW: TDBEditEh;
    Label1: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label9: TLabel;
    procedure dbeNameWChange(Sender: TObject);
    procedure CBoxEditionClick(Sender: TObject);
    procedure CBoxClick(Sender: TObject);
    procedure dbcbWarrantKeyValueChanged(Sender: TObject);
  private
    { Private declarations }
    fIKParent:integer;
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    { Public declarations }
    fLastAddWork: integer;
    procedure Read(NewSection: Boolean);
    property IKParent: integer read fIKParent write fIKParent;
  end;

var
  frmMethodWorkAddWork: TfrmMethodWorkAddWork;

implementation

{$R *.dfm}

function TfrmMethodWorkAddWork.DoApply: boolean;
begin
  fLastAddWork:= self.IK;
  if Caption = 'Добавление нового раздела работ' then
    Result:= TMethodWorkController.Instance.SaveSectionWork(dbeNameW.Text)
  else
  begin
    if CBox.Checked then
      TMethodWorkController.Instance.SaveWork(fLastAddWork, dbeNameW.Text, -1, self.IKParent, NULL)
    else
    begin
      if dbcbWarrant.KeyValue = NULL then
      begin
        Result:= false;
        Application.MessageBox('Необходимо указать результат выполнения данного вида работ!', 'Сохранение вида работ', MB_ICONWARNING);
        exit;
      end;
      TMethodWorkController.Instance.SaveWork(fLastAddWork, dbeNameW.Text, CBoxEdition.Tag, self.IKParent, dbcbWarrant.KeyValue);
    end;
  end;
  Result:= true;
end;

function TfrmMethodWorkAddWork.DoCancel: boolean;
begin
  case (Application.MessageBox('Сохранить внесенные изменения?','Измение информации о видах работ', MB_YESNOCANCEL)) of
      mrYes:
        begin
          OK;
          Result:= false;
          bbApply.Tag:= 1;
        end;
      mrNo: Result:= true;
      mrCancel: Result:= false;
      else Result:= false;
  end;
end;

procedure TfrmMethodWorkAddWork.CBoxClick(Sender: TObject);
begin
  if CBox.Checked then
  begin
    CBoxEdition.Visible:= false;
    ClientHeight:= ClientHeight - 30;
    Panel2.Height:= Panel2.Height - 30;
  end
  else
  begin
    CBoxEdition.Visible:= true;
    ClientHeight:= ClientHeight + 30;
    Panel2.Height:= Panel2.Height + 30;
  end;
  IsModified:= (dbeNameW.Text <> '');
end;

procedure TfrmMethodWorkAddWork.CBoxEditionClick(Sender: TObject);
begin
  if CBoxEdition.Checked then CBoxEdition.Tag:= 1
  else CBoxEdition.Tag:= 0;
  IsModified:= (dbeNameW.Text <> '') and (dbcbWarrant.KeyValue <> NULL);
end;

procedure TfrmMethodWorkAddWork.dbcbWarrantKeyValueChanged(Sender: TObject);
begin
  IsModified:= (dbeNameW.Text <> '') and (dbcbWarrant.KeyValue <> NULL);
end;

procedure TfrmMethodWorkAddWork.dbeNameWChange(Sender: TObject);
begin
  IsModified:= (dbeNameW.Text <> '');
end;

procedure TfrmMethodWorkAddWork.Read(NewSection: Boolean);
begin
  CBoxClick(nil);
  if NewSection then
  begin
    Caption:= 'Добавление нового раздела работ';
    CBoxEdition.Visible:= false;
    CBox.Visible:= false;
  end
  else
  begin
    CBoxEdition.Visible:= false;
    CBox.Visible:= true;
    TGeneralController.Instance.InitializeLockupCB(@dbcbWarrant, 'IDWarrant', 'NameWarrant');
    dbcbWarrant.KeyValue:= TMethodWorkController.Instance.GetWarrant(@dbcbWarrant.ListSource.DataSet, false);

    if (Self.IK < 0) then
      Caption:= 'Добавление работы в раздел'
    else
      Caption:= 'Изменение работы';
  end;
  IsModified:= false;
end;

end.
