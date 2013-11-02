using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;
using System.ComponentModel;

namespace DelphiAnalyser.Analysers.StaticAnalysers
{
    /// <summary>
    /// Длина идентификатора
    /// </summary>
    [StaticAnalyserDefaultSettings("Длина идентификатора.", "Неправильный идентификатор (некорректная длина)!", 10)]
    public class IdLengthAnalyser : BaseStaticAnalyser
    {
        private string temp;

        /// <summary>
        /// Набор допустимых длин
        /// </summary>
        [Category("Особые")]
        [DisplayName("Длина")]
        [Description("Все допустимые длины для идентификатора.")]
        public List<AnalyserSettings.LengthConfig> Lengths { get { return (settings as AnalyserSettings.IdLengthSettings).Lengths; } set { (settings as AnalyserSettings.IdLengthSettings).Lengths = value; Change(); } }

        [Category("Особые")]
        [DisplayName("Стандартные")]
        [Description("Стандартные идентификаторы, которые не будут обнаружены при анализе")]
        public List<AnalyserSettings.GoodId> StdIdes { get { return (settings as AnalyserSettings.IdLengthSettings).StdIdes; } set { (settings as AnalyserSettings.IdLengthSettings).StdIdes = value; } }

        // Регулярное выражение
        private string regex;

        /// <summary>
        /// Изменение свойств
        /// </summary>
        protected override void CheckChanges()
        {
            if ((settings as AnalyserSettings.IdLengthSettings).Lengths.Count < 1) settings.Enabled = false;
            MakeRegexes();
        }

        /// <summary>
        /// Загрузка анализатора
        /// </summary>
        /// <returns>результат загрузки</returns>
        protected override bool LoadSelf()
        {
            bool load = (DelphiAnalyser.Properties.Settings.Default.IdLength != null);
            settings = (load) ? DelphiAnalyser.Properties.Settings.Default.IdLength : new DelphiAnalyser.Analysers.StaticAnalysers.AnalyserSettings.IdLengthSettings();
            return load;
        }

        /// <summary>
        /// Сохранение анализатора
        /// </summary>
        protected override void SaveSelf()
        {
            DelphiAnalyser.Properties.Settings.Default.IdLength = settings as AnalyserSettings.IdLengthSettings;
        }

        /// <summary>
        /// Инициализация
        /// </summary>
        protected override void Init()
        {
            (settings as AnalyserSettings.IdLengthSettings).Lengths.Add(new AnalyserSettings.LengthConfig(1, 1));
            (settings as AnalyserSettings.IdLengthSettings).Lengths.Add(new AnalyserSettings.LengthConfig(4, 0));
            MakeRegexes();
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
        /// Создание регулярное выражение по интервалу
        /// </summary>
        /// <param name="cfg">интервал</param>
        /// <returns>регулярное выражение</returns>
        private string MakeRegex(AnalyserSettings.LengthConfig cfg)
        {
            return (cfg.From != cfg.To) ? string.Format(".{{{0},{1}}}", cfg.From, ((cfg.To == 0) ? "" : cfg.To.ToString())) : string.Format(".{{{0}}}", cfg.From);
        }

        /// <summary>
        /// Создание регулярного выражения
        /// </summary>
        private void MakeRegexes()
        {
            int l = (settings as AnalyserSettings.IdLengthSettings).Lengths.Count;
            regex = (l > 0) ? MakeRegex((settings as AnalyserSettings.IdLengthSettings).Lengths[0]) : string.Empty;
            if (l > 0)
            {
                for (int i = 1; i < l; i++)
                    regex = string.Format("{0}|{1}", regex, MakeRegex((settings as AnalyserSettings.IdLengthSettings).Lengths[i]));
                regex = string.Format("^({0})$", regex);
            }
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
        /// <param name="e">набор токенов</param>
        protected override void DoAnalyse(AnalyserParameters e)
        {
            for (int i = 0; i < e.Length; i++)
                if ((e[i].Token == DelphiTokens.Id) && !(settings as AnalyserSettings.IdLengthSettings).StdIdes.Contains(new AnalyserSettings.GoodId(e[i].Text)) && !Regex.IsMatch(e[i].Text, regex))
                {
                    temp = e[i].Text;
                    AddError(e, i);
                }
        }
    }
}
