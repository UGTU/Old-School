using System;
using System.Collections.Generic;
using System.Text;
using System.IO;

namespace DelphiAnalyser.Analysers.DfmAnalysers
{
    public class LexicalAnalyser
    {
        // Состояние
        private States state;

        // Текущий анализ
        private FileInfo file;
        private string source, currentId;
        private int index;
        private DfmTokens token;
        private DelphiAnalyser.Addition.FileMap filemap;
        private Dictionary<string, string> metatags;

        // ключевые слова
        private Dictionary<string, DfmTokens> keysymbols, keywords;

        // Карта файла
        public DelphiAnalyser.Addition.FileMap FileMap { get { return filemap; } }

        /// <summary>
        /// Инициализация ключевых слов
        /// </summary>
        private void InitKeyWords()
        {
            if (keywords == null)
            {
                keywords = new Dictionary<string,DfmTokens>();
                keywords.Add("object", DfmTokens.Object);
                keywords.Add("inherited", DfmTokens.Inherited);
                keywords.Add("inline", DfmTokens.Inline);
                keywords.Add("item", DfmTokens.Item);
                keywords.Add("end", DfmTokens.End);
            }
        }

        /// <summary>
        /// Инициализация ключевых неслов
        /// </summary>
        private void InitKeySymbols()
        {
            if (keysymbols == null)
            {
                keysymbols = new Dictionary<string, DfmTokens>();
                keysymbols.Add(".", DfmTokens.Dot);
                keysymbols.Add("(", DfmTokens.LBr);
                keysymbols.Add(")", DfmTokens.RBr);
                keysymbols.Add("[", DfmTokens.LSBr);
                keysymbols.Add("]", DfmTokens.RSBr);
                keysymbols.Add("<", DfmTokens.LTBr);
                keysymbols.Add(">", DfmTokens.RTBr);
                keysymbols.Add("{", DfmTokens.LFBr);
                keysymbols.Add("}", DfmTokens.RFBr);
                keysymbols.Add("=", DfmTokens.Assigment);
                keysymbols.Add("+", DfmTokens.Addition);
                keysymbols.Add("-", DfmTokens.Subtruction);
                keysymbols.Add(":", DfmTokens.Colon);
                keysymbols.Add(",", DfmTokens.Comma);
            }
        }

        /// <summary>
        /// Инициализация карты файла
        /// </summary>
        private void InitFileMap()
        {
            if (filemap == null)
                filemap = new DelphiAnalyser.Addition.FileMap();
            else filemap.Reset();
        }

        /// <summary>
        /// Инициализация
        /// </summary>
        private void Initialize()
        {
            InitKeyWords();
            InitKeySymbols();
            InitFileMap();
            index = 0;
            token = DfmTokens.Undefined;
            currentId = string.Empty;
        }

        /// <summary>
        /// Инициализация
        /// </summary>
        /// <param name="file">файл</param>
        /// <param name="source">исходный код</param>
        public void Initialize(FileInfo file, string source)
        {
            Initialize();
            this.file = file;
            this.source = source;
            state = States.Initialized;
        }

        /// <summary>
        /// Считывание очередного токена
        /// </summary>
        private void Scan()
        {
            token = DfmTokens.Undefined;
            currentId = string.Empty;
            if (index >= source.Length)
            {
                token = DfmTokens.FileEnd;
                return;
            }
            char c;
            int state = 1;
            while (index < source.Length)
            {
                c = source[index];
                switch (state)
                {
                    case 1:
                        if (DelphiAnalyser.Addition.DChar.IsLetter(c) || (c == '_'))
                        {
                            currentId += c;
                            token = DfmTokens.Id;
                            state = 2;
                        }
                        else if (DelphiAnalyser.Addition.DChar.IsHexSymbol(c))
                        {
                            currentId += c;
                            token = DfmTokens.Digits;
                            state = 3;
                        }
                        else
                        {
                            switch (c)
                            {
                                case '$':
                                    state = 4;
                                    break;
                                case '#':
                                    state = 6;
                                    break;
                                case '\'':
                                    state = 8;
                                    break;
                                case '\n':
                                    filemap.AddLine(index + 1);
                                    break;
                                case '.':
                                case '(':
                                case ')':
                                case '[':
                                case ']':
                                case '<':
                                case '>':
                                case '{':
                                case '}':
                                case '=':
                                case '+':
                                case '-':
                                case ':':
                                case ',':
                                    index++;
                                    token = keysymbols[c.ToString()];
                                    return;
                            }
                        }
                        break;
                    case 2:
                        if (DelphiAnalyser.Addition.DChar.IsLetterOrDigit(c) || (c == '_')) currentId += c;
                        else return;
                        break;
                    case 3:
                        if (DelphiAnalyser.Addition.DChar.IsHexSymbol(c)) currentId += c;
                        else return;
                        break;
                    case 4:
                        if (DelphiAnalyser.Addition.DChar.IsHexSymbol(c))
                        {
                            currentId += c;
                            token = DfmTokens.HexConstant;
                            state = 5;
                        }
                        break;
                    case 5:
                        if (DelphiAnalyser.Addition.DChar.IsHexSymbol(c)) currentId += c;
                        else return;
                        break;
                    case 6:
                        if (DelphiAnalyser.Addition.DChar.IsDigit(c))
                        {
                            currentId += c;
                            token = DfmTokens.Char;
                            state = 7;
                        }
                        else if (c == '$')
                        {
                            currentId += c;
                            state = 9;
                        }
                        else return;
                        break;
                    case 7:
                        if (DelphiAnalyser.Addition.DChar.IsDigit(c)) currentId += c;
                        else return;
                        break;
                    case 8:
                        if (c == '\'')
                        {
                            token = (currentId.Length == 1) ? DfmTokens.Char : DfmTokens.String;
                            index++;
                            return;
                        }
                        else if (c == '\n') return;
                        else currentId += c;
                        break;
                    case 9:
                        if (DelphiAnalyser.Addition.DChar.IsHexSymbol(c))
                        {
                            currentId += c;
                            token = DfmTokens.Char;
                            state = 10;
                        }
                        else return;
                        break;
                    case 10:
                        if (DelphiAnalyser.Addition.DChar.IsHexSymbol(c)) currentId += c;
                        else return;
                        break;
                }
                index++;
            }
        }

        /// <summary>
        /// Считывание очередного токена выделением ключевых слов
        /// </summary>
        private void SkipScan()
        {
            Scan();
            if ((token == DfmTokens.Id) && keywords.ContainsKey(currentId.ToLower()))
                token = keywords[currentId.ToLower()];
        }

        /// <summary>
        /// Информация о текущем токене
        /// </summary>
        public DfmTokenInfo Token
        {
            get
            {
                if (state == States.Initialized)
                    SkipScan();
                return new DfmTokenInfo(token, currentId, filemap.Line(index));
            }
        }

        /// <summary>
        /// Текущая строка в файле
        /// </summary>
        public int Line { get { return filemap.Line(index); } }

        /// <summary>
        /// Конструктор
        /// </summary>
        public LexicalAnalyser(Dictionary<string, string> metatags)
        {
            this.metatags = metatags;
            Initialize();
            state = States.Uninitialized;
        }

        /// <summary>
        /// Конструктор
        /// </summary>
        /// <param name="file">файл</param>
        /// <param name="source">исходный код</param>
        public LexicalAnalyser(Dictionary<string, string> metatags, FileInfo file, string source)
        {
            this.metatags = metatags;
            Initialize(file, source);
        }
    }
}
