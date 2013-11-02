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
  Result:= TTestSuite.Create('Тестирование дефектов компонентов подсистемы "Учебная нагрузка"');
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
    // загрузим ID плана учебной нагрузки кафедры "Физики" для очной формы обучения, бюджетного типа обучения на осенний семестр 2008-2009 года
    // тест выполняется на тестовой базе, данные в которой изменяться не будут, поэтому можем тестировать посредством проверки конкретных значений

    tempDS.CommandText:= 'SELECT ik_plan_nagr FROM Plan_nagr WHERE (ik_kaf = (SELECT ik_kaf FROM kafedra WHERE cshort_name_kaf = ''Физики'')) ' +
      'and (ik_year = (SELECT ik_year_uch_pl FROM Year_uch_pl WHERE year_value = 2008)) and (ik_sem_type = 1) and (ik_type_ed = (SELECT ik_type_ed FROM Type_ed WHERE cName_type_ed = ''Бюджет'')) ' +
      'and (ik_form_ed = (SELECT ik_form_ed FROM Form_ed WHERE cName_form_ed = ''Очная''))';
    tempDS.Open;
    Check(tempDS.RecordCount > 0, 'План нагрузки для кафедры "Физики" не найден');
    planOfNagrIK:= tempDS.FieldByName('ik_plan_nagr').AsInteger;
    tempDS.Close;

    // загрузим ID потока "БТП, ПГС, ТГВ, ВВ - 07"

    tempDS.CommandText:= 'SELECT ik_potok FROM Potok WHERE (cName_potok = ''БТП, ПГС, ТГВ, ВВ - 07'') and (ik_potok in (SELECT ik_potok FROM Potok_shema WHERE ik_shema_of_potok in (SELECT ik_shema_of_potok FROM Content_plan_nagr WHERE ik_plan_nagr = ' + IntToStr(planOfNagrIK) + ')))';
    tempDS.Open;
    Check(tempDS.RecordCount > 0, 'Поток "БТП, ПГС, ТГВ, ВВ - 07" не найден');
    potokIK:= tempDS.FieldByName('ik_potok').AsInteger;
    tempDS.Close;

    // загрузим ID дисциплины "Физика"

    tempDS.CommandText:= 'SELECT ik_disc, ik_type_disc FROM discpln WHERE cName_disc = ''Физика''';
    tempDS.Open;
    Check(tempDS.RecordCount > 0, 'Дисциплина "Физика" не найдена');
    discIK:= tempDS.FieldByName('ik_disc').AsInteger;
    discTypeIK:= tempDS.FieldByName('ik_type_disc').AsInteger;
    tempDS.Close;

    // загрузим учебную нагрузку для загруженных параметров

    TNagruzkaController.PlanNagruzka.LoadContentPlanNagr(true, planOfNagrIK, potokIK, discIK, discTypeIK, 3, false, discHour, distrHour, true);
//    Check(discHour = 300, 'Общее количество часов по дисциплине рассчитано не верно');
    Check(dm.aspContentPlanNagr.RecordCount = 7, 'Количество видов занятий-видов нагрузки для дисциплины "Физика" потока "БТП, ПГС, ТГВ, ВВ - 07" изменилось');

    // перейдем к записи, соответсвующей виду занятий "Лекции"
    // хоть база и тестовая, на всякий случай проверим, что данный вид занятий присутсвует в списке
    Check(dm.aspContentPlanNagr.Locate('ik_vid_zanyat; ik_vid_nagruzki', VarArrayOf([3, 1]), [loPartialKey]), 'ВЗ "Лекция" для дисциплины "Физика" потока "БТП, ПГС, ТГВ, ВВ - 07" не загружен');

    // проверим объем рассчитанной нагрузки
    Check(dm.aspContentPlanNagr.FieldByName('f_all_hour').AsFloat = 34, 'Количество часов по лекциям для дисциплины "Физика" потока "БТП, ПГС, ТГВ, ВВ - 07" рассчитано не верно');

    // перейдем к записи, соответсвующей виду занятий "Лабораторные занятия"
    // проверим ветвь алгоритма, выполняющуюся в том случае, если расчетные единицы учатся по разным уч. планам и имеют разную расчасовку
    Check(dm.aspContentPlanNagr.Locate('ik_vid_zanyat; ik_vid_nagruzki', VarArrayOf([4, 1]), [loPartialKey]), 'ВЗ "Лабораторное занятие" для дисциплины "Физика" потока "БТП, ПГС, ТГВ, ВВ - 07" не загружен');
    Check(dm.aspContentPlanNagr.FieldByName('f_all_hour').AsFloat = 204, 'Количество часов по лабораторным занятиям для дисциплины "Физика" потока "БТП, ПГС, ТГВ, ВВ - 07" рассчитано не верно');

    // перейдем к записи, соответсвующей виду занятий "Практические занятия"
    // для выбранного потока практические занятия проводятся не для всех подгрупп потока => появляется возможность проверить соответсвующую ветвь алгоритма
    Check(dm.aspContentPlanNagr.Locate('ik_vid_zanyat; ik_vid_nagruzki', VarArrayOf([5, 1]), [loPartialKey]), 'ВЗ "Практическое занятие" для дисциплины "Физика" потока "БТП, ПГС, ТГВ, ВВ - 07" не загружен');
    Check(dm.aspContentPlanNagr.FieldByName('f_all_hour').AsFloat = 68, 'Количество часов по лабораторным занятиям для дисциплины "Физика" потока "БТП, ПГС, ТГВ, ВВ - 07" рассчитано не верно');

    // проверим расчет нагрузки по экзаменам, т.е. по внеаудиторному виду занятий
    Check(dm.aspContentPlanNagr.Locate('ik_vid_zanyat; ik_vid_nagruzki', VarArrayOf([6, 1]), [loPartialKey]), 'ВЗ "Экзамен" для дисциплины "Физика" потока "БТП, ПГС, ТГВ, ВВ - 07" не загружен');
    Check(RoundFloat(dm.aspContentPlanNagr.FieldByName('f_all_hour').AsFloat, 1) = 43.2, 'Количество часов по экзамену для дисциплины "Физика" потока "БТП, ПГС, ТГВ, ВВ - 07" рассчитано не верно');

    // проверим расчет нагрузки по консультациям
    Check(dm.aspContentPlanNagr.Locate('ik_vid_zanyat; ik_vid_nagruzki', VarArrayOf([32, 1]), [loPartialKey]), 'ВЗ "Консультации" для дисциплины "Физика" потока "БТП, ПГС, ТГВ, ВВ - 07" не загружен');
    Check(dm.aspContentPlanNagr.FieldByName('f_all_hour').AsFloat = 22, 'Количество часов по консультациям для дисциплины "Физика" потока "БТП, ПГС, ТГВ, ВВ - 07" рассчитано не верно');

    // проверим расчет нагрузки по контрольым работам, когда общая норма на студента по всем работам не превышает максимальную
    Check(dm.aspContentPlanNagr.Locate('ik_vid_zanyat; ik_vid_nagruzki', VarArrayOf([12, 1]), [loPartialKey]), 'ВЗ "Контрольные работы" для дисциплины "Физика" потока "БТП, ПГС, ТГВ, ВВ - 07" не загружен');
    Check(RoundFloat(dm.aspContentPlanNagr.FieldByName('f_all_hour').AsFloat, 1) = 29.6, 'Количество часов по контрольным работам для дисциплины "Физика" потока "БТП, ПГС, ТГВ, ВВ - 07" рассчитано не верно');
    TNagruzkaController.PlanNagruzka.CloseContentPlanNagr;

    // загрузим другой план, другой поток и другую дисциплину
    tempDS.CommandText:= 'SELECT ik_plan_nagr FROM Plan_nagr WHERE (ik_kaf = (SELECT ik_kaf FROM kafedra WHERE cshort_name_kaf = ''ИСТ'')) ' +
      'and (ik_year = (SELECT ik_year_uch_pl FROM Year_uch_pl WHERE year_value = 2008)) and (ik_sem_type = 2) and (ik_type_ed = (SELECT ik_type_ed FROM Type_ed WHERE cName_type_ed = ''Контракт'')) ' +
      'and (ik_form_ed = (SELECT ik_form_ed FROM Form_ed WHERE cName_form_ed = ''Очная''))';
    tempDS.Open;
    Check(tempDS.RecordCount > 0, 'План нагрузки для кафедры "ИСТ" не найден');
    planOfNagrIK:= tempDS.FieldByName('ik_plan_nagr').AsInteger;
    tempDS.Close;

    tempDS.CommandText:= 'SELECT ik_potok FROM Potok WHERE (cName_potok = ''ИСТ-04'') and (ik_potok in (SELECT ik_potok FROM Potok_shema WHERE ik_shema_of_potok in (SELECT ik_shema_of_potok FROM Content_plan_nagr WHERE ik_plan_nagr = ' + IntToStr(planOfNagrIK) + ')))';
    tempDS.Open;
    Check(tempDS.RecordCount > 0, 'Поток "ИСТ-04" не найден');
    potokIK:= tempDS.FieldByName('ik_potok').AsInteger;
    tempDS.Close;

    // проверим расчет нагрузки по практикам и выпускным работам
    tempDS.CommandText:= 'SELECT ik_disc, ik_type_disc FROM discpln WHERE cName_disc = ''Защита выпускной квалификационной работы''';
    tempDS.Open;
    Check(tempDS.RecordCount > 0, 'Дисциплина "Защита выпускной квалификационной работы" не найдена');
    discIK:= tempDS.FieldByName('ik_disc').AsInteger;
    discTypeIK:= tempDS.FieldByName('ik_type_disc').AsInteger;
    tempDS.Close;
    TNagruzkaController.PlanNagruzka.LoadContentPlanNagr(true, planOfNagrIK, potokIK, discIK, discTypeIK, 10, true, discHour, distrHour, true);
//    Check(discHour = 300, 'Общее количество часов по дисциплине рассчитано не верно');
    Check(dm.aspContentPlanNagr.RecordCount = 5, 'Количество видов занятий-видов нагрузки для дисциплины "Защита выпускной квалификационной работы" потока "ИСТ-04" изменилось');
    Check(dm.aspContentPlanNagr.Locate('ik_vid_zanyat; ik_vid_nagruzki', VarArrayOf([31, 3]), [loPartialKey]), 'ВН "Рецензирование" для дисциплины "Физика" потока "ИСТ-04" не загружен');
    Check(dm.aspContentPlanNagr.FieldByName('f_all_hour').AsFloat = 28, 'Количество часов по рецензированию рассчитано не верно');
    Check(dm.aspContentPlanNagr.Locate('ik_vid_zanyat; ik_vid_nagruzki', VarArrayOf([31, 12]), [loPartialKey]), 'ВН "Руководство и консультирование" для дисциплины "Физика" потока "ИСТ-04" не загружен');
    Check(dm.aspContentPlanNagr.FieldByName('f_all_hour').AsFloat = 196, 'Количество часов по руководству и консультированию рассчитано не верно');
    Check(dm.aspContentPlanNagr.Locate('ik_vid_zanyat; ik_vid_nagruzki', VarArrayOf([31, 13]), [loPartialKey]), 'ВН "Участие в ГАК" для дисциплины "Физика" потока "ИСТ-04" не загружен');
    Check(dm.aspContentPlanNagr.FieldByName('f_all_hour').AsFloat = 21, 'Количество часов для участия в ГАК рассчитано не верно');
    Check(dm.aspContentPlanNagr.Locate('ik_vid_zanyat; ik_vid_nagruzki', VarArrayOf([31, 14]), [loPartialKey]), 'ВН "Председательство в ГАК" для дисциплины "Физика" потока "ИСТ-04" не загружен');
    Check(dm.aspContentPlanNagr.FieldByName('f_all_hour').AsFloat = 7, 'Количество часов для председательства в ГАК рассчитано не верно');
    Check(dm.aspContentPlanNagr.Locate('ik_vid_zanyat; ik_vid_nagruzki', VarArrayOf([31, 15]), [loPartialKey]), 'ВН "Допуск к защите" для дисциплины "Физика" потока "ИСТ-04" не загружен');
    Check(dm.aspContentPlanNagr.FieldByName('f_all_hour').AsFloat = 7, 'Количество часов по допуску к защите рассчитано не верно');
    TNagruzkaController.PlanNagruzka.CloseContentPlanNagr;

    // проверим расчет нагрузки для контрактников, т.е. должна считаться только нагрузка, приходящаяся на студентов
    tempDS.CommandText:= 'SELECT ik_potok FROM Potok WHERE (cName_potok = ''ИСТ-05'') and (ik_potok in (SELECT ik_potok FROM Potok_shema WHERE ik_shema_of_potok in (SELECT ik_shema_of_potok FROM Content_plan_nagr WHERE ik_plan_nagr = ' + IntToStr(planOfNagrIK) + ')))';
    tempDS.Open;
    Check(tempDS.RecordCount > 0, 'Поток "ИСТ-05" не найден');
    potokIK:= tempDS.FieldByName('ik_potok').AsInteger;
    tempDS.Close;

    tempDS.CommandText:= 'SELECT ik_disc, ik_type_disc FROM discpln WHERE cName_disc = ''Теория принятия решений''';
    tempDS.Open;
    Check(tempDS.RecordCount > 0, 'Дисциплина "Теория принятия решений" не найдена');
    discIK:= tempDS.FieldByName('ik_disc').AsInteger;
    discTypeIK:= tempDS.FieldByName('ik_type_disc').AsInteger;
    tempDS.Close;

    TNagruzkaController.PlanNagruzka.LoadContentPlanNagr(true, planOfNagrIK, potokIK, discIK, discTypeIK, 8, false, discHour, distrHour, true);
//    Check(discHour = 300, 'Общее количество часов по дисциплине рассчитано не верно');
    Check(dm.aspContentPlanNagr.RecordCount = 2, 'Количество видов занятий-видов нагрузки для дисциплины "Теория принятия решений" потока "ИСТ-05" изменилось');
    Check(dm.aspContentPlanNagr.Locate('ik_vid_zanyat; ik_vid_nagruzki', VarArrayOf([6, 1]), [loPartialKey]), 'ВЗ "Экзамен" для дисциплины "Теория принятия решений" потока "ИСТ-05" не загружен');
    Check(RoundFloat(dm.aspContentPlanNagr.FieldByName('f_all_hour').AsFloat, 1) = 0.9, 'Количество часов по экзамену для дисциплины "Теория принятия решений" потока "ИСТ-05" рассчитано не верно');

    // проверим расчет нагрузки по контрольым работам, когда общая норма на студента по всем работам превышает максимальную
    Check(dm.aspContentPlanNagr.Locate('ik_vid_zanyat; ik_vid_nagruzki', VarArrayOf([12, 1]), [loPartialKey]), 'ВЗ "Контрольные работы" для дисциплины "Теория принятия решений" потока "ИСТ-05" не загружен');
    Check(dm.aspContentPlanNagr.FieldByName('f_all_hour').AsFloat = 3, 'Количество часов по контрольным работам для дисциплины "Теория принятия решений" потока "ИСТ-05" рассчитано не верно');
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
