using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Abiturient.DataTransferObjects
{
    [Serializable]
    public class GroupInfo
    {
        /// <summary>
        /// Получает или устанавливает идентификатор 
        /// </summary>
        public int ID { get; set; }
        /// <summary>
        /// Получает или устанавливает название 
        /// </summary>
        public string Name { get; set; }
        /// <summary>
        /// Получает или устанавливает дату формирования
        /// </summary>
        public DateTime DateOfEnter { get; set; }
        /// <summary>
        /// Получает или устанавливает идентификатор специальности
        /// </summary>
        public int IDSpec { get; set; }
        /// <summary>
        /// Получает или устанавливает идентификатор факультета
        /// </summary>
        public int IDFac { get; set; }

    }
}