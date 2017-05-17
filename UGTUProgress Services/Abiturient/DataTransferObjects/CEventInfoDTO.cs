using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Abiturient.DataTransferObjects
{
    [Serializable]
    public class EventInfo
    {
        /// <summary>
        /// Получает или устанавливает идентификатор
        /// </summary>
        public int ID { get; set; }
        
        public int DiscKey { get; set; }
        public string DiscName { get; set; }

        public int ExamTypeKey { get; set; }
        public int? SitKey { get; set; }

        public DateTime? Date { get; set; }
        public DateTime? Begins { get; set; }
        public DateTime? Ends { get; set; }

        public int? RoomKey { get; set; }
        public string RoomName { get; set; }
        public string EventTypeName { get; set; }

    }
}