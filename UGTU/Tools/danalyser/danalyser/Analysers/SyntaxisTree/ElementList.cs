using System;
using System.Collections.Generic;
using System.Text;

namespace DelphiAnalyser.Analysers.SyntaxisTree
{
    public class ElementList<T>: SyntaxElement
    {
        private List<T> elements;

        public List<T> Elements { get { return elements; } }

        public ElementList(T[] Range)
        {
            elements = new List<T>(Range);
        }

        public void AddElement(T Element)
        {
            elements.Add(Element);
        }
    }
}
