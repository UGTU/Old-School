using System;
using AbitServices.DTO;

namespace AbitServices
{
    /// <summary>
    /// Класс названий отчётов по абитуриенту
    /// </summary>
    [Serializable]    
    public class AbitReport
    {
        /// <summary>
        /// Получает или устанавливает идентификатор отчёта
        /// </summary>
        public int Id { get; set; }
        /// <summary>
        /// Получает или устанавливает название отчёта
        /// </summary>
        public string ReportName { get; set; }
    }
}