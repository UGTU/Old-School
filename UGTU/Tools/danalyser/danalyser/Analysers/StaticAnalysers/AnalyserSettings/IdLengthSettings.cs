using System;
using System.Collections.Generic;
using System.Text;

namespace DelphiAnalyser.Analysers.StaticAnalysers.AnalyserSettings
{
    /// <summary>
    /// Настройки анализатора проверки длины идентификатора
    /// </summary>
    [Serializable()]
    class IdLengthSettings: BaseStaticSettings
    {
        // допустимые длины
        private List<LengthConfig> lengths;

        private List<GoodId> stds;

        /// <summary>
        /// Допустимые длины
        /// </summary>
        public List<LengthConfig> Lengths
        {
            get
            {
                if (lengths == null)
                    lengths = new List<LengthConfig>();
                return lengths;
            }
            set { lengths = value; }
        }

        /// <summary>
        /// Стандартные идентификаторы, которые не будут обнаружены
        /// </summary>
        public List<GoodId> StdIdes
        {
            get
            {
                if (stds == null)
                    stds = new List<GoodId>();
                return stds;
            }
            set
            {
                stds = value;
            }
        }
    }
}
