using System;
using System.Collections.Generic;
using System.Text;

namespace DelphiAnalyser.Analysers.StaticAnalysers.AnalyserSettings
{
    /// <summary>
    /// Базовые настройки
    /// </summary>
    [Serializable()]
    public class BaseSettings
    {
        private bool enabled;

        /// <summary>
        /// Анализатор включен
        /// </summary>
        public bool Enabled { get { return enabled; } set { enabled = value; } }
    }
}
