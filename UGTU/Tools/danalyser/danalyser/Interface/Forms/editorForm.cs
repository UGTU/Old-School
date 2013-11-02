using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.IO;

namespace DelphiAnalyser.Interface.Forms
{
    public partial class editorForm : Form
    {
        private bool change, search = false;
        private string current;
        private int line;

        public editorForm()
        {
            InitializeComponent();
            переносПоСловамToolStripMenuItem.Checked = codeBox.WordWrap;
            current = string.Empty;
            change = false;
        }

        private void Load(string filename, int line)
        {
            current = filename;
            FileInfo file = new FileInfo(filename);
            this.Text = string.Format("Редактор кода - {0}",file.Name);
            codeBox.Text = File.ReadAllText(filename, Encoding.Default);
            if (line != 0)
                codeBox.Select(codeBox.GetFirstCharIndexFromLine(line-1), codeBox.Lines[line-1].Length);
            else
                codeBox.Select(0, 0);
            codeBox.Focus();
            codeBox.ScrollToCaret();
            codeBox.Refresh();
            codeBox_MouseCaptureChanged(this, new EventArgs());
            change = false;
        }

        private void Save(string filename)
        {
            try
            {
                current = filename;
                File.WriteAllText(filename, codeBox.Text, Encoding.Default);
                change = false;
            }
            catch (Exception)
            {
                switch (MessageBox.Show("Во время сохранения произошла ошибка!\nВозможно файл защищен от записи.", "Внимание!", MessageBoxButtons.RetryCancel, MessageBoxIcon.Warning))
                {
                    case DialogResult.Retry:
                        Save(filename);
                        break;
                }
            }
        }

        private bool IsSaved()
        {
            if (change)
            {
                switch (MessageBox.Show("Данные в справочнике были изменены.\nСохранить изменения?", "Внимание", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question))
                {
                    case DialogResult.Cancel:
                        return false;
                    case DialogResult.Yes:
                        сохранитьToolStripMenuItem_Click(this, new EventArgs());
                        if (change) return false;
                        break;
                }
                return true;
            }
            else return true;
        }

        public void NeedSearch()
        {
            if (search)
                DelphiAnalyser.Controllers.FormController.Instance.Search.Show();
        }

        public void ShowLoad(string filename, int line)
        {
            tabs.SelectedTab = editTab;
//            detailTab.
            current = filename;
            this.line = line;
            if (!Visible)
                Show();
            NeedSearch();
            editorForm_Shown(this, new EventArgs());
        }

        public void ShowClear()
        {
            if (!Visible)
            {
                current = string.Empty;
                codeBox.Text = string.Empty;
                change = false;
                this.Text = "Редактор кода";
                Show();
                NeedSearch();
            }
        }

        private void открытьToolStripMenuItem_Click(object sender, EventArgs e)
        {
            openFile.FileName = "";
            if (openFile.ShowDialog() != DialogResult.Cancel)
                Load(openFile.FileName,0);
        }

        private void сохранитьToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (current == string.Empty)
                сохранитьКакToolStripMenuItem_Click(sender, e);
            else
                Save(current);
        }

        private void сохранитьКакToolStripMenuItem_Click(object sender, EventArgs e)
        {
            saveFile.FileName = "";
            if (saveFile.ShowDialog() != DialogResult.Cancel)
            {
                Save(saveFile.FileName);
                FileInfo file = new FileInfo(saveFile.FileName);
                this.Text = string.Format("Редактор кода - {0}", file.Name);
            }
        }

        private void выходToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void оПрограммеToolStripMenuItem_Click(object sender, EventArgs e)
        {
            DelphiAnalyser.Controllers.FormController.Instance.About.ShowDialog();
        }

        private void EnableMenu()
        {
            bool canexecute = (DelphiAnalyser.Properties.Settings.Default.OpenWithExecutable != "");
            string temptext = (canexecute) ? Path.GetFileName(DelphiAnalyser.Properties.Settings.Default.OpenWithExecutable) : "...";
            открытьСПомощьюToolStripMenuItem1.Text = string.Format("Открыть с помощью {0}", temptext);
        }

        private void editorForm_Shown(object sender, EventArgs e)
        {
            EnableMenu();
            строкаСостоянияToolStripMenuItem.Checked = statusStrip1.Visible;
            if (current != string.Empty)
                Load(current, line);
            NeedSearch();
        }

        private void codeBox_MouseCaptureChanged(object sender, EventArgs e)
        {
            Status.Text = string.Format("строка: {0}",codeBox.GetLineFromCharIndex(codeBox.SelectionStart)+1);
        }

        private void codeBox_TextChanged(object sender, EventArgs e)
        {
            change = true;
        }

        private void ShowMe(bool hide)
        {
            if (hide)
            {
                search = DelphiAnalyser.Controllers.FormController.Instance.Search.Visible;
                DelphiAnalyser.Controllers.FormController.Instance.Search.Hide();
                Hide();
            }
        }

        private void editorForm_FormClosing(object sender, FormClosingEventArgs e)
        {
            e.Cancel = (e.CloseReason == CloseReason.UserClosing);
            ShowMe(e.Cancel && IsSaved());
        }

        private void переносПоСловамToolStripMenuItem_Click(object sender, EventArgs e)
        {
            codeBox.WordWrap = !codeBox.WordWrap;
            переносПоСловамToolStripMenuItem.Checked = codeBox.WordWrap;
        }

        private void строкаСостоянияToolStripMenuItem_Click(object sender, EventArgs e)
        {
            statusStrip1.Visible = !statusStrip1.Visible;
            строкаСостоянияToolStripMenuItem.Checked = statusStrip1.Visible;
        }

        private void шрифтToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fontDlg.Font = codeBox.Font;
            if (fontDlg.ShowDialog() != DialogResult.Cancel)
                codeBox.Font = fontDlg.Font;
        }

        private void отменитьToolStripMenuItem_Click(object sender, EventArgs e)
        {
            codeBox.Undo();
        }

        private void вырезатьToolStripMenuItem_Click(object sender, EventArgs e)
        {
            codeBox.Cut();
        }

        private void копироватьToolStripMenuItem_Click(object sender, EventArgs e)
        {
            codeBox.Copy();
        }

        private void вставитьToolStripMenuItem_Click(object sender, EventArgs e)
        {
            codeBox.Paste();
        }

        private void удалитьToolStripMenuItem_Click(object sender, EventArgs e)
        {
            codeBox.SelectedText = string.Empty;
        }

        private void выделитьВсеToolStripMenuItem_Click(object sender, EventArgs e)
        {
            codeBox.SelectAll();
        }

        private void найтиToolStripMenuItem_Click(object sender, EventArgs e)
        {
            DelphiAnalyser.Controllers.FormController.Instance.Search.Show();
        }

        private void найтиДалееToolStripMenuItem_Click(object sender, EventArgs e)
        {
            DelphiAnalyser.Controllers.FormController.Instance.Search.button1_Click(this, new EventArgs());
        }

        private void открытьСПомощьюToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            try
            {
                if (current == "")
                {
                    MessageBox.Show("Нечего открывать!", "Внимание", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                if (new FileInfo(DelphiAnalyser.Properties.Settings.Default.OpenWithExecutable).Exists)
                {
                    System.Diagnostics.Process Executable = new System.Diagnostics.Process();
                    Executable.StartInfo.FileName = DelphiAnalyser.Properties.Settings.Default.OpenWithExecutable;
                    Executable.StartInfo.Arguments = DelphiAnalyser.Properties.Settings.Default.OpenWithCmd.Replace("%1", current);
                    Executable.Start();
                }
                else throw new Exception();
            }
            catch (Exception err)
            {
                настроитьToolStripMenuItem_Click(sender, e);
            }
        }

        private void настроитьToolStripMenuItem_Click(object sender, EventArgs e)
        {
            DelphiAnalyser.Controllers.FormController.Instance.OpenWith.ShowDialog();
            EnableMenu();
        }
    }
}
