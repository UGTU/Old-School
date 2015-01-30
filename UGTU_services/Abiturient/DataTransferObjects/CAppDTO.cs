using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Abiturient.DataTransferObjects
{
    [Serializable]
    public class AppInfo
    {
        /// <summary>
        /// Получает или устанавливает идентификатор
        /// </summary>
        public int ID { get; set; }
        // номер заявления
        public int? RegNumber { get; set; } 
        // номер набора
        public int NumRecord { get; set; } 

        public int? CatEntryKey { get; set; }
        public string CatEntryName { get; set; }

        public int? CatEntryTypeKey { get; set; }

        public int? EntryStateKey { get; set; }
        public string EntryStateName { get; set; }

        public DateTime? AppDate { get; set; }
        public DateTime? AppOnlineDate { get; set; }
        public DateTime? AppReturnDate { get; set; }
        public DateTime? AppEntryDate { get; set; }

        public bool IsPrimary { get; set; }
        public bool IsReal { get; set; }

        public ExamInfo[] Exams;

    }
}