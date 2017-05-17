using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Schedule.DataTransferObjects
{
    [Serializable]
    public class EntTypeInfo
    {
        /// <summary>
        /// Получает или устанавливает идентификатор категории зачисления
        /// </summary>
        public int ID { get; set; }
        /// <summary>
        /// Получает или устанавливает название категории зачисления
        /// </summary>
        public string Name { get; set; }
    }

}