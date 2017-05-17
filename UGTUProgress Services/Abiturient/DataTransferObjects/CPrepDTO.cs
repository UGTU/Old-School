using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Schedule.DataTransferObjects
{
    [Serializable]
    public class PrepInfo
    {
        /// <summary>
        /// Получает или устанавливает идентификатор вида довузовской подготовки
        /// </summary>
        public int ID { get; set; }
        /// <summary>
        /// Получает или устанавливает название вида довузовской подготовки
        /// </summary>
        public string Name { get; set; }
    }

}