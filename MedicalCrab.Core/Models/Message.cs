using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace MedicalCrab.Core.Models
{
    public class Message : Magic.Mvc.Model.Model
    {
        [Display(Name = "消息发送者")]
        public string Sender { get; set; }

        [Display(Name = "消息接收者")]
        public string Reciver { get; set; }

        [Display(Name = "消息内容")]
        public string Content { get; set; }

        [Display(Name = "内容类型")]
        public int ContentType { get; set; }

        [Display(Name = "消息类型")]
        public MsgType MsgType { get; set; }

        [Display(Name = "发送时间")]
        public DateTime SendTime { get; set; }

        [Display(Name = "接收时间")]
        public DateTime ReciveTime { get; set; }

        [Display(Name = "是否处理")]
        public bool IsProc { get; set; }

        [Display(Name = "是否阅读")]
        public bool IsRead { get; set; }

        [Display(Name = "是否接收")]
        public bool IsRecived { get; set; }

    }
}
