using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Schedule.DataTransferObjects
{
    [Serializable]
    public class MastInfo
    {
        /// <summary>
        /// Получает или устанавливает идентификатор степени владения
        /// </summary>
        public int ID { get; set; }
        /// <summary>
        /// Получает или устанавливает название степени владения
        /// </summary>
        public string Name { get; set; }
    }

}