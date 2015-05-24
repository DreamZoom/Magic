using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace MedicalCrab.Core.Models
{
    public class PositionLog : Magic.Mvc.Model.Model
    {
        [Display(Name = "用户名")]
        public string UserName { get; set; }

        [Display(Name = "纬度")]
        public decimal Latitude { get; set; }
        [Display(Name = "精度")]
        public decimal Longitude { get; set; }
        [Display(Name = "海拔高度")]
        public decimal Altitude { get; set; }
        [Display(Name = "精确度")]
        public decimal Accuracy { get; set; }
        [Display(Name = "海拔精确度")]
        public decimal AltitudeAccuracy { get; set; }
        [Display(Name = "移动方向")]
        public decimal Heading { get; set; }
        [Display(Name = "移动速度")]
        public decimal Speed { get; set; }
        //[Display(Name = "地理信息时间戳")]
        //public TimeSpan Timestamp { get; set; }
        [Display(Name = "记录时间")]
        public DateTime AddTime { get; set; }
    }
}
