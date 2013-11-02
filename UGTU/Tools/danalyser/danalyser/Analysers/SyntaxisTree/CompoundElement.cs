using System;
using System.Collections.Generic;
using System.Text;

namespace DelphiAnalyser.Analysers.SyntaxisTree
{
    public class CompoundElement: SyntaxElement
    {
        private List<StatementElement> statements;

        public List<StatementElement> Statements { get { return statements; } }

        public CompoundElement(StatementElement[] Statements)
        {
            statements = new List<StatementElement>(Statements);
        }

        public void AddStatement(StatementElement Statement)
        {
            statements.Add(Statement);
        }
    }
}
