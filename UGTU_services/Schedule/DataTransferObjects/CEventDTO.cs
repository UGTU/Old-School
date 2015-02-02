using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Schedule.DataTransferObjects
{

    //DateTime Begin, DateTime End, string Discipline, string Type, string Room, string Teacher, bool IsMoved

    [Serializable]
    public class RepeatPatternInfo
    {
        /// <summary>
        /// Получает или устанавливает идентификатор 
        /// </summary>
        public int ID { get; set; }
        /// <summary>
        /// Тип повторения
        /// </summary>
        public int Type;
        /// <summary>
        /// Частота повторения
        /// </summary>
        public int Frequency;
        /// <summary>
        /// Количество повторений
        /// </summary>
        public int Count;
        /// <summary>
        /// Дата начала повторения
        /// </summary>
        public DateTime BeginDate;
        /// <summary>
        /// Дата окончания повторения
        /// </summary>
        public DateTime EndDate;
        /// <summary>
        /// Дата окончания повторения
        /// </summary>
        public string RepeatMask;

    }

    [Serializable]
    public class EventInfo
    {
        /// <summary>
        /// Получает или устанавливает идентификатор 
        /// </summary>
        public int ID { get; set; }
        public DateTime Begin { get; set; } 
        public DateTime End { get; set; } 
        public string Discipline { get; set; }
        public string DisciplineShort { get; set; }
        public string CalcUnit { get; set; }
        public string Type { get; set; } 
        public string Room { get; set; }
        public TeacherInfo Teacher { get; set; } 
        public int PatternID { get; set; }

        public List<DateTime> Exceptions;
        public RepeatPatternInfo Pattern;

    }

}