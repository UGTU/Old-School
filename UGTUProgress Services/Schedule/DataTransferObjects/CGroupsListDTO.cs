using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Schedule.DataTransferObjects
{
    [Serializable]
    public class GroupInfo
    {
        /// <summary>
        /// Получает или устанавливает идентификатор 
        /// </summary>
        public int ID { get; set; }
        /// <summary>
        /// Получает или устанавливает название 
        /// </summary>
         public string Name { get; set; }

    }

    [Serializable]
    public class CGroupsListDTO
    {
        private GroupInfo[] FGroups;

        private CGroupsListDTO(GroupInfo[] groups)
        {
            FGroups = groups;
        }

        public GroupInfo[] Groups
        {
            get
            { return FGroups; }
        }
    }
}