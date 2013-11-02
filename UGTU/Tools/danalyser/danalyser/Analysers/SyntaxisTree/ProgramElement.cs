using System;
using System.Collections.Generic;
using System.Text;

namespace DelphiAnalyser.Analysers.SyntaxisTree
{
    public class ProgramElement: SyntaxElement
    {
        private IdElement name;
        private IdListElement pparams;
        private ImplementationElement implementation;
        private CompoundElement compound;

        public IdElement Name { get { return name; } }
        public IdListElement Params { get { return pparams; } }
        public ImplementationElement Implementation { get { return implementation; } }
        public CompoundElement Compound { get { return compound; } }

        public ProgramElement(IdElement Name, IdListElement Params, ImplementationElement Implementation, CompoundElement Compound)
        {
            name = Name;
            pparams = Params;
            implementation = Implementation;
            compound = Compound;
        }
    }
}
