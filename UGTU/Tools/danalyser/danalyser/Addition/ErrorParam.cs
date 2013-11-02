using System;
using System.Collections.Generic;
using System.Text;

namespace DelphiAnalyser.Addition
{
    /// <summary>
    /// Параметр-ошибка для события
    /// </summary>
    public class ErrorParam: EventArgs
    {
        private ParsingError error;
        public ParsingError Error { get { return error; } }

        public ErrorParam(ParsingError e)
        {
            error = e;
        }
    }
}
