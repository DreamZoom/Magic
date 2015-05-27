using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace MedicalCrab.Core.Models
{
    public class vNearUserPosition : Magic.Mvc.Model.Model
    {
        public string UserName { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public DateTime RegTime { get; set; }
        public string SignDiscription { get; set; }
        public string UserImage { get; set; }
        public decimal Latitude { get; set; }
        public decimal Longitude { get; set; }
        public decimal Altitude { get; set; }
        public decimal Accuracy { get; set; }
        public decimal AltitudeAccuracy { get; set; }
        public decimal Heading { get; set; }
        public decimal Speed { get; set; }
        public DateTime AddTime { get; set; }

        [Magic.Mvc.Model.NotMaping]
        public double Distance { get; set; } 
    }
}
