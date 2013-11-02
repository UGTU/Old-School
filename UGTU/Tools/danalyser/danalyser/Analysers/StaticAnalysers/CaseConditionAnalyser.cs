using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;

namespace DelphiAnalyser.Analysers.StaticAnalysers
{
    /// <summary>
    /// Константные выражения
    /// </summary>
    [StaticAnalyserDefaultSettings("Magic Numbers в операторе case.", "Использование Magic Numbers вместо констант в операторе case!", 50)]
    public class CaseConditionAnalyser : ExpressionAnalyser
    {
        [Category("Особые")]
        [DisplayName("Стандартные Magic Numbers")]
        [Description("Числа, которые не будут считаться Magic Numbers (0, 1, 100...).")]
        public List<double> StdNumbers { get { return (settings as AnalyserSettings.CaseConditionSettings).StdNumbers; } set { (settings as AnalyserSettings.CaseConditionSettings).StdNumbers = value; Change(); } }

        [Category("Особые")]
        [DisplayName("Обнаруживать")]
        [Description("Будет ли анализатор обнаруживать стандартные Magic Numbers.")]
        public bool LocateStd { get { return (settings as AnalyserSettings.CaseConditionSettings).LocateStd; } set { (settings as AnalyserSettings.CaseConditionSettings).LocateStd = value; Change(); } }

        [Category("Особые")]
        [DisplayName("Важность")]
        [Description("Уровень важности стандартных Magic Numbers.")]
        public int StdLevel { get { return (settings as AnalyserSettings.CaseConditionSettings).StdLevel; } set { (settings as AnalyserSettings.CaseConditionSettings).StdLevel = value; Change();  } }

        /// <summary>
        /// Изменение свойств
        /// </summary>
        protected override void CheckChanges() 
        {
            if ((settings as AnalyserSettings.CaseConditionSettings).StdNumbers.Count == 0)
                (settings as AnalyserSettings.CaseConditionSettings).LocateStd = false;
        }

        /// <summary>
        /// Загрузка анализатора
        /// </summary>
        /// <returns>результат загрузки</returns>
        protected override bool LoadSelf()
        {
            bool load = (DelphiAnalyser.Properties.Settings.Default.CaseCondition != null);
            settings = (load) ? DelphiAnalyser.Properties.Settings.Default.CaseCondition : new DelphiAnalyser.Analysers.StaticAnalysers.AnalyserSettings.CaseConditionSettings();
            return load;
        }

        /// <summary>
        /// Сохранение анализатора
        /// </summary>
        protected override void SaveSelf()
        {
            DelphiAnalyser.Properties.Settings.Default.CaseCondition = (settings as AnalyserSettings.CaseConditionSettings);
        }

        /// <summary>
        /// Инициализация
        /// </summary>
        protected override void Init()
        {
            (settings as AnalyserSettings.CaseConditionSettings).LocateStd = false;
            (settings as AnalyserSettings.CaseConditionSettings).Level = 10;
            (settings as AnalyserSettings.CaseConditionSettings).StdNumbers.Add(0);
            (settings as AnalyserSettings.CaseConditionSettings).StdNumbers.Add(1);
            (settings as AnalyserSettings.CaseConditionSettings).StdNumbers.Add(10);
            (settings as AnalyserSettings.CaseConditionSettings).StdNumbers.Add(100);
        }

        /// <summary>
        /// Подписка на события
        /// </summary>
        /// <param name="lanalyser">лексический анализатор</param>
        /// <param name="sanalyser">синтаксический анализатор</param>
        protected override void InitEvents(LexicalAnalyser lanalyser, SyntaxisAnalyser sanalyser)
        {
            sanalyser.CaseConditionEvent += new EventHandler<AnalyserParameters>(Analyse);
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
            ExprResult expr = Expression();
            if (expr.IsConstant && !expr.WasOperand)
            {
                if ((expr.Value.GetType() == typeof(Int32)) && !(settings as AnalyserSettings.CaseConditionSettings).StdNumbers.Contains(Convert.ToInt32(expr.Value)))
                    AddError(e, 0);
                else if ((settings as AnalyserSettings.CaseConditionSettings).LocateStd)
                    AddError((settings as AnalyserSettings.CaseConditionSettings).Message, (settings as AnalyserSettings.CaseConditionSettings).StdLevel, e.File, e[0].Line, e[0].MetaTags);
            }
        }
    }
}
