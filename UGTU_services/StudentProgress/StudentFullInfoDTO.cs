using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StudentProgress
{
    [Serializable]
    public class StudentFullInfoDTO
    {
        public string FamilyName { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string EMail { get; set; }
        public string DayMonth { get; set; }

        public int Grade { get; set; }
        public string GroupName { get; set; }
        public string TeachForm { get; set; }
        public string TeachBasis { get; set; }
        public string HomePhone { get; set; }
        public string MobilePhone { get; set; }
        public string FacName { get; set; }
        public string Specialty { get; set; }
        public string DeanFullName { get; set; }
    }    

}