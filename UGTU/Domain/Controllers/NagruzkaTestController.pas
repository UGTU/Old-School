unit NagruzkaTestController;

interface

uses TestFramework;

type
  TNagruzkaControllersTest = class(TTestCase)
  published
    procedure TestDirectoryController;
    procedure TestCommonController;
    procedure TestPreparationController;
    procedure TestPlanNagruzkaController;
    procedure TestFactNagruzkaController;
  end;

  TNormOfTimeComponentTest = class(TTestCase)
  published
    procedure TestAddNormOfTime;
    procedure TestAddNormOfTimeFromExists;
    procedure TestEditNormOfTime;
    procedure TestDelNormOfTime;
    procedure TestFillNormOfTimeForDisciplines;
    procedure TestFillNormOfTimeForPractice;
  end;

  TContingentComponentTest = class(TTestCase)
  published
    procedure TestSpecialityAvailable;
    procedure TestGroupsAvailable;
    procedure TestFillSpecialityContingent;
    procedure TestFillSeparatedGroupsContingent;
  end;

  TTeacherManagementComponentTest = class(TTestCase)
  published
    procedure TestAddTeacher;
    procedure TestEditTeacher;
    procedure TestDelTeacher;
    procedure TestReleaseTeacher;
  end;

  TPotokManagementComponentTest = class(TTestCase)
  published
    procedure TestAddPotokWithSpecOnly;
    procedure TestAddPotokWithGroupOnly;
    procedure TestAddPotokWithSpecAndGroups;
    procedure TestEditPotok;
    procedure TestDelPotok;
    procedure TestAddPotokScheme;
    procedure TestEditPotokScheme;
    procedure TestDelPotokScheme;
  end;

  TPlanningComponentTest = class(TTestCase)
  published
    procedure TestAddPlanOfNagr;
    procedure TestEditPlanOfNagr;
    procedure TestDelPlanOfNagr;
    procedure TestAddDisciplineInPlanOfNagr;
    procedure TestWorkOfNagrCalculationAlgorithm;
    procedure TestEditDisciplineInPlanOfNagr;
    procedure TestDelDisciplineInPlanOfNagr;
    procedure TestNagrCalculationInThePlanOfNagr;
  end;

  TDistributionComponentTest = class(TTestCase)
  published
    procedure CheckUndistributedNagrCalculation;
  end;

  TFactNagrAccountingComponentTest = class(TTestCase)
  published
    procedure TestLoadVidZanyatListFromDistributedNagr;
  end;

  TNagruzkaCrossComponentTest = class(TTestCase)
  published
    procedure TestLoadPotokContingentForPlanNagr;
  end;

  TLoadEducationPlanInfoTest = class(TTestCase)
  published
    procedure TestLoadEducationalPlanInfo;
  end;

  TFactNagrSourcesTest = class(TTestCase)
  published
    procedure TestLoadEventsFromSchedule;
    procedure TestLoadVedomostFromDecanat;
  end;

  function NagruzkaComponentDefectTest: ITestSuite;

implementation

uses ADODB, DB, GeneralController, NagruzkaController, uDM, Variants, SysUtils;

function NagruzkaComponentDefectTest: ITestSuite;
begin
  Result:= TTestSuite.Create('������������ �������� ����������� ���������� "������� ��������"');
  Result.AddSuite(TNormOfTimeComponentTest.Suite);
  Result.AddSuite(TContingentComponentTest.Suite);
  Result.AddSuite(TTeacherManagementComponentTest.Suite);
  Result.AddSuite(TPotokManagementComponentTest.Suite);
  Result.AddSuite(TPlanningComponentTest.Suite);
  Result.AddSuite(TDistributionComponentTest.Suite);
  Result.AddSuite(TFactNagrAccountingComponentTest.Suite);
end;

{ TNagruzkaControllersTest }

procedure TNagruzkaControllersTest.TestCommonController;
begin

end;

procedure TNagruzkaControllersTest.TestDirectoryController;
begin

end;

procedure TNagruzkaControllersTest.TestFactNagruzkaController;
begin

end;

procedure TNagruzkaControllersTest.TestPlanNagruzkaController;
begin

end;

procedure TNagruzkaControllersTest.TestPreparationController;
begin

end;

{ TPlanningComponentTest }

procedure TPlanningComponentTest.TestAddDisciplineInPlanOfNagr;
begin

end;

procedure TPlanningComponentTest.TestAddPlanOfNagr;
begin

end;

procedure TPlanningComponentTest.TestDelDisciplineInPlanOfNagr;
begin

end;

procedure TPlanningComponentTest.TestDelPlanOfNagr;
begin

end;

procedure TPlanningComponentTest.TestEditDisciplineInPlanOfNagr;
begin

end;

procedure TPlanningComponentTest.TestEditPlanOfNagr;
begin

end;

procedure TPlanningComponentTest.TestNagrCalculationInThePlanOfNagr;
begin

end;

procedure TPlanningComponentTest.TestWorkOfNagrCalculationAlgorithm;
var
  tempDS: TADODataSet;
  planOfNagrIK, potokIK, discIK, discTypeIK: integer;
  discHour, distrHour: double;
begin
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  try
    // �������� ID ����� ������� �������� ������� "������" ��� ����� ����� ��������, ���������� ���� �������� �� ������� ������� 2008-2009 ����
    // ���� ����������� �� �������� ����, ������ � ������� ���������� �� �����, ������� ����� ����������� ����������� �������� ���������� ��������

    tempDS.CommandText:= 'SELECT ik_plan_nagr FROM Plan_nagr WHERE (ik_kaf = (SELECT ik_kaf FROM kafedra WHERE cshort_name_kaf = ''������'')) ' +
      'and (ik_year = (SELECT ik_year_uch_pl FROM Year_uch_pl WHERE year_value = 2008)) and (ik_sem_type = 1) and (ik_type_ed = (SELECT ik_type_ed FROM Type_ed WHERE cName_type_ed = ''������'')) ' +
      'and (ik_form_ed = (SELECT ik_form_ed FROM Form_ed WHERE cName_form_ed = ''�����''))';
    tempDS.Open;
    Check(tempDS.RecordCount > 0, '���� �������� ��� ������� "������" �� ������');
    planOfNagrIK:= tempDS.FieldByName('ik_plan_nagr').AsInteger;
    tempDS.Close;

    // �������� ID ������ "���, ���, ���, �� - 07"

    tempDS.CommandText:= 'SELECT ik_potok FROM Potok WHERE (cName_potok = ''���, ���, ���, �� - 07'') and (ik_potok in (SELECT ik_potok FROM Potok_shema WHERE ik_shema_of_potok in (SELECT ik_shema_of_potok FROM Content_plan_nagr WHERE ik_plan_nagr = ' + IntToStr(planOfNagrIK) + ')))';
    tempDS.Open;
    Check(tempDS.RecordCount > 0, '����� "���, ���, ���, �� - 07" �� ������');
    potokIK:= tempDS.FieldByName('ik_potok').AsInteger;
    tempDS.Close;

    // �������� ID ���������� "������"

    tempDS.CommandText:= 'SELECT ik_disc, ik_type_disc FROM discpln WHERE cName_disc = ''������''';
    tempDS.Open;
    Check(tempDS.RecordCount > 0, '���������� "������" �� �������');
    discIK:= tempDS.FieldByName('ik_disc').AsInteger;
    discTypeIK:= tempDS.FieldByName('ik_type_disc').AsInteger;
    tempDS.Close;

    // �������� ������� �������� ��� ����������� ����������

    TNagruzkaController.PlanNagruzka.LoadContentPlanNagr(true, planOfNagrIK, potokIK, discIK, discTypeIK, 3, false, discHour, distrHour, true);
//    Check(discHour = 300, '����� ���������� ����� �� ���������� ���������� �� �����');
    Check(dm.aspContentPlanNagr.RecordCount = 7, '���������� ����� �������-����� �������� ��� ���������� "������" ������ "���, ���, ���, �� - 07" ����������');

    // �������� � ������, �������������� ���� ������� "������"
    // ���� ���� � ��������, �� ������ ������ ��������, ��� ������ ��� ������� ����������� � ������
    Check(dm.aspContentPlanNagr.Locate('ik_vid_zanyat; ik_vid_nagruzki', VarArrayOf([3, 1]), [loPartialKey]), '�� "������" ��� ���������� "������" ������ "���, ���, ���, �� - 07" �� ��������');

    // �������� ����� ������������ ��������
    Check(dm.aspContentPlanNagr.FieldByName('f_all_hour').AsFloat = 34, '���������� ����� �� ������� ��� ���������� "������" ������ "���, ���, ���, �� - 07" ���������� �� �����');

    // �������� � ������, �������������� ���� ������� "������������ �������"
    // �������� ����� ���������, ������������� � ��� ������, ���� ��������� ������� ������ �� ������ ��. ������ � ����� ������ ����������
    Check(dm.aspContentPlanNagr.Locate('ik_vid_zanyat; ik_vid_nagruzki', VarArrayOf([4, 1]), [loPartialKey]), '�� "������������ �������" ��� ���������� "������" ������ "���, ���, ���, �� - 07" �� ��������');
    Check(dm.aspContentPlanNagr.FieldByName('f_all_hour').AsFloat = 204, '���������� ����� �� ������������ �������� ��� ���������� "������" ������ "���, ���, ���, �� - 07" ���������� �� �����');

    // �������� � ������, �������������� ���� ������� "������������ �������"
    // ��� ���������� ������ ������������ ������� ���������� �� ��� ���� �������� ������ => ���������� ����������� ��������� �������������� ����� ���������
    Check(dm.aspContentPlanNagr.Locate('ik_vid_zanyat; ik_vid_nagruzki', VarArrayOf([5, 1]), [loPartialKey]), '�� "������������ �������" ��� ���������� "������" ������ "���, ���, ���, �� - 07" �� ��������');
    Check(dm.aspContentPlanNagr.FieldByName('f_all_hour').AsFloat = 68, '���������� ����� �� ������������ �������� ��� ���������� "������" ������ "���, ���, ���, �� - 07" ���������� �� �����');

    // �������� ������ �������� �� ���������, �.�. �� �������������� ���� �������
    Check(dm.aspContentPlanNagr.Locate('ik_vid_zanyat; ik_vid_nagruzki', VarArrayOf([6, 1]), [loPartialKey]), '�� "�������" ��� ���������� "������" ������ "���, ���, ���, �� - 07" �� ��������');
    Check(RoundFloat(dm.aspContentPlanNagr.FieldByName('f_all_hour').AsFloat, 1) = 43.2, '���������� ����� �� �������� ��� ���������� "������" ������ "���, ���, ���, �� - 07" ���������� �� �����');

    // �������� ������ �������� �� �������������
    Check(dm.aspContentPlanNagr.Locate('ik_vid_zanyat; ik_vid_nagruzki', VarArrayOf([32, 1]), [loPartialKey]), '�� "������������" ��� ���������� "������" ������ "���, ���, ���, �� - 07" �� ��������');
    Check(dm.aspContentPlanNagr.FieldByName('f_all_hour').AsFloat = 22, '���������� ����� �� ������������� ��� ���������� "������" ������ "���, ���, ���, �� - 07" ���������� �� �����');

    // �������� ������ �������� �� ���������� �������, ����� ����� ����� �� �������� �� ���� ������� �� ��������� ������������
    Check(dm.aspContentPlanNagr.Locate('ik_vid_zanyat; ik_vid_nagruzki', VarArrayOf([12, 1]), [loPartialKey]), '�� "����������� ������" ��� ���������� "������" ������ "���, ���, ���, �� - 07" �� ��������');
    Check(RoundFloat(dm.aspContentPlanNagr.FieldByName('f_all_hour').AsFloat, 1) = 29.6, '���������� ����� �� ����������� ������� ��� ���������� "������" ������ "���, ���, ���, �� - 07" ���������� �� �����');
    TNagruzkaController.PlanNagruzka.CloseContentPlanNagr;

    // �������� ������ ����, ������ ����� � ������ ����������
    tempDS.CommandText:= 'SELECT ik_plan_nagr FROM Plan_nagr WHERE (ik_kaf = (SELECT ik_kaf FROM kafedra WHERE cshort_name_kaf = ''���'')) ' +
      'and (ik_year = (SELECT ik_year_uch_pl FROM Year_uch_pl WHERE year_value = 2008)) and (ik_sem_type = 2) and (ik_type_ed = (SELECT ik_type_ed FROM Type_ed WHERE cName_type_ed = ''��������'')) ' +
      'and (ik_form_ed = (SELECT ik_form_ed FROM Form_ed WHERE cName_form_ed = ''�����''))';
    tempDS.Open;
    Check(tempDS.RecordCount > 0, '���� �������� ��� ������� "���" �� ������');
    planOfNagrIK:= tempDS.FieldByName('ik_plan_nagr').AsInteger;
    tempDS.Close;

    tempDS.CommandText:= 'SELECT ik_potok FROM Potok WHERE (cName_potok = ''���-04'') and (ik_potok in (SELECT ik_potok FROM Potok_shema WHERE ik_shema_of_potok in (SELECT ik_shema_of_potok FROM Content_plan_nagr WHERE ik_plan_nagr = ' + IntToStr(planOfNagrIK) + ')))';
    tempDS.Open;
    Check(tempDS.RecordCount > 0, '����� "���-04" �� ������');
    potokIK:= tempDS.FieldByName('ik_potok').AsInteger;
    tempDS.Close;

    // �������� ������ �������� �� ��������� � ��������� �������
    tempDS.CommandText:= 'SELECT ik_disc, ik_type_disc FROM discpln WHERE cName_disc = ''������ ��������� ���������������� ������''';
    tempDS.Open;
    Check(tempDS.RecordCount > 0, '���������� "������ ��������� ���������������� ������" �� �������');
    discIK:= tempDS.FieldByName('ik_disc').AsInteger;
    discTypeIK:= tempDS.FieldByName('ik_type_disc').AsInteger;
    tempDS.Close;
    TNagruzkaController.PlanNagruzka.LoadContentPlanNagr(true, planOfNagrIK, potokIK, discIK, discTypeIK, 10, true, discHour, distrHour, true);
//    Check(discHour = 300, '����� ���������� ����� �� ���������� ���������� �� �����');
    Check(dm.aspContentPlanNagr.RecordCount = 5, '���������� ����� �������-����� �������� ��� ���������� "������ ��������� ���������������� ������" ������ "���-04" ����������');
    Check(dm.aspContentPlanNagr.Locate('ik_vid_zanyat; ik_vid_nagruzki', VarArrayOf([31, 3]), [loPartialKey]), '�� "��������������" ��� ���������� "������" ������ "���-04" �� ��������');
    Check(dm.aspContentPlanNagr.FieldByName('f_all_hour').AsFloat = 28, '���������� ����� �� �������������� ���������� �� �����');
    Check(dm.aspContentPlanNagr.Locate('ik_vid_zanyat; ik_vid_nagruzki', VarArrayOf([31, 12]), [loPartialKey]), '�� "����������� � ����������������" ��� ���������� "������" ������ "���-04" �� ��������');
    Check(dm.aspContentPlanNagr.FieldByName('f_all_hour').AsFloat = 196, '���������� ����� �� ����������� � ���������������� ���������� �� �����');
    Check(dm.aspContentPlanNagr.Locate('ik_vid_zanyat; ik_vid_nagruzki', VarArrayOf([31, 13]), [loPartialKey]), '�� "������� � ���" ��� ���������� "������" ������ "���-04" �� ��������');
    Check(dm.aspContentPlanNagr.FieldByName('f_all_hour').AsFloat = 21, '���������� ����� ��� ������� � ��� ���������� �� �����');
    Check(dm.aspContentPlanNagr.Locate('ik_vid_zanyat; ik_vid_nagruzki', VarArrayOf([31, 14]), [loPartialKey]), '�� "���������������� � ���" ��� ���������� "������" ������ "���-04" �� ��������');
    Check(dm.aspContentPlanNagr.FieldByName('f_all_hour').AsFloat = 7, '���������� ����� ��� ���������������� � ��� ���������� �� �����');
    Check(dm.aspContentPlanNagr.Locate('ik_vid_zanyat; ik_vid_nagruzki', VarArrayOf([31, 15]), [loPartialKey]), '�� "������ � ������" ��� ���������� "������" ������ "���-04" �� ��������');
    Check(dm.aspContentPlanNagr.FieldByName('f_all_hour').AsFloat = 7, '���������� ����� �� ������� � ������ ���������� �� �����');
    TNagruzkaController.PlanNagruzka.CloseContentPlanNagr;

    // �������� ������ �������� ��� �������������, �.�. ������ ��������� ������ ��������, ������������ �� ���������
    tempDS.CommandText:= 'SELECT ik_potok FROM Potok WHERE (cName_potok = ''���-05'') and (ik_potok in (SELECT ik_potok FROM Potok_shema WHERE ik_shema_of_potok in (SELECT ik_shema_of_potok FROM Content_plan_nagr WHERE ik_plan_nagr = ' + IntToStr(planOfNagrIK) + ')))';
    tempDS.Open;
    Check(tempDS.RecordCount > 0, '����� "���-05" �� ������');
    potokIK:= tempDS.FieldByName('ik_potok').AsInteger;
    tempDS.Close;

    tempDS.CommandText:= 'SELECT ik_disc, ik_type_disc FROM discpln WHERE cName_disc = ''������ �������� �������''';
    tempDS.Open;
    Check(tempDS.RecordCount > 0, '���������� "������ �������� �������" �� �������');
    discIK:= tempDS.FieldByName('ik_disc').AsInteger;
    discTypeIK:= tempDS.FieldByName('ik_type_disc').AsInteger;
    tempDS.Close;

    TNagruzkaController.PlanNagruzka.LoadContentPlanNagr(true, planOfNagrIK, potokIK, discIK, discTypeIK, 8, false, discHour, distrHour, true);
//    Check(discHour = 300, '����� ���������� ����� �� ���������� ���������� �� �����');
    Check(dm.aspContentPlanNagr.RecordCount = 2, '���������� ����� �������-����� �������� ��� ���������� "������ �������� �������" ������ "���-05" ����������');
    Check(dm.aspContentPlanNagr.Locate('ik_vid_zanyat; ik_vid_nagruzki', VarArrayOf([6, 1]), [loPartialKey]), '�� "�������" ��� ���������� "������ �������� �������" ������ "���-05" �� ��������');
    Check(RoundFloat(dm.aspContentPlanNagr.FieldByName('f_all_hour').AsFloat, 1) = 0.9, '���������� ����� �� �������� ��� ���������� "������ �������� �������" ������ "���-05" ���������� �� �����');

    // �������� ������ �������� �� ���������� �������, ����� ����� ����� �� �������� �� ���� ������� ��������� ������������
    Check(dm.aspContentPlanNagr.Locate('ik_vid_zanyat; ik_vid_nagruzki', VarArrayOf([12, 1]), [loPartialKey]), '�� "����������� ������" ��� ���������� "������ �������� �������" ������ "���-05" �� ��������');
    Check(dm.aspContentPlanNagr.FieldByName('f_all_hour').AsFloat = 3, '���������� ����� �� ����������� ������� ��� ���������� "������ �������� �������" ������ "���-05" ���������� �� �����');
    TNagruzkaController.PlanNagruzka.CloseContentPlanNagr;

  finally
    if dm.aspContentPlanNagr.Active then TNagruzkaController.PlanNagruzka.CloseContentPlanNagr;
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
  end;
end;

{ TPotokManagementComponentTest }

procedure TPotokManagementComponentTest.TestAddPotokScheme;
begin

end;

procedure TPotokManagementComponentTest.TestAddPotokWithGroupOnly;
begin

end;

procedure TPotokManagementComponentTest.TestAddPotokWithSpecAndGroups;
begin

end;

procedure TPotokManagementComponentTest.TestAddPotokWithSpecOnly;
begin

end;

procedure TPotokManagementComponentTest.TestDelPotok;
begin

end;

procedure TPotokManagementComponentTest.TestDelPotokScheme;
begin

end;

procedure TPotokManagementComponentTest.TestEditPotok;
begin

end;

procedure TPotokManagementComponentTest.TestEditPotokScheme;
begin

end;

{ TTeacherManagementComponentTest }

procedure TTeacherManagementComponentTest.TestAddTeacher;
begin

end;

procedure TTeacherManagementComponentTest.TestDelTeacher;
begin

end;

procedure TTeacherManagementComponentTest.TestEditTeacher;
begin

end;

procedure TTeacherManagementComponentTest.TestReleaseTeacher;
begin

end;

{ TContingentComponentTest }

procedure TContingentComponentTest.TestFillSeparatedGroupsContingent;
begin

end;

procedure TContingentComponentTest.TestFillSpecialityContingent;
begin

end;

procedure TContingentComponentTest.TestGroupsAvailable;
begin

end;

procedure TContingentComponentTest.TestSpecialityAvailable;
begin

end;

{ TNormOfTimeComponentTest }

procedure TNormOfTimeComponentTest.TestAddNormOfTime;
begin

end;

procedure TNormOfTimeComponentTest.TestAddNormOfTimeFromExists;
begin

end;

procedure TNormOfTimeComponentTest.TestDelNormOfTime;
begin

end;

procedure TNormOfTimeComponentTest.TestEditNormOfTime;
begin

end;

procedure TNormOfTimeComponentTest.TestFillNormOfTimeForDisciplines;
begin

end;

procedure TNormOfTimeComponentTest.TestFillNormOfTimeForPractice;
begin

end;

{ TFactNagrSourcesTest }

procedure TFactNagrSourcesTest.TestLoadEventsFromSchedule;
begin

end;

procedure TFactNagrSourcesTest.TestLoadVedomostFromDecanat;
begin

end;

{ TDistributionComponentTest }

procedure TDistributionComponentTest.CheckUndistributedNagrCalculation;
begin

end;

{ TLoadEducationPlanInfoTest }

procedure TLoadEducationPlanInfoTest.TestLoadEducationalPlanInfo;
begin

end;

{ TNagruzkaCrossComponentTest }

procedure TNagruzkaCrossComponentTest.TestLoadPotokContingentForPlanNagr;
begin
  
end;

{ TFactNagrAccountingComponentTest }

procedure TFactNagrAccountingComponentTest.TestLoadVidZanyatListFromDistributedNagr;
begin
  
end;

end.
