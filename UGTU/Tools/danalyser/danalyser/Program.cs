using System;
using System.Collections.Generic;
using System.Windows.Forms;
using System.IO;
using System.Xml.Serialization;

namespace DelphiAnalyser
{
    static class Program
    {
        delegate U Conversion<T, U>(T param);

        private static IEnumerable<U> Convert<T, U>(IEnumerable<T> source, Conversion<T, U> conversion)
        {
            List<U> result = new List<U>();
            foreach (T element in source)
                result.Add(conversion(element));
            return result.ToArray();
        }

        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main(string[] args)
        {
            DelphiAnalyser.Controllers.FileController.Instance.InitCommandLine(args);
            if ((DelphiAnalyser.Controllers.FileController.Instance.CommandLine.Length > 0) && ((DelphiAnalyser.Controllers.FileController.Instance.CommandLine[0] == "-h") || (DelphiAnalyser.Controllers.FileController.Instance.CommandLine[0] == "/?")))
            {
                MessageBox.Show(string.Format("Формат командной строки:\n {0} [<file>, ...] - запуск GUI-анализатора с подргузкой файлов для анализа\n {0} -b [<file>, ...] -o <xml> [<file>, ...] - запуск в пакетном режиме\n {0} /?|-h - эта справка\n\n   <file> - файл или директория с файлами для анализа.\n   <xml> - выходной файл, куда будет сохранен ответ об ошибках.", Path.GetFileName(Application.ExecutablePath).ToLower()));
                return;
            }
            else if ((DelphiAnalyser.Controllers.FileController.Instance.CommandLine.Length > 1) && (DelphiAnalyser.Controllers.FileController.Instance.CommandLine[0].ToLower() == "-b"))
            {
                string xml = Application.ExecutablePath;
                int i = 1;
                while (DelphiAnalyser.Controllers.FileController.Instance.CommandLine.Length > i)
                {
                    if (DelphiAnalyser.Controllers.FileController.Instance.CommandLine[i].ToLower() != "-o")
                        DelphiAnalyser.Controllers.FileController.Instance.Add(DelphiAnalyser.Controllers.FileController.Instance.CommandLine[i]);
                    else if (DelphiAnalyser.Controllers.FileController.Instance.CommandLine.Length > ++i)
                        xml = DelphiAnalyser.Controllers.FileController.Instance.CommandLine[i];
                    i++;
                }
                DelphiAnalyser.Controllers.AnalyserController.Instance.StaticAnalysis(DelphiAnalyser.Controllers.FileController.Instance.Files);
                DelphiAnalyser.Addition.XmlReport report = new DelphiAnalyser.Addition.XmlReport();
                report.Errors = new List<DelphiAnalyser.Addition.SerializableError>(Convert<DelphiAnalyser.Addition.ParsingError, DelphiAnalyser.Addition.SerializableError>(DelphiAnalyser.Controllers.AnalyserController.Instance.Errors, x => new DelphiAnalyser.Addition.SerializableError(x)));
                XmlSerializer xmlfile = new XmlSerializer(typeof(DelphiAnalyser.Addition.XmlReport));
                FileStream file = new FileStream(xml, FileMode.Create, FileAccess.Write, FileShare.Read);
                xmlfile.Serialize(file, report);
                //foreach (DelphiAnalyser.Addition.ParsingError err in DelphiAnalyser.Controllers.AnalyserController.Instance.Errors)
                //    xmlfile.Serialize(file, new DelphiAnalyser.Addition.SerializableError(err));
                file.Close();
                return;
            }
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(DelphiAnalyser.Controllers.FormController.Instance.Main);
        }
    }
}
