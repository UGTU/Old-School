using System;
using System.Collections.Generic;
using System.Web;
using System.Xml.Serialization;
using System.Linq;

namespace StudentProgress
{
    /// <summary>
    /// Класс описания данных о дисциплине и успеваемости по дисциплине
    /// </summary>
    [Serializable]
    public class ProgressInfo
    {
        /// <summary>  
        /// Получает или устанавливает наименование дисциплины
        /// </summary>
        public string Discipline { get; set; }
        /// <summary>
        /// Получает или устанавливает вид занятия по дисциплине
        /// </summary>
        public string LessonType { get; set; }
        /// <summary>
        /// Получает или устанавливает оценку по дисциплине в строковом представлении
        /// </summary>
        public string Mark { get; set; }
        /// <summary>
        /// Получает или устанавливает дату получения оценки или зачёта
        /// </summary>
        public DateTime? PassDate { get; set; }
        /// <summary>
        /// Получает или устанавливает плановую дату получения оценки или зачёта
        /// </summary>
        public DateTime? PlanDate { get; set; }
        /// <summary>
        /// Получает или устанавливает код вида занятий
        /// </summary>
        public int idLessonType { get; set; }
        /// <summary>
        /// Получает или устанавливает бит дисциплины по выбору
        /// </summary>
        public bool ByChoice { get; set; }
        /// <summary>
        /// Получает или устанавливает номер группы дисциплины по выбору
        /// </summary>
        public int? ChoiceGroupNumber { get; set; }

    }

    /// <summary>
    /// Класс с описанием результатов аттестации по дисциплине
    /// </summary>
    public class CheckDisciplinePointInfo
    {
        /// <summary>
        /// Получает или устанавливает наименование дисциплины
        /// </summary>
        public string Discipline { get; set; }

        /// <summary>
        /// Получает или устанавливает признак того, что студент получил аттестацию по дисциплине
        /// </summary>
        public string HasPassed { get; set; }

        /// <summary>
        /// Получает или устанавливает количество пропущенных часов без уважительной причины
        /// </summary>
        public int AbsentHours { get; set; }

        /// <summary>
        /// Получает или устанавливает количество пропущенных часов по уважительной причине
        /// </summary>
        public int AbsentByReasonHours { get; set; }

        /// <summary>
        /// Получает или устанавливает признак закрытой ведомости
        /// </summary>
        public bool IsClosed { get; set; }

    }

    /// <summary>
    /// Класс с описанием рейтинга
    /// </summary>
    [Serializable]
    public class CheckRatingInfo
    {
        /// <summary>
        /// Получает или устанавливает средний балл за аттестацию
        /// </summary>
        public double CheckAVMark { get; set; }

        /// <summary>
        /// Получает или устанавливает рейтинг в группе
        /// </summary>
        public int StudentPosition { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public int StudentCount { get; set; }
    }

    /// <summary>
    /// Класс с описанием результатов аттестации
    /// </summary>
    [Serializable]
    public class CheckPointInfo
    {
        /// <summary>
        /// Получает или устанавливает номер аттестации
        /// </summary>
        public int CheckPointNum { get; set; }

        /// <summary>
        /// Получает или устанавливает дату начала аттестации
        /// </summary>
        public DateTime CheckPointStartDate { get; set; }

        /// <summary>
        /// Получает или устанавливает дату окончания аттестации
        /// </summary>
        public DateTime CheckPointEndDate { get; set; }

        public CheckRatingInfo CheckRating { get; set; }

        /// <summary>
        /// Получает или устанавливает коллекцию дисциплин с результатами аттестации
        /// </summary>
        public CheckDisciplinePointInfo[] Disciplines;
    }

    /// <summary>
    /// Класс описания общих параметров семестра
    /// </summary>
    [Serializable]    
    public class SemesterInfo
    {
        /// <summary>
        /// Получает или устанавливает номер семестра для которго дана информация
        /// </summary>
        public int SemesterNum { get; set; }

        
        public int shedule { get; set; }

        /// <summary>
        /// Получает или устанавливает дату начала семестра
        /// </summary>
        public DateTime? SemesterStartDate { get; set; }
        /// <summary>
        /// Получает или устанавливает дату окончания семестра
        /// </summary>
        public DateTime? SemesterEndDate { get; set; }
        /// <summary>
        /// Получает или устанавливает дату начала сессии
        /// </summary>
        public DateTime? SessionStartDate { get; set; }
        /// <summary>
        /// Получает или устанавливает дату окончания сессии
        /// </summary>
        public DateTime? SessionEndDate { get; set; }
        /// <summary>
        /// Получает или устанавливает признак завершения сессии
        /// </summary>
        public bool IsPassed { get; set; }

        /// <summary>
        /// Получает коллекцию с объектами по успеваемости
        /// </summary>
        public ProgressInfo[] Progress { get; set; }

        /// <summary>
        /// Получает или устанавливает коллекцию дисциплин с результатами аттестации
        /// </summary>
        public CheckPointInfo[] CheckPoints { get; set; }

        /// <summary>
        /// Получает или устанавливает объект с описанием продления семестра
        /// </summary>
        public StudentSemesterProlong Prolong { get; set; }

    }

    [Serializable]
    public class StudentSemesterProlong
    {
        
        /// <summary>
        /// Получает или устанавливает дату окончания сессии для студента
        /// </summary>
        public DateTime ProlongTo;

        
        /// <summary>
        /// Получает или устанавливает причину продления сессии для студента
        /// </summary>        
        public string ProlongReason;
    }

    /// <summary>
    /// Класс описания результатов дипломного проектирования
    /// </summary>
    [Serializable]
    public class ThesisWorkInfo
    {
        /// <summary>
        /// Получает или устанавливает оценку за дипломный проект
        /// </summary>
        public string ThesisMark { get; set; }
        /// <summary>
        /// Получает или устанавливает тип темы дипломного проекта
        /// </summary>
        public string ThesisType { get; set; }
        /// <summary>
        /// Получает или устанавливает название дипломного проекта
        /// </summary>
        public string ThesisTitle { get; set; }
        /// <summary>
        /// Получает или устанавливает название дипломного проекта
        /// </summary>
        public DateTime ThesisDate { get; set; }
        /// <summary>
        /// Получает или устанавливает наименование предприятия-заказчика дипломного проекта
        /// </summary>
        public string Holder { get; set; }
        /// <summary>
        /// Получает или устанавливает руководителя диплома
        /// </summary>
        public string Manager { get; set; }
    }
    /// <summary>
    /// Класс с описанием прогресса студента в учёбе
    /// </summary>
    [Serializable]
    public class StudentProgressDTO
    {               
        
        /// <summary>
        /// Получает или устанавливает номер зачётной книжки студента
        /// </summary>
        public string ID { get; set; }

        
        /// <summary>
        /// Получает или устанавливает строку текущего статуса студента (Активный, В академ. отпуске, Отчислен)
        /// </summary>
        public string CurrentStatus { get; set; }

        

        
        /// <summary>
        /// Получает или устанавливает коллекцию объектов с описанием семестра
        /// </summary>
        public SemesterInfo[] Semesters { get; set; }

        
        /// <summary>
        /// Получает или устанавливает объект с описанием дипломного проекта студента
        /// </summary>
        public ThesisWorkInfo Thesis { get; set; }

    }
}