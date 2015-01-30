using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Abiturient.DataTransferObjects
{
    [Serializable]
    public class ExamDiscInfo
    {
        /// <summary>
        /// Получает или устанавливает идентификатор
        /// </summary>
        public int ID { get; set; }
        /// <summary>
        /// Получает или устанавливает название 
        /// </summary>
        public string Name { get; set; }
    }
}