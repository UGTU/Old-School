unit uSpravForm;
   {#Author tanyav@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseFrame, DBClient, Provider, DB, ADODB, Grids, DBGridEh,
  ExtCtrls, DBCtrls, StdCtrls, ImgList, ComCtrls, ToolWin, Buttons,
  ActnList, Menus, GridsEh, uSpravFram;

type
  TfrmSprav = class(TForm)
    bbUndo: TBitBtn;
    BitBtn1: TBitBtn;
    fmSprav1: TfmSprav;
    Panel1: TPanel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fmSprav1BitBtn1Click(Sender: TObject);
  private
    FConnection: TADOConnection;
    FpredSprav: string;
    { Private declarations }
  public
    { Public declarations }
    property Connection:TADOConnection read FConnection write FConnection;
    property predSprav:string read FpredSprav write FpredSprav;

  protected


  published


  end;
var
  frmSprav: TfrmSprav;
implementation

{$R *.dfm}


procedure TfrmSprav.FormCreate(Sender: TObject);
begin
   fmSprav1.Modified:=false;
   fmSprav1.aSave.Enabled:=false;
   fmSprav1.aCancel.Enabled:=false;
end;

procedure TfrmSprav.fmSprav1BitBtn1Click(Sender: TObject);
begin
   Close;

end;

procedure TfrmSprav.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if fmSprav1.modified then
   begin
      if (MessageBox(Handle, PAnsiChar('         Сохранить внесенные изменения?'), 'ИС "УГТУ"', MB_YESNO))=IDYES then
            fmSprav1.Apply   //вызов сохранения
      else fmSprav1.Cancel;
   end;
end;


procedure TfrmSprav.FormShow(Sender: TObject);
begin
  if (fmSprav1.cbSprav.Items.Count=0) then
  begin
    fmSprav1.Connection:=Connection;
    fmSprav1.tSprav.Connection:=Connection;
    fmSprav1.tDopSprav.Connection:=Connection;
    fmSprav1.tDopSprav2.Connection:=Connection;
    fmSprav1.tSpravList.Connection:=Connection;
   // fmSprav1.flexit:=false;
  //загружаем список справочников
    fmSprav1.tSpravList.TableName:='Sprav';
    fmSprav1.tSpravList.Active:=true;
    fmSprav1.tSpravList.First;
    while not   fmSprav1.tSpravList.Eof do
    begin
      if fmSprav1.tSpravList.FieldByName('Visible').AsBoolean then
        fmSprav1.cbSprav.Items.Add(fmSprav1.tSpravList.FieldByName('SpravName').AsString);
      fmSprav1.tSpravList.Next;
    end;
  end;
  fmSprav1.Modified:=false;
  fmSprav1.aSave.Enabled:=false;
  fmSprav1.aCancel.Enabled:=false;
  if predSprav=fmSprav1.cbSprav.Items.Strings[0] then
    fmSprav1.cbSprav.ItemIndex:=1
  else
    fmSprav1.cbSprav.ItemIndex:=0;
  fmSprav1.cbSpravChange(Sender);

  if predSprav<>'' then
    fmSprav1.cbSprav.ItemIndex:=fmSprav1.cbSprav.items.IndexOf(predSprav);
  fmSprav1.cbSpravChange(Sender);

end;

procedure TfrmSprav.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Key=112)	then
Application.HelpSystem.ShowTopicHelp('Add_data_in_sprav.htm','ugtu_help.chm');
end;

end.
