using System;
using System.Collections.Generic;
using System.Text;
using System.IO;

namespace DelphiAnalyser.Controllers
{
    public class FileController
    {
        private static FileController instance;

        public static FileController Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new FileController();
                    instance.files = new List<string>();
                }
                return instance;
            }
        }

        private List<string> files;

        public IEnumerable<string> Files
        {
            get
            {
                if (files == null)
                    files = new List<string>();
                return files.ToArray();
            }
        }

        private string[] commandline;

        private void AddFolder(DirectoryInfo folder)
        {
            if (!folder.Exists)
                return;
            DirectoryInfo[] folders = folder.GetDirectories();
            foreach (DirectoryInfo f in folders)
                AddFolder(f);
            FileInfo[] files = folder.GetFiles();
            foreach (FileInfo f in files)
                AddFile(f);
        }

        private void AddFile(FileInfo file)
        {
            if ((file.Attributes & FileAttributes.Directory) == FileAttributes.Directory)
                AddFolder(new DirectoryInfo(file.FullName));
            else if (!files.Contains(file.FullName) && (DelphiAnalyser.Properties.Settings.Default.Extensions.Contains(file.Extension.ToLower())))
                files.Add(file.FullName);
        }

        public void Add(string filename)
        {
            FileInfo file = new FileInfo(filename);
            if ((file.Attributes & FileAttributes.Directory) == FileAttributes.Directory)
                AddFolder(new DirectoryInfo(file.FullName));
            else if (file.Exists)
                AddFile(new FileInfo(filename));
        }

        public void Clear()
        {
            files.Clear();
        }

        public void Remove(string filename)
        {
            files.Remove(filename);
        }

        /// <summary>
        /// Инициализация командной строки
        /// </summary>
        /// <param name="commandline">командная строка</param>
        /// <returns>результат инициализации</returns>
        public bool InitCommandLine(string[] commandline)
        {
            if (this.commandline == null)
            {
                this.commandline = commandline;
                return true;
            }
            else return false;
        }

        /// <summary>
        /// Командная строка
        /// </summary>
        public string[] CommandLine
        {
            get
            {
                return commandline;
            }
        }
    }
}
