using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace DelphiAnalyser.Interface.Dialogs
{
    public partial class lsAnalysis : Form
    {
        private bool isChanged = false;

        private void ReCheck()
        {
            foreach (DataGridViewRow row in errorSBox.Rows)
                row.Cells[1].Value = DelphiAnalyser.Controllers.AnalyserController.Instance.Analysers[row.Index].Enabled;
        }

        private void Load()
        {
            DelphiAnalyser.Controllers.AnalyserController.Instance.LoadAnalysers();
            ReCheck();
            isChanged = false;
        }

        private void Save()
        {
            DelphiAnalyser.Controllers.AnalyserController.Instance.SaveAnalysers();
            ReCheck();
            isChanged = false;
        }

        private void Init()
        {
            int i, l = DelphiAnalyser.Controllers.AnalyserController.Instance.Analysers.Count;
            for (i = 0; i < l; i++)
            {
                errorSBox.Rows.Add(DelphiAnalyser.Controllers.AnalyserController.Instance.Analysers[i].Name, DelphiAnalyser.Controllers.AnalyserController.Instance.Analysers[i].Enabled);
                DelphiAnalyser.Controllers.AnalyserController.Instance.Analysers[i].PropertiesChangedEvent += new EventHandler<EventArgs>(PropertiesChanged);
            }
        }

        public lsAnalysis()
        {
            InitializeComponent();
            Init();
        }

        private void saveBtn_Click(object sender, EventArgs e)
        {
            Save();
            Close();
        }

        private void exitBtn_Click(object sender, EventArgs e)
        {
            Load();
            Close();
        }

        public void ShowErrors()
        {
            this.ShowDialog();
        }

        private void lsAnalysis_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (isChanged)
            {
                switch (MessageBox.Show("Хотите сохранить изменения?", "Внимание", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Asterisk))
                {
                    case DialogResult.Yes:
                        Save();
                        break;
                    case DialogResult.No:
                        Load();
                        break;
                    case DialogResult.Cancel:
                        e.Cancel = true;
                        break;
                }
            }
        }

        private void errorSBox_SelectionChanged(object sender, EventArgs e)
        {
            if (errorSBox.SelectedRows.Count > 0)
                analyserProperties.SelectedObject = DelphiAnalyser.Controllers.AnalyserController.Instance.Analysers[errorSBox.SelectedRows[0].Index];
        }

        public void PropertiesChanged(object sender, EventArgs e)
        {
            isChanged = true;
            analyserProperties.Refresh();
            ReCheck();
        }

        private void errorSBox_CellValueChanged(object sender, DataGridViewCellEventArgs e)
        {
            if ((e.RowIndex > -1) && (DelphiAnalyser.Controllers.AnalyserController.Instance.Analysers[e.RowIndex].Enabled != (bool)errorSBox.Rows[e.RowIndex].Cells[1].Value))
            {
                DelphiAnalyser.Controllers.AnalyserController.Instance.Analysers[e.RowIndex].Enabled = (bool)errorSBox.Rows[e.RowIndex].Cells[1].Value;
                analyserProperties.Refresh();
            }
        }

        private void errorSBox_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            bool before = (bool)errorSBox.Rows[e.RowIndex].Cells[1].Value;
            errorSBox.EndEdit();
            bool after = (bool)errorSBox.Rows[e.RowIndex].Cells[1].Value;
            if (before ^ after)
            {
                isChanged = true;
                DelphiAnalyser.Controllers.AnalyserController.Instance.Analysers[e.RowIndex].Enabled = after;
                analyserProperties.Refresh();
            }
        }
    }
}
