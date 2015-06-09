using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MedicalCrab.Core.Models;

namespace IMChat
{
    public class P2PModule : MessageModule
    {

        public P2PModule(WebChat chat)
            :base(chat)
        {

        }

        protected override void RegisterEvent(WebChat Chat)
        {
            base.RegisterEvent(Chat);
            Chat.ws.NewMessageReceived += ws_NewMessageReceived;
        }

        void ws_NewMessageReceived(SuperWebSocket.WebSocketSession session, string value)
        {
            try
            {
                var message = MessageHelper.Json2Object(value);
                if (message.MsgType == MedicalCrab.Core.Models.MsgType.P2P)
                {
                    SuperWebSocket.WebSocketSession reciveSession =  this.Chat.getSessionByName(message.Reciver);
                    SendToClient(reciveSession, message, value);
                }
            }
            catch
            {

            }
          
           
        }

        public void SendToClient(SuperWebSocket.WebSocketSession reciveSession,Message message,string value)
        {
            if (reciveSession == null) return;

            reciveSession.Send(value);
            //any more
        }
    }
}
