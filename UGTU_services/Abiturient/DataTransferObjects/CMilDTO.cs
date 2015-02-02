using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Schedule.DataTransferObjects
{
    [Serializable]
    public class MilInfo
    {
        /// <summary>
        /// Получает или устанавливает идентификатор военного звания
        /// </summary>
        public int ID { get; set; }
        /// <summary>
        /// Получает или устанавливает название военного звания
        /// </summary>
        public string Name { get; set; }
    }

}