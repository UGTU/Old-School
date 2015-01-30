using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Abiturient.DataTransferObjects
{
    [Serializable]
    public class DocInfo
    {
        /// <summary>
        /// Получает или устанавливает идентификатор
        /// </summary>
        public int ID { get; set; }
        public int DocTypeKey { get; set; }
        public string DocTypeName { get; set; }

        public string Serie { get; set; }
        public string Number { get; set; }
        public DateTime? Given { get; set; }
        public string GivenBy { get; set; }

    }
}