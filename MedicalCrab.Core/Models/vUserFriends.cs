using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MedicalCrab.Core.Models
{
    public class vUserFriends : Magic.Mvc.Model.Model
    {
        public string UserName { get; set; }
        public string FriendName { get; set; }
        public string GroupName { get; set; }
        public DateTime AddTime { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public DateTime RegTime { get; set; }
        public string SignDiscription { get; set; }
        public string UserImage { get; set; }

    }
}
