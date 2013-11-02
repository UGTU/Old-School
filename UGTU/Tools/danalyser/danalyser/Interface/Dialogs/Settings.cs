using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace DelphiAnalyser.Interface.Dialogs
{
    public partial class Settings : Form
    {
        public Settings()
        {
            InitializeComponent();
        }

        public void ShowDialog()
        {
            extList.Items.Clear();
            foreach (string ext in DelphiAnalyser.Properties.Settings.Default.Extensions)
                extList.Items.Add(ext);
            base.ShowDialog();
        }

        private void delBtn_Click(object sender, EventArgs e)
        {
            List<string> exts = new List<string>();
            foreach (string ext in extList.SelectedItems)
                exts.Add(ext);
            foreach (object ext in exts)
                extList.Items.Remove(ext);
        }

        private void addBtn_Click(object sender, EventArgs e)
        {
            if (!extList.Items.Contains(extBox.Text) && (extBox.Text != string.Empty))
                extList.Items.Add(extBox.Text);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            DelphiAnalyser.Properties.Settings.Default.Extensions.Clear();
            foreach (string ext in extList.Items)
                DelphiAnalyser.Properties.Settings.Default.Extensions.Add(ext);
            DelphiAnalyser.Properties.Settings.Default.Save();
            Close();
        }
    }
}
