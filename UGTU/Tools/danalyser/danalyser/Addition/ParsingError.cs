using System;
using System.Collections.Generic;
using System.Text;
using System.IO;

namespace DelphiAnalyser.Addition
{
    /// <summary>
    /// аналитическое предупреждение (обнаружено нарушение)
    /// </summary>
    public class ParsingError : Exception
    {
        private string message;
        private DelphiAnalyser.Addition.Importance level;
        private FileInfo file;
        private int position;
        private Dictionary<string, string> metatags;

        private ErrorLevel GetErrorLevel(int l)
        {
            if (l < 31) return ErrorLevel.Hint;
            if (l < 66) return ErrorLevel.Alert;
            return ErrorLevel.Error;
        }

        public ParsingError(string message, int level, FileInfo file, int position, Dictionary<string, string> metatags)
        {
            this.message = message;
            this.level = new Importance(level);
            this.file = file;
            this.position = position;
            this.metatags = metatags;
        }

        public string Message { get { return message; } }
        public int LevelNumber { get { return level.Value; } }
        public ErrorLevel Level { get { return GetErrorLevel(level.Value); } }
        public FileInfo File { get { return file; } }
        public int Position { get { return position; } }
        public Dictionary<string, string> MetaTags { get { return metatags; } set { metatags = value; } }
    }
}
