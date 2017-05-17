using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Schedule.DataTransferObjects
{
        [Serializable]
        public class TeacherInfo
        {
            /// <summary>
            /// Получает или устанавливает идентификатор 
            /// </summary>
            public int ID { get; set; }
            /// <summary>
            /// Получает или устанавливает табельный номер 
            /// </summary>
            public int TabNum { get; set; }
            /// <summary>
            /// Получает или устанавливает ФИО 
            /// </summary>
            public string Name { get; set; }
            /// <summary>
            /// Получает или устанавливает должность 
            /// </summary>
            public string Duty { get; set; }
        }

        [Serializable]
        public class CTeachersListDTO
        {
            private TeacherInfo[] FTeachers;

            private CTeachersListDTO(TeacherInfo[] teachers)
            {
                FTeachers = teachers;
            }

            public TeacherInfo[] Teachers
            {
                get
                { return FTeachers; }
            }
        }

}