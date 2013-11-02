using System;
using System.Collections.Generic;
using System.Text;

namespace DelphiAnalyser.Addition
{
    /// <summary>
    /// Важность
    /// </summary>
    [Serializable()]
    public class Importance
    {
        private int value;

        /// <summary>
        /// Значение
        /// </summary>
        public int Value { get { return value; } set { this.value = (value > 0) ? ((value < 100) ? value : 100) : 1; } }

        public Importance()
        {
            this.value = 10;
        }

        public Importance(int value)
        {
            Value = value;
        }
    }
}
