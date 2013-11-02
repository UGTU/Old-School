using System;
using System.Collections.Generic;
using System.Text;

namespace DelphiAnalyser.Analysers.DfmAnalysers
{
    /// <summary>
    /// Класс-токен
    /// </summary>
    public class DfmTokenInfo
    {
        private DfmTokens token;
        private string text;
        private int line;

        public DfmTokenInfo(DfmTokens token, string text, int line)
        {
            this.token = token;
            this.text = text;
            this.line = line;
        }

        public DfmTokens Token { get { return token; } }
        public string Text { get { return text; } }
        public int Line { get { return line; } }
    }
}
