using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace MedicalCrab.Core.Models
{
    public class User :Magic.Mvc.Model.Model
    {
        [Display(Name="编号")]
        public int ID { get; set; }

        [Display(Name="用户名")]
        public string UserName { get; set; }

        [Display(Name = "密码")]
        public string Password { get; set; }

        [Display(Name="电话")]
        public string Phone { get; set; }

        [Display(Name = "邮箱")]
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }

        [Display(Name="地址")]
        public string Address { get; set; }

        [Display(Name="注册时间")]
        public DateTime RegTime { get; set; }
    }
}
