using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Schedule.DataTransferObjects
{
    [Serializable]
    public class OrgInfo
    {
        /// <summary>
        /// Получает или устанавливает идентификатор предприятия
        /// </summary>
        public int ID { get; set; }
        /// <summary>
        /// Получает или устанавливает название предприятия
        /// </summary>
        public string Name { get; set; }
    }

}