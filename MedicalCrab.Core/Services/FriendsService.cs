using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MedicalCrab.Core.Services
{
    public class FriendsService : Magic.Mvc.Service.Service
    {
        public FriendsService()
            : base(typeof(Models.Friends))
        {

        }
    }
}
