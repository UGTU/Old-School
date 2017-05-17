using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Abiturient.DataTransferObjects
{
    [Serializable]
    public class RecruitInfo
    {
            /// <summary>
            /// Получает или устанавливает идентификатор набора
            /// </summary>
            public int ID { get; set; }
            /// <summary>
            /// Получает или устанавливает название набора
            /// </summary>
            public string Name { get; set; }
        }
    }
