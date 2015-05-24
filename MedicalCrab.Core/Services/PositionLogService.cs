using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MedicalCrab.Core.Models;

namespace MedicalCrab.Core.Services
{
    public class PositionLogService : Magic.Mvc.Service.Service
    {

        public PositionLogService()
            :base(typeof(Models.PositionLog))
        {

        }

        /// <summary>
        /// 记录地理位置
        /// </summary>
        /// <param name="log"></param>
        /// <returns></returns>
        public PositionLog AddPosition(PositionLog log)
        {
            log.Latitude = Utility.Check.IsNullOrDefault(log.Latitude, 0);
            log.Longitude = Utility.Check.IsNullOrDefault(log.Longitude, 0);
            log.Speed = Utility.Check.IsNullOrDefault(log.Speed, 0);
            //log.Timestamp = Utility.Check.IsNullOrDefault(log.Timestamp, TimeSpan.Zero);
            log.Heading = Utility.Check.IsNullOrDefault(log.Heading, 0);
            log.Accuracy = Utility.Check.IsNullOrDefault(log.Accuracy, 0);
            log.Altitude = Utility.Check.IsNullOrDefault(log.Altitude, 0);
            log.AltitudeAccuracy = Utility.Check.IsNullOrDefault(log.AltitudeAccuracy, 0);
            log.AddTime = DateTime.Now;
            this.Add(log);
            return log;
        }

    }
}
