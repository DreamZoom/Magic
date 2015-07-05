using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace MedicalCrab.Core.Models
{
    public class Friends : Magic.Mvc.Model.Model
    {
        [Display(Name = "用户名")]
        public string UserName { get; set; }
        [Display(Name = "好友名")]
        public string FriendName { get; set; }
        [Display(Name = "分组")]
        public string GroupName { get; set; }
        [Display(Name = "添加时间")]
        public DateTime AddTime { get; set; }
    }
}
