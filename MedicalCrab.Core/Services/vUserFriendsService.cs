using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MedicalCrab.Core.Services
{
    public class vUserFriendsService : Magic.Mvc.Service.Service
    {
        public vUserFriendsService()
            :base(typeof(Models.vUserFriends))
        {

        }
    }
}
