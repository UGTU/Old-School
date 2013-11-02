unit uSelOrder;
  {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, GridsEh, DBGridEh, ActnList, StdCtrls, Buttons, ExtCtrls, udmPrikaz, uStudDlg;

type
  TfrmOrderPick = class(TfrmBaseDialog)
    dbgeOrder: TDBGridEh;
    procedure dbgeOrderTitleClick(Column: TColumnEh);
    procedure actOKExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOrderPick: TfrmOrderPick;

implementation

{$R *.dfm}

procedure TfrmOrderPick.actOKExecute(Sender: TObject);
begin
ftmStudent.dbcbeNumPrik.KeyValue:=dmPrikaz.adodsPrikaz.FieldByName('ik_prikaz').Value;
close;
end;

procedure TfrmOrderPick.dbgeOrderTitleClick(Column: TColumnEh);
begin
 dmPrikaz.adodsPrikaz.Sort:='['+Column.FieldName+']';
end;

end.
