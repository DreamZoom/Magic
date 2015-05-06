using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace Magic.MeiChat.Models
{
    public class User : Magic.Mvc.Model.Model
    {
        [Display(Name="用户名")]
        public string UserName
        {
            get;
            set;
        }

        [Display(Name = "密 码")]
        public string Password
        {
            get;
            set;
        }
    }
}