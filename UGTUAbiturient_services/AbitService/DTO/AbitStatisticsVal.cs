using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AbitServices.DTO
{
    /// <summary>
    /// Класс передачи значений о наборах на бюджет, ЦКП и договор
    /// </summary>
    [Serializable]
    public class AbitStatisticsVal
    {
        /// <summary>
        /// Получает или устанавливает значение набора для бюджета
        /// </summary>
        public int Budget { get; set; }
        /// <summary>
        /// Получает или устанавливает значение набора для ЦКП
        /// </summary>        
        public int Ckp { get; set; }
        /// <summary>
        /// Получает или устанавливает значение набора для договора
        /// </summary>        
        public int Contract { get; set; }
    }
}
