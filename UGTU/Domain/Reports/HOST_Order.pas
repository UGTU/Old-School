 {*
    ����� - ����� ������ � Excel
    ������:
    �������: 20.04.2010
    ��������� ������:
    �����: �������� �.�.
*}

unit HOST_Order;
 {#Author llodigina@ist.ugtu.net}
interface
uses
  Classes, SysUtils, ExcelXP, Barcode, Contnrs, ReportsBase, DB, ADODB,
    DBTVObj, DBTVStudObj, DBTVGroupObj, ComCtrls, StdCtrls, ApplicationController,
    Variants, uDMAbiturientOtchety, GeneralController,uDM, uHOST, DateUtils;

type
   THOST_OrderReport = class(TExcelReportBase)
  private
    FIDZayavlenie: integer;
  protected
    procedure Execute;override;
    function GetTotalSteps: Integer; override;
  public
    property IDZayavlenie:integer read FIDZayavlenie write FIDZayavlenie;



  end;

implementation


procedure THOST_OrderReport.Execute;
var str: string;
begin
  inherited;
  NextStep(1,'�������� ������');

  dmHOST.ProcVivodOrdera.ProcedureName:= 'HOST_VivodOrderaPoCode;1';
  dmHOST.ProcVivodOrdera.Close;
  with dmHOST.ProcVivodOrdera.Parameters do
  begin
    Clear;
    CreateParameter('@IDZayav', ftInteger, pdInput, 4, FIDZayavlenie);

  end;
  dmHOST.ProcVivodOrdera.Open;
  NextStep(4,'�������� ������');

  {NextStep(GetTotalSteps div 2,'������ �������� ������ � MS Excel');
          Range['A'+IntToStr(FirstRowNumber),'E'+inttostr(RowNumber-1)].Borders.Weight:=2;
          PageName:= SpecPageName; }
  dmHOST.ProcVivodOrdera.First;
  with  dmHOST.ProcVivodOrdera do
  begin
       case MonthOf(Date) of
      1: str:= '������';
      2: str:= '�������';
      3: str:= '�����';
      4: str:= '������';
      5: str:= '���';
      6: str:= '����';
      7: str:= '����';
      8: str:= '�������';
      9: str:= '��������';
      10: str:= '�������';
      11: str:= '������';
      12: str:= '�������';
     end;

        ActivateWorksheet(1);
        Replace('#���#', FieldByName('fio').AsString);
        Replace('#�����#', FieldByName('CStreet').AsString);
        Replace('#���#', FieldByName('BuildingNumber').AsString);
        Replace('#���#', IntToStr(DayOf(Date)));
        Replace('#�����#',str);
        Replace('#���#',  IntToStr(YearOf(Date)));

  end;
  NextStep(5,'�������� ������');

  Show;
end;

function THOST_OrderReport.GetTotalSteps: Integer;
begin
  result:=10;
end;

end.
