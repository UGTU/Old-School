using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Schedule.DataTransferObjects
{
    [Serializable]
    public class StreetInfo
    {
        /// <summary>
        /// Получает или устанавливает идентификатор улицы
        /// </summary>
        public int ID { get; set; }
        /// <summary>
        /// Получает или устанавливает название улицы
        /// </summary>
        public string Name { get; set; }
    }

}