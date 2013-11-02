using System;
using System.Collections.Generic;
using System.Text;
using System.IO;

namespace DelphiAnalyser.Analysers.DfmAnalysers
{
    /// <summary>
    /// Синтаксический анализатор
    /// </summary>
    public class SyntaxisAnalyser
    {
        /// <summary>
        /// Лексический анализатор
        /// </summary>
        private LexicalAnalyser lanalyser;

        /// <summary>
        /// Состояние
        /// </summary>
        private States state;
        private FileInfo file;
        private string currentId;
        private DfmTokens token;
        private Dictionary<string, string> metatags;

        // Ошибка трансляции
        private enum SyntaxTranslationError { UnexpectedToken }
        private Dictionary<SyntaxTranslationError, string> syntaxerrors;

        /// <summary>
        /// Объекты
        /// </summary>
        private List<string> rootObjects;

        /// <summary>
        /// Событие - обнаружена ошибка
        /// </summary>
        public event EventHandler<DelphiAnalyser.Addition.ErrorParam> ErrorOccuredEvent;

        /// <summary>
        /// Инициализация ошибок
        /// </summary>
        private void InitErrors()
        {
            if (syntaxerrors == null)
            {
                syntaxerrors = new Dictionary<SyntaxTranslationError, string>();
                syntaxerrors.Add(SyntaxTranslationError.UnexpectedToken, "Неожиданная последовательность языка!");
            }
        }

        /// <summary>
        /// Инициализация
        /// </summary>
        private void Initialize()
        {
            InitErrors();
            rootObjects = new List<string>();
            token = DfmTokens.Undefined;
        }

        /// <summary>
        /// Инициализация
        /// </summary>
        /// <param name="file">файл</param>
        /// <param name="source">исходный код</param>
        public void Initialize(FileInfo file, string source)
        {
            lanalyser.Initialize(file, source);
            Initialize();
            this.file = file;
            state = States.Initialized;
        }

        /// <summary>
        /// Конструктор
        /// </summary>
        /// <param name="lanalyser">лексический анализатор</param>
        public SyntaxisAnalyser(Dictionary<string, string> metatags, LexicalAnalyser lanalyser)
        {
            this.metatags = metatags;
            this.lanalyser = lanalyser;
            state = States.Uninitialized;
        }

        /// <summary>
        /// Конструктор
        /// </summary>
        public SyntaxisAnalyser(Dictionary<string, string> metatags) : this(metatags, new LexicalAnalyser(metatags)) { }

        /// <summary>
        /// Ошибка анализа
        /// </summary>
        /// <param name="e">тип ошибки</param>
        private void Panic(SyntaxTranslationError e)
        {
            throw new DelphiAnalyser.Addition.ParsingError(syntaxerrors[e], 100, file, lanalyser.Line, metatags);
        }

        /// <summary>
        /// Считывание очередного токена
        /// </summary>
        private void ScanToken()
        {
            DfmTokenInfo t = lanalyser.Token;
            token = t.Token;
            currentId = t.Text;
        }

        /// <summary>
        /// Считывание очередного токена с заглядыванием назад
        /// </summary>
        /// <param name="t">предыдущий токен</param>
        private void Match(DfmTokens t)
        {
            if (t == token) ScanToken();
            else Panic(SyntaxTranslationError.UnexpectedToken);
        }

        /// <summary>
        /// "Длинный" идентификатор
        /// </summary>
        private void LongId()
        {
            Match(DfmTokens.Id);
            while (token == DfmTokens.Dot)
            {
                Match(DfmTokens.Dot);
                Match(DfmTokens.Id);
            }
        }

        /// <summary>
        /// Возможная строка
        /// </summary>
        private void OptionalString()
        {
            while (true)
            {
                switch (token)
                {
                    case DfmTokens.String:
                    case DfmTokens.Char:
                        Match(token);
                        break;
                    default:
                        return;
                }
            }
        }

        /// <summary>
        /// Строка
        /// </summary>
        private void String()
        {
            switch (token)
            {
                case DfmTokens.String:
                case DfmTokens.Char:
                    OptionalString();
                    break;
                default:
                    Panic(SyntaxTranslationError.UnexpectedToken);
                    break;
            }
        }

        /// <summary>
        /// Строки
        /// </summary>
        private void Strings()
        {
            String();
            while (token == DfmTokens.Addition)
            {
                Match(DfmTokens.Addition);
                String();
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
                    case DfmTokens.Addition:
                    case DfmTokens.Subtruction:
                        Match(token);
                        break;
                    case DfmTokens.HexConstant:
                        Match(DfmTokens.HexConstant);
                        return;
                    default:
                        Match(DfmTokens.Digits);
                        if (token == DfmTokens.Dot)
                        {
                            Match(DfmTokens.Dot);
                            if (token == DfmTokens.Digits)
                                Match(DfmTokens.Digits);
                        }
                        return;
                }
            }
        }

        /// <summary>
        /// Возможен набор идентификаторов
        /// </summary>
        private void OptionalIdList()
        {
            if (token == DfmTokens.Id)
            {
                Match(DfmTokens.Id);
                while (token == DfmTokens.Comma)
                {
                    Match(DfmTokens.Comma);
                    Match(DfmTokens.Id);
                }
            }
        }

        /// <summary>
        /// Возможен набор элементов
        /// </summary>
        private void OptionalElements()
        {
            while (true)
            {
                switch (token)
                {
                    case DfmTokens.Id:
                    case DfmTokens.LBr:
                    case DfmTokens.LSBr:
                    case DfmTokens.LTBr:
                    case DfmTokens.LFBr:
                    case DfmTokens.String:
                    case DfmTokens.Char:
                    case DfmTokens.Addition:
                    case DfmTokens.Subtruction:
                    case DfmTokens.Digits:
                        Value();
                        break;
                    default:
                        return;
                }
            }
        }

        /// <summary>
        /// Значение свойства
        /// </summary>
        private void Value()
        {
            switch (token)
            {
                case DfmTokens.Id:
                    LongId();
                    break;
                case DfmTokens.LBr:
                    Match(DfmTokens.LBr);
                    OptionalElements();
                    Match(DfmTokens.RBr);
                    break;
                case DfmTokens.LSBr:
                    Match(DfmTokens.LSBr);
                    OptionalIdList();
                    Match(DfmTokens.RSBr);
                    break;
                case DfmTokens.LTBr:
                    Match(DfmTokens.LTBr);
                    OptionalItems();
                    Match(DfmTokens.RTBr);
                    break;
                case DfmTokens.LFBr:
                    Match(DfmTokens.LFBr);
                    while ((token == DfmTokens.Digits) || (token == DfmTokens.Id))
                        Match(token);
                    Match(DfmTokens.RFBr);
                    break;
                case DfmTokens.Char:
                case DfmTokens.String:
                    Strings();
                    break;
                default:
                    SignedReal();
                    break;
            }
        }

        /// <summary>
        /// Присвоение свойству значения
        /// </summary>
        private void Assigment()
        {
            LongId();
            Match(DfmTokens.Assigment);
            Value();
        }

        /// <summary>
        /// Элемент
        /// </summary>
        private void Item()
        {
            Match(DfmTokens.Item);
            OptionalFields();
            Match(DfmTokens.End);
        }

        /// <summary>
        /// Возможные элементы
        /// </summary>
        private void OptionalItems()
        {
            while (token == DfmTokens.Item)
                Item();
        }

        /// <summary>
        /// Возможные поля
        /// </summary>
        private void OptionalFields()
        {
            while (true)
            {
                switch (token)
                {
                    case DfmTokens.Object:
                    case DfmTokens.Inherited:
                    case DfmTokens.Inline:
                        Dfm(false);
                        break;
                    case DfmTokens.Id:
                        Assigment();
                        break;
                    default:
                        return;
                }
            }
        }

        /// <summary>
        /// Возможный индексатор
        /// </summary>
        private void OptionalIndexer()
        {
            if (token == DfmTokens.LSBr)
            {
                Match(DfmTokens.LSBr);
                Match(DfmTokens.Digits);
                Match(DfmTokens.RSBr);
            }
        }

        /// <summary>
        /// Dfm файл
        /// </summary>
        private void Dfm(bool root)
        {
            switch (token)
            {
                case DfmTokens.Object:
                case DfmTokens.Inherited:
                case DfmTokens.Inline:
                    Match(token);
                    rootObjects.Add(currentId);
                    break;
                default:
                    Panic(SyntaxTranslationError.UnexpectedToken);
                    break;
            }
            Match(DfmTokens.Id);
            if (token == DfmTokens.Colon)
            {
                Match(DfmTokens.Colon);
                rootObjects.Add(currentId);
                Match(DfmTokens.Id);
                OptionalIndexer();
                OptionalFields();
            }
            Match(DfmTokens.End);
        }

        /// <summary>
        /// Трансляция
        /// </summary>
        /// <returns></returns>
        public IEnumerable<string> Translate()
        {
            if (state == States.Initialized)
            {
                rootObjects.Clear();
                try
                {
                    Match(DfmTokens.Undefined);
                    Dfm(true);
                }
                catch (DelphiAnalyser.Addition.ParsingError e)
                {
                    if (ErrorOccuredEvent != null)
                        ErrorOccuredEvent(this, new DelphiAnalyser.Addition.ErrorParam(e));
                    return null;
                }
                return rootObjects;
            }
            else return null;
        }

        /// <summary>
        /// Трансляция
        /// </summary>
        /// <param name="file">файл</param>
        /// <param name="source">исходный код</param>
        /// <returns></returns>
        public IEnumerable<string> Translate(FileInfo file, string source)
        {
            Initialize(file, source);
            return Translate();
        }
    }
}
