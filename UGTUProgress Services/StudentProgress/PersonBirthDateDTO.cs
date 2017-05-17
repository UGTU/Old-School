using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StudentProgress
{
    [Serializable]
    public class PersonBirthDateDTO
    {
        public string FamilyName { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public DateTime BirthDate { get; set; }
        public string EMail { get; set; }
        public string DayMonth { get; set; }
    }    
}