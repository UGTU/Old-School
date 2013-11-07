unit HOST_ZayavNaZas;
 {*
    ����� - ����� ��������� �� ��������� � Excel
    ������:
    �������: 12.05.2010
    ��������� ������:
    �����: �������� �.�.
*}

interface
 {#Author llodigina@ist.ugtu.net}
uses
  Classes, SysUtils, ExcelXP, Barcode, Contnrs, ReportsBase, DB, ADODB,
    DBTVObj, DBTVStudObj, DBTVGroupObj, ComCtrls, StdCtrls, ApplicationController,
    Variants, uDMAbiturientOtchety, GeneralController,uDM, uHOST, DateUtils;

type
   THOST_ZayavNaZas = class(TExcelReportBase)
  private
    FnCode: integer;
  protected
    procedure Execute;override;
    function GetTotalSteps: Integer; override;
  public
    property nCode:integer read FnCode write FnCode;



  end;

implementation


procedure THOST_ZayavNaZas.Execute;
var str: string;
begin
  inherited;
  NextStep(1,'�������� ������');

  dmHOST.ProcVivodZayavPoCode.ProcedureName:= 'HOST_VivodZayavPoCode;1';
  dmHOST.ProcVivodZayavPoCode.Close;
  with dmHOST.ProcVivodZayavPoCode.Parameters do
  begin
    Clear;
    CreateParameter('@IDZayav', ftInteger, pdInput, 4, FnCode);

  end;
  dmHOST.ProcVivodZayavPoCode.Open;
  NextStep(4,'�������� ��������� �� ���������');

  {NextStep(GetTotalSteps div 2,'������ �������� ������ � MS Excel');
          Range['A'+IntToStr(FirstRowNumber),'E'+inttostr(RowNumber-1)].Borders.Weight:=2;
          PageName:= SpecPageName; }
  dmHOST.ProcVivodZayavPoCode.First;
  with  dmHOST.ProcVivodZayavPoCode do
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
        Replace('#�#', FieldByName('NumHostel').AsString);
        Replace('#������#', FieldByName('Cname_grup').AsString);
        Replace('#����#', FieldByName('DataPodachi').AsString);
        Replace('#���#',  IntToStr(YearOf(Date)));
        Replace('#���#',  IntToStr(YearOf(Date)+1));

  end;
  NextStep(5,'�������� ��������� �� ���������');

  Show;
end;

function THOST_ZayavNaZas.GetTotalSteps: Integer;
begin
  result:=10;
end;

end.
