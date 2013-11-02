using System;
using System.Collections.Generic;
using System.Text;

namespace DelphiAnalyser.Analysers.SyntaxisTree
{
    public class UsesElement: SyntaxElement
    {
        private List<UseElement> uses;

        public List<UseElement> Uses { get { return uses; } }

        public UsesElement(UseElement[] Uses)
        {
            uses = new List<UseElement>(Uses);
        }

        public void AddUnit(UseElement Unit)
        {
            uses.Add(Unit);
        }
    }
}
