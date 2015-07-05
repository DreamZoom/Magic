using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MedicalCrab.Core.Services
{
    public class GroupService : Magic.Mvc.Service.Service
    {
        public GroupService():base(typeof(Models.Group))
        {

        }
    }
}
