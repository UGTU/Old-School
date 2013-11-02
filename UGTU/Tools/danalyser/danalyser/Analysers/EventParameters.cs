using System;
using System.Collections.Generic;
using System.Text;
using System.IO;

namespace DelphiAnalyser.Analysers
{
    /// <summary>
    /// Динамическая очередь параметров
    /// </summary>
    public class EventParameters
    {
        private List<AnalyserParameters> eventparams;
        private List<bool> free;
        private int busycount;

        /// <summary>
        /// Конструктор
        /// </summary>
        public EventParameters()
        {
            busycount = 0;
            eventparams = new List<AnalyserParameters>();
            free = new List<bool>();
        }

        /// <summary>
        /// Добавление очереди параметров
        /// </summary>
        /// <param name="file">файл</param>
        /// <returns>индекс добавленной очереди</returns>
        public int AddEventParams(FileInfo file)
        {
            int index = 0;
            if (eventparams.Count > 0)
                index = (free.Contains(true)) ? free.IndexOf(true) : eventparams.Count;
            if (eventparams.Count == index)
            {
                eventparams.Add(new AnalyserParameters(file));
                free.Add(false);
            }
            else
            {
                eventparams[index].Initialize(file);
                free[index] = false;
            }
            busycount++;
            return index;
        }

        /// <summary>
        /// Освобождение очереди
        /// </summary>
        /// <param name="index">индекс освобождаемой очереди</param>
        /// <returns>результат освобождения</returns>
        public bool ReleaseEventParams(int index)
        {
            if ((index >= 0) && (free.Count > index) && !free[index])
            {
                free[index] = true;
                eventparams[index].Clear();
                busycount--;
                return true;
            }
            return false;
        }

        /// <summary>
        /// Добавить токен во все очереди
        /// </summary>
        /// <param name="token">информация о токене</param>
        public void AddToken(TokenInfo token)
        {
            for (int i = 0; i < eventparams.Count; i++)
                if (!free[i]) eventparams[i].AddToken(token);
        }

        /// <summary>
        /// Добавить набор токенов во все очереди
        /// </summary>
        /// <param name="range">набор токенов</param>
        public void AddTokens(IEnumerable<TokenInfo> range)
        {
            for (int i = 0; i < eventparams.Count; i++)
                if (!free[i]) eventparams[i].AddTokens(range);
        }

        /// <summary>
        /// Количество очередей
        /// </summary>
        public int BusyCount { get { return busycount; } }
        public int AllCount { get { return free.Count; } }

        /// <summary>
        /// Очередь
        /// </summary>
        /// <param name="index">номер очереди</param>
        /// <returns>очередь</returns>
        public AnalyserParameters this[int index]
        {
            get
            {
                if ((index >= 0) && (index < eventparams.Count))
                    return eventparams[index];
                else return null;
            }
        }
    }
}
