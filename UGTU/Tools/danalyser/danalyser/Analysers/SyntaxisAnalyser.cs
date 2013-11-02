using System;
using System.Collections.Generic;
using System.Text;
using System.IO;

namespace DelphiAnalyser.Analysers
{
    /// <summary>
    /// Синтаксический анализатор
    /// </summary>
    public class SyntaxisAnalyser
    {
        // Лексический анализатор
        private LexicalAnalyser lanalyser;

        // Текущий анализ
        private States state;
        private FileInfo file;
        private DelphiTokens token;
        private string currentId, source;
        private List<EventHandler<AnalyserParameters>> needparams;
        private Dictionary<EventHandler<AnalyserParameters>, EventParameters> eventparams;

        // Ошибки синтаксического анализа
        private enum SyntaxTranslationErrors { UnexpectedToken }
        private Dictionary<SyntaxTranslationErrors, DelphiAnalyser.Addition.LocalError> syntaxerrors;

        // Наборы токенов
        // canbeid - токен, который может быть как ключевым словом так и идентификатором
        // extraid - токен, который не может быть объявлен как Id, но это не мешает его использованию в качестве Id
        private List<DelphiTokens> canbeid, extraid;

        /// <summary>
        /// Событие - произошла ошибка
        /// </summary>
        public event EventHandler<DelphiAnalyser.Addition.ErrorParam> ErrorOccuredEvent;

        /// <summary>
        /// Событие - объявлены идентификаторы
        /// </summary>
        public event EventHandler<AnalyserParameters> IdDeclarationEvent;

        /// <summary>
        /// Событие - объявлены идентификаторы в функции
        /// </summary>
        public event EventHandler<AnalyserParameters> FunctionIdDeclarationEvent;

        /// <summary>
        /// Событие - описано выражение
        /// </summary>
        public event EventHandler<AnalyserParameters> ExpressionEvent;

        /// <summary>
        /// Событие - описано условие выбора
        /// </summary>
        public event EventHandler<AnalyserParameters> CaseConditionEvent;

        /// <summary>
        /// Событие - определение класса
        /// </summary>
        public event EventHandler<AnalyserParameters> ClassSectionEvent;

        /// <summary>
        /// Событие - открытие файла
        /// </summary>
        public event EventHandler<AnalyserParameters> FileParsedEvent;

        /// <summary>
        /// Событие - блок кода
        /// </summary>
        public event EventHandler<AnalyserParameters> BodyDefinedEvent;

        /// <summary>
        /// Исходный код анализируемого файла
        /// </summary>
        public string Source { get { return source; } }

        /// <summary>
        /// Инициализация токенов, которые могут быть ключевыми словами
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
        /// Инициализация синтаксических ошибок
        /// </summary>
        private void InitSyntaxErrors()
        {
            if (syntaxerrors == null)
            {
                syntaxerrors = new Dictionary<SyntaxTranslationErrors, DelphiAnalyser.Addition.LocalError>();
                syntaxerrors.Add(SyntaxTranslationErrors.UnexpectedToken, new DelphiAnalyser.Addition.LocalError("Неожиданная последовательность языка!", 100));
            }
        }

        /// <summary>
        /// Добавление события в список ожидаюжих токена
        /// </summary>
        /// <param name="e">событие</param>
        private void AddEvent(EventHandler<AnalyserParameters> e)
        {
            eventparams.Add(e, new EventParameters());
        }

        /// <summary>
        /// Инициализация событий анализатора
        /// </summary>
        private void InitEventParams()
        {
            if (needparams == null)
                needparams = new List<EventHandler<AnalyserParameters>>();
            if (eventparams == null)
            {
                eventparams = new Dictionary<EventHandler<AnalyserParameters>, EventParameters>();
                AddEvent(IdDeclarationEvent);
                AddEvent(FunctionIdDeclarationEvent);
                AddEvent(ExpressionEvent);
                AddEvent(CaseConditionEvent);
                AddEvent(ClassSectionEvent);
                AddEvent(FileParsedEvent);
                AddEvent(BodyDefinedEvent);
            }
        }

        /// <summary>
        /// Инициализация анализатора
        /// </summary>
        private void Initialize()
        {
            InitCanBeId();
            InitExtraId();
            InitSyntaxErrors();
            InitEventParams();
            token = DelphiTokens.Undefined;
        }

        /// <summary>
        /// Параметризованная инициализация анализатора
        /// </summary>
        /// <param name="file">файл для анализа</param>
        /// <param name="source">исходный код</param>
        public void Initialize(FileInfo file, string source)
        {
            lanalyser.Initialize(file, source);
            Initialize();
            this.file = file;
            this.source = source;
            state = States.Initialized;
        }

        /// <summary>
        /// Конструктор с инициализацией
        /// </summary>
        /// <param name="lanalyser">лексический анализатор</param>
        public SyntaxisAnalyser(LexicalAnalyser lanalyser)
        {
            this.lanalyser = lanalyser;
            state = States.Uninitialized;
        }

        /// <summary>
        /// Конструктор
        /// </summary>
        public SyntaxisAnalyser():this(new LexicalAnalyser()) { }

        /// <summary>
        /// Ошибка синтаксического анализа
        /// </summary>
        /// <param name="e">ошибка</param>
        private void Panic(SyntaxTranslationErrors e)
        {
            throw new DelphiAnalyser.Addition.ParsingError(syntaxerrors[e].Message, syntaxerrors[e].Level, file, lanalyser.Line, new Dictionary<string, string>(lanalyser.MetaTags));
        }

        /// <summary>
        /// Считывание очередного токена
        /// </summary>
        private void ScanToken()
        {
            TokenInfo t = lanalyser.Token;
            token = t.Token;
            currentId = t.Text;
        }

        /// <summary>
        /// Сравнение двух токенов
        /// </summary>
        /// <returns>результат сравнения</returns>
        private bool MatchTokens(DelphiTokens t1, DelphiTokens t2)
        {
            if ((t1 == t2) || ((t1 == DelphiTokens.Id) && canbeid.Contains(t2)) || ((t2 == DelphiTokens.Id) && canbeid.Contains(t1)))
                return true;
            else return false;
        }

        /// <summary>
        /// Сравшение токена с последним считанным
        /// </summary>
        /// <param name="t">токен, сравниваемые с последним</param>
        /// <returns>результат сравнения</returns>
        private bool MatchTokens(DelphiTokens t)
        {
            return MatchTokens(token, t);
        }

        /// <summary>
        /// Добавение токена во все ожидающие списки
        /// </summary>
        /// <param name="t">информация о токене</param>
        private void MarkToken(TokenInfo t)
        {
            foreach (EventHandler<AnalyserParameters> e in needparams)
                eventparams[e].AddToken(t);
        }

        /// <summary>
        /// Считывание токена с заглядыванием назад
        /// </summary>
        /// <param name="t">предыдущий токен</param>
        private void Match(DelphiTokens t)
        {
            MarkToken(new TokenInfo(token, currentId, lanalyser.Line, new Dictionary<string, string>(lanalyser.MetaTags)));
            if (MatchTokens(t)) ScanToken();
            else Panic(SyntaxTranslationErrors.UnexpectedToken);
        }

        /// <summary>
        /// Считывание экстра токена
        /// </summary>
        private void ExtraMatch()
        {
            MarkToken(new TokenInfo(token, currentId, lanalyser.Line, new Dictionary<string, string>(lanalyser.MetaTags)));
            if (MatchTokens(DelphiTokens.Id) || extraid.Contains(token))
                ScanToken();
            else Panic(SyntaxTranslationErrors.UnexpectedToken);
        }

        /// <summary>
        /// Считывание токена с заглядыванием назад
        /// </summary>
        /// <param name="t">ожидаемый токен</param>
        private DelphiTokens MatchAhead()
        {
            return lanalyser.NextToken.Token;
        }

        /// <summary>
        /// Создание набора токенов для ожидающего события
        /// </summary>
        /// <param name="e">событие</param>
        private int StartMarkTokens(EventHandler<AnalyserParameters> e)
        {
            if (!needparams.Contains(e))
                needparams.Add(e);
            return eventparams[e].AddEventParams(file);
        }

        /// <summary>
        /// Передача набора токенов в обработчики событий
        /// </summary>
        /// <param name="e">событие</param>
        /// <param name="index">номер очереди</param>
        private void EndMarkTokens(EventHandler<AnalyserParameters> e, int index)
        {
            if (needparams.Contains(e))
            {
                if (e != null)
                    e(this, eventparams[e][index]);
                eventparams[e].ReleaseEventParams(index);
                if (eventparams[e].BusyCount == 0)
                    needparams.Remove(e);
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
            if (MatchTokens(DelphiTokens.Semicolon) && MatchTokens(MatchAhead(), DelphiTokens.External))
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
                int index = StartMarkTokens(ExpressionEvent);
                SimpleExpression();
                EndMarkTokens(ExpressionEvent, index);
            }
            else if (MatchAhead() == DelphiTokens.Message)
            {
                Match(DelphiTokens.Semicolon);
                Match(DelphiTokens.Message);
                int index = StartMarkTokens(ExpressionEvent);
                SimpleExpression();
                EndMarkTokens(ExpressionEvent, index);
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
                int index = StartMarkTokens(ExpressionEvent);
                SimpleExpression();
                EndMarkTokens(ExpressionEvent, index);
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
                int index = StartMarkTokens(ExpressionEvent);
                Expression();
                EndMarkTokens(ExpressionEvent, index);
            }
            else
            {
                int index = StartMarkTokens(ExpressionEvent);
                Expression();
                EndMarkTokens(ExpressionEvent, index);
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
                    int index = StartMarkTokens(ExpressionEvent);
                    Expression();
                    EndMarkTokens(ExpressionEvent, index);
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

        /// <summary>
        /// Наивысший приоритет операций (скобки перенесены на уровень переменных в связи с (TObject as TButton).Caption)
        /// </summary>
        private void Factor()
        {
            switch (token)
            {
                case DelphiTokens.Not:
                case DelphiTokens.AtSign:
                case DelphiTokens.Inherited:
                    Match(token);
                    Factor();
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
                    break;
            }
            return;
        }

        /// <summary>
        /// Высокий приоритет
        /// </summary>
        private void Term()
        {
            Factor();
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
                        Match(token);
                        Factor();
                        break;
                    default:
                        return;
                }
            }
        }

        /// <summary>
        /// Низкий приоритет
        /// </summary>
        private void SimpleExpression()
        {
            Term();
            while (true)
            {
                switch (token)
                {
                    case DelphiTokens.Addition:
                    case DelphiTokens.Subtraction:
                    case DelphiTokens.Or:
                    case DelphiTokens.Xor:
                        Match(token);
                        Term();
                        break;
                    default:
                        return;
                }
            }
        }

        /// <summary>
        /// Самый низкий приоритет
        /// </summary>
        private void Expression()
        {
            SimpleExpression();
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
                        Match(token);
                        SimpleExpression();
                        break;
                    default:
                        return;
                }
            }
        }

        /// <summary>
        /// Возможен список выражений
        /// </summary>
        private void OptionalExpressionList()
        {
            int index;
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
                        index = StartMarkTokens(ExpressionEvent);
                        Expression();
                        EndMarkTokens(ExpressionEvent, index);
                        break;
                    case DelphiTokens.Comma:
                        Match(DelphiTokens.Comma);
                        index = StartMarkTokens(ExpressionEvent);
                        Expression();
                        EndMarkTokens(ExpressionEvent, index);
                        break;
                    default:
                        if (MatchTokens(DelphiTokens.Id))
                        {
                            index = StartMarkTokens(ExpressionEvent);
                            Expression();
                            EndMarkTokens(ExpressionEvent, index);
                        }
                        else return;
                        break;
                }
            }
        }

        /// <summary>
        /// Возможен список переменных в заголовке функции/процедуры
        /// </summary>
        private void OptionalVars()
        {
            if (MatchTokens(DelphiTokens.LBr))
            {
                Match(DelphiTokens.LBr);
                if (!MatchTokens(DelphiTokens.RBr))
                    FunctionVariableDeclarations();
                Match(DelphiTokens.RBr);
            }
        }

        /// <summary>
        /// Контракт процедуры
        /// </summary>
        /// <returns>содержит ли контракт директиву external</returns>
        private bool ProcedureContract()
        {
            OptionalVars();
            return OptionalDirectives();
        }

        /// <summary>
        /// Контракт функции
        /// </summary>
        /// <returns>содержит ли контракт директиву external</returns>
        private bool FunctionContract()
        {
            OptionalVars();
            bool typedefined = MatchTokens(DelphiTokens.Colon);
            if (typedefined)
            {
                Match(DelphiTokens.Colon);
                SimpleType();
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
            OptionalVars();
            OptionalOfObject();
            OptionalDirectives();
        }

        /// <summary>
        /// Контракт функционального типа
        /// </summary>
        private void TypeFunctionContract()
        {
            OptionalVars();
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
                    int index = StartMarkTokens(IdDeclarationEvent);
                    Match(DelphiTokens.Id);
                    EndMarkTokens(IdDeclarationEvent, index);
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
            int index = StartMarkTokens(IdDeclarationEvent);
            Match(DelphiTokens.Id);
            EndMarkTokens(IdDeclarationEvent, index);
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
                    int index = StartMarkTokens(IdDeclarationEvent);
                    Match(DelphiTokens.Id);
                    if (MatchTokens(DelphiTokens.Dot))
                    {
                        Match(DelphiTokens.Dot);
                        Match(DelphiTokens.Id);
                    }
                    EndMarkTokens(IdDeclarationEvent, index);
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
            int index = StartMarkTokens(IdDeclarationEvent);
            Match(DelphiTokens.Id);
            if (MatchTokens(DelphiTokens.Dot))
            {
                Match(DelphiTokens.Dot);
                Match(DelphiTokens.Id);
            }
            EndMarkTokens(IdDeclarationEvent, index);
            bool isExternal = FunctionContract();
            Match(DelphiTokens.Semicolon);
            return isExternal;
        }

        /// <summary>
        /// Возможен метод класса (директива class)
        /// </summary>
        private void OptionalClassMethod()
        {
            if (MatchTokens(DelphiTokens.Class))
                Match(DelphiTokens.Class);
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
            SimpleType();
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
//                    OptionalModule();
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
        /// <returns>количество идентификаторов</returns>
        private int IdList()
        {
            int idCount = 1;
            Match(DelphiTokens.Id);
            while (MatchTokens(DelphiTokens.Comma))
            {
                Match(DelphiTokens.Comma);
                Match(DelphiTokens.Id);
                idCount++;
            }
            return idCount;
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
        private void FunctionVariableDeclaration()
        {
            int index = StartMarkTokens(IdDeclarationEvent);
            bool many = (IdList() > 1);
            EndMarkTokens(IdDeclarationEvent, index);
            if (MatchTokens(DelphiTokens.Colon))
            {
                Match(DelphiTokens.Colon);
                FunctionTypeDefinition();
            }
            if (!many && MatchTokens(DelphiTokens.Equal))
            {
                Match(DelphiTokens.Equal);
                index = StartMarkTokens(ExpressionEvent);
                Expression();
                EndMarkTokens(ExpressionEvent, index);
            }
        }

        /// <summary>
        /// Объявления локальных переменных в функции
        /// </summary>
        private void FunctionVariableDeclarations()
        {
            int index = StartMarkTokens(FunctionIdDeclarationEvent);
            OptionalPrefix();
            FunctionVariableDeclaration();
            while (MatchTokens(DelphiTokens.Semicolon))
            {
                Match(DelphiTokens.Semicolon);
                OptionalPrefix();
                FunctionVariableDeclaration();
            }
            EndMarkTokens(FunctionIdDeclarationEvent, index);
        }

        /// <summary>
        /// Объявление переменных
        /// </summary>
        private void VarDeclaration()
        {
            int index = StartMarkTokens(IdDeclarationEvent);
            bool many = (IdList() > 1);
            EndMarkTokens(IdDeclarationEvent, index);
            Match(DelphiTokens.Colon);
            TypeDefinition();
            if (!many && MatchTokens(DelphiTokens.Equal))
            {
                Match(DelphiTokens.Equal);
                index = StartMarkTokens(ExpressionEvent);
                Expression();
                EndMarkTokens(ExpressionEvent, index);
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
            int index = StartMarkTokens(BodyDefinedEvent);
            Match(DelphiTokens.Begin);
            OptionalStatements();
            EndMarkTokens(BodyDefinedEvent, index);
            Match(DelphiTokens.End);
        }

        /// <summary>
        /// Возможен else
        /// </summary>
        private void OptionalElse()
        {
            if (MatchTokens(DelphiTokens.Else))
            {
                int index = StartMarkTokens(BodyDefinedEvent);
                Match(DelphiTokens.Else);
                Statement(false);
                EndMarkTokens(BodyDefinedEvent, index);
            }
        }

        /// <summary>
        /// Возможен идентификатор в блоке on ... do ...
        /// </summary>
        private void OptionalId()
        {
            if (MatchTokens(MatchAhead(), DelphiTokens.Colon))
            {
                int index = StartMarkTokens(IdDeclarationEvent);
                Match(DelphiTokens.Id);
                EndMarkTokens(IdDeclarationEvent, index);
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
            int index = StartMarkTokens(CaseConditionEvent);
            Expression();
            EndMarkTokens(CaseConditionEvent, index);
            while (MatchTokens(DelphiTokens.Comma))
            {
                Match(DelphiTokens.Comma);
                index = StartMarkTokens(CaseConditionEvent);
                Expression();
                EndMarkTokens(CaseConditionEvent, index);
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
                        int eindex = StartMarkTokens(BodyDefinedEvent);
                        OptionalElse();
                        EndMarkTokens(BodyDefinedEvent, eindex);
                        OptionalSemicolon();
                        return;
                    case DelphiTokens.End:
                        return;
                    default:
                        OptionalCaseParams();
                        int cindex = StartMarkTokens(BodyDefinedEvent);
                        Match(DelphiTokens.Colon);
                        if (MatchTokens(DelphiTokens.End))
                        {
                            EndMarkTokens(BodyDefinedEvent, cindex);
                            return;
                        }
                        if (!MatchTokens(DelphiTokens.Semicolon))
                            Statement();
                        EndMarkTokens(BodyDefinedEvent, cindex);
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
            int index;
            switch (token)
            {
                case DelphiTokens.Begin:
                    CompoundStatement();
                    break;
                case DelphiTokens.If:
                    Match(DelphiTokens.If);
                    index = StartMarkTokens(ExpressionEvent);
                    Expression();
                    EndMarkTokens(ExpressionEvent, index);
                    int iindex = StartMarkTokens(BodyDefinedEvent);
                    Match(DelphiTokens.Then);
                    Statement();
                    EndMarkTokens(BodyDefinedEvent, iindex);
                    OptionalElse();
                    break;
                case DelphiTokens.Try:
                    int tindex = StartMarkTokens(BodyDefinedEvent);
                    Match(DelphiTokens.Try);
                    OptionalStatements();
                    EndMarkTokens(BodyDefinedEvent, tindex);
                    tindex = StartMarkTokens(BodyDefinedEvent);
                    TryOptionBlock();
                    EndMarkTokens(BodyDefinedEvent, tindex);
                    Match(DelphiTokens.End);
                    break;
                case DelphiTokens.For:
                    Match(DelphiTokens.For);
                    Variable();
                    Match(DelphiTokens.Assigment);
                    index = StartMarkTokens(ExpressionEvent);
                    Expression();
                    EndMarkTokens(ExpressionEvent, index);
                    ForOption();
                    index = StartMarkTokens(ExpressionEvent);
                    Expression();
                    EndMarkTokens(ExpressionEvent, index);
                    int findex = StartMarkTokens(BodyDefinedEvent);
                    Match(DelphiTokens.Do);
                    OptionalStatement();
                    EndMarkTokens(BodyDefinedEvent, findex);
                    break;
                case DelphiTokens.While:
                    Match(DelphiTokens.While);
                    index = StartMarkTokens(ExpressionEvent);
                    Expression();
                    EndMarkTokens(ExpressionEvent, index);
                    int windex = StartMarkTokens(BodyDefinedEvent);
                    Match(DelphiTokens.Do);
                    OptionalStatements();
                    EndMarkTokens(BodyDefinedEvent, windex);
                    break;
                case DelphiTokens.Repeat:
                    int rindex = StartMarkTokens(BodyDefinedEvent);
                    Match(DelphiTokens.Repeat);
                    OptionalStatements();
                    EndMarkTokens(BodyDefinedEvent, rindex);
                    Match(DelphiTokens.Until);
                    index = StartMarkTokens(ExpressionEvent);
                    Expression();
                    EndMarkTokens(ExpressionEvent, index);
                    break;
                case DelphiTokens.With:
                    Match(DelphiTokens.With);
                    Variable();
                    int wiindex = StartMarkTokens(BodyDefinedEvent);
                    Match(DelphiTokens.Do);
                    OptionalStatements();
                    EndMarkTokens(BodyDefinedEvent, wiindex);
                    break;
                case DelphiTokens.Case:
                    Match(DelphiTokens.Case);
                    index = StartMarkTokens(ExpressionEvent);
                    Expression();
                    EndMarkTokens(ExpressionEvent, index);
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
                            index = StartMarkTokens(ExpressionEvent);
                            Expression();
                            EndMarkTokens(ExpressionEvent, index);
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
                        }
                        else return;
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
                    int index = StartMarkTokens(ExpressionEvent);
                    Expression();
                    EndMarkTokens(ExpressionEvent, index);
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
            int index = StartMarkTokens(IdDeclarationEvent);
            Match(DelphiTokens.Id);
            EndMarkTokens(IdDeclarationEvent, index);
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
            int index = StartMarkTokens(IdDeclarationEvent);
            Match(DelphiTokens.Id);
            EndMarkTokens(IdDeclarationEvent, index);
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
            int index = StartMarkTokens(IdDeclarationEvent);
            IdList();
            EndMarkTokens(IdDeclarationEvent, index);
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
            int index = StartMarkTokens(IdDeclarationEvent);
            Match(DelphiTokens.Id);
            Match(DelphiTokens.Dot);
            Match(DelphiTokens.Id);
            EndMarkTokens(IdDeclarationEvent, index);
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
        /// Возможно наличие директивы write
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
        /// Возможно наличие директивы stored
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
        /// Возможно наличие директивы default/nodefault
        /// </summary>
        private void OptionalDefault()
        {
            switch (token)
            {
                case DelphiTokens.Default:
                    Match(DelphiTokens.Default);
                    if (!MatchTokens(DelphiTokens.Semicolon))
                    {
                        int index = StartMarkTokens(ExpressionEvent);
                        Expression();
                        EndMarkTokens(ExpressionEvent, index);
                    }
                    break;
                case DelphiTokens.Nodefault:
                    Match(DelphiTokens.Nodefault);
                    break;
            }
        }

        /// <summary>
        /// Возможно наличие директивы implements
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
            int index = StartMarkTokens(IdDeclarationEvent);
            Match(DelphiTokens.Id);
            EndMarkTokens(IdDeclarationEvent, index);
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
            int index = StartMarkTokens(ClassSectionEvent);
            bool loop;
            while (true)
            {
                loop = true;
                while (loop)
                {
                    switch (token)
                    {
                        case DelphiTokens.Id:
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
                EndMarkTokens(ClassSectionEvent, index);
                switch (token)
                {
                    case DelphiTokens.Published:
                    case DelphiTokens.Public:
                    case DelphiTokens.Protected:
                    case DelphiTokens.Private:
                    case DelphiTokens.Automated:
                    case DelphiTokens.Var:
                        index = StartMarkTokens(ClassSectionEvent);
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

        private void OptionalClassBody()
        {
            if (token != DelphiTokens.Semicolon)
            {
                ClassSections();
                Match(DelphiTokens.End);
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
                IdList();
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
                    OptionalClassBody();
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
            int index = StartMarkTokens(ClassSectionEvent);
            bool loop = true;
            while (true)
            {
                while (loop)
                {
                    switch (token)
                    {
                        case DelphiTokens.Id:
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
                EndMarkTokens(ClassSectionEvent, index);
                switch (token)
                {
                    case DelphiTokens.Published:
                    case DelphiTokens.Public:
                    case DelphiTokens.Protected:
                    case DelphiTokens.Private:
                    case DelphiTokens.Automated:
                    case DelphiTokens.Var:
                        StartMarkTokens(ClassSectionEvent);
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
            int index = StartMarkTokens(IdDeclarationEvent);
            Match(DelphiTokens.Id);
            EndMarkTokens(IdDeclarationEvent, index);
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
            int index = StartMarkTokens(IdDeclarationEvent);
            Match(DelphiTokens.Id);
            EndMarkTokens(IdDeclarationEvent, index);
            bool array = MatchTokens(DelphiTokens.LSBr);
            OptionalIndexInterval();
            Match(DelphiTokens.Id);
            OptionalDispid();
            Match(DelphiTokens.Semicolon);
            if (array) OptionalDispDefault();
        }

        /// <summary>
        /// Секция Dispatch-интерфейса
        /// </summary>
        private void DispinterfaceSection()
        {
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
                        return;
                }
            }
        }

        /// <summary>
        /// Определение Dispatch-интерфейса
        /// </summary>
        private void DispinterfaceDefinition()
        {
            Match(DelphiTokens.Dispinterface);
            Guid();
            DispinterfaceSection();
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
                    int index = StartMarkTokens(IdDeclarationEvent);
                    Match(DelphiTokens.Id);
                    EndMarkTokens(IdDeclarationEvent, index);
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
                    int index = StartMarkTokens(IdDeclarationEvent);
                    Match(DelphiTokens.Id);
                    EndMarkTokens(IdDeclarationEvent, index);
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
                    case DelphiTokens.Constructor:
                    case DelphiTokens.Destructor:
                    case DelphiTokens.Procedure:
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
            while (MatchTokens(DelphiTokens.Exports))
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
                int index = StartMarkTokens(IdDeclarationEvent);
                IdList();
                EndMarkTokens(IdDeclarationEvent, index);
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
                    if (FileParsedEvent != null)
                    {
                        AnalyserParameters p = new AnalyserParameters(file);
                        p.AddToken(new TokenInfo(DelphiTokens.FileEnd, "", lanalyser.Line, new Dictionary<string, string>(lanalyser.MetaTags)));
                        FileParsedEvent(this, p);
                    }
                    return true;
                }
                catch (DelphiAnalyser.Addition.ParsingError e)
                {
                    if (ErrorOccuredEvent != null)
                        ErrorOccuredEvent(this, new DelphiAnalyser.Addition.ErrorParam(e));
                    return false;
                }
            }
            else return false;
        }

        /// <summary>
        /// Трансляция
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
