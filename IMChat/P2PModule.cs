using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MedicalCrab.Core.Models;
using System.Threading;

namespace IMChat
{
    public delegate void AsyncWriteMessage(Message message);
    public delegate void AsyncReadMessage(string username,string recivename);

    public class P2PModule : MessageModule
    {
        MedicalCrab.Core.Services.MessageService messageService = new MedicalCrab.Core.Services.MessageService();
        public P2PModule(WebChat chat)
            : base(chat)
        {

        }

        protected override void RegisterEvent(WebChat Chat)
        {
            base.RegisterEvent(Chat);
            Chat.ws.NewMessageReceived += ws_NewMessageReceived;

            Chat.ws.NewSessionConnected += ws_NewSessionConnected;
        }

        void ws_NewSessionConnected(SuperWebSocket.WebSocketSession session)
        {
            
            string username = Chat.GetSender(session);
            string recivename = Chat.GetReciver(session);
            AsyncReadMessage awm = new AsyncReadMessage(ReadMessage);
            awm.BeginInvoke(username, recivename, null, null);
        }


        void ws_NewMessageReceived(SuperWebSocket.WebSocketSession session, string value)
        {
            try
            {
                var message = MessageHelper.Json2Object(value);
                if (message.MsgType == MedicalCrab.Core.Models.MsgType.P2P)
                {
                    SuperWebSocket.WebSocketSession reciveSession = this.Chat.getSessionByName(message.Reciver);
                    SendToClient(reciveSession, message, value);
                }
            }
            catch
            {

            }


        }

        public void SendToClient(SuperWebSocket.WebSocketSession reciveSession, Message message, string value)
        {  
            if (reciveSession != null)
            {
                reciveSession.Send(value);
                message.IsProc = true;
                message.IsRead = true;
                message.IsRecived = true;
                message.SendTime = DateTime.Now;
                message.ReciveTime = DateTime.Now;
            }
            else
            {
                message.SendTime = DateTime.Now;
                message.ReciveTime = DateTime.MaxValue;
            }
            AsyncWriteMessage awm = new AsyncWriteMessage(WriteMessage);
            awm.BeginInvoke(message,null,null);
            //any more
        }

        public void WriteMessage(Message message)
        {
            try
            {
                message.ID = Guid.NewGuid().ToString();
                messageService.Add(message);

            }
            catch
            {

            }

        }

        public void EndWriteMessage(IAsyncResult ar)
        {
            AsyncWriteMessage awm = (AsyncWriteMessage)ar.AsyncState;
            awm.EndInvoke(ar);
        }

        public void SendToClient(SuperWebSocket.WebSocketSession reciveSession, Message message)
        {
            string value = MessageHelper.Object2Json(message);
            reciveSession.Send(value);
        }

        public void ReadMessage(string username,string recivename)
        {
            Thread.Sleep(1000);
            var reciver =Chat.getSessionByName(username);
            var list = messageService.GetModelList(string.Format("IsRecived=0 and Reciver='{0}' and Sender='{1}'", username,recivename), "SendTime Desc");
            foreach(var m in list){
                var message = m as MedicalCrab.Core.Models.Message;
                SendToClient(reciver, message);
                message.IsRecived = true;
                message.IsRead = true;
                message.IsProc = true;
                message.ReciveTime = DateTime.Now;
                messageService.Update(message);
            }
        }
        public void EndReadMessage(IAsyncResult ar)
        {
            AsyncReadMessage awm = (AsyncReadMessage)ar.AsyncState;
            awm.EndInvoke(ar);
        }
    }
}
