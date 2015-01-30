using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Abiturient.DataTransferObjects
{
    [Serializable]
    public class LangKnowledgeInfo
    {
        /// <summary>
        /// Получает или устанавливает идентификатор
        /// </summary>
        public int ID { get; set; }
        public int LangID { get; set; }
        public string LangName { get; set; }
        public int MasteryID { get; set; }
        public string MasteryName { get; set; }
        
    }
}