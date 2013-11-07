{*
    Отчет - вывод списка студентов в Excel
    Версия: 1.0.0.1
    Создано: 29.12.2008
    Последняя правка: 29.12.2008 15:00
    Автор: Вокуева Т.А.
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
  // Вывод заголовка
  for i := 1 to FieldsList.Count do
    Items[3, i] := FieldsList.Items[i-1];
  // вывод данных
  GroupObject.AdoDataSet.First;
  GroupObject.AddChildNodes;
  Items[1,1]:='Состав группы '+GroupObject.Name;
  range['A1','B1'].Font.Size:=12;
  j := 3;
  TreeNode := GroupObject.Node.getFirstChild;
  while TreeNode<>nil do
  begin
    Inc(j);
    // читаем данные о студенте
    Student := TreeNode.Data;
    Student.LoadData;
    // выводим в Эксель
    Count := 0;
    for i := 0 to FieldsList.Count-1 do
    begin
      inc(Count);
      if FieldsList.Items[i]='№ зачётки' then
        Items[j, Count] := Student.RecordbookNum;
      if FieldsList.Items[i]='ФИО'  then
        Items[j, Count] := Student.Name;
      if FieldsList.Items[i]='Фамилия'  then
        Items[j, Count] := Student.LastName;
      if FieldsList.Items[i]='Имя' then
        Items[j, Count] := Student.FirstName;
      if FieldsList.Items[i]='Отчество' then
        Items[j, Count] := Student.MiddleName;
      if FieldsList.Items[i]='Категория зачисления' then
        Items[j, Count] := Student.Category;
      if FieldsList.Items[i]='Группа' then
        Items[j, Count] := GroupObject.Name;
      if FieldsList.Items[i]='Пол'  then
      begin
        if Student.Sex then
          Items[j, Count] := 'МУЖ'
        else
          Items[j, Count] := 'ЖЕН';
      end;
      if FieldsList.Items[i]='Адрес проживания' then
      begin
        AddrStr := Student.FactAdress.Point+' '+
          Student.FactAdress.Street+' '+Student.FactAdress.House
          +'-'+(Student.FactAdress.Flat);
        if Length(AddrStr)<5 then AddrStr := '';
        Items[j, Count] := AddrStr;
      end;
      if FieldsList.Items[i]='Адрес прописки' then
      begin
        AddrStr := Student.SignAdress.Point+' '+
          Student.SignAdress.Street+' '+Student.SignAdress.House+
          '-'+(Student.SignAdress.Flat);
        if Length(AddrStr)<5 then AddrStr := '';
        Items[j, Count] := AddrStr;
      end;
      if FieldsList.Items[i]='Телефон' then
        Items[j, Count] := Student.Phone;
      if FieldsList.Items[i]='Сотовый телефон' then
        Items[j, Count] := Student.CellPhone;
      if FieldsList.Items[i]='Гражданство' then
        Items[j, Count] := Student.Citizenship;
      if FieldsList.Items[i]='Дата рождения' then
        Items[j, Count] := Student.BirthDate;
      if FieldsList.Items[i]='Место рождения' then
        Items[j, Count] := Student.BirthPlace;
      if FieldsList.Items[i]='Что окончил' then
        Items[j, Count] := Student.Finished;
      if FieldsList.Items[i]='Год окончания' then
        Items[j, Count] := Student.YearFinished;
      if FieldsList.Items[i]='Медаль' then
        Items[j, Count] := Student.Medal;
      if FieldsList.Items[i]='Довузовская подготовка' then
        Items[j, Count] := Student.Preparation;
      if FieldsList.Items[i]='Наличие детей' then
        if Student.Children then
          Items[j, Count] := 'Есть'
        else
          Items[j, Count] := 'Нет';
      if FieldsList.Items[i]='Инвалидность' then
        if Student.Invalid then
          Items[j, Count] := 'Да'
        else
          Items[j, Count] := 'Нет';
      if FieldsList.Items[i]='Потребность в общежитии' then
        if Student.AppartmentNeed then
          Items[j, Count] := 'Да'
        else
          Items[j, Count] := 'Нет';
      if FieldsList.Items[i]='Специальный учёт' then
        Items[j, Count] := Student.SpecCount;
      if FieldsList.Items[i]='Общественная работа' then
        Items[j, Count] := Student.SocJob;
      if FieldsList.Items[i]='E-Mail' then
        Items[j, Count] := Student.EMail;
      if FieldsList.Items[i]='Военное звание' then
        Items[j, Count] := Student.MilitaryState;
    end;
    // переходим к следующему студенту
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
  // показываем Эксель
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
