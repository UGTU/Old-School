using System;
using System.Collections.Generic;
using System.Text;

namespace DelphiAnalyser.Addition
{
    /// <summary>
    /// Карта файла
    /// </summary>
    public class FileMap
    {
        /// <summary>
        /// Карта файла
        /// </summary>
        private Dictionary<int, int> filemap;

        /// <summary>
        /// Последняя строка
        /// </summary>
        private int last;

        /// <summary>
        /// Добавить строку
        /// </summary>
        /// <param name="index">начало строки</param>
        /// <returns>номер добавленной строки</returns>
        public int AddLine(int index)
        {
            if ((last == 0) || (index > filemap[last]))
                filemap.Add(++last, index);
            return last;
        }

        /// <summary>
        /// Сбросить состояние карты
        /// </summary>
        public void Reset()
        {
            if (filemap == null)
                filemap = new Dictionary<int, int>();
            else filemap.Clear();
            last = 0;
            AddLine(0);
        }

        /// <summary>
        /// Конструктор
        /// </summary>
        public FileMap()
        {
            Reset();
        }

        /// <summary>
        /// Поиск строки, в которую входит символ
        /// </summary>
        /// <param name="start">левая граница поиска</param>
        /// <param name="end">правая граница поиска</param>
        /// <param name="index">предмет поиска</param>
        /// <returns>номер строки</returns>
        private int FindKey(int start, int end, int index)
        {
            if (start == end)
                return start;
            else
            {
                int count = end - start + 1, center = start + count / 2;
                if (filemap[center] < index)
                    return FindKey(center, end, index);
                else if (count == 2) return start;
                else return FindKey(start, center, index);
            }
        }

        /// <summary>
        /// Номер строки
        /// </summary>
        /// <param name="index">номер символа</param>
        /// <returns>номер строки, содержащей символ</returns>
        public int Line(int index)
        {
            if (filemap[last] <= index) return last;
            return FindKey(1, last, index);
        }
    }
}
