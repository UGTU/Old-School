using System;
using System.Collections.Generic;
using System.Text;
using System.IO;

namespace DelphiAnalyser.Addition.ParsingErrors
{
    /// <summary>
    /// Ошибка именования файла
    /// </summary>
    public class IdNameError: ParsingError
    {
        /// <summary>
        /// Информация об идентификаторе
        /// </summary>
        private string id;

        /// <summary>
        /// Идентификатор
        /// </summary>
        public string Id { get { return id; } }

        /// <summary>
        /// Конструктор
        /// </summary>
        /// <param name="Token">идентификатор</param>
        public IdNameError(string message, int level, FileInfo file, int position, Dictionary<string, string> metatags, string Id)
            : base(message, level, file, position, metatags)
        {
            id = Id;
        }
    }
}
