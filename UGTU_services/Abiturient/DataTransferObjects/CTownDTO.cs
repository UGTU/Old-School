using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Schedule.DataTransferObjects
{
    [Serializable]
    public class TownInfo
    {
        /// <summary>
        /// Получает или устанавливает идентификатор города
        /// </summary>
        public int ID { get; set; }
        /// <summary>
        /// Получает или устанавливает название города
        /// </summary>
        public string Name { get; set; }
    }

}