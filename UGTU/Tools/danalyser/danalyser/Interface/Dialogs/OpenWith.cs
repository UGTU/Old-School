using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.IO;

namespace DelphiAnalyser.Interface.Dialogs
{
    public partial class OpenWith : Form
    {
        public OpenWith()
        {
            InitializeComponent();
        }

        private void browseB_Click(object sender, EventArgs e)
        {
            selectExe.FileName = "";
            if ((selectExe.ShowDialog() != DialogResult.Cancel) && new FileInfo(selectExe.FileName).Exists)
                exePath.Text = selectExe.FileName;
        }

        private void okB_Click(object sender, EventArgs e)
        {
            DelphiAnalyser.Properties.Settings.Default.OpenWithExecutable = exePath.Text;
            DelphiAnalyser.Properties.Settings.Default.OpenWithCmd = cmdLine.Text;
            DelphiAnalyser.Properties.Settings.Default.Save();
            this.Close();
        }

        private void OpenWith_Shown(object sender, EventArgs e)
        {
            exePath.Text = DelphiAnalyser.Properties.Settings.Default.OpenWithExecutable;
            cmdLine.Text = DelphiAnalyser.Properties.Settings.Default.OpenWithCmd;
        }
    }
}
