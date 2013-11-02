using System;
using System.Collections.Generic;
using System.Text;

namespace DelphiAnalyser.Analysers.SyntaxisTree
{
    public class IdElement: SyntaxElement
    {
        private TokenInfo token;

        public TokenInfo Token { get { return token; } }

        public IdElement(TokenInfo Token)
        {
            token = Token;
        }
    }
}
