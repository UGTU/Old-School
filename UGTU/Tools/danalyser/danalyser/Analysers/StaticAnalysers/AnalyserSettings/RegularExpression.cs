using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;

namespace DelphiAnalyser.Analysers.StaticAnalysers.AnalyserSettings
{
    [Serializable()]
    public class RegularExpression
    {
        private string name, regex;
        private bool iscorrect;
        private DelphiAnalyser.Addition.Importance level;

        public RegularExpression(string name, string regex, bool iscorrect, int level)
        {
            this.name = name;
            this.regex = regex;
            this.iscorrect = iscorrect;
            this.level = new DelphiAnalyser.Addition.Importance(level);
        }

        public RegularExpression()
        {
            this.name = "Новое регулярное выражение";
            this.regex = string.Empty;
            this.iscorrect = false;
            this.level = new DelphiAnalyser.Addition.Importance(10);
        }

        [Category("Шаблон")]
        [DisplayName("Сообщение")]
        [Description("Сообщение, которое будет выводиться при обнаружении соответствия.")]
        public string Name { get { return name; } set { name = value; } }

        [Category("Шаблон")]
        [DisplayName("Корректно")]
        [Description("Если данная опция включена, то правило будет срабатывать при отсутствии конструкции в коде, в противном случае - при наличии.")]
        public bool IsCorrect { get { return iscorrect; } set { iscorrect = value; } }

        [Category("Шаблон")]
        [DisplayName("Уровень")]
        [Description("Уровень важности правила.")]
        public int Level { get { return level.Value; } set { level.Value = value; } }

        [Category("Шаблон")]
        [DisplayName("Выражение")]
        [Description("Регулярное выражение, на соответствие которому будет проверяться исходный код.")]
        public string RegEx { get { return regex; } set { regex = value; } }
    }
}
