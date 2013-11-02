unit uVisualDBObjectsForQM;
  {#Author sergdev@ist.ugtu.net}
interface
uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, GR32_Image, GR32,
  GR32_Layers, GR32_Polygons;

type
  TVBlock = class(TBitmapLayer)
  protected
  FBorderColor: TColor32;
  FInnerColor:Tcolor32;
  FActiveColor:Tcolor32;
  FName: string;
  FLengthInChars:integer;
  FCheckButtonSide:integer;
  FCharWidth:integer;
  FTextSpace:integer;
  FDrag:boolean;
  FDragLeft:extended;
  FDragRight:extended;
  FDragTop:extended;
  FDragBottom:extended;
  FContext: TImage32;
  FActive: boolean;
   FRelief:boolean;
    procedure Paint(Buffer: TBitmap32); override;
    constructor Create(ALayerCollection: TLayerCollection;context:Timage32;name:string);

  public
  property Active: boolean read FActive;

  procedure SetLocation(rect:TFloatRect);
     procedure Activate;
     procedure Deactivate;
  end;
  type

  TVDBItem = class(TVBlock)
  protected
  FChecked:boolean;
  FButtonColor:TColor32;
    procedure Paint(Buffer: TBitmap32); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    function IsInCheckbox(x:integer; y:integer): boolean;
  public
  constructor Create(ALayerCollection: TLayerCollection;context:Timage32;name:string);
  property Checked: boolean read FChecked write FChecked;

  end;

  type
  TVDBEntity = class(TVBlock)
  protected
   FItems: TList;
   FItemSpace:integer;
   FItemHeight:integer;
   FEmpty:boolean;
    procedure Paint(Buffer: TBitmap32); override;
      procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
  public
    constructor Create(ALayerCollection: TLayerCollection;context:Timage32;name:string);
    procedure AddItem(item: TVDBItem);

  end;

  type
  TVDBRelation = class(TBitmapLayer)
  protected
  FLeft:TVBlock;
  FRight:TVBlock;
  FColor:TColor32;
  FColorBack:TColor32;
  FWidth:integer;
    procedure Paint(Buffer: TBitmap32); override;
  public
    constructor Create(ALayerCollection: TLayerCollection;context:Timage32;VBlock1:TVBlock;VBlock2:TVBlock);
  end;

implementation
{ TBlock }


procedure TVBlock.Activate;
begin
FActive:=true;
end;

constructor TVBlock.Create(ALayerCollection: TLayerCollection;
  Context: Timage32; Name: string);
begin

inherited Create(ALayerCollection);
FName:=name;
FContext:=context;
FBorderColor:=clBlack32;
FRelief:=false;
end;


procedure TVBlock.Deactivate;
begin
FActive:=false;
end;

procedure TVBlock.Paint(Buffer: TBitmap32);
var r: TRect;
begin
  inherited;

 R := MakeRect(GetAdjustedLocation);

 if FRelief then begin
Buffer.Line(R.Left,R.Top,R.Left,R.Bottom, FInnerColor);
Buffer.Line(R.Left,R.Top,R.Right,R.Top, FInnerColor);

Buffer.Line(R.Left,R.Bottom,R.Right,R.Bottom, FBorderColor);
Buffer.Line(R.Right,R.Top,R.Right,R.Bottom, FBorderColor);
if Factive then begin
Buffer.Line(R.Left,R.Top,R.Left,R.Bottom, FBorderColor);
Buffer.Line(R.Left,R.Top,R.Right,R.Top, FBorderColor);

Buffer.Line(R.Left,R.Bottom,R.Right,R.Bottom, FInnerColor);
Buffer.Line(R.Right,R.Top,R.Right,R.Bottom, FInnerColor);
end;

 end
    else begin

 Buffer.FrameRectS(R.Left, R.Top, R.Right, R.Bottom, FBorderColor);
 if FActive then
 Buffer.FrameRectS(R.Left-1, R.Top-1, R.Right+1, R.Bottom+1, FActiveColor);
 
 Buffer.FillRectS(R.Left + 1, R.Top + 1, R.Right - 1, R.Bottom - 1, FInnerColor);
    end;

end;

procedure TVBlock.SetLocation(rect: TFloatRect);
begin
DoSetLocation(Rect);
end;

{ TVItem }


constructor TVDBItem.Create(ALayerCollection: TLayerCollection;context:Timage32;name: string);
begin
inherited Create(ALayerCollection,context,name);
FLengthInChars:=length(name);
FTextSpace:=3;
FCheckButtonSide:=11;
FButtonColor:=clBlack32;
FInnerColor:=clWhite32;
FActiveColor:=clGreen32;
end;

function TVDBItem.IsInCheckbox(x, y: integer): boolean;
var r:TRect;
begin
 R := MakeRect(GetAdjustedLocation);

if (x>(R.Right-3-FCheckButtonSide))and
 (x<(R.Right-3))and
 (y>(R.Top+3))and
 (y<(R.Top+3+FCheckButtonSide)) then
 result:=true else result:=false;

end;

procedure TVDBItem.MouseDown(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
if IsInCheckbox(x,y) then
if FChecked then
FChecked:=false
else FChecked:=true;
FContext.Repaint;
end;

procedure TVDBItem.Paint(Buffer: TBitmap32);
var r: TRect;
begin
inherited;

 R := MakeRect(GetAdjustedLocation);
Buffer.Textout(R.Left + FTextSpace, R.Top + 2, fname);
Buffer.FrameRectS(R.Right-3-FCheckButtonSide,R.Top+3,R.Right-3,R.Top+3+FCheckButtonSide, FButtonColor);
if FChecked then begin   // лучше картинку
Buffer.LineS(R.Right-1-FCheckButtonSide,R.Top+5,R.Right-5-(FCheckButtonSide div 2),R.Top+FCheckButtonSide+2,FButtonColor);
Buffer.LineS(R.Right-5,R.Top+5,R.Right-5-(FCheckButtonSide div 2),R.Top+FCheckButtonSide+2,FButtonColor);
end;
end;


{ TVDBEntity }

procedure TVDBEntity.AddItem(item:TVDBItem);
 var R:Trect;
FR:TFloatRect;
begin
if FItems=nil then exit;
FItems.Add(item);
FEmpty:=false;
if length(item.FName)>FlengthInChars then
FlengthInChars:=length(item.FName);
R := MakeRect(GetAdjustedLocation);
FR.Left:=R.Left;
Fr.Top:=R.top;
FR.Right:=R.Left+FCharWidth*FLengthInChars+FCheckButtonSide+FTextSpace;
FR.Bottom:=R.top+FItems.Count*FItemHeight+FItemHeight+(FItems.Count+1)*FItemspace;

DoSetLocation(FR);

end;

function FindBottomEntity(LayerCollection: TLayerCollection):TVDBEntity;
var i:integer;
first:boolean;
begin
 first:=true;
 result:=nil;
 if LayerCollection.Count=1 then exit;

 for I := 0 to (LayerCollection.Count - 1) do
   if (LayerCollection.Items[i]) is TVDBEntity then
   if first then
   begin
     result:=TVDBEntity(LayerCollection.Items[i]);
     first:=false;
   end
   else
   if result.GetAdjustedLocation.Bottom<TVDBEntity(LayerCollection.Items[i]).GetAdjustedLocation.Bottom then
   result:=TVDBEntity(LayerCollection.Items[i]);
end;


constructor TVDBEntity.Create(ALayerCollection: TLayerCollection;context:Timage32;name: string);
var bEnt:TVDBEntity;
r:TFloatRect;
begin
inherited Create(ALayerCollection,context,name);
FItems:=TList.create;
FItemSpace:=2;
FItemHeight:=17;
FCharWidth:=7;
FCheckButtonSide:=11;
FTextSpace:=3;
FBorderColor:=clBlack32;
FInnerColor:=clWhite32;
FActiveColor:=clGreen32;
FEmpty:=true;
FlengthInChars:=Length(name);
bEnt:=FindBottomEntity(ALayerCollection);
if bEnt<>nil then
begin
r.Left:=(bEnt.GetAdjustedLocation.Left+bEnt.GetAdjustedLocation.Right)/2;
r.Top:= bEnt.GetAdjustedLocation.Bottom+15;
r.Right:=r.Left+10;
R.Bottom:=r.Top+10;
SetLocation(r);
if   Context.Width<(r.Right) then   Context.Width:=round(r.Right+100);
if   Context.Height<(r.Bottom) then   Context.Height:=round(r.Bottom+150);
end;
end;

procedure TVDBEntity.Paint(Buffer: TBitmap32);
var R:Trect;
FR:TFloatRect;
i:integer;
begin
R := MakeRect(GetAdjustedLocation);


if FEmpty then  begin

 FR.Left:=R.Left;
 FR.Top:=R.Top;
 FR.Right:=FR.Left+10;
 FR.Bottom:= FR.Top+10;
 SetLocation(FR);
 Buffer.Textout(R.Left - (FCharWidth*FLengthInChars div 2), R.Top - FItemHeight, fname);
end;
inherited;

if not FEmpty then
begin

FR.Left:=R.Left+3;
FR.Right:=R.Right-3;


Buffer.Textout(R.Left + FTextSpace, R.Top + 3, fname);
for i := 0 to (FItems.Count - 1) do
begin

FR.Top:=R.Top+(i+1)*(FItemHeight+FItemSpace);
FR.Bottom:=R.Top+(i+2)*(FItemHeight)+(i+1)*FItemSpace;

TVDBItem(FItems[i]).DoSetLocation(FR);
TVDBItem(FItems[i]).Paint(Buffer);
end;
end;
end;

procedure TVDBEntity.MouseDown(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
  var R: TFloatRect;
begin
  inherited;
  R:=GetAdjustedLocation;
FDrag:=true;
FDragLeft:=X-R.Left;
FDragTop:=Y-R.Top;
FDragRight:=R.Right-X;
FDragBottom:=R.Bottom-Y;
Mouse.Capture:=TImage32(FContext).Handle;
end;

procedure TVDBEntity.MouseMove(Shift: TShiftState; X, Y: Integer);
var R,FR: TFloatRect;
begin
  inherited;
        if FDrag then FContext.repaint;
 if FDrag then begin
R:=GetAdjustedLocation;
 if ((X-FDragLeft<0)or (Y-FdragTop<0)or(x+FDragRight>FContext.Width)or(y+FDragBottom>FContext.Height)) then  exit;

FR.Left:=X-FDragLeft;
Fr.Top:=Y-FDragTop;
FR.Right:=(X-FDragLeft)+R.Right-R.Left;
FR.Bottom:=(Y-FDragTop)+R.Bottom-R.Top;
DoSetLocation(FR);
FContext.Repaint;
 end;
end;

procedure TVDBEntity.MouseUp(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
  FDrag:=false;
end;





{ TVDBRelation }

constructor TVDBRelation.Create(ALayerCollection: TLayerCollection;
  context: Timage32; VBlock1, VBlock2: TVBlock);
  var FR:Tfloatrect;
  begin
inherited Create(ALayerCollection);
FLeft:=VBlock1;
FRight:=VBlock2;
FR.Left:=0;
FR.Top:=0;
FR.Right:=0;
FR.Bottom:=0;
FColor:=clWhite32;
FColorBack:=clGray32;
FWidth:=1;
DoSetLocation(FR);
end;

procedure TVDBRelation.Paint(Buffer: TBitmap32);
var FR1,FR2:TRect;
begin
  inherited;
FR1:=MakeRect(FLeft.GetAdjustedLocation);
FR2:=MakeRect(FRight.GetAdjustedLocation);

if (FR1.Right<=FR2.Left) then
begin
if (Fr1.Top>=Fr2.Bottom) then begin
Buffer.LineS(Fr1.Right,FR1.Top-FWidth,FR2.Left,FR2.Bottom-FWidth, FColor);
Buffer.LineS(Fr1.Right,FR1.Top+FWidth,FR2.Left,FR2.Bottom+FWidth, FColorBack);
end;
if (Fr1.Top<Fr2.Bottom)and(Fr1.Bottom>Fr2.Top) then  begin
Buffer.LineS(Fr1.Right,((FR1.Top+Fr1.Bottom) div 2)-FWidth,FR2.Left,((FR2.Top+Fr2.Bottom) div 2)-FWidth, FColor);
Buffer.LineS(Fr1.Right,((FR1.Top+Fr1.Bottom) div 2)+FWidth,FR2.Left,((FR2.Top+Fr2.Bottom) div 2)+FWidth, FColorBack);
end;

if (Fr1.Bottom<=Fr2.Top) then begin
Buffer.LineS(Fr1.Right,FR1.Bottom-FWidth,FR2.Left,FR2.Top-FWidth, FColor);
Buffer.LineS(Fr1.Right,FR1.Bottom+FWidth,FR2.Left,FR2.Top+FWidth, FColorBack);
end;
end else
if (FR1.Bottom<=FR2.Top) then
begin
if  (FR1.Left<FR2.Right) then begin
Buffer.LineS(((Fr1.Left+Fr1.Right) div 2)-FWidth,FR1.Bottom,((FR2.Left+FR2.Right) div 2)-FWidth,FR2.Top, FColor);
Buffer.LineS(((Fr1.Left+Fr1.Right) div 2)+FWidth,FR1.Bottom,((FR2.Left+FR2.Right) div 2)+FWidth,FR2.Top, FColorBack);
end;
if  (FR1.Left>=FR2.Right) then begin
Buffer.LineS(Fr1.Left,FR1.Bottom-FWidth,FR2.Right,FR2.Top-FWidth, FColor);
Buffer.LineS(Fr1.Left,FR1.Bottom+FWidth,FR2.Right,FR2.Top+FWidth, FColorBack);
end;
end else
if (FR1.Left>FR2.Right) then begin
if  (FR1.Top<FR2.Bottom) then begin
Buffer.LineS(Fr1.Left,((FR1.Top+Fr1.Bottom) div 2)-FWidth,FR2.Right,((FR2.Top+Fr2.Bottom) div 2)-FWidth, FColor);
Buffer.LineS(Fr1.Left,((FR1.Top+Fr1.Bottom) div 2)+FWidth,FR2.Right,((FR2.Top+Fr2.Bottom) div 2)+FWidth, FColorBack);
end;

if (Fr1.Top>Fr2.Bottom) then begin
Buffer.LineS(Fr1.Left,FR1.Top-FWidth,FR2.Right,FR2.Bottom-FWidth, FColor);
Buffer.LineS(Fr1.Left,FR1.Top+FWidth,FR2.Right,FR2.Bottom+FWidth, FColorBack);
end;
end
else
if (FR1.Top>Fr2.Bottom) then begin
Buffer.LineS(((Fr1.Left+Fr1.Right) div 2)+FWidth,FR1.Top,((FR2.Left+FR2.Right) div 2)+FWidth,FR2.Bottom, FColor);
Buffer.LineS(((Fr1.Left+Fr1.Right) div 2)-FWidth,FR1.Top,((FR2.Left+FR2.Right) div 2)-FWidth,FR2.Bottom, FColorBack);
end;

end;

end.
