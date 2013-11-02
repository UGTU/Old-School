using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;

namespace DelphiAnalyser.Analysers.StaticAnalysers
{
    /// <summary>
    /// Наличие публичных членов данных в классе
    /// </summary>
    [StaticAnalyserDefaultSettings("Публичный член данных в классе.", "Наличие публичных членов данных в классе!", 50)]
    public class PublicMemberAnalyser : BaseStaticAnalyser
    {
        /// <summary>
        /// Загрузка анализатора
        /// </summary>
        /// <returns>результат загрузки</returns>
        protected override bool LoadSelf()
        {
            bool load = (DelphiAnalyser.Properties.Settings.Default.PublicMember != null);
            settings = (load) ? DelphiAnalyser.Properties.Settings.Default.PublicMember : new DelphiAnalyser.Analysers.StaticAnalysers.AnalyserSettings.BaseStaticSettings();
            return load;
        }

        /// <summary>
        /// Сохранение анализатора
        /// </summary>
        protected override void SaveSelf()
        {
            DelphiAnalyser.Properties.Settings.Default.PublicMember = (settings as AnalyserSettings.BaseStaticSettings);
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
            if ((e.Length > 1) && (e.MatchTokens(DelphiTokens.Var) || e.MatchTokens(DelphiTokens.Public)))
            {
                e.Next();
                switch (e.Current.Token)
                {
                    case DelphiTokens.Id:
                    case DelphiTokens.Name:
                    case DelphiTokens.Register:
                    case DelphiTokens.Message:
                    case DelphiTokens.Read:
                    case DelphiTokens.Write:
                    case DelphiTokens.Default:
                        AddError(e, 1);
                        break;
                }
            }
        }
    }
}
