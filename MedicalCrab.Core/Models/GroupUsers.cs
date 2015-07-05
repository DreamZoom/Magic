using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MedicalCrab.Core.Models
{
    public class GroupUsers : Magic.Mvc.Model.Model
    {
        public string GroupNo { get; set; }
        public string UserName { get; set; }
        public DateTime AddTime { get; set; }

    }
}
