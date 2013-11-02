unit CommonTestController;

interface

uses TestFrameWork;

type
  TDataAccessTest = class(TTestCase)
  published
    procedure CreateADODataSet;
    procedure UseBatchOptimistic;
  end;

  TTechnicalLayerTest = class(TTestCase)
  published

  end;

implementation

uses SheduleTestController, NagruzkaTestController, GeneralController, ADODB;


procedure TDataAccessTest.CreateADODataSet;
var
  tempDS: TADODataSet;
begin
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  Check(tempDS <> nil, '������ TADODataSet �� ��� ������!');
  tempDS.Free;
end;

procedure TDataAccessTest.UseBatchOptimistic;
var
  tempDS: TADODataSet;
begin
  tempDS:= TGeneralController.Instance.GetNewADODataSet(true);

  tempDS.Free;
end;

function SubsystemsInteractionTest: ITestSuite;
begin
  Result:= TTestSuite.Create('������������ �������������� ����������� ������ ���������');
  Result.AddSuite(TLoadEducationPlanInfoTest.Suite);
  Result.AddSuite(TFactNagrSourcesTest.Suite);
  Result.AddSuite(TLoadPlanNagrInScheduleTest.Suite);
end;

function BuildTest: ITestSuite;
begin
  Result:= TTestSuite.Create('������������ ���������������� ��������������');
  Result.AddSuite(TNagruzkaCrossComponentTest.Suite);
  Result.AddSuite(TScheduleCrossComponentTest.Suite);
  Result.AddSuite(SubsystemsInteractionTest);
end;


function DomainTests: ITestSuite;
begin
  Result:= TTestSuite.create('������������ ������ ������-������');
  Result.AddSuite(NagruzkaComponentDefectTest);
  Result.AddSuite(ScheduleComponentDefectTest);
  Result.AddSuite(BuildTest);
end;


initialization
  TestFramework.RegisterTest(DomainTests);
  TestFramework.RegisterTest('������������ ���� ����������� �����', TTechnicalLayerTest.Suite);
  TestFramework.RegisterTest('������������ ������ ������� � ������', TDataAccessTest.Suite);

end.
