using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Abiturient.DataTransferObjects
{
    [Serializable]
    public class AddressKeysInfo
    {
        /// <summary>
        /// Получает или устанавливает идентификатор
        /// </summary>
        public int ID { get; set; }
        public int TownKey { get; set; }
        public int RaionKey { get; set; }
        public int RegionKey { get; set; }
        public int CountryKey{ get; set; }
    }
}