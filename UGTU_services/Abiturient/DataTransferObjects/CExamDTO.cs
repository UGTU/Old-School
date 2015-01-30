using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Abiturient.DataTransferObjects
{
    [Serializable]
    public class ExamInfo
    {
        /// <summary>
        /// Получает или устанавливает идентификатор
        /// </summary>
        public int ID { get; set; }
        
        public int DiscKey { get; set; }
        public int ExamTypeKey { get; set; }
        public int? RoomKey { get; set; }

        public int? Balls { get; set; }
        public string DocNum { get; set; }

    }
}