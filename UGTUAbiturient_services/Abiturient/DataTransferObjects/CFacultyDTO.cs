﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Schedule.DataTransferObjects
{
    [Serializable]
    public class FacInfo
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
        /// Получает или устанавливает короткое название 
        /// </summary>
        public string ShortName { get; set; }
    }

}