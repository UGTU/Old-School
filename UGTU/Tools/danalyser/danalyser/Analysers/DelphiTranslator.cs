/*
using System;
using System.Collections.Generic;
using System.Text;
using System.IO;

namespace DelphiAnalyser.Analysers
{
    class DelphiTranslator
    {
        /// <summary>
        /// Состояние
        /// </summary>
        private States state;

        /// <summary>
        /// Текущий процесс трансляции
        /// </summary>
        private FileInfo file;
        private string source, currentId;
        private int index, line;
        private DelphiTokens token;

        /// <summary>
        /// Наборы токенов
        /// keywords - ключевые слова
        /// keysymbols - ключевые "не слова" (:= , [ @ ^ etc)
        /// canbeid - токен, который может быть как ключевым словом так и идентификатором
        /// extraid - токен, который не может быть объявлен как Id, но это не мешает его использованию в качестве Id
        /// comments - токены, с которых начинаются комментарии
        /// dualtokens - парные токены
        /// </summary>
        private Dictionary<string, DelphiTokens> keywords, keysymbols;
        private List<DelphiTokens> canbeid, extraid, comments;
        private Dictionary<DelphiTokens, DelphiTokens> dualtokens;

        /// <summary>
        /// Операция над числами
        /// </summary>
        /// <param name="o1">первый оператор</param>
        /// <param name="o2">второй оператор</param>
        /// <returns>результат</returns>
        private delegate double calculation(double o1, double o2);

        /// <summary>
        /// Стек и таблица символов
        /// </summary>
        private class eValue
        {
            public double value;
            public bool undef;

            public eValue()
            {
                this.value = 0;
                undef = true;
            }

            public eValue(double value)
            {
                this.value = value;
                undef = true;
            }

            public eValue(eValue v1, eValue v2, calculation operation)
            {
                this.undef = v1.undef || v2.undef;
                this.value = operation(v1.value, v2.value);
            }
        }
        private Stack<eValue> stack;
        private Dictionary<string, eValue> symbols;

        /// <summary>
        /// Ошибки, найденные анализатором
        /// </summary>
        private List<DelphiAnalyser.Addition.ParsingError> errors;

        /// <summary>
        /// Одиночка
        /// </summary>
        private static DelphiTranslator instance;

        public static DelphiTranslator Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DelphiTranslator();
                    instance.Initialize();
                    instance.state = States.Uninitialized;
                }
                return instance;
            }
        }

        /// <summary>
        /// Инициализирует ключевые слова
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
        /// Инициализируемт ключевые "не слова"
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
                keysymbols.Add("", DelphiTokens.RCBr);
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

        /// <summary>
        /// Инициализирует токены, которые могут быть как ключевым слово
        /// </summary>
        private void InitCanBeId()
        {
            if (canbeid == null)
            {
                canbeid = new List<DelphiTokens>();
                canbeid.Add(DelphiTokens.Name);
                canbeid.Add(DelphiTokens.Register);
                canbeid.Add(DelphiTokens.Message);
                canbeid.Add(DelphiTokens.Read);
                canbeid.Add(DelphiTokens.Write);
                canbeid.Add(DelphiTokens.Default);
            }
        }

        /// <summary>
        /// Инициализация "экстра" токенов
        /// </summary>
        private void InitExtraId()
        {
            if (extraid == null)
            {
                extraid = new List<DelphiTokens>();
                extraid.Add(DelphiTokens.End);
            }
        }

        /// <summary>
        /// Инициализирует комментарии
        /// </summary>
        private void InitComments()
        {
            if (comments == null)
            {
                comments = new List<DelphiTokens>();
                comments.Add(DelphiTokens.LFBr);
                comments.Add(DelphiTokens.LCBr);
                comments.Add(DelphiTokens.LDBr);
                comments.Add(DelphiTokens.LRBr);
            }
        }

        /// <summary>
        /// Инициализирует парные токены
        /// </summary>
        private void InitDualTokens()
        {
            if (dualtokens == null)
            {
                dualtokens = new Dictionary<DelphiTokens, DelphiTokens>();
                dualtokens.Add(DelphiTokens.LBr, DelphiTokens.RBr);
                dualtokens.Add(DelphiTokens.LCBr, DelphiTokens.RCBr);
                dualtokens.Add(DelphiTokens.LSBr, DelphiTokens.RSBr);
                dualtokens.Add(DelphiTokens.LFBr, DelphiTokens.RFBr);
                dualtokens.Add(DelphiTokens.LDBr, DelphiTokens.NewLine);
                dualtokens.Add(DelphiTokens.LRBr, DelphiTokens.RRBr);
            }
        }

        /// <summary>
        /// Инициализирует транслятор
        /// </summary>
        private void Initialize()
        {
            InitKeyWords();
            InitKeySymbols();
            InitCanBeId();
            InitExtraId();
            InitComments();
            InitDualTokens();
            if (stack == null)
                stack = new Stack<eValue>();
            stack.Clear();
            if (symbols == null)
                symbols = new Dictionary<string, eValue>();
            symbols.Clear();
            if (errors == null)
                errors = new List<ParsingError>();
            errors.Clear();
            index = 0;
            line = 1;
            token = DelphiTokens.Undefined;
            currentId = string.Empty;
        }

        /// <summary>
        /// Привязывает транслятор к файлу
        /// </summary>
        /// <param name="file">информация о файле</param>
        /// <param name="source">транслируемый код</param>
        public void Initialize(FileInfo file, string source)
        {
            Initialize();
            this.file = file;
            this.source = source;
            state = States.Initialized;
        }

        /// <summary>
        /// Добавляет ошибку в список
        /// </summary>
        /// <param name="error">сообщение ошибки</param>
        /// <param name="level">уровень важности</param>
        private void AddError(DelphiAnalyser.Addition.ErrorTypes e)
        {
            errors.Add(new ParsingError(DelphiAnalyser.Controllers.ErrorController.Instance.Errors[e].message, DelphiAnalyser.Controllers.ErrorController.Instance.Errors[e].level, file, line));
        }

        private void AddOnError(DelphiAnalyser.Addition.ErrorTypes e)
        {
            if (DelphiAnalyser.Properties.Settings.Default.lserrors.Contains(e)
                || e == SyntaxTranslationErrors.UnexpectedToken
                || e == DelphiAnalyser.Addition.ErrorTypes.UnexpectedEndOfFile)
                errors.Add(new ParsingError(DelphiAnalyser.Controllers.ErrorController.Instance.Errors[e].message, DelphiAnalyser.Controllers.ErrorController.Instance.Errors[e].level, file, line));
        }
        /// <summary>
        /// Ошибка трансляции
        /// </summary>
        /// <param name="err">текст ошибки</param>
        private void Panic(DelphiAnalyser.Addition.ErrorTypes e)
        {
            AddError(e);
            throw errors[errors.Count-1];
        }

        /// <summary>
        /// Возвражает список ошибок
        /// </summary>
        public IEnumerable<DelphiAnalyser.Addition.ParsingError> Errors
        {
            get
            {
                return errors;
            }
        }

        /// <summary>
        /// Сравнивает два токена
        /// </summary>
        /// <returns>результат сравнения</returns>
        private bool MatchTokens(DelphiTokens t1, DelphiTokens t2)
        {
            if ((t1 == t2) || ((t1 == DelphiTokens.Id) && canbeid.Contains(t2)) || ((t2 == DelphiTokens.Id) && canbeid.Contains(t1)))
                return true;
            else return false;
        }

        /// <summary>
        /// Перегрузка
        /// </summary>
        /// <param name="t">токен, сравниваемые с последним</param>
        /// <returns>результат сравнения</returns>
        private bool MatchTokens(DelphiTokens t)
        {
            return MatchTokens(token, t);
        }

        /// <summary>
        /// Считывает один токен
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
                switch (state) {
                    case 1:
                        if (DelphiAnalyser.Addition.DChar.IsLetter(c) || (c == '_'))
                        {
                            currentId += c;
                            token = DelphiTokens.Id;
                            state = 22;
                        }
                        else if (DelphiAnalyser.Addition.DChar.IsDigit(c))
                        {
                            currentId += c;
                            token = DelphiTokens.Digits;
                            state = 31;
                        }
                        else
                        {
                            switch (c)
                            {
                                case '*':
                                    token = DelphiTokens.Multiply;
                                    state = 2;
                                    break;
                                case '/':
                                    token = DelphiTokens.Division;
                                    state = 3;
                                    break;
                                case '>':
                                    token = DelphiTokens.Greater;
                                    state = 7;
                                    break;
                                case '<':
                                    token = DelphiTokens.Less;
                                    state = 8;
                                    break;
                                case '.':
                                    token = DelphiTokens.Dot;
                                    state = 9;
                                    break;
                                case ':':
                                    token = DelphiTokens.Colon;
                                    state = 10;
                                    break;
                                case '$':
                                    state = 32;
                                    break;
                                case '#':
                                    state = 33;
                                    break;
                                case '\'':
                                    state = 34;
                                    break;
                                case '(':
                                    token = DelphiTokens.LBr;
                                    state = 37;
                                    break;
                                case '+':
                                case '-':
                                case '=':
                                case ',':
                                case ';':
                                case ')':
                                case '[':
                                case ']':
                                case '{':
                                case '}':
                                case '@':
                                case '^':
                                case '\n':
                                    index++;
                                    token = keysymbols[c.ToString()];
                                    if (token == DelphiTokens.NewLine)
                                        line++;
                                    return;
                            }
                        }
                        break;
                    case 2:
                        if (c == '/')
                        {
                            token = DelphiTokens.RCBr;
                            index++;
                        }
                        else if (c == ')')
                        {
                            token = DelphiTokens.RRBr;
                            index++;
                        }
                        return;
                    case 3:
                        if (c == '*')
                        {
                            token = DelphiTokens.LCBr;
                            index++;
                        }
                        else if (c == '/')
                        {
                            token = DelphiTokens.LDBr;
                            index++;
                        }
                        return;
                    case 7:
                        if (c == '=')
                        {
                            token = DelphiTokens.GreaterOrEqual;
                            index++;
                        }
                        return;
                    case 8:
                        if (c == '>')
                        {
                            token = DelphiTokens.NotEqual;
                            index++;
                        }
                        else if (c == '=')
                        {
                            token = DelphiTokens.LessOrEqual;
                            index++;
                        }
                        return;
                    case 9:
                        if (c == '.')
                        {
                            token = DelphiTokens.Interval;
                            index++;
                        }
                        return;
                    case 10:
                        if (c == '=')
                        {
                            token = DelphiTokens.Assigment;
                            index++;
                        }
                        return;
                    case 22:
                        if (!DelphiAnalyser.Addition.DChar.IsLetterOrDigit(c) && (c != '_')) return;
                        else currentId += c;
                        break;
                    case 31:
                        if (!DelphiAnalyser.Addition.DChar.IsDigit(c)) return;
                        else currentId += c;
                        break;
                    case 32:
                        if (DelphiAnalyser.Addition.DChar.IsHexSymbol(c))
                        {
                            currentId += c;
                            token = DelphiTokens.HexConstant;
                            state = 35;
                        }
                        else return;
                        break;
                    case 33:
                        if (DelphiAnalyser.Addition.DChar.IsDigit(c))
                        {
                            currentId += c;
                            token = DelphiTokens.Char;
                            state = 36;
                        }
                        else return;
                        break;
                    case 34:
                        if (c == '\'')
                        {
                            token = (currentId.Length == 1) ? DelphiTokens.Char : DelphiTokens.String;
                            index++;
                            return;
                        }
                        else if (c == '\n') return;
                        else currentId += c;
                        break;
                    case 35:
                        if (!DelphiAnalyser.Addition.DChar.IsHexSymbol(c)) return;
                        else currentId += c;
                        break;
                    case 36:
                        if (!DelphiAnalyser.Addition.DChar.IsDigit(c)) return;
                        else currentId += c;
                        break;
                    case 37:
                        if (c == '*')
                        {
                            token = DelphiTokens.LRBr;
                            index++;
                        }
                        return;
                        break;
                }
                index++;
            }
            return;
        }

        /// <summary>
        /// Считывает один токен, игнорируя комментарии
        /// </summary>
        /// <param name="IgnoreNewLine">игнорировать токен NewLine</param>
        private void NcScan(bool IgnoreNewLine)
        {
            Scan();
            while ((comments.Contains(token) || (MatchTokens(DelphiTokens.NewLine))) && !MatchTokens(DelphiTokens.FileEnd))
            {
                if (IgnoreNewLine)
                {
                    while (MatchTokens(DelphiTokens.NewLine) && !MatchTokens(DelphiTokens.FileEnd)) Scan();
                }
                while (comments.Contains(token) && !MatchTokens(DelphiTokens.FileEnd))
                {
                    DelphiTokens comment = token;
                    while (!MatchTokens(dualtokens[comment]) && !MatchTokens(DelphiTokens.FileEnd)) Scan();
                    Scan();
                }
            }
            if (keywords.ContainsKey(currentId.ToLower())) token = keywords[currentId.ToLower()];
        }

        /// <summary>
        /// Значение по умолчанию - игнорировать токен NewLine
        /// </summary>
        private void NcScan()
        {
            NcScan(true);
        }

        /// <summary>
        /// Считывает токен с заглядыванием назад
        /// </summary>
        /// <param name="t">предыдущий токен</param>
        /// <param name="IgnoreNewLine">игнорировать токен NewLine</param>
        private void Match(DelphiTokens t, bool IgnoreNewLine)
        {
            if (MatchTokens(t)) NcScan(IgnoreNewLine);
            else Panic(SyntaxTranslationErrors.UnexpectedToken);
        }

        /// <summary>
        /// Значение по умолчанию - игнорировать токен NewLine
        /// </summary>
        /// <param name="t">предыдущий токен</param>
        private void Match(DelphiTokens t)
        {
            Match(t, true);
        }

        /// <summary>
        /// Считывает экстра токен
        /// </summary>
        private void ExtraMatch()
        {
            if (MatchTokens(DelphiTokens.Id) || extraid.Contains(token))
                NcScan();
            else Panic(SyntaxTranslationErrors.UnexpectedToken);
        }

        /// <summary>
        /// Считывает токен с заглядыванием назад
        /// </summary>
        /// <param name="t">ожидаемый токен</param>
        private DelphiTokens MatchAhead()
        {
            string lastId = currentId;
            DelphiTokens t1 = token, t2;
            int index = this.index, line = this.line;
            NcScan();
            this.index = index;
            this.line = line;
            t2 = token;
            token = t1;
            currentId = lastId;
            return t2;
        }

        ////////////////////////////////////////////////////////
        //////////////////////// ОШИБКИ/////////////////////////
        ////////////////////////////////////////////////////////

        private bool ContainsDigits(string source)
        {
            for (int i = 0; i < 10; i++)
                if (source.Contains(i.ToString())) return true;
            return false;
        }

        private bool CorrectLength(string source)
        {
            if ((source.Length > 1) && (source.Length < 4))
                return false;
            return true;
        }

        private void CheckId()
        {
            if (DelphiAnalyser.Properties.Settings.Default.lserrors.Contains(DelphiAnalyser.Addition.ErrorTypes.WrongIdNameD) && ContainsDigits(currentId)) AddError(DelphiAnalyser.Addition.ErrorTypes.WrongIdNameD);
            else if (DelphiAnalyser.Properties.Settings.Default.lserrors.Contains(DelphiAnalyser.Addition.ErrorTypes.WrongIdNameS) && !CorrectLength(currentId)) AddError(DelphiAnalyser.Addition.ErrorTypes.WrongIdNameS);
        }

        private void CheckExpression(ExpResult e)
        {
            if (e.ConstantExpression) AddOnError(DelphiAnalyser.Addition.ErrorTypes.ConstantsOnly);
        }

        private void CheckCaseExpression(ExpResult e)
        {
            CheckExpression(e);
            if (e.isConstant) AddOnError(DelphiAnalyser.Addition.ErrorTypes.MagicNumbetAgainstConstant);
        }

        ////////////////////////////////////////////////////////
        ////////////////////// ИСПОЛНЕНИЕ //////////////////////
        ////////////////////////////////////////////////////////

        private void Operation(calculation operation)
        {
            if (stack.Count > 1)
                stack.Push(new eValue(stack.Pop(), stack.Pop(), operation));
        }

        private void Emit(DelphiTokens t, string id)
        {
            switch (t)
            {
                case DelphiTokens.Addition:
                    Operation((x, y) => x + y);
                    break;
                case DelphiTokens.Subtraction:
                    Operation((x, y) => x - y);
                    break;
                case DelphiTokens.Multiply:
                    Operation((x, y) => x * y);
                    break;
                case DelphiTokens.Division:
                    Operation((x, y) => x / y);
                    break;
                case DelphiTokens.Div:
                    Operation((x, y) => (int)(x / y));
                    break;
                case DelphiTokens.Mod:
                    Operation((x, y) => x % y);
                    break;
                case DelphiTokens.And:
                    Operation((x, y) => (int)x & (int)y);
                    break;
                case DelphiTokens.Or:
                    Operation((x, y) => (int)x | (int)y);
                    break;
                case DelphiTokens.Xor:
                    Operation((x, y) => (int)x ^ (int)y);
                    break;
                case DelphiTokens.Shl:
                    Operation((x, y) => (int)x << (int)y);
                    break;
                case DelphiTokens.Shr:
                    Operation((x, y) => (int)x >> (int)y);
                    break;
                case DelphiTokens.Id:
                    stack.Push((symbols.ContainsKey(id)) ? symbols[id] : new eValue());
                    break;
                default:
                    try
                    {
                        stack.Push(new eValue(Convert.ToDouble(id)));
                    }
                    catch
                    {
                        stack.Push(new eValue());
                    }
                    break;
            }
        }

        ////////////////////////////////////////////////////////
        //////////////////////// АНАЛИЗ ////////////////////////
        ////////////////////////////////////////////////////////
        
        /// <summary>
        /// Безнаковое целое
        /// </summary>
        private void Int()
        {
            switch (token)
            {
                case DelphiTokens.Digits:
                case DelphiTokens.HexConstant:
                    Match(token);
                    return;
                default:
                    Panic(SyntaxTranslationErrors.UnexpectedToken);
                    return;
            }
        }

        /// <summary>
        /// Знаковое целое
        /// </summary>
        private void SignedInt()
        {
            while (true)
            {
                switch (token)
                {
                    case DelphiTokens.Addition:
                    case DelphiTokens.Subtraction:
                        Match(token);
                        break;
                    default:
                        Int();
                        return;
                }
            }
        }

        /// <summary>
        /// Беззнаковое число
        /// </summary>
        private void Real()
        {
            switch (token)
            {
                case DelphiTokens.Digits:
                    Match(DelphiTokens.Digits);
                    if (MatchTokens(DelphiTokens.Dot))
                    {
                        Match(DelphiTokens.Dot);
                        if (MatchTokens(DelphiTokens.Digits))
                            Match(DelphiTokens.Digits);
                    }
                    break;
                case DelphiTokens.HexConstant:
                    Match(DelphiTokens.HexConstant);
                    break;
                default:
                    Panic(SyntaxTranslationErrors.UnexpectedToken);
                    break;
            }
        }

        /// <summary>
        /// Знаковое число
        /// </summary>
        private void SignedReal()
        {
            while (true)
            {
                switch (token)
                {
                    case DelphiTokens.Addition:
                    case DelphiTokens.Subtraction:
                        Match(token);
                        break;
                    default:
                        Real();
                        return;
                }
            }
        }

        /// <summary>
        /// Строка
        /// </summary>
        private void Str()
        {
            if (!MatchTokens(DelphiTokens.String) && !MatchTokens(DelphiTokens.Char))
                Panic(SyntaxTranslationErrors.UnexpectedToken);
            while (true)
            {
                switch (token)
                {
                    case DelphiTokens.String:
                    case DelphiTokens.Char:
                        Match(token);
                        break;
                    default:
                        return;
                }
            }
        }

        /// <summary>
        /// Константа
        /// </summary>
        private void Const()
        {
            switch (token)
            {
                case DelphiTokens.String:
                case DelphiTokens.Char:
                    Str();
                    break;
                case DelphiTokens.True:
                case DelphiTokens.False:
                    Bool();
                    break;
                default:
                    SignedReal();
                    break;
            }
        }

        /// <summary>
        /// Целая константа
        /// </summary>
        /// <returns>тип константы - идентификатор или число</returns>
        private DelphiTokens IInt()
        {
            DelphiTokens t = token;
            if (MatchTokens(DelphiTokens.Digits) || MatchTokens(DelphiTokens.HexConstant) || MatchTokens(DelphiTokens.Id))
                Match(token);
            else Panic(SyntaxTranslationErrors.UnexpectedToken);
            return t;
        }

        /// <summary>
        /// Аналогично - целая знаковая константа
        /// </summary>
        /// <returns>тип константы - идентификатор или число</returns>
        private DelphiTokens SignedIInt()
        {
            while (true)
            {
                switch (token)
                {
                    case DelphiTokens.Addition:
                    case DelphiTokens.Subtraction:
                        Match(token);
                        break;
                    default:
                        return IInt();
                        break;
                }
            }
        }

        /// <summary>
        /// В случае external модификатора могут быть указаны индекс или имя
        /// </summary>
        private void OptionalExternalOption()
        {
            switch (token)
            {
                case DelphiTokens.Name:
                    Match(DelphiTokens.Name);
                    Str();
                    break;
                case DelphiTokens.Index:
                    Match(DelphiTokens.Index);
                    IInt();
                    break;
            }
        }

        /// <summary>
        /// Возможна директива external после имени процедуры/функции
        /// </summary>
        /// <returns>присутствует ли external директива</returns>
        private bool OptionalExternal()
        {
            if (MatchTokens(DelphiTokens.Semicolon) && MatchTokens(MatchAhead() ,DelphiTokens.External))
            {
                Match(DelphiTokens.Semicolon);
                Match(DelphiTokens.External);
                Str();
                OptionalExternalOption();
                return true;
            }
            return false;
        }

        /// <summary>
        /// Возможны директивы экспорта после функции
        /// </summary>
        private void OptionalExportMod()
        {
            switch (token)
            {
                case DelphiTokens.Export:
                case DelphiTokens.Local:
                    Match(token);
                    return;
            }
            switch (MatchAhead())
            {
                case DelphiTokens.Export:
                case DelphiTokens.Local:
                    Match(DelphiTokens.Semicolon);
                    Match(token);
                    return;
            }
        }

        /// <summary>
        /// Возможна директива message
        /// </summary>
        private void OptionalMessage()
        {
            if (token == DelphiTokens.Message)
            {
                Match(DelphiTokens.Message);
                CheckExpression(SimpleExpression());
            }
            else if (MatchAhead() == DelphiTokens.Message)
            {
                Match(DelphiTokens.Semicolon);
                Match(DelphiTokens.Message);
                CheckExpression(SimpleExpression());
            }
        }

        /// <summary>
        /// Возможны директивы после функции
        /// </summary>
        /// <returns>среди директив присутствует external</returns>
        private bool OptionalDirectives()
        {
            bool loop = true;
            while (loop)
            {
                switch (token)
                {
                    case DelphiTokens.Export:
                    case DelphiTokens.Local:
                    case DelphiTokens.Safecall:
                    case DelphiTokens.Stdcall:
                    case DelphiTokens.Forward:
                    case DelphiTokens.Far:
                    case DelphiTokens.Near:
                    case DelphiTokens.Reintroduce:
                    case DelphiTokens.Register:
                    case DelphiTokens.Cdecl:
                    case DelphiTokens.Varargs:
                    case DelphiTokens.Static:
                    case DelphiTokens.Virtual:
                    case DelphiTokens.Override:
                    case DelphiTokens.Abstract:
                    case DelphiTokens.Dynamic:
                    case DelphiTokens.Overload:
                        Match(token);
                        continue;
                }
                switch (MatchAhead())
                {
                    case DelphiTokens.Export:
                    case DelphiTokens.Local:
                    case DelphiTokens.Safecall:
                    case DelphiTokens.Stdcall:
                    case DelphiTokens.Forward:
                    case DelphiTokens.Far:
                    case DelphiTokens.Near:
                    case DelphiTokens.Reintroduce:
                    case DelphiTokens.Register:
                    case DelphiTokens.Cdecl:
                    case DelphiTokens.Varargs:
                    case DelphiTokens.Static:
                    case DelphiTokens.Virtual:
                    case DelphiTokens.Override:
                    case DelphiTokens.Abstract:
                    case DelphiTokens.Dynamic:
                    case DelphiTokens.Overload:
                        Match(DelphiTokens.Semicolon);
                        Match(token);
                        continue;
                }
                break;
            }
            OptionalExportMod();
            bool isExternal = OptionalExternal();
            OptionalExportMod();
            OptionalMessage();
            OptionalExportMod();
            return isExternal;
        }

        /// <summary>
        /// Булевое значение
        /// </summary>
        private void Bool()
        {
            switch (token)
            {
                case DelphiTokens.True:
                case DelphiTokens.False:
                case DelphiTokens.Id:
                    Match(token);
                    break;
                default:
                    Panic(SyntaxTranslationErrors.UnexpectedToken);
                    break;
            }
        }

        /// <summary>
        /// Класс может быть объявлен как abstract или sealed
        /// </summary>
        private void OptionalClassModificators()
        {
            switch (token)
            {
                case DelphiTokens.Abstract:
                case DelphiTokens.Sealed:
                    Match(token);
                    break;
            }
        }

        /// <summary>
        /// После переменной может быть символ разыменования указателя ^
        /// </summary>
        private void OptionalCaret()
        {
            if (MatchTokens(DelphiTokens.Caret))
                Match(DelphiTokens.Caret);
        }

        /// <summary>
        /// Вообще после любой переменной может идти многократное разыменования (если это указатель на указатель)
        /// </summary>
        private void OptionalCarets()
        {
            while (MatchTokens(DelphiTokens.Caret))
                Match(DelphiTokens.Caret);
        }

        /// <summary>
        /// Возможен индекс после имени переменной (если она массив)
        /// </summary>
        private void OptionalArrayIndex()
        {
            while (MatchTokens(DelphiTokens.LSBr))
            {
                Match(DelphiTokens.LSBr);
                OptionalExpressionList();
                Match(DelphiTokens.RSBr);
                OptionalCarets();
                OptionalFunctionParams();
            }
        }

        /// <summary>
        /// Возможны параметры после имени переменной (если она функция/процедура)
        /// </summary>
        private void OptionalFunctionParams()
        {
            while (MatchTokens(DelphiTokens.LBr))
            {
                Match(DelphiTokens.LBr);
                if (!MatchTokens(DelphiTokens.RBr))
                    AssigmentParams();
                Match(DelphiTokens.RBr);
                OptionalCarets();
                OptionalArrayIndex();
            }
        }

        /// <summary>
        /// После имени переменной может идти любая последовательность () [] ^
        /// </summary>
        private void OptionalAFExtension()
        {
            OptionalCarets();
            switch (token)
            {
                case DelphiTokens.LSBr:
                    OptionalArrayIndex();
                    break;
                case DelphiTokens.LBr:
                    OptionalFunctionParams();
                    break;
            }
        }

        /// <summary>
        /// Возможно округление значения (x:2)
        /// </summary>
        private void OptionalRealRounded()
        {
            if (MatchTokens(DelphiTokens.Colon))
            {
                Match(DelphiTokens.Colon);
                CheckExpression(SimpleExpression());
            }
        }

        /// <summary>
        /// Параметр может быть задан в виде присвоения (What:=x)
        /// </summary>
        private void AssigmentParam()
        {
            if (MatchTokens(MatchAhead(), DelphiTokens.Assigment))
            {
                Match(DelphiTokens.Id);
                Match(DelphiTokens.Assigment);
                CheckExpression(Expression());
            }
            else
            {
                CheckExpression(Expression());
                OptionalRealRounded();
                OptionalRealRounded();
            }
        }

        /// <summary>
        /// Набор параметров типа присваивания
        /// </summary>
        private void AssigmentParams()
        {
            AssigmentParam();
            while (MatchTokens(DelphiTokens.Comma))
            {
                Match(DelphiTokens.Comma);
                AssigmentParam();
            }
        }

        /// <summary>
        /// Операнд-переменная
        /// </summary>
        private void Variable()
        {
            bool loop = true;
            switch (token)
            {
                case DelphiTokens.LBr:
                    Match(DelphiTokens.LBr);
                    CheckExpression(Expression());
                    Match(DelphiTokens.RBr);
                    loop = MatchTokens(DelphiTokens.Dot);
                    if (loop) Match(DelphiTokens.Dot);
                    break;
                case DelphiTokens.LSBr:
                    Match(DelphiTokens.LSBr);
                    if (!MatchTokens(DelphiTokens.RSBr))
                        Intervals();
                    Match(DelphiTokens.RSBr);
                    loop = false;
                    break;
            }
            while (loop)
            {
                ExtraMatch();
                OptionalAFExtension();
                if (MatchTokens(DelphiTokens.Dot))
                    Match(DelphiTokens.Dot);
                else return;
            }
        }

        private class ExpResult
        {
            public bool isConstant, wasOperand;

            public bool ConstantExpression
            {
                get
                {
                    return isConstant && wasOperand;
                }
            }

            public ExpResult(bool isConstant, bool wasOperand)
            {
                this.isConstant = isConstant;
                this.wasOperand = wasOperand;
            }

            public ExpResult()
            {
                this.isConstant = true;
                this.wasOperand = false;
            }

            public void Assign(ExpResult parent)
            {
                this.isConstant &= parent.isConstant;
                this.wasOperand |= parent.wasOperand;
            }
        }

        /// <summary>
        /// Наивысший приоритет операций (скобки перенесены на уровень переменных в связи с (TObject as TButton).Caption)
        /// </summary>
        private ExpResult Factor()
        {
            ExpResult result = new ExpResult();
            switch (token)
            {
                case DelphiTokens.Not:
                case DelphiTokens.AtSign:
                case DelphiTokens.Inherited:
                    Match(token);
                    result.Assign(Factor());
                    break;
                case DelphiTokens.String:
                case DelphiTokens.Char:
                case DelphiTokens.Addition:
                case DelphiTokens.Subtraction:
                case DelphiTokens.Digits:
                case DelphiTokens.HexConstant:
                case DelphiTokens.True:
                case DelphiTokens.False:
                    Const();
                    break;
                default:
                    Variable();
                    result.isConstant = false;
                    break;
            }
            return result;
        }

        /// <summary>
        /// Высокий приоритет
        /// </summary>
        private ExpResult Term()
        {
            ExpResult result = Factor();
            while (true)
            {
                switch (token)
                {
                    case DelphiTokens.Multiply:
                    case DelphiTokens.Division:
                    case DelphiTokens.Div:
                    case DelphiTokens.Mod:
                    case DelphiTokens.And:
                    case DelphiTokens.Shl:
                    case DelphiTokens.Shr:
                        result.wasOperand = true;
                        Match(token);
                        result.Assign(Factor());
                        break;
                    default:
                        return result;
                }
            }
        }

        /// <summary>
        /// Низкий приоритет
        /// </summary>
        private ExpResult SimpleExpression()
        {
            ExpResult result = Term();
            while (true) {
                switch (token)
                {
                    case DelphiTokens.Addition:
                    case DelphiTokens.Subtraction:
                    case DelphiTokens.Or:
                    case DelphiTokens.Xor:
                        result.wasOperand = true;
                        Match(token);
                        result.Assign(Term());
                        break;
                    default:
                        return result;
                }
            }
        }

        /// <summary>
        /// Самый низкий приоритет
        /// </summary>
        private ExpResult Expression()
        {
            ExpResult result = SimpleExpression();
            while (true)
            {
                switch (token)
                {
                    case DelphiTokens.Equal:
                    case DelphiTokens.Less:
                    case DelphiTokens.Greater:
                    case DelphiTokens.LessOrEqual:
                    case DelphiTokens.GreaterOrEqual:
                    case DelphiTokens.NotEqual:
                    case DelphiTokens.In:
                    case DelphiTokens.Is:
                    case DelphiTokens.As:
                        result.wasOperand = true;
                        Match(token);
                        result.Assign(SimpleExpression());
                        break;
                    default:
                        return result;
                }
            }
        }

        /// <summary>
        /// Возможен список выражений
        /// </summary>
        private void OptionalExpressionList()
        {
            while (true)
            {
                switch (token)
                {
                    case DelphiTokens.Addition:
                    case DelphiTokens.Subtraction:
                    case DelphiTokens.Digits:
                    case DelphiTokens.HexConstant:
                    case DelphiTokens.Char:
                    case DelphiTokens.String:
                    case DelphiTokens.LBr:
                    case DelphiTokens.LSBr:
                    case DelphiTokens.AtSign:
                    case DelphiTokens.Not:
                    case DelphiTokens.True:
                    case DelphiTokens.False:
                    case DelphiTokens.Inherited:
                        CheckExpression(Expression());
                        break;
                    case DelphiTokens.Comma:
                        Match(DelphiTokens.Comma);
                        CheckExpression(Expression());
                        break;
                    default:
                        if (MatchTokens(DelphiTokens.Id))
                            CheckExpression(Expression());
                        else return;
                        break;
                }
            }
        }

        /// <summary>
        /// Возможен список переменных в заголовке функции/процедуры
        /// </summary>
        private int OptionalVars()
        {
            int idCount = 0;
            if (MatchTokens(DelphiTokens.LBr))
            {
                Match(DelphiTokens.LBr);
                if (!MatchTokens(DelphiTokens.RBr))
                    idCount = FunctionVariableDeclarations();
                Match(DelphiTokens.RBr);
            }
            return idCount;
        }

        /// <summary>
        /// Контракт процедуры
        /// </summary>
        /// <returns>содержит ли контракт директиву external</returns>
        private bool ProcedureContract()
        {
            if (OptionalVars() > maxParamCount) AddOnError(DelphiAnalyser.Addition.ErrorTypes.ToManyParameters);
            return OptionalDirectives();
        }

        /// <summary>
        /// Контракт функции
        /// </summary>
        /// <returns>содержит ли контракт директиву external</returns>
        private bool FunctionContract()
        {
            if (OptionalVars() > maxParamCount) AddOnError(DelphiAnalyser.Addition.ErrorTypes.ToManyParameters);
            bool typedefined = MatchTokens(DelphiTokens.Colon);
            if (typedefined)
            {
                Match(DelphiTokens.Colon);
                Match(DelphiTokens.Id);
            }
            bool isExternal = OptionalDirectives();
            if (isExternal || typedefined) return isExternal;
            else Panic(SyntaxTranslationErrors.UnexpectedToken);
            return false;
        }

        /// <summary>
        /// Функциональный тип может иметь расширение of object
        /// </summary>
        private void OptionalOfObject()
        {
            if (MatchTokens(DelphiTokens.Of))
            {
                Match(DelphiTokens.Of);
                Match(DelphiTokens.Object);
            }
        }

        /// <summary>
        /// Контракт процедурного типа
        /// </summary>
        private void TypeProcedureContract()
        {
            if (OptionalVars() > maxParamCount) AddOnError(DelphiAnalyser.Addition.ErrorTypes.ToManyParameters);
            OptionalOfObject();
            OptionalDirectives();
        }

        /// <summary>
        /// Контракт функционального типа
        /// </summary>
        private void TypeFunctionContract()
        {
            if (OptionalVars() > maxParamCount) AddOnError(DelphiAnalyser.Addition.ErrorTypes.ToManyParameters);
            Match(DelphiTokens.Colon);
            Match(DelphiTokens.Id);
            OptionalOfObject();
            OptionalDirectives();
        }

        /// <summary>
        /// Заголовок процедуры
        /// </summary>
        private void InnerProcedureHead()
        {
            switch (token)
            {
                case DelphiTokens.Constructor:
                case DelphiTokens.Destructor:
                case DelphiTokens.Procedure:
                    Match(token);
                    CheckId();
                    Match(DelphiTokens.Id);
                    ProcedureContract();
                    Match(DelphiTokens.Semicolon);
                    break;
                default:
                    Panic(SyntaxTranslationErrors.UnexpectedToken);
                    break;
            }
        }

        /// <summary>
        /// Заголовок функции
        /// </summary>
        private void InnerFunctionHead()
        {
            OptionalClassMethod();
            Match(DelphiTokens.Function);
            CheckId();
            Match(DelphiTokens.Id);
            FunctionContract();
            Match(DelphiTokens.Semicolon);
        }

        /// <summary>
        /// Заголовок процедуры (если класса, то вне его)
        /// </summary>
        /// <returns>содержит ли заголовок директиву external</returns>
        private bool OuterProcedureHead()
        {
            switch (token)
            {
                case DelphiTokens.Constructor:
                case DelphiTokens.Destructor:
                case DelphiTokens.Procedure:
                    Match(token);
                    CheckId();
                    Match(DelphiTokens.Id);
                    if (MatchTokens(DelphiTokens.Dot))
                    {
                        Match(DelphiTokens.Dot);
                        CheckId();
                        Match(DelphiTokens.Id);
                    }
                    bool isExternal = ProcedureContract();
                    Match(DelphiTokens.Semicolon);
                    return isExternal;
                default:
                    Panic(SyntaxTranslationErrors.UnexpectedToken);
                    return false;
            }
        }

        /// <summary>
        /// Заголовок функции
        /// </summary>
        /// <returns>содержит ли заголовок директиву external</returns>
        private bool OuterFunctionHead()
        {
            OptionalClassMethod();
            Match(DelphiTokens.Function);
            CheckId();
            Match(DelphiTokens.Id);
            if (MatchTokens(DelphiTokens.Dot))
            {
                Match(DelphiTokens.Dot);
                CheckId();
                Match(DelphiTokens.Id);
            }
            bool isExternal = FunctionContract();
            Match(DelphiTokens.Semicolon);
            return isExternal;
        }

        /// <summary>
        /// Возможен метод класса (директива class)
        /// </summary>
        /// <returns></returns>
        private bool OptionalClassMethod()
        {
            if (MatchTokens(DelphiTokens.Class))
            {
                Match(DelphiTokens.Class);
                return true;
            }
            return false;
        }

        /// <summary>
        /// Хаголовок метода класса
        /// </summary>
        private void InnerClassMethod()
        {
            Match(DelphiTokens.Class);
            switch (token)
            {
                case DelphiTokens.Procedure:
                    InnerProcedureHead();
                    break;
                case DelphiTokens.Function:
                    InnerFunctionHead();
                    break;
                default:
                    Panic(SyntaxTranslationErrors.UnexpectedToken);
                    break;
            }
        }

        /// <summary>
        /// Внешний заголовок метода класса
        /// </summary>
        private void OuterClassMethod()
        {
            Match(DelphiTokens.Class);
            switch (token)
            {
                case DelphiTokens.Procedure:
                    OuterProcedureHead();
                    break;
                case DelphiTokens.Function:
                    OuterFunctionHead();
                    break;
                default:
                    Panic(SyntaxTranslationErrors.UnexpectedToken);
                    break;
            }
        }

        /// <summary>
        /// Возможна директива packed
        /// </summary>
        private void OptionalPacked()
        {
            if (MatchTokens(DelphiTokens.Packed))
                Match(DelphiTokens.Packed);
        }

        /// <summary>
        /// Интервал значений
        /// </summary>
        private void Interval()
        {
            SimpleExpression();
            if (MatchTokens(DelphiTokens.Interval))
            {
                Match(DelphiTokens.Interval);
                SimpleExpression();
            }
        }

        /// <summary>
        /// Несколько интервалов
        /// </summary>
        private void Intervals()
        {
            Interval();
            while (MatchTokens(DelphiTokens.Comma))
            {
                Match(DelphiTokens.Comma);
                Interval();
            }
        }
        
        /// <summary>
        /// Возможен интервал значений
        /// </summary>
        private void OptionalIntervals()
        {
            if (MatchTokens(DelphiTokens.LSBr))
            {
                Match(DelphiTokens.LSBr);
                Intervals();
                Match(DelphiTokens.RSBr);
            }
        }

        /// <summary>
        /// Тип возвращаемого функцией значения
        /// </summary>
        private void FunctionTypeDefinition()
        {
            switch (token)
            {
                case DelphiTokens.Array:
                    Match(DelphiTokens.Array);
                    Match(DelphiTokens.Of);
                    Match(DelphiTokens.Id);
                    break;
                default:
                    Match(DelphiTokens.Id);
                    break;
            }
        }

        /// <summary>
        /// Тип набор, каждый элемент которого может иметь числовое значение
        /// </summary>
        private void SimpleTypeObject()
        {
            Match(DelphiTokens.Id);
            if (MatchTokens(DelphiTokens.Equal))
            {
                Match(DelphiTokens.Equal);
                SignedInt();
            }
        }

        /// <summary>
        /// Простой тип - набор
        /// </summary>
        private void SimpleType()
        {
            if (MatchTokens(DelphiTokens.LBr))
            {
                Match(DelphiTokens.LBr);
                SimpleTypeObject();
                while (MatchTokens(DelphiTokens.Comma))
                {
                    Match(DelphiTokens.Comma);
                    SimpleTypeObject();
                }
                Match(DelphiTokens.RBr);
            }
            else Interval();
        }

        /// <summary>
        /// Объявление типа set
        /// </summary>
        private void SetDefinition()
        {
            Match(DelphiTokens.Set);
            Match(DelphiTokens.Of);
            if (MatchTokens(DelphiTokens.LBr)) SimpleType();
            else Interval();
        }

        /// <summary>
        /// Объявления типа file
        /// </summary>
        private void FileDefinition()
        {
            Match(DelphiTokens.File);
            if (MatchTokens(DelphiTokens.Of))
            {
                Match(DelphiTokens.Of);
                SimpleType();
            }
        }

        /// <summary>
        /// Объявление простых константных типов (все локальные типы кроме массива)
        /// </summary>
        private void SimpleConstTypeDefinition()
        {
            switch (token)
            {
                case DelphiTokens.Caret:
                    Match(DelphiTokens.Caret);
                    Match(DelphiTokens.Id);
                    break;
                case DelphiTokens.LBr:
                    SimpleType();
                    break;
                case DelphiTokens.Record:
                    ConstRecordDefinition();
                    break;
                case DelphiTokens.Set:
                    SetDefinition();
                    break;
                case DelphiTokens.Packed:
                    Match(DelphiTokens.Packed);
                    switch (token)
                    {
                        case DelphiTokens.Record:
                            ConstRecordDefinition();
                            break;
                        case DelphiTokens.Set:
                            SetDefinition();
                            break;
                    }
                    break;
                default:
                    Interval();
                    break;
            }
        }

        /// <summary>
        /// Объявление константных типов
        /// </summary>
        private void ConstTypeDefinition()
        {
            while (true)
            {
                switch (token)
                {
                    case DelphiTokens.Array:
                        Match(DelphiTokens.Array);
                        Match(DelphiTokens.LSBr);
                        Intervals();
                        Match(DelphiTokens.RSBr);
                        Match(DelphiTokens.Of);
                        break;
                    case DelphiTokens.Packed:
                        Match(DelphiTokens.Packed);
                        switch (token)
                        {
                            case DelphiTokens.Array:
                                Match(DelphiTokens.Array);
                                Match(DelphiTokens.LSBr);
                                Intervals();
                                Match(DelphiTokens.RSBr);
                                Match(DelphiTokens.Of);
                                break;
                            default:
                                SimpleConstTypeDefinition();
                                return;
                        }
                        break;
                    default:
                        SimpleTypeDefinition();
                        return;
                }
            }
        }

        /// <summary>
        /// Объявление простых типов
        /// </summary>
        private void SimpleTypeDefinition()
        {
            switch (token)
            {
                case DelphiTokens.Caret:
                    Match(DelphiTokens.Caret);
                    Match(DelphiTokens.Id);
                    break;
                case DelphiTokens.LBr:
                    SimpleType();
                    break;
                case DelphiTokens.Record:
                    RecordDefinition();
                    break;
                case DelphiTokens.Set:
                    SetDefinition();
                    break;
                case DelphiTokens.File:
                    FileDefinition();
                    break;
                case DelphiTokens.Procedure:
                    Match(DelphiTokens.Procedure);
                    TypeProcedureContract();
                    break;
                case DelphiTokens.Function:
                    Match(DelphiTokens.Function);
                    TypeFunctionContract();
                    break;
                case DelphiTokens.Packed:
                    Match(DelphiTokens.Packed);
                    switch (token)
                    {
                        case DelphiTokens.Record:
                            RecordDefinition();
                            break;
                        case DelphiTokens.Set:
                            SetDefinition();
                            break;
                        case DelphiTokens.File:
                            FileDefinition();
                            break;
                    }
                    break;
                default:
                    Interval();
                    break;
            }
        }

        /// <summary>
        /// Объявление типов
        /// </summary>
        private void TypeDefinition()
        {
            while (true)
            {
                switch (token)
                {
                    case DelphiTokens.Array:
                        Match(DelphiTokens.Array);
                        OptionalIntervals();
                        Match(DelphiTokens.Of);
                        break;
                    case DelphiTokens.Packed:
                        Match(DelphiTokens.Packed);
                        switch (token)
                        {
                            case DelphiTokens.Array:
                                Match(DelphiTokens.Array);
                                OptionalIntervals();
                                Match(DelphiTokens.Of);
                                break;
                            default:
                                SimpleTypeDefinition();
                                return;
                        }
                        break;
                    default:
                        SimpleTypeDefinition();
                        return;
                }
            }
        }

        /// <summary>
        /// Список идентификаторов
        /// </summary>
        /// <param name="checkId">проверять идентификаторы</param>
        /// <returns>состоит ли список более чем из одного элемента</returns>
        private int IdList(bool checkId)
        {
            if (checkId) CheckId();
            Match(DelphiTokens.Id);
            int idCount = 1;
            while (MatchTokens(DelphiTokens.Comma))
            {
                Match(DelphiTokens.Comma);
                if (checkId) CheckId();
                Match(DelphiTokens.Id);
                idCount++;
            }
            return idCount;
        }

        private int IdList()
        {
            return IdList(
                DelphiAnalyser.Properties.Settings.Default.lserrors.Contains(DelphiAnalyser.Addition.ErrorTypes.WrongIdNameD)
                ||
                DelphiAnalyser.Properties.Settings.Default.lserrors.Contains(DelphiAnalyser.Addition.ErrorTypes.WrongIdNameS)
                );
        }

        /// <summary>
        /// Возможен префикс (int, out, const, var)
        /// </summary>
        private void OptionalPrefix()
        {
            switch (token)
            {
                case DelphiTokens.In:
                case DelphiTokens.Out:
                case DelphiTokens.Var:
                case DelphiTokens.Const:
                    Match(token);
                    break;
            }
        }

        /// <summary>
        /// Возможна директива absolute
        /// </summary>
        private void OptionalAbsolute()
        {
            if (MatchTokens(DelphiTokens.Absolute))
            {
                Match(DelphiTokens.Absolute);
                Match(DelphiTokens.Id);
            }
        }

        /// <summary>
        /// Объявление локальных переменных в функции
        /// </summary>
        private int FunctionVariableDeclaration()
        {
            int idCount = IdList();
            bool many = (idCount > 1);
            if (MatchTokens(DelphiTokens.Colon))
            {
                Match(DelphiTokens.Colon);
                FunctionTypeDefinition();
            }
            if (!many && MatchTokens(DelphiTokens.Equal))
            {
                Match(DelphiTokens.Equal);
                CheckExpression(Expression());
            }
            return idCount;
        }

        /// <summary>
        /// Объявления локальных переменных в функции
        /// </summary>
        private int FunctionVariableDeclarations()
        {
            int idCount = 0;
            OptionalPrefix();
            FunctionVariableDeclaration();
            while (MatchTokens(DelphiTokens.Semicolon))
            {
                Match(DelphiTokens.Semicolon);
                OptionalPrefix();
                idCount = FunctionVariableDeclaration();
            }
            return idCount;
        }

        /// <summary>
        /// Объявление переменных
        /// </summary>
        private void VarDeclaration()
        {
            bool many = (IdList() > 1);
            Match(DelphiTokens.Colon);
            TypeDefinition();
            if (!many && MatchTokens(DelphiTokens.Equal))
            {
                Match(DelphiTokens.Equal);
                CheckExpression(Expression());
            }
            else OptionalAbsolute();
            Match(DelphiTokens.Semicolon);
        }

        /// <summary>
        /// Объявления переменных
        /// </summary>
        private void VarDeclarations()
        {
            VarDeclaration();
            while (MatchTokens(DelphiTokens.Id))
                VarDeclaration();
        }

        /// <summary>
        /// Возможен символ ";"
        /// </summary>
        private void OptionalSemicolon()
        {
            if (MatchTokens(DelphiTokens.Semicolon))
                Match(DelphiTokens.Semicolon);
        }

        /// <summary>
        /// Блок кода (begin ... end)
        /// </summary>
        private void CompoundStatement()
        {
            Match(DelphiTokens.Begin);
            OptionalStatements();
            Match(DelphiTokens.End);
        }

        /// <summary>
        /// Возможен else
        /// </summary>
        private void OptionalElse()
        {
            if (MatchTokens(DelphiTokens.Else))
            {
                Match(DelphiTokens.Else);
                Statement();
            }
        }

        /// <summary>
        /// Возможен идентификатор в блоке on ... do ...
        /// </summary>
        private void OptionalId()
        {
            if (MatchTokens(MatchAhead(), DelphiTokens.Colon))
            {
                CheckId();
                Match(DelphiTokens.Id);
                Match(DelphiTokens.Colon);
            }
        }

        /// <summary>
        /// Блок после try (finally или except)
        /// </summary>
        private void TryOptionBlock()
        {
            switch (token)
            {
                case DelphiTokens.Except:
                    Match(DelphiTokens.Except);
                    switch (token)
                    {
                        case DelphiTokens.On:
                            while (MatchTokens(DelphiTokens.On))
                            {
                                Match(DelphiTokens.On);
                                OptionalId();
                                Match(DelphiTokens.Id);
                                Match(DelphiTokens.Do);
                                Statement();
                                Match(DelphiTokens.Semicolon);
                            }
                            break;
                        default:
                            OptionalStatements();
                            break;
                    }
                    break;
                case DelphiTokens.Finally:
                    Match(token);
                    OptionalStatements();
                    break;
                default:
                    Panic(SyntaxTranslationErrors.UnexpectedToken);
                    break;
            }
        }

        /// <summary>
        /// For опция
        /// </summary>
        private void ForOption()
        {
            switch (token)
            {
                case DelphiTokens.To:
                case DelphiTokens.Downto:
                    Match(token);
                    break;
                default:
                    Panic(SyntaxTranslationErrors.UnexpectedToken);
                    break;
            }
        }

        /// <summary>
        /// Параметры case
        /// </summary>
        private void OptionalCaseParams()
        {
            CheckCaseExpression(Expression());
            while (MatchTokens(DelphiTokens.Comma))
            {
                Match(DelphiTokens.Comma);
                CheckCaseExpression(Expression());
            }
        }

        /// <summary>
        /// Case блоки
        /// </summary>
        private void Cases()
        {
            while (true)
            {
                switch (token)
                {
                    case DelphiTokens.Else:
                        OptionalElse();
                        OptionalSemicolon();
                        return;
                    case DelphiTokens.End:
                        return;
                    default:
                        OptionalCaseParams();
                        Match(DelphiTokens.Colon);
                        if (MatchTokens(DelphiTokens.End)) return;
                        if (!MatchTokens(DelphiTokens.Semicolon))
                            Statement();
                        OptionalSemicolon();
                        break;
                }
            }
        }

        /// <summary>
        /// Возможно at в raise
        /// </summary>
        private void OptionalAt()
        {
            if (MatchTokens(DelphiTokens.At))
            {
                Match(DelphiTokens.At);
                Variable();
            }
        }

        /// <summary>
        /// Команда
        /// </summary>
        /// <param name="MustBe">обязательна или нет</param>
        private void Statement(bool MustBe)
        {
            switch (token)
            {
                case DelphiTokens.Begin:
                    CompoundStatement();
                    break;
                case DelphiTokens.If:
                    Match(DelphiTokens.If);
                    CheckExpression(Expression());
                    Match(DelphiTokens.Then);
                    Statement();
                    OptionalElse();
                    break;
                case DelphiTokens.Try:
                    Match(DelphiTokens.Try);
                    OptionalStatements();
                    TryOptionBlock();
                    Match(DelphiTokens.End);
                    break;
                case DelphiTokens.For:
                    Match(DelphiTokens.For);
                    Variable();
                    Match(DelphiTokens.Assigment);
                    CheckExpression(Expression());
                    ForOption();
                    CheckExpression(Expression());
                    Match(DelphiTokens.Do);
                    OptionalStatement();
                    break;
                case DelphiTokens.While:
                    Match(DelphiTokens.While);
                    CheckExpression(Expression());
                    Match(DelphiTokens.Do);
                    OptionalStatements();
                    break;
                case DelphiTokens.Repeat:
                    Match(DelphiTokens.Repeat);
                    OptionalStatements();
                    Match(DelphiTokens.Until);
                    CheckExpression(Expression());
                    break;
                case DelphiTokens.With:
                    Match(DelphiTokens.With);
                    Variable();
                    Match(DelphiTokens.Do);
                    OptionalStatements();
                    break;
                case DelphiTokens.Case:
                    Match(DelphiTokens.Case);
                    CheckExpression(Expression());
                    Match(DelphiTokens.Of);
                    Cases();
                    Match(DelphiTokens.End);
                    break;
                case DelphiTokens.Goto:
                    Match(DelphiTokens.Goto);
                    Match(DelphiTokens.Id);
                    break;
                case DelphiTokens.Raise:
                    Match(DelphiTokens.Raise);
                    if (!MatchTokens(DelphiTokens.Semicolon))
                    {
                        Variable();
                        OptionalAt();
                    }
                    break;
                default:
                    bool inherited = MatchTokens(DelphiTokens.Inherited);
                    if (inherited)
                        Match(DelphiTokens.Inherited);
                    if (MatchTokens(DelphiTokens.Id) || MatchTokens(DelphiTokens.LBr))
                    {
                        Variable();
                        if (MatchTokens(DelphiTokens.Assigment))
                        {
                            Match(DelphiTokens.Assigment);
                            CheckExpression(Expression());
                        }
                    }
                    else if (inherited) return;
                    else if (MustBe) Panic(SyntaxTranslationErrors.UnexpectedToken);
                    break;
            }
        }

        /// <summary>
        /// Обязательная команда
        /// </summary>
        private void Statement()
        {
            Statement(true);
        }
        
        /// <summary>
        /// Возможна команда
        /// </summary>
        private void OptionalStatement()
        {
            Statement(false);
        }

        /// <summary>
        /// Набор команд от 1 и более
        /// </summary>
        private void Statements()
        {
            Statement();
            while (MatchTokens(DelphiTokens.Semicolon))
            {
                Match(DelphiTokens.Semicolon);
                OptionalStatement();
            }
        }

        /// <summary>
        /// Возможен label:
        /// </summary>
        private void OptionalLabel()
        {
            if (MatchTokens(DelphiTokens.Id) && MatchTokens(MatchAhead(), DelphiTokens.Colon))
            {
                Match(DelphiTokens.Id);
                Match(DelphiTokens.Colon);
            }
        }

        /// <summary>
        /// Возможен набор команд
        /// </summary>
        private void OptionalStatements()
        {
            while (true)
            {
                switch (token)
                {
                    case DelphiTokens.Begin:
                    case DelphiTokens.If:
                    case DelphiTokens.Try:
                    case DelphiTokens.For:
                    case DelphiTokens.While:
                    case DelphiTokens.Repeat:
                    case DelphiTokens.With:
                    case DelphiTokens.Case:
                    case DelphiTokens.Goto:
                    case DelphiTokens.Raise:
                    case DelphiTokens.Inherited:
                    case DelphiTokens.LBr:
                        OptionalLabel();
                        Statements();
                        break;
                    default:
                        if (MatchTokens(DelphiTokens.Id))
                        {
                            OptionalLabel();
                            Statements();
                        } else return;
                        break;
                }
            }
        }

        /// <summary>
        /// Ключевое слово объявления переменной
        /// </summary>
        private void VarKeyword()
        {
            switch (token)
            {
                case DelphiTokens.Var:
                case DelphiTokens.Threadvar:
                    Match(token);
                    break;
                default:
                    Panic(SyntaxTranslationErrors.UnexpectedToken);
                    break;
            }
        }

        /// <summary>
        /// Блок объявления переменных
        /// </summary>
        private void VariableDeclaration()
        {
            VarKeyword();
            VarDeclarations();
        }

        /// <summary>
        /// Блоки объявления переменных
        /// </summary>
        private void Vars()
        {
            while (true)
            {
                switch (token)
                {
                    case DelphiTokens.Var:
                    case DelphiTokens.Threadvar:
                        VariableDeclaration();
                        break;
                    default:
                        return;
                }
            }
        }

        /// <summary>
        /// У константы может быть указан тип
        /// </summary>
        private void OptionalConstType()
        {
            if (MatchTokens(DelphiTokens.Colon))
            {
                Match(DelphiTokens.Colon);
                ConstTypeDefinition();
            }
        }

        /// <summary>
        /// Значение константы может быть значением записи
        /// </summary>
        private void RecordValues()
        {
            Match(DelphiTokens.Id);
            Match(DelphiTokens.Colon);
            ConstValue();
            while (MatchTokens(DelphiTokens.Semicolon))
            {
                Match(DelphiTokens.Semicolon);
                Match(DelphiTokens.Id);
                Match(DelphiTokens.Colon);
                ConstValue();
            }
        }

        /// <summary>
        /// Значение константы
        /// </summary>
        private void ConstValue()
        {
            switch (token)
            {
                case DelphiTokens.LBr:
                    Match(DelphiTokens.LBr);
                    switch (MatchAhead())
                    {
                        case DelphiTokens.Colon:
                            RecordValues();
                            break;
                        default:
                            ConstValues();
                            break;
                    }
                    Match(DelphiTokens.RBr);
                    break;
                default:
                    CheckExpression(Expression());
                    break;
            }
        }

        /// <summary>
        /// Значения константы
        /// </summary>
        private void ConstValues()
        {
            ConstValue();
            while (MatchTokens(DelphiTokens.Comma))
            {
                Match(DelphiTokens.Comma);
                ConstValue();
            }
        }

        /// <summary>
        /// Определение константы
        /// </summary>
        private void ConstantDefinition()
        {
            CheckId();
            Match(DelphiTokens.Id);
            OptionalConstType();
            Match(DelphiTokens.Equal);
            ConstValue();
            Match(DelphiTokens.Semicolon);
        }

        /// <summary>
        /// Определения констант
        /// </summary>
        private void ConstantDefinitions()
        {
            ConstantDefinition();
            while (MatchTokens(DelphiTokens.Id))
                ConstantDefinition();
        }

        /// <summary>
        /// Блок определения констант
        /// </summary>
        private void Consts()
        {
            Match(DelphiTokens.Const);
            ConstantDefinitions();
        }

        /// <summary>
        /// Возможно наличие in '...' в подключении модуля
        /// </summary>
        private void OptionalUsesIn()
        {
            if (MatchTokens(DelphiTokens.In))
            {
                Match(DelphiTokens.In);
                Str();
            }
        }

        /// <summary>
        /// Список модулей
        /// </summary>
        private void UnitList()
        {
            Match(DelphiTokens.Id);
            OptionalUsesIn();
            while (MatchTokens(DelphiTokens.Comma))
            {
                Match(DelphiTokens.Comma);
                Match(DelphiTokens.Id);
                OptionalUsesIn();
            }
        }

        /// <summary>
        /// Возможно наличие секции uses
        /// </summary>
        private void OptionalUses()
        {
            if (MatchTokens(DelphiTokens.Uses))
            {
                Match(DelphiTokens.Uses);
                UnitList();
                Match(DelphiTokens.Semicolon);
            }
        }

        /// <summary>
        /// Определение строкового ресурса
        /// </summary>
        private void ResourceStringDefinition()
        {
            CheckId();
            Match(DelphiTokens.Id);
            Match(DelphiTokens.Equal);
            SimpleExpression();
            Match(DelphiTokens.Semicolon);
        }

        /// <summary>
        /// Блок объявления строковых ресурсов
        /// </summary>
        private void ResourceStrings()
        {
            Match(DelphiTokens.Resourcestring);
            ResourceStringDefinition();
            while (MatchTokens(DelphiTokens.Id))
                ResourceStringDefinition();
        }

        /// <summary>
        /// Блок объявления меток
        /// </summary>
        private void Labels()
        {
            Match(DelphiTokens.Label);
            IdList();
            Match(DelphiTokens.Semicolon);
        }

        /// <summary>
        /// Тело функции
        /// </summary>
        private void FunctionBody()
        {
            OptionalLocalDeclarations();
            CompoundStatement();
            Match(DelphiTokens.Semicolon);
        }

        /// <summary>
        /// Определение процедуры
        /// </summary>
        private void ProcedureDefinition()
        {
            if (!OuterProcedureHead())
                FunctionBody();
        }

        /// <summary>
        /// Определение функции
        /// </summary>
        private void FunctionDefinition()
        {
            if (!OuterFunctionHead())
                FunctionBody();
        }

        /// <summary>
        /// Определение классового метода
        /// </summary>
        private void ClassMethodDefinition()
        {
            OuterClassMethod();
            FunctionBody();
        }

        /// <summary>
        /// Определение оператора
        /// </summary>
        private void OuterRecordOperator()
        {
            Match(DelphiTokens.Class);
            Match(DelphiTokens.Operator);
            CheckId();
            Match(DelphiTokens.Id);
            Match(DelphiTokens.Dot);
            CheckId();
            Match(DelphiTokens.Id);
            FunctionContract();
            Match(DelphiTokens.Semicolon);
            FunctionBody();
        }

        /// <summary>
        /// Возможные локальные объявления (локальные переменные, константы и т.д.)
        /// </summary>
        private void OptionalLocalDeclarations()
        {
            while (true)
            {
                switch (token)
                {
                    case DelphiTokens.Type:
                        LocalTypes();
                        break;
                    case DelphiTokens.Const:
                        Consts();
                        break;
                    case DelphiTokens.Resourcestring:
                        ResourceStrings();
                        break;
                    case DelphiTokens.Var:
                    case DelphiTokens.Threadvar:
                        VariableDeclaration();
                        break;
                    case DelphiTokens.Label:
                        Labels();
                        break;
                    case DelphiTokens.Procedure:
                        ProcedureDefinition();
                        break;
                    case DelphiTokens.Function:
                        FunctionDefinition();
                        break;
                    default:
                        return;
                }
            }
        }

        /// <summary>
        /// Интервал значений для свойства
        /// </summary>
        private void IndexInterval()
        {
            Match(DelphiTokens.LSBr);
            FunctionVariableDeclarations();
            Match(DelphiTokens.RSBr);
        }

        /// <summary>
        /// У свойства может быть интервал значений
        /// </summary>
        private void OptionalIndexInterval()
        {
            if (MatchTokens(DelphiTokens.LSBr))
                IndexInterval();
        }

        /// <summary>
        /// У свойства может быть определен тип
        /// </summary>
        private void OptionalTypeDefinition()
        {
            if (MatchTokens(DelphiTokens.Colon))
            {
                Match(DelphiTokens.Colon);
                TypeDefinition();
            }
        }

        /// <summary>
        /// Возможна директива index
        /// </summary>
        private void OptionalIndex()
        {
            if (MatchTokens(DelphiTokens.Index))
            {
                Match(DelphiTokens.Index);
                IInt();
                OptionalSemicolon();
            }
        }

        /// <summary>
        /// Директива read
        /// </summary>
        private void ReadOption()
        {
            Match(DelphiTokens.Read);
            Match(DelphiTokens.Id);
        }

        /// <summary>
        /// Возможно наличие директивы read
        /// </summary>
        private void OptionalRead()
        {
            if (MatchTokens(DelphiTokens.Read))
                ReadOption();
        }

        /// <summary>
        /// возможно наличие директивы write
        /// </summary>
        private void OptionalWrite()
        {
            if (MatchTokens(DelphiTokens.Write))
            {
                Match(DelphiTokens.Write);
                Match(DelphiTokens.Id);
            }
        }

        /// <summary>
        /// возможно наличие директивы stored
        /// </summary>
        private void OptionalStored()
        {
            if (MatchTokens(DelphiTokens.Stored))
            {
                Match(DelphiTokens.Stored);
                Bool();
            }
        }

        /// <summary>
        /// возможно наличие директивы default/nodefault
        /// </summary>
        private void OptionalDefault()
        {
            switch (token)
            {
                case DelphiTokens.Default:
                    Match(DelphiTokens.Default);
                    if (!MatchTokens(DelphiTokens.Semicolon))
                        CheckExpression(Expression());
                    break;
                case DelphiTokens.Nodefault:
                    Match(DelphiTokens.Nodefault);
                    break;
            }
        }

        /// <summary>
        /// возможно наличие директивы implements
        /// </summary>
        private void OptionalImplements()
        {
            if (MatchTokens(DelphiTokens.Implements))
            {
                Match(DelphiTokens.Implements);
                Match(DelphiTokens.Id);
            }
        }

        /// <summary>
        /// Свойство у класса
        /// </summary>
        private void ClassProperty()
        {
            Match(DelphiTokens.Property);
            CheckId();
            Match(DelphiTokens.Id);
            bool interval = MatchTokens(DelphiTokens.LSBr);
            OptionalIndexInterval();
            OptionalTypeDefinition();
            bool ind = MatchTokens(DelphiTokens.Index);
            OptionalIndex();
            bool read = MatchTokens(DelphiTokens.Read);
            OptionalRead();
            OptionalWrite();
            OptionalStored();
            OptionalDefault();
            if (!interval && !ind && read) OptionalImplements();
            Match(DelphiTokens.Semicolon);
            if (interval && MatchTokens(DelphiTokens.Default))
            {
                Match(DelphiTokens.Default);
                Match(DelphiTokens.Semicolon);
            }
        }

        /// <summary>
        /// Методы класса
        /// </summary>
        private void ClassMethods()
        {
            while (true)
            {
                switch (token)
                {
                    case DelphiTokens.Property:
                        ClassProperty();
                        break;
                    case DelphiTokens.Procedure:
                    case DelphiTokens.Constructor:
                    case DelphiTokens.Destructor:
                        InnerProcedureHead();
                        break;
                    case DelphiTokens.Function:
                        InnerFunctionHead();
                        break;
                    case DelphiTokens.Class:
                        InnerClassMethod();
                        break;
                    default:
                        return;
                }
            }
        }

        /// <summary>
        /// Секции класса
        /// </summary>
        private void ClassSections()
        {
            bool loop, psection = false;
            while (true)
            {
                loop = true;
                while (loop)
                {
                    switch (token)
                    {
                        case DelphiTokens.Id:
                            if (psection) AddOnError(DelphiAnalyser.Addition.ErrorTypes.ClassPublicMember);
                            VarDeclarations();
                            break;
                        default:
                            loop = false;
                            break;
                    }
                }
                loop = true;
                while (loop)
                {
                    switch (token)
                    {
                        case DelphiTokens.Procedure:
                        case DelphiTokens.Function:
                        case DelphiTokens.Constructor:
                        case DelphiTokens.Destructor:
                        case DelphiTokens.Property:
                        case DelphiTokens.Class:
                            ClassMethods();
                            break;
                        default:
                            loop = false;
                            break;
                    }
                }
                switch (token)
                {
                    case DelphiTokens.Published:
                    case DelphiTokens.Public:
                    case DelphiTokens.Protected:
                    case DelphiTokens.Private:
                    case DelphiTokens.Automated:
                    case DelphiTokens.Var:
                        psection = (MatchTokens(DelphiTokens.Public) || MatchTokens(DelphiTokens.Var));
                        Match(token);
                        break;
                    case DelphiTokens.Type:
                        LocalTypes();
                        break;
                    case DelphiTokens.Resourcestring:
                        ResourceStrings();
                        break;
                    case DelphiTokens.Const:
                        Consts();
                        break;
                    default:
                        return;
                }
            }
        }

        /// <summary>
        /// Класс может быть abstract или sealed
        /// </summary>
        private void OptionalClassType()
        {
            switch (token)
            {
                case DelphiTokens.Abstract:
                case DelphiTokens.Sealed:
                    Match(token);
                    break;
            }
        }

        /// <summary>
        /// У интерфейса может быть родитель
        /// </summary>
        private void OptionalParent()
        {
            if (MatchTokens(DelphiTokens.LBr))
            {
                Match(DelphiTokens.LBr);
                Match(DelphiTokens.Id);
                Match(DelphiTokens.RBr);
            }
        }

        /// <summary>
        /// У класса могут быть родители
        /// </summary>
        private void OptionalParents()
        {
            if (MatchTokens(DelphiTokens.LBr))
            {
                Match(DelphiTokens.LBr);
                IdList(false);
                Match(DelphiTokens.RBr);
            }
        }

        /// <summary>
        /// Определение класса
        /// </summary>
        private void ClassDefinition()
        {
            Match(DelphiTokens.Class);
            switch (token)
            {
                case DelphiTokens.Of:
                    Match(DelphiTokens.Of);
                    Match(DelphiTokens.Id);
                    break;
                case DelphiTokens.Semicolon:
                    return;
                default:
                    OptionalClassType();
                    OptionalParents();
                    ClassSections();
                    Match(DelphiTokens.End);
                    break;
            }
        }

        /// <summary>
        /// Оператор в записи
        /// </summary>
        private void RecordOperator()
        {
            Match(DelphiTokens.Class);
            Match(DelphiTokens.Operator);
            Match(DelphiTokens.Id);
            FunctionContract();
            Match(DelphiTokens.Semicolon);
        }

        /// <summary>
        /// Методы записи
        /// </summary>
        private void RecordMethods()
        {
            while (true)
            {
                switch (token)
                {
                    case DelphiTokens.Property:
                        ClassProperty();
                        break;
                    case DelphiTokens.Procedure:
                        InnerProcedureHead();
                        break;
                    case DelphiTokens.Function:
                        InnerFunctionHead();
                        break;
                    case DelphiTokens.Class:
                        RecordOperator();
                        break;
                    default:
                        return;
                }
            }
        }

        /// <summary>
        /// Секции записи
        /// </summary>
        private void RecordSections()
        {
            bool loop = true, psection = false;
            while (true)
            {
                while (loop)
                {
                    switch (token)
                    {
                        case DelphiTokens.Id:
                            if (psection) AddOnError(DelphiAnalyser.Addition.ErrorTypes.RecordPublicMember);
                            VarDeclarations();
                            break;
                        default:
                            loop = false;
                            break;
                    }
                }
                loop = true;
                while (loop)
                {
                    switch (token)
                    {
                        case DelphiTokens.Procedure:
                        case DelphiTokens.Function:
                        case DelphiTokens.Property:
                        case DelphiTokens.Class:
                            RecordMethods();
                            break;
                        default:
                            loop = false;
                            break;
                    }
                }
                switch (token)
                {
                    case DelphiTokens.Published:
                    case DelphiTokens.Public:
                    case DelphiTokens.Protected:
                    case DelphiTokens.Private:
                    case DelphiTokens.Automated:
                    case DelphiTokens.Var:
                        psection = (MatchTokens(DelphiTokens.Public) || MatchTokens(DelphiTokens.Var));
                        Match(token);
                        break;
                    case DelphiTokens.Type:
                        LocalTypes();
                        break;
                    case DelphiTokens.Resourcestring:
                        ResourceStrings();
                        break;
                    case DelphiTokens.Const:
                        Consts();
                        break;
                    default:
                        return;
                }
            }
        }

        /// <summary>
        /// Определение записи
        /// </summary>
        private void RecordDefinition()
        {
            Match(DelphiTokens.Record);
            RecordSections();
            Match(DelphiTokens.End);
        }

        /// <summary>
        /// Определение записи-константы
        /// </summary>
        private void ConstRecordDefinition()
        {
            Match(DelphiTokens.Record);
            if (MatchTokens(DelphiTokens.Id))
                VarDeclarations();
            Match(DelphiTokens.End);
        }

        /// <summary>
        /// Определение константы
        /// </summary>
        private void ObjectDefinition()
        {
            Match(DelphiTokens.Object);
            OptionalClassType();
            OptionalParents();
            ClassSections();
            Match(DelphiTokens.Id);
        }

        /// <summary>
        /// GUID
        /// </summary>
        private void Guid()
        {
            Match(DelphiTokens.LSBr);
            Str();
            Match(DelphiTokens.RSBr);
        }

        /// <summary>
        /// Возможен GUID
        /// </summary>
        private void OptionalGuid()
        {
            if (MatchTokens(DelphiTokens.LSBr))
                Guid();
        }

        /// <summary>
        /// Интерфейсное свойство
        /// </summary>
        private void InterfaceProperty()
        {
            Match(DelphiTokens.Property);
            CheckId();
            Match(DelphiTokens.Id);
            OptionalIndexInterval();
            OptionalTypeDefinition();
            OptionalIndex();
            OptionalRead();
            OptionalWrite();
            OptionalStored();
            OptionalDefault();
            Match(DelphiTokens.Semicolon);
        }

        /// <summary>
        /// Определение интерфейса
        /// </summary>
        private void InterfaceDefinition()
        {
            Match(DelphiTokens.Interface);
            bool empty = !MatchTokens(DelphiTokens.LBr);
            OptionalParent();
            empty = empty && !MatchTokens(DelphiTokens.LSBr);
            OptionalGuid();
            bool loop = true;
            while (loop)
            {
                switch (token)
                {
                    case DelphiTokens.Property:
                        InterfaceProperty();
                        empty = false;
                        break;
                    case DelphiTokens.Procedure:
                        InnerProcedureHead();
                        empty = false;
                        break;
                    case DelphiTokens.Function:
                        InnerFunctionHead();
                        empty = false;
                        break;
                    default:
                        loop = false;
                        break;
                }
            }
            if (!empty) Match(DelphiTokens.End);
        }

        /// <summary>
        /// Возможна директива dispid
        /// </summary>
        private void OptionalDispid()
        {
            if (MatchTokens(DelphiTokens.Dispid))
            {
                Match(DelphiTokens.Dispid);
                SignedIInt();
            }
        }

        /// <summary>
        /// Директива dispid может быть в конце
        /// </summary>
        private void OptionalDispidEnd()
        {
            if (MatchTokens(DelphiTokens.Dispid))
            {
                OptionalDispid();
                Match(DelphiTokens.Semicolon);
            }
        }

        /// <summary>
        /// Возможна директива default
        /// </summary>
        private void OptionalDispDefault()
        {
            if (MatchTokens(DelphiTokens.Default))
            {
                Match(DelphiTokens.Default);
                Match(DelphiTokens.Semicolon);
            }
        }

        /// <summary>
        /// Свойство Dispatch-интерфейс
        /// </summary>
        private void DispinterfaceProperty()
        {
            Match(DelphiTokens.Property);
            CheckId();
            Match(DelphiTokens.Id);
            bool array = MatchTokens(DelphiTokens.LSBr);
            OptionalIndexInterval();
            Match(DelphiTokens.Id);
            OptionalDispid();
            Match(DelphiTokens.Semicolon);
            if (array) OptionalDispDefault();
        }

        /// <summary>
        /// Определение Dispatch-интерфейса
        /// </summary>
        private void DispinterfaceDefinition()
        {
            Match(DelphiTokens.Dispinterface);
            Guid();
            while (true)
            {
                switch (token)
                {
                    case DelphiTokens.Property:
                        DispinterfaceProperty();
                        break;
                    case DelphiTokens.Procedure:
                        InnerProcedureHead();
                        break;
                    case DelphiTokens.Function:
                        InnerFunctionHead();
                        break;
                    default:
                        continue;
                }
            }
            Match(DelphiTokens.End);
        }

        /// <summary>
        /// Определение типа (любого)
        /// </summary>
        private void FullTypeDefinition()
        {
            switch (token)
            {
                case DelphiTokens.Class:
                    ClassDefinition();
                    break;
                case DelphiTokens.Object:
                    ObjectDefinition();
                    break;
                case DelphiTokens.Interface:
                    InterfaceDefinition();
                    break;
                case DelphiTokens.Dispinterface:
                    DispinterfaceDefinition();
                    break;
                default:
                    TypeDefinition();
                    break;
            }
        }

        /// <summary>
        /// Локальные типы
        /// </summary>
        private void LocalTypes()
        {
            Match(DelphiTokens.Type);
            while (true)
            {
                if (MatchTokens(DelphiTokens.Id))
                {
                    CheckId();
                    Match(DelphiTokens.Id);
                    Match(DelphiTokens.Equal);
                    TypeDefinition();
                    Match(DelphiTokens.Semicolon);
                }
                else return;
            }
        }

        /// <summary>
        /// Блок определения типа
        /// </summary>
        private void Types()
        {
            Match(DelphiTokens.Type);
            while (true)
            {
                if (MatchTokens(DelphiTokens.Id))
                {
                    CheckId();
                    Match(DelphiTokens.Id);
                    Match(DelphiTokens.Equal);
                    FullTypeDefinition();
                    Match(DelphiTokens.Semicolon);
                }
                else return;
            }
        }

        /// <summary>
        /// Блок интерфейсной части модуля
        /// </summary>
        private void InterfaceBlocks()
        {
            while (true)
            {
                switch (token)
                {
                    case DelphiTokens.Const:
                        Consts();
                        break;
                    case DelphiTokens.Type:
                        Types();
                        break;
                    case DelphiTokens.Var:
                    case DelphiTokens.Threadvar:
                        Vars();
                        break;
                    case DelphiTokens.Resourcestring:
                        ResourceStrings();
                        break;
                    case DelphiTokens.Label:
                        Labels();
                        break;
                    case DelphiTokens.Procedure:
                        InnerProcedureHead();
                        break;
                    case DelphiTokens.Function:
                        InnerFunctionHead();
                        break;
                    default:
                        return;
                }
            }
        }

        /// <summary>
        /// Блок определения
        /// </summary>
        private void ImplementationBlocks()
        {
            while (true)
            {
                switch (token)
                {
                    case DelphiTokens.Const:
                        Consts();
                        break;
                    case DelphiTokens.Type:
                        Types();
                        break;
                    case DelphiTokens.Var:
                    case DelphiTokens.Threadvar:
                        Vars();
                        break;
                    case DelphiTokens.Resourcestring:
                        ResourceStrings();
                        break;
                    case DelphiTokens.Label:
                        Labels();
                        break;
                    case DelphiTokens.Procedure:
                    case DelphiTokens.Constructor:
                    case DelphiTokens.Destructor:
                        ProcedureDefinition();
                        break;
                    case DelphiTokens.Function:
                        FunctionDefinition();
                        break;
                    case DelphiTokens.Class:
                        switch (MatchAhead())
                        {
                            case DelphiTokens.Operator:
                                OuterRecordOperator();
                                break;
                            case DelphiTokens.Procedure:
                            case DelphiTokens.Function:
                                ClassMethodDefinition();
                                break;
                            default:
                                Panic(SyntaxTranslationErrors.UnexpectedToken);
                                break;
                        }
                        break;
                    default:
                        return;
                }
            }
        }

        /// <summary>
        /// Возможен блок инициализации
        /// </summary>
        private void OptionalInitialization()
        {
            if (MatchTokens(DelphiTokens.Initialization))
            {
                Match(DelphiTokens.Initialization);
                OptionalStatements();
            }
        }

        /// <summary>
        /// Возможен блок финализации
        /// </summary>
        private void OptionalFinalization()
        {
            if (MatchTokens(DelphiTokens.Finalization))
            {
                Match(DelphiTokens.Finalization);
                OptionalStatements();
            }
        }

        /// <summary>
        /// Возможна опция resident при экспорте функций
        /// </summary>
        private void OptionalResident()
        {
            if (MatchTokens(DelphiTokens.Resident))
                Match(DelphiTokens.Resident);
        }

        /// <summary>
        /// Возможна опция параметров экспорта
        /// </summary>
        private void OptionalExportBy()
        {
            switch (token)
            {
                case DelphiTokens.Index:
                    Match(DelphiTokens.Index);
                    IInt();
                    break;
                case DelphiTokens.Name:
                    Match(DelphiTokens.Name);
                    Str();
                    OptionalResident();
                    break;
            }
        }

        /// <summary>
        /// Возможен блок экспорта функций
        /// </summary>
        private void OptionalExports()
        {
            if (MatchTokens(DelphiTokens.Exports))
            {
                Match(DelphiTokens.Exports);
                while (true)
                {
                    Match(DelphiTokens.Id);
                    OptionalExportBy();
                    if (!MatchTokens(DelphiTokens.Comma)) break;
                    Match(DelphiTokens.Comma);
                }
                Match(DelphiTokens.Semicolon);
            }
        }

        /// <summary>
        /// Возможно налицие параметров программы
        /// </summary>
        private void OptionalParams()
        {
            if (MatchTokens(DelphiTokens.LBr))
            {
                Match(DelphiTokens.LBr);
                IdList();
                Match(DelphiTokens.RBr);
            }
        }

        /// <summary>
        /// Трансляция
        /// </summary>
        public bool Translate()
        {
            if (state == States.Initialized)
            {
                try
                {
                    Initialize();
                    Match(DelphiTokens.Undefined);
                    switch (token)
                    {
                        case DelphiTokens.Program:
                            Match(DelphiTokens.Program);
                            Match(DelphiTokens.Id);
                            OptionalParams();
                            Match(DelphiTokens.Semicolon);
                            OptionalUses();
                            ImplementationBlocks();
                            CompoundStatement();
                            Match(DelphiTokens.Dot);
                            break;
                        case DelphiTokens.Unit:
                            Match(DelphiTokens.Unit);
                            Match(DelphiTokens.Id);
                            Match(DelphiTokens.Semicolon);
                            Match(DelphiTokens.Interface);
                            OptionalUses();
                            InterfaceBlocks();
                            Match(DelphiTokens.Implementation);
                            OptionalUses();
                            ImplementationBlocks();
                            OptionalInitialization();
                            OptionalFinalization();
                            Match(DelphiTokens.End);
                            Match(DelphiTokens.Dot);
                            break;
                        case DelphiTokens.Library:
                            Match(DelphiTokens.Library);
                            Match(DelphiTokens.Id);
                            Match(DelphiTokens.Semicolon);
                            OptionalUses();
                            ImplementationBlocks();
                            OptionalExports();
                            CompoundStatement();
                            Match(DelphiTokens.Dot);
                            break;
                        default:
                            Panic(SyntaxTranslationErrors.UnexpectedToken);
                            break;
                    }
                    return true;
                }
                catch (DelphiAnalyser.Addition.ParsingError)
                {
                    return false;
                }
            }
            else return false;
        }

        /// <summary>
        /// Перегрузка
        /// </summary>
        /// <param name="file">транслируемый файл</param>
        /// <param name="source">код для трансляции</param>
        /// <returns>трансляция прошла успешно</returns>
        public bool Translate(FileInfo file, string source)
        {
            Initialize(file, source);
            return Translate();
        }
    }
}
*/