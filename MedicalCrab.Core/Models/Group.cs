using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MedicalCrab.Core.Models
{
    public class Group : Magic.Mvc.Model.Model
    {
        public string GroupNo { get; set; }
        public string GroupName { get; set; }
        public DateTime CreateTime { get; set; }

    }
}
