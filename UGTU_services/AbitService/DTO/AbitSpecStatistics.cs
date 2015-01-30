using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AbitServices.DTO
{
    /// <summary>
    /// Класс описывает набор на специальность на заданную дату
    /// </summary>
    [Serializable]
    public class AbitSpecStatistics
    {
        /// <summary>
        /// Получает или устанавливает дату для которой указаны значения набора
        /// </summary>
        public DateTime ValidForDate { get; set; }
        /// <summary>
        /// Получает или устанавливает значения количества заявлений по специальностям
        /// </summary>
        public AbitStatisticsVal Values;
    }
}
