unit RegUtils;
  {#Author fmarakasov@ugtu.net}
interface

uses
   Windows, Controls, Registry, Forms, stdctrls, Graphics, comctrls, checklst;

type

TAppRegistryKey = class
private
  FRegFile  :TRegIniFile;
  FAppRegKey:string;
public
  procedure SaveValue(KeyName,ValName:String; Value:String);overload;virtual;
  procedure SaveValue(KeyName,ValName:String; Value:Integer);overload;virtual;
  procedure SaveValue(KeyName,ValName:String; Value:Boolean);overload;virtual;

  function RestoreStringValue(KeyName,ValName:String;DefValue:String):String;virtual;
  function RestoreIntegerValue(KeyName,ValName:String;DefValue:Integer):Integer;virtual;
  function RestoreBooleanValue(KeyName,ValName:String;DefValue:Boolean):Boolean;virtual;
public
  constructor Create;overload;
  constructor Create(KeyName:string);overload;
  constructor Create(Root:HKEY; KeyName:String);overload;

  destructor Destroy;override;
  property AppRegKey:String read FAppRegKey;
  property RegIniFile:TRegIniFile read FRegFile;
end;

const
 cLeft    = 'Left';
 cTop     = 'Top';
 cHeight  = 'Height';
 cWidth   = 'Width';
 cVisible = 'Visible';
 cEnabled = 'Enabled';
 cChecked = 'Checked';
 cColor   = 'Color';
type

TSaveWindowState = class(TAppRegistryKey)
public
  procedure SaveControlState(ControlName:String; Control:TControl);
  procedure RestoreControlState(ControlName:String; Control:TControl); 
end;

TSaveWindowFont = class (TSaveWindowState)
public
  procedure SaveControlState(ControlName:String; Control:TControl);
  procedure RestoreControlState(ControlName:String; Control:TControl; DefFont:TFont);
end;

const
 cState = 'FormState';
 fsNormal =  'Normal';
 fsMaximized = 'Maximized';
 fsMinimized = 'Minimized';
type

TSaveFormState = class (TSaveWindowState)
protected
  procedure SetWinState(Control:TForm; StateName:String);
  function  GetWinState(Control:TForm):string;
public
  procedure SaveControlState(ControlName:String;  Control:TForm);
  procedure RestoreControlState(ControlName:String; Control:TForm);
end;

procedure SaveFont(AppKey:String; Key:String; Font:TFont);
function  RestoreFont(AppKey, Key:String; DefFont:TFont):TFont;

procedure RegisterNewFile(Ext:String; ShortName:String; FileDesc:String; DefIcon:String);



implementation
constructor TAppRegistryKey.Create;
begin
  inherited;
  FAppRegKey :='A&2ProgrammersGroup';
  FRegFile:=TRegIniFile.Create(FAppRegKey);
end;

constructor TAppRegistryKey.Create(KeyName:string);
begin
  inherited Create;
  FAppRegKey :=KeyName;
  FRegFile:=TRegIniFile.Create(KeyName);
end;

constructor TAppRegistryKey.Create(Root:HKEY; KeyName:String);
begin
  inherited Create;
  FAppRegKey :='A&2ProgrammersGroup';
  FRegFile:=TRegIniFile.Create;
  FRegFile.RootKey:=Root;
  FRegFile.OpenKey(KeyName, true);
end;

destructor TAppRegistryKey.Destroy;
begin
  FRegFile.Free;
  Inherited;
end;

procedure TAppRegistryKey.SaveValue(KeyName,ValName:String; Value:String);
begin
  FRegFile.WriteString(KeyName,ValName,Value);
end;

procedure TAppRegistryKey.SaveValue(KeyName,ValName:String; Value:Integer);
begin
  FRegFile.WriteInteger(KeyName,ValName,Value);
end;

procedure TAppRegistryKey.SaveValue(KeyName,ValName:String; Value:Boolean);
begin
  FRegFile.WriteBool(KeyName,ValName,Value);
end;

function TAppRegistryKey.RestoreStringValue(KeyName,ValName:String;DefValue:String):String;
begin
 Result:=FRegFile.ReadString(KeyName, ValName, DefValue);
end;

function TAppRegistryKey.RestoreIntegerValue(KeyName,ValName:String; DefValue:Integer):Integer;
begin
 Result:=FRegFile.ReadInteger(KeyName, ValName, DefValue);
end;

function TAppRegistryKey.RestoreBooleanValue(KeyName,ValName:String; DefValue:Boolean):Boolean;
begin
 Result:=FRegFile.ReadBool(KeyName, ValName, DefValue);
end;

procedure TSaveWindowState.SaveControlState(ControlName:String; Control:TControl);
begin
 if ControlName = '' then ControlName:=Control.Name;
 SaveValue(ControlName, cLeft, Control.Left);
 SaveValue(ControlName, cTop, Control.Top);
 SaveValue(ControlName, cHeight, Control.Height);
 SaveValue(ControlName, cWidth, Control.Width);
 SaveValue(ControlName, cVisible, Control.Visible);
 SaveValue(ControlName, cEnabled, Control.Enabled);
 if Control is TCheckListBox then SaveValue(ControlName, cColor, (Control as TCheckListBox).Color);
 if Control is TListView then SaveValue(ControlName, cColor, (Control as TListView).Color);

 if (Control is TCheckBox) then
     SaveValue(ControlName, cChecked, (Control as TCheckBox).Checked);
end;

procedure TSaveWindowState.RestoreControlState(ControlName:String; Control:TControl);
begin
 if ControlName = '' then ControlName:=Control.Name;
 Control.Left:=RestoreIntegerValue(ControlName, cLeft,Control.Left);
 Control.Top:=RestoreIntegerValue(ControlName, cTop,Control.Top);
 Control.Height:=RestoreIntegerValue(ControlName, cHeight,Control.Height);
 Control.Width:=RestoreIntegerValue(ControlName, cWidth,Control.Width);
 Control.Visible:=RestoreBooleanValue(ControlName, cVisible,true);
 Control.Enabled:=RestoreBooleanValue(ControlName, cEnabled, true);
 if Control is TCheckListBox then 
   (Control as TCheckListBox).Color:=RestoreIntegerValue(ControlName, cColor, clWindow);

 if Control is TListView then 
   (Control as TListView).Color:=RestoreIntegerValue(ControlName, cColor, clWindow);

 if (Control is TCheckBox) then
     (Control as TCheckBox).Checked:=RestoreBooleanValue(ControlName, cChecked, true);
end;

procedure TSaveFormState.SaveControlState(ControlName:String; Control:TForm);
begin
 if ControlName = '' then ControlName:=Control.Name;
 if Control.WindowState <> wsMaximized then
    inherited SaveControlState(ControlName, TControl(Control));

 SaveValue(ControlName, cState, GetWinState(Control));
end;

procedure TSaveFormState.RestoreControlState(ControlName:String; Control:TForm);
begin
 if ControlName = '' then ControlName:=Control.Name;
 SetWinState(Control, RestoreStringValue(ControlName, cState, fsNormal));
 if Control.WindowState <> wsMaximized then  inherited RestoreControlState(ControlName, TControl(Control));
end;

procedure TSaveFormState.SetWinState(Control:TForm; StateName:String);
begin
 if StateName = fsNormal then Control.WindowState:=wsNormal;
 if StateName = fsMaximized then Control.WindowState:=wsMaximized;
 if StateName = fsMinimized then Control.WindowState:=wsMinimized;
end;

function  TSaveFormState.GetWinState(Control:TForm):string;
begin
  if Control.WindowState = wsNormal then Result:= fsNormal;
  if Control.WindowState = wsMinimized then Result:= fsMinimized;
  if Control.WindowState = wsMaximized then Result:= fsMaximized;
end;


procedure TSaveWindowFont.SaveControlState(ControlName:String; Control:TControl);
procedure SaveFont(Control:String; Font:TFont);
var
 fstyle:Integer;
begin
  with Font do
  begin
    fStyle:=0;
    if  Style = [fsBold] then fStyle:=1;
    if  Style = [fsItalic] then fStyle:=2;
    if  Style = [fsUnderline] then fStyle:=3;
    if  Style = [fsStrikeout] then fStyle:=4;
    if  Style = [fsItalic, fsBold] then fStyle:=5;
    if  Style = [fsBold, fsItalic, fsStrikeout] then fStyle:=6;
    //if  Style = [fsBold, fsUnderline] then fStyle:=6;
    //if  Style = [fsBold, fsStrikeout] then fStyle:=7;
  end;
  SaveValue(Control, 'FontStyle', fStyle);
  SaveValue(Control, 'FontName', Font.Name);
  SaveValue(Control, 'FontSize', Font.Size);
  SaveValue(Control, 'FontHeight', Font.Height);
  SaveValue(Control, 'CharSet', Font.CharSet);
end;
begin
  if ControlName = '' then ControlName:=Control.Name;
  inherited SaveControlState(ControlName, Control);
  if Control is TComboBox then SaveFont(ControlName, (Control as TComboBox).Font);
  if Control is TEdit then SaveFont(ControlName, (Control as TEdit).Font);
  if Control is TTreeView then SaveFont(ControlName, (Control as TTreeView).Font);
  if Control is TListView then SaveFont(ControlName, (Control as TListView).Font);
  if Control is TCheckListBox then SaveFont(ControlName, (Control as TCheckListBox).Font);
end;

procedure TSaveWindowFont.RestoreControlState(ControlName:String; Control:TControl; DefFont:TFont);
procedure  RestoreFont(Control:String; out FFont:TFont);
var
 Font:Integer;
begin
 Font:=RestoreIntegerValue(Control, 'FontStyle', 0);
 FFont:=TFont.Create;
 FFont.Style:=[];
 case Font of
  1: FFont.Style:=[fsBold];
  2: FFont.Style:=[fsItalic];
  3: FFont.Style:=[fsUnderline];
  4: FFont.Style:=[fsStrikeout];
  5: FFont.Style:=[fsItalic, fsBold];
  6: FFont.Style:=[fsBold, fsItalic, fsStrikeout];
 end;
 FFont.Name:=RestoreStringValue(Control, 'FontName', DefFont.Name);
 FFont.Size:=RestoreIntegerValue(Control, 'FontSize',  DefFont.Size);
 FFont.Charset:=RestoreIntegerValue(Control, 'CharSet', DefFont.CharSet);
// FFont.Height:=RestoreIntegerValue(Control, 'FontHeight', Application.MainForm.Font.Height);
end;
var
 FFont:TFont;
begin
 if ControlName = '' then ControlName:=Control.Name;
 inherited RestoreControlState(ControlName, Control);
 RestoreFont(ControlName, FFont);
 if Control is TComboBox then (Control as TComboBox).Font := FFont;
 if Control is TEdit then     (Control as TEdit).Font :=     FFont;
 if Control is TTreeView then (Control as TTreeView).Font := FFont;
 if Control is TListView then (Control as TListView).Font := FFont;
 if Control is TCheckListBox then (Control as TCheckListBox).Font := FFont;
 
end;

procedure RegisterNewFile(Ext:String; ShortName:String; FileDesc:String; DefIcon:String);
begin
  with TRegistry.Create do
  begin
    RootKey:=HKEY_CLASSES_ROOT;
    OpenKey(Ext, true);
    WriteString('', ShortName);
    CloseKey;
    OpenKey(ShortName, true);
    WriteString('', FileDesc);
    OpenKey('DefaultIcon', true);
    WriteString('', DefIcon);
    CloseKey;
    CloseKey;
    Free;
  end;
end;

const
  FName = 'Name';
  FCharset = 'Charset';
  FSize = 'Size';
  FHeight = 'Height';
  FBold = 'Bold';
  FStrike = 'Strike';
  FItalic = 'Italic';
  FUnderline = 'Underline';
  FColor = 'Color';

procedure SaveFont(AppKey:String; Key:String; Font:TFont);
begin
  with TAppRegistryKey.Create(AppKey) do
  begin
    SaveValue(Key, FName, Font.Name);
    SaveValue(Key, FCharset, Font.Charset);
    SaveValue(Key, FSize, Font.Size);
    SaveValue(Key, FHeight, Font.Height);
    SaveValue(Key, FColor, Font.Color);
    SaveValue(Key, FBold,  fsBold in Font.Style);
    SaveValue(Key, FStrike,  fsStrikeout in Font.Style);
    SaveValue(Key, FItalic,  fsItalic in Font.Style);
    SaveValue(Key, FUnderline,  fsUnderline in Font.Style);
    Free;
  end;
end;

function  RestoreFont(AppKey, Key:String; DefFont:TFont):TFont;
begin
  Result:=TFont.Create;
  with TAppRegistryKey.Create(AppKey) do
  begin
    Result.Name:=RestoreStringValue(Key, FName, DefFont.Name);
    Result.Size:=RestoreIntegerValue(Key, FSize, DefFont.Size);
    Result.Height:=RestoreIntegerValue(Key, FHeight, DefFont.Height);
    Result.Color:=RestoreIntegerValue(Key, FColor, DefFont.Color);
    Result.CharSet:=RestoreIntegerValue(Key, FCharset, DefFont.Charset);
    if RestoreBooleanValue(Key, FBold, fsBold in DefFont.Style) then
      Result.Style:= Result.Style+[fsBold];
    if RestoreBooleanValue(Key, FItalic, fsItalic in DefFont.Style) then
      Result.Style:= Result.Style+[fsItalic];
    if RestoreBooleanValue(Key, FStrike, fsStrikeout in DefFont.Style) then
      Result.Style:= Result.Style+[fsStrikeout];
    if RestoreBooleanValue(Key, FUnderline, fsUnderline in DefFont.Style) then
      Result.Style:= Result.Style+[fsUnderline];
  end;
end;
end.
