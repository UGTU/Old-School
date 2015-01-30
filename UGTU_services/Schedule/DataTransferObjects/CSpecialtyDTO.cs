using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Schedule.DataTransferObjects
{
    [Serializable]
    public class SpecInfo
    {
        /// <summary>
        /// Получает или устанавливает идентификатор специальности факультета
        /// </summary>
        public int ID { get; set; }
        /// <summary>
        /// Получает или устанавливает название специальности
        /// </summary>
        public string Name { get; set; }
    }

}