using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Schedule.DataTransferObjects
{
    [Serializable]
    public class SchoolInfo
    {
        /// <summary>
        /// Получает или устанавливает идентификатор уч. заведения
        /// </summary>
        public int ID { get; set; }
        /// <summary>
        /// Получает или устанавливает название уч. заведения
        /// </summary>
        public string Name { get; set; }
    }

}