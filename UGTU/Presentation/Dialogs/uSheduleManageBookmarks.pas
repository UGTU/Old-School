unit uSheduleManageBookmarks;
  {#Author villain@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, Grids, ComCtrls,
  ToolWin;

type
  TfrmSheduleManageBookmarks = class(TfrmBaseDialog)
    Panel2: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    sgBookmarks: TStringGrid;
  private
    { Private declarations }
  public
    procedure Read;
  end;

var
  frmSheduleManageBookmarks: TfrmSheduleManageBookmarks;

implementation

{$R *.dfm}

{ TfrmSheduleManageBookmarks }

procedure TfrmSheduleManageBookmarks.Read;
begin
  sgBookmarks.ColWidths[0]:= sgBookmarks.Width;
end;

end.
