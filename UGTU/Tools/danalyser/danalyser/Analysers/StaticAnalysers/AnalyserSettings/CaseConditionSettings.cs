using System;
using System.Collections.Generic;
using System.Text;

namespace DelphiAnalyser.Analysers.StaticAnalysers.AnalyserSettings
{
    /// <summary>
    /// Настройки анализатора проверки Magic Numbers
    /// </summary>
    [Serializable()]
    public class CaseConditionSettings: BaseStaticSettings
    {
        private List<double> stds;
        private bool locatestd;
        private DelphiAnalyser.Addition.Importance level;

        /// <summary>
        /// Стандартные Magic Numbers (eg 0,1,10,100...)
        /// </summary>
        public List<double> StdNumbers
        {
            get
            {
                if (stds == null)
                    stds = new List<double>();
                return stds;
            }
            set
            {
                stds = value;
            }
        }

        /// <summary>
        /// Обнаруживать ли стандартные Magic Numbers
        /// </summary>
        public bool LocateStd { get { return locatestd; } set { locatestd = value; } }

        /// <summary>
        /// Уровень важности ошибки
        /// </summary>
        public int StdLevel
        {
            get
            {
                return level.Value;
            }
            set
            {
                if (level == null)
                    level = new DelphiAnalyser.Addition.Importance(value);
                else level.Value = value;
            }
        }
    }
}
