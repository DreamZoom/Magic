using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using MedicalCrab.Core;
using System.Security.Cryptography;
using System.Text;

namespace MedicalCrab.Web.Areas.Api.Controllers
{
    /// <summary>
    /// 位置接口
    /// </summary>
    public class PositionController : Controller
    {

        MedicalCrab.Core.Services.vNearUserPositionService nearUserPosition = new Core.Services.vNearUserPositionService();

        /// <summary>
        /// 获取附近的人 
        /// </summary>
        /// <param name="Latitude">纬度</param>
        /// <param name="Longitude">经度</param>
        /// <returns></returns>
        public ActionResult GetNearUser(decimal Latitude, decimal Longitude)
        {
            decimal maxLatitude = Latitude + 10;
            decimal minLatitude = Latitude - 10;
            decimal maxLongitude = Longitude + 10;
            decimal minLongitude = Longitude - 10;

            string where = string.Format("(Latitude>{0} and Latitude < {1} and Longitude>{2} and Longitude<{3})",minLatitude,maxLatitude,minLongitude,maxLongitude);

            var nearUserList = nearUserPosition.GetModelList(where);
            foreach(var u in nearUserList){
                var nu = u as MedicalCrab.Core.Models.vNearUserPosition;
                nu.Distance = GetDistance((double)Latitude, (double)Longitude, (double)nu.Latitude, (double)nu.Longitude);
            }
            return this.SuccessJson(nearUserList, "数据获取成功");
        }

        private const double EARTH_RADIUS = 6378.137;//地球半径
        private static double rad(double d)
        {
            return d * Math.PI / 180.0;
        }

        public static double GetDistance(double lat1, double lng1, double lat2, double lng2)
        {
            double radLat1 = rad(lat1);
            double radLat2 = rad(lat2);
            double a = radLat1 - radLat2;
            double b = rad(lng1) - rad(lng2);

            double s = 2 * Math.Asin(Math.Sqrt(Math.Pow(Math.Sin(a / 2), 2) +
             Math.Cos(radLat1) * Math.Cos(radLat2) * Math.Pow(Math.Sin(b / 2), 2)));
            s = s * EARTH_RADIUS;
            s = Math.Round(s * 10000) / 10000;
            return s;
        }
    }
}
