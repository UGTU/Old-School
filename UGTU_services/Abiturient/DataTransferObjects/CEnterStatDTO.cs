using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Abiturient.DataTransferObjects
{
    [Serializable]
    public class EnterInfo
    {
        /// <summary>
        /// Получает или устанавливает идентификатор
        /// </summary>
        public AppInfo Application;

        public int? AvgBall;

        public int? PassBall;

        public bool Passes()
        {
            return AvgBall >= PassBall;
        }

    }
}