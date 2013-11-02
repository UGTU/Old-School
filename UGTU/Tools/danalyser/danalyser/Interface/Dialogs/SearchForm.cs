using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace DelphiAnalyser.Interface.Dialogs
{
    public partial class SearchForm : Form
    {
        public SearchForm()
        {
            InitializeComponent();
        }

        private void SearchForm_FormClosing(object sender, FormClosingEventArgs e)
        {
            e.Cancel = (e.CloseReason == CloseReason.UserClosing);
            if (e.Cancel) Hide();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Close();
        }

        public void button1_Click(object sender, EventArgs e)
        {
            if ((sText.Text.Length > 0) && (DelphiAnalyser.Controllers.FormController.Instance.Editor.codeBox.Text.Length > 0))
            {
                int p = DelphiAnalyser.Controllers.FormController.Instance.Editor.codeBox.SelectionStart + 1;
                if (p < DelphiAnalyser.Controllers.FormController.Instance.Editor.codeBox.Text.Length)
                {
                    StringComparison c = (rLook.Checked) ? StringComparison.Ordinal : StringComparison.OrdinalIgnoreCase;
                    if (sDown.Checked && (p + 1 < DelphiAnalyser.Controllers.FormController.Instance.Editor.codeBox.Text.Length))
                    {
                        int i = DelphiAnalyser.Controllers.FormController.Instance.Editor.codeBox.Text.IndexOf(sText.Text, p, c);
                        if (i > 0)
                        {
                            DelphiAnalyser.Controllers.FormController.Instance.Editor.codeBox.SelectionStart = i;
                            DelphiAnalyser.Controllers.FormController.Instance.Editor.codeBox.SelectionLength = sText.Text.Length;
                            DelphiAnalyser.Controllers.FormController.Instance.Editor.codeBox.Focus();
                            DelphiAnalyser.Controllers.FormController.Instance.Editor.codeBox.ScrollToCaret();
                            DelphiAnalyser.Controllers.FormController.Instance.Editor.codeBox.Refresh();
                        }
                    }
                    else if (sUp.Checked && (p > 1))
                    {
                        string sub = DelphiAnalyser.Controllers.FormController.Instance.Editor.codeBox.Text.Substring(0, p - 1);
                        int i = sub.LastIndexOf(sText.Text, c);
                        if (i > 0)
                        {
                            DelphiAnalyser.Controllers.FormController.Instance.Editor.codeBox.SelectionStart = i;
                            DelphiAnalyser.Controllers.FormController.Instance.Editor.codeBox.SelectionLength = sText.Text.Length;
                            DelphiAnalyser.Controllers.FormController.Instance.Editor.codeBox.Focus();
                            DelphiAnalyser.Controllers.FormController.Instance.Editor.codeBox.ScrollToCaret();
                            DelphiAnalyser.Controllers.FormController.Instance.Editor.codeBox.Refresh();
                        }
                    }
                }
            }
            DelphiAnalyser.Controllers.FormController.Instance.Editor.Activate();
        }

        private void sText_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Return)
                button1_Click(this, new EventArgs());
        }
    }
}
