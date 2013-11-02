using System;
using System.Collections.Generic;
using System.Text;
using System.Configuration;

namespace DelphiAnalyser.Analysers.StaticAnalysers.AnalyserSettings
{
    /// <summary>
    /// Базовые настройки
    /// </summary>
    [Serializable()]
    public class BaseStaticSettings: BaseSettings
    {
        private string message;
        private DelphiAnalyser.Addition.Importance level = new DelphiAnalyser.Addition.Importance();

        /// <summary>
        /// Сообщение анализатора
        /// </summary>
        public string Message { get { return message; } set { message = value; } }

        /// <summary>
        /// Уровень важности сообщения анализатора
        /// </summary>
        public int Level { get { return level.Value; } set { level.Value = value; } }
    }
}
