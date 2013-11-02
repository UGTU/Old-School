using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;

namespace DelphiAnalyser.Analysers.StaticAnalysers.AnalyserSettings
{
    /// <summary>
    /// Настройка допустимой длины
    /// </summary>
    [Serializable()]
    public class LengthConfig
    {
        private int _from, _to;

        [Category("Допустимая длина")]
        [DisplayName("Минимальная")]
        [Description("Минимальная длина идентификатора (минимум 1).")]
        public int From { get { return _from; } set { _from = (value > 0) ? (((value > _to) && (_to != 0)) ? _to : value) : 1; } }

        [Category("Допустимая длина")]
        [DisplayName("Максимальная")]
        [Description("Максимальная длина идентификатора (0 - неограниченная длина).")]
        public int To { get { return _to; } set { _to = ((value >= _from) || (value == 0)) ? value : _from; } }

        [Browsable(false)]
        public string Name { get { return "Допустимая длина"; } }

        public LengthConfig(int from, int to)
        {
            _from = from;
            _to = to;
        }

        public LengthConfig()
        {
            _from = 1;
            _to = 1;
        }
    }
}
