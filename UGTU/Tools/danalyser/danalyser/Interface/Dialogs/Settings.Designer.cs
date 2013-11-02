namespace DelphiAnalyser.Interface.Dialogs
{
    partial class Settings
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Settings));
            this.groupE = new System.Windows.Forms.GroupBox();
            this.extBox = new System.Windows.Forms.TextBox();
            this.btns = new System.Windows.Forms.ToolStrip();
            this.addBtn = new System.Windows.Forms.ToolStripButton();
            this.delBtn = new System.Windows.Forms.ToolStripButton();
            this.extList = new System.Windows.Forms.ListBox();
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.groupE.SuspendLayout();
            this.btns.SuspendLayout();
            this.SuspendLayout();
            // 
            // groupE
            // 
            this.groupE.Controls.Add(this.extBox);
            this.groupE.Controls.Add(this.btns);
            this.groupE.Controls.Add(this.extList);
            this.groupE.Location = new System.Drawing.Point(10, 8);
            this.groupE.Name = "groupE";
            this.groupE.Size = new System.Drawing.Size(156, 160);
            this.groupE.TabIndex = 0;
            this.groupE.TabStop = false;
            this.groupE.Text = "Расширения";
            // 
            // extBox
            // 
            this.extBox.Location = new System.Drawing.Point(15, 19);
            this.extBox.Name = "extBox";
            this.extBox.Size = new System.Drawing.Size(94, 20);
            this.extBox.TabIndex = 0;
            // 
            // btns
            // 
            this.btns.AllowMerge = false;
            this.btns.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.btns.CanOverflow = false;
            this.btns.Dock = System.Windows.Forms.DockStyle.None;
            this.btns.GripStyle = System.Windows.Forms.ToolStripGripStyle.Hidden;
            this.btns.ImeMode = System.Windows.Forms.ImeMode.NoControl;
            this.btns.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.addBtn,
            this.delBtn});
            this.btns.LayoutStyle = System.Windows.Forms.ToolStripLayoutStyle.VerticalStackWithOverflow;
            this.btns.Location = new System.Drawing.Point(112, 19);
            this.btns.Name = "btns";
            this.btns.Size = new System.Drawing.Size(24, 48);
            this.btns.TabIndex = 2;
            this.btns.Text = "Инструменты";
            // 
            // addBtn
            // 
            this.addBtn.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.addBtn.Image = global::DelphiAnalyser.Properties.Resources.Collapsed;
            this.addBtn.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.addBtn.Name = "addBtn";
            this.addBtn.Size = new System.Drawing.Size(22, 20);
            this.addBtn.Text = "Добавить";
            this.addBtn.Click += new System.EventHandler(this.addBtn_Click);
            // 
            // delBtn
            // 
            this.delBtn.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.delBtn.Image = global::DelphiAnalyser.Properties.Resources.Expanded;
            this.delBtn.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.delBtn.Name = "delBtn";
            this.delBtn.Size = new System.Drawing.Size(22, 20);
            this.delBtn.Text = "Удалить";
            this.delBtn.Click += new System.EventHandler(this.delBtn_Click);
            // 
            // extList
            // 
            this.extList.FormattingEnabled = true;
            this.extList.Location = new System.Drawing.Point(15, 40);
            this.extList.Name = "extList";
            this.extList.SelectionMode = System.Windows.Forms.SelectionMode.MultiExtended;
            this.extList.Size = new System.Drawing.Size(94, 108);
            this.extList.TabIndex = 1;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(91, 174);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 3;
            this.button1.Text = "Отмена";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(10, 174);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(75, 23);
            this.button2.TabIndex = 2;
            this.button2.Text = "ОК";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // Settings
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(176, 205);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.groupE);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "Settings";
            this.Text = "Настройки";
            this.groupE.ResumeLayout(false);
            this.groupE.PerformLayout();
            this.btns.ResumeLayout(false);
            this.btns.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupE;
        private System.Windows.Forms.ListBox extList;
        private System.Windows.Forms.ToolStripButton addBtn;
        private System.Windows.Forms.ToolStripButton delBtn;
        private System.Windows.Forms.ToolStrip btns;
        private System.Windows.Forms.TextBox extBox;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
    }
}