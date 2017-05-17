using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Schedule.DataTransferObjects
{
    [Serializable]
    public class SCountInfo
    {
        /// <summary>
        /// Получает или устанавливает идентификатор вида специального учета
        /// </summary>
        public int ID { get; set; }
        /// <summary>
        /// Получает или устанавливает название вида специального учета
        /// </summary>
        public string Name { get; set; }
    }

}