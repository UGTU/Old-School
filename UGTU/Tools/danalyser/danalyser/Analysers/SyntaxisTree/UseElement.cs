using System;
using System.Collections.Generic;
using System.Text;

namespace DelphiAnalyser.Analysers.SyntaxisTree
{
    public class UseElement: SyntaxElement
    {
        private IdElement unit;
        private IdListElement unitin;

        public IdElement Unit { get { return unit; } }
        public IdListElement In { get { return unitin; } }

        public UseElement(IdElement Unit, IdListElement In)
        {
            unit = Unit;
            unitin = In;
        }
    }
}
