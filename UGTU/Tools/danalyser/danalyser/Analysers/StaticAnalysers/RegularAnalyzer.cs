using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;
using System.Text.RegularExpressions;

namespace DelphiAnalyser.Analysers.StaticAnalysers
{
    /// <summary>
    /// Регулярный анализатор
    /// </summary>
    [AnalyserDefaultSettings("Регулярный анализатор.")]
    public class RegularAnalyzer: BaseAnalyser
    {
        // регулярное выражение
        private string fullregex;

        /// <summary>
        /// Набор регулярных выражений
        /// </summary>
        [Category("Особые")]
        [DisplayName("Шаблоны")]
        [Description("Регулярные выражения, которые будет использовать анализатор.")]
        public List<AnalyserSettings.RegularExpression> Regexes { get { return (settings as AnalyserSettings.RegularSettings).Regexes; } set { (settings as AnalyserSettings.RegularSettings).Regexes = value; Change(); } }

        /// <summary>
        /// Изменение свойств
        /// </summary>
        protected override void CheckChanges()
        {
            if ((settings as AnalyserSettings.RegularSettings).Regexes.Count < 1) settings.Enabled = false;
            MakeRegex();
        }

        /// <summary>
        /// Загрузка анализатора
        /// </summary>
        /// <returns>результат загрузки</returns>
        protected override bool LoadSelf()
        {
            bool load = (DelphiAnalyser.Properties.Settings.Default.Regulars != null);
            settings = (load) ? DelphiAnalyser.Properties.Settings.Default.Regulars : new DelphiAnalyser.Analysers.StaticAnalysers.AnalyserSettings.RegularSettings();
            return load;
        }

        /// <summary>
        /// Сохранение анализатора
        /// </summary>
        protected override void SaveSelf()
        {
            DelphiAnalyser.Properties.Settings.Default.Regulars = (settings as AnalyserSettings.RegularSettings);
        }

        /// <summary>
        /// Создание регулярного выражения
        /// </summary>
        private void MakeRegex()
        {
            fullregex = string.Empty;
            if ((settings as AnalyserSettings.RegularSettings).Regexes.Count > 0)
            {
                int i = 0;
                foreach (AnalyserSettings.RegularExpression regex in (settings as AnalyserSettings.RegularSettings).Regexes)
                    fullregex = string.Format("{0}|(?<re{1}>{2})", fullregex, i++, regex.RegEx);
                fullregex = fullregex.Substring(1);
            }
        }

        /// <summary>
        /// Подписка на события
        /// </summary>
        /// <param name="lanalyser">лексический анализатор</param>
        /// <param name="sanalyser">синтаксический анализатор</param>
        protected override void InitEvents(LexicalAnalyser lanalyser, SyntaxisAnalyser sanalyser)
        {
            sanalyser.FileParsedEvent += new EventHandler<AnalyserParameters>(Analyse);
        }

        /// <summary>
        /// Собственно анализ
        /// </summary>
        /// <param name="sender">инициатор события</param>
        /// <param name="e">список токенов</param>
        protected override void DoAnalyse(AnalyserParameters e)
        {
            MatchCollection matches = Regex.Matches(sanalyser.Source, fullregex);
            foreach (Match match in matches)
            {
                for (int i = 0; i < (settings as AnalyserSettings.RegularSettings).Regexes.Count; i++)
                {
                    if ((settings as AnalyserSettings.RegularSettings).Regexes[i].IsCorrect && (match.Groups[string.Format("re{0}", i)].Captures.Count == 0))
                        AddError((settings as AnalyserSettings.RegularSettings).Regexes[i].Name, (settings as AnalyserSettings.RegularSettings).Regexes[i].Level, e.File, 0, e[0].MetaTags);
                    else if (!(settings as AnalyserSettings.RegularSettings).Regexes[i].IsCorrect)
                    {
                        foreach (Capture capture in match.Groups[string.Format("re{0}", i)].Captures)
                            AddError((settings as AnalyserSettings.RegularSettings).Regexes[i].Name, (settings as AnalyserSettings.RegularSettings).Regexes[i].Level, e.File, lanalyser.FileMap.Line(capture.Index), e[0].MetaTags);
                    }
                }
            }
            if (matches.Count == 0)
            {
                foreach (AnalyserSettings.RegularExpression regex in (settings as AnalyserSettings.RegularSettings).Regexes)
                {
                    if (regex.IsCorrect)
                        AddError(regex.Name, regex.Level, e.File, 0, e[0].MetaTags);
                }
            }
        }
    }
}
