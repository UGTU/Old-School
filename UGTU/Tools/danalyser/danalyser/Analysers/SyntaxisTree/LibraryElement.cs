using System;
using System.Collections.Generic;
using System.Text;

namespace DelphiAnalyser.Analysers.SyntaxisTree
{
    public class LibraryElement: SyntaxElement
    {
        private IdElement name;
        private ImplementationElement implementation;
        private ExportsElement exports;
        private CompoundElement compound;

        public IdElement Name { get { return name; } }
        private ImplementationElement Implementation { get { return implementation; } }
        private ExportsElement Exports { get { return exports; } }
        private CompoundElement Compound { get { return compound; } }

        public LibraryElement(IdElement Name, ImplementationElement Implementation, ExportsElement Exports, CompoundElement Compound)
        {
            name = Name;
            implementation = Implementation;
            exports = Exports;
            compound = Compound;
        }
    }
}
