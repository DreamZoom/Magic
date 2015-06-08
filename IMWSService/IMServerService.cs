using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.ServiceProcess;
using System.Text;

namespace IMWSService
{
    public partial class IMServerService : ServiceBase
    {
       // IM.WebChat webChat { get; set; }

        public IMServerService()
        {
            InitializeComponent();

            //webChat = new IM.WebChat();
        }

        protected override void OnStart(string[] args)
        {
            //webChat.Start();
            using (System.IO.StreamWriter sw = new System.IO.StreamWriter("C:\\log.txt", true))
            {
                sw.WriteLine(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss ") + "Start.");
            }
        }

        protected override void OnStop()
        {
            //webChat.Close();
            using (System.IO.StreamWriter sw = new System.IO.StreamWriter("C:\\log.txt", true))
            {
                sw.WriteLine(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss ") + "Stop.");
            }
        }
    }
}
