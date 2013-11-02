using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;

namespace DelphiAnalyser.Analysers.StaticAnalysers
{
    /// <summary>
    /// Количество параметров функции
    /// </summary>
    [StaticAnalyserDefaultSettings("Количество параметров функции.", "Функция со слишком большим количеством параметров!", 40)]
    class FuncParamCountAnalyser : BaseStaticAnalyser
    {
        /// <summary>
        /// Максимально допустимое количество параметров функции
        /// </summary>
        [Category("Особые")]
        [DisplayName("Количество параметров")]
        [Description("Максимально допустимое количество параметров функции.")]
        public int MaxParamCount { get { return (settings as AnalyserSettings.FuncParamCountSettings).MaxParamCount; } set { (settings as AnalyserSettings.FuncParamCountSettings).MaxParamCount = value; Change(); } }

        /// <summary>
        /// Загрузка анализатора
        /// </summary>
        /// <returns>результат загрузки</returns>
        protected override bool LoadSelf()
        {
            bool load = (DelphiAnalyser.Properties.Settings.Default.FuncParamCount != null);
            settings = (load) ? DelphiAnalyser.Properties.Settings.Default.FuncParamCount : new DelphiAnalyser.Analysers.StaticAnalysers.AnalyserSettings.FuncParamCountSettings();
            return load;
        }

        /// <summary>
        /// Сохранение анализатора
        /// </summary>
        protected override void SaveSelf()
        {
            DelphiAnalyser.Properties.Settings.Default.FuncParamCount = settings as DelphiAnalyser.Analysers.StaticAnalysers.AnalyserSettings.FuncParamCountSettings;
        }

        /// <summary>
        /// Инициализация
        /// </summary>
        protected override void Init()
        {
            (settings as DelphiAnalyser.Analysers.StaticAnalysers.AnalyserSettings.FuncParamCountSettings).MaxParamCount = 8;
        }

        /// <summary>
        /// Подписка на события
        /// </summary>
        /// <param name="lanalyser">лексический анализатор</param>
        /// <param name="sanalyser">синтаксический анализатор</param>
        protected override void InitEvents(LexicalAnalyser lanalyser, SyntaxisAnalyser sanalyser)
        {
            sanalyser.FunctionIdDeclarationEvent += new EventHandler<AnalyserParameters>(Analyse);
        }

        /// <summary>
        /// Собственно анализ
        /// </summary>
        /// <param name="sender">инициатор события</param>
        /// <param name="e">набор токенов</param>
        protected override void DoAnalyse(AnalyserParameters e)
        {
            int i = 0, c = 0;
            while (i < e.Length)
            {
                while (e[i].Token != DelphiTokens.Colon)
                {
                    if (e[i++].Token == DelphiTokens.Id) c++;
                }
                i++;
                while ((i < e.Length) && (e[i].Token != DelphiTokens.Semicolon)) i++;
            }
            if (c > (settings as AnalyserSettings.FuncParamCountSettings).MaxParamCount) AddError(e, 0);
        }
    }
}
