using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MedicalCrab.Core.Services
{
    public class MessageService : Magic.Mvc.Service.Service
    {
        public MessageService()
            :base(typeof(Models.Message))
        {

        }
    }
}
