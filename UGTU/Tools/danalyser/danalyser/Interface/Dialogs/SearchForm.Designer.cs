namespace DelphiAnalyser.Interface.Dialogs
{
    partial class SearchForm
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
            this.label1 = new System.Windows.Forms.Label();
            this.sText = new System.Windows.Forms.TextBox();
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.sDown = new System.Windows.Forms.RadioButton();
            this.sUp = new System.Windows.Forms.RadioButton();
            this.rLook = new System.Windows.Forms.CheckBox();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(2, 11);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(29, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Что:";
            // 
            // sText
            // 
            this.sText.Location = new System.Drawing.Point(43, 10);
            this.sText.Name = "sText";
            this.sText.Size = new System.Drawing.Size(226, 20);
            this.sText.TabIndex = 1;
            this.sText.KeyDown += new System.Windows.Forms.KeyEventHandler(this.sText_KeyDown);
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(280, 7);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(80, 23);
            this.button1.TabIndex = 2;
            this.button1.Text = "Найти далее";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(280, 36);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(80, 23);
            this.button2.TabIndex = 3;
            this.button2.Text = "Отмена";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.sDown);
            this.groupBox1.Controls.Add(this.sUp);
            this.groupBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.4F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.groupBox1.Location = new System.Drawing.Point(152, 41);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(120, 46);
            this.groupBox1.TabIndex = 4;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Направление";
            // 
            // sDown
            // 
            this.sDown.AutoSize = true;
            this.sDown.Checked = true;
            this.sDown.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.sDown.Location = new System.Drawing.Point(67, 22);
            this.sDown.Name = "sDown";
            this.sDown.Size = new System.Drawing.Size(50, 17);
            this.sDown.TabIndex = 1;
            this.sDown.TabStop = true;
            this.sDown.Text = "Винз";
            this.sDown.UseVisualStyleBackColor = true;
            // 
            // sUp
            // 
            this.sUp.AutoSize = true;
            this.sUp.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.sUp.Location = new System.Drawing.Point(6, 22);
            this.sUp.Name = "sUp";
            this.sUp.Size = new System.Drawing.Size(55, 17);
            this.sUp.TabIndex = 0;
            this.sUp.Text = "Вверх";
            this.sUp.UseVisualStyleBackColor = true;
            // 
            // rLook
            // 
            this.rLook.AutoSize = true;
            this.rLook.Location = new System.Drawing.Point(5, 69);
            this.rLook.Name = "rLook";
            this.rLook.Size = new System.Drawing.Size(120, 17);
            this.rLook.TabIndex = 5;
            this.rLook.Text = "С учетом регистра";
            this.rLook.UseVisualStyleBackColor = true;
            // 
            // SearchForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(366, 99);
            this.Controls.Add(this.rLook);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.sText);
            this.Controls.Add(this.label1);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "SearchForm";
            this.ShowIcon = false;
            this.Text = "Найти";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.SearchForm_FormClosing);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox sText;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.RadioButton sDown;
        private System.Windows.Forms.RadioButton sUp;
        private System.Windows.Forms.CheckBox rLook;
    }
}