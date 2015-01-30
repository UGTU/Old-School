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
            /// Получает или устанавливает табельный номер 
            /// </summary>
            public int TabNum { get; set; }
            /// <summary>
            /// Получает или устанавливает ФИО 
            /// </summary>
            public string Name { get; set; }
            /// <summary>
            /// Получает короткое ФИО 
            /// </summary>
            public string ShortName 
            {
                get
                {
                    try
                    {
                    int i = Name.IndexOf(" ");
                    int j = Name.IndexOf(" ",i+1);

                    return Name.Substring(0, i + 1) + " " + Name.Substring(i + 1, 1) + ". " + Name.Substring(j + 1, 1) + ".";
                    }
                        catch
                        {
                            return "";
                        }
                }
            }
            /// <summary>
            /// Получает или устанавливает должность 
            /// </summary>
            public string Duty { get; set; }

            public TeacherInfo()
            {
            }

            public TeacherInfo(string name)
            {
                Name = name;
            }

            public string ToString() 
            {
                return Name;
            }

        }

}