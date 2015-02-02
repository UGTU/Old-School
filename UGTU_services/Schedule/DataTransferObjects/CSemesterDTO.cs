using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Schedule.DataTransferObjects
{
    [Serializable]
    public class SemesterInfo
    {
        /// <summary>
        /// Получает или устанавливает идентификатор семестра
        /// </summary>
        public int ID { get; set; }
        /// <summary>
        /// Получает или устанавливает года семестра
        /// </summary>
        public string Years { get; set; }
        /// <summary>
        /// Получает или устанавливает тип семестра
        /// </summary>
        public string Type { get; set; }
        /// <summary>
        /// Получает или устанавливает дату начала семестра
        /// </summary>
        public DateTime? BeginDate { get; set; }
        /// <summary>
        /// Получает или устанавливает дату начала семестра
        /// </summary>
        public DateTime? EndDate { get; set; }
        /// <summary>
        /// Получает или устанавливает дату начала сессии
        /// </summary>
        public DateTime? BeginSessionDate { get; set; }
        /// <summary>
        /// Получает или устанавливает дату начала сессии
        /// </summary>
        public DateTime? EndSessionDate { get; set; }
        /// <summary>
        /// Получает или устанавливает время начала учебного дня
        /// </summary>
        public DateTime? BeginDayTime { get; set; }
        /// <summary>
        /// Получает или устанавливает время конца учебного дня
        /// </summary>
        public DateTime? EndDayTime { get; set; }
    }
}