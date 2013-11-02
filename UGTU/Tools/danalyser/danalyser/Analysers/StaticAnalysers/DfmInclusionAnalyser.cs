using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.ComponentModel;

namespace DelphiAnalyser.Analysers.StaticAnalysers
{
    /// <summary>
    /// Обнаружено подключение dfm-файла
    /// </summary>
    [StaticAnalyserDefaultSettings("Имена из dfm-файла.", "Неправильный идентификатор (некорректная длина или цифры в идентификаторе)!", 5)]
    public class DfmInclusionAnalyser : BaseStaticAnalyser
    {
        [Category("Особые")]
        [DisplayName("Считать ошибкой")]
        [Description("Если данный параметр сброшен (значение false), то идентификаторы из dfm-файлов будут игнорироваться при анализе, иначе им будет присвоен другой уровень важности.")]
        public bool Show { get { return (settings as AnalyserSettings.DfmIdsSettings).Show; } set { (settings as AnalyserSettings.DfmIdsSettings).Show = value; } }

        /// <summary>
        /// Загрузка анализатора
        /// </summary>
        /// <returns>результат загрузки</returns>
        protected override bool LoadSelf()
        {
            bool load = (DelphiAnalyser.Properties.Settings.Default.DfmInclusion != null);
            settings = (load) ? DelphiAnalyser.Properties.Settings.Default.DfmInclusion : new AnalyserSettings.DfmIdsSettings();
            return load;
        }

        /// <summary>
        /// Сохранение анализатора
        /// </summary>
        protected override void SaveSelf()
        {
            DelphiAnalyser.Properties.Settings.Default.DfmInclusion = (settings as AnalyserSettings.DfmIdsSettings);
        }

        /// <summary>
        /// Подписка на события
        /// </summary>
        /// <param name="lanalyser">лексический анализатор</param>
        /// <param name="sanalyser">синтаксический анализатор</param>
        protected override void InitEvents(LexicalAnalyser lanalyser, SyntaxisAnalyser sanalyser)
        {
            lanalyser.DfmInclusionEvent += new EventHandler<AnalyserParameters>(Analyse);
        }

        /// <summary>
        /// Собственно анализ
        /// </summary>
        /// <param name="sender">инициатор события</param>
        /// <param name="e">список токенов</param>
        protected override void DoAnalyse(AnalyserParameters e)
        {
            if (!e.File.Exists)
                return;
            DelphiAnalyser.Analysers.DfmAnalysers.SyntaxisAnalyser dfmanalyser = new DelphiAnalyser.Analysers.DfmAnalysers.SyntaxisAnalyser(e[0].MetaTags);
            List<string> DfmIds = new List<string>(dfmanalyser.Translate(e.File, File.ReadAllText(e.File.FullName)));
            List<DelphiAnalyser.Addition.ParsingError> Errors = new List<DelphiAnalyser.Addition.ParsingError>(DelphiAnalyser.Controllers.AnalyserController.Instance.Errors);
            for (int i = 0; i < Errors.Count; i++)
            {
                if ((Errors[i] is DelphiAnalyser.Addition.ParsingErrors.IdNameError) && (DfmIds.Contains((Errors[i] as DelphiAnalyser.Addition.ParsingErrors.IdNameError).Id)))
                {
                    if ((settings as AnalyserSettings.DfmIdsSettings).Show)
                        Errors[i] = new DelphiAnalyser.Addition.ParsingError(Errors[i].Message, (settings as AnalyserSettings.BaseStaticSettings).Level, Errors[i].File, Errors[i].Position, e[0].MetaTags);
                    else
                    {
                        Errors.RemoveAt(i);
                        i--;
                    }
                }
            }
            DelphiAnalyser.Controllers.AnalyserController.Instance.Errors = Errors.ToArray();
        }
    }
}
