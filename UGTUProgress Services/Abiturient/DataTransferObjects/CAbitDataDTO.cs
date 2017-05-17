using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Abiturient.DataTransferObjects
{
    [Serializable]
    public class AbitInfo
    {
        /// <summary>
        /// Получает или устанавливает идентификатор
        /// </summary>
        public int ID { get; set; }
        /// <summary>
        /// Получает или устанавливает название 
        /// </summary>
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public string MidName { get; set; }
        public DateTime? Birth { get; set; }
        public string BirthPlace { get; set; } 
        public bool? IsPhysChallenged { get; set; }
        public bool? HasKids { get; set; }
        public bool? HasJob { get; set; }
        public bool? IsMale { get; set; } 
        public bool? NeedsRoom { get; set; }
        public int? MedalKey { get; set; }
        public int? MilStateKey { get; set; }
        public string CellPhone { get; set; } 
        public string Phone { get; set; }
        public string eMail { get; set; }
        public int? CitizenshipKey { get; set; } 
        public int? PrepKey { get; set; }
        public int? CommunityJobKey { get; set; } 
        public int? FamStateKey { get; set; } 
        public int? SpecCountKey { get; set; } 
        public int? SchoolKey { get; set; } 
        public int? GraduateYear { get; set; }  
        public string FactIndex { get; set; } 
        public int? FactStreetKey { get; set; } 
        public string FactBuilding { get; set; }
        public string FactFlat { get; set; }
        public string SignIndex { get; set; } 
        public int? SignStreetKey { get; set; } 
        public string SignBuilding { get; set; } 
        public string SignFlat { get; set; } 
        public string AdditionalInfo { get; set; } 
        public int? ServiceRecYears { get; set; } 
        public int? ServiceRecMonths { get; set; } 
        public string Duty { get; set; } 
        public int? OrganizationKey { get; set; }
        public string Benefits { get; set; }

        public DocInfo IDDocument;
        public DocInfo EdDocument;

        public AddressInfo SignAddress;
        public AddressInfo FactAddress;

        public LangKnowledgeInfo BaseLang;
        public List<LangKnowledgeInfo> Langs;
        
    }
}