unit uMethodWorkHyperLink;
    {#Author nnikolenko@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrlsEh;

type
  TfrmMethodWorkHyperLink = class(TfrmBaseDialog)
    Label9: TLabel;
    Label10: TLabel;
    dbeName: TDBEditEh;
    Label1: TLabel;
    Label2: TLabel;
    dbeAdress: TDBEditEh;
    procedure dbeNameChange(Sender: TObject);
  private
    { Private declarations }
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    { Public declarations }
  end;

var
  frmMethodWorkHyperLink: TfrmMethodWorkHyperLink;

implementation

{$R *.dfm}

{ TfrmMethodWorkHyperLink }

procedure TfrmMethodWorkHyperLink.dbeNameChange(Sender: TObject);
begin
  IsModified:= true;//(dbeName.Text <> '') and (dbeAdress.Text <> '');
end;

function TfrmMethodWorkHyperLink.DoApply: boolean;
begin
  if (dbeName.Text = '') or (dbeAdress.Text = '') then
      begin
        Result:= false;
        Application.MessageBox('Необходимо указать текст и адрес гиперссылки!', 'Добавление гиперссылки', MB_ICONWARNING);
        exit;
      end;
  Result:= true;
end;

function TfrmMethodWorkHyperLink.DoCancel: boolean;
begin
  case (Application.MessageBox('Сохранить внесенные изменения?','Измение информации о документации', MB_YESNOCANCEL)) of
      mrYes:
        begin
          OK;
          Result:= false;
          bbApply.Tag:= 1;
        end;
      mrNo: Result:= true;
      mrCancel: Result:= false;
      else Result:= false;
  end
end;

end.
