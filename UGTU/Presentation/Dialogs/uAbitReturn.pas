unit uAbitReturn;
  {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uAbitMove, DBGridEh, ActnList, DBCtrlsEh, DBLookupEh, StdCtrls, Mask,
  Buttons, ExtCtrls, System.Actions;

type
  TfrmAbitReturn = class(TfrmAbitMove)
    procedure actOKExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbitReturn: TfrmAbitReturn;

implementation

uses uDMAbiturientAction;
{$R *.dfm}

procedure TfrmAbitReturn.actOKExecute(Sender: TObject);
begin
 dmAbiturientAction.aspAbitReturn.Active:=false;
      with dmAbiturientAction.aspAbitReturn.Parameters do
      begin
        items[1].Value:=NNAbit;
        items[2].Value:=dbcbeRecruitNew.KeyValue;
        items[3].Value:=RegNumber;
        items[4].Value:=dbcbeCategoryNew.KeyValue;
        items[5].Value:=dbdteListNew.Value;

      end;

      dmAbiturientAction.aspAbitReturn.ExecProc;
      close;

end;

procedure TfrmAbitReturn.FormShow(Sender: TObject);
begin
  inherited;
  if RegNumber>0 then
  begin
    Text:= 'Восстановление заявления абитуриента №'+IntToStr(RegNumber);
  end;
end;

end.
