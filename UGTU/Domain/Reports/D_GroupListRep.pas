{*
    ����� - ����� ������ ��������� � Excel
    ������: 1.0.0.1
    �������: 29.12.2008
    ��������� ������: 29.12.2008 15:00
    �����: ������� �.�.
*}
unit D_GroupListRep;
{#Author tanyav@ist.ugtu.net}
interface
uses
  Classes, SysUtils, ExcelXP, Barcode, Contnrs, ReportsBase, DB, ADODB,
    DBTVObj, DBTVStudObj, DBTVGroupObj, ComCtrls, StdCtrls, ApplicationController;

type
   TGroupListExcelReport = class(TExcelReportBase)
  private
    FFieldsList: TListBox;
    FGroupObject: TDBNodeGroupObject;

  protected
    procedure Execute;override;
  public
    property GroupObject:TDBNodeGroupObject read FGroupObject write FGroupObject;
    property FieldsList:TListBox read FFieldsList write FFieldsList;
  end;

implementation


procedure TGroupListExcelReport.Execute;
var
  Count: Integer;
  Student: TDBNodeStudObject;
  TreeNode: TTreeNode;
  i, j: Integer;
  AddrStr: String;
begin
  inherited;
  range['A1','AB3'].Font.Bold:=true;
  range['A1','A120'].NumberFormat := '@';
  Count := 0;
  // ����� ���������
  for i := 1 to FieldsList.Count do
    Items[3, i] := FieldsList.Items[i-1];
  // ����� ������
  GroupObject.AdoDataSet.First;
  GroupObject.AddChildNodes;
  Items[1,1]:='������ ������ '+GroupObject.Name;
  range['A1','B1'].Font.Size:=12;
  j := 3;
  TreeNode := GroupObject.Node.getFirstChild;
  while TreeNode<>nil do
  begin
    Inc(j);
    // ������ ������ � ��������
    Student := TreeNode.Data;
    Student.LoadData;
    // ������� � ������
    Count := 0;
    for i := 0 to FieldsList.Count-1 do
    begin
      inc(Count);
      if FieldsList.Items[i]='� �������' then
        Items[j, Count] := Student.RecordbookNum;
      if FieldsList.Items[i]='���'  then
        Items[j, Count] := Student.Name;
      if FieldsList.Items[i]='�������'  then
        Items[j, Count] := Student.LastName;
      if FieldsList.Items[i]='���' then
        Items[j, Count] := Student.FirstName;
      if FieldsList.Items[i]='��������' then
        Items[j, Count] := Student.MiddleName;
      if FieldsList.Items[i]='��������� ����������' then
        Items[j, Count] := Student.Category;
      if FieldsList.Items[i]='������' then
        Items[j, Count] := GroupObject.Name;
      if FieldsList.Items[i]='���'  then
      begin
        if Student.Sex then
          Items[j, Count] := '���'
        else
          Items[j, Count] := '���';
      end;
      if FieldsList.Items[i]='����� ����������' then
      begin
        AddrStr := Student.FactAdress.Point+' '+
          Student.FactAdress.Street+' '+Student.FactAdress.House
          +'-'+(Student.FactAdress.Flat);
        if Length(AddrStr)<5 then AddrStr := '';
        Items[j, Count] := AddrStr;
      end;
      if FieldsList.Items[i]='����� ��������' then
      begin
        AddrStr := Student.SignAdress.Point+' '+
          Student.SignAdress.Street+' '+Student.SignAdress.House+
          '-'+(Student.SignAdress.Flat);
        if Length(AddrStr)<5 then AddrStr := '';
        Items[j, Count] := AddrStr;
      end;
      if FieldsList.Items[i]='�������' then
        Items[j, Count] := Student.Phone;
      if FieldsList.Items[i]='������� �������' then
        Items[j, Count] := Student.CellPhone;
      if FieldsList.Items[i]='�����������' then
        Items[j, Count] := Student.Citizenship;
      if FieldsList.Items[i]='���� ��������' then
        Items[j, Count] := Student.BirthDate;
      if FieldsList.Items[i]='����� ��������' then
        Items[j, Count] := Student.BirthPlace;
      if FieldsList.Items[i]='��� �������' then
        Items[j, Count] := Student.Finished;
      if FieldsList.Items[i]='��� ���������' then
        Items[j, Count] := Student.YearFinished;
      if FieldsList.Items[i]='������' then
        Items[j, Count] := Student.Medal;
      if FieldsList.Items[i]='����������� ����������' then
        Items[j, Count] := Student.Preparation;
      if FieldsList.Items[i]='������� �����' then
        if Student.Children then
          Items[j, Count] := '����'
        else
          Items[j, Count] := '���';
      if FieldsList.Items[i]='������������' then
        if Student.Invalid then
          Items[j, Count] := '��'
        else
          Items[j, Count] := '���';
      if FieldsList.Items[i]='����������� � ���������' then
        if Student.AppartmentNeed then
          Items[j, Count] := '��'
        else
          Items[j, Count] := '���';
      if FieldsList.Items[i]='����������� ����' then
        Items[j, Count] := Student.SpecCount;
      if FieldsList.Items[i]='������������ ������' then
        Items[j, Count] := Student.SocJob;
      if FieldsList.Items[i]='E-Mail' then
        Items[j, Count] := Student.EMail;
      if FieldsList.Items[i]='������� ������' then
        Items[j, Count] := Student.MilitaryState;
    end;
    // ��������� � ���������� ��������
    TreeNode := GroupObject.Node.GetNextChild(TreeNode);
  end;
  if Count = 0 then Count := 1;
  if Count>26 then
  begin
    AddrStr := 'AA';
    AddrStr[1] := Chr(Ord('A')+(Count div 26)-1);
    AddrStr[2] := Chr(Ord('A')+Count mod 26-1);
    Range['A'+intToStr(3),AddrStr+intToStr(j)].Borders.Weight:=2;
    Range['A'+intToStr(3),AddrStr+intToStr(j)].HorizontalAlignment:=-4108;
  end else
  begin
    Range['A'+intToStr(3),Chr(Ord('A')+Count-1)+intToStr(j)].Borders.Weight:=2;
    Range['A'+intToStr(3),Chr(Ord('A')+Count-1)+intToStr(j)].HorizontalAlignment:=-4108;
  end;
  // ���������� ������
  //ActiveSheet.PageSetup.LeftFooter:='&5' + TApplicationController.GetInstance.DocumentFooter;


  {ActiveBarcodeApplet.AppletName := 'PDF417Ctrl1';
  ActiveBarcodeApplet.BarcodeHeader := TBarcodeReportHeader.Create;
  ActiveBarcodeApplet.BarcodeHeader.MajorVersion := 1;
  ActiveBarcodeApplet.BarcodeHeader.MinorVersion := 0;
  ActiveBarcodeApplet.BarcodeHeader.ObjectType := 1;
  ActiveBarcodeApplet.BarcodeHeader.OID := Fik_ved;
  ActiveBarcodeApplet.WriteToApplet; }
  Show;
end;

end.
