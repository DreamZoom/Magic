using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using SuperWebSocket;
using Newtonsoft.Json;

namespace IMChat
{
    public class WebChat : IDisposable
    {
        private const int port = 2014;

        public WebSocketServer ws { get; set; }//SuperWebSocket中的WebSocketServer对象

        public Dictionary<string, MessageModule> Modules { get; set; }

        public WebChat()
        {
            Magic.Mvc.DataAccessProvider.Current = new Magic.Mvc.DataAccess(@"Data Source=dreamzoom-pc\sqlexpress;Initial Catalog=db_MedicalCrab;Persist Security Info=True;User ID=sa;Password=123456");

            ws = new WebSocketServer();
           // ws.NewSessionConnected += ws_NewSessionConnected;
            ws.NewMessageReceived += ws_NewMessageReceived;
            ws.NewDataReceived += ws_NewDataReceived;
            ws.SessionClosed += ws_SessionClosed;

            Modules = new Dictionary<string, MessageModule>();
            Modules.Add("P2P", new P2PModule(this));
        }

        public void Close()
        {
            ws.Stop();
        }

        public void Start()
        {
            if(!ws.Setup(port))
            {
                return;
            }

            if (!ws.Start())
            {
                return;
            }
        }

        public string GetReciver(WebSocketSession session)
        {
            string path = session.Path.Substring(1);
            string[] rs= path.Split('@');
            return rs[1];
        }

        public string GetSender(WebSocketSession session)
        {
            string path = session.Path.Substring(1);
            string[] rs = path.Split('@');
            return rs[0];
        }

        public WebSocketSession getSessionByName(string name)
        {
            string path = "/" + name;
            var sessions = ws.GetAllSessions();
            foreach(var s in sessions){
                if (GetSender(s) == name) return s;
            }
            return null;
        }


        void ws_SessionClosed(WebSocketSession session, SuperSocket.SocketBase.CloseReason value)
        {
            
        }

        void ws_NewDataReceived(WebSocketSession session, byte[] value)
        {
            
        }

        void ws_NewMessageReceived(WebSocketSession session, string value)
        {
            //var message = MessageHelper.Json2Object(value);
            //if (message.MsgType == MedicalCrab.Core.Models.MsgType.P2P)
            //{
            //    SuperWebSocket.WebSocketSession reciveSession = this.getSessionByName(message.Reciver);
            //    SendToClient(reciveSession, message, value);
            //}
        }

        public void SendToClient(SuperWebSocket.WebSocketSession reciveSession, MedicalCrab.Core.Models.Message message, string value)
        {
            if (reciveSession == null) return;
            reciveSession.Send(value);
            //any more
        }

        void ws_NewSessionConnected(WebSocketSession session)
        {
            
        }

        public void Dispose()
        {
            this.Close();
        }
    }
}
