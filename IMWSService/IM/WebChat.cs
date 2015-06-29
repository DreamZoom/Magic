using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using SuperWebSocket;

namespace IMWSService.IM
{
    public class WebChat : IDisposable
    {
        private const string ip = "127.0.0.1";
        private const int port = 2014;

        private WebSocketServer ws { get; set; }//SuperWebSocket中的WebSocketServer对象

        public WebChat()
        {
            ws = new WebSocketServer();
            ws.NewSessionConnected += ws_NewSessionConnected;
            ws.NewMessageReceived += ws_NewMessageReceived;
            ws.NewDataReceived += ws_NewDataReceived;
            ws.SessionClosed += ws_SessionClosed;            
        }

        public void Close()
        {
            ws.Stop();
        }

        public void Start()
        {
            if(!ws.Setup(ip, port))
            {
                return;
            }

            if (!ws.Start())
            {
                return;
            }
        }

        void ws_SessionClosed(WebSocketSession session, SuperSocket.SocketBase.CloseReason value)
        {
            
        }

        void ws_NewDataReceived(WebSocketSession session, byte[] value)
        {
            
        }

        void ws_NewMessageReceived(WebSocketSession session, string value)
        {
            
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
