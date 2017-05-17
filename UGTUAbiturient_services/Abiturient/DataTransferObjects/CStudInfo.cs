using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Abiturient.DataTransferObjects
{
    [Serializable]
    public class StudInfo
    {
        /// <summary>
        /// Получает или устанавливает идентификатор студента
        /// </summary>
        public int ID { get; set; }
        /// <summary>
        /// Получает или устанавливает полное имя
        /// </summary>
        public string FullName { get; set; }
    }
}