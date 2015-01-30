using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Schedule.DataTransferObjects
{
    [Serializable]
    public class LessonInfo
    {
        /// <summary>
        /// Получает или устанавливает идентификатор пары 
        /// </summary>
        public int ID { get; set; }
        /// <summary>
        /// Получает или устанавливает название пары
        /// </summary>
         public string Name { get; set; }
        /// <summary>
        /// Получает или устанавливает время начала
        /// </summary>
         public DateTime Begins { get; set; }
        /// <summary>
        /// Получает или устанавливает время окончания
        /// </summary>
         public DateTime Ends { get; set; }
    }

}