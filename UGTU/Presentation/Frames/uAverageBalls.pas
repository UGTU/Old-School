unit uAverageBalls;
  {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseFrame, StdCtrls, Buttons, ExtCtrls, udmUspevaemost, ComCtrls,
  ToolWin, GridsEh, DBGridEh, ActnList, adodb, ImgList, Mask, DBCtrlsEh, math, DBTVgroupobj;

type

TLVItem = class
private
  fName: string;
  fZach: string;
  fBall: string;
  fBallOPD:string;
  fBallEN:string;
  fBallSD:string;
    procedure SetBallEN(const Value: string);
    procedure SetBallOPD(const Value: string);
    procedure SetBallSD(const Value: string);
public
  constructor Create(name, zach,ball : string) ;
  property Name: string read fName;
  property Zach : string read fZach;
  property Ball : string read fBall;
  property BallOPD : string read fBallOPD write SetBallOPD;
  property BallEN : string read fBallEN write SetBallEN;
  property BallSD : string read fBallSD write SetBallSD;
end;

TLVGroupItem = class
private
  fItems : TList;
  fCaption: string;
  fListItem: TListItem;
  fExpanded: boolean;
  fBalls:real;
  fBallsOPD:real;
  fBallsEN:real;
  fBallsSD:real;
  function GetItems: TList;
public
  constructor Create(caption : string) ;

  procedure Expand;
  procedure Collapse;
  procedure AddItemFromDataset(ads:TAdoDataset);
  procedure CountAvg;

  property Expanded : boolean read fExpanded;
  property Caption : string read fCaption;
  property Items : TList read GetItems;
  property ListItem : TListItem read fListItem write fListItem;
  property Balls : real read fBalls write fBalls;
  property BallsOPD : real read fBallsOPD write fBallsOPD;
  property BallsEN : real read fBallsEN write fBallsEN;
  property BallsSD : real read fBallsSD write fBallsSD;
end;


  TfmAverageBalls = class(TfmBase)
    tbAcadem: TToolBar;
    tbPrint: TToolButton;
    ActionList1: TActionList;
    actReportToExcel: TAction;
    lvBalls: TListView;
    ilBalls: TImageList;
    Label1: TLabel;
    pnlFilters: TPanel;
    dbcbeSemAtt: TDBComboBoxEh;
    Label2: TLabel;
    dbcbeDiscType: TDBComboBoxEh;
    procedure FillListView;
    procedure lvBallsClick(Sender: TObject);
    procedure lvBallsColumnClick(Sender: TObject; Column: TListColumn);
    procedure lvBallsCustomDrawItem(Sender: TCustomListView; Item: TListItem;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure dbcbeSemAttChange(Sender: TObject);
    procedure dbcbeDiscTypeChange(Sender: TObject);
    procedure actReportToExcelExecute(Sender: TObject);
  private
  CurrentSort: string;
  SortParam:string;

    procedure LoadData(CklName:string);
    { Private declarations }
    procedure AddGroupItem(gi : TLVGroupItem) ;
  public
  ShowStudents:TShowStud; // фильтр студентов
  ShowActualGroup: boolean; // фильтр групп
  StudyYears:integer;
  FrameType: integer; //1 - "университет", 2 - "факультет", 3 - "специальность", 4 - "группа"
  ObjectId: integer;
    { Public declarations }
  end;

var
  fmAverageBalls: TfmAverageBalls;

implementation

uses D_AVGBalls;

{$R *.dfm}


procedure TfmAverageBalls.dbcbeSemAttChange(Sender: TObject);
begin
FillListView;
end;

procedure TfmAverageBalls.dbcbeDiscTypeChange(Sender: TObject);
begin
FillListView;
end;


procedure TfmAverageBalls.FillListView;
var
  i, j: integer;
  lItem:TListItem;
  Group:string;
  gi:TLVGroupItem;
  giTempList:Tlist;
begin

LoadData('Все дисциплины');

with dmUspevaemost.adsAvgBalls do begin
DisableControls;
try
First;
lvBalls.Clear;
Group:='';
gi:=nil;

giTempList:=TList.Create;

for i := 0 to RecordCount - 1 do
begin
  if Group<> dmUspevaemost.adsAvgBalls.FieldByName('CName_grup').value
  then
  begin
  Group:= dmUspevaemost.adsAvgBalls.FieldByName('CName_grup').value;
  if gi<>nil then gi.CountAvg;

  gi:=TLVGroupItem.Create(Group);
  if SortParam='AVGBall Desc' then
  giTempList.Add(gi) else
  AddGroupItem(gi);
  end;
  gi.AddItemFromDataset(dmUspevaemost.adsAvgBalls);
  Next;
end;
if gi<>nil then
  gi.CountAvg;

  if SortParam='AVGBall Desc' then
  while giTempList.Count>0 do
  begin
  gi:= giTempList[0];
  for I := 0 to giTempList.Count - 1 do
  if gi.Balls<TLVGroupItem(giTempList[i]).balls then
  gi:=giTempList[i];
  AddGroupItem(gi);
  gi.CountAvg;
  giTempList.Remove(gi);
  end;

  i:=0;

  LoadData('ОПД');

  while i<lvBalls.Items.Count do
  begin
    if (TObject(lvBalls.Items[i].Data) is TLVGroupItem) then
    with TLVGroupItem(lvBalls.Items[i].Data) do
    begin
    for j:= 0 to fItems.Count - 1 do
    begin
     if dmUspevaemost.adsAvgBalls.Locate('NN_Zach',TLVItem(fItems[j]).fZach,[]) then
     TLVItem(fItems[j]).BallOPD:=dmUspevaemost.adsAvgBalls.FieldByName('AVGBall').Value;
    end;
    end;
    inc(i);
  end;

    i:=0;

  LoadData('ЕН');

  while i<lvBalls.Items.Count do
  begin
    if (TObject(lvBalls.Items[i].Data) is TLVGroupItem) then
    with TLVGroupItem(lvBalls.Items[i].Data) do
    begin
    for j:= 0 to fItems.Count - 1 do
    begin
     if dmUspevaemost.adsAvgBalls.Locate('NN_Zach',TLVItem(fItems[j]).fZach,[]) then
     TLVItem(fItems[j]).BallEN:=dmUspevaemost.adsAvgBalls.FieldByName('AVGBall').Value;
    end;
    end;
    inc(i);
  end;

      i:=0;

  LoadData('СД');

  while i<lvBalls.Items.Count do
  begin
    if (TObject(lvBalls.Items[i].Data) is TLVGroupItem) then
    with TLVGroupItem(lvBalls.Items[i].Data) do
    begin
    for j:= 0 to fItems.Count - 1 do
    begin
     if dmUspevaemost.adsAvgBalls.Locate('NN_Zach',TLVItem(fItems[j]).fZach,[]) then
     TLVItem(fItems[j]).BallSD:=dmUspevaemost.adsAvgBalls.FieldByName('AVGBall').Value;
    end;
    end;
    inc(i);
  end;

    i:=0;

  while i<lvBalls.Items.Count do
  begin
    if (TObject(lvBalls.Items[i].Data) is TLVGroupItem) then
    begin
    TLVGroupItem(lvBalls.Items[i].Data).CountAvg;
    TLVGroupItem(lvBalls.Items[i].Data).Expand;
    end;
    inc(i);
  end;

finally
  EnableControls;
end;
end;

end;


procedure TfmAverageBalls.LoadData(CklName:string);
var View:string;
year, month, day: word;
per_year: integer;
begin
with dmUspevaemost.adsAvgBalls do
begin
    dmUspevaemost.adsAvgBalls.Active := false;

  if (dbcbeSemAtt.text='Все семестры')and(CklName = 'Все дисциплины') then
  View:='AverageBall' else
  if (dbcbeSemAtt.text<>'Все семестры')and(CklName = 'Все дисциплины') then
  View:='AverageBall_sem' else
  if (dbcbeSemAtt.text='Все семестры')and(CklName <> 'Все дисциплины') then
  View:='AverageBall_ckl' else
  View:='AverageBall_ckl_sem';

  case frametype of

  1:
    CommandText:='select * from '+View+' Where ik_fac is not null';

  2:
    CommandText:='select * from '+View+' where ik_fac = '+inttostr(ObjectID);

  3:
    CommandText:='select * from '+View+' where ik_spec_fac = '+inttostr(ObjectID);

  4:
    CommandText:='select * from '+View+' where ik_grup = '+inttostr(ObjectID);

  end;

   if dbcbeSemAtt.text<>'Все семестры' then
   CommandText:=CommandText+' and n_sem='+dbcbeSemAtt.Text;

      if CklName <> 'Все дисциплины' then
   CommandText:=CommandText+' and Ccode_ckl_disc='''+CklName+'''';

   // фильтрация студентов

   if ShowStudents=ssShowExiledOnly then
    CommandText:=CommandText+' and ikTypePricOtch=''2'' ' else
  if ShowStudents=ssShowActualOnly then
    CommandText:=CommandText+' and Ik_prikazOtch IS NULL' else
  if ShowStudents=ssShowAcademOnly then
    CommandText:=CommandText+' and ikTypePricZach=''3''';

    decodedate(Now,year,month,day);
    per_year:=0;
    if month<9 then per_year:=1;

if ShowActualGroup then
CommandText:=CommandText+' and ('''+inttostr(CurrentYear)+'''-NYear_post)<'''+inttostr(StudyYears+per_year)+''' and dateExit >getdate()';

   // фильтрация группа

   if SortParam='' then SortParam:='Namestud';

   CommandText:=CommandText+' ORDER BY Cname_grup,'+SortParam;

  dmUspevaemost.adsAvgBalls.Active := true;
end;
end;

procedure TfmAverageBalls.lvBallsClick(Sender: TObject);
var
  hts : THitTests;
  gi : TLVGroupItem;
begin
  if (lvBalls.Selected <> nil) then
  begin
    if TObject(lvBalls.Selected.Data) is (TLVGroupItem) then
    begin
      gi := TLVGroupItem(lvBalls.Selected.Data) ;
      if NOT gi.Expanded then
        gi.Expand
      else
        gi.Collapse;
    end;
  end;
end;

procedure TfmAverageBalls.lvBallsColumnClick(Sender: TObject;
  Column: TListColumn);
begin
 lvBalls.SortType :=stNone;
  if Column.Caption = 'ФИО студента' then
  SortParam := 'NameStud';
    if Column.Caption = 'Номер зачетной книжки' then
  SortParam := 'NN_Zach ';
    if Column.Caption = 'Средний балл' then
  SortParam := 'AVGBall Desc';
  FillListView;


end;

procedure TfmAverageBalls.lvBallsCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if (TObject(item.Data) is TLVGroupItem) then
   begin
      lvBalls.Canvas.Brush.Color:=clSkyBlue;
      lvBalls.Canvas.Font.Style:=[fsBold];
      lvBalls.Canvas.TextOut(Left+3,Top,item.Caption);
      //lvBalls.Canvas.FillRect(item.DisplayRect(drBounds));
   end;

end;

procedure TfmAverageBalls.actReportToExcelExecute(Sender: TObject);
var Report:TAVGBallsReport;
begin
  Report := TAVGBallsReport.Create(nil, lvBalls);
  Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\AVGBalls.xlt';
  {Report := TBRSReport.CreateFull(nil, dmUspevaemost.adodsSelAttBRSGroup, fac, group, disc, examiner, num, date, nSem);
  //Report.FreeOnComplete := true;
  Report.ReportTemplate := ExtractFilePath(Application.ExeName)+'reports\VedomostBRS.xlt';}
  // Начать построение отчёта
  Report.BuildReport;
  Report.Show;
  Report.Free;
end;

procedure TfmAverageBalls.AddGroupItem(gi : TLVGroupItem) ;
  var
    li : TListItem;
  begin
    li := lvBalls.Items.Add;
    li.Caption := gi.Caption;
    li.ImageIndex := 0; //collapsed
    li.Data := gi;
    gi.ListItem := li; //link "back"
  end;

{ TLVGroupItem }

procedure TLVGroupItem.AddItemFromDataset(ads: TAdoDataset);
begin
Items.Add(TLVItem.Create(ads.FieldByName('NameStud').Value,ads.FieldByName('NN_Zach').Value,ads.FieldByName('AVGBall').Value));
end;

procedure TLVGroupItem.Collapse;
var cnt:integer;
 item : TLVItem;
begin
if not Expanded then Exit;

  ListItem.ImageIndex := 0;
  fExpanded := false;

  for cnt := Items.Count-1 downto 0 do
  begin
   TListView(ListItem.ListView).Items.Delete(1 + cnt +
          ListItem.Index);
  end;
end;

procedure TLVGroupItem.CountAvg;
var i, count, countOPD, countEN, countSD:integer;
summ, summOPD, summEN, summSD:real;
begin

summ:=0;
count:=fItems.Count;
summOPD:=0;
countOPD:=fItems.Count;
summEN:=0;
countEN:=fItems.Count;
summSD:=0;
countSD:=fItems.Count;

for i:=0 to fItems.Count-1 do
begin
if TLVItem(fItems[i]).fBall<>'' then
summ:=summ+StrToFloat(TLVItem(fItems[i]).fBall)
else dec(count);
if TLVItem(fItems[i]).fBallOPD<>'' then
summOPD:=summOPD+StrToFloat(TLVItem(fItems[i]).fBallOPD)
else dec(countOPD);
if TLVItem(fItems[i]).fBallEN<>'' then
summEN:=summEN+StrToFloat(TLVItem(fItems[i]).fBallEN)
else dec(countEN);
if TLVItem(fItems[i]).fBallSD<>'' then
summSD:=summSD+StrToFloat(TLVItem(fItems[i]).fBallSD)
else dec(countSD);
end;

if count>0 then
Summ:=(Summ/count);
if countOPD>0 then
SummOPD:=(SummOPD/countOPD);
if countEN>0 then
SummEN:=(SummEN/countEN);
if countSD>0 then
SummSD:=(SummSD/countSD);

Balls:=RoundTo(Summ, -2);
BallsOPD:=RoundTo(SummOPD, -2);
BallsEN:=RoundTo(SummEN, -2);
BallsSD:=RoundTo(SummSD, -2);


if fListItem<>nil then
begin
fListItem.SubItems.Clear;
fListItem.SubItems.Add('');

if Balls>0 then
fListItem.SubItems.Add(FloatToStr(Balls))
else fListItem.SubItems.Add('');

if BallsOPD>0 then
fListItem.SubItems.Add(FloatToStr(BallsOPD))
else fListItem.SubItems.Add('');

if BallsEN>0 then
fListItem.SubItems.Add(FloatToStr(BallsEN))
else fListItem.SubItems.Add('');

if BallsSD>0 then
fListItem.SubItems.Add(FloatToStr(BallsSD))
else fListItem.SubItems.Add('');

end;
end;

constructor TLVGroupItem.Create(caption: string);
begin
 fCaption := caption;
 fItems:=TList.Create;
end;

procedure TLVGroupItem.Expand;
var
  cnt : integer;
  item : TLVItem;
begin
  if Expanded then Exit;

  ListItem.ImageIndex := 1;
  fExpanded := true;

  for cnt := 0 to Items.Count-1 do
  begin
    item := TLVItem(Items[cnt]) ;
    with TListView(ListItem.ListView).Items.Insert(1 + cnt +
          ListItem.Index) do
    begin
      Caption := item.Name;
      SubItems.Add(item.Zach) ;
      SubItems.Add(item.Ball) ;
      SubItems.Add(item.BallOPD) ;
      SubItems.Add(item.BallEN) ;
      SubItems.Add(item.BallSD) ;
      Data := item;
      ImageIndex := -1;
    end;
  end;
end;


function TLVGroupItem.GetItems: TList;
begin
 result:=fItems;
end;

{ TLVItem }

constructor TLVItem.Create(name, zach, ball: string);
begin
fName := name;
fZach := zach;
fball := Format('%f',[(StrToFloat(ball))]);
end;

procedure TLVItem.SetBallEN(const Value: string);
begin
  fBallEN := Format('%f',[(StrToFloat(Value))]);
end;

procedure TLVItem.SetBallOPD(const Value: string);
begin
  fBallOPD := Format('%f',[(StrToFloat(Value))]);
end;

procedure TLVItem.SetBallSD(const Value: string);
begin
  fBallSD := Format('%f',[(StrToFloat(Value))]);
end;

end.
