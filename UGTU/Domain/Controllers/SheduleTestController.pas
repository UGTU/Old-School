unit SheduleTestController;
  {#Author villain@ist.ugtu.net}
interface

uses TestFrameWork, ADODB, DB, Contnrs, SysUtils, Variants;

type
  // аттестация компонента учета
  TAccountComponentTest = class(TTestCase)
  published
    procedure GetCampusDistance;
    procedure SaveCampusDistance;
    procedure GetSemesterLength;
    procedure SaveSemesterLength;
    procedure ControlRoomFund;
  end;

  // аттестация компонента установки ограничений
  TConstraintComponentTest = class(TTestCase)
  published
    procedure TestTeacherTimeConstraint;
    procedure TestRoomConstraint;
  end;

  //аттестация компонента управления аудиторным расписанием
  TLessonScheduleComponentFunctionsTest = class(TTestCase)
  published
    procedure TestAddSheduleEvent;
    procedure TestReadDepEventShedule;
    procedure TestReadFacEventShedule;

  end;

  //аттестация компонента управления расписанием экзаменов
  TExamScheduleComponentFunctionsTest = class(TTestCase)
  published
    procedure TestAddSheduleExam;
    procedure TestReadDepExamShedule;
    procedure TestReadFacExamShedule;
  end;

  TScheduleControllersTest = class(TTestCase)
  published
    procedure TestAccountController;
    procedure TestConstraintController;
    procedure TestMainController;
  end;

  TScheduleEventClassTest = class(TTestCase)
  published
    procedure TestRecurrenceOfScheduleEvent;
    procedure TestLazyLoad;
  end;

  TLessonScheduleClassTest = class(TTestCase)
  published
    procedure TestGoToPeriod;
    procedure TestPartsListLoad;
  end;

  TDepLessonScheduleClassTest = class(TTestCase)
  published
    procedure TestTeachersListLoad;
  end;

  TFacLessonScheduleClassTest = class(TTestCase)
  published
    procedure TestGroupsListLoad;
  end;

  TScheduleExamClassTest = class(TTestCase)
  published
    procedure TestLazyLoad;
  end;

  TExamScheduleClassTest = class(TTestCase)
  published
    procedure TestSessionDatesLoad;
  end;

  TScheduleCrossComponentTest = class(TTestCase)
  published
    procedure CheckRoomUseConstraintTest;
    procedure CheckTeacherAvailTimeConstraintTest;
  end;

  TLoadPlanNagrInScheduleTest = class(TTestCase)
  published
    procedure TestLoadAuditoriumPlanNagrForGroup;
    procedure TestLoadAuditoriumPlanNagrForTeacher;
    procedure TestLoadExamPlanNagrForGroup;
    procedure TestLoadExamPlanNagrForTeacher;
  end;

  function ScheduleComponentDefectTest: ITestSuite;

implementation

uses GeneralController, SheduleController, SheduleClasses, SheduleGrids, DateUtils;

procedure TLessonScheduleComponentFunctionsTest.TestAddSheduleEvent;
{var
  tempDS, tabNDS, workTypeDS, discDS, potokDS, vzDS, vnDS, cuDS: TADODataSet;
  formEdIK, roomIK, campusIK: Variant;
  i, curDate, curPart: integer;
  tempEvent: TSheduleEvent;
  y,m,d,h,min,s,ms: word;
  fPlanNagrIKList, fContentPlanNagrIKList, fPrepodPlanIKList: string;
  fFacLessonShedule: TDayFacLessonSheduleGrid;   }
begin
  { Заполняем расписание на осенний семестр 2006 года на факультете ФИТ (ID = 7), кафедра ИСТ (ID = 365):

  }
{  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  tabNDS:= TGeneralController.Instance.GetNewADODataSet(false);
  workTypeDS:= TGeneralController.Instance.GetNewADODataSet(false);
  discDS:= TGeneralController.Instance.GetNewADODataSet(false);
  potokDS:= TGeneralController.Instance.GetNewADODataSet(false);
  vzDS:= TGeneralController.Instance.GetNewADODataSet(false);
  vnDS:= TGeneralController.Instance.GetNewADODataSet(false);
  cuDS:= TGeneralController.Instance.GetNewADODataSet(false);

try
  tempDS.CommandText:= 'SELECT ik_shedule, d_sem_start FROM Shedule WHERE (ik_year = 14) and (ik_sem_type = 1)';
  tempDS.Open;
  Check(tempDS.RecordCount > 0, '');
  fFacLessonShedule:= TDayFacLessonSheduleGrid.Create(7, tempDS.FieldByName('ik_shedule').AsInteger, nil);
  tempDS.Close;
  fFacLessonShedule.ReadShedule;
  Check(fFacLessonShedule.DefaultSemLengthInfo <> nil, 'В TDayFacLessonSheduleGrid не указана дата начала семестра');
  Check(fFacLessonShedule.PartCount > 0, 'TDayFacLessonSheduleGrid не подгрузил список пар');
  curDate:= 0;
  curPart:= 0;
  for I := 0 to fFacLessonShedule.GroupCount - 1 do
  begin
    formEdIK:= TSheduleController.Instance.GetFormEdListForAddEvent(@tempDS, fFacLessonShedule.Groups[i].GroupIK, fFacLessonShedule.SheduleIK, 365, false, true, false, NULL);
    tempDS.Close;
    if formEdIK = NULL then continue;
    TSheduleController.Instance.GetTeacherListForAddEvent(@tabNDS, fFacLessonShedule.Groups[i].GroupIK, fFacLessonShedule.SheduleIK, 365, formEdIK, fPlanNagrIKList, false, true, false, NULL);
    Check(tabNDS.RecordCount > 0, 'При вызове GetTeacherListForAddEvent не подгружено ни одного преподавателя');
    Check(fPlanNagrIKList <> '', 'GetTeacherListForAddEvent вернула пустой список планов ученбной нагрузки fPlanNagrIKList');
    while not tabNDS.Eof do
    begin
      TSheduleController.Instance.GetTeacherWorkTypeListForAddEvent(@workTypeDS, fFacLessonShedule.Groups[i].GroupIK, tabNDS.FieldByName('iTab_n').AsInteger, fPlanNagrIKList, false, true, false, NULL);
      while not workTypeDS.Eof do
      begin
        TSheduleController.Instance.GetDiscListForAddEvent(@discDS, fFacLessonShedule.Groups[i].GroupIK, workTypeDS.FieldByName('ik_id_prepod').AsInteger, fPlanNagrIKList, false, true, false, NULL);
        while not discDS.Eof do
        begin
          TSheduleController.Instance.GetPotokListForAddEvent(@potokDS, fFacLessonShedule.Groups[i].GroupIK, workTypeDS.FieldByName('ik_id_prepod').AsInteger, discDS.FieldByName('ik_disc').AsInteger, fPlanNagrIKList, false, true, false, NULL);
          while not potokDS.Eof do
          begin
            TSheduleController.Instance.GetVidZanyatListForAddEvent(@vzDS, fFacLessonShedule.Groups[i].GroupIK, workTypeDS.FieldByName('ik_id_prepod').AsInteger, discDS.FieldByName('ik_disc').AsInteger,
              potokDS.FieldByName('ik_potok').AsInteger, fPlanNagrIKList, false, true, false, NULL);
            while not vzDS.Eof do
            begin
              TSheduleController.Instance.GetVidNagruzkiListForAddEvent(@vnDS, fFacLessonShedule.Groups[i].GroupIK, workTypeDS.FieldByName('ik_id_prepod').AsInteger, discDS.FieldByName('ik_disc').AsInteger,
                potokDS.FieldByName('ik_potok').AsInteger, vzDS.FieldByName('ik_vid_zanyat').AsInteger, vzDS.FieldByName('ik_decompose_type').AsInteger, fPlanNagrIKList, fContentPlanNagrIKList, false, false, NULL);
              Check(fContentPlanNagrIKList <> '', 'GetVidNagruzkiListForAddEvent вернула пустой список записей плана нагрузки fContentPlanNagrIKList');
              while not vnDS.Eof do
              begin
                TSheduleController.Instance.GetCalcUnitListForAddEvent(@cuDS, fFacLessonShedule.Groups[i].GroupIK, workTypeDS.FieldByName('ik_id_prepod').AsInteger, vzDS.FieldByName('ik_decompose_type').AsInteger, vnDS.FieldByName('ik_vid_nagruzki').AsInteger,
                  fContentPlanNagrIKList, '', false, false, NULL);
                while not cuDS.Eof do
                begin
                  TSheduleController.Instance.GetCampusForPrepodPlanIK(@tempDS, vnDS.FieldByName('ik_vid_nagruzki').AsInteger, cuDS.FieldByName('ik_calc_unit').AsInteger, fFacLessonShedule.SheduleIK, fContentPlanNagrIKList, fPrepodPlanIKList, 7);
                  Check(tempDS.Locate('CName_campus', 'К', [loPartialKey]), 'В списке корпусов не найден корпус К');
                  campusIK:= tempDS.FieldByName('ik_campus').AsInteger;
                  tempDS.Close;
                  TSheduleController.Instance.GetRoomsForPrepodPlanIK(@tempDS, campusIK, fFacLessonShedule.SheduleIK, fPrepodPlanIKList, '', NULL);
                  roomIK:= tempDS.FieldByName('ik_room').AsInteger;
                  tempDS.Close;
                  tempEvent:= TSheduleEvent.Create;
                  tempEvent.CalcUnitIK:= cuDS.FieldByName('ik_calc_unit').AsInteger;
                  Check(tempEvent.CalcUnitName <> '', 'Для события не было установлено название расчетной единицы');
                  tempEvent.PlanTeacherIK:= workTypeDS.FieldByName('ik_id_prepod').AsInteger;
                  tempEvent.TeacherIK:= workTypeDS.FieldByName('ik_id_prepod').AsInteger;
                  Check(tempEvent.TeacherName <> '', 'Для события не было установлено ФИО преподавателя');
                  tempEvent.DiscIK:= discDS.FieldByName('ik_disc').AsInteger;
                  Check(tempEvent.DiscName <> '', 'Для события не было установлено название дисциплины');
                  tempEvent.RoomIK:= roomIK;
                  Check(tempEvent.RoomName <> '', 'Для события не было установлено название аудитории');
                  tempEvent.VidZanyatIK:= vzDS.FieldByName('ik_vid_zanyat').AsInteger;
                  Check(tempEvent.VidZanyatName <> '', 'Для события не было установлено название вида занятий');
                  tempEvent.VidNagruzkiIK:= vnDS.FieldByName('ik_vid_nagruzki').AsInteger;
                  Check(tempEvent.VidNagruzkiName <> '', 'Для события не было установлено название вида нагрузки');
                  tempEvent.BeginDate:= fFacLessonShedule.DefaultSemLengthInfo.SemStart + curDate;
                  DecodeTime(fFacLessonShedule.Parts[curPart].StartTime, h,min,s,ms);
                  DecodeDate(tempEvent.BeginDate, y,m,d);
                  tempEvent.Start:= EncodeDateTime(y,m,d,h,min,s,ms);
                  DecodeTime(fFacLessonShedule.Parts[curPart].StopTime, h,min,s,ms);
                  tempEvent.Stop:= EncodeDateTime(y,m,d,h,min,s,ms);
                  tempEvent.EventType:= fFacLessonShedule.Parts[curPart].PartNumber;
                  tempEvent.IsException:= false;
                  tempEvent.RepeatPattern:= TWeekRepeatPattern.Create;
                  tempEvent.RepeatPattern.RepeatPattenIK:= -1;
                  tempEvent.RepeatPattern.RepeatType:= 2;
                  tempEvent.RepeatPattern.RepeatFrequency:= 2;

                  case DayOfWeek(tempEvent.BeginDate) of
                  2: tempEvent.RepeatPattern.RepeatMask:= '2_____';
                  3: tempEvent.RepeatPattern.RepeatMask:= '_3____';
                  4: tempEvent.RepeatPattern.RepeatMask:= '__4___';
                  5: tempEvent.RepeatPattern.RepeatMask:= '___5__';
                  6: tempEvent.RepeatPattern.RepeatMask:= '____6_';
                  7: tempEvent.RepeatPattern.RepeatMask:= '_____7';
                  end;
                  tempEvent.RepeatPattern.RepeatLimitType:= 3;
                  tempEvent.RepeatPattern.EndDateOfRepeat:= fFacLessonShedule.DefaultSemLengthInfo.SemStop;
                  Check(TSheduleController.Instance.SaveEvent(tempEvent, nil, false, fFacLessonShedule, fPrepodPlanIKList) = true, 'Контроллер не смог сохранить событие');

                  //проверяем напрямую из БД
                  tempDS.CommandText:= 'SELECT * FROM SheduleEvent WHERE ik_event = ' + IntToStr(tempEvent.EventIK);
                  tempDS.Open;
                  Check(tempDS.RecordCount > 0, 'Событие с указанным ID (' + IntToStr(tempEvent.EventIK) + ' не обнаружено в БД');
                  Check(tempDS.FieldByName('ik_shedule').AsInteger = fFacLessonShedule.SheduleIK, 'ID расписания у события, считанного из БД, не соответсвует ID расписания у TDayFacLessonSheduleGrid (ik_event = ' + tempDS.FieldByName('ik_event').AsString + ')');
                  Check(tempDS.FieldByName('ik_id_prepod').AsInteger = tempEvent.TeacherIK, 'ID преподавателя у события, считанного из БД, не соответсвует ID преподавателя у созданного события (ik_event = ' + tempDS.FieldByName('ik_event').AsString + ')');
                  Check(tempDS.FieldByName('ik_event_type').AsInteger = tempEvent.EventType, 'ID типа события у события, считанного из БД, не соответсвует ID типа события у созданного события (ik_event = ' + tempDS.FieldByName('ik_event').AsString + ')');
                  Check(tempDS.FieldByName('ik_room').AsInteger = tempEvent.RoomIK, 'ID аудитории у события, считанного из БД, не соответсвует ID аудитории у созданного события (ik_event = ' + tempDS.FieldByName('ik_event').AsString + ')');
                  Check(tempDS.FieldByName('ik_repeat_pattern').AsInteger = tempEvent.RepeatPattern.RepeatPattenIK, 'ID шаблона повторения у события, считанного из БД, не соответсвует ID шаблона повторения у созданного события (ik_event = ' + tempDS.FieldByName('ik_event').AsString + ')');
                  Check(tempDS.FieldByName('dBegin_date').AsDateTime = tempEvent.BeginDate, 'Дата начала события, считанного из БД, не соответсвует дате начала созданного события (ik_event = ' + tempDS.FieldByName('ik_event').AsString + ')');
                  Check(tempDS.FieldByName('bit_exception').AsBoolean = false, 'Событие было сохранено в БД как исключение (ik_event = ' + tempDS.FieldByName('ik_event').AsString + ')');
                  tempDS.Close;

                  tempDS.CommandText:= 'SELECT * FROM RepeatPattern WHERE ik_repeat_pattern = ' + IntToStr(tempEvent.RepeatPattern.RepeatPattenIK);
                  tempDS.Open;
                  Check(tempDS.RecordCount > 0, 'Шаблон повторения, соответсвующий данному событию, не найден в БД');
                  Check(tempDS.FieldByName('ik_repeat_type').AsInteger = tempEvent.RepeatPattern.RepeatType, 'Тип повторения в шаблоне повторения события, считанного из БД, не соответсвует параметрам созданного события (ik_repeat_pattern = ' + tempDS.FieldByName('ik_repeat_pattern').AsString + ')');
                  Check(tempDS.FieldByName('iRepeat_frequency').AsInteger = tempEvent.RepeatPattern.RepeatFrequency, 'Частота повторений в шаблоне повторения события, считанного из БД, не соответсвует параметрам созданного события (ik_repeat_pattern = ' + tempDS.FieldByName('ik_repeat_pattern').AsString + ')');
                  Check(tempDS.FieldByName('cRepeat_mask').AsString = tempEvent.RepeatPattern.RepeatMask, 'Маска повторений в шаблоне повторения события, считанного из БД, не соответсвует параметрам созданного события (ik_repeat_pattern = ' + tempDS.FieldByName('ik_repeat_pattern').AsString + ')');
                  Check(tempDS.FieldByName('ik_repeat_limit').AsInteger = tempEvent.RepeatPattern.RepeatLimitType, 'Тип предела повторений в шаблне повторения события, считанного из БД, не соответсвует параметрам созданного события (ik_repeat_pattern = ' + tempDS.FieldByName('ik_repeat_pattern').AsString + ')');
                  tempDS.Close;

                  tempDS.CommandText:= 'SELECT * FROM Relation_event_plan_nagr WHERE ik_prepod_plan in (' + fPrepodPlanIKList + ')';
                  tempDS.Open;
                  Check(tempDS.Locate('ik_event', tempEvent.EventIK, [loPartialKey]), 'Для события не были сохранены связи с ik_prepod_plan в таблице Relation_event_plan_nagr');
                  tempDS.Close;

                  FreeAndNil(tempEvent);
                  inc(curPart);
                  if curPart >= fFacLessonShedule.PartCount then
                  begin
                    curPart:= 0;
                    inc(curDate);
                    if DayOfWeek(fFacLessonShedule.DefaultSemLengthInfo.SemStart + curDate) = 1 then
                      inc(curDate);
                  end;
                  cuDS.Next;
                end;
                cuDS.Close;
                vnDS.Next;
              end;
              vnDS.Close;
              vzDS.Next;
            end;
            vzDS.Close;
            potokDS.Next;
          end;
          potokDS.Close;
          discDS.Next;
        end;
        discDS.Close;
        workTypeDS.Next;
      end;
      workTypeDS.Close;
      tabNDS.Next;
    end;
    tabNDS.Close;
  end;
finally
  if tempDS.Active then tempDS.Close;
  tempDS.Free;
  if tabNDS.Active then tabNDS.Close;
  tabNDS.Free;
  if workTypeDS.Active then workTypeDS.Close;
  workTypeDS.Free;
  if discDS.Active then discDS.Close;
  discDS.Free;
  if potokDS.Active then potokDS.Close;
  potokDS.Free;
  if vzDS.Active then vzDS.Close;
  vzDS.Free;
  if vnDS.Active then vnDS.Close;
  vnDS.Free;
  if cuDS.Active then cuDS.Close;
  cuDS.Free;
  if Assigned(fFacLessonShedule) then FreeAndNil(fFacLessonShedule);
end;     }
end;

procedure TLessonScheduleComponentFunctionsTest.TestReadDepEventShedule;
var
  fDepEventShedule: TDayDepLessonSheduleGrid;
  tempDS: TADODataSet;
  a: integer;
begin
try
  fDepEventShedule:= TDayDepLessonSheduleGrid.Create(365, 32, nil);
  Check(fDepEventShedule <> nil, 'Не удалось создать объект TDayDepLessonSheduleGrid');
  fDepEventShedule.ReadShedule;
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  tempDS.CommandText:= 'SELECT count(iTab_n) as teacher_count FROM Relation_kafedra_prep WHERE ik_kaf ' + IntToStr(fDepEventShedule.KafedraIK);
  tempDS.Open;
  a:= tempDS.FieldByName('teacher_count').AsInteger;
  tempDS.Close;
  Check(fDepEventShedule.Col = a, 'Количество преподавателей, отображенных в расписании не соответсвует количетсву преподавателей, работающих на кафедре');
  tempDS.CommandText:= 'SELECT count(ik_event_type) as part_count FROM SheduleEventType';
  tempDS.Open;
  a:= tempDS.FieldByName('part_count').AsInteger;
  tempDS.Close;
  Check(fDepEventShedule.Row = a*6, 'Количество пар, отображаемое в расписании не соответсвует количеству пар, которое хранится в системе');
finally
  if Assigned(tempDS) then
  begin
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
  end;
  if Assigned(fDepEventShedule) then fDepEventShedule.Free;
end;
end;

procedure TLessonScheduleComponentFunctionsTest.TestReadFacEventShedule;
begin

end;


procedure TScheduleEventClassTest.TestLazyLoad;
begin

end;

procedure TScheduleEventClassTest.TestRecurrenceOfScheduleEvent;
var
  kafedraIK, yearIK, scheduleIK, roomIK: integer;
  tempDS: TADODataSet;
  tempEvent: TSheduleEvent;
  secPartStartTime, secPartStopTime, firstPartStartTime, firstPartStopTime, thirdPartStartTime, thirdPartStopTime: TDateTime;
begin
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  try
 { tempDS.CommandText:= 'SELECT ik_kaf FROM kafedra WHERE cshort_name_kaf = ''ИСТ''';
  tempDS.Open;
  Check(tempDS.RecordCount > 0, 'В базе данных не найдена кафедра "ИСТ"');
  kafedraIK:= tempDS.FieldByName('ik_kaf').AsInteger;
  tempDS.Close;
  tempDS.CommandText:= 'SELECT ik_year_uch_pl FROM Year_uch_pl WHERE year_value = 2008';
  tempDS.Open;
  Check(tempDS.RecordCount > 0, 'В базе данных ней найдена запись, соответсвующая 2008-2009 году обучения');
  yearIK:= tempDS.FieldByName('ik_year_uch_pl').AsInteger;
  tempDS.Close;
  tempDS.CommandText:= 'SELECT ik_shedule FROM Shedule WHERE (ik_year = ' + IntToStr(yearIK) + ') and (ik_sem_type = 1)';
  tempDS.Open;
  Check(tempDS.RecordCount > 0, 'В базе данных не найдено расписание на осенний семестр 2008-2009 учебного года');
  scheduleIK:= tempDS.FieldByName('ik_shedule').AsInteger;
  tempDS.Close;
  tempDS.CommandText:= 'SELECT ik_room FROM Room WHERE (cName_room = ''507'') and (ik_campus = (SELECT ik_campus FROM Campus WHERE cName_campus = ''К''))';
  tempDS.Open;
  Check(tempDS.RecordCount > 0, 'В базе данных не найдена аудитория "507К"');
  roomIK:= tempDS.FieldByName('ik_room').AsInteger;
  tempDS.Close; }

    // загрузим время начала и окончания пар, которые будут проверяться
    tempDS.CommandText:= 'SELECT dEvent_start, dEvent_stop FROM SheduleEventType WHERE ik_event_type = 2';
    tempDS.Open;
    Check(tempDS.RecordCount > 0, 'В базе данных ней найдена запись, соответсвующая 2-й паре');
    secPartStartTime:= tempDS.FieldByName('dEvent_start').AsDateTime;
    secPartStopTime:= tempDS.FieldByName('dEvent_stop').AsDateTime;
    tempDS.Close;
    tempDS.CommandText:= 'SELECT dEvent_start, dEvent_stop FROM SheduleEventType WHERE ik_event_type = 1';
    tempDS.Open;
    Check(tempDS.RecordCount > 0, 'В базе данных ней найдена запись, соответсвующая 1-й паре');
    firstPartStartTime:= tempDS.FieldByName('dEvent_start').AsDateTime;
    firstPartStopTime:= tempDS.FieldByName('dEvent_stop').AsDateTime;
    tempDS.Close;

    tempDS.CommandText:= 'SELECT dEvent_start, dEvent_stop FROM SheduleEventType WHERE ik_event_type = 3';
    tempDS.Open;
    Check(tempDS.RecordCount > 0, 'В базе данных ней найдена запись, соответсвующая 3-й паре');
    thirdPartStartTime:= tempDS.FieldByName('dEvent_start').AsDateTime;
    thirdPartStopTime:= tempDS.FieldByName('dEvent_stop').AsDateTime;
    tempDS.Close;

  {tempDS.CommandText:= 'SELECT TOP 1 ik_prepod_plan, ik_form_ed, cpn.ik_disc, cpn.ik_vid_zanyat, cpn.ik_vid_nagruzki, ik_calc_unit, ik_id_prepod ' +
      'FROM Plan_nagr INNER JOIN Content_plan_nagr cpn ON Plan_nagr.ik_plan_nagr = cpn.ik_plan_nagr ' +
      'INNER JOIN Prepod_plan_nagr ppn ON cpn.ik_content_plan_nagr = ppn.ik_content_plan_nagr ' +
      'WHERE (Plan_nagr.ik_kaf = ' + IntToStr(kafedraIK) + ') and (Plan_nagr.ik_year = '+ IntToStr(yearIK) + ') and (Plan_nagr.ik_sem_type = 1) and ' +
      '(cpn.ik_vid_zanyat in (SELECT ik_vid_zanyat FROM vid_zaniat WHERE iK_type_vz = 3))';
  tempDS.Open;
  Check(tempDS.RecordCount > 0, 'В базе данных не найдено ни одной записи в плане учебной нагрузки кафедры "ИСТ" на осенний семестр 2008-2009 учебного года');
  }

    // создадим событие
    tempEvent:= TSheduleEvent.Create;
    tempEvent.ParrentEventIK:= 0;

    // укажем дату начала повторений и время проведения события
    tempEvent.BeginDate:= EncodeDate(2008, 9, 2);   //добавляем пару, которая начнет повторение со 02.09.09
    TSheduleController.MainFunctions.UnionDateAndTime(tempEvent.BeginDate, secPartStartTime, secPartStopTime);
    tempEvent.Start:= secPartStartTime;
    tempEvent.Stop:= secPartStopTime;
    tempEvent.EventType:= 2;

    // событие не является исключением
    tempEvent.IsException:= false;

    // укажем шаблон повторения и зададим его параметры
    tempEvent.RepeatPattern:= TWeekRepeatPattern.Create;
    tempEvent.RepeatPattern.RepeatPattenIK:= -1;
    tempEvent.RepeatPattern.RepeatType:= 2;
    tempEvent.RepeatPattern.RepeatFrequency:= 2;
    tempEvent.RepeatPattern.RepeatMask:= '_3____';
    tempEvent.RepeatPattern.RepeatLimitType:= 3;
    tempEvent.RepeatPattern.EndDateOfRepeat:= EncodeDate(2008, 12, 27);

 { tempEvent.SheduleIK:= scheduleIK;
  tempEvent.KafedraIK:= kafedraIK;
  tempEvent.FormEdIK:= tempDS.FieldByName('ik_form_ed').AsInteger;
  tempEvent.PlanTeacherIK:= tempDS.FieldByName('ik_id_prepod').AsInteger;
  tempEvent.DiscIK:= tempDS.FieldByName('ik_disc').AsInteger;
  tempEvent.VidZanyatIK:= tempDS.FieldByName('ik_vid_zanyat').AsInteger;
  tempEvent.VidNagruzkiIK:= tempDS.FieldByName('ik_vid_nagruzki').AsInteger;
  tempEvent.CalcUnitIK:= tempDS.FieldByName('ik_calc_unit').AsInteger;
  tempEvent.RoomIK:= roomIK;
  tempEvent.TeacherIK:= tempDS.FieldByName('ik_id_prepod').AsInteger;    }

    // проверим выполняется ли событие на 2-й паре 20.08.2008, если пара выполняется, то IsOccured вернет либо ссылку на само событие
    // либо ссылку на исключение этого события, которое происходит в это время
    TSheduleController.MainFunctions.UnionDateAndTime(EncodeDate(2008, 8, 20), secPartStartTime, secPartStopTime);
    Check(tempEvent.IsOccured(secPartStartTime, secPartStopTime) = nil, 'Пара выполнилась 20.08.08');

    // проверим выполняется ли событие на 2-й паре 01.09.2008
    TSheduleController.MainFunctions.UnionDateAndTime(EncodeDate(2008, 9, 1), secPartStartTime, secPartStopTime);
    Check(tempEvent.IsOccured(secPartStartTime, secPartStopTime) = nil, 'Пара выполнилась 01.09.08');

    // проверим выполняется ли событие на 1-й паре 02.09.2008
    TSheduleController.MainFunctions.UnionDateAndTime(EncodeDate(2008, 9, 2), firstPartStartTime, firstPartStopTime);
    Check(tempEvent.IsOccured(firstPartStartTime, firstPartStopTime) = nil, 'Пара выполнилась на 1-й паре 02.09.08');

    // проверим выполняется ли событие на 2-й паре 02.09.2008
    TSheduleController.MainFunctions.UnionDateAndTime(EncodeDate(2008, 9, 2), secPartStartTime, secPartStopTime);
    Check(tempEvent.IsOccured(secPartStartTime, secPartStopTime) <> nil, 'Пара не выполнилась на 2-й паре 02.09.08');

    // проверим выполняется ли событие на 3-й паре 02.09.2008
    TSheduleController.MainFunctions.UnionDateAndTime(EncodeDate(2008, 9, 2), thirdPartStartTime, thirdPartStopTime);
    Check(tempEvent.IsOccured(thirdPartStartTime, thirdPartStopTime) = nil, 'Пара выполнилась на 4-й паре 02.09.08');

    // проверим выполняется ли событие на 2-й паре 09.09.2008
    TSheduleController.MainFunctions.UnionDateAndTime(EncodeDate(2008, 9, 9), secPartStartTime, secPartStopTime);
    Check(tempEvent.IsOccured(secPartStartTime, secPartStopTime) = nil, 'Пара выполнилась 09.09.08');

    // проверим выполняется ли событие на 2-й паре 16.09.2008
    TSheduleController.MainFunctions.UnionDateAndTime(EncodeDate(2008, 9, 16), secPartStartTime, secPartStopTime);
    Check(tempEvent.IsOccured(secPartStartTime, secPartStopTime) <> nil, 'Пара не выполнилась 16.09.08');

    // проверим выполняется ли событие на 2-й паре 18.09.2008
    TSheduleController.MainFunctions.UnionDateAndTime(EncodeDate(2008, 9, 18), secPartStartTime, secPartStopTime);
    Check(tempEvent.IsOccured(secPartStartTime, secPartStopTime) = nil, 'Пара выполнилась 18.09.08');

    // проверим выполняется ли событие на 2-й паре 11.11.2008
    TSheduleController.MainFunctions.UnionDateAndTime(EncodeDate(2008, 11, 11), secPartStartTime, secPartStopTime);
    Check(tempEvent.IsOccured(secPartStartTime, secPartStopTime) <> nil, 'Пара не выполнилась 11.11.08');

    // проверим выполняется ли событие на 2-й паре 18.11.2008
    TSheduleController.MainFunctions.UnionDateAndTime(EncodeDate(2008, 11, 18), secPartStartTime, secPartStopTime);
    Check(tempEvent.IsOccured(secPartStartTime, secPartStopTime) = nil, 'Пара выполнилась 18.11.08');

    // проверим выполняется ли событие на 2-й паре 23.12.2008
    TSheduleController.MainFunctions.UnionDateAndTime(EncodeDate(2008, 12, 23), secPartStartTime, secPartStopTime);
    Check(tempEvent.IsOccured(secPartStartTime, secPartStopTime) <> nil, 'Пара не выполнилась 23.12.08');

    // проверим выполняется ли событие на 2-й паре 30.12.2008
    TSheduleController.MainFunctions.UnionDateAndTime(EncodeDate(2008, 12, 30), secPartStartTime, secPartStopTime);
    Check(tempEvent.IsOccured(secPartStartTime, secPartStopTime) = nil, 'Пара выполнилась 30.12.08');
    
  finally
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
    tempEvent.Free;
  end;
end;

procedure TAccountComponentTest.GetCampusDistance;
var
  tempDS: TADODataSet;
  fCampusDistanceInfo: TObjectList;
  i, j, a, b: integer;
begin
  { Проверяем процесс управления расстоянием между корпусами:
    получаем матрицу расстояний напрямую из БД
    получаем матрицу расстояний с помощью контроллера
    проверяем соответсвие полученных матриц
    вносим в нее изменения
    сохраняем матрицу
    проверяем корректность сохранения }
try
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  tempDS.CommandText:= 'SELECT * FROM Campus';
  tempDS.Open;
  a:= tempDS.RecordCount;
  tempDS.Close;

  fCampusDistanceInfo:= TSheduleController.AccountFunctions.GetCampusDistance;
  Check(fCampusDistanceInfo <> nil, 'Контроллер не загрузил матрицу расстояний');
  Check(fCampusDistanceInfo.Count = a, 'Количество корпусов в матрице расстояний, загруженной контроллером, не равно количество корпусов, которые хранятся в системе');
  tempDS.CommandText:= 'SELECT * FROM Campus_distance';
  for I := 0 to fCampusDistanceInfo.Count - 1 do
  begin
    Check(TCampusDistanceInfo(fCampusDistanceInfo[i]).CampusName <> '', 'Контроллер не прочитал название одного из корпусов');
    Check(TCampusDistanceInfo(fCampusDistanceInfo[i]).DistanceCount = a, 'Количество расстояний для корпуса ' + TCampusDistanceInfo(fCampusDistanceInfo[i]).CampusName + ' не равно количеству копусов, которое хранится в системе');
    b:= 0;
    for j := 0 to TCampusDistanceInfo(fCampusDistanceInfo[i]).DistanceCount - 1 do
      if TCampusDistanceInfo(fCampusDistanceInfo[i]).Distance[j] <> 0 then
        inc(b);
    tempDS.Filter:= 'ik_first_campus = ' +  IntToStr(TCampusDistanceInfo(fCampusDistanceInfo[i]).CampusIK);
    tempDS.Open;
    Check(tempDS.RecordCount = b, 'Количество ненулевых расстояний, возращенных контроллером, не соответсвует количеству расстояний, которое хранится в БД');
    tempDS.Close;
  end;
finally
  if Assigned(tempDS) then
  begin
    if tempDS.Active then tempDS.Close;
    tempDS.Free;
  end;
  if Assigned(fCampusDistanceInfo) then fCampusDistanceInfo.Free;
end;
end;

procedure TAccountComponentTest.SaveCampusDistance;
var
  tempDS: TADODataSet;
  fCampusDistanceInfo: TObjectList;
  i, j: integer;
begin
  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
try
  //чистим матрицу расстояний в базе
  tempDS.CommandText:= 'SELECT * FROM Campus_distance';
  tempDS.Open;
  while not tempDS.Eof do
    tempDS.Delete;
  tempDS.UpdateBatch();
  tempDS.Close;
  tempDS.Open;
  Check(tempDS.RecordCount = 0, 'Результаты удаления записей из матрицы расстояний не были сохранены в процессе пакетного обновления');
  tempDS.Close;

  //подгружаем матрицу
  fCampusDistanceInfo:= TSheduleController.AccountFunctions.GetCampusDistance;
  Check(fCampusDistanceInfo <> nil, 'Контроллер не вернул матрицу расстояний');
  for I := 0 to fCampusDistanceInfo.Count - 1 do
    for j := 0 to TCampusDistanceInfo(fCampusDistanceInfo[i]).DistanceCount - 1 do
      if j <> i then
        TCampusDistanceInfo(fCampusDistanceInfo[i]).Distance[j]:= random(9) + 1;
  Check(TSheduleController.AccountFunctions.SaveCampusDistance(fCampusDistanceInfo), 'Контроллер не смог сохранить матрицу расстояний');
  tempDS.Filter:= '';
  tempDS.Open;
  for I := 0 to fCampusDistanceInfo.Count - 1 do
    for j := 0 to TCampusDistanceInfo(fCampusDistanceInfo[i]).DistanceCount - 1 do
      if tempDS.Locate('ik_first_campus; ik_second_campus', VarArrayOf([TCampusDistanceInfo(fCampusDistanceInfo[i]).CampusIK, TCampusDistanceInfo(fCampusDistanceInfo[j]).CampusIK]), [loPartialKey]) then
      begin
        Check(i <> j, 'Контроллер сохранил В БД расстояние между одним и тем же корпусом');
        Check(tempDS.FieldByName('distance').AsInteger = TCampusDistanceInfo(fCampusDistanceInfo[i]).Distance[j], 'Контроллер некорректно сохранил расстояние между корпусами ' + TCampusDistanceInfo(fCampusDistanceInfo[i]).CampusName + ' и ' + TCampusDistanceInfo(fCampusDistanceInfo[j]).CampusName);
      end
      else Check(i = j, 'Расстояние между корпусами ' + TCampusDistanceInfo(fCampusDistanceInfo[i]).CampusName + ' и ' + TCampusDistanceInfo(fCampusDistanceInfo[j]).CampusName + ' не было сохранено контроллером в БД');
  tempDS.Close;
finally
  if tempDS.Active then tempDS.Close;
  tempDS.Free;
  if Assigned(fCampusDistanceInfo) then fCampusDistanceInfo.Free;
end;
end;

procedure TAccountComponentTest.SaveSemesterLength;
begin

end;

procedure TAccountComponentTest.ControlRoomFund;
begin
  { Проверяем процесс управления аудиторного фонда:
    подгружаем текущий фонд кафедры ИСТ
    подгружаем фонд при помощи контроллера
    проверяем соответсвие
    удаляем аудиторию при помощи контроллера
    проверяем то, что она удалилась прямым запросом
    добавляем аудиторию через контроллер
    проверяем то, что она добавилась
    подгружаем фонд за предыдущий семестр
    копируем его при помощи контроллера в текущий семестр
    проверяем корректность копирования }
end;

procedure TAccountComponentTest.GetSemesterLength;
begin
  { Проверяем процесс управления продолжительностью семестров:
    получаем из БД данные по какому-нибудь семестру
    получаем данные по этому же семестру при помощи контроллера
    проверяем соответсвие
    изменяем данные
    сохраняем при помощи контроллера
    проверяем корректность сохранения }

end;

{ TConstraintControllerTest }

procedure TConstraintComponentTest.TestRoomConstraint;
begin

end;

procedure TConstraintComponentTest.TestTeacherTimeConstraint;
begin

end;

procedure TExamScheduleComponentFunctionsTest.TestAddSheduleExam;
{var
  tempDS, tabNDS, workTypeDS, discDS, potokDS, vzDS, vnDS, cuDS: TADODataSet;
  formEdIK, roomIK, campusIK: Variant;
  i, curDate: integer;
  curHour: TDateTime;
  tempExam: TSheduleExamination;
  y,m,d,h,min,s: word;
  fPlanNagrIKList, fContentPlanNagrIKList, fPrepodPlanIKList: string;
  fFacExamShedule: TFacExamSheduleGrid;                                    }
begin
  { Заполняем расписание на осенний семестр 2006 года на факультете ФИТ (ID = 7), кафедра ИСТ (ID = 365):

  }
{  tempDS:= TGeneralController.Instance.GetNewADODataSet(false);
  tabNDS:= TGeneralController.Instance.GetNewADODataSet(false);
  workTypeDS:= TGeneralController.Instance.GetNewADODataSet(false);
  discDS:= TGeneralController.Instance.GetNewADODataSet(false);
  potokDS:= TGeneralController.Instance.GetNewADODataSet(false);
  vzDS:= TGeneralController.Instance.GetNewADODataSet(false);
  vnDS:= TGeneralController.Instance.GetNewADODataSet(false);
  cuDS:= TGeneralController.Instance.GetNewADODataSet(false);

try
  tempDS.CommandText:= 'SELECT ik_shedule, d_sem_start FROM Shedule WHERE (ik_year = 14) and (ik_sem_type = 1)';
  tempDS.Open;
  Check(tempDS.RecordCount > 0, '');
  fFacExamShedule:= TFacExamSheduleGrid.Create(7, tempDS.FieldByName('ik_shedule').AsInteger, nil);
  tempDS.Close;
  fFacExamShedule.ReadShedule;
  Check(fFacExamShedule.DefaultSemLengthInfo <> nil, 'В TDayFacLessonSheduleGrid не указана дата начала семестра');
  curDate:= 1;
  curHour:= fFacExamShedule.DefaultSemLengthInfo.WorkTimeStart;
  for I := 0 to fFacExamShedule.GroupCount - 1 do
  begin
    formEdIK:= TSheduleController.Instance.GetFormEdListForAddEvent(@tempDS, fFacExamShedule.Groups[i].GroupIK, fFacExamShedule.SheduleIK, 365, false, false, false, NULL);
    tempDS.Close;
    if formEdIK = NULL then continue;
    TSheduleController.Instance.GetTeacherListForAddEvent(@tabNDS, fFacExamShedule.Groups[i].GroupIK, fFacExamShedule.SheduleIK, 365, formEdIK, fPlanNagrIKList, false, false, false, NULL);
    Check(tabNDS.RecordCount > 0, 'При вызове GetTeacherListForAddEvent не подгружено ни одного преподавателя');
    Check(fPlanNagrIKList <> '', 'GetTeacherListForAddEvent вернула пустой список планов ученбной нагрузки fPlanNagrIKList');
    while not tabNDS.Eof do
    begin
      TSheduleController.Instance.GetTeacherWorkTypeListForAddEvent(@workTypeDS, fFacExamShedule.Groups[i].GroupIK, tabNDS.FieldByName('iTab_n').AsInteger, fPlanNagrIKList, false, false, false, NULL);
      while not workTypeDS.Eof do
      begin
        TSheduleController.Instance.GetDiscListForAddEvent(@discDS, fFacExamShedule.Groups[i].GroupIK, workTypeDS.FieldByName('ik_id_prepod').AsInteger, fPlanNagrIKList, false, false, false, NULL);
        while not discDS.Eof do
        begin
          TSheduleController.Instance.GetPotokListForAddEvent(@potokDS, fFacExamShedule.Groups[i].GroupIK, workTypeDS.FieldByName('ik_id_prepod').AsInteger, discDS.FieldByName('ik_disc').AsInteger, fPlanNagrIKList, false, false, false, NULL);
          while not potokDS.Eof do
          begin
            TSheduleController.Instance.GetVidZanyatListForAddEvent(@vzDS, fFacExamShedule.Groups[i].GroupIK, workTypeDS.FieldByName('ik_id_prepod').AsInteger, discDS.FieldByName('ik_disc').AsInteger,
              potokDS.FieldByName('ik_potok').AsInteger, fPlanNagrIKList, false, false, false, NULL);
            while not vzDS.Eof do
            begin
              TSheduleController.Instance.GetVidNagruzkiListForAddEvent(@vnDS, fFacExamShedule.Groups[i].GroupIK, workTypeDS.FieldByName('ik_id_prepod').AsInteger, discDS.FieldByName('ik_disc').AsInteger,
                potokDS.FieldByName('ik_potok').AsInteger, vzDS.FieldByName('ik_vid_zanyat').AsInteger, vzDS.FieldByName('ik_decompose_type').AsInteger, fPlanNagrIKList, fContentPlanNagrIKList, false, false, NULL);
              Check(fContentPlanNagrIKList <> '', 'GetVidNagruzkiListForAddEvent вернула пустой список записей плана нагрузки fContentPlanNagrIKList');
              while not vnDS.Eof do
              begin
                TSheduleController.Instance.GetCalcUnitListForAddEvent(@cuDS, fFacExamShedule.Groups[i].GroupIK, workTypeDS.FieldByName('ik_id_prepod').AsInteger, vzDS.FieldByName('ik_decompose_type').AsInteger, vnDS.FieldByName('ik_vid_nagruzki').AsInteger,
                  fContentPlanNagrIKList, '', false, false, NULL);
                while not cuDS.Eof do
                begin
                  TSheduleController.Instance.GetCampusForPrepodPlanIK(@tempDS, vnDS.FieldByName('ik_vid_nagruzki').AsInteger, cuDS.FieldByName('ik_calc_unit').AsInteger, fFacExamShedule.SheduleIK, fContentPlanNagrIKList, fPrepodPlanIKList, 7);
                  Check(tempDS.Locate('CName_campus', 'К', [loPartialKey]), 'В списке корпусов не найден корпус К');
                  campusIK:= tempDS.FieldByName('ik_campus').AsInteger;
                  tempDS.Close;
                  TSheduleController.Instance.GetRoomsForPrepodPlanIK(@tempDS, campusIK, fFacExamShedule.SheduleIK, fPrepodPlanIKList, '', NULL);
                  roomIK:= tempDS.FieldByName('ik_room').AsInteger;
                  tempDS.Close;
                  tempExam:= TSheduleExamination.Create;
                  tempExam.CalcUnitIK:= cuDS.FieldByName('ik_calc_unit').AsInteger;
                  tempExam.PlanTeacherIK:= workTypeDS.FieldByName('ik_id_prepod').AsInteger;
                  tempExam.TeacherIK:= workTypeDS.FieldByName('ik_id_prepod').AsInteger;
                  tempExam.DiscIK:= discDS.FieldByName('ik_disc').AsInteger;
                  tempExam.RoomIK:= roomIK;
                  tempExam.VidZanyatIK:= vzDS.FieldByName('ik_vid_zanyat').AsInteger;
                  tempExam.VidNagruzkiIK:= vnDS.FieldByName('ik_vid_nagruzki').AsInteger;

                  DecodeTime(curHour, h, min, s, s);
                  tempExam.ExamDate:= fFacExamShedule.DefaultSemLengthInfo.SessionStart + curDate;
                  DecodeDate(tempExam.ExamDate, y, m, d);
                  tempExam.Start:= EncodeDateTime(y,m,d,h,min,s,s);
                  tempExam.Stop:= EncodeDateTime(y,m,d,h+2,min,s,s);
                  Check(TSheduleController.Instance.SaveExam(tempExam, nil, fFacExamShedule, fPrepodPlanIKList) = true, 'Контроллер не смог сохранить событие');

                  //проверяем напрямую из БД
                  tempDS.CommandText:= 'SELECT * FROM SheduleExamination WHERE ik_examination = ' + IntToStr(tempExam.ExamIK);
                  tempDS.Open;
                  Check(tempDS.RecordCount > 0, 'Событие с указанным ID (' + IntToStr(tempExam.ExamIK) + ' не обнаружено в БД');
                  Check(tempDS.FieldByName('ik_shedule').AsInteger = fFacExamShedule.SheduleIK, 'ID расписания у события, считанного из БД, не соответсвует ID расписания у TDayFacLessonSheduleGrid (ik_examination = ' + tempDS.FieldByName('ik_examination').AsString + ')');
                  Check(tempDS.FieldByName('ik_id_prepod').AsInteger = tempExam.TeacherIK, 'ID преподавателя у события, считанного из БД, не соответсвует ID преподавателя у созданного события (ik_examination = ' + tempDS.FieldByName('ik_examination').AsString + ')');
                  Check(tempDS.FieldByName('ik_room').AsInteger = tempExam.RoomIK, 'ID аудитории у события, считанного из БД, не соответсвует ID аудитории у созданного события (ik_examination = ' + tempDS.FieldByName('ik_examination').AsString + ')');
                  Check(tempDS.FieldByName('dt_time_start').AsDateTime = tempExam.Start, 'Время начала экзамена, считанного из БД, не соответсвует дате начала созданного события (ik_examination = ' + tempDS.FieldByName('ik_examination').AsString + ')');
                  Check(tempDS.FieldByName('dt_time_stop').AsDateTime = tempExam.Stop, 'Время окончания экзамена, считанного из БД, не соответсвует дате начала созданного события (ik_examination = ' + tempDS.FieldByName('ik_examination').AsString + ')');
                  tempDS.Close;

                  tempDS.CommandText:= 'SELECT * FROM Relation_exam_plan_nagr WHERE ik_prepod_plan in (' + fPrepodPlanIKList + ')';
                  tempDS.Open;
                  Check(tempDS.Locate('ik_examination', tempExam.ExamIK, [loPartialKey]), 'Для события не были сохранены связи с ik_prepod_plan в таблице Relation_exam_plan_nagr');
                  tempDS.Close;

                  DecodeTime(fFacExamShedule.DefaultSemLengthInfo.WorkTimeEnd, y, m, d, d);
                  if (h + 5 > y) then
                  begin
                    curHour:= fFacExamShedule.DefaultSemLengthInfo.WorkTimeStart;
                    DecodeTime(curHour, h, min, s, s);
                    inc(curDate);
                    if DayOfWeek(fFacExamShedule.DefaultSemLengthInfo.SessionStart + curDate) = 1 then inc(curDate);
                  end
                  else curHour:= EncodeTime(h + 3, min, s, s);

                  FreeAndNil(tempExam);
                  cuDS.Next;
                end;
                cuDS.Close;
                vnDS.Next;
              end;
              vnDS.Close;
              vzDS.Next;
            end;
            vzDS.Close;
            potokDS.Next;
          end;
          potokDS.Close;
          discDS.Next;
        end;
        discDS.Close;
        workTypeDS.Next;
      end;
      workTypeDS.Close;
      tabNDS.Next;
    end;
    tabNDS.Close;
  end;
finally
  if tempDS.Active then tempDS.Close;
  tempDS.Free;
  if tabNDS.Active then tabNDS.Close;
  tabNDS.Free;
  if workTypeDS.Active then workTypeDS.Close;
  workTypeDS.Free;
  if discDS.Active then discDS.Close;
  discDS.Free;
  if potokDS.Active then potokDS.Close;
  potokDS.Free;
  if vzDS.Active then vzDS.Close;
  vzDS.Free;
  if vnDS.Active then vnDS.Close;
  vnDS.Free;
  if cuDS.Active then cuDS.Close;
  cuDS.Free;
  if Assigned(fFacExamShedule) then FreeAndNil(fFacExamShedule);
end;    }
end;

procedure TExamScheduleComponentFunctionsTest.TestReadDepExamShedule;
begin

end;

procedure TExamScheduleComponentFunctionsTest.TestReadFacExamShedule;
begin

end;

function LessonScheduleComponentClassesTest: ITestSuite;
begin
  Result:= TTestSuite.Create('Тестирование дефектов классов компонента управления расписанием аудиторных занятий');
  Result.AddSuite(TScheduleEventClassTest.Suite);
  Result.AddSuite(TLessonScheduleClassTest.Suite);
  Result.AddSuite(TDepLessonScheduleClassTest.Suite);
  Result.AddSuite(TFacLessonScheduleClassTest.Suite);
end;

function LessonScheduleComponentDefectTest: ITestSuite;
begin
  Result:= TTestSuite.Create('Тестирование дефектов компонента управления расписанием аудиторных занятий');
  Result.AddSuite(TLessonScheduleComponentFunctionsTest.Suite);
  Result.AddSuite(LessonScheduleComponentClassesTest);
end;

function ExamScheduleComponentClassesTest: ITestSuite;
begin
  Result:= TTestSuite.Create('Тестирование дефектов классов компонента управления расписанием экзаменов');
  Result.AddSuite(TScheduleExamClassTest.Suite);
  Result.AddSuite(TExamScheduleClassTest.Suite);
end;

function ExamScheduleComponentDefectTest: ITestSuite;
begin
  Result:= TTestSuite.Create('Тестирование дефектов компонента управления расписанием экзаменов');
  Result.AddSuite(TExamScheduleComponentFunctionsTest.Suite);
  Result.AddSuite(ExamScheduleComponentClassesTest);
end;

function ScheduleComponentDefectTest: ITestSuite;
begin
  Result:= TTestSuite.Create('Тестирование дефектов компонентов подсистемы "Расписание"');
  Result.AddSuite(TScheduleControllersTest.Suite);
  Result.AddSuite(TConstraintComponentTest.Suite);
  Result.AddSuite(TAccountComponentTest.Suite);
  Result.AddSuite(LessonScheduleComponentDefectTest);
  Result.AddSuite(ExamScheduleComponentDefectTest);
end;

{ TScheduleControllersTest }

procedure TScheduleControllersTest.TestAccountController;
begin

end;

procedure TScheduleControllersTest.TestConstraintController;
begin

end;

procedure TScheduleControllersTest.TestMainController;
begin

end;

{ TLessonScheduleClassTest }

procedure TLessonScheduleClassTest.TestGoToPeriod;
begin

end;

procedure TLessonScheduleClassTest.TestPartsListLoad;
begin

end;

{ TDepLessonScheduleClassTest }

procedure TDepLessonScheduleClassTest.TestTeachersListLoad;
begin

end;

{ TFacLessonScheduleClassTest }

procedure TFacLessonScheduleClassTest.TestGroupsListLoad;
begin

end;

{ TScheduleExamClassTest }

procedure TScheduleExamClassTest.TestLazyLoad;
begin

end;

{ TExamScheduleClassTest }

procedure TExamScheduleClassTest.TestSessionDatesLoad;
begin

end;


{ TLoadPlanNagrInScheduleTest }

procedure TLoadPlanNagrInScheduleTest.TestLoadAuditoriumPlanNagrForGroup;
begin

end;

procedure TLoadPlanNagrInScheduleTest.TestLoadAuditoriumPlanNagrForTeacher;
begin

end;

procedure TLoadPlanNagrInScheduleTest.TestLoadExamPlanNagrForGroup;
begin

end;

procedure TLoadPlanNagrInScheduleTest.TestLoadExamPlanNagrForTeacher;
begin

end;

{ TScheduleCrossComponentTest }

procedure TScheduleCrossComponentTest.CheckRoomUseConstraintTest;
begin

end;

procedure TScheduleCrossComponentTest.CheckTeacherAvailTimeConstraintTest;
begin

end;

end.
