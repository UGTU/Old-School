using System;
using System.Collections.Generic;
using System.Text;

namespace DelphiAnalyser.Analysers.StaticAnalysers.AnalyserSettings
{
    /// <summary>
    /// Настройки анализатора проверки количества параметров функции
    /// </summary>
    [Serializable()]
    class FuncParamCountSettings: BaseStaticSettings
    {
        private int maxparam;

        /// <summary>
        /// Максимально допустимое количество параметров функции
        /// </summary>
        public int MaxParamCount { get { return maxparam; } set { maxparam = value; } }
    }
}
