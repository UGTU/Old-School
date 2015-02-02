using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Abiturient.DataTransferObjects
{
    [Serializable]
    public class AddressInfo
    {
        /// <summary>
        /// Получает или устанавливает идентификатор
        /// </summary>
        public int ID { get; set; }
        public int StreetKey { get; set; }
        public string StreetName { get; set; }
        public string Building { get; set; }
        public string Struct { get; set; }
        public string PostIndex { get; set; }
        public string FlatNum { get; set; }
    }
}