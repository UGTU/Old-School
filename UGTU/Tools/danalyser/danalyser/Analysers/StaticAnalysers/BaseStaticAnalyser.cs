using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;

namespace DelphiAnalyser.Analysers.StaticAnalysers
{
    /// <summary>
    /// Статический анализатор
    /// </summary>
    public abstract class BaseStaticAnalyser: BaseAnalyser
    {
        // Видимые свойства
        [Category("Общие")]
        [DisplayName("Сообщение")]
        [Description("Сообщение, которое будет показано когда ошибка будет локализована.")]
        public string Message { get { return (settings as AnalyserSettings.BaseStaticSettings).Message; } set { (settings as AnalyserSettings.BaseStaticSettings).Message = value; Change(); } }
        
        [Category("Общие")]
        [DisplayName("Уровень")]
        [Description("Уровень важности ошибки.")]
        public int Level { get { return (settings as AnalyserSettings.BaseStaticSettings).Level; } set { (settings as AnalyserSettings.BaseStaticSettings).Level = value; Change(); } }

        /// <summary>
        /// Добавление ошибки
        /// </summary>
        /// <param name="e">набор токенов</param>
        /// <param name="index">номер токена в наборе</param>
        protected void AddError(AnalyserParameters e, int index)
        {
            AddError((settings as AnalyserSettings.BaseStaticSettings).Message, (settings as AnalyserSettings.BaseStaticSettings).Level, e.File, e[index].Line, e[index].MetaTags);
        }

        /// <summary>
        /// Загрузка анализатора
        /// </summary>
        public override void Load()
        {
            if (!LoadSelf())
            {
                Init();
                settings.Enabled = true;
                Attribute attr = Attribute.GetCustomAttribute(this.GetType(), typeof(StaticAnalyserDefaultSettingsAttribute));
                (settings as AnalyserSettings.BaseStaticSettings).Message = (attr as StaticAnalyserDefaultSettingsAttribute).Message;
                (settings as AnalyserSettings.BaseStaticSettings).Level = (attr as StaticAnalyserDefaultSettingsAttribute).Level;
            }
            Change();
        }
    }
}
