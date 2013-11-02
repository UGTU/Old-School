using System;
using System.Collections.Generic;
using System.Text;

namespace DelphiAnalyser.Analysers
{
    /// <summary>
    /// Класс-токен
    /// </summary>
    public class TokenInfo
    {
        private DelphiTokens token;
        private string text;
        private int line;
        private Dictionary<string, string> metatags;

        public TokenInfo(DelphiTokens token, string text, int line, Dictionary<string, string> metatags)
        {
            this.token = token;
            this.text = text;
            this.line = line;
            this.metatags = metatags;
        }

        public DelphiTokens Token { get { return token; } }
        public string Text { get { return text; } }
        public int Line { get { return line; } }
        public Dictionary<string, string> MetaTags { get { return metatags; } }
    }
}
