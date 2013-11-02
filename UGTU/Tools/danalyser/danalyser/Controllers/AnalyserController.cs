using System;
using System.Collections.Generic;
using System.Text;
using System.IO;

namespace DelphiAnalyser.Controllers
{
    /// <summary>
    /// Контроллер анализаторов
    /// </summary>
    [DelphiAnalyser.Analysers.StaticAnalysers.NoDigitInIdAnalyser()]
    [DelphiAnalyser.Analysers.StaticAnalysers.IdLengthAnalyser()]
    [DelphiAnalyser.Analysers.StaticAnalysers.DfmInclusionAnalyser()]
    [DelphiAnalyser.Analysers.StaticAnalysers.FuncParamCountAnalyser()]
    [DelphiAnalyser.Analysers.StaticAnalysers.ConstantExpressionAnalyser()]
    [DelphiAnalyser.Analysers.StaticAnalysers.CaseConditionAnalyser()]
    [DelphiAnalyser.Analysers.StaticAnalysers.PublicMemberAnalyser()]
    [DelphiAnalyser.Analysers.StaticAnalysers.NoSectionDirectiveAnalyser()]
    [DelphiAnalyser.Analysers.StaticAnalysers.RegularAnalyzer()]
    [DelphiAnalyser.Analysers.StaticAnalysers.EmptyBodyAnalyser()]
    public class AnalyserController
    {
        // Анализаторы
        private DelphiAnalyser.Analysers.LexicalAnalyser lanalyser;
        private DelphiAnalyser.Analysers.SyntaxisAnalyser sanalyser;

        // Статические анализаторы
        private List<DelphiAnalyser.Analysers.StaticAnalysers.BaseAnalyser> analysers;

        /// <summary>
        /// Статические анализаторы
        /// </summary>
        public List<DelphiAnalyser.Analysers.StaticAnalysers.BaseAnalyser> Analysers { get { return analysers; } set { analysers = value; } }

        private List<DelphiAnalyser.Addition.ParsingError> errors;

        /// <summary>
        /// Ошибки, найденные анализатором
        /// </summary>
        public IEnumerable<DelphiAnalyser.Addition.ParsingError> Errors { get { return errors; } set { errors = new List<DelphiAnalyser.Addition.ParsingError>(value); } }

        /// <summary>
        /// Очистка списка ошибок
        /// </summary>
        private void ClearErrors()
        {
            if (errors.Count > 0)
                errors.Clear();
        }

        /// <summary>
        /// Инициализация ошибок
        /// </summary>
        private void InitErrors()
        {
            if (errors == null)
                errors = new List<DelphiAnalyser.Addition.ParsingError>();
            ClearErrors();
        }

        /// <summary>
        /// Добавление анализатора в список
        /// </summary>
        /// <param name="analyser">анализатор</param>
        private void AddAnalyser(DelphiAnalyser.Analysers.StaticAnalysers.BaseAnalyser analyser)
        {
            analyser.Initialize(lanalyser, sanalyser);
            analysers.Add(analyser);
            analyser.ErrorOccuredEvent += new EventHandler<DelphiAnalyser.Addition.ErrorParam>(this.ErrorOccured);
        }

        /// <summary>
        /// Загрузка анализаторов
        /// </summary>
        public void LoadAnalysers()
        {
            DelphiAnalyser.Properties.Settings.Default.Reload();
            foreach (DelphiAnalyser.Analysers.StaticAnalysers.BaseAnalyser analyser in analysers)
                analyser.Load();
        }

        /// <summary>
        /// Сохранение анализаторов
        /// </summary>
        public void SaveAnalysers()
        {
            foreach (DelphiAnalyser.Analysers.StaticAnalysers.BaseAnalyser analyser in analysers)
                analyser.Save();
            DelphiAnalyser.Properties.Settings.Default.Save();
        }

        /// <summary>
        /// Инициализация
        /// </summary>
        public void Initialize()
        {
            if (lanalyser == null)
                lanalyser = new DelphiAnalyser.Analysers.LexicalAnalyser();
            if (sanalyser == null)
                sanalyser = new DelphiAnalyser.Analysers.SyntaxisAnalyser(lanalyser);
            sanalyser.ErrorOccuredEvent += new EventHandler<DelphiAnalyser.Addition.ErrorParam>(this.ErrorOccured);
            if (analysers == null)
            {
                analysers = new List<DelphiAnalyser.Analysers.StaticAnalysers.BaseAnalyser>();
                foreach (Attribute attr in Attribute.GetCustomAttributes(this.GetType(), typeof(DelphiAnalyser.Analysers.StaticAnalysers.BaseAnalyser)))
                {
                    AddAnalyser(attr as DelphiAnalyser.Analysers.StaticAnalysers.BaseAnalyser);
                }
            }
            InitErrors();
        }

        // Одиночка
        private static AnalyserController instance;

        /// <summary>
        /// Единственный экземпляр класса
        /// </summary>
        public static AnalyserController Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new AnalyserController();
                    instance.Initialize();
                }
                return instance;
            }
        }

        /// <summary>
        /// Реакция на обнаружение ошибки
        /// </summary>
        /// <param name="sender">инициатор события</param>
        /// <param name="e">информация об ошибке</param>
        public void ErrorOccured(object sender, DelphiAnalyser.Addition.ErrorParam e)
        {
            errors.Add(e.Error);
        }

        private void InnerStaticAnalysis(string filename)
        {
            FileInfo file = new FileInfo(filename);
            if (file.Exists)
            {
                string source = File.ReadAllText(filename, Encoding.Default);
                sanalyser.Translate(file, source);
            }
            else errors.Add(new DelphiAnalyser.Addition.ParsingError("файл не существует.", 10, file, 0, new Dictionary<string,string>()));
        }

        /// <summary>
        /// Статический анализ
        /// </summary>
        /// <param name="file">файл для анализа</param>
        /// <param name="source">исходный код</param>
        public IEnumerable<DelphiAnalyser.Addition.ParsingError> StaticAnalysis(string filename)
        {
            ClearErrors();
            InnerStaticAnalysis(filename);
            return errors;
        }

        public IEnumerable<DelphiAnalyser.Addition.ParsingError> StaticAnalysis(IEnumerable<string> filenames)
        {
            ClearErrors();
            foreach (string filename in filenames)
                InnerStaticAnalysis(filename);
            return errors;
        }
    }
}
