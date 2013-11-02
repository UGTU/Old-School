using System;
using System.Collections.Generic;
using System.Text;

namespace DelphiAnalyser.Addition
{
    /// <summary>
    /// Локальная ошибка
    /// </summary>
    public class LocalError
    {
        private string message;
        private int level;

        public string Message { get { return message; } }
        public int Level { get { return level; } }

        public LocalError(string message, int level)
        {
            this.message = message;
            this.level = level;
        }
    }
}
