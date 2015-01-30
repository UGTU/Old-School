using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Schedule.DataTransferObjects
{
    [Serializable]
    public class CountyInfo
    {
        /// <summary>
        /// Получает или устанавливает идентификатор района
        /// </summary>
        public int ID { get; set; }
        /// <summary>
        /// Получает или устанавливает название района
        /// </summary>
        public string Name { get; set; }
    }

}