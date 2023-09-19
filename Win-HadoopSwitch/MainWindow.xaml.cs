using System;
using System.Configuration;
using System.Diagnostics;
using System.IO;
using System.Windows;

namespace Win_HadoopSwitch
{
    public partial class MainWindow : Window
    {
        private string HadoopPath;

        public MainWindow()
        {
            InitializeComponent();
            HadoopPath = ConfigurationManager.AppSettings["HadoopPath"];
            txtDirectoryPath.Text += HadoopPath;
            if (string.IsNullOrEmpty(HadoopPath))
            {
                SelectHadoopDirectory();
            }
        }

        private void BtnSelectDirectory_Click(object sender, RoutedEventArgs e)
        {
            SelectHadoopDirectory();
        }

        private void SelectHadoopDirectory()
        {
            var folderDialog = new System.Windows.Forms.FolderBrowserDialog();
            if (folderDialog.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                string newPath = folderDialog.SelectedPath;
                if (File.Exists(Path.Combine(newPath, "sbin", "start-all.cmd")))
                {
                    HadoopPath = newPath;
                    UpdateAppSettings("HadoopPath", newPath);
                    txtDirectoryPath.Text += HadoopPath;
                }
                else
                {
                    MessageBox.Show("选择的目录不是hadoop目录，请重新选择。");
                }
            }
        }

        private void UpdateAppSettings(string key, string value)
        {
            Configuration config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
            config.AppSettings.Settings[key].Value = value;
            config.Save(ConfigurationSaveMode.Modified);
            ConfigurationManager.RefreshSection("appSettings");
        }

        private void BtnStartHadoop_Click(object sender, RoutedEventArgs e)
        {
            RunHadoopCommand("start-before");
            RunHadoopCommand("start");
            RunHadoopCommand("start-after");
        }

        private void BtnStopHadoop_Click(object sender, RoutedEventArgs e)
        {
            RunHadoopCommand("stop");
        }

        private void RunHadoopCommand(string cmd)
        {
            if (!string.IsNullOrEmpty(HadoopPath))
            {
                string sourceCmdPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, cmd + ".hcmd");
                if (File.Exists(sourceCmdPath))
                {
                    string destCmdPath = Path.Combine(HadoopPath, "sbin", "tmp" + cmd + ".cmd");
                    File.Copy(sourceCmdPath, destCmdPath, true);

                    var startInfo = new ProcessStartInfo
                    {
                        FileName = "cmd.exe",
                        RedirectStandardInput = true,
                        UseShellExecute = false,
                        CreateNoWindow = true,
                        WorkingDirectory = Path.Combine(HadoopPath, "sbin"),
                    };

                    var process = new Process { StartInfo = startInfo };
                    process.Start();

                    using (StreamWriter sw = process.StandardInput)
                    {
                        if (sw.BaseStream.CanWrite)
                        {
                            sw.WriteLine(destCmdPath);
                        }
                    }

                    process.WaitForExit();

                    // 删除临时文件
                    File.Delete(destCmdPath);

                    // 显示操作完成的弹窗
                    if (cmd == "start")
                    {
                        MessageBox.Show("Hadoop 集群已开启。");
                    }
                    else if (cmd == "stop")
                    {
                        MessageBox.Show("Hadoop 集群已关闭。");
                    }
                }
                else
                {
                    MessageBox.Show($"解决方案内的 {cmd}.cmd 文件不存在。");
                }
            }
        }

    }
}
