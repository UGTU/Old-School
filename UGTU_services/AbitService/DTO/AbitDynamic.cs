using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AbitServices.DTO
{
    /// <summary>
    /// Класс динамики поступления на специальности с информацией о общем количестве на университет плановых мест и фактического количества заявлений 
    /// </summary>
    [Serializable]
    public class AbitDynamic
    {
        /// <summary>
        /// Получает и устанавливает количество плановых мест по университету
        /// </summary>
        public AbitStatisticsVal UniversityPlanValues { get; set; }
        /// <summary>
        /// Получает и устанавливает количество поданых заявлений по университету
        /// </summary>
        public AbitSpecStatistics[] UniveristyStatValues { get; set; }

        /// <summary>
        /// Получает или устанавливает данные по динамике заявлений по специальностям
        /// </summary>
        public AbitStatistics[] SpecStatValues { get; set; }        
        
    }
}