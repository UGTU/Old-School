using System;
using System.Collections.Generic;
using System.Text;

namespace DelphiAnalyser.Analysers.StaticAnalysers
{
    /// <summary>
    /// Атрибут - свойства анализатора по умолчанию
    /// </summary>
    public class StaticAnalyserDefaultSettingsAttribute: AnalyserDefaultSettingsAttribute
    {
        // имя
        private string message;
        private int level;

        /// <summary>
        /// Конструктор
        /// </summary>
        /// <param name="name">имя анализатора</param>
        /// <param name="message">сообщение анализатора</param>
        /// <param name="level">уровень важности ошибки</param>
        public StaticAnalyserDefaultSettingsAttribute(string name, string message, int level)
            :base(name)
        {
            this.message = message;
            this.level = level;
        }

        /// <summary>
        /// Сообщение анализатора
        /// </summary>
        public string Message { get { return message; } }

        /// <summary>
        /// Уровень важности ошибки
        /// </summary>
        public int Level { get { return level; } }
    }
}
