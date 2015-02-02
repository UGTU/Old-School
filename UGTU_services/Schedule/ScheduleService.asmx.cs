using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using DDay.iCal;
using DDay.iCal.Serialization.iCalendar;
using Schedule.DataTransferObjects;
using System.IO;

namespace Schedule
{
    /// <summary>
    /// Summary description for ScheduleService
    /// </summary>
    [WebService(Namespace = "http://services.ist.ugtu.net/", Name = "Сервис предоставления расписания", Description = "Сервис для предоставления расписания аудиторных занятий и экзаменов в УГТУ в формате iCalendar.")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]

    public class ScheduleService : System.Web.Services.WebService
    {

        # region GeneralMethods

        [WebMethod(Description = "Получает коллекцию факультетов университета", CacheDuration = 86400)]
        public FacInfo[] GetUGTUFaculties()
        {
            using (DataLayer.ScheduleDataDataContext ctx = new DataLayer.ScheduleDataDataContext("Data Source=ugtudb.ugtu.net;Initial Catalog=UGTU;Integrated Security=True"))
            {
                FacInfo[] fiArray = ctx.Schedule_Facs.Select(x =>
                        new FacInfo() { ID = x.Ik_fac, Name = x.Cname_fac, ShortName = x.Cshort_name_fac }).OrderBy(k => k.Name).ToArray();

                return fiArray;
            }

        }

        [WebMethod(Description = "Получает коллекцию специальностей университета", CacheDuration = 86400)]
        public SpecInfo[] GetUGTUSpecialties()
        {
            using (DataLayer.ScheduleDataDataContext ctx = new DataLayer.ScheduleDataDataContext("Data Source=ugtudb.ugtu.net;Initial Catalog=UGTU;Integrated Security=True"))
            {
                SpecInfo[] siArray = ctx.Relation_spec_facs.Select(x =>
                        new SpecInfo() { ID = x.ik_spec_fac, Name = x.Spec_stud.Cname_spec + " (" + x.Fac.Cshort_name_fac + ")" + "(" + x.Spec_stud.Direction.cName_direction + ")" }).Where(p => ctx.Schedule_specs.Select(x => x.ik_spec_fac).ToArray().Contains(p.ID)).OrderBy(k => k.Name).ToArray();

                return siArray;
            }

        }

        [WebMethod(Description = "Получает коллекцию кафедр университета", CacheDuration = 86400)]
        public DepInfo[] GetUGTUDepartments()
        {
            using (DataLayer.ScheduleDataDataContext ctx = new DataLayer.ScheduleDataDataContext("Data Source=ugtudb.ugtu.net;Initial Catalog=UGTU;Integrated Security=True"))
            {
                DepInfo[] diArray = ctx.kafedras.Select(x =>
                        new DepInfo() { ID = x.ik_kaf, Name = x.cname_kaf }).OrderBy(k => k.Name).ToArray();
                return diArray;
            }

        }

        [WebMethod(Description = "Получает коллекцию специальностей факультета", CacheDuration = 86400)]
        public SpecInfo[] GetFacultySpecialties(int facID)
        {
            using (DataLayer.ScheduleDataDataContext ctx = new DataLayer.ScheduleDataDataContext("Data Source=ugtudb.ugtu.net;Initial Catalog=UGTU;Integrated Security=True"))
            {
                SpecInfo[] siArray = ctx.Relation_spec_facs.Where(p => (p.ik_fac == facID)).Select(x =>
                        new SpecInfo() { ID = x.ik_spec_fac, Name = x.Spec_stud.Cname_spec +" ("+x.Spec_stud.Direction.cName_direction+")" }).OrderBy(k => k.Name).ToArray();

                return siArray;
            }

        }

        [WebMethod(Description = "Получает коллекцию кафедр факультета", CacheDuration = 86400)]
        public DepInfo[] GetFacultyDepartments(int facID)
        {
            using (DataLayer.ScheduleDataDataContext ctx = new DataLayer.ScheduleDataDataContext("Data Source=ugtudb.ugtu.net;Initial Catalog=UGTU;Integrated Security=True"))
            {
                DepInfo[] diArray = ctx.kafedras.Where(p => p.ik_fac == facID).Select(x =>
                        new DepInfo() { ID = x.ik_kaf, Name = x.cname_kaf }).OrderBy(k => k.Name).ToArray();
                return diArray;
            }

        }

        [WebMethod(Description = "Получает коллекцию групп специальности", CacheDuration = 86400)]
        public GroupInfo[] GetSpecialtyGroups(int SpecId)
        {
            using (DataLayer.ScheduleDataDataContext ctx = new DataLayer.ScheduleDataDataContext("Data Source=ugtudb.ugtu.net;Initial Catalog=UGTU;Integrated Security=True"))
            {

                return ctx.Grups.Where(p => (p.ik_spec_fac == SpecId) && ((p.DateExit == null) || (p.DateExit > DateTime.Today)) && ((DateTime.Today.Year - ((DateTime)p.DateCreate).Year) < p.Relation_spec_fac.YearObuch)).Select
                    (x => new GroupInfo() { ID = x.Ik_grup, Name = x.Cname_grup, DateOfEnter = (DateTime)x.DateCreate }).OrderBy(k => k.Name).OrderBy(k => k.DateOfEnter).ToArray();
            }
        }

        [WebMethod(Description = "Получает коллекцию преподавателей кафедры", CacheDuration = 86400)]
        public TeacherInfo[] GetDepartmentTeachers(int DepId)
        {
            using (DataLayer.ScheduleDataDataContext ctx = new DataLayer.ScheduleDataDataContext("Data Source=ugtudb.ugtu.net;Initial Catalog=UGTU;Integrated Security=True"))
            {
                // вариант для выбора преподавателей из расписания
                //int[] PrepIKs = ctx.SheduleEvents.Select(p => p.ik_id_prepod).ToArray();
                //int[] TabNums = ctx.Relation_kafedra_preps.AsEnumerable().Where(p => (p.ik_kaf == DepId) && (PrepIKs.Contains(p.ik_id_prepod))).Select(x => x.itab_n).ToArray();

                int[] TabNums = ctx.Relation_kafedra_preps.AsEnumerable().Where(p => (p.ik_kaf == DepId)).Select(x => x.itab_n).ToArray();

                TeacherInfo[] tiArray = ctx.Prepods.Where(p => TabNums.Contains(p.itab_n)).Select(x =>
                                       new TeacherInfo() { TabNum = x.itab_n, Duty = x.PrepodRank.cName_rank, Name = x.Person.Clastname.ToString() + " " + x.Person.Cfirstname.ToString() + " " + x.Person.Cotch.ToString() + " " }).OrderBy(k => k.Name).ToArray();

                return tiArray;
            }

        }

        [WebMethod(Description = "Получает время проведения пары по номеру", CacheDuration = 43200)]
        public LessonInfo GetLessonByNum(int LessonNum)
        {
            using (DataLayer.ScheduleDataDataContext ctx = new DataLayer.ScheduleDataDataContext("Data Source=ugtudb.ugtu.net;Initial Catalog=UGTU;Integrated Security=True"))
            {
                LessonInfo li = ctx.SheduleEventTypes.Where(p => (p.ik_event_type == LessonNum)).Select(x =>
                                       new LessonInfo()
                                       {
                                           ID = x.ik_event_type,
                                           Name = x.cName_event,
                                           Begins = x.dEvent_start,
                                           Ends = x.dEvent_stop
                                       }).Single();
                return li;
            }

        }

        [WebMethod(Description = "Получает время проведения занятий", CacheDuration = 86400)]
        public LessonInfo[] GetUGTULessons()
        {
            using (DataLayer.ScheduleDataDataContext ctx = new DataLayer.ScheduleDataDataContext("Data Source=ugtudb.ugtu.net;Initial Catalog=UGTU;Integrated Security=True"))
            {
                LessonInfo[] liArray = ctx.SheduleEventTypes.Select(x =>
                                       new LessonInfo()
                                       {
                                           ID = x.ik_event_type,
                                           Name = x.cName_event,
                                           Begins = x.dEvent_start,
                                           Ends = x.dEvent_stop
                                       }).ToArray();
                return liArray;
            }

        }

        [WebMethod(Description = "Получает код преподавателя по его логину", CacheDuration = 86400)]
        public decimal GetTeacherCodeByLogin(string login)
        {

            using (DataLayer.ScheduleDataDataContext ctx = new DataLayer.ScheduleDataDataContext("Data Source=ugtudb.ugtu.net;Initial Catalog=UGTU;Integrated Security=True"))
            {
               var res  = ctx.Prepods.FirstOrDefault(x => x.prepLogin == login);
                return res!=null?res.nCode:-1;    
            }
         
        }

        [WebMethod(Description = "Получает группы, которые учит преподаватель в некоором семестре ", CacheDuration = 86400)]
        public GroupInfo[] GetTeacherGroupsByLogin(string login, int SemTypeID, int YearUchPlanID)
        {
            GroupInfo[] res;
            using (DataLayer.ScheduleDataDataContext ctx = new DataLayer.ScheduleDataDataContext("Data Source=ugtudb.ugtu.net;Initial Catalog=UGTU;Integrated Security=True"))
            {
                res = ctx.PPrepodGrupsSELECT(YearUchPlanID, SemTypeID, (int?)GetTeacherCodeByLogin(login)).Select(x=>
                    new GroupInfo()
                    {
                        ID = x.idгруппы,
                        Name = x.название_группы,
                        DateOfEnter = Convert.ToDateTime("01.09."+x.Год_поступления.ToString())
                    }).ToArray();
            }
            return res;
        }

        #endregion

        #region SemesterMethods

        [WebMethod(Description = "Получает данные всех семестров")]
        public SemesterInfo[] GetSemesters()
        {
            using (DataLayer.ScheduleDataDataContext ctx = new DataLayer.ScheduleDataDataContext("Data Source=ugtudb.ugtu.net;Initial Catalog=UGTU;Integrated Security=True"))
            {
                SemesterInfo[] siArray = ctx.Shedules.Where(p => p.d_sem_start != null).Select(x =>
                                       new SemesterInfo()
                                       {
                                           ID = x.ik_shedule,
                                           Type = x.SemesterType.Cname_sem_type,
                                           Years = x.Year_uch_pl.year_value.ToString() + "—" + ((int)x.Year_uch_pl.year_value + 1).ToString(),

                                           BeginDate = (DateTime)x.d_sem_start,
                                           EndDate = (DateTime)x.d_sem_end,
                                           BeginSessionDate = (DateTime)x.d_session_start,
                                           EndSessionDate = (DateTime)x.d_session_end,

                                           BeginDayTime = (DateTime)x.d_work_time_start,
                                           EndDayTime = (DateTime)x.d_work_time_end
                                       }).ToArray();
                return siArray;
            }
        }

        [WebMethod(Description = "Получает данные текущего семестра")]
        public SemesterInfo GetCurrentSemester()
        {
            using (DataLayer.ScheduleDataDataContext ctx = new DataLayer.ScheduleDataDataContext("Data Source=ugtudb.ugtu.net;Initial Catalog=UGTU;Integrated Security=True"))
            {
                int semtype;

                if ((DateTime.Today.Month <= 8) && (DateTime.Today.Month >= 2)) semtype = 2;
                else semtype = 1;

                int yearUp = DateTime.Today.Year;
                if (semtype == 2) yearUp = DateTime.Today.Year - 1;

                SemesterInfo si = ctx.Shedules.Where(p => (p.Year_uch_pl.year_value == yearUp) && (p.ik_sem_type == semtype)).Select(x =>
                                       new SemesterInfo()
                                       {
                                           ID = x.ik_shedule,
                                           Type = x.SemesterType.Cname_sem_type,
                                           Years = x.Year_uch_pl.year_value.ToString() + "—" + ((int)x.Year_uch_pl.year_value + 1).ToString(),

                                           BeginDate = (DateTime)x.d_sem_start,
                                           EndDate = (DateTime)x.d_sem_end,
                                           BeginSessionDate = (DateTime)x.d_session_start,
                                           EndSessionDate = (DateTime)x.d_session_end,

                                           BeginDayTime = (DateTime)x.d_work_time_start,
                                           EndDayTime = (DateTime)x.d_work_time_end
                                       }).Single();

                return si;
            }
        }

        [WebMethod(Description = "Получает данные всех семестров для группы")]
        public SemesterInfo[] GetGroupSemesters(int GroupId)
        {
            using (DataLayer.ScheduleDataDataContext ctx = new DataLayer.ScheduleDataDataContext("Data Source=ugtudb.ugtu.net;Initial Catalog=UGTU;Integrated Security=True"))
            {
                SemesterInfo[] siArray = ctx.Shedules.Where(p => p.d_sem_start != null).Select(x =>
                                       new SemesterInfo()
                                       {
                                           ID = x.ik_shedule,
                                           Type = x.SemesterType.Cname_sem_type,
                                           Years = x.Year_uch_pl.year_value.ToString() + "—" + ((int)x.Year_uch_pl.year_value + 1).ToString(),

                                           BeginDate = (DateTime)x.d_sem_start,
                                           EndDate = (DateTime)x.d_sem_end,
                                           BeginSessionDate = (DateTime)x.d_session_start,
                                           EndSessionDate = (DateTime)x.d_session_end,

                                           BeginDayTime = (DateTime)x.d_work_time_start,
                                           EndDayTime = (DateTime)x.d_work_time_end
                                       }).ToArray();


                int SpecFacId = ctx.Grups.Where(p => p.Ik_grup == GroupId).Select(x =>
                                        x.ik_spec_fac).Single();

                int Grade;
                if (DateTime.Today.Month <= 8) Grade = DateTime.Today.Year - (int)ctx.Grups.Where(p => p.Ik_grup == GroupId).Select(x =>
                                          x.nYear_post).Single();
                else Grade = DateTime.Today.Year - (int)ctx.Grups.Where(p => p.Ik_grup == GroupId).Select(x =>
                                          x.nYear_post).Single() + 1;

                foreach (SemesterInfo si in siArray)
                {

                    if (ctx.Semester_length_exceptions.Where(p => (p.course_number == Grade) && (p.ik_spec_fac == SpecFacId) && (p.ik_shedule == si.ID)).Count() > 0)
                    {
                        si.BeginDate = ctx.Semester_length_exceptions.Where(p => (p.course_number == Grade) && (p.ik_spec_fac == SpecFacId) && (p.ik_shedule == si.ID)).Select(x =>
                                           (DateTime?)x.d_sem_start).First();

                        si.EndDate = ctx.Semester_length_exceptions.Where(p => (p.course_number == Grade) && (p.ik_spec_fac == SpecFacId) && (p.ik_shedule == si.ID)).Select(x =>
                                           (DateTime?)x.d_sem_end).First();

                        si.BeginSessionDate = ctx.Semester_length_exceptions.Where(p => (p.course_number == Grade) && (p.ik_spec_fac == SpecFacId) && (p.ik_shedule == si.ID)).Select(x =>
                                           (DateTime?)x.d_session_start).First();

                        si.EndSessionDate = ctx.Semester_length_exceptions.Where(p => (p.course_number == Grade) && (p.ik_spec_fac == SpecFacId) && (p.ik_shedule == si.ID)).Select(x =>
                                           (DateTime?)x.d_session_end).First();

                        si.BeginDayTime = ctx.Semester_length_exceptions.Where(p => (p.course_number == Grade) && (p.ik_spec_fac == SpecFacId) && (p.ik_shedule == si.ID)).Select(x =>
                                           (DateTime?)x.d_work_time_start).First();

                        si.EndDayTime = ctx.Semester_length_exceptions.Where(p => (p.course_number == Grade) && (p.ik_spec_fac == SpecFacId) && (p.ik_shedule == si.ID)).Select(x =>
                                           (DateTime?)x.d_work_time_end).First();
                    }
                }

                return siArray;
            }
        }

        [WebMethod(Description = "Получает данные текущего семестра для группы")]
        public SemesterInfo GetGroupCurrentSemester(int GroupId)
        {
            using (DataLayer.ScheduleDataDataContext ctx = new DataLayer.ScheduleDataDataContext("Data Source=ugtudb.ugtu.net;Initial Catalog=UGTU;Integrated Security=True"))
            {
                int semtype;

                if ((DateTime.Today.Month <= 8) && (DateTime.Today.Month >= 2)) semtype = 2;
                else semtype = 1;

                int yearUp = DateTime.Today.Year;
                if (semtype == 2) yearUp = DateTime.Today.Year - 1;

                SemesterInfo si = ctx.Shedules.Where(p => (p.Year_uch_pl.year_value == yearUp) && (p.ik_sem_type == semtype)).Select(x =>
                                       new SemesterInfo()
                                       {
                                           ID = x.ik_shedule,
                                           Type = x.SemesterType.Cname_sem_type,
                                           Years = x.Year_uch_pl.year_value.ToString() + "—" + ((int)x.Year_uch_pl.year_value + 1).ToString(),

                                           BeginDate = (DateTime)x.d_sem_start,
                                           EndDate = (DateTime)x.d_sem_end,
                                           BeginSessionDate = (DateTime)x.d_session_start,
                                           EndSessionDate = (DateTime)x.d_session_end,

                                           BeginDayTime = (DateTime)x.d_work_time_start,
                                           EndDayTime = (DateTime)x.d_work_time_end
                                       }).Single();


                int SpecFacId = ctx.Grups.Where(p => p.Ik_grup == GroupId).Select(x =>
                                        x.ik_spec_fac).Single();

                int Grade;
                if ((DateTime.Today.Month <= 8) && (DateTime.Today.Month >= 2)) Grade = DateTime.Today.Year - (int)ctx.Grups.Where(p => p.Ik_grup == GroupId).Select(x =>
                                          x.nYear_post).Single();
                else Grade = DateTime.Today.Year - (int)ctx.Grups.Where(p => p.Ik_grup == GroupId).Select(x =>
                                          x.nYear_post).Single() + 1;


                if (ctx.Semester_length_exceptions.Where(p => (p.course_number == Grade) && (p.ik_spec_fac == SpecFacId) && (p.ik_shedule == si.ID)).Count() > 0)
                {
                    si.BeginDate = ctx.Semester_length_exceptions.Where(p => (p.course_number == Grade) && (p.ik_spec_fac == SpecFacId) && (p.ik_shedule == si.ID)).Select(x =>
                                       (DateTime)x.d_sem_start).First();

                    si.EndDate = ctx.Semester_length_exceptions.Where(p => (p.course_number == Grade) && (p.ik_spec_fac == SpecFacId) && (p.ik_shedule == si.ID)).Select(x =>
                                       (DateTime)x.d_sem_end).First();

                    si.BeginSessionDate = ctx.Semester_length_exceptions.Where(p => (p.course_number == Grade) && (p.ik_spec_fac == SpecFacId) && (p.ik_shedule == si.ID)).Select(x =>
                                       (DateTime)x.d_session_start).First();

                    si.EndSessionDate = ctx.Semester_length_exceptions.Where(p => (p.course_number == Grade) && (p.ik_spec_fac == SpecFacId) && (p.ik_shedule == si.ID)).Select(x =>
                                       (DateTime)x.d_session_end).First();

                    si.BeginDayTime = ctx.Semester_length_exceptions.Where(p => (p.course_number == Grade) && (p.ik_spec_fac == SpecFacId) && (p.ik_shedule == si.ID)).Select(x =>
                                       (DateTime)x.d_work_time_start).First();

                    si.EndDayTime = ctx.Semester_length_exceptions.Where(p => (p.course_number == Grade) && (p.ik_spec_fac == SpecFacId) && (p.ik_shedule == si.ID)).Select(x =>
                                       (DateTime)x.d_work_time_end).First();
                }

                return si;
            }
        }

        #endregion

        #region ScheduleMethods

        //Методы уровня группы

        [WebMethod(Description = "Получает набор событий для группы", CacheDuration = 43200)]
        public List<EventInfo> GetGroupEvents(int GroupID, int SemID)
        {
            using (DataLayer.ScheduleDataDataContext ctx = new DataLayer.ScheduleDataDataContext("Data Source=ugtudb.ugtu.net;Initial Catalog=UGTU;Integrated Security=True"))
            {
                /*int[] ikCalcUnits = ctx.Calc_unit_grups.Where(r => r.Ik_grup == GroupID).Select(x => x.ik_calc_unit).ToArray();
                int[] ikPrepPlans = ctx.Prepod_plan_nagrs.Where(p => ikCalcUnits.Contains(p.ik_calc_unit)).Select(x => x.ik_prepod_plan).ToArray();

                List<int> ikEvents = ctx.Relation_event_plan_nagrs.Where(e => ikPrepPlans.Contains(e.ik_prepod_plan)).Select(x => x.ik_event).ToList();

                int YearGroupEnter = (int)ctx.Grups.Where(r => r.Ik_grup == GroupID).Select(x => x.nYear_post).Single();

                int ikSpecfac = ctx.Grups.Where(r => r.Ik_grup == GroupID).Select(x => x.ik_spec_fac).Single();
                int[] ikPotoksSpecs = ctx.Relation_potok_specs.Where(p => (ikSpecfac == p.ik_spec_fac) && (p.Potok.Year_uch_pl.year_value == YearGroupEnter)).Select(x => x.ik_potok).ToArray();
                //int[] ikPotoksGroups = ctx..Where(p => (GroupID == p.ik_grup) && (p.Potok.Year_uch_pl.year_value == YearGroupEnter)).Select(x => x.ik_potok).ToArray();               

                int[] ikSchemes = ctx.Calc_unit_grups.Where(r => (r.Ik_grup == GroupID)).Select(x => x.Calc_unit_semestr.ik_shema).ToArray();

                ikCalcUnits = ctx.Calc_unit_semestrs.Where(r => ikSchemes.Contains((int)r.ik_shema)).Select(x => x.ik_calc_unit).ToArray();
                ikPrepPlans = ctx.Prepod_plan_nagrs.Where(p => ikCalcUnits.Contains(p.ik_calc_unit)).Select(x => x.ik_prepod_plan).ToArray();

                int[] ikAllEvents = ctx.SheduleEventWithPlanNagr_news.Where(e => (ikPrepPlans.Contains(e.ik_prepod_plan)&&(e.Ik_grup == GroupID))).Select(x => x.ik_event).ToArray();

                int[] ikBigEvents = ctx.SheduleEventWithPlanNagr_news.Where(e => (ikAllEvents.Contains(e.ik_event)) && (e.ik_vid_zanyat == 3)&&(e.Ik_grup == GroupID)).Select(x => x.ik_event).ToArray();

                ikEvents.AddRange(ikBigEvents);*/

                //List<EventInfo> eiArray = ctx.SheduleEventWithPlanNagr_news.Where(evts => ikEvents.Contains(evts.ik_event) && (SemID == evts.ik_shedule)).Select(x =>
                List<EventInfo> eiArray = ctx.SheduleEventWithPlanNagr_news.Where(evts => (evts.Ik_grup == GroupID) && (SemID == evts.ik_shedule)).Select(x =>
                 
                       new EventInfo()
                       {
                           ID = x.ik_event,
                           Discipline = x.cName_disc,
                           DisciplineShort = x.cName_disc_short,
                           Type = x.cshort_vid_zanyat,

                           Room = x.Cname_room + x.CName_campus,
                           Teacher = new TeacherInfo(x.Clastname.Trim() + " " + x.Cfirstname.Trim() + " " + x.Cotch.Trim()),

                           CalcUnit = x.cName_calc_unit,

                           Begin = x.dt_time_start,
                           End = x.dt_time_stop,
                       }).ToList();

                foreach (EventInfo ei in eiArray)
                {
                    ei.Pattern = ctx.SheduleEventWithPlanNagr_news.Where(p => ei.ID == p.ik_event).Select(x => new RepeatPatternInfo()
                    {
                        BeginDate = (DateTime)x.dBegin_date,
                        EndDate = (DateTime)x.dFinal_date,
                        Count = (int)x.iRepeat_count,
                        Frequency = x.iRepeat_frequency,
                        Type = x.ik_repeat_type,
                        RepeatMask = x.cRepeat_mask
                    }).First();

                    ei.Exceptions = ctx.SheduleEventExceptions.Where(p => ei.ID == p.ik_old_event).Select(x => (DateTime)x.dExceptionDate).ToList();
                }

                return eiArray;
            }
        }

        public iCalendar GetGroupEventsAsICalendar(int GroupID, int SemID)
        {
            iCalendar res = new iCalendar();

            List<EventInfo> eiArray = GetGroupEvents(GroupID, SemID);

            foreach (EventInfo ei in eiArray)
                CICalConverter.AddNewEvent(res, ei);

            return res;
        }

        [WebMethod(Description = "Получает строку формата iCalendar расписания заданной группы", CacheDuration = 43200)]
        public string GetGroupEventsAsICalendarString(int GroupID, int SemID)
        {
            iCalendar res = GetGroupEventsAsICalendar(GroupID, SemID);

            iCalendarSerializer sz = new iCalendarSerializer();
            return sz.SerializeToString(res);
        }

        //Методы уровня преподавателя

        [WebMethod(Description = "Получает набор событий для преподавателя", CacheDuration = 43200)]
        public List<EventInfo> GetTeacherEvents(int TeacherID, int SemID)
        {
            using (DataLayer.ScheduleDataDataContext ctx = new DataLayer.ScheduleDataDataContext("Data Source=ugtudb.ugtu.net;Initial Catalog=UGTU;Integrated Security=True"))
            {

                int[] TeachDeps = ctx.Relation_kafedra_preps.Where(p => p.itab_n == TeacherID).Select(x => x.ik_id_prepod).ToArray();

                List<EventInfo> eiArray = ctx.SheduleEventWithPlanNagrs.Where(evts => TeachDeps.Contains(evts.ik_id_prepod) && (SemID == evts.ik_shedule)).Select(x =>
                       new EventInfo()
                       {
                           ID = x.ik_event,
                           Discipline = x.cName_disc,
                           DisciplineShort = x.cName_disc_short,
                           Type = x.cshort_vid_zanyat,

                           Room = x.Cname_room + x.CName_campus,
                           Teacher = new TeacherInfo(x.Clastname.Trim() + " " + x.Cfirstname.Trim() + " " + x.Cotch.Trim()),

                           CalcUnit = x.cName_calc_unit,

                           Begin = x.dt_time_start,
                           End = x.dt_time_stop,
                       }).ToList();



                foreach (EventInfo ei in eiArray)
                {
                    ei.Pattern = ctx.SheduleEventWithPlanNagrs.Where(p => ei.ID == p.ik_event).Select(x => new RepeatPatternInfo()
                    {
                        BeginDate = (DateTime)x.dBegin_date,
                        EndDate = (DateTime)x.dFinal_date,
                        Count = (int)x.iRepeat_count,
                        Frequency = x.iRepeat_frequency,
                        Type = x.ik_repeat_type,
                        RepeatMask = x.cRepeat_mask
                    }).First();

                    ei.Exceptions = ctx.SheduleEventExceptions.Where(p => ei.ID == p.ik_old_event).Select(x => (DateTime)x.dExceptionDate).ToList();
                }

                return eiArray;
            }

        }

        [WebMethod(Description = "Получает строку формата iCalendar расписания заданного преподавателя по логину", CacheDuration = 43200)]
        public string GetTeacherEventsAsICalendarStringByLogin(string login, int SemID)
        {
            int TeacherID;

            using (DataLayer.ScheduleDataDataContext ctx = new DataLayer.ScheduleDataDataContext("Data Source=ugtudb.ugtu.net;Initial Catalog=UGTU;Integrated Security=True"))
            {
            int? TID = (int?)ctx.Prepods.Where(x => x.prepLogin == login).Select(p=> p.itab_n).Single();
            
            if (TID == null) return null;

            TeacherID = (int)TID;
            iCalendar res = GetTeacherEventsAsICalendar(TeacherID, SemID);

            iCalendarSerializer sz = new iCalendarSerializer();
            return sz.SerializeToString(res);
            }
        }

        public iCalendar GetTeacherEventsAsICalendar(int TeacherID, int SemID)
        {
            iCalendar res = new iCalendar();

            List<EventInfo> eiArray = GetTeacherEvents(TeacherID, SemID);

            foreach (EventInfo ei in eiArray)
                CICalConverter.AddNewEvent(res, ei);

            return res;
        }

        [WebMethod(Description = "Получает строку формата iCalendar расписания заданного преподавателя", CacheDuration = 43200)]
        public string GetTeacherEventsAsICalendarString(int TeacherID, int SemID)
        {
            iCalendar res = GetTeacherEventsAsICalendar(TeacherID, SemID);

            iCalendarSerializer sz = new iCalendarSerializer();
            return sz.SerializeToString(res);
        }
        
        #endregion

        #region SessionScheduleMethods

        //Методы уровня группы

        [WebMethod(Description = "Получает набор событий сессии для группы", CacheDuration = 43200)]
        public List<EventInfo> GetGroupSessionEvents(int GroupID, int SemID)
        {
            using (DataLayer.ScheduleDataDataContext ctx = new DataLayer.ScheduleDataDataContext("Data Source=ugtudb.ugtu.net;Initial Catalog=UGTU;Integrated Security=True"))
            {
                int[] ikCalcUnits = ctx.Relation_calc_unit_grups.Where(r => r.ik_grup == GroupID).Select(x => x.ik_calc_unit).ToArray();
                int[] ikPrepPlans = ctx.Prepod_plan_nagrs.Where(p => ikCalcUnits.Contains(p.ik_calc_unit)).Select(x => x.ik_prepod_plan).ToArray();
                List<int> ikExams = ctx.Relation_exam_plan_nagrs.Where(e => ikPrepPlans.Contains(e.ik_prepod_plan)).Select(x => x.ik_examination).ToList();

                int YearGroupEnter = (int)ctx.Grups.Where(r => r.Ik_grup == GroupID).Select(x => x.nYear_post).Single();

                /*int ikSpecfac = ctx.Grups.Where(r => r.Ik_grup == GroupID).Select(x => x.ik_spec_fac).Single();
                int[] ikPotoksSpecs = ctx.Relation_potok_specs.Where(p => (ikSpecfac == p.ik_spec_fac) && (p.Potok.Year_uch_pl.year_value == YearGroupEnter)).Select(x => x.ik_potok).ToArray();
                int[] ikPotoksGroups = ctx.Relation_potok_grups.Where(p => (GroupID == p.ik_grup) && (p.Potok.Year_uch_pl.year_value == YearGroupEnter)).Select(x => x.ik_potok).ToArray();
                int[] ikSchemes = ctx.Potok_shemas.Where(r => (ikPotoksGroups.Contains((int)r.ik_potok)) || (ikPotoksSpecs.Contains((int)r.ik_potok))).Select(x => x.ik_shema_of_potok).ToArray();

                ikCalcUnits = ctx.Calc_units.Where(r => ikSchemes.Contains((int)r.ik_shema_of_potok)).Select(x => x.ik_calc_unit).ToArray();
                ikPrepPlans = ctx.Prepod_plan_nagrs.Where(p => ikCalcUnits.Contains(p.ik_calc_unit)).Select(x => x.ik_prepod_plan).ToArray();

                int[] ikAllEvents = ctx.Relation_event_plan_nagrs.Where(e => ikPrepPlans.Contains(e.ik_prepod_plan)).Select(x => x.ik_event).ToArray();

                int[] ikBigEvents = ctx.SheduleEventWithPlanNagrs.Where(e => (ikAllEvents.Contains(e.ik_event)) && (e.ik_vid_zanyat == 3)).Select(x => x.ik_event).ToArray();

                ikEvents.AddRange(ikBigEvents);*/

                List<EventInfo> eiArray = ctx.SheduleExaminationWithPlanNagrs.Where(evts => ikExams.Contains(evts.ik_examination) && (SemID == evts.ik_shedule)).Select(x =>
                       new EventInfo()
                       {
                           ID = x.ik_examination,
                           Discipline = x.cName_disc,
                           Type = x.cshort_vid_zanyat + " (" + x.Сname_vid_nagruzki_short + ")",

                           Room = x.Cname_room + x.CName_campus,
                           Teacher = new TeacherInfo(x.Clastname.Trim() + " " + x.Cfirstname.Trim() + " " + x.Cotch.Trim()),

                           CalcUnit = x.cName_calc_unit,

                           Begin = x.dt_time_start,
                           End = x.dt_time_stop,
                       }).ToList();

                return eiArray;
            }
        }

        public iCalendar GetGroupSessionEventsAsICalendar(int GroupID, int SemID)
        {
            iCalendar res = new iCalendar();

            List<EventInfo> eiArray = GetGroupSessionEvents(GroupID, SemID);

            foreach (EventInfo ei in eiArray)
                CICalConverter.AddNewEvent(res, ei);

            return res;
        }

        [WebMethod(Description = "Получает строку формата iCalendar расписания сессии заданной группы", CacheDuration = 43200)]
        public string GetGroupSessionEventsAsICalendarString(int GroupID, int SemID)
        {
            iCalendar res = GetGroupSessionEventsAsICalendar(GroupID, SemID);

            iCalendarSerializer sz = new iCalendarSerializer();
            return sz.SerializeToString(res);
        }

        //Методы уровня преподавателя

        [WebMethod(Description = "Получает набор событий сессии для преподавателя", CacheDuration = 43200)]
        public List<EventInfo> GetTeacherSessionEvents(int TeacherID, int SemID)
        {
            using (DataLayer.ScheduleDataDataContext ctx = new DataLayer.ScheduleDataDataContext("Data Source=ugtudb.ugtu.net;Initial Catalog=UGTU;Integrated Security=True"))
            {

                int[] TeachDeps = ctx.Relation_kafedra_preps.Where(p => p.itab_n == TeacherID).Select(x => x.ik_id_prepod).ToArray();

                List<EventInfo> eiArray = ctx.SheduleExaminationWithPlanNagrs.Where(evts => TeachDeps.Contains((int)evts.ik_id_prepod) && (SemID == evts.ik_shedule)).Select(x =>
                       new EventInfo()
                       {
                           ID = x.ik_examination,
                           Discipline = x.cName_disc,
                           Type = x.cshort_vid_zanyat + " (" + x.Сname_vid_nagruzki_short + ")",

                           Room = x.Cname_room + x.CName_campus,
                           Teacher = new TeacherInfo(x.Clastname.Trim() + " " + x.Cfirstname.Trim() + " " + x.Cotch.Trim()),
                           CalcUnit = x.cName_calc_unit,

                           Begin = x.dt_time_start,
                           End = x.dt_time_stop,
                       }).ToList();

                return eiArray;
            }

        }

        public iCalendar GetTeacherSessionEventsAsICalendar(int TeacherID, int SemID)
        {
            iCalendar res = new iCalendar();

            List<EventInfo> eiArray = GetTeacherSessionEvents(TeacherID, SemID);

            foreach (EventInfo ei in eiArray)
                CICalConverter.AddNewEvent(res, ei);

            return res;
        }

        [WebMethod(Description = "Получает строку формата iCalendar расписания сессии заданного преподавателя", CacheDuration = 43200)]
        public string GetTeacherSessionEventsAsICalendarString(int TeacherID, int SemID)
        {
            iCalendar res = GetTeacherSessionEventsAsICalendar(TeacherID, SemID);

            iCalendarSerializer sz = new iCalendarSerializer();
            return sz.SerializeToString(res);
        }

        #endregion

    }
}
