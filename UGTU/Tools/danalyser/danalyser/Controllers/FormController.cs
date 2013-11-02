using System;
using System.Collections.Generic;
using System.Text;

namespace DelphiAnalyser.Controllers
{
    /// <summary>
    /// Контроллер форм
    /// </summary>
    class FormController
    {
        // Одиночка
        private static FormController instance;

        // формы
        private DelphiAnalyser.Interface.Forms.mainForm main;
        private DelphiAnalyser.Interface.Forms.editorForm editor;
        private DelphiAnalyser.Interface.Forms.aboutForm about;
        
        // диалоги
        private DelphiAnalyser.Interface.Dialogs.Settings settings;
        private DelphiAnalyser.Interface.Dialogs.lsAnalysis lsanalysis;
        private DelphiAnalyser.Interface.Dialogs.SearchForm search;
        private DelphiAnalyser.Interface.Dialogs.OpenWith openwith;

        /// <summary>
        /// Единственный экземпляр класса
        /// </summary>
        public static FormController Instance
        {
            get
            {
                if (instance == null)
                    instance = new FormController();
                return instance;
            }
        }
        
        /// <summary>
        /// Главное окно
        /// </summary>
        public DelphiAnalyser.Interface.Forms.mainForm Main
        {
            get
            {
                if (main == null)
                {
                    main = new DelphiAnalyser.Interface.Forms.mainForm();
                    if (editor != null)
                        main.AddOwnedForm(editor);
                }
                return main;
            }
        }

        /// <summary>
        /// Окно редактора
        /// </summary>
        public DelphiAnalyser.Interface.Forms.editorForm Editor
        {
            get
            {
                if (editor == null)
                {
                    editor = new DelphiAnalyser.Interface.Forms.editorForm();
                    if (main != null)
                        main.AddOwnedForm(editor);
                    if (search != null)
                        editor.AddOwnedForm(search);
                }
                return editor;
            }
        }

        /// <summary>
        /// Окно "О программе"
        /// </summary>
        public DelphiAnalyser.Interface.Forms.aboutForm About
        {
            get
            {
                if (about == null)
                    about = new DelphiAnalyser.Interface.Forms.aboutForm();
                return about;
            }
        }
        
        /// <summary>
        /// Окно настроек анализатора
        /// </summary>
        public DelphiAnalyser.Interface.Dialogs.Settings Settings
        {
            get
            {
                if (settings == null)
                    settings = new DelphiAnalyser.Interface.Dialogs.Settings();
                return settings;
            }
        }

        /// <summary>
        /// Окно настроек лексического и синтаксического анализа
        /// </summary>
        public DelphiAnalyser.Interface.Dialogs.lsAnalysis lsAnalysis
        {
            get
            {
                if (lsanalysis == null)
                    lsanalysis = new DelphiAnalyser.Interface.Dialogs.lsAnalysis();
                return lsanalysis;
            }
        }

        public DelphiAnalyser.Interface.Dialogs.SearchForm Search
        {
            get
            {
                if (search == null)
                {
                    search = new DelphiAnalyser.Interface.Dialogs.SearchForm();
                    if (editor != null)
                        editor.AddOwnedForm(search);
                }
                return search;
            }
        }

        public DelphiAnalyser.Interface.Dialogs.OpenWith OpenWith
        {
            get
            {
                if (openwith == null)
                    openwith = new DelphiAnalyser.Interface.Dialogs.OpenWith();
                return openwith;
            }
        }
    }
}
