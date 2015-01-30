using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AbitServices.DTO
{
    /// <summary>
    /// Класс данных о наборе на специальность
    /// </summary>
    [Serializable]
    public class AbitStatistics
    {
        /// <summary>
        /// Получает или устанавливает полное наименование факультета
        /// </summary>
        public string FacName { get; set; }
        /// <summary>
        /// Получает или устанавливает короткое название специальности
        /// </summary>
        public string SpecShortName { get; set; }
        /// <summary>
        /// Получает или устанавливает шифр специальности
        /// </summary>
        public string SpecNum { get; set; }
        /// <summary>
        /// Получает или устанавливает плановые цифры набора по специальности
        /// </summary>
        public AbitStatisticsVal PlanValues { get; set; }
        /// <summary>
        /// Получает или устанавливает набор значений по динамике набора на специальность
        /// </summary>
        public AbitSpecStatistics[] StatValues;

    }
}