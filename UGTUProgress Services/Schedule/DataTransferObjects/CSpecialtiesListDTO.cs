using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Schedule.DataTransferObjects
{
    [Serializable]
    public class SpecInfo
    {
        /// <summary>
        /// Получает или устанавливает идентификатор специальности факультета
        /// </summary>
        public int ID { get; set; }
        /// <summary>
        /// Получает или устанавливает идентификатор специальности
        /// </summary>
        public int SpecID { get; set; }
        /// <summary>
        /// Получает или устанавливает название специальности
        /// </summary>
        public string Name { get; set; }
    }

    [Serializable]
    public class CSpecialtiesListDTO
    {
        private SpecInfo[] FSpecialties;

        private CSpecialtiesListDTO(SpecInfo[] specs)
        {
            FSpecialties = specs;
        }

        public SpecInfo[] Specialties
        {
            get
            { return FSpecialties; }
        }
    }
}