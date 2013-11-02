using System;
using System.Collections.Generic;
using System.Text;

namespace DelphiAnalyser.Analysers.StaticAnalysers.AnalyserSettings
{
    /// <summary>
    /// Настройки регулярного анализатора
    /// </summary>
    [Serializable()]
    public class RegularSettings: BaseSettings
    {
        private List<AnalyserSettings.RegularExpression> regexes;

        /// <summary>
        /// Регулярные выражения
        /// </summary>
        public List<AnalyserSettings.RegularExpression> Regexes
        {
            get
            {
                if (regexes == null)
                    regexes = new List<AnalyserSettings.RegularExpression>();
                return regexes;
            }
            set
            {
                regexes = value;
            }
        }
    }
}
