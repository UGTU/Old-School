using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Services;
using System.Linq;
using StudentProgress.DataLayer;

namespace StudentProgress
{
    public class StudentMainInfo
    {
        /// <summary>
        /// Получает или устанавливает номер зачётной книжки студента
        /// </summary>
        public string ID { get; set; }

        /// <summary>
        /// Получает или устанавливает текущую группу-студента
        /// </summary>
        public DataLayer.StudGrup CurrStudGroup { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public bool IsCurrent { get; set; }

    }

    
    
    
    
    /// <summary>
    /// Summary description for Service1
    /// </summary>
    [WebService(Namespace = "http://services.ist.ugtu.net/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    public class StudentProgressService : System.Web.Services.WebService
    {
        [WebMethod]
        public PersonBirthDateDTO[] GetNearesPersonBirthDates(string period)
        {
            using (DataLayer.ServicesDataContextDataContext ctx = new DataLayer.ServicesDataContextDataContext("Data Source=ugtudb.ugtu.net;Initial Catalog=UGTU;Integrated Security=True"))
            {
                return ctx.Persons.Where(p => (p.Dd_birth.HasValue) && 
                    (p.Dd_birth.GetValueOrDefault().Day == DateTime.Today.Day) && 
                    (p.Dd_birth.GetValueOrDefault().Month == DateTime.Today.Month)).Select(x=>
                        new PersonBirthDateDTO(){BirthDate=x.Dd_birth.GetValueOrDefault(), FamilyName=x.Clastname,
                            FirstName=x.Cfirstname, MiddleName=x.Cotch, EMail=x.cEmail,
                            DayMonth = string.Format("{0}.{1}", x.Dd_birth.GetValueOrDefault().Day, x.Dd_birth.GetValueOrDefault().Month)}).ToArray();                                  
            }

        }

        /// <summary>
        /// Получение статуса студента на текущий момент
        /// </summary>
        /// <param name="StudentID">Номер зачётной книжки студента</param>
        /// <param name="PassportNum">Номер паспорта</param>
        /// <returns>Строку статуса</returns>
        [WebMethod]
        public string GetStudentStatus(string StudentID, string PasportNum)
        {
            using (DataLayer.ServicesDataContextDataContext ctx = new DataLayer.ServicesDataContextDataContext("Data Source=ugtudb.ugtu.net;Initial Catalog=UGTU;Integrated Security=True"))
            {
                // Проверка соответствия номера паспорта номеру зачётки
                if (!CheckStudentAttributes(ctx, StudentID, PasportNum)) 
                    return "Отсутствует";

                StudentMainInfo curStud = new StudentMainInfo()
                {
                    ID = StudentID
                };

                // Создание объекта и заполнение его общими сведениями о студенте
                StudentProgressDTO result = CreateStudentProgressHeader(ctx, curStud);
                return result.CurrentStatus;
                /*if (result.CurrentStatus.Contains("Отчислен"))
                    return "Отчислен";
                if (result.CurrentStatus.Contains("В академ. отпуске"))
                    return "В академ. отпуске";
                if (result.CurrentStatus.Contains("Активный"))
                 * return "Активный";
                if (result.CurrentStatus.Contains("Завершил обучение"))
                    return "Завершил обучение";*/

            }
        }

        /// <summary>
        /// Получение подробных сведений о студенте 
        /// </summary>
        /// <param name="NCode">Код студента в БД</param>
        /// <returns>Информацию о студенте в DTO</returns>
        [WebMethod]
        public StudentFullInfoDTO GetStudentFullInfo(int NCode)
        {
            using (DataLayer.ServicesDataContextDataContext ctx = new DataLayer.ServicesDataContextDataContext("Data Source=ugtudb.ugtu.net;Initial Catalog=UGTU;Integrated Security=True"))
            {
                // Выбор студента по коду

                StudInfo s = ctx.StudInfos.SingleOrDefault(x => (x.nCode == NCode));

                // Создание  DTO и заполнение его сведениями о студенте
                return s != null
                    ? new StudentFullInfoDTO()
                    {
                        FirstName = s.Cfirstname,
                        LastName = s.Clastname,
                        Patronymic = s.Cotch,
                        Grade = s.Course,
                        DeanFullName = s.ManagerName,
                        FacName = s.Cname_fac,

                        HomePhone = s.ctelefon,
                        MobilePhone = s.cSotTel,
                        Specialty = s.Cname_spec,
                        TeachBasis = s.CType_kat,
                        TeachForm = s.Cname_form_ed,
                        GroupName = s.Cname_grup,
                        DateOut = s.PrikazOtch
                    }
                    : null;
                


            }
        }

        /// <summary>
        /// Получение статуса студента на текущий момент
        /// </summary>
        /// <param name="StudentID">Номер зачётной книжки студента</param>
        /// <param name="PassportNum">Номер паспорта</param>
        /// <returns>Строку статуса</returns>
        [WebMethod]
        public bool IsValidStudent(string StudentID, string PasportNum)
        {
            return (GetStudentStatus(StudentID, PasportNum).Contains("Активный"));            
        }

        [WebMethod]
        public int GetCurrentGroupid(string StudentID, string PasportNum)
        {
            using (DataLayer.ServicesDataContextDataContext ctx = new DataLayer.ServicesDataContextDataContext("Data Source=ugtudb.ugtu.net;Initial Catalog=UGTU;Integrated Security=True"))
            {
                // Проверка соответствия номера паспорта номеру зачётки
                if (!CheckStudentAttributes(ctx, StudentID, PasportNum))
                    return 0;

                StudentMainInfo curStud = new StudentMainInfo()
                {
                    ID = StudentID
                };

                // Создание объекта и заполнение его общими сведениями о студенте
                CreateStudentProgressHeader(ctx, curStud);
                if (curStud.IsCurrent)
                    return curStud.CurrStudGroup.Ik_grup;
                else
                    return -1;
                
            }
        }

        /// <summary>
        /// Получение данных по успеваемости студента в заданном семестре
        /// </summary>
        /// <param name="StudentID">Номер зачётной книжки студента</param>
        /// <param name="SemesterNum">Номер семестра</param>
        /// <param name="PassportNum">Номер паспорта</param>
        /// <returns>Объект с описанием успеваемости студента</returns>
        [WebMethod]
        public  StudentProgressDTO GetStudentProgress(string StudentID, string PasportNum)
        {

            using (DataLayer.ServicesDataContextDataContext ctx = new DataLayer.ServicesDataContextDataContext("Data Source=ugtudb.ugtu.net;Initial Catalog=UGTU;Integrated Security=True"))
            {
                 // Проверка соответствия номера паспорта номеру зачётки
                if (!CheckStudentAttributes(ctx, StudentID, PasportNum)) return null;

                StudentMainInfo curStud = new StudentMainInfo()
                {
                    ID = StudentID
                };

                // Создание объекта и заполнение его общими сведениями о студенте
                StudentProgressDTO result = CreateStudentProgressHeader(ctx, curStud);

                // Добавление в объект данных по успеваемости
                AddStudentSemestrInfo(ctx, result, curStud);
                
                // Добавление в объект данных по результатам дипломного проектирования
                AddThesisInfo(ctx, result, curStud); 
                return result;          
            }

        }

        /// <summary>
        /// Получение данных по успеваемости студента 
        /// </summary>
        /// <param name="StudID">Идентификатор студента в БД</param>
        /// <returns>Объект с описанием успеваемости студента</returns>
        [WebMethod]
        public StudentProgressDTO GetStudentProgressByID(int StudID)
        {

            using (DataLayer.ServicesDataContextDataContext ctx = new DataLayer.ServicesDataContextDataContext("Data Source=ugtudb.ugtu.net;Initial Catalog=UGTU;Integrated Security=True"))
            {
                string BookID = (string)ctx.Zaches.Where(p => (p.nCode == StudID)).Select(x => x.Nn_zach).First();

                StudentMainInfo curStud = new StudentMainInfo()
                {
                    ID = BookID
                };

                // Создание объекта и заполнение его общими сведениями о студенте
                StudentProgressDTO result = CreateStudentProgressHeader(ctx, curStud);

                // Добавление в объект данных по успеваемости
                AddStudentSemestrInfo(ctx, result, curStud);

                // Добавление в объект данных по результатам дипломного проектирования
                AddThesisInfo(ctx, result, curStud);
                return result;
            }

        }

        private bool CheckStudentAttributes(DataLayer.ServicesDataContextDataContext ctx, string StudentID, string PasportNum)
        {
            IEnumerable<DataLayer.Zach> zach = ctx.Zaches.Where(zch => zch.Nn_zach == StudentID);
            if (zach.Count() == 0)
                return false;
            else
            {
                DataLayer.Person pers= zach.First().Student.Person;
                if ((PasportNum != "") && (PasportNum != null))
                {
                    IEnumerable<DataLayer.Doc_stud> docs = pers.Doc_studs.Where(doc =>
                        //(doc.document.IsDefault == true) && 
                        (doc.document.IsIdentity == true));

                    //все верно, если паспорта нет или он совпадает
                    if ((docs.Count() == 0) || (docs.Where(doc => doc.Np_number == PasportNum).Count() > 0))
                        return true;
                }
                else
                    return false;

                return false;
            }
        }

        private static void AddThesisInfo(DataLayer.ServicesDataContextDataContext ctx, StudentProgressDTO result, StudentMainInfo Stud)
        {
            DataLayer.Diplom diplom = ctx.Zaches.Where(zach => zach.Nn_zach == Stud.ID).First().Diplom;
            if (diplom != null)
            {
                ThesisWorkInfo tw = new ThesisWorkInfo() 
                {  //ThesisMark = diplom.Osenca.Name_osenca, 
                    ThesisTitle = diplom.cTema,// ThesisType = diplom.typeTema.cTypeTema, 
                    ThesisDate = diplom.Dd_dipl.GetValueOrDefault() 
                };

                if ((diplom.Dd_dipl != null) && (diplom.Dd_dipl.GetValueOrDefault()< DateTime.Today))
                    result.CurrentStatus = "Завершил обучение в " + diplom.Dd_dipl.GetValueOrDefault().Year.ToString() + " году";

                if (diplom.Predpr != null)
                    tw.Holder = diplom.Predpr.Cname_pred;
                if (diplom.Osenca != null)
                {
                    tw.ThesisMark = diplom.Osenca.Name_osenca;                    
                }
                if (diplom.typeTema != null)
                    tw.ThesisType = diplom.typeTema.cTypeTema;

                result.Thesis = tw;
            }
        }

        private static void AddStudentCheckPointsInfo(DataLayer.ServicesDataContextDataContext ctx, SemesterInfo semesterInfo, StudentMainInfo Stud)
        {
  
            /*CheckPointInfo[] cp = ctx.AttestViews.Where(att => (att.n_sem == semesterInfo.SemesterNum) && (att.Nn_zach == Stud.ID)).Select(att =>
                new CheckPointInfo() 
                {
                    CheckPointNum = Convert.ToInt32(att.AttestNumber)
                }).Distinct().OrderBy(att => att.CheckPointNum).ToArray();
            */
            CheckPointInfo[] cp = ctx.AttestViews.Where(att => (att.n_sem == semesterInfo.SemesterNum) && (att.Nn_zach == Stud.ID)).GroupBy(att => att.AttestNumber).Select(grAtt =>
            new CheckPointInfo()
            {
                CheckPointNum = Convert.ToInt32(grAtt.Key),
                CheckPointStartDate = grAtt.Min(att => att.DateBegin).GetValueOrDefault(),
                CheckPointEndDate = grAtt.Max(att => att.DateEnd).GetValueOrDefault()
            }).Distinct().OrderBy(att => att.CheckPointNum).ToArray();

            int idGroup;
            foreach (CheckPointInfo check in cp)
            {
                idGroup = ctx.AttestViews.Where(att => (att.n_sem == semesterInfo.SemesterNum) && (att.Nn_zach == Stud.ID) && (att.AttestNumber == check.CheckPointNum)).First().Ik_grup;
                //check.CheckPointStartDate = ctx.AttestViews.Where(att => (att.n_sem == semesterInfo.SemesterNum) && (att.Nn_zach == Stud.ID) && (att.AttestNumber == check.CheckPointNum)).First().DateBegin.GetValueOrDefault();
                //check.CheckPointEndDate = ctx.AttestViews.Where(att => (att.n_sem == semesterInfo.SemesterNum) && (att.Nn_zach == Stud.ID) && (att.AttestNumber == check.CheckPointNum)).First().DateEnd.GetValueOrDefault();
                var GroupRes = ctx.AttestViews.Where(att => (att.n_sem == semesterInfo.SemesterNum) && (att.Ik_grup == idGroup) && (att.AttestNumber == check.CheckPointNum) && (att.Cosenca > -1)).GroupBy(att => att.Nn_zach/*, e => e.Cosenca*/).Select(grAtt
                    => new
                    {
                        nnZach = grAtt.Key,
                        AVMark = grAtt.Average(att => att.Cosenca)//,
                        //Number = grAtt.
                    }).OrderBy(AVMark => AVMark.AVMark);

                if (GroupRes.Where(AVM => AVM.nnZach == Stud.ID).Count() > 0)
                {
                    CheckRatingInfo checkRating = new CheckRatingInfo();

                    checkRating.StudentCount = GroupRes.Count();
                    checkRating.CheckAVMark = Convert.ToDouble(GroupRes.Where(AVM => AVM.nnZach == Stud.ID).FirstOrDefault().AVMark);
                    checkRating.StudentPosition = GroupRes.Where(AVM => AVM.AVMark >= checkRating.CheckAVMark).Count();
                    check.CheckRating = checkRating;
               }

       
                       
                       //.Aggregate( att => att.Cosenca)//.GroupBy(att => att.Nn_zach, e => e.Cosenca).Select(att => att.Aggregate);//.Average(att => att.Cosenca);
                check.Disciplines = ctx.AttestViews.Where(att => (att.n_sem == semesterInfo.SemesterNum) &&
                    (att.Nn_zach == Stud.ID) && (att.AttestNumber == check.CheckPointNum) ).Select(att =>
                    new CheckDisciplinePointInfo()
                    {
                        Discipline = att.cName_disc,
                        HasPassed = (att.Cosenca == -3) ? "не указано" : ((att.Cosenca == -2) ? "не аттестован" :
                            ((att.Cosenca == -1) ? "аттестован" : Convert.ToString(att.Cosenca) + " из " + Convert.ToString(att.maxBall)+ " баллов")),
                        AbsentHours = att.PropCount.GetValueOrDefault(),
                        AbsentByReasonHours = att.Uvag_PropCount.GetValueOrDefault(),
                        IsClosed = att.lClose
                    }
                    ).OrderBy(att => att.Discipline).ToArray();


            }

            semesterInfo.CheckPoints = cp;
        }

        private static void AddStudentSemestrInfo(DataLayer.ServicesDataContextDataContext ctx, StudentProgressDTO result, StudentMainInfo Stud)
        {
            int SemCount = Convert.ToInt16(Stud.CurrStudGroup.Grup.Relation_spec_fac.YearObuch) * 2;
            int YearPost = Convert.ToInt16(Stud.CurrStudGroup.Grup.nYear_post);
            int CurrYear;
            SemesterInfo[] si = new SemesterInfo[SemCount]; // Массив по количеству семестров в учебном плане

            for (int i = 1; i <= SemCount; i++)
            {
                si[i - 1] = new SemesterInfo()
                {
                    SemesterNum = i,
                    IsPassed = false
                    //Prolong = new StudentSemesterProlong() { ProlongReason = "по состоянию здоровья", ProlongTo = DateTime.Parse("01.02.2010") }
                };

                CurrYear = YearPost + Convert.ToInt16((i - 1) / 2);

                DataLayer.Shedule shedule = ctx.Shedules.Where(shed =>
                    (shed.Year_uch_pl.year_value == CurrYear) && ((shed.ik_sem_type - 1) == ((i + 1) % 2))).FirstOrDefault();

                if (shedule != null)
                {
                    si[i - 1].shedule = shedule.ik_shedule;

                    DataLayer.Semester_length_exception Sem = shedule.Semester_length_exceptions.Where(sem =>
                        (sem.ik_spec_fac == Stud.CurrStudGroup.Grup.ik_spec_fac) && (sem.course_number == CurrYear - YearPost + 1)).FirstOrDefault();
                    if (Sem != null)
                    {
                        si[i - 1].SemesterStartDate = Sem.d_sem_start;
                        si[i - 1].SemesterEndDate = Sem.d_sem_end;
                        si[i - 1].SessionStartDate = Sem.d_session_start;
                        si[i - 1].SessionEndDate = Sem.d_session_end;
                    }
                    else
                    {
                        si[i - 1].SemesterStartDate = shedule.d_sem_start;
                        si[i - 1].SemesterEndDate = shedule.d_sem_end;
                        si[i - 1].SessionStartDate = shedule.d_session_start;
                        si[i - 1].SessionEndDate = shedule.d_session_end;
                    }

                }


                // Добавить результататы успеваемости
                AddStudentSemesterProgressInfo(ctx, si[i-1], Stud);

                // Добавить результаты аттестаций
                AddStudentCheckPointsInfo(ctx, si[i - 1], Stud);

            }
            result.Semesters = si;

          
            //Загрузить продления сессии
            IOrderedQueryable<DataLayer.Prikaz_Stud> Prikazs = ctx.Prikaz_Studs.Where(prik => (prik.Pricina.ikTypePric == 29) && (prik.Zach.Nn_zach == Stud.ID)).OrderBy(prik => prik.LastProp);     //          
            foreach (DataLayer.Prikaz_Stud Prik in Prikazs)
            {
                //подбираем семестр, к которому относится данное продление 
                int i=0;
                while ((i < (SemCount-1)) && !((Convert.ToDateTime(Prik.LastProp) >= si[i].SessionEndDate) && (Convert.ToDateTime(Prik.LastProp) <= si[i+1].SessionStartDate)))
                {                    
                    i++;
                }

                if ((i < (SemCount - 1)) || ((Convert.ToDateTime(Prik.LastProp) >= si[i].SemesterEndDate) && (i == (SemCount - 1))))
                {
                    if (result.Semesters[i].Prolong == null)
                        result.Semesters[i].Prolong = new StudentSemesterProlong();
                    result.Semesters[i].Prolong.ProlongTo = Convert.ToDateTime(Prik.LastProp);
                    result.Semesters[i].Prolong.ProlongReason = Prik.Pricina.Cname_pric;
                }
            }
          

        }

        private static void AddStudentSemesterProgressInfo(DataLayer.ServicesDataContextDataContext ctx, SemesterInfo semesterInfo, StudentMainInfo Stud)
        {

            IEnumerable<DataLayer.SheduleExamForSiteUGTU> shedExams = ctx.SheduleExamForSiteUGTUs.Where(shed => 
                (shed.ik_shedule == semesterInfo.shedule) && (shed.ik_vid_nagruzki == 1));

            //загружаем планируемую дату экзамена
            semesterInfo.Progress =
                 (from usp in ctx.UspevViews
                  join shed in shedExams
                    on new { ik = (int?)usp.iK_disc, Ik_grup = (int?)usp.Ik_grup, iK_vid_zanyat = (int?)usp.iK_vid_zanyat }
                    equals new { ik = (int?)shed.ik_disc, Ik_grup = (int?)shed.ik_grup, iK_vid_zanyat = (int?)shed.ik_vid_zanyat } 
                 into ShedUspev
                 where (usp.n_sem == semesterInfo.SemesterNum) && (usp.Nn_zach == Stud.ID)

                 from shd in ShedUspev.DefaultIfEmpty()

                 select new ProgressInfo
                 {
                    Discipline = usp.cName_disc,
                    LessonType = usp.cName_vid_zanyat,
                    idLessonType = usp.iK_vid_zanyat,
                    ByChoice = usp.lVibor,
                    ChoiceGroupNumber = usp.ViborGroup,
                    Mark = usp.Name_osenca,
                    PassDate = usp.Dd_exam,
                    PlanDate = (shd.dt_time_start == null) ? ((usp.bitExam) ? semesterInfo.SessionEndDate : semesterInfo.SemesterEndDate) : shd.dt_time_start    // (ur.FirstName == null) ? "N/A" : ur.FirstName,
                 }).OrderBy(usp => usp.LessonType).ThenBy(usp => usp.Discipline).ToArray();


            //проверяем, сдана ли сессия
            IEnumerable<ProgressInfo> NotPassed = semesterInfo.Progress.Where(uspev => uspev.PassDate == null);
            if (NotPassed.Count() == 0)
            {
                semesterInfo.IsPassed = true;
            }
            else
            {
                //если кол-во несданных, но обязательных экзаменов равно 0
                if (NotPassed.Where(uspev => ! uspev.ByChoice ).Count() == 0)
                {
                    //проверяем дисциплины по-выбору
                    IEnumerable<int> ChoiceGroups = (NotPassed.Select(usp => Convert.ToInt32(usp.ChoiceGroupNumber)));

                    bool IsPassed = false;
                    //для каждой группы проверяем наличие хотя бы 1 сданной дисциплины
                    foreach (int CurrChoiceGroup in ChoiceGroups)
                    {
                        foreach (string CurrDisc in semesterInfo.Progress.Where(progr => 
                                progr.ChoiceGroupNumber == CurrChoiceGroup).Select(progr => progr.Discipline))
                        {
                            if (semesterInfo.Progress.Where(progr =>
                                    (progr.Discipline == CurrDisc) && (progr.PassDate == null)).Count() == 0)
                            {
                                IsPassed = true;
                                break;
                            }
                        }
                        if (!IsPassed)
                            break;
                    }

                    semesterInfo.IsPassed = IsPassed;

                }
            }





        }

        private static StudentProgressDTO CreateStudentProgressHeader(DataLayer.ServicesDataContextDataContext ctx, StudentMainInfo Stud)
        {
            StudentProgressDTO result = new StudentProgressDTO()
            {
                ID = Stud.ID                
            };

            var CurrGroup = ctx.StudGrups.Where(StGr => (StGr.Zach.Nn_zach == Stud.ID) && (StGr.Ik_prikazOtch == null));
            Stud.IsCurrent = false;

            if (CurrGroup.Count() == 0)
            {
                 result.CurrentStatus = "Отчислен";
                CurrGroup = ctx.StudGrups.Where(StGr => (StGr.Zach.Nn_zach == Stud.ID)).OrderByDescending(StGr => StGr.Ik_grup );
                Stud.CurrStudGroup = CurrGroup.First();
                if (Stud.CurrStudGroup != null)
                {
                    result.CurrentStatus = "Отчислен " + Stud.CurrStudGroup.Prikaz1.Dd_prikaz.ToShortDateString();

                }
            }
            else
            {
                Stud.CurrStudGroup = CurrGroup.First();
                //if (Stud.CurrStudGroup.Ik_prikazOtch == null)
                //{
                    if (Stud.CurrStudGroup.Ik_prikazZach == null)
                    {
                        result.CurrentStatus = "В академ. отпуске";
                        var Academ = ctx.StudGrupAcadems.Where(acad => acad.ik_studGrupNew ==  Stud.CurrStudGroup.Ik_studGrup).FirstOrDefault();
                        if (Academ != null)
                        {
                            Stud.IsCurrent = true;
                            result.CurrentStatus = "В академ. отпуске до "+Convert.ToDateTime(Academ.dateEnd).ToShortDateString()
                                    + ", приступает к занятиям " + Convert.ToDateTime(Academ.dateOutput).ToShortDateString();
                            if (Academ.IsFreeAttendance)
                            {
                                result.CurrentStatus = result.CurrentStatus + ", со свободным посещением";
                            }
                            else
                            {
                                result.CurrentStatus = result.CurrentStatus + ", без свободного посещения";
                            }


                        }

                    }
                    else
                    {
                        Stud.IsCurrent = true;
                        result.CurrentStatus = "Активный";
                        if ((Stud.CurrStudGroup.Grup.DateExit!= null) &&(Stud.CurrStudGroup.Grup.DateExit.GetValueOrDefault() < DateTime.Today))
                        {
                            result.CurrentStatus = "Завершил обучение в " + Stud.CurrStudGroup.Grup.DateExit.GetValueOrDefault().Year.ToString()+ " году";
                            Stud.IsCurrent = false;
                        }
                    }
                //}


            }

            return result;
        }
    }
}