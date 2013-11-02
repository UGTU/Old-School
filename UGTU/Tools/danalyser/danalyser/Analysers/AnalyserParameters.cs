using System;
using System.Collections.Generic;
using System.Text;
using System.IO;

namespace DelphiAnalyser.Analysers
{
    /// <summary>
    /// Параметры анализаторов
    /// </summary>
    public class AnalyserParameters: EventArgs
    {
        private List<TokenInfo> tokens;
        private FileInfo file;
        private int current;
        private TokenInfo endfile;

        /// <summary>
        /// Инициализация
        /// </summary>
        /// <param name="file">файл</param>
        public void Initialize(FileInfo file)
        {
            current = 0;
            this.file = file;
            if (tokens == null)
                tokens = new List<TokenInfo>();
            tokens.Clear();
        }

        public AnalyserParameters(FileInfo file)
        {
            Initialize(file);
        }

        /// <summary>
        /// Добавление токена в список
        /// </summary>
        /// <param name="token">информация о токене</param>
        public void AddToken(TokenInfo token)
        {
            tokens.Add(token);
        }

        /// <summary>
        /// Добавление набора токенов в список
        /// </summary>
        /// <param name="tokens">наборт токенов</param>
        public void AddTokens(IEnumerable<TokenInfo> tokens)
        {
            this.tokens.AddRange(tokens);
        }

        /// <summary>
        /// Очистка списка токенов
        /// </summary>
        public void Clear()
        {
            tokens.Clear();
        }

        /// <summary>
        /// Количество токенов в списке
        /// </summary>
        public int Length { get { return tokens.Count; } }

        /// <summary>
        /// Текущий номер токена
        /// </summary>
        public int CurrentIndex { get { return current; } }

        /// <summary>
        /// Текущий токен
        /// </summary>
        public TokenInfo Current { get { return (tokens.Count > 0) ? ((tokens.Count == current) ? new TokenInfo(DelphiTokens.FileEnd, "", tokens[tokens.Count - 1].Line, tokens[tokens.Count - 1].MetaTags) : tokens[current]) : null; } set { tokens[current] = value; } }

        /// <summary>
        /// Сравнивнение токенов
        /// </summary>
        /// <returns>результат сравнения</returns>
        public bool MatchTokens(DelphiTokens t1, DelphiTokens t2)
        {
            return (t1 == t2);
        }

        /// <summary>
        /// Сравнение токена с текущим
        /// </summary>
        /// <returns>результат сравнения</returns>
        public bool MatchTokens(DelphiTokens t)
        {
            return MatchTokens(Current.Token, t);
        }

        /// <summary>
        /// Переход к следующему
        /// </summary>
        public bool Next()
        {
            if (current >= tokens.Count) return false;
            current++;
            return true;
        }

        /// <summary>
        /// Считывание токена с заглядыванием назад
        /// </summary>
        /// <param name="token">токен, который должен был быть</param>
        /// <returns>результат считывания</returns>
        public bool Match(DelphiTokens token)
        {
            if (Current.Token == token) return Next();
            else return false;
        }

        /// <summary>
        /// Следующий токен
        /// </summary>
        public DelphiTokens MatchAhead()
        {
            if (current >= tokens.Count) return DelphiTokens.Undefined;
            return tokens[++current].Token;
        }

        /// <summary>
        /// Переход к предыдущему
        /// </summary>
        public bool Prev()
        {
            if (current == 0) return false;
            current--;
            return true;
        }

        /// <summary>
        /// Переход к первому
        /// </summary>
        public void First()
        {
            current = 0;
        }

        /// <summary>
        /// Переход к последнему
        /// </summary>
        public void Last()
        {
            current = tokens.Count - 1;
        }

        /// <summary>
        /// Информация о токене
        /// </summary>
        /// <param name="index">позиция токена в списке</param>
        public TokenInfo this[int index] { get { return tokens[index]; } }

        /// <summary>
        /// Файл
        /// </summary>
        public FileInfo File { get { return file; } }
    }
}
