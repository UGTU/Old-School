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
    [WebService(Namespace = "http://services.ist.ugtu.net/", Name="Сервис предоставления расписания", Description="Сервис для предоставления расписания аудиторных занятий и экзаменов в УГТУ в формате iCalendar.")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
   

    public class ScheduleService : System.Web.Services.WebService
    {

        [WebMethod(Description="Получает коллекцию факультетов университета") ]
        public FacInfo[] GetUGTUFaculties()
        {
            using (DataLayer.ScheduleDataDataContext ctx = new DataLayer.ScheduleDataDataContext("Data Source=ugtudb.ugtu.net;Initial Catalog=UGTU;Integrated Security=True"))
            {
                FacInfo[] fiArray = ctx.Facs.Select(x =>
                        new FacInfo() { ID = x.Ik_fac, Name = x.Cname_fac, ShortName = x.Cshort_name_fac }).ToArray();

                return fiArray;
            }

        }

        [WebMethod(Description = "Получает коллекцию специальностей университета")]
        public SpecInfo[] GetAllUGTUSpecialties()
        {
           using (DataLayer.ScheduleDataDataContext ctx = new DataLayer.ScheduleDataDataContext("Data Source=ugtudb.ugtu.net;Initial Catalog=UGTU;Integrated Security=True"))
            {
                SpecInfo[] siArray= ctx.Relation_spec_facs.Select(x=>
                        new SpecInfo(){ID = x.ik_spec_fac, SpecID = x.ik_spec}).ToArray();                                  

               foreach (SpecInfo si in siArray)
               {
                   si.Name = ctx.Spec_studs.Where(k => k.ik_spec == si.SpecID).Select(x=>
                        x.Cname_spec).ToString();   
               }
               return siArray;
            }

        }

        [WebMethod(Description = "Получает коллекцию кафедр университета")]
        public DepInfo[] GetAllUGTUDepartments()
        {
            using (DataLayer.ScheduleDataDataContext ctx = new DataLayer.ScheduleDataDataContext("Data Source=ugtudb.ugtu.net;Initial Catalog=UGTU;Integrated Security=True"))
            {
                DepInfo[] diArray = ctx.kafedras.Select(x =>
                        new DepInfo() { ID = x.ik_kaf, Name = x.cname_kaf }).ToArray();
                return diArray;
            }

        }

        [WebMethod(Description = "Получает коллекцию специальностей факультета")]
        public SpecInfo[] GetUGTUSpecialties(int facID)
        {
            using (DataLayer.ScheduleDataDataContext ctx = new DataLayer.ScheduleDataDataContext("Data Source=ugtudb.ugtu.net;Initial Catalog=UGTU;Integrated Security=True"))
            {
                SpecInfo[] siArray = ctx.Relation_spec_facs.Where(p => (p.ik_fac == facID)).Select(x =>
                        new SpecInfo() { ID = x.ik_spec_fac, SpecID = x.ik_spec }).ToArray();

                foreach (SpecInfo si in siArray)
                {
                    si.Name = ctx.Spec_studs.Where(k => k.ik_spec == si.SpecID).Select(x =>
                         x.Cname_spec).ToString();
                }
                return siArray;
            }

        }

        [WebMethod(Description = "Получает коллекцию кафедр факультета")]
        public DepInfo[] GetUGTUDepartments(int facID)
        {
            using (DataLayer.ScheduleDataDataContext ctx = new DataLayer.ScheduleDataDataContext("Data Source=ugtudb.ugtu.net;Initial Catalog=UGTU;Integrated Security=True"))
            {
                DepInfo[] diArray = ctx.kafedras.Where(p => p.ik_fac == facID).Select(x =>
                        new DepInfo() { ID = x.ik_kaf, Name = x.cname_kaf }).ToArray();
                return diArray;
            }

        }

        [WebMethod(Description = "Получает коллекцию групп специальности")]
        public GroupInfo[] GetUGTUGroups(int SpecId)
        {
           using (DataLayer.ScheduleDataDataContext ctx = new DataLayer.ScheduleDataDataContext("Data Source=ugtudb.ugtu.net;Initial Catalog=UGTU;Integrated Security=True"))
            {

                return ctx.Grups.Where(p => (p.ik_spec_fac == SpecId)).Select
                    (x => new GroupInfo() { ID = x.Ik_grup, Name = x.Cname_grup }).ToArray();                                  
            }

        }

        [WebMethod(Description = "Получает коллекцию преподавателей кафедры")]
        public TeacherInfo[] GetUGTUTeachers(int DepId)
        {
            using (DataLayer.ScheduleDataDataContext ctx = new DataLayer.ScheduleDataDataContext("Data Source=ugtudb.ugtu.net;Initial Catalog=UGTU;Integrated Security=True"))
            {
                TeacherInfo[] tiArray = ctx.Relation_kafedra_preps.Where(p => (p.ik_kaf == DepId)).Select(x =>
                                       new TeacherInfo() { ID = x.ik_id_prepod, TabNum = x.itab_n}).ToArray();

                foreach (TeacherInfo ti in tiArray)
                {
                    ti.Duty = ctx.Prepods.Where(k => k.itab_n == ti.TabNum).Select(x =>
                       x.PrepodRank.cName_rank).First();

                    ti.Name = ctx.Prepods.Where(k => k.itab_n == ti.TabNum).Select(x =>
                       x.Person.Cfirstname.ToString() + " " + x.Person.Cotch.ToString() + " " + x.Person.Clastname.ToString() + " ").First();

                }

                return tiArray;
            }

        }

        [WebMethod(Description = "Получает время проведения пары по номеру")]
        public LessonInfo GetUGTULesson(int LessonNum)
        {
            using (DataLayer.ScheduleDataDataContext ctx = new DataLayer.ScheduleDataDataContext("Data Source=ugtudb.ugtu.net;Initial Catalog=UGTU;Integrated Security=True"))
            {
                LessonInfo li = ctx.SheduleEventTypes.Where(p => (p.ik_event_type == LessonNum)).Select(x =>
                                       new LessonInfo() { ID = x.ik_event_type, Name = x.cName_event, Begins = x.dEvent_start, 
                                       Ends = x.dEvent_stop}).Single();
                return li;
            }

        }

        [WebMethod(Description = "Получает время проведения занятий")]
        public LessonInfo[] GetAllUGTULessons()
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

        [WebMethod(Description = "Получает набор событий для группы")]
        public List<EventInfo> GetEventsForGroup(int groupId)
        {
            using (DataLayer.ScheduleDataDataContext ctx = new DataLayer.ScheduleDataDataContext("Data Source=ugtudb.ugtu.net;Initial Catalog=UGTU;Integrated Security=True"))
            {
                int[] ikCalcUnits = ctx.Relation_calc_unit_grups.Where(r => r.ik_grup ==  groupId).Select(x=> x.ik_calc_unit).ToArray();
                int[] ikPrepPlans = ctx.Prepod_plan_nagrs.Where(p => ikCalcUnits.Contains(p.ik_calc_unit)).Select(x=> x.ik_prepod_plan).ToArray();
                List<int> ikEvents = ctx.Relation_event_plan_nagrs.Where(e => ikPrepPlans.Contains(e.ik_prepod_plan)).Select(x=> x.ik_event).ToList();

                int YearGroupEnter = (int)ctx.Grups.Where(r => r.Ik_grup == groupId).Select(x => x.nYear_post).Single();

                int ikSpecfac = ctx.Grups.Where(r => r.Ik_grup == groupId).Select(x => x.ik_spec_fac).Single();
                int[] ikPotoksSpecs = ctx.Relation_potok_specs.Where(p => (ikSpecfac == p.ik_spec_fac)&&(p.Potok.Year_uch_pl.year_value == YearGroupEnter)).Select(x=> x.ik_potok).ToArray();
                int[] ikPotoksGroups = ctx.Relation_potok_grups.Where(p => (groupId == p.ik_grup) && (p.Potok.Year_uch_pl.year_value == YearGroupEnter)).Select(x => x.ik_potok).ToArray();
                int[] ikSchemes = ctx.Potok_shemas.Where(r => (ikPotoksGroups.Contains((int)r.ik_potok)) || (ikPotoksSpecs.Contains((int)r.ik_potok))).Select(x => x.ik_shema_of_potok).ToArray();

                ikCalcUnits = ctx.Calc_units.Where(r => ikSchemes.Contains((int)r.ik_shema_of_potok)).Select(x => x.ik_calc_unit).ToArray();
                ikPrepPlans = ctx.Prepod_plan_nagrs.Where(p => ikCalcUnits.Contains(p.ik_calc_unit)).Select(x => x.ik_prepod_plan).ToArray();
                
                int[] ikAllEvents = ctx.Relation_event_plan_nagrs.Where(e => ikPrepPlans.Contains(e.ik_prepod_plan)).Select(x => x.ik_event).ToArray();

                int[] ikBigEvents = ctx.SheduleEventWithPlanNagrs.Where(e => (ikAllEvents.Contains(e.ik_event)) && (e.ik_vid_zanyat == 3)).Select(x => x.ik_event).ToArray();

                ikEvents.AddRange(ikBigEvents);

                List<EventInfo> eiArray = ctx.SheduleEventWithPlanNagrs.Where(evts => ikEvents.Contains(evts.ik_event)).Select(x =>
                       new EventInfo()
                       {
                           ID = x.ik_event,
                           Discipline = x.cName_disc,
                           Type = x.cName_vid_zanyat,

                           Room = x.Cname_room,
                           Teacher = x.clastname.Trim() + " " + x.cfirstname.Trim() + " " + x.cotch.Trim(),

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

                }

                return eiArray;
            }

        }
        
        public iCalendar GetCalendarForGroup(int groupId)
        {
            iCalendar res = new iCalendar();

            List<EventInfo> eiArray = GetEventsForGroup(groupId);

            foreach (EventInfo ei in eiArray)
                CICalConverter.AddNewEvent(res, ei);

            return res;
        }

        [WebMethod(Description="Получает строку формата iCalendar расписания заданной группы")]
        public string GetCalendarStringForGroup(int GroupID)
        {
            iCalendar res = GetCalendarForGroup(GroupID);

            iCalendarSerializer sz = new iCalendarSerializer();
            return sz.SerializeToString(res);

        }


    }
}
