using System;
using System.Collections.Generic;
using System.Text;

namespace DelphiAnalyser.Addition
{
    /// <summary>
    /// Расширенный Char
    /// </summary>
    class DChar
    {
        // 16-тиричные цифры
        public static List<char> hexchars;

        /// <summary>
        /// Является ли цифрой
        /// </summary>
        public static bool IsDigit(char c)
        {
            return Char.IsDigit(c);
        }

        /// <summary>
        /// Является ли буквой
        /// </summary>
        public static bool IsLetter(char c)
        {
            return Char.IsLetter(c);
        }
        
        /// <summary>
        /// Является ли цифрой или буквой
        /// </summary>
        public static bool IsLetterOrDigit(char c)
        {
            // сократим код
            return Char.IsLetter(c) || Char.IsDigit(c);
        }

        /// <summary>
        /// Является ли 16-тиричной цифрой
        /// </summary>
        /// <param name="c"></param>
        /// <returns></returns>
        public static bool IsHexSymbol(char c)
        {
            if (hexchars == null)
            {
                string hexs = "abcdefABCDEF";
                hexchars = new List<char>();
                foreach (char hex in hexs)
                    hexchars.Add(hex);
            }
            return Char.IsDigit(c) || hexchars.Contains(c);
        }
    }
}
