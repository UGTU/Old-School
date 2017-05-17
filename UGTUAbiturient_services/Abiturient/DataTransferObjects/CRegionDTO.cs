using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Schedule.DataTransferObjects
{
    [Serializable]
    public class RegionInfo
    {
        /// <summary>
        /// Получает или устанавливает идентификатор региона
        /// </summary>
        public int ID { get; set; }
        /// <summary>
        /// Получает или устанавливает название региона
        /// </summary>
        public string Name { get; set; }
    }

}