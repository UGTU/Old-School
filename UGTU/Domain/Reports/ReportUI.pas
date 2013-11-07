unit ReportUI;
   {#Author fmarakasov@ugtu.net}
interface
uses
  Classes, XIntf, SysUtils, Controls, ComCtrls, Graphics, Contnrs;
type



  TReportControlCollection = class (TInterfacedObject, IReportControl)
  private
    FCollection : TInterfaceList;
    function GetItem(Index : Integer) : IReportControl;
  public
    constructor Create;
    destructor Destroy;override;
    procedure Add(const Item : IReportControl);
    procedure Remove(const Item : IReportControl);
    function Contains(const Item : IReportControl) : Boolean;
    property Items[index : Integer] : IReportControl read GetItem;

    // IReportControl implements
    procedure Init;
    procedure Reset(Count : Integer);
    procedure NextStep(CurrentStep : Integer; Note : string);
    procedure Complete;
    procedure SetError(E:Exception);
  end;

  TActionComponentUI = class (TComponent)
  private
    FActionComponent: IActionComponent;
    FControlCollection : TReportControlCollection;
    FQuitOnError : Boolean;
    FShowOnComplete : Boolean;

    procedure BeforeExecute(Sender:TObject);
    procedure AfterExecute(Sender:TObject);
    procedure ReportProgress(Sender:TObject; CurrentStep:Integer; ProgressNote:string);
    procedure ExecuteError(Sender:TObject; E : Exception);

    procedure SetReport ( Value : IActionComponent );
    procedure SetNilReportHandlers;
    procedure SetActualReportHandlers;
  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;

    procedure Add(const Item : IReportControl);
    procedure Remove(const Item : IReportControl);
    procedure BuildReport;
  published
    property ActionComponent : IActionComponent read FActionComponent write SetReport;
    property Controls : TReportControlCollection read FControlCollection;
    property QuitOnError : Boolean read FQuitOnError write FQuitOnError;
    property ShowOnComplete : Boolean read FShowOnComplete write FShowOnComplete;
  end;

  TReportControlBase = class (TComponent, IReportControl)
  private
    FOnInit : TNotifyEvent;
    FOnReset : TNotifyEvent;
    FOnComplete : TNotifyEvent;
    FOnError : TNotifyExecuteError;
  protected
     // IReportControl implements
    procedure Init;
    procedure Reset(Count : Integer);
    procedure NextStep(CurrentStep : Integer; Note : string);
    procedure Complete;
    procedure SetError(E:Exception);

    // Implements
    procedure DoInit;virtual;abstract;
    procedure DoReset(Count : Integer);virtual;abstract;
    procedure DoNextStep(CurrentStep : Integer; Note : string);virtual;abstract;
    procedure DoComplete;virtual;abstract;
    procedure DoSetError(E:Exception);virtual;abstract;

  published
    property OnError : TNotifyExecuteError read FOnError write FOnError;
    property OnInit : TNotifyEvent read FOnInit write FOnInit;
    property OnComplete : TNotifyEvent read FOnComplete write FOnComplete;
    property OnReset : TNotifyEvent read FOnReset write FOnReset;
  end;

  TNotifyReportProgressMessage = procedure (Sender : TObject; Step:Integer; StepNote : String; var Msg : string) of object;
  TNotifyErrorMessage = procedure (Sender : TObject; E : Exception; var Msg : string) of object;

  TWindowReportControlCollection = class (TReportControlBase)
  private
    FCollection : TComponentList;
    FCount : Integer;
    FInitText : string;
    FCompleteText : string;
    FOnProgressMessage : TNotifyReportProgressMessage;
    FOnErrorMessage :  TNotifyErrorMessage;
   protected
    function GetControl(I : Integer) : TWinControl;
    // Base implements
    procedure DoInit;override;
    procedure DoReset(Count : Integer);override;
    procedure DoNextStep(CurrentStep : Integer; Note : string);override;
    procedure DoComplete;override;
    procedure DoSetError(E:Exception);override;

    property Items[i : Integer] : TWinControl read GetControl;
  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
    procedure AddControl(Control : TWinControl);
    procedure RemoveControl (Control : TWinControl);
  published
    property ControlCollection : TComponentList read FCollection write FCollection;
    property InitText : string read FInitText write FInitText;
    property CompleteText : string read FCompleteText write FCompleteText;
    property OnProgressMessage : TNotifyReportProgressMessage read FOnProgressMessage write FOnProgressMessage;
    property OnErrorMessage : TNotifyErrorMessage read FOnErrorMessage write FOnErrorMessage;
  end;


  TProgressBarReportControl = class (TReportControlBase)
  private
    FProgressBar : TProgressBar;
  protected
    procedure DoInit;override;
    procedure DoReset(Count : Integer);override;
    procedure DoNextStep(CurrentStep : Integer; Note : string);override;
    procedure DoComplete;override;
    procedure DoSetError(E:Exception);override;
  published
    property ProgressBar : TProgressBar read FProgressBar write FProgressBar;
  end;

  TListViewReportControl = class (TReportControlBase)
  private
    FListView : TListView;
  protected
    procedure DoInit;override;
    procedure DoReset(Count : Integer);override;
    procedure DoNextStep(CurrentStep : Integer; Note : string);override;
    procedure DoComplete;override;
    procedure DoSetError(E:Exception);override;
  published
    property ListView : TListView read FListView write FListView;
  end;

  procedure Register;

implementation

{ TReportUI }

procedure TActionComponentUI.Add(const Item: IReportControl);
begin
  FControlCollection.Add(Item);
end;

procedure TActionComponentUI.AfterExecute(Sender: TObject);
begin
  FControlCollection.Complete;
  if (ShowOnComplete) then
     FActionComponent.Show;
end;

procedure TActionComponentUI.BeforeExecute(Sender: TObject);
begin
  FControlCollection.Reset(FActionComponent.TotalSteps);
end;

procedure TActionComponentUI.BuildReport;
begin
  FActionComponent.ProceedAction;
end;

constructor TActionComponentUI.Create(AOwner: TComponent);
begin
  inherited;
  FControlCollection := TReportControlCollection.Create;
  FQuitOnError := true;
  FShowOnComplete := true;
end;

destructor TActionComponentUI.Destroy;
begin
  FControlCollection.Free;
  inherited;
end;

procedure TActionComponentUI.SetActualReportHandlers;
begin
  FActionComponent.ActionEvents.OnBeforeExecute := BeforeExecute;
  FActionComponent.ActionEvents.OnAfterExecute := AfterExecute;
  FActionComponent.ActionEvents.OnReportProgress := ReportProgress;
  //ѕлохое решение, надо обдумать
  //FActionComponent.ActionEvents.OnExecuteError := ExecuteError;
end;

procedure TActionComponentUI.SetNilReportHandlers;
begin
  FActionComponent.ActionEvents.OnBeforeExecute := nil;
  FActionComponent.ActionEvents.OnAfterExecute := nil;
  FActionComponent.ActionEvents.OnReportProgress := nil;
  FActionComponent.ActionEvents.OnExecuteError := nil;
end;

procedure TActionComponentUI.ExecuteError(Sender: TObject; E: Exception);
begin
  FControlCollection.SetError(E);
  if (QuitOnError) then FActionComponent.Quit;
end;

procedure TActionComponentUI.Remove(const Item: IReportControl);
begin
  FControlCollection.Remove(Item);
end;

procedure TActionComponentUI.ReportProgress(Sender: TObject; CurrentStep: Integer;
  ProgressNote: string);
begin
  FControlCollection.NextStep(CurrentStep, ProgressNote);
end;

procedure TActionComponentUI.SetReport(Value: IActionComponent);
begin
  if Value = FActionComponent then Exit;

  if FActionComponent <> nil then
    SetNilReportHandlers;

  FActionComponent := Value;

  if FActionComponent = nil then Exit;

  SetActualReportHandlers;
end;


{ TProgressBarReportControl }

procedure TProgressBarReportControl.DoComplete;
begin

end;

procedure TProgressBarReportControl.DoInit;
begin
  FProgressBar.Position := 0;
  FProgressBar.Min:=0;
 // FProgressBar.BarColor := clBlack;
end;

procedure TProgressBarReportControl.DoNextStep(CurrentStep: Integer;
  Note: string);
begin
  FProgressBar.Position := CurrentStep;
end;

procedure TProgressBarReportControl.DoReset(Count: Integer);
begin
  FProgressBar.Max := Count;
end;

procedure TProgressBarReportControl.DoSetError(E: Exception);
begin
 // FProgressBar.BarColor := clRed;
end;

{ TReportControlCollection }

procedure TReportControlCollection.Add(const Item: IReportControl);
begin
  Assert(Assigned(Item), 'ѕараметр Item не может быть null.');
  if Contains(Item) then raise Exception.Create('Ёлемент уже присутствует в коллекции.');
  FCollection.Add(Item);
  Item.Init;
end;

procedure TReportControlCollection.Complete;
var
  I : Integer;
begin
  for I:=0 to FCollection.Count -1 do
  begin
    Items[I].Complete;
  end;
end;

function TReportControlCollection.Contains(const Item: IReportControl): Boolean;
begin
  Result := FCollection.IndexOf(Item) <> -1;
end;

constructor TReportControlCollection.Create;
begin
  FCollection := TInterfaceList.Create;
end;

destructor TReportControlCollection.Destroy;
begin
  FCollection.Free;
  inherited;
end;

function TReportControlCollection.GetItem(Index: Integer): IReportControl;
begin
  Result := FCollection.Items[Index] as IReportControl;
end;

procedure TReportControlCollection.Init;
var
  I : Integer;
begin
  for I := 0 to FCollection.Count - 1 do
  begin
    Items[I].Init;
  end;
end;

procedure TReportControlCollection.NextStep(CurrentStep: Integer; Note: string);
var
  I : Integer;
begin
  for I := 0 to FCollection.Count - 1 do
  begin
    Items[I].NextStep(CurrentStep, Note);
  end;
end;

procedure TReportControlCollection.Remove(const Item: IReportControl);
begin
  FCollection.Remove(Item);
end;

procedure TReportControlCollection.Reset(Count: Integer);
var
  I : Integer;
begin
  for I := 0 to FCollection.Count - 1 do
  begin
    Items[I].Reset(Count);
  end;
end;

procedure TReportControlCollection.SetError(E: Exception);
var
  I : Integer;
begin
  for I := 0 to FCollection.Count - 1 do
  begin
    Items[I].SetError(E);
  end;
end;

{ TListViewReportControl }

procedure TListViewReportControl.DoComplete;
begin

end;

procedure TListViewReportControl.DoInit;
begin
  FListView.Clear;
end;

procedure TListViewReportControl.DoNextStep(CurrentStep: Integer; Note: string);
var
  li : TListItem;
begin
  li := FListView.Items.Add;
  li.Caption := TimeToStr(Time);
  li.SubItems.Add(IntToStr(CurrentStep));
  li.SubItems.Add(Note);
end;

procedure TListViewReportControl.DoReset(Count: Integer);
begin

end;

procedure TListViewReportControl.DoSetError(E: Exception);
var
  li : TListItem;
begin
  li := FListView.Items.Add;
  li.Caption := TimeToStr(Time);
  li.SubItems.Add('');
  li.SubItems.Add(E.Message);
  li.Data := E;
end;

procedure Register;
begin
  Classes.RegisterComponents('XReports', [TActionComponentUI, TWindowReportControlCollection, TProgressBarReportControl, TListViewReportControl]);
end;

{ TWindowReportControlCollection }

procedure TWindowReportControlCollection.AddControl(Control: TWinControl);
begin
  Assert(FCollection.IndexOf(Control) = -1, 'Ёлемен уже содержитс€ в коллекции.');
  FCollection.Add(Control);
end;

procedure TWindowReportControlCollection.DoComplete;
var
  I: Integer;
begin
  for I := 0 to FCollection.Count -1 do
  begin
    Items[i].SetTextBuf(PChar(FCompleteText));
  end;
end;

constructor TWindowReportControlCollection.Create(AOwner: TComponent);
begin
  inherited;
  FCollection := TComponentList.Create;
  FCompleteText := '«авершено';
  FInitText := '';
end;

destructor TWindowReportControlCollection.Destroy;
begin
  FCollection.Free;
  inherited;
end;

function TWindowReportControlCollection.GetControl(I: Integer): TWinControl;
begin
  Result := FCollection.Items[I] as TWinControl;
end;

procedure TWindowReportControlCollection.DoInit;
var
  I : Integer;
begin
  for I := 0 to FCollection.Count -1 do
  begin
    Items[i].SetTextBuf(PChar(FInitText));
  end;
end;

procedure TWindowReportControlCollection.DoNextStep(CurrentStep: Integer;
  Note: string);
var
  I : Integer;
  Msg : String;
begin
  if (Assigned(FOnProgressMessage)) then
     FOnProgressMessage(Self, CurrentStep, Note, Msg)
  else
     Msg :=Format('%d из %d', [CurrentStep, FCount]);

  for I := 0 to FCollection.Count -1 do
  begin
    Items[i].SetTextBuf(PChar(Msg));
    Items[i].Update;
  end;
end;

procedure TWindowReportControlCollection.RemoveControl(Control: TWinControl);
begin
  FCollection.Remove(Control)
end;

procedure TWindowReportControlCollection.DoReset(Count: Integer);
begin
  FCount := Count;
end;

procedure TWindowReportControlCollection.DoSetError(E: Exception);
var
  I : Integer;
  Msg : string;
begin
  if Assigned(FOnErrorMessage) then
    FOnErrorMessage(Self, E, Msg)
  else
    Msg := E.Message;

  for I := 0 to FCollection.Count -1 do
  begin
    Items[i].SetTextBuf(PChar(Msg));
  end;
end;

{ TReportControlBase }

procedure TReportControlBase.Complete;
begin
  DoComplete;
  if Assigned(FOnComplete) then FOnComplete(Self);
end;

procedure TReportControlBase.Init;
begin
  DoInit;
  if Assigned(FOnInit) then FOnInit(Self);
end;

procedure TReportControlBase.NextStep(CurrentStep: Integer; Note: string);
begin
  DoNextStep(CurrentStep, Note);
end;

procedure TReportControlBase.Reset(Count: Integer);
begin
  DoReset(Count);
  if Assigned(FOnReset) then FOnReset(Self);
end;

procedure TReportControlBase.SetError(E: Exception);
begin
  DoSetError(E);
  if Assigned(FOnError) then FOnError(Self, E);
end;

end.

