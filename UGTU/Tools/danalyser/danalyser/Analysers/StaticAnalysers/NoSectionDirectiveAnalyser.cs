using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;

namespace DelphiAnalyser.Analysers.StaticAnalysers
{
    /// <summary>
    /// Наличие публичных членов данных в классе
    /// </summary>
    [StaticAnalyserDefaultSettings("Нет модификатора доступа.", "Отсутствие модификаторов доступа в классе/записи!", 10)]
    public class NoSectionDirectiveAnalyser : BaseStaticAnalyser
    {
        /// <summary>
        /// Загрузка анализатора
        /// </summary>
        /// <returns>результат загрузки</returns>
        protected override bool LoadSelf()
        {
            bool load = (DelphiAnalyser.Properties.Settings.Default.NoSectionDirective != null);
            settings = (load) ? DelphiAnalyser.Properties.Settings.Default.NoSectionDirective : new DelphiAnalyser.Analysers.StaticAnalysers.AnalyserSettings.BaseStaticSettings();
            return load;
        }

        /// <summary>
        /// Сохранение анализатора
        /// </summary>
        protected override void SaveSelf()
        {
            DelphiAnalyser.Properties.Settings.Default.NoSectionDirective = (settings as AnalyserSettings.BaseStaticSettings);
        }

        /// <summary>
        /// Подписка на события
        /// </summary>
        /// <param name="lanalyser">лексический анализатор</param>
        /// <param name="sanalyser">синтаксический анализатор</param>
        protected override void InitEvents(LexicalAnalyser lanalyser, SyntaxisAnalyser sanalyser)
        {
            sanalyser.ClassSectionEvent += new EventHandler<AnalyserParameters>(Analyse);
        }

        /// <summary>
        /// Собственно анализ
        /// </summary>
        /// <param name="sender">инициатор события</param>
        /// <param name="e">список токенов</param>
        protected override void DoAnalyse(AnalyserParameters e)
        {
            e.First();
            if (e.Length > 0)
            {
                switch (e.Current.Token)
                {
                    case DelphiTokens.Automated:
                    case DelphiTokens.Published:
                    case DelphiTokens.Public:
                    case DelphiTokens.Protected:
                    case DelphiTokens.Private:
                        break;
                    default:
                        AddError(e, 0);
                        break;
                }
            }
        }
    }
}
