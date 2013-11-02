using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;

namespace DelphiAnalyser.Analysers.StaticAnalysers.AnalyserSettings
{
    /// <summary>
    /// Хороший идентификатор
    /// </summary>
    [Serializable()]
    public class GoodId
    {
        private string value;

        [DisplayName("Идентификатор")]
        [Description("Идентификатор, который анализатор не будет считать неподходящим по длине")]
        public string Value { get { return value; } set { this.value = value; } }

        [Browsable(false)]
        public string Name { get { return "Идентификатор"; } }

        /// <summary>
        /// Конструктор
        /// </summary>
        public GoodId()
        {
            value = string.Empty;
        }

        /// <summary>
        /// Конструктор
        /// </summary>
        /// <param name="value">значение</param>
        public GoodId(string value)
        {
            this.value = value;
        }

        /// <summary>
        /// Сравнение с объектом
        /// </summary>
        /// <param name="obj">объект</param>
        /// <returns>результат сравнения</returns>
        public override bool Equals(object obj)
        {
            return (obj is GoodId)?value.ToLower().Equals((obj as GoodId).Value.ToLower()):base.Equals(obj);
        }
    }
}
