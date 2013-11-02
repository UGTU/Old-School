unit uMethodWorkAutoPlan;
   {#Author nnikolenko@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, DBGridEh, DB,
  Mask, DBCtrlsEh, DBLookupEh, GridsEh, MethodWorkController, Grids, Contnrs,
  uMethodWorkAddPlan;

type
  TWeakEntity = record
  case Kind: Integer of
    0: (IDStatus: integer; Date: TDateTime);
    1: (IDUchPlan: integer);
  end;

  TArrayRecord = array of TWeakEntity;

  TSaveNewMethodWork = class
  private
    FNameEd: string;
    FVolume: integer;
    FContentNormIK: integer;
    FPlanMWIK: integer;
    FPrepodIK: integer;
    FDiscIK: integer;
    FBitEd: Boolean;
    FState: TArrayRecord;
    FUchPlan: TArrayRecord;
    FCountState: integer;
    FCountUchPlan: integer;
    constructor Create(NameEd: string; Volume: integer;
      ContentNormIK, PlanMWIK, PrepodIK, DiscIK: integer; BitEd: Boolean; State: TArrayRecord; UchPlan: TArrayRecord);
  published
    property CountState : integer read FCountState write FCountState;
    property CountUchPlan : integer read FCountUchPlan write FCountUchPlan;
    property State : TArrayRecord read FState write FState;
    property UchPlan : TArrayRecord read FUchPlan write FUchPlan;
  end;

  TfrmMethodWorkAutoPlan = class(TfrmBaseDialog)
    GroupBox2: TGroupBox;
    Panel10: TPanel;
    RG_Plan: TRadioGroup;
    dsAutoPlanPrep: TDataSource;
    SG: TStringGrid;
    dsState: TDataSource;
    dsCoautor: TDataSource;
    dsDiscEd: TDataSource;
    dsUchPlan: TDataSource;
    dsFile: TDataSource;
    procedure RG_PlanClick(Sender: TObject);
    procedure SGDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure FormResize(Sender: TObject);
    procedure SGSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SGDblClick(Sender: TObject);
    procedure SGMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    fPrepIK: integer;
    fKafIK: integer;
    fYearIK: integer;
    fPlanIK: integer;
    //fYearValue: integer;
    Q,W: Integer;
    s: integer; //выделенная строка в StringGrid
    procedure MyCheckBoxClick(Sender: TObject);
    procedure MyCheckBoxMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure MyMemoClick(Sender: TObject);
  protected
    function DoApply:boolean; override;
    function DoCancel:boolean;override;
  public
    { Public declarations }
    procedure Read;
    property PrepIK: integer read fPrepIK write fPrepIK;
    property KafIK: integer read fKafIK write fKafIK;
    property YearIK: integer read fYearIK write fYearIK;
    property PlanIK: integer read fPlanIK write fPlanIK;
    //property YearValue: integer read fYearValue write fYearValue;
  end;

var
  frmMethodWorkAutoPlan: TfrmMethodWorkAutoPlan;
  //ListObj: TObjectList;

implementation

{$R *.dfm}

{ TfrmMethodWorkAutoPlan }

function TfrmMethodWorkAutoPlan.DoApply: boolean;
var
  i,j,fLastMethodWork: integer;
begin
  fLastMethodWork:= -1;
  for I:= 1 to SG.RowCount - 1 do
    if (SG.Objects[0,i] as TCheckBox).Checked then
    begin
      dsFile.DataSet:= TMethodWorkController.Instance.LoadFile(self.IK);
      dsState.DataSet:= TMethodWorkController.Instance.LoadState(1, 0);
      dsCoautor.DataSet:= TMethodWorkController.Instance.LoadCoautor(KafIK, 0);
      dsDiscEd.DataSet:= TMethodWorkController.Instance.LoadDiscInDBGrid(KafIK, 0);
      dsUchPlan.DataSet:= TMethodWorkController.Instance.LoadUchPlan(KafIK, 0);

      dsState.DataSet.First;
      for j:= 0 to (SG.Objects[1,i] as TSaveNewMethodWork).CountState-1 do
      begin
        dsState.DataSet.Insert;
        dsState.DataSet.FieldByName('IDStatus').Value:= (SG.Objects[1,i] as TSaveNewMethodWork).State[j].IDStatus; //dsState.DataSet.FieldByName('NameStatus').LookupDataSet.FieldByName('IDStatus').Value;
        dsState.DataSet.FieldByName('DateTransitionInState').AsDateTime:= (SG.Objects[1,i] as TSaveNewMethodWork).State[j].Date; //StrToDateTime(SG.Cells[6,i]);
        dsState.DataSet.Next;
      end;

      dsUchPlan.DataSet.First;
      for j:= 0 to (SG.Objects[1,i] as TSaveNewMethodWork).CountUchPlan-1 do
      begin
        dsUchPlan.DataSet.Insert;
        dsUchPlan.DataSet.FieldByName('ik_uch_plan').Value:= (SG.Objects[1,i] as TSaveNewMethodWork).UchPlan[j].IDUchPlan; //dsState.DataSet.FieldByName('NameStatus').LookupDataSet.FieldByName('IDStatus').Value;
        dsUchPlan.DataSet.Next;
      end;

      if SG.Cells[7,i] = 'Издается' then
      TMethodWorkController.Instance.SavePlan(false, false, fLastMethodWork,
        SG.Cells[4,i], strToInt(SG.Cells[5,i]), '', '',
        '', '', '',
        (SG.Objects[3,i] as TMemo).Tag, PlanIK,
        PrepIK, StrToInt(SG.Cells[10,i]),
        true, '')
      else
      TMethodWorkController.Instance.SavePlan(false, false, fLastMethodWork,
        SG.Cells[4,i], strToInt(SG.Cells[5,i]), '', '',
        '', '', '',
        (SG.Objects[3,i] as TMemo).Tag, PlanIK,
        PrepIK, StrToInt(SG.Cells[10,i]),
        false, '');
    end;

  Result:= true;
end;

function TfrmMethodWorkAutoPlan.DoCancel: boolean;
begin

end;

procedure TfrmMethodWorkAutoPlan.FormResize(Sender: TObject);
var
  k: integer;
begin
  inherited;
  //GroupBox2.Width:= Self.ClientWidth;
  //SG.Width:= Self.ClientWidth - 4;
  k:= SG.Width div 30;

    SG.ColWidths[0]:= k;
    SG.ColWidths[1]:= 4*k;
    SG.ColWidths[2]:= 3*k;
    SG.ColWidths[3]:= 7*k;
    SG.ColWidths[4]:= 5*k + (SG.Width mod 30) - 14;
    SG.ColWidths[5]:= k;
    SG.ColWidths[6]:= 3*k;
    SG.ColWidths[7]:= 2*k;
    SG.ColWidths[8]:= 3*k;
    SG.ColWidths[9]:= k;
end;

procedure TfrmMethodWorkAutoPlan.MyCheckBoxClick(Sender: TObject);
var
  i: integer;
begin
  case (SG.Objects[0,0] as TCheckBox).State of
  cbChecked:
    for i:= 1 to SG.RowCount-1 do
    if ((SG.Objects[3,i] as TMemo).Text <> '') or (SG.Cells[4,i] <> '') or (SG.Cells[5,i] <> '') or (SG.Cells[6,i] <> '') then
      (SG.Objects[0,i] as TCheckBox).Checked:= true;
  cbUnchecked:
    for i:= 1 to SG.RowCount-1 do
      (SG.Objects[0,i] as TCheckBox).Checked:= false;
  end;
end;

procedure TfrmMethodWorkAutoPlan.MyCheckBoxMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  //Rect: TGridRect;
  Col,Row: integer;
begin
  SG.MouseToCell(Q, W, Col, Row);
  if (Sender as TCheckBox).State = cbUnchecked then
    if (Row <> 0) and (((SG.Objects[3,Row] as TMemo).Text = '') or (SG.Cells[4,Row] = '')
      or (SG.Cells[5,Row] = '') or (SG.Cells[6,Row] = '')) then
      (Sender as TCheckBox).State:= cbUnchecked
    else (Sender as TCheckBox).State:= cbChecked
  else (Sender as TCheckBox).State:= cbUnchecked;

  if Row <> 0 then
  begin
    //SG.SetFocus;
    {Rect.Top:= Row;
    Rect.Left:= 0;
    Rect.Bottom:= Row;
    Rect.Right:= SG.ColCount;
    SG.Selection:= Rect;}
    SG.Row:= Row;
  end;
end;

procedure TfrmMethodWorkAutoPlan.MyMemoClick(Sender: TObject);
var
  //Rect: TGridRect;
  Col,Row: integer;
begin
  SG.MouseToCell(Q, W, Col, Row);
  if Row <> 0 then
  begin
    //SG.SetFocus;
    {Rect.Top:= Row;
    Rect.Left:= 0;
    Rect.Bottom:= Row;
    Rect.Right:= SG.ColCount;
    SG.Selection:= Rect;}
    SG.Row:= Row;
  end;
end;

procedure TfrmMethodWorkAutoPlan.Read;
begin
  SG.Objects[0,0] := TCheckBox.Create(SG);
  (SG.Objects[0,0] as TCheckBox).Parent := SG;
  (SG.Objects[0,0] as TCheckBox).Checked:= false;
  (SG.Objects[0,0] as TCheckBox).BringToFront;
  (SG.Objects[0,0] as TCheckBox).Color:= clBtnFace;
  (SG.Objects[0,0] as TCheckBox).OnClick:= MyCheckBoxClick;
  (SG.Objects[0,0] as TCheckBox).OnMouseUp:= MyCheckBoxMouseUp;
  (SG.Objects[0,0] as TCheckBox).Visible:= false;

  {FEditor:= TCheckBox.Create(SG);
  FEditor.Parent:= SG;
  FEditor.Checked:= false;
  FEditor.Caption:= '';
  FEditor.Color:= clBtnFace;
  FEditor.OnClick:= MyCheckBoxClick; }

  SG.ColCount:= 12;
  SG.RowHeights[0]:= 32;
  SG.Cells[1,0]:= 'Дисциплина';
  SG.Cells[2,0]:= 'Результат работы';
  SG.Cells[3,0]:= 'Вид работы';
  SG.Cells[4,0]:= 'Наименование работы';
  SG.Cells[5,0]:= 'Об.';
  SG.Cells[6,0]:= 'Готовность по плану';
  SG.Cells[7,0]:= 'Издание';
  SG.Cells[8,0]:= 'Причина';
  SG.Cells[9,0]:= 'Кол. ст.';

  //ListObj:= TObjectList.Create(true);

  RG_PlanClick(nil);
end;

procedure TfrmMethodWorkAutoPlan.RG_PlanClick(Sender: TObject);
var
  i,j,f,k: integer;
  str: string;
begin
  if RG_Plan.ItemIndex = 0 then
    //Только УМР преподавателя
    dsAutoPlanPrep.DataSet:= TMethodWorkController.Instance.LoadAutoPlanPrep(PrepIK, KafIK, YearIK)
  else
    //Вся УМР - без учета преподавателя в факте
    dsAutoPlanPrep.DataSet:= TMethodWorkController.Instance.LoadAutoPlanOffPrep(PrepIK, KafIK, YearIK);

  for k := 0 to SG.ColCount-1 do
      for f := 1 to SG.RowCount-1 do
      begin
        SG.Cells[k,f]:= '';
        if SG.Objects[k, f] is TControl then
          SG.Objects[k, f].Free;
      end;

  if dsAutoPlanPrep.DataSet.RecordCount = 0 then
    SG.RowCount:= 2
  else SG.RowCount:= dsAutoPlanPrep.DataSet.RecordCount + 1;
  //ListObj.Clear;
  i:= 1; //строка
  j:= 0; //столбец
  str:= '0';
      dsAutoPlanPrep.DataSet.First;
      while not dsAutoPlanPrep.DataSet.Eof do
      begin
          //ListObj.Add(TCheckBox.Create(SG));
          SG.Objects[j,i] := TCheckBox.Create(SG);
          (SG.Objects[j,i] as TCheckBox).Parent := SG;
          (SG.Objects[j,i] as TCheckBox).BringToFront;
          (SG.Objects[j,i] as TCheckBox).OnMouseUp:= MyCheckBoxMouseUp;
          (SG.Objects[j,i] as TCheckBox).Visible:= false;

          SG.Cells[j+1,i]:= dsAutoPlanPrep.DataSet.FieldByName('cName_disc').AsString;
          SG.Cells[j+2,i]:= dsAutoPlanPrep.DataSet.FieldByName('NameWarrant').AsString;

          SG.Objects[j+3,i] := TMemo.Create(SG);
          (SG.Objects[j+3,i] as TMemo).Parent := SG;
          (SG.Objects[j+3,i] as TMemo).BorderStyle := bsNone;
          (SG.Objects[j+3,i] as TMemo).ReadOnly := true;
          (SG.Objects[j+3,i] as TMemo).BringToFront;
          (SG.Objects[j+3,i] as TMemo).OnClick:= MyMemoClick;
          //(SG.Objects[j+3,i] as TMemo).OnDblClick:= SGDblClick;

          SG.Cells[j+8,i]:= dsAutoPlanPrep.DataSet.FieldByName('Reason').AsString;
          SG.Cells[j+9,i]:= dsAutoPlanPrep.DataSet.FieldByName('Kol').AsString;
          SG.Cells[j+10,i]:= dsAutoPlanPrep.DataSet.FieldByName('ik_disc').AsString;
          SG.Cells[j+11,i]:= dsAutoPlanPrep.DataSet.FieldByName('IDWarrant').AsString;

          dsAutoPlanPrep.DataSet.Next;
        inc(i);
      end;
  //SG.Refresh;
end;

procedure TfrmMethodWorkAutoPlan.SGDblClick(Sender: TObject);
var
  StateArray: TArrayRecord;
  UchPlanArray: TArrayRecord;
  Rec1, Rec2: TWeakEntity;
  i: integer;
begin
  frmMethodWorkAddPlan:= TfrmMethodWorkAddPlan.CreateDialog(nil, self.Connection, nil);
try
  frmMethodWorkAddPlan.IK:= -1;
  frmMethodWorkAddPlan.NotSave:= true;
  //frmMethodWorkAddPlan.PrepIK:= PrepIK;
  frmMethodWorkAddPlan.NormIK:= TMethodWorkController.Instance.GetLastNormOfTime(KafIK);
  //frmMethodWorkAddPlan.YearValue:= YearValue;

  frmMethodWorkAddPlan.Read(KafIK, true, false);
  frmMethodWorkAddPlan.TabSheet2.TabVisible:= false;
  frmMethodWorkAddPlan.TabSheet3.TabVisible:= false;

  frmMethodWorkAddPlan.dbcbPlan.ListSource.DataSet.Locate('IDPlanMW', PlanIK, []);
  frmMethodWorkAddPlan.dbcbPlan.KeyValue:= frmMethodWorkAddPlan.dbcbPlan.ListSource.DataSet.FieldByName('ik_year').AsInteger;
  frmMethodWorkAddPlan.dbcbPlan.Enabled:= false;
  frmMethodWorkAddPlan.dbcbNameDisc.KeyValue:= StrToInt(SG.Cells[10,s]);
  frmMethodWorkAddPlan.dbcbWarrant.KeyValue:= StrToInt(SG.Cells[11,s]);
  if SG.Cells[4,s] <> '' then
  begin
    frmMethodWorkAddPlan.dbcbMW.KeyValue:= (SG.Objects[3,s] as TMemo).Tag;
    frmMethodWorkAddPlan.dbeNameEd.text:= SG.Cells[4,s];
    frmMethodWorkAddPlan.dbeVolume.text:= SG.Cells[5,s];
  end;
  {if SG.Cells[6,s] <> '' then
  begin
    frmMethodWorkAddPlan.dsState.DataSet.Edit;
    frmMethodWorkAddPlan.dsState.DataSet.FieldByName('DateTransitionInState').AsDateTime:= StrToDateTime(SG.Cells[6,s]);
  end;}
  if SG.Objects[1,s] <> nil then
  begin
  frmMethodWorkAddPlan.dsState.DataSet.First;
  frmMethodWorkAddPlan.dsState.DataSet.Delete;
  for i:= 0 to (SG.Objects[1,s] as TSaveNewMethodWork).CountState-1 do
      begin
        frmMethodWorkAddPlan.dsState.DataSet.Insert;
        frmMethodWorkAddPlan.dsState.DataSet.FieldByName('IDStatus').Value:= (SG.Objects[1,s] as TSaveNewMethodWork).State[i].IDStatus; //dsState.DataSet.FieldByName('NameStatus').LookupDataSet.FieldByName('IDStatus').Value;
        frmMethodWorkAddPlan.dsState.DataSet.FieldByName('DateTransitionInState').AsDateTime:= (SG.Objects[1,s] as TSaveNewMethodWork).State[i].Date; //StrToDateTime(SG.Cells[6,i]);
        frmMethodWorkAddPlan.dsState.DataSet.Next;
      end;

  frmMethodWorkAddPlan.dsUchPlan.DataSet.First;
  for i:= 0 to (SG.Objects[1,s] as TSaveNewMethodWork).CountUchPlan-1 do
      begin
        frmMethodWorkAddPlan.dsUchPlan.DataSet.Insert;
        frmMethodWorkAddPlan.dsUchPlan.DataSet.FieldByName('ik_uch_plan').Value:= (SG.Objects[1,s] as TSaveNewMethodWork).UchPlan[i].IDUchPlan; //dsState.DataSet.FieldByName('NameStatus').LookupDataSet.FieldByName('IDStatus').Value;
        frmMethodWorkAddPlan.dsUchPlan.DataSet.Next;
      end;
  end;
  if SG.Cells[7,s] = 'Издается' then
    frmMethodWorkAddPlan.dbcCurrentEd.Checked:= true
  else frmMethodWorkAddPlan.dbcCurrentEd.Checked:= false;
  //frmMethodWorkAddPlan.IsModified:= false;

    if (frmMethodWorkAddPlan.ShowModal() = mrOk) then
    begin
      SetLength(StateArray, frmMethodWorkAddPlan.dsState.DataSet.RecordCount);
      SetLength(UchPlanArray, frmMethodWorkAddPlan.dsUchPlan.DataSet.RecordCount);

        frmMethodWorkAddPlan.dsState.DataSet.First;
        for I := 0 to frmMethodWorkAddPlan.dsState.DataSet.RecordCount-1 do//High(StateArray) do //while (not frmMethodWorkAddPlan.dsState.DataSet.Eof) do
        begin
          Rec1.Kind:= 0;
          Rec1.IDStatus:= frmMethodWorkAddPlan.dsState.DataSet.FieldByName('IDStatus').AsInteger;
          Rec1.Date:= frmMethodWorkAddPlan.dsState.DataSet.FieldByName('DateTransitionInState').AsDateTime;
          StateArray[i]:= Rec1;
          frmMethodWorkAddPlan.dsState.DataSet.Next;
        end;

        frmMethodWorkAddPlan.dsUchPlan.DataSet.First;
        for I := 0 to frmMethodWorkAddPlan.dsUchPlan.DataSet.RecordCount-1 do//High(UchPlanArray) do //while (not frmMethodWorkAddPlan.dsState.DataSet.Eof) do
        begin
          Rec2.Kind:= 1;
          Rec2.IDUchPlan:= frmMethodWorkAddPlan.dsUchPlan.DataSet.FieldByName('ik_uch_plan').AsInteger;
          UchPlanArray[i]:= Rec2;
          frmMethodWorkAddPlan.dsUchPlan.DataSet.Next;
        end;

      SG.Objects[1,s]:= TSaveNewMethodWork.Create(frmMethodWorkAddPlan.dbeNameEd.text, StrToInt(frmMethodWorkAddPlan.dbeVolume.text), frmMethodWorkAddPlan.dbcbMW.KeyValue, PlanIK, PrepIK, frmMethodWorkAddPlan.dbcbNameDisc.KeyValue, frmMethodWorkAddPlan.dbcCurrentEd.Checked, StateArray, UchPlanArray);
      (SG.Objects[1,s] as TSaveNewMethodWork).CountState:= frmMethodWorkAddPlan.dsState.DataSet.RecordCount;
      (SG.Objects[1,s] as TSaveNewMethodWork).CountUchPlan:= frmMethodWorkAddPlan.dsUchPlan.DataSet.RecordCount;

      SG.Cells[10,s]:= IntToStr(frmMethodWorkAddPlan.dbcbNameDisc.KeyValue);
      SG.Cells[11,s]:= IntToStr(frmMethodWorkAddPlan.dbcbWarrant.KeyValue);
      SG.Cells[1,s]:= frmMethodWorkAddPlan.dbcbNameDisc.Text;
      SG.Cells[2,s]:= frmMethodWorkAddPlan.dbcbWarrant.Text;
      (SG.Objects[3,s] as TMemo).Tag:= frmMethodWorkAddPlan.dbcbMW.KeyValue;
      (SG.Objects[3,s] as TMemo).Text:= frmMethodWorkAddPlan.dbcbMW.Text;
      SG.Cells[4,s]:= frmMethodWorkAddPlan.dbeNameEd.text;
      SG.Cells[5,s]:= frmMethodWorkAddPlan.dbeVolume.text;
      SG.Cells[6,s]:= frmMethodWorkAddPlan.dsState.DataSet.FieldByName('DateTransitionInState').AsString;
      if frmMethodWorkAddPlan.dbcCurrentEd.Checked then
        SG.Cells[7,s]:= 'Издается'
      else SG.Cells[7,s]:= 'Не издается';
      IsModified:= true;

      StateArray:= nil;
      UchPlanArray:= nil;
    end;
finally
  frmMethodWorkAddPlan.Free;
end;
end;

procedure TfrmMethodWorkAutoPlan.SGDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  h,b: integer;
  r, r2: TRect;
  F: Word;
  Grid : TStringGrid;
begin
  Grid :=  (Sender as TStringGrid);
  Grid.DefaultDrawing := true;

  r:= Rect;
  r.Left:= r.Left+2;
  r.Top:= r.Top+2;
  r.Right := r.Right-2;
  r.Bottom := r.Bottom - 2;

  FormResize(nil);

  {if (FEditor <> nil) then
  begin
    FEditor.Parent:= (Sender as TStringGrid);
    FEditor.SetBounds(round((Sender as TStringGrid).ColWidths[0]/2)-5, 0, (Sender as TStringGrid).ColWidths[0] div 2 -1, 31);
  end; }

  if (gdFixed in State) then
  begin
    with Grid do
    begin
      Canvas.FillRect(Rect);
      F := DT_CENTER or DT_WORDBREAK or DT_TOP;
      Canvas.Font.Style:= Canvas.Font.Style + [fsBold];
      DrawText(Canvas.Handle,PChar(Cells[ACol,ARow]),length(Cells[ACol,ARow]),r,F);
    end;
  end;

  if not(gdSelected in State) and not(gdFixed in State) then
    Grid.Canvas.Brush.Color:= clWindow;
  if (gdSelected in State) then
    Grid.Canvas.Brush.Color:= clHighlight;

  if not(gdSelected in State) and not(gdFixed in State) or (gdSelected in State) then
    with Grid do
    begin
      //Canvas.Brush.Color:= clWindow;
      Canvas.FillRect(Rect);

      if (ACol = 7) then
      begin
        r2:= r;
        r2.Left:= r2.Left+ 7;
        r2.Top:= r2.Top+ 7;
        r2.Right := r2.Right- 7;
        r2.Bottom := r2.Bottom - 7;
        IF Cells[ACol,ARow] = 'Издается' then
		      F := DFCS_CHECKED
		    Else F := DFCS_BUTTONCHECK;
        DrawFrameControl(Canvas.Handle, r2, DFC_BUTTON, F);
	    end
      else
      begin
        F:= DT_LEFT or DT_WORDBREAK or DT_TOP;
        Canvas.Font.Color := clWindowText;
        DrawText(Canvas.Handle,PChar(Cells[ACol,ARow]),length(Cells[ACol,ARow]),r,F);
      end;
    end;

  {if (ACol = 0) and not(gdFixed in State) and (ListObj.Count <> 0) then
  begin
    h:= 0;
    b:= 1;
    for k:= 0 to ListObj.Count-1 do
    begin
      TCheckBox(ListObj[k]).Parent:= (Sender as TStringGrid);
      TCheckBox(ListObj[k]).Color:= clWindow;
      TCheckBox(ListObj[k]).SetBounds(round((Sender as TStringGrid).ColWidths[0]/2)-5, (Sender as TStringGrid).RowHeights[0] + b + h*(Sender as TStringGrid).DefaultRowHeight, (Sender as TStringGrid).ColWidths[0] div 2, (Sender as TStringGrid).DefaultRowHeight);
      inc(h);
      inc(b);
    end;
    if (gdSelected in State) then
      TCheckBox(ListObj[ARow-1]).Color:= clHighlight;
  end;}

  if (Sender as TStringGrid).Objects[ACol, ARow] is TControl then
  begin
    ((Sender as TStringGrid).Objects[ACol, ARow] as TControl).BoundsRect := r;
    if (gdSelected in State) and ((Sender as TStringGrid).Objects[ACol, ARow] is TMemo) then
      ((Sender as TStringGrid).Objects[ACol, ARow] as TMemo).Color:= clHighlight
    else if ((Sender as TStringGrid).Objects[ACol, ARow] is TMemo) then
      ((Sender as TStringGrid).Objects[ACol, ARow] as TMemo).Color:= clWindow;
    if (gdSelected in State) and ((Sender as TStringGrid).Objects[ACol, ARow] is TCheckBox) then
      ((Sender as TStringGrid).Objects[ACol, ARow] as TCheckBox).Color:= clHighlight
    else if ((Sender as TStringGrid).Objects[ACol, ARow] is TCheckBox) and not(gdFixed in State) then
      ((Sender as TStringGrid).Objects[ACol, ARow] as TCheckBox).Color:= clWindow;
    ((Sender as TStringGrid).Objects[ACol, ARow] as TControl).Visible:= true;
  end;

end;

procedure TfrmMethodWorkAutoPlan.SGMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  Q:= X;
  W:= Y;
end;

procedure TfrmMethodWorkAutoPlan.SGSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  SG.Hint:= SG.Cells[ACol,ARow];
  s:= ARow;
end;

{ TSaveNewMethodWork }

constructor TSaveNewMethodWork.Create(NameEd: string; Volume, ContentNormIK,
  PlanMWIK, PrepodIK, DiscIK: integer; BitEd: Boolean; State,
  UchPlan: TArrayRecord);
begin
  NameEd:= FNameEd;
  FVolume:= Volume;
  FContentNormIK:= ContentNormIK;
  FPlanMWIK:= PlanMWIK;
  FPrepodIK:= PrepodIK;
  FDiscIK:= DiscIK;
  FBitEd:= BitEd;
  FState:= State;
  FUchPlan:= UchPlan;
end;

end.
