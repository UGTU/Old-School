using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Text.RegularExpressions;

namespace DelphiAnalyser.Analysers
{
    /// <summary>
    /// Лексический анализатор
    /// </summary>
    public class LexicalAnalyser
    {
        // Сосстояние
        private States state;

        // Текущий анализ
        private FileInfo file;
        private string source, currentId;
        private int index;
        private DelphiTokens token;
        private DelphiAnalyser.Addition.FileMap filemap;
        private Dictionary<string, string> metatags;

        /// <summary>
        /// Регулярное выражение для поиска dfm-файлов
        /// </summary>
        private Regex DfmRegex;
        private Regex MetaRegex;

        public Dictionary<string, string> MetaTags { get { return metatags; } }

        // Наборы токенов
        // keywords - ключевые слова
        // keysymbols - ключевые "не слова" (:= , [ @ ^ etc)
        // canbeid - токен, который может быть как ключевым словом так и идентификатором
        // extraid - токен, который не может быть объявлен как Id, но это не мешает его использованию в качестве Id
        private Dictionary<string, DelphiTokens> keywords, keysymbols;
        private List<DelphiTokens> comments;

        /// <summary>
        /// Карта файла
        /// </summary>
        public DelphiAnalyser.Addition.FileMap FileMap { get { return filemap; } }

        /// <summary>
        /// Обнаружено подключение Dfm-файла
        /// </summary>
        public event EventHandler<AnalyserParameters> DfmInclusionEvent;

        /// <summary>
        /// Инициализация ключевых слов
        /// </summary>
        private void InitKeyWords()
        {
            if (keywords == null)
            {
                keywords = new Dictionary<string, DelphiTokens>();
                keywords.Add("program", DelphiTokens.Program);
                keywords.Add("library", DelphiTokens.Library);
                keywords.Add("unit", DelphiTokens.Unit);
                keywords.Add("initialization", DelphiTokens.Initialization);
                keywords.Add("implementation", DelphiTokens.Implementation);
                keywords.Add("finalization", DelphiTokens.Finalization);
                keywords.Add("uses", DelphiTokens.Uses);
                keywords.Add("exports", DelphiTokens.Exports);
                keywords.Add("type", DelphiTokens.Type);
                keywords.Add("var", DelphiTokens.Var);
                keywords.Add("const", DelphiTokens.Const);
                keywords.Add("resourcestring", DelphiTokens.Resourcestring);
                keywords.Add("threadvar", DelphiTokens.Threadvar);
                keywords.Add("interface", DelphiTokens.Interface);
                keywords.Add("dispinterface", DelphiTokens.Dispinterface);
                keywords.Add("class", DelphiTokens.Class);
                keywords.Add("object", DelphiTokens.Object);
                keywords.Add("record", DelphiTokens.Record);
                keywords.Add("set", DelphiTokens.Set);
                keywords.Add("array", DelphiTokens.Array);
                keywords.Add("file", DelphiTokens.File);
                keywords.Add("abstract", DelphiTokens.Abstract);
                keywords.Add("sealed", DelphiTokens.Sealed);
                keywords.Add("procedure", DelphiTokens.Procedure);
                keywords.Add("function", DelphiTokens.Function);
                keywords.Add("property", DelphiTokens.Property);
                keywords.Add("operator", DelphiTokens.Operator);
                keywords.Add("constructor", DelphiTokens.Constructor);
                keywords.Add("destructor", DelphiTokens.Destructor);
                keywords.Add("dispid", DelphiTokens.Dispid);
                keywords.Add("absolute", DelphiTokens.Absolute);
                keywords.Add("packed", DelphiTokens.Packed);
                keywords.Add("default", DelphiTokens.Default);
                keywords.Add("nodefault", DelphiTokens.Nodefault);
                keywords.Add("implements", DelphiTokens.Implements);
                keywords.Add("private", DelphiTokens.Private);
                keywords.Add("public", DelphiTokens.Public);
                keywords.Add("published", DelphiTokens.Published);
                keywords.Add("protected", DelphiTokens.Protected);
                keywords.Add("virtual", DelphiTokens.Virtual);
                keywords.Add("override", DelphiTokens.Override);
                keywords.Add("overload", DelphiTokens.Overload);
                keywords.Add("static", DelphiTokens.Static);
                keywords.Add("safecall", DelphiTokens.Safecall);
                keywords.Add("stdcall", DelphiTokens.Stdcall);
                keywords.Add("dynamic", DelphiTokens.Dynamic);
                keywords.Add("forward", DelphiTokens.Forward);
                keywords.Add("far", DelphiTokens.Far);
                keywords.Add("reintroduce", DelphiTokens.Reintroduce);
                keywords.Add("register", DelphiTokens.Register);
                keywords.Add("stored", DelphiTokens.Stored);
                keywords.Add("automated", DelphiTokens.Automated);
                keywords.Add("cdecl", DelphiTokens.Cdecl);
                keywords.Add("varargs", DelphiTokens.Varargs);
                keywords.Add("message", DelphiTokens.Message);
                keywords.Add("assembler", DelphiTokens.Assembler);
                keywords.Add("name", DelphiTokens.Name);
                keywords.Add("near", DelphiTokens.Near);
                keywords.Add("export", DelphiTokens.Export);
                keywords.Add("local", DelphiTokens.Local);
                keywords.Add("external", DelphiTokens.External);
                keywords.Add("resident", DelphiTokens.Resident);
                keywords.Add("in", DelphiTokens.In);
                keywords.Add("out", DelphiTokens.Out);
                keywords.Add("read", DelphiTokens.Read);
                keywords.Add("write", DelphiTokens.Write);
                keywords.Add("asm", DelphiTokens.Asm);
                keywords.Add("begin", DelphiTokens.Begin);
                keywords.Add("end", DelphiTokens.End);
                keywords.Add("if", DelphiTokens.If);
                keywords.Add("then", DelphiTokens.Then);
                keywords.Add("else", DelphiTokens.Else);
                keywords.Add("case", DelphiTokens.Case);
                keywords.Add("of", DelphiTokens.Of);
                keywords.Add("while", DelphiTokens.While);
                keywords.Add("for", DelphiTokens.For);
                keywords.Add("to", DelphiTokens.To);
                keywords.Add("downto", DelphiTokens.Downto);
                keywords.Add("do", DelphiTokens.Do);
                keywords.Add("until", DelphiTokens.Until);
                keywords.Add("repeat", DelphiTokens.Repeat);
                keywords.Add("try", DelphiTokens.Try);
                keywords.Add("except", DelphiTokens.Except);
                keywords.Add("finally", DelphiTokens.Finally);
                keywords.Add("goto", DelphiTokens.Goto);
                keywords.Add("label", DelphiTokens.Label);
                keywords.Add("with", DelphiTokens.With);
                keywords.Add("as", DelphiTokens.As);
                keywords.Add("is", DelphiTokens.Is);
                keywords.Add("at", DelphiTokens.At);
                keywords.Add("on", DelphiTokens.On);
                keywords.Add("raise", DelphiTokens.Raise);
                keywords.Add("not", DelphiTokens.Not);
                keywords.Add("and", DelphiTokens.And);
                keywords.Add("xor", DelphiTokens.Xor);
                keywords.Add("or", DelphiTokens.Or);
                keywords.Add("shl", DelphiTokens.Shl);
                keywords.Add("shr", DelphiTokens.Shr);
                keywords.Add("div", DelphiTokens.Div);
                keywords.Add("mod", DelphiTokens.Mod);
                keywords.Add("true", DelphiTokens.True);
                keywords.Add("false", DelphiTokens.False);
                keywords.Add("inherited", DelphiTokens.Inherited);
            }
        }

        /// <summary>
        /// Инициализация ключевых "не слов"
        /// </summary>
        private void InitKeySymbols()
        {
            if (keysymbols == null)
            {
                keysymbols = new Dictionary<string, DelphiTokens>();
                keysymbols.Add("+", DelphiTokens.Addition);
                keysymbols.Add("*", DelphiTokens.Multiply);
                keysymbols.Add("-", DelphiTokens.Subtraction);
                keysymbols.Add("/", DelphiTokens.Division);
                keysymbols.Add("=", DelphiTokens.Equal);
                keysymbols.Add("<", DelphiTokens.Less);
                keysymbols.Add(">", DelphiTokens.Greater);
                keysymbols.Add("<=", DelphiTokens.LessOrEqual);
                keysymbols.Add(">=", DelphiTokens.GreaterOrEqual);
                keysymbols.Add("<>", DelphiTokens.NotEqual);
                keysymbols.Add(":=", DelphiTokens.Assigment);
                keysymbols.Add(".", DelphiTokens.Dot);
                keysymbols.Add("..", DelphiTokens.Interval);
                keysymbols.Add(":", DelphiTokens.Colon);
                keysymbols.Add(",", DelphiTokens.Comma);
                keysymbols.Add(";", DelphiTokens.Semicolon);
                keysymbols.Add("'", DelphiTokens.String);
                keysymbols.Add("[", DelphiTokens.LSBr);
                keysymbols.Add("]", DelphiTokens.RSBr);
                keysymbols.Add("(", DelphiTokens.LBr);
                keysymbols.Add(")", DelphiTokens.RBr);
                keysymbols.Add("{", DelphiTokens.LFBr);
                keysymbols.Add("}", DelphiTokens.RFBr);
                keysymbols.Add("/*", DelphiTokens.LCBr);
                keysymbols.Add("*/", DelphiTokens.RCBr);
                keysymbols.Add("(*", DelphiTokens.LRBr);
                keysymbols.Add("*)", DelphiTokens.RRBr);
                keysymbols.Add("//", DelphiTokens.LDBr);
                keysymbols.Add("@", DelphiTokens.AtSign);
                keysymbols.Add("^", DelphiTokens.Caret);
                keysymbols.Add("\n", DelphiTokens.NewLine);
                keysymbols.Add("$", DelphiTokens.HexConstant);
                keysymbols.Add("#", DelphiTokens.Char);
            }
        }

        private void InitComments()
        {
            if (comments == null)
            {
                comments = new List<DelphiTokens>();
                comments.Add(DelphiTokens.LComment);
                comments.Add(DelphiTokens.MLComment);
                comments.Add(DelphiTokens.OComment);
                comments.Add(DelphiTokens.BComment);
            }
        }

        private void InitFileMap()
        {
            if (filemap == null)
                filemap = new DelphiAnalyser.Addition.FileMap();
            else filemap.Reset();
        }

        private void InitMetaTags()
        {
            if (metatags == null)
            {
                metatags = new Dictionary<string, string>();
                metatags.Add("Author", string.Empty);
            }
        }

        /// <summary>
        /// Инициализация анализатора
        /// </summary>
        private void Initialize()
        {
            InitKeyWords();
            InitKeySymbols();
            InitComments();
            InitFileMap();
            InitMetaTags();
            DfmRegex = new Regex("^\\$R (?<dfm>.*)\\.dfm$", RegexOptions.IgnoreCase);
            List<string> keys = new List<string>(metatags.Keys);
            string regex = string.Empty;
            foreach (string metatag in keys)
            {
                regex = string.Format("{0}|(\\#{1}\\s+(?<{1}Data>[^\\n]*)\\s*$)", regex, metatag);
                metatags[metatag] = string.Empty;
            }
            if (regex.Length > 0) regex = string.Format("^{0}", regex.Substring(1));
            MetaRegex = new Regex(regex, RegexOptions.IgnoreCase);
            index = 0;
            token = DelphiTokens.Undefined;
            currentId = string.Empty;
        }

        /// <summary>
        /// Привязка анализатора к файлу
        /// </summary>
        /// <param name="file">информация о файле</param>
        /// <param name="source">анализируемый код</param>
        public void Initialize(FileInfo file, string source)
        {
            Initialize();
            this.file = file;
            this.source = source;
            state = States.Initialized;
        }

        /// <summary>
        /// Чтение одного токена
        /// </summary>
        private void Scan()
        {
            token = DelphiTokens.Undefined;
            currentId = string.Empty;
            if (index >= source.Length)
            {
                token = DelphiTokens.FileEnd;
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
                            token = DelphiTokens.Id;
                            state = 2;
                        }
                        else if (DelphiAnalyser.Addition.DChar.IsDigit(c))
                        {
                            currentId += c;
                            token = DelphiTokens.Digits;
                            state = 3;
                        }
                        else
                        {
                            switch (c)
                            {
                                case '/':
                                    token = DelphiTokens.Division;
                                    state = 4;
                                    break;
                                case '>':
                                    token = DelphiTokens.Greater;
                                    state = 8;
                                    break;
                                case '<':
                                    token = DelphiTokens.Less;
                                    state = 9;
                                    break;
                                case '.':
                                    token = DelphiTokens.Dot;
                                    state = 10;
                                    break;
                                case ':':
                                    token = DelphiTokens.Colon;
                                    state = 11;
                                    break;
                                case '$':
                                    state = 12;
                                    break;
                                case '#':
                                    state = 14;
                                    break;
                                case '\'':
                                    state = 16;
                                    break;
                                case '(':
                                    token = DelphiTokens.LBr;
                                    state = 17;
                                    break;
                                case '{':
                                    token = DelphiTokens.OComment;
                                    state = 20;
                                    break;
                                case '\n':
                                    filemap.AddLine(index + 1);
                                    break;
                                case '*':
                                case '+':
                                case '-':
                                case '=':
                                case ',':
                                case ';':
                                case ')':
                                case '[':
                                case ']':
                                case '}':
                                case '@':
                                case '^':
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
                        if (DelphiAnalyser.Addition.DChar.IsDigit(c)) currentId += c;
                        else return;
                        break;
                    case 4:
                        switch (c)
                        {
                            case '/':
                                token = DelphiTokens.LComment;
                                state = 5;
                                break;
                            case '*':
                                token = DelphiTokens.MLComment;
                                state = 6;
                                break;
                            default:
                                return;
                        }
                        break;
                    case 5:
                        if (c == '\n') return;
                        else currentId += c;
                        break;
                    case 6:
                        if (c == '*')
                            state = 7;
                        else
                        {
                            if (c == '\n') filemap.AddLine(index + 1);
                            currentId += c;
                        }
                        break;
                    case 7:
                        if (c == '/')
                        {
                            index++;
                            return;
                        }
                        else
                        {
                            currentId += '*';
                            if (c != '*')
                            {
                                if (c == '\n') filemap.AddLine(index + 1);
                                currentId += c;
                                state = 6;
                            }
                        }
                        break;
                    case 8:
                        if (c == '=')
                        {
                            token = DelphiTokens.GreaterOrEqual;
                            index++;
                        }
                        return;
                    case 9:
                        switch (c)
                        {
                            case '=':
                                token = DelphiTokens.LessOrEqual;
                                index++;
                                break;
                            case '>':
                                token = DelphiTokens.NotEqual;
                                index++;
                                return;
                        }
                        return;
                    case 10:
                        if (c == '.')
                        {
                            token = DelphiTokens.Interval;
                            index++;
                        }
                        return;
                    case 11:
                        if (c == '=')
                        {
                            token = DelphiTokens.Assigment;
                            index++;
                        }
                        return;
                    case 12:
                        if (DelphiAnalyser.Addition.DChar.IsHexSymbol(c))
                        {
                            currentId += c;
                            token = DelphiTokens.HexConstant;
                            state = 13;
                        }
                        break;
                    case 13:
                        if (DelphiAnalyser.Addition.DChar.IsHexSymbol(c)) currentId += c;
                        else return;
                        break;
                    case 14:
                        if (DelphiAnalyser.Addition.DChar.IsDigit(c))
                        {
                            currentId += c;
                            token = DelphiTokens.Char;
                            state = 15;
                        }
                        else if (c == '$')
                        {
                            currentId += c;
                            state = 21;
                        }
                        else return;
                        break;
                    case 15:
                        if (DelphiAnalyser.Addition.DChar.IsDigit(c)) currentId += c;
                        else return;
                        break;
                    case 16:
                        if (c == '\'')
                        {
                            token = (currentId.Length == 1) ? DelphiTokens.Char : DelphiTokens.String;
                            index++;
                            return;
                        }
                        else if (c == '\n') return;
                        else currentId += c;
                        break;
                    case 17:
                        if (c == '*')
                        {
                            token = DelphiTokens.BComment;
                            state = 18;
                        }
                        else return;
                        break;
                    case 18:
                        if (c == '*')
                            state = 19;
                        else
                        {
                            if (c == '\n') filemap.AddLine(index + 1);
                            currentId += c;
                        }
                        break;
                    case 19:
                        if (c == ')')
                        {
                            index++;
                            return;
                        }
                        else
                        {
                            currentId += '*';
                            if (c != '*')
                            {
                                if (c == '\n') filemap.AddLine(index + 1);
                                currentId += c;
                                state = 18;
                            }
                        }
                        break;
                    case 20:
                        if (c == '}')
                        {
                            index++;
                            return;
                        }
                        else
                        {
                            if (c == '\n') filemap.AddLine(index + 1);
                            currentId += c;
                        }
                        break;
                    case 21:
                        if (DelphiAnalyser.Addition.DChar.IsHexSymbol(c))
                        {
                            currentId += c;
                            token = DelphiTokens.Char;
                            state = 22;
                        }
                        else return;
                        break;
                    case 22:
                        if (DelphiAnalyser.Addition.DChar.IsHexSymbol(c)) currentId += c;
                        else return;
                        break;
                }
                index++;
            }
        }

        /// <summary>
        /// Считывание токена с игнорирование комментариев
        /// </summary>
        private void SkipScan()
        {
            Scan();
            while (comments.Contains(token))
            {
                if (token == DelphiTokens.OComment)
                {
                    Match match = DfmRegex.Match(currentId);
                    if (match.Success)
                    {
                        string filename = (match.Groups["dfm"].Captures[0].Value == "*") ? file.Name.Substring(0, file.Name.LastIndexOf(".")) : match.Groups["dfm"].Captures[0].Value;
                        filename = string.Format("{0}\\{1}.dfm", file.DirectoryName, filename);
                        if (DfmInclusionEvent != null)
                        {
                            AnalyserParameters p = new AnalyserParameters(new FileInfo(filename));
                            p.AddToken(new TokenInfo(DelphiTokens.OComment, currentId, Line, metatags));
                            DfmInclusionEvent(this, p);
                        }
                    }
                    else
                    {
                        MatchCollection matches = MetaRegex.Matches(currentId);
                        foreach (Match m in matches)
                        {
                            List<string> keys = new List<string>(metatags.Keys);
                            foreach (string metatag in keys)
                            {
                                if (m.Groups[string.Format("{0}Data", metatag)].Captures.Count > 0)
                                    metatags[metatag] = m.Groups[string.Format("{0}Data", metatag)].Value;
                            }
                        }
                    }
                }
                Scan();
            }
            if ((token == DelphiTokens.Id) && keywords.ContainsKey(currentId.ToLower()))
                token = keywords[currentId.ToLower()];
        }

        /// <summary>
        /// Чтение токена
        /// </summary>
        /// <returns>информация о считанном токене</returns>
        public TokenInfo Token
        {
            get
            {
                if (state == States.Initialized)
                    SkipScan();
                return new TokenInfo(token, currentId, filemap.Line(index), metatags);
            }
        }

        /// <summary>
        /// Заглядывание вперед
        /// </summary>
        /// <returns>следующий токен</returns>
        public TokenInfo NextToken
        {
            get
            {
                int index = this.index;
                string currentId = this.currentId;
                DelphiTokens token = this.token;
                SkipScan();
                TokenInfo t = new TokenInfo(this.token, this.currentId, filemap.Line(this.index), metatags);
                this.index = index;
                this.currentId = currentId;
                this.token = token;
                return t;
            }
        }

        /// <summary>
        /// Текущий номер строки
        /// </summary>
        public int Line { get { return filemap.Line(index); }  }

        /// <summary>
        /// Конструктор
        /// </summary>
        public LexicalAnalyser()
        {
            Initialize();
            state = States.Uninitialized;
        }

        /// <summary>
        /// Конструктор с инициализацией
        /// </summary>
        /// <param name="file">файл</param>
        /// <param name="source">исходный код</param>
        public LexicalAnalyser(FileInfo file, string source)
        {
            Initialize(file, source);
        }
    }
}
