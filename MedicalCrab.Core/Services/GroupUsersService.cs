using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MedicalCrab.Core.Services
{
    public class GroupUsersService : Magic.Mvc.Service.Service
    {
        public GroupUsersService():base(typeof(Models.GroupUsers))
        {

        }
    }
}
