using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Schedule.DataTransferObjects
{
    [Serializable]
    public class DocTypeInfo
    {
        /// <summary>
        /// Получает или устанавливает идентификатор вида документа
        /// </summary>
        public int ID { get; set; }
        /// <summary>
        /// Получает или устанавливает название вида документа
        /// </summary>
        public string Name { get; set; }
    }

}