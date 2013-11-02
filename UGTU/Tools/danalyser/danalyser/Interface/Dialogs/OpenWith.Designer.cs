namespace DelphiAnalyser.Interface.Dialogs
{
    partial class OpenWith
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
            this.okB = new System.Windows.Forms.Button();
            this.cancelB = new System.Windows.Forms.Button();
            this.exePath = new System.Windows.Forms.TextBox();
            this.cmdLine = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.browseB = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.selectExe = new System.Windows.Forms.OpenFileDialog();
            this.SuspendLayout();
            // 
            // okB
            // 
            this.okB.Location = new System.Drawing.Point(228, 89);
            this.okB.Name = "okB";
            this.okB.Size = new System.Drawing.Size(75, 23);
            this.okB.TabIndex = 0;
            this.okB.Text = "Ок";
            this.okB.UseVisualStyleBackColor = true;
            this.okB.Click += new System.EventHandler(this.okB_Click);
            // 
            // cancelB
            // 
            this.cancelB.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.cancelB.Location = new System.Drawing.Point(309, 89);
            this.cancelB.Name = "cancelB";
            this.cancelB.Size = new System.Drawing.Size(75, 23);
            this.cancelB.TabIndex = 1;
            this.cancelB.Text = "Отмена";
            this.cancelB.UseVisualStyleBackColor = true;
            // 
            // exePath
            // 
            this.exePath.Location = new System.Drawing.Point(123, 11);
            this.exePath.Name = "exePath";
            this.exePath.Size = new System.Drawing.Size(226, 20);
            this.exePath.TabIndex = 2;
            // 
            // cmdLine
            // 
            this.cmdLine.Location = new System.Drawing.Point(123, 38);
            this.cmdLine.Name = "cmdLine";
            this.cmdLine.Size = new System.Drawing.Size(226, 20);
            this.cmdLine.TabIndex = 3;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(15, 18);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(66, 13);
            this.label1.TabIndex = 4;
            this.label1.Text = "Программа";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(15, 45);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(102, 13);
            this.label2.TabIndex = 5;
            this.label2.Text = "Командная строка";
            // 
            // browseB
            // 
            this.browseB.Location = new System.Drawing.Point(349, 10);
            this.browseB.Name = "browseB";
            this.browseB.Size = new System.Drawing.Size(38, 23);
            this.browseB.TabIndex = 6;
            this.browseB.Text = "...";
            this.browseB.UseVisualStyleBackColor = true;
            this.browseB.Click += new System.EventHandler(this.browseB_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(126, 62);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(218, 13);
            this.label3.TabIndex = 7;
            this.label3.Text = "(используйте %1 для подстановки файла)";
            // 
            // selectExe
            // 
            this.selectExe.AddExtension = false;
            this.selectExe.DefaultExt = "exe";
            this.selectExe.Filter = "Исполняемый файл (*.exe) | *.exe";
            // 
            // OpenWith
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(396, 117);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.browseB);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.cmdLine);
            this.Controls.Add(this.exePath);
            this.Controls.Add(this.cancelB);
            this.Controls.Add(this.okB);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.Name = "OpenWith";
            this.ShowIcon = false;
            this.Text = "Открыть с помощью...";
            this.Shown += new System.EventHandler(this.OpenWith_Shown);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button okB;
        private System.Windows.Forms.Button cancelB;
        private System.Windows.Forms.TextBox exePath;
        private System.Windows.Forms.TextBox cmdLine;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button browseB;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.OpenFileDialog selectExe;
    }
}