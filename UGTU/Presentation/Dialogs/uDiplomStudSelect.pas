unit uDiplomStudSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, StdCtrls, DBCtrlsEh, ActnList, Buttons, ExtCtrls,
  ComObj, uDMDiplom;

type
  TStud = class(Tobject)
    ikZach:integer;
    StudName:string;
  end;

type
  TfrmDiplomSelect = class(TForm)
    actBaseDialog: TActionList;
    actApply: TAction;
    actOK: TAction;
    actSprav: TAction;
    Bevel1: TBevel;
    Panel1: TPanel;
    bbOK: TBitBtn;
    bbCancel: TBitBtn;
    lbAllStud: TListBox;
    Label3: TLabel;
    btnAddStud: TSpeedButton;
    btnAddAllStuds: TSpeedButton;
    btnDelStud: TSpeedButton;
    btnDeleteAllStud: TSpeedButton;
    lbDiplomStud: TListBox;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnAddStudClick(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure btnDelStudClick(Sender: TObject);
    procedure btnAddAllStudsClick(Sender: TObject);
    procedure btnDeleteAllStudClick(Sender: TObject);
    procedure actOKUpdate(Sender: TObject);
    procedure actOKExecute(Sender: TObject);

  private
    AllStudList: TList;
    { Private declarations }
    procedure LoadStudents();
    procedure RefreshList(lbDiplomStud: TListBox; StudList: TList);
  public
    { Public declarations }
    DiplomList: TList;
  end;

var
  frmDiplomSelect: TfrmDiplomSelect;

implementation

{$R *.dfm}

{ TfrmDiplomSelect }

procedure TfrmDiplomSelect.actOKExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmDiplomSelect.actOKUpdate(Sender: TObject);
begin
  actOK.Enabled:=lbDiplomStud.Count > 0;
end;

procedure TfrmDiplomSelect.bbCancelClick(Sender: TObject);
begin
  inherited;
  btnDeleteAllStudClick(nil);
  Close;
end;

procedure TfrmDiplomSelect.btnAddAllStudsClick(Sender: TObject);
var i: integer;
  cur: TStud;
begin
  inherited;
  for  i:= 0 to lbAllStud.Count - 1 do
  begin
    cur:=TStud(lbAllStud.items.Objects[i]);
  //cur.stud.Node.ImageIndex:=cur.stud.baseImageIndex;
    AllStudList.Remove(cur);
    DiplomList.Add(cur);
  end;
  RefreshList(lbDiplomStud,DiplomList);
  RefreshList(lbAllStud,AllStudList);
end;

procedure TfrmDiplomSelect.btnAddStudClick(Sender: TObject);
var cur: TStud;
begin
  inherited;
  if lbAllStud.ItemIndex<0 then exit;
  cur:=TStud(lbAllStud.items.Objects[lbAllStud.ItemIndex]);
  //cur.stud.Node.ImageIndex:=cur.stud.baseImageIndex;
  AllStudList.Remove(cur);
  DiplomList.Add(cur);
  //cur.Free;

  RefreshList(lbDiplomStud,DiplomList);
  RefreshList(lbAllStud,AllStudList);
end;

procedure TfrmDiplomSelect.btnDeleteAllStudClick(Sender: TObject);
var i: integer;
  cur: TStud;
begin
  inherited;
  for  i:= 0 to lbDiplomStud.Count - 1 do
  begin
    cur:=TStud(lbDiplomStud.items.Objects[i]);
  //cur.stud.Node.ImageIndex:=cur.stud.baseImageIndex;
    DiplomList.Remove(cur);
    AllStudList.Add(cur);
  end;
  RefreshList(lbDiplomStud,DiplomList);
  RefreshList(lbAllStud,AllStudList);
end;

procedure TfrmDiplomSelect.btnDelStudClick(Sender: TObject);
var cur: TStud;
begin
  inherited;
  if lbDiplomStud.ItemIndex<0 then exit;
  cur:=TStud(lbDiplomStud.items.Objects[lbDiplomStud.ItemIndex]);
  //cur.stud.Node.ImageIndex:=cur.stud.baseImageIndex;
  DiplomList.Remove(cur);
  AllStudList.Add(cur);
  //cur.Free;

  RefreshList(lbDiplomStud,DiplomList);
  RefreshList(lbAllStud,AllStudList);
end;

procedure TfrmDiplomSelect.FormShow(Sender: TObject);
begin
  inherited;
  LoadStudents;
end;

procedure TfrmDiplomSelect.LoadStudents;
var i: integer;
  cur: TStud;
begin
  lbAllStud.Items.Clear;
  AllStudList:= TList.Create();
  with DMDiplom.adospDiplomList do
  begin
    First;
    while (not DMDiplom.adospDiplomList.Eof) do
    begin
      cur:= TStud.Create();
      cur.ikZach:= FieldByName('ik_zach').AsInteger;
      cur.StudName:= FieldByName('StudName').AsString;
      AllStudList.Add(cur);
      lbAllStud.AddItem(FieldByName('StudName').AsString, cur);
      Next;
    end;
  end;
  DiplomList:= TList.Create();
end;

procedure TfrmDiplomSelect.RefreshList(lbDiplomStud: TListBox; StudList: TList);
var i:integer;
  cur:TStud;
begin
  lbDiplomStud.Items.Clear;
  for i:=0 to (StudList.Count-1) do
  begin
    cur:=StudList.items[i];
    lbDiplomStud.AddItem(cur.StudName,cur);
  end
end;

end.
