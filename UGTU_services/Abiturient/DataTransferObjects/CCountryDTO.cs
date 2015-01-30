using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Schedule.DataTransferObjects
{
    [Serializable]
    public class CountryInfo
    {
        /// <summary>
        /// Получает или устанавливает идентификатор страны
        /// </summary>
        public int ID { get; set; }
        /// <summary>
        /// Получает или устанавливает название страны
        /// </summary>
        public string Name { get; set; }
    }

}