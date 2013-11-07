unit D_AVGBalls;
   {#Author sergdev@ist.ugtu.net}
interface
uses
Classes, dialogs ,SysUtils, ExcelXP, Barcode, Contnrs, XIntf, CommonIntf, ReportsBase, db, adodb, ExtCtrls, udmUspevaemost, ComCtrls, uAverageBalls;

const TableBeg = 2;

type
    TAVGBallsReport = class(TExcelReportBase)
    private
       FDataset:TADODataset;
       FListView:TListView;
    protected
       procedure Execute;override;
       function GetTotalSteps:Integer;override;
    public
       constructor Create (AOwner : TComponent; lvBalls: TListView);

    end;

implementation

{ TAVGBallsReport }

constructor TAVGBallsReport.Create(AOwner: TComponent; lvBalls: TListView);
begin
inherited Create(AOwner);
FListView:=lvBalls;
end;

procedure TAVGBallsReport.Execute;
var i,j,k:integer;
gi:TLVGroupItem;
item:TLVItem;
begin
    k:=0;
    for i := 0 to FListView.Items.Count-1 do
    begin
      if (TObject(FListView.Items[i].Data)) is TLVGroupItem then
      begin
        gi:=TLVGroupItem(FListView.Items[i].Data);
        Range['A'+inttostr(TableBeg+k),'G'+inttostr(TableBeg+k)].NumberFormat := '@';
        Range['A'+inttostr(TableBeg+k),'G'+inttostr(TableBeg+k)].Font.Bold := true;
        Range['A'+inttostr(TableBeg+k),'G'+intToStr(TableBeg+k)].Borders.Weight:=2;
        Items[TableBeg+k,1] := gi.Caption;
        if gi.Balls>0 then
        Items[TableBeg+k,4] := FloatTostr(gi.Balls);
        if gi.BallsOPD>0 then
        Items[TableBeg+k,5] := FloatTostr(gi.BallsOPD);
        if gi.BallsEN>0 then
        Items[TableBeg+k,6] := FloatTostr(gi.BallsEN);
        if gi.BallsSD>0 then
        Items[TableBeg+k,7] := FloatTostr(gi.BallsSD);
        inc(k);
        for j := 0 to gi.Items.Count-1 do
        begin
          item:=gi.Items[j];
          Range['A'+inttostr(TableBeg+k),'G'+inttostr(TableBeg+k)].NumberFormat := '@';
          Range['A'+inttostr(TableBeg+k),'G'+intToStr(TableBeg+k)].Borders.Weight:=2;
          Items[TableBeg+k,1] := j+1;
          Items[TableBeg+k,2] := item.Name;
          Items[TableBeg+k,3] := item.Zach;
          Items[TableBeg+k,4] := item.Ball;
          Items[TableBeg+k,5] := item.BallOPD;
          Items[TableBeg+k,6] := item.BallEN;
          Items[TableBeg+k,7] := item.BallSD;
          inc(k);
        end;
        NextStep(1, 'Progress '+ IntToStr(i+1));
      end;
    end;

end;

function TAVGBallsReport.GetTotalSteps: Integer;
var i:integer;
begin
 result:=0;
  for i := 0 to FListView.Items.Count-1 do
    begin
      if (TObject(FListView.Items[i].Data)) is TLVGroupItem then
      inc(result);
    end;
end;

end.
