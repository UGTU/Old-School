using System;
using System.Collections.Generic;
using System.Text;

namespace DelphiAnalyser.Analysers.StaticAnalysers
{
    /// <summary>
    /// Пустое тело блока кода (begin end / try except / etc)
    /// </summary>
    [StaticAnalyserDefaultSettings("Пустой блок кода.", "Пустой блок кода!", 40)]
    public class EmptyBodyAnalyser: BaseStaticAnalyser
    {
        /// <summary>
        /// Загрузка анализатора
        /// </summary>
        /// <returns>результат загрузки</returns>
        protected override bool LoadSelf()
        {
            bool load = (DelphiAnalyser.Properties.Settings.Default.EmptyBody != null);
            settings = (load) ? DelphiAnalyser.Properties.Settings.Default.EmptyBody : new DelphiAnalyser.Analysers.StaticAnalysers.AnalyserSettings.BaseStaticSettings();
            return load;
        }

        /// <summary>
        /// Сохранение анализатора
        /// </summary>
        protected override void SaveSelf()
        {
            DelphiAnalyser.Properties.Settings.Default.EmptyBody = (settings as AnalyserSettings.BaseStaticSettings);
        }

        /// <summary>
        /// Подписка на события
        /// </summary>
        /// <param name="lanalyser">лексический анализатор</param>
        /// <param name="sanalyser">синтаксический анализатор</param>
        protected override void InitEvents(LexicalAnalyser lanalyser, SyntaxisAnalyser sanalyser)
        {
            sanalyser.BodyDefinedEvent += new EventHandler<AnalyserParameters>(Analyse);
        }

        /// <summary>
        /// Собственно анализ
        /// </summary>
        /// <param name="sender">инициатор события</param>
        /// <param name="e">список токенов</param>
        protected override void DoAnalyse(AnalyserParameters e)
        {
            if (e.Length == 1)
                AddError(e, 0);
        }
    }
}
