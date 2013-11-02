unit PrnUtils;
  {#Author fmarakasov@ugtu.net}
interface

uses
   dbgrids, Printers, db;

procedure PrintDBGrid(Grid:TDBGrid);

implementation

procedure PrintDBGrid(Grid:TDBGrid);
var
  i:Integer;
  Prn:TextFile;
  bm:TBookmark;
  X,DX:Integer;
begin
  bm:=Grid.DataSource.DataSet.GetBookmark;
  try
    AssignPrn(Prn);
    Rewrite(Prn);

    Grid.DataSource.DataSet.DisableControls;
    Grid.DataSource.DataSet.First;

    DX:=(80 - 80 div Grid.Columns.Count) div Grid.Columns.Count;
    X:=0;

    for i:=0 to Grid.Columns.Count - 1 do
    begin
      Write(Prn, Grid.Columns[i].Title.Caption:X);
      inc(X, DX);
    end;
    WriteLn(Prn);
    while (not (Grid.DataSource.DataSet.Eof)) do
    begin
      X:=0;
      for i:=0 to Grid.Columns.Count - 1 do
      begin
        Write(Prn, Grid.Fields[i].AsString:X);
        inc(X, DX);
      end;
      WriteLn(Prn);
      Grid.DataSource.DataSet.Next;
    end;
    WriteLn(Prn);
  finally
    Grid.DataSource.DataSet.GotoBookmark(bm);
    Grid.DataSource.DataSet.EnableControls;
    CloseFile(Prn);
  end;
end;

end.
