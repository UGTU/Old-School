unit DBUtils;
  {#Author fmarakasov@ugtu.net}
interface
uses
  Db, classes, DBGrids, SysUtils;
  procedure RefreshDataSet(const DataSet:TDataSet);
  function GetGridFieldList(const Grid:TDBGrid; const Index:Integer):TStrings;

  implementation

  procedure RefreshDataSet(const DataSet:TDataSet);
  begin
    if Assigned(DataSet) then
    begin
      if DataSet.Active then
      try
        DataSet.Refresh;
      except
        on E:Exception do
        begin
          DataSet.Close;
          DataSet.Open;
        end;
      end
      else DataSet.Open;
    end;
  end;

  function GetGridFieldList(const Grid:TDBGrid; const Index:Integer):TStrings;
  var
    i:Integer;
  begin
    Result:=TStringList.Create;
    with Grid.DataSource.DataSet do
    begin
      try
        DisableControls;
        for i:=0 to Grid.SelectedRows.Count -1 do
        begin
          GotoBookmark(pointer(Grid.SelectedRows.Items[i]));
          Result.Add(Grid.DataSource.DataSet.Fields[Index].Value);
        end;
      finally
        EnableControls;
      end;
    end;
  end;
end.

