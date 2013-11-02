using System;
using System.Collections.Generic;
using System.Text;
using System.Xml.Serialization;

namespace DelphiAnalyser.Addition
{
    [XmlRoot("Error")]
    public class SerializableError
    {
        private int level;
        private string message;
        private string unit;
        private int line;
        private string author;

        public int Level { get { return level; } set { level = value; } }
        public string Message { get { return message; } set { message = value; } }
        public string Unit { get { return unit; } set { unit = value; } }
        public int Line { get { return line; } set { line = value; } }
        public string Author { get { return author; } set { author = value; } }

        public SerializableError()
        {
            level = line = 0;
            message = unit = string.Empty;
        }

        public SerializableError(ParsingError e)
        {
            level = e.LevelNumber;
            message = e.Message;
            unit = e.File.FullName;
            line = e.Position;
            author = e.MetaTags["Author"];
        }
    }
}
