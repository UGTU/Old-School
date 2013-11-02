namespace DelphiAnalyser.Interface.Dialogs
{
    partial class lsAnalysis
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(lsAnalysis));
            this.controlPanel = new System.Windows.Forms.Panel();
            this.btnPanel = new System.Windows.Forms.Panel();
            this.saveBtn = new System.Windows.Forms.Button();
            this.exitBtn = new System.Windows.Forms.Button();
            this.analyserProperties = new System.Windows.Forms.PropertyGrid();
            this.splitter1 = new System.Windows.Forms.Splitter();
            this.errorSBox = new System.Windows.Forms.DataGridView();
            this.errMsg = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.AnalyserOn = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.dataGridViewImageColumn1 = new System.Windows.Forms.DataGridViewImageColumn();
            this.controlPanel.SuspendLayout();
            this.btnPanel.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.errorSBox)).BeginInit();
            this.SuspendLayout();
            // 
            // controlPanel
            // 
            this.controlPanel.BackColor = System.Drawing.SystemColors.Control;
            this.controlPanel.Controls.Add(this.btnPanel);
            this.controlPanel.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.controlPanel.ImeMode = System.Windows.Forms.ImeMode.NoControl;
            this.controlPanel.Location = new System.Drawing.Point(0, 268);
            this.controlPanel.Name = "controlPanel";
            this.controlPanel.Size = new System.Drawing.Size(460, 30);
            this.controlPanel.TabIndex = 3;
            // 
            // btnPanel
            // 
            this.btnPanel.Controls.Add(this.saveBtn);
            this.btnPanel.Controls.Add(this.exitBtn);
            this.btnPanel.Dock = System.Windows.Forms.DockStyle.Right;
            this.btnPanel.Location = new System.Drawing.Point(298, 0);
            this.btnPanel.Name = "btnPanel";
            this.btnPanel.Size = new System.Drawing.Size(162, 30);
            this.btnPanel.TabIndex = 0;
            // 
            // saveBtn
            // 
            this.saveBtn.Location = new System.Drawing.Point(4, 4);
            this.saveBtn.Name = "saveBtn";
            this.saveBtn.Size = new System.Drawing.Size(75, 23);
            this.saveBtn.TabIndex = 3;
            this.saveBtn.Text = "ОК";
            this.saveBtn.UseVisualStyleBackColor = true;
            this.saveBtn.Click += new System.EventHandler(this.saveBtn_Click);
            // 
            // exitBtn
            // 
            this.exitBtn.Location = new System.Drawing.Point(85, 4);
            this.exitBtn.Name = "exitBtn";
            this.exitBtn.Size = new System.Drawing.Size(75, 23);
            this.exitBtn.TabIndex = 2;
            this.exitBtn.Text = "Отмена";
            this.exitBtn.UseVisualStyleBackColor = true;
            this.exitBtn.Click += new System.EventHandler(this.exitBtn_Click);
            // 
            // analyserProperties
            // 
            this.analyserProperties.Dock = System.Windows.Forms.DockStyle.Right;
            this.analyserProperties.Location = new System.Drawing.Point(260, 0);
            this.analyserProperties.MinimumSize = new System.Drawing.Size(200, 100);
            this.analyserProperties.Name = "analyserProperties";
            this.analyserProperties.Size = new System.Drawing.Size(200, 268);
            this.analyserProperties.TabIndex = 10;
            // 
            // splitter1
            // 
            this.splitter1.Dock = System.Windows.Forms.DockStyle.Right;
            this.splitter1.Location = new System.Drawing.Point(257, 0);
            this.splitter1.Name = "splitter1";
            this.splitter1.Size = new System.Drawing.Size(3, 268);
            this.splitter1.TabIndex = 11;
            this.splitter1.TabStop = false;
            // 
            // errorSBox
            // 
            this.errorSBox.AllowUserToAddRows = false;
            this.errorSBox.AllowUserToDeleteRows = false;
            this.errorSBox.AllowUserToResizeColumns = false;
            this.errorSBox.AllowUserToResizeRows = false;
            this.errorSBox.BackgroundColor = System.Drawing.SystemColors.Window;
            this.errorSBox.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.errorSBox.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.errMsg,
            this.AnalyserOn});
            this.errorSBox.Dock = System.Windows.Forms.DockStyle.Fill;
            this.errorSBox.Location = new System.Drawing.Point(0, 0);
            this.errorSBox.MultiSelect = false;
            this.errorSBox.Name = "errorSBox";
            this.errorSBox.RowHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.None;
            this.errorSBox.RowHeadersVisible = false;
            this.errorSBox.RowTemplate.Height = 20;
            this.errorSBox.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.errorSBox.ShowCellErrors = false;
            this.errorSBox.ShowCellToolTips = false;
            this.errorSBox.ShowEditingIcon = false;
            this.errorSBox.ShowRowErrors = false;
            this.errorSBox.Size = new System.Drawing.Size(257, 268);
            this.errorSBox.TabIndex = 12;
            this.errorSBox.CellValueChanged += new System.Windows.Forms.DataGridViewCellEventHandler(this.errorSBox_CellValueChanged);
            this.errorSBox.SelectionChanged += new System.EventHandler(this.errorSBox_SelectionChanged);
            this.errorSBox.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.errorSBox_CellContentClick);
            // 
            // errMsg
            // 
            this.errMsg.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.errMsg.HeaderText = "Анализатор";
            this.errMsg.Name = "errMsg";
            this.errMsg.ReadOnly = true;
            // 
            // AnalyserOn
            // 
            this.AnalyserOn.FillWeight = 30F;
            this.AnalyserOn.HeaderText = "Вкл.";
            this.AnalyserOn.MinimumWidth = 30;
            this.AnalyserOn.Name = "AnalyserOn";
            this.AnalyserOn.Resizable = System.Windows.Forms.DataGridViewTriState.False;
            this.AnalyserOn.Width = 30;
            // 
            // dataGridViewImageColumn1
            // 
            this.dataGridViewImageColumn1.HeaderText = "";
            this.dataGridViewImageColumn1.Name = "dataGridViewImageColumn1";
            this.dataGridViewImageColumn1.ReadOnly = true;
            // 
            // lsAnalysis
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(460, 298);
            this.Controls.Add(this.errorSBox);
            this.Controls.Add(this.splitter1);
            this.Controls.Add(this.analyserProperties);
            this.Controls.Add(this.controlPanel);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MinimumSize = new System.Drawing.Size(400, 175);
            this.Name = "lsAnalysis";
            this.Text = "Настройки лексического и синтаксического анализа";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.lsAnalysis_FormClosing);
            this.controlPanel.ResumeLayout(false);
            this.btnPanel.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.errorSBox)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel controlPanel;
        private System.Windows.Forms.Panel btnPanel;
        private System.Windows.Forms.Button saveBtn;
        private System.Windows.Forms.Button exitBtn;
        private System.Windows.Forms.PropertyGrid analyserProperties;
        private System.Windows.Forms.Splitter splitter1;
        private System.Windows.Forms.DataGridView errorSBox;
        private System.Windows.Forms.DataGridViewImageColumn dataGridViewImageColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn errMsg;
        private System.Windows.Forms.DataGridViewCheckBoxColumn AnalyserOn;

    }
}