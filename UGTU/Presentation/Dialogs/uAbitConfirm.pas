unit uAbitConfirm;
  {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, StdCtrls, ActnList, Buttons, ExtCtrls,uAbitDialog, uFindAbit;

type
  TfrmAbitConfirm = class(TfrmBaseDialog)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    actAddAbit: TAction;
    actAddStatement: TAction;
    Label1: TLabel;
    BitBtn3: TBitBtn;
    actConfirmOnline: TAction;
    procedure actAddAbitExecute(Sender: TObject);
    procedure actAddStatementExecute(Sender: TObject);
    procedure actConfirmOnlineExecute(Sender: TObject);
  private
    { Private declarations }
  public
  HasAddSpec:boolean;
    { Public declarations }
  end;

var
  frmAbitConfirm: TfrmAbitConfirm;

implementation

{$R *.dfm}

procedure TfrmAbitConfirm.actAddAbitExecute(Sender: TObject);
begin
frmAbitCardDialog:=TfrmAbitCardDialog.Create(self);
frmAbitCardDialog.Tag:=self.Tag;
frmAbitCardDialog.hint:=self.hint;
frmAbitCardDialog.HasAddSpec:=HasAddSpec;
self.Close;
frmAbitCardDialog.ShowModal;
frmAbitCardDialog.Free;
end;

procedure TfrmAbitConfirm.actAddStatementExecute(Sender: TObject);
begin
frmFindAbit:=TfrmFindAbit.Create(self);
frmFindAbit.Tag:=self.Tag;
frmFindAbit.hint:=self.hint;
frmFindAbit.HasAddSpec:=HasAddSpec;
self.Close;
frmFindAbit.ShowModal;
frmFindAbit.Free;
end;



procedure TfrmAbitConfirm.actConfirmOnlineExecute(Sender: TObject);
begin
frmFindAbit:=TfrmFindAbit.Create(self);
frmFindAbit.Tag:=self.Tag;
frmFindAbit.hint:=self.hint;
frmFindAbit.IsOnline:=true;
frmFindAbit.HasAddSpec:=HasAddSpec;
self.Close;
frmFindAbit.ShowModal;
frmFindAbit.Free;

end;

end.
