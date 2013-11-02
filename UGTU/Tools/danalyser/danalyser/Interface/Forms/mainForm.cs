using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using Microsoft.Office.Interop;
using System.Reflection;

namespace DelphiAnalyser.Interface.Forms
{
    public partial class mainForm : Form
    {
        // Уровни важности ошибок
        Dictionary<DelphiAnalyser.Addition.ErrorLevel, Bitmap> levels;
        Dictionary<DelphiAnalyser.Addition.ErrorLevel, string> level_desc;

        public mainForm()
        {
            InitializeComponent();
            levels = new Dictionary<DelphiAnalyser.Addition.ErrorLevel, Bitmap>();
            level_desc = new Dictionary<DelphiAnalyser.Addition.ErrorLevel, string>();
            levels.Add(DelphiAnalyser.Addition.ErrorLevel.Hint, DelphiAnalyser.Properties.Resources.Information);
            levels.Add(DelphiAnalyser.Addition.ErrorLevel.Alert, DelphiAnalyser.Properties.Resources.Warning);
            levels.Add(DelphiAnalyser.Addition.ErrorLevel.Error, DelphiAnalyser.Properties.Resources.Critical);
            level_desc.Add(DelphiAnalyser.Addition.ErrorLevel.Hint, "Подсказка");
            level_desc.Add(DelphiAnalyser.Addition.ErrorLevel.Alert, "Предупреждение");
            level_desc.Add(DelphiAnalyser.Addition.ErrorLevel.Error, "Критическая ощибка");
            foreach (Bitmap icon in levels.Values)
                icon.MakeTransparent(icon.GetPixel(0, 0));
            foreach (string filename in DelphiAnalyser.Controllers.FileController.Instance.CommandLine)
                DelphiAnalyser.Controllers.FileController.Instance.Add(filename);
            Sync();
            CanStart();
            CanExport();
        }

        private void Sync()
        {
            foreach (string filename in DelphiAnalyser.Controllers.FileController.Instance.Files)
            {
                if (!fileBox.Items.Contains(filename))
                    fileBox.Items.Add(filename);
            }
        }

        /// <summary>
        /// Состояние анализатора
        /// </summary>
        /// <param name="stateName">сообщение состояния</param>
        private void ToState(string stateName)
        {
            status.Text = string.Format("{0} (файлов {1}, ошибок {2})", stateName, fileBox.Items.Count, errorBox.Rows.Count);
        }

        /// <summary>
        /// Сбрось состояние анализатора
        /// </summary>
        private void ResetState()
        {
            ToState("готово");
        }

        private void SelectFile(object sender, EventArgs e)
        {
            openFile.FileName = "";
            if (openFile.ShowDialog() != DialogResult.Cancel)
            {
                ToState("добавление файлов");
                DelphiAnalyser.Controllers.FileController.Instance.Add(openFile.FileName);
                Sync();
                ResetState();
            }
            CanStart();
        }

        private void SelectFolder(object sender, EventArgs e)
        {
            folderDialog.SelectedPath = "";
            if (folderDialog.ShowDialog() != DialogResult.Cancel)
            {
                ToState("добавление файлов");
                DelphiAnalyser.Controllers.FileController.Instance.Add(folderDialog.SelectedPath);
                Sync();
                ResetState();
            }
            CanStart();
        }

        private void RemoveSelectedFiles(object sender, EventArgs e)
        {
            List<string> files = new List<string>();
            foreach (string file in fileBox.SelectedItems)
                files.Add(file);
            foreach (string file in files)
            {
                DelphiAnalyser.Controllers.FileController.Instance.Remove(file);
                fileBox.Items.Remove(file);
            }
            CanStart();
        }

        private void RemoveAllFiles(object sender, EventArgs e)
        {
            DelphiAnalyser.Controllers.FileController.Instance.Clear();
            fileBox.Items.Clear();
            CanStart();
        }

        /// <summary>
        /// Интерфейс
        /// </summary>
        private void CanStart()
        {
            bool can = fileBox.Items.Count > 0;
            startBtn.Enabled = can;
            начатьАнализToolStripMenuItem.Enabled = can;
            открытьToolStripMenuItem.Enabled = can;
            открытьToolStripMenuItem2.Enabled = can;
            открытьToolStripMenuItem5.Enabled = can;
            удалитьВыделенныеToolStripMenuItem.Enabled = can;
            удалитьВыделенныеToolStripMenuItem1.Enabled = can;
            удалитьВсеToolStripMenuItem.Enabled = can;
            удалитьВсеToolStripMenuItem1.Enabled = can;
            удалитьToolStripMenuItem.Enabled = can;
            очиститьToolStripMenuItem1.Enabled = can;
        }

        /// <summary>
        /// Интерфейс
        /// </summary>
        private void CanExport()
        {
            bool can = errorBox.Rows.Count>0;
            exportBtn.Enabled = can;
            экспортироватьВExcelToolStripMenuItem.Enabled = can;
            экспортироватьОшибкиВExcelToolStripMenuItem.Enabled = can;
            открытьToolStripMenuItem1.Enabled = can;
            открытьToolStripMenuItem3.Enabled = can;
            открытьToolStripMenuItem4.Enabled = can;
            удалитьToolStripMenuItem1.Enabled = can;
            удалитьВыделенныеToolStripMenuItem2.Enabled = can;
            удалитьВыделенныеToolStripMenuItem3.Enabled = can;
            удалитьВсеToolStripMenuItem2.Enabled = can;
            удалитьВсеToolStripMenuItem3.Enabled = can;
            очиститьToolStripMenuItem.Enabled = can;
        }

        private void выходToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void настройкиToolStripMenuItem_Click(object sender, EventArgs e)
        {
            DelphiAnalyser.Controllers.FormController.Instance.Settings.ShowDialog();
        }

        private void настройкиToolStripMenuItem_Click_1(object sender, EventArgs e)
        {
            DelphiAnalyser.Controllers.FormController.Instance.Settings.ShowDialog();
        }

        private void startBtn_Click(object sender, EventArgs e)
        {
            if (fileBox.Items.Count > 0)
            {
                ToState("анализ");
                errorBox.Rows.Clear();
                int i = 0;
                DelphiAnalyser.Controllers.AnalyserController.Instance.StaticAnalysis(DelphiAnalyser.Controllers.FileController.Instance.Files);
                foreach (DelphiAnalyser.Addition.ParsingError error in DelphiAnalyser.Controllers.AnalyserController.Instance.Errors)
                    errorBox.Rows.Add(++i, levels[error.Level], level_desc[error.Level], error.LevelNumber, error.Message, error.File.Name, error.MetaTags["Author"], error.File.FullName, error.Position);
                ResetState();
                MessageBox.Show(string.Format("Проверка завершена!\nЗамечаний: {0}", new List<DelphiAnalyser.Addition.ParsingError>(DelphiAnalyser.Controllers.AnalyserController.Instance.Errors).Count), "Внимание", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            CanExport();
        }

        private void оПрограммеToolStripMenuItem_Click(object sender, EventArgs e)
        {
            DelphiAnalyser.Controllers.FormController.Instance.About.ShowDialog();
        }

        private void fileBox_KeyDown(object sender, KeyEventArgs e)
        {
            switch (e.KeyCode)
            {
                case Keys.Delete:
                    RemoveSelectedFiles(sender, new EventArgs());
                    break;
                case Keys.Enter:
                    fileBox_DoubleClick(sender, new EventArgs());
                    break;
            }
        }

        private void fileBox_DragEnter(object sender, DragEventArgs e)
        {
            e.Effect = (e.Data.GetDataPresent(DataFormats.FileDrop)) ? DragDropEffects.All : DragDropEffects.None;
            CanStart();
        }

        private void fileBox_DragDrop(object sender, DragEventArgs e)
        {
            ToState("добавляются файлы");
            string[] filenames = (string[])e.Data.GetData(DataFormats.FileDrop, false);
            foreach (string filename in filenames)
                DelphiAnalyser.Controllers.FileController.Instance.Add(filename);
            Sync();
            CanStart();
            ResetState();
        }

        private void errorBox_DoubleClick(object sender, EventArgs e)
        {
            if (errorBox.SelectedRows.Count > 0)
                DelphiAnalyser.Controllers.FormController.Instance.Editor.ShowLoad(errorBox.SelectedRows[0].Cells["FullFileName"].Value.ToString(), (int)errorBox.SelectedRows[0].Cells["Position"].Value);
        }

        private void редакторКодаToolStripMenuItem_Click(object sender, EventArgs e)
        {
            DelphiAnalyser.Controllers.FormController.Instance.Editor.ShowClear();
        }

        private void fileBox_DoubleClick(object sender, EventArgs e)
        {
            if (fileBox.SelectedItems.Count > 0)
                DelphiAnalyser.Controllers.FormController.Instance.Editor.ShowLoad(fileBox.SelectedItems[0].ToString(), 0);
            else if (fileBox.Items.Count > 0)
                DelphiAnalyser.Controllers.FormController.Instance.Editor.ShowLoad(fileBox.Items[0].ToString(), 0);
        }

        private void errorBox_KeyDown(object sender, KeyEventArgs e)
        {
            switch (e.KeyCode)
            {
                case Keys.Enter:
                    errorBox_DoubleClick(sender, new EventArgs());
                    break;
                case Keys.Delete:
                    удалитьToolStripMenuItem1_Click(sender, new EventArgs());
                    break;
            }
        }

        private void удалитьToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            List<DataGridViewRow> rows = new List<DataGridViewRow>();
            foreach(DataGridViewRow row in errorBox.SelectedRows)
                rows.Add(row);
            foreach (DataGridViewRow row in rows)
                errorBox.Rows.Remove(row);
            CanExport();
        }

        private void очиститьToolStripMenuItem_Click(object sender, EventArgs e)
        {
            errorBox.Rows.Clear();
            CanExport();
        }

        private void экспортироватьВExcelToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (errorBox.Rows.Count > 0)
            {
                Microsoft.Office.Interop.Excel.Application excel;
                Microsoft.Office.Interop.Excel._Workbook workbook;
                Microsoft.Office.Interop.Excel._Worksheet worksheet;
                Microsoft.Office.Interop.Excel.Range range;
                string[,] errors = new string[errorBox.Rows.Count + 1, 5];
                try
                {
                    errors[0, 0] = "Уровень ошибки";
                    errors[0, 1] = "Ошибка";
                    errors[0, 2] = "Файл";
                    errors[0, 3] = "Автор";
                    errors[0, 4] = "№ строки";
                    foreach (DataGridViewRow row in errorBox.Rows)
                    {
                        errors[row.Index + 1, 0] = string.Format("{0} ({1})", row.Cells["level_descr"].Value.ToString(), row.Cells["WarningPercent"].Value.ToString());
                        errors[row.Index + 1, 1] = row.Cells["Message"].Value.ToString();
                        errors[row.Index + 1, 2] = row.Cells["FullFileName"].Value.ToString();
                        errors[row.Index + 1, 3] = row.Cells["Author"].Value.ToString();
                        errors[row.Index + 1, 4] = row.Cells["Position"].Value.ToString();
                    }
                    excel = new Microsoft.Office.Interop.Excel.Application();
                    workbook = excel.Workbooks.Add(Missing.Value) as Microsoft.Office.Interop.Excel._Workbook;
                    worksheet = workbook.ActiveSheet as Microsoft.Office.Interop.Excel._Worksheet;
                    range = worksheet.get_Range("A1", "E1");
                    range.Font.Bold = true;
                    range = worksheet.get_Range("A1", "E"+(errorBox.Rows.Count+1).ToString());
                    worksheet.get_Range("A1", "A1").ColumnWidth = 20;
                    worksheet.get_Range("B1", "B1").ColumnWidth = 50;
                    worksheet.get_Range("C1", "C1").ColumnWidth = 50;
                    worksheet.get_Range("D1", "D1").ColumnWidth = 15;
                    worksheet.get_Range("E1", "E1").ColumnWidth = 10;
                    range.Value2 = errors;
                    excel.Visible = true;
                }
                catch (Exception)
                {
                }
            }
        }

        private void лексическийИСинтаксическийToolStripMenuItem_Click(object sender, EventArgs e)
        {
            DelphiAnalyser.Controllers.FormController.Instance.lsAnalysis.ShowErrors();
        }

        private void авторToolStripMenuItem_Click(object sender, EventArgs e)
        {
            errorBox.Columns["Author"].Visible = !errorBox.Columns["Author"].Visible;
            авторToolStripMenuItem.Checked = errorBox.Columns["Author"].Visible;
        }
    }
}
