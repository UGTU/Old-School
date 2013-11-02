using System;
using System.Collections.Generic;
using System.Text;

namespace DelphiAnalyser.Analysers.SyntaxisTree
{
    public class IdListElement: SyntaxElement
    {
        private List<IdElement> ids;

        public List<IdElement> Ids { get { return ids; } }

        public IdListElement(IdElement[] Ids)
        {
            ids = new List<IdElement>(Ids);
        }

        public void AddId(IdElement Id)
        {
            ids.Add(Id);
        }
    }
}
