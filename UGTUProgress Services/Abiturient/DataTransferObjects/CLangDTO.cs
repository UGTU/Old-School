using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Schedule.DataTransferObjects
{
    [Serializable]
    public class LangInfo
    {
        /// <summary>
        /// Получает или устанавливает идентификатор языка
        /// </summary>
        public int ID { get; set; }
        /// <summary>
        /// Получает или устанавливает название языка
        /// </summary>
        public string Name { get; set; }
    }

}