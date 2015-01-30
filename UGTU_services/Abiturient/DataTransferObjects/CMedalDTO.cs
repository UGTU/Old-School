using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Schedule.DataTransferObjects
{
    [Serializable]
    public class MedalInfo
    {
        /// <summary>
        /// Получает или устанавливает идентификатор типа медали
        /// </summary>
        public int ID { get; set; }
        /// <summary>
        /// Получает или устанавливает название типа медали
        /// </summary>
        public string Name { get; set; }
    }

}