using System;
using System.Collections.Generic;
using System.Text;

namespace DelphiAnalyser.Analysers.StaticAnalysers
{
    /// <summary>
    /// Атрибут - свойства анализатора по умолчанию
    /// </summary>
    public class AnalyserDefaultSettingsAttribute : Attribute
    {
        // имя
        private string name;

        /// <summary>
        /// Конструктор
        /// </summary>
        /// <param name="name">имя анализатора</param>
        /// <param name="message">сообщение анализатора</param>
        /// <param name="level">уровень важности ошибки</param>
        public AnalyserDefaultSettingsAttribute(string name)
        {
            this.name = name;
        }

        /// <summary>
        /// Имя анализатора
        /// </summary>
        public string Name { get { return name; } }
    }
}
