using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;

namespace DelphiAnalyser.Analysers.StaticAnalysers
{
    /// <summary>
    /// Содержание цифр в идентификаторе
    /// </summary>
    [StaticAnalyserDefaultSettings("Цифры в идентификаторе.", "Неправильный идентификатор (содержит цифры)!", 10)]
    public class NoDigitInIdAnalyser : BaseStaticAnalyser
    {
        private string temp;
        Regex digits = new Regex("\\d");

        /// <summary>
        /// Загрузка анализатора
        /// </summary>
        /// <returns>результат загрузки</returns>
        protected override bool LoadSelf()
        {
            bool load = (DelphiAnalyser.Properties.Settings.Default.DigitsInId != null);
            settings = (load) ? DelphiAnalyser.Properties.Settings.Default.DigitsInId : new DelphiAnalyser.Analysers.StaticAnalysers.AnalyserSettings.BaseStaticSettings();
            return load;
        }

        /// <summary>
        /// Сохранение анализатора
        /// </summary>
        protected override void SaveSelf()
        {
            DelphiAnalyser.Properties.Settings.Default.DigitsInId = (settings as AnalyserSettings.BaseStaticSettings);
        }

        /// <summary>
        /// Создание ошибки
        /// </summary>
        /// <param name="message">сообщение об ошибке</param>
        /// <param name="level">уровень важности ошибки</param>
        /// <param name="file">файл с ошибкой</param>
        /// <param name="line">номер строки с ошибкой</param>
        /// <returns>созданная ошибка</returns>
        protected override DelphiAnalyser.Addition.ParsingError RawError(string message, int level, System.IO.FileInfo file, int line, Dictionary<string, string> metatags)
        {
            return new DelphiAnalyser.Addition.ParsingErrors.IdNameError(message, level, file, line, metatags, temp);
        }

        /// <summary>
        /// Подписка на события
        /// </summary>
        /// <param name="lanalyser">лексический анализатор</param>
        /// <param name="sanalyser">синтаксический анализатор</param>
        protected override void InitEvents(LexicalAnalyser lanalyser, SyntaxisAnalyser sanalyser)
        {
            sanalyser.IdDeclarationEvent += new EventHandler<AnalyserParameters>(Analyse);
        }

        /// <summary>
        /// Собственно анализ
        /// </summary>
        /// <param name="sender">инициатор события</param>
        /// <param name="e">список токенов</param>
        protected override void DoAnalyse(AnalyserParameters e)
        {
            for (int i = 0; i < e.Length; i++)
                if ((e[i].Token == DelphiTokens.Id) && digits.IsMatch(e[i].Text))
                {
                    temp = e[i].Text;
                    AddError(e, i);
                }
        }
    }
}
