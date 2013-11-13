unit D_AcademReport;
{#Author sergdev@ist.ugtu.net}
interface

uses
  Classes, dialogs ,SysUtils, ExcelXP, Barcode, Contnrs, XIntf, CommonIntf, ReportsBase, db, adodb;

const TableBeg = 5;

type
    TAcademReport = class(TExcelReportBase)
    private
       FDataset:TADODataset;
       FFaculty:string;
       FGroup:string;
       FDate:string;

    protected
       procedure Execute;override;
       function GetTotalSteps:Integer;override;
    public
       constructor Create (AOwner : TComponent; ds : TAdoDataset);
       constructor CreateFull (AOwner : TComponent; ds : TAdoDataset; fac,dt:string);

    end;

    implementation

  constructor TAcademReport.Create (AOwner : TComponent; ds : TAdoDataset);
  begin
  inherited Create(AOwner);
  FDataset := ds;
  FDate := dateToStr(Date);
  FFaculty := '';
  end;

  constructor TAcademReport.CreateFull (AOwner : TComponent; ds : TAdoDataset; fac,dt:string);
  begin
  inherited Create(AOwner);
  FDataset := ds;
  FFaculty := fac;
  FDate := dt;
  end;

  procedure TAcademReport.Execute;
  var
    i : Integer;
  begin
    inherited;
     if FDataset = nil then
     exit;

     if not FDataset.Active then
     begin
     showmessage('����� �� �����������!');
     exit;
     end;

    FDataset.First;

    if FFaculty<>'' then begin
    Items[3,4] := FFaculty;
    Items[2,6] := FDate;
    for i := 0 to FDataset.RecordCount-1 do
    begin
      Range['A'+inttostr(TableBeg+i+1),'L'+inttostr(TableBeg+i+1)].NumberFormat := '@';
      Items[TableBeg+1+i,1] := i+1;
      Items[TableBeg+1+i,2] := FDataset.FieldByName('StudName').Value;
      Items[TableBeg+1+i,3] := FDataset.FieldByName('nn_zach').Value;
      Items[TableBeg+1+i,4] := FDataset.FieldByName('����� ������').Value;
      Items[TableBeg+1+i,5] := FDataset.FieldByName('������� ������').Value;
      Items[TableBeg+1+i,6] := FDataset.FieldByName('� ������� ������').Value;
      Items[TableBeg+1+i,7] := FDataset.FieldByName('��. ��. � ������').Text;
      Items[TableBeg+1+i,8] := FDataset.FieldByName('����. ������').Text;
      Items[TableBeg+1+i,9] := FDataset.FieldByName('���� ������').Text;
      Items[TableBeg+1+i,10] := FDataset.FieldByName('���� ���������').Text;
      Items[TableBeg+1+i,11] := FDataset.FieldByName('���� ������ �� �����').Text;
      if FDataset.FieldByName('IsFreeAttendance').Value then
      Items[TableBeg+1+i,12] := '��' else Items[TableBeg+1+i,12] := '���';

      //Range['A'+inttostr(TableBeg+i+1),'J'+inttostr(TableBeg+i+1)].Font.Size:=10;
      Range['A'+inttostr(TableBeg+i+1),'L'+inttostr(TableBeg+i+1)].HorizontalAlignment:= xlCenter ;

      NextStep(1, '�������� ��������: '+ IntToStr(i+1));
      FDataset.Next;
    end;
    Range['A'+inttostr(TableBeg),'L'+intToStr(TableBeg+FDataset.RecordCount)].Borders.Weight:=2;
    end;

    if FFaculty='' then
    begin
    Items[2,6] := FDate;
    for i := 0 to FDataset.RecordCount-1 do
    begin
      Range['A'+inttostr(TableBeg+i),'L'+inttostr(TableBeg+i)].NumberFormat := '@';
      Items[TableBeg+i,1] := i+1;
      Items[TableBeg+i,2] := FDataset.FieldByName('StudName').Value;
      Items[TableBeg+i,3] := FDataset.FieldByName('nn_zach').Value;
      Items[TableBeg+i,4] := FDataset.FieldByName('����� ���������').Value;
      Items[TableBeg+i,5] := FDataset.FieldByName('����� ������').Value;
      Items[TableBeg+i,6] := FDataset.FieldByName('������� ������').Value;
      Items[TableBeg+i,7] := FDataset.FieldByName('� ������� ������').Value;
      Items[TableBeg+i,8] := FDataset.FieldByName('��. ��. � ������').Text;
      Items[TableBeg+i,9] := FDataset.FieldByName('����. ������').value;
      Items[TableBeg+i,10] := FDataset.FieldByName('���� ������').Text;
      Items[TableBeg+i,11] := FDataset.FieldByName('���� ���������').Text;
      Items[TableBeg+i,12] := FDataset.FieldByName('���� ������ �� �����').Text;
            if FDataset.FieldByName('IsFreeAttendance').Value then
      Items[TableBeg+i,13] := '��' else Items[TableBeg+i,13] := '���';


      Range['A'+inttostr(TableBeg+i),'M'+inttostr(TableBeg+i)].Font.Size:=10;
      Range['A'+inttostr(TableBeg+i),'M'+inttostr(TableBeg+i)].HorizontalAlignment:= xlCenter ;
      NextStep(1, '�������� ��������: '+ IntToStr(i+1));
      FDataset.Next;
    end;
    Range['A'+inttostr(TableBeg-1),'M'+intToStr(TableBeg+FDataset.RecordCount-1)].Borders.Weight:=2;
    end;
  end;

  //��������� ����� ����� ����� � �������� �������
  //�������� ����� ����� ������ ����� ����� ����� ����������
  //�������, ������������ �������� ��� ������
  //Example: Result := MyDataSet.Recordscount;
  function TAcademReport.GetTotalSteps: Integer;
  begin
    Result := FDataset.RecordCount;
  end;

end.
