using System;
using System.Collections.Generic;
using System.Text;

namespace DelphiAnalyser.Analysers.StaticAnalysers
{
    /// <summary>
    /// Константные выражения
    /// </summary>
    [StaticAnalyserDefaultSettings("Константное выражение.", "Значение выражения всегда константа!", 50)]
    public class ConstantExpressionAnalyser : ExpressionAnalyser
    {
        /// <summary>
        /// Загрузка анализатора
        /// </summary>
        /// <returns>результат загрузки</returns>
        protected override bool LoadSelf()
        {
            bool load = (DelphiAnalyser.Properties.Settings.Default.ConstantExpression != null);
            settings = (load) ? DelphiAnalyser.Properties.Settings.Default.ConstantExpression : new DelphiAnalyser.Analysers.StaticAnalysers.AnalyserSettings.BaseStaticSettings();
            return load;
        }

        /// <summary>
        /// Сохранение анализатора
        /// </summary>
        protected override void SaveSelf()
        {
            DelphiAnalyser.Properties.Settings.Default.ConstantExpression = (settings as AnalyserSettings.BaseStaticSettings);
        }

        /// <summary>
        /// Подписка на события
        /// </summary>
        /// <param name="lanalyser">лексический анализатор</param>
        /// <param name="sanalyser">синтаксический анализатор</param>
        protected override void InitEvents(LexicalAnalyser lanalyser, SyntaxisAnalyser sanalyser)
        {
            sanalyser.ExpressionEvent += new EventHandler<AnalyserParameters>(Analyse);
        }

        /// <summary>
        /// Собственно анализ
        /// </summary>
        /// <param name="sender">инициатор события</param>
        /// <param name="e">список токенов</param>
        protected override void DoAnalyse(AnalyserParameters e)
        {
            e.First();
            this.e = e;
            if (Expression().ConstantExpression)
                AddError(e, 0);
        }
    }
}
