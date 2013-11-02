using System;
using System.Collections.Generic;
using System.Text;

namespace DelphiAnalyser.Analysers.StaticAnalysers.AnalyserSettings
{
    /// <summary>
    /// Настройки анализатора подключения dfm-файла
    /// </summary>
    [Serializable()]
    public class DfmIdsSettings: BaseStaticSettings
    {
        private bool show;

        /// <summary>
        /// Показывать в ошибках идентификаторы, найденные в dfm-файле
        /// </summary>
        public bool Show { get { return show; } set { show = value; } }
    }
}
