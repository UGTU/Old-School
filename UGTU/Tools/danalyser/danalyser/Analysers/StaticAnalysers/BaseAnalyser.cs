using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;
using System.IO;

namespace DelphiAnalyser.Analysers.StaticAnalysers
{
    /// <summary>
    /// Анализатор
    /// </summary>
    public abstract class BaseAnalyser: Attribute
    {
        [Browsable(false)]
        public override object TypeId { get { return base.TypeId; } }

        /// <summary>
        /// Настройки
        /// </summary>
        protected AnalyserSettings.BaseSettings settings;

        /// <summary>
        /// Ссылка на лексический анализатор
        /// </summary>
        protected LexicalAnalyser lanalyser;

        /// <summary>
        /// Ссылка на синтаксический анализатор
        /// </summary>
        protected SyntaxisAnalyser sanalyser;

        /// <summary>
        /// Событие - свойства изменились
        /// </summary>
        [Browsable(false)]
        public event EventHandler<EventArgs> PropertiesChangedEvent;

        /// <summary>
        /// Событие - произошла ошибка
        /// </summary>
        [Browsable(false)]
        public event EventHandler<DelphiAnalyser.Addition.ErrorParam> ErrorOccuredEvent;

        /// <summary>
        /// Создание ошибки
        /// </summary>
        /// <param name="message">сообщение об ошибке</param>
        /// <param name="level">уровень важности ошибки</param>
        /// <param name="file">файл с ошибкой</param>
        /// <param name="line">номер строки с ошибкой</param>
        /// <returns>созданная ошибка</returns>
        protected virtual DelphiAnalyser.Addition.ParsingError RawError(string message, int level, FileInfo file, int line, Dictionary<string, string> metatags)
        {
            return new DelphiAnalyser.Addition.ParsingError(message, level, file, line, metatags);
        }

        /// <summary>
        /// Добавление ошибки
        /// </summary>
        /// <param name="message">сообщение об ошибке</param>
        /// <param name="level">уровень важности ошибки</param>
        /// <param name="file">файл с ошибкой</param>
        /// <param name="line">номер строки с ошибкой</param>
        protected void AddError(string message, int level, FileInfo file, int line, Dictionary<string, string> metatags)
        {
            if (ErrorOccuredEvent != null)
                ErrorOccuredEvent(this, new DelphiAnalyser.Addition.ErrorParam(RawError(message, level, file, line, metatags)));
        }

        [Category("Общие")]
        [DisplayName("Включен")]
        [Description("Если анализатор выключен, то обнаруживаемые им ошибки будут игнорироваться.")]
        public bool Enabled { get { return settings.Enabled; } set { settings.Enabled = value; Change(); } }

        [Browsable(false)]
        public string Name { get { return (Attribute.GetCustomAttribute(this.GetType(), typeof(AnalyserDefaultSettingsAttribute)) as AnalyserDefaultSettingsAttribute).Name; } }

        /// <summary>
        /// Изменение свойств
        /// </summary>
        protected virtual void CheckChanges() { }

        /// <summary>
        /// Изменение свойств
        /// </summary>
        protected void Change()
        {
            CheckChanges();
            if (PropertiesChangedEvent != null)
                PropertiesChangedEvent(this, new EventArgs());
        }

        /// <summary>
        /// Инициализация
        /// </summary>
        protected virtual void Init() { }

        /// <summary>
        /// Инициализация
        /// </summary>
        public void Initialize(LexicalAnalyser lanalyser, SyntaxisAnalyser sanalyser)
        {
            this.lanalyser = lanalyser;
            this.sanalyser = sanalyser;
            Load();
            InitEvents(lanalyser, sanalyser);
        }

        /// <summary>
        /// Подписка на события
        /// </summary>
        /// <param name="lanalyser">лексический анализатор</param>
        /// <param name="sanalyser">синтаксический анализатор</param>
        protected virtual void InitEvents(LexicalAnalyser lanalyser, SyntaxisAnalyser sanalyser) { }

        /// <summary>
        /// Сохранение
        /// </summary>
        protected abstract void SaveSelf();

        /// <summary>
        /// Сохранение анализатора
        /// </summary>
        public void Save()
        {
            Change();
            SaveSelf();
        }

        /// <summary>
        /// Загрузка
        /// </summary>
        /// <returns>результат загрузки</returns>
        protected abstract bool LoadSelf();

        /// <summary>
        /// Загрузка анализатора
        /// </summary>
        public virtual void Load()
        {
            if (!LoadSelf())
            {
                Init();
                settings.Enabled = true;
            }
            Change();
        }

        /// <summary>
        /// Собственно анализ
        /// </summary>
        /// <param name="sender">инициатор события</param>
        /// <param name="e">набор токенов</param>
        protected abstract void DoAnalyse(AnalyserParameters e);

        /// <summary>
        /// Условный анализ
        /// </summary>
        /// <param name="sender">инициатор события</param>
        /// <param name="e">набор токенов</param>
        public void Analyse(object sender, AnalyserParameters e)
        {
            if (settings.Enabled)
                DoAnalyse(e);
        }
    }
}
