using System;
using System.Collections.Generic;
using System.Text;

namespace DelphiAnalyser.Analysers.SyntaxisTree
{
    public class UnitElement: SyntaxElement
    {
        private IdElement name;
        private InterfaceSecElement uinterface;
        private ImplementationElement implementation;
        private InitializationElement initialization;
        private FinalizationElement finalization;

        public IdElement Name { get { return name; } }
        public InterfaceSecElement Interface { get { return uinterface; } }
        public ImplementationElement Implementation { get { return implementation; } }
        public InitializationElement Initialization { get { return initialization; } }
        public FinalizationElement Finalization { get { return finalization; } }

        public UnitElement(IdElement Name, InterfaceSecElement Interface, ImplementationElement Implementation, InitializationElement Initialization, FinalizationElement Finalization)
        {
            name = Name;
            uinterface = Interface;
            implementation = Implementation;
            initialization = Initialization;
            finalization = Finalization;
        }
    }
}
