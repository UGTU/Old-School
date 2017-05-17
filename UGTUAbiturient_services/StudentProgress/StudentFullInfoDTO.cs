using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StudentProgress
{
    [Serializable]
    public class StudentFullInfoDTO
    {
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public string Patronymic { get; set; }


        public int? Grade { get; set; }
        public string GroupName { get; set; }
        public string TeachForm { get; set; }
        public string TeachBasis { get; set; }
        public string HomePhone { get; set; }
        public string MobilePhone { get; set; }
        public string FacName { get; set; }
        public string Specialty { get; set; }
        public string DeanFullName { get; set; }
        public DateTime? DateOut { get; set; }
    }    

}