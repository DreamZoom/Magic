using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace IMChat
{
    /// <summary>
    /// 消息处理模块
    /// </summary>
    public class MessageModule
    {
        public WebChat Chat { get; set; }

        public MessageModule(WebChat chat)
        {
            Chat = chat;
            RegisterEvent(Chat);
        }

        protected virtual void RegisterEvent(WebChat Chat)
        {

        }
    }
}
